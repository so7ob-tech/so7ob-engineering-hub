# Operating model

## Knowledge record principles

1. Separate external facts, So7ob recommendations, and assumptions. Mark each claim `verified`, `inferred`, or `unknown`.
2. Prefer primary sources: repository files/releases/advisories, official documentation, maintainers' issue trackers. Record exact URL, checked date, and the claim supported.
3. Preserve history. Corrections append a new evaluation or update entry with a reason; do not silently erase old assessments.
4. Use canonical IDs and controlled tags from `taxonomy/domains.yaml`; do not create overlapping domains without a taxonomy review.
5. Separate open-source repositories from commercial product references. The latter are UX/functionality study references only; do not copy protected code, assets, or distinctive visual expression.
6. Every reusable asset declares maturity: planned, in progress, implemented, tested, or verified. A specification is not an implementation.

## New-customer workflow

1. Normalize requirements: users, roles, workflows, integrations, data sensitivity, jurisdictions, scale, delivery model, timeline, and acceptance criteria.
2. Classify domain/subdomains and tag nonfunctional constraints.
3. Search catalog; identify 3–5 candidates where evidence permits, then compare requirements and eligibility gates.
4. Decide build vs adapt vs integrate, explicitly checking license scope and security posture.
5. Select only modules/design patterns whose maturity and compatibility are known.
6. Propose stack, architecture, data boundaries, and deployment model; justify trade-offs.
7. Produce MVP and later-phase roadmap with test/security/compliance activities.
8. Record assumptions, risks, unresolved questions, and sources in the client-specific workspace, not this shared repository.

## Suggested client decision memo

Requirements analysis; candidate comparison; license/security review; build/adapt/integrate decision; proposed stack and architecture; reusable modules and UI patterns; conceptual data model; delivery phases; verification plan; security/privacy checklist; assumptions and risks.

## Reuse boundaries

A catalog entry is not an endorsement, security audit, legal opinion, or compliance certification. Validate a candidate against the client's exact release, configuration, deployment, data, and jurisdiction before use. Keep customer data, credentials, private vulnerabilities, and confidential requirements out of the shared hub.