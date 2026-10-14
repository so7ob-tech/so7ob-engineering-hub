# Open Hospital — evidence note (2026-10-14)

## Scope and classification

Open Hospital is a credible **integrated hospital-system candidate**, not merely an ambulatory practice tool: the project describes itself as a Health Information Management System (HIMS), and the official product site frames it for hospitals, health centers and facilities, particularly in developing-country contexts. It says it supports patient data, visits, hospitalizations, medicines and laboratory results. The official documentation also calls it fitted for small facilities. This supports the requested category and a facility workflow fit, while not demonstrating the depth or completeness expected of a large acute-care enterprise EHR/HMIS. [1] [2] [3]

The canonical repository explains that this repository assembles the all-in-one packages. The main application is a Java desktop client, operating standalone or in a client/server configuration. The separate OH API (REST server) and OH UI (React SPA) are explicitly marked work in progress; the existence of those components should not be mistaken for a completed web-first EHR. [1]

## Clinical and hospital workflows

The official administrator guide enumerates pharmacy, laboratory, outpatient department (OPD), patient admission/discharge, pregnancy, malnutrition, vaccines, billing, therapy, appointment scheduling, internal communication, statistics and printing. The user guide describes a patient browser with patient create/edit, admission, anamnesis, examination, OPD, laboratory, billing, clinical-sheet and therapy actions. It describes recording/searching OPD visits and managing admissions. Imaging is optional: the manual says an imaging function can load and view image files when the DICOMMODULEENABLED setting is enabled. This is evidence of image-file viewing, not by itself proof of a standards-conformant PACS/DICOM integration. [3] [4]

Medication/pharmacy stock and therapy functions are documented, as are lab exams and results; the sources reviewed do not establish a computerized provider order-entry system, comprehensive medication reconciliation/e-prescribing, an enterprise radiology workflow, or all typical inpatient order pathways. Open Hospital is therefore distinct from an ambulatory-only practice system but should not be represented as a verified, fully comprehensive inpatient EHR without further functional validation. [3] [4]

## Interoperability and data model

The repository describes a Core library with business logic and data abstraction, and a REST API component marked WIP. It makes no explicit claim in the reviewed official sources that the product implements FHIR or HL7 interfaces, nor that its clinical concepts use LOINC, SNOMED CT or ICD in a standards-conformant terminology service. Imaging’s optional file viewer setting is the only specific imaging-related detail found; it is not enough to claim DICOM conformance or exchange. No openEHR platform/architecture claim was found. Treat all those standards integrations as **unverified**, rather than infer them from general interoperability language or feature names. [1] [4]

## Maintenance, maturity and activity

The canonical repository describes itself as the release-packaging repository. At the evidence date, its releases page listed **v1.15.2, released 2026-10-12**, with bug fixes and release package SHA-256 checksums. The commit history showed multiple commits on October 12 and activity in the preceding weeks. This is direct evidence of current maintenance, although it is not a guarantee of response time, support, roadmap or long-term continuity. The official website reports 23 active installations in 13 countries; that is the project’s own deployment statement, not independently verified adoption data. [1] [5] [6]

## Security, privacy and access control

GitHub’s repository Security view explicitly reports **“No security policy detected”** and that no SECURITY.md is set up. The Security Advisories page displayed no advisory entries in the extracted view; this must not be interpreted as proof that the product has no vulnerabilities. The reviewed sources do not establish a formal vulnerability disclosure channel, independent security assessment, encryption-at-rest/in-transit guarantees, or a privacy/compliance certification. [7] [8]

The administrator guide documents multi-user accounts, groups and different application-use rights, plus session timeout, password strength/length, failed-password attempt and lock-time settings. But it also documents that SINGLEUSER defaults to yes, starting with the predefined `admin` account whose default password is `admin`; it warns that data security must not rely solely on the application and requires proper network/client configuration. Administrators must treat these defaults as deployment risks and change/configure them before any use with real patient data. The materials reviewed do not establish immutable audit trails, role design validation, encryption, or a complete security control framework. [9]

Patient data are sensitive health information. The product’s offline/local and client-server modes say nothing by themselves about privacy law compliance. HIPAA, GDPR, ONC certification, or any clinical safety certification is **unverified** in the sources reviewed; no such claim is made here. [1] [2] [9]

## Runtime, database, deployment and operations

The repository says the client is Java and uses Swing for the GUI; the product documentation names Windows/Linux and MySQL/MariaDB. The administrator guide details portable single-computer, client/server with a central DBMS, and portable-server configurations, naming MariaDB as the preferred open-source database. The same guide documents hardware/software prerequisites and installation procedures. [1] [3] [10]

The guide describes minor versus major release database changes, SQL migration scripts for major upgrades, preserving configuration/data files, and backing up the database before migration. It marks portable mode as not intended for production. These are useful operational instructions, but do not demonstrate tested backup restoration objectives, high availability, disaster recovery guarantees or a managed hosting service. [10]

The repository provides package build instructions (JDK 8+, Maven, asciidoctor-pdf, zip and GNU make). Official user and administrator guides are available, and demo data are advertised. A complete automated test strategy or quantitative test coverage was not verified from the sources inspected. [1] [3] [4]

## Localization

The product documentation lists Arabic among available languages. The administrator manual names `ar` as an allowed language setting. These official statements support Arabic localization availability, but do not establish complete translation coverage, contemporary Arabic clinical terminology, or validated right-to-left (RTL) layout across screens/reports. RTL quality is therefore unverified. [3] [9]

## License and commercial boundary

The exact root `LICENSE` file contains the GNU General Public License, Version 3, dated 29 June 2007 (GPL-3.0). GPL-3.0 permits use, modification and distribution subject to its conditions, including source/provision obligations when conveying covered works. This is a source-code license finding, not a conclusion about all bundled third-party components, trademarks, support, hosting or services; inspect component-level notices and dependencies before redistribution or commercial deployment. The license permits commercial use subject to the license terms; it does not mean paid implementation/support is included. [11]

## Screen score (desk research only)

| Dimension | Score | Rationale |
|---|---:|---|
| Hospital/EHR fit (20) | 17 | Documented admissions, OPD, patient record, lab, pharmacy, therapy and billing; depth of inpatient orders remains unverified. |
| Interoperability/data model (15) | 7 | Core/data abstraction and REST API direction, but API/UI are WIP and named clinical standards conformance was not established. |
| Maintenance (15) | 14 | v1.15.2 released two days before evidence date and recent commits visible. |
| Security/privacy/dependencies (15) | 8 | User/group controls and password settings exist; no SECURITY.md, default weak admin credential documented, privacy/security controls remain unclear. |
| Docs/tests (10) | 8 | Substantial official admin/user manuals; automated test coverage/strategy not established. |
| License clarity (10) | 10 | Exact root GPL-3.0 license. |
| Setup/deployment (5) | 4 | Multiple documented modes and MariaDB/MySQL; portable mode explicitly non-production. |
| Arabic/localization/RTL (5) | 4 | Arabic explicitly supported; RTL completeness not verified. |
| Clinical/regulatory evidence (5) | 1 | No clinical safety, certification or regulatory evidence verified. |
| **Total** | **73/100** | Desk-research screen only. |

**Screen outcome:** retain as an integrated hospital-system candidate for further fit and deployment diligence; do not advance solely on this screen. Scores are comparative desk-research judgments, not a recommendation, certification, security audit, clinical safety assessment, procurement approval or implementation assurance.

## References

[1]: https://github.com/informatici/openhospital "Open Hospital canonical GitHub repository"
[2]: https://www.open-hospital.org/ "Open Hospital official product website"
[3]: https://www.open-hospital.org/documentation/ "Open Hospital official documentation and product features"
[4]: https://www.open-hospital.org/wp-content/OH_manuals/user/UserManual.html "Open Hospital 1.15.1 User’s Guide"
[5]: https://github.com/informatici/openhospital/releases "Open Hospital GitHub releases"
[6]: https://github.com/informatici/openhospital/commits/master/ "Open Hospital commit history"
[7]: https://github.com/informatici/openhospital/security "Open Hospital GitHub Security page"
[8]: https://github.com/informatici/openhospital/security/advisories "Open Hospital GitHub Security Advisories"
[9]: https://www.open-hospital.org/wp-content/OH_manuals/admin/AdminManual.html "Open Hospital 1.15.1 Administrator’s Guide"
[10]: https://www.open-hospital.org/wp-content/OH_manuals/admin/AdminManual.html "Open Hospital Administrator’s Guide: installation, database and upgrade procedures"
[11]: https://github.com/informatici/openhospital/blob/master/LICENSE "Open Hospital exact root LICENSE file (GPL-3.0)"
