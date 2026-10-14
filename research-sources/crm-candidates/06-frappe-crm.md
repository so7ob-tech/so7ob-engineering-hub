Frappe CRM is a genuine sales CRM with credible current development and a self-hosting path, but it is not a full marketing-automation or customer-service case-management suite; Arabic interface readiness is specifically unverified and the project issue tracker records an RTL support gap. A controlled evaluation is warranted, not approval for production or legal/commercial use.

# Frappe CRM

**Identity and class.** Checked 2026-10-14. The supplied repository URL, `https://github.com/frappe/crm`, resolves to the canonical `frappe/crm` repository. Its project documents describe a sales-focused CRM built on the Frappe framework, not an ERP product; ERPNext appears as an optional integration to extend post-sale functions. [1] [2]

## CRM domain fit and limits

The core product supports lead and deal tracking, contacts/organizations associated with sales opportunities, activity history (notes, calls, tasks, comments, email), Kanban pipeline views, saved/custom views, assignment rules, SLAs, custom fields/statuses/actions, and workflow automation. [1] [2] It is a plausible operational core for prospect/account and opportunity management. The official documents do not establish a comprehensive campaign-management or marketing-automation module, nor a service desk/case-management capability; do not count either domain as covered. Automation is evidenced for sales workflow/routing and should not be conflated with broad BPM or marketing journeys. [1] [3]

## License and edition boundaries

The repository metadata identifies AGPL-3.0, and the official pricing page explicitly describes self-hosting as AGPL-3.0 licensed. Hosted Frappe Cloud is separately priced by computing/site/server, starting at $5/month for Sites, with no per-user charge stated; those hosting fees are not evidence of a proprietary CRM edition or additional CRM-only feature entitlement. [1] [4] A public repository or this note is not legal advice or a determination of compatibility for a particular distribution/network-use model. Review the exact license text and intended deployment with qualified counsel before adoption. The retrieved evidence does not identify separately licensed CRM modules.

## Maintenance, security, and dependencies

Repository metadata reports the canonical project as active and unarchived, with a push on 2026-10-14; commits that day and release v1.86.0 document substantive workflow-automation, UI, and ERPNext fixes. The repository lists stable main/v1.x compatibility with Frappe/ERPNext v15 and v16, while develop targets future v2/v17 and is labeled unstable in its README. [1] [5] This is strong evidence of current maintenance, not a support SLA or guaranteed branch lifetime.

The GitHub security page says no `SECURITY.md` policy is configured. Its advisories page is available, but absence of a policy or visible advisory information is not proof of security. [6] Recent release notes mention permission checks and hardening of a call-recording proxy, which show security-relevant maintenance but do not substitute for an audit. [5] The repository includes a lockfile, dependency graph workflow, CI and dependency update entries in release notes; these are positive dependency-management signals, not a complete software bill of materials, vulnerability disposition, or reproducible-build guarantee. [1] [5]

## Architecture, deployment, docs, and tests

The project is a Frappe application with a Vue-based frontend/Frappe UI and Frappe Framework backend. The repository describes extension/customization options and compatibility by framework branch; separate CRM and ERPNext repositories/apps provide a modular boundary, while shared framework dependence is an operational coupling. [1] It supports managed Frappe Cloud and self-hosting. Official installation documentation provides an easy-install production command/container image, Docker Compose setup, and a Bench development path. It also shows default development credentials, which must never be retained in a deployed instance. [7]

Official docs cover core features and setup. Repository contents include frontend and server tests, Playwright configuration, and CI workflows for server, UI, migration, linting and container build; these establish automated testing infrastructure, not test coverage or an independent quality assessment. [1] The README describes API/webhook access but the evidence reviewed here does not establish a complete, versioned API specification or support commitment. [1] [2]

## APIs and integrations

Official documentation says third-party apps can connect through APIs and lists Twilio, Exotel, Meta/WhatsApp and ERPNext. The official integrations page gives concrete examples: WhatsApp conversations in lead/deal context, phone calls through Twilio/Exotel, and ERPNext quotations/customer creation. These are app integrations, not proof that every connector is bundled/configured without credentials or third-party service costs. ERPNext is an adjacent Frappe app and extends invoicing/accounting; it is not evidence that CRM itself is an accounting suite. [2] [8]

## Arabic, i18n, and RTL

The repository has translation infrastructure and recent changes wrapping/translating strings, but that only supports an i18n claim. [1] [5] Arabic translation completeness was not verified from a supported official source. Separately, the official issue tracker has an issue titled “Arabic language & RTL layout are not properly supported in Frappe CRM UI,” so RTL/bidi readiness must be treated as a known gap, not inferred from locale files. [9] Do not assume usable Arabic UI until directly tested and verified in the intended version.

## Conditional recommendation and confidence

**Recommendation: `evaluate`.** Evaluate as a sales CRM for lead/contact/deal pipelines and sales activities, subject to a real deployment trial, license review, security review, and a separate Arabic/RTL usability test if required. Treat campaigns/marketing and customer-service cases as uncovered unless separately demonstrated. AGPL obligations are fact-specific; there is no blanket commercial-use clearance here. The evidence does not amount to compliance, security, production, or legal approval. Confidence: **medium**—official repository, docs, pricing, release and security sources provide good direct evidence, but security posture, API contract depth, complete Arabic translation, and actual RTL behavior remain unresolved.

## Weighted score (Hub rubric)

Provisional score midpoint **76/100**, with **low/high range 68–83/100** to reflect unknowns. Raw criterion fractions are translated to weighted points below; each point value is no greater than its criterion maximum and the midpoint points sum exactly to 76.

- Feature completeness and domain fit (20): **16/20** — strong sales CRM coverage; no substantiated broad campaign or case-management module.
- Architecture and reuse quality (15): **12/15** — framework app, frontend/backend structure, customization and integrations; framework coupling remains.
- Development activity and maintenance (15): **13/15** — current commit and frequent meaningful releases; support commitments not established.
- Security and dependency quality (15): **8/15** — active fixes, lockfile and CI/dependency workflow evidence, offset by missing security policy and unverified audit/advisory disposition.
- Documentation and testing (10): **8/10** — useful official feature/install docs and test/CI infrastructure; no coverage/quality measurement established.
- License clarity and suitability (10): **7/10** — AGPL-3.0 identified, but suitability requires fact-specific legal review.
- Setup and deployment (5): **4/5** — documented managed, container and Bench paths; operational production verification still needed.
- Integrations and APIs (5): **4/5** — named built-in integrations and API access documented; API contract depth uncertain.
- i18n, Arabic and RTL (5): **4/5** — localization infrastructure exists, but no Arabic completeness verified and an official issue reports RTL deficiency; score remains provisional pending direct locale coverage evidence.

## References

[1]: https://github.com/frappe/crm "Frappe CRM canonical repository and README"
[2]: https://docs.frappe.io/crm/introduction "Frappe CRM official introduction and features"
[3]: https://github.com/frappe/crm/releases "Frappe CRM official releases and change notes"
[4]: https://frappe.io/crm/pricing "Frappe CRM official pricing and self-hosting page"
[5]: https://github.com/frappe/crm/releases "Frappe CRM release history"
[6]: https://github.com/frappe/crm/security/policy "Frappe CRM GitHub security policy status"
[7]: https://docs.frappe.io/crm/installation "Frappe CRM official installation documentation"
[8]: https://frappe.io/crm/integrations "Frappe CRM official integrations page"
[9]: https://github.com/frappe/crm/issues/1618 "Frappe CRM issue on Arabic and RTL support"
