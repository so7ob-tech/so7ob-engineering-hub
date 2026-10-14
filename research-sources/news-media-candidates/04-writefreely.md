# WriteFreely — News & Media screening

**Evidence date: 2026-10-14**  
**Category:** Independent publishing / writer collective  
**Screening status:** Provisional only; this is not adoption, security, legal, or operational approval.

## Assessment

WriteFreely is an open-source, Go-based, self-hostable writing and publishing platform aimed at individual writers and communities. Its official positioning emphasizes a minimal autosaving editor, clean reading experience, blogs, and ActivityPub community reach—not newsroom assignment desks or production control. It can host independent editorial publications and multi-author writing communities, but it is not a newsroom/editorial suite comparable to Superdesk. [1] [2]

The distinction matters: WriteFreely is a publishing platform/general-purpose blog CMS, not a wire service, newsroom planning/assignment system, video host, or podcast service. It supplies editorial authorship and publication primitives, not a complete newsroom production lifecycle.

## Editorial and publication operations

Authors can work with drafts, edit posts, create multiple blogs, categorize posts with hashtags, pin posts as static pages, and publish immediately or schedule a post by setting a future `created` date and moving the draft to a blog. Scheduling has a documented caveat: future-scheduled posts are hidden until their date and are not sent through ActivityPub federation. No documented multi-stage editorial approval, assignment desk, copy-edit/review workflow, version history/revisions, or newsroom role matrix was found in the reviewed official materials. [1] [3] [4]

The collective-oriented Chorus mode changes navigation and instance-wide reading/hashtag behavior, but the documentation explicitly calls it “half-baked” and says it needs further development. It is presented for writing groups and organizational knowledge sharing, rather than newsroom workflow. Configuration supports multi-user instances, registration/invites, privacy/visibility settings, user administration and OAuth-based authentication. This is useful community administration, not evidence of granular editorial permissioning or approval controls. [1] [5] [6]

## Distribution, APIs, and media

WriteFreely exposes RSS feeds and ActivityPub federation. Fediverse users can follow blogs, react/share and mention accounts; this is social distribution, not wire syndication. The writer docs list an API and scheduling via API, but the API documentation endpoint could not be retrieved during this review. The release page reports API-related work; nonetheless API breadth, stability, authentication details and suitability for integration should be verified against the selected version before reliance. No first-party wire ingestion or syndication exchange was identified. Search/discovery is blog- and hashtag-oriented; no evidence of newsroom-grade cross-publication search was found. [3] [4] [7] [8]

The reviewed documentation does not establish a managed media library, photo desk, caption/credit metadata workflow, video hosting, audio/podcast hosting, or broadcast asset management. Posts can include text and web content, but media ingest, storage, transformations, accessibility captions, rights handling and retention must not be assumed from that. Validate the exact build and operating model for image/media needs. [1] [4]

## Runtime, database, deployment

The repository describes a static Go binary for platforms/architectures Go supports. Documented database drivers are SQLite and MySQL; the repository also names MariaDB support. Configuration is through an INI file, and the docs cover server/TLS, database, user/community, email, OAuth and federation configuration. The official Docker guide says its setup is for styling/development and that WriteFreely does not yet provide an official production Docker pathway. Plan for binary-based deployment or independently engineered container operations, with backups, upgrades, secrets, TLS and monitoring owned by the operator. No performance or compliance guarantee is inferred. [1] [6] [9]

## License and commercial boundaries

The canonical repository LICENSE identifies **GNU Affero General Public License v3.0 (AGPL-3.0)**. It permits commercial use, modification, distribution and private use under its terms. The network-use source-disclosure condition for modified versions is material: operators making a modified version available over a network must provide users access to the corresponding source under AGPL-3.0. The license does not itself prohibit charging for software or services. Review the complete license and dependencies with counsel for a specific distribution/hosting model. The project’s contribution page additionally asks code contributors to sign its CLA; it says this does not restrict forking/modification under AGPL. [10] [11]

## Maintenance, release channel, docs and security

At evidence date the GitHub release list showed **v0.17.2** as latest, described as a patch release with a critical closed-registration invite-code security fix and smaller UI/bug fixes. The visible main-branch commit history showed activity through **2026-07-28**, including a v0.17.1 bump on July 20 and July commits addressing exports, user management and related updates. This demonstrates recent maintenance at the checked date, not a future cadence commitment. [7] [8]

Official documentation includes admin, developer and writer guides; the repository links to the separate documentation repository. The project’s release history mentions automated tests/tooling, but this review did not execute tests or audit CI coverage, branch protection, dependency completeness, or release reproducibility. [1] [7] [12]

GitHub’s Security page provides a vulnerability reporting route through GitHub Security Advisories. It lists two advisories published July 17, 2026: Cross-User IDOR exposing subscriber lists (GHSA-cfcq-76gr-62x8, Moderate), and world-readable `config.ini` defaults (GHSA-jgpr-4649-rf4p, High). The v0.17 release notes describe fixes for these and signup control; v0.17.2 reports a further critical closed-registration invite-code flaw fix. These are meaningful security issues and underscore the need to run a current patched release, review exposure/configuration and follow upstream advisories. No independent penetration test or claim of absence of additional vulnerabilities is made. [7] [13]

## Arabic and RTL

The project says it has first-class support for non-Latin and right-to-left scripts and that blog elements are localized in 20+ languages. This is a positive baseline, not a complete Arabic newsroom localization claim. Test Arabic authoring/editing, mixed-direction text, punctuation, embedded media, feeds and admin UI on the exact target release; localization coverage and workflow terminology may vary. [1] [11]

## Comparable screening score

| Dimension | Score | Rationale |
|---|---:|---|
| Newsroom/editorial fit | 5/20 | Publishing/community tool, not newsroom assignment, planning or production suite. |
| Publication/workflow/content ops | 8/15 | Drafts, editing, multi-blog, future scheduling and Chorus; limited approval/revision evidence. |
| Maintenance | 12/15 | v0.17.x and active July 2026 commit/release evidence; no cadence guarantee. |
| Security/dependencies | 8/15 | Advisories fixed in recent releases and security reporting exists; prior high/moderate/critical issues require operational vigilance. |
| Docs/tests | 7/10 | Broad official guides and release notes; test coverage/reproducibility not independently validated. |
| License clarity | 9/10 | Exact AGPL-3.0 file and clear copyleft terms; deployment-specific legal review still needed. |
| Setup/deployment | 4/5 | Portable Go binary and SQLite/MySQL/MariaDB; production Docker pathway not official. |
| Distribution/APIs/media integrations | 4/5 | RSS, ActivityPub, API documented at a high level; no wire or rich media production suite. |
| Arabic/RTL | 5/5 | Project explicitly claims first-class RTL/non-Latin support; target release still needs acceptance testing. |
| **Total** | **62/100** | **Screening score only.** |

## Recommendation

Consider WriteFreely for independent editorial blogs, author collectives, lightweight community publications, or a writing-first companion channel where open publication and fediverse/RSS distribution are central. Do not shortlist it as a replacement for a newsroom production system when the requirement includes assignment desks, editorial approvals, revision audit trails, production scheduling, wire handling, rich asset management, or newsroom integrations. Before operational use, test editorial roles and permissions, publication/scheduling semantics, media accessibility/metadata, Arabic RTL, data export/restore, and the pinned release’s security status. **Provisional screening only; not adoption approval.**

## References — opened primary sources

[1]: https://github.com/writefreely/writefreely "Canonical WriteFreely repository README"
[2]: https://writefreely.org/ "Official WriteFreely product site"
[3]: https://writefreely.org/docs/main/writer/scheduling "Official scheduling documentation"
[4]: https://writefreely.org/docs/main/writer "Official writer guide index"
[5]: https://writefreely.org/docs/main/admin/chorus "Official Chorus mode documentation"
[6]: https://writefreely.org/docs/main/admin/config "Official configuration documentation"
[7]: https://github.com/writefreely/writefreely/releases "Canonical GitHub releases"
[8]: https://github.com/writefreely/writefreely/commits/main/ "Canonical main-branch commit history"
[9]: https://writefreely.org/docs/main/admin/docker "Official Docker documentation"
[10]: https://github.com/writefreely/writefreely/blob/main/LICENSE "Canonical LICENSE file (AGPL-3.0)"
[11]: https://writefreely.org/contribute "Official contribution and CLA guidance"
[12]: https://github.com/writefreely/documentation "Official documentation repository"
[13]: https://github.com/writefreely/writefreely/security "Canonical repository security page and advisories"
[14]: https://writefreely.org/docs/main/writer/federation "Official federation documentation"
[15]: https://writefreely.org/docs/main/admin/commands "Official administrator commands documentation"
