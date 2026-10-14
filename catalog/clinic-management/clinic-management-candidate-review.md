# Clinic Management candidate review

**So7ob Engineering Knowledge Hub**  
**Screening date:** 2026-10-14  
**Candidate count:** 10 verified candidates  
**Research failures:** None

GNU Health has the highest aggregate screening score (**86/100**), followed by OpenEMR (**84/100**), CARE HMIS (**83/100**), and OpenMRS (**82/100**). That ranking is not a clinic-product leaderboard: the rubric rewards documented domain breadth, architecture/reuse, maintenance, documentation, license clarity, deployment, interoperability, and Arabic/i18n evidence. It does not measure implementation effort, clinical safety, legal eligibility, local payer fit, or whether a product is turnkey. GNU Health, for example, is broad and modular but has an explicitly incomplete, read-only FHIR layer and no verified Arabic/RTL readiness; OpenEMR is a more direct ambulatory practice-management fit even though its security score is lower. [1] [2] [3]

For the So7ob shortlist, **OpenEMR is the strongest direct clinic/practice-management candidate**: its evidence covers registration, appointments, encounters, prescriptions, billing, labs, referrals, portal, multiple facilities, and REST/FHIR/SMART surfaces. **CARE HMIS** is a strong integrated clinic/HMIS platform when a separate frontend and multi-service deployment are acceptable. **GNU Health** is strongest when a facility wants primary-care, specialty, laboratory, pharmacy, stock, billing, and social-medicine breadth in one modular HMIS. **OpenMRS** is a strong configurable foundation, not a finished workflow. **Marley Health** is compelling for teams already willing to operate the Frappe/ERPNext stack. [1] [2] [3] [4] [5]

Arabic/RTL should be treated as a deployment acceptance test, not inferred from a language selector. OpenEMR documents Arabic, UTF-8, and RTL; OpenMRS documents Arabic and RTL capability; Marley verifies Arabic/RTL behavior in the patient portal; Open Hospital has an Arabic resource but visible untranslated strings; the remaining candidates have incomplete, weak, or unverified Arabic/RTL evidence. None of those claims establishes complete terminology, bidirectional layout, print/report support, or cross-module usability. [1] [3] [6] [7]

Every candidate also remains subject to independent **license, security, interoperability, privacy, clinical-safety, regulatory, and production-readiness gates**. The evidence notes are point-in-time product screens, not approval to process real patient data.

## Clinic/practice-management products

### OpenEMR — direct ambulatory EHR and practice-management fit

**Provisional score: 84/100.** Evidence note: [01-openemr.md](../../research-sources/clinic-management-candidates/01-openemr.md).

**Scope and strongest fit.** OpenEMR is the most direct match for a day-to-day outpatient clinic. Its official feature evidence covers patient registration and demographics; appointments and patient flow; longitudinal encounters and charting; medications and e-prescribing; labs, procedures, and referrals; portal functions; multiple facilities; billing, claims, eligibility, receivables, coding, and electronic remittance workflows. The documented interoperability surface includes Standard REST, FHIR R4, US Core, SMART on FHIR, OAuth 2.0/OpenID Connect, granular scopes, bulk export, CCD generation, and Swagger/API material. Arabic, UTF-8, and RTL are explicitly listed. [1] [8] [9]

The repository shows substantial current activity, production Docker/Compose paths, CI and layered tests, and current runtime requirements. This makes OpenEMR a strong candidate for a clinic that wants an existing ambulatory workflow rather than a framework from which to assemble one. Reuse is primarily through configuration, forms/modules, deployment, and APIs; extracting small clinical components would likely require material engineering work. [1] [10]

**Material limitations.** The 8.4.0 release notes disclose critical, high, and medium fixes involving RCE, SQL injection, SSRF, authorization/IDOR, PHI, portal, and FHIR paths. A security-reporting policy exists, but no supported-version matrix or response SLA was established. Arabic/RTL is a documented capability, not verified translation completeness or visual QA. Multiple facilities and site-qualified API paths do not prove the exact tenant isolation, cross-site reporting, or governance model So7ob may need. No reviewed source establishes target-jurisdiction compliance, clinical validation, availability, backup/recovery objectives, or local payer connectivity. [1] [11] [12]

**License and maintenance.** The canonical root license is GPL-3.0; Composer metadata says GPL-3.0-or-later, so the metadata discrepancy and third-party license/notice inventory should be clarified before redistribution. Maintenance evidence is strong, with a large active repository, current commits, and a recent 8.4.1 release. [1] [13] [14]

**Score check:** feature/domain 19/20; architecture/reuse 12/15; maintenance 15/15; security/dependencies 7/15; documentation/tests 9/10; license clarity 8/10; setup/deployment 4/5; integrations/APIs 5/5; Arabic/i18n/RTL 5/5 = **84/100**.

### Marley Health — Frappe/ERPNext clinic and HIS application

**Provisional score: 78/100.** Evidence note: [07-marley-health.md](../../research-sources/clinic-management-candidates/07-marley-health.md).

**Scope and strongest fit.** Marley Health is a strong provisional clinic fit for a team prepared to operate Frappe/ERPNext Bench. Its data model documents appointments, encounters, diagnoses, drug prescriptions, lab prescriptions and results, clinical procedures, rehabilitation, referrals/service requests, insurance, invoicing, pharmacy/stock through the ERP stack, and patient-portal workflows. Healthcare Service Units provide facility/service-unit and practitioner-schedule modeling. The portal uses REST/whitelisted Frappe calls for settings, patients, departments, practitioners, slots, fees, appointments, diagnostics, print formats, and lookups. [4] [15] [16] [17] [18]

Arabic evidence is stronger than a generic translation claim: portal tests contain Arabic strings, test `portal_lang = 'ar'`, verify localized dates, and portal boot/HTML logic handles language direction. That evidence is limited to the portal path; full desk, reports, print formats, and upstream ERPNext screens remain unknown. [19] [20] [21] [22]

**Material limitations.** The complete deployment depends on Frappe and ERPNext, creating upgrade, permissions, backup, and dependency-management obligations. FHIR is described as a design direction, but no public conformance schema, external laboratory adapter, SMART profile, or interoperability certification was verified. No complete multi-clinic tenancy, cross-site reporting, or data-isolation model was established. The repository has CI, CodeQL, permission tests, and current releases, but no current `SECURITY.md` was found and Dependabot covers GitHub Actions rather than the full Python/Node/Bench graph. Clinical/regulatory status, production readiness, migration quality, disaster recovery, and local payer/e-prescribing/laboratory compliance remain open. [4] [23] [24] [25]

**License and maintenance.** The Marley app is GPL-3.0; the patient-portal package declares MIT, while Frappe/ERPNext and all transitive components require separate inventory. Recent releases, develop commits, CI, CodeQL, and permission tests support active maintenance, but not an SLA. [4] [26] [27]

**Score check:** feature/domain 16/20; architecture/reuse 12/15; maintenance 14/15; security/dependencies 9/15; documentation/tests 7/10; license clarity 9/10; setup/deployment 4/5; integrations/APIs 4/5; Arabic/i18n/RTL 3/5 = **78/100**.

### CARE HMIS — integrated clinical operations platform

**Provisional score: 83/100.** Evidence note: [08-care-hmis.md](../../research-sources/clinic-management-candidates/08-care-hmis.md).

**Scope and strongest fit.** CARE covers registration, appointments and queues, OPD/emergency/inpatient flows, encounters, notes, diagnoses, orders and results, prescriptions and dispensing, pharmacy/inventory, diagnostics, billing/payments, referrals, reporting, roles/audit, telemedicine extensions, and facility operations. Its backend exposes patient, encounter, appointment, medication, diagnostic report, specimen, observation, invoice, payment reconciliation, inventory, facility, organization, and service-request areas. A separate CARE frontend is required; the candidate repository alone is the backend/core. [28] [29] [30]

The Django/Python backend, React/TypeScript frontend, PostgreSQL, Redis/Celery, object storage, generated APIs, plugin model, Docker Compose setup, fixtures, backups, and broad backend/frontend test evidence support reuse. The official material claims FHIR R5-aligned APIs and terminology support, and the source tree corroborates an API-oriented design. [28] [31] [32] [33]

**Material limitations.** A usable clinic deployment requires both repositories, configuration, identity and messaging integrations, and operational controls. The plugin architecture is real, but the checked core plugin list was empty; advertised extensions are not automatically included in the release. The Compose file uses a mutable `pgsty/silo:latest` object-storage image, creating reproducibility and supply-chain risk. Only the latest version is covered by the security policy, and no full audit, supported-version matrix, or certification was established. Checked frontend locales were English, Hindi, Kannada, Malayalam, Marathi, and Tamil; no Arabic locale or RTL mode was evidenced. Product claims about deployment scale are project claims rather than independent assurance. [28] [34] [35] [36]

**License and maintenance.** Backend and frontend repositories state MIT, an OSI-approved permissive license, but dependencies, plugins, terminology, hosted services, and integrations retain separate terms. Current repository activity and tests are positive, while regular tagged-release cadence is less clear. [28] [37] [38]

**Score check:** feature/domain 19/20; architecture/reuse 14/15; maintenance 13/15; security/dependencies 8/15; documentation/tests 8/10; license clarity 10/10; setup/deployment 5/5; integrations/APIs 5/5; Arabic/i18n/RTL 1/5 = **83/100**.

### Open Hospital — lightweight, offline-capable small-facility system

**Provisional score: 78/100.** Evidence note: [06-open-hospital.md](../../research-sources/clinic-management-candidates/06-open-hospital.md).

**Scope and strongest fit.** Open Hospital is a practical option for a small clinic or health center with constrained connectivity or hardware. The mature desktop/portable and LAN client/server paths cover registration, patient history and encounters, OPD, appointments, therapy/prescriptions, pharmacy and stock, billing, laboratory, admissions/discharge, vaccinations, pregnancy/birth-related workflows, and reports. Portable mode can operate without Internet connectivity; client/server mode uses a central MariaDB/MySQL database. [6] [39] [40]

The code is separated into core, Swing GUI, API, and React UI components. Java 17/Maven, Spring Boot API, OpenAPI/Swagger, JWT-related dependencies, Docker Compose, administrator/user manuals, and tests are documented. The project released v1.15.2 on 2026-10-12 and showed current commit activity. [6] [41] [42] [43]

**Material limitations.** The API and React UI are explicitly WIP/early-stage; the mature path is the desktop application. Referral fields and reports exist, but closed-loop referral exchange and a referral network are not demonstrated. No multi-clinic/tenant model, HL7/FHIR exchange, national registry integration, or stable external API contract was evidenced. The API security configuration disables CSRF and permits broad methods/headers subject to configured origins; the host repository has no `SECURITY.md`. Arabic resources exist but contain untranslated English values, and supported RTL behavior/QA is unknown. Current compatibility, backup, and production hardening require site review. [6] [44] [45]

**License and maintenance.** Application code is GPLv3; documentation policies are CC BY-SA 4.0; dependency notices require separate review. The release history is active, but activity does not establish support or security SLAs. [6] [46]

**Score check:** feature/domain 17/20; architecture/reuse 12/15; maintenance 14/15; security/dependencies 8/15; documentation/tests 8/10; license clarity 9/10; setup/deployment 4/5; integrations/APIs 3/5; Arabic/i18n/RTL 3/5 = **78/100**.

## Configurable EHR and HMIS foundations

### GNU Health HMIS — broadest facility-management scope

**Provisional score: 86/100 (highest aggregate score).** Evidence note: [02-gnu-health.md](../../research-sources/clinic-management-candidates/02-gnu-health.md).

**Scope and strongest fit.** GNU Health combines primary care and health-facility management with encounters, clinical history, appointments, prescriptions, insurance and billing, pharmacy/stock, laboratory orders and reports, imaging, and health-center administration. Its modular Python/Tryton design includes more than 40 standard-based packages spanning primary care, obstetrics/gynecology, pediatrics, surgery, LIS, imaging, dentistry, and reporting. Federation supports distributed nodes, and documented installation options include native installation, Ansible, packages, VM, and embedded paths. [2] [47] [48]

This breadth explains the top score: strong feature coverage, modular reuse, current activity, extensive documentation, clear GPL-3+ licensing, and operational guidance. The evidence is especially attractive for a clinic that may grow into a broader facility or social-medicine deployment rather than needing only appointment and billing workflows. [2] [49]

**Why it is not automatically the best clinic product.** The official FHIR documentation says the FHIR/REST server is still in development, does not fulfill the FHIR specification, is read/search oriented, exposes 12 resources, and has no write functionality. Arabic completeness, Arabic terminology, RTL behavior, and clinical validation are unknown. Federation is not proof of a single-instance multi-clinic tenancy model, and dedicated referral workflow was not established. The stack requires Python/Tryton/PostgreSQL operations and version-specific deployment decisions; security guidance is useful but not a full audit or SLA. [2] [50] [51]

**License and maintenance.** GNU Health is GPL-3+; bundled Tryton material and documentation assets have their own applicable licenses, including CC-BY-SA-4.0 for documentation. The repository is active and non-archived with current updates and 5.0.x releases. [2] [52] [53]

**Score check:** feature/domain 18/20; architecture/reuse 14/15; maintenance 15/15; security/dependencies 10/15; documentation/tests 9/10; license clarity 10/10; setup/deployment 4/5; integrations/APIs 4/5; Arabic/i18n/RTL 2/5 = **86/100**.

### OpenMRS — modular EHR platform requiring implementation assembly

**Provisional score: 82/100.** Evidence note: [03-openmrs.md](../../research-sources/clinic-management-candidates/03-openmrs.md).

**Scope and strongest fit.** OpenMRS is a strong foundation for a patient-centered, configurable record across sites. Official evidence covers registration, patient search, clinical documentation, diagnosis tracking, forms, appointments, queues, programs, billing, stock, labs, dispensing, role permissions, audit logging, and REST/FHIR interoperability. O3 documentation gives concrete configuration evidence for registration, patient search, appointment statuses, service queues, active visits, lists, wards/beds, and programs. [3] [54] [55]

The Java/Maven modular architecture, WAR deployment to Tomcat/Jetty, Docker paths, separate API/web components, and FHIR2 resource-provider/service/translator/DAO layers provide strong engineering reuse. The project has active commits, a recent 2.8.10 release, maintained documentation, test trees, and private vulnerability reporting. OpenMRS officially claims Arabic translation and RTL capability. [3] [56] [57] [58]

**Material limitations.** OpenMRS core is not a turnkey clinic workflow. Implementers must select a distribution, UI applications, modules, configuration, integrations, and operational controls. Referral workflow was not established; prescription lifecycle, billing depth, lab order/result workflows, and connector coverage were only partly evidenced. Docker documentation is described as work in progress and includes example development credentials. Arabic completeness and cross-screen RTL QA remain unknown. No clinical/regulatory approval, medical-device status, jurisdictional compliance, or production readiness was established. [3] [59]

**License and maintenance.** Core is MPL-2.0 with an OpenMRS healthcare disclaimer; selected modules, distributions, and dependencies require a separate inventory. Maintenance evidence is strong, but does not prove a support SLA. [3] [60] [61]

**Score check:** feature/domain 17/20; architecture/reuse 13/15; maintenance 14/15; security/dependencies 8/15; documentation/tests 8/10; license clarity 9/10; setup/deployment 4/5; integrations/APIs 5/5; Arabic/i18n/RTL 4/5 = **82/100**.

### Bahmni — integrated low-resource EMR/HIS distribution

**Provisional score: 76/100.** Evidence note: [04-bahmni.md](../../research-sources/clinic-management-candidates/04-bahmni.md).

**Scope and strongest fit.** Bahmni integrates OpenMRS, OpenELIS, Odoo, DCM4CHEE/PACS, reporting, and Bahmni-specific components. It documents registration, point of care, encounters, appointments, treatment/drug orders, investigations/results, billing/inventory, location-aware workflows, REST/FHIR resources, Atom Feed synchronization, offline-oriented operation, and a React/TypeScript frontend with extensibility and tests. It is a sensible choice where a clinic or small hospital wants an integrated distribution rather than assembling each subsystem independently. [62] [63] [64] [65]

**Material limitations.** The stack is multi-service and operationally complex. Complete referral workflow, multi-clinic tenancy/organization governance, full pharmacy behavior, and cross-site isolation were not demonstrated. Licensing is heterogeneous and in an ongoing AGPL-to-MPL-with-healthcare-disclaimer transition; the assembled stack includes upstream products with separate terms. i18n infrastructure exists, but the reviewed community evidence said Bahmni was not Arabic/RTL-ready and referenced an RTL work item; no current full Arabic/RTL experience was proved. Security evidence is a reporting channel and tooling references, not an audit, hardening baseline, dependency assessment, or SLA. [62] [66] [67]

**License and maintenance.** `bahmni-package` is AGPL-3.0-or-later; Bahmni core and modern frontend carry MPL-2.0 texts, while upstream components retain their licenses. Recent commits support active maintenance, but the package repository did not provide a current release stream at check time. [62] [68]

**Score check:** feature/domain 17/20; architecture/reuse 13/15; maintenance 14/15; security/dependencies 8/15; documentation/tests 8/10; license clarity 7/10; setup/deployment 4/5; integrations/APIs 4/5; Arabic/i18n/RTL 1/5 = **76/100**.

## Broader, legacy, and specialist candidates

### OpenClinic GA — broad legacy clinic/HIS platform

**Provisional score: 73/100.** Evidence note: [05-openclinic-ga.md](../../research-sources/clinic-management-candidates/05-openclinic-ga.md).

**Scope and strongest fit.** OpenClinic GA has unusually broad clinic/hospital scope for a resource-constrained setting: patient records and encounters, ADT, scheduling, prescriptions/pharmacy, billing/payments/insurance, laboratory, imaging/pathology, reports, multilingual deployment, and stated HL7/FHIR, DICOM/PACS, analyzer, and teleconsultation integrations. Source and Javadoc archives, Windows installers, Linux artifacts, and Java/Tomcat/PostgreSQL-oriented documentation provide a substantial reuse and deployment surface. [69] [70] [71]

**Material limitations.** The technical manual and security-control descriptions are old relative to current releases. No current security-advisory policy, SBOM, dependency-update policy, automated test/coverage evidence, current API reference, reproducible build, or production hardening baseline was established. Referral workflow and multi-clinic/tenant semantics are unknown. Arabic/RTL is unverified; named languages are English, French, Dutch, Spanish, and Portuguese. Interoperability is a claim supported by source paths, but conformance profiles, authentication requirements, version compatibility, and integration tests are not documented. [69] [72]

**License and maintenance.** The canonical SourceForge project page states LGPLv2.0, while an IDB profile labels it GPLv2; treat LGPLv2.0 as the stronger project-specific evidence but clarify before redistribution. Current SourceForge artifacts show activity, but not transparent governance or a support SLA. [69] [73] [74]

**Score check:** feature/domain 19/20; architecture/reuse 12/15; maintenance 13/15; security/dependencies 7/15; documentation/tests 5/10; license clarity 8/10; setup/deployment 4/5; integrations/APIs 5/5; Arabic/i18n/RTL 0/5 = **73/100**.

### OpenELIS Global — diagnostic/LIS subsystem, not a general clinic EHR

**Provisional score: 79/100.** Evidence note: [09-openelis-global.md](../../research-sources/clinic-management-candidates/09-openelis-global.md).

**Scope and strongest fit.** OpenELIS Global is a strong specialist subsystem for laboratory orders, patient/sample identity, specimen traceability, accessioning, aliquots, storage, non-conformity, worklists, result entry and validation, reporting, analyzer integration, laboratory referrals, surveillance, and laboratory-network exchange. It documents Docker/Compose deployment, an application/database/FHIR layer, analyzer bridge, React UI, Spring/Java stack, CI, and offline installation. Interoperability is a material strength: FHIR R4 resources and workflows, HL7 v2.5.1, ASTM, analyzer interfaces, OpenMRS/iSantePlus exchange, registries, and DHIS2/SORMAS are documented. [75] [76] [77]

**Material limitations.** It is not evidenced as a practice-management EHR: appointments, prescribing, comprehensive longitudinal charting, and general clinic billing remain outside demonstrated core scope. Patient/encounter support is lab-scoped, and referrals are laboratory referrals rather than complete clinical referral coordination. Arabic translation was only beginning in the cited official thread; no completed Arabic locale or RTL QA was established. Security policy, supported-release guidance, SBOM/Trivy work, and release testing are positive process signals, not an independent audit or jurisdictional compliance assessment. [75] [78] [79]

**License and maintenance.** The repository is MPL-2.0 with clear SPDX metadata and active 3.2.x releases/commits. Third-party dependencies and submodules require a separate license and vulnerability review. [75] [80] [81]

**Score check:** feature/domain 14/20; architecture/reuse 13/15; maintenance 14/15; security/dependencies 10/15; documentation/tests 9/10; license clarity 9/10; setup/deployment 4/5; integrations/APIs 5/5; Arabic/i18n/RTL 1/5 = **79/100**.

### Medplum — FHIR-native developer platform, not turnkey clinic management

**Provisional score: 77/100.** Evidence note: [10-medplum.md](../../research-sources/clinic-management-candidates/10-medplum.md).

**Scope and strongest fit.** Medplum is a strong foundation for building a custom ambulatory/EHR product. It provides FHIR-native data, authentication, SDKs, React components, Bots, integrations, a Provider app, intake, charting, scheduling, referrals, and billing primitives. Its interoperability evidence is unusually specific: FHIR R4, US Core 5.0.1/USCDI v2, SMART App Launch 2.0, Bulk Data 2.0, OAuth 2.0, HL7 V2, SFTP, CDS Hooks, and FHIRcast. Self-hosting supports Docker Compose, AWS CDK/CloudFormation, Ubuntu, and beta GCP/Azure paths. [82] [83] [84]

**Material limitations.** This is infrastructure and implementation material, not a finished clinic product. The Provider documentation marks Tasks, Messages, Labs, and Medications as coming soon. Scheduling is beta; medications, labs/imaging, referrals, and billing commonly require Bots, providers, clearinghouses, or custom workflows. Self-hosting is complex. No Arabic UI, translation, or RTL evidence was found. No turnkey multi-clinic operating model, local payer behavior, clinical validation, or jurisdiction-specific regulatory approval was established. The project’s security practices and hosted compliance services do not substitute for a So7ob self-hosting audit. [82] [85] [86]

**License and maintenance.** The repository is Apache-2.0, with a NOTICE file; hosted infrastructure, enterprise support, compliance assistance, and custom work are separate commercial services. Frequent 5.1.x releases and a published version policy indicate active maintenance, but the 36-month security-patch commitment described in the policy applies to Enterprise customers rather than automatically to free/open-source users. [82] [87] [88]

**Score check:** feature/domain 12/20; architecture/reuse 14/15; maintenance 14/15; security/dependencies 10/15; documentation/tests 9/10; license clarity 9/10; setup/deployment 4/5; integrations/APIs 5/5; Arabic/i18n/RTL 0/5 = **77/100**.

## Cross-candidate adoption gates

### License and component obligations

License scores describe clarity of the reviewed project source, not the legal status of a complete deployment. GPL-3.0/GPL-3+ candidates (OpenEMR, GNU Health, Open Hospital, Marley) carry copyleft, notice, and source-availability obligations for covered redistributed works. MPL candidates (OpenMRS core, OpenELIS, some Bahmni components) require file-level/source notices and component review. CARE and its frontend are MIT; Medplum is Apache-2.0; OpenClinic GA is provisionally treated as historical LGPLv2.0 but has a conflicting catalog label. Bahmni is the most complex because it combines AGPL, MPL-with-healthcare-disclaimer, MIT, and upstream product licenses. Every redistribution should produce a component/SBOM and notice inventory, including dependencies, modules, plugins, terminology, images, and hosted services. [1] [2] [3] [62] [69] [75] [82]

### Security and maintenance

Active commits, releases, CI, security policies, SBOM/Trivy references, or dependency tooling are useful maintenance signals but do not establish a secure installation. The material security caveats differ:

- OpenEMR has strong activity and reporting channels but publicly disclosed substantial recent vulnerabilities.
- GNU Health has detailed defensive guidance and advisories, but no full audit and version-specific deployment guidance must be followed carefully.
- OpenMRS, Bahmni, CARE, Marley, OpenELIS, and Medplum have reporting/process evidence, but their complete dependency graphs, selected modules/plugins, and deployment configurations still require review.
- Open Hospital exposes concrete CSRF/CORS configuration concerns and has no host `SECURITY.md`.
- OpenClinic GA has the largest documentation-age and current-assurance gap.

So7ob should require release pinning, patch ownership, dependency and container scanning, secrets management, least-privilege review, audit logging, backup/restore tests, disaster-recovery objectives, monitoring, incident response, and a defined support lifecycle before any candidate handles live PHI. No screening score substitutes for those controls.

### Interoperability is version- and profile-specific

“FHIR-ready” is not a common capability level. OpenEMR documents FHIR R4, US Core, SMART, OAuth/OIDC, and bulk export. OpenMRS documents an initially R4-oriented FHIR2 module. OpenELIS documents FHIR R4 laboratory resources plus HL7 v2.5.1 and ASTM. Medplum documents FHIR R4, US Core 5.0.1, SMART 2.0, and Bulk Data 2.0. CARE makes FHIR R5-aligned claims, but specific conformance profiles and version guarantees were not established. GNU Health explicitly says its FHIR server is incomplete, read/search oriented, and has no write capability. Bahmni, Marley, and OpenClinic GA document REST/FHIR or FHIR-oriented integration, but not complete target-system conformance. Open Hospital has REST/OpenAPI evidence without reviewed HL7/FHIR proof. [1] [2] [3] [28] [69] [75] [82]

Therefore, So7ob should test the exact release, resources, profiles, terminology bindings, authentication, write behavior, error semantics, provenance, bulk/export behavior, and partner-system certification required by the target deployment. A product name or marketing statement is not an interoperability contract.

### Arabic/RTL verification

The screening values are evidence weights, not acceptance results. OpenEMR's 5/5 reflects explicit Arabic, UTF-8, and RTL statements, but translation completeness and module QA remain unknown. OpenMRS's 4/5 reflects Arabic/RTL claims and translation tooling, with distribution-specific QA unresolved. Marley’s 3/5 reflects Arabic/RTL tests in the portal only. Open Hospital’s 3/5 reflects an Arabic resource with untranslated strings and no verified RTL mode. GNU Health (2/5) has broad gettext/Weblate support but no Arabic/RTL proof. CARE and Bahmni (1/5 each) have i18n infrastructure but no verified Arabic-ready UI; OpenELIS (1/5) has active localization but Arabic was still being initiated; OpenClinic GA and Medplum (0/5) have no positive reviewed Arabic/RTL evidence. Acceptance testing must cover clinician UI, portal, reports, print/PDF output, dates/numbers, search, bidirectional names, notifications, imported terminology, and all integrated subsystems.

### Healthcare legal, privacy, and clinical-safety gate

The reviewed evidence does not establish that any candidate is a medical device, clinically validated for So7ob’s intended use, compliant with the target country’s privacy or health-data rules, approved by a national health authority, or ready for production clinical care. OpenEMR’s cited certification material is a scoped US Health IT Certification context and explicitly is not an HHS endorsement; it does not generalize to every version, configuration, jurisdiction, or clinical use. Medplum’s hosted compliance material likewise describes shared responsibility, and OpenELIS’s quality-system language is not treated as accreditation. [1] [75] [82]

Before selection, So7ob should define intended use and clinical responsibility; conduct a jurisdiction-specific legal/privacy/data-residency review; validate identity, consent, access, audit, retention, correction, export, and deletion behavior; perform clinical workflow and medication/lab safety validation; verify local payer, e-prescribing, laboratory, reporting, and terminology requirements; assess backup/continuity and vendor/community accountability; and document human oversight for any decision support or AI-related capability. These are independent gates and remain unresolved for all ten candidates.

## References

[1]: https://github.com/openemr/openemr "OpenEMR canonical repository"
[2]: https://docs.gnuhealth.org/his/features.html "GNU Health HMIS features and module catalog"
[3]: https://openmrs.org/product/ "OpenMRS product and feature overview"
[4]: https://github.com/earthians/marley "Marley Health canonical repository"
[5]: https://ohc.network/solutions/hospital-management "CARE HMIS official hospital-management solution page"
[6]: https://www.open-hospital.org/ "Open Hospital official website and product scope"
[7]: https://github.com/informatici/openhospital-ui/blob/master/src/resources/i18n/ar.json "Open Hospital Arabic translation resource"
[8]: https://www.open-emr.org/wiki/index.php/OpenEMR_Features "OpenEMR official feature documentation"
[9]: https://github.com/openemr/openemr/blob/master/Documentation/api/FHIR_API.md "OpenEMR FHIR API documentation"
[10]: https://github.com/openemr/openemr/releases "OpenEMR releases and version requirements"
[11]: https://github.com/openemr/openemr/security/policy "OpenEMR security reporting policy"
[12]: https://www.open-emr.org/wiki/index.php/Codebase_Security "OpenEMR codebase security history"
[13]: https://raw.githubusercontent.com/openemr/openemr/master/LICENSE "OpenEMR canonical GPL-3 license"
[14]: https://github.com/openemr/openemr/commits/master/ "OpenEMR commit history"
[15]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/healthcare/doctype/patient_appointment/patient_appointment.json "Marley Patient Appointment DocType"
[16]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/healthcare/doctype/patient_encounter/patient_encounter.json "Marley Patient Encounter DocType"
[17]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/healthcare/doctype/medication_request/medication_request.json "Marley Medication Request DocType"
[18]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/healthcare/doctype/service_request/service_request.json "Marley Service Request DocType"
[19]: https://raw.githubusercontent.com/earthians/marley/develop/patient_portal/src/translation.spec.js "Marley patient portal Arabic and locale tests"
[20]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/www/patient_portal.py "Marley patient portal language and RTL boot logic"
[21]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/www/patient_portal.html "Marley patient portal HTML language and direction attributes"
[22]: https://raw.githubusercontent.com/earthians/marley/develop/crowdin.yml "Marley translation configuration"
[23]: https://raw.githubusercontent.com/earthians/marley/develop/.github/dependabot.yml "Marley Dependabot configuration"
[24]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/tests/test_chart_access.py "Marley chart-access and authorization tests"
[25]: https://raw.githubusercontent.com/earthians/marley/develop/.github/workflows/codeql.yml "Marley CodeQL workflow"
[26]: https://github.com/earthians/marley/blob/develop/license.txt "Marley exact GPL-3.0 license file"
[27]: https://github.com/earthians/marley/releases "Marley Health releases"
[28]: https://github.com/ohcnetwork/care "CARE canonical backend repository"
[29]: https://github.com/ohcnetwork/care_fe "CARE canonical frontend repository"
[30]: https://care-be-docs.ohc.network/source/index.html "CARE generated source/API documentation"
[31]: https://raw.githubusercontent.com/ohcnetwork/care/develop/Pipfile "CARE backend dependencies"
[32]: https://care-be-docs.ohc.network/development/local-setup.html "CARE local setup and Docker Compose documentation"
[33]: https://care-be-docs.ohc.network/development/pluggable-apps.html "CARE pluggable-app architecture"
[34]: https://github.com/ohcnetwork/care/security/policy "CARE security policy"
[35]: https://raw.githubusercontent.com/ohcnetwork/care_fe/develop/src/i18n.ts "CARE frontend localization configuration"
[36]: https://github.com/ohcnetwork/care/releases "CARE releases"
[37]: https://github.com/ohcnetwork/care/commits/develop/ "CARE backend commit history"
[38]: https://github.com/ohcnetwork/care_fe/commits/develop/ "CARE frontend commit history"
[39]: https://www.open-hospital.org/wp-content/OH_manuals/user/UserManual.html "Open Hospital user guide"
[40]: https://www.open-hospital.org/wp-content/OH_manuals/admin/AdminManual.html "Open Hospital administrator manual"
[41]: https://github.com/informatici/openhospital "Open Hospital canonical repository"
[42]: https://github.com/informatici/openhospital-api "Open Hospital REST API repository"
[43]: https://github.com/informatici/openhospital-core "Open Hospital core repository"
[44]: https://github.com/informatici/openhospital-api/blob/master/src/main/java/org/isf/config/SecurityConfig.java "Open Hospital API security configuration"
[45]: https://github.com/informatici/openhospital/security "Open Hospital GitHub security page"
[46]: https://github.com/informatici/openhospital/blob/master/LICENSE "Open Hospital GPLv3 license"
[47]: https://codeberg.org/gnuhealth/his "GNU Health HMIS canonical repository"
[48]: https://docs.gnuhealth.org/his/techguide/installation/ "GNU Health installation and deployment guide"
[49]: https://docs.gnuhealth.org/his/changelog.html "GNU Health HMIS changelog"
[50]: https://docs.gnuhealth.org/his/techguide/fhir/ "GNU Health FHIR REST status and limitations"
[51]: https://docs.gnuhealth.org/his/techguide/localization/ "GNU Health localization guide"
[52]: https://docs.gnuhealth.org/his/techguide/security.html "GNU Health security guidance"
[53]: https://codeberg.org/api/v1/repos/gnuhealth/his/releases "GNU Health releases API"
[54]: https://o3-docs.openmrs.org/en-US/docs/configure-o3/configure-patient-management/ "OpenMRS O3 patient-management configuration"
[55]: https://github.com/openmrs/openmrs-core "OpenMRS core repository and build/deployment documentation"
[56]: https://github.com/openmrs/openmrs-module-fhir2 "OpenMRS FHIR2 module architecture"
[57]: https://github.com/openmrs/openmrs-core/releases "OpenMRS core releases"
[58]: https://github.com/openmrs/openmrs-core/security "OpenMRS core security reporting policy"
[59]: https://github.com/openmrs/openmrs-core/blob/master/pom.xml "OpenMRS core Maven POM and license metadata"
[60]: https://github.com/openmrs/openmrs-core/blob/master/LICENSE "OpenMRS MPL-2.0 license and healthcare disclaimer"
[61]: https://opensource.org/license/mpl-2-0/ "OSI Mozilla Public License 2.0"
[62]: https://www.bahmni.org/ "Bahmni official product home"
[63]: https://bahmni.atlassian.net/wiki/spaces/BAH/pages/6488066/Bahmni+REST+API+FHIR+APIs "Bahmni REST API and FHIR API documentation"
[64]: https://github.com/bahmni/bahmni-apps-frontend/blob/main/docs/architecture.md "Bahmni frontend architecture"
[65]: https://github.com/bahmni/bahmni-apps-frontend/blob/main/docs/setup-guide.md "Bahmni frontend setup guide"
[66]: https://www.bahmni.org/license "Bahmni component license matrix"
[67]: https://talk.openmrs.org/t/is-bahmni-supported-for-arabic-or-right-to-left-languages/8335 "Bahmni Arabic and RTL discussion"
[68]: https://github.com/Bahmni/bahmni-package/blob/master/LICENSE "Bahmni package AGPL license"
[69]: https://sourceforge.net/projects/open-clinic/ "OpenClinic GA official SourceForge project page"
[70]: https://sourceforge.net/projects/open-clinic/files/Development/code/ "OpenClinic GA official development code and Javadoc directory"
[71]: https://sourceforge.net/projects/open-clinic/files/Documentation/EN/openclinic%20technical%20documentation.pdf/ "OpenClinic GA technical documentation"
[72]: https://sourceforge.net/projects/open-clinic/files/Releases/OpenClinic%20version%205/ "OpenClinic GA version 5 release directory"
[73]: https://knowledge.iadb.org/en/open-knowledge/code-development/open-source-solution/openclinic-ga "Inter-American Development Bank OpenClinic GA profile"
[74]: https://opensource.org/license/lgpl-2-0/ "OSI GNU LGPL 2.0 license page"
[75]: https://openelis-global.org/features-and-functionality/ "OpenELIS Global features and functionality"
[76]: https://docs.openelisci.org/en/latest/deployomrs/ "OpenELIS/OpenMRS laboratory interoperability"
[77]: https://github.com/I-TECH-UW/OpenELIS-Global-2/releases "OpenELIS Global releases"
[78]: https://github.com/I-TECH-UW/OpenELIS-Global-2/security "OpenELIS Global security policy"
[79]: https://talk.openelis-global.org/t/arabic-translation-for-openelis-global/2030 "OpenELIS Global Arabic translation discussion"
[80]: https://github.com/I-TECH-UW/OpenELIS-Global-2/blob/develop/LICENSE "OpenELIS Global MPL-2.0 license"
[81]: https://github.com/DIGI-UW/OpenELIS-Global-2/releases/tag/3.2.3.0 "OpenELIS Global 3.2.3.0 release notes"
[82]: https://www.medplum.com/docs/ "Medplum documentation home"
[83]: https://www.medplum.com/docs/api "Medplum API overview"
[84]: https://www.medplum.com/docs/integration "Medplum integration documentation"
[85]: https://www.medplum.com/docs/provider "Medplum Provider documentation"
[86]: https://www.medplum.com/docs/scheduling "Medplum scheduling documentation"
[87]: https://github.com/medplum/medplum/blob/main/LICENSE.txt "Medplum Apache-2.0 license"
[88]: https://github.com/medplum/medplum/releases "Medplum releases and version policy"
