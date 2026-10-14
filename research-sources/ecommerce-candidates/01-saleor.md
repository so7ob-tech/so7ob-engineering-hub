# Saleor evidence note — 2026-10-14

Candidate: **Saleor (saleor/saleor)**, scoped as an API-first, headless commerce platform. Checked 2026-10-14.

## Assessment

Saleor is an open-source commerce backend with a GraphQL-only, headless API and separately deployed dashboard, storefront examples, and app integrations. It appears a strong candidate for So7ob Tech to **evaluate**, especially where API-centric, multichannel commerce is wanted. This is not a production-readiness, security, compliance, or performance certification.

**Project type/domain fit (verified):** Commerce backend/platform; repository calls it API-first, headless, GraphQL-only and documents product, order, customer, promotion, payment, CMS and channel capabilities. It is a good functional match for a headless commerce evaluation.

**License (verified):** Exact repository `LICENSE` says BSD 3-Clause. That permissive license generally allows commercial redistribution and modification subject to retaining notices/disclaimer and not using contributor names to endorse derived products without permission. Validate obligations with counsel and review dependencies, separately distributed components, trademarks, and hosted-service terms; the root license alone does not settle those.

**Stack (verified/inferred):** Python (repository primary implementation; Django-based management command evidence), GraphQL. Docker compose setup explicitly runs API Python migrations and database. PostgreSQL and Redis are customary Saleor platform dependencies, but this review did not successfully open the architecture/dependency source to verify precise supported versions; treat database/services as **unknown pending confirmation** rather than assume. Dashboard/storefront are separate projects; repository example mentions Next.js, React, TypeScript, GraphQL, Tailwind.

**Architecture and features (verified):** API-only interaction/configuration/extension; GraphQL over HTTP and message queues per official extensibility doc snippet. Repository describes webhooks, attributes, metadata, apps, subscription queries and API extensions. Claimed functionality includes product catalog, multichannel pricing/currency/stock/product control, orders/returns/split payments, customers, promotions/vouchers/gift cards, payment integrations and translatable catalog. These are project claims, not independent testing.

**Multi-vendor:** Unknown. Channels and multi-warehouse are evidenced; neither proves first-class marketplace vendor/seller tenancy. No explicit multi-vendor support was verified.

**Arabic / RTL:** Unknown. General translations and translatable catalog are evidenced, but no verified Arabic locale, right-to-left dashboard/storefront, RTL styling, or end-to-end Arabic support was found. Do not infer RTL from translation capability.

**Maintenance (verified at check date):** GitHub releases page showed 3.23.36 as latest in the returned release list (also maintained 3.22/3.21 lines); release notes dated by release listing included active dependency security fixes. Main-branch commit page showed activity through 2026-09-24. Stars: GitHub repo page did not expose a count in the fetched content; unknown (site search snippet reported 21.8k but is not counted as verified here).

**Docs/tests:** Official docs exist; repository links contribution and installation guides. Docker docs specify Docker Desktop/Compose, migrations, optional sample DB, and admin account. Test suite coverage/status was not verified in the opened material; unknown.

**Security:** GitHub security page says versions >=3.19 are supported and <3.19 are unsupported; asks reporters to use private GitHub advisories or security@saleor.io, and states no bounty. Release notes demonstrated dependency patches for named advisories/CVEs. No independent audit or comprehensive vulnerability assessment verified. Advisories page was located, but specific advisory inventory not assessed.

**Operations:** Official quickstart recommends Docker because it handles dependencies, and needs database migrations plus multiple containers. The service-oriented app model and separate API/dashboard/storefront imply more operational integration than a single monolith; repository itself cautions this architecture may be complex for a small developer/small business. Production topology, backups, observability, scaling and service sizing were not assessed.

## Provisional score: 77/100

- Feature fit: **17/20** — extensive commerce capability claims and native channels; marketplace seller model not evidenced.
- Architecture/reuse: **13/15** — clean API-first/headless and extensibility; complexity and separate components increase integration effort.
- Maintenance: **13/15** — frequent 2026 releases/commits and active supported branches; stars unavailable and no independent maintainer-health review.
- Security/dependencies: **10/15** — supported-version policy, private reporting, and concrete dependency fixes; no independent audit or dependency posture review.
- Docs/tests: **7/10** — official docs and setup/contribution material available; test evidence not verified.
- License clarity: **9/10** — clear BSD-3-Clause root license; dependency/component and trademark diligence remain.
- Setup/deployment: **3/5** — Docker quickstart documented, but multiple services and operational burden.
- APIs/integrations: **4/5** — GraphQL-only APIs, webhooks, apps and extensibility.
- i18n/Arabic/RTL: **1/5** — translated catalog claim, but Arabic and RTL unverified.

## Opened sources

1. https://github.com/saleor/saleor — repository overview/features/architecture claims and stack examples.
2. https://raw.githubusercontent.com/saleor/saleor/main/LICENSE — exact license text.
3. https://saleor.io/ — official site (search result; its current release/star claims were not used as verified figures).
4. https://docs.saleor.io/ — official documentation landing page (search result).
5. https://docs.saleor.io/setup/docker-compose — official Docker installation instructions.
6. https://github.com/saleor/saleor/releases — release list and dependency-fix notes.
7. https://github.com/saleor/saleor/commits/main/ — commit history, latest visible date 2026-09-24.
8. https://github.com/saleor/saleor/security — supported versions and private reporting routes.
9. https://github.com/saleor/saleor/security/advisories — security advisories page located; inventory not evaluated.
10. https://docs.saleor.io/developer/architecture — fetch attempted; no extracted content.
11. https://docs.saleor.io/developer/channels — fetch attempted; no extracted content.
12. https://docs.saleor.io/developer/translations — fetch attempted; no extracted content.

**Recommendation:** Evaluate, do not adopt solely on this evidence. Validate database/service versions, test quality, marketplace model, Arabic/RTL experience, production operations, dependency licenses and deployment requirements with a targeted technical proof of concept.