# Akaunting — SMB accounting/bookkeeping candidate

**Checked:** 2026-10-14. Scope limited to `akaunting/akaunting` and official materials.

## Evidence-backed findings

- [Repository](https://github.com/akaunting/akaunting) describes web-based accounting for SMBs/freelancers; official marketing lists cash flow, invoices, bills/expenses, recurring workflows, projects, quotes, inventory, users/permissions, and payment methods. Repo specifies PHP 8.1+, Node 18/20, MariaDB/MySQL/PostgreSQL/SQLite and web servers; Composer metadata identifies Laravel 10, Vue/Tailwind (README), modular apps, REST API.
- License: official [license page](https://akaunting.com/license) states Business Source License 1.1 (BSL 1.1), change license GPLv3 four years after a given version's first public distribution (or stated change date, whichever first). Production grant is limited: not over two users, one company, or 1,000 invoices; prohibits removing branding for redistributed rebranded/white-label product and use for an Accounting Service serving third parties. Beyond grant requires commercial license or refraining. This is not an unrestricted OSI-style open-source license; get legal review and confirm exact version's license/change date before reuse. Repository `LICENSE` URL was opened but text extraction failed; relied on official license page and composer metadata (`BUSL-1.1`).
- GitHub API snapshot at checked date reported 10,121 stars, 2,981 forks, non-archived, pushed Sep 13, 2026; commits page showed activity through Oct 8, 2026. Releases page listed 3.2.3, 3.2.2, 3.2.1 and 3.2.0, but extraction did not expose release dates. Do not infer latest release date.
- Official installation guide says 50+ languages and lists database setup / APP_KEY configuration. Release notes explicitly cite invoice Arabic and Hebrew fixes; this supports locale/RTL relevance, but does not alone prove comprehensive Arabic translation or RTL coverage.
- Repo tests directory includes Feature and Unit folders; composer metadata requires PHPUnit 10.5.63. Directory presence and dependency do not establish test coverage or passing CI.
- Security policy asks private reporting to security@akaunting.com and lists 3.0.x supported, older listed series unsupported (policy as fetched). GitHub Advisory GHSA-m69m-hm22-9xmx reports moderate, unreviewed advisory published Apr 5, 2026, affecting Akaunting up to 3.1.21; fetched advisory page omitted actionable technical detail / fixed version. Existence of policy/advisory is not evidence of an independent security audit.
- Official on-premise docs say self-hosting gives data control but adds responsibilities/manual processes. The README offers local setup, but no evidence here establishes production scaling architecture, HA, backup/restore, hardening, or service-level support.

## Inference / evaluation

Strong functional fit for SMB bookkeeping and a technically recognizable Laravel application with extension ecosystem; potential integration surface includes REST API/payment modules. Main reuse risk is material BSL restrictions and commercial licensing, with app-store/API terms requiring separate diligence. Self-hosting shifts operational/security responsibility to adopter. Recommendation: evaluate in a controlled proof of concept, not production approval or compliance assurance.

## Sources opened

- https://github.com/akaunting/akaunting
- https://akaunting.com/license
- https://akaunting.com/open-source-accounting-software
- https://akaunting.com/hc/docs/on-premise/
- https://akaunting.com/hc/docs/installation/
- https://github.com/akaunting/akaunting/releases
- https://github.com/akaunting/akaunting/commits/master/
- https://api.github.com/repos/akaunting/akaunting
- https://raw.githubusercontent.com/akaunting/akaunting/master/composer.json
- https://github.com/akaunting/akaunting/security/policy
- https://github.com/advisories/GHSA-m69m-hm22-9xmx
- https://github.com/akaunting/akaunting/blob/master/LICENSE (opened; extraction failed)
- https://github.com/akaunting/akaunting/tree/master/tests
