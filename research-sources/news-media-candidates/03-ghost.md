# Ghost (TryGhost/Ghost) — News & Media screening

**Evidence date: 2026-10-14.** **Provisional screening only; not adoption approval.** Ghost is a publishing platform for professional/independent publishers: an editorial website, email newsletters, memberships and paid subscriptions in one system. It is relevant to digital magazines and newsletter publishers, but should not be mistaken for a full newsroom/editorial suite with wire-service intake, assignment desk, syndication rights management, broadcast/podcast production, or a video-hosting service. Its public-facing descriptions and documented APIs center on web publishing and audience relationships. [1] [2] [3]

## Product fit and workflow

Ghost supports staff roles: Contributor can write but not publish; Author can create/publish posts and tags; Editor can manage authors/contributors; Administrator has full permissions; Owner is the non-deletable admin with billing access. Posts support multiple authors, tags, metadata and scheduling; the editorial data model and Admin API support content creation and publishing workflows. Themes can expose author/tag archives with RSS feeds and sitemap entries. This is useful editorial workflow, but the role ladder is comparatively compact: sources reviewed do not document assignment queues, multi-stage approval/state customization, newsroom planning/calendar, legal review, wire ingestion, syndication licensing, or a native revision comparison/version restore workflow. A recent release did fix post-history issues, indicating a history feature, but that alone does not establish enterprise revision governance. [4] [5] [6]

Ghost exposes a stable, public Content API for posts, pages, tags, authors, tiers and settings, and a REST Admin API for authorized content/admin operations and integrations. Integration credentials support common publishing and cross-platform sharing; webhooks and API-based extensions enable connecting other systems. Posts, tag/author archives, XML sitemaps and RSS provide basic distribution. Ghost 6 also includes ActivityPub-based social web functionality, but docs describe separately run services and note self-hosting is in preview; hosted service limits are stated on the hosting page. This is social federation, not wire syndication. No first-party editorial search/wire service was established by the reviewed evidence. [5] [6] [7]

The editor and theme contract document image galleries, image sizing/responsive sources, captions/figcaptions, embeds, audio and video cards, and downloadable files. These are content authoring/rendering capabilities, not evidence of media asset library governance, video transcoding/hosting guarantees, podcast distribution/analytics, or caption/subtitle workflows. The official product feature page also advertises rich media and newsletters. [2] [8]

## License and commercial boundary

The canonical repository is `TryGhost/Ghost`. Its `LICENSE` is the MIT License, with copyright 2013–2026 Ghost Foundation. It grants broad rights to use, copy, modify, distribute, sublicense and sell, subject to preserving copyright and permission notices; it is provided without warranty. Ghost and its logo are separately identified as Ghost Foundation trademarks. The candidate software license is MIT; Ghost(Pro) is a distinct paid, managed hosting service, not the software license. The repo presents Ghost(Pro) as an operational option; it does not make source-available status a restriction on the core code. [1] [9]

## Runtime and operations

The official recommended, heavily tested self-hosted stack as of the evidence date is Ubuntu 22.04/24.04/26.04 LTS, Node.js 22 LTS, MySQL 8.0 or 8.4, NGINX and systemd, with at least 1 GB memory and a non-root install user. SQLite is used for local development, not a recommended production database. Ghost-CLI provides installation and upgrade operations. Ghost(Pro) is separately managed. The docs describe ActivityPub and web analytics as separate services, with a newer Docker Compose self-hosting route marked preview; those features add operational scope. These are documented requirements, not performance or availability guarantees. [1] [10] [11]

## Maintenance, docs and security

At the evidence date GitHub's main-branch commit history displayed numerous commits dated 14 October and 13 October 2026. The releases page showed active 6.x releases, including v6.70.0 and v6.69.0, with recent substantive fixes/features; it also explicitly says v6.66.0 was not published to npm because of packaging failure and directs users to 6.67.0. Treat GitHub main activity and tagged releases as separate signals; production deployments should follow published releases, not assume every commit is a supported channel. [12] [13]

Official documentation covers installation, APIs, themes, staff, publishing and security. The public repository links to contribution and codebase guidance. Release notes and source activity show ongoing maintenance. Evidence reviewed does not establish a specific CI test-coverage level or independent audit result, so these are not claimed. [1] [10] [13]

Ghost's security page describes device verification, optional email 2FA, login/password-reset rate limiting, CLI SSL setup, bcrypt password hashing, validation, SQLi mitigations, and dependency scanning. It invites responsible vulnerability reports at security@ghost.org and describes acknowledgement within a week, findings within two weeks, and resolution targets by severity. The repository security page points to this policy. GitHub's repository advisories page was opened; its rendered content did not provide an auditable advisory inventory in this review, so no claim of zero known vulnerabilities is made. Security statements here summarize vendor documentation rather than an independent assessment. The security documentation also cautions that trusted content creators can insert scripts/embeds and recommends separate admin/front-end domains when that threat matters. [14] [15]

## Arabic and RTL

The reviewed official source set did not establish first-party Arabic RTL support as a guaranteed turnkey product feature. Themes control front-end presentation and can be customized, but that is not equivalent to verified RTL behavior throughout Admin, Portal, theme marketplace choices, and newsletter rendering. Arabic publication should be validated end-to-end with the selected theme, fonts, editor, email clients, mixed-direction text, and member flows before selection. Score reflects the evidence gap rather than a categorical claim that RTL is impossible. [2] [8]

## Screening score

**79/100.** Scores are comparative screening judgments, not procurement approval.

| Dimension | Points | Rationale |
|---|---:|---|
| Newsroom/editorial fit | 15/20 | Strong independent-publisher/editorial publication fit; not a full newsroom suite. |
| Publication/workflow/content ops | 12/15 | Editorial roles, editor, scheduling, memberships/newsletters; limited documented approval/assignment/rights workflows. |
| Maintenance | 14/15 | Active dated commits and frequent current 6.x releases; npm packaging exception surfaced. |
| Security/dependencies | 11/15 | Published controls and reporting policy; no independent audit or advisory-empty claim; trusted-user content risk. |
| Docs/tests | 8/10 | Broad official documentation and codebase/contribution links; no test coverage quantified. |
| License clarity | 10/10 | Canonical MIT license and separate trademark/hosted-service boundary stated. |
| Setup/deployment | 4/5 | Clear CLI and supported stack; narrower production stack, extra services may add operational burden. |
| Distribution/APIs/media integrations | 3/5 | Strong APIs, RSS, newsletter and media cards; not wire/syndication platform or dedicated media-hosting suite. |
| Arabic/RTL | 2/5 | Theme customization possible, but no verified end-to-end Arabic RTL commitment in reviewed sources. |
| **Total** | **79/100** | **15 + 12 + 14 + 11 + 8 + 10 + 4 + 3 + 2 = 79** |

## References

[1]: https://github.com/TryGhost/Ghost "TryGhost/Ghost canonical repository"
[2]: https://ghost.org/features/ "Ghost product features"
[3]: https://docs.ghost.org "Ghost Developer Documentation"
[4]: https://docs.ghost.org/staff "Staff users, roles and author archives"
[5]: https://docs.ghost.org/admin-api "Ghost Admin API"
[6]: https://docs.ghost.org/content-api "Ghost Content API"
[7]: https://docs.ghost.org/hosting "Ghost hosting and self-hosting"
[8]: https://docs.ghost.org/themes/content "Theme content and editor cards"
[9]: https://github.com/TryGhost/Ghost/blob/main/LICENSE "Ghost repository MIT license"
[10]: https://docs.ghost.org/install/ubuntu "Install Ghost on Ubuntu"
[11]: https://docs.ghost.org/faq/supported-databases "Production database support"
[12]: https://github.com/TryGhost/Ghost/commits/main "Ghost main branch commit history"
[13]: https://github.com/TryGhost/Ghost/releases "Ghost releases"
[14]: https://docs.ghost.org/security/ "Ghost security documentation"
[15]: https://github.com/TryGhost/Ghost/security/policy "Ghost repository security policy"
