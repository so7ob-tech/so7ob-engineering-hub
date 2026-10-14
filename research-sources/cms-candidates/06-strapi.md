# Strapi — CMS candidate evidence note

**Evidence date: 2026-10-14**  
**Candidate:** Strapi (`strapi/strapi`)  
**Assessment:** Evaluate in a bounded proof of concept; do not adopt without licensing, Arabic-admin, security, and operations validation.

## Findings

Strapi is a JavaScript/TypeScript, self-hostable headless CMS, not a traditional page-rendering CMS. It combines a content editor/admin application with structured content modeling and generated delivery APIs, so it is also a publishing/content platform. It is not merely a generic data platform: its editor, draft/publish, media library, localization, roles, and content types are CMS-oriented. These classifications are assessment/inference from documented features, not the vendor's exclusive formal taxonomy. [1] [2]

The admin Content-Type Builder supports collection types, single types, and reusable components. Editors can configure fields, relations, dynamic zones, localization, and Draft & Publish. Content is authored in the Content Manager; locale-by-locale editing and publishing is documented. Workflows are strongest for structured editorial content; sophisticated review workflows, content history, audit logs, and preview vary by paid plan. The pricing page lists review workflows in Enterprise and releases/content history in paid plans. [3] [4] [5]

The project is JavaScript/TypeScript on Node.js. The docs at evidence date support Node active/maintenance LTS v22, v24, v26 and MySQL 8+, MariaDB 10.3+, PostgreSQL 14+, or SQLite 3. MongoDB and NoSQL are explicitly unsupported. Although the repository overview also mentions MySQL/MariaDB and PostgreSQL/SQLite, use the live requirements/configuration docs for actual version choices. [1] [6]

REST endpoints are generated for content types, with filtering, sorting, pagination, field selection, and relation population. GraphQL is available via the installable `@strapi/plugin-graphql`, generates content-type queries/mutations, and supports filtering/sorting/pagination; it is not installed automatically, and GraphQL does not support media upload (REST upload is required). Content types are private by default until public or properly authorized. Strapi's plugin/customization system and marketplace are extension points; custom admin/backend work increases upgrade obligations. [7] [8] [9]

### Licensing and product boundary

The exact root `LICENSE` says Community Edition components outside `ee/` are MIT Expat **only if the user has no registered account on Strapi Cloud**; it grants commercial use, modification, distribution, sublicensing and sale subject to retaining the notice. Components under `ee/` are not covered by that MIT grant and instead use the referenced supplemental EE license or an applicable signed/subscription/cloud agreement. The linked EE supplemental license restricts use absent a valid agreement, with narrow development/testing permission and material limits; production copies/modifications require a valid project license and agreement. A Cloud account's applicable terms also alter the root-license path. Do not assume the whole monorepo or every optional feature is unrestricted MIT. Pin and inspect the exact commit, package paths, and signed plan terms before reuse. [10] [11]

The pricing page distinguishes Community, Growth, Enterprise, and Strapi Cloud/paid features. It lists common APIs, content types, locales and core CMS features in Community, while releases/content history, review workflows, audit logs, SSO and support have plan boundaries. This is product/marketing evidence, not a legal substitute for the relevant subscription agreement. [5]

### Maintenance, security, and operations

Repository releases show Strapi v5.53.0 dated 2026-09-09 and frequent preceding 5.52.x releases in August/September 2026. Its security policy (as viewed) says GA/stable v5.x is supported; v4 support ended October 2025 with security updates until April 2026, and v3 is EOL. On this evidence the release channel appears active, but release frequency does not establish response quality or long-term support guarantees. [14] [15]

The advisory listing contains multiple disclosed issues, including five advisories published 2026-05-13, with critical and moderate severities, plus 2025 and 2024 advisories. The May 2026 security policy requires GHSA reporting and scopes security support to current stable v5.x; community plugins and operator infrastructure are outside scope. Release notes include security changes (e.g., GraphQL operation-limit warnings and blocking SVG uploads by default for new projects in v5.52.2). These are evidence of vulnerability handling and fixes, not evidence of an audit, certification, security guarantee, or absence of additional vulnerabilities. [15] [16] [14]

Docs provide installation, database, REST/GraphQL, testing, upgrade, and deployment guidance. A documented upgrade CLI applies dependency updates and codemods but does not migrate application data; docs advise backing up code and database first and reviewing changes. Self-hosting requires operating Node, a supported database, media storage/provider, backups, upgrades, production hardening, and deployment/build configuration. Repository documentation says Strapi does not ship official Docker images, while managed Strapi Cloud is available. This indicates meaningful but conventional application operations burden; no independent deployment-effort or backup/restore test was performed. [1] [6] [17] [18]

### Arabic and RTL

Verified: i18n supports locale entries drawn from a pre-created list of 500+ locales, and the user can manage translated content; locales and content localization are independent of the admin interface language. The docs opened do not establish Arabic availability in the locale list at the specific build nor RTL rendering of the admin or fields. The source docs and pricing page do not provide genuine Arabic RTL evidence. Score this as unverified/weak, not as proof of absence. Test Arabic locale setup, admin layout and directionality, mixed Arabic/Latin input, rich text, media labels, and frontend rendering in the actual target release. [4]

## Evidence and interpretation discipline

**Verified project/documentation facts** are stated as “docs say” or “repository lists.” **Project claims** include positioning such as “leading” or “friendly.” **Inferences** are explicitly identified as such. No claim is made here about performance, audit/compliance certification, or security quality beyond the cited policy/advisory/release evidence. Evidence is a dated snapshot; prices, support policy, releases and product terms may change.

## Screening score

| Criterion | Points |
|---|---:|
| CMS/content/editorial fit | 18/20 |
| Architecture/reuse | 14/15 |
| Maintenance | 14/15 |
| Security/dependencies | 10/15 |
| Docs/tests | 8/10 |
| License clarity | 9/10 |
| Setup/deployment | 3/5 |
| APIs/integrations | 5/5 |
| Arabic/RTL | 1/5 |
| **Total** | **82/100** |

The deductions reflect recent serious advisories and operator hardening responsibility; mixed Community/EE/Cloud licensing complexity; self-managed deployment and upgrade/data-migration work; and missing verified Arabic RTL evidence. Score means **evaluate**, not production approval.

## References — URLs opened

[1] https://github.com/strapi/strapi "Canonical Strapi repository"  
[2] https://strapi.io/ "Official Strapi website"  
[3] https://docs.strapi.io/cms/features/content-type-builder "Content-Type Builder"  
[4] https://docs.strapi.io/cms/features/internationalization "Internationalization"  
[5] https://strapi.io/pricing-cms "CMS pricing and feature plan grid"  
[6] https://docs.strapi.io/cms/configurations/database "Database configuration"  
[7] https://docs.strapi.io/cms/api/rest "REST API reference"  
[8] https://docs.strapi.io/cms/api/graphql "GraphQL API"  
[9] https://docs.strapi.io/cms/plugins-development "Plugin development/extension documentation"  
[10] https://raw.githubusercontent.com/strapi/strapi/main/LICENSE "Exact Strapi root license file (main at access time)"  
[11] https://raw.githubusercontent.com/strapi/strapi/a76b557047e9ef1c168dbf1b6cf879bcc3022de6/packages/core/admin/ee/LICENSE "Strapi EE supplemental license at root license's referenced commit"  
[14] https://github.com/strapi/strapi/releases "Strapi releases"  
[15] https://github.com/strapi/strapi/security "Strapi security policy"  
[16] https://github.com/strapi/strapi/security/advisories "Strapi published security advisories"  
[17] https://docs.strapi.io/cms/upgrade-tool "Upgrade tool and limits"  
[18] https://docs.strapi.io/cms/installation/cli "CLI installation and hosting guidance"  
[19] https://docs.strapi.io/cms/testing "Unit and integration testing guide"  
[20] https://docs.strapi.io/cms/api/graphql "GraphQL API documentation (also cited above)"
