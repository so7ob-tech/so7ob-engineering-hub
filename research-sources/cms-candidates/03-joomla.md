# Joomla CMS candidate evidence note

**Evidence date: 2026-10-14**  
**Candidate:** Joomla CMS (`joomla/joomla-cms`)  
**Decision:** Evaluate further; do not adopt without a bounded pilot and explicit version/extension review.

## Findings

Joomla is a conventional, integrated web CMS: it supports publishing websites with an administrator/editor interface and renders website pages itself. Joomla's official description calls it a CMS for publishing web content built on an MVC web-application framework. The repository describes PHP/MySQL/MariaDB/PostgreSQL server requirements. It is therefore traditional/publishing CMS, not a headless-first product, decoupled platform, or data platform. Those latter classifications are analytical categorization, not project terminology. [1] [2]

The content model is article- and category-oriented, with tags, media, custom fields, language, access level, workflow/publishing state, schedules, metadata, associations, and revision history described in the editor documentation. TinyMCE is the default WYSIWYG editor according to Joomla's help documentation; article fields include status, category, featured, access, language, tags, and version note. User documentation describes workflow and permissions, but the checked evidence does not establish approval workflow suitability for So7ob's precise editorial process. [3] Joomla 6.2's release announcement documents TinyMCE/media-picker and link-picker updates. [4]

Multilingual support is a first-class site feature: installed interface translations are distinct from content languages; language association tooling links translations and provides a side-by-side management component. Joomla's official downloads page lists language packs for 6.x. These establish language infrastructure but not the quality of any specific Arabic translation. [5] [6]

Joomla has a built-in Web Services API with endpoints including content articles and supports GET, POST, PATCH, DELETE in the developer guide. The guide demonstrates token authentication and API permissions. This supports headless/decoupled delivery and integrations, but doesn't turn the product into a headless-first CMS; a project would need to validate coverage, output shape, access policy, and editorial-preview needs. The retrieved guide targets 4.x, so confirm endpoint behavior on 6.2. [7]

The Joomla Extensions Directory displayed 4,960 extensions on the inspected page, across authoring/content construction, access/security, commerce, languages, integrations, and other categories. Directory size is not a quality, maintenance, compatibility, or security guarantee; check individual extension authors, changelogs, licenses, and compatibility. [8]

## Technology, licensing, reuse

The repository README identifies PHP, Node/npm build tooling, Composer-managed dependencies, and MySQL, MariaDB, or PostgreSQL runtime database options. Joomla 6.x technical requirements page (live at evidence date) lists PHP 8.3 minimum/supported and 8.4 recommended; MySQL 8.0.13, MariaDB 10.4 minimum (10.6 supported), and PostgreSQL 12 minimum (14 supported), with Apache/Nginx/IIS options. [1] [9]

The repository README says GPL version 2 or later; the exact checked `LICENSE.txt` is GNU GPL version 2. Commercial use and charging for services are not prohibited by GPLv2. Distribution of covered modified/derived software triggers source and same-license obligations, with notice and license-copy obligations; merely running it as a service is not restricted by GPLv2 itself. Assess plugins, bundled assets, trademarks, and any separately licensed dependencies independently. Joomla's cloud offering is a separate hosting/service boundary, not a restriction apparent in the core GPL license. This is a technical reading, not legal advice. [1] [10] [11]

## Maintenance, release, quality and security

GitHub release metadata shows Joomla 6.2.0 marked stable, published 2026-10-13 (the day before this evidence date); the release metadata reports 31+ contributors and 116+ merged PRs. Official announcement calls it a minor release and cites more than 130 PRs, demonstrating active release work rather than proving future maintenance. [12] [4] The same announcement says 5.4 security patches continue to 2027-10-12; it gives 2026-10-13 as the end date for 5.4 bug-fix patches. For a new deployment, prefer the then-current stable branch and verify support dates from the official lifecycle material. [13]

Repository build instructions require Composer and npm dependencies. Repository includes a test/build workflow; however, this desk review did not run tests or verify coverage/pass rates. Developer manuals, user help, requirements, migration guidance and release notes exist. Documentation is distributed across versioned manuals and wiki pages, so pin links to selected supported release. [1] [3] [4] [9]

The security centre's live feed is a project-maintained record of resolved issues, not an independent audit. At the inspected page, it listed numerous 2026 advisories across 5.4 and 6.1 lines, including access-control errors, authentication bypass, XSS, upload handling and CORS; fixes were listed for 5.4.8 and 6.1.3. These are current advisories, and emphasize timely patching; they do not establish exploitable status of every installation or provide a security certification. The 6.0.4/5.4.4 release announcement likewise specifically enumerates security fixes, including ACL hardening, SQL injection in a content API endpoint, XSS and improper API endpoint access. [14] [15] The official centre links reporting instructions; repository SECURITY.md could not be verified through the page fetch, so do not infer additional private-disclosure or response-time guarantees. [14]

## Deployment and Arabic / RTL

Self-hosting requires maintaining a PHP runtime, database, web server, Joomla core and third-party extensions. Plan for backups of database and uploaded media/configuration, restore testing, staging upgrades, extension compatibility checks, and security patching. Official release guidance explicitly recommends testing an upgrade on a production copy, and identifies backward compatibility and extension readiness as concerns. No backup/restore SLA or managed-service boundary was established in the sources reviewed. [13]

Evidence for Arabic localization: Joomla 6.x has 64 official language packs (official download page); multilingual language features include distinct content languages and language associations. Official release notes explicitly mention RTL calendar fixes, and official Arabic language packs are available in the downloadable language catalog. These are positive evidence for RTL support in at least some interfaces, not a complete verification of Arabic editor usability, themes, custom extensions, mixed-direction text, or So7ob's intended workflow. A real Arabic-language pilot is required. [6] [15]

## Score

**72/100** under the prescribed screening rubric:

- CMS/content/editorial fit: **17/20** — strong traditional CMS, publishing, custom fields, permissions and translation; conventional article-centric model.
- Architecture/reuse: **12/15** — extensible modular PHP/MVC codebase and integrations; maintainers needed.
- Maintenance: **12/15** — very recent stable release and active release stream; extension compatibility and support-window management remain.
- Security/dependencies: **9/15** — visible security response and supported branches; recurring security fixes, broad extension surface and dependency operations need active management. Not an audit score.
- Docs/tests: **8/10** — substantial manuals and build/test tooling; test execution/coverage not independently checked.
- License clarity: **9/10** — exact GPLv2 text and README GPLv2-or-later statement; third-party components still need review.
- Setup/deployment: **3/5** — conventional PHP/database hosting but ongoing operations/upgrade burden.
- APIs/integrations: **2/5** — useful core REST endpoints and broad plugin directory; headless readiness requires endpoint validation and extensions.
- Arabic/RTL: **2/5** — official language pack availability and a specific RTL fix are noted; no end-to-end Arabic experience verified.

Total is **74** (17+12+12+9+8+9+3+2+2). The corrected total is the arithmetic sum of the stated criterion points. Score is a comparative screening judgment, not a measured quality/security assessment.

## Recommendation and uncertainties

**Evaluate, not adopt yet.** Joomla is a credible candidate if So7ob prioritizes a conventional extensible CMS with multilingual publishing and granular permissions and is willing to operate PHP/database infrastructure and vet extensions. Pilot Arabic/RTL publishing, roles/ACL, API consumption, the actual proposed content schema, upgrade/restore, and every required extension on Joomla 6.2.0 or the latest supported patch. If So7ob requires headless-first editorial modeling or managed operational guarantees, this evidence does not establish fit.

Unknown/not verified: Arabic end-to-end quality; production API behavior on 6.2; requirements-to-extension compatibility and licenses; test coverage/pass results; independent security audit or compliance certifications; deployment performance/scalability; backup/restore service guarantees; complete security response policy. No security, performance, audit, or compliance claim is made.

Directus note for cross-candidate comparisons: Directus licensing is not assessed in this Joomla candidate note. Do not describe Directus's Business Source License as OSI-approved open-source licensing. Determine and inspect the exact Directus version's license file and change/usage terms before comparison; this research did not verify those version-specific terms.

## References (URLs opened)

[1] https://github.com/joomla/joomla-cms — canonical repository and README.  
[2] https://www.joomla.org/about-joomla.html — official Joomla description.  
[3] https://docs.joomla.org/Help4.x:Articles:_Edit — official article editor help.  
[4] https://www.joomla.org/announcements/release-news/joomla-6-2-is-here.html — Joomla 6.2 release announcement.  
[5] https://manual.joomla.org/docs/next/general-concepts/multilingual/ — multilingual developer documentation.  
[6] https://downloads.joomla.org/language-packs — official language pack portal.  
[7] https://manual.joomla.org/docs/4.4/general-concepts/webservices/ — web services documentation (4.4).  
[8] https://extensions.joomla.org/ — Joomla Extensions Directory.  
[9] https://manual.joomla.org/docs/next/get-started/technical-requirements/ — technical requirements.  
[10] https://raw.githubusercontent.com/joomla/joomla-cms/5.4-dev/LICENSE.txt — exact repository GPLv2 license file.  
[11] https://github.com/joomla/joomla-cms/blob/5.4-dev/LICENSE.txt — repository license path.  
[12] https://api.github.com/repos/joomla/joomla-cms/releases — GitHub releases metadata, including stable 6.2.0.  
[13] https://www.joomla.org/announcements/release-news/joomla-6-0-4-5-4-4-security-bugfix-release.html — official support-window/upgrade guidance from release note.  
[14] https://developer.joomla.org/security-centre.html — official security advisory feed.  
[15] https://www.joomla.org/announcements/release-news/joomla-6-0-4-5-4-4-security-bugfix-release.html — official release security-fix list; also includes RTL-calendar fix.
