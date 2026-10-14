# Hospital Management & EHR Candidate Review

This report synthesizes only the supplied research notes. Scores are **provisional desk-research screens**, not recommendations, procurement approvals, certifications, clinical-safety assessments, privacy assessments, or production-readiness findings. A higher score does not make an outpatient system, laboratory system, or infrastructure component a substitute for a complete hospital EHR/HMIS.

The score order is: **Arabic/RTL + clinical/regulatory evidence + documentation/tests + hospital/EHR fit + interoperability/data model + license clarity + maintenance + security/privacy/dependencies + setup/deployment**. Each displayed total is the exact sum of those nine components.

## Candidates at a glance

- [Bahmni evidence note](../../research-sources/hospital-ehr-candidates/01-bahmni.md) · [repository](https://github.com/Bahmni/bahmni-docker) — integrated hospital suite; **77/100**. MIT applies to `bahmni-docker` only; the wider distribution is multi-license, including AGPL-3.0 components and separately licensed products.
- [OpenMRS evidence note](../../research-sources/hospital-ehr-candidates/02-openmrs.md) · [repository](https://github.com/openmrs/openmrs-core) — configurable clinical-record platform, not a turnkey hospital suite; **70/100**. Core is MPL-2.0; modules, terminologies and services need separate review.
- [GNU Health evidence note](../../research-sources/hospital-ehr-candidates/03-gnu-health.md) · [HIS/HMIS suite](https://codeberg.org/gnuhealth/his) — broad HMIS; **67/100**. GPL-3.0-or-later is stated in the README; the exact LICENSE text was not retrievable.
- [OpenEMR evidence note](../../research-sources/hospital-ehr-candidates/04-openemr.md) · [repository](https://github.com/openemr/openemr) — ambulatory/clinic EHR; **78/100**. Core repository is GPLv3; this is not evidence of a complete inpatient suite.
- [OSCAR EMR evidence note](../../research-sources/hospital-ehr-candidates/05-oscar-emr.md) · [repository](https://bitbucket.org/oscaremr/oscar) — ambulatory/clinic EHR; **54/100**. Public repository is GPLv2; commercial variants and quality-managed deployed sources may differ.
- [OpenELIS Global evidence note](../../research-sources/hospital-ehr-candidates/06-openelis-global.md) · [legacy repository](https://github.com/openelisglobal/openelisglobal-core) · [active successor](https://github.com/DIGI-UW/OpenELIS-Global-2) — laboratory information system (LIS); **64/100**. The requested 1.x repository is EOL; MPL-2.0 metadata and active Global 2 are discussed separately.
- [HAPI FHIR evidence note](../../research-sources/hospital-ehr-candidates/07-hapi-fhir.md) · [repository](https://github.com/hapifhir/hapi-fhir) — FHIR interoperability infrastructure; **58/100**; Apache-2.0.
- [EHRbase evidence note](../../research-sources/hospital-ehr-candidates/08-ehrbase.md) · [repository](https://github.com/ehrbase/ehrbase) — openEHR clinical-record infrastructure; **61/100**; Apache-2.0.
- [Medplum evidence note](../../research-sources/hospital-ehr-candidates/09-medplum.md) · [repository](https://github.com/medplum/medplum) — FHIR-based clinical-app platform; **68/100**. Apache-2.0 covers most platform components; check packages, dependencies, service terms and trademarks.
- [Open Hospital evidence note](../../research-sources/hospital-ehr-candidates/10-open-hospital.md) · [repository](https://github.com/informatici/openhospital) — integrated hospital suite; **73/100**; root license is GPL-3.0, with third-party notices and services requiring separate review.

## Integrated hospital suites and HMIS candidates

### Bahmni — integrated hospital suite — 77/100

Official materials support a broad hospital scope: registration, point-of-care records, investigations and billing, combining OpenMRS EMR with OpenELIS, Odoo and DCM4CHEE PACS in Standard; Lite uses OpenMRS and Crater. Docker Compose profiles and deployment scripts are documented. The supplied notes also describe OpenMRS FHIR APIs, historical ATOMFeed, HL7 and DICOM use, and terminology mappings, but all are component-, module- and version-dependent.

**Fit distinction:** the strongest supplied evidence for a composable hospital stack with clinical, laboratory, billing and imaging components. It is not one uniformly licensed monolith: the MIT `bahmni-docker` repository is only the deployment repository, while the distribution is multi-license. Lite/Standard profiles and exact component versions matter.

**Material limits:** detailed admission, medication, encounter, order and imaging workflows were not verified; release-specific permissions, audit coverage, encryption, dependency posture, backup/restore and upgrade support remain open. An Arabic/RTL implementation is described in an official account, but inclusion and maintained support in the reviewed Docker release are unclear. An ABDM certification claim was not independently established for scope, version or validity. The repository had observed activity but no formal GitHub releases; `latest` is described as development, and documented self-signed TLS is an evaluation warning rather than production guidance.

**Evidence note:** [supplied Bahmni note](../../research-sources/hospital-ehr-candidates/01-bahmni.md), [project](https://www.bahmni.org/), [license FAQ](https://www.bahmni.org/license), [FAQ](https://www.bahmni.org/faq), [Docker repository](https://github.com/Bahmni/bahmni-docker), [security reporting](https://bahmni.atlassian.net/wiki/spaces/BAH/pages/884277257/Security+-+Reporting+and+Discussion).

### GNU Health HIS/HMIS — full EHR/HMIS — 67/100

The supplied official materials describe a broad Tryton/PostgreSQL HMIS with 40+ packages spanning primary care, obstetrics/gynecology, pediatrics, surgery, laboratory information management, genetics, diagnostic imaging, dentistry, reporting, financial management, billing, stock and pharmacy. Official administration material covers installation, security, upgrades and backup/restore topics. Recent Codeberg release activity was supplied, including version 5.0.7.

**Fit distinction:** a broad HMIS candidate for further investigation where the target needs clinical and administrative breadth. Its HIS/HMIS should not be conflated with the separate MyGNUHealth PHR or Occhiolino LIMS components.

**Material limits:** the FHIR REST page could not be read in the supplied review, so FHIR version, resource coverage and conformance are unknown; HL7 v2, DICOM, LOINC, SNOMED CT and specific ICD coverage were not verified. Fine-grained permissions, audit completeness, encryption, dependency status, recovery testing and detailed medication/order/imaging workflows remain unverified. Arabic translation completeness and RTL usability are not established. GPLv3+ licensing does not establish clinical safety, regulatory approval or production assurance.

**Evidence note:** [supplied GNU Health note](../../research-sources/hospital-ehr-candidates/03-gnu-health.md), [HIS repository](https://codeberg.org/gnuhealth/his), [project](https://www.gnuhealth.org/about-us.html), [security guide](https://docs.gnuhealth.org/his/techguide/security.html), [administration docs](https://docs.gnuhealth.org/his/techguide/administration/index.html).

### Open Hospital — integrated hospital suite — 73/100

Official user and administrator materials document patient registration, OPD visits, admissions/discharges, anamnesis, examination, laboratory exams/results, pharmacy/stock, therapy, maternity/pregnancy, vaccines, billing, appointments, statistics and printing. It supports desktop standalone/portable and client/server configurations with MariaDB preferred and MySQL also listed. Arabic is listed as an available language and `ar` as a supported setting.

**Fit distinction:** one of the clearer hospital-oriented candidates in the supplied set, particularly for facility workflows and low-resource deployment patterns. The Arabic-language claim is useful for screening but is not evidence of complete translation or usable RTL across all screens, forms and print outputs.

**Material limits:** no verified FHIR, HL7, DICOM, terminology or openEHR conformance; an optional imaging file viewer is not proof of DICOM/PACS. Inpatient order-entry depth, API/UI maturity (both marked work in progress), test coverage, backup/restore, HA/DR and complete audit/encryption controls are unverified. Admin documentation includes default credentials and warns that portable mode is not intended for production; these are material hardening concerns to resolve, not production guidance.

**Evidence note:** [supplied Open Hospital note](../../research-sources/hospital-ehr-candidates/10-open-hospital.md), [project](https://www.open-hospital.org/), [documentation](https://www.open-hospital.org/documentation/), [user manual](https://www.open-hospital.org/wp-content/OH_manuals/user/UserManual.html), [repository](https://github.com/informatici/openhospital), [license](https://github.com/informatici/openhospital/blob/master/LICENSE).

## Clinical-record platforms that are not complete hospital suites

### OpenMRS — configurable clinical records platform — 70/100

OpenMRS documents patients, identifiers, visits, encounters, providers, locations, observations, customizable forms, diagnosis tracking and electronic orders, with REST and a draft/local-build FHIR guide. It is a modular Java/WAR application with PostgreSQL support and documented maintenance/backup guidance.

**Fit distinction:** a strong foundation for configurable clinical records and integration-oriented implementations, but core OpenMRS should not be treated as a turnkey hospital EHR/HMIS. Appointments, queues, billing, inventory, labs and dispensing may be provided by modules or integrations; native DICOM/PACS and full inpatient admission/bed-management were not established.

**Material limits:** the reviewed FHIR guide is draft/local build and lists FHIR 4.0.1; no native HL7 v2, DICOM or specific LOINC/SNOMED/ICD binding/conformance was established. Security features such as role-based permissions and audit logging do not prove secure configuration or privacy-law compliance. Arabic/RTL quality, exact module compatibility, backups/restores, upgrade paths and clinical validation remain implementation-specific.

**Evidence note:** [supplied OpenMRS note](../../research-sources/hospital-ehr-candidates/02-openmrs.md), [product](https://openmrs.org/product/), [information model](https://guide.openmrs.org/getting-started/openmrs-information-model/), [REST API](https://rest.openmrs.org/), [FHIR guide](https://fhir.openmrs.org/), [license](https://github.com/openmrs/openmrs-core/blob/master/LICENSE).

## Outpatient / ambulatory EHR systems

### OpenEMR — ambulatory EHR and practice management — 78/100

OpenEMR documents patient records, notes/forms, prescriptions, encounters/coding, appointments, billing, lab orders/results and diagnostic-study workflows. Its supplied API evidence lists FHIR R4 (4.0.1), US Core 8.0, SMART on FHIR 2.2.0, Bulk Data v2.0.0, USCDI v5, CCD-A and provenance. The repository is active and its contributor material describes unit, API, E2E, integration and JavaScript testing practices.

**Fit distinction:** the highest score in the supplied set, but its hospital/EHR-fit component is only 13/20. It is a strong candidate for ambulatory/clinic EHR and practice management, not evidence of a complete inpatient hospital suite.

**Material limits:** inpatient ADT/bed management, hospital-wide imaging/PACS/DICOM and integrated inpatient workflows were not established. Arabic/RTL completeness is unverified. The sample FHIR CapabilityStatement is tied to version 7.0.4 and must be matched to the target release. Public advisories include critical/high/moderate issues such as authorization bypass, PHI disclosure, SQL injection, SSRF and RCE; prompt patching and deployment-specific review are required. The official ONC claim is scoped to OpenEMR version 8 and is expressly not HHS endorsement; it is not blanket HIPAA/GDPR compliance or clinical-safety evidence.

**Evidence note:** [supplied OpenEMR note](../../research-sources/hospital-ehr-candidates/04-openemr.md), [project](https://www.open-emr.org/wiki/index.php/OpenEMR_Wiki_Home_Page), [FHIR API](https://github.com/openemr/openemr/blob/master/Documentation/api/FHIR_API.md), [release](https://github.com/openemr/openemr/releases/tag/v8_4_1), [advisories](https://github.com/openemr/openemr/security/advisories), [license](https://github.com/openemr/openemr/blob/master/LICENSE).

### OSCAR EMR — ambulatory clinic EHR — 54/100

OSCAR materials document patient charts, appointments, prescriptions, labs and imaging, forms/templates, letters, fax integration, waitlists, reporting and clinic status workflows, with a family-medicine/community-practice orientation. OSCAR Galaxy describes HL7 communication and lab imports, but the supplied review did not establish exact versions, profiles, transport or conformance.

**Fit distinction:** a credible Canadian ambulatory candidate, not a complete hospital EHR/HMIS or LIS. The public GPLv2 repository and commercial OSCAR Pro are not assumed to be identical; McMaster explicitly distinguishes its repository from the direct quality-managed deployed source.

**Material limits:** inpatient ADT, bed management, enterprise orders, OR, blood bank, PACS and LIS scope were not established. Arabic/RTL evidence was not found. Current runtime/support matrix, backup/restore, upgrade process, security policy, dependency audit, complete permissions model and audit coverage remain unverified. A McMaster ISO 13485/context statement does not establish certification or clinical safety for this public repository or any particular deployment.

**Evidence note:** [supplied OSCAR note](../../research-sources/hospital-ehr-candidates/05-oscar-emr.md), [OSCAR Galaxy](https://oscargalaxy.org/), [overview](https://oscargalaxy.org/about/brief-overview-of-oscar/), [McMaster source boundary](https://fammed.mcmaster.ca/oscar-emr/innovate-with-oscar/), [public repository](https://bitbucket.org/oscaremr/oscar), [GPLv2 text](https://bitbucket.org/oscaremr/oscar/src/stable/COPYING).

## Laboratory system

### OpenELIS Global — LIS — 64/100

OpenELIS documents registration, orders, specimen collection, traceability, testing, analyzer ingestion, result entry/validation/reporting, QC, referrals and laboratory networks. Current supplied interoperability evidence includes FHIR R4 and an implementation guide, HL7 v2.x over MLLP, ASTM analyzer drivers and flat-file interfaces. Docker Compose is the recommended deployment path in current material.

**Fit distinction:** a specialized LIS, not an EHR. It can support hospital laboratory operations and exchange clinical results, but laboratory breadth does not provide admissions, encounters, medications, imaging, billing or longitudinal clinical records.

**Material limits:** the requested OpenELIS Global 1.x repository is explicitly EOL (last push reported in 2021); active Global 2 must be assessed as a distinct successor. Arabic/RTL, general DICOM, LOINC, SNOMED CT and ICD support were not established. Product claims around RBAC, SSO, encryption and audit are not independently verified. Legacy installation material includes default credentials and permissive keystore/truststore examples, so it is not production-hardening guidance. No HIPAA/GDPR/ONC or clinical-safety certification was verified; ISO 15189/SLIPTA material concerns laboratory quality/accreditation support, not software certification.

**Evidence note:** [supplied OpenELIS note](../../research-sources/hospital-ehr-candidates/06-openelis-global.md), [legacy repository](https://github.com/openelisglobal/openelisglobal-core), [successor](https://github.com/DIGI-UW/OpenELIS-Global-2), [features](https://openelis-global.org/features-and-functionality/), [FHIR implementation guide](https://digi-uw.github.io/openelis-global2-fhir-ig/), [successor security policy](https://github.com/DIGI-UW/OpenELIS-Global-2/security/policy).

## Interoperability and clinical-data infrastructure

### HAPI FHIR — FHIR infrastructure — 58/100

HAPI FHIR provides FHIR models, parsers, clients, server modules and JPA persistence. The supplied version matrix documents multiple FHIR pairings, including DSTU1, DSTU2, DSTU3, R4, R4B and R5 for the listed HAPI release. It is suitable as a building block for a clinical application or interoperability layer.

**Fit distinction:** not a hospital EHR, HMIS, ambulatory EHR, LIS or PACS. JPA/search/terminology/clinical-reasoning features and resource APIs do not supply admissions, encounters, orders, medication workflows, labs, imaging, billing or hospital operations as a turnkey product.

**Material limits:** security is intentionally a set of building blocks; the JPA starter has no security implementation or enterprise logging by default, and its starter defaults include H2. No implementation-specific proof of profiles, terminology conformance, HL7 v2, DICOM or jurisdictional interoperability was established. Arabic/RTL, backup/restore, HA/DR and complete dependency posture remain unverified. A fixed CVE record is not a complete vulnerability inventory.

**Evidence note:** [supplied HAPI note](../../research-sources/hospital-ehr-candidates/07-hapi-fhir.md), [documentation](https://hapifhir.io/hapi-fhir/docs/), [version matrix](https://hapifhir.io/hapi-fhir/docs/getting_started/versions.html), [JPA starter](https://github.com/hapifhir/hapi-fhir-jpaserver-starter), [security documentation](https://hapifhir.io/hapi-fhir/docs/security/introduction.html), [license](https://github.com/hapifhir/hapi-fhir/blob/master/LICENSE).

### EHRbase — openEHR clinical-record repository — 61/100

EHRbase documents openEHR REST APIs and a versioned clinical-record model with Compositions, Folders, Contributions, templates, stored queries and AQL. Supplied version evidence identifies API 1.0.2, Reference Model 1.1.0, ADL 1.4 and AQL, backed by PostgreSQL and deployable with Docker.

**Fit distinction:** useful as openEHR backend infrastructure for an application team; not a user-facing EHR, hospital suite, ambulatory system, LIS or PACS. openEHR APIs and data modeling do not provide admissions, orders, medications, labs, imaging, scheduling, billing or end-to-end hospital operations.

**Material limits:** no general FHIR API/resource support, HL7 v2, DICOM, LOINC, SNOMED CT or ICD capability was established; optional FHIR terminology-server validation is not equivalent to a FHIR interface. Example installation starts without authentication, so operators must configure auth, secrets and hardening. Backup/restore, HA/DR, complete authorization/audit behavior, Arabic/RTL and clinical/regulatory assurance remain unverified.

**Evidence note:** [supplied EHRbase note](../../research-sources/hospital-ehr-candidates/08-ehrbase.md), [project](https://www.ehrbase.org/), [openEHR REST](https://docs.ehrbase.org/docs/EHRbase/Explore/openEHR-REST), [installation](https://docs.ehrbase.org/docs/EHRbase/Installation), [updates](https://github.com/ehrbase/ehrbase/blob/develop/UPDATING.md), [license](https://github.com/ehrbase/ehrbase/blob/develop/LICENSE).

### Medplum — FHIR clinical application platform — 68/100

Medplum is a TypeScript/Node.js/React/PostgreSQL/Redis platform for building custom clinical applications. Supplied sources document FHIR R4 4.0.1, resource APIs, access policies, lab/imaging CPOE examples, DiagnosticReport/Observation results, and Agent interfaces for HL7 v2 over MLLP, DICOM C-STORE/C-ECHO and ASTM (alpha). LOINC and SNOMED examples are not proof of comprehensive terminology services.

**Fit distinction:** a plausible infrastructure base for custom FHIR clinical applications, not a turnkey hospital EHR/HMIS. The ADT and lab/imaging material demonstrates integration patterns, not a complete admissions, LIS or PACS product.

**Material limits:** comprehensive inpatient workflows, dedicated LIS/PACS, Arabic/RTL, self-hosted backup/recovery, dependency inventory and clinical safety remain unverified. Hosted claims for monitoring, backups/DR and compliance support are commercial-service claims and do not certify self-hosted code or a customer deployment. The supplied security evidence includes a moderate SSRF advisory fixed before 5.1.14; patch and independently assess dependencies. ONC certification was described as in progress, not established.

**Evidence note:** [supplied Medplum note](../../research-sources/hospital-ehr-candidates/09-medplum.md), [open-source boundary](https://www.medplum.com/open-source), [FHIR API](https://www.medplum.com/docs/api/fhir), [labs/imaging](https://www.medplum.com/docs/labs-imaging/ordering-labs-imaging), [Agent integrations](https://www.medplum.com/docs/agent), [self-hosting](https://www.medplum.com/docs/self-hosting), [security policy](https://github.com/medplum/medplum/security/policy), [license](https://github.com/medplum/medplum/blob/main/LICENSE.txt).

## Fit-based distinctions and material limits

- **Best-supported integrated hospital-suite investigations:** Bahmni and Open Hospital have the clearest supplied evidence of facility workflows; GNU Health has the broadest documented HMIS package scope. Their scores should not be compared to outpatient or infrastructure candidates as if they were equivalent products.
- **Best ambulatory investigations:** OpenEMR and OSCAR are clinic/practice systems. OpenEMR has stronger supplied API, maintenance and testing evidence, but neither is established as an inpatient hospital suite.
- **Best specialized laboratory investigation:** OpenELIS Global, with the important distinction between the EOL 1.x repository and the active Global 2 successor.
- **Best building blocks rather than products:** HAPI FHIR (FHIR server/interoperability), EHRbase (openEHR repository), Medplum (custom FHIR application platform), and OpenMRS (configurable clinical-record foundation) require surrounding workflows, security, governance and operations.
- **Score interpretation:** the hospital/EHR-fit component is only one of nine components. A high total can reflect maintenance, documentation, licensing and interoperability strength even when the product is not a complete hospital suite. Do not rank OpenEMR above Bahmni or Open Hospital as a hospital-management replacement solely because its total is higher.

### Standards, localization and assurance boundaries

**FHIR, HL7, DICOM, openEHR and terminology support are implementation/version-specific.** A project mentioning a standard, exposing an API, or listing a resource does not establish profile conformance, interoperability testing, certification, complete resource coverage, terminology binding or production behavior. Verify the exact release, enabled modules, profiles, transport, capability statements, mappings and test results. Standards support is **not equivalent to conformance certification**.

**Arabic/RTL is a separate acceptance requirement.** A language setting, translation infrastructure, an Arabic implementation report or a list of available languages does not establish complete Arabic text, bidirectional rendering, forms, reports, dates/numbers, clinical terminology, print/PDF output, accessibility or maintained support in the target build. Validate it independently in the intended release and configuration.

**Jurisdiction-specific legal and clinical validation is separate.** Nothing in these notes establishes HIPAA, GDPR, ONC or other jurisdictional compliance, medical-device status, clinical-safety certification, privacy-by-default, or production readiness. The OpenEMR ONC statement, Bahmni ABDM statement and other project claims are scoped and require independent verification. Local legal review, clinical governance, hazard analysis, workflow validation, security testing, access-control/audit review, backup/restore drills, upgrade rehearsal, dependency review and operating-model validation remain necessary before any deployment decision.
