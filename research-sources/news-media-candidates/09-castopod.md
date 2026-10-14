# Castopod — dated screening note (2026-10-14)

**Candidate:** Castopod (`ad-aures/castopod`)  
**Domain/category:** News & Media — Podcast hosting and publishing  
**Screening status:** Provisional only; this is not adoption approval.

Castopod is purpose-built podcast hosting/publishing software, not a newsroom/editorial suite. Official project documentation explicitly contrasts Castopod's podcast-specific scope with WordPress as a full-fledged CMS. It supports RSS distribution and Podcasting 2.0 episode metadata, audience interaction and analytics; these make it a relevant podcast operations component, but do not establish wire-service management, general news publishing, or newsroom desk workflows. [1] [2]

## Fit and capability boundaries

Castopod provides multi-user accounts and contributor roles, podcast/episode creation and publishing, podcast import/export, RSS feeds, WebSub broadcast, an embeddable player, built-in analytics, and a built-in Fediverse social network where users can post, share, favourite and comment on episodes. Documented Podcasting 2.0 metadata includes GUID, locked, transcripts, funding, chapters, location, persons and soundbites. The docs mention customizable podcast marketing and SEO metadata. These are publishing operations for audio podcasts, not an editorial assignment/approval system: documentation reviewed did not establish newsroom editorial queues, revisions/version history, scheduled publication controls, wire ingestion, or general content syndication. [1] [2]

Media features include audio podcast hosting, file/media storage, transcript and subtitle support, and optional generated video clips and soundbites. FFmpeg is required for video-clip generation. This is not a general-purpose video hosting or DAM suite. A comprehensive standalone API for external newsroom integration was not verified in the sources opened; RSS, WebSub and ActivityPub are documented distribution/interoperability paths. Federation means audience interaction extends beyond the site, but moderation controls were not sufficiently evidenced to assess newsroom community policy needs. [1] [2] [3]

Arabic/RTL: the documentation lists multiple translated locales but does not specifically evidence Arabic translation or RTL user-interface support. Treat this as unverified and test in the intended deployment before considering it usable for Arabic-first publishing. [1]

## License, architecture and operations

The canonical repository identifies the project as GNU Affero General Public License v3.0; GitHub license metadata reports SPDX `AGPL-3.0`, and the repository license file is the AGPL-3.0 text. AGPLv3 permits commercial use and charging for copies/services; it is a copyleft license with network-use source-offer obligations for modified versions. Commercial use is not categorically barred, but modification, distribution, and SaaS deployment boundaries should receive legal review for the intended integration and any combination with proprietary systems. [4] [5]

The application is PHP on CodeIgniter 4 and uses MySQL 5.7+ or MariaDB 10.2+ (MariaDB recommended). Official installation requirements include PHP 8.1+, HTTPS and an NTP-synchronized clock for federation request validation. A scheduled cron task runs background tasks; without it, RSS import, Fediverse activity broadcasting, WebSub episode broadcast and video generation do not work. Media may live on local filesystem or S3-compatible storage. Optional FFmpeg supports video clips; Redis and CDN are recommendations, not mandatory dependencies. [1] [3]

The official documentation describes GDPR/CCPA/LGPD-aligned analytics and IABv2 measurement as project feature claims. This screening does not independently validate compliance, performance, security, or measurement conformance. [1]

## Maintenance, security and assurance

As of the evidence date, GitHub's latest-commit API returned commit `e439b31ac2471f39de11fb9db0c82a23c88c1bb5`, dated 2026-06-05. The GitHub latest-release endpoint returned 404, so a current tagged release could not be confirmed by that endpoint; this does not prove no release exists through another channel. The repository contains a contribution guide and docs link to contributor testing/build instructions, but this review did not execute tests or independently establish test coverage. [4] [6] [7]

GitHub's repository security page reports no security policy (`SECURITY.md`) configured. The repository README asks vulnerability reporters to contact `security@castopod.org`. The inspected security page showed no published advisories; absence of listed advisories is not evidence that the code has no vulnerabilities. Dependency posture and vulnerability history require a separate dated audit. [4] [8]

## Screening score

Comparable 100-point rubric; component scores sum to **58/100**:

| Dimension | Score | Basis |
|---|---:|---|
| Newsroom/editorial fit (20) | 4 | Excellent specialist podcast focus; no evidence of general newsroom desk/editorial suite. |
| Publication/workflow/content ops (15) | 10 | Episode publishing, roles, metadata, imports; no verified revision/approval/scheduling/wire workflow. |
| Maintenance (15) | 10 | Recent commit dated 2026-06-05, but latest release endpoint was 404 and cadence is uncertain. |
| Security/dependencies (15) | 7 | Contact email exists, but no SECURITY.md; no independent dependency/vulnerability audit. |
| Docs/tests (10) | 7 | Substantial official documentation and contributor guide; tests not run/coverage unverified. |
| License clarity (10) | 9 | AGPL-3.0 clearly identified; obligations still require deployment-specific legal review. |
| Setup/deployment (5) | 4 | Clear PHP/MySQL/MariaDB requirements, cron, storage options; operational maintenance remains self-hosted. |
| Distribution/APIs/media integrations (5) | 5 | RSS, WebSub, ActivityPub, transcript metadata and generated clips; broad external API unverified. |
| Arabic/RTL (5) | 2 | Internationalization exists, but Arabic and RTL not verified. |
| **Total** | **58** | **Provisional screening score, not an adoption decision.** |

**Recommendation:** Consider only as a specialist self-hosted podcast publishing and distribution candidate, potentially alongside a separate newsroom CMS/editorial system. Do not score it as a replacement for a newsroom suite. Before any adoption decision, verify Arabic RTL behavior, editorial integration/API requirements, moderation controls, active tagged release channel, dependency/security status, and legal implications of AGPLv3 for the intended deployment.

## References

[1]: https://docs.castopod.org/main/en/ "Castopod official documentation"  
[2]: https://castopod.com/en "Castopod official product site"  
[3]: https://docs.castopod.org/main/en/getting-started/install/ "Official installation guide"  
[4]: https://github.com/ad-aures/castopod "Canonical Castopod repository"  
[5]: https://github.com/ad-aures/castopod/blob/develop/LICENSE.md "Castopod license file"  
[6]: https://api.github.com/repos/ad-aures/castopod/commits?per_page=1 "GitHub latest commit API response"  
[7]: https://api.github.com/repos/ad-aures/castopod/releases/latest "GitHub latest release API endpoint (404 at evidence date)"  
[8]: https://github.com/ad-aures/castopod/security "GitHub repository security overview"  
