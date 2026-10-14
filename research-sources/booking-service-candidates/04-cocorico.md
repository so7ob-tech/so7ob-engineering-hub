# Cocorico — evidence note

**Checked date:** 2026-10-14  
**Candidate class:** Service and rental marketplace with booking/availability flows  
**Repository:** https://github.com/Cocolabs-SAS/cocorico  
**Site:** https://cocorico.io/

## Decision findings

Cocorico is a real open-source marketplace product, not merely a booking widget. The repository describes an open-source platform for collaborative-consumption marketplaces, with listings, asker/offerer roles, booking requests, availability/time rules, fees, refunds, messaging, administration, and payment-provider flows evidenced in the source and documentation. [1] [2] [11] [12] [29] It is therefore a strong historical domain match for a service/rental marketplace catalog.

The material discovery caveat is preserved in substance: **“MIT legacy marketplace repo; last push in 2021 and README directs to separate commercial successor Second.”** The first two parts reproduce from primary sources: the repository is MIT-licensed and the GitHub API reports the latest code push as 2021-10-19, while the latest commit endpoint shows the last commit as 2021-02-09. [3] [4] The wording about the README is not reproduced literally: the current README still presents Cocorico as the open-source platform and links to its documentation, while the current repository description says Cocorico “has evolved into Second”; the README itself does not name Second. [2] [3] This is a material source conflict, not a reason to treat the commercial Second service as the same codebase.

The recommendation is **reference_only**. Cocorico is useful for product and architecture study, and could inform a controlled fork investigation, but it is not a sensible fresh production base without a substantial modernization and security program. The repository's last code push, old PHP/Symfony baseline, absent security policy, old CI, and roadmap items such as “APIfication” and “Upgrade to Symfony 4” make current operational support and public API readiness unverified. [3] [6] [16] [20] [21]

## Use-case fit and limitations

**What fits.** This is a marketplace application with a booking product embedded in it. It supports listings, search and booking requests, offerer acceptance, asker/offerer dashboards, time-unit modes for day/night/hour bookings, date/time availability, booking acceptance and expiration delays, transaction fees, cancellation/refund rules, bank wires, notifications, and administrative workflows. The time documentation explicitly covers day, night, and hour modes and booking expiration parameters. [11] The pricing documentation covers platform fees, VAT handling, and flexible/strict cancellation refunds. [12] The checked-in BDD context exercises a new booking, payment-card data, offerer acceptance, emails, and booking totals. [29]

That makes Cocorico applicable to peer-to-peer rentals, appointment-like services, equipment/space rentals, and other two-sided services where an operator needs listing supply, availability, a request/accept flow, and transaction accounting. It is not evidence of a ready-made vertical such as healthcare, travel, or regulated procurement; those workflows would require domain design and specialist review.

**What does not fit without work.** Cocorico is a monolithic Symfony 3.4 application with a server-rendered Twig/front-end integration workflow, SQL plus MongoDB persistence, cron-driven booking jobs, and a sizeable vendor bundle set. [6] [14] [27] It is not verified as a modern headless marketplace, a maintained SaaS, or a current API-first product. The roadmap explicitly lists “APIfication” and architectural decoupling/externalization as roadmap work, which is evidence that a public API and looser boundaries were not established as a finished core capability in this line. [21]

Core marketplace and booking behavior should be distinguished from optional or bundle-dependent features. Required cron jobs handle currency updates, booking expiration/validation, bank-wire checks, and booking alerts; optional jobs depend on bundles for search notation, SMS, listing alerts, SEO sitemap generation, and deposit refunds. [13] The documentation also calls out external Google Maps, Microsoft Translator, and Facebook Login accounts. [19] Those are integration/configuration dependencies, not proof that every deployment includes or can operate them safely by default.

## Technology and architecture

The project is a PHP Symfony application. `composer.json` identifies version `0.15.1`, requires PHP `^7.1` and Symfony `^3.4`, and includes Doctrine ORM and MongoDB ODM, Sonata administration, JMS i18n routing/translation, OAuth, Guzzle, geocoding, image, messaging, and currency bundles. [6] The lockfile pins examples such as Symfony `v3.4.36`, Doctrine ORM `v2.5.13`, MongoDB ODM bundle `3.4.1`, Guzzle `6.3.0`, HWI OAuth `0.5.3`, and Sonata Admin `3.28.0`; the locked package timestamps are mostly 2016–2019. [30]

The source is organized into Symfony bundles under `src/Cocorico`, with application configuration, web assets, Twig views, domain entities, controllers, commands, and tests. A PHPUnit configuration targets bundle test directories, and the repository contains Behat contexts/features for end-to-end flows. [18] [29] The architecture has meaningful bundle-level seams and configurable parameters, but the old standard-edition roadmap still calls for decoupling, externalization, overridability, and APIfication. [21] That supports a **moderate reuse value for a fork or reference implementation**, not a claim of clean modern service boundaries.

## Deployment and operations

The official documentation supports manual Linux/Windows installation and a separate official Docker repository. Manual Linux deployment requires Apache 2 or Nginx, PHP 7.1 with extensions including MongoDB, MySQL, and MongoDB; the stated minimum is 2 GB RAM, 4 GB disk, and approximately 2 GHz CPU. [8] [10] The Docker repository provides a single container exposing HTTP, MySQL, MongoDB, and Supervisor ports, with host-mounted database directories. [9] That is convenient for exploration but is not, by itself, production hardening, isolation, backup, upgrade, or secret-management guidance.

Production deployment documentation uses an old DeployBundle workflow and `composer install --no-dev --prefer-dist --optimize-autoloader`, followed by Symfony cache and Assetic asset commands. [17] Required cron jobs are part of normal operations, so production correctness depends on scheduling and monitoring those jobs. [13] The setup is reproducible enough for a technical evaluation, but the PHP 7.1/Symfony 3.4 baseline and old installation instructions create a major operational gate in 2026.

## License

The repository contains a complete MIT license, with copyright `(c) 2014-2017, Cocolabs SAS`. It grants use, copying, modification, distribution, sublicensing, and sale subject to retaining the notice, with an “AS IS” warranty disclaimer. [7] The package metadata also declares MIT. [6] This is a clear license gate pass for the repository itself, subject to normal review of third-party bundle licenses and of any separate commercial Second service. MIT does not mean the commercial successor, hosted services, trademarks, or paid extensions are included in the repository.

## Security and dependencies

The repository has a committed `composer.lock` and its installation guide instructs operators to run SensioLabs `security:check` against that lockfile. [28] It also has an application security configuration file and uses standard Symfony authentication/OAuth components in the source. [32] These are positive historical controls, but they are not evidence of current vulnerability remediation.

The current GitHub security page says **“No security policy detected”** and that the project has not set up a `SECURITY.md` file. [20] The only visible CI configuration is an old Travis job for PHP 7.1 and 7.2 that performs PHP syntax linting; it does not show a current dependency audit, SAST, tests, release signing, or maintained security pipeline. [16] The locked runtime and dependencies are substantially old, including PHP 7.1, Symfony 3.4.36, Guzzle 6.3.0, and several 2016–2017 package versions. [6] [30] I found no primary-source evidence in the repository or GitHub security page that current high-impact vulnerabilities have been assessed or that a supported security branch exists. This is an adoption blocker until a fresh dependency/SAST/penetration review and an owner-backed patch plan are documented.

## Maintenance status

The GitHub API reports the repository as public and not archived, but its latest code push is `2021-10-19T14:17:28Z`; the latest commit endpoint begins with a 2021-02-09 “Fix and enhance cache clear in ConfigBundle” commit. [3] [4] The only release returned is `v0.15.1`, published `2020-07-09`, after `v0.15.0` published in 2019. [5] The branch endpoint shows only `master` and `0.15`, both pointing to the 2021 commit, and the repository description now points users toward Second. [23] The API's 2026 `updated_at` value therefore should not be interpreted as fresh code maintenance; it can coexist with the separately reported 2021 `pushed_at`.

The changelog labels `0.15.1` as 2020-07-07 and records Symfony 3.4/PHP 7.1-era changes; the roadmap still lists Symfony 4, translation, architectural, and APIfication work. [22] [21] The evidence supports **legacy/reference status**, not an actively maintained code candidate.

## Documentation and testing

Documentation is broad for its era: the index covers server/application installation, cron jobs, mail, translations, MongoDB, routing, parameters, prices, times, tests, deployment, troubleshooting, and virtual hosts. [10] The tests guide describes Behat browser tests using Selenium and test database setup; PHPUnit is configured to discover bundle tests and emit JUnit/coverage reports. [17] [18] The repository also contains booking-flow context code that checks amounts, card/payment steps, acceptance, emails, and success pages. [29]

The limitations are age and verification depth. The Travis file only runs PHP syntax linting on PHP 7.1/7.2, and the checked-in documentation refers to obsolete Selenium download URLs, an old `security-checker`, and demo credentials that must be changed. [16] [28] I did not treat the presence of test scaffolding as evidence that the full suite currently passes on a supported runtime.

## Integrations and APIs

Documented external integrations include Google Places/Maps/Geocoding, Microsoft Translator, and Facebook Login/OAuth. [19] The dependency manifest also includes Guzzle and OAuth/routing/translation components. [6] Payment-related source and tests reference MangoPay flows, card payments, bank wires, wallets, and transfers; the pricing and cron documents describe bank-wire checking and refund processing. [12] [13] [29]

There is no verified public REST/OpenAPI/Swagger contract in the repository documentation. The integration document is primarily an HTML-to-Twig asset-integration guide, not an API specification. [27] The roadmap's explicit “APIfication” item is a warning against scoring a modern API as present. [21] A new So7ob implementation would need an API inventory/contract, webhooks and idempotency design, provider credential rotation, and current payment-provider compatibility testing.

## Arabic, i18n, and RTL

There is a localization architecture: Cocorico texts live under `app/Resources/translations` and use JMSTranslationBundle; user content can be translated manually or through Microsoft Translator, and routes use JMS i18n routing. [15] The checked-in translation files show English/French-era coverage, and the documentation does not verify Arabic strings, locale completeness, Arabic content QA, bidi CSS, or RTL layout behavior. [15] The source includes a UTF-8 meta tag, but that is not RTL support. [31] Arabic and RTL are therefore **unknown/unverified**, not supported by assumption; Arabic coverage and RTL acceptance tests are required before any regional adoption.

## Scored criteria (100-point rubric)

**Weighted screening rubric (100 points; criterion scores are provisional and class-specific):**

- **Feature completeness and domain fit — 17/20:** Core two-sided marketplace, listings, availability, booking, fees/refunds, messaging, and admin workflows fit the candidate class; regulated/vertical workflows and some advanced capabilities are not established. [2] [11] [12] [30]
- **Architecture and reuse quality — 9/15:** Symfony bundle decomposition, configuration, and extension points are useful, but the legacy monolith and roadmap items for decoupling/APIfication limit reuse confidence. [6] [21]
- **Development activity and maintenance — 1/15:** Last code push is 2021-10-19, latest release is v0.15.1 from 2020, and current description redirects to Second. [3] [4] [5]
- **Security and dependency quality — 2/15:** Lockfile and historical security-check instructions exist, but there is no SECURITY.md, current CI/security evidence, or supported modern runtime; current exposure is unknown. [6] [16] [20] [28]
- **Documentation and testing — 6/10:** Extensive era-appropriate docs, Behat/PHPUnit scaffolding, and booking contexts exist; current execution/pass status is not verified and some instructions are obsolete. [10] [16] [17] [18]
- **License clarity and suitability — 10/10:** Complete MIT text and package metadata are clear; third-party and commercial-successor boundaries still need normal legal review. [6] [7]
- **Setup and deployment — 3/5:** Manual install and official Docker instructions exist, but old runtime, multi-database/cron operations, and single-container defaults are not production-ready by themselves. [8] [9] [13]
- **Integrations and APIs — 2/5:** Google, Microsoft, Facebook/OAuth, and MangoPay-era integrations are evidenced, but no maintained public API contract is verified and APIfication remains roadmap work. [6] [19] [21] [29]
- **i18n, Arabic and RTL — 1/5:** Translation architecture is real, but Arabic coverage and RTL behavior are absent from the verified evidence. [15] [31]

**Score midpoint: 51/100.**

**Score range:** **43–59**. The midpoint does not treat unknown evidence as support. The low end reflects plausible downside from an unresolved dependency/security audit, current-runtime incompatibility, incomplete API/payment integration work, and Arabic/RTL gaps. The high end gives limited credit for the possibility that a controlled fork or commercial successor supplies undocumented integrations, stronger security operations, or more localization; those possibilities are not evidence for the open-source repository and cannot lift the recommendation without verification.

## Confidence and recommendation

**Confidence: medium-low.** Core product scope, license, version, dates, deployment instructions, test scaffolding, and security-policy absence are supported by canonical repository files and GitHub APIs. Confidence is reduced by the legacy codebase, the source conflict between the old README and the current repository description, lack of a current security policy, lack of a verified API contract, and unverified Arabic/RTL behavior.

**Recommendation: `reference_only`.** Keep Cocorico as a historical reference for marketplace entities, availability/booking state transitions, fee/refund semantics, and operational cron requirements. Do not adopt it as So7ob's production base or infer that the commercial Second platform is included. If So7ob nevertheless opens a fork evaluation, gates should be: (1) legal review of MIT plus all external bundles and confirmation that the target is the open-source code, not Second; (2) dependency/SAST/penetration review and a supported PHP/Symfony modernization plan; (3) reproducible deployment with isolated SQL/MongoDB, secret management, backups, monitoring, and cron/job observability; (4) an explicit REST/webhook/idempotency contract; (5) provider/payment regression tests; and (6) Arabic translation completeness plus RTL visual and accessibility tests.

## References

[1]: https://github.com/Cocolabs-SAS/cocorico "Cocorico canonical GitHub repository"
[2]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/README.md "Cocorico README"
[3]: https://api.github.com/repos/Cocolabs-SAS/cocorico "GitHub repository metadata for Cocorico"
[4]: https://api.github.com/repos/Cocolabs-SAS/cocorico/commits?per_page=5 "Cocorico commit history API"
[5]: https://api.github.com/repos/Cocolabs-SAS/cocorico/releases?per_page=10 "Cocorico releases API"
[6]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/composer.json "Cocorico composer manifest"
[7]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/LICENSE "Cocorico MIT license"
[8]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/installation-server-linux.md "Cocorico Linux server installation"
[9]: https://github.com/Cocolabs-SAS/cocorico-docker "Official Cocorico Docker repository"
[10]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/index.md "Cocorico documentation index"
[11]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/times.md "Cocorico times and booking expiration documentation"
[12]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/prices.md "Cocorico prices, fees, VAT, and refunds documentation"
[13]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/crons.md "Cocorico required and optional cron jobs"
[14]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/mongodb.md "Cocorico MongoDB availability storage documentation"
[15]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/translations.md "Cocorico translation documentation"
[16]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/.travis.yml "Cocorico Travis CI configuration"
[17]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/tests.md "Cocorico BDD testing documentation"
[18]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/phpunit.xml.dist "Cocorico PHPUnit configuration"
[19]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/services-creation.md "Cocorico external service account setup"
[20]: https://github.com/Cocolabs-SAS/cocorico/security/policy "Cocorico GitHub security policy page"
[21]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/ROADMAP.md "Cocorico roadmap"
[22]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/CHANGELOG.md "Cocorico changelog"
[23]: https://api.github.com/repos/Cocolabs-SAS/cocorico/branches?per_page=100 "Cocorico branches API"
[24]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/installation-application.md "Cocorico application installation"
[25]: https://cocorico.io/ "Cocorico/Second official site"
[26]: https://www.scnd.com/ "Second official commercial platform site"
[27]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/integration.md "Cocorico HTML-to-Twig integration guide"
[28]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/installation.md "Cocorico legacy installation and security-check instructions"
[29]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/features/BookingContext.php "Cocorico booking BDD context"
[30]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/composer.lock "Cocorico locked dependency versions"
[31]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/app/Resources/views/base.html.twig "Cocorico base template and UTF-8 declaration"
[32]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/app/config/security.yml "Cocorico application security configuration"
[33]: https://api.github.com/repos/Cocolabs-SAS/cocorico/tags?per_page=100 "Cocorico tags API"
