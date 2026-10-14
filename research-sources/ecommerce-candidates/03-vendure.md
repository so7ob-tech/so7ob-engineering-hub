# Vendure — evidence note (checked 2026-10-14)

## Candidate and scope

**Vendure** (`vendure-ecommerce/vendure`, now surfaced on GitHub as `vendurehq/vendure`) is an open-source, TypeScript headless commerce framework/platform. It is a plausible So7ob Tech candidate when the intended product needs a highly extensible commerce backend and the team accepts operating a Node.js service and evaluating GPL obligations. Evidence below is limited to official repository/docs and GitHub metadata/security pages opened on the checked date.

## Verified facts

- **Project type / fit.** The repository calls Vendure an open-source headless commerce platform and describes its source monorepo as `@vendure/core`, React/TanStack admin dashboard, CLI, official plugins, and e2e testing harness. It is framework-like and extensible, not merely a turnkey hosted store. Its built-in commerce primitives include catalog, orders, customers, promotions, channels, tax, shipping, payments, and stock. [1]
- **Language and stack.** TypeScript and Node.js; NestJS server framework; GraphQL APIs powered internally by Apollo Server; React dashboard with TailwindCSS. The repository notes Node.js 20.19+ or 22.12+ in its rendered overview; docs installation page lists tested/supported Node 20, 22, and 24. [1] [2] [3]
- **Database.** SQL via TypeORM. Official docs name PostgreSQL, MySQL/MariaDB, and SQLite as supported, with API-compatible variants (examples Amazon Aurora, CockroachDB, PlanetScale) potentially usable. [2]
- **Architecture and APIs.** Server handles requests to two GraphQL APIs: Shop API for storefronts and Admin API for administration; it dispatches background work to a Worker (search indexing, email, long-running/retryable jobs). Dashboard and storefront are separate clients; storefront can use any technology. Plugin modules can change config, extend Shop/Admin GraphQL schema/resolvers, define entities, integrate external systems, handle events, and schedule worker tasks. [2] [4]
- **Commerce capabilities.** Official repo lists catalog, orders, customers, promotions, channels, tax, shipping, payments, and stock. [1]
- **Multi-vendor.** Repository copy says Vendure can be used for marketplace use cases, and docs list a `Seller` entity. This is evidence that marketplace implementations are a contemplated use case, **not evidence of a complete built-in multi-vendor marketplace workflow** (seller onboarding, commissions, seller permissions, payouts, etc. are not established by these sources). Treat as custom implementation/evaluation required. [1] [5]
- **Internationalization and Arabic/RTL.** Docs explicitly describe translatable product, variant, collection and other entities; channel language codes/defaults and API `languageCode` selection with fallback are documented. Docs do **not** establish Arabic locale content, Admin UI Arabic translation, right-to-left layout, or RTL storefront support. These remain unknown and must be tested/implemented. [5]
- **Maintenance signals.** On 2026-10-14, GitHub API reported 8,516 stars and repository `pushed_at` 2026-10-14 16:18:59 UTC. Commit history page showed commits on Oct 14, Oct 13, and Oct 12, 2026. GitHub latest release page presented v3.7.4; the release description says it fixes two reported vulnerabilities (one high, one low). [6] [7] [8]
- **Docs/tests.** Official developer docs cover installation, architecture, plugin development, testing, and API. `@vendure/testing` supports end-to-end tests exercising API, services, and database; docs describe Vitest and Postgres/MySQL/sql.js initializers. This establishes testing facilities and documented practice, not test quality or coverage. [3] [9]
- **Security.** Policy asks for private GitHub vulnerability reporting and says security fixes are released as patches for the latest 3.x minor; older 3.x, 2.x, and earlier versions are not supported. Advisory page displayed multiple 2026 advisories, including high and critical findings, plus Oct 5 API-key privilege escalation (high) and stock race/overselling (low). v3.7.4 release reports fixing two vulnerabilities. This is evidence of active disclosure and fixes, but also shows material security defects; it is not evidence of a security audit or assurance. Keep current and review advisories/dependencies. [7] [8]
- **License / reuse.** GitHub repository page states GPLv3 and says connecting via GraphQL does not make a storefront or services subject to GPLv3; it also describes a plugin license exception and commercial licensing for Vendure Platform. Exact `/LICENSE` and raw LICENSE endpoints could not be extracted by the web reader/curl during this check; therefore the SPDX identifier and verbatim license text are **not independently confirmed from the exact license file**. Before reuse, inspect the checked-out LICENSE and obtain legal review of the GPLv3 distribution/combination implications and commercial offerings. No blanket conclusion about So7ob's deployment/distribution model is made. [1] [10]
- **Operations.** Quick-start `@vendure/create` handles setup, with Postgres via Docker or SQLite; production deployment is self-hosted (Node.js, Docker, Kubernetes, or cloud per repository). Running a customized commerce application still entails database provisioning, configuration, plugins/integrations, storefront, security patching, and operational ownership; this indicates nontrivial deployment/maintenance, not an assessment of production readiness. [1] [3]

## Provisional score: 78/100

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit | 17/20 | Broad core primitives and extension support match general commerce needs; bespoke So7ob workflows and actual marketplace behavior are unverified. |
| Architecture/reuse | 13/15 | TypeScript/NestJS, separated server/worker, plugin architecture, and independent clients are reusable; customization still requires engineering. |
| Maintenance | 14/15 | Daily recent commits, 8,516 stars, and current v3.7.4 release are positive signals; they do not guarantee support quality. |
| Security/dependencies | 8/15 | Private reporting and patch releases exist, but several serious 2026 advisories and vulnerabilities merit a conservative deduction. No audit/dependency review evidence. |
| Docs/tests | 9/10 | Detailed official docs and e2e testing tooling documented; no independent coverage/quality measurement. |
| License clarity | 8/10 | Repo states GPLv3 and clarifies its view of API-client/plug-in exceptions and commercial option, but exact license file was not successfully read and legal fit remains unresolved. |
| Setup/deployment | 3/5 | CLI quick-start is straightforward; self-hosting SQL/Node and maintaining extensions/integrations creates meaningful operations burden. |
| APIs/integrations | 4/5 | Two GraphQL APIs, plugin extension points, and integration mechanisms are strong; specific required connectors were not assessed. |
| i18n/Arabic/RTL | 2/5 | Multilingual entity content and channel language selection are evidenced; Arabic translations and RTL are not. |
| **Total** | **78/100** | Provisional candidate score, not a production-readiness judgment. |

## Recommendation

**Evaluate, do not adopt on this evidence alone.** Prototype the required So7ob commerce workflows, especially marketplace/seller boundaries if relevant; validate Arabic and RTL in both Admin UI and storefront; confirm the exact license file and commercial/distribution implications with counsel; review current advisories and transitive dependencies; and estimate hosting, backup, upgrade, and operational work. This note does not claim production readiness, compliance, security audit, scalability, or full Arabic/RTL support.

## References (opened 2026-10-14)

[1] https://github.com/vendure-ecommerce/vendure — repository homepage (redirect/current owner alias content)
[2] https://docs.vendure.io/current/core/developer-guide/overview — official architecture and technology overview
[3] https://docs.vendure.io/current/core/getting-started/installation — official installation guide
[4] https://docs.vendure.io/current/core/developer-guide/plugins — official plugin guide
[5] https://docs.vendure.io/current/core/core-concepts/language — official language/translations guide
[6] https://github.com/vendure-ecommerce/vendure/commits/master/ — commit history
[7] https://github.com/vendure-ecommerce/vendure/releases — releases, including v3.7.4
[8] https://github.com/vendure-ecommerce/vendure/security/policy and https://github.com/vendure-ecommerce/vendure/security/advisories — security policy/advisories
[9] https://docs.vendure.io/current/core/developer-guide/testing — testing guide
[10] https://github.com/vendure-ecommerce/vendure/blob/master/LICENSE — exact license file link (fetch failed; not treated as independently read)
