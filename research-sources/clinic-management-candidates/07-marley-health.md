# Marley Health — Clinic Management Candidate

**Checked date:** 2026-10-14  
**Candidate class:** Open-source Frappe/ERPNext healthcare/HIS application; community source with a separate hosted/cloud offering. Proprietary enterprise/support terms were not established by this review.  
**Slug:** `marley-health`  
**Confidence:** Medium-high for repository facts and current maintenance; medium for clinic-fit scoring because the public product documentation is concise and does not prove every end-to-end operational or regulatory requirement.

## Key findings

**Verified.** Marley Health is an open-source HIS app that enables the Healthcare domain in ERPNext. The canonical repository describes Frappe as the full-stack, metadata-driven framework, ERPNext as the integrated ERP, and the app as designed largely around HL7 FHIR. It names patient, outpatient/inpatient, clinical-procedure, rehabilitation/physiotherapy, laboratory, medical-code-standard, patient-portal, role-permission, REST, website, and payment capabilities. [1] [2] The official documentation separately lists appointments, outpatient and inpatient management, clinical procedures, rehabilitation/physiotherapy, laboratory information, and medical code standards, while positioning ERPNext for accounts, HR/payroll, purchasing, stock/pharmacy, assets, and payments. [2]

**Verified clinic workflow evidence.** The current `Patient Appointment` DocType contains a required patient, practitioner/department/service-unit scheduling, appointment states, referring practitioner and service-request links, clinical-procedure and therapy links, insurance fields, payment mode, paid amount, invoice reference, and video-conference fields. [3] `Patient Encounter` contains patient, appointment, practitioner, symptoms, diagnosis, medical codes, drug prescriptions, lab-test prescriptions, clinical procedures, rehabilitation therapies, clinical notes, orders, inpatient/emergency references, referrals, insurance, and an invoiced flag. [4] `Medication Request` contains medication, dosage form, dosage, repeats, practitioner, encounter order group, medical codes, and pending/partly invoiced/invoiced billing status. [5] `Lab Test` contains patient, requesting practitioner, sample collection, test results, approval states, service request, service unit, medical coding, and invoicing fields. [6] The `Service Request` model exposes direct/referral/external-referral sources, referring/referred practitioners, patient and encounter context, medical codes, sample collection, and billing/insurance fields. [7]

**Verified multi-site/facility modeling.** Healthcare Service Units are a tree with parent units, company, warehouse, appointment allowance/capacity, inpatient occupancy, address/contact data, and practitioner schedules. This supports facility/service-unit modeling and can be used across companies/sites, but the sources do not prove a complete multi-clinic tenancy, cross-site reporting, or data-isolation design. [8]

**Verified architecture and deployment.** The app is a Frappe application with Python metadata and server code plus a Vue/frappe-ui patient portal. `pyproject.toml` requires Python >=3.10, declares Frappe and ERPNext >=17-dev and <18 as Bench dependencies, and includes small direct Python dependencies (`responses` and `python-barcode`). [9] The app hooks declare ERPNext/Frappe as required, scheduled appointment/medication/nursing/inpatient tasks, healthcare DocTypes, role-based portal permissions, and a Patient Portal route. [10] The README install path is Bench-based: install ERPNext, run `bench get-app healthcare`, then `bench --site ... install-app healthcare`. [1] The portal package uses Vue 3, frappe-ui, Vite, and Vitest; it is marked private and has a build and test script. [11]

**Verified APIs/integrations.** The repository exposes Frappe REST/whitelisted-method patterns and the portal calls methods such as settings, logged-in patient, departments, practitioners, slots, fees, appointments, diagnostics, print formats, and patient lookup. [10] [12] The source says design is based largely on HL7 FHIR and advertises RESTfulness, but no public FHIR endpoint/schema, conformance statement, external laboratory interface, SMART-on-FHIR profile, or interoperability certification was verified. [1] [2]

**Verified maintenance and quality signals.** The release page shows v16.6.0 dated 2026-09-19, with fixes/features covering medication alerts, allergy/interactions, fee validity, access checks, observation-note sanitization, and tests; it also shows v16.5.x releases in August 2026. [13] The current protected `develop` branch has commits through 2026-10-07, including translation and inpatient-medication changes. [14] CI runs server tests against MariaDB, performs Python compilation/merge-conflict checks, captures coverage on scheduled/non-PR runs, and uses current Python/Node setup actions; CodeQL analyzes Python and JavaScript on pushes, pull requests, and a weekly schedule. [15] [16] The repository has Dependabot configured only for GitHub Actions on a weekly schedule. [17]

**Verified security controls, with caveat.** Frappe role/permission controls are part of the app, and current tests explicitly exercise chart read/write permissions, patient-record scoping, remote-call exposure, patient search authorization, nursing-task mutation, and vital-sign access. [10] [18] CodeQL and CI are positive signals. However, the current `.github` listing contains no `SECURITY.md`; Dependabot covers GitHub Actions only, not the Python/Node/Bench dependency graph. [19] [17] This is not a full security audit, vulnerability assessment, privacy impact assessment, penetration test, or production-hardening review. Deployment security, backups, encryption, logging/monitoring, tenant isolation, and operator patch practice remain environment-dependent or unknown.

**Verified license and component distinction.** The Marley repository's `license.txt` and app hooks identify the app as **GNU General Public License version 3 (GPL-3.0)**. [20] GPL-3.0 is OSI-approved. [21] It permits commercial use, modification, distribution, patent use, and private use, subject to copyleft, source-disclosure, license-notice, and state-change obligations; it also disclaims warranty/liability. [20] [21] The community source is distinct from Frappe Cloud/hosted or support services advertised around the project; using a hosted service does not itself change the source license, while service terms, pricing, data residency, support, and any proprietary add-ons require separate review. [1] [2] ERPNext itself is also published under GPL-3.0 in its canonical repository. [22] The patient-portal `package.json` declares MIT for that frontend package, while its third-party dependencies have their own licenses; a deployment should inventory the complete transitive dependency and asset licenses rather than treating the app-level GPL notice as a complete SBOM. [11]

**Verified Arabic/i18n/RTL evidence.** The repository uses a Crowdin configuration that pulls translations from `healthcare/locale/main.pot` into two-letter `.po` files. [23] The patient-portal translation tests contain Arabic strings, verify `portal_lang = 'ar'`, and verify localized date formatting. [24] The portal boot code derives language and RTL/LTR direction, and its standalone HTML emits `lang` and `dir` attributes. [25] [26] This supports a real Arabic/RTL path in the patient portal. The checked source tree contains the POT source and portal translation code, but this review did not verify Arabic translation completeness across the full desk, reports, print formats, third-party ERPNext screens, or visual RTL quality; those are **unknown**.

## Scope limits and clinical/regulatory gate

**Inference.** Marley is a strong functional fit for a clinic that is willing to operate the Frappe/ERPNext stack and configure its healthcare, accounting, stock, HR, permissions, and site model. The data model suggests broad outpatient/inpatient workflows rather than a narrow appointment-only system. The principal reuse cost is the dependency on a full Bench/Frappe/ERPNext deployment and its upgrade, customization, permissions, backup, and dependency-management responsibilities.

**Unknown / do not infer.** The evidence does not establish that Marley is a medical device, that it is certified or validated for any jurisdiction, or that it meets HIPAA, GDPR, Saudi PDPL, UAE health-data rules, ISO 27001, SOC 2, local e-prescribing, laboratory accreditation, or other clinical/regulatory requirements. It also does not prove production readiness for a particular clinic, validated clinical safety, data migration quality, disaster recovery, performance at a target scale, or complete interoperability. These are a separate acceptance gate and cannot be substituted by the score below.

## Provisional weighted score

Scores are screening judgments from primary evidence available on the checked date. Missing evidence is treated as unknown rather than as a factual failure.

```yaml
score_breakdown:
  feature_domain_fit: 16
  architecture_reuse: 12
  maintenance: 14
  security_dependencies: 9
  documentation_tests: 7
  license_clarity: 9
  setup_deployment: 4
  integrations_apis: 4
  arabic_i18n_rtl: 3
total_score: 78
```

- **feature_domain_fit: 16/20.** Broad primary evidence covers patient, appointment, encounter/chart, prescription, procedure, rehabilitation, laboratory, referrals/service requests, billing/insurance, pharmacy/stock through ERPNext, portals, and service units. A concise public documentation set and unverified operational details keep this below full marks. [2] [3] [4] [5] [6] [7] [8]
- **architecture_reuse: 12/15.** Strong Frappe/ERPNext reuse, metadata-driven DocTypes, scheduled jobs, permissions, REST/whitelisted methods, and a Vue portal. The required platform stack increases integration and upgrade complexity. [9] [10] [11]
- **maintenance: 14/15.** Recent releases, recent develop-branch commits, protected branch, daily CI, and weekly CodeQL indicate active maintenance as of the check date. This does not prove a guaranteed SLA or long-term roadmap. [13] [14] [15] [16]
- **security_dependencies: 9/15.** Permission tests and CodeQL are meaningful positives. No project security policy was found in the current `.github` listing, and Dependabot is limited to GitHub Actions; no full audit or complete dependency-vulnerability process was verified. [17] [18] [19]
- **documentation_tests: 7/10.** Official docs and a working Bench install path exist; server tests, portal unit tests, CI, coverage upload, and CodeQL exist. Public docs do not document every clinic workflow, supported deployment topology, API contract, or acceptance/validation procedure. [1] [2] [11] [15] [16] [24]
- **license_clarity: 9/10.** Marley’s GPL-3.0 is explicit and OSI-approved, with clear copyleft implications; separate hosted services, ERPNext/Frappe dependencies, the MIT portal package, and transitive components still require their own review. [20] [21] [22] [11]
- **setup_deployment: 4/5.** Bench installation and cloud/on-prem positioning are documented, but deployment remains dependent on Frappe/ERPNext and no official container/IaC/HA/runbook evidence was verified here. [1] [2] [9]
- **integrations_apis: 4/5.** Frappe REST/whitelisted APIs, patient portal calls, payments, ERPNext modules, and FHIR-oriented design are evidenced. Public conformance schemas and concrete external-system adapters were not verified. [1] [2] [10] [12]
- **arabic_i18n_rtl: 3/5.** Arabic translation and locale tests plus explicit portal RTL handling are verified. Full Arabic coverage and RTL quality across desk, reports, print formats, and ERPNext remain unknown. [23] [24] [25] [26]

**Total: 78/100.** This is a provisional screening score, not an endorsement.

## References

[1]: https://github.com/earthians/marley "Marley Health canonical repository"
[2]: https://marley.frappe.cloud/docs "Official Marley Healthcare documentation"
[3]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/healthcare/doctype/patient_appointment/patient_appointment.json "Marley Patient Appointment DocType"
[4]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/healthcare/doctype/patient_encounter/patient_encounter.json "Marley Patient Encounter DocType"
[5]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/healthcare/doctype/medication_request/medication_request.json "Marley Medication Request DocType"
[6]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/healthcare/doctype/lab_test/lab_test.json "Marley Lab Test DocType"
[7]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/healthcare/doctype/service_request/service_request.json "Marley Service Request DocType"
[8]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/healthcare/doctype/healthcare_service_unit/healthcare_service_unit.json "Marley Healthcare Service Unit DocType"
[9]: https://raw.githubusercontent.com/earthians/marley/develop/pyproject.toml "Marley project metadata and Bench dependencies"
[10]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/hooks.py "Marley application hooks, permissions, scheduled tasks, and portal route"
[11]: https://raw.githubusercontent.com/earthians/marley/develop/patient_portal/package.json "Marley patient portal package metadata"
[12]: https://raw.githubusercontent.com/earthians/marley/develop/patient_portal/src/components/BookAppointmentModel.vue "Marley patient portal appointment API calls"
[13]: https://github.com/earthians/marley/releases "Marley Health releases"
[14]: https://github.com/earthians/marley/commits/develop "Marley Health develop-branch commit history"
[15]: https://raw.githubusercontent.com/earthians/marley/develop/.github/workflows/ci.yml "Marley continuous-integration workflow"
[16]: https://raw.githubusercontent.com/earthians/marley/develop/.github/workflows/codeql.yml "Marley CodeQL workflow"
[17]: https://raw.githubusercontent.com/earthians/marley/develop/.github/dependabot.yml "Marley Dependabot configuration"
[18]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/tests/test_chart_access.py "Marley chart-access and authorization tests"
[19]: https://api.github.com/repos/earthians/marley/contents/.github?ref=develop "Marley current .github directory listing"
[20]: https://github.com/earthians/marley/blob/develop/license.txt "Marley exact GPL-3.0 license file"
[21]: https://opensource.org/license/gpl-3-0 "OSI GNU General Public License version 3.0 page"
[22]: https://github.com/frappe/erpnext/blob/develop/license.txt "ERPNext canonical GPL-3.0 license file"
[23]: https://raw.githubusercontent.com/earthians/marley/develop/crowdin.yml "Marley Crowdin translation configuration"
[24]: https://raw.githubusercontent.com/earthians/marley/develop/patient_portal/src/translation.spec.js "Marley patient portal Arabic and locale tests"
[25]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/www/patient_portal.py "Marley patient portal language and RTL boot logic"
[26]: https://raw.githubusercontent.com/earthians/marley/develop/healthcare/www/patient_portal.html "Marley patient portal HTML lang and dir attributes"
