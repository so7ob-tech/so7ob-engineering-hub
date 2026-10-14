-- So7ob Engineering Knowledge Hub — PostgreSQL 15+
-- Design artifact only: no database is provisioned by this repository.
BEGIN;
CREATE EXTENSION IF NOT EXISTS pgcrypto;
-- Enable only when semantic vector search is configured and the extension is available.
-- CREATE EXTENSION IF NOT EXISTS vector;

CREATE TYPE evidence_state AS ENUM ('verified','inferred','unknown');
CREATE TYPE recommendation AS ENUM ('adopt','evaluate','reference_only','avoid');
CREATE TYPE maturity_status AS ENUM ('planned','in_progress','implemented','tested','verified','deprecated');
CREATE TYPE project_type AS ENUM ('full_system','framework','component','starter_kit');

CREATE TABLE domains (
  id text PRIMARY KEY,
  name text NOT NULL,
  description text NOT NULL DEFAULT '',
  priority text,
  status text NOT NULL DEFAULT 'queued',
  created_at timestamptz NOT NULL DEFAULT now(), updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE subdomains (
  id bigserial PRIMARY KEY, domain_id text NOT NULL REFERENCES domains(id) ON DELETE RESTRICT,
  slug text NOT NULL, name text NOT NULL, UNIQUE(domain_id,slug)
);
CREATE TABLE licenses (
  id text PRIMARY KEY, name text NOT NULL, url text, family text, notes text NOT NULL DEFAULT ''
);
CREATE TABLE technologies (
  id bigserial PRIMARY KEY, name text NOT NULL UNIQUE, category text NOT NULL,
  canonical_url text
);
CREATE TABLE repositories (
  id text PRIMARY KEY, name text NOT NULL, canonical_url text NOT NULL UNIQUE,
  official_website text, domain_id text NOT NULL REFERENCES domains(id) ON DELETE RESTRICT,
  description text NOT NULL, project_type project_type NOT NULL,
  license_id text REFERENCES licenses(id) ON DELETE RESTRICT,
  license_verified boolean NOT NULL DEFAULT false, commercial_reuse_notes text NOT NULL DEFAULT 'unknown',
  arabic_rtl_state evidence_state NOT NULL DEFAULT 'unknown',
  maintenance_state text NOT NULL DEFAULT 'unknown', archived boolean NOT NULL DEFAULT false,
  created_at timestamptz NOT NULL DEFAULT now(), updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE repository_versions (
  id bigserial PRIMARY KEY, repository_id text NOT NULL REFERENCES repositories(id) ON DELETE CASCADE,
  version text, release_url text, released_at timestamptz, last_commit_at timestamptz,
  stars integer CHECK (stars IS NULL OR stars >= 0), checked_at timestamptz NOT NULL,
  source_url text NOT NULL, UNIQUE(repository_id,version,checked_at)
);
CREATE TABLE repository_technologies (
  repository_id text NOT NULL REFERENCES repositories(id) ON DELETE CASCADE,
  technology_id bigint NOT NULL REFERENCES technologies(id) ON DELETE RESTRICT,
  role text NOT NULL, evidence_state evidence_state NOT NULL DEFAULT 'unknown',
  PRIMARY KEY(repository_id,technology_id,role)
);
CREATE TABLE features (
  id bigserial PRIMARY KEY, slug text NOT NULL UNIQUE, name text NOT NULL, description text NOT NULL DEFAULT ''
);
CREATE TABLE repository_features (
  repository_id text NOT NULL REFERENCES repositories(id) ON DELETE CASCADE,
  feature_id bigint NOT NULL REFERENCES features(id) ON DELETE RESTRICT,
  support_state evidence_state NOT NULL, notes text NOT NULL DEFAULT '',
  PRIMARY KEY(repository_id,feature_id)
);
CREATE TABLE evaluations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(), repository_id text NOT NULL REFERENCES repositories(id) ON DELETE CASCADE,
  rubric_version text NOT NULL, evaluated_at timestamptz NOT NULL, evaluator text,
  feature_fit numeric(5,2) CHECK(feature_fit BETWEEN 0 AND 20), architecture_reuse numeric(5,2) CHECK(architecture_reuse BETWEEN 0 AND 15),
  maintenance numeric(5,2) CHECK(maintenance BETWEEN 0 AND 15), security_dependencies numeric(5,2) CHECK(security_dependencies BETWEEN 0 AND 15),
  docs_tests numeric(5,2) CHECK(docs_tests BETWEEN 0 AND 10), license_clarity numeric(5,2) CHECK(license_clarity BETWEEN 0 AND 10),
  operations numeric(5,2) CHECK(operations BETWEEN 0 AND 5), integrations_api numeric(5,2) CHECK(integrations_api BETWEEN 0 AND 5),
  i18n_rtl numeric(5,2) CHECK(i18n_rtl BETWEEN 0 AND 5), total_score numeric(5,2) CHECK(total_score BETWEEN 0 AND 100),
  confidence text NOT NULL CHECK(confidence IN ('low','medium','high')),
  recommendation recommendation NOT NULL, eligibility_blockers jsonb NOT NULL DEFAULT '[]', rationale text NOT NULL,
  UNIQUE(repository_id,rubric_version,evaluated_at)
);
CREATE TABLE verification_sources (
  id bigserial PRIMARY KEY, url text NOT NULL, source_type text NOT NULL,
  checked_at timestamptz NOT NULL, claim text NOT NULL, state evidence_state NOT NULL DEFAULT 'verified',
  repository_id text REFERENCES repositories(id) ON DELETE CASCADE,
  evaluation_id uuid REFERENCES evaluations(id) ON DELETE CASCADE,
  content_fingerprint text, notes text NOT NULL DEFAULT ''
);
CREATE TABLE product_references (
  id text PRIMARY KEY, name text NOT NULL, url text NOT NULL, domain_id text REFERENCES domains(id),
  reference_type text NOT NULL, captured_at timestamptz NOT NULL, observations jsonb NOT NULL DEFAULT '{}',
  source_disclaimer text NOT NULL DEFAULT 'UX/functionality reference only; no copying of protected material.'
);
CREATE TABLE design_systems (
  id text PRIMARY KEY, name text NOT NULL, repository_id text REFERENCES repositories(id),
  url text NOT NULL, framework text, license_id text REFERENCES licenses(id),
  rtl_state evidence_state NOT NULL DEFAULT 'unknown', evaluation jsonb NOT NULL DEFAULT '{}',
  evaluated_at timestamptz
);
CREATE TABLE design_components (
  id text PRIMARY KEY, design_system_id text REFERENCES design_systems(id), name text NOT NULL,
  specification jsonb NOT NULL DEFAULT '{}', maturity maturity_status NOT NULL DEFAULT 'planned'
);
CREATE TABLE reusable_modules (
  id text PRIMARY KEY, name text NOT NULL, description text NOT NULL, maturity maturity_status NOT NULL DEFAULT 'planned',
  contract jsonb NOT NULL DEFAULT '{}', security_requirements jsonb NOT NULL DEFAULT '[]',
  test_strategy jsonb NOT NULL DEFAULT '{}', version text
);
CREATE TABLE architecture_patterns (
  id text PRIMARY KEY, name text NOT NULL, description text NOT NULL, tradeoffs jsonb NOT NULL DEFAULT '{}',
  suitable_for jsonb NOT NULL DEFAULT '[]', maturity maturity_status NOT NULL DEFAULT 'planned'
);
CREATE TABLE starter_kits (
  id text PRIMARY KEY, name text NOT NULL, domain_id text REFERENCES domains(id),
  architecture_id text REFERENCES architecture_patterns(id), status maturity_status NOT NULL DEFAULT 'planned',
  manifest jsonb NOT NULL DEFAULT '{}'
);
CREATE TABLE integration_guides (
  id text PRIMARY KEY, name text NOT NULL, content text NOT NULL, source_urls jsonb NOT NULL DEFAULT '[]',
  maturity maturity_status NOT NULL DEFAULT 'planned'
);
CREATE TABLE security_reviews (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(), repository_id text REFERENCES repositories(id),
  reviewed_at timestamptz NOT NULL, scope text NOT NULL, findings jsonb NOT NULL DEFAULT '[]',
  disposition text NOT NULL, reviewer text
);
CREATE TABLE knowledge_documents (
  id text PRIMARY KEY, title text NOT NULL, path text NOT NULL UNIQUE, domain_id text REFERENCES domains(id),
  tags text[] NOT NULL DEFAULT '{}', language text NOT NULL DEFAULT 'en',
  body text NOT NULL, provenance jsonb NOT NULL DEFAULT '[]', updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX idx_repositories_domain ON repositories(domain_id);
CREATE INDEX idx_repositories_license ON repositories(license_id);
CREATE INDEX idx_evaluations_rank ON evaluations(total_score DESC, evaluated_at DESC);
CREATE INDEX idx_sources_repo_date ON verification_sources(repository_id,checked_at DESC);
CREATE INDEX idx_knowledge_domain ON knowledge_documents(domain_id);
CREATE INDEX idx_knowledge_tags ON knowledge_documents USING gin(tags);
CREATE INDEX idx_knowledge_body_fts ON knowledge_documents USING gin(to_tsvector('simple',body));
CREATE INDEX idx_repository_tech_by_tech ON repository_technologies(technology_id,repository_id);

-- Optional pgvector extension; choose embedding model/dimensions before creating this table.
-- CREATE TABLE knowledge_embeddings (document_id text PRIMARY KEY REFERENCES knowledge_documents(id) ON DELETE CASCADE,
--   embedding vector(1536), model text NOT NULL, embedded_at timestamptz NOT NULL DEFAULT now());
COMMIT;
