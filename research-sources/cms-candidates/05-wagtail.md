# Wagtail CMS candidate — evidence note (2026-10-14)

## Assessment

**Recommendation: evaluate, do not adopt without a proof of concept.** Wagtail is a conventional Django CMS with structured page/content modeling, editorial controls, and first-party APIs. It is a credible option for So7ob Tech if the team wants to own a Django-based application. It is not turnkey hosted SaaS: Django deployment, schema/model design, API/frontend integration, upgrades, storage and backups remain operator responsibilities. Headless capabilities are real, but draft preview and some editorial experiences require extra work. Arabic has translation and substantial RTL work in core, but the opened evidence does not establish fully reliable, currently complete Arabic UI/RTL support.

**Score: 85/100.** This is a screening score, not a security/performance certification.

| Criterion | Points |
|---|---:|
| CMS/content/editorial fit | 19/20 |
| Architecture/reuse | 14/15 |
| Maintenance | 14/15 |
| Security/dependencies | 10/15 |
| Docs/tests | 9/10 |
| License clarity | 10/10 |
| Setup/deployment | 3/5 |
| APIs/integrations | 4/5 |
| Arabic/RTL | 2/5 |
| **Total** | **85/100** |

## Verified facts

- The canonical `wagtail/wagtail` repository describes Wagtail as an open-source CMS built on Django, with a built-in content API, StreamField, multi-site/multi-language support, and commercial support available. Repository README at evidence date states support for Python 3.11–3.14, Django 5.2/6.0/6.1, and PostgreSQL, MySQL, MariaDB, and SQLite (with JSON1). These are repository claims about compatibility, not independent tests.
- The exact repository `LICENSE` is a 3-clause BSD license, copyright Torchbox and contributors. It permits source/binary redistribution and modification subject to retaining notices/conditions, reproducing them for binary distributions, and not using contributor names to endorse derived products without permission. No copyleft or field-of-use restriction is stated. Separate dependencies and third-party packages retain their own licenses.
- Wagtail is a Django application: content types and fields are defined with Django models/Python; StreamField is a JSON-stored sequence of typed blocks that editors may reorder/repeat. StreamField supports custom block types and nested structured blocks. Changes to its JSON schema may require explicit data migrations.
- Built-in editorial functionality includes a page tree, revisions, permissions, drafts/publishing, and workflows; the opened source set directly documents general editor role and provides an editor guide, but did not establish workflow configuration details in depth. Validate approval routing/roles against So7ob's use cases in a POC.
- Official API docs as of this evidence date describe both API v2 (read-only, Django REST Framework) and a new Wagtail 8.0 API v3 (Django Ninja) capable of authenticated CMS operations including content creation/editing, media, documents, snippets, revisions, rich text and StreamField. The docs say v3 is under active development. GraphQL is not native; docs identify third-party packages including wagtail-grapple and strawberry-wagtail.
- Official headless guidance itself calls out limitations: draft page preview is not available through the public API and recommends a third-party preview package/workaround. Cross-domain frontend user-bar/editor features need setup. This is a strong hybrid/traditional CMS that supports decoupled/headless delivery, not an API-only product.
- Official release-process docs state feature releases every three months, patches as needed, LTS typically every four feature releases with 18 months' support, and a deprecation/backport policy. The GitHub release API showed Wagtail 8.0 published 2026-08-25. This establishes a recent dated release, not the precise status of every series.
- The official security policy uses private reporting and GitHub advisories/CVEs; policy states support for main, two most recent series, and latest LTS (verify current release schedule at procurement). GitHub's advisory page displayed multiple 2026 disclosures including Aug 20 moderate/low findings and Jun 15 advisories including a high-severity reflected XSS, permission/restriction handling issues and a DoS. Advisories prove reported/fixed issues exist; they do not establish present risk level, an audit, or security certification. Keep to supported patched versions and assess Django/transitive dependencies separately.
- Official deployment guidance requires ordinary Django production operations: WSGI/ASGI application serving (docs recommend WSGI), separate static asset handling, uploaded-media storage, cache and production logging/monitoring. Cloud object storage requires configuration and may not eliminate app-side file work. Django's deployment checklist applies. The opened sources do not specify a Wagtail native backup service or backup SLA; plan database and media backup/restore and test recovery independently.
- Arabic/RTL: an official Wagtail GitHub discussion records Arabic translation progress, RTL CSS work and UI testing. Historical snapshots mention Arabic translation at 49% around Wagtail 6.0, later than an earlier 96.3% statement; these are dated thread comments, not current translation completeness. The discussion explicitly notes remaining RTL fixes and asks RTL-language experts to identify issues. Thus genuine RTL work exists, but complete Arabic localization and production-ready end-to-end RTL behavior remain unverified here.

## Inference and unknowns

- **Inference:** Strong architectural fit for a Python/Django team needing structured, editorially controlled content and either rendered websites or a decoupled frontend. Less suitable if the goal is a fully managed CMS requiring little engineering/operations effort.
- **Inference:** BSD-3-Clause permits commercial reuse and closed-source derivative applications provided license conditions are met. No separate Wagtail enterprise-only software boundary was evident in the reviewed repository/docs; commercial implementation/hosting support is offered by ecosystem vendors and is distinct from license permission. Confirm licenses of installed plugins and services.
- **Unknown:** Current complete Arabic translation percentage, exact RTL defects in the current 8.0 UI, and behavior across editor workflows/content types. Test Arabic author/admin flows with native speakers and actual devices.
- **Unknown:** Production performance/scalability for So7ob workload, organization-specific support terms, compliance status, or security audit status. No claim made absent evidence.
- **Unknown:** Full backup/restore, migration and upgrade effort for So7ob's custom models/extensions. Django/Wagtail upgrades may entail dependency compatibility checks and data migrations; estimate with a representative prototype.

## Source URLs opened

1. Canonical repository: https://github.com/wagtail/wagtail
2. Exact license file: https://raw.githubusercontent.com/wagtail/wagtail/main/LICENSE
3. Official site: https://wagtail.org/
4. Official headless guidance: https://docs.wagtail.org/en/stable/advanced_topics/headless.html
5. Official API docs: https://docs.wagtail.org/en/stable/advanced_topics/api/index.html
6. Official StreamField/modeling docs: https://docs.wagtail.org/en/stable/topics/streamfield.html
7. Editor guide: https://guide.wagtail.org/en-latest/
8. Official security policy: https://docs.wagtail.org/en/stable/contributing/security.html
9. Official advisory listing: https://github.com/wagtail/wagtail/security/advisories
10. Official release process: https://docs.wagtail.org/en/stable/releases/release_process.html
11. GitHub release metadata API: https://api.github.com/repos/wagtail/wagtail/releases?per_page=5
12. Arabic/RTL discussion (historical thread): https://github.com/wagtail/wagtail/discussions/7793
13. Official deployment guidance: https://docs.wagtail.org/en/stable/advanced_topics/deploying.html

Evidence cutoff: 2026-10-14. Docs paths labeled `stable` are mutable; release/security facts should be reconfirmed against the release schedule and advisories when making a deployment decision.