# Dolibarr TakePOS — candidate evidence note

**Evidence date: 2026-10-14** · Candidate: Dolibarr ERP/CRM with included TakePOS module · Repository: [Dolibarr/dolibarr](https://github.com/Dolibarr/dolibarr)

## Assessment

**Classification — verified:** TakePOS is an ERP/CRM module, not a POS-first standalone product. It is included in the Dolibarr distribution and activated as a module. Official material also documents shops, bars, restaurants, table/floor layouts and QR self-order, so it is hospitality-adjacent, but it is not infrastructure-only. The project itself describes Dolibarr as an ERP/CRM suite.[1][2]

**Fit judgment — inference:** plausible to evaluate where an ERP-backed checkout and shared product/customer/stock/accounting records are desired. It should not be treated as a specialist retail POS with proven offline resilience or comprehensive peripherals. Hardware support is mixed and some documented connectors are explicitly deprecated.[1]

## What the primary sources establish

- **Product and checkout:** Official TakePOS documentation claims parallel sales, barcode-reader compatibility, touch/responsive interface, multiple terminals, multiple payment modes and payment sessions, QR-based auto-order, and shop/bar/restaurant management. These are project claims, not independently verified behavior.[1]
- **Cash, tax and returns:** The official POS overview claims cash-box control by day/month, opening/closing and terminal. The repository describes Dolibarr-wide invoices, payments, accounting and country-specific tax features. The sources opened do not clearly document TakePOS return/refund flows, tax calculation specifics in checkout, till reconciliation details, or supported tender-terminal protocols; do not assume these.[2][3]
- **Inventory/accounting:** The official overview claims automatic real-time stock decrement when an order is processed. The core repository lists stock/warehouse/inventory, invoices/payments and accounting. This supports an inference of native ERP integration, but the precise posting, stock timing, return reversal and accounting mappings were not independently inspected.[2][3]
- **Hardware and printing:** Browser printing is the default documented path, via a browser popup/print dialog; common USB/LAN/Wi-Fi printers are claimed, but serial ESC/POS is not supported by that path. The docs say ESC/POS may be used through a separate Receipt Printer module if the printer is reachable by the server; cloud-to-LAN networking may require a gateway. Older Java connector and Java Hardware Bridge approaches are explicitly labeled deprecated; Linux bridge support is described as incomplete. Barcode readers are claimed compatible, without model/protocol certification. No source opened establishes cash-drawer kick, payment-terminal integration, scales, or other peripherals.[1]
- **Offline and multi-store:** Multi-terminal is a documented claim, not evidence of multi-store tenancy. Multi-company requires an external module according to the repository. Offline operation/synchronization was not evidenced; assume online server connectivity is required unless separately tested.[1][3]
- **Technology and APIs:** Repository describes PHP with JavaScript enhancements, web-based deployment, MariaDB/MySQL/PostgreSQL, REST and SOAP APIs, and hook/trigger extension architecture. It can be deployed standalone/on-premise or on the web.[3]
- **Arabic/RTL:** SourceForge lists Arabic as a project language; the official repository says localization exists in most major languages. Neither source establishes TakePOS Arabic coverage, complete translation, right-to-left layout or RTL usability. These remain unknown and require direct UI validation; generic i18n is not proof of RTL.[3][4]

## License and reuse

**Verified:** Repository states GNU GPL version 3 or (at the recipient’s option) any later version; the exact root license text is in `COPYING` and begins “GNU GENERAL PUBLIC LICENSE Version 3”. Repository also warns that other licenses apply to included dependencies and points to `COPYRIGHT` for the inventory.[3][5]

**Reuse implication:** GPL-3.0-or-later is copyleft. For conveyed copies or modified covered works, preserve notices and license text, mark modifications, provide corresponding source under GPL terms, and satisfy applicable interactive legal-notice requirements; GPL section 5 states the modified source work must be licensed as a whole under the GPL, subject to the license’s separate-work/aggregate provisions. Network access alone is not conveying under GPLv3. Review `COPYRIGHT`, bundled dependency licenses and the actual integration boundary before redistribution; this is not legal advice.[5]

## Maintenance, maturity, security and operations

- **Recency:** GitHub Releases API reported latest release **24.0.1**, published **2026-09-07**, with prior 24.0.0 referenced in its changelog. GitHub commits API showed a commit dated **2026-09-13**. These are fresh activity signals as of the evidence date.[6][7]
- **Maturity:** The numbered stable release line, broad ERP scope and core-distribution module indicate mature project integration (inference). This does not certify POS-specific quality or hardware readiness.[1][3][6]
- **Security:** A project security policy exists. It limits eligible reports to current stable versions / last two stable major versions or develop, requires confirmation on develop and production-like configuration, and says reports are processed around monthly. It does not use GitHub Security Advisories, instead directing private reports to issues/email and publishing notices through its RSS channel. The GitHub advisories API URL did not yield readable content in this inspection, so this note makes **no claim that there are no advisories or vulnerabilities**. Policy’s constrained eligibility and volunteer cadence temper assurance.[8]
- **Docs/tests:** User documentation is available in the official wiki and repo links administrator/user/developer/translator docs. The TakePOS page is useful for configuration and printing but has gaps on checkout edge cases, peripherals and operational failure modes. Tests/coverage for TakePOS were not assessed; do not infer test quality from repository maturity.[1][3]
- **Deployment burden:** Requires a PHP web server and supported SQL database, initial web-root/configuration setup and install/upgrade process. Official repo lists packaged installers and Docker as alternatives. Operationally, production hardening matters: security policy calls for HTTPS, correct document-directory isolation, read-only application files, CSRF/security settings and rate limiting. Hardware may add server reachability/network gateway or deprecated Java bridge burden.[1][3][8]
- **API/integrations:** REST/SOAP APIs and hooks/triggers are listed at the platform level; the reviewed sources do not establish a TakePOS-specific stable extension API or payment-provider/peripheral integrations.[3]

## Provisional score

**67/100 — score is for this candidate in retail POS, not an adoption approval.**

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit | 12/20 | Checkout, terminals, barcode, payment modes and cashier control claimed; returns/tax workflow evidence incomplete; hospitality tilt. |
| Architecture/reuse | 11/15 | Native ERP module and shared business suite are attractive; substantial ERP footprint versus standalone POS. |
| Maintenance | 13/15 | Release 24.0.1 and commit activity within weeks of assessment date. |
| Security/dependencies | 9/15 | Published scoped reporting policy and current activity; no independent audit/dependency review, no reliable advisory-status conclusion. |
| Docs/tests | 6/10 | Official docs available; peripheral docs useful but incomplete; POS tests/coverage not checked. |
| License clarity | 9/10 | GPL-3.0-or-later explicit; included dependencies have other licenses and require inventory. |
| Setup/deployment | 3/5 | Conventional PHP/SQL deployment, installers/Docker available; production hardening and peripheral networking add work. |
| APIs/hardware/integrations | 2/5 | Platform REST/SOAP and hooks claimed; practical printer options limited/deprecated and payment/drawer integration unknown. |
| i18n/Arabic/RTL | 2/5 | Arabic appears in project-language listing only; TakePOS translation and RTL unverified. |
| **Total** | **67/100** | **12 + 11 + 13 + 9 + 6 + 9 + 3 + 2 + 2 = 67** |

## Recommendation

**Evaluate, with explicit caveats; no adoption approval.** Keep the candidate labeled **ERP-integrated POS / hospitality-adjacent**, not POS-first. Before advancing, run a version-pinned pilot that exercises returns/voids, tax rounding, cash opening/closing, multiple concurrent terminals, stock/accounting effects, Arabic/RTL screens and the actual printer/drawer/payment hardware. Exclude it for a requirement of dependable offline operation or plug-and-play certified POS peripherals unless separate evidence and testing resolve those gaps.

## Sources opened

[1] [Official TakePOS user documentation](https://wiki.dolibarr.org/index.php/Module_Point_of_sale_(TakePOS))
[2] [Official Dolibarr POS overview](https://www.dolibarr.org/presentation-point-of-sale-pos.php)
[3] [Canonical GitHub repository](https://github.com/Dolibarr/dolibarr)
[4] [SourceForge Dolibarr project page](https://sourceforge.net/projects/dolibarr/)
[5] [Exact repository license file, COPYING](https://raw.githubusercontent.com/Dolibarr/dolibarr/develop/COPYING)
[6] [GitHub API latest release](https://api.github.com/repos/Dolibarr/dolibarr/releases/latest)
[7] [GitHub API latest commit](https://api.github.com/repos/Dolibarr/dolibarr/commits?per_page=1)
[8] [Dolibarr GitHub security policy](https://github.com/Dolibarr/dolibarr/security)
[9] [Dolibarr official site](https://www.dolibarr.org/)
[10] [GitHub security advisories API endpoint](https://api.github.com/repos/Dolibarr/dolibarr/security/advisories?per_page=10) — endpoint did not yield readable content during this inspection.
