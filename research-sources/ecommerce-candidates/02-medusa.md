# Medusa (medusajs/medusa) — evidence note

**Checked: 2026-10-14.** Scope: JavaScript/TypeScript headless commerce and commerce modules. Facts below are limited to primary project sources opened on the check date. Time-sensitive repository statistics reflect that date.

## Assessment

Medusa is an open-source, modular, headless commerce platform/framework, not merely a storefront. Its framework plus preinstalled commerce modules and REST APIs make it a strong candidate for a customizable So7ob Tech commerce foundation. The open-source core is MIT-licensed; however, the repository is open-core and specifically identifies Enterprise Edition materials that are not MIT-licensed. Commercial use of MIT-covered code is permitted subject to the notice/permission terms, but identify and exclude or separately license Enterprise materials before reuse. **Provisional score: 78/100. Recommendation: evaluate, not adopt yet.** Score is a source-based candidate-screening judgment, not a production-readiness or security finding.

## Verified facts

- **Project type and purpose:** The canonical repository describes Medusa as “a commerce platform with a built-in framework for customization.” It says the core commerce modules are open-source and freely available on npm, and calls out advanced B2B/DTC stores, marketplaces, distributors, PoS and service businesses as possible use cases. Possible use case is not evidence that every such capability is turnkey.
- **License:** The exact repository `LICENSE` says, “Except for the Enterprise Edition materials identified in ENTERPRISE-LICENSE.md,” the repository is MIT. MIT grants broad rights including commercial use, modification, distribution and sale, conditional on retaining copyright and permission notices, and includes an “AS IS” warranty disclaimer. The repository says RBAC-based Enterprise Edition materials require a separate valid commercial agreement. This is an open-core boundary; review the identified files and any package-specific licensing before incorporation.
- **Languages and stack:** GitHub's repository language endpoint reported TypeScript and JavaScript as the dominant languages (plus small amounts of shell, Handlebars, CSS and HTML). The root `package.json` identifies a Yarn 3.2.1 monorepo and TypeScript/JS toolchain. Official architecture docs identify an Express.js server. Installation docs describe a Node.js server and Vite admin dashboard, with an optional Next.js starter storefront.
- **Database and architecture:** Official architecture docs describe HTTP/API routes → workflows (business logic) → domain modules → datastore; modules use PostgreSQL and the docs state PostgreSQL is the only supported underlying Medusa database. The server can connect to Redis for session data. Infrastructure/provider modules integrate replaceable services such as Redis, S3, SendGrid and analytics systems. A custom module may connect to another database, but that does not make another primary Medusa datastore supported.
- **Commerce and API:** Docs describe out-of-box Commerce Modules exposed through core REST API routes and usable as npm packages in Node.js or serverless contexts. The official introduction names inventory tracking, cart totals, payments and order management, as well as a customizable merchant admin. Architecture docs mention payment and fulfillment provider integrations. The release page documents a Search Module and `/store/search` route. The evidence supports headless/API-based composition; it does not establish that every store needs no custom implementation.
- **Marketplace / multi-vendor:** The repository explicitly lists marketplaces among use cases. That is evidence of intended customizability/use case, **not** evidence of native multi-vendor seller tenancy, seller onboarding, split payouts, vendor catalog ownership or marketplace workflows. Treat turnkey multi-vendor support as unverified.
- **Arabic, internationalization and RTL:** The latest release page opened reports Finnish and Swedish admin translations. No opened official source established Arabic translation coverage, Arabic storefront content behavior, or RTL support. Therefore Arabic/RTL capability is **unknown**, not inferred from general localization or customizability.
- **Maintenance snapshot:** GitHub API metadata checked 2026-10-14 reported 36,748 stars and latest commit `0b97a96ea0d32ff3f4b18dbeeeeba9e763600a15`, dated 2026-10-14 11:27:02 UTC. Latest release endpoint reported `v2.21.2: Performance Improvement for Search Route`, published 2026-09-28. These are dated snapshots, not a guarantee of future maintenance.
- **Docs and tests:** Official docs provide architecture, installation, API route references, module guidance and update instructions. Root `package.json` contains build, lint, unit-test and integration-test scripts and uses Jest/Vitest-related tooling; this verifies test infrastructure exists, not test coverage, pass status, or quality. No tests were run for this assessment.
- **Security:** GitHub's repository security page provides private vulnerability reporting at `security@medusajs.com`, asks researchers not to disclose unresolved issues, and promises a response within three business days. The advisories page was opened but extraction showed no advisory listing; this is **not proof that no vulnerabilities exist**. Release notes explicitly describe Store API field/relationship allow-list hardening in v2.21.0 and a related fix in v2.20.1, recommending upgrades. This evidences security-related maintenance, not an audit or security assurance.
- **Operations:** Local setup requires operating a Node.js backend and PostgreSQL; an optional storefront is a separate Next.js app. Docs describe a monorepo setup and mention Redis integration for sessions/infrastructure. Managed Medusa Cloud is offered as an alternative. This implies nontrivial operational ownership when self-hosting (database, application, updates, integration providers and deployment), but no production deployment effort was measured.

## Provisional score (78/100)

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit (20) | 17 | Verified commerce primitives include inventory, carts, payment, orders and integrations; marketplace is a stated use case. Not all desired workflows are established as built-in. |
| Architecture/reuse (15) | 14 | Modular workflows/providers, headless REST APIs and reusable Node packages enable customization and integration. PostgreSQL is a firm core-datastore constraint. |
| Maintenance (15) | 14 | A release on 2026-09-28 and commit on check date indicate recent activity; one snapshot cannot establish long-term support. |
| Security/dependencies (15) | 9 | Private disclosure channel and documented API hardening are positives; no audit or comprehensive dependency/security status was established, and advisories extraction was inconclusive. |
| Docs/tests (10) | 8 | Detailed official docs and repository test scripts are present; coverage/results were not evaluated. |
| License clarity (10) | 8 | Core MIT terms are clear, but enterprise materials are separately governed and require boundary review. |
| Setup/deployment (5) | 3 | Installation docs are available; self-hosting involves Node and PostgreSQL (and optional Redis/storefront), so operations are more involved than hosted SaaS. |
| APIs/integrations (5) | 4 | REST API and provider/module integration model are documented; compatibility for So7ob-specific systems remains untested. |
| i18n/Arabic/RTL (5) | 1 | Finnish/Swedish admin translations are documented in release notes; Arabic and RTL evidence was not found. |
| **Total** | **78** | Provisional desk-research screen only. |

## Unknowns / follow-up before a decision

- Whether required So7ob workflows (especially true multi-vendor operations, settlement/split payments and seller permissions) are available through maintained plugins or need custom development.
- Arabic locale completeness, RTL behavior across storefront, admin and generated emails, and localized commerce data behavior.
- So7ob's target PostgreSQL/Redis hosting, operational skills, supported deployment topology, backup/restore and upgrade practice.
- Current dependency vulnerability posture, security audit/penetration-test evidence, support commitments, and suitability for any compliance obligations. None is claimed here.
- License classification of every intended package/file, especially Enterprise Edition material and any separately licensed integrations.
- Test coverage and compatibility/performance under So7ob's own workloads.

## References (opened 2026-10-14)

1. Canonical repository: https://github.com/medusajs/medusa
2. Exact core license: https://github.com/medusajs/medusa/blob/develop/LICENSE
3. Enterprise license boundary: https://github.com/medusajs/medusa/blob/develop/ENTERPRISE-LICENSE.md
4. Official docs introduction: https://docs.medusajs.com/learn
5. Official architecture: https://docs.medusajs.com/learn/introduction/architecture
6. Official commerce modules: https://docs.medusajs.com/resources/commerce-modules
7. Official installation: https://docs.medusajs.com/learn/installation
8. Official release notes: https://github.com/medusajs/medusa/releases
9. GitHub security policy page: https://github.com/medusajs/medusa/security
10. GitHub advisories page: https://github.com/medusajs/medusa/security/advisories
11. Root package metadata/scripts: https://github.com/medusajs/medusa/blob/develop/package.json
12. Commit snapshot: https://github.com/medusajs/medusa/commit/0b97a96ea0d32ff3f4b18dbeeeeba9e763600a15
13. GitHub repository API metadata: https://api.github.com/repos/medusajs/medusa
14. GitHub latest commit API: https://api.github.com/repos/medusajs/medusa/commits?per_page=1
15. GitHub releases API: https://api.github.com/repos/medusajs/medusa/releases/latest
16. GitHub language API: https://api.github.com/repos/medusajs/medusa/languages
