# Engineering decisions

## ADR-001: Git-backed source of truth with relational projection

**Status:** accepted for foundation. Store reviewable knowledge in versioned Markdown/YAML/JSON, with PostgreSQL as a query/import projection. Rationale: diffs and evidence history remain reviewable while structured filters can scale separately. A database instance is not provisioned yet.

## ADR-002: Structured filters first; semantic search optional

**Status:** accepted for foundation. Start with stable IDs, metadata filters, and full text. Add vector search only after selecting a model and evaluating English/Arabic quality, access control, and retention. Do not let embeddings replace evidence citations.

## ADR-003: Modular monolith as the default product starting point

**Status:** guidance. Recommend the least complex architecture meeting explicit product and operational constraints; do not default to microservices.

## ADR-004: Research in evidence-gated waves

**Status:** accepted. Research the eight priority domains first, then subsequent waves. Domain queues do not imply completion; do not pad shortlists to ten without verified candidates.
