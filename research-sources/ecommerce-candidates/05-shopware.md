# Shopware (shopware/shopware) — evidence note

**Checked:** 2026-10-14. Scope is the PHP-based Shopware 6 digital-commerce platform and its Community Edition. Findings below separate verified evidence from assessment and unknowns; they are not an assurance of production readiness.

## Candidate overview

**Verified:** Shopware 6 is an open-source, headless-capable digital commerce platform and framework, with Symfony/PHP server code and Vue.js-based administration/storefront ecosystem. The canonical public repository describes it as a ready-to-use shopping cart, extensible by plugins and apps, API-first and optionally headless. Repository metadata labels the dominant language PHP and records 3,447 stars, 1,215 forks, and a push timestamp of 2026-10-14 15:59:37 UTC at the time checked. The repository says it has over 3,100 community extensions. [1] [2]

**License and commercial reuse — verified:** The repository's exact `LICENSE` is MIT. It expressly permits commercial use, modification, distribution and private use, subject to preserving license/copyright notices; it disclaims warranty and liability. This supports commercial reuse of the licensed repository code, but not a blanket conclusion about separately licensed dependencies, third-party extensions, trademarks, hosted services or paid Shopware features. The official pricing page calls Community Edition the open-source, MIT-licensed core, says paid plans add features/support, and states CE setup and maintenance are the user's responsibility. Review notices for the exact version and every dependency/extension before distribution. [2] [3] [4]

**Technologies/database — verified:** PHP/Symfony and Vue.js are explicitly identified; GitHub lists PHP as primary language. The release notes list tested PHP 8.2, 8.4 and 8.5 and MySQL 8/9.7 and MariaDB 11/12 for a particular release. Do not generalize those release-specific versions into a timeless minimum requirement. [1] [5]

**Architecture — verified:** The project describes itself as both a complete commerce platform and an ecommerce framework. The documented extension model includes apps and plugins; plugins can access Shopware process/database directly, while the app system is described as the preferred extension route. Developer documentation advertises custom storefronts using Store APIs and SDKs, with Vue and React reference implementations. [1] [6]

**Commerce fit — verified:** Official Community Edition feature material lists visual page builder, product and order management, payment capability and community support. Repository positioning calls it a shopping cart. More advanced features displayed on the official plan pages—including B2B components, customer-specific pricing and multi-location inventory—are associated with paid tiers, not established here as CE features. [1] [4] [7]

**Headless/API — verified:** Repository explicitly calls Shopware API-first and headless-capable. Official developer docs describe Store APIs/SDKs and third-party integrations through APIs. This is evidence of capabilities, not a guarantee that a target integration is turnkey. [1] [6]

**Multi-vendor — unknown:** Sources opened did not explicitly establish a built-in multi-vendor/marketplace feature. Sales channels or extension ecosystem are not evidence of native multi-vendor operations.

**Internationalization/Arabic/RTL — limited evidence:** The repository invites community translation and mentions existing languages; release notes mention preserving non-ASCII URL/file-name content. Neither establishes Arabic availability, complete Arabic translation, correct RTL storefront/admin behavior or Arabic-specific checkout support. Treat Arabic/RTL suitability as unverified pending hands-on validation. [1] [5]

## Maintenance, security, engineering evidence

**Maintenance signal — verified:** Repository was active on the checked date (API `pushed_at` 2026-10-14 15:59:37Z; metadata updated that day), and release listing included v6.7.15.1. The GitHub API reported 3,447 stars. Stars and recent activity are signals only, not measures of support quality or release stability. [2] [5]

**Security — verified and cautionary:** The repository links a reporting form and bug bounty; `SECURITY.md` directs vulnerability reports to that form. GitHub's security page showed multiple published 2026 advisories when checked, including critical/high issues, such as webhook ACL exposure, app-script sandbox escape, path traversal/RCE and SQL injection issues. This means advisories and fixes must be actively tracked and timely patching assessed; it does not establish current exposure or security posture. No independent security audit, certification or guarantee was evidenced. [8] [9]

**Docs/tests — verified evidence:** Official developer documentation is available and provides installation/development guidance. Repository README links contribution and development setup. The docs recommend Docker for development, mention a Shopware CLI installation path marked Alpha, and describe CI template options. A systematic review of test coverage, CI results, test quality or documentation completeness was not performed; no claim about their adequacy is made. [1] [6] [10]

**Operations/deployment — verified:** Official installation guidance recommends Docker for development and details PHP/Composer alternative, optional OpenSearch and AMQP, and Docker/container deployment boilerplate. The official pricing page says Community Edition is not offered in Shopware Cloud and that setup/maintenance are the user's responsibility. This indicates meaningful operator responsibility and a nontrivial deployment/integration burden; no production complexity benchmark was performed. [4] [10]

## Provisional score: 73/100

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit (20) | 16 | Core cart, product/order management and page building evidenced; advanced features may be plan-gated and So7ob requirements are not specified. |
| Architecture/reuse (15) | 13 | Modular PHP/Symfony platform, apps/plugins, API-first/headless and permissive MIT code are positive; ecosystem/dependency boundaries still need review. |
| Maintenance (15) | 13 | Active push and recent listed release on check date plus substantial community signals; no independent maintenance-quality assessment. |
| Security/dependencies (15) | 7 | Published disclosure channel/bug bounty and active advisories exist, but material 2026 critical/high advisories warrant careful patch/dependency review; no audit evidence. |
| Docs/tests (10) | 7 | Official developer/installation documentation is present; test depth and quality not assessed. |
| License clarity (10) | 9 | Exact MIT license and official CE confirmation are clear; dependency, extension and commercial-service terms remain separate. |
| Setup/deployment (5) | 3 | Docker/setup path documented, but CE operation self-managed and requires relevant infrastructure/operations expertise. |
| APIs/integrations (5) | 4 | API-first, Store APIs/SDKs and integration APIs evidenced; project-specific connector fit unverified. |
| i18n/Arabic/RTL (5) | 1 | Translation contributions/non-ASCII handling evidenced, but Arabic localization and RTL unverified. |
| **Total** | **73** | Provisional evidence-based screening score, not an implementation or readiness rating. |

## Recommendation

**Evaluate, do not adopt on this evidence alone.** Shopware merits a technical proof-of-fit for a PHP-based commerce candidate, particularly if headless APIs and extensibility matter. Before selection, validate required workflows and edition boundaries, Arabic/RTL end-to-end, desired multi-vendor model, extension/dependency licensing, deployment/upgrade/backup operations, and security advisory patch cadence. No production readiness, compliance, audit, scalability or full Arabic/RTL claim is made.

## Sources opened

[1] [Canonical GitHub repository](https://github.com/shopware/shopware)  
[2] [GitHub repository API metadata](https://api.github.com/repos/shopware/shopware)  
[3] [Exact repository LICENSE](https://github.com/shopware/shopware/blob/trunk/LICENSE)  
[4] [Official Shopware pricing and editions](https://www.shopware.com/en/pricing/)  
[5] [Repository releases](https://github.com/shopware/shopware/releases)  
[6] [Official Shopware developer documentation](https://developer.shopware.com/)  
[7] [Official Shopware features](https://www.shopware.com/en/features/)  
[8] [Repository security page/advisories](https://github.com/shopware/shopware/security)  
[9] [Repository SECURITY.md](https://github.com/shopware/shopware/blob/trunk/SECURITY.md)  
[10] [Official Community Edition installation guide](https://developer.shopware.com/docs/guides/installation/)

**Evidence limitations:** Official integration API and concepts pages attempted but did not yield extractable content; claims are confined to accessible repository and developer landing/installation materials. Release version/date displayed in the release listing and repository timestamp are point-in-time observations on the check date.
