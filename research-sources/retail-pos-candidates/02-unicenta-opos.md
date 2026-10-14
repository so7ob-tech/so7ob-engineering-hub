# uniCenta oPOS — Retail & POS candidate

**Evidence date: 2026-10-14.** This is a provisional screening, not adoption approval. Distinctions: **verified** = directly visible in primary source; **project claim** = vendor/community statement not independently tested; **inference** = assessment; **unknown** = not established from opened evidence.

## Finding

**Recommendation: legacy-only / conditional evaluation of exact source snapshot; do not treat current supported product and public community code as interchangeable.** uniCenta is POS-first desktop software aimed at retail and hospitality, not an ERP module or infrastructure utility. Community availability and GPLv3 are advertised by the project, but available public evidence is internally stale/mixed: SourceForge presents v5.0 as latest community release while its page also promotes commercial 5.4, and the official changelog reaches 5.4.0 (Aug 2025); search indexed a 5.5.1 source page dated 26 Sep 2026, but opening the official source page did not show that item. The specific public GitHub repository opened here is an old 2014 v3.70 repository, not proof of the latest official source tree. Score therefore penalizes maintenance, license provenance, and current reproducibility.

## Product and workflows

**Verified/project claims:** SourceForge describes multi-lingual, multi-location, multi-terminal, multi-user POS. Advertised feature list includes switchable retail/restaurant sales screens; products, customers, inventory, roles, taxes; barcode scanner, weighing scales, mag card, iButton, customer display; Epson/Star-compatible peripherals; multiple printers and kitchen display; and database choices including Derby, MySQL, HSQLDB, PostgreSQL and Oracle. Treat hardware breadth and operational quality as claims, not tested interoperability. The changelog evidences receipt/restaurant-related fixes, tax work, product/customer/order APIs, WooCommerce integration, and payment integrations including Teya/PaymentSense. Cash tender/change, void/refund/returns, cash drawer control and end-of-day cash reconciliation are not established in the sources opened; do not assume complete coverage.

**Integration/accounting:** Inventory management is advertised. Accounting/ledger integration was not evidenced. Official site advertises REST API, but the changelog says APIs were introduced incrementally (customer 5.1, order 5.2, product 5.3), so endpoint scope/version must be checked against the actual artifact. WooCommerce integration is in 5.4.0 changelog. Payment processor availability appears jurisdiction/product specific; PCI/EMV branding is a claim, not an independent security certification.

**Offline/multi-store:** Desktop client and local/server database options imply potential single-site/local operation, and project claims multi-location/multi-terminal. This does not verify offline transaction queueing, replication conflict behavior, resilience during network loss, or centralized multi-store consistency. Cloud-hosted database capability is advertised; offline and multistore semantics remain unknown.

**Internationalization:** SourceForge claims 17 languages. Changelog confirms Spanish translation and older Spanish UI/report/ticket localization. No evidence of Arabic translation, RTL layout, Arabic shaping, bidi-correct receipts, locale-aware Arabic numerals, or RTL accessibility was found. Arabic/RTL is unknown and receives zero points.

## Technology, release and operations

Official release notes state v5.0 integrated Java 11, MariaDB, and native applications that do not require an installed JVM. Source page says source is Mavenized and built with `mvn clean package` (explicit for 4.6.2); current exact build instructions and dependency lock state were not verified. Product is Java-derived POS, but public repository examined is old. SourceForge says v5.0 is the latest community release; official changelog lists releases to 5.4.0 Aug 2025, with 5.3.1 security release May 2024 and 5.3.2 March 2025. Source page surfaced in search as 5.5.1 dated Sep 2026, conflicting with opened page content. Consequently latest open/community build and its source-to-binary correspondence are unknown. Do not cite 5.5.1 as verified.

Documentation includes self-service installation/configuration/setup/upgrade; some guides and priority support are customer-only. There is an open community forum. No automated test-suite evidence, CI status, coverage or reproducible release process was found. Deployment spans client, Java/runtime or native packaging, database, receipt/printer hardware and optional payment integrations; operational burden is moderate/high, and current supported platform matrix should be confirmed.

## License and security

The official site says oPOS is GPL3; SourceForge project metadata lists GPLv3, LGPLv3 and Public Domain collectively, an ambiguous project-level signal. An opened LICENSE file at a third-party GitHub mirror contains the GNU GPL version 3 text, but that mirror is not the canonical SourceForge project and does not establish the license of every current binary, plugin, bundled dependency or third-party component. The old Metawired GitHub repository README also states GPLv3. Exact reuse obligations if the adopted code is GPLv3: preserve copyright/license notices and GPL terms; when conveying covered/modified program, provide corresponding source under GPLv3 and required notices; assess derivative/combined work and network/service distribution facts with counsel. Do not assume LGPL/public-domain metadata applies to core or that plugins have identical terms. Inventory all file-level notices, dependencies, assets, fonts and payment SDK terms before reuse.

GitHub Security page for Metawired/UnicentaPOS explicitly says no SECURITY.md/security policy. The official 5.3.1 release page says maintainers found/remediated “24 critical security vulnerabilities” from Trivy/Snyk scans and names XStream, Spring, XMLGraphics, JasperReports, PostgreSQL and Derby fixes; it is a project-reported scan/remediation, not independent validation, CVE mapping or evidence the public community archive contains fixes. No specific public advisory record was verified. Current dependency inventory, SBOM, scan results, supported patch line, vulnerability disclosure contact, and CVE/advisory status are unknown. Treat security risk as elevated until exact source/build/dependency scans and patch provenance are validated.

## Provisional score (out of 100)

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit | 14/20 | Clearly retail/hospitality POS; checkout-adjacent features broad, but key cash/returns semantics unverified. |
| Architecture/reuse | 8/15 | Java/Maven source and several DB options; legacy/public repo and version provenance ambiguity. |
| Maintenance | 5/15 | Commercial changelog active through 2025, but public community source is apparently stale/mixed; recent 5.5.1 search result not verified on open. |
| Security/dependencies | 5/15 | Reported critical fixes, but no policy on examined repo and no independently verified current dependency posture. |
| Docs/tests | 5/10 | Installation/configuration docs and forum; tests/CI not evidenced and some guides gated. |
| License clarity | 4/10 | GPL3 claims/text exist, but SourceForge lists multiple license labels; exact current artifact/file-level provenance uncertain. |
| Setup/deployment | 3/5 | Build and deployment guidance exists; desktop, database and hardware/payment setup impose burden. |
| APIs/hardware/integrations | 3/5 | REST APIs, WooCommerce and peripherals claimed/documented, scope and compatibility require artifact validation. |
| i18n/Arabic/RTL | 0/5 | General language claim only; no Arabic/RTL evidence. |
| **Total** | **47/100** | **14+8+5+5+5+4+3+3+0 = 47.** |

## Opened sources

1. [SourceForge project](https://sourceforge.net/projects/unicentaopos/) — community version, project claims, feature/peripheral list, mixed license metadata.
2. [Official uniCenta site](https://unicenta.com/) — product positioning, GPL3 claim, API/cloud/web/payment claims, support/customer distinction.
3. [Official source downloads](https://unicenta.com/downloads/sources/) — source archive page; opened content listed 5.0 and older source releases and build approach, while search index yielded a conflicting 5.5.1 result.
4. [Official changelog](https://unicenta.com/support/changelog-unicenta-opos/) — 5.4 (Aug 2025), 5.3.2 (Mar 2025), security release and API chronology.
5. [5.3.1 security release notes](https://unicenta.com/unicenta-opos-release-5-3-1/) — reported Trivy/Snyk findings and dependency fixes.
6. [Support/docs](https://unicenta.com/support/) — community/customer forum and documentation availability.
7. [Metawired GitHub repository](https://github.com/Metawired/UnicentaPOS) — old 11 May 2014 v3.70 README and GPL3 statement; not assumed current canonical code.
8. [Metawired GitHub security page](https://github.com/Metawired/UnicentaPOS/security) — no security policy detected.
9. [Third-party mirror LICENSE](https://github.com/geertvanzoest/unicenta-opos/blob/main/LICENSE) — opened GPLv3 text; not authoritative proof for current official artifact.
10. [Official 5.0 package record](https://unicenta.com/packages/unicenta-opos-5-0-windows-64-bit-native-2/) — page metadata says created/updated 10 Apr 2023.
