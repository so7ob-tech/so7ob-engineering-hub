# So7ob Engineering Knowledge Hub

A versioned, evidence-first engineering knowledge base and reusable-assets program for So7ob Tech. This repository separates **verified facts**, **engineering recommendations**, and **unverified hypotheses** so teams can reuse knowledge without confusing a shortlist with due diligence.

> Current state: **Foundation plus four domain reviews.** Financial Systems & FinTech, E-commerce, Retail & POS, and CMS & Headless CMS each have ten source-reviewed candidates with provisional scores; no project is approved for adoption. News & Media is next in the priority queue.

## Contents

- `taxonomy/` — controlled domains, tags, and prioritization.
- `catalog/` — evidence cards grouped by domain; records must cite dated sources.
- `evaluations/` — scoring rubric, eligibility gates, and ranking decisions.
- `database/` — PostgreSQL schema and import guidance.
- `design-systems/` — external design-system evaluations and So7ob Design System (SDS) specification.
- `reusable-modules/` — contracts and implementation status for So7ob Core modules.
- `architecture/`, `starter-kits/` — decision guides and project blueprints.
- `product-references/` — commercial product UX references (not source-code reuse).
- `knowledge-index/` — retrieval design and provenance rules.
- `security-compliance/` — cross-cutting security and sector checklists.
- `research-sources/` — source policy and research logs.
- `scripts/` — deterministic validation/import utilities.

## Start here

1. Read `docs/operating-model.md` and `evaluations/scoring-rubric.md`.
2. Browse the domain queue in `taxonomy/domains.yaml`; review `catalog/business-finance/`, `catalog/commerce/`, `catalog/retail-pos/`, and `catalog/cms/` for candidate records and reports.
3. Add candidates from primary sources using `templates/repository-card.yaml`.
4. Validate with `python3 scripts/validate_catalog.py`.
5. Treat every recommendation as conditional on customer requirements, jurisdiction, security review, and license review.

## Evidence and status policy

Every claim that may change a decision must have a source URL, source type, checked date, and a confidence label. Use `verified` only for facts confirmed from a primary source; `inferred` for reasoned deductions; `unknown` where evidence is absent. “Adopt” is not a certification or warranty. A repository with an unclear license is **not presumed commercially reusable**. GPL/AGPL obligations require counsel's review for the intended distribution/deployment model.

Status labels: `planned` (design only), `in_progress`, `implemented`, `tested`, `verified` (external facts checked), `deprecated`. Never call an asset implemented or tested unless code exists and a reproducible test has passed.

## Initial priorities

The prompt's first research wave is: Financial Systems & FinTech; E-commerce; Retail & POS; CMS; News & Media; Hospital Management & EHR; Clinic Management; Booking & Service Marketplaces. The remaining catalog areas are explicitly queued, not complete. Each domain should contain up to ten suitable, genuinely reviewed projects; fewer is preferable to padding.

## Local checks

```bash
python3 scripts/validate_catalog.py
```

The PostgreSQL DDL in `database/schema.sql` is a design artifact; no database instance is provisioned by this repository. Scheduled refreshes are proposed in `docs/maintenance.md` and are not active until configured.

## Security and privacy

Do not put customer secrets, personal data, credentials, private vulnerability details, or customer-specific designs in this shared repository. Use approved private project storage for client materials. Financial and health projects require jurisdiction- and use-specific compliance review; no listed software is represented as PCI DSS, HL7/FHIR, HIPAA, or other compliant absent independent evidence.

## License

Repository documentation and original code are licensed under Apache-2.0 (see `LICENSE`). Third-party projects retain their own licenses; cataloging does not grant rights to copy, modify, distribute, or deploy them.
