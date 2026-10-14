# EHRbase — clinical data repository infrastructure

**Evidence date: 2026-10-14.** Category: Clinical data repository infrastructure. Care scope: open-source openEHR backend/clinical data repository for applications that store and query structured clinical records; **not** a turnkey EHR or hospital suite. Discovery caveat: the official documentation identifies EHRbase as an open-source backend implementing openEHR APIs. It is included as relevant clinical-record infrastructure, not as a complete hospital information management system (HMIS) or ambulatory EHR. [1] [2]

## What it is and is not

The canonical repository describes EHRbase as an openEHR Clinical Data Repository (CDR) and standards-based backend. It says applications access it through openEHR REST APIs and Archetype Query Language (AQL). The official product site similarly characterizes it as a backend for clinical application systems and EHRs, and presents the API and SDK as a foundation on which other applications are built. This supports a data-platform role, not a packaged user-facing EHR. [1] [2]

Documented record capabilities include managing a patient's EHR through Compositions, Folders, and Contributions, defining templates and stored queries, and executing AQL queries. These are structured-record and repository operations. The reviewed official sources do not establish that EHRbase itself supplies hospital admissions/ADT, encounter management, clinician-facing order entry, medication management, laboratory or imaging workflows, scheduling, billing, or end-to-end hospital operations. Do not infer those from general claims about clinical applications or EHRs. [3]

It is not an LIS or PACS/imaging workflow system on the evidence reviewed. Nor should it be described as a FHIR server: the documented core API is openEHR REST. The release history does mention an option to rely on a FHIR terminology server for terminology validation; that is a specific external terminology integration, not evidence of general FHIR resource/API support. [3] [4]

## Data model and interoperability

The repository states support for openEHR Reference Model (RM) 1.1.0 and Archetype Definition Language (ADL) 1.4; the official REST documentation identifies openEHR REST API version 1.0.2, including Definition, EHR, and Query APIs, with AQL queries. The same doc notes all endpoints except ADL2 Templates are supported. These version-specific claims are the defensible interoperability basis. [1] [3]

The model organizes clinical content in openEHR EHRs, Compositions, Folders, Contributions, templates, archetypes, and versioned records. This provides a semantic openEHR model; it is not a generic claim of native HL7 v2, FHIR clinical resource, DICOM, LOINC, SNOMED CT, or ICD interoperability. The cited release notes specifically describe a FHIR terminology-server option for terminology validation, but no universal terminology support or code-system coverage is asserted here. Verify concrete external terminology services, mappings, and exchange needs against the intended deployment. [3] [4]

## Technology, deployment and operations

The official repository identifies Java JDK/JRE 21 and PostgreSQL 15 or newer (16 recommended) for the documented build context. The product site describes a Java runtime plus PostgreSQL and binaries or Docker containers. The installation guide gives Docker-based PostgreSQL and EHRbase examples and explicitly warns its basic example starts without authentication configured. Treat those examples as local setup, not a secure production baseline. [1] [2] [5]

The repository advises checking `UPDATING.md` for breaking changes and backing up the database before updates because releases may introduce database changes. Upgrade notes document substantial schema migrations, history-table migrations, API behavior changes, and a required separate migration tool for pre-2.0.0 data structures. Operational planning must include tested backups/restore, version-specific migration rehearsals, and downtime/capacity assessment; this review did not verify a built-in backup/restore product or a universal zero-downtime upgrade path. [1] [6]

## Security, privacy and dependencies

The repository documents Basic authentication as opt-in and provides OAuth2 resource-server configuration, with user and admin roles. The installation guide's default unauthenticated mode and repository example credentials make it especially important to configure authentication, replace secrets, restrict network access, and harden deployment before any patient data is used. The source describes authentication/role mechanisms; it does not establish a complete deployment-specific authorization policy, least-privilege model, audit trail of user access, or privacy controls. [1] [5]

The project maintains a responsible-disclosure policy that requests reports by email and describes triage and patch disclosure. The reviewed repository security page did not show published advisories; that absence is not proof that no vulnerability exists. A comprehensive current dependency vulnerability/SBOM assessment was not performed. The project uses Java/Spring, PostgreSQL, and other managed dependencies, so operators should independently track image, runtime, database, and library updates. [7]

Clinical data are sensitive. The fact that EHRbase is designed to store clinical records does not establish HIPAA, GDPR, or other privacy-law compliance. No certification claim or deployment-specific patient privacy assessment was verified in the official sources reviewed. Data residency, encryption in transit/at rest, key management, retention, backup access, monitoring, and controller/processor obligations require separate assessment for each deployment. [2] [5] [7]

## Maintenance, tests and maturity

The repository's releases page lists v2.36.0 and its changelog includes a Spring Boot 4 upgrade; the release history also documents ongoing fixes, API/model changes, and terminology-related changes. This indicates active versioned development as of the evidence snapshot, but does not by itself establish service-level support or long-term maintenance guarantees. [4]

The repository documents Maven build and code-style checks run on pull requests, and directs users to a separate integration-test repository. This is evidence of a development/test workflow, not evidence that this desk review measured test coverage, passed a test suite, or validated clinical workflows. [1]

## License, localization and regulatory boundaries

The exact repository `LICENSE` is Apache License 2.0. Its text grants broad copyright and patent permissions subject to the license terms, requires preservation of notices and license when redistributing, and disclaims warranties. Commercial use is not barred by Apache-2.0; the project site also calls the license business-friendly. Paid support/maintenance is separately offered by vitagroup, so support services are a commercial boundary distinct from the open-source license. Review third-party dependency licenses and trademarks separately. [2] [8]

No supported Arabic interface, Arabic translation, RTL layout, or localization feature was identified in the official sources reviewed. This is “not verified,” not proof that an integrating application cannot implement Arabic/RTL. [1] [2]

No official claim with a verified scope of HIPAA, GDPR, ONC certification, FHIR conformance, medical-device status, or clinical safety certification was found in the sources reviewed. In particular, openEHR API implementation and authentication features do not establish regulatory compliance or clinical safety. [1] [2] [7]

## Screening score

This is a desk-research screening judgment only—not a recommendation, certification, or safety assessment. The dimensions follow the requested 100-point screen; component integers sum to **61/100**.

```json
{"hospital_ehr_fit":6,"interoperability_data_model":14,"maintenance":12,"security_privacy_dependencies":7,"docs_tests":8,"license_clarity":10,"setup_deployment":4,"arabic_localization_rtl":0,"clinical_regulatory_evidence":0}
```

The low hospital-EHR fit reflects infrastructure scope rather than a defect in its intended CDR role. Strong openEHR specificity and clear licensing offset absent evidence for turnkey workflows, Arabic/RTL, operational privacy assurance, and clinical/regulatory credentials.

## References

[1]: https://github.com/ehrbase/ehrbase "EHRbase canonical repository and README"
[2]: https://www.ehrbase.org/ "EHRbase official product site"
[3]: https://docs.ehrbase.org/docs/EHRbase/Explore/openEHR-REST "EHRbase openEHR REST API documentation"
[4]: https://github.com/ehrbase/ehrbase/releases "EHRbase releases and changelog"
[5]: https://docs.ehrbase.org/docs/EHRbase/Installation "EHRbase installation documentation"
[6]: https://github.com/ehrbase/ehrbase/blob/develop/UPDATING.md "EHRbase upgrade and migration notes"
[7]: https://github.com/ehrbase/ehrbase/security "EHRbase security policy and responsible disclosure"
[8]: https://github.com/ehrbase/ehrbase/blob/develop/LICENSE "EHRbase exact LICENSE file — Apache License 2.0"
