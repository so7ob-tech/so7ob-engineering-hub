# Firefly III — Financial Systems & FinTech candidate

**Checked:** 2026-10-14. **Scope:** personal finance and budgeting. **Identity:** `firefly-iii/firefly-iii`.

## Evidence-backed facts

Firefly III is self-hosted personal-finance management software. Official sources describe income/expense and transaction tracking, budgets, categories, tags, recurring transactions, rules, double-entry bookkeeping, accounts and liabilities, savings goals (“piggy banks”), bill prediction, reporting/charts, imports and a broad REST JSON API. Project presents itself as isolated and not contacting external servers unless explicitly instructed. It targets users comfortable managing a server.

The exact repository LICENSE file contains **GNU Affero General Public License version 3 (AGPL-3.0-or-later wording)**; repository overview also says AGPL v3. AGPL is copyleft, with network-use source-offer implications for modified versions under its terms. Commercial use is not categorically prohibited by AGPL, but redistribution, modifications, network use, notices and other obligations require review; assess dependencies, trademarks, hosted-service design, and obtain legal advice for a commercial product. This is not a legal opinion.

Official self-managed instructions identify PHP 8.5, PHP extensions, a web stack and MySQL (SQLite also possible); install a release package, configure `.env`, initialize/migrate database. Documentation explicitly says pulling `main`/`develop` is no longer a working install path because generated JS/dependencies are absent. Docker and Kubernetes deployment options are presented. No evidence here establishes capacity/scaling limits or operational SLOs.

GitHub commits page showed commits on **2026-10-11**, three days before this check. GitHub Releases page showed **v6.7.1** as latest stable in its excerpt, with development releases dated 2026-09-15, explicitly warned as potentially buggy. A release date for v6.7.1 was not visible in the opened extract. GitHub star count was not reliably available from opened source, so omitted as unknown. Repository tests tree shows `feature`, `integration`, and `unit` directories; no test execution or coverage assessment performed. Security policy defines private vulnerability reporting and response, says only latest release is maintained and older branches do not receive backports, and explicitly warns defaults are not secure-by-default. No independent security audit is evidenced; absence/presence of advisories was not treated as proof of security.

Docs say many translations are available, but opened language tree exposed only `en_US`; no explicit evidence that Arabic translation or RTL interface is supported. Thus Arabic/RTL support is unknown, not claimed.

## Provisional score: 75/100

- Feature fit **18/20** — broad personal budgeting, double-entry, reports, goals and API directly fit; no claim of full commercial banking/payment platform.
- Architecture/reuse **12/15** — self-hosted, API, Docker/Kubernetes and modular imports support evaluation/integration; production reuse needs adaptation.
- Maintenance **13/15** — recent Oct. 11 commits and active stable/development release evidence; maintainer concentration is a potential risk not fully assessed.
- Security/dependencies **9/15** — disclosure policy, signed releases/checksum guidance and 2FA are positives; defaults explicitly not secure-by-default, no audit evidence, dependency assessment not done.
- Docs/tests **8/10** — extensive install/feature documentation and visible unit/integration/feature test dirs; test health/coverage not measured.
- License clarity **8/10** — exact AGPLv3 text located; commercial obligations and third-party components still need counsel/inventory review.
- Operations **3/5** — multiple deployment modes and documented setup; requires operator competence, hardened config and database/backup/upgrade planning; scaling evidence absent.
- Integrations **3/5** — REST API and bank-data importing; no claim of built-in bank connectivity or jurisdictional coverage.
- I18n/RTL **1/5** — multiple translations documented, but Arabic and RTL unverified.

**Recommendation: Evaluate.** Strong candidate for personal-finance and budgeting capabilities or as a reference/integration component. Do not infer production readiness, regulatory compliance, security certification, bank-data coverage or scalability from this review.

## Sources opened

- Repository: https://github.com/firefly-iii/firefly-iii
- Exact license path: https://github.com/firefly-iii/firefly-iii/blob/main/LICENSE
- Official documentation feature overview: https://docs.firefly-iii.org/explanation/firefly-iii/about/introduction/
- Official self-managed installation: https://docs.firefly-iii.org/how-to/firefly-iii/installation/self-managed/
- Releases: https://github.com/firefly-iii/firefly-iii/releases
- Commits: https://github.com/firefly-iii/firefly-iii/commits/main/
- Security policy: https://github.com/firefly-iii/firefly-iii/security/policy
- Tests tree: https://github.com/firefly-iii/firefly-iii/tree/main/tests
- Language tree: https://github.com/firefly-iii/firefly-iii/tree/main/resources/lang
- Official website: https://www.firefly-iii.org/
