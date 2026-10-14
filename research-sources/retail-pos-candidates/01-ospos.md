# OSPOS (opensourcepos/opensourcepos) — Retail & POS candidate

**Evidence date: 2026-10-14.** This is a provisional evaluation for So7ob Tech’s open-source engineering knowledge hub, not adoption approval. Labels distinguish **Verified fact** (directly visible in primary material), **Project claim** (feature or policy asserted by maintainers), **Inference** (assessment), and **Unknown** (not established by sources opened).

## Candidate and product fit

**Verified fact:** Open Source Point of Sale (OSPOS) is a web-based PHP application using MySQL or MariaDB. It is POS-first, not an ERP with an embedded POS and not infrastructure-only. Its core sales register, returns, cash-up, receipts, inventory, customers, tax and reporting functionality makes it directly relevant to retail POS. It is somewhat hospitality-adjacent: project feature list includes restaurant tables, but this does not make it a restaurant-first product. [1] [2]

**Project claims:** Sale register with transaction logging; Sales/Returns; quotations/invoices; cash-up; expenses; VAT/GST and multi-tier taxes; stock/items/kits; receivings; customer/supplier records; gift cards/rewards; reports; receipt/invoice/quotation printing and email; barcode generation/printing; multiple users/permissions; multilingual UI. The official Wiki overview adds multi-currency. Evidence supports POS workflows and retail inventory, but does not establish a complete general ledger/accounting package. [1] [3]

**Hardware evidence and caveat:** Official printing guidance describes use of installed OS printers through browser printing, recommends Star TSP 100 ECO receipt and Zebra LP 2824 Plus label printers, and documents receipt/label print configuration and browser-dependent “advanced/autoprint” approaches. Some recommendations depend on old browser add-ons/settings. The guide says cash-drawer options are selected in printer configuration; this is not proof of universal drawer control. Fiscal kits require country-specific setup. Barcode scanners are referred to in project hardware guidance, but the hardware support wiki page returned no readable page content; scanner/device model compatibility therefore remains unverified here. No evidence opened establishes integrated card payment terminal support. [1] [3] [4]

**Inventory/accounting:** Stock, items/kits, stocktake, receivings, inventory reporting and sales/tax records are evidenced. Expenses logging is not equivalent to accounting/GL. No documented accounting-system integration was verified. MailChimp and SMS are listed by the project; that is not evidence of a general integration/API framework. [1] [3]

**Offline/multistore:** No offline-first or disconnected checkout capability was evidenced. Multiuser is supported, but multiuser should not be conflated with multi-store; no multi-location feature was verified. Treat both as unknown/unsupported for planning until tested or documented. [1] [3]

**Languages and Arabic/RTL:** Translation files and Weblate workflow establish multilingual infrastructure. No Arabic translation completeness, Arabic usability or right-to-left layout support was established by the opened sources. Do not infer RTL from generic i18n. [1] [5]

## Technology, maturity, operations

**Verified fact:** PHP with CodeIgniter 4 (MVC), MySQL/MariaDB; repository wiki describes jQuery and Bootstrap 3/Bootswatch. Official install instructions require PHP 8.2–8.4 and extensions including JSON, GD, BCMath, Intl, OpenSSL, Mbstring, cURL and XML; MySQL 5.7 or MariaDB 10.x; Apache 2.4 is supported and Nginx may work. [1] [5] [6]

**Maintenance and releases:** GitHub commit API returned signed, verified commits on 2026-10-14. The official releases API showed stable 3.4.2 published 2026-10-02 and an explicitly unstable master build 3.4.3 on 2026-10-14. This is current maintenance activity and a recent stable release, not a claim of long-term release cadence. Stable 3.4.2 release notes warn of many security fixes and require configuration changes (`ALLOWED_HOSTNAMES`, `THROTTLE_KEY` for Docker / `app.allowedHostnames`, throttle key for regular installs). [7] [8]

**Docs/tests:** Project has INSTALL.md, FAQ/wiki and development index. Current install docs warn a source clone needs a build, require `app.allowedHostnames` in production, and describe database auto-creation/migrations on first access. Docker is available, but docs explicitly say the sample setup is not suited for production without changing default credentials. Deployment requires PHP/web server/database configuration, writable paths and careful backup/upgrade handling; thus moderate operational burden. Wiki identifies a `tests/` PHPUnit directory and CI sanity/build pipeline. **Unknown:** test coverage, current test pass rate and breadth of POS workflow tests were not independently established. [1] [5] [6] [9]

**APIs/integrations:** Official feature list names MailChimp and SMS but these are project claims, not an inventory of current integration status. No public, supported external API contract was verified in sources opened. [1] [5]

## Security

**Verified fact:** Repository has a security policy. It says patches are supported for versions >=3.4.2, provides private GitHub advisory/email reporting, a 48-hour acknowledgment target and coordinated disclosure timeline. As of the evidence date the advisory page listed ten advisories, all published 2026-10-02, including critical authenticated OS command execution, high-severity broken access control, stored XSS, validation and race-condition issues. Release 3.4.2 notes “plenty of security fixes” and strongly advises upgrading. This is evidence of active disclosure and repair, but also a material recent security backlog/exposure. Require version verification and independent security review before any deployment. [7] [10]

**Dependency posture:** PHP framework, Composer/vendor and frontend dependencies are implied by repository layout/build instructions. The release notes demonstrate dependency updates, including JS packages. No full dependency audit/SBOM or vulnerability scan was conducted, so current dependency risk is unknown. [7] [5]

## License and exact reuse conditions

**Verified fact:** The exact repository `LICENSE` is MIT text with additional explicit terms: retain copyright and permission notice in copies/substantial portions; do not claim copyright/ownership; and retain the footer signature containing version, hash and project URL, visible on every page and unmodified. Project README/site specifically says the footer signature **must be retained, visible in every page and cannot be modified**, and removal of license files or replacing the footer is prohibited. [11] [1]

**Reuse consequence:** Although based on MIT, this is not the plain MIT-only reuse posture. The footer condition is explicit and operationally important for a fork, white-label, embedded/rebranded product, or modified UI. Preserve the license and all notices and display the project’s required signature unchanged on every page; do not remove or obscure it. Get legal review on how the added restriction interacts with the intended distribution/use; do not treat the SourceForge’s mixed GPLv3/MIT label as authoritative over the canonical repository license. [11] [1] [12]

## Provisional score (same 100-point rubric)

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit | 18/20 | Strong POS-first sale, returns, cash-up, taxes and inventory; unknown offline/multistore/payment integration. |
| Architecture/reuse | 11/15 | Conventional PHP MVC web app and established framework; integration/API contract and decoupling not demonstrated. |
| Maintenance | 14/15 | Verified activity and stable release within two weeks; security patching currently active. |
| Security/dependencies | 9/15 | Security policy/advisories and fixes exist, but ten same-day disclosures (including critical/high) and unverified dependency posture reduce confidence. |
| Docs/tests | 8/10 | Useful install/wiki/development docs and PHPUnit directory/CI; test coverage/quality unknown. |
| License clarity | 6/10 | Exact text is available, but additional immutable per-page footer condition is a real reuse/rebranding constraint. |
| Setup/deployment | 3/5 | Docker and install guidance exist; production config, writable permissions and PHP/DB/web stack administration are required. |
| APIs/hardware/integrations | 3/5 | Printer/barcode guidance and named MailChimp/SMS claims; no verified API contract or payment integration. |
| i18n/Arabic/RTL | 2/5 | Multilingual translation workflow, but Arabic and RTL not evidenced. |
| **Total** | **74/100** | Provisional candidate score, not approval. |

## Recommendation

**Evaluate, with explicit license and security gates.** OSPOS is not adjacent or stale: it is genuinely POS-first and recently maintained, with a recent stable release and current commits. It merits a focused technical evaluation for retail checkout/inventory workflows. Keep it out of adoption approval until So7ob verifies the immutable footer is acceptable, tests the target checkout/peripheral workflows, establishes offline/multistore and payment needs, and reviews 3.4.2+ patch state and dependencies. Do not use SourceForge’s ambiguous licensing field as the basis for reuse decisions.

## References — URLs opened

[1] https://github.com/opensourcepos/opensourcepos — canonical repository README.  
[2] https://sourceforge.net/projects/opensourcepos/ — legacy project listing; states active development moved to GitHub and shows inconsistent license labels.  
[3] https://github.com/opensourcepos/opensourcepos/wiki — official Wiki overview/features.  
[4] https://github.com/opensourcepos/opensourcepos/wiki/Printing — printing/peripheral configuration guide.  
[5] https://github.com/opensourcepos/opensourcepos/wiki/Development-Index — architecture, technologies, tests directory and contributor information.  
[6] https://github.com/opensourcepos/opensourcepos/blob/master/INSTALL.md — install/runtime/deployment requirements.  
[7] https://api.github.com/repos/opensourcepos/opensourcepos/releases — release metadata and 3.4.2 / unstable notes.  
[8] https://api.github.com/repos/opensourcepos/opensourcepos/commits?per_page=5 — recent commit metadata.  
[9] https://github.com/opensourcepos/opensourcepos/wiki/Hardware-Support — opened, but returned no readable hardware-support content.  
[10] https://github.com/opensourcepos/opensourcepos/security/advisories — advisory list.  
[11] https://raw.githubusercontent.com/opensourcepos/opensourcepos/master/LICENSE — exact license terms.  
[12] https://opensourcepos.org/ — official site/license and feature claims.  
[13] https://raw.githubusercontent.com/opensourcepos/opensourcepos/master/SECURITY.md — security policy, supported versions and disclosure process.
