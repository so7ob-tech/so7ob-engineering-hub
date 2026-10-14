# OpenClinic GA — clinic-management candidate evidence note

**Checked date:** 2026-10-14  
**Candidate:** OpenClinic GA  
**Slug:** `openclinic-ga`  
**Category:** integrated hospital and clinic information-management system  
**Official project page:** <https://sourceforge.net/projects/open-clinic/>  
**Candidate class:** **Community/open-source distribution with optional commercial support**, not a hosted SaaS listing. The official project page names Post-Factum BV as owner and says commercial support is available; no enterprise/hosted service is being scored as part of the community code candidate. [1]

## Key findings

- **[Verified] Strong domain fit for a resource-constrained hospital or clinic.** The project describes administrative, financial, clinical, laboratory, X-ray, pharmacy, meals, statistics/reporting, scheduling, ADT, insurance billing, human resources, and multilingual operation. It also lists coding/thesaurus support, lab-analyzer exchange, PACS/DICOM, HL7/FHIR exchange, and teleconsultation capabilities. [1] The older technical manual describes a patient-centered medical record, prescriptions, laboratory and imaging order/results workflows, visit/admission invoicing, payments, and discharge/end-of-visit invoicing. [5]
- **[Verified] Technology and reuse surface are substantial.** The IDB profile identifies Java and classifies the product as a web app, API, and mobile app. [7] The official technical documentation describes a web-based OpenIT architecture using Java, Tomcat, and PostgreSQL or Sybase in its open-source backbone. [5] The current SourceForge development directory exposes a 278.4 MB code archive and a 3.5 MB Javadoc archive, both modified 2026-10-10. [4]
- **[Verified] Current maintenance evidence exists, but it is not the same as a transparent governance process.** SourceForge reports a version-5 release directory modified 2026-10-10, with Linux 64-bit artifacts and Windows installers named `OpenClinicSetup5.367.19_update_fr_en_pt_es_nl.exe` and `OpenClinicSetup5.367.19_64bit_full_fr_en_pt_es_nl.exe`. [10] The reviewed official pages do not expose a public issue tracker, pull-request history, security-advisory policy, SBOM, or release-notes/change-log process. **[Unknown]** The file dates alone do not establish response SLAs or production support quality.
- **[Verified] APIs and interoperability are unusually strong for this shortlist.** The official feature list claims HL7/FHIR API exchange, HL7-based laboratory-analyzer integration, DCM4CHE/Weasis PACS/DICOM integration, and WebRTC teleconsultation. [1] The official source archive listing contains HAPI REST resource providers, OpenClinic API classes, HL7 client/server/parser classes, FHIR/OpenIMIS classes, and web API endpoints for imaging, invoices, lab, pharmacy, and other data. [4]
- **[Verified] Localization is limited in the evidence reviewed.** The project page names English, French, Dutch, Spanish, and Portuguese, and describes country-specific localizations. [1] **[Unknown]** Arabic translation, RTL layout, and Arabic-language clinical terminology were not evidenced in the reviewed official pages or source-archive listing; they should not be assumed.
- **[Verified/qualification] Security controls are described, but current assurance is not demonstrated.** The technical manual describes password-hash storage, configurable password policies, role/profile and per-user access rights, temporary lockout, IP refusal after repeated unknown-user attempts, and page-access audit logging. [5] Those descriptions are from an older manual and do not establish that the current release has modern secure defaults, dependency patching, hardening guidance, or an independently reviewed security posture. The reviewed official project pages provide no security-advisory policy or SBOM. **[Unknown]** This is a material due-diligence gap, not a finding that the system is insecure.
- **[Verified] License evidence is internally inconsistent at the catalog level.** The SourceForge project page says “GNU Library or Lesser General Public License version 2.0 (LGPLv2).” [1] The IDB catalog labels it “GNU General Public License version 2,” which conflicts with the canonical project-page label. [7] For screening, the project-page declaration plus the official SourceForge LGPL PDF are treated as the stronger project-specific evidence; exact licensing of every bundled/third-party component remains **unknown**. LGPLv2.0 is an OSI-listed license, but the OSI page notes that this historical license has been superseded by LGPLv3. [8] GNU identifies the exact historical text as GNU Library General Public License, version 2.0 and explains its source-code and redistribution conditions. [9]

## Clinic workflow coverage

**[Verified]** Registration/patient administration, admissions/discharges/transfers, patient medical record/encounters, scheduling, prescriptions, pharmacy stock, billing/payments/insurance, laboratory orders/results, imaging orders/results, pathology, reporting/statistics, and multilingual deployment are represented in the official project description and technical manual. [1] [5] The manual specifically says the medical record is the core object, supports medication prescriptions, and links accountable acts such as laboratory results, X-ray reports, prescriptions, and vaccinations to invoices. [5]

**[Verified]** Insurance and billing are not merely generic claims: the project describes integrated public/private insurance management for Central African, East African, and Peruvian contexts, while the manual describes visit/admission invoices, payment/cash-transfer registration, and discharge/end-of-visit invoicing. [1] [5]

**[Unknown]** A dedicated referral-management workflow and a clearly documented multi-clinic/tenant model were not established by the reviewed primary sources. Country-specific implementations and support for multiple facility contexts are not proof of tenant isolation or a multi-clinic operating model. **[Unknown]** Clinical decision-support scope, e-prescribing standards, offline behavior, data migration, and local regulatory configuration also require implementation-specific verification.

## Architecture, deployment, and integrations

**[Verified]** The architecture evidence points to a Java web application with API/mobile surfaces, a central application-server/database model, and a configurable/customizable extension approach. [5] [7] The technical manual says the open-source backbone used Java, Tomcat, and PostgreSQL or Sybase, and that end users work through a standard web browser. [5]

**[Verified]** Official SourceForge provides Windows installers, Linux 64-bit artifacts, device images, source, Javadoc, and a “Compiling OpenClinic source code in Eclipse” document. [3] [4] [10] **[Unknown]** The current supported Java/Tomcat/database versions, containerized deployment, automated upgrade/rollback path, and reproducible build instructions were not established from the reviewed pages.

**[Verified]** Interoperability claims include HL7, FHIR, LOINC, SNOMED CT, ICD-10/ICPC-2, lab analyzers, DICOM/PACS, WebRTC, and mobile barcode use. [1] The source archive listing corroborates several of these surfaces with REST, HL7, FHIR/OpenIMIS, and web API source paths. [4] **[Unknown]** Conformance profiles, authentication/authorization requirements for each API, error semantics, version compatibility, and test coverage for integrations were not documented in the reviewed sources.

## Exact weighted rubric (provisional screening judgment)

The nine values below use the required keys and sum to **73/100** exactly. Missing evidence is treated as unknown rather than as a factual failure.

```yaml
score_breakdown:
  feature_domain_fit: 19
  architecture_reuse: 12
  maintenance: 13
  security_dependencies: 7
  documentation_tests: 5
  license_clarity: 8
  setup_deployment: 4
  integrations_apis: 5
  arabic_i18n_rtl: 0
total_score: 73
```

- **feature_domain_fit: 19/20.** **[Verified]** Broad clinic/hospital workflow coverage and unusually strong lab, pharmacy, billing, ADT, scheduling, reporting, and insurance evidence. One point is withheld because referrals and a clearly documented multi-clinic model were not established.
- **architecture_reuse: 12/15.** **[Verified]** Java/web/API/mobile classification, source and Javadoc archives, web-based architecture, and customization claims support reuse. **[Unknown]** Current build reproducibility, extension contracts, and component boundaries are not sufficiently documented.
- **maintenance: 13/15.** **[Verified]** SourceForge shows code/Javadoc and release artifacts modified 2026-10-10, and the archive listing exposes source files with recent timestamps. [2] [4] [10] **[Unknown]** There is no reviewed public issue/PR or security-response history, so activity cannot be equated with governance or support quality.
- **security_dependencies: 7/15.** **[Verified]** The older manual documents access controls, password handling, lockouts, intrusion blocking, and audit trails. [5] **[Unknown]** Current dependency inventory, SBOM, vulnerability-management policy, secure deployment baseline, and independent security testing were not found in the reviewed primary evidence.
- **documentation_tests: 5/10.** **[Verified]** A technical manual, ADT manual, sample technical proposal, license/privacy documents, Javadoc, and source-compilation documentation are listed. [3] **[Unknown]** No maintained automated test suite, CI results, coverage reports, or current API reference was established.
- **license_clarity: 8/10.** **[Verified]** The canonical SourceForge project page declares LGPLv2 and publishes an LGPL license document; LGPLv2.0 is OSI-listed. [1] [3] [8] **[Caveat]** IDB labels the tool GPLv2, and the licenses of all bundled/third-party components were not inventoried. [7]
- **setup_deployment: 4/5.** **[Verified]** Windows installers, Linux 64-bit artifacts, device images, and source-compilation documentation are available. [3] [10] **[Unknown]** Current supported runtime versions, upgrade/backup/rollback procedures, and reproducible deployment are not clear.
- **integrations_apis: 5/5.** **[Verified]** HL7/FHIR APIs, lab interfaces, DICOM/PACS, REST/API source paths, and teleconsultation are explicitly documented. [1] [4]
- **arabic_i18n_rtl: 0/5.** **[Verified]** Five non-Arabic languages are named. [1] **[Unknown]** Arabic and RTL support were not evidenced; zero reflects lack of positive primary evidence, not proof that customization is impossible.

## License, security, and clinical/regulatory gate

**License suitability:** Treat the candidate as **LGPLv2.0 according to the canonical project page**, while flagging the IDB GPLv2 label for clarification before redistribution or modification. [1] [7] LGPLv2.0 is OSI-listed, but it is a historical/superseded license, and a deployment still needs a component-level license inventory and notices for third-party libraries. [8] [9]

**Security caveat:** The score is not a security audit. The manual’s controls are useful evidence of application-level authorization and auditing, but its age and the absence of a reviewed current advisory policy, SBOM, dependency update policy, or independent assessment mean that a real deployment would require a release-specific security review, hardening review, backup/access-control design, and vulnerability scan. No partial advisory search is presented as a full audit.

**Clinical/regulatory gate:** No reviewed primary source establishes regulatory approval, clinical-safety certification, medical-device status, privacy-law compliance, or suitability for a specific national health authority. The project’s stated implementations and modules are evidence of scope and adoption claims, not proof of clinical or regulatory compliance. **Production readiness is therefore not endorsed by this note.**

**Confidence:** **Moderate.** Confidence is high for the project’s stated modules, source/release artifacts, API claims, and project-page license label; it is moderate-to-low for current security posture, dependency licensing, test maturity, Arabic/RTL capability, referrals, multi-clinic semantics, and deployment reproducibility because those items were not demonstrated by current primary evidence.

## References

[1]: https://sourceforge.net/projects/open-clinic/ "OpenClinic GA official SourceForge project page"
[2]: https://sourceforge.net/projects/open-clinic/files/ "OpenClinic GA official SourceForge files index"
[3]: https://sourceforge.net/projects/open-clinic/files/Documentation/EN/ "OpenClinic GA official English documentation directory"
[4]: https://sourceforge.net/projects/open-clinic/files/Development/code/ "OpenClinic GA official development code and Javadoc directory"
[5]: https://sourceforge.net/projects/open-clinic/files/Documentation/EN/openclinic%20technical%20documentation.pdf/ "OpenClinic GA official technical documentation"
[6]: https://sourceforge.net/projects/open-clinic/files/Documentation/EN/openclinic_manual_en_adt.pdf/download "OpenClinic GA official ADT manual"
[7]: https://knowledge.iadb.org/en/open-knowledge/code-development/open-source-solution/openclinic-ga "Inter-American Development Bank OpenClinic GA profile"
[8]: https://opensource.org/license/lgpl-2-0/ "Open Source Initiative GNU LGPL 2.0 license page"
[9]: https://www.gnu.org/licenses/old-licenses/lgpl-2.0.html "GNU official GNU Library General Public License version 2.0"
[10]: https://sourceforge.net/projects/open-clinic/files/Releases/OpenClinic%20version%205/ "OpenClinic GA official version 5 release directory"
