# GNU Health HIS — evidence note (2026-10-14)

**Category:** Full EHR / HMIS. **Care scope:** Hospital and health information system across clinical records and institution operations within the broader GNU Health ecosystem. **Discovery caveat:** Official GNU Health documentation identifies the Codeberg HIS repository as the current system source; it is included as a broad hospital/HMIS option, not evidence of suitability for any specific deployment. This is desk research, not a recommendation, certification, or safety assessment.

## Identity, scope, boundaries

GNU Health describes the HIS/HMIS as covering EMR, HIS and hospital management, with over 40 modular packages including primary care, obstetrics/gynecology, pediatrics, surgery, laboratory information management, genetics, diagnostic imaging, dentistry and reporting. It also describes hospital administrative functions such as financial management, billing, stock and pharmacy management. This is a genuinely broad HMIS scope, not merely an ambulatory EHR. The repository describes integration with GNU Health Federation; separate ecosystem components include MyGNUHealth PHR, Occhiolino LIMS, Thalamus/federation and bioinformatics/genetics, so those should not be conflated with the HIS repository itself. [1] [2]

Specific named clinical modules establish documented areas, but the material reviewed does not prove every detailed workflow (e.g. order lifecycle, medication administration, imaging archive/viewer, or encounter lifecycle) or its completeness. No assumption is made that a diagnostic-imaging module is a PACS, or that a laboratory package is equivalent to the separately named Occhiolino LIMS. Product pages characterize an adaptable design ranging from small offices to national systems; this is a vendor/project scope claim, not independent validation for a particular institution. [2]

## Interoperability and data model

The documentation navigation exposes a section called **FHIR REST**, which supports the existence of a documented FHIR-oriented interface, but the page content was not retrievable during this review; FHIR version, resource coverage, conformance, implementation maturity and certification therefore remain unverified. The repository describes the Federation as interconnecting heterogeneous nodes, but this does not establish a specific standard or wire protocol. No primary-source evidence was confirmed here for HL7 v2, DICOM, LOINC, SNOMED CT, or particular ICD version/coverage. The project calls its packages “standard-based,” but that general phrase is not treated as evidence for any named standard. [1] [3]

## Technology, deployment and operations

Repository language statistics show Python as the dominant implementation language, with small JavaScript and shell portions. Official installation documentation lists vanilla installation, Ansible (since 4.4), OS/distribution packages, virtual-machine and embedded options, and warns not to mix installation methods. The current repository release series is 5.0.x. A search-indexed official vanilla-installation excerpt listed PostgreSQL >=15, Python >=3.10, Gunicorn 23.0 and Tryton 7.0; however, the page itself returned a Codeberg Pages hosting error when opened, so treat those as provisional and validate against the version-matched installation material before deployment. [1] [4]

Official administration documentation includes backup/restore, package updates, instance refresh, upgrades and GNU Health Control Center topics. Details were not fully retrievable in this check, so backup retention, recovery objectives, upgrade downtime, supported upgrade paths and restoration testing are not independently established. Production security guidance explicitly says Tryton’s built-in web server is development-only and recommends uWSGI plus Nginx; it also advises OS updates, limiting exposed ports, TLS, filesystem encryption and log review. These are deployment responsibilities, not automatic product guarantees. [3] [5]

## Maintenance, tests, security and privacy

At the evidence date, Codeberg release history showed HIS 5.0.7 dated 2026-04-11, preceded by 5.0.6 on 2026-03-16 and regular 5.0.x patch activity. Release history includes CI/test-related commits. That is evidence of recent maintenance, not a service-level commitment. [6]

The security guide says GNU Health issues Security Advisories when vulnerabilities are found, directs vulnerability reports to security@gnuhealth.org, and recommends system-hardening measures. The official advisory index page retrieved in this review exposed one legacy GNUHEALTH-SA-2016-1 entry for a Tryton remote denial-of-service issue, marked active in the displayed index. That sparse/legacy-visible index is not a complete vulnerability scan and does not establish that current releases are vulnerability-free; no current advisories or current dependency audit were verified. [3] [7]

The official security guide documents Tryton authentication configuration and public-key cryptographic signing/verification for selected records (including prescriptions, birth/death certificates, and extensible models), supporting integrity/non-repudiation features. It does not by itself establish comprehensive role/permission design, immutable audit logging, privacy-by-default, encryption-at-rest coverage or a privacy compliance program. Patient-data privacy depends on deployment configuration and operational controls; no HIPAA/GDPR/ONC or clinical-safety compliance claim is verified. The project's warnings expressly state its introductory security guidance does not replace expert advice for a specific installation. [3]

## License, localization and assurance

The repository README states GNU GPL version 3 or later. The exact root `LICENSE` endpoint could not be retrieved in this review (anti-bot interstitial), so the license is reported from the canonical repository's explicit license notice, not an independently inspected license text. GPLv3+ is a free-software license; it does not mean the software cannot be used commercially. Distribution/modification obligations arise under GPL terms, and commercial support/implementation services are separate from the software license. GNU Health describes the project as community-driven and GNU Solidario as a not-for-profit organization; no exclusive commercial-use boundary was identified. [1] [8]

Official documentation includes localization and translation workflows, and repository release history shows translation/backport activity. That establishes localization infrastructure, not a guarantee of complete Arabic translation or right-to-left layout quality. Arabic coverage and RTL usability are unverified. [3] [6] [9]

No official certification or clinical-safety evidence scoped to this product/version/deployment was found. Compliance and safety suitability must not be inferred from features, standards-oriented wording, or open-source status. [2] [3]

## Desk-research screen (100 points)

| Dimension | Score | Rationale |
|---|---:|---|
| Hospital/EHR fit (20) | 18 | Broad EMR/HMIS and institution operations; detailed workflow completeness not established. |
| Interoperability/data model (15) | 7 | FHIR REST topic and federation indicated, but version/resource coverage and other named standards unverified. |
| Maintenance (15) | 13 | Several recent 5.0.x releases and ongoing activity through Apr 2026. |
| Security/privacy/dependencies (15) | 8 | Security guidance and cryptographic module documented; current vulnerability/dependency and privacy assurance gaps. |
| Docs/tests (10) | 7 | Extensive official docs navigation and test/CI activity; some pages unavailable and test coverage not quantified. |
| License clarity (10) | 9 | Repository explicitly says GPLv3+, although exact license-file text could not be opened. |
| Setup/deployment (5) | 4 | Multiple supported installation routes and admin topics; operations details need version-matched validation. |
| Arabic/localization/RTL (5) | 1 | Localization framework exists; Arabic completeness and RTL remain unverified. |
| Clinical/regulatory evidence (5) | 0 | No scoped certification or clinical-safety evidence verified. |
| **Total** | **67** | Desk-research screening judgment only. |

**Screening conclusion:** GNU Health is a substantial, modular full HMIS candidate on documented breadth and recent maintenance, but unresolved interoperability conformance, current security posture, operational assurance, Arabic/RTL and clinical/regulatory evidence prevent treating this screen as deployment validation or recommendation.

## References

[1]: https://codeberg.org/gnuhealth/his "GNU Health HIS canonical Codeberg repository"
[2]: https://www.gnuhealth.org/about-us.html "GNU Health ecosystem and product descriptions"
[3]: https://docs.gnuhealth.org/his/techguide/security.html "GNU Health HIS security guidance"
[4]: https://docs.gnuhealth.org/his/techguide/installation/index.html "GNU Health HIS installation methods"
[5]: https://docs.gnuhealth.org/his/techguide/administration/index.html "GNU Health HIS system administration topics"
[6]: https://codeberg.org/gnuhealth/his/releases "GNU Health HIS releases and activity"
[7]: https://ftp.gnu.org/gnu/health/security/security_advisories.html "GNU Health security advisory index"
[8]: https://codeberg.org/gnuhealth/his/src/branch/master/LICENSE "GNU Health HIS repository LICENSE path (retrieval blocked during review)"
[9]: https://docs.gnuhealth.org/his/techguide/localization/ "GNU Health HIS localization documentation"
[10]: https://docs.gnuhealth.org/his/techguide/index.html "GNU Health HIS documentation contents, including FHIR REST"
