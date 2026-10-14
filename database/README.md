# Database layer

`schema.sql` is a PostgreSQL 15+ starter DDL for structured repository, evidence, evaluation, and asset metadata. It is a design deliverable; it has not been applied to a provisioned database. Before production use, review migration strategy, role/ACL design, retention, backup, and performance with representative data.

The `vector` extension and embeddings table are intentionally commented out until an embedding model/dimension, privacy policy, and query evaluation are selected. Full-text indexing uses PostgreSQL's `simple` configuration as a baseline; Arabic and multilingual search behavior must be tested and may need language-specific dictionaries or an external search service.

The schema records evaluations over time and source evidence separately. Keep `checked_at` and evaluation timestamps; avoid destructive updates that discard history.