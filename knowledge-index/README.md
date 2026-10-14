# AI Knowledge Retrieval — design

**Maturity: design only; no vector index, ingestion service, or assistant endpoint is deployed.**

## Retrieval pipeline

1. Ingest Markdown/YAML/JSON through schema validation; reject records missing canonical IDs or source metadata.
2. Normalize fields (domain, technologies, license, maturity, recommendation, jurisdiction tags) into PostgreSQL tables.
3. Index exact filters and full text. Initial PostgreSQL search uses `tsvector` with a tested Arabic-capable configuration when available; maintain `simple` fallback and verify stemming/diacritics against representative Arabic and English queries.
4. Add embeddings only after choosing an approved model, dimensions, retention policy, and tenant/privacy boundaries. Keep vector results subordinate to structured filters and source freshness.
5. Retrieve ranked passages plus source metadata; rerank only with explainable relevance fields.
6. Generate an answer that labels each assertion `verified`, `inferred`, or `unknown`, attaches evidence links and checked dates, and reports missing constraints. No unsupported claim may be upgraded to verified by generation.

## Query facets

Domain/subdomain, language/framework/database, license/SPDX family, capabilities, deployment, maturity, maintenance checked date, score/confidence, complexity, Arabic/RTL evidence, product-reference versus code-reuse type, and security/legal gate state.

## Safety and privacy

No customer secrets, personal data, tenant documents, private source code, or confidential vulnerability reports in shared embeddings. For client-specific knowledge, use approved isolated storage and ACL-aware retrieval. A similarity match is not license compatibility or security approval. Preserve source IDs through chunking and cite sources in outputs. Review prompt-injection content from repositories/docs as untrusted data; never execute retrieved instructions or code automatically.

## Evaluation

Maintain representative English and Arabic test queries; measure source recall, answer citation correctness, stale-source rate, false eligibility passes, ACL leakage, and latency. Require human review before the assistant proposes adopting code in regulated/high-impact settings.