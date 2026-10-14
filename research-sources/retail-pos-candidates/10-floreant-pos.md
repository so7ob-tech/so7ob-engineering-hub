# Floreant POS — candidate evidence note

**Evidence date: 2026-10-14.** This is a source-based screening of the exact `fat-tire/floreantpos` mirror, not an adoption approval. Labels distinguish **verified fact** (repository/API/project material directly observed), **project claim** (official marketing/docs, not independently validated), **inference**, and **unknown**.

## Finding

Floreant is **POS-first restaurant/hospitality software**, not an ERP module or infrastructure-only component. Its desktop Java point-of-sale workflows overlap retail checkout, but the core product is oriented to food service: dine-in tables, kitchen routing, modifiers and guest checks. The official site additionally promotes light retail and variable order types, but does not establish broad general-merchandise retail suitability. **Recommendation: evaluate only as an adjacent/stale candidate; not a general Retail & POS platform selection.** The GitHub mirror had fresh dependency maintenance through July 2026, yet explicitly warns that it can lag the upstream SourceForge SVN source. No adoption approval is implied.

## Product and workflows

**Verified fact:** the canonical GitHub repository README describes a Java multi-terminal restaurant POS backed by Derby, MySQL/MariaDB, or PostgreSQL; the README explicitly calls this GitHub repository a manually synced mirror of development hosted at SourceForge SVN and warns it may not be current. **Project claim:** official feature pages describe table service, order/ticket editing, check splitting, guest-check printing, modifiers, manager-authorized voids, cash drawer assignment/reconciliation, tips, sales reports, discounts/coupons, barcode support, sales tax and tax-inclusive prices. This is credible POS workflow evidence but does not demonstrate modern refund/return processing, card processing/acquiring, or compliance. Refunds/returns remain **unknown**.

**Hardware claims:** official docs claim thermal receipt printing, multiple kitchen printers, printer groups/routing, fallback kitchen chits through receipt printer, kitchen display, and cash drawer connection at each terminal. SourceForge project readme also lists barcode, customer display and digital-scale integration. These are product claims; compatibility lists, interfaces/drivers and tested device models are **unknown**. Payment gateway is listed among premium/PRO features on the site, but processor integrations and security scope are not established. Don’t infer integrated EMV/card hardware from generic payment language.

**Inventory/accounting:** official feature copy says plugins/PRO can add inventory and floorplan; available core reporting includes sales and payroll-style reports and cash reconciliation. Recipe/KDS and some advanced functions are shown as upgrade features. No evidence reviewed establishes a complete inventory/ERP/accounting integration, ledger sync, purchasing or robust API. Treat these as **unknown or commercial/plugin-dependent**, not core capabilities.

**Offline / scale:** the official site claims non-cloud, offline operation and an embedded database. Installation docs say single terminal uses embedded Derby, while multi-terminal use requires Derby server; README also lists MySQL/MariaDB and PostgreSQL. No reliable evidence of resilient multi-store central synchronization, offline conflict handling, or branch consolidation was found. Offline single-site use is a plausible strength; multistore is **unknown**.

## Stewardship, maturity, docs, security

**Verified fact:** repository metadata calls the project a mirror updated from SVN; its README says the mirror may not contain latest upstream changes. GitHub API at evidence date shows `pushed_at` 2026-07-23, default branch `2019-fattire-master`, and a latest commit that merges a PostgreSQL JDBC dependency bump. The repository is not marked archived. This is recent maintenance activity, but does not prove active product-feature development by upstream maintainers. The GitHub releases API returned an empty array. SourceForge file listings showed 2.0 build 2001 dated 2026-05-23 and 1.5 build 1958 dated 2026-03-23, while official installation docs still call 1.4 build 1707 the latest stable and require Java 8. This mismatch is a material release-channel/documentation uncertainty; product release maturity cannot be inferred from mirror dependency commits.

The GitHub README records past Log4j vulnerability/dependency patch efforts, including Log4Shell-era updates and an old HttpComponents alert. GitHub security page says no SECURITY.md policy is configured. No published repository security advisories were surfaced in reviewed sources; that means **none found in checked pages**, not proof of absence. Current complete dependency/SBOM/vulnerability posture is unknown. A local Java desktop deployment and legacy Java 8 instructions create operational/support burden; validate current JDK compatibility, database migration/backup/restore, and device setup before any trial. Official docs exist but appear partly stale. No test-suite coverage, CI quality gates, documented API surface, or integration contract was established in this review.

## License and reuse

The exact mirror `LICENSE` file labels the code **MRPL 1.2**, described as Mozilla Public License 1.1 with a permitted attribution clause, and says copyright OROCUBE LLC, 2015. It points to `http://www.floreantpos.org/license.html`, a link the README says became broken; the README points to an archived copy of the license. Official project general-information page likewise calls it MRPL 1.2, a variant of MPL 1.1, and says a supported/commercial-license offering also exists. Official feature copy says modified code must be made available in source form. **Reuse caution:** this is not a standard SPDX MPL-1.1/MPL-2.0 declaration (`NOASSERTION` in GitHub API); verify complete MRPL 1.2 text, Exhibit attribution clauses, file-level coverage, third-party dependency licenses, and compatibility with So7ob distribution before reuse. Preserve notices/attribution and satisfy the exact modified-file source availability obligations under the full license; do not rely on an inferred standard MPL interpretation. Seek legal review for redistribution or incorporation into a proprietary product.

## Arabic / RTL

**Verified project documentation:** message templates under `i18n/message.properties` can be copied and translated; localization instructions show an Arabic message-file example and use Java locale settings. This establishes UI-string localization mechanism, not complete Arabic quality. **Unknown:** shipped/maintained Arabic translation, right-to-left layout support, bidirectional text correctness, numerals/date/currency behavior, Arabic receipt output, and accessibility. Score conservatively; never equate generic i18n with RTL.

## Provisional score (same 100-point rubric)

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit | 12/20 | Real restaurant checkout/tender/tax and table workflows; only adjacent/light retail, returns and general retail breadth unverified. |
| Architecture/reuse | 7/15 | Java desktop, multi-terminal and multiple DB options; legacy desktop architecture, mirror divergence and no established API limit reuse. |
| Maintenance | 9/15 | July 2026 mirror dependency commits and SourceForge builds, but stale official stable-install page and no verified upstream cadence. |
| Security/dependencies | 5/15 | Some dependency patch activity; no security policy, history of legacy dependency vulnerabilities, full current posture unknown. |
| Docs/tests | 5/10 | Product and install/localization docs exist, but contradictory versions/stale Java 8 guidance; tests/CI evidence weak. |
| License clarity | 5/10 | Exact file and named MRPL terms available, but nonstandard modified MPL text/linked canonical license unavailable in reviewed live page; needs legal validation. |
| Setup/deployment | 3/5 | ZIP and embedded Derby simplify a single terminal; Java/database/server/peripheral operations and multi-terminal configuration remain. |
| APIs/hardware/integrations | 2/5 | Peripheral claims, but no verified supported-device matrix, payment APIs or integration contracts. |
| i18n/Arabic/RTL | 1/5 | Message translation instructions and Arabic example; no evidence of polished Arabic/RTL behavior. |
| **Total** | **49/100** | **Adjacent/stale candidate; do not inflate for restaurant-specific claims.** |

## Opened sources

1. [Canonical mirror repository and README](https://github.com/fat-tire/floreantpos)
2. [Exact LICENSE file](https://github.com/fat-tire/floreantpos/blob/master/LICENSE)
3. [Official Floreant site](https://floreant.org/)
4. [Official feature page](https://floreant.org/features/)
5. [Official project overview / stewardship / license statement](https://floreant.org/support/genaral_information/)
6. [Official install / backoffice docs](https://floreant.org/support/installation-backoffice/)
7. [Official localization docs](https://floreant.org/support/localization/)
8. [SourceForge project file history](https://sourceforge.net/projects/floreantpos/files/)
9. [GitHub releases API](https://api.github.com/repos/fat-tire/floreantpos/releases) (empty array at retrieval)
10. [GitHub recent commits API](https://api.github.com/repos/fat-tire/floreantpos/commits?per_page=5)
11. [GitHub repository metadata API](https://api.github.com/repos/fat-tire/floreantpos)
12. [GitHub security page](https://github.com/fat-tire/floreantpos/security)
13. [Official feature page’s MRPL claim](https://floreant.org/features/)
