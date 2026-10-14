# Beveren Field Service Management (beveren-fsm)

**Checked date:** 2026-10-14  
**Candidate class:** ERPNext/Frappe field-service management extension with service requests, orders, appointments, dispatch, technician assignment, parts, and invoicing.  
**Decision:** Evidence-reviewed, but limited fit for a Booking & Service **Marketplace** catalog. **Recommendation: `reference_only`.**

## Concise decision findings

Beveren FSM is an ERPNext/Frappe operational FSM application, not a public consumer booking marketplace. Its documented workflow is `Service Request → optional Service Quotation → Service Order → Service Appointments → Work Execution → Invoice`; the repository describes technician scheduling, dispatch, spare parts, mobile-friendly work updates, and reporting. [1] [2] This is useful reference material for an internal provider-operations or dispatch subsystem, but the evidence does not show consumer/provider onboarding, a multi-vendor service catalog, public availability search, marketplace discovery, reviews, checkout, payment orchestration, or marketplace settlement.

The discovery caveat is substantially confirmed: **“AGPL-3.0 ERPNext/Frappe extension; active but early/develop-branch app, not a public consumer marketplace.”** The repository default branch is `develop`, the repository has no published releases, and its current code is still tightly coupled to an ERPNext/Frappe Bench installation. [19] [10] The repository is active rather than abandoned: the checked branch had a 2026-09-20 smoke-test/UI commit and GitHub metadata showed an update in October 2026, but this is still a young project with only 24 stars, one open issue, and no packaged release evidence. [20] [19]

## Use-case fit and limitations

**Good fit as an internal service-operations component.** Core evidence supports service-request intake, optional quotations, service orders, appointment scheduling, dispatch-board views, technician assignment, on-site work tracking, spare-parts consumption, status/reporting, and invoice linkage. [2] The code contains Frappe doctypes for requests, quotations, orders, appointments, technicians, skills, service areas, reports, and related child records, which is a reasonably direct domain model for provider back-office operations. [16] The React schedule UI supports calendar/grid/map-style views and backend calls for appointments, unassigned orders, rescheduling, item edits, and bulk technician assignment. [13] [14]

**Not a booking marketplace.** An appointment here is an ERP document created from a service order and assigned to known technicians. The repository does not document a public customer booking flow, provider profiles or onboarding, marketplace search/ranking, inventory of independent providers, customer payments, payouts, reviews, coupons, or dispute handling. The site positions Beveren as an ERPNext implementation/customization/support partner, not as a consumer marketplace operator. [17] [18] “Booking” should therefore be interpreted as internal service scheduling, not a two-sided marketplace booking product.

**Important reproducibility limitation.** The README's self-hosting command points to `Beveren-Software-Inc/beveren_fsm`, which currently redirects to this repository, so that alias is usable; its separate frontend-development command points to `Beveren-Software-Inc/beveren_fsm_spa`, which returned not found at the checked date. [2] The README advertises React 19, while the committed schedule manifest declares `react` `^18.2.0`; this version conflict must be resolved before treating the stated stack as authoritative. [2] [7]

## License and commercial boundary

The repository contains the full GNU Affero General Public License, version 3, dated 19 November 2007, and GitHub identifies the repository license as AGPL-3.0. [3] [19] This is a clear license file, but it is not permissive: AGPL network-use/source-disclosure and corresponding obligations require legal review for a hosted So7ob deployment, modifications, integrations, and distribution. The rubric's license gate is therefore not an automatic approval. The upstream Frappe app metadata independently says `app_license = "mit"`, and the root `package.json` says `license: "ISC"`; neither matches the repository's AGPL license file. [4] [6] This is a material licensing conflict, not evidence that the code is MIT- or ISC-licensed. Confirm the copyright/licensing scope of every subcomponent and obtain legal sign-off before adoption.

Beveren's official site describes paid ERPNext implementation, customization, training/deployment, and ongoing support services. [17] [18] Those commercial services are separate from the repository's open-source code and do not establish a paid marketplace plugin, SLA, or product-support commitment for this candidate.

## Technology, architecture, and deployment

The candidate is a Frappe app with Python backend code, ERPNext-managed dependencies, Frappe doctypes and fixtures, and a separate Vite/TypeScript/React schedule SPA styled with Tailwind and managed with Zustand. [2] [4] [5] [7] The backend package requires Python `>=3.10`; Frappe is commented as Bench-managed rather than pinned in the app's own dependency list. [5] The schedule manifest specifies Vite, TypeScript, React `^18.2.0`, `frappe-react-sdk` `^1.10.0`, FullCalendar 6.1.x, Leaflet 1.9.4, and a broad Radix/UI dependency set. [7]

The architecture is modular enough to reuse selected doctypes and whitelisted Frappe methods, but it is not a clean standalone service. It assumes Frappe session/authentication, ERPNext doctypes, Bench asset/build conventions, ERPNext accounting/stock records, MariaDB, and Redis. [4] [8] The README documents Frappe Cloud as managed hosting and Bench self-hosting (`bench get-app`, `bench install-app`, `bench start`). [2] CI provisions Frappe Bench, ERPNext, MariaDB 10.6, and Redis, then builds and installs the app, which confirms operational coupling but also shows a reproducible starting point for a controlled evaluation. [8]

## Maintenance and project status

The repository is public, non-archived, has a protected `develop` default branch, and has no GitHub releases. [19] [10] The recent commit history includes meaningful scheduling/UI and test-related changes through 2026-09-20, with earlier feature work in November 2025 and a license/README improvement in April 2026. [20] This supports “active” but not maturity: there is no tagged/released version, no supported stable branch documented in the repository, and the README's development instructions refer to a missing separate SPA repository. [2] [10] [20]

## Security and dependencies

GitHub reports **no `SECURITY.md` security policy** and no published security advisories for the repository at the checked date. [9] That is an evidence gap, not proof that the code is secure or vulnerability-free. The repository does have CI pre-commit checks and an integration-style Bench job, but the CI test command explicitly tolerates no tests by running `... || echo "No tests found"`. [8] The root npm `test` script is also a deliberate failure placeholder (`echo "Error: no test specified" && exit 1`). [6]

Dependency risk is material. Python runtime and Frappe/ERPNext versions are not pinned by the app itself, while the SPA has many third-party packages and uses `date-fns: "latest"`. [5] [7] The geocoding API proxies requests to the public Nominatim OpenStreetMap service, applies a simple in-memory per-session delay, caps results at ten, and uses a five-second timeout. [12] That is a useful integration but not a production SLA, durable rate limiter, or vendor contract. The code also contains broad exception handling and some `ignore_permissions=True` behavior when changing a user's language, so a security review and permission-boundary tests are required before exposing it outside trusted ERP users. [12]

## Documentation and testing

The README gives a workflow summary, technology claims, Bench installation, local SPA commands, contribution steps, and a pre-commit command. [2] The `docs` directory contains screenshots rather than a complete deployment, API, operations, or threat-model manual. [11] The repository includes several Frappe doctype test modules, including tests for service orders, quotations, reports, requests, specializations, technicians, and types. [16] However, there is no documented test matrix, coverage report, API contract, release artifact, or evidence that the CI test suite is non-empty and meaningful for production scenarios; CI's “No tests found” fallback and the failing root npm test script reduce confidence. [8] [6]

## Integrations and APIs

The backend exposes Frappe `@whitelist` methods for user profile/language, geocoding, unassigned orders, appointment creation/update, bulk technician assignment/removal, appointment retrieval/statuses, and invoice retrieval. [12] [13] [14] The SPA calls Frappe HTTP methods with session credentials and CSRF tokens, and uses `frappe-react-sdk` as a dependency. [7] [15] This is an adequate internal extension interface, but there is no OpenAPI schema, versioned public API, webhook/event contract, OAuth client flow, payment connector, marketplace provider connector, or documented integration compatibility policy. Those omissions matter for a Booking & Service Marketplace catalog.

## Arabic, i18n, and RTL

There is **some verified Arabic/RTL implementation**, not complete localization. The settings UI offers English and Arabic (`العربية`), persists the user's language through a whitelisted Frappe method, and sets `document.dir`, `document.lang`, and `body.style.direction` to RTL for Arabic. [12] [15] The frontend source does not provide evidence of translated message catalogs, Arabic translations for the full domain UI, bidi-aware component tests, Arabic date/number/currency testing, or RTL screenshots beyond the generic UI. [11] [15] Treat Arabic and RTL coverage as partial and unverified for production.

## Scored criteria (shared 100-point rubric)

Scores are provisional comparative scores for So7ob's booking/service-marketplace requirements, not an adoption approval. Unknown evidence is retained as uncertainty rather than silently scored as zero.

**Weighted screening rubric (100 points; criterion scores are provisional and class-specific):**

- **Feature completeness and domain fit — 9/20:** Strong internal FSM scheduling/dispatch and service lifecycle, but no verified consumer booking or two-sided marketplace functions. [2] [13]
- **Architecture and reuse quality — 9/15:** Modular Frappe doctypes plus React SPA and whitelisted methods, offset by deep ERPNext/Bench coupling and version/repository inconsistencies. [4] [5] [7]
- **Development activity and maintenance — 9/15:** Recent meaningful commits and active default branch, but no releases, small project footprint, and early/develop status. [10] [19] [20]
- **Security and dependency quality — 5/15:** CI and some authenticated/session checks exist, but no security policy/advisories, broad/unpinned frontend dependencies, public Nominatim dependency, and weak test gates. [8] [9] [12]
- **Documentation and testing — 5/10:** Useful README and multiple doctype tests, but screenshots rather than formal docs, no coverage/API contract, and permissive “no tests” CI fallback. [2] [8] [11] [16]
- **License clarity and suitability — 4/10:** AGPL-3.0 file is present, but `hooks.py` says MIT and npm says ISC; hosted/commercial use needs legal review. [3] [4] [6]
- **Setup and deployment — 3/5:** Bench self-hosting and Frappe Cloud path are documented; runtime is operationally heavy and depends on ERPNext, MariaDB, Redis, and missing/ambiguous frontend repo instructions. [2] [7] [8]
- **Integrations and APIs — 3/5:** Several internal Frappe APIs and Nominatim integration, but no public marketplace API, webhooks, payments, or provider connectors. [12] [13] [14]
- **i18n, Arabic and RTL — 2/5:** Explicit Arabic selector and RTL direction handling, but no evidence of full translation or RTL regression coverage. [12] [15]

**Score midpoint: 49/100.**

**Plausible score range: 34–61.** The low end assumes the unresolved AGPL/MIT/ISC conflict, dependency and CI gaps, and absent marketplace capabilities materially block reuse; the high end credits the substantial FSM workflow, existing doctypes/APIs, recent maintenance, and partial Arabic/RTL implementation if So7ob only needs an internal provider-operations module. The range does not assume missing marketplace, payment, security, or localization features exist.

## Recommendation and actionable gates

**Recommendation: `reference_only`, not `adopt` or `evaluate` as the marketplace code base.** The evidence is sufficient to classify the product accurately, but its core boundary is an ERPNext back-office FSM rather than a public consumer marketplace. It can be kept as an architecture reference or a possible internal dispatch component.

If So7ob later evaluates selected reuse, require these gates before any production-facing proof of concept:

1. Obtain legal review of AGPL-3.0 network/source obligations and resolve the conflicting MIT/ISC metadata, including all ERPNext/Frappe and frontend dependency licenses. [3] [4] [5] [6]
2. Pin a supported Frappe/ERPNext/app/frontend version set; create a tagged release and replace the missing SPA-repository reference with a reproducible source/build path. [2] [7] [10]
3. Complete a threat model and dependency/SAST scan, add a security policy and vulnerability-response process, and remove CI paths that pass when tests are absent. [8] [9]
4. Prove the missing marketplace layer separately: public booking UX, provider onboarding and permissions, search/availability, payments/payouts, cancellations/refunds, reviews, notifications, auditability, and API/webhook contracts.
5. Test Arabic end-to-end, including translated labels/messages, RTL layout for calendar/map/dispatch views, Arabic dates/numbers/currency, and regression snapshots. [15]

## Confidence

**Medium.** Key product, license, architecture, deployment, status, and localization claims were checked against the canonical repository, committed files, GitHub release/security pages, and the official company site. Confidence is reduced by the no-release status, incomplete formal documentation, test-gate weaknesses, dependency/version ambiguity, and the material license metadata conflict.

## References

[1]: https://github.com/Beveren-Software-Inc/Field_Service_Management "Beveren-Software-Inc/Field_Service_Management canonical repository"
[2]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/README.md "Beveren FSM README (develop)"
[3]: https://github.com/Beveren-Software-Inc/Field_Service_Management/blob/develop/license.txt "Beveren FSM AGPL-3.0 license file"
[4]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/beveren_fsm/hooks.py "Beveren FSM Frappe hooks and app metadata"
[5]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/pyproject.toml "Beveren FSM Python project metadata"
[6]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/package.json "Beveren FSM root package manifest"
[7]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/schedule/package.json "Beveren FSM schedule SPA package manifest"
[8]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/.github/workflows/ci.yaml "Beveren FSM continuous-integration workflow"
[9]: https://github.com/Beveren-Software-Inc/Field_Service_Management/security "Beveren FSM GitHub security page"
[10]: https://github.com/Beveren-Software-Inc/Field_Service_Management/releases "Beveren FSM GitHub releases"
[11]: https://github.com/Beveren-Software-Inc/Field_Service_Management/tree/develop/docs "Beveren FSM documentation directory"
[12]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/beveren_fsm/field_service_management/api/user.py "Beveren FSM user and language API"
[13]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/beveren_fsm/field_service_management/api/schedule.py "Beveren FSM scheduling and dispatch API"
[14]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/beveren_fsm/field_service_management/api/service_appointment.py "Beveren FSM service appointment API"
[15]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/schedule/src/components/schedule/settings-view.tsx "Beveren FSM language settings and RTL implementation"
[16]: https://github.com/Beveren-Software-Inc/Field_Service_Management/tree/develop/beveren_fsm/field_service_management/doctype "Beveren FSM Frappe doctypes and tests"
[17]: https://beverensoftware.com/ "Beveren Software official site"
[18]: https://beverensoftware.com/solutions/services/ "Beveren Software ERPNext services solution"
[19]: https://api.github.com/repos/Beveren-Software-Inc/Field_Service_Management "Beveren FSM GitHub repository metadata"
[20]: https://api.github.com/repos/Beveren-Software-Inc/Field_Service_Management/commits?sha=develop&per_page=20 "Beveren FSM develop-branch commit history"
