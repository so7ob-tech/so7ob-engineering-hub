# OpenMRS — evidence note (2026-10-14)

## Identification and scope

**OpenMRS** is the open-source medical-record platform in the **Full EHR / clinical records platform** category, but that category should not be read as meaning a turnkey hospital information suite. Its core repository describes a patient-based medical-record system intended to be customized; an official information-model chapter says the implementation must configure its own clinical metadata, rather than receiving built-in assumptions about workflows such as weight capture or outpatient visits.[1] [3] The product site describes actual deployments and target use spanning outpatient primary care, specialty programs (including HIV, TB, NCD and maternal care) and hospital inpatient care.[4] This establishes broad implementation scope, not that every workflow ships in core or is ready without implementation work.

## Clinical records and workflow boundary

The model documents patients, identifiers, visits, encounters, providers, locations and observations. A visit can contain distinct encounters such as registration, consultation and dispensing; observations capture individual clinical facts linked to concepts.[3] Product-level claims include clinical documentation, diagnosis tracking, customizable forms and electronic orders. It also lists appointments, queues, billing, stock, labs and dispensing as capabilities “directly or through integration,” so these must not be assumed to be complete, core-native hospital modules.[4] REST docs expose patient and visit resources, and illustrate order types including test and drug orders.[5] The FHIR guide lists MedicationRequest, MedicationDispense, ServiceRequest and DiagnosticReport resources, among others, but a resource interface is not a complete medication, laboratory or imaging workflow.[6] No reviewed source established a native PACS/DICOM imaging workflow, nor full inpatient admission/bed management functionality in core. OpenMRS is therefore best treated as a configurable clinical record platform with optional modules and integrations, not a turnkey HMIS/LIS or hospital suite.[1] [4]

## Interoperability and data model

The data model is metadata- and concept-dictionary-driven, allowing local terminology and workflows to be configured. The official FHIR implementation guide identifies its FHIR2 module and lists export of Patient, Person, Practitioner, Observation, Location, AllergyIntolerance, Condition, DiagnosticReport, Encounter, Medication, MedicationRequest, MedicationDispense, ServiceRequest, Task, Group, Immunization and RelatedPerson. The guide identifies FHIR version 0.1.0 and says the underlying module is based on FHIR 4.0.1; it also warns that the guide is a draft/local build and official publication supersedes it.[6] Product materials mention REST and FHIR APIs and integrations with ERP, lab systems and DHIS2.[4] REST documentation describes authenticated endpoints and includes patients, visits and orders.[5] No reviewed primary source established native HL7 v2, DICOM, or specific LOINC/SNOMED CT/ICD terminology binding/conformance for the core product. The FHIR guide cautions that example terminology licensing may be restrictive; using a terminology in examples is not proof of bundled or licensed terminology content.[6]

## Maintenance, security and privacy

The public product page reports 2,200+ code contributions in 2025 and four or more yearly releases.[4] The repository release page, as accessed on the evidence date, lists 2.8.10 as the latest visible release and 2.7.6 as a maintenance line; the 2.8.0 notes document platform work including Java 21 and PostgreSQL setup support.[7] This and repository activity (latest shallow-clone commit dated 2026-10-14) support current maintenance, while the release listing does not itself establish a guaranteed support lifecycle.[1] [7]

The repository’s security policy directs private vulnerability reports by email or GitHub and explicitly says not to test systems holding real patient data.[8] In this review, no public security advisory or repository vulnerability finding was confirmed; that is not evidence that no vulnerabilities exist. REST API documentation says nearly all endpoints require authentication and describes Basic authentication and session tokens.[5] Product claims include role-based access, granular permissions by location or data type, and audit logging.[4] The information model says deleted clinical data are voided rather than immediately removed, with administrative unvoid/purge paths.[3] These describe controls and lifecycle behavior, not proof of secure configuration, encryption, privacy-law compliance, or audit completeness. The product relies on Java, Maven, a servlet container and database; modules and deployment choices add dependencies that must be assessed for each implementation.[1] No independent dependency inventory/audit, penetration assessment, or current advisories scan was established here.

## Licensing and commercial boundary

The exact repository license file identifies **Mozilla Public License 2.0 (MPL-2.0)**.[2] This is an open-source file-level copyleft license: covered source modifications remain under MPL when distributed, while a larger work may combine separately licensed material subject to the license’s conditions. It is not a blanket license for separately distributed modules, terminologies, trademarks, hosted services, or implementation services; review each component’s own terms. OpenMRS branding/trademark is expressly reserved in the license file.[2] No commercial-services restriction on use of the core was identified in that license; commercial services or implementations are not themselves equivalent to core being a turnkey supported product.

## Deployment, operations, documentation and localization

The repository describes a Java web application packaged as `openmrs.war`, deployable on Tomcat or Jetty, and describes Docker Compose build/run options while cautioning that Docker builds are a work in progress.[1] Its release history describes PostgreSQL setup support for Platform 2.8, while the maintenance guide gives database backup instructions, recommends backing up MySQL and the `.OpenMRS` modules/configuration directory, and recommends testing upgrades off the live clinical server and backing up first.[7] [9] These older operational instructions require validation against the exact platform, database and modules chosen; a site-specific tested backup/restore and upgrade procedure is still necessary. The project has broad developer and implementer documentation, an API reference, repository build instructions and tests (Maven build/test structure).[1] [5]

The official product page claims configurable translation tools, multiple simultaneous languages and right-to-left support.[4] Arabic is not established as complete, quality-assured or supported in every screen/module by that general claim. Arabic/RTL verification must be performed against the chosen distribution, forms, custom modules, printouts and workflows.

## Regulatory and clinical-safety evidence

No reviewed official source supplied evidence of HIPAA, GDPR, ONC certification, or a clinical-safety certification/conformity assessment for the core platform. Feature descriptions and FHIR interfaces are not compliance evidence. The MPL license includes a disclaimer that expressly references possible failure to comply with privacy laws and clinical-care standards.[2] These matters remain unverified and require assessment for the deployment jurisdiction and intended use.

## Screening score

This is a desk-research screen, not a recommendation, certification, procurement decision or clinical-safety assessment.

```json
{"hospital_ehr_fit":14,"interoperability_data_model":11,"maintenance":13,"security_privacy_dependencies":8,"docs_tests":8,"license_clarity":10,"setup_deployment":3,"arabic_localization_rtl":3,"clinical_regulatory_evidence":0}
```

**Total: 70/100.** Strong configurable patient/encounter record scope and active community, with useful REST/FHIR interfaces. Deductions reflect implementation/module dependence for hospital workflows, unverified standards coverage outside listed FHIR resources, deployment and dependency risk requiring local controls, unverified Arabic quality, and no qualifying regulatory or clinical-safety evidence.

## References

[1]: https://github.com/openmrs/openmrs-core "OpenMRS Core repository"
[2]: https://github.com/openmrs/openmrs-core/blob/master/LICENSE "OpenMRS Core exact LICENSE file"
[3]: https://guide.openmrs.org/getting-started/openmrs-information-model/ "OpenMRS Information Model"
[4]: https://openmrs.org/product/ "OpenMRS Product"
[5]: https://rest.openmrs.org/ "OpenMRS REST API documentation"
[6]: https://fhir.openmrs.org/ "OpenMRS Core FHIR Implementation Guide"
[7]: https://github.com/openmrs/openmrs-core/releases "OpenMRS Core releases"
[8]: https://github.com/openmrs/openmrs-core/security/policy "OpenMRS Core security policy"
[9]: https://guide.openmrs.org/administering-openmrs/maintenance/ "OpenMRS maintenance guide"
