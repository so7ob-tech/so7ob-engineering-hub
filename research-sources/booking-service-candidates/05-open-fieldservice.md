# OpenFieldService — evidence note

**Checked date:** 2026-10-14  
**Candidate:** OpenFieldService (`open-fieldservice`)  
**Repository:** https://github.com/clawnify/OpenFieldService  
**Candidate class:** Field-service job scheduling, technician dispatch and service-business operations

## Decision findings

OpenFieldService is a small, actively changing field-service operations application, not a booking marketplace. Its verified scope is an operator-facing scheduler and dispatch system with customers, technicians, service types, jobs, checklists, materials, equipment/site records, invoices and read-only offline job packets. The repository describes itself as an open-source alternative to field-service products and exposes a REST/OpenAPI application, but there is no verified consumer marketplace, provider onboarding, public service catalogue, multi-vendor discovery, marketplace commission, payment checkout, customer portal or external calendar/payment connector.[1] [2] [6] [7]

**Recommendation: `reference_only`.** It is worth studying for scheduling/dispatch UX, UUID-backed service records, job/equipment history and a compact Preact/Hono/SQLite/D1 architecture. It is not substantiated as a code base for So7ob’s Booking & Service Marketplaces catalog because the marketplace boundary is missing, production security/operations evidence is thin, and the project is early-stage. The decision is not an adoption approval.

**Discovery caveat preserved and resolved:** this was an early-stage project; the discovery record said the LICENSE was MIT while the README footer said AGPL-3.0, so license clarity was not presumed. The conflict was real: issue #17 reported “README license section says AGPL-3.0, but LICENSE file is MIT.” The merged correction PR on 2026-09-23 changed the README label to MIT and linked it to LICENSE; the current main README footer is `[MIT](LICENSE)`, LICENSE is the MIT text, and GitHub metadata reports SPDX MIT.[3] [9] [13] [16] This is now a documented historical conflict rather than an unresolved current-main mismatch, but So7ob should retain the correction history and conduct normal dependency/license review before redistribution.

The checked main commit is `817a8699cb8ce49872dc737a0e14a4f7bc2d920a`, dated 2026-10-06 21:37:23 UTC, with the message “Streamline the job booking form.” The repository was created 2026-04-04, was last pushed 2026-10-06, is not archived, and had 38 stars, 15 forks and one open issue at the checked metadata snapshot.[9] [10]

## Use-case fit and limitations

### Fit

The core product fits internal service-business workflows. The README and live API source substantiate job creation and status/date/time scheduling; weekly technician calendar and dispatch; customer CRM and service history; configurable service types/prices/durations; job notes and checklists; materials and inventory; invoice generation/statuses; dashboard metrics; search/filtering; equipment/sites with serial numbers, lifecycle state, warranty dates and history; UUID relationships; and browser-cached, read-only field packets when connectivity drops.[2] [6] The agent-facing guide explicitly positions it for pest control, HVAC, plumbing, cleaning, landscaping and similar businesses, and describes terminology/customization points such as changing “Technician” or “Job.”[7]

That makes it a plausible **reference implementation for the service-provider side** of a So7ob product: service records, dispatch queues, availability flags, visit status, staff dashboards and work-order history. It also provides documented curl examples and a generated OpenAPI path, which are useful integration patterns.[2] [6] [7]

### Not a marketplace or complete booking product

This is not verified as a two-sided marketplace. The repository contains no verified vendor/provider onboarding, public provider profiles, consumer search or ranking, marketplace inventory, quote/bid flow, customer self-service booking, online payment, commission ledger, reviews, messaging, tenant isolation, or marketplace moderation. The “booking” language refers to an internal job form: the latest commit streamlined customer, service, technician, date and time in that form, while optional equipment, priority, address override and notes remain internal scheduling details.[2] [10]

There is no evidence of paid extensions or a plugin ecosystem. The optional equipment/site slice is in the repository itself, not a separately priced extension. The Clawnify deploy button and `clawnify.json` describe a deploy/customization path, but do not establish a commercial support plan, SLA, hosted service boundary or paid module.[2] [8] The README says “no per-user fees” and self-hosting, but that is a project statement, not proof of commercial-service terms.[2]

Materially out of scope or explicitly incomplete items include ownership transfers, component hierarchies, support cases, maintenance plans, parts applicability, coverage adjudication, customer portals and telemetry ingestion. Warranty dates are recorded, but warranty coverage decisions are not inferred.[2] Recurring jobs are mentioned in deployment metadata and the README/API model contains recurring fields, but there is no evidence here of a full recurring-booking engine, reminders, payment collection or customer-facing recurrence management.[2] [6] There is also no verified route for user authentication or authorization in the checked source; that must not be assumed from the existence of an API.[6] [12]

## License

The current repository LICENSE is the standard MIT License, including permission to use, copy, modify, merge, publish, distribute, sublicense and sell, subject to preserving the copyright and permission notice.[3] GitHub’s repository metadata independently reports `mit`, “MIT License” and SPDX `MIT`.[9] The package is marked `private: true`, which is a package publication setting and does not override the repository LICENSE.[4]

The historical README/ LICENSE mismatch was fixed by merged PR #18 on 2026-09-23; that PR states that the incorrect AGPL-3.0 label was replaced with MIT and that no AGPL reference remained in README, LICENSE or package metadata.[13] Current-main verification agrees. The gate is therefore **license identified, with a historical clarity issue** rather than “license unknown.” Legal review is still required for dependency notices and So7ob’s intended modification, distribution and network-use model; a public GitHub repository is not automatically commercial clearance.[3] [4] [13]

## Security and dependencies

The project uses TypeScript/Preact/Vite in the client, Hono/Node-compatible server code, Zod and `@hono/zod-openapi` validation, and a SQLite/D1-oriented database abstraction. The manifest declares `@clawnify/app` 0.2.1, `@clawnify/db` 0.4.2, Hono `^4.6.0`, Preact `^10.25.0`, Zod `^3.24.0`, Vite `^6.0.0`, TypeScript `^5.7.0` and Wrangler `^4.0.0`; the checked lockfile resolves Hono 4.12.10, Preact 10.29.1, Zod 3.25.76, Vite 6.4.1, TypeScript 5.9.3 and Wrangler 4.93.1.[4] [5]

A lockfile with integrity entries is positive reproducibility evidence, and the source validates API shapes with Zod/OpenAPI schemas.[5] [6] However, the repository tree contains no SECURITY.md, security-advisory policy, Dependabot configuration or security-scanning workflow. Its only GitHub Actions workflow synchronizes `main` and `master`; it does not run tests, type checks, dependency audits or release checks.[12] [14] No vulnerability assessment was performed for this note, so absence of a published advisory is not evidence of absence of vulnerabilities.

The offline feature deliberately stores customer details, addresses, notes, checklists and materials in the browser for read-only use; writes are disabled while offline and the UI offers clearing cached data.[2] That is a useful safety boundary, but the repository does not document encryption, retention policy, device management, authentication, authorization, rate limiting, audit/security operations or tenant isolation. These are adoption blockers for production marketplace data until separately designed and tested.

## Maintenance and current status

Maintenance evidence is meaningful but early-stage. The main branch has verified signed commits through 2026-10-06, including offline field access (2026-09-27), customer history context and booking-form improvements (2026-10-06).[10] The repository is not archived or disabled, and there is a branch-sync workflow.[9] On the other hand, it was created only in April 2026, has no Git tags, no GitHub releases, one open issue, and many unprotected feature/fix branches.[9] [11] [15] Stars and forks are recorded for context only and were not used as a maintenance proxy. There is no stated supported branch, release cadence, maintainer SLA or compatibility policy.

## Documentation and testing

The README supplies a quickstart (`git clone`, `pnpm install`, `pnpm run dev`), Node.js 22+ prerequisite, local API/UI ports, database migration warnings, architecture/tech-stack notes, API endpoint table, curl examples, offline behavior, equipment behavior and an agent-facing mode.[2] `agent.md` points automation to `/api/openapi.json` and reiterates UUID and migration rules.[7] The repository contains six test files covering calendar, equipment, offline behavior, previews, service worker behavior and UUID migration.[12]

A direct local verification of commit `817a869…` after `pnpm install --frozen-lockfile` found 14 passing and 2 failing test files: `equipment`, `previews`, `service-worker` and UUID migration tests passed, while `calendar.test.mjs` and `offline.test.mjs` failed because Node 22 attempted to load `.ts` modules without a loader (`ERR_UNKNOWN_FILE_EXTENSION`). This is a reproducible test-runner/configuration gap in the checked environment, not proof that the underlying features are insecure or functionally broken. `tsc --noEmit` passed and `vite build` passed, producing the documented production bundle. The repository itself does not publish CI results for these checks because the only workflow is branch synchronization.[14]

## Deployment and architecture

The architecture is a compact full-stack web application: Preact + TypeScript + Vite client; Hono API with OpenAPI schemas; a shared `@clawnify/db` query/get/run abstraction; and a schema containing customers, jobs, technicians, service types, equipment/sites, invoices, materials and history.[2] [4] [6] The Wrangler configuration uses `src/server/index.ts` as the entry point, `nodejs_compat`, and a D1 binding named `DB`; README development uses local Wrangler/D1 state under `.wrangler/state/`.[2] [17]

The quickstart is reproducible for a fresh local database, but migration operations are operationally significant. Existing integer-ID databases must be backed up and explicitly migrated to UUIDs; hosted databases need an equivalent administrator-run migration before deployment, and custom tables/indexes/columns/triggers require explicit handling.[2] The repository has no Dockerfile, Compose file, Kubernetes chart, infrastructure-as-code, backup/restore runbook, production observability guide or documented reverse-proxy/auth deployment. The deployment path is therefore suitable for a controlled prototype or local study, not a production marketplace without additional platform engineering.

## Integrations and API

The server exposes documented REST endpoints for stats, jobs, customers, sites, equipment/assets, technicians, service types, materials, invoices, notes and checklists, with UUID identifiers and Zod/OpenAPI schemas. The README and `agent.md` show curl usage and direct agents to the OpenAPI document.[2] [6] [7] This supports a useful internal integration surface.

No maintained connectors for payments, calendars, maps/routing, messaging, identity providers, CRM/ERP, webhooks or external marketplace synchronization are documented. No API versioning, authentication contract, webhook contract, SDK, rate-limit policy or backward-compatibility policy is verified. Treat the REST API as an internal extension point, not a ready marketplace API.

## Arabic, i18n and RTL

Arabic coverage, translation files, locale switching, bidi/RTL layout behavior and an i18n framework are not present in the checked repository tree or documented README/agent guide. Source inspection found no locale/i18n/translation/RTL/auth files or tokens. The visible product copy is English. Arabic and RTL support are therefore **unknown-to-absent at implementation level**, with no verified starting architecture; localization would require a deliberate extraction, translation and layout-validation project rather than configuration alone.[2] [7] [12]

## Scored criteria (shared 100-point rubric)

Scores below are weighted points, not percentages. They are comparative to So7ob’s requirements. Unknown evidence is not treated as zero by default; the range below reflects plausible upside/downside from unresolved production, security, localization and marketplace questions.

**Weighted screening rubric (100 points; criterion scores are provisional and class-specific):**

- **Feature completeness and domain fit — 15.0/20:** Strong internal field-service scheduling/dispatch and service-business coverage, but no verified two-sided marketplace, consumer booking, provider onboarding or payments.[2] [6]
- **Architecture and reuse quality — 10.0/15:** Clear client/server/database separation, UUID model, schema/API validation and migration script; still a small bundled app with limited extension and migration documentation.[2] [6]
- **Development activity and maintenance — 8.0/15:** Recent meaningful signed commits through 2026-10-06, but no releases/tags, only one open issue, immature governance and no supported-branch policy.[9] [10] [11] [15]
- **Security and dependency quality — 5.0/15:** Locked dependencies and schema validation help; no security policy/scanning/auth/authorization evidence, and offline PII handling needs operational controls.[5] [6] [12] [14]
- **Documentation and testing — 7.0/10:** Detailed README, agent/API guidance and substantial tests; local run exposed two `.ts` test-loader failures and there is no CI test workflow.[2] [7] [12] [14]
- **License clarity and suitability — 8.0/10:** Current MIT LICENSE, SPDX metadata and corrected README are clear now; historical AGPL/MIT mismatch merits retained legal caution.[3] [9] [13]
- **Setup and deployment — 3.5/5:** Simple pnpm/Wrangler/D1 local path and explicit UUID migration guidance; no container, production operations, backup, observability or auth deployment evidence.[2] [17]
- **Integrations and APIs — 3.5/5:** Broad documented REST/OpenAPI endpoint surface and curl examples; no external connectors, auth contract, webhooks, SDK or versioning policy.[2] [6] [7]
- **i18n, Arabic and RTL — 0.5/5:** English UI only and no discovered locale/RTL architecture; a small residual score reflects that repository inspection cannot rule out future extensibility, not verified support.[2] [7] [12]

**Score midpoint: 60.5/100.**

**Plausible score range: 48.5–68.5.** The lower bound assumes So7ob requires marketplace primitives, production identity/security controls, maintained external integrations and Arabic/RTL as launch requirements; those missing capabilities could reduce domain fit, security, integration and localization scores by about 12 points. The upper bound assumes So7ob would use only the internal scheduling slice, add its own identity/security/integration layer, and accept English-first operation while treating the recent activity and MIT correction as sufficient; that could add about 8 points. This range does not convert unknown security or compliance into positive evidence.

## Confidence and actionable gates

**Confidence: medium.** Core features, current license state, stack, deployment files, API shape, recent commit dates and repository status have strong primary-source support. Confidence is reduced by early age, no releases, absent security/CI evidence, incomplete production operations, failed test-runner files in direct verification, and lack of marketplace/localization evidence.

Before any code adoption rather than reference use, require these gates:

1. Obtain legal confirmation of MIT suitability for So7ob’s exact modification/distribution/network deployment model, retain the 2026-09-23 correction evidence, and inventory all dependency licenses.
2. Add and independently test authentication, authorization, tenant isolation, audit logging, rate limits, secrets handling, backups, encryption/retention controls and a vulnerability-management process; specifically threat-model browser offline caching of customer data.
3. Define and build marketplace-specific flows: provider onboarding, consumer-facing catalogue/search, availability/booking, cancellation/refund/payment, commissions, reviews, messaging, notifications and dispute/moderation workflows.
4. Establish a reproducible production deployment with CI tests/type checks/dependency scanning, supported Node/Wrangler versions, migration/rollback procedures, observability and restore drills. Fix or intentionally configure the current `.ts` test-loader failures.
5. Implement and test Arabic translation extraction and RTL layouts across calendar, forms, tables, invoices, offline banners and mobile breakpoints.

## References

[1]: https://github.com/clawnify/OpenFieldService "clawnify/OpenFieldService canonical repository"
[2]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/README.md "OpenFieldService README"
[3]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/LICENSE "OpenFieldService LICENSE"
[4]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/package.json "OpenFieldService package manifest"
[5]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/pnpm-lock.yaml "OpenFieldService pnpm lockfile"
[6]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/src/server/index.ts "OpenFieldService Hono REST/OpenAPI server"
[7]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/agent.md "OpenFieldService agent guide"
[8]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/clawnify.json "OpenFieldService Clawnify deployment metadata"
[9]: https://api.github.com/repos/clawnify/OpenFieldService "GitHub repository metadata for OpenFieldService"
[10]: https://api.github.com/repos/clawnify/OpenFieldService/commits?per_page=10 "OpenFieldService recent commits"
[11]: https://api.github.com/repos/clawnify/OpenFieldService/releases "OpenFieldService GitHub releases"
[12]: https://api.github.com/repos/clawnify/OpenFieldService/git/trees/main?recursive=1 "OpenFieldService repository tree"
[13]: https://api.github.com/repos/clawnify/OpenFieldService/pulls/18 "OpenFieldService license-correction pull request"
[14]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/.github/workflows/sync-branches.yml "OpenFieldService GitHub Actions workflow"
[15]: https://api.github.com/repos/clawnify/OpenFieldService/branches "OpenFieldService branches"
[16]: https://api.github.com/repos/clawnify/OpenFieldService/issues/17 "OpenFieldService historical license mismatch issue"
[17]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/wrangler.toml "OpenFieldService Wrangler deployment configuration"
