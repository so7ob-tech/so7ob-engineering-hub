# OpenELIS Global — evidence note (2026-10-14)

**Category:** Laboratory information system. **Care scope:** Laboratory workflows from sample collection through testing and results reporting, for single facilities or laboratory networks; this is not a general EHR. **Discovery caveat:** The official site describes OpenELIS as an open-source laboratory information system and points to source code and an active community. This is an adjacent clinical diagnostics system, not a hospital/ambulatory EHR. The initially specified canonical repository (`openelisglobal/openelisglobal-core`) explicitly identifies itself as OpenELIS 1.x and end-of-life and directs users to Global 2.x. Current product/release evidence below therefore distinguishes that requested repository from its stated successor, DIGI-UW/OpenELIS-Global-2. [1] [2] [3]

## Product boundary and documented workflows

Official product materials describe registration/patient identity, sample tracking, result entry/validation and reporting, analyzer interfaces and laboratory network operations. Documentation includes specimen collection details, aliquots, storage, non-conformity, barcode workflows, reflex/calculated results, QC, referral and audit trails. Clinical diagnoses, clinician notes and attachments may accompany a lab order; this does not establish general encounter, admission, medication prescribing, imaging/radiology or longitudinal-care functionality. These sources describe laboratory testing operations, not complete inpatient/outpatient EHR workflows. [4]

The software is intended for clinical/public-health and reference laboratories, including laboratory operations embedded in general hospitals and national lab networks. Do not infer that a lab's mention of hospitals means the software manages hospital admissions or the broader record. Product claims of patient registry sync and EMR orders describe integration, not EHR replacement. [3] [4]

## License and commercial boundary

The requested canonical repo’s API-reported license is **Mozilla Public License 2.0 (MPL-2.0)**, but its checked-in `LICENSE` path was not present at the repository's current default branch during this review; do not treat the successor's file as proof of that old repo’s exact file content. The successor repo does contain a `LICENSE` file and identifies MPL-2.0; its grant allows use, reproduction, modification, distribution and commercial exploitation subject to MPL obligations, including source availability for covered software and notice requirements when distributing executables. Larger works may be under chosen terms while complying for covered code. The official product site says no licensing fees; this is not a promise of free implementation, hosting, support or services. [1] [2] [5] [6]

## Interoperability and data model

Current product material specifically claims native HL7 FHIR R4 and publishes a FHIR Implementation Guide (build v0.2.1 at the evidence date); this is a concrete standards claim, not proof of complete conformance across every resource or workflow. The product also specifically documents HL7 v2.x over MLLP, ASTM E1394/E1381 and file-import instrument drivers, with bidirectional worklist/result exchange, plus named EMR integrations and DHIS2/SORMAS reporting. No evidence reviewed substantiates DICOM, LOINC, SNOMED CT or ICD support as a general system-wide capability; do not infer them from FHIR. [4] [7]

## Architecture, setup and operations

Official setup documentation offers Docker Compose online and offline installers; current official download page characterizes Docker as the maintained, release-updated path and says the full stack includes application, database and FHIR layer. Legacy Global 2 deployment docs mention Ubuntu Server 22.04 LTS, Docker/Compose, Java-related development/installer steps, and Chrome-only testing for the documented 2.x install. Current Global 2 repository states development uses Java 21 and a Docker-based app/analyzer harness. The viewed official documentation does not provide a current, comprehensive production dependency inventory or support matrix. [8] [9] [3]

Upgrade guidance explicitly requires backups before migration, recommends a separate machine and testing restoration, and describes PostgreSQL logical dumps/restores plus Liquibase migration. It is legacy 1-to-2 guidance and includes dated commands; it should not be used as an unvalidated current upgrade runbook. A backup configuration SOP is linked by installation docs, but recovery objectives and current release-specific backup/restore validation were not established here. [9] [10]

## Maintenance, security and privacy

The canonical 1.x repository reports its last push in 2021 and calls itself end-of-life. The successor's releases page at the evidence date listed 3.2.1.11, with active commits/features, test work, translation updates and dependency updates; GitHub metadata showed a push on 2026-10-14. The successor security policy says current 3.2.x, `main` and `develop` are supported, older 2.x and earlier majors are unsupported, describes private vulnerability reporting, coordinated disclosure and scope, and warns never to submit real patient records. The requested old repo's GitHub security page says no policy detected. No public advisory was verified in this review; absence of a discovered advisory is not evidence of absence of vulnerabilities. [1] [3] [11] [12]

Product pages claim role-based access, SSO, encryption in transit/at rest and audit trails. These are product claims, not independent testing or proof of complete deployment security. Official deployment docs instruct keystore/truststore use and a database encryption key, but the viewed legacy document also gives permissive global-readable keystore/truststore permissions and a default admin credential; administrators must not mistake those examples for safe production defaults. No HIPAA, GDPR, ONC certification, or clinical safety certification was verified. ISO 15189/SLIPTA references concern laboratory quality workflows/accreditation support and are not equivalent to product certification. [4] [9] [12]

## Localization, documentation and testing

Successor release notes show ongoing translation updates and the repository references frontend localization; this establishes localization infrastructure but not complete Arabic translation, Arabic locale support or right-to-left UI readiness. Arabic/RTL support is therefore **unverified**. The official docs have install, configuration, role management, developer and deployment sections. Current successor repository documents backend/frontend CI, integration and Playwright E2E tests, test fixtures and test strategy; existence of tests is not a quality or clinical validation result. [3] [8] [11]

## Weighted screening score

This is a desk-research screening judgment, not a recommendation, certification or safety assessment. Components use the requested 100-point rubric: **hospital/EHR fit 7/20; interoperability/data model 11/15; maintenance 14/15; security/privacy/dependencies 8/15; docs/tests 8/10; license clarity 9/10; setup/deployment 4/5; Arabic/localization/RTL 2/5; clinical/regulatory evidence 1/5. Total: 64/100.** The score favors the active Global 2 successor’s LIS capabilities, current activity and documented FHIR R4; it is sharply limited for EHR fit, unverified Arabic/RTL and absence of verified clinical/regulatory certification. The old canonical 1.x repo is EOL, so it should not be confused with the active successor when interpreting maintenance. [1] [3] [4] [7] [11] [12]

## References

[1]: https://github.com/openelisglobal/openelisglobal-core "Canonical OpenELIS Global core repository (1.x, end-of-life notice)"
[2]: https://api.github.com/repos/openelisglobal/openelisglobal-core "Canonical repository metadata and MPL-2.0 license metadata"
[3]: https://github.com/DIGI-UW/OpenELIS-Global-2 "OpenELIS Global 2 successor repository"
[4]: https://openelis-global.org/features-and-functionality/ "Official product capabilities and laboratory workflows"
[5]: https://github.com/DIGI-UW/OpenELIS-Global-2/blob/develop/LICENSE "OpenELIS Global 2 exact MPL-2.0 license file"
[6]: https://openelis-global.org/getting-started/download/ "Official download and licensing statement"
[7]: https://digi-uw.github.io/openelis-global2-fhir-ig/ "OpenELIS Global FHIR Implementation Guide v0.2.1"
[8]: https://docs.openelisci.org/en/latest/ "Official OpenELIS Global documentation"
[9]: https://docs.openelisci.org/en/latest/install/ "Official installation and deployment instructions"
[10]: https://docs.openelisci.org/en/latest/upgrade1to2/ "Official 1-to-2 conversion and backup guidance"
[11]: https://github.com/DIGI-UW/OpenELIS-Global-2/releases "OpenELIS Global 2 releases and activity"
[12]: https://github.com/DIGI-UW/OpenELIS-Global-2/security/policy "OpenELIS Global 2 security policy"
