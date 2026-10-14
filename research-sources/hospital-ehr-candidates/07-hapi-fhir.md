# HAPI FHIR — evidence note (2026-10-14)

**Category:** Interoperability infrastructure. **Care scope:** Open-source Java FHIR implementation with client/server libraries and a FHIR server implementation for building or integrating clinical systems; not a turnkey EHR. The canonical project repository and official documentation describe an actively developed FHIR implementation. It is included as interoperability infrastructure, not as a hospital records application. [1] [2]

## Product and boundaries

The project defines itself as a Java API for HL7 FHIR clients and servers, and its official documentation calls it an implementation of the HL7 FHIR specification for Java. It includes FHIR model classes, parsers/serializers, clients, a plain server module that can front an arbitrary data source, and a JPA persistence module for a database-backed REST server. This is framework/infrastructure: implementing operational workflows and user-facing hospital/ambulatory applications is outside the evidence reviewed here. [1] [2] [3]

FHIR resources include Patient, and the docs demonstrate parsing and creating Patient objects. JPA server documentation lists persistence, search, terminology, clinical reasoning, questionnaires, care gaps, measures, and plan/activity definitions; these are capabilities/components, not proof of a complete EHR workflow. No source reviewed documents a turnkey application for admissions/ADT, encounter management, order entry, medication administration, laboratory or imaging workflows, billing, or hospital operations. Do not classify it as a complete EHR/HMIS, ambulatory EHR, LIS, or PACS. [2] [3]

## Interoperability and data model

FHIR is the explicit interoperability standard: HAPI provides FHIR resource models and client/server APIs. Official version guidance lists support by HAPI release across DSTU1, DSTU2, DSTU2.1, DSTU3, R4, R4B, and R5 columns; for the listed HAPI 8.2.0 row the supported versions are DSTU1 1.0.2, DSTU2 1.4.0, DSTU3 3.0.2, R4 4.0.1, R4B 4.3.0, and R5 5.0.0 (the rendered table omits/does not clearly show values for every cell). Confirm exact release/version pairing in the selected release's module documentation before implementation. [4] The sources reviewed do not establish specific HL7 v2, DICOM, LOINC, SNOMED CT, or ICD implementation/conformance, terminology licensing, or jurisdictional profiles; no generic standards-compliance claim is made.

## Architecture, deployment, operations

The JPA server uses JPA/Hibernate abstraction; official database guidance calls SQL Server, PostgreSQL, and Oracle supported, CockroachDB experimental, and MySQL/MariaDB deprecated due to poor performance. [5] The separate JPA server starter is a deployable starter/sample, not the library source. It documents Docker, Maven/Spring Boot/Jetty deployment and defaults to H2, with configuration for PostgreSQL and SQL Server. Crucially, its README says there is no security implementation or enterprise logging in the starter; subscription topic cache and message broker channels are in-memory and not shared between instances by default. [6]

The documentation includes an upgrade guide and database/schema/configuration sections, but the material reviewed does not establish a complete backup/restore runbook, production disaster recovery, high availability guarantees, or a universal safe upgrade procedure. Operators must design and verify backups, restore tests, patching, capacity, deployment topology, and release-specific migrations for their installation; these are not implied by the framework. [3] [5] [6]

## Security, privacy, dependencies, and assurance

HAPI's security documentation explicitly says there is no one-size-fits-all security layer. It supplies building blocks and interceptor hooks for authentication, authorization, consent, and audit; the documentation's example uses intentionally hard-coded credentials and warns this is not production practice. Security architecture, identity integration, key management, logging/monitoring, and tenant isolation therefore require system-specific implementation and validation. [7] The JPA starter's stated lack of security implementation and enterprise logging is a material deployment caveat. [6]

The repository's GitHub security page states that no `SECURITY.md` policy is set up; its advisories page is publicly addressable, but the page extraction did not provide advisory entries. This does not prove absence of vulnerabilities. NVD records CVE-2026-55470 for HAPI FHIR and says it is fixed in 6.9.10; assess the affected component and upgrade guidance against the exact deployed modules/version rather than treating this as a comprehensive vulnerability inventory. [8] [9] Dependency/SBOM or full transitive dependency assessment was not performed. No HIPAA, GDPR, ONC certification, or clinical safety certification claim was verified in the official sources reviewed; security features alone are not compliance evidence. [7]

## Maintenance, license, docs, localization

As of the evidence date, GitHub's latest release endpoint identifies v8.8.2, published 2026-09-25, and the repository's latest commit endpoint showed activity on 2026-10-14. These indicate recent project activity, not a service-level support commitment. [10] Repository and official site describe Apache Software License 2.0. [1] The exact canonical license document is linked in the repository file listing at [11]; license permits reuse subject to Apache-2.0 terms and notices, but commercial support is a distinct offering (the README points to Smile CDR). The license does not grant a turnkey EHR, compliance status, or clinical authorization. [1] [11]

Official docs are extensive, with version-specific guides, Javadocs, client/server/JPA, security, validation, and upgrade material. The JPA starter documents integration tests and warns that switching database configuration can require adapting/skipping tests. No independent test-coverage or quality audit was performed. [3] [6] No supported Arabic translation, Arabic locale, RTL interface, or localization feature claim was found in the reviewed official documentation; treat Arabic/RTL support as unverified and likely a host-application responsibility. [2] [3]

## Screening score

This desk-research screen is not a recommendation, certification, or safety assessment. Scores are integer points against the requested maxima; total **58/100**.

- Hospital/EHR fit: **3/20** — infrastructure rather than operational records application.
- Interoperability/data model: **14/15** — deep, explicit FHIR scope and multiple versioned models; other named standards/profile claims not verified.
- Maintenance: **14/15** — current release and same-day repository activity at evidence date.
- Security/privacy/dependencies: **6/15** — useful security hooks and CVE history, but no built-in policy/security layer in starter, no SECURITY.md, and dependency review not done.
- Docs/tests: **8/10** — broad official documentation and starter integration tests; no independent test quality audit.
- License clarity: **9/10** — repository states Apache-2.0, exact license linked; commercial-support boundary apparent.
- Setup/deployment: **4/5** — documented starter, Docker, Maven and database options; production operations burden remains.
- Arabic/localization/RTL: **0/5** — no verified official support found.
- Clinical/regulatory evidence: **0/5** — no applicable certification or clinical-safety evidence verified.

**Total:** 3 + 14 + 14 + 6 + 8 + 9 + 4 + 0 + 0 = **58/100**.

## References

[1]: https://github.com/hapifhir/hapi-fhir "Canonical HAPI FHIR repository"
[2]: https://hapifhir.io/hapi-fhir/docs/getting_started/introduction.html "HAPI FHIR official introduction"
[3]: https://hapifhir.io/hapi-fhir/docs/ "HAPI FHIR official documentation index"
[4]: https://hapifhir.io/hapi-fhir/docs/getting_started/versions.html "HAPI FHIR and FHIR version support"
[5]: https://hapifhir.io/hapi-fhir/docs/server_jpa/database_support.html "HAPI FHIR JPA database support"
[6]: https://github.com/hapifhir/hapi-fhir-jpaserver-starter "HAPI FHIR JPA server starter repository and deployment guidance"
[7]: https://hapifhir.io/hapi-fhir/docs/security/introduction.html "HAPI FHIR security introduction"
[8]: https://github.com/hapifhir/hapi-fhir/security/policy "HAPI FHIR repository security policy status"
[9]: https://nvd.nist.gov/vuln/detail/CVE-2026-55470 "NVD CVE-2026-55470"
[10]: https://api.github.com/repos/hapifhir/hapi-fhir/releases/latest "GitHub latest HAPI FHIR release API"
[11]: https://github.com/hapifhir/hapi-fhir/blob/master/LICENSE "HAPI FHIR repository LICENSE file"
[12]: https://github.com/hapifhir/hapi-fhir/security/advisories "HAPI FHIR security advisories page"
