# Drupal (`drupal/drupal`) — CMS candidate evidence

**Evidence date: 2026-10-14.** Scope is Drupal core as a CMS/headless CMS candidate for So7ob Tech. Claims below distinguish observed primary-source documentation from inference and gaps. A dated page snapshot can change; verify current releases and advisories before selection.

## Assessment

**Decision: evaluate, not adopt by default.** Drupal is a mature, extensible traditional CMS that can also expose structured content through standards-based APIs. Its built-in content entities, content types, fields, taxonomies, revisions, moderation and multilingual functions map well to structured publishing. The tradeoff is an operations-heavy PHP application with Composer-managed dependencies, contributed module exposure, configuration/deployment management and a major-version upgrade lifecycle. A decoupled frontend adds integration work rather than making Drupal headless-only.

**CMS type:** traditional CMS first; also decoupled/headless-capable CMS; publishing/editorial platform. It is not primarily a general-purpose data platform. “Headless” is an architectural option, not a separate product mode. The official JSON:API docs describe entity/bundle resources and request operations, while expressly noting translation limitations and excluding business workflows such as login/account creation.

## Evidence and findings

**Structured content and editorial.** The official User Guide documents content types, fields, taxonomy, entity references, form/display configuration and Views. It includes a dedicated multilingual chapter and operational chapters for configuration synchronization, deployment, backup/logging, and security/maintenance. Official Content Moderation docs describe editorial workflows and moderation states; the core Workflows module supports transitions of revisionable entities. These are strong indications of CMS/editorial fit, not proof that a specific So7ob workflow will work without implementation/configuration.

**Architecture and APIs.** Drupal core is a PHP application. Core JSON:API is documented as a compliant implementation of the JSON:API specification, with collections, filtering, includes, pagination, sorting, revisions and CRUD; its resources center on Drupal entity types and bundles. Core REST is another option. API access configuration, authorization, frontend rendering, preview/editor experience and deployment of a separate frontend remain design/integration responsibilities. The docs say advanced translation use cases are not supported by JSON:API; test required language negotiation, read/write translation behavior and editorial preview explicitly.

**Technology, deployment and extensions.** The repository describes a CMS platform and its thousands of free/open-source modules; Drupal.org also lists a large provider ecosystem. This offers broad extensibility but third-party modules and dependencies require selection, compatibility review and patch management. The evidence pages reviewed do not establish a complete runtime matrix or database support matrix; verify exact PHP, database and extension requirements for the chosen core release. Standard Drupal operation entails running a PHP web stack, database, Composer dependency management and file storage, plus configuration deployment, backups/restores, monitoring and routine core/module upgrades. These are operational implications/inference, not a claim that a particular hosting topology is mandatory.

**License and commercial use.** Drupal core's license is the GNU General Public License, version 2 or later (GPL-2.0-or-later; verify the exact license file for the pinned release before redistribution). GPL permits commercial use and charging for services/distribution; distribution of covered derivative works invokes GPL obligations, including license/source-code obligations. Trademark/logo use has separate rules. Separately licensed extensions, themes, assets, hosted products, and vendor services can have different terms. Drupal.org's repository/docs do not establish that any paid enterprise/cloud offering is part of core or covered by core's license; review provider contracts and each dependency. Directus is outside this Drupal-only evidence scope; no Directus BSL/version-term conclusion is made here.

**Maintenance/release.** The official releases page, as observed on the evidence date, lists Drupal 11.4.6 and Drupal 10.6.16 as production-ready bugfix releases; Drupal 12.0.0-alpha1 is explicitly not production-ready. It states 10.6.x security support through December 2026 and that 10.5.x support ended. That establishes active release activity and a short remaining support horizon for 10.6, not a guarantee about future roadmap. Pin supported stable core and plan upgrades on the official release channel.

**Security.** Drupal publishes core and contributed-project security advisories and release notices. The 2026-10-14 security page includes third-party library advisory SA-CORE-2026-013 and numerous contributed-project advisories, illustrating that contributed modules have their own risk/update stream. Releases page records prior 2026 core security fixes, including SA-CORE-2026-010 through -012. This demonstrates a public disclosure/patch channel, not security certification, audit, absence of vulnerabilities, or a security guarantee. Keep core and all modules current; assess each contributed dependency and exposure. Do not infer an exact supported-branch set solely from an advisory listing.

**Docs/tests.** Drupal's official user guide covers content modeling, multilingual, deployment/configuration, backup and security maintenance; core JSON:API docs include API operations and security considerations. Repository links to documentation, change records and the security process. These are useful official docs. Tests were not independently run or counted, and the reviewed source pages do not establish test coverage or quality for So7ob's eventual module set.

**Arabic and RTL.** The official User Guide establishes general multilingual site functionality. A Drupal.org page on RTL explains RTL stylesheet handling but is specifically Drupal 7 documentation, now unsupported; it is not sufficient evidence of current Drupal 11/12 Arabic RTL correctness. Arabic translation/support for the current admin/editor UI, right-to-left admin UI, translated content, and RTL theme behavior must be demonstrated on the selected current version/theme. Treat production-ready Arabic/RTL as **unknown pending hands-on validation**, not a verified feature claim.

## Score (screening rubric, 100 points)

| Criterion | Points |
|---|---:|
| CMS/content/editorial fit | 18/20 |
| Architecture/reuse | 13/15 |
| Maintenance | 13/15 |
| Security/dependencies | 10/15 |
| Docs/tests | 8/10 |
| License clarity | 9/10 |
| Setup/deployment | 3/5 |
| APIs/integrations | 5/5 |
| Arabic/RTL | 1/5 |
| **Total** | **80/100** |

The deductions chiefly reflect substantial deployment/upgrade burden, dependency-specific security work and unverified current Arabic/RTL behavior. The docs are strong, but tests were not verified. Score is a screening judgment, not a measured benchmark.

## References (primary sources opened)

1. [Canonical repository](https://github.com/drupal/drupal) — project description, links to docs/change records/security and extension ecosystem.
2. [Drupal core releases](https://www.drupal.org/project/drupal/releases) — observed current releases, security support statements, release channel.
3. [Drupal security advisories](https://www.drupal.org/security) — core and contributed advisory stream.
4. [Drupal User Guide](https://www.drupal.org/docs/user_guide/en/index.html) — modeling, multilingual, deployment, backups and maintenance topics.
5. [Core JSON:API module documentation](https://www.drupal.org/docs/core-modules-and-themes/core-modules/jsonapi-module) — API design, supported operations and limitations.
6. [Core Content Moderation documentation](https://www.drupal.org/docs/8/core/modules/content-moderation/overview) — editorial moderation workflow.
7. [Core Workflows overview](https://www.drupal.org/docs/8/core/modules/workflows/overview) — workflow transitions for revisionable content.
8. [Drupal core license file (11.x)](https://git.drupalcode.org/project/drupal/-/blob/11.x/LICENSE.txt) — exact core license text; check pinned release.
9. [Drupal core security advisory process](https://www.drupal.org/security-team) — reporting/security-team process.
10. [RTL documentation (Drupal 7)](https://www.drupal.org/docs/7/theming/working-with-css/supporting-right-to-left-rtl-languages) — historical RTL evidence only; not proof for current core.
