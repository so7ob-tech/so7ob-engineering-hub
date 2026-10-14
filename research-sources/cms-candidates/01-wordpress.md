# WordPress (`WordPress/wordpress-develop`) — CMS candidate evidence note

**Evidence date: 2026-10-14.** This assessment is for So7ob Tech screening, not an implementation or security audit. Verified statements below are distinguished from project descriptions and evaluation inference. GitHub metadata and current pages are point-in-time observations.

## Candidate and fit

WordPress is a **traditional, publishing-first CMS** with a PHP-rendered front end, theme system, plugin extension model and a REST API that can support a decoupled/headless client. It is not inherently a headless-only CMS or general-purpose data platform. Its strongest match is editorial publishing and theme/plugin customization. The official project describes posts/pages, drafts, scheduled publishing, revisions, roles, media, themes, plugins, comments, and custom post types/taxonomies/metadata [2]. The assessment that this is a strong fit for a conventional editorial CMS is an inference from those documented capabilities.

The default editor is the block editor (REST API docs call that API its foundation); editorial workflow features include drafts, scheduling, revisions, public/private/password-protected content and differentiated roles [2][3]. Core content types are extensible via post types, taxonomies and metadata, but deeply structured content modeling often relies on plugins or custom development; that is an implementation inference, not a claim that core lacks extensions.

## Technology and architecture

The canonical development repository calls the project PHP, MySQL and JavaScript based, with Node used for JavaScript dependencies and tooling [1]. Official hosting guidance recommends PHP 8.3+, MariaDB 10.11+ or MySQL 8.0+, and HTTPS; Apache or Nginx are recommended but not mandatory [9]. Traditional deployments run WordPress with its own web/PHP/database stack and theme-rendered site; a separate front end is possible through REST, but adds integration and operational components [3].

WordPress provides a JSON REST API for built-in posts, pages, taxonomies and other types; custom endpoints and exposure of custom content/metadata can be added. Public content is generally available without authentication while private material follows access controls [3]. Headless use is therefore supported as an option, not required architecture. The theme handbook distinguishes classic themes (PHP/JS/CSS) from block themes (HTML and configuration; Site Editor edits all parts of a site) [4]. Project claims broad plugin/theme ecosystem and extensibility through APIs/hooks, and custom content types [2]. The WordPress.org plugin directory requires GPL-compatible plugin contents for directory-hosted code, but independently sold/hosted extensions and service integrations can have separate terms and obligations [5].

## License and reuse boundary

GitHub API metadata identifies the repository license as **GNU General Public License v2.0 (SPDX GPL-2.0)** and the default branch as `trunk` [10]. WordPress.org describes WordPress as GPL-licensed and permits commercial projects without licensing fees [2]. The repository's displayed GitHub license metadata was verified, but automated extraction of a raw `LICENSE`/`license.txt` path did not succeed during research; the linked license URL in the source list is the official repository license-file path as surfaced by GitHub. Treat exact applicable license and notices for bundled third-party components, themes, plugins and brand/trademark use as a diligence item. GPL software can be commercially used, modified and distributed; this does not mean every extension, hosted service, trademark or managed hosting product shares identical terms. The directory's own rules expressly demand GPL or compatible licensing for content hosted there [5]. No claim is made here about enterprise/cloud vendor contract terms.

## Maintenance, security, documentation and operations

GitHub API on 2026-10-14 reported a repository update at 15:42:25Z; the newest commit observed in the API was dated 15:41:46Z on the same day and concerned a security-related test mock [10]. This is evidence of active repository activity, not a prediction of future maintenance. The dated official 7.1.3 release announcement (2026-10-06) reports seven security fixes and four bug fixes, recommends immediate update, and says only the most recent version is actively supported while security fixes are backported to branches eligible through 4.7 [6]. The repository security policy page listed 7.1.x through 4.7.x as supported and versions below 4.7 as unsupported at observation time [7]. These statements concern core, not third-party plugins/themes.

A concrete dated release announcement is stronger evidence than an abstract security claim: 7.1.3 addressed stored XSS, DoS, second-order SQL injection and other issues [6]. The GitHub security policy directs responsible disclosure via HackerOne [7], and advisories are listed on the repository's security-advisories page [8]. These sources do **not** establish that WordPress is secure, audited, compliant, or free of vulnerabilities. Extension security, patch cadence and support must be assessed separately.

The developer repository documents Docker-based local development plus PHP and end-to-end tests, QUnit JavaScript tests, and coverage-report generation [1]. The user-facing site has handbooks for themes, REST API and plugins [3][4][5]. This establishes documentation and test facilities, not test quality or complete coverage. Standard operations require a PHP web stack, database, HTTPS and ongoing core/theme/plugin updates. The official features page says upgrades are easy and notes one-click hosts [2], but in self-managed production the operator still owns backups, restore tests, compatibility review and plugin/theme updates; that burden is an operational inference. No measured setup time or performance/security audit was found.

## Arabic and RTL

The official WordPress feature page says WordPress is available in more than 70 languages [2], and the Polyglots page documents the translation program [11]. These establish translation infrastructure, not the quality/completeness of a particular Arabic locale or RTL rendering behavior. Arabic-specific RTL implementation and locale completeness were **not independently verified** from an opened primary source in this research. Score conservatively; test the chosen locale, admin/editor, theme and extensions with Arabic content and bidirectional text before selection.

## Score (screening rubric)

| Criterion | Points |
|---|---:|
| CMS/content/editorial fit | 19/20 |
| Architecture/reuse | 13/15 |
| Maintenance | 14/15 |
| Security/dependencies | 10/15 |
| Docs/tests | 9/10 |
| License clarity | 8/10 |
| Setup/deployment | 4/5 |
| APIs/integrations | 5/5 |
| Arabic/RTL | 2/5 |
| **Total** | **84/100** |

**Recommendation: Evaluate, do not adopt solely on desk research.** It is a compelling candidate for traditional editorial publishing and theme/plugin flexibility; perform a focused proof of concept for Arabic RTL, editorial roles/workflow, the required content model, extension governance, hosting/backup/restore and upgrade procedures. The 84/100 score reflects product fit and maturity evidence, not assurance about security or operational outcomes.

## Sources opened

[1] [WordPress/wordpress-develop repository](https://github.com/WordPress/wordpress-develop) — repository overview, technologies, local setup, tests and coverage.

[2] [WordPress features](https://wordpress.org/about/features/) — project claims about publishing, themes, plugins, custom content, languages and GPL.

[3] [REST API Handbook](https://developer.wordpress.org/rest-api/) — API role, JSON access, auth caveats and headless/client use.

[4] [Theme Developer Handbook](https://developer.wordpress.org/themes/) — block vs classic themes and Site Editor.

[5] [Plugin Directory Detailed Guidelines](https://developer.wordpress.org/plugins/wordpress-org/detailed-plugin-guidelines/) — directory GPL compatibility and ecosystem rules.

[6] [WordPress 7.1.3 Maintenance and Security Release](https://wordpress.org/news/2026/10/wordpress-7-1-3-maintenance-and-security-release/) — 2026-10-06 release, fixes and backport statement.

[7] [wordpress-develop Security Policy](https://github.com/WordPress/wordpress-develop/security/policy) — disclosure and supported-version table.

[8] [wordpress-develop Security Advisories](https://github.com/WordPress/wordpress-develop/security/advisories) — repository advisory listing.

[9] [WordPress Requirements](https://wordpress.org/about/requirements/) — official recommended PHP/database/HTTPS requirements.

[10] [GitHub repository API metadata](https://api.github.com/repos/WordPress/wordpress-develop) and [latest-commit API](https://api.github.com/repos/WordPress/wordpress-develop/commits?per_page=1) — retrieved 2026-10-14; license metadata, branch, update timestamp and latest observed commit.

[11] [WordPress Polyglots Teams](https://make.wordpress.org/polyglots/teams/) — official translation program; does not establish Arabic RTL quality.

[12] [WordPress/wordpress-develop LICENSE path](https://github.com/WordPress/wordpress-develop/blob/trunk/LICENSE) — GitHub file route attempted, content extraction failed; license identification above is based on GitHub API metadata and official WordPress GPL statement, not a transcription of this file.
