# Corteza CRM — platform-based CRM, with an important security caveat

**Material finding (checked 2026-10-14):** The supplied GitHub repository is the official Corteza low-code platform repository and its README explicitly describes building CRM applications; official CRM documentation describes a substantive default CRM solution rather than merely adjacent workflow features. However, GitHub lists a **Moderate SQL-injection advisory published 2026-09-21** against version 2024.9.8, only weeks before this check. That is a material unresolved disposition question, so this assessment is **evaluate**, not an adoption or production approval. The product is a configurable CRM application built atop the platform, not a standalone CRM-only codebase. [1] [2] [3]

## Identity and product boundary

The declared repository, `https://github.com/cortezaproject/corteza`, is a current canonical project location: GitHub identifies it as “Low-code platform,” and the project README calls the product Corteza and attributes its maintenance to Planet Crust. The supplied official domain is also consistent with the project. This is a platform repository; it is not a repository solely for the CRM application. [1]

The official CRM user guide documents a prebuilt solution with leads, accounts and contacts, opportunities, products and price books, quotes, campaigns, cases, tasks, events, notes, email/templates, dashboards and automation actions. It describes lead conversion into account/contact/opportunity, opportunity stages and product pricing, and quote generation/approval workflows. Those are meaningful CRM capabilities. [2] It also explains that pages are composed from configurable blocks and CRM modules are flexible; this is CRM delivered through Corteza's low-code application model. Platform-wide workflows, access control, data integration and custom app building should not be mistaken for CRM-specific out-of-box functionality. [1] [2] The feature boundary matters: beyond the documented default modules and workflows, business-specific behavior is configured or built on the platform.

## License and commercial boundaries

The repository README states Apache License 2.0. That provides an identifiable license for this repository, but does not establish the terms of any hosted/commercial service or imply legal clearance for a particular deployment, redistribution, modifications or bundled dependencies. No separately licensed commercial edition boundary was established in the inspected primary sources. The repository describes a hosted Corteza offering from Planet Crust as an option; that is a service, not evidence of a different software license. Review the exact source and dependencies and obtain appropriate legal review before use. [1]

## Maintenance and security

GitHub's releases page lists the 2024.9 series, with 2024.9.10 at the top of the extracted release history; this indicates ongoing patch releases within that train, but the page does not establish a newer major train or a support-life commitment. The branch commit-history page did not expose usable history in this check, so recent commit cadence and issue-response performance remain uncertain. [3] [4]

The repository has a security policy asking researchers to report privately by email and says a response should arrive within 24 business hours. GitHub's advisory page lists GHSA-rr6q-8jvx-4mxr, titled “Corteza 2024.9.8 - SQL Injection in MSSQL JSON-path meta filter via incorrect T-SQL string escaping,” published 2026-09-21 and marked Moderate. The listed patched version is 2024.9.10; verify the exact affected/fixed ranges and deployment status directly in the advisory before relying on that conclusion. The existence of a newer release does not itself prove a deployment is patched. [5] [6]

Security maturity cannot be concluded from a policy and patch alone. This review did not establish a complete dependency inventory, reproducible dependency audit, or absence of other vulnerabilities. The advisory is a concrete issue requiring version/configuration-specific disposition. The platform claims flexible RBAC and privacy controls, but these are design capabilities, not security certification or evidence that a deployment is configured safely. [1] [5] [6]

## Architecture, deployment, docs and tests

Corteza is described as an open-source, self-hosted low-code platform with an API-centric design, configurable security, automation and flexible data storage. Official docs direct developers to a Low-Code Platform Developer Guide and Integrator Guide covering security, automation, reporting and integration. This supports reuse through configuration, modules, workflows and APIs; it also means CRM functionality is coupled to platform concepts and upgrades may require migration work. The docs explicitly warn that versions may not be backwards compatible. [1] [7]

The official docs recommend PostgreSQL or MySQL and warn that in-memory SQLite can lose data when connections close. Docker is the supported baseline for systems that can run Docker; non-Docker/bare-metal deployment requires compiling binaries. DevOps documentation covers production-like and online/offline deployment, backup and troubleshooting. This is credible self-hosting guidance, with operational care needed around storage, database choice and version upgrades. [7]

The repository README links developer documentation, contribution guidance and changelog; the docs describe deployment, API, security and integration topics. The evidence inspected did not establish meaningful automated test coverage or CI quality, so documentation is stronger than verified testing evidence. SQLite is identified as primarily used for testing, not proof of broad integration-test coverage. [1] [7]

## APIs, integration and localization

The README explicitly points to REST API documentation, configuration references and workflow/automation facilities, and characterizes the system as API-centric and integratable with external services. The docs provide a development/integration guide. This is a positive integration story, but the source review did not confirm a maintained connector catalog or compatibility guarantees for individual third-party systems. [1] [7]

The README says the platform can be customized from translations and terminology. That verifies localization infrastructure in principle, not Arabic translation completeness or right-to-left layout behavior. No opened primary source in this review verified Arabic coverage, mirrored/bidi UI behavior, or Arabic-specific tests. Arabic/RTL therefore receives only a small provisional score; language-count or translation-framework claims are not treated as proof. [1]

## Provisional rubric score

Scoring follows the declared 100-point rubric: domain fit 20, architecture/reuse 15, maintenance 15, security/dependencies 15, docs/tests 10, license 10, setup/deployment 5, integrations/APIs 5, Arabic/RTL 5. These are criterion points, not percentages. The midpoint adds exactly to **66/100**. Intervals represent evidentiary uncertainty, not statistical confidence.

- Feature completeness and domain fit: **16/20** (plausible 14–18). Broad documented default CRM flow; customization and unverified edge-case depth limit certainty.
- Architecture and reuse quality: **11/15** (9–13). Clear low-code modules/workflows and platform APIs; deployment/migration coupling remains.
- Development activity and maintenance: **8/15** (5–11). Patch releases visible, but cadence/support commitments and usable current commit history not established.
- Security and dependency quality: **6/15** (3–9). Published security policy and advisory/patch trail, offset by a very recent SQL injection advisory and unverified dependency posture.
- Documentation and testing: **7/10** (5–8). Broad official deployment and integrator docs; test/CI strength insufficiently verified.
- License clarity and suitability: **8/10** (7–9). Apache-2.0 is clearly identified for repository; suitability still depends on actual use and dependency review.
- Setup and deployment: **4/5** (3–5). Docker and database guidance are documented; production operation and upgrades still need validation.
- Integrations and APIs: **4/5** (3–5). REST/API-centric design and automation documented; third-party connector depth uncertain.
- Arabic/RTL: **2/5** (0–3). Translation customization is stated; actual Arabic and RTL behavior unverified.

The criterion intervals add to a plausible total range of **49–81**, containing the midpoint. Scores compare to the project requirements represented by the provided rubric, not universal quality.

## References

[1]: https://github.com/cortezaproject/corteza "Corteza platform repository and README"
[2]: https://cortezaproject.org/documentation/user-guides/corteza-crm-user-guide/?s= "Corteza CRM User Guide"
[3]: https://github.com/cortezaproject/corteza/releases "Corteza GitHub releases"
[4]: https://github.com/cortezaproject/corteza/commits/2024.9/ "Corteza 2024.9 commit history"
[5]: https://github.com/cortezaproject/corteza/security/policy "Corteza security policy"
[6]: https://github.com/cortezaproject/corteza/security/advisories "Corteza security advisories"
[7]: https://docs.cortezaproject.org/corteza-docs/2024.9/index.html "Corteza 2024.9 documentation"
