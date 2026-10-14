# PeerTube — News & Media candidate screening

**Evidence date: 2026-10-14**  
**Candidate:** PeerTube (`Chocobozzz/PeerTube`)  
**Category:** Video publishing / federated hosting  
**Provisional screen only; this is not an adoption approval.**

## Finding

PeerTube is a self-hosted, open-source video hosting and publishing platform with ActivityPub federation, channel/team video management, livestreaming, API-driven publication, and media library functions. It can serve publisher channels, documentaries, and audience-facing video collections. It is **not a newsroom/editorial suite**: official documentation describes uploader/creator workflows and administrator/moderator permissions, not assignment desks, story packages, copy editing, embargo approvals, editorial revisions/audit trails, or wire-service workflows. General-purpose rather than newsroom-specific, as the discovery caveat notes.

## Product and newsroom fit

Publisher-facing functions include channels, uploads/imports, live streaming, scheduled visibility, metadata editing, comments, captions, video replacement, and sharing channel management. The official v8 launch material highlights shared channel management, but documented roles remain Administrator, Moderator, and User; moderators can update any video and manage reports/blocks, rather than providing newsroom-specific granular editorial permission stages. A scheduled video becomes public at a selected date, but this is not evidence of an editorial approval calendar or embargo controls. No native wire/syndication desk or newsroom assignment workflow is documented.

The platform supports publication via its documented REST API and CLI, ActivityPub federation, video/channel subscriptions and RSS feeds. Search and filtering are available in API endpoints. The official site describes following channels with RSS and ActivityPub clients. These are useful distribution features but not a demonstrated news-wire ingestion/syndication system.

Media is video-first: thumbnails and image assets, livestreams, captions/subtitles (VTT/SRT and optional automatic transcription), chapters, transcoding, embeds, and download/privacy controls are documented. Podcast support exists; v8.1 added optimized audio-file generation and fixes for podcast playback issues. Treat that as an audio-capable video platform rather than a full podcast production suite. No dedicated photo-library/editorial asset-management system is established by the cited evidence.

## Technical architecture and operations

Official architecture documentation specifies a TypeScript/Node.js Express server, Angular single-page web client, PostgreSQL for persistent accounts/video metadata/comments/channels, Redis cache and BullMQ task queue, Nginx reverse proxy, ActivityPub APIs, WebTorrent tracker and FFmpeg-powered transcoding tasks. Media is served over HTTP and can use browser WebRTC peer sharing. The production guide documents manual production installation, PostgreSQL, Redis, Nginx and service configuration; the project also links community packages including Docker, but the official guide is not a turnkey hosted SaaS deployment. Release v8.3.0 requires PostgreSQL 14 or later. Operators own storage, bandwidth, moderation, backups, upgrades, and federation policy. Do not infer performance or compliance guarantees from architecture descriptions.

## License and commercial boundaries

The canonical repository identifies **GNU Affero General Public License v3.0 or later (AGPL-3.0-or-later)**; the exact LICENSE file begins “GNU AFFERO GENERAL PUBLIC LICENSE, Version 3.” AGPLv3 permits commercial use and charging for copies/services, subject to its terms. In particular, modified network-served versions trigger source-offer obligations to users interacting with them over a network. This is not proprietary/commercial-use prohibited software. Review dependencies, plugins, trademarks, content licensing, and legal obligations separately before a deployment; no legal advice is implied.

## Maintenance, documentation, tests, and security

At evidence date GitHub API metadata identifies v8.3.0, published **2026-09-15**; it is the latest stable release observed in the official release endpoint. The release includes important migration instructions and PostgreSQL 14+ requirement. The official FAQ says the project aims for about four major releases per year, has no LTS, and supports only the latest stable version. That release cadence plus the recent tagged release is positive maintenance evidence; the FAQ also describes a small maintainer capacity, so operational planning should account for that.

Documentation covers production setup, architecture, moderation, upload/publishing, REST API, federation and tools. GitHub Actions shows extensive active workflow history (2,500+ runs, including Test, Docker, Nightly and Benchmark workflows), but this does not itself establish test coverage or quality. The architecture docs identify Mocha as the test framework.

The repository publishes a vulnerability reporting policy with safe-harbor terms and confidential disclosure guidance. Advisories page showed multiple 2026 disclosures, including high/critical and moderate issues published July, August, and Oct 12. Specifically, the list included moderator role-check abuse, unauthenticated federated resource exhaustion, resolver SSRF guard bypass, protected-video metadata leak, and federated SVG storyboard XSS, among others. The v8.3.0 release notes include security fixes/hardening. These disclosures are meaningful positive evidence of reporting and response, but also a material security risk signal: assess the exact affected/fixed versions and deployment exposure, patch promptly, audit plugins/dependencies and federation/import features, and conduct an independent security review. Do not assume every advisory is fixed merely from its appearance in the advisories list.

## Arabic and RTL

The reviewed official sources document interface customization and translation contributions, but do not establish complete Arabic translation coverage or verified right-to-left layout support across the web interface, player, admin tools, mobile clients, and generated feeds. Treat Arabic/RTL readiness as **unverified**; test a representative Arabic-language instance and content workflow before selection.

## Comparable screening rubric (100 points)

| Dimension | Score | Rationale |
|---|---:|---|
| Newsroom/editorial fit (20) | 5 | Video channel publishing is relevant, but no newsroom assignment/editorial suite or approval stages evidenced. |
| Publication/workflow/content ops (15) | 10 | Strong video upload/edit/schedule/roles/moderation operations; no editorial revision history or newsroom workflow evidence. |
| Maintenance (15) | 12 | v8.3.0 on 2026-09-15 and published cadence; no LTS and small team temper the score. |
| Security/dependencies (15) | 7 | Published policy and current hardening, but numerous recent high/critical advisories are substantial risk; no independent audit evidence reviewed. |
| Docs/tests (10) | 8 | Broad official operational/API docs and visible CI/test workflows; no test coverage metric verified. |
| License clarity (10) | 9 | Canonical repo and license file clearly identify AGPL-3.0-or-later; application and dependency obligations still need review. |
| Setup/deployment (5) | 3 | Self-hosted guide is detailed but requires operators to provision and run a multi-component stack. |
| Distribution/APIs/media integrations (5) | 5 | REST API, CLI, ActivityPub, RSS, embeds, imports/live streaming, captions and podcast support. |
| Arabic/RTL (5) | 1 | No sufficient official confirmation in reviewed sources. |
| **Total** | **60/100** | **Provisional screening score only.** |

## Recommendation

**Shortlist only for a video-publishing/federated hosting component**, particularly where self-hosted channels, public video libraries, livestreams, ActivityPub/RSS reach, and API integration matter. Do not treat it as a replacement for a newsroom CMS/editorial suite. Before any adoption decision, validate the required workflow with editors, test Arabic/RTL, map deployment/backup and federation operations, inspect the current advisory fixes and dependency/plugin exposure, and review AGPL implications with counsel. Screening score 60/100 is comparative triage, not a risk acceptance or procurement approval.

## Opened primary sources

1. Canonical repository and its project description/license: https://github.com/Chocobozzz/PeerTube
2. Exact license text: https://github.com/Chocobozzz/PeerTube/blob/develop/LICENSE
3. Official product site: https://joinpeertube.org/
4. Official production installation guide: https://docs.joinpeertube.org/install/any-os
5. Official architecture documentation: https://docs.joinpeertube.org/contribute/architecture
6. Official publishing/upload/captions/scheduling guide: https://docs.joinpeertube.org/use/create-upload-video
7. Official moderation documentation: https://docs.joinpeertube.org/admin/moderation
8. Official REST API reference: https://docs.joinpeertube.org/api-rest-reference.html
9. Official API getting-started/documentation landing: https://docs.joinpeertube.org/api/
10. Official release list: https://github.com/Chocobozzz/PeerTube/releases
11. Official latest-release GitHub API metadata: https://api.github.com/repos/Chocobozzz/PeerTube/releases/latest
12. Official security policy: https://github.com/Chocobozzz/PeerTube/security
13. Official security advisories: https://github.com/Chocobozzz/PeerTube/security/advisories
14. Official FAQ/release policy: https://joinpeertube.org/faq
15. Official CI/workflow runs: https://github.com/Chocobozzz/PeerTube/actions
16. Official v8.1 announcement (podcast/audio support): https://joinpeertube.org/news/release-8.1
