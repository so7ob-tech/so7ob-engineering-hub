# Open Hospital — Clinic Management candidate evidence note

**Checked date:** 2026-10-14  
**Candidate slug:** `open-hospital`  
**Category:** Lightweight HIMS for health centers and hospitals  
**Candidate class:** Community/open-source, self-hosted HIMS/EHR; desktop-first and offline-capable, with an optional REST/API and React web stack that the project itself labels as work in progress. It is not evidenced here as a hosted enterprise service.

## Key findings

**Verified.** Open Hospital is a free/open-source HIMS intended for hospitals, health centers, and facilities in constrained settings. The official site describes patient data, visits, hospitalizations, medicines, laboratory results, patient registration, vaccinations, and births, and says it is intended for health centers and hospital structures in developing countries. [1] The canonical repository documents standalone PORTABLE mode and multi-user CLIENT mode, Java/Swing desktop delivery, low-resource operation, and operation without an Internet connection. [2]

**Verified.** The user guide lists pharmacy/inventory, laboratory, OPD, admission and discharge, pregnancy, malnutrition, vaccines, patient billing, therapy, appointment scheduling, internal communication, statistics, and printing. Patient workflows include registration, history/anamnesis, examination, OPD visits, laboratory, bills, clinical sheets, therapy, admissions, and patient-history views. [3] This is a strong small-facility workflow fit for registration, encounter/chart, prescriptions/therapy, billing, laboratory, and basic inpatient operations.

**Verified, with scope limits.** The user guide exposes referral fields and referral-oriented reports, but the reviewed primary material does not establish a full referral-network workflow, external referral exchange, or closed-loop referral tracking. There is no reviewed primary-source evidence of a multi-clinic/tenant model; treat multi-clinic support as **unknown**, not as a failure. The product documentation is facility-oriented rather than a claim of a complete hospital enterprise suite. [3] [4]

**Verified.** The architecture is separated into a core business/data-abstraction component, Java Swing GUI, documentation, REST API, and React single-page UI. The host repository explicitly marks the API and web UI as `[WIP]`; the UI repository calls the web UI early-stage and directs users to the more mature GUI. [2] [11] The core uses Java 17/Maven and Spring Boot/JPA-related dependencies; the API is a Spring Boot REST application with OpenAPI/Swagger and JWT-related dependencies. [10] [15] [16]

**Verified.** Deployment options are unusually practical for low-connectivity sites: portable single-computer mode, client/server mode with a central MariaDB/MySQL database, and a portable server mode. The administrator guide covers package extraction, JRE setup, database setup, users/groups, configuration, and backup/restore topics. [4] The API repository documents `/auth/login`, `/patients`, Swagger/OpenAPI, WAR packaging, and Docker Compose deployment; the core repository documents Docker-backed MariaDB testing. [9] [10]

**Verified.** Maintenance evidence is current at the check date: GitHub shows Open Hospital v1.15.2 released on 2026-10-12 with bug fixes and packaging/platform fixes, and the commit history shows activity through 2026-10-12. [5] [6] This supports an active project judgment, not a guarantee of a support SLA.

**Verified, but not a security audit.** The API includes BCrypt password encoding, JWT filters, stateless sessions, and per-resource permission checks. [14] However, the same reviewed security configuration disables CSRF protection and permits all HTTP methods and headers while allowing credentials under configured origins; these are deployment-review points, not by themselves proof of a vulnerability. [14] GitHub reports that the host repository has no `SECURITY.md` policy. [7] Dependabot configuration exists in component repositories and GitHub exposes a limited dependency graph, but no comprehensive vulnerability/advisory audit was performed for this note. [20]

**Verified.** The host repository and API repository carry the GNU General Public License, version 3. [12] [13] GPLv3 is OSI-approved; it is a strong copyleft license and should be reviewed for distribution/linking obligations when modifying or packaging the system. The product's user-guide policies are separately stated as CC BY-SA 4.0, so documentation licensing must not be conflated with the application code license. [3] Third-party Maven and npm components are present; their individual licenses, notices, and transitive dependency obligations were not audited here. [15] [16] [17]

**Verified / unknown.** Arabic is listed among the release languages, and the web UI contains an Arabic translation resource with patient, OPD, examination, navigation, pharmacy, laboratory, and other strings. [5] [18] The reviewed sources do not document a supported RTL layout mode or an Arabic usability/visual QA result. The Arabic resource also visibly contains untranslated English values in the same file, so Arabic completeness is not established. RTL support and translation completeness are therefore **unknown/partial**, not claimed.

## Clinic workflow coverage

- **Registration and patient chart:** **Verified.** New patient registration, editing, patient history/anamnesis, examination, clinical sheet, and patient-history views are documented. [3]
- **Visits/encounters:** **Verified.** OPD visits, visits, diagnosis/symptoms, examination, triage, and visit history are documented. [3]
- **Appointments:** **Verified.** Appointment scheduling is listed as a main feature. [3]
- **Prescriptions/therapy:** **Verified.** Therapy management and prescription-related OPD fields are documented; pharmacy and stock workflows are also documented. [3]
- **Billing:** **Verified.** Patient billing, bills, revenue/income/receivables reports, and billing history are documented. [3]
- **Laboratory:** **Verified.** Laboratory exams, laboratory history, lab reports, and lab management are documented. [3]
- **Referrals:** **Partially verified.** Referral fields and referral reports exist, but the depth of referral coordination and external exchange is not established. [3]
- **Admissions/discharge:** **Verified.** Admission, ward, discharge, and related patient history are documented. [3] [4]
- **Vaccinations, births/pregnancy, and malnutrition:** **Verified.** These are official product/user-guide features. [1] [3]
- **Multi-clinic/facility tenancy:** **Unknown.** No reviewed primary source establishes tenant isolation, cross-facility administration, or a multi-clinic operating model.

## Architecture, deployment, reuse, and integrations

Open Hospital is a Java desktop application with a Swing GUI and a reusable core. The host repository describes an API layer exposing REST services over the core and a React SPA consuming that API, but marks both as work in progress. [2] The core README documents Java 17+, Maven, `mvn package`, `mvn install`, and tests against an in-memory H2 database; the API README documents Spring Boot startup, OpenAPI/Swagger, JWT login, WAR packaging, and Docker Compose. [9] [10]

The portable/client/server model is a meaningful fit for clinics with intermittent or absent Internet connectivity. The normal client/server design relies on a central MariaDB/MySQL server and LAN connectivity, while portable mode keeps the application and database on one computer. [2] [4] The administrator manual's compatibility matrix is dated 2023-02-21, so current OS/database compatibility should be verified before deployment. [4]

The REST API is real source code rather than merely a roadmap: the project documents login, patient, Swagger/OpenAPI, Docker, and LAN deployment paths. [9] The API and UI are nevertheless not equivalent to a mature interoperability program. No reviewed primary source demonstrates HL7/FHIR exchange, a stable external API compatibility commitment, national registry integration, or a production-grade integration test contract. OpenAPI documentation and endpoint coverage support a provisional integrations score, not an interoperability endorsement. [9] [16]

## Documentation and testing

The project provides administrator and user manuals in a dedicated documentation repository, with instructions for building HTML/PDF documentation. [8] The user guide is detailed enough to document the major workflows and report set. [3] The core README documents `mvn test` and H2-based tests; the API repository contains security and API tests; the UI package defines unit-test, Cypress end-to-end, lint, and OpenAPI client-generation scripts. [10] [16] [17] The API build instructions use `-DskipTests=true`, and the release workflow visibly builds packages with `make` rather than proving that all component tests gate every release, so test execution and coverage should be checked in the target deployment pipeline. [9] [19]

## Exact license and security caveats

The application code is released under **GNU GPLv3**. The canonical host `LICENSE` is the full GPL version 3 text, and the API component also carries GPLv3. [12] [13] The OSI GPLv3 page confirms the license identity and approval. [13] GPLv3 is suitable for organizations that can comply with copyleft distribution requirements; it may be unsuitable for a closed-source proprietary derivative or a distribution model that cannot provide required corresponding source and notices. The Maven/npm dependency sets include numerous third-party components, so a legal review should separately inventory their licenses and notices before redistribution. [15] [16] [17]

Security evidence is mixed. Positive evidence includes BCrypt, JWT, stateless sessions, resource-level authorities, security tests, and Dependabot configuration in component repositories. [14] [16] The material caveats are that GitHub reports no repository security policy, the API configuration disables CSRF, CORS allows all methods and headers with credentials subject to configured origins, and this note does not constitute a complete source, dependency, penetration, privacy, or vulnerability audit. [7] [14] [20] The default/initial administrator credentials described in the administrator manual must not be left unchanged in a real installation; the manual itself says single-user mode is unacceptable for production use and describes changing the default login behavior. [4]

## Weighted screening score

Scores are provisional screening judgments under the shared 100-point rubric. Unknown evidence is not scored as a factual failure, and the clinical/regulatory gate below is separate from the score.

```json
{
  "feature_domain_fit": 17,
  "architecture_reuse": 12,
  "maintenance": 14,
  "security_dependencies": 8,
  "documentation_tests": 8,
  "license_clarity": 9,
  "setup_deployment": 4,
  "integrations_apis": 3,
  "arabic_i18n_rtl": 3
}
```

**Total score: 78/100.**

- **Feature/domain fit — 17/20:** Broad small-facility coverage across registration, visits/OPD, admissions, pharmacy, laboratory, appointments, therapy/prescriptions, billing, vaccination, pregnancy/birth-related work, and reports. Referral depth and multi-clinic operation are not established. [1] [3]
- **Architecture/reuse — 12/15:** Clear core/GUI/API/UI separation, Java/Maven/Spring-based components, and source-available reuse paths. The API and React UI are explicitly WIP/early-stage. [2] [9] [10] [11]
- **Activity/maintenance — 14/15:** v1.15.2 release on 2026-10-12 and commits through 2026-10-12 provide strong current activity evidence. This does not prove long-term support or an SLA. [5] [6]
- **Security/dependencies — 8/15:** BCrypt/JWT/permissions, tests, and Dependabot are positive. No security policy, disabled CSRF, broad CORS configuration, and no full audit are material caveats. [7] [14] [20]
- **Documentation/tests — 8/10:** Substantial admin/user manuals, core tests, API tests, and UI unit/Cypress scripts. Release/build instructions do not prove complete test gating, and some documentation is older than the current release. [3] [4] [8] [9] [10] [17] [19]
- **License clarity/suitability — 9/10:** GPLv3 is explicit and OSI-approved. The remaining point is withheld for the unperformed dependency-by-dependency license/notice review and the copyleft implications for downstream redistribution. [12] [13] [15] [16] [17]
- **Setup/deployment — 4/5:** Portable, client/server, MariaDB/MySQL, Windows/Linux packages, and Docker paths are documented. The compatibility matrix is dated and the WIP web/API stack adds deployment complexity. [2] [4] [9] [10]
- **Integrations/APIs — 3/5:** REST API, Swagger/OpenAPI, JWT login, and a Postman path are documented. Stable interoperability standards and external-system integrations are not evidenced. [9] [16]
- **Arabic/i18n/RTL — 3/5:** Arabic is listed and an Arabic UI resource exists. Completeness, RTL layout, and Arabic QA are not evidenced; the resource includes untranslated English strings. [5] [18]

## Clinical/regulatory gate

**Gate status: not cleared by this research.** The reviewed primary sources describe software features and deployment, not medical-device clearance, clinical safety validation, HIPAA/GDPR compliance, national health-data certification, or regulatory approval. Open Hospital must not be represented as clinically or regulatorily compliant, safe for production, or fit for a particular jurisdiction without separate evidence and local review. A deployment decision would need scoped privacy/security assessment, clinical governance and validation, backup/restore and disaster-recovery testing, access-control review, data-protection/legal review, and confirmation of local reporting/interoperability requirements.

## Candidate recommendation

**Good provisional fit for a small clinic or health center that values offline-capable, low-resource, self-hosted operation and broad basic workflows.** Prefer the mature desktop/portable or LAN client/server path for screening. Treat the REST/API and React UI as reusable but still developmental, and do not select it on the assumption of multi-clinic tenancy, complete Arabic RTL, standards-based interoperability, security certification, or regulatory compliance.

**Confidence:** Medium-high for feature scope, architecture, license, release activity, and documented deployment; medium for security posture, API maturity, Arabic completeness/RTL, multi-clinic capability, and clinical/regulatory suitability because primary evidence is incomplete or explicitly WIP.

## References

[1]: https://www.open-hospital.org/ "Open Hospital official website"
[2]: https://github.com/informatici/openhospital "Open Hospital canonical repository"
[3]: https://www.open-hospital.org/wp-content/OH_manuals/user/UserManual.html "Open Hospital User’s Guide"
[4]: https://www.open-hospital.org/wp-content/OH_manuals/admin/AdminManual.html "Open Hospital Administrator’s Manual"
[5]: https://github.com/informatici/openhospital/releases "Open Hospital releases"
[6]: https://github.com/informatici/openhospital/commits/master/ "Open Hospital commit history"
[7]: https://github.com/informatici/openhospital/security "Open Hospital GitHub security page"
[8]: https://github.com/informatici/openhospital-doc "Open Hospital documentation repository"
[9]: https://github.com/informatici/openhospital-api "Open Hospital REST API repository"
[10]: https://github.com/informatici/openhospital-core "Open Hospital core repository"
[11]: https://github.com/informatici/openhospital-ui "Open Hospital React web UI repository"
[12]: https://github.com/informatici/openhospital/blob/master/LICENSE "Open Hospital GNU GPLv3 license"
[13]: https://opensource.org/license/gpl-3-0/ "OSI GNU GPLv3 license page"
[14]: https://github.com/informatici/openhospital-api/blob/master/src/main/java/org/isf/config/SecurityConfig.java "Open Hospital API security configuration"
[15]: https://github.com/informatici/openhospital-core/blob/master/pom.xml "Open Hospital core Maven build and dependencies"
[16]: https://github.com/informatici/openhospital-api/blob/master/pom.xml "Open Hospital API Maven build and dependencies"
[17]: https://github.com/informatici/openhospital-ui/blob/master/package.json "Open Hospital UI package manifest and test scripts"
[18]: https://github.com/informatici/openhospital-ui/blob/master/src/resources/i18n/ar.json "Open Hospital Arabic translation resource"
[19]: https://github.com/informatici/openhospital/blob/master/.github/workflows/release.yml "Open Hospital release workflow"
[20]: https://github.com/informatici/openhospital/network/dependencies "Open Hospital GitHub dependency graph"
