# CARE HMIS — Clinic Management candidate evidence note

**Checked date:** 2026-10-14  
**Candidate slug:** `care-hmis`  
**Category:** FHIR-inspired open-source HMIS and clinical operations platform  
**Candidate class:** Open-source CARE backend/core plus a separately maintained open-source CARE frontend; modular self-hosted platform with optional plugins and deployment/implementation services around it.  
**Screening status:** Strong domain fit, but this is a provisional evidence screen rather than an endorsement, clinical-safety assessment, or production-readiness finding.

## Key findings

- **Verified:** The official product page describes CARE HMIS as connecting registration, appointments, OPD, emergency, inpatient, ICU, discharge, follow-up, encounters, notes, diagnoses, orders, results, prescriptions, referrals, labs, pharmacy, inventory, billing, reporting, roles, audit trails, telemedicine/TeleICU extensions, and facility operations. It also states that modules share patients, encounters, orders, observations, roles, reports, and audit trails. [1]
- **Verified:** The canonical repository is the Python backend. Its README lists patient/consultation history, facility and inventory management, telemedicine/triage, realtime resource analytics, video/vitals monitoring, and clinical visualizations. [2] The user-facing frontend is a separate `care_fe` repository, not part of the backend repository URL supplied for this candidate. [3]
- **Verified:** The backend is a Django project. Its manifest pins Django REST Framework, SimpleJWT, drf-spectacular, Celery, Redis client, PostgreSQL driver, object-storage tooling, rate limiting, Sentry, and related dependencies; it requires Python 3.13. [4] The documented local Compose topology includes PostgreSQL, the CARE service, Redis, Celery, and MinIO-like object storage. [5]
- **Verified:** CARE supports Django-app plugins loaded through `plug_config.py`; plugin URLs are mounted under `/api/plugin-name/`. The checked core configuration currently has an empty plugin list, so extensions are an architectural capability rather than proof that a particular plugin is included in the core release. [6] The official product page separately describes a plugin layer for national rails, devices, claims, messaging, analytics, and other extensions. [1]
- **Verified:** The backend exposes a broad resource/API surface in the generated source documentation, including patient, encounter, appointment/scheduling, medication request/dispense, diagnostic report, specimen, observation, invoice, payment reconciliation, inventory, facility, organization, and service-request areas. [7] The product page claims FHIR R5-aligned APIs and terminology support for SNOMED CT, LOINC, UCUM, and ICD-10. [1]
- **Verified:** Setup documentation covers Docker Compose, fixture loading, tests, manual PostgreSQL setup, migrations, type checks, and backup/restore documentation. The backend README also points to prebuilt container images in GHCR and automatically deployed develop/staging environments. [2] [5]
- **Verified:** There is substantial test evidence: backend API test modules cover bookings, encounters, patients, medications, diagnostics, inventory, invoices, scheduling, specimens, and related resources; the frontend documents Playwright end-to-end tests and the repository contains many workflow specs. [3] [7]
- **Verified:** Backend and frontend source repositories each state the MIT License. The backend `pyproject.toml` also declares the SPDX-style classifier `License :: OSI Approved :: MIT License`; the OSI's MIT text grants reuse, modification, distribution, and sublicensing subject to notice, with an “AS IS” warranty disclaimer. [8] [9] [10]
- **Verified:** Maintenance evidence is strong in the checked window: the backend GitHub metadata showed a non-archived `develop` branch pushed on 2026-10-13, and the commit history showed commits through 2026-09-26; the frontend metadata showed pushes on 2026-10-14. [11] [12] The release page contains the v3.0.0 re-architecture release and older v1.7.x releases, so commit activity is better evidence of current maintenance than a regular tagged-release cadence. [13]
- **Verified:** The frontend has an i18next-based translation system with remote-translation override and local fallback. The checked locale directory contains English, Hindi, Kannada, Malayalam, Marathi, and Tamil; Arabic is not listed. The checked i18n implementation contains no documented RTL mode or Arabic locale. [3] [14]

## Clinic workflow coverage

**Registration and patient chart/encounter — Verified.** The official scope includes registration, demographics, patient search, appointment/queue/visit creation, longitudinal records, encounters, notes, diagnoses, forms, orders, observations, care plans, and discharge summaries. The backend API/source tree includes patient and encounter resources and corresponding tests. [1] [2] [7]

**Appointments and queues — Verified.** The product page describes appointment calendars, doctor availability, open slots, queues, token displays, and department/service queues. The backend source documentation includes scheduling availability, booking, schedule, token, and queue resources. [1] [7]

**Prescriptions, pharmacy, and inventory — Verified.** The official scope describes medication requests, dispensing, substitutions, stock alerts, procurement, inventory, and audit trails. The backend dependency and source evidence includes medication request/dispense/administration resources and inventory APIs/tests. [1] [4] [7]

**Diagnostics and labs — Verified at stated scope.** The product page describes lab orders, specimen tracking, results, diagnostic reports, and LOINC/UCUM alignment. The source documentation includes diagnostic report, observation, specimen, specimen definition, and service-request resources. This verifies represented workflows and APIs, not a claim that every laboratory instrument or local lab process is supported out of the box. [1] [7]

**Billing and payments — Verified at stated scope.** The product page describes charge capture, invoices, payments, scheme coverage, claims direction, reconciliation, and accounting integration. The backend source documentation and tests include charge items, invoices, and payment reconciliation. Exact local tax, payer, insurance, and accounting behavior remains deployment/configuration dependent. [1] [7]

**Referrals and multi-clinic/facility operation — Partly verified.** Referrals, follow-up, facility hierarchy, department/role segregation, and state/program/national structures are described by the official product page; the source documentation includes facility, organization, service request, and related resources. The evidence supports multi-facility modeling and referral-related capability, but it does not establish that a specific clinic group’s cross-site governance, data-sharing, or referral network will work without configuration and integration work. [1] [7]

## Architecture, deployment, and integrations

**Architecture — Verified.** CARE is a Django/Python backend with a separate TypeScript/React frontend. The backend uses REST-oriented viewsets and FHIR-inspired resources, a plugin manager, PostgreSQL, Redis/Celery, and object storage. The frontend package identifies React, TypeScript, Vite, PWA tooling, i18next, FHIRPath, and Playwright among its technology/development dependencies. [4] [5] [7] [14]

**Reuse quality — Inference.** Shared patient, encounter, order, observation, role, report, and audit concepts plus the documented plugin mechanism suggest a reusable core rather than a single-purpose appointment application. This is an architecture/reuse inference from the stated model and source layout, not a guarantee of low-cost implementation or upgrade compatibility. [1] [6] [7]

**Deployment — Verified.** Docker Compose is the recommended local path; docs list database, application, cache, task queue, and object storage services, while the README points to GHCR images and self-hosting. The product page states self-hosted, cloud, hybrid, and on-premise deployment options. [1] [2] [5]

**Integration/API — Verified at stated scope.** The official materials claim FHIR R5-aligned APIs, terminology bindings, ABDM workflows, device/lab/PACS/accounting/payment/messaging integrations, and plugin-based extension. The repository’s generated API documentation and DRF/drf-spectacular dependencies corroborate an API-oriented implementation. Specific conformance profiles, API versioning guarantees, interface contracts, and production interoperability test results were not established in this screen. [1] [4] [7]

## Security, dependencies, and real scope limits

The security policy says that **only the latest version is checked for security vulnerabilities** and asks reporters to email a maintainer rather than file a public issue. That is a disclosure channel, not evidence of a completed security audit, a vulnerability-free release, a supported-version matrix, or a formal healthcare security certification. [15] The checked GitHub security page did not provide a basis for treating the project as fully audited; this note does not claim that no advisories exist.

The dependency manifests show many pinned direct dependencies and development tooling, which improves reproducibility, but the system still inherits risk from Django/Python packages, frontend packages, PostgreSQL, Redis, browser/PWA components, object storage, plugins, deployment configuration, and any connected external service. The current Compose file uses a mutable `docker.io/pgsty/silo:latest` image for the MinIO-compatible storage service, which is a concrete supply-chain/reproducibility caveat for operators. [4] [5] The frontend has an `npm test` script invoking Snyk, but the script’s presence is not evidence that a current scan passed. [14]

The MIT license is permissive and OSI-approved for the checked core repositories, but it does not grant rights to third-party dependencies, external terminology licenses, national health rails, proprietary hosted services, implementation/support contracts, or partner plugins. Those components must be reviewed separately. [8] [9] [10]

The supplied candidate repository is the backend/core. A complete usable clinic system requires the separate frontend and deployment configuration, plus local implementation of identity, SMS/OTP, payments, labs/devices, terminology, data governance, backup, monitoring, and operational controls where applicable. The official marketing page’s claims about deployments and 100+ hospitals are treated here as statements made by the project, not independently audited evidence. [1] [2] [3]

## Arabic, i18n, and RTL

**Verified:** i18next, language detection, remote locale loading, local fallback, and plugin namespaces are implemented. The checked frontend supports English, Hindi, Kannada, Malayalam, Marathi, and Tamil locale keys. [3] [14]

**Unknown/limitation:** No Arabic locale appears in the checked canonical locale directory, and no primary source checked here documents RTL layout support. Translation infrastructure may make Arabic contribution possible, but Arabic coverage, bidirectional layout correctness, date/number formatting, Arabic clinical terminology, and Arabic QA remain unverified. This is why the Arabic/i18n/RTL score is low rather than zero: i18n infrastructure is evidenced, Arabic/RTL readiness is not.

## Clinical and regulatory gate (separate from score)

**Gate result: unresolved; do not treat the score as clinical or regulatory approval.** The materials describe a broad clinical and hospital-operations platform and the security policy acknowledges handling sensitive patient data, but the checked evidence does not prove medical-device status, clinical-safety case, local health-data compliance, privacy-law compliance, ISO/SOC certification, data-residency compliance, validated decision support, or regulatory approval in any target jurisdiction. AI features are described as assistive/human-in-the-loop on the product page, but this does not establish safety or regulatory compliance. [1] [15] A target clinic would need jurisdiction-specific legal, privacy, security, clinical governance, validation, and integration review before production clinical use.

## Weighted screening score

**Score: 83/100.** Scores are provisional screening judgments based only on primary evidence available on the checked date; missing evidence is treated as unknown rather than as a factual failure.

```yaml
score_breakdown:
  feature_domain_fit: 19
  architecture_reuse: 14
  maintenance: 13
  security_dependencies: 8
  documentation_tests: 8
  license_clarity: 10
  setup_deployment: 5
  integrations_apis: 5
  arabic_i18n_rtl: 1
total: 83
```

- **feature_domain_fit — 19/20 (Verified with a small evidence discount):** unusually broad clinic/HMIS coverage across patient flow, encounters, scheduling, prescriptions, diagnostics, billing, facility operations, and extensions. [1] [2]
- **architecture_reuse — 14/15 (Verified/inferred):** reusable Django core, shared clinical/operational resources, FHIR-aligned model, separate frontend, and plugin mechanism. The implementation and upgrade cost of a large platform remains deployment-dependent. [4] [6] [7]
- **maintenance — 13/15 (Verified):** non-archived repositories and commits through the check date indicate active development. Tagged-release cadence is less clear because the releases page shows v3.0.0 alongside older v1.7.x releases. [11] [12] [13]
- **security_dependencies — 8/15 (Verified caveats):** pinned direct dependencies and some security tooling are positives, but the policy only supports the latest version, gives no audit/certification evidence, and deployment includes broad third-party/plugin supply-chain exposure. [4] [5] [14] [15]
- **documentation_tests — 8/10 (Verified):** setup and source docs exist; backend API tests and frontend Playwright coverage are substantial. Operational, clinical-validation, and security documentation are not demonstrated by this screen. [3] [5] [7]
- **license_clarity — 10/10 (Verified):** backend and frontend are MIT; backend packaging explicitly marks MIT as OSI approved. Third-party terms remain separate. [8] [9] [10]
- **setup_deployment — 5/5 (Verified):** documented Compose path, fixtures, tests, manual setup, GHCR images, and stated self-hosted/on-prem/cloud options. [1] [2] [5]
- **integrations_apis — 5/5 (Verified at stated scope):** API/resource surface, FHIR R5-aligned claims, terminology bindings, and plugin/integration directions are clearly documented. Specific target-system conformance still requires testing. [1] [4] [7]
- **arabic_i18n_rtl — 1/5 (Verified i18n; Arabic/RTL unknown):** locale infrastructure and six non-Arabic locales are evidenced; Arabic and RTL correctness are not. [3] [14]

## Confidence

**Confidence: medium-high for open-source scope, architecture, workflow coverage, license, and maintenance signals; medium for operational/security readiness; low for Arabic/RTL readiness and clinical/regulatory status.** The strongest evidence is canonical source, official docs, product materials, license files, manifests, tests, commits, and releases. Product-page deployment/adoption claims are recorded as project claims rather than independently audited facts.

## References

[1]: https://ohc.network/solutions/hospital-management "CARE HMIS official hospital-management solution page"
[2]: https://github.com/ohcnetwork/care "CARE canonical backend repository"
[3]: https://github.com/ohcnetwork/care_fe "CARE canonical frontend repository"
[4]: https://raw.githubusercontent.com/ohcnetwork/care/develop/Pipfile "CARE backend Pipfile and dependencies"
[5]: https://care-be-docs.ohc.network/development/local-setup.html "CARE backend development and Docker Compose setup documentation"
[6]: https://care-be-docs.ohc.network/development/pluggable-apps.html "CARE pluggable apps documentation"
[7]: https://care-be-docs.ohc.network/source/index.html "CARE generated source and API documentation"
[8]: https://github.com/ohcnetwork/care/blob/develop/LICENSE "CARE backend MIT license file"
[9]: https://github.com/ohcnetwork/care_fe/blob/develop/LICENSE "CARE frontend MIT license file"
[10]: https://opensource.org/license/mit/ "Open Source Initiative MIT License"
[11]: https://github.com/ohcnetwork/care/commits/develop/ "CARE backend commit history"
[12]: https://github.com/ohcnetwork/care_fe/commits/develop/ "CARE frontend commit history"
[13]: https://github.com/ohcnetwork/care/releases "CARE backend releases"
[14]: https://raw.githubusercontent.com/ohcnetwork/care_fe/develop/src/i18n.ts "CARE frontend i18n implementation"
[15]: https://github.com/ohcnetwork/care/security/policy "CARE security policy"
