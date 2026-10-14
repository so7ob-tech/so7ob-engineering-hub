# Keila — provisional News & Media screening

**Evidence date: 2026-10-14.** Scope: exactly [Keila](https://github.com/pentacent/keila) (`pentacent/keila`), category **Newsletter publishing**. This is a provisional screening, not adoption approval.

Keila is a self-hostable email newsletter and campaign-management application. Its relevance to a publisher is direct reader distribution: maintain contacts and segments, build signup forms, create campaigns and send them using SMTP or supported mail providers. It is a focused publishing workflow component, **not a newsroom/editorial suite or complete editorial CMS**. It should not be confused with a video-hosting or podcast platform.

## Product fit and workflow

Official product materials describe campaign creation through a visual block editor, Markdown (including WYSIWYG), MJML, HTML and plain text; reusable templates/content slots; contact custom fields and segmentation; signup forms, double opt-in, campaign analytics, archives and a full-featured API. Campaign scheduling is suggested by the scheduler release history; those capabilities concern email sending, not a newsroom publishing calendar or editorial assignment process. [1] [2] [3]

The reviewed materials do not document newsroom-style editorial roles, story assignment, copy-desk approval, version history/revisions, wire ingestion, syndication feeds, newsroom search, or moderation/community/federation. Public campaign archives exist, but are not evidence of a general-purpose publication CMS. APIs can connect external systems and automate contact/campaign workflows; that is not equivalent to native wire-service ingestion or an editorial content API. Images are supported within email editing and resizing, but this review found no evidence of a managed photo library, video/audio hosting, caption/transcript workflows, or audiovisual publishing. Do not assume these features from email image support. [2] [3]

## License and reuse boundaries

The repository identifies the application as GNU Affero General Public License version 3 or (at the user's option) any later version (AGPL-3.0-or-later). The canonical license text is at [`LICENSE`](https://github.com/pentacent/keila/blob/main/LICENSE); the repository README and docs also state AGPL terms. The repository explicitly excludes the logo and files in `extra/` from that license. Release notes further explain that components relevant only to Keila Cloud (such as billing and “Send with Keila”) are informational only and not licensed under AGPLv3; consult `extra/README.md` and the exact files before copying or modifying them. The AGPL's network-use source obligations and any distribution obligations require legal review for the intended deployment; the license does not establish trademark/logo rights or rights in excluded components. Keila Cloud is a commercial hosted offering; the existence of that offer is separate from the license of the community code. [1] [3] [4]

## Technology and operations

Repository metadata specifies Elixir `~> 1.18`; the dependency set includes Phoenix 1.7, Phoenix LiveView 1.1, Ecto/ecto_sql and Postgrex, and Oban. Runtime configuration requires `DB_URL` in PostgreSQL URL form (`postgres://user:password/database`), so PostgreSQL is the supported configured production database evidenced here. Official setup paths include the `pentacent/keila` Docker image and a sample Docker Compose configuration. An SMTP system mailer is configurable, and campaign delivery adapters include SMTP, AWS SES, SendGrid, Mailgun and Postmark. This implies responsibility for database, app configuration, and delivery infrastructure in self-hosted operation; this screening makes no uptime, deliverability, privacy-compliance, or performance guarantee. [1] [5] [6]

## Maintenance, documentation, testing and security

At evidence date the current repository page identifies version 0.30.3 in `mix.exs`; the release page lists 0.30.3 and describes template/API work, mailer configuration, editor fixes and query changes. The canonical commit history has activity through 2026-10-02, with multiple commits during August and September 2026. This supports an active maintenance signal, not a service-level commitment. [3] [5] [7]

Official docs are at `docs.keila.io`; the docs landing page states Elixir, AGPLv3, contact management, signup forms and campaigns. The GitHub README links installation documentation. API documentation is linked from the product site, and release notes record OpenAPI improvements. The repository includes test configuration and a `mix test` alias that creates/migrates the test database before running tests; this confirms a test suite is part of the project but does not independently establish coverage or test health. [1] [2] [3] [5] [8]

GitHub's Security tab reports **“No security policy detected”** and no `SECURITY.md`; the advisories page displayed no published advisory content when checked. These observations are not proof that the project has no vulnerabilities. No independent dependency audit, penetration test, or vulnerability database review was performed for this screen. [9] [10]

## Arabic and RTL

The reviewed primary sources document localization and language-aware behavior, and release notes mention multiple translations, but the inspected materials do not verify Arabic translation availability or a complete right-to-left interface and email rendering workflow. Treat Arabic/RTL support as unverified; test admin UI, forms, email templates, and recipient clients with Arabic content before relying on it. [2] [3]

## Screening score

| Dimension | Score | Rationale |
|---|---:|---|
| Newsroom/editorial fit (20) | 4/20 | Useful newsletter output, but no evidence of core newsroom/editorial planning, approvals, assignments, or revision history. |
| Publication/workflow/content ops (15) | 9/15 | Campaign authoring, scheduling-related release history, templates, contacts, segmentation and archives; no broader editorial workflow. |
| Maintenance (15) | 14/15 | Recent commits through Oct 2, 2026 and current v0.30.3 release evidence. |
| Security/dependencies (15) | 7/15 | Security tab explicitly lacks policy; no advisory surfaced; dependency inventory is visible, but no independent audit. |
| Docs/tests (10) | 7/10 | Official docs and API materials; test suite and test alias in source, without coverage/CI result verification. |
| License clarity (10) | 8/10 | AGPL-3.0-or-later clear for main code, with explicit logo/`extra/` and cloud-only exclusions needing file-level diligence. |
| Setup/deployment (5) | 4/5 | Official Docker image/Compose and PostgreSQL configuration documented; operations remain to be validated locally. |
| Distribution/APIs/media integrations (5) | 4/5 | Campaign API, signup forms, SMTP/provider adapters and email formats; no evidence of wire/feed or AV platform integrations. |
| Arabic/RTL (5) | 1/5 | Localization exists, but Arabic/RTL support was not verified. |
| **Total** | **58/100** | Component scores sum exactly to 58; rubric maximum is 100. |

**Recommendation:** consider as a focused self-hosted newsletter production and direct-reader distribution component where an existing CMS/newsroom supplies editorial content. Do not shortlist it as a replacement newsroom, complete editorial CMS, video host, or podcast service. Before adoption, independently validate current release artifacts, license boundaries (especially `extra/`), security posture, restore/upgrade procedure, workload fit, API needs and Arabic/RTL output. Provisional screening only; not adoption approval.

**Confidence:** Medium for product category, license headline, deployment stack and maintenance signal from primary project sources. Low-to-medium for negative feature findings and security posture: absence in reviewed documentation is not proof of absence, and no live deployment, code audit, or security audit was performed.

## References

[1]: https://github.com/pentacent/keila "Canonical Keila repository README"
[2]: https://www.keila.io/ "Official Keila product site"
[3]: https://github.com/pentacent/keila/releases "Keila releases"
[4]: https://github.com/pentacent/keila/blob/main/LICENSE "Keila license file"
[5]: https://github.com/pentacent/keila/blob/main/mix.exs "Keila Mix project and dependency metadata"
[6]: https://github.com/pentacent/keila/blob/main/config/runtime.exs "Keila runtime configuration"
[7]: https://github.com/pentacent/keila/commits/main "Keila main branch commit history"
[8]: https://www.keila.io/docs "Official Keila documentation"
[9]: https://github.com/pentacent/keila/security "GitHub Security tab and security policy status"
[10]: https://github.com/pentacent/keila/security/advisories "GitHub repository security advisories"
