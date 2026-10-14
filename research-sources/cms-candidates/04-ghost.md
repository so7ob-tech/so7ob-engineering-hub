# Ghost (TryGhost/Ghost) — CMS candidate evidence note

**Evidence date: 2026-10-14.** This is a source-based screen, not a security audit, benchmark, or deployment test. “Verified” refers to inspected primary-source text. Product promotional wording is attributed to Ghost; points of fit are assessment/inference. Lack of evidence is identified as unknown, not presumed support.

## Assessment

Ghost is best classified as a **publishing-first CMS with decoupled administration and a usable headless delivery mode**, rather than a general data platform. Its core is a REST/JSON API; the Admin app is independently decoupled; public Content API is read-only and can deliver posts, pages, tags, authors, tiers and settings. This architecture makes API consumption feasible, while its out-of-box product is purpose-built for publication, subscriptions/membership, newsletters and themes—not arbitrary relational content schemas. [1][2][3]

The editorial fit is strong for a publication. Official architecture documentation describes an editor tied to a document storage format, an admin client and scheduled-post workflow. Membership documentation confirms free/paid members, tiers, public/member/paid/tier-restricted posts, CSV/Zapier/API import and direct Stripe billing. Claims such as “world-class” are the project’s characterization, not an independently measured finding. [1][4]

The API boundary is clear: Content API is public read-only with an integration key, REST endpoints and version header; Admin API provides read/write with role-based authentication. Ghost advertises webhooks, SDK/client tooling and external workflow integrations. This supports headless publishing and integration, but it does not turn Ghost into a schema-first, general-purpose content/data platform. [1][2]

Repository/docs identify JavaScript/Node.js, Bookshelf/Knex and production MySQL. Current hosting docs narrow officially supported self-hosting to Ubuntu LTS, Node.js 22 LTS, MySQL 8.0/8.4, NGINX and systemd; SQLite is for development, not supported production. [1][5][6]

**License:** the exact repository `LICENSE` is MIT, granting broad rights to use, copy, modify, distribute, sublicense and sell, subject to retaining notices and the standard warranty/liability disclaimer. Repository README separately says Ghost and its logo are trademarks and directs users to trademark policy. No source evidence reviewed establishes a source-code enterprise restriction or a prohibition on commercial reuse; do not imply trademark/branding rights are included. Ghost(Pro) is the official managed service, distinct from the open-source code. No claim here about its contractual terms or proprietary service boundaries beyond that distinction. [7][8]

**Maintenance:** on the evidence date, GitHub main history displayed many commits dated Oct. 14 and Oct. 13, 2026. Releases page showed 6.63.0 at its head as rendered; a directly opened 6.64.0 tag page also existed, and its CVE record says 6.64.0 fixes CVE-2026-105679. Treat release-page rendered ordering as ambiguous/stale relative to the tag and CVE, not as a reliable definitive latest version. The dated activity does support active maintenance. [9][10][11]

**Security:** GitHub advisory page showed numerous 2026 advisories, including high-severity items dated Sep. 3 and Sep. 17. CVE-2026-105679 specifies versions 6.22.1 through 6.64.0 affected and 6.64.0 fixed; CVSS 3.1 7.3 High; default local storage adapter was implicated. This is concrete evidence of disclosed/fixed vulnerabilities, not evidence of overall security quality. Project policy requests reporting by email and describes private handling. Official docs describe procedures and safeguards but remain project claims. Docs do not provide a full explicit supported-version matrix on the pages inspected. [10][11][12]

**Operations:** self-hosting means responsibility for the supported Linux/Node/MySQL/NGINX/systemd stack, upgrades, TLS, backups, security hardening and service operations; Ghost-CLI assists with installation/upgrading. Official Ghost(Pro) offers managed operations as a paid/hosted route. Backups and support are asserted by Ghost’s README for Ghost(Pro); actual retention/SLA details were not evaluated. The architecture describes local filesystem storage by default and allows storage adapters; deployments need to plan persistent content/media storage and database backups. [1][5][8]

**Arabic/RTL:** no official source inspected established Arabic admin localization, Arabic editorial UI or complete RTL behavior. Ghost themes can be customized, but customization is not proof of first-class RTL support. Treat Arabic support as **unverified**; validate actual admin, editor, themes, email templates, member portal, pagination and mixed-direction punctuation in a working instance before commitment. [1][4]

## Screening score

**79/100**, calculated as 16/20 CMS/content/editorial fit + 14/15 architecture/reuse + 14/15 maintenance + 9/15 security/dependencies + 8/10 docs/tests + 10/10 license clarity + 3/5 setup/deployment + 4/5 APIs/integrations + 1/5 Arabic/RTL. Sum: **79**. This is a screening judgment, not a measured benchmark. Tests were not independently executed; repository CI/test coverage quality is not asserted. Security points are intentionally restrained given the advisory history and unsupported version ambiguity.

**Recommendation: Evaluate, not adopt yet.** Strong candidate when So7ob Tech’s center of gravity is publishing, memberships/newsletters and a relatively standardized publication model. Run a proof of concept for Arabic/RTL, exact editorial permissions/approval requirements, membership and payment geography, API use cases, deployment/backup/upgrade ownership, and supported-version/security patch operations before choosing it for a production platform.

## Sources opened

[1]: https://docs.ghost.org/architecture "Ghost architecture and API overview"
[2]: https://docs.ghost.org/content-api "Ghost Content API"
[3]: https://docs.ghost.org/admin-api "Ghost Admin API overview"
[4]: https://docs.ghost.org/members "Ghost memberships"
[5]: https://docs.ghost.org/hosting "Ghost hosting and self-hosting"
[6]: https://docs.ghost.org/faq/supported-databases "Ghost supported databases"
[7]: https://raw.githubusercontent.com/TryGhost/Ghost/main/LICENSE "Exact Ghost repository LICENSE"
[8]: https://github.com/TryGhost/Ghost "Canonical TryGhost/Ghost repository"
[9]: https://github.com/TryGhost/Ghost/commits/main/ "Ghost main commit history"
[10]: https://github.com/TryGhost/Ghost/releases "Ghost release history"
[11]: https://github.com/TryGhost/Ghost/releases/tag/v6.64.0 "Ghost v6.64.0 release tag"
[12]: https://github.com/TryGhost/Ghost/security/advisories "Ghost GitHub security advisories"
[13]: https://github.com/TryGhost/Ghost/security/policy "Ghost repository security policy"
[14]: https://docs.ghost.org/security/ "Ghost security documentation"
[15]: https://www.cve.org/CVERecord?id=CVE-2026-105679 "CVE-2026-105679 record"
