# OSCAR EMR — evidence note (2026-10-14)

## Identity and scope

**OSCAR EMR** is an open-source Canadian ambulatory/clinic electronic medical record, associated with McMaster’s Department of Family Medicine and designed for medical offices. OSCAR Galaxy describes its use by physicians and other frontline practitioners, including midwives, social workers, psychologists, nurse practitioners, and physiotherapists. This is a clinician-centered family medicine/community ambulatory product, not evidence of a hospital-wide EHR/HMIS, inpatient admissions platform, or laboratory information system.[1] [2]

The canonical source is [oscaremr/oscar on Bitbucket](https://bitbucket.org/oscaremr/oscar). McMaster’s official project page directs developers to the Bitbucket code for OSCAR software currently deployed, while expressly warning that McMaster’s own repository is not necessarily the directly quality-managed source for deployed OSCAR software. It says coordination with Well EMR Group is needed for development reaching deployed users, including security and regulatory requirements. Thus the public source should not be presumed identical to a commercial deployed variant.[1]

## License and commercial boundary

The repository root’s `COPYING` file contains the **GNU General Public License, version 2** text. Its preamble and terms permit copying, modification, and distribution under the GPL’s conditions; it disclaims warranty. The POM independently declares GPLv2. Community documentation describes McMaster code as GPL V2+.[3] [4] [5] The public license does not establish that a specific commercial build, hosting/support service, integration, branding, or proprietary additions are covered identically. Review the exact deployed source, notices, and third-party licenses before redistribution or commercial deployment. McMaster distinguishes its public repository from quality-managed deployed sources; this is an important boundary, not a claim that commercial variants are closed or noncompliant.[1]

## Clinical scope and functions

OSCAR Galaxy documents patient charts, appointment scheduling, prescriptions, labs and imaging, forms/templates, letter generation, fax integration, waitlists, reporting, and traffic/status workflows.[2] Its overview also describes clinic-oriented chronic disease management flowsheets (including diabetes, hypertension, CHF, COPD, asthma, HIV, and INR), maternity and preventive-care tools, immunization modules, and lab import/interface workflows.[6] These support an ambulatory clinic fit. The evidence reviewed does **not** document inpatient admission/discharge/transfer, bed management, enterprise hospital orders, operating-room workflows, blood bank, or a comprehensive hospital clinical information system. Imaging is listed as an ambulatory feature; this does not establish a PACS or DICOM imaging archive/viewer. Labs are described in terms of imported results and interfaces; this does not establish a LIS.

## Interoperability and data model

OSCAR Galaxy’s overview makes a specific claim that OSCAR can communicate using “most widely used versions” of HL7 and can export data for OntarioMD standards and import labs. It names an Excelleris lab interface and an interface effort with BC Interior Health.[6] These are source-specific descriptions but do not identify HL7 versions, message profiles, transport, conformance testing, or current status of each named interface. The 1.18 OSCAR Pro notes record a patient-creation defect fix in a **FHIR API**, showing FHIR API functionality in that commercial release context, not a blanket claim of standards conformance for the public Bitbucket code or all builds.[7] No evidence in the reviewed primary sources establishes DICOM, LOINC, SNOMED CT, ICD version/coverage, or openEHR support. Treat these as unverified.

## Architecture, deployment, and operations

The canonical repository identifies Java as its language in Bitbucket metadata. Its POM packages a Java web application as a WAR and identifies OSCAR McMaster as a web-based EMR. It declares project version `14.0.0-SNAPSHOT`, Java/Maven-era dependencies, and Tomcat-related deployment metadata.[4] OSCAR Galaxy describes local-server or remotely hosted operation and notes typical Linux/Ubuntu LTS production installations.[6] This indicates a conventional self-hosted/hosted web application architecture, but the retrieved sources do not establish a current supported runtime/database matrix or a single supported deployment recipe. The repository contains `database`, `release`, `docs`, and SQL update artifacts.[8]

The community documentation warns that a self-install needs security hardening, including changing default passwords. It describes TLS, user login, and encrypted database/backups as deployment practices/options; these statements are operational guidance, not proof those protections are enabled by default in every build.[6] No current, authoritative backup/restore runbook, recovery objective, upgrade compatibility matrix, or operator-managed patch lifecycle was verified in the sources reviewed. The branch/repository listing exposed activity and the Bitbucket API reported repository updated 2026-06-13; however the repo’s main branch is `stable`, so branch-specific release cadence and current production currency require further verification.[8] [9]

## Security, privacy, and safety evidence

The McMaster page explicitly requires security/regulatory coordination for code intended to reach deployed OSCAR users and identifies the quality-managed-source distinction.[1] OSCAR Pro’s 1.18 release note says it includes security improvements/fixes based on third-party penetration testing and security assessments, but that is a vendor release statement for OSCAR Pro, not a public-source security audit report.[7] The release note also records a defect in which expired user accounts could still log in and a fix for it. This illustrates why the release’s exact scope matters.[7]

The sources reviewed do not provide a clearly discoverable security policy or public vulnerability/advisory process for the canonical Bitbucket repository; Bitbucket’s repository metadata reports issues disabled. This should be treated as **not verified**, not proof that no vulnerabilities exist.[9] The POM includes dependency declarations, including older libraries; no reproducible software-bill-of-materials, dependency vulnerability scan, or verified current patch status was found. Repository source includes OAuth-related work and the commercial release mentions account expiry, but evidence did not establish a complete permission model, role matrix, audit-event coverage, access-review procedure, or tamper-resistant audit logs for every version.[7] Patient data privacy obligations and lawful hosting/configuration are deployment-specific. No HIPAA, GDPR, ONC certification, or clinical safety compliance claim is made here.

## Localization, documentation, and testing

OSCAR Galaxy records Spanish translation as an example of international use, but no primary evidence reviewed establishes Arabic localization, Arabic clinical terminology, bidirectional/RTL layout support, or a supported Arabic deployment.[6] Documentation resources include an OSCAR manual, knowledge base, downloads and forms at OSCAR Galaxy, plus OSCAR Pro support articles; documentation is distributed across community and commercial-variant sites.[2] [10] Repository metadata identifies Jenkins CI, while the source includes build configuration and a Bitbucket pipeline file; this is evidence of CI configuration, not evidence of passing test coverage or clinical validation. Pro release notes mention performance tooling and pre-deployment testing in a commercial build.[4] [7]

## Screening score

Desk-research screening only; this score is neither a recommendation nor a certification or safety assessment. Categories use the requested 100-point rubric.

- Hospital/EHR fit: **11/20** — strong fit for clinic EMR; no demonstrated inpatient/hospital HMIS breadth.
- Interoperability/data model: **7/15** — source-specific HL7/lab claims and a FHIR API mention in OSCAR Pro; versions/profiles and standard coverage largely unverified.
- Maintenance: **8/15** — repository updated in June 2026, but branch/release relationship and maintainership for deployed variants are not fully clear.
- Security/privacy/dependencies: **7/15** — some concrete security controls and vendor penetration-test claim, offset by no verified canonical security process, audit/role evidence, or dependency assurance.
- Docs/tests: **7/10** — community documentation, source docs and CI config exist; test coverage and documentation currency not established.
- License clarity: **10/10** — exact GPL-2.0 text present; variant boundary still requires build-level review.
- Setup/deployment: **2/5** — web app and hosting modes identified, but authoritative current deployment, database, backup, and upgrade matrix not verified.
- Arabic/localization/RTL: **1/5** — Spanish example only; Arabic/RTL unverified.
- Clinical/regulatory evidence: **1/5** — McMaster identifies regulatory/quality context for affiliated/deployed work, but no independently verified certification or safety evidence for this source/build.

**Total: 54/100.** Score arithmetic: 11 + 7 + 8 + 7 + 7 + 10 + 2 + 1 + 1 = 54.

## References

[1]: https://fammed.mcmaster.ca/oscar-emr/innovate-with-oscar/ "McMaster University Department of Family Medicine — Innovate with OSCAR"
[2]: https://oscargalaxy.org/ "OSCAR Galaxy — documentation, downloads and feature overview"
[3]: https://bitbucket.org/oscaremr/oscar/src/stable/COPYING "OSCAR Bitbucket — COPYING (GNU General Public License v2)"
[4]: https://api.bitbucket.org/2.0/repositories/oscaremr/oscar/src/stable/pom.xml "OSCAR Bitbucket API — Maven project configuration"
[5]: https://oscargalaxy.org/ "OSCAR Galaxy — GPL V2+ project description"
[6]: https://oscargalaxy.org/about/brief-overview-of-oscar/ "OSCAR Galaxy — Brief Overview of OSCAR"
[7]: https://oscarsupport.zendesk.com/hc/en-us/articles/42230885825684-1-18-Release-Notes "OSCAR Pro Support — 1.18 Release Notes"
[8]: https://bitbucket.org/oscaremr/oscar/src/stable/ "OSCAR Bitbucket — canonical repository source tree"
[9]: https://api.bitbucket.org/2.0/repositories/oscaremr/oscar "Bitbucket API — OSCAR repository metadata"
[10]: https://oscarsupport.zendesk.com/hc/en-us "OSCAR Pro Support Portal"
