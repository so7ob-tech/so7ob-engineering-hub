Core finding: iDempiere is an active, modular Java/OSGi ERP/CRM/SCM project with a strong accounting and transaction-processing foundation and a current supported release line, but public primary-source evidence does not establish a complete, consistently core-available manufacturing and human-capital suite or Arabic RTL readiness. Treat it as an evaluate candidate pending workflow validation and locale testing, not a blanket production or legal approval. Exact repository: https://github.com/idempiere/idempiere. Checked 2026-10-14. Product class: Java/OSGi modular ERP, CRM and supply-chain system. [1] [2]

## Domain fit

- Finance/accounting: Good evidenced fit. The official site explicitly identifies an enterprise-quality accounting system and multiple entities/sets of books. Confirm required local statutory accounting, tax, consolidation and reporting workflows in a proof of concept; the general claim is not jurisdictional certification. [2]
- Procurement: The product is positioned as ERP/SCM and the official community documentation covers user and functional areas, but the reviewed official feature page could not be retrieved sufficiently to verify specific procurement workflows. Treat purchase requisitions, sourcing, approval and supplier workflows as to-be-tested, not assume completeness. [1] [3]
- Operations/inventory: Supply-chain positioning and modular ERP indicate plausible fit, but reviewed primary-source material did not establish a detailed inventory/warehouse feature matrix. Verify lot/serial, valuation, replenishment, multi-warehouse and mobile operations in the target configuration. [1] [3]
- Manufacturing: Public evidence reviewed was insufficient to confirm that manufacturing planning/execution functionality ships as supported core in the current baseline. Manufacturing should be gated on identifying the exact maintained module/add-on, release compatibility and licensing. [1] [3]
- Human capital: No sufficiently clear current official evidence established comprehensive HR/payroll in the core distribution. Community/plugin references are not evidence of included, maintained core functionality. Treat HR/payroll as unverified and potentially extension-dependent. [1] [3]

## License and editions

The canonical repository contains GPL version 2 license text. Public source availability is not a commercial reuse clearance: downstream distribution, modifications, linking/components and network deployment facts require counsel review, and bundled dependency licenses must be inventoried. [4] The official site describes the project as open source and emphasizes no licensing cost; no distinct official paid Enterprise edition/pricing boundary was located in reviewed sources. Hosting, implementation, support and third-party extensions may be separately commercial. Do not infer their license or inclusion from the core repository. [2] [5]

## Maintenance, security and dependencies

At the checked date the default branch had a same-day commit (2026-10-14) addressing a potential NPE, and official SECURITY.md marks release-13 and master (a.k.a. 14) supported. Several older release branches are visible, though branch presence alone does not prove support. GitHub releases page reports no packaged releases; development/release branches therefore require operators to select and pin a source commit/build. [1] [6] [7] Repository parent Maven configuration targets Java 17 and includes modular Maven/Tycho build metadata. [8]

Security policy provides a vulnerability reporting route, but this review did not establish a published advisory inventory, independent audit, or clean current dependency vulnerability status. Treat security posture as unknown pending SBOM/dependency scanning and deployment hardening. [6] The repository points to Jenkins CI and automated testing, contains a test feature and test modules, and includes a SonarQube workflow; this establishes test infrastructure, not a verified passing current build or adequate coverage. [1] [8]

## Architecture, deployment, docs and interfaces

iDempiere uses Java with an OSGi plugin architecture, and official material names ZK, Maven and PostgreSQL/Oracle. This supports extension and modular reuse but entails a substantial platform/build footprint. Official development instructions say a source checkout needs at least 3 GB and document master/development and release-13 checkout paths. The reviewed material did not verify a first-party, reproducible production container recipe; deployment needs database, Java runtime, configuration, operations and backup planning. [1] [2] [3] [8]

Official documentation identifies REST Web Services as production-used and maintained by BX Service GmbH, with source in a separate repository; that page states GPLv2 and reports compatibility through release 12 and master. This API is an extension/integration surface rather than proof every endpoint is bundled in core. [9] Repository CI and extension/plugin systems are documented. [1] [9]

## Arabic, i18n and RTL

The project has translation/localization documentation and a worldwide community, but the inspected primary sources did not provide a current Arabic coverage report, validated Arabic locale bundle, or explicit end-to-end RTL/bidi guarantee. Translation infrastructure must not be conflated with usable Arabic screens or correct RTL behavior. Score conservatively and require native-speaker review, locale-specific data formats and visual testing across core and plugins. [2] [10]

## Risks and recommendation

Main gates: (1) workflow evidence for procurement, warehouse, manufacturing and HR/payroll, clearly separating core from add-ons; (2) prove Arabic and RTL in real screens/documents; (3) pin supported release and complete dependency/security review; (4) obtain legal review of GPLv2 and all extension/dependency licenses; and (5) assess jurisdictional financial controls. No claim here constitutes certification, legal clearance or security assurance. Recommendation: **evaluate**, confidence **medium**. Conditional progression to a controlled proof of concept only after fit, license, security and deployment gates pass. Evidence status is limited for specialized operations, HR, Arabic and dependency security.

## Score

Using the shared 100-point rubric in its specified order and weights (20, 15, 15, 15, 10, 10, 5, 5, 5), provisional score_breakdown is feature_domain_fit 13/20; architecture_reuse 13/15; maintenance 14/15; security_dependencies 7/15; documentation_tests 7/10; license_clarity 7/10; setup_deployment 3/5; integrations_apis 3/5; arabic_i18n_rtl 1/5. Midpoint: 68/100. Plausible range: 58–78, reflecting unresolved functional/module-boundary and Arabic evidence and unverified security/dependency condition. Unknowns are not treated as zero; confidence is medium because core identity, activity, supported versions and license have primary evidence, while several decision-critical modules and operational assurances remain unverified. [11]

## References

[1]: https://github.com/idempiere/idempiere "Canonical iDempiere repository"
[2]: https://idempiere.org/ "Official iDempiere website"
[3]: https://wiki.idempiere.org/en/Main_Page "Official iDempiere wiki"
[4]: https://github.com/idempiere/idempiere/blob/master/LICENSE.md "iDempiere repository GPL-2.0 license text"
[5]: https://idempiere.org/ "Official iDempiere project and licensing positioning"
[6]: https://github.com/idempiere/idempiere/blob/master/SECURITY.md "iDempiere security policy"
[7]: https://github.com/idempiere/idempiere/releases "Canonical repository releases page"
[8]: https://github.com/idempiere/idempiere/blob/master/org.idempiere.parent/pom.xml "iDempiere parent Maven build configuration"
[9]: https://wiki.idempiere.org/en/REST_Web_Services "Official wiki REST Web Services page"
[10]: https://wiki.idempiere.org/en/Translation "Official iDempiere translation documentation"
[11]: https://github.com/idempiere/idempiere/blob/master/SECURITY.md "Repository maintenance/security policy used with the shared scoring rubric"