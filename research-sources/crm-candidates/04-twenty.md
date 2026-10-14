Twenty is a genuine, configurable CRM candidate with strong contact/account/opportunity coverage, code extensions and self-hosting, but it is not a ready-made marketing-automation or customer-service suite; recent published critical/high advisories and AGPL plus commercial-license boundaries make a controlled technical/legal/security evaluation necessary before adoption. The supplied repository URL is canonical and resolves to `twentyhq/twenty`.[1] Checked 2026-10-14; rubric: Repository evaluation rubric, 100 points.

## Identity and class

Twenty is an extensible CRM platform for technical teams, not merely a generic database or adjacent product. The repository describes configurable CRM objects, views, workflows and code-defined apps, and identifies a TypeScript/Nx, NestJS, PostgreSQL/Redis backend with a React frontend.[1] The given URL matches the canonical repository; no repository mismatch was found.[1]

## CRM domain fit and limits

The standard CRM model explicitly includes People (contacts), Companies (accounts), and Opportunities (deal records with stages, sizes, account relation and expected close date). Opportunity records can be presented as a Kanban sales pipeline. Tasks and Notes provide follow-up and interaction context. Custom objects, fields and relations can represent additional business entities.[2] This supports core contact/account/sales-pipeline work. Workflows are documented as visual automation and appear in the product's official documentation index; workflows and custom code extend CRM processes but do not establish a native campaign-management or case/service desk capability.[3] I found no opened primary evidence of a first-class marketing campaign suite or case-management module. Campaign functionality therefore remains unknown/unsupported here, not credited as native coverage. Treat service cases as a possible custom-object build rather than built-in functionality.

## License and edition boundaries

The root license states that most of the project is AGPLv3, while files marked `@license Enterprise` are subject to the commercial license. It identifies select app-development toolkit packages, UI library and apps as MIT-licensed, and grants an explicit exception permitting separately developed Twenty applications to be proprietary without that alone subjecting them to AGPL. Conversely, modifying Twenty remains subject to AGPL and commercial-licensed components have separate restrictions.[4] The commercial-license text conditions production use of covered software on Twenty terms and a valid Enterprise subscription; this is a meaningful boundary, not a blanket indication that all self-hosted production use is free.[4] Cloud pricing lists Pro at $9/user/month, Organization at $19/user/month and Enterprise from $50k/year, with SSO/row-level permissions in Organization and single-tenant isolation, IP allow-listing and SCIM in Enterprise.[5] The pricing page also advertises feature/usage limits and hosted services, so do not assume Cloud plan entitlements transfer identically to self-hosting.[5] No legal or commercial-use conclusion is made; have counsel map intended deployment, modifications and package scope to the applicable terms.

## Current maintenance and security

The repository had numerous commits dated 2026-10-14, and its releases page lists v2.41.0 with substantive feature and maintenance work, including workflow, apps, integrations, permissions and localization changes.[6][7] This is evidence of active maintenance, not a commitment about supported branches or response SLAs; no formal branch-support policy was verified. The security policy requests confidential email reports and promises an initial response within one business day, while noting there is no formal bug bounty.[8] The repository's advisory listing shows multiple advisories, including a Critical SQL injection in `searchVector` settings published July 27, 2026 and a High cross-workspace IDOR published June 17, 2026, as well as earlier issues.[9] The opened advisory index does not establish whether every affected deployment/version is patched; resolve applicable advisories against the exact selected release before any security decision. Root package metadata confirms a multi-package workspace but does not by itself establish dependency freshness or a comprehensive dependency-audit practice.[10] CI workflow inventory includes server, frontend, SDK, Docker Compose and E2E workflows; existence is useful evidence but not a passing test result for a particular revision.[11]

## Architecture and deployment

The repository describes a modular TypeScript monorepo with Nx, NestJS services, BullMQ, PostgreSQL and Redis, and React/Jotai/Lingui frontend; the app framework offers custom objects, server-side logic and React components.[1] The official API model is generated per workspace schema, yielding REST and GraphQL endpoints for built-in and custom objects, plus metadata APIs for schema changes.[12] This is a substantial extension surface but requires engineering ownership of an evolving data model and runtime.

Official Docker Compose instructions support self-hosting. They specify at least 2 GB RAM and current Docker/Compose, use full release tags, and document environment setup, secret encryption key handling, persistence volumes, reverse-proxy/SSL recommendations, backup and restore.[13] The docs warn that losing the encryption key makes stored secrets inaccessible. This is reproducible guidance, but operational security, backups, upgrades and infrastructure remain the operator's responsibility; production suitability was not tested.

## Documentation, tests, APIs and integrations

Official user/developer documentation covers standard and custom objects, workflows, API and self-hosting.[2][3][12][13] The repository workflow directory lists CI for server, frontend, SDK, Docker Compose and end-to-end tests.[11] This supports documentation and test infrastructure scores, but a listed workflow is not proof of coverage depth or green status for a chosen commit.

The schema-driven REST/GraphQL APIs support CRUD and metadata operations, with batch operations documented; API reference is workspace-specific in the application.[12] The repository lists a Zapier package and product documentation references integrations such as email/calendar, while the Cloud pricing page lists REST/GraphQL, webhooks and MCP and differentiates plans/rate limits.[1][5] Treat hosted MCP and commercial-tier quotas/features as edition-dependent; do not assume third-party integration availability or identical self-hosted support without testing the exact deployment.

## Arabic, i18n and RTL

The official pricing page claims 30+ languages.[5] The v2.41.0 release notes specifically describe laying out the app right-to-left for Arabic and Hebrew, which is direct evidence of RTL implementation work.[7] This does not prove complete Arabic translation coverage or bidi correctness across all components, data, custom apps, email templates and browsers. Arabic support should be tested in the target release and workflows; localization architecture alone is not counted as verified completeness.

## Conditional recommendation and confidence

**Recommendation: `evaluate`.** Twenty is a strong technical CRM base for contacts, accounts and sales opportunities where configurable schema, workflows, APIs and self-hosting matter. Evaluate it in a bounded proof of concept. Before any deployment decision, determine license applicability package-by-package and for intended modifications, confirm edition entitlements, identify/pin a patched release against the listed advisories, and test backups, access controls, integrations, Arabic and RTL on the target version. It should not be treated as an out-of-box campaign-marketing or service-case platform. No legal, security, compliance, production or commercial-use approval is implied. Confidence: **medium**; primary evidence is broad and recent, but advisory disposition, branch support, test execution/results, full Arabic coverage and exact self-hosted edition boundaries remain unverified.

## Weighted score (Hub rubric; midpoint 71/100)

- Feature completeness and domain fit: **16/20** — solid core contact/account/opportunity and configurable workflow fit; no verified native campaign or case management.
- Architecture and reuse quality: **12/15** — clear modular monorepo, schema-based extensibility and code app framework; operational coupling/upgrade paths not fully verified.
- Development activity and maintenance: **13/15** — commits on check date and recent v2.41.0 release; no support-branch policy verified.
- Security and dependency quality: **7/15** — formal reporting channel, CI/security indicators, but critical/high published advisories and dependency posture/disposition need review.
- Documentation and testing: **8/10** — useful official feature, API and deployment guides and broad CI inventory; actual passing coverage unknown.
- License clarity and suitability: **5/10** — license distinctions are unusually explicit but AGPL, Enterprise-marked code, and commercial terms require applicability review.
- Setup and deployment: **4/5** — official Compose path, version pinning, persistence and backup instructions; operators own secure operations.
- Integrations and APIs: **4/5** — REST/GraphQL, metadata API, webhooks and app framework documented; edition limits/integration verification remain.
- i18n, Arabic and RTL: **2/5** — official 30+ language claim and release-noted RTL layout; full Arabic coverage/bidi correctness unverified.

**Range:** 58–82/100. Low/high bounds reflect uncertainty in security/advisory disposition, license applicability, test effectiveness, hosted/self-hosted feature parity and Arabic completeness; they do not treat unknown evidence as automatic zero. Midpoint criterion points sum exactly to 71.

## References

[1]: https://github.com/twentyhq/twenty "Canonical Twenty repository"
[2]: https://docs.twenty.com/user-guide/data-model/capabilities/objects "Twenty standard and custom objects"
[3]: https://docs.twenty.com/llms.txt "Twenty official documentation index"
[4]: https://github.com/twentyhq/twenty/blob/main/LICENSE "Twenty root license and additional permissions"
[5]: https://twenty.com/pricing "Twenty official pricing and plan comparison"
[6]: https://github.com/twentyhq/twenty/commits/main/ "Twenty main-branch commit history"
[7]: https://github.com/twentyhq/twenty/releases "Twenty releases"
[8]: https://github.com/twentyhq/twenty/security/policy "Twenty security policy"
[9]: https://github.com/twentyhq/twenty/security/advisories "Twenty security advisories"
[10]: https://github.com/twentyhq/twenty/blob/main/package.json "Twenty root package workspace metadata"
[11]: https://github.com/twentyhq/twenty/tree/main/.github/workflows "Twenty CI workflow inventory"
[12]: https://docs.twenty.com/developers/extend/capabilities/api "Twenty schema-per-tenant API documentation"
[13]: https://docs.twenty.com/developers/self-host/capabilities/docker-compose "Twenty Docker Compose self-hosting guide"
