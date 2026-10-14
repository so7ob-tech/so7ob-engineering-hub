# Odoo Point of Sale (Community) — evidence note

**Evidence date: 2026-10-14.** Candidate: `odoo/odoo`, specifically Community ERP and its `point_of_sale` add-on. This is a provisional domain-candidate assessment, not adoption approval. Labels: **Verified** = directly supported by opened source; **Project claim** = statement made by Odoo, not independently validated here; **Inference** = evaluator conclusion; **Unknown** = not established from opened evidence.

## Identity and fit

**Verified:** Odoo describes itself as a suite of web-based business apps, including POS, CRM, warehouse, billing/accounting, and says its apps integrate as a full ERP. Thus it is an **ERP module with genuine retail POS capability**, not a POS-first standalone product, not merely hospitality software, and not infrastructure-only. POS supports shops and restaurants, so it is also hospitality-adjacent. [1] [2] [3]

**Fit judgement:** Strong candidate for an integrated retail ERP/POS option; less suitable if the hub is specifically cataloguing focused POS-first products. Do not classify it as a restaurant-only product. Community POS lives in the Community repository under `addons/point_of_sale`. [4]

## Product evidence

Official POS documentation describes browser-based operation, continued functionality during temporary network outages, shop and restaurant functions, customer self-ordering, products and combos, barcodes, ship-later orders, cash/card/customer-account/QR/payment-terminal methods, and session/order reporting. [2] Checkout is evidenced by POS register workflows; the shop documentation explicitly describes quotations/orders, full settlement or down payments, and ship-later delivery-order creation. Barcode scans add products and can apply discounts. [5]

**Verified:** Barcode support and a range of external payment terminals are documented; a configured terminal automatically validates successful payment, while failed connectivity cancels the transaction or allows a forced completion. [5] [6] The module page says browser POS works with touch devices and that barcode scanners/printers are supported, with scales, cashboxes, and other peripherals available through a proxy API. [4]

**Caution on peripherals:** The module page's broad compatibility/support wording is a **project claim**, not proof of every model, operating system, or current support status. Cash drawer support is only asserted in the module README/proxy statement; printer configuration specifics were not independently verified in this pass. Payment terminal providers vary by deployment/region; no universal terminal list is asserted here. [4] [6]

**Verified:** Official material and module README describe POS-to-inventory/accounting integration, real-time inventory and financial reporting; shop ship-later creates a warehouse delivery order. [2] [4] [5] Exact accounting posting/configuration depends on other Odoo modules and configuration. The README also claims multiple stores can consolidate and deploy store assortments/pricing. [4]

**Offline/multistore:** Official documentation promises continued functionality during temporary outages. The module README makes the stronger claim that an internet connection is required to start a POS session, but it remains operational after complete disconnection. Treat offline operation as a project claim with an important startup/connectivity condition; offline synchronization/conflict semantics and duration are **unknown** here. Multi-store consolidation is claimed by the module README, not a guarantee of standalone multi-tenant store architecture. [2] [4]

**Returns/cash/tax:** POS documentation sections cover payment methods and shop workflows, but the opened pages did not provide sufficiently specific evidence for detailed return/refund treatment, cash opening/closing controls, or tax calculation workflows. Do not assume these are absent; mark precise behavior/configuration **unknown in this evidence pass**.

## Technical, maintenance, and governance

**Verified:** Odoo is a Python application using PostgreSQL; 19.0 documentation sets PostgreSQL 13+ and Python 3.10+ requirements. Source installs require Python packages/system dependencies and configuration, and official installation guidance warns that pip dependency handling may create security/broken-dependency problems. [7] **Inference:** Production deployment is materially more involved than installing a standalone till: database, application stack, configuration, backups, upgrades, and likely specialist administration are required.

GitHub repository metadata, opened on the evidence date, reports default branch `19.0`, latest push `2026-09-22T13:41:11Z`, repository not archived, and 54,516 stars. No tagged GitHub Releases are shown; Odoo uses version branches, so absence of GitHub Releases does not mean no maintained releases. [8] The public repo description calls it an open-source business app suite. [1]

**License:** Exact repository `LICENSE` identifies GNU LGPL version 3; official licensing documentation states Odoo 19 Community is LGPLv3 and contrasts Enterprise under Odoo Enterprise Edition License v1.0. Enterprise requires a valid subscription for use and prohibits publishing/distributing/sublicensing/selling copies; Enterprise add-ons are not Community-licensed merely because they run on the Community server. [9] [10] For Community redistribution/modified distribution, comply with LGPLv3 including license notices and applicable source/relinking obligations for covered/combined works; review component-level third-party licenses. This is not legal advice. Check each add-on's own license and do not mix in Enterprise code or proprietary Odoo Apps without rights.

**APIs:** Odoo 19 documentation introduces JSON-2 over HTTP. It also says XML-RPC/JSON-RPC are deprecated and scheduled for removal in Odoo 22 (fall 2028). The docs state external API availability is restricted to Custom pricing plans in Odoo's hosted plans; self-hosted deployment licensing/entitlement must be checked separately. [11]

**Docs/tests:** Official user and developer documentation is broad and versioned, including POS operations, external API, and installation. [2] [5] [7] [11] The `point_of_sale` repository module is visible and substantial. This assessment did not execute its automated test suite or audit test coverage; coverage/CI status is **not verified**. [4]

**Security:** Odoo publishes a responsible-disclosure channel and software security overview, describing code review and framework protections. These are vendor claims, not an independent audit. [12] The GitHub repository security-advisories page opened but exposed no advisory records/content in this rendering; this is **not evidence that no vulnerabilities exist**. No CVE/advisory inventory or dependency audit was performed. [13] Security posture therefore merits further review despite active maintenance.

**Arabic/RTL:** Official docs establish that additional languages can be installed and assigned to users. They do not, in the opened sources, establish Arabic POS coverage, right-to-left layouts, RTL receipt formatting, or Arabic numerals in this POS version. Mark all Arabic/RTL specifics **unknown**; generic translation support is not evidence of RTL usability. [14]

## Provisional score (same 100-point rubric)

| Criterion | Points | Basis |
|---|---:|---|
| Feature fit | 17/20 | Broad retail POS workflows and ERP integration; precise tax/returns/cash details not verified |
| Architecture/reuse | 13/15 | Modular Python ERP, Community POS add-on, LGPL; large integrated platform rather than focused POS component |
| Maintenance | 15/15 | Active, non-archived repository with 2026-09-22 push and current 19.0 branch |
| Security/dependencies | 10/15 | Disclosure channel and published security practices; no independent audit/advisory/dependency assessment; complex stack |
| Docs/tests | 8/10 | Extensive official docs; test execution/coverage not assessed |
| License clarity | 10/10 | Explicit Community LGPLv3 vs separate Enterprise license and clear official explanation |
| Setup/deployment | 3/5 | Officially documented but PostgreSQL/Python/system dependencies and operations burden |
| APIs/hardware/integrations | 4/5 | JSON-2 API, payment terminals, barcodes/printers/peripheral proxy documented; provider/device caveats and hosted API plan limits |
| i18n/Arabic/RTL | 1/5 | General language management verified; Arabic/RTL POS evidence absent |
| **Total** | **81/100** | Provisional; no adoption approval |

## Recommendation

**Evaluate** as an active, mature **ERP-with-POS** candidate for a retail engineering knowledge hub, with an explicit adjacent-category label rather than presenting it as POS-first. Do not mark as legacy/stale: repository metadata shows recent activity. Before any adoption decision, test the target Community version end-to-end for refunds, cash control, tax/local fiscal requirements, Arabic RTL UI and receipts, actual peripherals/payments, offline resynchronization, and self-hosted API entitlements; audit current vulnerabilities, dependencies, module tests, and migration/deployment burden. No approval to adopt is given.

## References

[1]: https://github.com/odoo/odoo "Odoo Community repository overview"
[2]: https://www.odoo.com/documentation/19.0/applications/sales/point_of_sale.html "Odoo 19 Point of Sale documentation"
[3]: https://www.odoo.com/documentation/20.0/applications/sales/point_of_sale.html "Odoo 20 Point of Sale overview"
[4]: https://github.com/odoo/odoo/tree/19.0/addons/point_of_sale "Community POS add-on README and source"
[5]: https://www.odoo.com/documentation/19.0/applications/sales/point_of_sale/shop/barcode.html "Odoo POS shop features and barcode documentation"
[6]: https://www.odoo.com/documentation/19.0/applications/sales/point_of_sale/payment_methods/terminals.html "Odoo POS payment terminals documentation"
[7]: https://www.odoo.com/documentation/19.0/administration/on_premise/source.html "Odoo source installation documentation"
[8]: https://api.github.com/repos/odoo/odoo "GitHub repository metadata API"
[9]: https://raw.githubusercontent.com/odoo/odoo/19.0/LICENSE "Exact Odoo Community repository LICENSE (19.0)"
[10]: https://www.odoo.com/documentation/20.0/legal/licenses.html "Odoo Community and Enterprise licensing documentation"
[11]: https://www.odoo.com/documentation/19.0/developer/reference/external_api.html "Odoo 19 external API documentation"
[12]: https://www.odoo.com/security "Odoo software security and responsible disclosure"
[13]: https://github.com/odoo/odoo/security/advisories "Odoo repository GitHub security advisories"
[14]: https://www.odoo.com/documentation/19.0/applications/general/users/language.html "Odoo language management documentation"
