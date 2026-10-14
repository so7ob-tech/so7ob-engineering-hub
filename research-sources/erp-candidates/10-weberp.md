webERP is a genuine, actively maintained open-source web ERP with strong finance, distribution, inventory and conventional manufacturing coverage, but the checked canonical GitHub repository appears behind the official website’s stated current release and its history has no commits after July 2025; treat this as a promising evaluate candidate, not a production-ready selection. The website’s Human Resources claims conflict with the manual/repository evidence, and must not be accepted without hands-on verification. [1] [2] [3] [4]

Checked date: 2026-10-14. Candidate identity: webERP; canonical repository https://github.com/webERP-team/webERP; official website https://www.weberp.org/. Product class: web-based, accounting-led ERP for distribution and manufacturing. The website describes a web-based accounting/business management ERP; the repository README calls it multi-user business administration and accounting software. [1] [2] [3]

## Domain fit by module

- **Finance/accounting — strong core coverage.** The official manual lists General Ledger, Accounts Receivable, Accounts Payable, tax, petty cash, fixed assets and SQL reporting. The feature pages describe supplier/customer accounting and integrated GL postings. This is more than a plug-in claim, though jurisdiction-specific statutory accounting fit is not established here. [2] [4]
- **Procurement — strong core coverage.** The manual covers purchase ordering, supplier tenders and shipments. Official features describe purchase orders, supplier currencies and pricing, approvals, receipts, shipment costing and AP linkage. [2] [4]
- **Operations/inventory — strong core coverage.** Inventory/stock is a manual topic; feature claims include warehouses, serialized and batch-controlled stock, costing, transfers, stocktakes, reordering, sales order/backorder linkage and GL integration. [2] [4]
- **Manufacturing — meaningful but qualify process depth.** The official manual has Manufacturing, Labour, Forecasting, Quality Assurance and Material Requirements Planning topics. Feature pages describe kit/assembly handling and work/job costing; those facts support production-related workflow, but the evidence does not establish a full advanced planning/scheduling or MES capability. [2] [4]
- **Human capital — uncertain/weak pending verification.** The official Features page claims employee records, leave, timesheets, payroll interface, recruitment, training and benefits. The manual page’s topic list includes only “Human resources,” and no matching evidence was verified in repository files or release materials. Do not treat the expansive features-page list as a verified core module or assume payroll is included. [2] [4]

The project website separately identifies webSHOP and CounterLogicPOS as add-on portals; they are not evidence that commerce/POS functions are built into the core. No commercial/Enterprise edition boundary or paid-only functionality was identified on the checked official pages; advertised free/open-source core should not be conflated with externally provided hosting, support or add-ons. [1] [3]

## Edition, license and release status

The repository’s Composer manifest declares `GPL-2.0-only`; README says GPL version 2 and refers to a copy in `doc`. A root `LICENSE` URL returned 404, so the manifest and bundled license should be checked against the exact release and all shipped dependency notices before redistribution. GPL terms are not a blanket commercial-reuse clearance: obtain legal review for intended modification, distribution and network-service deployment. No separate Enterprise edition or pricing schedule was verified. [5] [3]

The official site states that, as of 2026-01-01, current release is v5.0.1 for PHP 8. The repository README still says stable v4.15.2 and “currently RC” latest; GitHub API release endpoint returned an empty list. The latest commits visible in API history are dated 2025-07-05, so repository maintenance as checked on 2026-10-14 is not demonstrated as current. This is a material identity/distribution mismatch: establish whether v5.0.1 source and release artifacts correspond to this exact repository before evaluation beyond a controlled trial. [1] [3] [6] [7]

## Security, dependencies, testing and operations

No repository `SECURITY.md` was found at the expected path; GitHub’s policy URL did not expose a project policy. This is not proof that no private reporting route exists, and no advisory audit was established. The features page advertises role-based access, login lockout, audit trails and sanitization, but such product statements are not a security assessment or assurance. [4] [8]

The root Composer manifest requires PHP `^8.1`, MySQLi and extensions, plus PHPMailer, PhpSpreadsheet, Dompdf, phpxmlrpc and TCPDF; it uses PSR-4 autoloading for `src/`. The declared dependencies provide document/PDF, mail and XML-RPC functionality; bundled vendor code and dependency provenance/version maintenance warrant software-composition and vulnerability review. The manifest’s PHP floor aligns with the official site’s PHP 8 release statement, but README’s old database minimums (MySQL 4.3/MariaDB 5.1) are not a credible contemporary production baseline. [5] [1] [3]

README deployment is conventional PHP web hosting: copy application files to a web root, create a database and run the browser installer; it says Apache, NGINX, lighttpd and Hiawatha have been tested. This is accessible but manual, and official repository evidence reviewed here does not establish a reproducible container deployment. The README describes in-place file replacement upgrades with backups of `config.php` and `companies/`, then prompted database upgrades. [3]

The official manual is broad and includes requirements, security schema, installation, API tutorial and development structure. Repository README points to included manual, contribution conventions and demo. No CI/test workflow or meaningful automated test suite was verified in the repository inspection; this is an evidence gap, not a claim that no tests exist. [2] [3] [9]

## Integrations, localization and Arabic/RTL

Official documentation names EDI and API Tutorial, and the manifest includes `phpxmlrpc/phpxmlrpc`; this supports existence of documented integration surfaces, but does not by itself establish a modern stable REST API or connector ecosystem. webSHOP and CounterLogicPOS are separately described as add-ons. [2] [5] [1]

Official site/feature claims say 37 languages, user-selectable language, UTF-8 support and localized number display. That establishes general i18n intent, not Arabic completeness. Arabic locale availability was not verified by inspection of translation catalogs, and no explicit Arabic locale or RTL layout/bidi behavior was confirmed. Presence of Arabic-capable fonts in bundled TCPDF would not prove application-wide Arabic rendering. Therefore Arabic/RTL is an unresolved deployment gate; test navigation, forms, mixed numeric/Latin text, reports/PDFs and data entry with Arabic content before selection. [1] [4] [5]

## Rubric score and recommendation

Using the shared Hub rubric (100 points), raw weighted score midpoint is **61/100**. Score breakdown is feature completeness/domain fit **16/20**, architecture/reuse **8/15**, maintenance **8/15**, security/dependencies **7/15**, documentation/testing **6/10**, license clarity/suitability **8/10**, setup/deployment **4/5**, integrations/APIs **3/5**, Arabic/i18n/RTL **1/5**. Plausible score range is **48–72** given uncertain repository/release alignment, test/security evidence gaps and unverified Arabic/HR breadth; unknown evidence is not scored as zero by default. Confidence: **medium**. [1] [2] [3] [5] [6] [7] [8] [9]

**Recommendation: evaluate.** The repo/product identity and GPL-2 declaration are materially credible, but exact source for official v5.0.1 needs reconciliation with the lagging repository; then require a supported PHP/database deployment matrix, dependency/advisory review, realistic finance/manufacturing workflow trial, HR module demonstration and Arabic/RTL validation. Seek legal review for license obligations and specialist review for jurisdictional finance requirements. Do not infer certification, legal clearance, security assurance or commercial reuse from public source availability. [1] [3] [5] [8]

## References

[1]: https://www.weberp.org/ "Official webERP website and release statement"
[2]: https://www.weberp.org/Documentation.html "Official webERP manual and topic index"
[3]: https://github.com/webERP-team/webERP "Canonical webERP GitHub repository and README"
[4]: https://www.weberp.org/Features.html "Official webERP features page"
[5]: https://raw.githubusercontent.com/webERP-team/webERP/master/composer.json "Repository Composer manifest"
[6]: https://api.github.com/repos/webERP-team/webERP/releases?per_page=5 "GitHub repository releases API"
[7]: https://api.github.com/repos/webERP-team/webERP/commits?per_page=5 "GitHub repository recent commits API"
[8]: https://raw.githubusercontent.com/webERP-team/webERP/master/SECURITY.md "Expected repository security policy path"
[9]: https://github.com/webERP-team/webERP/tree/master/.github/workflows "Repository CI workflow directory"
