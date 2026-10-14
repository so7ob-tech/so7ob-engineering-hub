# Cal.diy (Cal.com community edition)

**Checked date:** 2026-10-14  
**Candidate class:** Appointment scheduling infrastructure for service providers and teams  
**Repository:** https://github.com/calcom/cal.diy  
**Site:** https://www.cal.diy/

## Decision findings

Cal.diy is a **booking product/infrastructure component, not a marketplace**. It provides self-hosted event types, availability, public booking pages, booking management, calendar/conferencing connectors, payment options, embeds, webhooks and API surfaces. It does not provide a two-sided provider discovery/catalog, marketplace search, provider onboarding, marketplace commissions, or a buyer/seller network. The project can therefore cover the scheduling transaction inside a So7ob marketplace, but it is not evidence of marketplace capability by itself.

The discovery statement is substantially reproduced, with an important boundary: the repository and official documentation describe Cal.diy as the open-source community edition of Cal.com, licensed MIT, and explicitly warn that it is for self-hosting and is **“strictly recommended for personal, non-production use.”** They direct commercial and enterprise-ready users to Cal.com instead, and state that Cal.diy has no hosted/managed version. [1] [2] This distinguishes the community codebase from Cal.com’s commercial hosted/on-prem enterprise service; commercial-service features shown on Cal.com must not be counted as Cal.diy support.

**Recommendation: `reference_only`.** The code is technically relevant for architecture study or a tightly scoped non-production prototype, but the project’s own warning, removal of team/enterprise functionality, and unresolved high-impact authorization issues make it unsuitable as an adoption base for a production service marketplace without a major security and ownership decision. A high technical score here is not adoption approval.

## Product fit, use cases and limitations

For an individual service provider, Cal.diy is a credible scheduling core: event types, recurring and seated events, availability schedules, date overrides, buffers, minimum notice/booking limits, travel schedules, out-of-office, booking management, paid events, private links, calendar connections and conferencing are listed in the official Cal.diy feature comparison. [2] It supports public booking pages and embeddable booking experiences, which could be embedded in a So7ob provider profile or service page. [2]

The fit is weaker for the stated “teams” portion of the class. The official comparison marks Teams, team event types (round-robin and collective), organizations, managed event types, routing forms, workflows, insights, SAML SSO, SCIM and several advanced/enterprise capabilities as absent in Cal.diy. [2] Do not silently substitute Cal.com commercial features for these missing community-edition capabilities.

Cal.diy has useful extension seams: a monorepo with separate apps, packages, app-store connectors, embeds, a Prisma data layer, tRPC application APIs, a Nest.js API v2, platform/OAuth examples and Swagger generation. [3] [15] [16] Those seams may help a So7ob team integrate a marketplace-owned provider/service catalog around the scheduler. They do not establish that a complete marketplace domain model, multi-tenant provider governance, marketplace payments/settlement, moderation, search/ranking, or buyer/provider messaging exists in Cal.diy.

Core scheduling and many connectors are in the repository. Integrations still require provider credentials and configuration; optional services such as Unkey rate limiting are not required for self-hosting. [1] Stripe/PayPal paid events are listed as booking features, but marketplace payout, split settlement, refunds policy, tax, and escrow are not evidenced as Cal.diy core capabilities. [2]

## Technology and architecture

The root README identifies Next.js, tRPC, React, Tailwind CSS, Prisma and Daily.co as the principal stack. [1] The API v2 documentation identifies a separate Nest.js project, and the repository tree contains the API, platform, app-store, embed and feature packages. [15] The root manifest defines Yarn workspaces across `apps/*`, API apps, packages, embeds, features, app-store and platform examples, with Turborepo build/test scripts. [3]

This is a substantial, modular codebase, but it is a fork/community branch rather than a small isolated scheduling library. Reuse would couple So7ob to a large Next.js/React/Prisma monorepo, its schema and migration process, and a fast-moving set of app-store packages. The code has extension points, but the fork boundary and removed enterprise code make migration toward team/organization features a material engineering commitment.

## License

The repository has a conventional MIT License with the 2020-present Cal.com, Inc. copyright notice and the standard permission, notice-retention and warranty-disclaimer terms. [4] GitHub also reports the repository license as MIT. [1] This is clear enough for code evaluation and ordinary modification/distribution subject to preserving notices, but legal review is still required for So7ob’s exact deployment, branding/trademark use, third-party package licenses, and any commercial distribution. The MIT license does not make Cal.com trademarks, hosted services, or commercial enterprise functionality part of Cal.diy.

## Security and dependencies

The repository has a security policy with a security@cal.com contact, a request for coordinated disclosure, a stated three-business-day response target, and several out-of-scope categories. [5] It also contains a reusable security-audit workflow that runs Yarn recursive npm audit and fails on critical vulnerabilities. [6] The root manifest pins a large number of direct/resolved versions and includes modern test/lint tooling, but the monorepo has a broad dependency surface; a current clean audit result was not independently reproduced in this review. [3]

Security posture is the principal adoption blocker. As of the checked date, open repository issues report an allow-all `PermissionCheckService` stub that could permit unauthorized team event-type mutations [7], unauthorized confirmation/rejection of pending team bookings [8], and an IDOR-style missing team-membership check for wrong-assignment report status updates. [9] These are issue reports rather than an independently executed exploit assessment, but they are material, specific and unresolved in the issue state observed on 2026-10-14. The project also warns that Cal.diy does not guarantee security or safety for commercial use. [2]

Operationally, the Docker Compose example uses PostgreSQL, Redis, the Cal.diy web app, a separate API service and an optional Prisma Studio service. [10] The official Docker documentation warns that Prisma Studio should be removed or commented out in production and documents a troubleshooting workaround that sets `NODE_TLS_REJECT_UNAUTHORIZED=0` behind certain SSL-terminating load balancers; that setting is unsafe unless the operator fully understands and trusts the path. [11] Production adoption would require a fresh dependency audit, review of all open security issues, hardened reverse-proxy/TLS settings, secret rotation, authorization tests and a security review of every enabled app connector.

## Maintenance and current status

The GitHub repository is not archived and its default branch is `main`. At the checked date, its latest observed main commit was `54343aa685ae8f33159d2f485ec4a57bad5c574a`, dated 2026-09-20, including fixes to booking, i18n, API and security-adjacent behavior. [1] The latest tagged/released version was **v6.2.0**, published 2026-03-01; no later tagged release was observed even though main continued to receive commits. [12] This indicates active source maintenance but a lag between main and published releases, which matters for reproducible production deployment and patch intake.

The repository is community-maintained, says contributions do not flow to Cal.com’s production platform, and explicitly recommends personal/non-production use. [1] [2] No supported-branch policy or production SLA was evidenced. Treat a pinned commit or release as a So7ob-owned fork snapshot, not as a vendor-supported runtime.

## Documentation and testing

Documentation covers local installation, production build, migrations/upgrading, Docker Compose, one-click/deployment examples, environment variables, cron jobs, integrations, API v2 and platform/OAuth development. [1] [11] The documented baseline is Node.js >=18, PostgreSQL >=13 and Yarn; the installation page recommends Node 18 for compatibility. [1] [11]

The manifest exposes unit tests through Vitest, multiple Playwright E2E suites for web/app-store/embeds, lint/type-check scripts and API v2 unit/E2E/coverage commands. [3] [13] The Playwright configuration covers web, app-store, core embed, React embed and browser projects; this is meaningful automated-test infrastructure. [13] However, the presence of test configuration is not proof that all tests pass at the checked commit, and the unresolved authorization issues show that important security behavior is not yet a sufficient adoption signal.

## Deployment and operations

The official installation guide supports Linux as the preferred production platform but states that any Node.js-capable OS should work. It requires Git, Node.js, Yarn and PostgreSQL, uses Prisma migrations, environment files and a production `yarn build`/`yarn start` flow. [11] Docker Compose offers a quicker reproducible path with local or remote PostgreSQL, and the official Docker page documents a Docker Hub image plus ARM suffixes. [10] [11]

Deployment is not “zero operations”: operators own PostgreSQL, Redis, reverse proxy/TLS, cron jobs, email, OAuth credentials, encryption secrets, database migrations, backups, upgrades, monitoring and security hardening. The README says an available database may be required during a source Docker build, and the compose file exposes an optional Prisma Studio port that must not be left open in production. [1] [10]

## Integrations and APIs

The official feature comparison lists Google, Outlook/Office 365, Apple, CalDAV, Lark, Feishu, Zoho, Exchange and ICS calendars; Daily/Cal Video, Zoom, Google Meet, Microsoft Teams, Webex, Jitsi and other conferencing providers; webhooks, Zapier, n8n/Make/Pipedream, CRM, messaging and analytics connectors; embeds; API v2 REST; API keys; and platform/OAuth clients. [2] The app-store packages in the repository corroborate a broad connector architecture. [3]

The API v2 README documents a Nest.js service with unit tests, E2E tests, coverage and guard conventions. [15] The platform README documents OAuth clients, hashed/plain secrets, redirect URIs and platform examples. [16] Swagger generation files are present in the API source tree, and the official release notes include API v2/OpenAPI fixes. [12] This is strong integration evidence, but it does not prove that every connector is production-ready in the So7ob environment; each provider needs credential, rate-limit, webhook, data-retention and failure-mode validation.

## Arabic, i18n and RTL

Arabic is explicitly listed as a target locale in `i18n.json`, and the repository contains an Arabic `common.json` translation file with approximately 4,610 top-level keys at the checked commit. [17] The Next.js i18n configuration loads target locales and falls back to English when needed. [18] An i18n CI workflow runs Lingo.dev automation on pushes to `main`, subject to repository secrets. [19]

There is partial RTL evidence in the source: Tailwind RTL variants and RTL-aware utility classes appear in UI code, and platform atoms expose a `readingDirection` option. [3] Nevertheless, the review did not find a canonical Arabic end-to-end visual/behavioral test or a documented RTL acceptance matrix. Arabic translation coverage and generic RTL utilities therefore count as partial support, not verified So7ob-grade Arabic UX. Validate booking, availability, date/time, payment, email, embed, validation, admin and mobile layouts in Arabic before any adoption decision.

## Scored criteria (100-point rubric)

Scores are comparative to So7ob’s requirements. Unknown evidence is not treated as zero; the range below models uncertainty and the security/production boundary.

**Weighted screening rubric (100 points; criterion scores are provisional and class-specific):**

- **Feature completeness and domain fit — 12/20:** Strong individual booking core and many integrations, but no marketplace and team/enterprise capabilities are explicitly removed.
- **Architecture and reuse quality — 12/15:** Modular monorepo, app-store, embeds, API v2, Prisma and platform seams; substantial fork coupling and migration burden.
- **Development activity and maintenance — 8/15:** Main active through 2026-09-20, but latest tagged release is 2026-03-01, with no supported-branch/SLA evidence.
- **Security and dependency quality — 4/15:** Security policy, audit workflow and pinned resolutions exist, but specific open authorization issues are a major blocker.
- **Documentation and testing — 8/10:** Detailed self-hosting/Docker/API docs and meaningful Vitest/Playwright/API test infrastructure; passing status not independently verified.
- **License clarity and suitability — 10/10:** Canonical MIT license is present and clear; trademark/third-party obligations still need legal review.
- **Setup and deployment — 4/5:** Docker Compose and source deployment are documented, but operations, secrets, migrations and hardening are non-trivial.
- **Integrations and APIs — 4/5:** Broad app-store/connectors, REST API v2, embeds, webhooks and OAuth/platform surfaces; connector readiness varies.
- **i18n, Arabic and RTL — 3/5:** Arabic locale and translation pipeline exist with some RTL utilities, but no end-to-end Arabic/RTL acceptance evidence.

**Score midpoint: 65/100.**

**Score range:** **48–72**. The low end assumes the open authorization findings affect the proposed deployment, release lag creates operational risk, Arabic/RTL gaps require substantial work, and marketplace functions must be built outside the scheduler. The high end assumes So7ob uses only the individual-booking core, fixes or excludes affected team paths, pins and audits a known-good commit, validates all enabled connectors, and accepts the scheduler as a non-marketplace subsystem. The range is not a substitute for a security disposition.

## Adoption gates and next steps

Because the recommendation is `reference_only`, these are decision gates for a future re-evaluation rather than approval conditions:

1. Obtain legal review confirming MIT obligations, third-party notices and trademark/branding boundaries; do not treat Cal.com hosted/enterprise rights as included.
2. Reproduce and close the open authorization findings [7] [8] [9], add regression tests, run a full dependency audit/SCA, and commission an application-security review before exposing any multi-provider or team workflow.
3. Build So7ob’s provider/service catalog, marketplace search, onboarding, moderation, pricing/commission/settlement and messaging around the scheduler; do not claim those functions are supplied by Cal.diy.
4. Pin a reviewed commit or release, maintain a So7ob fork, define patch SLAs, and test backup/restore, migration rollback, cron, email, OAuth, rate limits and observability.
5. Run Arabic/RTL acceptance tests across public booking, availability, payments, emails, embeds and administration, including mobile and mixed-direction content.

## Confidence

**Medium.** Core scope, license, deployment, architecture, i18n inventory, API surfaces, releases and project warnings are supported by canonical repository/docs files. Confidence is reduced by the fork’s large and fast-moving surface, release lag, lack of a visible production-support policy, lack of an independently reproduced clean security audit, and unresolved security issue reports. The recommendation is intentionally more conservative than the numeric score.

## References

[1]: https://github.com/calcom/cal.diy "Cal.diy canonical repository and README"
[2]: https://www.cal.diy/ "Cal.diy self-hosting documentation and Cal.diy/Cal.com feature boundary"
[3]: https://raw.githubusercontent.com/calcom/cal.diy/main/package.json "Cal.diy root package manifest"
[4]: https://raw.githubusercontent.com/calcom/cal.diy/main/LICENSE "Cal.diy MIT License"
[5]: https://raw.githubusercontent.com/calcom/cal.diy/main/SECURITY.md "Cal.diy security policy"
[6]: https://raw.githubusercontent.com/calcom/cal.diy/main/.github/workflows/security-audit.yml "Cal.diy dependency security-audit workflow"
[7]: https://github.com/calcom/cal.diy/issues/29955 "PermissionCheckService allow-all security issue"
[8]: https://github.com/calcom/cal.diy/issues/29956 "Team-booking authorization security issue"
[9]: https://github.com/calcom/cal.diy/issues/29957 "Wrong-assignment report IDOR security issue"
[10]: https://raw.githubusercontent.com/calcom/cal.diy/main/docker-compose.yml "Cal.diy Docker Compose stack"
[11]: https://www.cal.diy/installation "Cal.diy installation and deployment guide"
[12]: https://github.com/calcom/cal.diy/releases "Cal.diy releases"
[13]: https://raw.githubusercontent.com/calcom/cal.diy/main/playwright.config.ts "Cal.diy Playwright test configuration"
[14]: https://raw.githubusercontent.com/calcom/cal.diy/main/vitest.workspace.ts "Cal.diy Vitest workspace configuration"
[15]: https://raw.githubusercontent.com/calcom/cal.diy/main/apps/api/v2/README.md "Cal.diy API v2 documentation"
[16]: https://raw.githubusercontent.com/calcom/cal.diy/main/apps/api/v2/README-PLATFORM.md "Cal.diy platform OAuth and atoms documentation"
[17]: https://raw.githubusercontent.com/calcom/cal.diy/main/i18n.json "Cal.diy locale configuration"
[18]: https://raw.githubusercontent.com/calcom/cal.diy/main/packages/i18n/next-i18next.config.js "Cal.diy Next.js i18n configuration"
[19]: https://raw.githubusercontent.com/calcom/cal.diy/main/.github/workflows/i18n.yml "Cal.diy i18n automation workflow"
