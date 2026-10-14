# OpenELIS Global — Clinic Management Candidate Evidence Note

**Checked date:** 2026-10-14  
**Candidate class:** Open-source laboratory information system (LIS) and clinic-adjacent diagnostic subsystem; **not** a practice-management EHR.  
**Official website:** https://openelis-global.org/  
**Repository:** https://github.com/I-TECH-UW/OpenELIS-Global-2  
**Overall screening score:** **79/100**  
**Confidence:** **Medium-high** for repository status, license, maintenance, deployment, and interoperability; **medium** for detailed clinic-workflow boundaries and Arabic/RTL readiness. This is a provisional screening judgment, not an endorsement.

## Key findings

**[Verified]** OpenELIS Global is a free/open-source, web-based LIS aimed at public-health and clinical laboratories. Its documented core runs from patient registration and specimen tracking through result entry, validation, reporting, quality control, inventory, analyzer connectivity, surveillance, and laboratory-network exchange. It can serve a single laboratory or a national network. [1] [2]

**[Verified]** The clinic fit is deliberately limited. OpenELIS is strong as a diagnostic subsystem for clinics or health networks that need laboratory orders, patient/sample identity, specimen traceability, analyzer ingestion, results, referrals to reference laboratories, surveillance, and standards-based exchange. The reviewed primary sources do not establish a general longitudinal patient chart, appointment scheduling, prescription management, or a complete practice-management billing workflow. The feature page mentions optional Odoo billing in a laboratory inventory context, which is not evidence of a general clinic revenue-cycle module. [1] [9]

**[Verified]** The current source and documentation show Docker/Compose deployment, an application plus database and FHIR layer, an analyzer bridge, Java 21/Maven development, a React UI, Spring-based server components, REST APIs, and a documented development/CI path. Published deployment is image-based; source development builds the stack from the checkout. [3] [5] [8] [10]

**[Verified]** Interoperability is a material strength. Official documentation describes OpenMRS order/result exchange through FHIR resources such as Task, Patient, ServiceRequest, DiagnosticReport, Observation, Specimen, Practitioner, and Encounter, with older/current workflows also documenting HL7 v2.5.1. The product documentation additionally describes FHIR R4, analyzer protocols including ASTM and HL7, national registries, DHIS2/SORMAS, and other laboratory connections. [1] [9]

**[Verified]** Maintenance evidence is strong at the check date. GitHub identifies the repository as non-archived and records current 3.2.x releases; release 3.2.3.0 was published on 2026-09-26, and the develop branch had commits on 2026-10-14. The release notes include translation updates, integration and E2E tests, FHIR work, analyzer work, dependency/security tooling, and fixes. [7] [13]

**[Verified]** The repository contains a canonical **Mozilla Public License 2.0 (MPL-2.0)** file, and GitHub reports the same SPDX license metadata. MPL-2.0 is OSI-approved. MPL-2.0 is file-level copyleft: source-form modifications to covered files remain under MPL terms, while a larger work can combine covered files with other material under separate terms if the MPL conditions are met. This conclusion concerns the community repository; it does not automatically classify third-party dependencies, submodules, implementation services, or any hosted/enterprise offering. [6] [12]

**[Verified]** The project has a security reporting policy and supported-release guidance. It identifies the application server, React UI, REST APIs, authentication/authorization, session handling, configuration, analyzer bridge, and official deployment artifacts as relevant security surfaces; it says current 3.2.x, main, and develop lines are supported while 2.x and earlier are end-of-life. Recent release notes mention Trivy scans, SBOM generation, image security artifacts, and dependency updates. [8] [13]

**[Inferred]** The architecture is reusable as a clinic diagnostic subsystem because the lab domain is exposed through standards-based exchange rather than being limited to a closed desktop workflow. A clinic would still need an EHR/EMR or practice layer for appointments, encounters beyond lab context, medications, billing, and broader care documentation. [1] [9]

**[Unknown]** No reviewed primary source provides a scoped clinical certification, regulatory authorization, independent security audit, or evidence that an OpenELIS deployment is production-ready for a specific jurisdiction. The README contains broad ISO/SLIPTA language, but that is not treated here as proof of accreditation or regulatory compliance. Local validation, configuration review, operational controls, data-protection review, and any required clinical/regulatory assessment remain separate gates.

## Clinic workflow coverage and scope limits

- **Registration and patient identity — Verified, lab-scoped.** The product documents patient registration, one-record patient management, registry/EMR synchronization, duplicate prevention, flexible identifiers, and demographics arriving with clinical-system orders. [1]
- **Patient chart and encounter — Partly verified.** Patient-linked diagnostic orders and FHIR Encounter resources are documented, but the reviewed sources do not establish a general longitudinal chart, care-plan, or comprehensive encounter-management product. [1] [9]
- **Orders and laboratory workflow — Verified and strong.** OpenELIS documents electronic orders, sample collection, accessioning, aliquots, storage, non-conformity, worklists, result entry, validation, reporting, and referral-laboratory workflows. [1] [9]
- **Appointments — Unknown.** No reviewed primary source documents clinic appointment scheduling or calendar/resource management; this is not scored as a factual failure.
- **Prescriptions/medications — Unknown / outside demonstrated scope.** No reviewed primary source documents prescribing or medication management. The OpenMRS interoperability material is about laboratory orders and results, not prescribing. [9]
- **Billing — Limited/adjacent.** The official feature page mentions optional Odoo billing in the laboratory inventory section. This supports an integration/adjacent capability, not a complete clinic billing or insurance-claims module. [1]
- **Referrals — Verified for laboratory referrals.** Reference-laboratory referrals and chain-of-custody are documented; this should not be read as a complete clinical referral-coordination workflow. [1]
- **Multi-clinic/network operation — Verified for laboratory networks.** The product describes single-facility through national-laboratory-network use and links between laboratories. The evidence does not establish multi-clinic appointment, provider, or revenue operations. [1] [2]

## Architecture, deployment, reuse, and integrations

**[Verified]** The recommended installation is Docker/Compose with an application, database, and FHIR layer. An offline installer is available for sites with unreliable connectivity, but the official installation page says it is updated less frequently than Docker images. [3]

**[Verified]** The developer path requires Docker/Compose, Java 21, Maven, and related tooling. The documented launcher builds the backend, frontend, analyzer bridge, and mock from the checkout; the documented native artifacts include a backend WAR and frontend build output. The CI guidance covers backend, frontend, and E2E lanes with isolated test databases and retained logs/browser reports. [5] [10]

**[Verified]** The repository security document describes a Java/Spring application server, React UI, REST APIs, authentication/authorization, and session handling. The repository's current development checkout also exposes FHIR, HAPI/HL7, Spring Security, PostgreSQL, Docker, and analyzer-related source/configuration; this supports reuse but does not replace a dependency or threat-model review. [8] [10]

**[Verified]** The product documentation claims FHIR R4, OpenMRS/iSantePlus exchange, HL7 v2, ASTM, flat-file analyzer interfaces, registry/EMR exchange, DHIS2/SORMAS surveillance, and offline-first operation. The OpenMRS guide gives concrete FHIR resource examples and configuration properties, which is stronger evidence than a generic integration claim. [1] [9]

## Security, dependencies, and operational caveats

**[Verified]** The project provides private vulnerability reporting and a coordinated-disclosure process. Supported lines and end-of-life boundaries are stated in the repository security policy. [8]

**[Verified]** The 3.2.3.0 release notes mention SBOM generation, Trivy scans, image security artifacts, dependency bumps, analyzer testing, and E2E/integration tests. [13]

**[Caveat]** These are project-process signals, not a full security audit. They do not prove that every dependency is currently vulnerability-free, that a particular Docker/installer configuration is hardened, or that a site has correctly configured TLS, secrets, backups, access controls, identity integration, logging, patching, and network boundaries. The security policy itself distinguishes product defects from site misconfiguration and third-party services. [8]

**[Unknown]** No independent penetration-test report, jurisdiction-specific privacy assessment, or complete third-party component license audit was found in the reviewed primary sources. The MPL-2.0 result applies to the repository's covered source, not automatically to every bundled dependency or submodule.

## Arabic, internationalization, and RTL

**[Verified]** Internationalization is active: the release history records repeated Transifex translation updates, and 3.2.3.0 added dynamic locale-bundle loading and locale/config-code matching in the language selector. [7] [13]

**[Verified]** A March 2026 official community thread says Arabic was not yet translated at the start of the thread; a contributor then received approval and began contributing. [11]

**[Unknown / weak evidence]** The reviewed primary sources do not verify a completed Arabic locale, Arabic content coverage, bidirectional layout behavior, or RTL QA. Therefore Arabic/RTL receives only a minimal score despite the underlying i18n mechanism. Do not represent OpenELIS as Arabic/RTL-ready without testing the target release and all required modules.

## Exact weighted score breakdown

The shared hub rubric is scored only from the evidence above. Missing evidence is treated as unknown, not as a factual failure. The nine components sum exactly to 79.

```json
{
  "feature_domain_fit": 14,
  "architecture_reuse": 13,
  "maintenance": 14,
  "security_dependencies": 10,
  "documentation_tests": 9,
  "license_clarity": 9,
  "setup_deployment": 4,
  "integrations_apis": 5,
  "arabic_i18n_rtl": 1
}
```

- **feature_domain_fit: 14/20.** Strong end-to-end laboratory and diagnostic workflows, patient/sample identity, results, referrals, surveillance, and network operation; not demonstrated as a general practice-management EHR.
- **architecture_reuse: 13/15.** Modular Dockerized web stack with FHIR, REST, analyzer bridge, configurable country/laboratory variation, and documented source/developer paths.
- **maintenance: 14/15.** Non-archived repository, frequent current-branch commits, regular 3.2.x releases, active translation/integration/test work, and stated supported lines. One point is held back because develop is fast-moving and release/deployment verification remains site-specific.
- **security_dependencies: 10/15.** Security policy, private disclosure, supported-line policy, dependency updates, SBOM/Trivy/image-artifact work, and security-oriented architecture evidence. Held back because no independent audit or complete advisory/dependency audit is established here.
- **documentation_tests: 9/10.** Living documentation, installation/developer guidance, FHIR/OpenMRS documentation, CI validation, unit/integration/E2E evidence, and release-linked testing. Held back because documentation completeness and test coverage for a particular deployment or module set are not independently audited.
- **license_clarity: 9/10.** Exact repository license is MPL-2.0 and OSI-approved, with a clear source license file and SPDX metadata. Held back because third-party/submodule license obligations require separate review.
- **setup_deployment: 4/5.** Docker/Compose is the recommended supported path and an offline installer exists. Held back because operational deployment still requires site-specific configuration, security, backups, upgrades, and integration work; offline installer cadence is lower.
- **integrations_apis: 5/5.** Concrete FHIR resources/workflows plus HL7 v2, ASTM, analyzer, OpenMRS/iSantePlus, registry, surveillance, and laboratory-network evidence.
- **arabic_i18n_rtl: 1/5.** Active localization infrastructure is verified, but Arabic was still being initiated in the cited community evidence and RTL behavior/coverage is not verified.

## Separate clinical/regulatory gate

**Gate status: Not established by the reviewed evidence.** OpenELIS is a serious open-source LIS candidate and may support laboratory quality workflows, but this note does not claim ISO accreditation, SLIPTA accreditation, clinical validation, medical-device status, regulatory approval, privacy compliance, or production readiness. Any So7ob adoption decision must separately verify the target country's rules, intended-use classification, laboratory quality system, clinical safety controls, validation evidence, data-protection obligations, hosting/security posture, and support/accountability arrangements.

## References

[1]: https://openelis-global.org/features-and-functionality/ "OpenELIS Global features and functionality"
[2]: https://openelis-global.org/about/ "OpenELIS Global about and mission"
[3]: https://openelis-global.org/getting-started/download/ "OpenELIS Global download and installation"
[4]: https://docs.openelis-global.org/ "OpenELIS Global documentation hub"
[5]: https://github.com/I-TECH-UW/OpenELIS-Global-2/blob/develop/README.md "OpenELIS Global canonical repository README"
[6]: https://github.com/I-TECH-UW/OpenELIS-Global-2/blob/develop/LICENSE "OpenELIS Global canonical MPL-2.0 license file"
[7]: https://github.com/I-TECH-UW/OpenELIS-Global-2/releases "OpenELIS Global GitHub releases"
[8]: https://github.com/I-TECH-UW/OpenELIS-Global-2/security "OpenELIS Global security policy and supported versions"
[9]: https://docs.openelisci.org/en/latest/deployomrs/ "OpenMRS and OpenELIS laboratory orders/results interoperability"
[10]: http://docs.openelisci.org/en/latest/dev_setup/ "OpenELIS Global development, CI validation, and deployment"
[11]: https://talk.openelis-global.org/t/arabic-translation-for-openelis-global/2030 "OpenELIS Global Arabic translation community thread"
[12]: https://opensource.org/license/mpl-2-0 "Open Source Initiative Mozilla Public License 2.0"
[13]: https://github.com/DIGI-UW/OpenELIS-Global-2/releases/tag/3.2.3.0 "OpenELIS Global 3.2.3.0 release notes"
