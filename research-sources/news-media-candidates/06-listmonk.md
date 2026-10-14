# listmonk — News & Media candidate screening

**Evidence date: 2026-10-14. Provisional screening only; not adoption approval.**

## Finding

listmonk is a focused self-hosted newsletter and mailing-list operations tool: audience/list management, subscriber segmentation, campaign composition and email distribution. This makes it directly relevant to a media outlet that publishes newsletters to subscribers. It is not a newsroom/editorial suite and should complement, not replace, editorial publishing. Its repository describes a standalone newsletter and mailing-list manager backed by PostgreSQL, distributed as a single binary; the product site documents campaign authoring, subscriber management, transactional messages and integrations for outbound messaging. [1] [2]

### Editorial scope and distribution

The supported editorial-like operation is email-campaign production: templates with Go template expressions, HTML drag-and-drop/WYSIWYG/Markdown/raw HTML/plain text editing, lists and SQL-based subscriber segmentation, campaign analytics, and send queues/rate controls. It has API coverage for its own functions, including subscriber/list operations and transactional messaging, plus pluggable messenger/webhook interfaces and SMTP sending. [2] [3]

The inspected official material does not establish newsroom assignment desks, editorial roles and multi-stage story review, revision history/version comparison, article scheduling, wire ingestion/syndication, public content feeds, newsroom search, or a canonical article CMS. Multi-user permissions and campaign sending permissions are operational access controls, not evidence of an editorial workflow. Campaigns may be archived as webpages, but this does not make listmonk a publishing platform for general newsroom content. [3] [4]

Its media library supports uploaded assets and S3-compatible storage; the current release adds inline CID email images. This is email asset handling, not evidence of video hosting, audio/podcast publishing, caption/subtitle workflows or broadcast asset management. [2] [3]

### License and commercial boundary

The canonical repository identifies **GNU Affero General Public License v3.0 (AGPL-3.0)** and the checked-in LICENSE begins with the AGPL version 3 text. The license permits commercial use, modification, distribution, and private use, subject to its copyleft and other conditions. In particular, AGPLv3 includes source-offer obligations for modified versions used to provide network services; legal review should assess any modification, combination, redistribution, or hosted-service model. The project is open source; the product site says it has no affiliation with listed providers. No claim is made here about paid vendor support or an alternative commercial license. [1] [5]

### Runtime, maintenance, security, and language

The implementation uses Go for backend and Vue/Buefy for the frontend. The official installation guide requires PostgreSQL 12 or later and supports a downloaded binary or Docker Compose; nightly builds are expressly described as untested. Kubernetes Helm installation is documented as a community-maintained chart, not a core deployment method. [1] [3]

At the evidence date, GitHub API metadata lists the repository as active and not archived, with `pushed_at` 2026-09-25 and `updated_at` 2026-09-28. The latest published stable release found is v6.2.0, dated 2026-06-26. Its notes call out important security fixes for campaign/list permission validation in multi-user environments, ZIP Slip in CSV import, and API-token hashing changes, alongside other fixes and features. This provides evidence of active maintenance and fixes, not a guarantee of security. [2] [6]

The official security-report page directs vulnerability reports through GitHub Security Advisories. It documents deliberate risk boundaries: SQL query capability is restricted by a special permission, arbitrary uploaded file types can create stored-XSS exposure, campaign HTML can execute scripts in published archive views, and powerful Go templates can enable resource exhaustion. Admins must carefully restrict trust/permissions and configure allowed file types. These are important multi-user deployment concerns. The inspected advisory page itself did not establish a complete inventory of unresolved vulnerabilities; review current advisories and dependency status before adoption. [4] [7]

The repository and docs provide installation, upgrade and developer build instructions; the installation guide covers binaries, Docker Compose and compilation. Release notes identify dependency bumps and fixes. The repository has test code, but this screening did not execute the test suite or independently assess coverage/CI. [1] [3] [6]

Arabic was added as a user-interface translation in v6.2.0. That is positive evidence of Arabic localization, but does not independently verify right-to-left layout behavior across the admin UI, email builder, public subscriber forms, templates, or delivered messages. Arabic RTL must be exercised in a representative deployment. [6]

## Screening score (74/100)

| Criterion | Score | Rationale |
|---|---:|---|
| Newsroom/editorial fit (20) | 8 | Good subscriber newsletter distribution fit; no evidence of newsroom/story lifecycle suite. |
| Publication/workflow/content ops (15) | 13 | Strong campaign/template, lists, segmentation, analytics and delivery operations; lacks evidence of article revisions and editorial assignment/review. |
| Maintenance (15) | 14 | Active, recent commits and v6.2.0 release; still only a snapshot of maintenance. |
| Security/dependencies (15) | 11 | Recent permission and import/token fixes, explicit reporting channel and documented risk controls; residual configuration risks and no independent audit performed. |
| Docs/tests (10) | 8 | Useful official installation, upgrade, security and release docs; tests not run and coverage not assessed. |
| License clarity (10) | 9 | Exact AGPLv3 clear in repo; consequential network-copyleft obligations require counsel for intended reuse. |
| Setup/deployment (5) | 5 | Binary and Docker Compose plus clear PostgreSQL requirement; community Helm option. |
| Distribution/APIs/media integrations (5) | 4 | API, SMTP, webhook/messenger interfaces and media library; no newsroom syndication/feed evidence. |
| Arabic/RTL (5) | 2 | Arabic translation added; RTL behavior remains unverified. |
| **Total** | **74** | **Provisional screening, not adoption approval. Component scores sum to 74.** |

## References

[1]: https://github.com/knadh/listmonk "Canonical listmonk repository"
[2]: https://listmonk.app/ "Official listmonk product site"
[3]: https://listmonk.app/docs/installation/ "Official installation documentation"
[4]: https://listmonk.app/docs/security-reports/ "Official security reports and reporting guidance"
[5]: https://github.com/knadh/listmonk/blob/master/LICENSE "Canonical repository license file"
[6]: https://github.com/knadh/listmonk/releases "Canonical release history and v6.2.0 notes"
[7]: https://api.github.com/repos/knadh/listmonk "GitHub repository API metadata"
