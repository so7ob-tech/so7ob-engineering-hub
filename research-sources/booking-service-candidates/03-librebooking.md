# LibreBooking evidence note

- **Checked date:** 2026-10-14
- **Candidate:** LibreBooking (`librebooking`)
- **Candidate class:** Resource and appointment reservation
- **Repository:** https://github.com/LibreBooking/LibreBooking
- **Official documentation:** https://librebooking.readthedocs.io/en/latest/
- **Evaluation status:** **limited** — primary-source evidence is sufficient to assess LibreBooking as a maintained resource-booking product, but it is not a marketplace and the evidence does not substantiate provider/merchant onboarding, a public service catalog, marketplace discovery, commissions, or multi-party settlement.

## Decision findings

LibreBooking is a self-hosted, open-source resource scheduling and reservation application. The official repository describes multi-resource booking and waitlists, role-based access control, quotas and credits, reporting, a responsive Bootstrap 5 interface, themes, a plugin-ready architecture, and Outlook/Thunderbird calendar integration through ICS. It explicitly says the project is a fork of Booked Scheduler based on Booked's last open-source release in 2020, and that LibreBooking has since diverged. [1]

The supplied discovery description is substantially reproducible, with one qualification: the repository identifies the license as **GPL-3.0-only** and the documentation says GPL-3.0, rather than merely an informal “GPLv3”; it is a maintained fork of Booked and a general resource scheduler; and both the repository and official docs contain prominent security-upgrade notices. [1] [2] The latest release visible on the checked date is **v7.1.0, released 2026-10-13**. [3]

This is a good technical fit for internal or organizational rooms, equipment, desks, labs, calendars, appointments, quotas, approval workflows, waitlists, and resource utilization reporting. It is not evidence of a Booking & Service Marketplace: no verified provider onboarding, provider storefronts, cross-provider search/ranking, marketplace checkout, commission ledger, payout/settlement, or consumer service-discovery workflow was found in the core documentation or repository evidence reviewed. Payment-related code/dependencies do not establish a marketplace payment or settlement system. Treat it as a booking engine/reference architecture, not as a marketplace foundation without substantial product and domain work.

## Use-case fit and limitations

**Strong or plausible core fit:** administrators can model bookable resources, resource groups/types, schedules, users and groups; users can make resource reservations; the feature list claims multi-resource booking, waitlists, quotas/credits, usage reporting, RBAC, and calendar feeds. The API documentation covers accounts, attributes, groups, reservations, resources, schedules, users, and accessories. [1] [7] This maps well to a managed inventory of bookable assets and appointment slots.

**Important limitations:** the verified product model is organization/resource-centric, not a two-sided marketplace. The repository's own feature description does not claim provider profiles, service listings, availability aggregation across independent providers, marketplace search, reviews, commissions, payouts, or consumer/provider role separation. ICS, OAuth2, SAML, LDAP/Active Directory, and REST APIs are integrations around the scheduler, not marketplace capabilities. [7] [9] [10]

**Paid extensions and boundaries:** no official evidence was found of a paid edition, paid plugin catalog, or commercially operated hosted service in the reviewed primary sources. The core is GPL software; community or third-party support/hosting would be separate services, not proof of core functionality. Stripe appears as a code dependency, but that alone does not prove an end-to-end marketplace checkout, payment capture, refund, split payout, or reconciliation workflow. [6]

## License and commercial-service boundary

The repository's Composer manifest declares `GPL-3.0-only`, and the repository includes the full GNU GPL version 3 text. [5] [6] GPLv3 permits running and charging for copies, but distribution of covered modified works carries copyleft, source-code and notice obligations; the license also states that mere network interaction without transfer of a copy is not conveying. [5] These facts require legal review for So7ob's intended deployment, modification, distribution, and any SaaS/container distribution model. A public GitHub repository is not by itself permission to ignore GPL obligations.

No primary-source evidence reviewed establishes an official LibreBooking commercial SaaS, SLA, support contract, managed marketplace, or vendor-backed hosted service. The repository says it is maintained by a small volunteer team. [4] Community Discord, issues, plugins, and third-party hosting should be treated as community/service layers rather than part of the core product unless separately contracted and verified.

## Security and dependencies

Security is a material adoption gate. The repository and official docs warn that **all versions before 7.1.0** contain a critical unauthenticated account-takeover path through a forged `Remember Me` cookie, including administrator impersonation; the fix is not backported and **7.1.0 removes the `Remember Me` option**. They also warn that versions before 7.0.0 had a critical administrator-takeover vulnerability involving `Web/install/migrate.php`, with no fixes for 6.x or earlier. [1] [2] On the checked date, only 7.1.0 should be considered for evaluation, and an installation must have a documented upgrade/incident-check plan.

The security policy says only the latest release is supported, fixes are published in new releases rather than backported, and the stated supported version is 7.1.0. It provides a private vulnerability-reporting route, says the project is maintained by a small volunteer team with an expected 2–5 day initial response, and does not request or coordinate CVE IDs. [4] The policy's administrator trust model also says administrators can change configuration, users, resources, schedules, templates, and content shown to users or sent by email, so administrator accounts must be treated as highly privileged. [4]

The Composer manifest requires PHP >=8.2 and pins/ranges packages including Smarty 5.8, Stripe PHP 22, Monolog 3.12, Google reCAPTCHA, Google API client, Microsoft Graph, Facebook Graph SDK, Sabre VObject, PHPMailer 7.1, Symfony HTML Sanitizer 7.4, LDAP support, and other libraries; developer dependencies include PHPUnit 11.3, PHPStan 2.2, PHP CS Fixer, PHP_CodeSniffer, and PHPCompatibility. [6] A lockfile is present in the repository, and recent release notes show dependency updates and security hardening, including rich-text sanitization and fixes for unsafe redirects and attachment XSS. [3] [16] I did not independently run a dependency vulnerability audit, reproduce the historical exploits, or verify that every transitive dependency is currently free of reachable CVEs; this remains an adoption gate.

## Maintenance

Maintenance evidence is strong but volunteer-capacity risk remains. Release history shows v6.0.0 on 2026-10-01, v6.1.0 on 2026-10-03, v7.0.0 on 2026-10-06, and v7.1.0 on 2026-10-13. Those releases include feature, bug-fix, testing, documentation, dependency, and security changes. [3] The checked `develop` branch had a latest commit on 2026-10-13 updating `smarty/smarty` from 5.8.4 to 5.8.5. The repository includes Dependabot configuration, GitHub workflows, release automation, issue-stale automation, and contribution guidance, but the project itself characterizes the maintainer group as small and volunteer. [4] [6]

## Deployment and architecture

LibreBooking is a PHP web application with a MySQL/MariaDB database and a server-rendered web surface. The repository's deployment requirements are PHP >=8.2 with required extensions, Apache >=2.4, MySQL >=8.0 or MariaDB >=10.6, Composer, and optional LDAP/GD/BCMath extensions for relevant features. Apache is the supported/tested web server; Nginx and other servers may work with equivalent routing and access-control rules but are not currently supported or tested by the project. [1] [2]

The official installation guide requires the document root to point at the project directory rather than its `Web` subdirectory, requires the public URL to include `/Web/`, requires Composer installation, writable template/upload/log directories, and a configured database. It offers automated MySQL installation and manual SQL schema/data scripts. [8] This is reproducible but operationally more involved than a managed marketplace service, and the `/Web/` routing and writable directories need explicit hardening.

A separate official LibreBooking Docker repository provides an Apache/application image linked to MariaDB. Its run instructions expose database, install-password, timezone, script URL, logging, and optional path variables; persistent images and reservation attachments require mounts; and reminder/background services require a scheduler or a separate job container/host invocation. [14] [15] Container support improves repeatability, but production operations still require database backups, secret management, TLS/reverse-proxy configuration, job scheduling, persistent uploads, upgrade testing, and security monitoring.

The code is organized into domain/application/web/presenter/plugin areas and uses Composer PSR-4 autoloading for `LibreBooking\\` plus separate test autoloading. It includes explicit plugin families for authentication, authorization, export, permission, pre/post-reservation, and styling. [6] [13] This supports reuse, but the repository also retains a large legacy-style PHP tree and significant configuration/database coupling; an integration should prefer documented extension points and APIs rather than deep forks.

## Documentation and testing

Official documentation covers installation, basic/advanced configuration, API routes, OAuth2, SAML, LDAP/Active Directory, and Docker-oriented deployment links. [2] [7] [8] [9] [10] The API document is detailed: it describes enabling the API, authentication, JSON POST bodies, session-token/user-ID headers, and endpoints for resources, reservations, accounts, users, schedules, groups, attributes, and accessories. [7]

The repository contains PHPUnit configuration with application, domain, plugin, presenter, source, webservice, and integration suites. The Composer scripts include PHPUnit, PHP CS Fixer linting, PHPStan, integration tests, and configuration consistency checks; the tests tree includes domain, presenter, plugin, webservice, smoke, and database integration tests. [6] [13] Evidence establishes meaningful automated test infrastructure, but I did not execute the full suite or verify current CI pass/failure status on this evaluation date.

## Integrations and API

The documented API is a JSON-over-HTTP service under `/Web/Services/index.php`; secure calls authenticate first and then send `X-Booked-SessionToken` and `X-Booked-UserId` headers. It includes reservation/resource/account operations and ICS URLs in account responses. [7] This is usable for a So7ob adapter, but the legacy `Booked` header/route naming, trailing-slash requirements on some routes, installation-specific enablement, and session-token model should be isolated behind a connector and regression-tested.

The repository documents OAuth2 with an external IdP and attribute mapping for email, names, username, phone, organization, and title; it also documents SAML and has LDAP/Active Directory plugins. [9] [10] The SAML documentation explicitly warns that authenticated API methods do not work with SAML because browser redirects are required, so an integration cannot assume every authentication mode works for server-to-server API calls. [10] The README claims Outlook/Thunderbird integration through ICS, and the repository includes Google, Microsoft, Facebook, reCAPTCHA, Stripe, ICS/VObject, email, and Slack-related code/dependencies; each connector needs a focused implementation and security review. [1] [6]

## Arabic, i18n, and RTL

Arabic localization is present as `lang/ar.php`, and it contains Arabic UI strings while inheriting from the English language class. [11] The language directory contains many locale files, and the API model itself includes a user `language` field. [7] However, the Arabic file does not set an explicit RTL direction in the inspected constructor, while the Hebrew file explicitly sets `$this->TextDirection = 'rtl'`. [11] [12] I found no primary-source evidence that the Arabic UI has been visually validated for bidirectional layout, Arabic calendar/date conventions, mixed Arabic/Latin content, emails, PDFs/exports, or accessibility. Score Arabic translation as evidenced; score Arabic RTL behavior as **unknown/unverified**, not as full support.

## Security/operational adoption gates

1. Require **v7.1.0 or later** and verify the deployed commit/tag; do not deploy any pre-7.1.0 release because the official warning describes critical unauthenticated account takeover. [1] [3] 
2. Reproduce a clean install and upgrade in a staging environment, including database migrations, `/Web/` routing, Apache/reverse-proxy rules, writable directories, background jobs, backups, and restore tests. [8] [14] [15]
3. Run a current Composer lockfile/dependency audit and application security review, including admin-authored rich text, uploads, session cookies, SSO, API authentication, and reverse-proxy headers; document disposition for any high/critical finding.
4. Prove the required marketplace capabilities separately: provider onboarding, service catalog/search, provider availability, customer/provider permissions, checkout/refunds, commission and payout accounting, notifications, auditability, and Arabic RTL UX. Do not infer them from resource booking, Stripe dependency, ICS, or generic plugins.
5. Obtain GPLv3 legal review for any modified/distributed application, container, plugin, or bundled marketplace code, and define ownership/support obligations because only the latest release is supported and the maintainer team is small. [4] [5]

## Scored criteria (shared 100-point rubric)

Scores are provisional weighted points, with each value between zero and that criterion's maximum. The midpoint sums exactly to **70/100**.

**Weighted screening rubric (100 points; criterion scores are provisional and class-specific):**

- **Feature completeness and domain fit — 12/20:** Strong resource/appointment scheduler fit; not a verified marketplace and missing provider/catalog/settlement evidence.
- **Architecture and reuse quality — 10/15:** Composer/PSR-4 structure, domain/application layers, plugin families, APIs; legacy PHP/config/database coupling remains.
- **Development activity and maintenance — 12/15:** Releases 6.0.0–7.1.0 landed 2026-10-01 through 2026-10-13 with security/tests/features; small volunteer team and latest-release-only support reduce certainty.
- **Security and dependency quality — 9/15:** Security policy, lockfile, sanitizer and hardening work are positive; critical pre-7.1.0 history, no backports, and no independent current audit are material risks.
- **Documentation and testing — 8/10:** Detailed installation/API/SSO docs, PHPUnit suites, CI scripts; full current suite/CI outcome was not independently executed.
- **License clarity and suitability — 9/10:** Explicit GPL-3.0-only and full license text; commercial use is not automatically obligation-free and legal review is required.
- **Setup and deployment — 4/5:** Manual install and official Docker/MariaDB path exist; Apache/Web routing, writable paths, jobs, and operational hardening add complexity.
- **Integrations and APIs — 4/5:** Documented JSON API, ICS, OAuth2/SAML/LDAP/AD and connectors; SAML/API limitation and legacy authentication conventions matter.
- **Arabic/i18n/RTL — 2/5:** Arabic translation and broad locale architecture are evidenced; Arabic RTL layout/visual QA is not evidenced.

**Score midpoint: 70/100.**

The **62–76** range reflects uncertainty rather than treating unknown evidence as zero. The lower end allows for failed deployment/upgrade rehearsal, reachable dependency findings, API/SSO integration friction, or materially incomplete Arabic RTL behavior. The upper end assumes current dependencies and CI are clean, Docker/manual deployment is operationally repeatable, and Arabic can be completed with limited UI work. The marketplace capability gap is not an uncertainty bonus: it is a known product-boundary limitation and is already reflected in the feature/domain score.

## Confidence and recommendation

**Confidence: medium.** Current releases, license, security policy, deployment requirements, API documentation, test configuration, integrations, and Arabic source files were verified from canonical repositories/docs on 2026-10-14. Confidence is not high because the full test/CI and dependency audit were not run, Arabic RTL behavior is unverified, and volunteer support capacity and marketplace requirements are not established by repository evidence.

**Recommendation: `reference_only`.** LibreBooking is worth retaining as a reference implementation or evaluating for an internal resource-booking component. It should not be adopted as So7ob's Booking & Service Marketplace base without a separate marketplace architecture and a successful security/deployment/RTL proof of concept. If So7ob's scope is narrowed to an organization-owned resource/appointment reservation service, the recommendation can be revisited as a controlled `evaluate` candidate after the adoption gates pass.

## References

[1]: https://github.com/LibreBooking/LibreBooking "LibreBooking official repository README and project overview"
[2]: https://librebooking.readthedocs.io/en/latest/ "LibreBooking official documentation home"
[3]: https://github.com/LibreBooking/LibreBooking/releases "LibreBooking official releases and release notes"
[4]: https://github.com/LibreBooking/LibreBooking/blob/develop/SECURITY.md "LibreBooking security policy"
[5]: https://github.com/LibreBooking/LibreBooking/blob/develop/LICENSE.md "GNU General Public License version 3 text shipped by LibreBooking"
[6]: https://github.com/LibreBooking/LibreBooking/blob/develop/composer.json "LibreBooking Composer manifest, dependencies, autoloading, and test scripts"
[7]: https://github.com/LibreBooking/LibreBooking/blob/develop/docs/source/API.rst "LibreBooking API documentation"
[8]: https://github.com/LibreBooking/LibreBooking/blob/develop/docs/source/INSTALLATION.rst "LibreBooking installation and database setup documentation"
[9]: https://github.com/LibreBooking/LibreBooking/blob/develop/docs/source/Oauth2-Configuration.rst "LibreBooking OAuth2 configuration documentation"
[10]: https://github.com/LibreBooking/LibreBooking/blob/develop/docs/source/SAML-Configuration.rst "LibreBooking SAML configuration documentation"
[11]: https://github.com/LibreBooking/LibreBooking/blob/develop/lang/ar.php "LibreBooking Arabic language file"
[12]: https://github.com/LibreBooking/LibreBooking/blob/develop/lang/he.php "LibreBooking Hebrew language file showing RTL direction setting"
[13]: https://github.com/LibreBooking/LibreBooking/blob/develop/phpunit.xml.dist "LibreBooking PHPUnit test-suite configuration"
[14]: https://github.com/LibreBooking/docker "Official LibreBooking Docker repository"
[15]: https://github.com/LibreBooking/docker/blob/main/RUN.md "Official LibreBooking Docker run and background-job instructions"
[16]: https://github.com/LibreBooking/LibreBooking/blob/develop/CHANGELOG.md "LibreBooking changelog and security hardening history"
