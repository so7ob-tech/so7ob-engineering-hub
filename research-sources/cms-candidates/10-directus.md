# Directus — evidence assessment (2026-10-14)

## Decision

**Recommendation: evaluate, do not adopt yet.** Directus is a capable SQL-backed data platform and headless CMS: it layers generated REST/GraphQL APIs and a visual studio over relational data, with permissions and extension points. It merits a focused technical and editorial proof of concept for So7ob Tech. The key adoption gate is licensing: older Directus releases used Business Source License 1.1 (BSL), while the repository's current `main` license is **Monospace Sustainable Core License (MSCL) 1.0**, not BSL. Both are source-available rather than OSI-approved open-source licenses, but their terms differ. Legal review must evaluate the precise release's bundled license plus applicable grant/commercial agreement. Arabic/RTL suitability is not verified.

## Product fit and editorial model

**Verified:** The canonical repository describes Directus as a platform that connects SQL databases to a REST and GraphQL API and a visual Studio. It lists database-schema control, policy-based access, extension points (custom endpoints, hooks, interfaces, modules), self-hosting and cloud hosting. Repository claims also list AI assistant and native MCP server. The repository describes “instant” APIs and broad SQL support; these are project claims, not independent performance or security evidence. [1]

**Assessment:** Classify it primarily as a **data platform / headless CMS**, and secondarily as decoupled CMS. It is not a conventional coupled/traditional CMS with a mandated public-site rendering layer. The Studio is a browser-based editorial/admin interface for live database content; developers own the schema, while users work with records. Project docs/repo material indicate collections and fields, relational links, assets/files, permissions, versions, and workflow/automation facilities. Publishing workflows can be built from status fields, permissions, revisions and flows, but suitability for So7ob's specific approvals, scheduling, localization and preview needs should be demonstrated rather than inferred from the existence of generic workflow features. It is a content management interface over a database, not a turnkey editorial policy.

## Technology, APIs and extensibility

**Verified from project materials:** JavaScript/TypeScript ecosystem; Vue-based Studio and Node.js server architecture are indicated by repository packages and project docs. REST and GraphQL APIs are generated from the database schema. Official site names MySQL, PostgreSQL and SQLite among supported SQL systems, while the repository additionally enumerates MariaDB, MS SQL Server, OracleDB and CockroachDB. Database support breadth and compatibility must be checked against the selected release and deployment target; “any SQL” is marketing shorthand, not proof that all SQL engines behave identically. [1][2]

The extension system is a meaningful integration surface: custom interfaces, modules, layouts, panels, endpoints, hooks and operations are among the documented extension types. Official materials also advertise SDKs and integrations. This favors a custom frontend or existing application consuming Directus APIs, and permits custom business behavior, at the cost of maintaining extensions across upgrades. [1][3]

## Licensing — exact version matters

**Current repository `main` file, observed 2026-10-14:** `LICENSE` is titled **Monospace Sustainable Core License, Version 1.0 (MSCL-1.0-GPL)**, copyright 2026. It grants use/copy/modification/derivative/distribution for a “Permitted Purpose,” excluding “Competing Use” (making the software available to others, standalone or with products/services, in competition with licensor's commercial offerings where the licensor charges). It bars bypassing license-key functionality. Redistribution requires including/linking the terms and preserving notices, and forbids adding restrictions/fees on rights granted by that license. It grants GPL-3.0 rights **four years after that particular version is made available**. This is the exact current `main` file, not necessarily the license in every published package/version. [4]

This MSCL is **not an OSI-approved open-source license**: source availability and broad permitted use do not equal OSI Open Source Definition approval, and the competitive-use restriction is material. Do not call current Directus “open source” without qualifying the license. The repository README says current Directus is under MSCL 1.0 and separately advertises an Open Innovation Grant for organizations under $5 million annual revenue **and** 50 employees, plus a no-license-required free core tier. Those are project statements about commercial/grant boundaries; the text of the grant/key arrangement was not available in the exact root license inspected, so obtain and archive the grant terms for So7ob before production use. The grant threshold is not itself contained in the MSCL root terms. [1][4]

**Historical exact release check:** `v11.15.1` has a BSL 1.1 license, with Additional Use Grant for production while “Total Finances” do not exceed USD 5,000,000 over the latest 12 months; Total Finances means the greatest of gross revenue, budget or funding and includes affiliates. Its Change Date is three years from that release date, with GPL v3 as Change License; the text also says no later than four years from first public distribution. That BSL text explicitly says it is not an Open Source license. Consequently older BSL statements cannot be applied to current `main`/newer releases, and current MSCL terms cannot be projected backward to an older deployed version. Confirm the exact tag/package `LICENSE` and any separate license key/grant terms for the version selected. [5]

## Maintenance, docs and operations

GitHub's release page lists v12.4.1 and v12.4.0 at the top of the release list as inspected on the evidence date, and shows active changes including dependency updates, API/Studio fixes and security-related fixes. This is evidence of an active release channel, not a guarantee of a support lifecycle or SLA. The release notes mention fixing CVEs in dependencies and policy/access-control defects. A commit-history view of `license` groups license changes on May 28, 2026, April 17, 2026 and earlier dates; that is a history signal, not a definitive release-to-license mapping. [6][7]

Project documentation and repository include developer, self-hosting, API and extension guidance; the project lists contributing guidance and GitHub issue/community channels. Docs appear extensive, but during this check several prior `docs.directus.io` deep links redirected to a 404, while current domain/docs navigation was accessible but its root page also returned a 404 in extraction. Therefore precise current docs quality and completeness are only partly verified. The repository is a large monorepo with tests and CI; a full test suite was not run, and no independent test-coverage or reliability claim is made. [1][3][6]

Self-hosting places responsibility on So7ob for runtime, database, file/object storage, secrets, TLS/proxy, backups, observability, upgrades and extension compatibility. Database schema is a core product input, making migrations and backups especially important. Cloud is a separate managed offering, with project README claiming bundled PostgreSQL, Redis and S3-compatible storage; confirm commercial limits, availability and data-residency terms separately. No claim about performance, audit certification, compliance or security certification is supported here. [1]

## Security and language

The GitHub security policy directs private reports to GitHub advisories or security@directus.io and requests responsible disclosure before public details; the page gives no supported-version matrix or explicit support window. The public advisory page, as inspected, lists multiple 2026 advisories including critical WebSocket authorization, high severity DoS/SSRF/SQL injection/Cross-Site WebSocket Hijacking, and moderate access-control/registration issues. Their existence demonstrates a nontrivial vulnerability history, not by itself the security posture of a patched selected release. Release notes list remediation and dependency updates. Before evaluation, map each deployed version to fixed ranges and keep prompt patching in the operational plan. Do not infer secure-by-default from policy-based access control. [6][8]

**Arabic/RTL:** Arabic is not verified. The project supports localization in its interface/content ecosystem as a general capability, but the inspected primary sources did not establish native Arabic Studio coverage or genuine right-to-left layout behavior. A GitHub code-search page for RTL required sign-in and yielded no verifiable code result; documentation deep links were also inaccessible in extraction. Test Arabic entry/display, Studio navigation/layout, mixed-direction strings, date/number handling, search/sort and generated frontend independently. Score: 0/5 until demonstrated.

## Score (screening rubric)

**77/100** — CMS/content/editorial fit **17/20**; architecture/reuse **14/15**; maintenance **14/15**; security/dependencies **10/15**; docs/tests **8/10**; license clarity **5/10**; setup/deployment **4/5**; APIs/integrations **5/5**; Arabic/RTL **0/5**. **Sum: 17+14+14+10+8+5+4+5+0 = 77.** Strong architecture and API fit; score is held down by license diligence, security-advisory exposure/patch operations and unverified Arabic/RTL. This rubric score is a comparative screening judgment, not a security or performance measurement.

## Primary sources opened

[1] Canonical repository / README: https://github.com/directus/directus

[2] Official supported SQL databases page: https://directus.io/features/supported-sql-databases

[3] Official docs entry point and extension/API docs (some deep links returned 404 in extraction): https://directus.com/docs/ ; https://docs.directus.io/extensions/introduction ; https://docs.directus.io/reference/introduction

[4] Exact current repository license: https://raw.githubusercontent.com/directus/directus/main/license

[5] Exact historical v11.15.1 BSL license: https://raw.githubusercontent.com/directus/directus/v11.15.1/license

[6] GitHub releases: https://github.com/directus/directus/releases

[7] License file commit history: https://github.com/directus/directus/commits/main/license

[8] Security policy and published advisories: https://github.com/directus/directus/security ; https://github.com/directus/directus/security/advisories

[9] OSI license overview: https://opensource.org/licenses
