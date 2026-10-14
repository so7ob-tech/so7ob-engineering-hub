Krayin is a real Laravel-based CRM with credible self-hosting and core lead/pipeline functionality, but its own releases document several recent security fixes and the current repo shows an unresolved-looking advisory; choose **evaluate**, not adopt, pending version-specific security disposition and verification of API/Arabic capabilities. The supplied repository URL is the verified canonical repository. Checked **2026-10-14**.

## Identity, category, and domain fit

The canonical project is [krayin/laravel-crm](https://github.com/krayin/laravel-crm), matching the supplied URL and name. Its maintainers describe it as an open-source CRM for SMEs and enterprises, built with Laravel and Vue, using a modular approach and custom attributes. This is a CRM, not merely an adjacent customer-support or marketing product. [1]

The official user guide explicitly documents leads and pipelines, activities, and quotes. The repository also describes custom attributes, dashboards and email parsing via SendGrid. The user-facing feature guide establishes sales/contact lifecycle utility; however, it does not establish every advanced CRM capability claimed by the marketing page. [1] [2] The official homepage promotes marketing automation, email campaigns, support, analytics, AI workflows and omnichannel functions, but these claims alone do not show which are included in the core self-hosted repository. Treat campaign automation and service/case management as **not verified in core**. [3]

## License and edition boundaries

The repository LICENSE page identifies the project as MIT. That is a clear top-level license, but this review did not verify licenses of every bundled or separately distributed module and dependency; obtain legal review for the actual distribution/use model rather than treating public availability as blanket clearance. [4] The repository separately identifies managed cloud hosting and multi-tenant SaaS, WhatsApp and VoIP extensions. Those offerings should be treated as hosted/commercial or extension boundaries, not presumed core functionality. The homepage shows a $20/month offer, but does not clarify its precise feature/edition mapping in the captured content. [1] [3]

## Maintenance and security

The GitHub releases page shows v2.2.6 as the latest displayed release; v2.2.5 notes fixes for unauthenticated installer access, executable email attachment uploads and webhook internal-URL validation, while v2.2.4 lists fixes including IDOR, SQL injection, stored XSS and unrestricted file upload. These are material signals to confirm the intended deployment version includes fixes and to review the full release notes before testing. [5] The fetched release listing did not expose a date for v2.2.6, and no support policy/branch support matrix was verified; maintenance therefore has evidence of recent development but lifecycle support remains uncertain. [5]

GitHub reports that no SECURITY.md security policy is detected. [6] The GitHub Advisory Database has a Sep. 28, 2026 entry for a vulnerability in Krayin laravel-crm, but the extracted advisory text did not expose affected/fixed versions; disposition is consequently unknown, not assumed unresolved or fixed. [7] Dependency pinning, automated dependency scanning and reproducible security checks were not independently verified. Review the advisory and dependency state at the exact intended tag before any controlled deployment.

## Architecture and deployment

The project identifies Laravel/PHP and Vue and calls itself modular; its developer portal documents package creation, events, helpers and overriding core models, evidence of extension seams. The available material does not establish module-level isolation or low coupling. [1] [8] Self-hosting is explicitly documented: Apache or NGINX, PHP 8.3+, Composer 2.5+, MySQL 8.0.32+ or MariaDB 11.4 LTS+, environment configuration and `php artisan krayin-crm:install`. The README also links Docker installation documentation, but reproducibility and production hardening were not verified here. It recommends `composer install --no-dev` before production and includes default demo login credentials in its installation instructions, which operators must not leave enabled. [1]

## Documentation, tests, APIs, and integrations

Official user docs cover leads/pipeline, activities and quotes. Developer docs describe packages and customization, and an API page describes REST CRUD operations and pagination for CRM data including customers, leads and contacts. This is useful documented integration surface, though the captured API page does not establish complete endpoint coverage, auth mechanisms or versioning guarantees. [2] [8] [9] The repository README names SendGrid email parsing; the repository also mentions Google Contacts export in a release and markets WhatsApp/VoIP as extensions. Distinguish these from a general core integration catalog. [1] [3] [5] CI workflow breadth and meaningful automated test coverage were not verified from the opened pages, so documentation/testing remains partly unknown.

## Arabic and RTL

Arabic translation coverage and RTL/bidi layout are **not verified**. Neither the official user-guide extract nor the repository language-directory page provided readable evidence of Arabic translations, and no primary source directly confirms RTL behavior. Localization elsewhere must not be taken as evidence of Arabic or bidi support. [2] [10]

## Conditional recommendation and score

**Recommendation: evaluate.** Krayin merits a bounded technical evaluation because it is a genuine self-hosted CRM with documented lead/pipeline workflows, a clear repository license, and extension/API mechanisms. Conditions: confirm the latest relevant advisory and patched version; inspect dependency and module licenses; test the exact supported PHP/database stack and installation path; validate desired service/campaign workflows and API auth/endpoints; and directly test Arabic and RTL if required. This is not legal, security, commercial-use, compliance, or production approval. Confidence: **medium**—primary repository/docs/releases were opened, but security disposition, tests, module licenses, exact edition boundaries, and Arabic/RTL remain gaps.

Weighted score (criterion points do not exceed rubric maxima; midpoint sum = **68/100**):

- Feature completeness and domain fit: **13/20** — strong verified leads/pipeline/activity/quotes core; campaign and service coverage unclear.
- Architecture and reuse quality: **11/15** — Laravel/Vue modular design and package/model extension docs; coupling not assessed.
- Development activity and maintenance: **13/15** — multiple recent feature and security-fix releases; support policy and latest release date unclear.
- Security and dependency quality: **7/15** — remediation activity exists, but no SECURITY.md, advisory disposition and dependency checks are unknown.
- Documentation and testing: **7/10** — useful user, deployment and API docs; CI/test quality not verified.
- License clarity and suitability: **9/10** — MIT identified at repository level; module/dependency license inventory not checked.
- Setup and deployment: **4/5** — documented self-hosting prerequisites/install; operational reproducibility not tested.
- Integrations and APIs: **3/5** — REST CRUD/pagination, SendGrid mention and extension examples; interface completeness uncertain.
- i18n, Arabic and RTL: **1/5** — localization evidence insufficient; Arabic and RTL unverified.

**Plausible total range: 59–76/100; midpoint: 68/100.** Range reflects unknowns and is not a statistical confidence interval.

## References

[1]: https://github.com/krayin/laravel-crm "Krayin CRM canonical GitHub repository and README"
[2]: https://docs.krayincrm.com/ "Krayin User Documentation"
[3]: https://krayincrm.com/ "Krayin CRM official website"
[4]: https://github.com/krayin/laravel-crm/blob/master/LICENSE "Krayin CRM repository license"
[5]: https://github.com/krayin/laravel-crm/releases "Krayin CRM releases"
[6]: https://github.com/krayin/laravel-crm/security/policy "Krayin CRM GitHub security policy page"
[7]: https://github.com/advisories/GHSA-gxmj-vr4j-8j5c "GitHub Advisory Database: Krayin laravel-crm vulnerability"
[8]: https://devdocs.krayincrm.com/ "Krayin CRM Developer Portal"
[9]: https://devdocs.krayincrm.com/2.0/api/ "Krayin REST API documentation"
[10]: https://github.com/krayin/laravel-crm/tree/2.2/packages/Webkul/Admin/src/Resources/lang "Krayin Admin language resources directory"
