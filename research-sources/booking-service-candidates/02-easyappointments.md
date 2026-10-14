# Easy!Appointments — evidence note

- **Checked date:** 2026-10-14
- **Candidate class:** Appointment-based service-provider booking
- **Repository:** https://github.com/alextselegidis/easyappointments
- **Site:** https://easyappointments.org/
- **Rubric:** Repository evaluation rubric, 100 points

## Decision findings

**Easy!Appointments is a credible self-hosted appointment-booking product, but it is not a service marketplace.** The verified core models customers, services, providers, secretaries, schedules, and appointments; it does not evidence a multi-vendor marketplace with vendor onboarding, public provider discovery/search, commissions, payouts, or platform-level order routing. The product is therefore useful as a reference or as a bounded scheduling component, not as So7ob's Booking & Service Marketplaces catalog's marketplace base.

The discovery caveat is reproduced in substance and partly verified: **the core is GPLv3; the official site advertises Easy!Appointments 1.6.1 Beta; and the product is self-hosted booking for services/providers.** The site also advertises premium services. The “marketplace” implication is not substantiated: official descriptions consistently present one installation in which a business manages its own services and providers, not a network marketplace. [1] [2] [13] [14]

As of the checked date, the repository has a stable **1.6.0** release dated 2026-05-27 and a **1.6.1-beta.1** tag dated 2026-09-07; the project site's “1.6.1 Beta is available for testing!” statement is consequently current and reproducible. The checked `main` history contains commits through 2026-10-06. [6] [13] [15] The main branch's `composer.json` still declares package version **1.5.2**, which conflicts with the 1.6.x tags and should be resolved before packaging or dependency/audit automation. [4] [6]

**Recommendation: `reference_only`.** Keep it as an architecture and feature reference, or evaluate it only for a single-operator/team booking component. Do not adopt it as the marketplace core without first proving a separate marketplace layer and passing the gates below.

## Use-case fit and limitations

### Fit

The verified booking workflow covers appointment and customer management, service/provider organization, working plans and booking rules, Google Calendar synchronization, email notifications, multiple languages, dedicated booking links, multiple attendants, REST API access, and webhooks. The feature page says a provider has an individual schedule and that customers can book, modify, or cancel within configured windows. [2] [14] The 1.6.0 release adds Jitsi meeting links, Google Meet support, ALTCHA CAPTCHA, request-method checks, stronger privacy/GDPR controls, and CalDAV improvements. [6] [16]

This is a reasonable fit for a salon, clinic-like non-regulated scheduling workflow, consultant, education provider, event organizer, or a team that owns its service catalog. It also offers a practical integration seam: JSON REST endpoints cover availability, appointments, customers, services, service categories, providers, secretaries, settings, and related resources, with Basic Authentication or a configured Bearer API key. [10] [11]

### Limitations and boundaries

This is **booking software, not a marketplace**. The documented resources expose providers and services inside an installation, but there is no verified core concept for independent vendor accounts, vendor approval, vendor storefronts, marketplace-wide search/ranking, commission calculation, split payments, seller payouts, dispute handling, or cross-vendor checkout. [10] [11] A So7ob marketplace would need to own those concepts and connect to Easy!Appointments through a separate service or custom fork.

The product site markets premium managed hosting, installation, upgrade, migration, support contracts, customization, and white-labeling. Those are commercial services around the GPL core, not evidence that those marketplace capabilities exist in the core. The evidence reviewed does not define a paid plugin/extension catalog or establish which advertised “SMS, payments, reports, reminders, 3rd party integrations” are core, configuration, custom work, or premium offerings; treat them as unverified until the specific implementation and license are identified. [1] [2] [13]

The API is administrator-oriented and the examples include credentials and broad CRUD resources. A marketplace-facing API would need a separate authorization model, tenant isolation, vendor-scoped permissions, idempotency, payment boundaries, and audit controls. The documentation itself warns to use HTTPS because credentials are sent with requests. [10] The production installation is conventional Apache/Nginx plus PHP and MySQL; it is not a managed, multi-tenant marketplace service. [2] [8] [17]

## License and commercial-service boundary

The repository includes the full **GNU GPL version 3** text, and both `composer.json` and `package.json` identify GPL-3.0. The README distinguishes **code: GPL v3.0** from **content: CC BY 3.0**. [3] [4] [5] This is clear enough to pass the evidence portion of the license gate, but it is not a blanket commercial approval: use, modification, linking, distribution, hosted deployment, notices, and any separately licensed assets need legal review for So7ob's actual architecture. GPL/AGPL obligations must be assessed from the use and distribution facts rather than inferred from a public repository.

The official site states that the open-source application can be installed for commercial use and separately advertises premium installation, managed hosting, support, migration, customization, and white-label services. Those statements establish a commercial-services boundary, not a proprietary core. [13] No evidence reviewed establishes that third-party plugins or future premium features share the core GPL license; do not assume compatibility.

## Security and dependencies

The repository has a short vulnerability-reporting policy directing researchers to `info@easyappointments.org` and promising prompt handling. It does not document a supported-version matrix, response-time SLA, CVE feed, or public security-advisory process. [7] The 1.6.0 changelog records multiple security and privacy fixes, including request-method validation, a public-message script-injection fix, provider authorization fixes, a CalDAV SSRF/internal-network safety fix, Google Calendar account-isolation fixes, and reduced customer-data exposure. [6] These are positive maintenance signals, but the note cannot independently establish that every historical vulnerability has been disclosed or that the current beta has a clean security posture.

`composer.json` requires PHP >=8.2 plus extensions and packages including Google API client, Guzzle, HTMLPurifier, Monolog, PHPMailer, Sabre VObject, Symfony Finder, and PHPUnit; `package.json` contains a Node >=14 engine declaration and browser/build dependencies. The project has both Composer and npm lockfiles in the repository. [4] [5] The CI workflow, however, runs on push only, installs PHP 8.3, uses `composer update` rather than a locked install, and runs PHPUnit. That is useful but not a fully reproducible dependency or release-security pipeline. [18]

**Adoption security gates:** pin and audit the exact release dependency graph; run a current PHP/Composer/npm vulnerability scan; review the complete 1.6.1 beta versus stable release diff; verify HTTPS, secret handling, rate limits, CAPTCHA, email, CalDAV egress restrictions, and tenant/role authorization in a threat model; and obtain legal review of GPL obligations and any external integrations.

## Maintenance status

Maintenance is active and recent: the repository's checked `main` history reaches 2026-10-06 with dependency-update merges, while stable 1.6.0 was released 2026-05-27 and beta 1.6.1-beta.1 on 2026-09-07. [6] [15] This is stronger evidence than GitHub stars. The caveat is that the active branch is ahead of the stable release and the package version field is stale at 1.5.2; production selection must be by an immutable release/tag and verified build artifacts, not by an unpinned branch. [4] [6]

## Deployment and architecture

Production documentation specifies Apache 2.4+ or Nginx, PHP 8.2+, and MySQL; installation is a file upload/configuration/setup-wizard flow with a writable `storage` directory. [2] [8] A Docker Compose environment is provided for development, and the project points to an official Docker repository for production images. The repository's Docker documentation explicitly says its local compose setup is for development only. [9] [17]

The source tree shows a conventional PHP web application split into `application` controllers/models/views/configuration and a `system` framework/runtime area, with frontend assets built through npm/Gulp and Bootstrap-era browser dependencies. The API/OpenAPI boundary and language-folder structure provide useful reuse points, but the evidence does not show a separately deployable domain-service architecture or native multi-tenant isolation. [1] [5] [11]

**Operational gate:** reproduce a pinned stable release, run migrations on a disposable database, validate backup/restore and upgrade rollback, configure web-server authorization-header forwarding, and verify that the production image and PHP/MySQL versions are supported. Do not use the development Docker compose file as a production deployment. [8] [9] [10]

## Documentation and testing

Documentation covers installation, Docker development, updates, translation management, REST API behavior, and an OpenAPI file. The API documentation specifies authentication, HTTP methods, filtering, pagination, related-resource expansion, and CRUD examples. [8] [9] [10] [11] The repository contains a PHPUnit configuration and a CI workflow. [18]

Testing evidence is limited: the checked tree contains a PHPUnit base case and two unit-test files (`ArrayHelperTest.php` and `ValidationHelperTest.php`), with no evidence in the reviewed files of broad end-to-end booking, authorization, migration, integration, browser, or marketplace tests. [18] This is adequate for a cautious component evaluation, not proof of production readiness for a multi-tenant marketplace.

## Integrations and APIs

Core and documented integrations include Google Calendar, CalDAV, LDAP/Active Directory, email/SMTP, webhooks, Matomo analytics, Jitsi, Google Meet, ICS/calendar exchange, and REST/OpenAPI. The 1.6.0 changelog and official release post are the primary evidence for recent Jitsi, Google Meet, CAPTCHA, webhook/security and CalDAV changes. [6] [16] The API uses JSON, Basic Authentication or a configured Bearer API key, and standard GET/POST/PUT/DELETE operations. [10] [11]

The integration surface is promising for a booking component, but the reviewed material does not establish stable semantic versioning for the API, backward-compatibility guarantees, webhook retry/signature semantics for every event, or marketplace/payment-provider adapters. The OpenAPI file labels itself version 1.0.0 while its documentation applies to v1.6.0, so consumers should contract-test the exact target tag. [10] [11]

## Arabic, i18n, and RTL

Internationalization is real: each language has its own folder and `translations_lang.php`, and the repository contains an Arabic language folder with Arabic translations. The project documents how to copy/register languages and submit translation changes. [12] [20] The official features page claims more than 21 community-maintained languages. [14]

Arabic support is **not equivalent to verified full RTL support**. A code search of the checked tree found a targeted `.ui-timepicker-rtl` style but no documented global RTL/bidi mode or Arabic-specific layout/test guarantee. The Arabic locale files are evidence of translated strings, not proof that every backend/public screen, email, calendar, date picker, and mixed-direction field renders correctly. Score this as partial/uncertain and require an Arabic UX pass with real booking, backend, email, and mobile scenarios before adoption.

## Scored criteria (100-point rubric)

**Weighted screening rubric (100 points; criterion scores are provisional and class-specific):**

- **Feature completeness and domain fit — 12/20:** Strong single-business appointment/service/provider coverage; no verified marketplace primitives. [10] [14]
- **Architecture and reuse quality — 10/15:** Conventional source separation, REST/OpenAPI, language folders and integrations; no evidence of native tenant/marketplace boundaries. [1] [11]
- **Development activity and maintenance — 13/15:** Recent dependency commits, 1.6.0 stable release, and 1.6.1 beta; stale package version and beta/stable split reduce certainty. [4] [6] [15]
- **Security and dependency quality — 9/15:** Security policy, recent hardening/fixes, lockfiles and CI; no public advisory matrix and CI uses `composer update`. [6] [7] [18]
- **Documentation and testing — 8/10:** Good installation/API/OpenAPI/Docker docs and CI; only limited unit-test evidence reviewed. [8] [9] [10] [11] [18]
- **License clarity and suitability — 8/10:** GPLv3 is explicit in the license/manifests; commercial use is advertised, but copyleft and third-party asset review remain required. [3] [4] [5] [13]
- **Setup and deployment — 4/5:** Straightforward Apache/Nginx + PHP/MySQL and official Docker packaging; development compose is not production and upgrades are operational work. [8] [9] [17]
- **Integrations and APIs — 4/5:** REST/OpenAPI, calendar/CalDAV, LDAP, webhooks and meeting integrations; contract/version guarantees and marketplace payments are unverified. [6] [10] [11]
- **i18n, Arabic and RTL — 3/5:** Arabic locale and translation architecture verified; full Arabic completeness and global RTL behavior are not verified. [12] [20]

**Score midpoint: 71/100.**

**Score range: 63–78.** The midpoint treats the observed evidence as a cautious component assessment. The low end reflects plausible downside from the stale package version, limited test breadth, lack of a documented public advisory/support matrix, uncertain API/webhook compatibility guarantees, and absent proof of full RTL behavior. The high end assumes those operational gaps are closed in a pinned release and that So7ob supplies the missing marketplace, tenancy, payments, and vendor-governance layer. The known product-class mismatch is not treated as an “unknown” and is already penalized in domain fit; unknown evidence is not scored as verified support.

## Confidence and recommendation

**Confidence: medium.** Primary repository files, release history, official documentation, OpenAPI, security policy, and official site claims were checked on 2026-10-14. Confidence is reduced by the beta/stable split, the stale `composer.json` version, limited tests, the lack of a public security-advisory matrix, and no verified full RTL behavior.

**Recommendation: `reference_only`.** Easy!Appointments can inform So7ob's booking-domain design and could be evaluated as a separately isolated scheduler for providers who belong to one tenant. It should not be adopted as the Booking & Service Marketplaces catalog's marketplace foundation. Reconsider only after an explicit marketplace adapter/tenant architecture, legal GPL review, pinned-release security review, contract tests for API/webhooks, production deployment rehearsal, and Arabic/RTL acceptance testing are complete.

## References

[1]: https://github.com/alextselegidis/easyappointments "Easy!Appointments canonical repository"
[2]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/README.md "Easy!Appointments README"
[3]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/LICENSE "GNU General Public License v3.0 in Easy!Appointments"
[4]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/composer.json "Easy!Appointments Composer manifest"
[5]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/package.json "Easy!Appointments npm manifest"
[6]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/CHANGELOG.md "Easy!Appointments changelog"
[7]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/.github/SECURITY.md "Easy!Appointments security policy"
[8]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/docs/installation-guide.md "Easy!Appointments installation guide"
[9]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/docs/docker.md "Easy!Appointments Docker documentation"
[10]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/docs/rest-api.md "Easy!Appointments REST API documentation"
[11]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/openapi.yml "Easy!Appointments OpenAPI specification"
[12]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/docs/manage-translations.md "Easy!Appointments translation management"
[13]: https://easyappointments.org/ "Easy!Appointments official project site"
[14]: https://easyappointments.org/features/ "Easy!Appointments official features"
[15]: https://github.com/alextselegidis/easyappointments/releases "Easy!Appointments GitHub releases"
[16]: https://easyappointments.org/blog/easyappointments-v1-6-0-release/ "Easy!Appointments v1.6.0 release announcement"
[17]: https://github.com/alextselegidis/easyappointments-docker "Easy!Appointments official Docker repository"
[18]: https://github.com/alextselegidis/easyappointments/blob/main/.github/workflows/ci.yml "Easy!Appointments continuous-integration workflow"
[20]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/application/language/arabic/translations_lang.php "Easy!Appointments Arabic translation file"
[21]: https://github.com/alextselegidis/easyappointments/commits/main/ "Easy!Appointments main-branch commit history"
