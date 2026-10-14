# WooCommerce — evidence note (checked 2026-10-14)

## Candidate and scope
WooCommerce (`woocommerce/woocommerce`) is the WordPress commerce plugin and its storefront/extension ecosystem. It is a strong domain match for an online storefront, but not a standalone commerce server: it runs inside WordPress. Findings below distinguish documented facts from assessment and unknowns; this is an evaluation, not a production-readiness, compliance, security-audit, or scalability determination.

## Verified facts
- The canonical GitHub repository describes itself as a monorepo containing core WooCommerce plugin, packages, tools and extension-related development code. It requires PHP 7.4+, Composer, Node.js and pnpm for monorepo development/build; its README gives `pnpm install --frozen-lockfile` and `pnpm build`. [1]
- Plugin readme metadata declares **GPLv3**, links to the GNU GPL-3.0 text, and describes the project as an open-source e-commerce platform for WordPress. GitHub's repository API reports generic “Other” / `NOASSERTION` for the repository's license metadata; it does not establish a conflicting license, but means repo-level automated identification is inconclusive. The exact root `LICENSE` path could not be opened (404); therefore the readme metadata, rather than an inspected root license file, is the explicit evidence for core plugin license. [2] [3]
- The official WooCommerce documentation covers products, taxes, shipping, payments, orders, reporting, customers, marketing, site administration, store design and mobile app. [4]
- Official REST documentation says WooCommerce is integrated with WordPress REST API; current integration version is v3, JSON CRUD supports standard HTTP verbs, and documented API requirements are WooCommerce 3.5+, WordPress 4.4+, and pretty permalinks. API credentials are generated in WooCommerce settings. This is evidence of API capability, not proof that every storefront experience is headless-ready. [5]
- WooCommerce localization documentation says the plugin is translation-ready, language files are offered through WordPress translation infrastructure, and translations may be downloaded/created. No checked source directly verified Arabic translation completeness or right-to-left storefront/admin correctness, so those remain unverified. [6]
- Official multi-vendor documentation instructs users to download and install `multi-vendor-marketplace.zip` as a plugin and documents vendor applications, commissions and vendor dashboards. This documents a separate plugin-based capability, not core multi-vendor functionality. [7]
- Security policy says generally only the latest WooCommerce version receives continued support; critical vulnerabilities may be backported. It directs vulnerability reporting through Automattic's HackerOne program. This is evidence of a reporting/support policy, not an audit or assurance of security. [8]
- GitHub releases page showed **11.2.1** as latest, released **2026-10-09**, and nightly updated 2026-10-13 UTC. Commit history showed activity through **2026-10-14**. GitHub API query during this check reported **10,549 stars** (time-sensitive snapshot). [9] [10] [11]
- WordPress plugin readme snapshot identifies PHP and JavaScript ecosystem implicitly through core and repository setup; lists tested WordPress version 7.1, requires WordPress 7.0 and PHP 7.4 in the snapshot, stable tag 11.2.1. It additionally lists products (including physical/digital, variable, affiliate/download goods), and subscriptions/bookings/memberships as vetted extensions rather than core. [3]

## Architecture, technology and operational implications
**Verified:** WordPress plugin/monorepo, PHP core plus JavaScript packages/tooling; Composer and pnpm build dependencies. [1] [3]

**Inference:** A conventional deployment requires WordPress, PHP runtime, a supported SQL database and web-serving/caching/storage infrastructure. Core database is the WordPress database, with commerce records managed within WordPress conventions and WooCommerce data structures. Exact database versions/schema/hosting topology were not established by the opened sources, so database engine/version is **unknown** here. The plugin architecture and extension ecosystem are reusable but introduce WordPress/theme/plugin compatibility, updates, and integration operations. [1] [4]

**Complexity assessment:** Moderate for a conventional small store; higher when assembling payments, shipping, tax, localization, extensions, custom theme, security/update processes and production operations. This is an inference, not measured deployment evidence. Repo development setup (PHP/Composer plus Node/pnpm, workspace dependency install/build) is more involved than installing the plugin from the WordPress admin. [1] [3]

## Provisional scoring (76/100)
- Feature fit: **18/20** — direct WordPress commerce fit and documented catalog/order/payment/shipping/tax/reporting capabilities; deductions for reliance on extensions for some advanced commerce use cases. [4] [3]
- Architecture/reuse: **12/15** — open-source modular plugin and monorepo packages/extensions, but tightly embedded in WordPress rather than an independent service. [1]
- Maintenance: **14/15** — frequent 2026 commits, release 11.2.1 dated 2026-10-09, and large visible repository community; stars are a popularity indicator, not quality proof. [9] [10] [11]
- Security/dependencies: **9/15** — published coordinated disclosure route and support policy; deductions because policy supports latest version generally, dependency/hosting stack adds operational burden, and no audit/compliance evidence assessed. [1] [8]
- Docs/tests: **8/10** — official merchant and developer docs plus monorepo build/test-script references; actual test coverage/results were not measured. [1] [4] [5]
- License clarity: **8/10** — plugin readme explicitly declares GPLv3 and links exact license terms; deduction because requested canonical root license file was unavailable and GitHub API metadata is inconclusive. [2] [3]
- Setup/deployment: **3/5** — familiar WordPress plugin deployment, but complete stack and extension management required; inference. [1] [3]
- APIs/integrations: **4/5** — documented REST API v3 and official client libraries across JS/PHP/Python/Ruby; API keys and WordPress prerequisites apply. [5]
- i18n/Arabic/RTL: **-3?** This rubric category is 0–5. Award **0/5** because translation infrastructure is evidenced, but Arabic completion and RTL behavior are not; no positive credit assigned without the requested specific evidence. [6]

**Total:** 18 + 12 + 14 + 9 + 8 + 8 + 3 + 4 + 0 = **76/100**. Score is provisional and rubric-based, not a benchmark.

## Recommendation
**Evaluate, not adopt by default.** WooCommerce merits a proof-of-fit if So7ob Tech's target is WordPress-based commerce and the team accepts plugin/theme/hosting operations. Before selection, test required payment/shipping/localization extensions, current WordPress/PHP/database compatibility, Arabic UI and RTL flows, security update ownership, and whether a WordPress-coupled runtime fits the desired product architecture. No claim is made here about production readiness, regulatory compliance, security audit, performance or scalability.

## Unknowns / evidence gaps
- Exact root `LICENSE` file could not be retrieved at `https://raw.githubusercontent.com/woocommerce/woocommerce/trunk/LICENSE`; repo API metadata says `NOASSERTION`. Core readme metadata gives GPLv3, but legal review should examine applicable source/plugin and extension licenses.
- Exact database engine/version requirements and current schema details not established from opened primary sources.
- Arabic translation percentage/quality, RTL visual/functional correctness, and right-to-left coverage not verified.
- No test suite execution, code coverage, dependency audit, vulnerability history review, formal security assessment, compliance assessment, performance test, or deployment trial performed.
- Multi-vendor feature is documented as a separately installed plugin; license/cost and suitability of that offering for the intended deployment require separate investigation.

## Sources opened
[1] https://github.com/woocommerce/woocommerce/ — canonical repository README / development setup.
[2] https://api.github.com/repos/woocommerce/woocommerce — repository metadata checked via GitHub API; license metadata is `Other` / `NOASSERTION`.
[3] https://wordpress.org/plugins/woocommerce/ — official WordPress plugin listing/readme metadata, including GPLv3 and core/extension feature description.
[4] https://woocommerce.com/documentation/woocommerce/ — official merchant documentation index.
[5] https://developer.woocommerce.com/docs/apis/rest-api/ — official REST API documentation.
[6] https://woocommerce.com/document/woocommerce-localization/ — official localization documentation.
[7] https://woocommerce.com/document/multi-vendor-marketplace/ — official separate multi-vendor plugin documentation.
[8] https://github.com/woocommerce/woocommerce/security/policy — repository security policy.
[9] https://github.com/woocommerce/woocommerce/releases — release history, latest release and nightly timestamp.
[10] https://github.com/woocommerce/woocommerce/commits/trunk/ — branch commit history.
[11] https://github.com/woocommerce/woocommerce/ — GitHub repo snapshot; star count obtained from GitHub repository API on checked date.

Checked: **2026-10-14**.
