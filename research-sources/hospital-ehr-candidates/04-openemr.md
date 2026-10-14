# OpenEMR — evidence note (2026-10-14)

**Category:** Ambulatory / clinic EHR. **Care scope:** Electronic health records and medical practice management, including scheduling and billing; principally a practice/clinic system rather than an integrated inpatient hospital suite. **Screening score: 78/100.** This is desk-research screening only, not a recommendation, certification, or safety assessment.

## Product boundary and clinical workflows

The canonical repository identifies OpenEMR as free and open-source EHR and medical-practice-management software, with integrated EHR, practice management, scheduling, electronic billing, and internationalization. Its product description and documentation frame it around practices, not an inpatient hospital information system (HIS/HMIS). The documentation lists appointments, patient records, notes/forms, prescriptions, encounter coding, billing, laboratory orders/results, diagnostic studies, and practice workflows. It documents lab interfaces/workflows, but this is not evidence that OpenEMR is a standalone laboratory information system (LIS). Nothing reviewed establishes a comprehensive inpatient admission/bed-management/ADT suite, hospital-wide orders or imaging/PACS/DICOM workflow, or a full integrated acute-care hospital package. Do not infer those capabilities from general EHR terminology. [1] [3]

The project wiki reports an ONC Health IT certification for OpenEMR version 8, dated January 30, 2026, with an enumerated set of criteria across clinical, care coordination, quality measures, privacy/security, patient engagement, design/performance, and transport. It explicitly says the certification is not a U.S. HHS endorsement and requires an external EMR Direct service for a certified-functionality requirement, with stated approximate charges. This is a specific U.S. Health IT Module certification claim, not blanket HIPAA/GDPR compliance, nor evidence of clinical safety or suitability in another jurisdiction. [3]

## Interoperability and data model

The project’s API guide documents a FHIR R4 (4.0.1) API and names US Core 8.0, SMART on FHIR 2.2.0, Bulk Data v2.0.0, and USCDI v5; it describes supported FHIR resources, OAuth bearer authentication/scopes, bulk export, CCD-A generation, and provenance. The project wiki separately documents certification-related adoption of US Core 8.0, SMART 2.2.0, Bulk Data 2.0.0, and USCDI v5 as implemented in OpenEMR 7.0.4, with legacy US Core 3.1.1 fallback. Treat the precise published guide as the evidence for the named API versions, but note that its sample CapabilityStatement identifies software version 7.0.4 and date 2025-11-25; current feature/version alignment should be confirmed against the actual deployed release and its live CapabilityStatement. [4] [3]

The wiki documents imports or use of ICD-9, ICD-10, SNOMED, and RxNorm and provides specific billing X12 837P material and diagnostic laboratory exchange documentation. These are specific documented coding/terminology/exchange items, not proof of universal terminology licensing, completeness, or conformance in every module. No DICOM support claim was verified. OpenEMR is an application with APIs and clinical records, not an LIS, an openEHR clinical data repository, or a generic FHIR infrastructure product. HL7 v2 support was not verified from the sources reviewed; do not generalize from FHIR or the term “interoperable.” [3] [4]

## Maintenance, security, privacy, and operations

The repository describes an actively maintained open-source project. The latest release visible on the evidence date is 8.4.1, dated 2026-09-20; release notes set minimum versions of PHP 8.3+, MariaDB 10.11+, and MySQL 8.4+. Version 8.4.0 (2026-09-13) lists multiple critical, high, and medium security fixes, including authorization/access-control issues, patient-data exposure, SQL injection, SSRF, and RCE. The public advisory list also shows additional 2026 disclosures. This demonstrates active remediation but underscores material security risk and the need to track patches, review exposure, and perform local security validation; no claim is made that every deployment is secure. [5] [6]

A repository security policy provides private vulnerability reporting via the project link or security email. The official access-control documentation describes role-based ACLs, including controls over patient demographics, medical records, prescriptions, notes, lab signing, appointments, encounters, and sensitive encounters; it also flags some entries as “not used yet” and says the document is under construction. Release notes mention audit-log fixes and project documentation lists security/audit features, but these facts do not establish a particular site’s effective access configuration, audit completeness, breach response, or privacy compliance. [7] [8] [5]

Deployment is a conventional web application stack; the current release’s PHP/database minimums are explicit. The repository has current Docker development instructions and CI coverage for PHP syntax/style/static analysis, unit, API, E2E, and integration tests across versions. The wiki offers installation, upgrade, backup, hardening, and user documentation, although some install/backup pages surfaced in this review are historic or did not extract reliably. Operators should use version-matched current release instructions and separately plan encrypted, tested backups, restore drills, patching, TLS, secrets, access reviews, and dependency management. The repo setup instructions show Composer/npm build steps; dependency inventory and vulnerability status must be checked for a specific release rather than inferred from the project label. [5] [9] [10]

## License and localization

The exact repository `LICENSE` contains GNU General Public License version 3 text and project notices referring to GPL. GPLv3 permits copying, modification, and charging for copies or support; distribution of covered modified works has source/license obligations. This is not a prohibition on commercial services or hosting, but distribution and combination questions depend on the facts and license text; obtain legal review for a commercial product boundary. The application is open source; hosted support, implementation, certification-linked services, and other third-party services can have separate costs. [2] [3]

The repository advertises internationalization and the official wiki has language-translation documentation/administration. I did not verify an authoritative current list confirming Arabic translation completeness or right-to-left (RTL) usability across the current release, nor clinical terminology/local regulatory localization. Mark Arabic/RTL as unverified pending hands-on testing. [1] [8]

## Screening score

| Dimension | Points | Rationale |
|---|---:|---|
| Hospital/EHR fit (20) | 13 | Strong ambulatory EHR/practice management; limited evidence of integrated inpatient suite. |
| Interoperability/data model (15) | 12 | Version-specific FHIR R4/US Core and terminology evidence; implementation/version qualification needed. |
| Maintenance (15) | 15 | Recent release and active fixes/activity. |
| Security/privacy/dependencies (15) | 9 | ACLs and disclosure process documented, but multiple serious recent advisories and local operational burden. |
| Docs/tests (10) | 9 | Broad official documentation and substantive CI/test matrix; some operational docs stale. |
| License clarity (10) | 10 | Exact GPLv3 license file. |
| Setup/deployment (5) | 4 | Docker and supported current runtime/database documented; production hardening remains operator-owned. |
| Arabic/localization/RTL (5) | 3 | Internationalization and translation mechanism documented; Arabic completeness/RTL unverified. |
| Clinical/regulatory evidence (5) | 3 | Specific version-8 ONC certification claim with criteria and scope; not blanket compliance or safety evidence. |
| **Total** | **78** | **Desk-research screening judgment only.** |

## Gaps and cautions

No deployed-system review, penetration test, threat model, privacy impact assessment, clinical hazard analysis, or local regulatory/legal assessment was conducted. Confirm exact release, enabled modules, FHIR capability statement, dependency advisories, data migration and backup/restore behavior, and Arabic/RTL rendering in the target configuration. Do not describe this as an integrated inpatient HMIS, LIS, DICOM/PACS product, HIPAA/GDPR compliant system, or clinically safe system on the basis of this note.

## References

[1]: https://github.com/openemr/openemr "OpenEMR canonical GitHub repository"
[2]: https://github.com/openemr/openemr/blob/master/LICENSE "OpenEMR exact repository license file"
[3]: https://www.open-emr.org/wiki/index.php/OpenEMR_Wiki_Home_Page "OpenEMR official documentation wiki and certification information"
[4]: https://github.com/openemr/openemr/blob/master/Documentation/api/FHIR_API.md "OpenEMR FHIR API guide"
[5]: https://github.com/openemr/openemr/releases/tag/v8_4_1 "OpenEMR 8.4.1 release notes"
[6]: https://github.com/openemr/openemr/security/advisories "OpenEMR repository security advisories"
[7]: https://github.com/openemr/openemr/security/policy "OpenEMR security policy"
[8]: https://www.open-emr.org/wiki/index.php/Access_Controls_Listing "OpenEMR access controls listing"
[9]: https://github.com/openemr/openemr/blob/master/CONTRIBUTING.md "OpenEMR contributor and development/testing guide"
[10]: https://www.open-emr.org/wiki/index.php/OpenEMR_Installation_Guides "OpenEMR official installation guides"
