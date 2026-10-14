# Apache Fineract — candidate source note

**Checked:** 2026-10-14. Candidate for core banking / financial inclusion.

## Evidence-backed facts

- [Canonical GitHub repository](https://github.com/apache/fineract/) describes Fineract as an open-source core banking platform aimed at broad financial services and underserved/unbanked populations. Repository README contains install prerequisites (Java JDK and PostgreSQL), startup steps, API health check, and test commands. Unit tests can run without services; integration, two-factor, OAuth2 and E2E suites require a running service. README explicitly warns that production deployment may be complex, costly and time-consuming and that comprehensive production deployment guidance is not provided.
- Exact root `LICENSE` path was checked at `https://github.com/apache/fineract/blob/develop/LICENSE` but does not exist / returned no content. Repository tree and `https://github.com/apache/fineract/blob/develop/LICENSE_SOURCE` and `.../LICENSE_RELEASE` show root `LICENSE_SOURCE` and `LICENSE_RELEASE`; source license declares Apache License 2.0. Release license states source and binary include third-party files and binary has exceptions for jars/resource files under other licenses; consult generated `licenses` directory and preserve notices. Apache-2.0 permits commercial use subject to its notice, redistribution, patent, and other terms; separate dependency license review remains essential.
- Official docs at [stable documentation](https://fineract.apache.org/docs/stable/) describe REST/JSON API, stateless resource-oriented operation, multitenancy with per-tenant database/schema isolation, extensibility, maker-checker, fine-grained permissions, accounting and portfolio capabilities. Event framework supports ActiveMQ messaging, Avro events and at-least-once delivery. Docs describe PostgreSQL and MySQL-compatible DB options.
- [Official project site](https://fineract.apache.org/) names 1.15.0 current stable. GitHub release page [1.15.0](https://github.com/apache/fineract/releases/tag/1.15.0) has release-specific warning: revenue-based Working Capital Loan is incomplete and not ready for production. GitHub API reported tag published 2026-07-14. API metadata checked 2026-10-14 reports 2,550 stars; latest commit `d4ef4069547fba99400871877ceefadb62ad585b` at 2026-10-14 09:53:41Z (date-specific mutable counters noted).
- Technology evidence: repository API marks Java; Gradle build sets Java toolchain 25, uses Spring Boot, Gradle, and static-analysis/test tooling. GitHub README and docs mention PostgreSQL, MySQL/MariaDB test setups.
- Security page [GitHub advisories](https://github.com/apache/fineract/security/advisories) loaded but showed no advisory details in extracted page; absence of visible advisories is not evidence of no vulnerabilities. Project README points to Apache Fineract Security Reports and requests private vulnerability reporting. This is not an audit or security certification.
- Docs describe production TLS proxy/managed certificate recommendations and read/write/batch instance types for scaled deployments; Docker Compose docs are marked TBD. No explicit evidence of Arabic language or RTL support found in reviewed official sources; treat as unverified, not unsupported.

## Assessment and unknowns

Strong functional fit for microfinance/core banking, portfolio, deposits, lending, accounting and configurable multitenancy. Evaluate further rather than treating as deployment-ready. Score: **79/100 provisional** — feature fit 19/20; architecture/reuse 13/15; maintenance 15/15; security/dependencies 8/15; docs/tests 8/10; license clarity 8/10; operations 3/5; integrations 3/5; i18n/RTL 2/5. Production readiness, applicable jurisdictional compliance, security posture, throughput under target workloads, vendor support, dependency inventory and Arabic/RTL remain validation items. No audit/compliance claim made.

## Sources opened

- https://github.com/apache/fineract/
- https://github.com/apache/fineract/blob/develop/LICENSE (attempted exact requested/common path; unavailable)
- https://github.com/apache/fineract/blob/develop/LICENSE_SOURCE
- https://github.com/apache/fineract/blob/develop/LICENSE_RELEASE
- https://fineract.apache.org/
- https://fineract.apache.org/docs/stable/
- https://github.com/apache/fineract/releases
- https://github.com/apache/fineract/releases/tag/1.15.0
- https://github.com/apache/fineract/security/advisories
- https://api.github.com/repos/apache/fineract
