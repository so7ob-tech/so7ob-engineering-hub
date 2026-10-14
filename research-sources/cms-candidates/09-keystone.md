# KeystoneJS (keystonejs/keystone) — CMS candidate evidence note

**Evidence checked:** 2026-10-14. Facts below describe the official project material opened on that date; marketing claims are labeled as such. This is an assessment of the Keystone 6 repository, not legacy Keystone 5.

## Finding

Keystone 6 is best classified as a **schema-driven, headless CMS / GraphQL application framework** with a first-party editorial Admin UI. It is not a turnkey traditional publishing suite: content types, workflow rules, authentication, access policy, front-end delivery, and operational controls require developers to configure and own them. It is a plausible **evaluate** candidate where So7ob Tech values TypeScript/Node, code-defined models, and GraphQL. It is not a low-configuration editorial product.

## Verified facts and assessment

- The canonical repository describes Keystone 6 as a content/data system generating a GraphQL API and management UI from schema, publishes packages in the `@keystone-6/*` namespace, targets Node Maintenance and Active LTS releases, follows semver, and labels Keystone 5 maintenance-mode. Those are project statements, not independent validation. [1]
- The exact root `LICENSE` is MIT, copyright Thinkmill Labs Pty Ltd, 2024. It grants broad rights to use, modify, distribute, sublicense, and sell subject to retaining copyright and permission notices; it includes the standard as-is warranty/liability disclaimer. This file does not state a separate commercial-use restriction, paid edition boundary, or cloud restriction for the covered repository. Assess third-party dependencies and hosted services independently. [2]
- The official Lists API defines models as named lists and configured fields; list configuration includes access controls, hooks, GraphQL and UI behavior. Admin list screens expose configurable create/item/list field modes and visibility. Docs describe rich-text `document` fields stored as structured JSON, custom fields and React components, and basic publishing workflows assembled from `select` and `timestamp` fields. Editorial workflow sophistication beyond those primitives is not established. [3] [4]
- Official docs enumerate PostgreSQL, MySQL, and SQLite providers, and explicitly caution against SQLite in production except special cases. Keystone uses Prisma as the database layer (evident in docs/release notes) and is configured in JavaScript/TypeScript; the current core codebase and examples use TypeScript/React. Admin UI is built on Next.js and supports custom React pages/navigation/components. [3] [5] [6]
- Keystone generates CRUD GraphQL from its schema, conventionally at `/api/graphql`, with filters, ordering, pagination and mutations. Production defaults disable GraphQL Playground and introspection. Access controls/hooks and custom fields/virtual fields permit extension. GraphQL is the primary documented delivery interface; do not assume a first-party REST/content delivery API. [4] [7]
- Official docs provide guides, API references, examples including blog/task manager, testing examples, custom field/admin UI extension guides, and a database selection guide. Repository text itself notes the API reference is generally complete while guides/examples are still being improved; this is the project’s own qualification. [1] [3]
- At the 2026-10-14 evidence date, repository commit history showed activity through 2026-09-14, including a run of commits in August/September 2026. The displayed formal release history includes releases through 2025; the 6.5.0 release (2025-05-05/06) fixed CVE-2025-46720. Do not infer that commits equal a packaged release; verify npm versions and upgrade path before adoption. [8] [9]
- GitHub’s advisory index showed nine published advisories, including two recent 2026 advisories and older issues. The newest displayed, GHSA-cqmq-8755-7xvh, says negative `take` could bypass `graphql.maxTake`; it affects projects relying on that bound and is patched in `@keystone-6/core` 6.5.3. The March 2026 advisory describes a further `isFilterable` bypass via `cursor` and marks CVE-2025-46720 as an incomplete fix. Advisory index existence is not evidence that every deployment is vulnerable; pin versions, review each advisory’s range, and apply patches. [10] [11]
- The published security policy invites private reports by email and says the project has not had publicly disclosable penetration testing or professional audit, automated test coverage has low emphasis on enterprise security considerations, and recommends defense-in-depth rather than placing Keystone at the infrastructure edge. It states GitHub advisories/CVE process and dependency tools (Dependabot/Renovate). No claim of certification, compliance, or independently audited security is supported. [12]
- Arabic: no official evidence of Arabic-language Admin UI localization or first-party right-to-left Admin UI support was found in the official docs/source search opened. Keystone can hold arbitrary text and developers can customize its React UI, but that is not evidence of complete RTL support. Treat Arabic editorial UI/RTL as unverified and prototype/test before selection. [3] [6] [13]
- Deployment/operations inference: this is an application framework deployed and upgraded as a Node app, with a separately operated SQL database and file/image storage configuration. Team must manage schema migrations, secrets, backups/restore, reverse proxy/WAF, monitoring, and release upgrades; the opened sources do not establish a managed Keystone cloud service or turnkey backup service. The project’s own security guidance explicitly recommends perimeter defense in depth. [5] [12]

## Score (screening rubric)

**76/100** — CMS/content/editorial fit **15/20**; architecture/reuse **13/15**; maintenance **12/15**; security/dependencies **9/15**; docs/tests **8/10**; license clarity **10/10**; setup/deployment **3/5**; APIs/integrations **5/5**; Arabic/RTL **1/5**. Sum: 15+13+12+9+8+10+3+5+1 = **76**.

The security points recognize disclosure process and dependency tooling but are limited by advisories and the maintainers’ explicit audit/coverage caveat. Arabic receives only a point for customization potential, not verified localization. API score reflects a strongly documented GraphQL interface, not breadth of native integration catalog.

**Recommendation: Evaluate, not adopt without a proof of concept.** Validate Arabic/RTL and editor usability with actual Arabic content; implement the needed draft/publish, roles, review/audit trail, and media workflows; confirm current supported release and advisory patch status; test schema migration, restore, access control, production hardening, and front-end integration. If the requirement is a business-ready editorial platform with polished multilingual workflows and managed operations, Keystone’s code-first flexibility transfers substantial implementation and operations burden to So7ob Tech.

## Sources opened

[1] https://github.com/keystonejs/keystone — canonical repo and README
[2] https://raw.githubusercontent.com/keystonejs/keystone/main/LICENSE — exact root license
[3] https://keystonejs.com/docs/config/lists — Lists/schema/Admin UI API
[4] https://keystonejs.com/docs — official docs index, editorial, rich text, workflows, tests, examples
[5] https://keystonejs.com/docs/guides/choosing-a-database — database providers and caveats
[6] https://keystonejs.com/docs/guides/custom-admin-ui-pages — Admin UI framework and customization
[7] https://keystonejs.com/docs/graphql/overview — generated GraphQL API
[8] https://github.com/keystonejs/keystone/commits/main — commit history
[9] https://github.com/keystonejs/keystone/releases — release history
[10] https://github.com/keystonejs/keystone/security/advisories — advisory index
[11] https://github.com/keystonejs/keystone/security/advisories/GHSA-cqmq-8755-7xvh — newest listed advisory detail
[12] https://github.com/keystonejs/keystone/security/policy — security policy
[13] https://github.com/keystonejs/keystone/search?q=rtl&type=code — GitHub RTL code search (requires sign-in for results; no positive support evidence obtained)

**Scope note:** This note addresses Keystone only. Directus is not evaluated here; any separate Directus comparison must distinguish its Business Source License from OSI-approved open-source licenses and inspect the exact version’s license terms rather than infer from product marketing.
