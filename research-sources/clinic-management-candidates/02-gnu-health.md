# GNU Health HMIS

**Candidate slug:** `gnu-health`  
**Category:** hospital/primary-care HMIS, EMR and LIS  
**Checked date:** 2026-10-14  
**Candidate class:** community/open-source, self-hostable HMIS/EMR/LIS and health-facility management system. The canonical repository describes GNU Health as HMIS, EMR, HIS and LIS software, while the official download page provides source installation and an embedded VirtualBox image. [1] [13]

## Key findings

- **Verified:** The HMIS has broad clinic and facility scope: demographics and patient management; encounters, evaluations, hospitalizations and clinical history; appointments; finances and billing; stock and pharmacy; laboratory orders, workflows and reports; imaging; and health-center administration. [2]
- **Verified:** The repository describes more than 40 standard-based packages, including primary care, obstetrics and gynecology, pediatrics, surgery, laboratory information management, genetics, diagnostic imaging, dentistry and reporting. [1]
- **Verified:** The code is Python on the Tryton framework, organized as installable modules. GNU Health 5.0 documentation identifies Tryton 7.0 LTS, Python 3.13 support, a native GTK client, a development web client, Gunicorn as the default WSGI server, and modular package installation through `gnuhealth-control`. [3] [6]
- **Verified:** Maintenance evidence is strong for the checked date: the repository API reports `archived: false`, an update on 2026-10-12, and 8,639 commits are shown in the repository history. The release/tag APIs list 5.0.7 (2026-04-11) and earlier 5.0.x patchsets. [7] [8] [16]
- **Verified:** The project publishes security guidance, a security-advisory process, a vulnerability-reporting address, Tryton access controls, TLS guidance, and an optional cryptographic module for hashing, signing and verification of records. [9]
- **Verified limitation:** The official FHIR/REST documentation explicitly says the server is still in development, does not fulfill the FHIR specification, supports 12 read/search-oriented resources, and has no write functionality. [10] [11]
- **Verified limitation:** Documentation supports gettext language packs, Weblate-based translation, per-user language selection and 30+ language teams, but the reviewed primary sources do not establish Arabic translation completeness or RTL layout support. [6] [12]
- **Unknown:** The reviewed sources do not establish clinical validation, medical-device status, jurisdiction-specific regulatory certification, a formal safety case, or production-readiness evidence for a particular deployment. GNU Health’s clinical breadth must not be treated as regulatory or clinical compliance.

## Clinic workflow fit

**Verified.** Core functionality covers individual and demographic registration, patients, health encounters and evaluations, appointments, clinical history, health professionals, prescriptions/medicaments, insurance and billing, stock and pharmacy, laboratory test types/orders/labels/workflows/validation/reports, medical imaging, and health-center operations. The feature catalog also documents calendar scheduling and appointment events, nursing and ambulatory care, services that can be invoiced, and stock movements tied to prescriptions and care contexts. [2] The changelog confirms continuing work on insurance, billing, patient safety, allergy checks, prescription writing, laboratory reporting, and imaging integrations. [6]

**Partially verified / inference.** GNU Health is designed to integrate into the GNU Health Federation and to interconnect heterogeneous nodes across a region, province or country. That supports a distributed/multi-site architecture, but it is not proof of a single-instance multi-clinic operating model with shared scheduling, referral management, or consolidated clinic administration. [1]

**Unknown.** A dedicated referral workflow was not specifically established in the reviewed primary pages. The sources also do not provide a scoped workflow validation for a particular primary-care jurisdiction, payer, formulary, billing regime or laboratory accreditation model.

## Architecture, reuse and deployment

**Verified.** The application uses Python and Tryton, with modular packages and Git-hosted source. The repository contains the Tryton framework and GNU Health modules, and the official documentation describes a stable `main` branch, a development branch, translation branches and Woodpecker CI configuration. [3] [17] The architecture supports reusable module selection rather than requiring every facility to install every domain package. [2] [6]

**Verified.** Official installation paths include a traditional `gnuhealth-control` installation, Ansible, operating-system/distribution packages, a virtual-machine image and GNU Health Embedded; the installation guide warns not to mix methods. The Ansible documentation includes roles for GNU Health, PostgreSQL, Nginx, Gunicorn, Orthanc, Thalamus, backups and related system administration. [4] [5]

**Inference.** This is a strong reuse candidate for a clinic or health facility that can operate Python/Tryton/PostgreSQL infrastructure and select modules. It is not evidence of a low-operations SaaS product or of a turnkey, vendor-operated hosted service.

## Security and dependency caveats

**Verified.** The security guide treats security as a system responsibility across networking, operating system, database, application and people. It recommends updates, firewalling, protected SSH, encrypted storage, HTTPS/TLS and log monitoring; it documents security advisories and directs vulnerability reports to `security@gnuhealth.org`. It also states that the built-in Tryton web server is for development, not production, and recommends a production WSGI/web-server arrangement. [9]

**Verified.** GNU Health 5.0 documentation names Tryton 7.0 LTS, Python 3.13, Gunicorn, PostgreSQL-oriented deployment through the Ansible roles, and Flask plus add-ons for the separate FHIR server. [5] [6] [10]

**Caveat.** The security page is not a full security audit or threat model. It gives defensive guidance and an advisory channel, but the reviewed sources do not establish penetration-test results, a complete dependency-vulnerability inventory, a formal secure-development certification, or a guaranteed response SLA. The security page still describes uWSGI/Nginx while the 5.0 changelog says Gunicorn is now the default WSGI server; deployment should follow the version-specific instructions rather than blindly mixing guidance. [6] [9]

## Documentation, tests and maintenance

**Verified.** The official documentation portal includes user, technical, installation, administration, development, localization, security, FHIR/REST, release-process, plugin, roadmap and changelog sections. [1] [3] [4] The repository tree exposes Woodpecker CI configuration and test scripts, and recent release notes mention module tests, CI test runs and test-related maintenance. [8] [17]

**Unknown.** Public evidence reviewed here does not quantify test coverage, end-to-end clinical workflow coverage, defect escape rates, support response times, or the service-level commitments of any implementer. The release page still labels 5.0 as current stable and gives a 5.2 schedule estimate; the release API checked here lists 5.0.7 as the latest release, so 5.2 availability is not asserted. [8] [16]

## APIs and interoperability

**Verified.** The FHIR server exposes 12 documented resources, including Patient, DiagnosticReport, Observation, Practitioner, Procedure, Condition, FamilyHistory, Medication, MedicationStatement, Immunization, Organization and Conformance. Authentication uses GNU Health/Tryton credentials and access rights. [11] The broader project also documents GNU Health Federation integration, an Orthanc PACS/DICOM integration, and calendar/WebDAV functionality. [1] [2] [5]

**Material limit.** The official FHIR documentation says the implementation is still in development, does not fulfill the FHIR specification, has no write functionality, and still has incomplete search criteria. Therefore it should not be scored as a complete bidirectional FHIR interoperability layer. [10] [11]

## Arabic, internationalization and RTL

**Verified.** GNU Health uses gettext language packs, stores translations module-wise, uses Weblate, permits different users in one database to select different languages, and reports 30+ language teams in the 5.0 changelog. [6] [12]

**Unknown.** Arabic translation coverage, Arabic terminology quality, bidirectional text behavior, right-to-left layout, and Arabic locale testing were not established by the reviewed primary sources. No Arabic/RTL claim is made here.

## License and community/enterprise distinction

**Verified.** The canonical HMIS README states **GNU General Public License version 3 or later (GPL-3+)** for GNU Health. GPLv3 is the OSI-listed GNU General Public License 3.0, an approved open-source license. [1] [14] The repository tree also contains GPL-3.0-or-later license material for the included Tryton code and a CC-BY-SA-4.0 license file for documentation assets, so downstream redistribution must preserve the applicable notices and review bundled and external component terms. [17]

**Verified / distinction.** The official site presents downloadable community source, an embedded image, MyGNUHealth and the Thalamus federation API hub. It does not, in the reviewed pages, establish a separate proprietary enterprise edition or an official hosted SaaS offering. Implementation help and training may be available through the project/community, but those services are distinct from the GPL source code and are not scored as product capabilities. [1] [13]

## Clinical/regulatory gate (separate from score)

**Gate status: not established.** The sources demonstrate clinical-domain functionality and security documentation, but they do not prove regulatory clearance, medical-device classification, certification, validated clinical decision support, jurisdiction-specific privacy compliance, or safe production use for a named country or care setting. Any adoption decision requires independent clinical, legal, security, privacy, interoperability and operational due diligence.

## Weighted screening score

Scores are provisional screening judgments under the shared 100-point rubric. Missing evidence is treated as unknown, not as a factual failure. This score is not an endorsement and does not replace the clinical/regulatory gate.

```yaml
score_breakdown:
  feature_domain_fit: 18
  architecture_reuse: 14
  maintenance: 15
  security_dependencies: 10
  documentation_tests: 9
  license_clarity: 10
  setup_deployment: 4
  integrations_apis: 4
  arabic_i18n_rtl: 2
total_score: 86
```

- **Feature completeness/domain fit — 18/20:** unusually broad primary-care, EMR, LIS, pharmacy, stock, billing, imaging and facility-management coverage is directly documented; referral depth, jurisdictional billing and some multi-clinic semantics remain unverified. [1] [2]
- **Architecture/reuse quality — 14/15:** modular Python/Tryton design, package selection, federation readiness and documented deployment roles are strong reuse evidence; implementation complexity and upgrade coupling remain practical risks. [3] [5] [6]
- **Activity/maintenance — 15/15:** active, non-archived repository, recent update and multiple 2025–2026 patchsets/releases support a high activity score. [7] [8] [16]
- **Security/dependencies — 10/15:** advisory process, security guidance, access controls, TLS guidance and cryptographic features are positives; no complete audit, dependency SBOM/vulnerability report or response SLA was established, and deployment guidance has version-specific differences. [6] [9]
- **Documentation/tests — 9/10:** extensive official documentation plus visible CI/test configuration and test-related release activity; quantitative coverage and end-to-end clinical test evidence are unknown. [3] [8] [17]
- **License clarity/suitability — 10/10:** GPL-3+ is explicit and OSI-approved; bundled Tryton and documentation license files are visible, while integrators must still track third-party terms. [1] [14] [17]
- **Setup/deployment — 4/5:** multiple documented installation paths, Ansible roles, VM and embedded options are strong; operations are non-trivial and source pages do not prove turnkey hosted deployment. [4] [5] [13]
- **Integrations/APIs — 4/5:** FHIR/REST, federation, Orthanc/DICOM and WebDAV/CalDAV are documented, but FHIR is explicitly incomplete and read-only. [1] [2] [10] [11]
- **Arabic/i18n/RTL — 2/5:** broad gettext/Weblate internationalization is verified, but Arabic completeness and RTL behavior are unknown. [6] [12]

## Confidence

**Medium-high for scope, licensing, maintenance and documented technical features; medium for operational/security maturity; low for Arabic/RTL, regulatory status, clinical validation, referral depth and production readiness.** The score is therefore a provisional evidence screen, not a recommendation to deploy.

## References

[1]: https://codeberg.org/gnuhealth/his "GNU Health HMIS canonical repository README"
[2]: https://docs.gnuhealth.org/his/features.html "GNU Health HMIS features and module catalog"
[3]: https://docs.gnuhealth.org/his/techguide/development/coding.html "GNU Health coding and branch architecture guide"
[4]: https://docs.gnuhealth.org/his/techguide/installation/ "GNU Health installation methods and setup guide"
[5]: https://docs.gnuhealth.org/ansible "GNU Health Ansible deployment documentation"
[6]: https://docs.gnuhealth.org/his/changelog.html "GNU Health HMIS changelog and 5.0 technology notes"
[7]: https://codeberg.org/api/v1/repos/gnuhealth/his "Codeberg repository metadata for GNU Health HMIS"
[8]: https://codeberg.org/api/v1/repos/gnuhealth/his/releases "Codeberg GNU Health HMIS releases API"
[9]: https://docs.gnuhealth.org/his/techguide/security.html "GNU Health security guidance and advisory process"
[10]: https://docs.gnuhealth.org/his/techguide/fhir/ "GNU Health FHIR REST status and scope"
[11]: https://docs.gnuhealth.org/his/techguide/fhir/usage.html "GNU Health FHIR REST resources and usage"
[12]: https://docs.gnuhealth.org/his/techguide/localization/ "GNU Health localization and language-pack guide"
[13]: https://www.gnuhealth.org/download.html "GNU Health official downloads and project components"
[14]: https://opensource.org/license/gpl-3-0 "OSI GNU General Public License 3.0 license page"
[15]: https://www.gnu.org/licenses/gpl-3.0.html "GNU General Public License version 3 text"
[16]: https://codeberg.org/api/v1/repos/gnuhealth/his/tags "Codeberg GNU Health HMIS tags API"
[17]: https://codeberg.org/api/v1/repos/gnuhealth/his/git/trees/main?recursive=true "GNU Health HMIS repository tree with CI, tests and license files"
