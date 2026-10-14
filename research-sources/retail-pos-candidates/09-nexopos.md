# NexoPOS (Blair2004/NexoPOS) — Retail & POS candidate

**Evidence date: 2026-10-14.** This is a candidate assessment, not adoption approval. Verified facts below are based on the linked primary sources actually opened. “Project claim” denotes project-maintained descriptions/catalog entries; absence of evidence is called out rather than treated as a feature.

## Assessment

NexoPOS is a **POS-first Laravel/Vue retail application**, not infrastructure-only and not merely an ERP POS module. The core is oriented to store checkout and is surrounded by inventory, purchasing, customer, accounting/reporting functionality. It is also hospitality-adjacent: restaurant capability exists in a separate Gastro module, not the examined core repository. The project describes its current core as version 6.2.x, and GitHub confirms a live, unarchived repository with recent pushes and releases. [1] [2] [3]

**Provisional score: 79/100.** It is a credible candidate to evaluate for a Laravel-centric retail/POS knowledge hub, but not an adoption endorsement. Strengths are direct retail workflow fit, current development, and extensibility. Risks include dependency/deployment complexity, peripheral support being partly module/Windows-bound, limited independently visible security assurance, and a material license metadata discrepancy that needs clarification before reuse.

## Product and workflow evidence

The official documentation describes a POS checkout popup for completing sales, recording payments, applying customer balances, and saving unpaid or partially paid orders. The repository describes orders, payments, receipts, refunds, and registers. The release notes mention cash registers, taxes, refunds, and server-side validation of POS prices/discount actions. These are direct POS workflows, not a generic back-office module. [1] [4] [5]

Product management supports physical stock-tracked goods, non-stock services, and grouped products. Product fields include barcode, SKU, units, stock tracking, cost of goods sold, wholesale and selling prices, low-stock thresholds, expiry handling, weighing, PLU codes, and inclusive/exclusive tax types. Official project material also lists procurement, stock history, inventory and accounting/reporting. The docs establish domain coverage, but do not independently validate accounting correctness or statutory/tax compliance. [1] [6]

Barcode product identification and scale barcode/PLU processing are evidenced in official product documentation and releases. The separate marketplace lists a Nexo Print Server and adapter for multi-device/direct Windows ESC/POS-compatible thermal printing. This supports a project-provided printing route, but is not evidence of universal printer support. No core evidence reviewed establishes a cash-drawer kick protocol, card terminal/payment gateway certification, or broad plug-and-play peripheral compatibility. Treat these as unknown pending a device-specific proof of concept. [2] [7]

Multi-store is a separate marketplace module, rather than a core feature. Likewise, Gastro is a separate add-on for tables, waiter/chef workflows, kitchen screens, order routing, and modifiers. The project also lists integrations such as WooCommerce Sync; these marketplace items are not automatically part of the core or necessarily open-source. The core supports a REST API and module extension points. Offline checkout/synchronization is not evidenced in the sources inspected. A Windows bundle includes SQLite, but that is not proof of offline POS operation. [1] [3] [7] [8]

## Architecture, operations and maturity

The repository and package metadata identify Laravel, Vue, Tailwind CSS, and Vite. Composer requires PHP 8.2+ and Laravel 12, with barcode, QR, spreadsheet, PDF, Sanctum, Reverb and other packages. Project deployment guidance specifies MariaDB 10.11 or MySQL 8.4 for self-hosting; a Windows all-in-one product is described with SQLite. Node.js/build tooling, Composer, web server, scheduled tasks, and queue worker requirements create meaningful deployment and ongoing operations burden. [1] [9]

The extension architecture uses Laravel modules and documents module creation, routes, Vue components, migrations, settings, REST API, and other extension points. The official docs provide user and developer tutorials, though the workflow guides vary in depth. Composer declares PHPUnit and tests; releases mention automated coverage for generators. This establishes test tooling and some tests, not a demonstrated coverage level or comprehensive quality gate. [2] [9] [10]

At the evidence date, GitHub API reports `pushed_at` 2026-10-14 and an unarchived repository. Latest release is **v6.2.4**, published 2026-10-02. Recent 6.2.4 release notes include authorization hardening and fixes touching orders, payments, refunds, cash registers and taxes. This is strong maintenance recency; it does not by itself demonstrate support SLAs or release stability in a given deployment. [2] [11]

## Security and license

A repository security policy invites responsible private reporting to `contact@nexopos.com`, asks for time to fix issues, and describes public disclosure after six months of inaction. GitHub's public security-advisories endpoint returned an empty array when checked. Releases disclose past security work, including a security concern fix and unauthenticated migration execution/missing API permission checks in v6.1.2, and further authorization protections in v6.2.4. Empty public advisories must not be interpreted as absence of vulnerabilities. No independent security audit or formal support commitment was verified. [2] [12] [13]

The exact repository `LICENSE` file is the full **GNU GPL v3.0**. GitHub API metadata also classifies the repository as GPL-3.0. GPLv3 permits commercial use, modification and distribution, but conveying covered modified/combined works triggers source, license, notice and same-license obligations as specified by the license; it is not a permissive license. A key inconsistency requires review: the root `composer.json` says `"license": "MIT"` while the exact LICENSE file and GitHub metadata say GPL-3.0. Do not rely on the Composer field as a grant or redistribute until maintainers clarify the intended licensing for the project and dependencies/modules are separately audited. [9] [14] [15]

## Arabic / RTL

No Arabic-specific feature claim was verified. The releases show translation contributions and localization infrastructure, but generic translation/i18n is not evidence of Arabic coverage or right-to-left layout. Arabic locale completeness, RTL rendering, and Arabic receipt/tax formatting are **unknown** and need direct UI/source verification. [2] [10]

## Rubric (provisional)

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit | 17/20 | Real retail POS, checkout, stock, purchasing, returns, tax and cash-register evidence; offline and peripheral gaps. |
| Architecture/reuse | 12/15 | Laravel/Vue modular core and documented REST/module extension; substantial application rather than small reusable component. |
| Maintenance | 14/15 | v6.2.4 released Oct 2; repository pushed Oct 14, 2026. |
| Security/dependencies | 11/15 | Private reporting path and recent authorization fixes; prior security issues, no public advisory/audit evidence, sizeable dependency surface. |
| Docs/tests | 8/10 | Official user/developer guides, API docs, PHPUnit declared and some automated coverage noted; coverage depth unclear. |
| License clarity | 8/10 | GPLv3 file is explicit, but Composer MIT contradiction materially reduces clarity. |
| Setup/deployment | 3/5 | Documented supported stack and bundled option; PHP/database/web/queue/scheduler plus frontend build are nontrivial. |
| APIs/hardware/integrations | 4/5 | REST API/modules, barcode/scale, print server integration; drawer/card-terminal support unverified. |
| i18n/Arabic/RTL | 2/5 | Translation system evidenced, but Arabic and RTL unverified. |
| **Total** | **79/100** | **Evaluation candidate; not approved for adoption.** |

**Recommendation:** Evaluate NexoPOS as an active, directly relevant retail POS candidate. Keep Gastro and MultiStore marked as separate add-ons, and do not assume marketplace extensions share the core's license or availability. Before any adoption/reuse decision, resolve the GPLv3-versus-MIT metadata conflict, review dependency and module licenses, test target checkout/tax/refund flows, and verify Arabic/RTL and exact hardware/payment devices. Do not classify it as legacy-only or stale based on current evidence.

## Sources opened

[1]: https://github.com/Blair2004/NexoPOS "Canonical NexoPOS repository and project overview"
[2]: https://github.com/Blair2004/NexoPOS/releases "NexoPOS release history"
[3]: https://my.nexopos.com/en/marketplace "Official NexoPOS marketplace and add-ons"
[4]: https://my.nexopos.com/en/documentation/user-guide/pos "Official POS guides"
[5]: https://api.github.com/repos/Blair2004/NexoPOS/releases/latest "GitHub API latest release metadata and notes"
[6]: https://my.nexopos.com/en/documentation/user-guide/products/create-product "Official create-product documentation"
[7]: https://github.com/Blair2004/NexoPOS/tree/master "Repository overview, extension ecosystem and operations overview"
[8]: https://my.nexopos.com/en/documentation "Official documentation index, user and developer guides"
[9]: https://github.com/Blair2004/NexoPOS/blob/master/composer.json "Composer dependencies and license metadata"
[10]: https://my.nexopos.com/en/documentation "Official NexoPOS documentation index"
[11]: https://api.github.com/repos/Blair2004/NexoPOS "GitHub repository metadata, including pushed_at and license"
[12]: https://github.com/Blair2004/NexoPOS/security "Repository security policy"
[13]: https://api.github.com/repos/Blair2004/NexoPOS/security-advisories "GitHub public security advisories API"
[14]: https://github.com/Blair2004/NexoPOS/blob/master/LICENSE "Exact repository GPL-3.0 license file"
[15]: https://www.gnu.org/licenses/gpl-3.0.html "GNU General Public License v3.0 full text"
