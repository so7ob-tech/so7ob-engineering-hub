# News & Media Candidate Review

Ten projects were screened for distinct News & Media needs. **Superdesk is the only purpose-built newsroom/newswire candidate** in this set. WordPress, Ghost and Newspack address publisher websites and operations; listmonk and Keila focus on newsletters; PeerTube and MediaCMS on video; Castopod on podcasts; and WriteFreely on lightweight publishing. A strong score in one class does not make a product a substitute for another.

No candidate has verified end-to-end Arabic/RTL readiness. WriteFreely claims first-class support for non-Latin and RTL scripts, and listmonk documents Arabic UI translation in v6.2.0, but neither claim replaces hands-on testing of editorial UI, themes, integrations and published output.

The evidence snapshot is generally **2026-10-14**. Scores use a common provisional rubric: newsroom/editorial fit (20), publication/workflow/content operations (15), maintenance (15), security/dependencies (15), docs/tests (10), license clarity (10), setup/deployment (5), distribution/APIs/media integrations (5), and Arabic/RTL (5). Component totals are shown in each assessment. Newsletter, video and podcast scores reflect fit within those categories—not newsroom completeness.

License rights apply to the source code, not automatically to hosted services, support, CDN, backups, migration, trademarks or proprietary add-ons. Review AGPL/GPL obligations and separately licensed components with counsel for the intended use. The examined Newspack plugin repository is archived; its hosting/support is a separate offer. Keila excludes its logo, `extra/` and cloud-only components from the core license, so review files individually. No candidate here was classified as a distinct proprietary source-available license.

## Comparison at a glance

| Candidate | Evidence note | Category | Score | Best-fit use case | Primary boundary |
|---|---|---:|---:|---|---|
| [Superdesk](../../research-sources/news-media-candidates/01-superdesk.md) | supplied note, evidence date 2026-10-14 | Specialist newsroom / newswire production | **75/100** | Agency or editorial-desk creation, production, curation and distribution | Validate current supported release, workflows, APIs, security posture and RTL |
| [Newspack](../../research-sources/news-media-candidates/02-newspack.md) | supplied note, evidence date 2026-10-14; repository sunset/archived 2026-08-18 | News publisher platform / newspaper operations | **62/100** | News-oriented WordPress publishing and revenue operations | Do not adopt from archived repo; inspect replacement workspace/release |
| [Ghost](../../research-sources/news-media-candidates/03-ghost.md) | supplied note, evidence date 2026-10-14 | Digital publishing / magazine and newsletter | **79/100** | Independent publisher site, newsletters, memberships and paid subscriptions | Not a newsroom desk, wire service, podcast suite or dedicated video host |
| [WriteFreely](../../research-sources/news-media-candidates/04-writefreely.md) | supplied note, evidence date 2026-10-14 | Independent publishing / writer collective | **62/100** | Lightweight self-hosted writing, blogs and collectives | No demonstrated approvals, assignment, revision audit or rich media operations |
| [Keila](../../research-sources/news-media-candidates/05-keila.md) | supplied note, evidence date 2026-10-14 | Newsletter publishing | **58/100** | Self-hosted newsletter production and direct-reader campaigns | Not an editorial CMS or newsroom |
| [listmonk](../../research-sources/news-media-candidates/06-listmonk.md) | supplied note, evidence date 2026-10-14 | Newsletter and mailing-list operations | **74/100** | Subscriber management, segmentation, campaigns and multi-SMTP delivery | Score is not newsroom fit; AGPL and security controls matter |
| [PeerTube](../../research-sources/news-media-candidates/07-peertube.md) | supplied note, evidence date 2026-10-14 | Video publishing / federated hosting | **60/100** | Self-hosted channels, video libraries, livestreams and federation | Not an editorial newsroom; multi-component operations and advisories require review |
| [MediaCMS](../../research-sources/news-media-candidates/08-mediacms.md) | supplied note, evidence date 2026-10-14 | Video and media library publishing | **61/100** | Self-hosted video/audio/media archive and portal | Release-channel discrepancy; not a demonstrated newsroom or syndication system |
| [Castopod](../../research-sources/news-media-candidates/09-castopod.md) | supplied note, evidence date 2026-10-14 | Podcast hosting and publishing | **58/100** | Podcast RSS, Podcasting 2.0 metadata, federation and audience interaction | No verified newsroom workflow or current tagged release |
| [WordPress](../../research-sources/news-media-candidates/10-wordpress.md) | supplied note, evidence date 2026-10-14 | Broad publishing platform / news and magazine sites | **78/100** | General-purpose newspaper/magazine sites with extensions | Core is not a specialist wire/newsroom product; extensions are separate |

## Candidate assessments

### 1. Superdesk — specialist newsroom / newswire production

**Evidence:** [dated supplied evidence note](../../research-sources/news-media-candidates/01-superdesk.md) · [repository](https://github.com/superdesk/superdesk) · [official site](https://www.superdesk.org/) · [official docs](https://docs.superdesk.org/)

Superdesk is the clearest specialist newsroom candidate. Supplied product materials describe editorial-controlled workflows, templates and automation for recurring tasks, and end-to-end creation through distribution. The content model covers text, photos, graphics, audio, video and packages, and the product site describes multimedia repository management. The supplied research characterizes it as particularly relevant to agencies and editorial desks, distinct from the separately marketed Superdesk Publisher website product.

Its architecture is described as modular and API-centric, with separate server API and client applications; repository setup names MongoDB, Elasticsearch 7+, Redis, Python 3.8 and Node.js/npm, and Docker Compose instructions are provided. These are dated project instructions, not confirmation of a currently supported production topology. REST/content APIs and multi-channel distribution are claimed, while legacy Content API material is read-oriented and explicitly omits workflow-management endpoints. Current feeds, syndication and API capabilities therefore remain validation items.

**License and operations.** AGPL-3.0. Network-use source-offer implications may apply to modifications and hosted use; legal review is required for the intended deployment. Commercial support, integrations and Publisher are separate considerations. The latest surfaced release was **v2.8.5, 2025-02-12**; the latest commit API returned a commit dated **2026-10-14**. The security policy displayed support for **v2.6.x and v2.5.x**, apparently inconsistent with the newer release/activity. The GitHub advisory endpoint was rate-limited, so no conclusion about advisories is made.

**Arabic/RTL and unknowns.** Arabic/RTL was not verified. Detailed roles, permissions, revisions, approval states, scheduling and embargo guarantees were not independently verified. Captioning, transcoding, CI/test status and current runtime support also remain open.

**Screening view:** Advance only to bounded technical/editorial validation. It is the best fit here for a genuine newsroom/newswire requirement, but its score must not be read as adoption approval.

**Score:** **75/100** — Newsroom/editorial fit 19/20; publication/workflow/content ops 12/15; maintenance 12/15; security/dependencies 8/15; docs/tests 7/10; license clarity 9/10; setup/deployment 3/5; distribution/APIs/media integrations 4/5; Arabic/RTL 1/5. **Sum: 75/100.**

### 2. Newspack — news publisher platform / newspaper operations

**Evidence:** [dated supplied evidence note](../../research-sources/news-media-candidates/02-newspack.md) · [repository](https://github.com/Automattic/newspack-plugin) · [Newspack site](https://newspack.com/) · [features/services](https://newspack.com/features-and-services/)

Newspack is explicitly designed for news organizations, especially small and medium-sized publishers, and combines WordPress publishing with newsletter, audience, membership, donation, subscription, premium-content, advertising and analytics integrations. It is a publisher platform—not a standalone CMS, video host or podcast service. Newspack-specific assignment, approval, embargo and newsroom-role enhancements were not verified beyond the WordPress baseline; wire/syndication, specialist search and editorial API capabilities were also not established.

**Repository and service boundary.** The examined `Automattic/newspack-plugin` repository was archived/read-only on **2026-08-18**, with individual repositories announced as no longer receiving updates after consolidation into `newspack-workspace`. The visible release evidence included **v6.42.5** and **v6.43.0-alpha.2 dated 2026-06-17**, but the archived repository is not an appropriate basis for adoption. The replacement monorepo/Download Center must be inspected and pinned.

**License and security.** GPL-2.0/GPL-2-or-later as described in the supplied evidence; hosted WP Cloud, CDN, automatic updates, backups, security scanning, support, migration and training are separate offerings. No `SECURITY.md`/security policy was detected; the README directs vulnerability reports to HackerOne. No dependency audit or CVE scan was performed. Exact PHP, WordPress, database and dependency support was not verified.

**Arabic/RTL and media.** Arabic/RTL was not verified for Newspack-specific interfaces. WordPress/theme RTL support must not be assumed to cover every component. The reviewed material did not document dedicated video hosting, podcast/audio production or DAM/photo-desk tooling, captions or transcription.

**Screening view:** High-interest publisher candidate only after validating the replacement distribution channel, supported runtime, security posture, tests and Arabic RTL. Do not adopt from the archived repository.

**Score:** **62/100** — Newsroom/editorial fit 18/20; publication/workflow/content ops 11/15; maintenance 2/15; security/dependencies 7/15; docs/tests 6/10; license clarity 10/10; setup/deployment 3/5; distribution/APIs/media integrations 4/5; Arabic/RTL 1/5. **Total: 62/100.**

### 3. Ghost — digital publishing / magazine and newsletter

**Evidence:** [dated supplied evidence note](../../research-sources/news-media-candidates/03-ghost.md) · [repository](https://github.com/TryGhost/Ghost) · [features](https://ghost.org/features/) · [hosting docs](https://docs.ghost.org/hosting)

Ghost is a strong fit for an independent magazine or digital publisher prioritizing an owned editorial site, newsletters, memberships and paid subscriptions. It provides five documented roles, multi-author posts, tags, metadata, scheduling and APIs. The Content API exposes posts, pages, tags, authors, tiers and settings; the Admin API supports authenticated publishing workflows, integrations and webhooks. RSS, XML sitemaps, newsletter delivery, memberships, paid tiers and ActivityPub-related features are documented.

It is not a complete newsroom/editorial suite. The reviewed sources did not establish assignment desks, configurable approval pipelines, wire intake, syndication-rights management, enterprise revision governance, comprehensive revision control, or a podcast production/video-hosting service. Audio/video cards and responsive image/figure handling are publishing features, not evidence of transcoding, a DAM, podcast analytics or caption workflows.

**Architecture and operations.** Node.js publishing application with Admin and Content REST APIs, theme-driven public site, Ghost-CLI and separate ActivityPub/analytics services. Recommended self-hosting includes Ubuntu 22.04/24.04/26.04 LTS, Node.js 22 LTS, MySQL 8.0/8.4, NGINX, systemd, at least 1 GB memory and a non-root Ghost-CLI user. Docker Compose for additional services is marked preview. Ghost(Pro) is a separate managed service.

**License and security.** MIT for source code; Ghost and its logo remain trademarks; Ghost(Pro) is commercial hosting. The policy accepts private reports at security@ghost.org and documents response targets and controls, but the advisory inventory could not be audited from the rendered page. The release page showed **v6.70.0 and v6.69.0** with recent 6.x cadence; **v6.66.0** had an npm packaging failure and the project advised v6.67.0. Main-branch commits dated **2026-10-14 and 2026-10-13** are separate from the release channel.

**Arabic/RTL.** No official end-to-end Arabic/RTL guarantee was found. Test the editor, selected theme, fonts, email clients, mixed-direction text and member flows.

**Screening view:** Promising for owned digital publishing and reader revenue; pair with a newsroom system if assignment, multi-stage approval, wire intake or extensive media production is required.

**Score:** **79/100** — Newsroom/editorial fit 15/20; publication/workflow/content ops 12/15; maintenance 14/15; security/dependencies 11/15; docs/tests 8/10; license clarity 10/10; setup/deployment 4/5; distribution/APIs/media integrations 3/5; Arabic/RTL 2/5. **Total: 15+12+14+11+8+10+4+3+2=79/100.**

### 4. WriteFreely — independent publishing / writer collective

**Evidence:** [dated supplied evidence note](../../research-sources/news-media-candidates/04-writefreely.md) · [repository](https://github.com/writefreely/writefreely) · [official site](https://writefreely.org/) · [scheduling docs](https://writefreely.org/docs/main/writer/scheduling)

WriteFreely is a lightweight self-hostable Go writing and publishing application for independent publications, blogs and multi-author communities. It supports drafts, editing, multiple blogs per user, hashtags, pinned/static pages, future-dated publication, RSS and ActivityPub federation. Future-dated posts are not federated until supported. The platform’s own documentation describes Chorus mode as half-baked and oriented to group knowledge-sharing rather than editorial production.

It does not demonstrate an assignment desk, multi-stage approval, revision history/audit trail, granular newsroom role matrix, wire intake or rich media asset operations. API completeness and stability were not established because the detailed API page did not yield extractable content.

**License, release and security.** AGPL-3.0. The repository’s license and contributor materials support commercial use under AGPL terms, with source-availability obligations for modified network services; legal review remains appropriate. The latest supplied release was **v0.17.2**, which reports a critical closed-registration invite-code fix; **v0.17.0 and v0.17.1** also included security fixes. The security page lists **GHSA-cfcq-76gr-62x8 (Moderate)** and **GHSA-jgpr-4649-rf4p (High)** published **2026-07-17**. Run a current patched release and review configuration.

**Arabic/RTL.** The project explicitly claims first-class support for non-Latin and RTL scripts and UI localization in 20+ languages. This is the strongest Arabic/RTL evidence in the set, but it does not prove complete Arabic newsroom localization. Test editing, mixed-direction text, feeds, admin UI and embedded media.

**Screening view:** Consider for independent editorial blogs, writer collectives and lightweight communities; do not treat it as a Superdesk-class newsroom.

**Score:** **62/100** — Newsroom/editorial fit 5/20; publication/workflow/content ops 8/15; maintenance 12/15; security/dependencies 8/15; docs/tests 7/10; license clarity 9/10; setup/deployment 4/5; distribution/APIs/media integrations 4/5; Arabic/RTL 5/5. **Total: 62/100.**

### 5. Keila — newsletter publishing

**Evidence:** [dated supplied evidence note](../../research-sources/news-media-candidates/05-keila.md) · [repository](https://github.com/pentacent/keila) · [official site](https://www.keila.io/) · [docs](https://www.keila.io/docs)

Keila is a self-hostable newsletter creation and campaign-management component. Its editor supports visual blocks, Markdown, MJML, HTML and plain text, with image editing/resizing. Campaign scheduling, contact segments, signup forms, public archives and campaign/contact APIs are documented; SMTP, AWS SES, SendGrid, Mailgun and Postmark delivery adapters are available.

It is not a newsroom suite or editorial CMS. Reviewed sources did not document story assignment, editorial roles/approval, copy desk, revision history, newsroom planning, wire ingestion or editorial syndication feeds. No video/audio hosting, captions/transcripts or audiovisual publishing workflow was established.

**Architecture and license boundary.** Elixir/Phoenix/LiveView with Ecto/PostgreSQL and Oban; official Docker image and sample Compose are supplied. Core is **AGPL-3.0-or-later**, but the logo and `extra/` are excluded, and cloud-only components—including billing and “Send with Keila”—are informational/separately licensed rather than automatically covered by the core license. This is a material legal boundary.

**Release and security.** Version **0.30.3** was identified in repository metadata and the GitHub release page. Main-branch commits run through **2026-10-02**. No security policy/`SECURITY.md` was detected and no advisories surfaced on the reviewed page; that is not evidence of no vulnerabilities. No independent audit, dependency scan, live deployment, deliverability or backup/restore test was performed.

**Arabic/RTL.** Localization/language features are documented, but Arabic translation and complete RTL admin/forms/email rendering were not established. Test content and recipient clients.

**Screening view:** Use as a focused newsletter component where another CMS/newsroom owns editorial production.

**Score:** **58/100** — Newsroom/editorial fit 4/20; publication/workflow/content ops 9/15; maintenance 14/15; security/dependencies 7/15; docs/tests 7/10; license clarity 8/10; setup/deployment 4/5; distribution/APIs/media integrations 4/5; Arabic/RTL 1/5. **Total: 58/100; components sum exactly to total.**

### 6. listmonk — newsletter and mailing-list operations

**Evidence:** [dated supplied evidence note](../../research-sources/news-media-candidates/06-listmonk.md) · [repository](https://github.com/knadh/listmonk) · [official site](https://listmonk.app/) · [security guidance](https://listmonk.app/docs/security-reports/)

listmonk is the strongest focused newsletter-operations candidate in the set. It supports campaign authoring, granular multi-user permissions, lists, single/double opt-in, SQL-based segmentation, templates, analytics, multi-SMTP queues and transactional messaging. A media library with S3-compatible backend is documented, but this is email-asset handling—not video hosting, podcast publishing or broadcast media management.

It is not an editorial CMS or newsroom replacement. No story assignments, editorial review stages, article revision/versioning, wire intake, general article feeds or newsroom search were established.

**Operations, release and security.** Standalone Go/Vue application with PostgreSQL 12+; binary/container lifecycle is self-managed and upgrade guidance requires a PostgreSQL backup. **v6.2.0, 2026-06-26** includes security fixes for campaign/list permission validation, ZIP Slip in CSV import and API-token hashing changes. Official security guidance highlights privileged SQL subscriber queries, stored-XSS risk from arbitrary uploaded file types, campaign HTML/script execution on archive pages and powerful Go templates with resource-exhaustion implications. Current unresolved advisories and an independent audit were not established.

**License and Arabic/RTL.** AGPL-3.0, including copyleft and network-use/source-offer considerations where applicable. Arabic interface translation was added in **v6.2.0**, but RTL behavior across admin, builder, forms, templates and delivered mail was not verified.

**Screening view:** Strong candidate for newsletter audience/distribution infrastructure alongside an editorial CMS/newsroom. Its **74/100** should not be interpreted as newsroom completeness.

**Score:** **74/100** — Newsroom/editorial fit 8/20; publication/workflow/content ops 13/15; maintenance 14/15; security/dependencies 11/15; docs/tests 8/10; license clarity 9/10; setup/deployment 5/5; distribution/APIs/media integrations 4/5; Arabic/RTL 2/5. **Correct sum: 74/100.**

### 7. PeerTube — video publishing / federated hosting

**Evidence:** [dated supplied evidence note](../../research-sources/news-media-candidates/07-peertube.md) · [repository](https://github.com/Chocobozzz/PeerTube) · [official site](https://joinpeertube.org/) · [architecture docs](https://docs.joinpeertube.org/contribute/architecture)

PeerTube is a video-first self-hosted and federated platform. It supports uploads/imports, livestreams, thumbnails, transcoding, chapters, captions/subtitles (VTT/SRT and optional automatic transcription), embeds, privacy/download controls, replace-file versioning, optimized audio generation, REST API, CLI, ActivityPub, RSS, channel/video search and scheduled publication. It is appropriate for publisher channels, documentaries and audience-facing video libraries.

It is not a newsroom/editorial suite. Documentation does not demonstrate assignments, story packages, copy-editing approvals, embargo governance, editorial revision history or a wire desk. Podcast/audio support is not established as a full podcast production suite.

**Operations and security.** TypeScript/Node.js/Express, Angular, PostgreSQL, Redis/BullMQ, Nginx, WebTorrent/WebRTC, FFmpeg and Mocha. Official production installation is multi-component and requires operators to manage storage, network, service management, backups, updates and federation/moderation policy. **v8.3.0, 2026-09-15** is the supplied latest official release; the FAQ says roughly four major releases yearly, no LTS, and only the latest stable is supported. Security advisories include multiple 2026 high/critical and moderate reports, including role-check abuse, federated resource exhaustion, resolver SSRF bypass, protected-video metadata leak and SVG XSS. Verify fixed versions and plugin/dependency exposure.

**License and Arabic/RTL.** AGPL-3.0-or-later. Commercial use and charging for services are allowed under the terms, with source disclosure implications for modified network services. Localization is documented, but Arabic completeness and RTL across admin, player, mobile, feeds and user workflows were not verified.

**Screening view:** Shortlist for video publishing/federation only; pair with a newsroom/editorial system.

**Score:** **60/100** — Newsroom/editorial fit 5/20; publication/workflow/content ops 10/15; maintenance 12/15; security/dependencies 7/15; docs/tests 8/10; license clarity 9/10; setup/deployment 3/5; distribution/APIs/media integrations 5/5; Arabic/RTL 1/5. **Sum: 60/100.**

### 8. MediaCMS — video and media library publishing

**Evidence:** [dated supplied evidence note](../../research-sources/news-media-candidates/08-mediacms.md) · [repository](https://github.com/mediacms-io/mediacms) · [official site](https://mediacms.io/) · [admin/developer docs](https://github.com/mediacms-io/mediacms/blob/main/docs/admins_docs.md)

MediaCMS provides a self-hosted media portal/channel/archive for video, audio, images and PDFs. It documents uploads, playlists, trimming, chapters, transcoding/HLS, profiles/resolutions, multilingual captions, editable SRT/VTT, locally run Whisper transcription/translation, visibility states, categories/groups, RBAC, collaboration, bulk actions, user approval options, embeds, social sharing, search, Moodle/LTI and SAML integrations.

Those are media-publishing operations, not evidence of a newsroom assignment desk, article lifecycle revisions, embargo/calendar scheduling, wire intake or robust syndication feeds. Federation was not established.

**Release, operations and security.** Python/Django, React, Celery, Redis, PostgreSQL, Nginx/Gunicorn, FFmpeg and Bento4; Docker Compose or automated installation. The supplied evidence records a release-page tag **8.4.0 dated 2026-08-25**, while main-branch history contains **9.2.1 dated 2026-10-07**; confirm the supported channel with maintainers. The security policy targets latest stable and lists a high-severity **CVE-2024-52004**, affecting pre-4.1.0 versions and patched in 4.1.0. A historical fix does not establish current versions as vulnerability-free. No independent dependency scan or hands-on deployment was performed.

**License and Arabic/RTL.** AGPL-3.0. Commercial use is permitted under AGPL terms, but copyleft/network source-offer obligations can matter; commercial services are separate. Translations exist, but Arabic and RTL behavior were not verified.

**Screening view:** Shortlist for a self-hosted media archive or companion portal, not an editorial newsroom substitute.

**Score:** **61/100** — Newsroom/editorial fit 5/20; publication/workflow/content ops 11/15; maintenance 13/15; security/dependencies 8/15; docs/tests 7/10; license clarity 9/10; setup/deployment 4/5; distribution/APIs/media integrations 3/5; Arabic/RTL 1/5. **Total: 61/100.**

### 9. Castopod — podcast hosting and publishing

**Evidence:** [dated supplied evidence note](../../research-sources/news-media-candidates/09-castopod.md) · [repository](https://github.com/ad-aures/castopod) · [official docs](https://docs.castopod.org/main/en/) · [official site](https://castopod.com/en)

Castopod is a specialist self-hosted podcast platform. It supports audio podcast publishing/hosting, transcripts and subtitle metadata/files, chapters, soundbites, optional generated episode video clips, RSS, Podcasting 2.0 metadata, podcast import/export, WebSub, ActivityPub/Fediverse interaction and embeddable players. It is a component for podcast operations, not a newsroom CMS, general CMS, video host or DAM.

The supplied review found no evidence of newsroom assignment/approval queues, revision/version history, editorial scheduling controls, wire ingestion, general news-desk workflows, broad external newsroom API or established moderation controls.

**Operations, release and security.** PHP 8.1+, CodeIgniter 4, MySQL 5.7+ or MariaDB 10.2+, HTTPS, cron and optional FFmpeg; media can use local or S3-compatible storage. A synchronized NTP clock is required for federation requests. The latest-release API returned **404** at the evidence date, so no current tagged release was confirmed through that endpoint. Latest-commit evidence was **2026-06-05**. The repository has no configured `SECURITY.md`; README gives security@castopod.org. No advisories displayed is not evidence of no vulnerabilities.

**License and Arabic/RTL.** AGPL-3.0, with network-use/source-offer implications for modified hosted versions. Internationalization is documented but Arabic translation and RTL behavior across admin, player, feeds and workflows were not specifically established.

**Screening view:** Use only as a podcast publishing/distribution component next to a distinct newsroom/editorial system.

**Score:** **58/100** — Newsroom/editorial fit 4/20; publication/workflow/content ops 10/15; maintenance 10/15; security/dependencies 7/15; docs/tests 7/10; license clarity 9/10; setup/deployment 4/5; distribution/APIs/media integrations 5/5; Arabic/RTL 2/5. **Sum = 58/100.**

### 10. WordPress — broad publishing platform / news and magazine sites

**Evidence:** [dated supplied evidence note](../../research-sources/news-media-candidates/10-wordpress.md) · [repository mirror](https://github.com/WordPress/wordpress-develop) · [official site](https://wordpress.org/) · [requirements](https://wordpress.org/about/requirements/) · [REST API](https://developer.wordpress.org/rest-api/)

WordPress is the broadest general-purpose publishing baseline in the set. Core provides roles and capabilities, revisions, autosaves/restore, scheduled posts, media library support for images/video/audio/files, feeds and a JSON REST API. It is suitable for newspaper and magazine sites, but it is not a specialist newsroom or wire-service product. Newspack, themes, plugins, hosted services and other extensions are separate scope and licensing decisions.

Core roles include Editor, Author, Contributor, Administrator and Subscriber; Contributors cannot publish, and Editors can manage others’ posts. This does not establish specialist assignment desks, configurable multi-stage approvals, legal review or embargo controls. Core media documentation covers captions and alt text, but not a specialist video host/CDN, podcast delivery/analytics or complete audiovisual transcription workflow.

**Operations, release and security.** Recommended stack is PHP 8.3+, MariaDB 10.11+ or MySQL 8.0+, HTTPS and Apache/Nginx. Operators own updates, backups, monitoring, media delivery and scaling. Scheduling mechanics may depend on site visits unless real cron is configured; no real-time guarantee was inferred. **WordPress 7.1.3 released 2026-10-06** with seven security and four bug fixes; **7.0.2 on 2026-07-17** addressed critical/high issues. The supplied security evidence includes stored XSS, DoS, second-order SQL injection, an Author-role privilege issue, private/unpublished comment disclosure, SQL injection and a REST API batch-route RCE issue. These examples are not exhaustive, and extensions/hosting materially affect exposure.

**License and Arabic/RTL.** GPLv2-or-later; derivatives such as themes/plugins generally carry GPL implications, but each component, service, trademark and asset must be evaluated. WordPress has localization infrastructure, but Arabic RTL was not verified for a selected theme/plugin/custom newsroom interface.

**Screening view:** Retain as a broad publishing platform candidate, particularly where ecosystem breadth matters. Pair with a specialist newsroom tool or carefully selected extensions when newsroom production depth is required.

**Score:** **78/100** — Newsroom/editorial fit 10/20; publication/workflow/content ops 13/15; maintenance 14/15; security/dependencies 10/15; docs/tests 9/10; license clarity 10/10; setup/deployment 4/5; distribution/APIs/media integrations 4/5; Arabic/RTL 4/5. **Sum = 78/100.**

## Use-case groupings and non-substitution map

### A. Newsroom production and wire/news agency

- **Primary candidate:** Superdesk.
- **Possible publishing complements:** WordPress, Newspack, Ghost or a custom consumer-facing layer, depending on the publication model.
- **Not direct substitutes:** listmonk/Keila (email operations), PeerTube/MediaCMS (media portals) and Castopod (podcasts) lack demonstrated newsroom desks, approval governance and wire workflows.

**Validation priority:** current workflow model, role/permission matrix, assignments, revisions, scheduling/embargo, wire ingestion, syndication rights, APIs, asset metadata/captions, security advisory status and Arabic/RTL.

### B. Editorial CMS / publisher platforms and broader/general CMS candidates

- **Editorial publisher platforms:** Ghost for independent publishing, memberships and newsletters; Newspack for news-publisher operations if the replacement distribution channel is current and supportable; WriteFreely for lightweight writing-first publications and collectives.
- **Broader/general CMS:** WordPress for broad extensibility and newspaper/magazine sites; its core should not be conflated with Newspack or specialist newsroom products.
- **Not direct substitutes:** newsletter engines alone do not provide a full public editorial site or newsroom workflow; video/podcast candidates are media channels, not article CMSs.

**Validation priority:** editorial roles, revisions, scheduling, search/archive, SEO and feeds, selected theme/plugin behavior, update ownership, media delivery, newsletter integration and Arabic/RTL.

### C. Newsletter and direct-reader distribution

- **Campaign/editorial email component:** Keila.
- **Audience/list/segmentation and delivery operations:** listmonk.
- **Publisher orchestration:** Ghost, WordPress/Newspack or Superdesk may supply content upstream, but the exact integration and ownership boundary must be designed.

**Validation priority:** permissions, HTML/script handling, unsubscribe/consent flows, segmentation, SMTP/deliverability, archive exposure, backups, API/webhooks, AGPL boundaries and Arabic/RTL in both editor and recipient clients.

### D. Video and media archive/channel

- **Federated/video-first:** PeerTube.
- **Media library/transcoding/captions:** MediaCMS.
- **Possible upstream editorial layer:** WordPress, Ghost or Superdesk, but no supplied evidence proves a complete integration.

**Validation priority:** storage, transcoding profiles, HLS, captions/subtitles and transcription, moderation, privacy/access controls, federation, search, backups, patch cadence, dependencies, current release channel and Arabic/RTL.

### E. Podcast publishing

- **Specialist candidate:** Castopod.
- **Possible upstream editorial layer:** a newsroom or publisher CMS; integration/API and workflow ownership were not verified.

**Validation priority:** RSS and Podcasting 2.0 compliance in the target deployment, imports/exports, transcripts/chapters, clip generation, storage, cron, moderation/federation, release status, dependencies, security and Arabic/RTL.

## Portfolio gaps

Across the supplied set, the following gaps remain material:

1. **No candidate has verified end-to-end Arabic/RTL acceptance.** Even where localization or RTL claims exist, no hands-on proof covers editing UI, search, mixed-direction punctuation/bidi, roles/workflows, themes, feeds, newsletters, player/mobile surfaces or delivered output.
2. **No single candidate demonstrably covers the entire portfolio.** Superdesk covers newsroom production; WordPress/Ghost/Newspack cover public publishing; listmonk/Keila cover email; PeerTube/MediaCMS cover video; Castopod covers podcasts. A composable architecture is more realistic than treating one focused service as a universal platform.
3. **Wire intake, syndication rights and newsroom governance are weakly evidenced outside Superdesk—and remain partly unverified even there.** Do not infer these capabilities from generic APIs, feeds, ActivityPub or content publishing.
4. **Rich-media production is not established as a unified capability.** Captioning, transcoding, transcription, DAM/photo-desk management, broadcast workflows and rights metadata vary widely and remain incomplete or unverified for most candidates.
5. **Current supported release channels are unclear for some candidates.** Superdesk’s displayed security support appears behind its surfaced release; Newspack’s examined repository is archived; MediaCMS has release-page/main-branch divergence; Castopod’s latest-release API returned 404; Ghost’s main branch and release channel are distinct.
6. **Security evidence is uneven and not an audit.** Some projects disclose advisories and policy details; others have no `SECURITY.md` or only a contact address. No dependency/SBOM scan, penetration test, compliance assessment, or production configuration review was supplied.
7. **Operational ownership is unresolved.** Self-hosting shifts responsibility for upgrades, backups, secrets, monitoring, storage, email deliverability, CDN/reverse proxy and incident response to the operator. Hosted offerings are separate products and licenses.
8. **License and integration boundaries need legal/architecture review.** AGPL obligations, GPL extension inheritance questions, MIT trademark separation, Newspack hosted services, and Keila’s excluded files/cloud-only components must not be flattened into a single “open source” label.
9. **Test evidence is not comparable.** Documentation, CI runs and test commands show project activity or available process, not coverage, reproducibility, quality or security assurance.

## Focused validation recommendations

### Phase 1 — establish current, supportable artifacts

1. Pin a target version/release channel for each shortlisted candidate; do not use an archived repository, nightly build or main branch without an explicit support decision.
2. Reconcile the version/support discrepancies: Superdesk release versus security-policy support; Newspack archived plugin versus `newspack-workspace`/Download Center; MediaCMS release tag versus 9.x branch; Castopod release-channel 404; Ghost main branch versus published release.
3. Produce an SBOM and dependency/advisory review for the exact build, including plugins, themes, integrations, FFmpeg, Nginx, workers and container images where used.
4. Obtain legal review of AGPL/GPL/MIT boundaries, modified hosted services, source offers, trademarks, excluded assets and commercial/hosted offerings.

### Phase 2 — run a representative Arabic/RTL proof of concept

Use the same content pack across candidates: Arabic-only text; Arabic/English mixed headlines; numerals and dates; punctuation and parentheses; quoted text; long titles; links; tables or lists; image captions/alt text; video/podcast titles; subscriber forms; email output; search queries; RSS/JSON output; and moderation/member flows. Test both author/editor and reader/recipient surfaces, including mobile and the selected theme/template. Record defects rather than awarding RTL from generic localization claims.

### Phase 3 — test by product class

- **Superdesk:** assignments, desks, roles, approval/revision states, embargo/scheduling, packages, wire ingest, syndication, feeds, API auth/rate limits, media metadata/captions and production deployment.
- **WordPress/Newspack/Ghost/WriteFreely:** authoring roles, revisions, scheduling, search/archive, editorial approvals, theme/plugin boundaries, backups/restores, update paths and public rendering.
- **listmonk/Keila:** consent and unsubscribe, role segregation, segmentation, template safety, archive exposure, SMTP/SES deliverability, webhooks/API, restore and campaign audit history.
- **PeerTube/MediaCMS:** upload/replace/version behavior, transcoding/HLS, subtitles/captions, transcription, access control, moderation, federation, storage growth, backup/restore and patching.
- **Castopod:** RSS validation, Podcasting 2.0 metadata, transcript/chapter delivery, import/export, clip generation, cron, storage, federation/moderation and integration with the chosen editorial system.

### Phase 4 — make portfolio decisions, not just product decisions

Model at least two target architectures:

1. **Newsroom-led:** Superdesk for production plus a selected public CMS and focused newsletter/video/podcast services as needed.
2. **Publisher-led:** WordPress, Ghost or current Newspack replacement for public publishing, with listmonk/Keila, PeerTube/MediaCMS and Castopod added only where their focused capabilities are required.

For each architecture, document system-of-record ownership for article text, media assets, subscriber data, podcast/video metadata, identity, permissions, revisions, consent, analytics and publication status. Require a tested migration/export path before approval.

## Final recommendation

Keep **Superdesk** as the only direct specialist-newsroom shortlist item; keep **Ghost, WordPress and a validated current Newspack distribution** in the publisher-CMS shortlist; keep **listmonk and Keila** as newsletter components; **PeerTube and MediaCMS** as video/media components; **Castopod** as a podcast component; and **WriteFreely** as a lightweight writing/community option. Advance none beyond provisional screening until the exact release, security/dependency posture, operational model, license boundary, representative workflow and Arabic/RTL proof of concept are validated.
