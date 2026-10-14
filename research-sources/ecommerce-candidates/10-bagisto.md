# Bagisto (bagisto/bagisto) — candidate evidence note

**Checked:** 2026-10-14. **Scope:** Laravel commerce platform, including multi-vendor evidence. This is a provisional candidate assessment, not an endorsement of production readiness.

## Verified evidence

Bagisto is a Laravel/PHP e-commerce project with a Vue.js storefront/admin toolchain and modular package organization. Its repository describes both single-vendor and multi-vendor use cases. The 2.5 branch's project instructions describe Laravel 13, PHP 8.4+, Vue 3, Tailwind CSS 4 and Vite 6; they identify MySQL 8.0, MariaDB 10.11 and PostgreSQL 16 as supported databases, and describe 42 self-contained packages. Architecture is a thin Laravel app shell around packages with their own providers, routes, migrations, models, views and service providers, contract/model/proxy pattern, repositories and event-driven extension points. This is a framework/platform, not a turnkey hosted service.

The exact repository LICENSE is MIT (copyright 2010–2025 Webkul). It permits use, modification, distribution, sublicensing and sale, subject to preserving the copyright and permission notice in copies/substantial portions; it disclaims warranties and liability. This supports commercial reuse of the licensed repository code. Verify licenses and terms for separately installed extensions, themes, dependencies, hosted/cloud services, trademarks, and third-party payment/commerce integrations independently.

Official repo overview explicitly describes marketplace capabilities: seller management, commissions, product approvals and order handling, with a vendor dashboard for catalog, orders and transactions. Official API documentation describes an installable REST package, admin and shop API surfaces, Sanctum token authentication and Swagger docs; it points to GraphQL as another API option. Do not assume APIs cover every extension or multi-vendor workflow without endpoint-level review.

Official localization docs explicitly mention RTL support for Arabic, Hebrew and other RTL languages, and locale-aware currency/date formatting. The 2.5 branch instructions list 23 locales including `ar`. This is evidence of localization/RTL capability, not proof of complete Arabic translations or full storefront/admin/extension RTL correctness in the proposed configuration.

Official installation docs require PHP 8.3/8.4, Composer 2.5+, MySQL 8.0.32+ and Apache/Nginx for their quick-install flow. They document Composer/manual install, Docker, Sail, web-root configuration, environment/database setup and migrations. A separate 2.5 branch document describes updated PHP 8.4/Laravel 13 and multi-DB support; reconcile version-specific docs with the selected stable release before implementation.

Repository release listing showed v2.5.0-beta2 as the latest listed release at check time, and v2.5.0-beta1 notes mention PostgreSQL support and upgrades to Laravel 13/PHP 8.4. Commit history showed commits on 2026-10-13, one day before check. GitHub stars were not surfaced in the opened page extraction and are recorded as unknown.

The repository documents Pest and Playwright test workflows and per-package test suites. Branch instructions refer to CI coverage across databases. This establishes test infrastructure, not an independently assessed test pass rate or quality. GitHub Security Advisories lists multiple published issues, including critical/high/moderate advisories dated Jan 2, 2026 and moderate issues dated Oct 16, 2025. Repo overview asks security reports to be sent privately to support@bagisto.com; no formal published security policy was verified. Advisories indicate security history and require patch/version review; they do not establish present vulnerability status.

## Inference and unknowns

**Inference:** The modular package and extension model is favorable for adaptation, but requires Laravel expertise and careful dependency/version management. Installation is conventional for a PHP application, while production deployment entails database, web-server/document-root, environment, queue/cache/search/storage and upgrade operations; specific production complexity and operating cost are deployment-dependent. A supported Docker path exists.

**Unknown:** audited production readiness, compliance certifications, independent security audit, quantified scalability, current patched status of each advisory in the selected release, maintenance SLAs, complete translation coverage, full Arabic RTL in all screens/extensions, and API completeness for a proposed So7ob Tech workflow. Stars unavailable from page extraction.

## Provisional score: 79/100 (criterion points summed during catalog integration)

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit | 17/20 | Core commerce plus explicitly documented multi-vendor workflows; workflow-specific fit still needs a prototype. |
| Architecture/reuse | 13/15 | Modular packages, contracts/proxies, repositories and event-driven extension; integration effort remains. |
| Maintenance | 12/15 | Recent commits (Oct 13, 2026) and beta release activity; stable cadence/support commitment not established. |
| Security/dependencies | 8/15 | Advisories are published, including critical/high severities; patch status and audit unknown. |
| Docs/tests | 8/10 | Detailed installation/API/localization docs and named test suites/CI; no independent test-quality assessment. |
| License clarity | 10/10 | Exact MIT license file gives clear permissive commercial reuse with notice and warranty conditions. |
| Setup/deployment | 3/5 | Documented Composer, Docker/Sail paths; production operations still require engineering. |
| APIs/integrations | 4/5 | REST, Sanctum, Swagger, GraphQL reference and integrations; coverage to validate. |
| i18n/Arabic/RTL | 4/5 | `ar` locale and explicit RTL claims/docs; completeness not established. |

**Recommendation:** Evaluate, do not adopt solely on this evidence. Validate the exact intended release, advisories and dependency lockfile; prototype required vendor, checkout, payment, fulfillment, API and Arabic/RTL flows; inspect extension licenses and operational requirements.

## Sources opened

- [Canonical repository](https://github.com/bagisto/bagisto)
- [Exact repository license](https://raw.githubusercontent.com/bagisto/bagisto/master/LICENSE)
- [Official installation guide](https://devdocs.bagisto.com/getting-started/installation.html)
- [Official REST API guide](https://devdocs.bagisto.com/api/rest-api)
- [Official localization guide](https://devdocs.bagisto.com/package-development/localization.html)
- [Official product site](https://bagisto.com/en/)
- [2.5 branch architecture/development instructions](https://github.com/bagisto/bagisto/blob/2.5/AGENTS.md)
- [GitHub security advisories](https://github.com/bagisto/bagisto/security/advisories)
- [GitHub releases](https://github.com/bagisto/bagisto/releases)
- [GitHub commit history](https://github.com/bagisto/bagisto/commits/master/)
