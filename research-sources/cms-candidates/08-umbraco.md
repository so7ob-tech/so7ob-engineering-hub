# Umbraco CMS candidate evidence note — 2026-10-14

**Candidate:** Umbraco CMS (`umbraco/Umbraco-CMS`) for So7ob Tech. Evidence captured through 2026-10-14. This assesses core CMS, not paid add-ons or Umbraco Cloud as if included in the core license.

## Finding

Umbraco is a mature, .NET-first, editorial CMS with both a native website-rendering path and an opt-in JSON Content Delivery API. It is best classified as a **traditional/publishing CMS with decoupled/headless delivery capability**, not as a headless-only CMS or general-purpose data platform. It merits **evaluate**, particularly if the team values .NET and an integrated editor. No evidence here establishes security certification, audit/compliance status, performance under So7ob workloads, or genuinely RTL-capable backoffice UX.

## Evidence and interpretation

- **Verified — project identity and maintenance:** The canonical repository describes a free/open-source .NET content management system and .NET CLI scaffolding. GitHub metadata identifies C# as the primary language, main as default branch, and reports `pushed_at: 2026-10-14T16:11:20Z`; the repository release feed contained active 17.x and 13.x release entries, including Umbraco 13.16.2 published 2026-09-14. These are repository facts, not a guarantee of a particular support term. [1] [2] [3]
- **Verified — license:** The exact repository `LICENSE.md` checked from the canonical repository states MIT License, copyright Umbraco, allows use/copy/modify/merge/publish/distribute/sublicense/sell subject to retaining copyright and permission notice, and disclaims warranties/liability. This is a permissive OSI-style license for the repository code. It does **not** imply that separately sold Umbraco products, hosted services, third-party packages, or trademarks are included or free. The official docs explicitly note some Umbraco add-ons are closed-source and others open-source. [4] [5]
- **Verified — editorial and content modeling:** The product includes a backoffice and website path; official installation docs use the .NET SDK/CLI. The repository release notes demonstrate publishing, document/content types, block editors, localization, and acceptance-test work. Inference: it is suited to structured page/content authoring and editorial publishing; detailed role/workflow needs should be validated against a proof of concept rather than assumed from this evidence. [1] [3] [6]
- **Verified — headless:** Official documentation says the Content Delivery API is built in but **opt-in**. It serves published content as JSON, provides item-by-ID/route and query endpoints, filtering/sorting/expand/fields, culture via `Accept-Language`, preview and API-key options, and OpenAPI documentation. Public access is enabled by default once activated, so deployment needs intentional exposure/access configuration. This makes Umbraco decoupled-capable while retaining its editorial backoffice and native presentation option. [7]
- **Verified — technology and persistence:** The repository is C#/.NET. Official install instructions require the latest .NET SDK. No database engine was confirmed from the opened primary docs in this evidence set; database support is therefore marked **unknown here**, rather than inferred from typical Umbraco deployments. Verify supported providers/version combinations for the target release before selection. [1] [6]
- **Verified — ecosystem evidence:** Official documentation describes extension points for Delivery API and a package ecosystem, with some first-party add-ons closed-source. Repository and official docs point to community/forum support and packages. This demonstrates extensibility, not that a specific integration is included or supported. [1] [5] [7]
- **Verified — security signal:** GitHub Security lists multiple Umbraco CMS advisories through October 6, 2026, including moderate authorization issues and low-severity disclosure/upload validation issues. It also lists a high-severity July 2026 Delivery API exposure involving protected content through picker expansion. The official security category reports October 6 patches for versions 17 and 18; follow the specific advisories and fixed versions. Findings show active advisories and patching, not a security audit or evidence of absence of other vulnerabilities. [8] [9]
- **Verified — tests/docs:** The checked-out repository contains unit/integration/acceptance-test projects; release notes include acceptance-test updates. The official site supplies install and API documentation. This confirms test/documentation infrastructure exists, not coverage adequacy or independent quality. [3] [6] [7]
- **Arabic/RTL:** **Unknown / unverified.** Delivery API culture support and multilingual content do not prove Arabic backoffice translation, Arabic shaping, bidi-safe editing, or RTL layouts. No directly verified genuine RTL evidence was found in the opened primary sources. Require a hands-on Arabic content/editor test including mixed-direction text, rich-text editing, preview, menus, forms, and front-end templates.
- **Operations — inference:** An on-premises .NET application with a database, media/storage, configuration, upgrades/migrations, backups, restore testing, and patching creates normal self-managed CMS responsibilities. The official docs provide install/deploy guidance; managed Cloud may reduce some operational work but is a separate commercial boundary. Exact version-specific upgrade and backup burden depends on chosen hosting/database and should be validated. [6] [10]

## Score (screening rubric)

| Criterion | Points |
|---|---:|
| CMS/content/editorial fit | 18/20 |
| Architecture/reuse | 13/15 |
| Maintenance | 14/15 |
| Security/dependencies | 10/15 |
| Docs/tests | 9/10 |
| License clarity | 10/10 |
| Setup/deployment | 3/5 |
| APIs/integrations | 4/5 |
| Arabic/RTL | 0/5 |
| **Total** | **81/100** |

Security score is moderated by the visible set of recent advisories and the need to verify exact fixed versions/dependency exposure, not by an unsupported claim of poor security. Arabic/RTL gets zero because there is no affirmative proof. The result is a promising fit pending targeted technical validation, not an adoption recommendation.

## Recommendation

**Evaluate, do not adopt by default yet.** Run a time-boxed proof of concept using the intended .NET version and database; assess content model/editorial roles and publishing; test Content Delivery API security and preview behavior; exercise Arabic/RTL end to end; and document upgrade, restore, hosting, and add-on costs. Consider Umbraco Cloud and commercial add-ons separately from MIT core reuse.

## Sources opened

[1] [Canonical GitHub repository](https://github.com/umbraco/Umbraco-CMS) — repository overview and project links.

[2] [GitHub repository metadata API](https://api.github.com/repos/umbraco/Umbraco-CMS) — language, pushed date, default branch and repository metadata.

[3] [GitHub releases API](https://api.github.com/repos/umbraco/Umbraco-CMS/releases?per_page=5) — release history and dates.

[4] [Exact repository LICENSE.md](https://github.com/umbraco/Umbraco-CMS/blob/main/LICENSE.md) — exact MIT terms, also inspected in a shallow checkout on evidence date.

[5] [Official package repository documentation](https://docs.umbraco.com/umbraco-cms/extend-your-project/packages/example-package-repository) — notes open-source and closed-source add-ons.

[6] [Official installation docs](https://docs.umbraco.com/umbraco-cms/fundamentals/setup/install) — .NET SDK and CLI installation.

[7] [Official Content Delivery API docs](https://docs.umbraco.com/umbraco-cms/develop-with-umbraco/headless-and-apis/content-delivery-api) — opt-in setup, endpoints, options, access controls and OpenAPI.

[8] [GitHub Security for Umbraco CMS](https://github.com/umbraco/Umbraco-CMS/security) — policy contact and visible advisories, including October 6, 2026 advisories.

[9] [Official security blog category](https://umbraco.com/blog/category/security/) — October 6, 2026 notice for patches to CMS 17 and 18.

[10] [Official Umbraco LTS/EOL page](https://umbraco.com/products/knowledge-center/long-term-support-and-end-of-life/) — lifecycle page (page extraction was cookie-interstitial limited; consult directly to confirm exact policy terms).
