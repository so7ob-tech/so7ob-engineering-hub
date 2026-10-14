Material finding: the supplied GitHub URL is the official historical YetiForceCRM repository, but it is explicitly archived and points users to a new organization space; official release documentation records active 7.1.x releases through 2026-06, so the archived repository is not a sound representation of the current code and license boundary. The candidate is nevertheless verifiably YetiForce CRM. Treat its current distribution and license as an evaluation question, not as an unqualified permissive open-source codebase. Checked date: 2026-10-14. [1] [2] [3]

## Identity and product scope

The supplied repository identifies itself as YetiForce CRM, describes its Vtiger lineage, and says the repository is archived for historical purposes. It sends bug reports and discussion to YetiForce/issues and YetiForce/discussions. The organization's repository description points to `YetiForceCompany/YetiForce` as the move destination. This is the canonical current organizational location indicated by the old repo; the presently available CRM source and distribution process need separate review because the old repository is archived, not a live development branch. [1] [4]

The official product site presents a broad configurable business system: marketing, sales, projects, support, finance, logistics, office, and HR. Its claim of 80+ modules spans genuine CRM functions (leads, accounts, sales pipeline, customer support) and adjacent business applications such as project/time management, financial invoicing, logistics, and HR. Treat those adjacent functions as included platform scope rather than proof of specialist ERP, accounting, project-management, or HR depth. The old repository describes itself as CRM, says it was forked from Vtiger, and describes migration mechanisms from Vtiger. [1] [5]

## License and edition boundary

The archived repository's GitHub license metadata is `Other`/`NOASSERTION`, not a standard SPDX license. Historical code/issues refer to Vtiger CRM Public License 1.0; the 6.2 changelog says YetiForce Public License 4.0 was added. Official installation guidance says the current YetiForce license is similar to MIT, but also says the installation must be registered after a 14-day trial and directs users to read the full license. Therefore neither the marketing phrase “open source” nor that comparison settles commercial use, redistribution, modification, SaaS, or paid implementation rights. Obtain and review the exact license text attached to the intended current package and seek legal review. [1] [6] [7]

The website markets cloud, add-ons/marketplace, implementation, and support services alongside the downloadable system. It says necessary modules are included without charge, but this does not establish that every add-on, hosting service, support tier, or current source component has identical terms. No verified separate Community/Enterprise edition license boundary was found in the opened primary evidence. Do not infer commercial approval or zero-cost total ownership. [5] [8]

## Maintenance, security, and dependencies

Official release notes list YetiForce 7.1.1 (2026-05-22) and 7.1.2 (2026-06-01), including dependency security updates to Twig/Symfony components and Roundcube Webmail 1.7.1; the latter is to be updated manually in the admin panel. This is strong evidence of current product maintenance, distinct from the archived repo's last pushed commit (2024-09-13) and latest GitHub release 6.5.0 (2023-11-02). The product is maintained beyond that repository release record, but this creates a source-of-truth/reproducibility gap that must be closed against the current distribution. [2] [9] [10]

The reviewed repository page did not expose a security policy or GitHub security-analysis setting; no claim of an active vulnerability disclosure policy or complete advisory coverage is made here. Official changelog entries demonstrate some security/dependency remediation, but do not substitute for an SBOM, vulnerability scan, supported dependency matrix, patch SLAs, or release provenance. Current product documentation and source need direct review before any security judgment. [1] [2]

## Architecture, deployment, docs, testing, and integration

YetiForce is a self-hosted web application installed through a browser wizard against an operator-managed web server and database. Official guidance recommends a “complete” package; a non-complete package requires Yarn and Composer in a specified order. Installation includes server configuration validation, database credentials, license acceptance, and system registration; documentation says the installer expects basic web-server/database/permissions knowledge. The archived repo labels Docker as for development purposes, so a production-ready container/deployment path is not established by that source. [1] [6]

The official docs have separate user, administrator, developer, customer portal, and contribution areas, and provide code documentation and an OpenAPI 3.0 API surface. Release notes record API changes and automated tests, including API integration/system-requirement tests in historical changes; however, this evidence does not establish present test coverage, CI health, or compatibility contracts. The old repo also links separate update packages, scripts, language packages, and a customer-portal repository. This modular ecosystem is useful but means extensions, portal and deployment lifecycle should be assessed independently of core CRM. [1] [2] [11] [12]

Official material identifies system-level API routes for record/user methods and documents API proxy use. The product materials mention mail integrations and the version history includes specific connectors/features (for example Roundcube and PBX). Some marketplace capabilities, premium portal/webservice offerings, and third-party integrations must not be treated as core functionality without checking their separate package and license. [2] [5] [8] [12]

## Arabic and RTL

The official translation guide documents community translations distributed through Language Management and Crowdin; a separate official language repository says translations synchronize from English through Crowdin. These establish localization infrastructure, but the opened official sources did not verify that Arabic is currently complete or that the interface has correct bidirectional/RTL behavior. Accordingly Arabic/RTL receives zero provisional points, not an inference from language count; verify Arabic package availability, translated coverage, and real UI layout in a current build. [13] [14]

## Rubric score and recommendation

Scores use the supplied 100-point rubric; each criterion score is a weighted point value and does not exceed its listed maximum. Unknowns are reflected in the low/high range rather than treated as proof of failure. Weighted midpoint is **64/100**; plausible range **45–80/100**.

- Feature completeness and domain fit (max 20): **15** (range 12–18). Strong broad CRM and business-process breadth; depth of adjacent functions varies and should not be conflated with specialist systems.
- Architecture and reuse quality (max 15): **10** (range 7–12). Modular product ecosystem and Vtiger migration lineage, offset by uncertain current source boundary and extension/package separation.
- Development activity and maintenance (max 15): **13** (range 10–15). Current 7.1.2 release activity documented; exact current code/release repo remains to be reconciled.
- Security and dependency quality (max 15): **8** (range 4–11). Recent dependency fixes evidenced, but no verified policy/SBOM/coverage in reviewed sources.
- Documentation and testing (max 10): **8** (range 6–9). Substantial official docs and API docs; current automated test/CI evidence is incomplete.
- License clarity and suitability (max 10): **3** (range 1–6). License is identified as a YetiForce-specific instrument but exact current terms and old repo metadata are ambiguous; suitability unresolved.
- Setup and deployment (max 5): **3** (range 2–4). Documented self-hosted installer and package workflow; production Docker support not shown.
- Integrations and APIs (max 5): **4** (range 3–5). OpenAPI/API documentation and connectors shown, with premium/add-on boundaries to check.
- i18n, Arabic and RTL (max 5): **0** (range 0–0). No opened evidence verifies Arabic translation coverage or RTL layout.

Recommendation: **evaluate**. This is a strong functional reference and plausible self-hosted CRM evaluation candidate, but not an adoption decision: first identify the exact current source/package, review its operative license with counsel, reconcile release provenance, and perform security, deployment, and Arabic/RTL testing. The score is comparative catalog evidence only; it is not legal, security, compliance, commercial-use, or production approval. [1] [2] [6] [13]

## References

[1]: https://github.com/YetiForceCompany/YetiForceCRM "YetiForceCRM archived repository and migration notice"
[2]: https://doc.yetiforce.com/en/introduction/release-notes-changelog/ "YetiForce release notes and changelog"
[3]: https://github.com/YetiForceCompany/YetiForceCRM/releases "YetiForceCRM historical GitHub releases"
[4]: https://github.com/YetiForceCompany/YetiForce "YetiForce organization move destination"
[5]: https://yetiforce.com/en/ "Official YetiForce product site"
[6]: https://doc.yetiforce.com/en/introduction/installation-manual/ "Official YetiForce installation guidance"
[7]: https://github.com/YetiForceCompany/YetiForceCRM/issues/6132 "Archived repository issue showing historical Vtiger CRM Public License reference"
[8]: https://yetiforce.com/en/ "Official product site: services, marketplace, cloud, and add-ons"
[9]: https://api.github.com/repos/YetiForceCompany/YetiForceCRM "GitHub API metadata for archived YetiForceCRM repository"
[10]: https://api.github.com/repos/YetiForceCompany/YetiForceCRM/releases "GitHub API release history for archived repository"
[11]: https://doc.yetiforce.com/en/ "Official YetiForce documentation index"
[12]: https://doc.yetiforce.com/api/ "YetiForce OpenAPI API documentation"
[13]: https://doc.yetiforce.com/en/contributing/languages/ "Official YetiForce translation guide"
[14]: https://github.com/YetiForceCompany/YetiForceCRMLanguages "Official YetiForce CRM languages project"