# Medplum — clinic-management candidate evidence note

**Checked date:** 2026-10-14  
**Candidate:** Medplum  
**Slug:** `medplum`  
**Category:** open-source FHIR clinical-software developer platform  
**Official website:** https://www.medplum.com/docs/  
**Repository:** https://github.com/medplum/medplum

## Concise key findings

- **[Verified]** Medplum is an open-source developer platform for shipping clinical software, not a finished clinic-management product. Its documented foundation includes authentication, a FHIR clinical data repository, FHIR API, SDK, web app, server-side Bots, and React UI components. [1] [2]
- **[Verified]** The open-source Provider app can be used as a system of record, starting point, or implementation reference for a custom EHR. Its current documentation lists setup, patient profile, schedule, and visits; Tasks, Messages, Labs, and Medications are explicitly marked “Documentation Coming Soon” in that section. [7]
- **[Verified]** Core clinic building blocks are well represented as FHIR workflows: intake/registration can transform QuestionnaireResponse into Patient, Coverage, Consent, and Condition resources; charting covers patient history, notes, encounters, diagnoses, observations, and orders; scheduling exposes FHIR operations for finding, booking, holding, confirming, cancelling, and rescheduling appointments. [8] [9] [10]
- **[Verified]** Prescriptions, labs/imaging, referrals, and billing are documented as extensible FHIR plus Bots/integration workflows rather than turnkey modules. MedicationRequest can feed an e-prescribing provider; lab/imaging ordering requires an enabled provider integration; referrals use ServiceRequest, Task, Communication, documents, appointments, and results; billing uses FHIR resources synchronized to clearinghouses or billing providers. [11] [12] [13] [14]
- **[Verified]** The architecture is a full-stack TypeScript monorepo using Node.js, React, PostgreSQL, Redis, and Express, with packages for the server, FHIR types/router, HL7, React components, CLI, AWS CDK, agent, examples, and tests. [2]
- **[Verified]** The API is FHIR R4-native and documents US Core 5.0.1/USCDI v2, SMART App Launch 2.0, Bulk Data 2.0, OAuth 2.0, an SDK, and React components. Integrations include FHIR, HL7 V2, SMART-on-FHIR, SFTP, CDS Hooks, FHIRcast, DICOM-related capabilities, and first-party or template integrations for systems such as Epic, Health Gorilla, Labcorp, Quest, Twilio, Candid, and Stripe. [15] [16] [24]
- **[Verified]** Self-hosting is supported through AWS CDK/CloudFormation, Ubuntu, GCP/Azure beta paths, from-scratch deployment, and Docker Compose. The AWS guide calls deployment production-ready but also says it is complex and requires high proficiency with AWS, Node.js, and command-line tools. [6] [21] [22]
- **[Verified]** The repository carries Apache License 2.0, and the canonical license text is the standard Apache 2.0 text. Apache 2.0 is OSI-approved. Medplum’s own licensing page says most of the platform—including the FHIR server, core APIs, SDKs, React library, CLI, documentation, and examples—is Apache 2.0, while hosted infrastructure, enterprise support, compliance assistance, and custom work are commercial services. [5] [19] [25]
- **[Verified]** Maintenance evidence is strong: the releases page shows a current 5.1.x patch stream with frequent dated releases and substantial scheduling, billing, security, dependency, and workflow changes; the version policy states weekly patch releases, two to three minor releases per year, and annual majors. [4] [20]
- **[Unknown]** No primary evidence was found in the reviewed repository/docs for a built-in Arabic UI, Arabic translations, or RTL layout. This is scored as zero because support is unverified, not because absence was proved.

## Clinic workflow coverage and scope limits

**[Verified] Registration/intake.** Medplum documents intake as collecting demographics, insurance, medical history, and consent, with QuestionnaireResponse extraction into Patient, Coverage, Consent, Condition, and related resources. A working Patient Intake Demo is referenced. [9]

**[Verified] Patient chart and encounters.** Charting guidance covers summarizing patient history, clinical notes, and medication/lab/imaging orders. It names Patient `$everything`, Observation, Condition, RiskAssessment, AllergyIntolerance, Immunization, Medication, MedicationRequest, MedicationAdministration, MedicationStatement, Encounter, and ClinicalImpression as relevant resources. [8]

**[Verified] Appointments.** Scheduling is documented around Practitioner, Location, Device, HealthcareService, Schedule, Slot, and Appointment, with `$find`, `$book`, `$hold`, `$confirm`, `$cancel`, and `$reschedule`. The documentation explicitly labels Medplum Scheduling as **beta**, so this is a capability with maturity caveat rather than evidence of a finished scheduling product. [10]

**[Verified] Prescriptions/medications.** MedicationRequest and related FHIR resources can represent prescriptions, dispense events, prior authorizations, and allergies. Sending a prescription to an e-prescribing provider is described as a Bot/subscription/integration workflow, not as a universally included dispensing network. [11]

**[Verified] Labs and imaging.** Medplum documents CPOE form design, diagnostic catalogs, ask-on-entry questions, specimen details, billing/insurance questions, and connections to providers. It is provider agnostic and says lab/imaging ordering requires an integration and provider enablement. The page also states that ONC (a)(2)/(a)(3) certification is under development/in progress. [12]

**[Verified] Referrals.** The referral guide provides a concrete FHIR workflow using ServiceRequest, Task, QuestionnaireResponse, Communication, DocumentReference/Binary, Appointment/Encounter, and DiagnosticReport, with milestones for delivery, acceptance, scheduling, service, and loop closure. [14]

**[Verified] Billing.** Billing is modeled with FHIR resources, coverage, coding, subscriptions, and Bots that synchronize with clearinghouses or billing providers. Examples include Stripe and Candid Health. This supports custom revenue-cycle implementation; it is not evidence of a complete billing/claims module for every jurisdiction. [13]

**[Unknown] Multi-clinic operations.** The source set supports organizations, projects, memberships, access policies, locations, and actor-specific scheduling, but does not establish a turnkey multi-clinic operating model covering cross-site administration, consolidated reporting, payer configuration, and clinical governance. Treat multi-clinic capability as an implementation question, not a verified product feature. [14] [15]

**[Inference] Clinic fit.** Medplum is a strong foundation for a custom ambulatory/EHR product when the So7ob team can implement workflows, UX, jurisdictional billing, clinical governance, and integrations. It is a weak fit if the requirement is an immediately deployable clinic system with complete out-of-the-box registration, charting, appointments, e-prescribing, labs, referrals, billing, and Arabic/RTL UX.

## Architecture, reuse, deployment, and interoperability

**[Verified] Architecture.** The canonical repository describes a full-stack TypeScript codebase with Node.js servers, React frontends, PostgreSQL storage, Redis for background jobs/caching, and Express for the API server. The monorepo includes FHIR routing/types, HL7 client/server support, a server package, React/UI packages, CLI, AWS CDK infrastructure-as-code, on-premise agent, examples, mocks, and documentation. [2]

**[Verified] Reuse model.** The platform exposes reusable FHIR resources and operations, authentication/authorization, SDKs, React components, Bots, subscriptions, and integration templates. This makes it suitable as a developer platform and lets a custom clinic product keep its data model interoperable rather than inventing a proprietary backend. [1] [2] [15] [16]

**[Verified] Deployment.** Docker Compose can bring up a full local stack with two commands. Self-hosting documentation also covers AWS, Ubuntu, GCP beta, Azure beta, and source-based deployment. The AWS path provisions or coordinates VPC, ECS/load balancing, Redis, Aurora/PostgreSQL, S3, CloudFront, Route 53, Secrets Manager, SSM, WAF, and related services, but the guide emphasizes operational complexity. [6] [21] [22]

**[Verified] Interoperability.** Medplum stores data in actual FHIR R4 format and documents US Core/USCDI, SMART-on-FHIR, Bulk Data, OAuth, HL7 V2, SFTP, CDS Hooks, FHIRcast, and custom REST/FHIR integrations. [15] [16] [24]

## Maintenance, documentation, tests, and security

**[Verified] Maintenance.** The release history shows active patch development, including scheduling, billing, lab/medication, security, dependency, and workflow changes. The version policy says patches are approximately weekly, minors two to three times per year, and majors annually. It also documents sequential minor upgrades and warns that the 36-month security-patch commitment applies to licensed Enterprise customers, not free/open-source users. [4] [20]

**[Verified] Documentation and tests.** The project has extensive official docs, decision guides, API references, self-hosting guides, examples, and a local-development guide. The repository has root test/lint/build scripts and a broad test tree across app, server, agent, CLI, FHIR, integrations, and examples; its README advertises coverage and quality-gate badges. [2] [23]

**[Verified] Security controls documented by the project.** The security policy describes TLS 1.2/1.3 in transit, AES at rest, SSO, RBAC, continuous monitoring, annual independent penetration testing, third-party assessments, and a security contact. The API documents OAuth 2.0/SMART-on-FHIR and scoped clinician/patient access patterns. [15] [17]

**[Caveat] Security is not a full audit.** The reviewed security policy is a disclosure and security-practices statement, not an independent audit report of every open-source commit or dependency. The compliance documentation says compliance is a shared responsibility and distinguishes hosted-service certifications and controls from what a self-hosting operator must configure and maintain. The score therefore recognizes documented controls but does not claim that a self-hosted So7ob deployment is HIPAA, SOC 2, ONC, or otherwise clinically/regulatorily compliant. [17] [18]

**[Unknown] Dependency security posture.** This review did not perform a complete software-composition analysis, license audit, or vulnerability audit. Third-party dependency terms and integration-provider terms must be checked separately from the Apache-licensed Medplum repository. [2] [20]

## License, services, and regulatory gate

**[Verified] License.** The repository’s exact code license is **Apache License 2.0**, an OSI-approved permissive license. It permits commercial use, modification, private deployment, and redistribution subject to license, notice, attribution, and patent-termination conditions. The repository also includes a NOTICE file, so downstream redistribution should preserve applicable notices. [19] [25] [26]

**[Verified] Community source versus commercial services.** The open-source repository and self-hosting path are distinct from Medplum’s managed hosting, automated upgrades, security monitoring, backup/disaster recovery, uptime management, enterprise response commitments, compliance assistance, and custom integration/development services. Those commercial services are not included merely by selecting the Apache-licensed repository. [5]

**[Gate — unresolved/conditional, not scored as a substitute].** The evidence reviewed does not establish clinical or regulatory approval for a So7ob-built product in a particular country or intended use. Medplum’s compliance section is a set of resources and shared-responsibility guidance; the lab-ordering page expressly says ONC (a)(2)/(a)(3) certification is in progress. Any deployment would need a separate jurisdiction-specific regulatory, privacy, clinical-safety, security, hosting, and software-validation assessment. [12] [18]

## Arabic, i18n, and RTL

**[Unknown]** The reviewed canonical repository and official docs did not provide primary evidence of Arabic translations, a locale framework covering Arabic, or RTL layout support in the Provider/App UI. Score: **0/5** pending a direct implementation check or explicit upstream documentation.

## Weighted screening score

**Score breakdown** (maximums: 20, 15, 15, 15, 10, 10, 5, 5, 5):

```text
feature_domain_fit: 12/20
architecture_reuse: 14/15
maintenance: 14/15
security_dependencies: 10/15
documentation_tests: 9/10
license_clarity: 9/10
setup_deployment: 4/5
integrations_apis: 5/5
arabic_i18n_rtl: 0/5

total: 77/100
```

**[Inference] Score rationale.** The score rewards unusually strong FHIR-native architecture, reusable clinical primitives, active maintenance, documentation, deployment tooling, and interoperability. It withholds points because the candidate is infrastructure rather than a turnkey clinic product; scheduling is beta; medication, labs, billing, and referrals commonly require custom workflows or third-party integrations; self-hosting is operationally demanding; security/compliance evidence is not a substitute for a deployment audit; and Arabic/RTL support is unverified. These are provisional screening judgments, not endorsements.

**Candidate class:** open-source FHIR clinical-software developer platform / infrastructure foundation; Provider app and examples are reusable starting points, not proof of a complete ambulatory clinic system.  
**Confidence:** medium-high for license, architecture, APIs, deployment options, and maintenance; medium for clinic workflow completeness; low for Arabic/RTL and jurisdiction-specific clinical/regulatory readiness.

## References

[1]: https://www.medplum.com/docs/ "Medplum documentation home"
[2]: https://github.com/medplum/medplum "Medplum canonical repository README"
[3]: https://www.medplum.com/ "Medplum official product site"
[4]: https://github.com/medplum/medplum/releases "Medplum releases"
[5]: https://www.medplum.com/open-source "Why Medplum Is Open Source"
[6]: https://www.medplum.com/docs/self-hosting "Self-hosting Medplum"
[7]: https://www.medplum.com/docs/provider "Medplum Provider documentation"
[8]: https://www.medplum.com/docs/charting "Medplum charting documentation"
[9]: https://www.medplum.com/docs/intake "Medplum Intake & Registration documentation"
[10]: https://www.medplum.com/docs/scheduling "Medplum Scheduling documentation"
[11]: https://www.medplum.com/docs/medications "Medplum Medications documentation"
[12]: https://www.medplum.com/docs/charting/ordering-labs-imaging "Medplum labs and imaging ordering documentation"
[13]: https://www.medplum.com/docs/billing "Medplum billing documentation"
[14]: https://www.medplum.com/docs/careplans/referrals "Medplum referrals documentation"
[15]: https://www.medplum.com/docs/api "Medplum API overview"
[16]: https://www.medplum.com/docs/integration "Medplum integration documentation"
[17]: https://github.com/medplum/medplum/security/policy "Medplum security policy"
[18]: https://www.medplum.com/docs/compliance "Medplum compliance documentation"
[19]: https://github.com/medplum/medplum/blob/main/LICENSE.txt "Medplum Apache License 2.0 file"
[20]: https://www.medplum.com/docs/compliance/versions "Medplum version policy"
[21]: https://www.medplum.com/docs/self-hosting/running-full-medplum-stack-in-docker "Running the full Medplum stack in Docker"
[22]: https://www.medplum.com/docs/self-hosting/install-on-aws "Install Medplum on AWS"
[23]: https://www.medplum.com/docs/contributing/local-dev-setup "Medplum local development setup"
[24]: https://www.medplum.com/docs/api/fhir "Medplum FHIR API overview"
[25]: https://opensource.org/license/apache-2-0 "OSI Apache License 2.0"
[26]: https://github.com/medplum/medplum/blob/main/NOTICE "Medplum NOTICE file"
