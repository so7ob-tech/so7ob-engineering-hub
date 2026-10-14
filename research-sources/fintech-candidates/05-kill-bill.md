# Kill Bill (killbill/killbill) — candidate note

**Checked:** 2026-10-14. Scope: subscription billing. Recommendation: **evaluate**, not a production-readiness or compliance determination.

## Evidence-backed facts
- Primary repository describes an open-source subscription billing and payments platform; features include catalogs/pricing, subscriptions, usage metering, invoicing, gateway payments, credits, tax and dunning. Plugin extension is presented for gateways and tax engines. It is self-hosted/on-prem or cloud; repo claims scale as business grows but supplies no independent capacity proof. [1]
- Exact repository license file identifies Apache License 2.0. Its summary notes commercial use, modifications and distribution permitted subject to copyright/license notice and change-notice conditions; patent grant applies; trademark use is not licensed. [2]
- Commercial distinction: repository says OSS use has no support/SLA; Aviate is a commercial enterprise edition with extra features/support. Trademark and any separate plugin/dependency terms require separate review. [1] [3]
- Official docs describe multi-tenant, plugin-extensible, cloud-native product; getting-started Docker install, REST docs, Kaui admin UI, subscription catalog/plans/phases/trials/add-ons/alignment, payment methods/gateways/retries/refunds. [4]
- Repository main implementation is Java (repo language metadata); modular/plugin architecture and REST API. **Arabic/RTL:** no explicit Arabic/RTL support evidence located; do not assume it. [1] [4]
- As of checked date, GitHub API metadata indicated 5,4xx stars (exact count not retained in this note); latest commit `20e15525d1d9e56219c4f5651e06850fe793f5e0`, dated 2026-10-12; latest release `killbill-0.24.22`, published 2026-09-29. Release notes mention partial locale support in invoice/catalog translations. [5] [6]
- Security: GitHub Advisory Database lists a **high-severity, unreviewed** advisory published 2026-09-03: versions through 0.24.21 fail to enforce permission annotations on several AdminResource endpoints. Latest 0.24.22 is newer, but available advisory excerpt alone does not confirm a fix. Repository security/advisories view did not expose project-specific advisory detail; API endpoint returned 404. This is not evidence of an audit or absence of other vulnerabilities. [7] [8]
- Official repo/docs provide getting-started, API docs and functionality documentation. Releases document bug fixes; repository has automated tests (verify suite and coverage against exact candidate version before adoption). [1] [4] [5]

## Unknowns / cautions
Validate exact remediation for GHSA/CVE against 0.24.22 source/change history; perform dependency/SCA and security review, threat model, penetration testing, and verify supported database/JDK/deployment matrix. No independent scaling benchmarks, support SLA for OSS, or compliance attestation established here. Assess deployment complexity, migrations/backup/restore, monitoring, payment-provider coverage and plugin lifecycle in a proof of concept. No explicit Arabic/RTL documentation found.

## Provisional score: 78/100
Feature fit 18/20 (strong subscription invoicing/payment capabilities); architecture/reuse 13/15 (modular Java/plugin/REST and self-hosted; integration tailoring needed); maintenance 12/15 (commit Oct 12 and release Sep 29, 2026); security/dependencies 8/15 (recent high severity advisory, patch confirmation and independent assurance unknown); docs/tests 8/10 (substantial official docs and tests, no coverage assessment); license clarity 9/10 (clear Apache-2.0, but trademark and third-party terms remain); operations 4/5 (Docker/self-hosting and scale claims, no benchmark); integrations 4/5 (plugin model/gateway and tax engines); i18n/RTL 2/5 (locale translation evidence, no Arabic/RTL confirmation).

## Sources actually opened
[1] https://github.com/killbill/killbill
[2] https://github.com/killbill/killbill/blob/master/LICENSE
[3] https://killbill.io/about-open-source-software
[4] https://docs.killbill.io/
[5] https://github.com/killbill/killbill/releases
[6] https://api.github.com/repos/killbill/killbill/commits?per_page=1 (GitHub API, metadata checked 2026-10-14)
[7] https://github.com/advisories/ghsa-2643-mcgh-r47h
[8] https://github.com/killbill/killbill/security/advisories
