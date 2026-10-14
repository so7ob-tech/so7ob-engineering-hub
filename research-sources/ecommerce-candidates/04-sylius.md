# Sylius (Sylius/Sylius) — evidence note

**Checked: 2026-10-14.** Scope: Symfony-based modular commerce platform as an e-commerce candidate for So7ob Tech. This is an evidence-based preliminary assessment; it is not a production-readiness or security certification.

## Verified facts

- Sylius identifies itself as an open-source e-commerce framework on Symfony. Its docs describe a headless framework and API-first/REST approach. The repository README identifies PHPUnit and Behat and instructs users to install via Composer. [1] [3]
- The repository's exact `LICENSE` file is MIT. It grants permission to use, copy, modify, merge, publish, distribute, sublicense, and sell copies, conditional on retaining the copyright and permission notice; it disclaims warranties/liability. This makes commercial reuse of the covered code generally permitted under MIT conditions, but does not establish rights to every third-party dependency, trademark, plugin, or separately licensed Sylius Plus feature. [2] [3]
- Official docs describe CE as free/MIT-licensed and Sylius Plus as a commercial edition layered on CE. Plus adds (among others) RBAC, multi-source inventory, B2B pricing and returns. [3]
- Official installation docs use PHP/Composer and npm or Yarn asset builds; show MySQL, MariaDB and PostgreSQL `DATABASE_URL` examples; require database setup, an interactive installer, frontend build, and optional async Messenger consumer. The guide recommends Supervisor for production consumer process management. [4]
- Sylius models Channels, locales, currencies, countries and zones. A Channel is a storefront; multiple channels may support distinct markets and sales contexts. Products, orders and customers belong to a Channel. Locale-based translation is documented. This evidences multi-channel commerce, not multi-vendor marketplace support. [5]
- GitHub release listing shows v2.3.1 and v2.2.11 entries (the listing fetch did not expose their dates); the 2.3 branch commit page showed commits dated Oct 14, 2026, including a version change to v2.3.2-DEV. [6] [7]
- GitHub repository security page lists multiple 2026 advisories, including high-severity JWT audience confusion and password-reset Host-header issues (Sep 2), as well as earlier IDOR/open redirect issues (Mar 9). Official policy asks reports to be sent to `security@sylius.com`, not posted publicly. The official March security blog enumerates multiple vulnerabilities and fixed-version thresholds. [8] [9] [10]
- README says full-stack BDD, PHPUnit and Behat; the docs provide a getting-started guide and installation/configuration documentation. This is evidence of test frameworks and docs existing, not a quantified test-coverage or quality assessment. [1] [4]
- The fetched official sources do not explicitly establish multi-vendor support, Arabic translations, RTL support, or Arabic storefront readiness. Generic locale/i18n capability is not evidence of Arabic/RTL completeness. [5]

## Assessment and unknowns

Sylius is a modular commerce framework, not a turnkey hosted store: it gives implementers a Symfony/PHP codebase and expects project-specific engineering, configuration, integrations, frontend decisions and operations. API capabilities make headless use viable, but no claim is made here about completeness of API coverage or production readiness. Setup combines PHP/Composer, database provisioning, frontend package/build tooling, environment configuration and potentially async workers. Deployment complexity is therefore moderate-to-high by inference; the docs do not provide a complete deployment architecture in the pages reviewed.

No primary source reviewed provides a verified star count at the check time. Exact latest commit timestamp is available only from the branch history; latest release date was not rendered by the release extraction. No project-specific independent security audit, compliance attestation, scalability benchmark, or proof of production suitability was established. Security advisories demonstrate active disclosure/fixing but also real historical vulnerabilities; they do not prove current security.

## Provisional score: 76/100 (criterion points summed during catalog integration)

- Feature fit **17/20** — core commerce, multi-channel, currencies/locales, API and B2B direction documented; no verified multi-vendor feature.
- Architecture/reuse **13/15** — modular Symfony framework, headless/API positioning and extensibility are evidenced; customization means engineering burden.
- Maintenance **13/15** — dated branch commits through check date and recent 2.3/2.2 releases/advisories demonstrate active work; stars unavailable and do not score.
- Security/dependencies **8/15** — reporting policy and remediation advisories exist, but several substantial 2026 vulnerabilities justify caution; no audit evidence.
- Docs/tests **8/10** — official installation/configuration docs and PHPUnit/Behat/BDD evidence; no coverage metric.
- License clarity **9/10** — exact MIT file is clear; confirm dependencies, plugins, trademarks and Plus boundary separately.
- Setup/deployment **3/5** — documented installer and supported DB options; multiple services/build steps and worker operations imply nontrivial deployment.
- APIs/integrations **4/5** — official REST/API-first and integration positioning; specific integration coverage was not assessed.
- i18n/Arabic/RTL **1/5** — locale and translations evidenced generally, but Arabic/RTL is unverified.

**Recommendation:** Evaluate, not adopt by default. Treat it as a strong candidate where So7ob Tech has Symfony capability and needs a customizable, headless-capable commerce core. Before selection, test the required workflows and integrations, verify Arabic/RTL with a real prototype, review all dependency and plugin licenses, establish supported-version/patch operations, and perform deployment/security reviews. Do not infer production readiness or compliance from the evidence above.

## Sources opened

[1] https://github.com/Sylius/Sylius — canonical repo/README
[2] https://raw.githubusercontent.com/Sylius/Sylius/master/LICENSE — exact license file
[3] https://docs.sylius.com/ — official docs overview and CE/Plus distinction
[4] https://docs.sylius.com/public/getting-started/sylius-ce-installation — official installation guide
[5] https://docs.sylius.com/public/getting-started/basic-configuration — channels/locales configuration
[6] https://github.com/Sylius/Sylius/releases — release listing
[7] https://github.com/Sylius/Sylius/commits/2.3/ — branch commit history
[8] https://github.com/Sylius/Sylius/security/advisories — repository advisories
[9] https://github.com/Sylius/Sylius/security/policy — reporting policy
[10] https://sylius.com/blog/security-blog-post-for-1-and-2-versions/ — official security update
[11] https://sylius.com/ — official product positioning
