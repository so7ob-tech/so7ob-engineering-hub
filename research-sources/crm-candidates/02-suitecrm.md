SuiteCRM merits **evaluate** as a genuine broad-function CRM, but a security review is a gating condition: its official advisory page lists several high-severity authorization and access-control vulnerabilities published on 12 October 2026, and the checked materials do not establish whether every affected release is patched in the current deployment target. [1] [2]

## Identity and class

**Checked 2026-10-14.** The supplied GitHub URL, `https://github.com/salesagility/SuiteCRM`, is a valid canonical SuiteCRM 7 repository maintained by the project; it is not the sole current code line. The official SuiteCRM 8 repository is `https://github.com/SuiteCRM/SuiteCRM-Core`, described as the modern rebuild. Both identify as enterprise-ready open-source CRM, and both publish AGPLv3. The candidate is a real, general-purpose CRM, not a neighboring category. [1] [3]

## CRM domain fit and limits

Official user documentation enumerates leads, accounts, contacts, opportunities, quotes/invoices/contracts, campaigns, target lists, targets, email templates, surveys, events and customer service. This supports broad sales/contact/account/pipeline and campaign/marketing coverage. [4] Case documentation describes customer support interactions, assignment, states/statuses, priorities, account/contact links, histories, threaded updates and cases created from inbound group email. [5] Workflows are documented as an advanced module; the official introduction describes assigning new records, escalating cases, alerting on high-value opportunities and updating fields. [6] These are documented product capabilities, but the available overview does not validate every process depth or implementation quality. No third-party plugin capability is counted as core coverage.

## License and edition boundaries

The GitHub API identifies AGPL-3.0 for both repositories, and the 7 repository contains a root `LICENSE.txt` with the GNU Affero General Public License, version 3. [1] [3] The checked evidence establishes those root licenses, not a comprehensive per-module or bundled-third-party licensing audit; inspect individual module/dependency notices before reuse. AGPL is copyleft, including network-use source-offer provisions; suitability depends on deployment, modification, distribution and other facts, so obtain legal review rather than treating “open source” as unrestricted commercial reuse. [7]

The vendor pricing page describes the software as available at no additional license cost, with paid hosting, setup, tailoring and support options. This is not evidence of a separate paid proprietary CRM edition or of feature parity among vendor service packages. The standard project can be self-hosted; vendor hosting/support are optional service offerings, with Standard support required on the vendor’s fully managed hosting according to the pricing page. [8]

## Maintenance and release

As checked on 14 October 2026, the official supported-version page lists 7.15 ESR (active support through December 2027 and security support through March 2028) and 8.10 (current support window fields shown as dashes); it marks 8.9 and earlier releases as no longer supported. [2] Official 8.10 notes report release on 30 April 2026, and describe 8.10.1 as a maintenance release for regressions. [9] The SuiteCRM 7 GitHub release page lists 7.15.2. GitHub’s repository API showed a latest commit dated 8 October 2026 for SuiteCRM 7 and 11 September 2026 for SuiteCRM-Core at check time. [10] [11] The two separately maintained major lines and differing support status require selecting the exact line and release; do not infer 8.10’s future support duration from a dash.

## Security and dependencies

The official security policy requests private GitHub Security Advisory reports and limits response scope to actively supported versions; it explains acknowledgment/initial-assessment targets and excludes third-party extensions and self-hosted infrastructure. [12] On the checked advisory page, SuiteCRM reports a high-severity authenticated SQL injection and multiple high/moderate V8 API authorization issues, including privilege escalation and mass assignment, with multiple advisories published 12 October 2026. The advisory listing is evidence of reported issues, not proof that any particular current release remains vulnerable or that all issues are resolved; verify affected/fixed versions against the selected release before use. [13]

The repositories contain Composer manifests and lockfiles; SuiteCRM 8 also includes Yarn package metadata/lock configuration. Repository presence alone does not demonstrate reproducible or automated dependency vulnerability scanning. GitHub’s private Dependabot alerts endpoint returned an authorization error in this check; no conclusion about private alerts or absence of dependency vulnerabilities is warranted. [1] [3]

## Architecture and deployment

SuiteCRM 8 is described by its repository as an Angular frontend with Symfony backend and API-first architecture; it retains a legacy CRM code area, so modernization should not be read as absence of legacy coupling. SuiteCRM 7 is based on common PHP/web server/database technologies. Both repositories state self-hosting is supported. [1] [3] SuiteCRM 8’s current compatibility matrix calls for PHP 8.2–8.4, Apache 2.4, and specified MariaDB/MySQL versions. [14] Installation documentation requires a prebuilt package copied into the web root, suitable permissions, installer/database setup, scheduled-task cron, and (from 8.10) a Symfony Messenger worker for background tasks. Operational reproducibility therefore depends on correctly configuring web server, database, cron and worker; do not assume a one-container deployment from the cited guides. [15]

## Docs, tests, APIs and integrations

Official documentation covers end-user modules, installation, compatibility, release notes, support windows and API setup. The repository root listings show test configuration, test directories, dependency lockfiles and package manifests; this verifies test infrastructure exists, not coverage or passing CI. The displayed GitHub workflow listing showed only an “Add comment” workflow; no robust CI test pipeline was independently demonstrated. [1] [3]

SuiteCRM 8 V8 API installation documents OAuth2-signed access tokens, public/private key permissions, URL rewriting and routing to `Api/index.php`. This is a documented integration interface, though API security merits particular scrutiny given the cited advisories. [17] User documentation also lists integrations but does not substantiate a specific maintained connector catalog in the opened source. [4]

## Arabic, i18n and RTL

Official release notes direct translators to Crowdin, and SuiteCRM 8.10 notes support extension language labels through YAML as well as PHP labels. This supports an internationalization/translation mechanism, not verified Arabic completeness. The opened sources did not directly establish Arabic availability or correct right-to-left/bidirectional layout behavior. Arabic and RTL remain **unknown and uncredited** in this evaluation. [9]

## Conditional recommendation and confidence

**Recommendation: `evaluate` (medium confidence).** Its core CRM scope, self-hosted architecture, release activity and explicit support policy make it a relevant candidate. Proceed only with a release-specific security disposition and supported-version choice, root/module/dependency license review, deployment rehearsal, and validation of required workflows and Arabic/RTL. This is a research classification, not legal, security, commercial-use, compliance or production approval. If high-impact advisories affecting the chosen build cannot be shown patched or acceptably mitigated, the security gate blocks adoption regardless of score. [2] [12] [13]

## Weighted score

Provisional values are comparative to the rubric and evidence available here. Each low/high interval reflects unresolved requirements rather than treating absent evidence as zero. Criterion points are weighted points; their midpoint values total the score midpoint.

- Feature completeness and domain fit (20): **17.0 / 20** (range 15–19) — broad native sales, marketing, service and workflows documented; depth still needs use-case validation.
- Architecture and reuse quality (15): **11.0 / 15** (range 9–13) — extensible API-first 8 rebuild and self-hosting, tempered by legacy area and split major lines.
- Development activity and maintenance (15): **13.0 / 15** (range 11–14) — current releases/commits and explicit ESR support policy; 8.10 support-window ambiguity remains.
- Security and dependency quality (15): **5.0 / 15** (range 2–8) — defined disclosure process and security fixes, but current high/moderate advisories and unverified dependency scanning/patch disposition.
- Documentation and testing (10): **7.0 / 10** (range 5–8) — substantial official operator/user/API documentation and documented test frameworks, with CI/test execution evidence incomplete.
- License clarity and suitability (10): **7.0 / 10** (range 5–8) — root AGPL-3.0 is identified, but module/bundled components and intended-use compatibility require review.
- Setup and deployment (5): **4.0 / 5** (range 3–4) — documented self-host installation and compatibility; multiple operational services need configuration.
- Integrations and APIs (5): **4.0 / 5** (range 3–4) — OAuth2 V8 API documented; connector ecosystem not fully established here.
- i18n, Arabic and RTL (5): **1.0 / 5** (range 0–3) — translation mechanism evidenced; Arabic and RTL not verified.

**Score midpoint: 69.0 / 100. Plausible evidence-bound range: 53–81 / 100.** This is not an approval score and does not override eligibility gates.

## References

[1]: https://github.com/salesagility/SuiteCRM "SuiteCRM 7 canonical GitHub repository and project README"
[2]: https://docs.suitecrm.com/community/supported-versions/ "SuiteCRM supported versions"
[3]: https://github.com/SuiteCRM/SuiteCRM-Core "SuiteCRM 8 Core canonical GitHub repository and project README"
[4]: https://docs.suitecrm.com/user/ "SuiteCRM user documentation index"
[5]: https://docs.suitecrm.com/user/customer-service/cases/ "SuiteCRM Cases user guide"
[6]: https://docs.suitecrm.com/user/getting-started/introduction/ "SuiteCRM introduction and workflows"
[7]: https://github.com/salesagility/SuiteCRM/blob/master/LICENSE.txt "SuiteCRM GNU AGPL version 3 license text"
[8]: https://suitecrm.com/pricing/ "SuiteCRM pricing, hosting, setup and support"
[9]: https://docs.suitecrm.com/8.x/admin/releases/8.10/ "SuiteCRM 8.10 and maintenance release notes"
[10]: https://github.com/salesagility/SuiteCRM/releases "SuiteCRM 7 GitHub releases"
[11]: https://api.github.com/repos/salesagility/SuiteCRM/commits?per_page=1 "SuiteCRM 7 latest commit metadata"
[12]: https://docs.suitecrm.com/community/security-policy/ "SuiteCRM security policy"
[13]: https://github.com/salesagility/SuiteCRM/security/advisories "SuiteCRM GitHub security advisories"
[14]: https://docs.suitecrm.com/8.x/admin/compatibility-matrix/ "SuiteCRM 8 compatibility matrix"
[15]: https://docs.suitecrm.com/8.x/admin/installation-guide/downloading-installing/ "SuiteCRM 8 installation instructions"
[17]: https://docs.suitecrm.com/developer/integration-api/v8/installation/ "SuiteCRM V8 API installation and OAuth2 setup"
