# LedgerSMB — Financial Systems & FinTech candidate

**Checked:** 2026-10-14. Scope: accounting and ERP for small businesses. This is a desk evaluation, not an audit or production-readiness determination.

## Evidence-backed facts

- LedgerSMB is a free, browser-based double-entry accounting and ERP application. The canonical repository describes quotations, ordering, invoicing, projects, timecards, inventory and shipping. Official feature material lists general ledger/journals, sales and purchasing, multiple currencies, contact and cash management, bank reconciliation, fixed assets, depreciation/disposal, light manufacturing, reporting and budgeting by project/department. [1] [2]
- Repository implementation language is Perl; README specifies PostgreSQL 14+ and Perl 5.38+ for development version 1.14, plus a production web server such as nginx/Apache/lighttpd/Varnish. PostgreSQL is the primary database. [1]
- **Exact license path:** repository-root `LICENSE`; its text is GNU General Public License, version 2, June 1991 (GPL-2.0). GitHub API metadata reports `Other`/`NOASSERTION`, so use the checked-in license text, not the API classification. GPLv2 distribution obligations matter for modified/combined works; proprietary incorporation/distribution is constrained. Obtain legal review for intended commercial deployment, modifications, dependencies, and distribution model. [3] [4]
- Official site lists stable series 1.13 and old-stable 1.12. GitHub Releases showed 1.13.8 at top when checked; the extracted listing did not expose its publication date. The official announcement page for 1.12.17 is dated 2026-03-23 and provides checksums and downloadable/signed release artefact links. Do not confuse that older announcement with the then-current latest release. [5] [6]
- GitHub commit history shows activity through 2026-10-12; repository API reports pushed_at 2026-10-12 and 570 stars on the check date. Star count is a dated snapshot, not a popularity guarantee. [7] [8]
- Tests are documented under `t/`: `prove -r t/ xt/`, including unit/module, DB operations, UI/interface and packaging groups; DB-backed and browser/interface suites require configured PostgreSQL, server, credentials and related test environment. Official documentation says Docker-based installation is advised over complex tarball setup. [9] [10]
- Official security page directs vulnerability reports privately and points to historical advisories. GitHub advisories page displayed one published high-severity advisory, GHSA-98ff-f638-qxjm, “Privilege escalation through CSRF attack on setup.pl”, published 2024-02-02. This confirms advisory handling/history only; it does **not** establish that the code was independently audited or that it is currently vulnerability-free. [11] [12]
- README explicitly says its quick Docker Compose example is for evaluation and is not sufficient for production because it lacks secure connections to protect passwords; production should use a web server/reverse proxy and HTTPS. Official site says production Docker images support x86_64, ARM64 and ARM32; direct installer currently tested for Debian-family and Fedora-family systems. [1] [10]
- Official site says customer-facing output templates are customizable and identifies Transifex as translation contribution channel. No explicit Arabic or RTL support statement was found in the examined sources. [1]

## Unknowns and inferences

- The checked pages do not provide a verifiable latest release publication date for 1.13.8; current stable version was corroborated from official download page, while exact top release came from GitHub release listing. [5] [6]
- No source reviewed establishes a formal security audit, compliance certification, service-level commitment, supported transaction-volume ceiling, high-availability/reference scaling architecture, or current vulnerability-free status.
- Good functional fit is an inference from documented small-business accounting/ERP functions. PostgreSQL, maintained releases, tests and signed release availability are positive reuse signals, but production use still requires deployment hardening, backups/restore drills, upgrade rehearsal, and security/dependency review.
- No explicit evidence of Arabic UI, Arabic translation completeness, bidirectional layout, or RTL behavior; treat as unverified rather than unsupported.

## Provisional score: 75/100

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit (20) | 17 | Broad small-business double-entry accounting, AR/AP, cash, inventory, fixed assets, time, budget and purchasing/sales coverage; validate jurisdiction-specific tax/payroll/banking needs. |
| Architecture/reuse (15) | 13 | Mature web application, Perl + PostgreSQL, customizable templates, open architecture; GPLv2 requires careful distribution-boundary review. |
| Maintenance (15) | 14 | Active commits through 2026-10-12, two maintained stable series and recent release train; team capacity/support guarantees remain unknown. |
| Security/dependencies (15) | 10 | Security reporting and advisory process, signed releases, PostgreSQL foundation; one high-severity historical advisory and no independent audit evidence; deployment must be hardened. |
| Docs/tests (10) | 8 | Official installation/manual materials and documented multi-layer automated tests; docs span old and current release generations, setup/test environment is nontrivial. |
| License clarity (10) | 9 | Root LICENSE clearly contains GPLv2; API metadata is ambiguous and GPLv2 commercial reuse/distribution implications need counsel. |
| Operations (5) | 3 | Official containers/installers and supported architecture options, but production reverse proxy/TLS, database operations, backup/upgrade controls remain adopter responsibility. |
| Integrations (5) | 4 | Email/PDF, open architecture and custom output are documented; specific APIs/connectors and integration breadth were not verified. |
| I18n/RTL (5) | 1 | Translation workflow is mentioned, but no explicit Arabic/RTL support evidence found. |

**Recommendation: Evaluate.** Suitable for a deeper functional, localization, licensing and deployment proof-of-concept for small-business accounting/ERP. Do not treat this review as production readiness or compliance assurance.

## Sources opened

[1] https://github.com/ledgersmb/LedgerSMB — canonical repository README
[2] https://ledgersmb.org/content/features — official feature list
[3] https://github.com/ledgersmb/LedgerSMB/blob/master/LICENSE — exact root LICENSE path/text
[4] https://api.github.com/repos/ledgersmb/LedgerSMB — repository metadata/license classifier
[5] https://ledgersmb.org/content/download — official maintained releases and installation guidance
[6] https://github.com/ledgersmb/LedgerSMB/releases — releases listing; top was 1.13.8
[7] https://github.com/ledgersmb/LedgerSMB/commits/master/ — commit history
[8] https://api.github.com/repos/ledgersmb/LedgerSMB — pushed_at and stargazers_count
[9] https://github.com/ledgersmb/LedgerSMB/tree/master/t — test documentation
[10] https://ledgersmb.org/content/documentation — official installation/manual guidance
[11] https://ledgersmb.org/content/security-reports — official security reporting/advisories page
[12] https://github.com/ledgersmb/LedgerSMB/security/advisories — repository advisory listing
[13] https://ledgersmb.org/content/11217-released — official 1.12.17 announcement/checksums
[14] https://ledgersmb.org/faq — upgrade, migration and reverse proxy notes
