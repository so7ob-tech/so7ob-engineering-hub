# Repository evaluation rubric

## Weighted score (100 points)

| Criterion | Weight | Scoring guidance |
|---|---:|---|
| Feature completeness and domain fit | 20 | Coverage of the target use cases; distinguish core from plugin-dependent functionality. |
| Architecture and reuse quality | 15 | Modularity, extension points, clean boundaries, migration paths, and coupling. |
| Development activity and maintenance | 15 | Recent meaningful commits/releases, issue triage, supported branches; stars are not a proxy. |
| Security and dependency quality | 15 | Security policy/advisories, supported dependencies, secure defaults, reproducible checks. |
| Documentation and testing | 10 | Setup/deployment docs, API docs, meaningful automated tests and CI. |
| License clarity and suitability | 10 | License present, correct, and compatible with intended commercial use and distribution. |
| Setup and deployment | 5 | Reproducibility, container support, operational complexity. |
| Integrations and APIs | 5 | Documented and maintainable interfaces/connectors. |
| i18n, Arabic and RTL | 5 | Verified localization architecture, Arabic coverage and bidi layout behavior. |

Score each criterion as a raw fraction from 0.0 to 1.0; weighted score = sum(fraction × weight). Missing evidence is **unknown**, not zero by default: record a provisional score range and reduce confidence rather than inventing certainty. Scores are comparative to So7ob's stated project requirements, not universal quality judgments.

## Eligibility gates (independent of score)

- **License gate:** no clearly identified license means no adoption recommendation. Seek legal review for license compatibility; GPL/AGPL obligations depend on use, modification, distribution, and network deployment facts. Never imply that a public GitHub repository is automatically commercially reusable.
- **Security gate:** unresolved critical/high-impact vulnerabilities, compromised releases, or unsafe defaults block `adopt` until disposition is documented.
- **Operational gate:** unsupported runtime/platform or non-reproducible deployment can block a proposed production use even with a high score.
- **Domain/regulatory gate:** health/finance systems need specialist review for applicable jurisdiction and workflow; technical cataloging is not a compliance certification.
- **Evidence gate:** score and rank only after primary-source verification sufficient for the decision; otherwise keep as `evaluate` or `reference_only`.

## Recommendation labels

- `adopt`: candidate for a controlled proof-of-concept after license, security, and fit gates pass; not blanket production approval.
- `evaluate`: promising but one or more important questions remain.
- `reference_only`: useful for architecture/product study, not proposed as a code base.
- `avoid`: documented blocker or poor fit; retain the rationale and review date.

## Confidence

- `high`: key claims corroborated by official repository/docs/releases and checked recently.
- `medium`: most claims have primary evidence but notable gaps remain.
- `low`: incomplete, old, secondary-only, or conflicting evidence.

Maintain historical evaluations rather than overwriting them. Each evaluation records evaluator, date, rubric version, evidence set, and change rationale.