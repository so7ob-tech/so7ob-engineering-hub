# Spree Commerce (spree/spree) — evidence note

**Checked:** 2026-10-14. Scope is the Ruby on Rails commerce platform in `spree/spree`, not other projects named Spree. Facts below reflect sources opened on the checked date. Marketing claims are attributed as such; unknowns remain unknown rather than inferred.

## Findings

- **Project/type — verified:** Open-source commerce framework/platform built on Ruby on Rails, with a Community Edition and paid Enterprise Edition. Official docs describe Community as a DIY product for skilled Rails developers with community support. [1] [2]
- **License/reuse — verified:** Root `LICENSE` is BSD 3-Clause; it permits redistribution and use in source/binary form, with or without modification, subject to retaining notices/conditions and not using contributor names to endorse derived products without permission. It includes an “AS IS” warranty/liability disclaimer. This is a permissive license suitable in principle for commercial use and modification; retain notices and obtain legal review for product-specific distribution obligations. Enterprise Edition and support are paid offerings; do not assume every separately distributed integration or service shares the core repository license. [3] [1]
- **Languages/framework/database:** Repository's GitHub metadata identifies Ruby as the primary language; official docs identify Ruby on Rails. Current repository overview also identifies TypeScript SDKs, React admin SPA and Next.js storefront. **Database engine is unknown from the sources opened**; do not presume PostgreSQL. [1] [2] [4]
- **Architecture — verified at a high level:** Self-hostable Rails commerce backend with REST Store/Admin/Seller APIs and separate client surfaces (React admin, Seller Panel and optional Next.js storefront); channels/markets connect catalogs, pricing, payment/shipping options and region configuration. Source describes a modular/extensible system, but detailed internal component topology was not independently assessed. [1] [5]
- **Commerce features — official project claims:** catalog/product and variants, prices, carts/orders, promotions, gift cards/credits, payment providers, shipping/fulfillment, inventory, returns/exchanges, taxes, imports/exports and B2B price lists/customer groups/company accounts. Repo overview says marketplace seller onboarding, per-seller order splitting, commissions and payout ledger are in the open-source core. Treat feature availability/configuration as needing validation in an implementation spike. [1]
- **Headless/API — verified:** Official API reference documents REST Store API under `/api/v3/store` for websites, POS and mobile storefronts and recommends `@spree/sdk`; repo overview additionally states Store/Admin/Seller REST APIs and OpenAPI 3.0. [5] [1]
- **Multi-vendor — explicitly evidenced, qualified:** Current repo overview explicitly claims marketplace seller onboarding, orders split per seller, commissions, payouts and Seller Panel in open-source core. This supports a positive capability finding, not a claim that a marketplace is automatically production-ready or that all workflows meet So7ob requirements. Multi-tenant SaaS is explicitly marked Enterprise-only. [1]
- **Internationalization/Arabic/RTL:** Repo says Markets configure currency, language, payment methods and shipping per region, and that product translations/localization are built in. **No Arabic locale, right-to-left layout, RTL admin/storefront, or Arabic content evidence was verified in opened sources.** Therefore Arabic/RTL support is unknown, not established by generic localization claims. [1]
- **Maintenance — verified snapshot:** GitHub API metadata on 2026-10-14: 15,756 stars, repository not archived, pushed at 2026-10-14 15:53:36 UTC, primary language Ruby. Commit history page shows activity through Oct 13 and a commit bumping `v6.0.0.rc3`; GitHub Releases API `latest` reports stable `v5.6.1`, published 2026-07-28. This distinction matters: recent prerelease/branch activity does not replace the latest stable release. [4] [6] [7]
- **Docs/tests:** Official docs and API reference are available. The release notes opened describe a first-run setup end-to-end test and additional admin/seller panel end-to-end tests. This is evidence of some test work, not a full test-coverage assessment. [2] [5] [7]
- **Security:** A security policy provides private reporting via `security@spreecommerce.org`, says acknowledgment within 48 hours, describes fix/advisory process and recommends dependency scanning (`bundler-audit`) and Brakeman. Policy says only listed versions are actively maintained, but the current supported-version list was not extractable in the opened page. GitHub advisories page lists multiple published issues, including high-severity access-control/IDOR advisories in 2026 and older issues. This is evidence of a disclosure process and disclosed vulnerabilities, not a security audit or assurance that current deployments are safe. [8] [9]
- **Operations/deployment:** Official repo overview says backend may be deployed on cloud/on-prem/VPS with Docker images/Dockerfiles; optional Next.js storefront can run on Vercel/Netlify/Node host. Scaffold command and CLI are offered. This is a self-hosted multi-component stack; actual operating effort, resource needs, backup/upgrade topology and So7ob-specific configuration are unknown. [1] The official installation page did not yield readable content in the fetch, so no exact prerequisites/database are asserted.

## Provisional score: 76/100

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit | 17/20 | Broad DTC/B2B/marketplace capabilities and explicitly documented marketplace primitives; exact So7ob requirements and workflows remain untested. |
| Architecture/reuse | 12/15 | Self-hostable Rails core, APIs and separable clients support customization; detailed internal architecture and fit-cost not fully assessed. |
| Maintenance | 13/15 | Active commits on Oct 13, 2026, 15,756 stars and a stable release in July 2026; maintenance/support horizon still needs confirmation. |
| Security/dependencies | 8/15 | Private reporting policy and advisories exist, but multiple significant advisories and no independent audit/current deployment assessment. |
| Docs/tests | 8/10 | Official product/API docs and explicit recent E2E test additions; no independent coverage or doc-completeness review. |
| License clarity | 10/10 | Exact BSD-3-Clause root license reviewed; straightforward commercial reuse subject to conditions. |
| Setup/deployment | 3/5 | Docker and CLI scaffolding documented, but self-hosting entails infrastructure and integration work; precise runtime/database prerequisites unverified. |
| APIs/integrations | 4/5 | REST Store/Admin/Seller API claims, SDKs and OpenAPI evidence; integration suitability not tested. |
| i18n/Arabic/RTL | 1/5 | Market language and translations indicated, but no Arabic/RTL evidence; minimal points reflect generic localization only. |

**Recommendation:** Evaluate, not adopt on desk research alone. Validate the exact So7ob workflows in a disposable install, especially Arabic/RTL, database/runtime requirements, payment/shipping integrations, security patch cadence and upgrade effort. No conclusion here asserts production readiness, compliance, security audit, scalability or full Arabic/RTL support.

## Sources actually opened

[1] https://github.com/spree/spree — canonical repository overview/README.
[2] https://spreecommerce.org/docs/user/what-is-spree-commerce — official overview.
[3] https://github.com/spree/spree/blob/main/LICENSE — exact repository license text.
[4] https://api.github.com/repos/spree/spree — GitHub repository metadata API.
[5] https://spreecommerce.org/docs/api-reference — official Store API reference.
[6] https://github.com/spree/spree/commits/main/ — commit history.
[7] https://api.github.com/repos/spree/spree/releases/latest — GitHub latest stable release API.
[8] https://spreecommerce.org/docs/developer/security/security_policy — official security policy.
[9] https://github.com/spree/spree/security/advisories — GitHub security advisories.

**Access caveat:** Fetches of `https://spreecommerce.org/docs/developer/core-concepts/localization` and `https://spreecommerce.org/docs/developer/getting-started/installation` returned no extracted content; their content was not treated as evidence.
