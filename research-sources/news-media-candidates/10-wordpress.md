# WordPress (`WordPress/wordpress-develop`) — News & Media candidate

**Evidence date:** 2026-10-14  
**Category:** Broad publishing platform / news and magazine sites  
**Provisional screening only:** this is not adoption approval, a security audit, or deployment sizing.

## Identification and fit

WordPress is a widely used, general-purpose open-source publishing platform capable of powering newspaper and magazine websites. Its core has publishing primitives, author/editor roles, revisions, scheduled posts, comments, media management, feeds, and a JSON REST API. It is therefore relevant as a broad platform candidate, not as a dedicated newsroom/editorial suite. Editorial products and publisher packages such as Newspack are separate offerings/extensions; this assessment scores core WordPress and does not imply their inclusion or licensing.

The requested canonical development repository is [WordPress/wordpress-develop](https://github.com/WordPress/wordpress-develop). GitHub describes it as a Git mirror synced from WordPress’s Subversion repository, so it is not the sole authoritative development history. The GitHub API metadata checked on the evidence date says it is public, unarchived, default branch `trunk`, language PHP, last pushed 2026-09-24, and identifies GPL-2.0. The official product site is [WordPress.org](https://wordpress.org/).

## Editorial, publishing, and distribution

Core roles include Administrator, Editor, Author, Contributor, and Subscriber, with capabilities that can be assigned or removed. An Editor may publish/manage other users’ posts; an Author manages their own; a Contributor writes but cannot publish. This offers useful baseline newsroom separation, but does not by itself establish specialist newsroom assignment desks, multi-stage configurable approvals, legal review, embargo controls, or granular story budgeting. Extensions/custom code may supply additional workflow capabilities.

Core revisions record saved draft/published changes and allow comparison and restoration; autosaves are per user and do not overwrite published content. Future posts can be scheduled. The platform’s scheduling mechanism is tied to site visits when a scheduled time has passed, as documented for the event scheduler; operationally, reliable timing may call for host-level cron or equivalent configuration rather than assuming traffic-driven cron is a hard real-time guarantee. These functions are publishing workflow, not evidence of a complete newsroom planning suite.

WordPress exposes built-in RSS/RDF and Atom feeds, including comment feeds, and its REST API provides JSON access to posts, pages, taxonomies, and other data with authentication restrictions for private data. The API is extensible. These are useful syndication/integration building blocks; the reviewed sources do not document a native wire-service ingestion/redistribution product, publisher-to-publisher syndication management, or a newsroom-specific search service. Core site search/discovery should not be conflated with a dedicated editorial archive/search platform.

Comments and moderation capabilities exist in core. Native comment moderation and feeds are community functions, not evidence of federated publishing or a complete community platform. No claim of ActivityPub/federation is made here.

## Media and language

The Media Library documents image, video, audio/recording, and file upload, organization, search/filter, previews, and attachment metadata including image alt text and captions. WordPress 7.1 release notes describe media editing improvements, native image-format support, and an audio Playlist block. Video/audio files can be uploaded and managed as media, but WordPress is not a specialist video-hosting/CDN service or podcast delivery/analytics service; hosting, transcoding, delivery scale, rights, captions/transcripts, and player needs must be assessed separately. The reviewed core sources do not establish a complete captioning/transcription workflow for audiovisual journalism.

WordPress has extensive localization infrastructure and community translations. The reviewed official translation handbook establishes translation workflows generally, but not a definitive Arabic RTL acceptance test for a particular theme, plugin, or custom editorial UI. Arabic localization and RTL support are plausible platform capabilities, but the exact editorial theme/plugins and rendered layouts require hands-on validation. Score reflects that evidence gap rather than assuming every extension is RTL-ready.

## License, runtime, and operations

The official licensing page says WordPress is released under **GNU GPLv2 or later**; the repository API reports GPL-2.0. This is an open-source license and core can be self-hosted. GPL obligations, distribution of modifications, and the licensing of plugins, themes, hosted services, trademarks, media, and third-party assets are distinct questions. WordPress.org’s licensing page states its position that derivatives of WordPress code, including themes and plugins, inherit GPL, while also acknowledging legal grey areas. Review the actual components and commercial terms with counsel; paid extensions/services are not thereby included in core.

Official requirements recommend PHP 8.3+, MariaDB 10.11+ or MySQL 8.0+, and HTTPS. Apache or Nginx are recommended, while other PHP/database-capable server arrangements may work. Older PHP/MySQL versions are noted as still working but end-of-life and potentially vulnerable. Deployment is conventional PHP application plus SQL database, with hosting, backups, caching, object/media storage, observability, and scaling configuration supplied by the operator or service providers; no performance or compliance outcome is inferred.

The development repository documents a Docker-based development environment, Node/npm build tooling, PHP and end-to-end test commands, QUnit tests, and code coverage. This is positive evidence for contributor tests and local setup, not an assertion of exhaustive production test coverage. Core security policy describes a security team and responsible disclosure, code review, fixes, and release/backport practices. Only the latest release is officially supported; older branches may receive backports as a courtesy.

Maintenance is demonstrably active: the GitHub API metadata showed a push on 2026-09-24 (metadata snapshot accessed 2026-10-14), and WordPress 7.1.3 was released 2026-10-06 as a maintenance/security release with seven security fixes and four bug fixes. That release disclosed, among other issues, stored XSS in comment administration, denial of service in URL handling, second-order SQL injection in WXR export, an Author-role sticky-post privilege weakness, and unauthenticated disclosure of comments on private/unpublished posts. WordPress 7.0.2 (2026-07-17) had addressed a critical and a high-severity issue, including SQL injection and a REST API batch-route issue leading to remote code execution. These are examples of active remediation, not an exhaustive vulnerability history or assurance that a candidate deployment is safe. Core plus plugins/themes and hosting configuration materially affect exposure; promptly applying updates and evaluating extensions are operational necessities.

## Screening score

| Criterion | Score | Rationale |
|---|---:|---|
| Newsroom/editorial fit | 10/20 | Useful editorial roles, revisions, scheduling and moderation, but core is a general CMS rather than a newsroom suite. |
| Publication/workflow/content ops | 13/15 | Posts/pages, author attribution, roles, revisions, media, comments and scheduling are substantial core primitives; advanced approval/assignment workflows need further verification or extensions. |
| Maintenance | 14/15 | Recent official security/maintenance release and recent repository activity; release cadence is active. |
| Security/dependencies | 10/15 | Public security process and frequent fixes, but disclosed core issues and broad plugin/theme/hosting attack surface require ongoing governance. |
| Docs/tests | 9/10 | Official handbooks and repository test instructions, multiple suites and coverage workflow. |
| License clarity | 10/10 | Core GPLv2-or-later expressly documented; component and commercial boundaries still need per-extension review. |
| Setup/deployment | 4/5 | Widely deployable PHP/database stack and documented Docker development environment; production operations are operator/host responsibility. |
| Distribution/APIs/media integrations | 4/5 | REST API and RSS/Atom feeds, extensible content model and built-in media library; no native wire product established by reviewed evidence. |
| Arabic/RTL | 4/5 | Strong translation ecosystem, but no candidate theme/plugin RTL verification in this evidence pass. |
| **Total** | **78/100** | **Provisional comparative screening score.** |

**Recommendation:** Retain in the broad publishing platform category alongside specialist newsroom tools. It is a credible candidate for a news or magazine publication where the organization accepts integration and operational ownership, but do not characterize core WordPress as a newsroom-specific product. Validate editorial workflow requirements, Newspack/extension scope and terms, RTL rendering, security/update ownership, media delivery and captioning needs, and operational capacity before any selection.

**Confidence:** Medium-high for documented core features, license, runtime, release and repository metadata; medium for newsroom fit; low-to-medium for Arabic/RTL suitability and any unreviewed commercial extension. No performance, compliance, scale, or adoption-readiness claim is made.

## Opened sources

1. [Canonical development repository](https://github.com/WordPress/wordpress-develop) — repository overview, runtime/tooling, tests and development environment.
2. [GitHub repository API metadata](https://api.github.com/repos/WordPress/wordpress-develop) — branch, license identifier, push date, archive status, mirror description.
3. [WordPress official product site](https://wordpress.org/).
4. [Official license statement](https://wordpress.org/about/license/).
5. [GitHub repository license file](https://github.com/WordPress/wordpress-develop/blob/trunk/license.txt) — URL opened; extraction returned no readable content; used official licensing statement and API metadata for exact license.
6. [Official requirements](https://wordpress.org/about/requirements/).
7. [Official roles and capabilities documentation](https://wordpress.org/documentation/article/roles-and-capabilities/).
8. [Official revisions documentation](https://wordpress.org/documentation/article/revisions/).
9. [Official scheduling documentation](https://wordpress.org/documentation/article/schedule-your-posts/) — opened, but page extraction returned a generic unavailable page; scheduled-event reference below substantiates scheduler mechanics, not editorial UI details.
10. [Developer reference: `wp_schedule_single_event`](https://developer.wordpress.org/reference/functions/wp_schedule_single_event/).
11. [WordPress REST API handbook](https://developer.wordpress.org/rest-api/).
12. [Official WordPress feeds documentation](https://wordpress.org/documentation/article/wordpress-feeds/).
13. [Official Media Library documentation](https://wordpress.org/documentation/article/media-library-screen/).
14. [WordPress 7.1 “Mary Lou” release post](https://wordpress.org/news/2026/08/mary-lou/).
15. [WordPress 7.1.3 maintenance and security release](https://wordpress.org/news/2026/10/wordpress-7-1-3-maintenance-and-security-release/).
16. [WordPress 7.0.2 security release](https://wordpress.org/news/2026/07/wordpress-7-0-2-release/).
17. [Official security overview](https://wordpress.org/about/security/).
18. [Core handbook bug and security reporting](https://make.wordpress.org/core/handbook/testing/reporting-bugs/).
19. [Polyglots translation handbook](https://make.wordpress.org/polyglots/handbook/translating/).
20. [Official search documentation URL](https://wordpress.org/documentation/article/searching-wordpress/) — opened, but extraction returned a generic unavailable page; no detailed search-performance/functionality claim is based on it.
