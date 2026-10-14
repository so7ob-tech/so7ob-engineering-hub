# Bahmni — evidence note (2026-10-14)

**Candidate:** Bahmni (`Bahmni/bahmni-docker`)  
**Category:** Integrated hospital suite  
**Care scope:** Integrated EMR and hospital information system spanning registration, point-of-care records, investigations, billing, and related hospital workflows; built around OpenMRS and complementary systems. This describes project scope, not a validation of clinical performance.

> **Discovery caveat:** The official project describes an integrated EMR and hospital system; this repository is the project's deployment/source organization. Candidate discovery only. This note makes no claim of clinical safety, legal compliance, certification, or production readiness.

## Findings

### Scope and clinical setting
Bahmni describes itself as an easy-to-use EMR and hospital system integrating open-source products. Its official site names registration, point-of-care, investigations, and billing, and describes modular, hospital-hosted use, including operation without Internet dependence.[1] The official deployment docs distinguish **Bahmni Standard**, the full hospital deployment (EMR/OpenMRS, OpenELIS, Odoo and PACS), from **Bahmni Lite**, intended for clinics and small hospitals and offering EMR plus billing with OpenMRS and Crater.[2] The repository itself supplies Docker Compose configurations and scripts for those deployments.[3]

This is an integrated hospital suite, not merely an ambulatory EHR, standalone LIS, or FHIR/openEHR infrastructure project. Official descriptions support patient registration, clinical point-of-care, investigations and billing. The broader product composition documents laboratory and PACS/radiology subsystems, and Odoo ERP/billing; specific order, medication, admission, encounter, imaging interpretation, and end-to-end workflow behavior will depend on distribution and local configuration and should be verified in a deployment rather than inferred from the component names.[1][2]

### Technology, database and deployment
The documented Standard stack includes Bahmni UI/OpenMRS, OpenELIS, Odoo 16 by default (with an Odoo 10 variant noted), and DCM4CHEE PACS; Lite uses OpenMRS and Crater. Compose profiles can run the EMR alone or selected services, and the docs also describe Metabase plus Bahmni-Mart analytics, with MART storing extracted data in PostgreSQL.[2] The Lite instructions mention a preloaded CIEL concept database image tagged `clinic-config-mysql5.6`; this is configuration-specific evidence, not proof all supported installations require that database engine/version.[2]

Deployment instructions require Git, Docker and Docker Compose, provide `.env` profiles, `docker compose pull/up`, helper scripts for start/stop/logs/pull/reset, and backup/restore scripts are present in the Standard directory.[2][4] The published Docker package uses a self-signed certificate by default, with instructions to bypass the browser warning for evaluation; this is a setup warning and not a production TLS recommendation.[2] The docs describe a stable Lite image tag 1.0.0 alongside `latest` development images; the repository page's README calls out the stable image and points to wiki instructions.[3] Review exact image tags, secrets, network exposure, TLS termination, storage, backup restoration, upgrade/migration path and support matrix before deployment. The reviewed sources did not establish a comprehensive supported upgrade policy or backup/restore test evidence.

### Interoperability and data model
The official standards page states that FHIR is exposed through underlying OpenMRS components and describes the OpenMRS FHIR module as a translation layer mapping OpenMRS's custom model to FHIR resources. It explicitly says that module supports FHIR R4 and DSTU3; this is a statement about the referenced OpenMRS module, not a claim that every Bahmni release implements every FHIR resource/profile.[5] The same page documents historical/integrated use of ATOMFeed, HL7 and DICOM across components, HL7 v2 ORM order messages and ORU responses in some cases, and terminology/reference mappings involving LOINC, ICD-10 and SNOMED. It also describes CIEL/OCL terminology and a Snowstorm SNOMED FHIR terminology integration.[5]

These are specific project/community claims with differing scope and maturity. Confirm interfaces, versions, profiles, conformance tests and enabled modules in the intended release. No claim is made here of complete FHIR conformance, universal HL7 coverage, or openEHR support.

### Maintenance and release evidence
The repository's newest observed commit on the evidence date was 2026-10-07, updating the Semgrep workflow; another same-day commit improved pruning of scheduled image-scan snapshots.[6] The repository Releases page displayed no formal releases.[7] The README and docs refer to the Bahmni Lite 1.0.0 image tag, but that is not a GitHub release of this deployment repository.[2][3] Recent activity indicates maintenance, including security scanning workflow changes, while the lack of tagged repo releases limits a simple version/release cadence assessment.

### Security, privacy and dependencies
The repository security page instructs users to report vulnerabilities privately to `security@bahmni.org`, and links a disclosure process. That process describes private discussion, remediation, fix testing and advisory publication; the reviewed GitHub advisories page did not display a repository advisory listing.[8][9] Absence of a visible advisory listing is not evidence that the full stack has no vulnerabilities. The project consists of multiple independently maintained products and container images; review of this deployment repository alone cannot establish vulnerability status of all transitive dependencies or deployed image digests.

The official FAQ says Bahmni is typically installed at the hospital and that the hospital/government is custodian of patient data, while implementers have no rights to it.[10] This is a project statement about custody, not a technical privacy guarantee or legal compliance finding. The sources reviewed did not document a complete, version-specific permission matrix, audit-log coverage, encryption-at-rest policy, retention controls, breach response for a facility, or privacy impact assessment. Evaluate OpenMRS roles, subsystem access controls, audit events, secrets, database access, backup handling and network perimeter individually. Local/on-premises hosting is available but does not itself establish privacy or security.

### License and commercial boundary
The exact `LICENSE` file in this repository is MIT, copyright OpenMRS Inc. (2024).[11] That license governs this repository's contents; it must not be mistaken for a single license covering the whole Bahmni distribution. The official Bahmni license FAQ says Bahmni-specific components, modifications and deployment automation are generally AGPL-3.0, while integrated products retain their own licenses; it lists OpenMRS MPL 2.0, OpenELIS AGPL-3.0, Odoo Community LGPL-3.0 for version 9 onward (with older versions AGPL-3.0), JasperReports LGPL, and DCM4CHEE MPL/GPL/LGPL.[12] The FAQ itself disclaims legal-advice status. Confirm each component/version and its license notices with counsel. The official FAQ says the software is free and implementers may charge for implementation services.[10]

### Localization, documentation and quality evidence
Bahmni published an official account of an Arabic/RTL effort, describing RTL/Arabic localization and workflow integration across academic hospitals, with WHO and UK RAEng funding.[13] This establishes that an RTL implementation exists as a project effort; it does not establish that it is bundled, maintained, complete, or supported in the exact Docker images reviewed. Confirm language coverage, translated clinical terminology/content, locale, numerals, bidirectional rendering, reports and input workflows in the target distribution.

Documentation covers Docker startup, profiles, Lite/Standard distinctions and components, with wiki guidance and public FAQ.[2][4][10] The repository includes configuration scripts and CI/security-scan work, but the reviewed sources did not establish clinical workflow test coverage, a release-specific validation report, or certification test results. The FAQ describes implementation as involving local needs assessment, configuration, rollout, staff training and support, consistent with a configurable platform rather than an out-of-the-box validated installation.[10]

### Certification, compliance and clinical safety
An official Bahmni interoperability page claims ABDM certification in India and references an India FHIR/HL7 profile.[5] The reviewed page did not provide the certification scope, version, certificate evidence or current validity in enough detail to independently assess it. No evidence reviewed establishes HIPAA, GDPR, ONC certification, or clinical safety certification; none is inferred from features or standards support. Clinical safety, local legal compliance, and production readiness remain **unverified**.

## Desk-research screen

Scores are screening judgments only; they are not a recommendation, certification, or safety assessment. The nine integer components total **77/100**.

| Criterion | Score | Rationale |
|---|---:|---|
| Hospital/EHR fit (20) | 17 | Integrated EMR plus documented hospital workflows and lab/PACS/billing components; implementation details remain configurable. |
| Interoperability/data model (15) | 12 | Specific FHIR/HL7/DICOM and terminology claims, but component/version-specific coverage and conformance need verification. |
| Maintenance (15) | 14 | Recent repository activity as of the evidence date; no formal repository releases shown. |
| Security/privacy/dependencies (15) | 9 | Private vulnerability reporting and security scanning activity; end-to-end stack security, controls and dependency posture unverified. |
| Docs/tests (10) | 8 | Useful deployment and product documentation; no reviewed release-specific clinical validation or test coverage evidence. |
| License clarity (10) | 8 | Exact repo license and official component-license overview available; multi-component obligations require version-by-version review. |
| Setup/deployment (5) | 4 | Docker Compose profiles and operational scripts documented; production TLS, upgrades and restore validation need work. |
| Arabic/localization/RTL (5) | 4 | Official RTL/Arabic deployment account, but inclusion/support status for reviewed release unclear. |
| Clinical/regulatory evidence (5) | 1 | Official ABDM-certification claim noted, but scope/version not independently established; clinical safety unverified. |
| **Total** | **77** | Desk-research screening score only. |

## References

[1]: https://www.bahmni.org/ "Bahmni official product site"
[2]: https://bahmni.atlassian.net/wiki/spaces/BAH/pages/3117744129 "Getting Started Quickly with Bahmni on Docker"
[3]: https://github.com/Bahmni/bahmni-docker "Bahmni Docker repository"
[4]: https://github.com/Bahmni/bahmni-docker/tree/master/bahmni-standard "Bahmni Standard deployment files"
[5]: https://bahmni.atlassian.net/l/cp/jmFCp6eZ "Bahmni Continued Support for Open Global Standards"
[6]: https://api.github.com/repos/Bahmni/bahmni-docker/commits?per_page=5 "Bahmni Docker recent commit history"
[7]: https://github.com/Bahmni/bahmni-docker/releases "Bahmni Docker GitHub releases"
[8]: https://github.com/Bahmni/bahmni-docker/security "Bahmni Docker security policy"
[9]: https://bahmni.atlassian.net/wiki/spaces/BAH/pages/884277257/Security+-+Reporting+and+Discussion "Bahmni security reporting and discussion"
[10]: https://www.bahmni.org/faq "Bahmni official FAQ"
[11]: https://github.com/Bahmni/bahmni-docker/blob/master/LICENSE "Bahmni Docker repository LICENSE"
[12]: https://www.bahmni.org/license "Bahmni license FAQ"
[13]: https://www.bahmni.org/campaigns/view-campaign/UDu3FO0wT1mOJ3aN-b0Q0aOUgBXfPsUKgzRCfWTIz_QRpS6HMR4bbO7yGgaWb0gOEw_-0hYmn6TDclrKLcPcMXeXMHTgocwu "Bahmni RTL/Arabic localization account"
