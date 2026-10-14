# Medplum — dated evidence note (2026-10-14)

**Candidate:** Medplum ([canonical GitHub repository][1])  
**Category:** FHIR-based clinical application infrastructure.  
**Care scope:** Open-source developer platform for building clinical software and custom EHRs, with FHIR-oriented storage and application components; it is not one fixed hospital-management product. Its own project description calls it a developer platform and lists authentication, a clinical data repository, FHIR API/SDK, basic web app/workflows, bots and React components. The project page promotes building custom EHRs rather than supplying a single turnkey hospital information system. [1] [2]

**Discovery caveat:** The official project describes its core technology as open source and links the canonical repository. This is included as an infrastructure/platform candidate rather than a turnkey EHR. [1] [2]

## What it covers—and what it does not establish

The data model is explicitly FHIR R4 4.0.1; the official API guide gives the hosted endpoint as `/fhir/R4`. FHIR resources include Patient, Medication, Procedure, CarePlan and Encounter, and Medplum adds custom resource types for user management, authentication and authorization. [3] [4] This makes it a flexible base for patient records and encounter-linked applications, but does not prove that every hospital function is delivered as a complete, ready-to-run product.

Official workflow documentation describes diagnostic ordering with `ServiceRequest`, linked Patient/Encounter/Practitioner/Organization references, results as `DiagnosticReport` and `Observation`, and a custom CPOE form/integration workflow. It distinguishes laboratory specimen collection and structured observations from imaging scheduling and reports. The documentation explicitly says provider enablement/setup is required for lab/imaging orders and states ONC certification is in progress, not achieved. [5] Medication workflows are described at product/documentation level, but this evidence does not demonstrate a complete medication management or e-prescribing product for every jurisdiction. [2] [5] Admissions/ADT are not established as a complete admission-management workflow: the Agent page gives an example HL7 ADT channel, which demonstrates integration capability, not turnkey hospital admissions. [6]

This is infrastructure with components and workflow examples, not evidence of a finished comprehensive HMIS/EHR suite. It is not a dedicated LIS. It can represent laboratory orders/results in FHIR, but external lab exchange is integration-dependent. Imaging is likewise an order/result workflow and device integration, not a full PACS. [5] [6] The Agent supports DICOM C-STORE and C-ECHO only; the docs say C-FIND, C-GET and C-MOVE are future work. [6]

## Interoperability and data model

FHIR version is unusually explicit: R4 / 4.0.1. [3] The official lab/imaging guide uses LOINC codes for examples and SNOMED CT category codes, and describes using LOINC, SNOMED and other coding systems where appropriate; support for a terminology system should not be confused with a supplied, licensed terminology service or guaranteed complete code coverage. [5] The on-prem Agent documents HL7 v2 over MLLP, ASTM (alpha), and DICOM C-STORE/C-ECHO. [6] The repository lists an HL7 client/server package. [1] Evidence does not establish native openEHR, HL7 v3/CDA coverage, or comprehensive DICOM services. ICD support is not asserted here as a product capability merely because ICD codes are mentioned in general FHIR discussions.

## Architecture, operations, maintenance

The repository describes a TypeScript/Node.js backend, React frontend, Express API, PostgreSQL storage and Redis for background jobs and caching. [1] Self-hosting documentation provides AWS (recommended), Ubuntu, and beta GCP/Azure paths, plus source installation; AWS uses CDK/CloudFormation. The guide is aimed at operators experienced in production healthcare systems. [7] Paid hosted service claims managed upgrades, backups/disaster recovery, security monitoring and reliability; those are commercial hosted-service features and must not be presumed for a self-hosted install. [2]

At the evidence date, GitHub’s release page shows recent 5.1.x releases, including 5.1.42, with dated maintenance/dependency changes in the release notes (e.g. dependency upgrades and test fixes in recent releases). This supports active maintenance, but a release feed is not an independent assurance of quality. [8] Repository materials include documentation, examples, tests and CI-related changes; a reviewed current test-coverage baseline or externally audited test adequacy was not established. [1] [8]

Self-hosters must own infrastructure operations, patching/upgrades, backup and restore validation, database security and availability planning. The official site describes hosted backups and disaster recovery but this review did not validate detailed self-hosted backup procedures or recovery objectives; treat those as deployment-specific requirements to verify. [2] [7]

## Security, privacy, vulnerabilities, compliance

Access documentation describes `AccessPolicy` rules at resource and field level, IP address rules, and SMART scopes; the official repository lists OAuth, OpenID and SMART-on-FHIR identity components. [1] [9] Product material describes audit events, and release notes mention audit logging refinements. [2] [8] These are security primitives, not proof that an adopter configured them correctly or met a regulation. For self-hosting, verify authentication setup, least privilege, secrets, TLS, encryption at rest, retention/deletion, logging, monitoring and incident response in the actual deployment.

The GitHub security policy invites vulnerability reports covering both medplum.com and the open-source GitHub codebase, describes a disclosure process, and states no formal public bug bounty. The policy also makes claims about encryption, GDPR, annual penetration testing and SOC 2-oriented organizational controls. Those claims are the project’s stated security-program assertions; they do not certify a self-hosted deployment or establish a specific product certification here. [10] A public GitHub Advisory Database entry reports a moderate SSRF issue in versions before 5.1.14, published 2026-06-02; it is therefore important to use patched versions and review the precise affected package/version and deployment exposure. [11] This review did not find a comprehensive independently verified inventory of current vulnerabilities or transitive dependencies; absence of another cited advisory is not evidence of absence.

The product site’s backend page markets “HIPAA and SOC2 compliance out of the box,” while the open-source-commercial boundary page places compliance support among paid hosted-platform benefits. Those statements are not treated as evidence that the open-source code alone, any self-hosted deployment, a customer, or a clinical workflow is HIPAA/SOC 2 certified or compliant. The explicit open-source page says hosted deployments provide compliance support, including SOC2/HITRUST and other frameworks. [2] [12] The CPOE documentation says ONC certification is in progress. No ONC certification or clinical-safety certification is claimed by this assessment. [5]

## License and commercial boundary

The repository’s exact root license file is `LICENSE.txt`, which begins with the Apache License, Version 2.0 (January 2004). [13] The official open-source page says most of Medplum—including the FHIR server, core APIs, SDKs, React library, CLI, docs and examples—is Apache 2.0 and can be commercially used, modified, privately deployed and forked. It is careful to say “most,” not necessarily every related service or offering. [2] Hosted infrastructure, automated upgrades, monitoring, backups/disaster recovery, reliability management, compliance support, enterprise support and consulting are described as paid services. Check each package and any third-party dependencies/licenses separately; Apache licensing of the project does not relicense those components or grant trademark rights. [2] [13]

## Localization, testing, confidence

No official evidence located in the reviewed sources establishes Arabic translation coverage or right-to-left (RTL) support. Treat Arabic/RTL readiness as unverified and test actual app components, forms, search, date/number handling and generated clinical text before deployment. The repository documents tests/examples and recent test-related work, but not a reviewed independent validation of clinical suitability. [1] [8]

**Screening score (desk research only): 68/100.** The score is a comparative screening judgment, not a recommendation, certification or safety assessment.

```json
{
  "hospital_ehr_fit": 10,
  "interoperability_data_model": 13,
  "maintenance": 14,
  "security_privacy_dependencies": 9,
  "docs_tests": 8,
  "license_clarity": 9,
  "setup_deployment": 4,
  "arabic_localization_rtl": 1,
  "clinical_regulatory_evidence": 0
}
```

**Arithmetic:** 10 + 13 + 14 + 9 + 8 + 9 + 4 + 1 + 0 = **68**. Scores by rubric: hospital/EHR fit 10/20; interoperability/data model 13/15; maintenance 14/15; security/privacy/dependencies 9/15; docs/tests 8/10; license clarity 9/10; setup/deployment 4/5; Arabic/localization/RTL 1/5; clinical/regulatory evidence 0/5.

**Confidence:** Medium for platform scope, FHIR version, license, architecture and listed integrations, all supported by official primary sources. Lower for real-world deployment fitness, depth/completeness of workflows, current dependency exposure, operational controls, Arabic/RTL and jurisdictional clinical/regulatory status. The source review is a dated desk screen, not code audit or procurement diligence.

## References

[1]: https://github.com/medplum/medplum "Medplum canonical GitHub repository"
[2]: https://www.medplum.com/open-source "Why Medplum Is Open Source"
[3]: https://www.medplum.com/docs/api/fhir "FHIR API overview"
[4]: https://www.medplum.com/docs/fhir-basics "FHIR Basics"
[5]: https://www.medplum.com/docs/labs-imaging/ordering-labs-imaging "Order Labs and Imaging"
[6]: https://www.medplum.com/docs/agent "Intro to Medplum Agent"
[7]: https://www.medplum.com/docs/self-hosting "Self-hosting Medplum"
[8]: https://github.com/medplum/medplum/releases "Medplum GitHub releases"
[9]: https://www.medplum.com/docs/access "Authorization and Access Control"
[10]: https://github.com/medplum/medplum/security/policy "Medplum security policy"
[11]: https://github.com/advisories/GHSA-w852-7r27-32c6 "GitHub Advisory GHSA-w852-7r27-32c6"
[12]: https://www.medplum.com/docs/developers/backend "Medplum product and backend overview"
[13]: https://github.com/medplum/medplum/blob/main/LICENSE.txt "Medplum LICENSE.txt (Apache License 2.0)"
