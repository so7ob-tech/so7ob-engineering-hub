# Security, privacy, and compliance boundaries

This is an engineering checklist, not legal advice, an audit, or a certification.

- **License:** identify the exact version and license text; record dependency licenses; assess obligations for modification, distribution, hosted/network use, notices, and source provision with counsel where needed.
- **Supply chain:** pin dependencies/actions, inspect release provenance, enable secret scanning/dependency alerts in adopting projects, generate SBOMs, and define patch SLAs.
- **Application security:** threat model, least privilege, input validation, output encoding, secure session handling, CSRF/CORS controls, rate limits, backups, restore tests, and incident response.
- **Payments:** never store card verification values; minimize card-data handling and use a vetted payment provider. PCI scope and obligations require a qualified assessment; cataloged software does not establish PCI DSS compliance.
- **Health:** identify jurisdiction, controller/processor roles, lawful basis, retention, access, audit, breach, and interoperability requirements. HL7/FHIR support claims require protocol/version/conformance testing; do not infer clinical compliance from a feature list.
- **Localization:** assess data residency, language requirements, consent UX, accessibility, right-to-left rendering, and format/time-zone behavior.
- **Tenant isolation:** test both data and background-job boundaries; tenant context must propagate through cache, search, storage, logs, exports, and asynchronous work.

## Evidence review for a project

Record review scope/version/date, public advisories consulted, dependency posture, unresolved findings, mitigations, and reviewer. Do not store exploit details or nonpublic vulnerability information in this repository.
