# WallacePOS (micwallace/wallacepos) — candidate evidence note

**Evidence date: 2026-10-14.** Scope: self-hosted web POS/retail management, with special attention to project dormancy and maintainer/service support. This is a provisional screen, not adoption approval.

## Finding

**Recommendation: exclude from active evaluation; retain as legacy/reference-only, or revisit only if a committed maintainer team first demonstrates a current, supported fork.** WallacePOS is unequivocally POS-first, not an ERP module or infrastructure-only project. The official page describes a web POS and business management system for small-to-medium businesses. Yet repository README explicitly says it is “not longer actively maintained” and invites a maintainer. GitHub API reports latest push on 2023-01-18, while newest public release is 1.4.3 from 2017 (later updated/published in 2019 around security fixes). Critical security advisories, old deployment assumptions and no apparent project security policy make production adoption unjustified without substantial independent ownership and remediation.

## Evidence and assessment

- **Verified product type / project claim:** Product is a browser-based, self-hosted web POS with an administration dashboard and reporting, not an ERP add-on. Upstream claims small/medium business suitability, real-time configuration/item updates, and taking sales offline. These are project claims, not independently validated behavior. [1] [2]
- **Verified scope claims:** Homepage describes standard USB barcode scanners, ESC/POS receipt printers, cash drawers, receipt logo/text/QR customization, and Tyro integrated EFTPOS “hosted versions only.” The README similarly claims printer, drawer and barcode support. Peripheral support should be treated as an upstream claim pending device testing; exact models, drivers and payment workflows are not specified. [1] [2]
- **POS workflows:** Release history explicitly records VAT calculation, sales, voids and refunds in reporting, transactions/invoices, and a Till workflow. The Tenable PoC describes staff entering a sale item, unit price, processing, completing via cash, then optionally printing a receipt. This establishes evidence of basic sales/cash completion and refund/void records, but not a complete verified returns policy, cash drawer reconciliation, split tender, card-payment flow, tax jurisdiction support or inventory accounting. [3] [4]
- **Inventory/accounting:** Release notes identify items, suppliers, categories, CSV item import, and cost/profit reporting; repository/site claim reports and data export. This is basic stock/catalogue and management reporting evidence, not proof of a full accounting ledger, purchasing lifecycle, GL integration, or third-party accounting connector. [2] [3]
- **Offline and multi-store:** Site claims offline sales, but release notes only explicitly mention offline sales backup and local settings reset; no evidence of robust offline synchronization conflict handling or verified offline operation. Multi-store support is not evidenced. Do not interpret one-device/multi-terminal operation or web access as multi-store. [2] [3]
- **Technology/deployment:** README requires Apache 2.4.7+, PHP >=5.4 with cURL and GD, Node.js/socket.io, MySQL (release notes mention compatibility with MySQL 5.7), Composer dependencies and Apache rewrite/proxy configuration. This is PHP/LAMP plus a separate Node/socket.io feed/websocket service; it is a self-hosted monolith with realtime sidecar rather than a contemporary packaged SaaS platform. Database evidence supports MySQL; PDO compatibility is mentioned, but alternative database support is not established. [2] [3]
- **Operations burden:** Installation requires server modules, a custom TLS virtual host/proxy setup, dependency installation and browser installer. README warns Dokku users persistent storage is needed to avoid data loss during upgrades, and the shown Dokku instructions prescribe changing default admin credentials. Legacy versions and minimum PHP requirements are material operational/security liabilities; current compatibility and supported deployment images are unknown. [2]
- **APIs/integrations:** An `/api` surface and Tyro hosted EFTPOS claim exist, plus CSV import/export. No current API reference, versioning commitment, authentication guide, webhook catalog or integration support lifecycle was found. [1] [2] [4]
- **Languages/Arabic/RTL:** Release notes mention alternate-language printing, and the tree contains an Ace RTL stylesheet. These do **not** verify Arabic localization, Arabic content, or end-to-end RTL support in the POS/admin UI. Arabic/RTL readiness is unknown and requires direct test; do not infer from generic i18n or a third-party theme asset. [3] [5]
- **Maintenance / maturity:** README maintenance warning is direct maintainer disclosure. GitHub API says pushed 2023-01-18 and repository is not archived; current metadata is not evidence of active maintenance (updated timestamp can change without commits). Latest release endpoint lists v1.4.3; its release record includes security-fix notes and an anomalous published_at date 2017-04-11 despite a 2019 creation/update timestamp. We report both values rather than assuming them equivalent. Last commit chronology shown is June 25, 2019. The project has historical adoption (405 stars / 385 forks at API observation) but release history is stale; maturity in the sense of currently supported production software is low. [2] [3] [4]
- **Docs/tests:** README provides manual deployment instructions and official site marketing claims. No official docs were linked from GitHub community profile; `/docs` did not yield readable page content when opened. Repository community profile has 42% health and no contributing guide, conduct file, or PR template. A tree inspection reveals third-party HTMLPurifier and mysqldump library tests, not evidence of a maintained WallacePOS automated test suite or CI quality gate. [2] [5] [6]
- **Security:** Tenable documents CVE-2019-3958 persistent authenticated stored XSS, CVE-2019-3959 CSRF, and CVE-2019-3960 authenticated unrestricted upload leading to PHP RCE. It says v1.4.3 hot fixes address the issues, but CSRF around login had no solution per the advisory. The security-fix commit itself lists these CVEs. A repository security-policy file was not found via the checked `SECURITY.md` raw path; GitHub community profile does not show a security policy. No GitHub advisory page was found/opened. Absence of a located policy/advisory is not proof that no private disclosure process exists. [4] [5] [6]
- **License:** GitHub API identifies `LGPL-3.0`; exact repository file is `LICENSE.txt`, and the file begins “GNU LESSER GENERAL PUBLIC LICENSE Version 3, 29 June 2007.” Reuse therefore requires following LGPL-3.0 (and incorporated GPLv3 terms as applicable): retain notices/license, provide source for modifications to covered LGPL portions, honor relinking/reverse-engineering conditions for combined works, and satisfy corresponding-source/install-information obligations when applicable. For distribution or a proprietary combined product, review the exact LGPLv3 conditions and all bundled third-party licenses with counsel; license classification alone is not legal advice. [5] [6]

## Provisional score (same requested rubric; points sum to 100)

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit /20 | 12 | Genuine POS-first product with till, basic sale/tax and catalog workflows; completeness and modern retail requirements unverified. |
| Architecture/reuse /15 | 6 | PHP self-hosted source and extensibility claim, but old LAMP + separate Node service and legacy dependency/deployment assumptions. |
| Maintenance /15 | 1 | Explicitly unmaintained; last push 2023, last substantive visible history 2019. |
| Security/dependencies /15 | 1 | Three material CVEs; old stack and no located current security process. Historical patches mitigate only if properly applied; no present-day review. |
| Docs/tests /10 | 3 | Setup README and marketing site, but limited docs and no verified first-party test/CI evidence. |
| License clarity /10 | 9 | Clear exact LGPL-3.0 file and GitHub SPDX metadata; third-party bundle licenses still need review. |
| Setup/deployment /5 | 2 | Self-hosting instructions exist, but manual proxy/socket setup and legacy runtime imply substantial burden. |
| APIs/hardware/integrations /5 | 2 | Peripheral and hosted Tyro claims plus API surface; incomplete model/API/support documentation. |
| i18n/Arabic/RTL /5 | 1 | Alternate-language print claim and RTL stylesheet only; Arabic UI readiness unknown. |
| **Total** | **37/100** | **Legacy-only; do not approve for adoption.** |

## Sources actually opened

[1] Official product site: https://wallacepos.com/

[2] Canonical repository and README: https://github.com/micwallace/wallacepos

[3] GitHub release history API: https://api.github.com/repos/micwallace/wallacepos/releases

[4] GitHub commit history API (includes latest commits and 1.4.3 security-fix commit): https://api.github.com/repos/micwallace/wallacepos/commits?per_page=5

[5] Exact license file: https://raw.githubusercontent.com/micwallace/wallacepos/master/LICENSE.txt

[6] GitHub community profile metadata (license path, governance/docs omissions): https://api.github.com/repos/micwallace/wallacepos/community/profile

[7] GitHub repository metadata: https://api.github.com/repos/micwallace/wallacepos

[8] Tenable advisory: https://www.tenable.com/security/research/tra-2019-37

[9] Security-fix commit: https://github.com/micwallace/wallacepos/commit/ba07ac7a60ade3bdefd5501b2c539ea170c51bbb

[10] Repository tree endpoint (RTL CSS and bundled test-folder inspection): https://api.github.com/repos/micwallace/wallacepos/git/trees/master?recursive=1

[11] Checked for a project security policy: https://raw.githubusercontent.com/micwallace/wallacepos/master/SECURITY.md (no content returned)

[12] Checked official docs path: https://wallacepos.com/docs (no readable content returned)
