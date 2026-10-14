# OpenEMR — Clinic Management candidate evidence note

**Candidate:** OpenEMR  
**Category:** ambulatory EHR and medical practice-management system  
**Slug:** `openemr`  
**Checked date:** 2026-10-14  
**Candidate class:** Community open-source, self-hostable ambulatory EHR plus practice-management application; separate professional support, hosting, installation, and customization services are offered by vendors in the surrounding OpenEMR ecosystem. [Verified: the project describes itself as free/open-source EHR and practice management, while its official documentation points to both community and professional support options.] [1] [3]

## Key findings

- **[Verified] Strong direct clinic fit.** The official feature documentation covers patient demographics/new registration, scheduling and patient flow, encounters and clinical notes, medications and e-prescribing, labs, procedures, referrals, patient portal, billing/claims/eligibility/receivables, reports, and support for multiple facilities. [2]
- **[Verified] Broad interoperability.** The repository documents Standard REST and FHIR APIs, OAuth 2.0/OpenID Connect, SMART on FHIR, granular scopes, bulk export, CCD generation, and FHIR resources relevant to appointments, encounters, medications, observations/labs, service requests/referrals, and specimens. [7] [8]
- **[Verified] Active as of the check date.** The repository showed 13,871 commits; the master history showed many commits on 2026-10-14 and 2026-10-13; and the 8.4.1 release was dated 2026-09-20. [1] [4] [5]
- **[Verified] Real deployment path exists, but it is not trivial.** The current release requires PHP 8.3+, MariaDB 10.11+ or MySQL 8.4+, and the project publishes production Docker images and Compose examples. Native development also requires a substantial PHP/Node/database/tooling stack. [4] [6] [9] [10]
- **[Verified] Arabic and RTL are explicitly listed.** The official feature page lists Arabic among supported languages and states UTF-8 and RTL support. This verifies stated product support, not translation completeness or usability of every module. [2]
- **[Verified] Security is an active material concern, not a reason to reject the candidate outright.** The 8.4.0 release lists multiple critical, high, and medium security fixes involving RCE, SQL injection, SSRF, authorization/IDOR, PHI disclosure, and portal/FHIR paths. The security policy provides private reporting routes but does not state a supported-version matrix or response-time SLA. [4] [12]
- **[Inference] Screening conclusion:** OpenEMR is a high-fit candidate for a clinic-management hub shortlist, but the score should not be read as a production-readiness or safety endorsement. An implementation would need version pinning, hardening, patch operations, dependency review, backups, access-control validation, and jurisdiction-specific clinical/privacy/regulatory review.

## Clinic workflow and scope

**[Verified]** OpenEMR's official feature list provides direct evidence for:

- registration and patient demographics, including contact, language/ethnicity, insurance, and primary provider data; [2]
- appointments, open-slot search, appointment categories, repeating appointments, notifications, patient-flow tracking, and multiple facilities; [2]
- longitudinal charting through encounters, medical issues, medications, immunizations, vitals, SOAP notes, review of systems, customizable forms, notes, documents, and reports; [2]
- prescriptions through drug search, medication tracking, e-prescribing, fax, and in-house pharmacy dispensing; [2]
- billing through CPT/HCPCS/ICD/SNOMED coding, 5010, UB-04, electronic claims, eligibility, insurance tracking, accounts receivable, EOB entry, and ERA workflows; [2]
- labs, diagnostic studies, procedures, referrals, Direct messaging, CCDA, and DICOM viewing; [2]
- patient-portal registration, scheduling, secure messaging, payments, records, labs, problems, medications, allergies, and appointments; [2]
- multiple facilities in the scheduling feature list, and site-qualified API paths such as `/apis/default/...` and `/apis/alternate/...`. [2] [7] [8]

**[Unknown / scope limits]** The primary sources reviewed do not establish Arabic translation quality, complete RTL behavior across every form and third-party workflow, performance or availability at a target clinic scale, a specific backup/recovery objective, local payer connectivity outside documented examples, or that “multiple facilities” provides the exact tenant isolation and reporting model required by a multi-clinic operator. These are validation items rather than factual failures.

## Architecture and reuse quality

**[Verified]** The repository layout exposes PHP application code and domain areas such as `src`, `controllers`, `apis`, `oauth2`, `portal`, `swagger`, `db`, `templates`, `docker`, and `tests`. The repository README lists syntax, styling, PHPStan, Rector, ShellCheck, Docker linting, isolated tests, Inferno certification tests, Composer checks, and API-documentation freshness workflows. [1]

**[Verified]** The Composer manifest identifies a PHP project requiring PHP 8.3 or newer, many PHP extensions, Doctrine ORM/DBAL, Symfony components, OAuth2 server support, Guzzle, Twig, PHPMailer, Stripe/Authorize.Net integrations, HL7 support, spreadsheet/PDF libraries, and Redis; it also defines PSR-4 autoloading and test/code-quality scripts. [6]

**[Verified]** The documented API request path is authentication → authorization → controller → service → database, which is a reusable integration boundary, and the project publishes both Standard REST and FHIR surfaces. [7]

**[Inference]** This is a substantial, extensible monolithic web application with recognizable API/service boundaries and containerized deployment, rather than a small embeddable clinic library. Reuse is therefore strongest through deployment, modules/forms, APIs, and configuration; extracting isolated clinical components or radically changing the persistence model would likely require material engineering work.

## Maintenance, documentation, and tests

**[Verified]** GitHub showed 13,871 commits at check time, active master commits on the check date, and a recent 8.4.1 maintenance release after 8.4.0. [1] [4] [5]

**[Verified]** Documentation includes a maintained wiki with current and prior user manuals, installation/deployment links, security/hardening sections, API documentation links, billing/scheduling/prescription/lab/Direct/portal material, and real-world-testing material. [3]

**[Verified]** The repository contains unit/integration/acceptance-test configuration and CI workflows that run API, services, email, web UI, and optional end-to-end suites in Docker, with coverage and diagnostics paths. [1] [6] [11]

**[Unknown]** The reviewed sources do not provide a single independently audited statement of total test coverage, defect escape rate, uptime, or support response quality.

## Security and dependency caveats

**[Verified]** OpenEMR has a security-reporting policy with private GitHub reporting and a security-team email/PGP option. [12]

**[Verified]** The 8.4.0 release notes disclose a large set of security fixes, including critical RCE, token replay/brute-force, unauthorized document reassignment, SQL injection, SSRF, and multiple FHIR, portal, patient-record, and authorization/IDOR issues; earlier 8.0.0.x notes also list high and medium issues. [4]

**[Verified]** The official codebase-security page describes security as a continuing work in progress and records historical external findings involving XSS, SQL injection, access control, file upload, CSRF, and other classes. [13]

**[Verified]** Composer declares many direct runtime and development dependencies, and includes `roave/security-advisories` in development requirements. This is evidence of dependency breadth and a preventive check, not proof that the full dependency tree is vulnerability-free. [6]

**[Inference]** A partial release/advisory review is not a full security audit. The material caveat for a clinic deployment is the need for a supported, patched release and an operator-owned hardening/monitoring process; the sources do not establish that an arbitrary installation is secure, HIPAA-compliant, GDPR-compliant, or production-ready.

## License and service boundary

**[Verified]** The repository's canonical `LICENSE` begins **GNU General Public License, Version 3, 29 June 2007**. [14] The repository metadata labels the project GPL-3.0, while `composer.json` declares the project package as `GPL-3.0-or-later`. [1] [6]

**[Verified]** GNU GPL version 3 is an OSI-approved open-source license. [15]

**[Inference / caveat]** For the OpenEMR codebase, record the exact root-code license as **GPL-3.0** and flag the Composer “or-later” metadata for legal clarification before redistributing a modified bundle. The GPL's copyleft, source-disclosure, notice, and no-warranty terms matter when conveying covered modified works. The Composer manifest also identifies numerous separately maintained third-party packages; their individual license and notice obligations are not replaced by the OpenEMR root license and require a bundle-level inventory. [6] [14]

**[Verified]** The community source is distinct from optional services: the project README points to community/professional support, and the official wiki says vendors and individuals offer support, installation, hosting, and customization. [1] [3] This note does not treat any hosted or enterprise offering as part of the GPL repository or assume that service terms match the community source.

## Deployment and integrations

**[Verified]** Production Docker images use release tags, while `latest` is the most recent stable production alias and `next`/`dev` are development-oriented aliases. The project documents a production Compose example and warns that development images are mainly for development/testing. [9]

**[Verified]** The 8.4.1 release lists PHP 8.3+, MariaDB 10.11+, and MySQL 8.4+ as minimum supported versions. [4] Contributor documentation describes Docker as the recommended development path and says native setup requires PHP, Composer, Node, Python tooling when used, and MySQL/MariaDB. [10]

**[Verified]** The API documentation describes FHIR R4, US Core, SMART on FHIR, OAuth2/OpenID Connect, granular scopes, PKCE, token introspection, bulk data export, CCD generation, Standard REST endpoints, and Swagger. [7] [8]

**[Unknown / caution]** API documentation contains versioned claims and examples that must be checked against the exact installed release and configuration. The sources do not prove that every listed resource or integration is enabled, certified for every jurisdiction, or equally mature in all deployment modes.

## Arabic, i18n, and RTL

**[Verified]** OpenEMR's official features page lists Arabic among supported languages, says multiple languages can be used within the same clinic, and states UTF-8 and RTL support. [2]

**[Unknown]** No reviewed primary source measured Arabic translation coverage, terminology quality, bidirectional layout correctness in every module, or Arabic localization of payer, prescription, legal, and patient-portal workflows. Treat Arabic/RTL as a strong documented capability that still requires acceptance testing.

## Clinical/regulatory gate (separate from score)

**[Verified]** The official wiki records an OpenEMR 8 Health IT Certification entry with certification date January 30, 2026, a CHPL listing, and a stated set of ONC criteria and clinical quality measures. The same page identifies additional software used for some criteria and states that certification is not an HHS endorsement. [3]

**[Inference]** This is useful evidence of a scoped US certification status for the identified certified module/version context, not a claim that every OpenEMR deployment is clinically validated or legally compliant. It does not establish regulatory approval in the So7ob deployment jurisdiction, nor does it substitute for clinical safety, privacy, security, medical-device, data-residency, or payer review.

## Provisional weighted score

Scores are **screening judgments**, not endorsements. Only evidence in the cited primary sources is scored; absence of evidence is treated as unknown rather than as a factual failure.

```json
{
  "feature_domain_fit": 19,
  "architecture_reuse": 12,
  "maintenance": 15,
  "security_dependencies": 7,
  "documentation_tests": 9,
  "license_clarity": 8,
  "setup_deployment": 4,
  "integrations_apis": 5,
  "arabic_i18n_rtl": 5
}
```

**Total: 84/100.**

- **feature_domain_fit — 19/20:** Direct evidence covers nearly all requested ambulatory workflows, including registration, charting/encounters, appointments, prescriptions, billing, labs, referrals, portal, and multiple facilities. One point is withheld because detailed workflow depth, local adaptations, and real-world acceptance are not proven by feature lists alone. [2]
- **architecture_reuse — 12/15:** Open repository structure, APIs, service/controller layering, Docker, Composer, and modular forms support reuse. Three points are withheld because the evidence describes a large application rather than a low-friction embeddable platform, and does not quantify extension stability or upgrade cost. [1] [6] [7] [9]
- **maintenance — 15/15:** Current-date commit activity, 13,871 commits, and a recent stable release provide strong maintenance evidence. [1] [4] [5]
- **security_dependencies — 7/15:** Private reporting, CI/security checks, and frequent security fixes are positive. The lower score reflects the disclosed critical/high findings, historical security-work-in-progress material, broad dependency surface, and absence of a full audit or stated SLA/support matrix. [4] [6] [12] [13]
- **documentation_tests — 9/10:** Extensive official wiki/repository documentation and multi-layer CI/test workflows are documented. One point is withheld because aggregate coverage and operational-support quality are not established. [1] [3] [10] [11]
- **license_clarity — 8/10:** GPLv3 is explicit and OSI-approved. Two points are withheld for the GPL-3.0 versus GPL-3.0-or-later metadata discrepancy and the need to inventory third-party licenses/notices. [6] [14] [15]
- **setup_deployment — 4/5:** Production Docker/Compose paths and current runtime minima are clear. One point is withheld for the substantial PHP/database/Node/extension/tooling requirements and the need for operator hardening. [4] [6] [9] [10]
- **integrations_apis — 5/5:** Standard REST, FHIR R4, SMART, OAuth2/OIDC, scopes, bulk export, CCD, HL7, claims/Direct-related material, and Swagger are directly documented. [2] [7] [8]
- **arabic_i18n_rtl — 5/5:** Arabic, multi-language clinic use, UTF-8, and RTL are explicitly listed. This score reflects documented capability; acceptance testing remains necessary because quality/completeness are unknown. [2]

## Confidence

**Confidence: Medium-high for product identity, clinic-domain fit, current activity, stated APIs, license identity, and stated Arabic/RTL support; medium for security posture, deployment suitability, and implementation depth.** The evidence is primarily canonical repository and official documentation, but several capability pages are self-described, the security review is not an audit, and the checked date is a point-in-time snapshot.

## References

[1]: https://github.com/openemr/openemr "OpenEMR canonical GitHub repository"
[2]: https://www.open-emr.org/wiki/index.php/OpenEMR_Features "OpenEMR official feature documentation"
[3]: https://www.open-emr.org/wiki/index.php/OpenEMR_Wiki_Home_Page "OpenEMR official documentation wiki home and certification information"
[4]: https://github.com/openemr/openemr/releases "OpenEMR releases and security changelogs"
[5]: https://github.com/openemr/openemr/commits/master/ "OpenEMR master commit history"
[6]: https://raw.githubusercontent.com/openemr/openemr/master/composer.json "OpenEMR Composer manifest and dependency metadata"
[7]: https://github.com/openemr/openemr/blob/master/API_README.md "OpenEMR Standard REST and FHIR API overview"
[8]: https://github.com/openemr/openemr/blob/master/Documentation/api/FHIR_API.md "OpenEMR FHIR API documentation"
[9]: https://github.com/openemr/openemr/blob/master/DOCKER_README.md "OpenEMR Docker deployment documentation"
[10]: https://github.com/openemr/openemr/blob/master/CONTRIBUTING.md "OpenEMR contributor setup and development documentation"
[11]: https://github.com/openemr/openemr/blob/master/.github/workflows/test.yml "OpenEMR automated test workflow"
[12]: https://github.com/openemr/openemr/security/policy "OpenEMR security vulnerability reporting policy"
[13]: https://www.open-emr.org/wiki/index.php/Codebase_Security "OpenEMR official codebase security documentation"
[14]: https://raw.githubusercontent.com/openemr/openemr/master/LICENSE "OpenEMR canonical GNU GPL v3 license file"
[15]: https://opensource.org/license/gpl-3-0 "OSI GNU General Public License version 3 license page"
