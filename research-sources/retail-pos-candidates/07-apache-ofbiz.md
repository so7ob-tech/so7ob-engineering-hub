# Apache OFBiz (apache/ofbiz-framework) — Retail & POS candidate

**Evidence date: 2026-10-14**  
**Assessment:** ERP/order/catalog platform with POS-adjacent store/channel infrastructure, not established here as a current dedicated POS application. **Provisional score: 58/100. Recommendation: exclude as a POS-first shortlist candidate; retain as an ERP/integration or legacy-adjacent reference for a separately justified evaluation. This is not adoption approval.**

## What it is, and what the evidence does—and does not—show

**Verified project description:** The canonical GitHub repository calls OFBiz an ERP system written in Java, with libraries, entities, services and business features. The official site describes a Java web framework (entity engine, service engine, widget UI) and ERP modules including accounting, CRM, order management/e-commerce, warehousing/inventory, product/catalog, pricing and payments. The official site labels it a scalable, customizable enterprise solution; these are project claims, not independent performance validation. [1] [2]

**POS positioning is mixed and must not be overstated.** Official business-user materials claim “fully integrated online and Point of Sales (POS) stores out-of-the-box,” and describe unlimited stores/catalogs, payments, inventory and returns. The user manual describes a customer physically at a terminal as a “POS Channel” during back-office sales order entry. This is evidence of POS channel/store concepts and order-processing adjacency. It is not enough to prove a contemporary cashier-facing POS application with a complete register workflow. The applications directory shown in the current repository lists accounting, common extensions, content, data model, HR, manufacturing, marketing, order, party, product, security extensions and work effort; no separately named POS application appears in that listing. **Inference:** OFBiz is best classified as an ERP/order/catalog framework with POS-adjacent infrastructure, rather than POS-first. A current standalone or complete cashier POS application was not verified; absence from this directory listing is not proof that no legacy screen/component exists elsewhere. [3] [4] [5]

## Retail workflow and integration assessment

- **Checkout:** Sales order entry, product store selection, sales channel selection, cart/order entry, payment methods and payment processing are documented. POS appears as an order channel, not demonstrated as a purpose-built fast cashier lane interface. [3] [4]
- **Returns/refunds:** User manual documents returns in facility/order processes and payment operations including refunds/manual electronic transactions. Evidence does not establish cashier-side return lookup/receipt validation, exchange workflow, till balancing or register controls. [4]
- **Cash, taxes, drawer, receipt printer, barcode scanner:** Not verified in the opened primary sources as a complete POS workflow or hardware support. Do not infer hardware support from generic payment processing or product catalog features.
- **Payment integration:** Official business-user page claims payment gateway integrations; manual describes payment authorization/capture/refund and gateway responses. Actual provider coverage and current integrations require validation. [3] [4]
- **Inventory/accounting:** Strong ERP adjacency: official materials describe integrated inventory, purchasing, manufacturing and accounting; facilities support locations, receiving, picking/packing, shipping, transfer, returns and physical inventory. [2] [3] [4]
- **Offline/multistore:** Project docs describe Gradle `--offline` for using cached build dependencies after initial setup. This is not transaction/offline POS capability. Project materials claim unlimited stores/catalogs, but no POS data synchronization or offline selling mechanism was verified. [3] [5]
- **APIs/architecture:** Java web framework with entity and service engines, modular components and plugin architecture; this is a plausible foundation for customization/integration. Specific retail POS APIs, peripheral adapters, supported payment terminal protocols and stable integration contracts were not established by the sources opened. [1] [2] [6]
- **Database/runtime:** Current README states JDK 17 and default embedded H2, with external database setup via JDBC and entity-engine configuration; it gives MySQL and PostgreSQL as examples. [1]
- **Arabic/RTL:** **Unknown / not verified.** No Arabic translation coverage, RTL interface behavior, locale-specific retail tax/currency support or language inventory was evidenced in the reviewed sources. Generic Java/i18n capability would not establish these.

## License and obligations

**Verified:** The exact framework `LICENSE` is Apache License 2.0. For redistribution of the work or derivative works, the license requires providing a copy of the license, marking modified files prominently, retaining applicable copyright/patent/trademark/attribution notices, and carrying applicable NOTICE attributions where present. It grants copyright and a conditional patent license, includes a patent-litigation termination clause, grants no trademark rights, and disclaims warranties/liability. Review `NOTICE`, bundled third-party components and each plugin/dependency separately before reuse. [7] The SourceForge project page also states Apache License V2.0, but the repository license is the primary evidence. [8]

## Maintenance, maturity, documentation, operations and security

**Maintenance/release:** Official downloads page identifies **24.09.07, released June 2026**, as the seventh release of the 24.09 series. It says that series has been feature-frozen since September 2024 and receives bug fixes only; the project recommends the most recent stable branch and warns that support for older branches may diminish. This is recent patch maintenance, not evidence of recent POS-specific feature development. The project’s official branch instructions identify 24.09 as stable. [9] GitHub API calls were rate-limited in this environment, so no API-derived commit timestamp or independent release metadata is claimed.

**Docs/tests:** There is extensive official user/developer documentation, including order, facility and payment processes, as well as installation/build instructions. Documentation contains visible “TO CHECK”/uncertainty notes in payment examples, so completeness/modernity is uneven. The project’s release page provides signatures and SHA512 verification. A current test coverage level or POS-specific test suite was not independently assessed. [4] [6] [9]

**Security:** Official security page provides private disclosure instructions and a long vulnerability history. As of the evidence date it lists 2026 CVEs, including entries fixed in 24.09.06 and 24.09.07; 24.09.07 is the current stable release listed by the project. The page states CVE fixes and affected/fixed releases; this is evidence of active disclosure/patching and also material security burden, not a claim that the current release remains vulnerable to those fixed issues. Security model assigns deployers responsibility for securing infrastructure, integrations, endpoints, logs and extensions; default/demo configuration is not production-ready, and plugins may be experimental/reference implementations. [9] [10] [11]

**Deployment burden:** Not a turnkey POS install. Current docs require JDK 17, initializing the Gradle wrapper, building/loading data and operating a Java application; production database, security hardening, peripherals, cashier UI and payment integrations require additional deployment and engineering decisions. [1] [6] [11]

## Provisional score (58/100)

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit | 5/20 | ERP sales channels, stores, payments, inventory and returns exist; cashier POS completeness/hardware workflows unverified. |
| Architecture/reuse | 12/15 | Modular Java framework, entity/service engines and plugins provide substantial extension surface, but POS semantics need custom work. |
| Maintenance | 13/15 | 24.09.07 released June 2026 with security/bug-fix maintenance; series feature-frozen since Sep 2024. |
| Security/dependencies | 6/15 | Current disclosure/patch processes and security guidance, offset by extensive CVE history and significant operator hardening responsibility. |
| Docs/tests | 7/10 | Official user/developer docs and build guidance; no verified POS-specific test evidence, some manual uncertainty. |
| License clarity | 10/10 | Exact Apache-2.0 license available; normal notice/modification and third-party review obligations remain. |
| Setup/deployment | 2/5 | Java/Gradle and database deployment offer documented steps but imply substantial operational and tailoring work. |
| APIs/hardware/integrations | 3/5 | General services/payment gateway integrations evidenced; retail device interfaces and POS-specific APIs unverified. |
| i18n/Arabic/RTL | 0/5 | No Arabic/RTL evidence reviewed; deliberately no generic-i18n credit. |
| **Total** | **58/100** | **Adjacent ERP/framework candidate, not validated POS product.** |

## Recommendation and unresolved checks

Do **not** shortlist OFBiz as a ready/current POS product on the evidence reviewed. Keep it in the knowledge hub as an ERP/order/catalog framework and possible integration foundation. Any future evaluation should first establish the actual current POS user interface/module, cashier speed/returns/cash reconciliation, supported receipt/barcode/drawer/payment hardware, offline transaction/sync semantics, country tax/fiscalization needs and Arabic/RTL behavior. Also inventory current dependencies and plugins and test a hardened deployment. The project is actively maintained and releases security fixes, but its 2026 advisories make patch discipline essential. No adoption approval is implied.

## References (URLs opened)

[1] Canonical repository / README: https://github.com/apache/ofbiz-framework  
[2] Official Apache OFBiz project site: https://ofbiz.apache.org/  
[3] Official Business Users / modules and features: https://ofbiz.apache.org/business-users.html  
[4] Official trunk User Manual: https://nightlies.apache.org/ofbiz/trunk/ofbiz/html5/user-manual.html  
[5] Current applications directory listing: https://github.com/apache/ofbiz-framework/tree/trunk/applications  
[6] Official Developers documentation: https://ofbiz.apache.org/developers.html  
[7] Exact framework license: https://raw.githubusercontent.com/apache/ofbiz-framework/trunk/LICENSE  
[8] SourceForge project page: https://sourceforge.net/projects/ofbiz/  
[9] Official downloads/releases page: https://ofbiz.apache.org/download.html  
[10] Official security policy/advisory list: https://ofbiz.apache.org/security.html  
[11] Repository security model: https://github.com/apache/ofbiz-framework/blob/trunk/SECURITY.md
