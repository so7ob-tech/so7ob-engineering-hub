# PrestaShop (PrestaShop/PrestaShop) — evidence note

**Checked:** 2026-10-14. **Scope:** PHP commerce platform candidate for So7ob Tech. Evidence below is limited to sources opened on that date. Facts are distinguished from assessment; anything not evidenced is marked unknown.

## Candidate and fit

PrestaShop is an open-source e-commerce web application intended to build online stores. The canonical repository describes it as a shopping-cart platform and says its GitHub source is for development and preview; a stable public package should be obtained from its releases page. [1] This is directly in-scope as a PHP commerce platform. The repository metadata categorizes it as PHP and the official developer documentation describes a traditional monolith gradually migrating from custom framework components to Symfony. [1] [3]

**Technology and architecture (verified):** PHP; repository language metrics also list TypeScript, Gherkin, Twig, HTML, JavaScript, Smarty, SCSS, Vue and other web languages. These metrics do not alone establish runtime/framework use for each. Official architecture docs describe monolithic architecture, object-oriented PHP, legacy and modern components, progressive Symfony migration, and domain-driven architecture/CQRS development. [3] [4] The repository README specifies PHP 8.1+ and MySQL 5.6+ (or MySQL-compatible MariaDB/Percona) for PrestaShop 9.0; check version-specific current requirements before deployment. [1]

**Commerce capabilities (verified at category level):** official docs enumerate product, cart, order, customer, category, carrier, tax, stock, store/shop, payment-module, theme/module and multistore domains/resources. The README describes payment-service support and extensibility through modules/themes. This establishes an extensible store engine, not the suitability or quality of any particular integration. [1] [3] [4]

**APIs (verified):** legacy Webservice is a CRUD API that lets third-party tools access shop data. PrestaShop 9 Admin API documentation states it uses API Platform 3, OAuth authorization and CQRS commands for its endpoints. The docs list broad resources including products, customers, orders, stock, shops and taxes. API maturity, coverage parity and support guarantees are not established here. [4] [5] [6]

**Multi-vendor:** unknown/not evidenced as a native first-party marketplace capability in the reviewed sources. Multistore is explicitly documented, but that is not evidence of multiple independent sellers/vendors. [3]

**Internationalization/Arabic/RTL:** official docs describe translation catalogs, language packs and back-office translation tooling. The repository says many languages and localizations. This supports general i18n only; Arabic availability and complete Arabic/RTL front-to-back behavior were not verified. [1] [7]

## Licensing, maintenance and risk

**License (verified):** the exact `LICENSE.md` states PrestaShop Core is OSL-3.0 and PrestaShop Modules are AFL-3.0, and directs readers to the license text and third-party license directory. Composer metadata independently declares OSL-3.0. GitHub API's coarse repository license field says `Other` / `NOASSERTION`, so the actual project license file, not that field, is the useful evidence. [2] [8] **Reuse implication:** commercial reuse is not ruled out by the presence of an open-source license, but OSL-3.0 obligations and scope must be reviewed by counsel for the intended distribution/deployment/modification model; do not assume it is equivalent to a permissive MIT/BSD grant. Modules have a distinct AFL-3.0 designation and bundled dependencies can carry other licenses. This is not legal advice.

**Maintenance (verified snapshot):** GitHub API reported 9,207 stars, repository not archived, pushed 2026-09-12 in repository metadata; latest commit endpoint returned commit `8cc8750d0c76f4d189a7091176bbdade5c9115d8`, dated 2026-10-14 (merge commit). Latest release endpoint returned 9.2.0, published 2026-09-30. Counts and “latest” status are point-in-time and may change. [8] [9] [10]

**Security (verified):** project policy provides private vulnerability reporting by email or bug bounty and says reports are confirmed, affected versions assessed, code checked for related issues, and fixes prepared for releases still maintained; public disclosure generally follows identification and patch readiness. GitHub advisories page displayed multiple 2025–2026 advisories, including several marked High and one Critical. This demonstrates active disclosure/fixes and also a meaningful vulnerability history; it is not evidence of a security audit, absence of vulnerabilities, or present safety. [11] [12]

**Docs/tests:** substantial official developer docs cover core, architecture, testing, modules, themes and APIs. The docs navigation includes a testing section and the releases page includes test changes, but this review did not run the suite or assess test coverage/CI quality. [3] [10]

**Operations (inference):** deploying a PHP/MySQL commerce monolith entails web server, database, package/version configuration, shop installation, modules/themes, upgrades, secrets, backups and security patching. GitHub README mentions Apache/Nginx, database administration and Docker development environment, and warns that updates are nontrivial. This indicates nontrivial operations; it is not a measured deployment effort or production-readiness judgment. [1]

## Provisional score

**71/100**, recalculated from the stated criterion points during catalog integration; this remains a comparative desk-research score, not a certification or deployment verdict.

- Feature fit: **17/20** — direct commerce scope and extensive product/order/customer/cart/stock/tax domains; vendor marketplace capability unverified.
- Architecture/reuse: **11/15** — extensible monolith with modules/themes and Symfony/CQRS migration; legacy coexistence and integration-specific adaptation remain.
- Maintenance: **13/15** — release on 2026-09-30 and commit on 2026-10-14, repository active/not archived; snapshot evidence, not forward guarantee.
- Security/dependencies: **8/15** — responsible disclosure and maintained-release fixes exist, but numerous recent public advisories including critical/high demonstrate real risk; no independent audit/dependency review performed.
- Docs/tests: **8/10** — broad official docs and testing material; no execution or coverage review.
- License clarity: **7/10** — explicit Core OSL-3.0 and Modules AFL-3.0; obligations and dependency licensing need legal review.
- Setup/deployment: **3/5** — documented PHP/MySQL, Apache/Nginx and Docker development; likely appreciable operational work and upgrade burden.
- APIs/integrations: **4/5** — Webservice CRUD and PrestaShop 9 Admin API with OAuth/API Platform/CQRS documented; no fit testing.
- i18n/Arabic/RTL: **0/5** — i18n is established but Arabic/RTL evidence not verified, so no points awarded.

**Recommendation:** evaluate, not adopt on this desk review. Prototype core workflows and APIs on a supported release; test target-market Arabic/RTL, marketplace requirements, module compatibility, security posture and full OSL/AFL/dependency obligations before selection. No claim of production readiness, compliance, security audit, scalability, native multivendor, or complete Arabic/RTL support is made.

## References (URLs opened)

[1] https://github.com/PrestaShop/PrestaShop/ — canonical repository/README.
[2] https://raw.githubusercontent.com/PrestaShop/PrestaShop/develop/LICENSE.md — exact license file.
[3] https://devdocs.prestashop-project.org/9/ — official developer documentation index.
[4] https://devdocs.prestashop-project.org/9/development/architecture/ — official architecture documentation.
[5] https://devdocs.prestashop-project.org/9/webservice/ — official Webservice API documentation.
[6] https://devdocs.prestashop-project.org/9/admin-api/ — official Admin API documentation.
[7] https://devdocs.prestashop-project.org/9/development/internationalization/ — official i18n documentation.
[8] https://api.github.com/repos/PrestaShop/PrestaShop — GitHub repository metadata.
[9] https://api.github.com/repos/PrestaShop/PrestaShop/commits?per_page=1 — latest commit endpoint.
[10] https://github.com/PrestaShop/PrestaShop/releases — releases page (latest API record: 9.2.0, 2026-09-30).
[11] https://www.prestashop-project.org/security/security-policy/ — project security policy.
[12] https://github.com/PrestaShop/PrestaShop/security/advisories — repository security advisories.
