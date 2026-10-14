# Superdesk — News & Media screening

**Evidence date: 2026-10-14. Provisional screening only; not adoption approval.**

## Identification and fit

Superdesk (`superdesk/superdesk`) is purpose-built open-source newsroom software, not a generic web CMS, standalone publishing site engine, video host, or podcast service. Its project describes end-to-end news creation, production, curation, distribution and publishing; official product material emphasizes editorial-controlled workflows and headless/API-centric delivery. It is a strong specialist-newsroom/newswire candidate for agencies and editorial desks. Publisher is a related but separately identified web publishing product; do not conflate Publisher's site templates and channel routing with the core newsroom server/client. [1] [2] [9]

## Editorial and content operations

Official site describes configurable editorial-owned workflows, article templates for recurring tasks, and creation-to-distribution across channels. The product speaks of find/retrieve/manage/edit/publish across multimedia repositories. This supports fit for an editorial operation, but public product pages are not a complete operational specification: exact role matrix, approval states, revision history semantics, scheduled publishing guarantees, embargo controls, or moderation/community/federation features require validation in deployed version and documentation. No evidence reviewed supports community moderation or federated social features. [2]

The Content API documentation describes authenticated REST endpoints for reading news items and packages, NewsML-G2/NINJS representations, and media asset delivery. It expressly says the described API is content-delivery focused, excludes users/desks/workflow activity and does not offer management operations such as updating/removing content; it says v1 release date was yet to be announced. Treat that page as legacy/incomplete evidence, not proof of current API capabilities. [6]

Publisher product material describes central control over content routing to websites, social platforms and mobile apps, metadata-based automated publishing, and editorial control of content lists/order. It names Facebook Instant Articles and AMP. Repository README also points to a client/server split and Docker Compose setup. [1] [9]

## Media and integration scope

The API content model treats text, photos, graphics, audio and video as news items, and packages can bundle multiple items. The official newsroom site says Superdesk can find/manage/edit/publish content from multimedia repositories. These are documented content types and asset-management claims, not proof of a particular transcoding, caption/subtitle, waveform, DAM connector, or broadcast workflow. No specific captioning or audio production functions were verified. [2] [6]

## License and commercial boundary

The canonical repository README and official docs identify GNU Affero General Public License v3.0 (AGPL-3.0); GitHub license metadata confirms the SPDX identifier. AGPL obligations matter when modifying and making the software available over a network; obtain legal review for intended modifications, hosted service, and distribution. Sourcefabric presents the software as open source and offers demos/support-oriented commercial engagement; separately marketed Superdesk Publisher is not evidence that all implementation, hosting, integration, training, or support services are included in the community code. Review licenses of companion repositories and dependencies individually. [1] [3] [4] [9]

## Technology, operations, and deployment

Repository README describes separate server API and client applications. The repository's setup instructions name MongoDB, Elasticsearch 7+, Redis, Python 3.8 and Node.js/npm, with Docker Compose or a manual development setup. This is dated README guidance, not a guarantee these versions remain suitable or supported in 2026; verify the current unified deployment documentation, container tags, supported versions, backup/restore, secrets, upgrades, and HA topology before piloting. Official homepage mentions Python, MongoDB, Elasticsearch and REST APIs. [1] [2] [3]

## Maintenance, releases, docs/tests, security

GitHub's commit endpoint showed latest commit `1f460e9a3245497384549a4dc04152765832d073`, authored 2026-10-14 16:43:39 UTC, providing evidence of activity on the evidence date. The releases API surfaced v2.8.5 published 2025-02-12; therefore the latest inspected tagged release is materially older than the current commit, suggesting active development but a release-channel freshness question. A dedicated current release branch/version policy should be confirmed. [4] [5]

Unified official docs provide getting-started, install/deploy, contribution and developer-guide entry points, and state software AGPL-3.0. Repository provides Docker Compose and setup instructions. The README excerpt reviewed does not establish test coverage, CI health, test commands or current test results; these need direct project/CI review. [1] [3]

The repository security policy says vulnerabilities should be reported to `security@sourcefabric.org` and describes support for a limited set of v2 minor releases (page content displayed 2.6.x and 2.5.x as supported). That apparent policy/version mismatch with the v2.8.5 release and 2026 commit must be clarified. GitHub security-advisory endpoint access was rate-limited in this check, so no assertion is made that advisories exist or do not exist. No independent vulnerability assessment was performed. [7]

## Arabic and RTL

No verified source in this review documents complete Arabic localization or right-to-left support for the current core newsroom client, editor, Publisher themes, or output components. Arabic/RTL should be treated as unverified, not absent; require a representative Arabic data entry, editing, punctuation/bi-directional, search, workflow, UI, and published-channel proof of concept.

## Screening score

| Criterion | Score | Maximum | Rationale |
|---|---:|---:|---|
| Newsroom/editorial fit | 19 | 20 | Explicit purpose-built news agency/editorial workflow product. |
| Publication/workflow/content ops | 12 | 15 | Strong advertised end-to-end workflow; detailed version-specific controls not fully verified. |
| Maintenance | 12 | 15 | Commit on evidence date; last inspected stable release is 2025, creating release-lag uncertainty. |
| Security/dependencies | 8 | 15 | Disclosure channel/policy exists; supported-version display mismatch and dependency/runtime age require review; no advisory conclusion. |
| Docs/tests | 7 | 10 | Unified docs and installation materials exist; current test/CI evidence not established. |
| License clarity | 9 | 10 | AGPL-3.0 confirmed; companion components and service boundary need review. |
| Setup/deployment | 3 | 5 | Docker and manual install described; versions and production topology need validation. |
| Distribution/APIs/media integrations | 4 | 5 | REST/content model and Publisher channels documented; legacy API caveat applies. |
| Arabic/RTL | 1 | 5 | Not verified in reviewed official materials. |
| **Total** | **75** | **100** | **Provisional screening only.** |

**Recommendation:** Advance to a bounded technical and editorial validation, not deployment approval. Validate the current supported release, source and companion repositories, deployment/security baseline, role/revision/scheduling semantics, current API/feed/syndication behavior, asset metadata/captions, and Arabic RTL in a realistic newsroom workflow. Avoid performance, compliance, or security assurance claims from product marketing or this desk review.

## References

[1]: https://github.com/superdesk/superdesk "Canonical Superdesk repository README"
[2]: https://www.superdesk.org/ "Official Superdesk product site"
[3]: https://docs.superdesk.org/ "Official unified documentation portal"
[4]: https://api.github.com/repos/superdesk/superdesk/commits?per_page=1 "GitHub latest commit endpoint"
[5]: https://api.github.com/repos/superdesk/superdesk/releases "GitHub releases API"
[6]: https://superdeskcontentapi.docs.apiary.io/ "Superdesk Content API documentation"
[7]: https://github.com/superdesk/superdesk/security/policy "Superdesk security policy"
[8]: https://api.github.com/repos/superdesk/superdesk/license "GitHub license metadata"
[9]: https://www.superdesk.org/publishing/publisher "Official Superdesk Publisher product page"
