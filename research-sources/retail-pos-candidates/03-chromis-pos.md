# Chromis POS — candidate evidence note

**Evidence date: 2026-10-14**  
**Candidate:** Chromis POS (`ChromisPos/ChromisPOS`)  
**Scope:** Java desktop point-of-sale for Retail & POS; assessment is provisional and is not adoption approval.

## Finding

Chromis is an actual POS-first desktop till and back-office application, not an ERP module or infrastructure-only tool. It is also hospitality-adjacent: official project material describes a separate kitchen-screen app, restaurant mode, reservations, kitchen routing and table/cover features. Its feature breadth is plausible for a small/midsize shop, but the public upstream GitHub source history is extremely thin and stale. Treat it as **legacy-only / do not shortlist for adoption without a live operational and legal verification**.

Evidence labels below distinguish **Verified fact** (directly visible in source), **Project claim** (maintainer/project assertions), **Inference** (reasoned implication), and **Unknown** (not evidenced).

## Product and workflows

- **Verified fact:** GitHub describes the repo as “Main POS Application”; code layout includes `src-pos`, `src-data`, `src-beans`, and a committed runnable JAR. The official project page calls it a POS and describes separate till and back-office applications. Sources [1][2][3].
- **Project claim:** Supported workflows/features include multi-sale modes, multi-tier pricing, variable price and GS1 variable price/weight barcode handling, product CSV import, loyalty, gift cards, customer database, suppliers/supplier ordering, stock management, reports, tax-exempt customers and user roles/security. Source [2][3].
- **Project claim:** Release notes mention cash close reports, cash reports, ticket/payment handling, line/ticket discounts, tax scheduling, supplier orders and partial supplier deliveries. Returns/refunds workflow was not clearly evidenced from the source text inspected. Sources [3][4].
- **Project claim:** The official site says USB printers, receipt/ticket customization and remote kitchen printing are supported; SourceForge lists broad hardware support and kitchen display across multiple stations. A specific cash-drawer, payment-terminal/card processor or named peripheral model integration was not evidenced. Do not equate printer support with drawer or payment-device support. Sources [2][3].
- **Project claim:** Database support is MariaDB and MySQL 8.0.27+ on SourceForge; official web page more generally claims multiple open-source database platforms. A request for SQLite/HSQLDB support exists, which is not evidence those databases are supported. Source [3].
- **Unknown:** Offline behavior, store-to-store synchronization and centralized multistore operation were not evidenced. A locally installed desktop/database design suggests local operation, but does not establish reliable offline mode or multi-location functionality.
- **Verified fact:** Java is the implementation language according to GitHub metadata. **Project claim:** Java 11 minimum, Windows and Linux support. Languages/locales exist in the source tree and project mentions locale controls. **Unknown:** Exact maintained language coverage. **Unknown:** Arabic user interface or RTL usability. Generic locale support does not establish Arabic/RTL. Sources [1][2][3].

## License and reuse

- **Verified fact:** GitHub REST repository metadata reports `license: null`; the repository has a `licensing/` directory, while the standard root `LICENSE` URL failed to return content. GitHub therefore does not machine-identify a repo license. Source [1][5].
- **Project claim:** The official licensing page states Chromis POS and Chromis Kitchen Screen are GPLv3, “or (at your option) any later version,” and names John Lewis copyright 2021. Source [6].
- **Verified fact:** A specific applicable license text could not be verified from the source files opened; page-level statement is not equivalent to confirming file headers and licenses for all bundled code, fonts, JARs, libraries and assets. Source [5][6].
- **Inference / reuse caution:** If the relevant Chromis program is indeed GPL-3.0-or-later, redistribution of modified or combined derivative program versions invokes GPL source-provision and license-preservation obligations; private internal use differs from conveying copies. Do not rely on “free to use/modify” bullet points as a complete legal explanation. Inventory bundled third-party components and their notices, obtain counsel review and establish the exact source snapshot before reuse. No adoption or redistribution clearance is granted by this note.

## Maintenance, maturity, docs and security

- **Verified fact:** GitHub API reports repository created 2025-08-01, updated 2026-09-23, but `pushed_at` 2025-08-01; commits API returned a single commit dated 2025-08-01 (“Start of commits ready for GitHub”). This means the more recent updated timestamp is not evidence of source pushes. GitHub releases API returned an empty list. Sources [1][7][8].
- **Verified fact:** SourceForge records version `1.5.3hf1` JAR modified 2024-07-15; its release history says V1.5.3 dated 231005 (2023-10-05). Documentation folder has 1.5.4 dated 2024-04-08, which is a docs folder timestamp, not proof of a later application release. The newest independently visible application binary is therefore the 2024-07-15 1.5.3hf1 upload. Sources [4][9].
- **Inference:** Product lineage and release history show a mature, feature-rich legacy application; recent public upstream activity is weak and source release traceability is poor. A one-commit GitHub mirror/snapshot may not expose earlier development history, so not proof the whole project had only one commit ever.
- **Verified fact:** SourceForge advertises user/admin materials and a separate documentation directory, but the PDF download endpoint yielded no manual text in extraction. SourceForge release notes are useful but no test suite, CI, test strategy or reproducible build process was identified in the inspected repository listing. Sources [3][4][10].
- **Verified fact:** GitHub’s security policy endpoint explicitly says no `SECURITY.md` policy is set up; public advisories listing yielded no advisory details. This establishes no visible repo policy/advisories on inspected pages, not absence of vulnerabilities. Sources [11][12].
- **Inference:** Deployment burden is moderate/high for a small-business desktop POS: Java 11+, OS-specific installation, separate POS and admin apps, database setup/connection/backup and peripheral configuration. The product’s operational/business-critical role raises upgrade and support risks. Sources [2][3].
- **Unknown:** Stable public API, web service, documented integration SDK, payment gateway integration, supported drawer protocol and formal support SLA were not evidenced. Built-in scripting and remote kitchen printing are not a general API.

## Provisional score: 42/100

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit | 14/20 | Real retail POS with checkout, pricing, barcode, customer, inventory, supplier and reporting features; returns and several checkout peripherals unclear. |
| Architecture/reuse | 8/15 | Java desktop split POS/admin and database-backed; build/reuse architecture and source traceability are weakly evidenced. |
| Maintenance | 3/15 | GitHub’s sole visible commit is 2025-08-01; no subsequent push, despite API updated_at in 2026. Newest visible binary is July 2024. |
| Security/dependencies | 4/15 | No security policy/advisories visible; no dependency audit or patch cadence evidenced. |
| Docs/tests | 5/10 | Product/docs/release notes exist; manual extraction, automated tests and CI were not evidenced. |
| License clarity | 3/10 | Official page claims GPLv3-or-later, but API says null and root LICENSE unavailable; bundled component rights need review. |
| Setup/deployment | 2/5 | Desktop deployment is feasible but requires Java/database/admin and hardware setup. |
| APIs/hardware/integrations | 2/5 | Barcode, USB/remote printers and kitchen screen claims; no demonstrated public API or named payments/drawer integration. |
| i18n/Arabic/RTL | 1/5 | Locale-related mechanisms/claims only; no verified Arabic or RTL support. |
| **Total** | **42/100** | Sum checked: 14+8+3+4+5+3+2+2+1 = 42. |

## Sources actually opened

[1] https://api.github.com/repos/ChromisPos/ChromisPOS — GitHub repository metadata  
[2] https://chromis.co.uk/chromispos/ — official product page  
[3] https://sourceforge.net/projects/chromispos/ — SourceForge project overview  
[4] https://sourceforge.net/projects/chromispos/files/ — SourceForge versions and release notes  
[5] https://github.com/ChromisPos/ChromisPOS/blob/master/LICENSE — root license path; extraction returned no content; API metadata license null  
[6] https://chromis.co.uk/licence-details/ — official license claim  
[7] https://api.github.com/repos/ChromisPos/ChromisPOS/commits?per_page=5 — commit dates/history  
[8] https://api.github.com/repos/ChromisPos/ChromisPOS/releases — GitHub releases (empty array)  
[9] https://sourceforge.net/projects/chromispos/files/1.5.3hf1/ — binary modified 2024-07-15  
[10] https://sourceforge.net/projects/chromispos/files/ChromisDocs/1.5.0/Chromis%20Administration.pdf/download — documentation PDF endpoint, no text extracted  
[11] https://github.com/ChromisPos/ChromisPOS/security/policy — no security policy detected  
[12] https://github.com/ChromisPos/ChromisPOS/security/advisories — repository advisory listing  
[13] https://sourceforge.net/projects/chromispos/files/ChromisDocs/ — docs folders and timestamps  
[14] https://api.github.com/repos/ChromisPos/ChromisPOS/git/trees/master?recursive=1 — repository tree and code layout
