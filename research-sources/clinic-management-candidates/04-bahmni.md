# Bahmni — integrated EMR/HIS distribution for clinics and hospitals

**Checked date:** 2026-10-14  
**Candidate slug:** `bahmni`  
**Candidate class:** Community open-source, self-hosted integrated EMR/HIS distribution. This assessment covers the community source repositories and official documentation, not a hosted enterprise service or a third-party implementation.

## Key findings

- **Verified:** Bahmni is positioned as an integrated EMR and hospital system for low-resource environments. Its official product description names registration, point of care, investigations, and billing, and describes on-site operation without dependence on the Internet. [1] The official wiki describes Bahmni as an OpenMRS distribution and identifies Bahmni LITE v1.0 as the latest stable community release for clinics/small hospitals in that documentation snapshot. [2]
- **Verified:** The distribution composes OpenMRS, OpenELIS, Odoo, DCM4CHEE/PACS, reporting, and Bahmni-specific integration components. The official license page distinguishes Bahmni components from the underlying products and identifies Odoo as a third-party component. [4]
- **Verified:** Clinic workflow evidence covers patient registration, clinical encounters/observations, treatment or drug orders, appointments, laboratory investigations and results, and billing/inventory components. The API design documentation names patient profiles, visits, clinical encounters, diagnoses, lab investigations, procedures, observations, treatments, clinical images, programs, and locations as resources. [14] Appointment documentation shows configurable patient search, service/specialty booking, statuses, and scheduler behavior. [17]
- **Unknown:** The reviewed primary sources do not establish a complete referral workflow, a complete multi-clinic tenancy/organization model, or a current end-to-end pharmacy workflow beyond the documented Odoo/ERP integration. Locations and login-location configuration exist, but that is not proof of full multi-clinic governance.
- **Verified:** The modern frontend is a React/TypeScript monorepo with Carbon Design System, Webpack, Jest/Testing Library, an API service layer, micro-frontend/extensibility documentation, and i18next. [11] The setup guide documents Docker Compose, GitHub Container Registry authentication, PWA/offline capabilities, and production builds. [12]
- **Verified:** Maintenance evidence is current in the checked source snapshot: the deployment/package repository metadata reports a 2026-03-23 push, Bahmni core has a 2026-10-12 commit, and the frontend has a 2026-10-14 commit. [7] [8] [9] [25] The package repository is not marked archived, but its GitHub API release list is empty at check time; therefore maintenance is evidenced by commits rather than a current package-release stream. [7] [10]
- **Verified:** Security reporting guidance exists in core and frontend repositories and directs researchers to report vulnerabilities privately to `security@bahmni.org`, with a linked disclosure process. [15] This is a reporting channel, not evidence of a completed security audit, vulnerability-response SLA, or production security certification.
- **Verified:** Licensing is heterogeneous. The canonical `bahmni-package` repository carries AGPL-3.0-or-later. [3] Bahmni core and the modern frontend carry MPL-2.0 license texts. [5] [6] The official license page says Bahmni components and modifications may be AGPL v3, MPL v2 with a healthcare disclaimer, or MIT, while bundled upstream products retain their own licenses; it also says migration from AGPL v3 to MPL v2 with a healthcare disclaimer is ongoing. [4] Standard AGPL-3.0, MPL-2.0, and MIT are OSI-approved license families. [20] [21] [22] A healthcare-disclaimer variant is not assumed to be OSI-approved merely because standard MPL-2.0 is approved; each repository and distribution must be reviewed before legal adoption.
- **Verified:** The frontend has an extensible i18n mechanism with per-app locale resources and English fallback. [13] **Verified:** a Bahmni community discussion states that Bahmni was not Arabic/RTL-ready at the time of the discussion, although Arabic patient names and registration-card printing were possible, and the 2024 edit points to an RTL work item. [16] **Unknown:** the reviewed primary sources do not prove a completed, current Arabic translation, full RTL layout, or RTL support across OpenELIS/Odoo/PACS.

## Clinic workflow coverage and scope limits

**Verified — registration and patient chart/encounter:** The product page explicitly includes registration and point of care. [1] The API design covers patient profiles, visits, clinical encounters, diagnoses, observations, and treatment resources. [14] OpenMRS roles include registration read/write, visit actions, consultation save, clinical observations, diagnoses, disposition, treatment, and orders. [26]

**Verified — appointments:** Appointments are booked against a service for a patient. The official documentation describes configurable patient search, service and specialty editing, statuses such as scheduled, checked-in, missed, completed, and cancelled, and optional schedulers. [17]

**Verified — prescriptions/treatments:** The API documentation explicitly describes treatments as drug orders and treatment-related observations and supports an `active` operation. [14] This supports prescription/treatment data, but the sources reviewed do not establish jurisdiction-specific e-prescribing, medication reconciliation quality, or pharmacy dispensing compliance.

**Verified — labs and investigations:** Bahmni's product description includes investigations. [1] Its API design includes lab orders, sample accession, and lab results, while the official license page identifies OpenELIS as the bundled laboratory product. [4] [14]

**Verified — billing and related ERP:** The product description includes billing. [1] The official license page identifies Odoo Community as the third-party ERP component used for billing, pharmacy, and inventory contexts in the Bahmni stack. [4]

**Unknown — referrals and complete multi-clinic operation:** Referral management is not demonstrated by the reviewed primary pages. Locations and login-location parameters appear in the API/appointment material, but those facts alone do not prove a complete cross-clinic referral, tenant isolation, master-patient-index, or organization-level administration model.

## Architecture, reuse, deployment, and interoperability

**Verified:** Bahmni reuses and integrates existing open-source products rather than presenting a single monolith. The official organization page describes it as built on OpenMRS, OpenELIS, and Odoo. [23] The package repository describes itself as deployment and RPM packaging, and includes installer, ERP, lab, PACS, reports, offline, embedded-Tomcat, and Docker-related build areas. [24]

**Verified:** The current frontend architecture uses React, TypeScript, Carbon, Webpack, Context API, custom hooks, a service layer for HTTP/API calls, display controls, and micro-frontend-oriented extensibility. [11] The developer guide lists Bahmni server deployment architecture, Atom Feed synchronization, micro-frontends, Bahmni ERP Connect, REST/FHIR APIs, OpenELIS/Odoo integration topics, offline Bahmni Connect, and several test suites. [18]

**Verified:** The current frontend setup guide uses Docker Compose to bring up EMR components, requires Node.js/Yarn/Docker/Git, and documents both mounted production artifacts and hot-reload development. [12] This is a workable engineering setup, but it implies a multi-service operational burden rather than a small single-container clinic install.

**Verified:** Interoperability evidence includes Bahmni REST/FHIR API documentation and resources for patients, visits, encounters, diagnoses, investigations, observations, treatments, programs, locations, and reference data. [14] The developer guide also lists Atom Feed synchronization and OpenMRS interoperability topics. [18] This supports integration potential; it does not by itself prove conformance to a particular national profile or complete bidirectional exchange for every module.

## License and security caveats

**License — verified:** The `bahmni-package` code repository contains the GNU Affero General Public License, version 3 or later. [3] Bahmni core and the modern frontend contain MPL-2.0 texts. [5] [6] The official license page says the overall distribution is a combination of Bahmni-owned components and third-party products with separate license terms, and that an AGPL-to-MPL-with-healthcare-disclaimer migration is ongoing. [4]

**License — inference/operational implication:** A deployment should preserve per-repository notices and produce a component-level bill of materials. The exact obligations can differ between Bahmni modules, OpenMRS, OpenELIS, Odoo, DCM4CHEE/PACS, reporting components, and any local extensions. This note does not provide legal advice.

**Security — verified:** A private vulnerability-reporting channel and disclosure-process link are present in the core repository. [15] Current package maintenance includes a commit removing a local Trivy script in favor of a shared infrastructure utility, which shows security tooling integration work but is not a vulnerability scan result. [8]

**Security — unknown/caveat:** No full dependency audit, penetration test, CVE inventory, support-lifecycle matrix, backup/restore proof, hardening baseline, or security SLA was established from the reviewed primary sources. The use of several upstream systems and older/heterogeneous deployment paths means operators must assess the complete assembled stack, not just `bahmni-package`.

## Arabic, i18n, and RTL

**Verified:** The frontend uses i18next, per-application locale files, language detection, English fallback, and a documented translation workflow. [11] [13]

**Verified:** The reviewed Bahmni community answer says the application was not Arabic/RTL-ready, while Arabic patient names and registration-card printing were possible; its 2024 edit references an RTL work item. [16]

**Unknown:** No reviewed primary source demonstrates a finished Arabic locale, right-to-left layout, bidirectional text correctness, or Arabic/RTL coverage across the integrated lab, ERP, PACS, reports, and offline clients. The Arabic/RTL score therefore remains low despite a reusable i18n mechanism.

## Clinical/regulatory gate

This candidate is **not scored as clinically compliant or production-ready**. The reviewed sources support software scope, integrations, deployment approaches, and community maintenance, but they do not provide a scoped clinical-safety case, medical-device/regulatory authorization, jurisdiction-specific privacy/security certification, validated implementation, or evidence that a given configuration is fit for a particular clinical use. Those are separate adoption gates.

## Weighted screening score

Scores are provisional screening judgments, not endorsements. Missing evidence is treated as unknown rather than as a factual failure.

```json
{
  "feature_domain_fit": 17,
  "architecture_reuse": 13,
  "maintenance": 14,
  "security_dependencies": 8,
  "documentation_tests": 8,
  "license_clarity": 7,
  "setup_deployment": 4,
  "integrations_apis": 4,
  "arabic_i18n_rtl": 1
}
```

- **feature_domain_fit — 17/20:** Strong evidence for registration, point of care, encounters, treatments, investigations/labs, appointments, and billing; referrals and full multi-clinic governance remain unverified.
- **architecture_reuse — 13/15:** Strong modular reuse and integration evidence across OpenMRS, OpenELIS, Odoo, PACS, frontend services, and micro-frontends; the assembled architecture is operationally complex.
- **maintenance — 14/15:** Recent commits across package, core, and frontend repositories; package-level release evidence is weaker than commit evidence.
- **security_dependencies — 8/15:** Private reporting process and security-tooling evidence exist, but no full audit, SLA, hardening proof, or complete dependency-risk assessment was established.
- **documentation_tests — 8/10:** Extensive official wiki/developer material and visible test-oriented repository structure; coverage and pass status for a target deployment are unknown.
- **license_clarity — 7/10:** License files and a central license explanation exist, but the distribution is multi-license, includes third-party components, and is in an ongoing AGPL-to-MPL-with-healthcare-disclaimer transition.
- **setup_deployment — 4/5:** Docker Compose, installer/package repositories, offline-oriented options, and development/production guidance are documented; deployment remains multi-service.
- **integrations_apis — 4/5:** REST/FHIR, Atom Feed, OpenMRS/OpenELIS/Odoo/PACS integration, and extensibility are documented; complete bidirectional interoperability for every workflow is not proven.
- **arabic_i18n_rtl — 1/5:** i18n infrastructure exists, but current full Arabic/RTL support is not evidenced and an RTL work item remains referenced.

**Total:** **76/100**

## Confidence

**Medium confidence.** Product scope, architecture, licensing, deployment, API, security-reporting, maintenance, and Arabic/RTL findings are grounded in official Bahmni repositories and documentation read on the checked date. Confidence is reduced by the distributed product surface, mixed licensing, documentation snapshots, incomplete evidence for referrals/multi-clinic governance, and the absence of a full security or clinical/regulatory audit.

## References

[1]: https://www.bahmni.org/ "Bahmni official product home"
[2]: https://bahmni.atlassian.net/wiki/spaces/BAH/overview "Bahmni Wiki home and community release documentation"
[3]: https://github.com/Bahmni/bahmni-package/blob/master/LICENSE "Bahmni package repository license"
[4]: https://www.bahmni.org/license "Bahmni official license FAQ and component license matrix"
[5]: https://github.com/bahmni/bahmni-core/blob/master/LICENSE "Bahmni core MPL-2.0 license"
[6]: https://github.com/Bahmni/bahmni-apps-frontend/blob/main/LICENSE "Bahmni Apps Frontend MPL-2.0 license"
[7]: https://api.github.com/repos/Bahmni/bahmni-package "Bahmni package repository metadata"
[8]: https://api.github.com/repos/Bahmni/bahmni-package/commits?per_page=10 "Bahmni package recent commits"
[9]: https://github.com/bahmni/bahmni-core/commits/master "Bahmni core commit history"
[10]: https://api.github.com/repos/Bahmni/bahmni-package/releases?per_page=10 "Bahmni package release API"
[11]: https://github.com/Bahmni/bahmni-apps-frontend/blob/main/docs/architecture.md "Bahmni Apps Frontend architecture"
[12]: https://github.com/Bahmni/bahmni-apps-frontend/blob/main/docs/setup-guide.md "Bahmni Apps Frontend setup guide"
[13]: https://github.com/Bahmni/bahmni-apps-frontend/blob/main/docs/i18n-guide.md "Bahmni Apps Frontend internationalization guide"
[14]: https://bahmni.atlassian.net/wiki/spaces/BAH/pages/6488066/Bahmni+REST+API+FHIR+APIs "Bahmni REST API and FHIR API design documentation"
[15]: https://github.com/bahmni/bahmni-core/blob/master/SECURITY.md "Bahmni core security policy"
[16]: https://talk.openmrs.org/t/is-bahmni-supported-for-arabic-or-right-to-left-languages/8335 "Bahmni Arabic and right-to-left language discussion"
[17]: https://bahmni.atlassian.net/wiki/pages/viewpage.action?pageId=2906816519&navigatingVersions=true "Bahmni appointment management documentation"
[18]: https://bahmni.atlassian.net/wiki/spaces/BAH/pages/1310748/Developer+s+Guide "Bahmni Developer's Guide"
[19]: https://github.com/bahmni/bahmni-package "Bahmni package repository"
[20]: https://opensource.org/license/agpl-3-0 "OSI GNU Affero General Public License version 3"
[21]: https://opensource.org/license/mpl-2-0 "OSI Mozilla Public License 2.0"
[22]: https://opensource.org/license/mit "OSI MIT License"
[23]: https://github.com/bahmni "Bahmni official GitHub organization"
[24]: https://github.com/Bahmni/bahmni-package "Bahmni deployment and RPM repository"
[25]: https://github.com/Bahmni/bahmni-apps-frontend/commits/main "Bahmni Apps Frontend commit history"
[26]: https://bahmni.atlassian.net/wiki/pages/viewpage.action?pageId=48889893&pageVersion=4 "Bahmni OpenMRS security and access-control roles"
