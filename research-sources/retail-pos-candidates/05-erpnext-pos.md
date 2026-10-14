# ERPNext POS candidate — evidence note

**Evidence date:** 2026-10-14  
**Candidate:** ERPNext (frappe/erpnext), examined narrowly as ERP suite with embedded POS—not POS-first.  
**Decision status:** Provisional screening only; not an adoption approval.

## Finding

ERPNext is a broad, actively maintained ERP with a retail Point of Sale module integrated with stock and accounting. It is a direct product-type fit for the requested scope, rather than hospitality-adjacent or infrastructure-only. POS transactions use customer, item, warehouse, payment, tax and accounting configuration managed in the ERP. The trade-off is substantial ERP deployment and operations overhead compared with a focused checkout product.

**Recommendation: evaluate.** It merits a controlled functional and deployment evaluation where integrated ERP inventory/accounting is a requirement. Do not assume an offline-capable, hardware-ready till: this review did not establish those capabilities for the first-party POS. Security advisories published shortly before the evidence date are a material review and patch-management concern, not evidence that current patched releases remain vulnerable.

## Evidence and attribution

- **Verified repository fact:** GitHub repository API identifies `frappe/erpnext` as public, not archived, default branch `develop`, Python primary language, GPL-3.0, created 2011-06-08, pushed 2026-09-23T06:50:41Z; 39,478 stars and 12,893 forks in the fetched snapshot. These are repository metadata, not a measure of POS quality. [1]
- **Project claim / official docs:** ERPNext describes itself as an open-source ERP; its README foregrounds accounting and order/inventory management. [2]
- **Verified official-doc behavior:** POS profile configures company, warehouse, payment methods, customer, price list, taxes, accounts, receipt print format and checkout settings. The POS profile doc says POS allows use “to some extent” for paid Sales Invoice. It documents returns payment-method settings, partial payment, receipt preview on completion, stock validation and tax configuration. [3]
- **Verified official workflow:** POS session opens with an opening entry that can capture opening cash; checkout submits a POS Invoice; closing entry posts stock and accounting. Loyalty earning/redemption is documented. [4]
- **Project claim:** Official POS introduction says stock updates in real time, offers multiple payment methods, inventory/accounting integration, and real-time or deferred posting according to session closing. [5]
- **Verified licensing fact:** Exact `license.txt` on develop begins GNU General Public License Version 3. [6] GitHub API also reports SPDX GPL-3.0. [1]
- **Verified operations evidence:** Official Frappe installation requirements show a *nix server, supported Debian/Ubuntu or macOS, MariaDB, Python, Node, Redis/Valkey, Yarn and additional dependencies; v16/develop requirements differ from v14/v15. [7]
- **Verified API evidence:** Frappe framework docs expose Python/JavaScript APIs and REST API documentation. This is platform API evidence, not proof of a specific POS peripheral connector. [8]
- **Verified security evidence:** ERPNext has a published responsible-disclosure policy. Its advisory page displayed ten advisories dated Sep 18–20, 2026, including critical/high/moderate severity reports describing SQL injection, XSS, unauthorized access/data modification, and related missing-validation issues. [9] This source page is a time-sensitive listing; review each advisory and patched version before evaluation. No claim is made that all ten remain unfixed on 2026-10-14.
- **Recency / maturity:** release page showed v16.35.0 at retrieval, with extensive change notes including POS accounting fixes; this indicates active release engineering. [10] GitHub push timestamp independently supports recent development. [1]
- **Unknown / not established:** no conclusive official evidence retrieved for an offline mode of the first-party POS, multi-store retail behavior in the sense of multi-location tills, cash-drawer kick, certified receipt printers, integrated card terminals, or Arabic RTL usability. The user community claim around custom offline POS must not be attributed to core ERPNext. Do not infer RTL from translation/i18n generally. Barcode scanner-specific POS behavior was not established by the opened evidence. No quantitative tests/coverage result was verified in this source pass.

## Workflows and fit detail

**POS workflows (verified):** select POS profile, customer, items and quantities; pay using configured mode(s); submit invoice. Opening/closing entries provide session boundaries and optionally opening cash; closing posts stock/accounting. Official profile docs cover returns as a payment-mode configuration, receipt preview/print format, partial payment, price edits/discount controls and taxes. They do not establish a cash-count/reconciliation workflow beyond opening/closing entries or a dedicated cash-drawer control.

**Inventory and accounting (strong):** warehouse selection and stock validation are configurable; official material describes live stock update and/or deferred posting at session close. POS profile defines price list, tax templates/categories, change/write-off/income/expense accounts, accounting dimensions; close entry posts stock and accounting. This integration is the candidate’s strongest fit.

**Hardware/peripherals (unknown):** receipt print format and browser print preview are evidenced, but no specific printer protocol, drawer kick, scanner integration, payment terminal/acquirer, or supported device matrix was verified. A generic print layout is not evidence of thermal-printer or drawer control.

**Offline / multiple locations (unknown with caveat):** the official first-party pages opened here did not establish offline sale capture or conflict-safe sync. Treat as online-dependent unless a version-specific first-party test proves otherwise. Multiple company/warehouse configuration exists, but “multistore” retail operation, centralized versus disconnected stores and cross-store stock semantics need hands-on validation.

**Language/Arabic/RTL (unknown):** no authoritative evidence was obtained for Arabic UI coverage and correct RTL behavior for POS, receipt layouts and navigation. Treat Arabic/RTL as unverified; do not score it as supported on the basis of generic localization.

## License and reuse obligations

ERPNext source is GPL-3.0-only as identified by GitHub metadata, and the repository license file is GPLv3. GPLv3 permits use, modification and distribution, including commercial distribution, but conveying covered modified software imposes source-availability and license-preservation obligations; modified source distributions require prominent notices of modifications and dates, and the whole covered work must be licensed under GPLv3. Interactive interfaces have legal-notice requirements in the circumstances specified by GPLv3. Mere network interaction without conveying a copy is not itself conveying under GPLv3 section 0; hosted-service facts and any separate distribution still need counsel’s review. Preserve copyright/license/warranty notices and assess bundled dependencies, custom apps, branding/trademarks and integration boundaries separately. This is a research summary, not legal advice. [6]

## Maintenance, docs, security, operation

Release v16.35.0 and Sep 2026 repository activity indicate current maintenance and mature release history, not stale/legacy-only status. [1][10] Official docs cover POS profiles and workflows; the repository/official installation guide support operational onboarding, but an ERPNext deployment requires the Frappe stack and infrastructure rather than a standalone till binary. [2][7] Test-suite existence or quantitative coverage was not independently verified here; treat quality/coverage as a validation gap, not as absent tests. Frappe has REST and framework APIs, making extension/integration plausible, but POS-specific device integration remains unproven. [8]

Security reporting is documented, and the visible advisory count/severity merits a security review. For evaluation, pin a supported release, verify fixes and dependency advisories, establish upgrade cadence, and test permissions/tenant boundaries. Advisory existence is evidence of disclosure activity and reported vulnerabilities; it is neither a vulnerability-free guarantee nor proof of current exposure. [9]

## Provisional score (76/100)

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit | 18/20 | Strong checkout, payment modes, returns setting, tax, receipt preview, session and stock/accounting workflows. Deduct for unverified offline and dedicated till hardware. |
| Architecture/reuse | 12/15 | Mature modular Python/JS ERP framework, extension and API surfaces; significant platform coupling and not a lightweight embeddable POS. |
| Maintenance | 14/15 | Recent pushes and v16 releases with substantial change notes. |
| Security/dependencies | 7/15 | Maintained disclosure policy but ten recent advisories, including critical/high reports; platform dependency footprint is meaningful. |
| Docs/tests | 8/10 | Useful official POS and installation docs; tests/coverage quality not verified. |
| License clarity | 9/10 | Explicit GPLv3 license file and matching GitHub SPDX metadata; copyleft and dependency/custom-app boundary require diligence. |
| Setup/deployment | 3/5 | Official documented deployment path, but many services/runtime requirements and upgrade/operations burden. |
| APIs/hardware/integrations | 4/5 | REST/framework APIs and ERP integration are strong; hardware specifics remain unknown. |
| i18n/Arabic/RTL | 1/5 | Localization/RTL for Arabic POS unverified; minimal credit only for no unsupported assumption. |
| **Total** | **76/100** | **18 + 12 + 14 + 7 + 8 + 9 + 3 + 4 + 1 = 76** |

## Sources actually opened

[1] GitHub repository API metadata: https://api.github.com/repos/frappe/erpnext  
[2] Canonical repository / README: https://github.com/frappe/erpnext and https://github.com/frappe/erpnext/blob/develop/README.md  
[3] Official POS Profile documentation: https://docs.frappe.io/erpnext/pos-profile  
[4] Official POS workflows: https://docs.frappe.io/erpnext/pos-workflows  
[5] Official POS introduction: https://docs.frappe.io/erpnext/user/manual/en/point-of-sale  
[6] Exact repository license: https://raw.githubusercontent.com/frappe/erpnext/develop/license.txt  
[7] Official Frappe installation requirements: https://docs.frappe.io/framework/user/en/installation  
[8] Official Frappe API documentation: https://docs.frappe.io/framework/user/en/api  
[9] ERPNext security policy and advisory listing: https://github.com/frappe/erpnext/security/policy and https://github.com/frappe/erpnext/security/advisories  
[10] GitHub release history: https://github.com/frappe/erpnext/releases

**Source-access caveats:** SourceForge URL attempted but returned 404 JSON; omitted from evidence. Official language and barcode pages were attempted but did not return extractable content, so no support claim is made. The GitHub release page was retrieved at the evidence date and displayed v16.35.0; confirm current tag/branch compatibility against the intended stack before testing.