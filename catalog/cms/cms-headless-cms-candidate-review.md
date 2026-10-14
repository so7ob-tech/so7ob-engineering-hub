# CMS & Headless CMS Candidate Review

**Audience:** So7ob Tech engineering and product stakeholders  
**Evidence date:** 2026-10-14, using only the supplied candidate findings  
**Status:** Provisional screening synthesis; not an adoption recommendation or security assessment

## Executive synthesis

The candidates are not interchangeable. They span four materially different operating models:

1. **Traditional/editorial CMS:** WordPress, Drupal, Joomla, Ghost, Wagtail and Umbraco are principally publishing systems with an integrated authoring experience. Most can expose content through REST or other APIs, but that does not make them headless-first.
2. **Structured/headless CMS:** Strapi, Payload and KeystoneJS put modeled content and APIs at the center, with a separately implemented frontend. Editorial capability exists, but the amount of workflow, preview, localization and operational work varies.
3. **Publishing plus headless delivery:** Ghost is publishing-first with a decoupled admin/API model; Wagtail, WordPress, Drupal, Joomla and Umbraco support decoupled delivery without requiring it.
4. **Data-platform/headless CMS:** Directus overlays a Studio and generated APIs on SQL data. It is the strongest fit here for API-first data management and custom frontends, but it should not be evaluated as a turnkey traditional publishing CMS, and its exact-version licensing requires legal review.

**Provisional leaders by use case:**

- **Conventional editorial publishing:** WordPress, Wagtail, Drupal, Joomla, Ghost and Umbraco merit the closest comparison. Wagtail scored highest overall (85), followed by WordPress (84), but the scoring is not normalized for unlike architectures.
- **Structured content with a developer-owned headless frontend:** Strapi, Payload, Wagtail and KeystoneJS are the most natural prototypes. Strapi has the strongest explicit headless/editorial balance in these findings; Payload is particularly aligned with TypeScript/Next.js; Wagtail is attractive for a Django/Python team.
- **API-first data and custom applications:** Directus is the clearest candidate, with Strapi, Payload and KeystoneJS as alternatives. Directus's Studio/API model is not evidence of mature editorial approvals, scheduling or preview for So7ob's requirements.
- **Membership/newsletters/publication access tiers:** Ghost is unusually differentiated. Its fit is strong when publishing, memberships and newsletters matter, but arbitrary schema-first modeling and Arabic/RTL remain open questions.

No candidate has verified end-to-end Arabic/RTL readiness in the supplied evidence. Wagtail has historical evidence of Arabic translation and RTL work; Payload documents a locale-level `rtl` option; Joomla documents language packs and RTL calendar fixes. These are useful signals, not acceptance evidence. Every finalist should pass a native-speaker test covering admin/editor, rich text, mixed-direction content, preview, themes/components, menus, dates/numbers, email and frontend output.

All candidates should be treated as **evaluate, not adopt** until a proof of concept validates content modeling, roles/workflows, Arabic/RTL, API permissions and preview, upgrades, backups/restores, and security patching on a pinned release.

## How to read the scores

The supplied findings use a 100-point screening rubric. The criterion weights are:

| Criterion | Points |
|---|---:|
| CMS/content/editorial fit | 20 |
| Architecture/reuse | 15 |
| Maintenance | 15 |
| Security/dependencies | 15 |
| Docs/tests | 10 |
| License clarity | 10 |
| Setup/deployment | 5 |
| APIs/integrations | 5 |
| Arabic/RTL | 5 |
| **Total** | **100** |

Scores are **provisional fit/maturity screens**, not measured quality, security, performance, compliance, or total-cost ratings. Comparing a traditional CMS with a data platform on one number can conceal important architectural differences. Each total below is re-added from its supplied components.

## Comparison at a glance

| Candidate | Primary orientation | Delivery model | License model in supplied findings | Score | Arabic/RTL evidence | Evidence note |
|---|---|---|---|---:|---|---|
| [WordPress](#1-wordpress) | Traditional/editorial | Coupled themes; optional REST headless | GPL-2.0 / GPL-compatible ecosystem rules | **84/100** | Low; test required | [Detailed note](../../research-sources/cms-candidates/01-wordpress.md) |
| [Drupal](#2-drupal) | Traditional, structured editorial | Server-rendered; optional JSON:API/REST decoupling | GPL-2.0-or-later | **80/100** | Low; current RTL unverified | [Detailed note](../../research-sources/cms-candidates/02-drupal.md) |
| [Joomla CMS](#3-joomla-cms) | Traditional/editorial | Integrated site; optional web services | GPLv2 / README says v2 or later | **74/100** | Some language/RTL signals; E2E test required | [Detailed note](../../research-sources/cms-candidates/03-joomla.md) |
| [Ghost](#4-ghost) | Publishing/membership | Decoupled admin plus Content/Admin APIs; Ghost(Pro) option | MIT core; service and trademark boundaries separate | **79/100** | Unverified | [Detailed note](../../research-sources/cms-candidates/04-ghost.md) |
| [Wagtail](#5-wagtail) | Structured/editorial Django CMS | Server-rendered or decoupled REST | BSD 3-Clause | **85/100** | Historical RTL/Arabic work; current behavior unverified | [Detailed note](../../research-sources/cms-candidates/05-wagtail.md) |
| [Strapi](#6-strapi) | Headless structured CMS | Self-hosted APIs; Strapi Cloud option | MIT CE; EE/add-ons and cloud boundaries separate | **82/100** | Localization documented; Arabic/RTL unverified | [Detailed note](../../research-sources/cms-candidates/06-strapi.md) |
| [Payload CMS](#7-payload-cms) | Headless/Next.js-native | Embedded in Next.js; optional separate frontend | MIT core; dependencies/services separate | **76/100** | `rtl` option documented; Arabic UI completeness unverified | [Detailed note](../../research-sources/cms-candidates/07-payload.md) |
| [Umbraco CMS](#8-umbraco-cms) | Traditional .NET editorial | Native site plus Content Delivery API; cloud option | MIT core; add-ons/cloud separate | **81/100** | No verified RTL evidence | [Detailed note](../../research-sources/cms-candidates/08-umbraco.md) |
| [KeystoneJS](#9-keystonejs-keystone-6) | Developer-led GraphQL headless | Node app plus separately operated SQL/storage | MIT | **76/100** | No positive evidence; test required | [Detailed note](../../research-sources/cms-candidates/09-keystone.md) |
| [Directus](#10-directus) | Data platform/headless CMS | SQL overlay, Studio and generated APIs; cloud option | Exact-version MSCL or historical BSL; source-available/use restrictions | **77/100** | No positive evidence; test required | [Detailed note](../../research-sources/cms-candidates/10-directus.md) |

## Architecture and use-case distinctions

### Traditional/editorial systems

**WordPress** offers block-based publishing, posts/pages, taxonomies, revisions, schedules, roles, media and comments, with REST endpoints and a large theme/plugin ecosystem. It is a strong conventional editorial choice; a headless deployment adds frontend integration and extension governance.

**Drupal** has entity/bundle modeling, fields, taxonomy, references, Views, multilingual setup and revision-aware Content Moderation/Workflows. Core JSON:API is more structured than a basic blog API, but permissions, preview and business rules still require integration work.

**Joomla** is article/category-centric and includes tags, custom fields, language associations, access levels, publishing state/scheduling and version history. Its web-services API is documented, but the reviewed API guide is version 4.4 while the release evidence is 6.2; current behavior must be verified.

**Wagtail** combines Django-defined typed models with StreamField's ordered, repeatable JSON blocks, drafts/revisions, permissions and workflows. It is a strong structured-editorial option for a Python/Django team. Its newer API v3 is under active development and draft preview is incomplete in the supplied documentation.

**Umbraco** is an integrated .NET backoffice/CMS with content/document types, properties and block editors, plus an opt-in Content Delivery API. It is a natural candidate for a .NET-centered editorial organization, but the database matrix and exact support periods were not established in the supplied evidence.

### Publishing-first and membership-oriented

**Ghost** is differentiated by publication workflows, scheduled posts, newsletters, members, paid tiers and access-gated content. Its read-only Content API and authenticated Admin API support headless delivery and management. It is less evidenced as an arbitrary schema-first content platform, and Arabic/RTL is wholly unverified in the inspected sources.

### Structured/headless systems

**Strapi** provides collection types, single types, components, dynamic zones, relations, Draft & Publish, i18n, generated REST and optional GraphQL. Its technical fit is strong for a JavaScript headless build. Review workflows and releases are plan-dependent in the supplied findings, and self-hosting transfers runtime, database, storage, backup and upgrade responsibility to So7ob.

**Payload** embeds a customizable admin and API in Next.js, with collections, globals, typed fields, access rules, hooks, drafts, versions, preview and Lexical content. Its localization docs explicitly include a locale-level `rtl` setting. It is compelling for a TypeScript/Next.js team, but migration, dependency, backup and advisory-version work remain significant.

**KeystoneJS** defines lists and fields in code and generates database schema, GraphQL and an Admin UI. It is a flexible developer platform rather than a turnkey editorial suite: basic publishing can be composed, but robust review lifecycle, versioning and enterprise audit history are not established by the supplied evidence.

### Data-platform/headless

**Directus** overlays an existing or new SQL database, exposing generated REST/GraphQL APIs and a Studio with permissions, files, relations, extensions and workflows. This is attractive where So7ob owns the frontend and wants API-first control over data. It is not evidence of a polished traditional publishing product. Exact release licensing is a gating item: current `main` uses MSCL-1.0-GPL, while historical v11.15.1 uses BSL 1.1; terms must be checked on the exact selected tag and any grant or commercial agreement.

## Candidate assessments

### 1. WordPress

**Best fit:** Conventional editorial publishing, themes/plugins, and teams wanting a mature publishing workflow with optional REST delivery.

- **Architecture/API:** Conventional PHP, database-backed, server-rendered themes and plugin/hooks. REST exposes JSON for posts, pages, taxonomies and other built-in content; custom routes/content can extend it. Separate headless clients are supported but add frontend and operational work.
- **Editorial/content:** Block editor; posts/pages, taxonomies, metadata, custom post types, drafts, scheduling, revisions, visibility/password controls, roles, media and comments.
- **Operations/hosting:** Self-managed production implies PHP, MariaDB/MySQL, HTTPS, web server, core/theme/plugin patching, compatibility planning and tested backups/restores. Project promotes easy upgrades and one-click hosts, but no measured recovery evidence was supplied. Hosted options have their own contractual boundaries.
- **Maintenance/release:** As of the supplied date, 7.1.3 was announced 2026-10-06 with security and bug fixes. Only current release is actively supported, with security backports to eligible branches through 4.7 according to the supplied policy snapshot. These are dated observations, not a future guarantee.
- **Security:** Policy and HackerOne disclosure process exist. 7.1.3 included fixes for stored XSS, DoS and second-order SQL injection. Verify the exact core version and every plugin/theme version; extension security is separate.
- **Arabic/RTL:** Translation infrastructure exists, but Arabic locale completeness and real RTL behavior across editor, admin, theme and extensions were not verified.
- **Score:** 19+13+14+10+9+8+4+5+2 = **84/100**.

**Key supplied references:** [repository](https://github.com/WordPress/wordpress-develop), [REST API](https://developer.wordpress.org/rest-api/), [requirements](https://wordpress.org/about/requirements/), [license](https://github.com/WordPress/wordpress-develop/blob/trunk/LICENSE), [7.1.3 release](https://wordpress.org/news/2026/10/wordpress-7-1-3-maintenance-and-security-release/), [security policy](https://github.com/WordPress/wordpress-develop/security/policy), [plugin guidelines](https://developer.wordpress.org/plugins/wordpress-org/detailed-plugin-guidelines/).

### 2. Drupal

**Best fit:** Structured editorial content, multilingual publishing and configurable workflows where a Drupal/Composer operating model is acceptable.

- **Architecture/API:** PHP entity/bundle CMS with optional decoupling. Core JSON:API implements collections, filtering, includes, pagination, sorting, revisions and CRUD operations; advanced translation negotiation and business rules need validation.
- **Editorial/content:** Content types, fields, taxonomy, references, Views, multilingual setup, revisions, Content Moderation and Workflows. So7ob-specific roles, transitions, approvals and localization require a prototype.
- **Operations/hosting:** Expect PHP/database, Composer dependency management, configuration synchronization, file storage, monitoring, backups/restores and recurring core/module updates. The supplied findings did not establish the exact PHP/database matrix.
- **Maintenance/release:** Supplied release page listed 11.4.6 and 10.6.16 as production-ready; 10.6.x security support was stated to end December 2026 and 10.5.x was unsupported. Recheck live support windows before deployment.
- **Security:** Public core and contributed-project advisories included SA-CORE-2026-013 and earlier 2026 fixes. This confirms a disclosure/patch channel, not an audit or absence of vulnerabilities; treat contributed modules as independent dependencies.
- **Arabic/RTL:** Current Arabic UI/editor/theme behavior was not verified. The positive RTL source located was Drupal 7 documentation, and Drupal 7 is unsupported.
- **Score:** 18+13+13+10+8+9+3+5+1 = **80/100**.

**Key supplied references:** [repository](https://github.com/drupal/drupal), [releases](https://www.drupal.org/project/drupal/releases), [JSON:API](https://www.drupal.org/docs/core-modules-and-themes/core-modules/jsonapi-module), [Content Moderation](https://www.drupal.org/docs/8/core/modules/content-moderation/overview), [security](https://www.drupal.org/security), [license](https://git.drupalcode.org/project/drupal/-/blob/11.x/LICENSE.txt), [RTL reference](https://www.drupal.org/docs/7/theming/working-with-css/supporting-right-to-left-rtl-languages).

### 3. Joomla CMS

**Best fit:** Traditional extensible multilingual publishing with granular permissions, where PHP/database and extension governance are acceptable.

- **Architecture/API:** Integrated PHP MVC website CMS with extension customization and web-services endpoints. The supplied API guide is version 4.4; production API behavior on 6.2 was not verified.
- **Editorial/content:** Articles/categories, tags, custom fields, language associations, access levels, publishing state/scheduling, metadata and version history; TinyMCE is the documented default editor.
- **Operations/hosting:** Self-hosted PHP/database/web server; patch core, dependencies and extensions, stage upgrades, back up database/media/configuration, and test restores. No backup SLA or restore guarantee was found.
- **Maintenance/release:** GitHub metadata identified stable 6.2.0 published 2026-10-13. Supplied release guidance stated Joomla 5.4 bugfix support through 2026-10-13 and security fixes through 2027-10-12; confirm branch dates at adoption.
- **Security:** The project security centre showed 2026 advisories involving access control, authentication bypass, XSS, upload and CORS issues, with fixes listed for 5.4.8 and 6.1.3. Verify exact affected/fixed versions; no independent audit or certification was supplied.
- **Arabic/RTL:** 64 language packs for Joomla 6.x, multilingual associations and RTL calendar fixes are positive signals. End-to-end Arabic editing, templates, extensions, bidirectional text and frontend rendering remain untested.
- **Score:** 17+12+12+9+8+9+3+2+2 = **74/100**. This is the corrected sum of the criterion points.

**Key supplied references:** [repository](https://github.com/joomla/joomla-cms), [exact license](https://raw.githubusercontent.com/joomla/joomla-cms/5.4-dev/LICENSE.txt), [multilingual manual](https://manual.joomla.org/docs/next/general-concepts/multilingual/), [technical requirements](https://manual.joomla.org/docs/next/get-started/technical-requirements/), [web services](https://manual.joomla.org/docs/4.4/general-concepts/webservices/), [extensions directory](https://extensions.joomla.org/), [security centre](https://developer.joomla.org/security-centre.html), [6.2 release](https://www.joomla.org/announcements/release-news/joomla-6-2-is-here.html).

### 4. Ghost

**Best fit:** Editorial publication, newsletters, memberships, paid tiers and API-fed web/mobile experiences.

- **Architecture/API:** REST/JSON Content API is read-only for posts/pages/tags/authors/tiers/settings; authenticated Admin API supports read/write. Themes/content storage are separable, with local storage by default and adapters available. Ghost(Pro) is a managed alternative to self-hosting.
- **Editorial/content:** Publication workflows, scheduling, member gating, free/paid/tier access, newsletters and editor-driven publishing. Arbitrary schema-first modeling was not evidenced.
- **Operations/hosting:** Self-hosting requires Ubuntu LTS, Node LTS, MySQL, NGINX, systemd, TLS, hardening, persistent media, backups and upgrades. Ghost-CLI helps install/upgrade; Ghost(Pro) contract, retention and SLA terms were not evaluated.
- **Maintenance/release:** Main commits were active on 2026-10-14/13. Release evidence was ambiguous: the rendered release head showed v6.63.0 while v6.64.0 existed and was tied to a security fix. Do not infer the latest production version from the page ordering.
- **Security:** CVE-2026-105679 affected 6.22.1–6.64.0 and was fixed in 6.64.0; CVSS 7.3 High, involving uploaded-file content type under default local storage. Verify exact release and complete supported-version status.
- **Arabic/RTL:** No official end-to-end Arabic/RTL evidence was found across editor, theme, member portal, emails and mixed-direction content.
- **Score:** 16+14+14+9+8+10+3+4+1 = **79/100**.

**Key supplied references:** [repository](https://github.com/TryGhost/Ghost), [license](https://raw.githubusercontent.com/TryGhost/Ghost/main/LICENSE), [architecture](https://docs.ghost.org/architecture), [Content API](https://docs.ghost.org/content-api), [Admin API](https://docs.ghost.org/admin-api), [hosting](https://docs.ghost.org/hosting), [supported databases](https://docs.ghost.org/faq/supported-databases), [security advisories](https://github.com/TryGhost/Ghost/security/advisories), [CVE-2026-105679](https://www.cve.org/CVERecord?id=CVE-2026-105679).

### 5. Wagtail

**Best fit:** Structured editorial publishing for a Python/Django team that accepts application-level hosting and customization.

- **Architecture/API:** Django CMS that can render server-side pages or expose content to a decoupled frontend. REST API v2 is read-only in the supplied description; v3 uses Django Ninja, supports authenticated CMS operations/OpenAPI 3.1, and is under active development. Draft preview is incomplete and may need a third-party workaround.
- **Editorial/content:** Typed Django models, StreamField JSON blocks, custom/nested structures, drafts/revisions, permissions and workflows. Validate exact approval routing and roles.
- **Operations/hosting:** Django-capable app hosting, production static/media handling, database, caching, logging, monitoring and tested database/media restore. Custom schema/data migrations and dependency management are part of the burden; no native backup SLA was evidenced.
- **Maintenance/release:** Policy describes quarterly feature releases, patches as needed, periodic LTS and security support for main, two latest series and latest LTS. v8.0 was published 2026-08-25; confirm current supported branches immediately before deployment.
- **Security:** 2026 advisories included high-severity reflected XSS and permission/restriction/DoS issues, plus moderate/low issues. Pin supported patched releases and assess Django/dependencies separately.
- **Arabic/RTL:** Historical official discussion documents Arabic translation and RTL work, but showed gaps and need for expert testing. Current completeness and behavior remain unverified.
- **Score:** 19+14+14+10+9+10+3+4+2 = **85/100**.

**Key supplied references:** [repository](https://github.com/wagtail/wagtail), [license](https://raw.githubusercontent.com/wagtail/wagtail/main/LICENSE), [headless docs](https://docs.wagtail.org/en/stable/advanced_topics/headless.html), [API docs](https://docs.wagtail.org/en/stable/advanced_topics/api/index.html), [StreamField](https://docs.wagtail.org/en/stable/topics/streamfield.html), [security advisories](https://github.com/wagtail/wagtail/security/advisories), [release process](https://docs.wagtail.org/en/stable/releases/release_process.html), [Arabic/RTL discussion](https://github.com/wagtail/wagtail/discussions/7793).

### 6. Strapi

**Best fit:** JavaScript/TypeScript headless CMS projects needing modeled content, generated APIs, localization and optional GraphQL.

- **Architecture/API:** Self-hosted headless CMS with Routes → Middlewares → Controllers → Services. Generated REST supports CRUD, filtering, sorting, pagination, field selection and relations; GraphQL is an installable plugin with operation limits. Strapi Cloud is a separate hosted option.
- **Editorial/content:** Collection/single types, components, dynamic zones, relations, Draft & Publish and i18n. Review workflows are listed as Enterprise and Releases/content history as paid-tier features in the supplied findings; verify plan and contract boundaries.
- **Operations/hosting:** Supported Node/database/app/media/backups/upgrades are So7ob responsibilities when self-hosted. The repository does not ship official Docker images. Upgrade tooling handles dependencies/codemods but not application data migration; back up and rehearse upgrades.
- **Maintenance/release:** v5.53.0 dated 2026-09-09 was the newest shown. Stable v5 is supported; v4 security updates were stated through April 2026 and v3 is EOL. Verify current support policy.
- **Security:** Five 2026 advisories were listed with Critical, Moderate and Low severity. Release notes included GraphQL operation-limit warnings and default SVG upload denial in new projects. Verify exact patched versions and third-party plugin exposure.
- **Arabic/RTL:** Localization supports a precreated list of 500+ locales, but Arabic selection and genuine RTL behavior in admin/editor were not verified.
- **License:** Community Edition outside `ee/` is MIT Expat subject to root terms; `ee/` has a supplemental license/subscription/cloud boundary. Do not treat all repository code or paid capabilities as MIT.
- **Score:** 18+14+14+10+8+9+3+5+1 = **82/100**.

**Key supplied references:** [repository](https://github.com/strapi/strapi), [root license](https://raw.githubusercontent.com/strapi/strapi/main/LICENSE), [content modeling](https://docs.strapi.io/cms/features/content-type-builder), [internationalization](https://docs.strapi.io/cms/features/internationalization), [REST](https://docs.strapi.io/cms/api/rest), [GraphQL](https://docs.strapi.io/cms/api/graphql), [database](https://docs.strapi.io/cms/configurations/database), [upgrade tool](https://docs.strapi.io/cms/upgrade-tool), [pricing/features](https://strapi.io/pricing-cms), [security advisories](https://github.com/strapi/strapi/security/advisories).

### 7. Payload CMS

**Best fit:** TypeScript/Next.js-native teams wanting a customizable admin, typed content backend, localization and API delivery.

- **Architecture/API:** Payload embeds admin and backend/API routes in a Next.js app, with optional Local API queries in React Server Components. REST and GraphQL are available; generated routes support CRUD, filtering, pagination, locale/fallback and custom routes.
- **Editorial/content:** Collections, globals, fields, auth/access rules, hooks, drafts/versions, preview, custom React UI and Lexical rich text. Validate So7ob approval/scheduling and editor usability.
- **Operations/hosting:** Self-hosting transfers app, database, storage, secrets, monitoring, backup/restore and upgrades to So7ob. PostgreSQL/SQLite relational migrations introduce schema management; MongoDB does not eliminate backup/index/upgrade work.
- **Maintenance/release:** Supplied release evidence showed v4.0.0-canary.39 and v3.90.2. Canary notes include breaking changes; production should pin a suitable stable line. Active commits are not an LTS guarantee.
- **Security:** Ten advisories were listed on 2026-10-14, including high-severity MCP authentication/hidden-field issues and moderate authorization, upload, password hashing, brute-force, CSV formula, scheduled-publishing and session issues. Map each affected/fixed range to the chosen version.
- **Arabic/RTL:** Locale-level `rtl` is documented and admin UI is claimed translated in 30+ languages, but Arabic inclusion and quality were not verified. Test rich text, custom components and frontend output.
- **Score:** 16+14+12+9+8+9+3+4+1 = **76/100**.

**Key supplied references:** [repository](https://github.com/payloadcms/payload), [license](https://raw.githubusercontent.com/payloadcms/payload/main/LICENSE.md), [localization](https://payloadcms.com/docs/configuration/localization), [REST API](https://payloadcms.com/docs/rest-api/overview), [database](https://payloadcms.com/docs/database/overview), [installation](https://payloadcms.com/docs/getting-started/installation), [releases](https://github.com/payloadcms/payload/releases), [security advisories](https://github.com/payloadcms/payload/security/advisories).

### 8. Umbraco CMS

**Best fit:** .NET-centered editorial publishing with integrated backoffice and optional API-first delivery.

- **Architecture/API:** Traditional integrated CMS with native presentation and opt-in Content Delivery API. API supports item/route and collection/query endpoints, JSON, culture selection, filters/sorts/field expansion, preview and API-key configuration.
- **Editorial/content:** Content/document types, properties and block editors, with publishing/localization evidence. Validate permissions, approvals, role model and preview.
- **Operations/hosting:** Self-hosting implies .NET app, database/media/storage, configuration, patching, upgrades/migrations, monitoring and tested restore. Cloud is a distinct commercial boundary and may change operating responsibilities. Database support was not established.
- **Maintenance/release:** Release feed included 13.16.2 dated 2026-09-14 and active 17.x entries. Exact LTS/EOL periods could not be asserted from the supplied extraction; confirm supported branch and patch.
- **Security:** Advisories through 2026-10-06 included a high-severity Delivery API protected-content exposure; security updates for CMS 17 and 18 were stated on October 6. Verify every affected/fixed version.
- **Arabic/RTL:** No directly verified genuine Arabic RTL backoffice evidence was supplied.
- **Score:** 18+13+14+10+9+10+3+4+0 = **81/100**.

**Key supplied references:** [repository](https://github.com/umbraco/Umbraco-CMS), [license](https://github.com/umbraco/Umbraco-CMS/blob/main/LICENSE.md), [installation](https://docs.umbraco.com/umbraco-cms/fundamentals/setup/install), [Content Delivery API](https://docs.umbraco.com/umbraco-cms/develop-with-umbraco/headless-and-apis/content-delivery-api), [releases](https://api.github.com/repos/umbraco/Umbraco-CMS/releases?per_page=5), [security](https://github.com/umbraco/Umbraco-CMS/security), [LTS/EOL](https://umbraco.com/products/knowledge-center/long-term-support-and-end-of-life/).

### 9. KeystoneJS (Keystone 6)

**Best fit:** Developer-led Node/TypeScript GraphQL applications where So7ob will implement editorial semantics and operate the platform.

- **Architecture/API:** Code-defined lists/fields generate SQL schema, GraphQL API and Admin UI. GraphQL is the primary documented delivery API; production defaults disable Playground and introspection. No first-party REST delivery API was verified.
- **Editorial/content:** Relations, hooks, access controls, custom admin UI and rich-text JSON are available. Basic publishing can be composed with fields, but robust versioning, review lifecycle and audit history are not established as turnkey features.
- **Operations/hosting:** Node app, SQL database, migrations, secrets, media, reverse proxy/WAF, monitoring, backups/restores and upgrades are So7ob responsibilities. No turnkey managed hosting or backup service was established.
- **Maintenance/release:** Repository activity continued through 2026-09-14, but the formal release page displayed releases through 2025. Maintainers describe Keystone 5 as maintenance mode and Keystone 6 targeting Node Maintenance/Active LTS. Confirm current package status before adoption.
- **Security:** GHSA-cqmq-8755-7xvh reports a `graphql.maxTake` bypass fixed in `@keystone-6/core` 6.5.3; another advisory describes an `isFilterable` bypass and incomplete prior fix. Project policy states no publicly disclosed penetration testing or professional audit. Pin patched packages and use defense in depth.
- **Arabic/RTL:** No positive official evidence for Arabic admin localization or full RTL support.
- **Score:** 15+13+12+9+8+10+3+5+1 = **76/100**.

**Key supplied references:** [repository](https://github.com/keystonejs/keystone), [license](https://raw.githubusercontent.com/keystonejs/keystone/main/LICENSE), [lists](https://keystonejs.com/docs/config/lists), [GraphQL](https://keystonejs.com/docs/graphql/overview), [database guidance](https://keystonejs.com/docs/guides/choosing-a-database), [releases](https://github.com/keystonejs/keystone/releases), [security advisory](https://github.com/keystonejs/keystone/security/advisories/GHSA-cqmq-8755-7xvh), [security policy](https://github.com/keystonejs/keystone/security/policy).

### 10. Directus

**Best fit:** API-first SQL data management and custom frontends; not a default choice for a traditional publishing workflow.

- **Architecture/API:** Studio plus generated REST/GraphQL over an existing or new SQL database. APIs support CRUD, filters, sorting, pagination, field selection, relation population and custom extensions; SDKs and MCP support are advertised but not independently benchmarked.
- **Editorial/content:** Collections/tables, fields, relations, files/assets, permissions, statuses, versioning and automations can support workflows. Approval, scheduling, preview, localization and publishing requirements need a POC.
- **Operations/hosting:** Self-hosting requires runtime, SQL, storage, secrets, TLS/proxy, backups, observability, upgrades and extension compatibility. Cloud is a separate commercial boundary; verify pricing, residency and service terms.
- **Maintenance/release:** v12.4.1 and v12.4.0 were shown at the top of the release page on 2026-10-14, with active fixes and dependency/security work. This is activity evidence, not an SLA or support-window guarantee.
- **Security:** 2026 advisories included critical/high/moderate issues involving WebSocket access control, DoS, SSRF, SQL injection and cross-site WebSocket hijacking. Map the selected release to fixed versions; no audit or certification was supplied.
- **Arabic/RTL:** No positive evidence for Arabic Studio localization or genuine RTL layout. Test Studio navigation, mixed-direction strings, dates/numbers, search and frontend rendering.
- **License:** Do not flatten this into “open source.” Current `main` uses Monospace Sustainable Core License 1.0 (MSCL-1.0-GPL); historical v11.15.1 uses Business Source License 1.1. The supplied findings describe competitive-use restrictions, license-key conditions and a delayed GPL-3.0 change for MSCL, while BSL explicitly says it is not an Open Source license. Check the exact tag, grant agreement and commercial terms with legal.
- **Score:** 17+14+14+10+8+5+4+5+0 = **77/100**.

**Key supplied references:** [repository](https://github.com/directus/directus), [current license](https://raw.githubusercontent.com/directus/directus/main/license), [historical v11.15.1 license](https://raw.githubusercontent.com/directus/directus/v11.15.1/license), [SQL databases](https://directus.io/features/supported-sql-databases), [documentation](https://directus.com/docs/), [extensions](https://docs.directus.io/extensions/introduction), [releases](https://github.com/directus/directus/releases), [security advisories](https://github.com/directus/directus/security/advisories), [Open Source definition reference](https://opensource.org/licenses).

## License and commercial-boundary notes

The supplied findings intentionally describe different license families rather than treating all candidates as equivalent:

- **Copyleft:** WordPress is reported as GPL-2.0; Drupal as GPL-2.0-or-later; Joomla's exact repository license is GPLv2, with the README saying v2 or later. Commercial use is generally permitted, but distribution of covered derivatives can trigger source, license and notice obligations. Third-party extensions, assets, trademarks, hosting and services are separate.
- **Permissive open-source:** Ghost is MIT; Wagtail is BSD 3-Clause; Payload, Umbraco and KeystoneJS are MIT in the supplied exact-license checks. These generally allow commercial reuse subject to notices/disclaimers, but do not automatically include third-party dependencies, trademarks, hosted support or commercial services.
- **Split/community-plus-enterprise:** Strapi Community Edition code outside `ee/` is described as MIT Expat, while `ee/` code and paid/cloud features have separate terms. Do not apply CE rights to EE code or contractual features.
- **Source-available/use-restricted:** Directus must be checked by exact release. The supplied evidence distinguishes current MSCL-1.0-GPL from historical BSL 1.1 and says neither should be called OSI-approved open-source licensing. Competitive-use restrictions, license-key conditions, delayed license changes, grants and commercial agreements can materially affect deployment and redistribution.

This is a synthesis of supplied findings, not legal advice. Pin the exact commit/tag, inspect every included license, review dependencies and add-ons, and obtain legal review for Directus, Strapi EE/cloud, hosted services, proprietary add-ons and any redistribution.

## Security and maintenance operating posture

The findings show active public disclosure channels and dated fixes across the candidates. They do **not** establish that any candidate is secure, audited, certified, compliant or free of unresolved vulnerabilities. A project-maintained advisory page is not an independent audit. For each finalist:

1. Pin the exact release/tag and record its runtime/database dependencies.
2. Resolve every advisory's affected and fixed version range against that pin; do not rely on a product name or major version alone.
3. Include core, framework, package, plugin/module, theme, extension and cloud-service advisories in the inventory.
4. Rehearse upgrades and data migrations on a production-like copy.
5. Test database, media/file, configuration and secrets backup/restore—not merely backup creation.
6. Verify preview and API access controls, especially for public content and protected/member-only content.
7. Add monitoring, patch ownership, rollback, dependency scanning and an incident path.

Dated maintenance signals in the supplied findings include WordPress 7.1.3 (2026-10-06), Drupal 11.4.6/10.6.16, Joomla 6.2.0 (2026-10-13), Ghost's ambiguous 6.63.0/6.64.0 evidence, Wagtail 8.0 (2026-08-25), Strapi 5.53.0 (2026-09-09), Payload v3.90.2 with v4 canaries, Umbraco 13.16.2 and active 17.x entries, Keystone's lagging visible release page, and Directus 12.4.1. These dates are snapshots; recheck current releases and support windows at procurement and deployment.

## Recommended evaluation sequence for So7ob Tech

1. **Confirm the product shape:** decide whether So7ob needs a publishing/editorial system, structured headless content, or an SQL-backed data platform. Do not start with a score.
2. **Build two bounded prototypes:**
   - Editorial track: Wagtail, WordPress, Drupal, Ghost or Umbraco according to team stack and requirements.
   - Headless/data track: Strapi, Payload, KeystoneJS or Directus according to frontend and data-platform needs.
3. **Use the same acceptance content:** Arabic and English, mixed-direction text, rich media, links, scheduled content, revisions, preview, localized variants, roles and approval transitions.
4. **Exercise the APIs:** public/private boundaries, authenticated writes, filtering, pagination, locale/fallback, preview and cache invalidation. For Directus and other API-first candidates, explicitly test whether generic data workflows meet editorial requirements.
5. **Run an operations drill:** provision, patch, upgrade, migrate, back up, restore, rotate secrets, revoke API keys and roll back. Include self-hosted and managed-service boundaries separately.
6. **Perform exact-version due diligence:** verify current release, advisory fixes, runtime/database matrix, add-on licenses, cloud terms and support windows immediately before selection.
7. **Make Arabic/RTL a gate, not a low-weight afterthought:** require sign-off from Arabic-speaking editorial users and frontend reviewers.

### Bottom line

For a conventional publishing center, start with **Wagtail, WordPress, Drupal, Ghost and Umbraco** as differentiated prototypes rather than treating their scores as a ranking. For a custom headless product, start with **Strapi, Payload and Wagtail**, adding KeystoneJS when developer-owned workflow composition is acceptable. For API-first SQL data management, evaluate **Directus**, but only after exact-version license/legal review and an editorial proof of concept. No candidate is ready for production selection from desk research alone.
