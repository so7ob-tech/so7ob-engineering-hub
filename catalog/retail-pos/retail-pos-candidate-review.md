# Retail & POS Candidate Review

**Evidence basis:** supplied candidate-level findings only. **Evidence date referenced by the supplied findings:** 2026-10-14. No additional browsing, testing, source validation, or product trial was performed for this synthesis.

## Executive view

This is a **provisional comparison of unlike systems**, not an adoption ranking. The scores use the supplied criterion weights and are useful for screening only; they should not be read as proof that an ERP with a POS module is a better till than a POS-first product, or that a restaurant POS is a general retail platform.

The candidates fall into materially different categories:

- **POS-first retail/web products:** Open Source Point of Sale (OSPOS), WallacePOS, NexoPOS, and Chromis POS.
- **POS-first but hospitality-oriented or hospitality-adjacent:** uniCenta oPOS and Floreant POS. uniCenta spans retail and hospitality; Floreant is primarily restaurant POS and is only retail-adjacent.
- **ERP suites with an embedded POS module:** ERPNext POS, Odoo Point of Sale (Community), and Dolibarr TakePOS.
- **POS-adjacent ERP/order/integration infrastructure:** Apache OFBiz. It has order, catalog, inventory, payments, and accounting capabilities and describes POS stores/channels, but the supplied evidence did not establish a current dedicated cashier-ready POS application.

### Provisional score overview

| Candidate | Category | Score | Evidence-led disposition |
|---|---|---:|---|
| [Odoo Point of Sale (Community)](../../research-sources/retail-pos-candidates/06-odoo-pos.md) | ERP suite with POS module | **81/100** | Active ERP-with-POS candidate; validate Community scope, offline behavior, hardware, security, and Arabic/RTL. |
| [NexoPOS](../../research-sources/retail-pos-candidates/09-nexopos.md) | POS-first retail web application | **79/100** | Active, directly relevant retail POS; resolve license contradiction and validate devices/workflows. |
| [ERPNext POS](../../research-sources/retail-pos-candidates/05-erpnext-pos.md) | ERP suite with POS module | **76/100** | Strong integrated inventory/accounting case; offline and peripheral support remain unverified. |
| [Open Source Point of Sale (OSPOS)](../../research-sources/retail-pos-candidates/01-ospos.md) | POS-first retail web application | **74/100** | Recently maintained and direct fit; security findings, license footer constraint, offline/multistore, and hardware require gates. |
| [Dolibarr TakePOS](../../research-sources/retail-pos-candidates/08-dolibarr-takepos.md) | ERP/CRM suite with POS module | **67/100** | Active ERP-integrated POS; important printer, offline, returns, and RTL gaps. |
| [Apache OFBiz](../../research-sources/retail-pos-candidates/07-apache-ofbiz.md) | POS-adjacent ERP/order infrastructure | **58/100** | Useful integration foundation, not established as a current dedicated cashier POS. |
| [Floreant POS](../../research-sources/retail-pos-candidates/10-floreant-pos.md) | POS-first restaurant/hospitality POS | **49/100** | Hospitality reference/adjacent candidate; release, license, and security uncertainty. |
| [uniCenta oPOS](../../research-sources/retail-pos-candidates/02-unicenta-opos.md) | POS-first retail/hospitality POS | **47/100** | Conditional legacy evaluation pending exact source/release/license/security provenance. |
| [Chromis POS](../../research-sources/retail-pos-candidates/03-chromis-pos.md) | POS-first desktop retail POS | **42/100** | Legacy-only reference; incomplete source/license/security evidence. |
| [WallacePOS](../../research-sources/retail-pos-candidates/04-wallacepos.md) | POS-first web POS | **37/100** | Legacy/reference-only; maintainer explicitly says it is not actively maintained. |

**Important:** Equal-looking scores across categories do not mean equivalent products. For example, OFBiz's 58 reflects strong ERP/infrastructure and license signals but very weak evidence of a current cashier POS, while Floreant's 49 reflects a real restaurant till with weak general-retail, release, and reuse evidence.

## Cross-candidate decision gates

### 1. Offline operation is mostly unproven

Do not equate a desktop client, embedded database, browser access, or a claim of “offline sales” with a safe disconnected checkout design. The supplied evidence does not verify local transaction persistence, retry behavior, synchronization, conflict resolution, duplicate prevention, or store-level recovery for any candidate.

- **OSPOS, ERPNext, NexoPOS, Dolibarr TakePOS, OFBiz:** no verified offline-first/disconnected checkout contract.
- **Odoo:** official materials describe temporary operation during network outages, but synchronization/conflict semantics remain unknown.
- **WallacePOS:** the official site claims offline sales and release notes mention offline backup, but robust synchronization is unverified.
- **Floreant:** claims non-cloud/offline operation and documents embedded Derby; offline multistore synchronization remains unknown.
- **uniCenta and Chromis:** local/desktop operation does not establish safe offline synchronization or multistore behavior.

Treat offline as **unmet until demonstrated in a version-pinned test**.

### 2. Multistore is usually a claim, not a verified operating model

Multi-user, multi-terminal, multi-location, multiple warehouses, multiple companies, and multiple stores are different capabilities. The supplied evidence does not establish a complete multistore model—including store authorization, price/catalog separation, stock ownership, central reporting, offline synchronization, or conflict handling—for any candidate.

- Odoo describes multi-store consolidation as a project claim; the evidence does not validate it.
- ERPNext documents company/warehouse configuration, but not disconnected store synchronization or full multistore till semantics.
- NexoPOS's MultiStore is a separate marketplace module, not core.
- Dolibarr documents multiple terminals and says multi-company needs an external module; this is not proof of multistore.
- uniCenta advertises multi-location, but the synchronization model is unknown.
- Floreant documents single-terminal Derby and multi-terminal Derby server; HQ/multistore replication is unknown.
- OSPOS, WallacePOS, Chromis, and OFBiz do not have verified multistore checkout synchronization in the supplied findings.

### 3. Hardware and printing remain a major implementation risk

Generic “printer,” “barcode,” “payment,” or “peripheral” language is not a compatibility matrix. The evidence rarely identifies models, drivers, operating systems, fiscal requirements, terminal certification, cash-drawer kick behavior, or failure handling.

- **OSPOS:** names Star TSP 100 ECO receipt and Zebra LP 2824 Plus label printers. Advanced/autoprint options have legacy browser/add-on dependencies. Cash-drawer options are mentioned but broad compatibility is not proven; scanners and payment terminals remain unverified. The hardware-support wiki page returned no readable content.
- **uniCenta:** advertises Epson/compatible and Star printers, scanners, scales, iButton, mag-card readers, customer displays, kitchen displays, and payment integrations. These remain project claims without tested model compatibility or payment certification.
- **Chromis:** claims barcode, USB printers, remote kitchen printing, and kitchen-screen support; no substantiated drawer protocol, payment terminal integration, or named compatibility matrix.
- **WallacePOS:** claims ESC/POS printers, cash drawers, USB scanners, and hosted Tyro EFTPOS; exact models, drivers, non-hosted payments, and current compatibility are unverified.
- **ERPNext:** documents browser print preview and print formats, but no certified thermal-printer protocol, drawer kick, scanner behavior, or payment-terminal integration was established.
- **Odoo:** documents barcode scanners, printers, touch devices, payment-terminal configuration, and some peripheral paths; specific models, regional providers, and actual compatibility remain unverified.
- **OFBiz:** no primary-source evidence established retail scanners, receipt printers, drawers, terminals, or adapters.
- **Dolibarr TakePOS:** browser printing can use common USB/LAN/Wi-Fi printers; serial ESC/POS is not supported through the default route. A Receipt Printer module, network gateway, Java connector, or Java Hardware Bridge may be involved; some bridge paths are deprecated/incomplete. Drawer, scale, and terminal support is not evidenced.
- **NexoPOS:** barcode/SKU and scale barcode/PLU are documented. A marketplace print server/adapter supports multi-device/direct Windows ESC/POS-compatible thermal printing, but general drawer and card-terminal certification is not established.
- **Floreant:** claims thermal and routed kitchen printing, kitchen display, per-terminal drawers, barcode/customer display/scale integration, and a payment gateway path; models, protocols, and payment integrations remain unknown.

A hands-on peripheral matrix is a prerequisite for any adoption decision.

### 4. Security signals are material and uneven

A clean-looking advisory page is not evidence of no vulnerabilities, and a disclosed advisory is not by itself evidence that the latest stated release remains vulnerable. The supplied findings support a **patch-verification and dependency-audit gate** rather than a binary safe/unsafe conclusion.

- **OSPOS:** ten advisories were listed on 2026-10-02, including a critical authenticated OS command execution issue and high-severity access-control issues, plus XSS/validation/race issues. Version 3.4.2 notes many security fixes and advises upgrade. Active disclosure is positive, but the recent findings are material.
- **ERPNext:** ten advisories were listed in September 2026, including critical/high/moderate SQL injection, XSS, unauthorized access, and data-modification findings. A responsible-disclosure policy exists; affected versions and fixes require review.
- **OFBiz:** has a private vulnerability-reporting policy and multiple 2026 CVEs/fixes associated with 24.09.06/24.09.07. This indicates active maintenance and a continuing hardening burden.
- **WallacePOS:** Tenable documented CVE-2019-3958 persistent authenticated XSS, CVE-2019-3959 CSRF, and CVE-2019-3960 authenticated unrestricted upload leading to PHP RCE. A 1.4.3 hotfix addressed items, but login-form CSRF reportedly had no solution; current support is absent.
- **NexoPOS:** public advisory API was empty, not proof of no vulnerabilities. Release history discloses prior unauthenticated migration execution/API permission issues and subsequent authorization hardening. No independent audit was performed.
- **uniCenta:** official 5.3.1 release reports 24 critical issues found/fixed through Trivy/Snyk scans, involving XStream, Spring, XMLGraphics, JasperReports, PostgreSQL, and Derby. This is a maintainer report, not independent validation; current community-source inclusion is unknown. No SECURITY.md/security policy was found in the examined GitHub security page.
- **Chromis:** no SECURITY.md policy or advisory details were surfaced. This does not prove absence of vulnerabilities.
- **Odoo:** responsible-disclosure instructions and framework protections are published; no records were disclosed by the opened repository advisory rendering. No independent audit, CVE inventory, or dependency audit was performed.
- **Dolibarr:** a security policy exists, with scope limited to current stable versions/recent majors or develop and a stated reporting process. It does not use GitHub Security Advisories; the advisory endpoint did not yield readable records. No zero-vulnerability conclusion is justified.
- **Floreant:** no SECURITY.md or repository advisory details were surfaced. The mirror describes historical dependency fixes, including Log4j-era work; current SBOM and vulnerability status are unknown.

### 5. Arabic and RTL are unresolved across the portfolio

No candidate earned strong Arabic/RTL evidence. Generic translation infrastructure, language lists, locale controls, message files, or an RTL stylesheet do **not** establish Arabic completeness or correct bidirectional behavior across the till, administration screens, numerals, tax/currency display, printed receipts, barcode labels, and reports.

- **OSPOS:** multilingual/Weblate infrastructure evidenced; Arabic translation status and RTL layout were not evidenced.
- **uniCenta:** 17-language claim and Spanish history do not establish Arabic/RTL.
- **Chromis:** locale controls/files exist; Arabic/RTL is unknown.
- **WallacePOS:** alternate-language printing and a bundled RTL stylesheet do not establish Arabic or end-to-end POS/admin RTL.
- **ERPNext:** language support is documented, but Arabic POS/receipt RTL was not established.
- **Odoo:** language selection support is documented; Arabic coverage and RTL behavior are unknown.
- **OFBiz:** no verified Arabic/RTL evidence.
- **Dolibarr:** Arabic appears in a project language list, but TakePOS completeness and RTL are unverified.
- **NexoPOS:** localization infrastructure is indicated, but Arabic/RTL is unknown.
- **Floreant:** Arabic message-file example exists, but a maintained Arabic locale and RTL behavior are unverified.

Arabic/RTL should therefore be a **direct acceptance test**, not a score assumption.

## Candidate assessments

### POS-first retail and web candidates

#### Open Source Point of Sale (OSPOS) — 74/100

**Fit and posture.** OSPOS is a genuine POS-first PHP/CodeIgniter 4 web application for retail. Supplied documentation lists a sale register, returns, cash-up, taxes, inventory, receivings, quotations/invoices, customers/suppliers, receipts, barcodes, permissions, gift cards, rewards, and reporting. It is not an ERP module or infrastructure-only component, although restaurant tables are listed as a hospitality-adjacent feature.

**Maintenance and release evidence.** The latest stable release shown was **3.4.2, published 2026-10-02**; an unstable 3.4.3 master build was posted 2026-10-14 and described as potentially buggy. Verified signed commits were shown on 2026-10-14. This is a strong current signal, but it does not establish a guaranteed long-term cadence.

**License/reuse.** The exact canonical LICENSE is MIT with additional explicit terms. Copies/substantial portions must retain notices, and the extra condition requires the project footer signature—version, commit hash, and opensourcepos.org link—to remain visible on every page and unmodified. This is a material white-label/rebranding constraint requiring legal review. A conflicting SourceForge label was found; the supplied findings appropriately favor the canonical repository license pending counsel.

**Security and gaps.** Ten advisories were listed on 2026-10-02, including critical authenticated OS command execution and high-severity access-control issues. Version 3.4.2 reports many security fixes. Verify the exact patched version and independently review dependencies. Offline checkout, multistore operation, payment terminals, scanner compatibility, broad cash-drawer compatibility, accounting/GL integration, test depth, SBOM, and Arabic/RTL remain unverified. The printing documentation names Star TSP 100 ECO and Zebra LP 2824 Plus; legacy browser/add-on dependencies weaken confidence in advanced/autoprint workflows.

**Recommendation.** Keep in active evaluation behind license, security, peripheral, offline, multistore, and Arabic/RTL gates. It is one of the strongest direct retail fits in the supplied set, but the score is not adoption approval.

**Score check:** 18+11+14+9+8+6+3+3+2 = **74/100**.

#### NexoPOS — 79/100

**Fit and posture.** NexoPOS is a current Laravel/Vue POS-first retail web application. Supplied evidence covers checkout, orders, payments, receipts, refunds, registers, taxes, customer balances, partial/unpaid orders, stock-tracked products, barcodes, scale barcode/PLU, procurement, COGS, low-stock alerts, stock history, reporting, REST API, and modules. Gastro and MultiStore are separate marketplace add-ons, not core features.

**Maintenance and release evidence.** The repository was active and unarchived, with a push reported on **2026-10-14**. Latest release **v6.2.4 was published 2026-10-02** and included POS, procurement, payment, refund, cash-register, tax, and authorization changes. This is a strong current-maintenance signal.

**License/reuse.** The exact LICENSE and GitHub metadata say **GPL-3.0**, while composer.json declares MIT. This is a material contradiction. Do not rely on the composer field as a license grant; resolve it with the maintainer and audit dependencies, marketplace modules, and add-ons separately before reuse or redistribution.

**Security and gaps.** The public advisories API was empty, but that is not proof of no vulnerabilities. Release history discloses prior unauthenticated migration execution/API permission issues and later authorization hardening. No independent audit was performed. Offline checkout/synchronization, cash-drawer kick, payment terminals, Arabic/RTL, statutory tax correctness, and test coverage depth remain unverified. Printing requires validation of the separate print-server/adapter path and target Windows ESC/POS devices.

**Recommendation.** Retain as a leading active retail-POS candidate for a proof of concept. Resolve the license contradiction first, then test checkout, returns, cash registers, tax behavior, target printers/scales/drawers/terminals, offline requirements, and Arabic/RTL. Do not treat Gastro or MultiStore add-ons as included core capability.

**Score check:** 17+12+14+11+8+8+3+4+2 = **79/100**.

#### Chromis POS — 42/100

**Fit and posture.** Chromis is a Java desktop POS-first application with separate till and back-office apps. It claims multi-sale modes, tiered pricing, variable-price/weight barcodes, product import, customers/loyalty/gift cards, suppliers, stock, reports, roles, USB printers, remote kitchen printing, and kitchen-screen support. It is retail-oriented with hospitality-adjacent features.

**Maintenance and release evidence.** GitHub releases were empty. The newest observed SourceForge application artifact was **version 1.5.3hf1, JAR modified 2024-07-15**; release notes called V1.5.3 were dated 2023-10-05. A 1.5.4 docs timestamp is not evidence of a 1.5.4 application release. The GitHub repository appeared to contain one 2025-08-01 “Start of commits ready for GitHub” commit; later metadata timestamps are not proof of source activity.

**License/reuse.** The official page claims GPLv3-or-later, but the GitHub API license field is null and the standard root LICENSE URL returned no content. Full-repository and bundled-component licensing therefore remain ambiguous.

**Security and gaps.** No SECURITY.md policy or advisory details were surfaced. This does not establish safety. Returns, drawers, payment terminals, offline/multistore, API documentation, tests/CI, dependency audit, Arabic/RTL, and bundled dependency rights remain unverified. The supplied evidence supports a legacy-only stance.

**Recommendation.** Exclude from an active shortlist; retain as a historical Java desktop POS reference. Reconsider only after confirming upstream source activity, license applicability, dependency posture, and tested retail workflows/peripherals.

**Score check:** 14+8+3+4+5+3+2+2+1 = **42/100**.

#### WallacePOS — 37/100

**Fit and posture.** WallacePOS is a POS-first self-hosted PHP web POS with browser till, administration dashboard, catalog/suppliers, CSV import, VAT/tax settings, sales/void/refund reporting, receipt/invoice templates, and historical offline-sales claims. It is retail-first with an old kitchen-terminal feature.

**Maintenance and release evidence.** The README explicitly says the project is **no longer actively maintained** and invites a new maintainer. The latest visible release endpoint showed v1.4.3 with apparent metadata inconsistency: release object timestamps in June 2019 but published_at 2017-04-11. A security-fix commit was dated 2019-06-25; last repository push metadata was 2023-01-18, which is not evidence of support.

**License/reuse.** Exact repository LICENSE.txt is LGPL-3.0. The supplied reuse notes also flag incorporated GPLv3 terms as applicable. Distribution, source, relinking, and bundled-third-party obligations require legal review.

**Security and gaps.** Tenable documented CVE-2019-3958 (persistent authenticated XSS), CVE-2019-3959 (CSRF), and CVE-2019-3960 (authenticated unrestricted upload leading to PHP RCE). The 1.4.3 hotfix addressed issues, but login-form CSRF reportedly had no solution. No current audit, support process, dependency scan, robust offline sync, multistore, Arabic/RTL, cash reconciliation, accounting, or current hardware compatibility was established.

**Recommendation.** Exclude from active evaluation; retain only as a legacy/reference example unless a supported fork demonstrates current runtime compatibility, security remediation, and maintained testing.

**Score check:** 12+6+1+1+3+9+2+2+1 = **37/100**.

### Retail/hospitality POS and hospitality-adjacent candidates

#### uniCenta oPOS — 47/100

**Fit and posture.** uniCenta is a Java POS-first product spanning retail and hospitality. It advertises multi-user, multi-terminal, and multi-location operations, product/customer/inventory management, taxes, reports, receipt layouts, multiple printers, scanners, scales, mag-card/iButton devices, customer displays, REST APIs, and plugins. Changelog history also records restaurant tables, kitchen/remote displays, customer/order/product APIs, and WooCommerce integration.

**Maintenance and release evidence.** Evidence is mixed. The official changelog lists **5.4.0 in August 2025** and 5.3.2 in March 2025. SourceForge identifies v5.0 as the latest community release, while a search index surfaced a 5.5.1 entry dated 2026-09-26 that the opened source page did not display; it is unverified. The examined GitHub repository was an old v3.70 (2014) tree, and GitHub API inspection was rate-limited. Community-versus-supported release/source provenance is unresolved.

**License/reuse.** Official site and repository README claim GPL-3.0, while SourceForge metadata simultaneously lists GPLv3, LGPLv3, and Public Domain. The exact chosen archive, file-level notices, dependencies, plugins, payment SDKs, and source-to-binary correspondence must be verified.

**Security and gaps.** The official 5.3.1 release reports 24 critical issues found/fixed through Trivy/Snyk scans, including issues in XStream, Spring, XMLGraphics, JasperReports, PostgreSQL, and Derby. There is no verified current SBOM, CVE mapping, or proof that the public community build contains all fixes. Offline buffering, sync/conflicts, multistore semantics, current hardware/payment matrix, returns/refunds, cash close, tests/CI, Arabic, and RTL remain unknown.

**Recommendation.** Conditional legacy-only evaluation of an exact, checksum-pinned source snapshot. Do not approve adoption from public evidence alone.

**Score check:** 14+8+5+5+5+4+3+3+0 = **47/100**.

#### Floreant POS — 49/100

**Fit and posture.** Floreant is a POS-first Java **restaurant/hospitality** product, not a general retail platform. Evidence covers dine-in tables, order/ticket editing, split checks, modifiers, discounts/coupons, void approval, drawer assignment/reconciliation, tips, tax/tax-inclusive pricing, kitchen printers/displays, and reported offline/non-cloud operation. General retail breadth, returns, centralized multistore, and modern integrations are not established.

**Maintenance and release evidence.** GitHub releases were empty. SourceForge showed **floreantpos-2.0-build2001.zip dated 2026-05-23** and 1.5.0 build1958 dated 2026-03-23, while official installation documentation still said the latest stable was 1.4 build1707. The repository is a manually synced mirror that warns it may lag upstream SourceForge SVN. Repository maintenance, including a 2026-07-23 push and dependency updates, is not proof of upstream feature cadence.

**License/reuse.** It uses a nonstandard **MRPL 1.2** (modified MPL 1.1 with an attribution clause, according to the supplied findings). The LICENSE points to a broken historical URL; exact full text, attribution exhibits, third-party coverage, and distribution obligations require legal validation. Commercial licensing is also mentioned.

**Security and gaps.** No SECURITY.md or advisory details were surfaced. The mirror mentions historical Log4j-era and HttpComponents work; current SBOM/vulnerability status is unknown. Arabic message-file examples exist, but Arabic completeness, RTL, numerals, receipts, current JDK compatibility, payment terminals, returns/refunds, multistore sync, tests, and API details remain unverified.

**Recommendation.** Keep only as a hospitality-adjacent reference candidate. Do not elevate it to a general retail shortlist without resolving release/license/security provenance and proving the required retail workflows.

**Score check:** 12+7+9+5+5+5+3+2+1 = **49/100**.

### ERP suites with embedded POS modules

#### Odoo Point of Sale (Community) — 81/100

**Fit and posture.** Odoo Community 19.0 is an actively maintained Python/PostgreSQL ERP suite with POS in `addons/point_of_sale`. Supplied official materials cover shop and restaurant workflows, catalog/combos/barcodes, quotation and sales-order settlement, down payments, ship-later deliveries, cash/card/customer-account/QR/payment-terminal methods, self-ordering, sessions, and sales reporting. Temporary operation during network outages is described, but complete offline synchronization behavior is not proven.

**Maintenance and release evidence.** The repository’s default branch was 19.0, with latest push metadata **2026-09-22** and an unarchived repository. No GitHub Releases entries were reported. Active maintenance is supported; POS-specific quality is not thereby guaranteed.

**License/reuse.** Community code is LGPLv3. Enterprise Edition uses a separate Odoo Enterprise Edition License and requires a valid subscription. Do not combine the Community score with Enterprise modules or proprietary Apps without separately verifying rights.

**Security and gaps.** Odoo publishes responsible-disclosure instructions and framework-protection statements. The opened repository advisory rendering disclosed no records, which is not proof of no vulnerabilities. No independent audit or dependency review was performed. Returns/refunds, opening/closing cash controls, exact tax behavior, device model matrix, payment-provider availability, offline resynchronization, API entitlements, tests/coverage, and Arabic/RTL are not fully established. Deployment requires Python, PostgreSQL, dependencies, configuration, backup/upgrades, and operational expertise.

**Recommendation.** Evaluate as an active ERP-with-POS candidate where integrated inventory/accounting and broader business functions are central. Do not compare its 81 directly with a standalone till score; validate Community-only scope and operational burden.

**Score check:** 17+13+15+10+8+10+3+4+1 = **81/100**.

#### ERPNext POS — 76/100

**Fit and posture.** ERPNext is an actively maintained broad ERP whose first-party POS creates POS Sales Invoices through POS Profiles. Evidence documents company, warehouse, payment methods, customer, price list, taxes, accounts, print formats, stock validation, partial payments, returns/payment methods, opening/closing sessions, loyalty points, and stock/accounting posting on close. It is an ERP module, not a standalone till.

**Maintenance and release evidence.** The releases page displayed **v16.35.0** when checked on 2026-10-14; the repository was public, unarchived, and pushed 2026-09-23. Verify the exact ERPNext/Frappe branch compatibility before evaluation.

**License/reuse.** GPL-3.0. Conveying covered modified software generally entails source availability, notices, modification/date notices, and GPL licensing; dependencies, separately distributed apps, and trademarks require separate review.

**Security and gaps.** Ten advisories were listed in September 2026, including critical/high/moderate SQL injection, XSS, unauthorized access, and data modification findings. A disclosure policy exists, but affected versions and fixes require review. Offline POS, cash drawers, thermal protocols, scanners, payment terminals, multistore semantics, test coverage, and Arabic/RTL were not established. Deployment is ERP-grade, involving a supported Unix-like environment, database, Redis/Valkey, Python, Node, Yarn, bench, and ongoing administration.

**Recommendation.** Evaluate when integrated inventory/accounting is a primary requirement. Treat online dependence, hardware, offline, multistore, security patching, and Arabic/RTL as acceptance gates. No adoption approval is implied.

**Score check:** 18+12+14+7+8+9+3+4+1 = **76/100**.

#### Dolibarr TakePOS — 67/100

**Fit and posture.** Dolibarr is an active PHP ERP/CRM suite containing the separately activated TakePOS module. The supplied documentation claims touch/responsive POS, parallel sales, multiple terminals/payment modes/sessions, barcode readers, QR ordering, shop/bar/restaurant use, cash-box opening/closing, and stock decrement. The ERP core provides inventory, invoices, payments, and accounting-related capabilities. It is not POS-first.

**Maintenance and release evidence.** Latest release API evidence showed **24.0.1 published 2026-09-07**; latest commit API evidence showed a 2026-09-13 commit. The maintenance signal is strong.

**License/reuse.** GPL-3.0-or-later, with bundled dependencies potentially under other licenses. Preserve notices and meet corresponding-source and other GPL obligations when conveying covered modifications.

**Security and gaps.** A security policy exists and limits eligible scope to current stable versions/recent majors or develop; the project says it does not use GitHub Security Advisories and publishes through other routes. No advisory-free conclusion is justified. Hardware evidence is particularly nuanced: browser printing can work with common USB/LAN/Wi-Fi printers, but default serial ESC/POS is not supported; separate printer modules/gateways or deprecated/incomplete bridges may be needed. Offline sync, returns/refunds, voids, tax rounding, drawer/payment terminals, Arabic/RTL, and TakePOS-specific tests remain unverified. Multi-terminal does not establish multistore; multi-company needs an external module.

**Recommendation.** Evaluate as an ERP-integrated POS, not as a plug-and-play standalone till. Require a version-pinned pilot covering cash, returns, tax, stock/accounting effects, printers/drawers/terminals, Arabic/RTL, and concurrent terminals.

**Score check:** 12+11+13+9+6+9+3+2+2 = **67/100**.

### POS-adjacent ERP/order infrastructure

#### Apache OFBiz — 58/100

**Fit and posture.** OFBiz is an extensible Java ERP/enterprise-automation framework with order management, product/catalog, pricing/promotions, stores/sales channels, inventory/warehouse, receiving/transfers/returns, accounting, payments, and plugin/customization architecture. It describes POS stores/channels and manual material describes a customer at a terminal as a POS channel. However, the supplied evidence did not establish a current dedicated cashier application, complete till close/reconciliation, receipt exchange workflow, or retail hardware support. It should not be treated as equivalent to a ready POS.

**Maintenance and release evidence.** The official downloads page identified **24.09.07, released June 2026**, the seventh release of the 24.09 series. The series is feature-frozen since September 2024 and receiving bug fixes only; older branch support may diminish. GitHub API calls were rate-limited.

**License/reuse.** Apache-2.0. Reuse requires the license, applicable NOTICE attribution, modified-file notices, and separate dependency/plugin review. No trademark rights are implied.

**Security and gaps.** A private vulnerability-reporting policy and multiple 2026 CVEs/fixes in 24.09.06/24.09.07 indicate active security maintenance, but also a material deployer hardening burden. No POS-specific test evidence, hardware adapters, offline selling/sync, Arabic/RTL, current API details for a till, or current POS application was established. Build/deployment requires JDK 17, Gradle, database configuration, production hardening, and additional engineering.

**Recommendation.** Exclude from a ready/current POS-first shortlist. Retain as an ERP/order/catalog/accounting integration foundation or infrastructure reference, subject to proving a cashier-ready application before any POS decision.

**Score check:** 5+12+13+6+7+10+2+3+0 = **58/100**.

## License and reuse summary

| Candidate | Supplied license position | Material reuse caution |
|---|---|---|
| OSPOS | MIT plus explicit canonical LICENSE terms | Preserve the visible, unmodified footer signature on every page; white-label/rebranding is constrained. |
| uniCenta oPOS | GPL-3.0 claimed, but SourceForge labels conflict | Verify exact archive, file-level licenses, plugins, assets, and source-to-binary correspondence. |
| Chromis | GPLv3-or-later claimed; root license evidence incomplete | Do not assume the project claim covers all bundled components. |
| WallacePOS | LGPL-3.0, with incorporated GPLv3 terms flagged | Review combined-work, source, relinking, notices, and third-party obligations. |
| ERPNext | GPL-3.0 | Apply GPL conveyance/source/notice duties; review dependencies, apps, and trademarks separately. |
| Odoo Community | LGPLv3; Enterprise separately licensed | Do not include Enterprise code or proprietary Apps under Community assumptions. |
| OFBiz | Apache-2.0 | Retain notices/NOTICE and review dependencies/plugins; no trademark rights. |
| Dolibarr | GPL-3.0-or-later | Preserve notices and meet GPL source/license duties; audit dependencies. |
| NexoPOS | LICENSE/GitHub say GPL-3.0; composer.json says MIT | Resolve contradiction before reuse; audit modules, marketplace add-ons, and dependencies. |
| Floreant | Nonstandard MRPL 1.2 claim | Validate full text, attribution exhibits, coverage, broken historical URL, and third-party terms with counsel. |

This table is a screening summary, not legal advice or a license opinion.

## Suggested next-stage validation sequence

1. **Freeze exact artifacts:** record repository commit/tag, release archive checksum, database/runtime versions, and included modules/add-ons.
2. **Run retail workflows:** sale, split/partial tender, returns/refunds, voids, tax rounding, discount/price authorization, cash open/close, receipt reprint, and end-of-day reconciliation.
3. **Run peripheral trials:** named barcode scanner(s), scale/PLU if needed, receipt/label printers, cash drawer, customer display, and target payment terminal/acquirer. Record OS/browser/driver behavior and failure recovery.
4. **Test offline explicitly:** disconnect during login, cart, tender, receipt, and recovery; measure local persistence, duplicate prevention, resync, conflicts, and multi-store behavior.
5. **Test Arabic/RTL directly:** till navigation, product/customer screens, numerals, currency/tax presentation, reports, receipt/label output, mixed Arabic/Latin text, and cursor/input behavior.
6. **Perform security review:** verify advisory fixes against the pinned artifact, generate an SBOM, inspect dependency CVEs, confirm disclosure/support channels, and harden deployment defaults.
7. **Resolve licensing:** obtain the exact license texts and third-party notices for the selected build; pay particular attention to OSPOS footer terms, uniCenta/Chromis ambiguity, NexoPOS MIT/GPL contradiction, and Floreant MRPL provenance.
8. **Re-score only after evidence closure:** preserve the supplied provisional scores as the baseline; update criterion-level scores with dated test evidence rather than treating the current numbers as final procurement rankings.

## Bottom line

The strongest **direct retail POS** evidence in this supplied set is OSPOS and NexoPOS, but each has a material gate: OSPOS's recent security disclosures and restrictive visible footer condition; NexoPOS's GPL/MIT contradiction and unverified device/offline/RTL behavior. ERPNext, Odoo, and Dolibarr are better framed as **ERP-integrated POS** options where stock/accounting integration justifies ERP deployment overhead. uniCenta, Chromis, WallacePOS, and Floreant require careful legacy, provenance, or hospitality labeling; Floreant in particular should not be mistaken for a general retail platform. OFBiz is best treated as **POS-adjacent infrastructure**, not a ready cashier product.

Across all candidates, **Arabic/RTL, robust offline synchronization, multistore semantics, exact hardware/payment compatibility, and current dependency posture remain decision-critical unknowns**. No candidate receives adoption approval from this evidence alone.
