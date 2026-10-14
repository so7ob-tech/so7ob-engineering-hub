# Invoice Ninja — Financial Systems & FinTech candidate

**Checked:** 2026-10-14. **Scope:** invoicing and client billing.

## Evidence-backed facts

- Canonical project: [invoiceninja/invoiceninja](https://github.com/invoiceninja/invoiceninja), described as a source-available invoice, quote, project and time-tracking app built with Laravel. Repository API identifies PHP as primary language, reports 10,084 stars, 2,707 forks, and `pushed_at` 2026-09-17. Counts are point-in-time values checked on 2026-10-14.
- Exact root `LICENSE` file: **Elastic License 2.0 (ELv2)**. GitHub API's SPDX field says `NOASSERTION`; rely on the actual license text rather than the API label. ELv2 prohibits offering the software as a hosted/managed service that exposes a substantial set of its functionality, and restricts bypassing license-key functionality or removing notices. The official interpretation permits using it to invoice clients and gives a web host installing it for clients as an allowed example, while SaaS resale/embedding requires commercial agreement. White-label removal of attribution is separately offered at $40/year per repository text; confirm current terms with licensor/legal counsel.
- Official feature page describes invoices/quotes, customizable templates, products/services, recurring and auto-billing, partial payments, online payment gateways, client portal, payment history, expense re-invoicing, reminders, REST API, reports and multiple currencies/languages. Feature page presents commercial plan limits; availability in the deployed edition/plan should be verified.
- Official self-host docs list PHP 8.2 with extensions, MySQL 5.7+/MariaDB 10.3+, nginx or Apache with HTTPS. They discuss Docker/Podman images, CLI deployment, cron each minute, Laravel queues/Supervisor; docs warn git install lacks the React UI and is not the production path. APP_KEY loss is warned against in repository instructions.
- Release API identifies v5.13.47 published 2026-10-10. Repository releases were active as of checked date.
- GitHub security advisories page showed two published moderate advisories: stored XSS via Markdown HTML injection in product notes (GHSA-xph7-9749-56mh, 2026-03-23) and stored XSS via denylist bypass in invoice line items (GHSA-98wm-cxpw-847p, 2026-03-22). This is not evidence of a security audit or complete vulnerability inventory.
- Repository documents Laravel API flow, routes, developer guide, PHPUnit use and asks contributors to add tests. A `tests/` tree includes acceptance, functional and unit suites; existence does not establish coverage or quality.

## Unknowns and inferences

- No explicit source establishing Arabic UI support or right-to-left layout was found/read; the general claim of multiple languages is not proof of Arabic/RTL. Treat Arabic/RTL as unverified.
- No independently validated production capacity, high-availability design, performance benchmark, compliance certification, penetration test, dependency audit result, or current supported-version/dependency inventory was established. Self-host requirements and queue guidance imply deployment/operations work; they do not prove scalability.
- **Inference:** strong functional fit for SMB client billing; ELv2 makes it unsuitable to treat as permissive open-source or assume an invoicing SaaS may be built/resold without permission. Evaluate legal fit and deployment controls before adoption.

## Provisional score: 74/100

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit (20) | 18 | Broad invoice/client billing, recurring charges, payments, portal, reminders and API. |
| Architecture/reuse (15) | 11 | Laravel/PHP modular API and deployable self-host options; source-available licensing limits reuse. |
| Maintenance (15) | 15 | 10k+ stars and release v5.13.47 dated 2026-10-10; API push date 2026-09-17. |
| Security/dependencies (15) | 9 | Two recent moderate advisories and disclosure contact; no audit or dependency posture established. |
| Docs/tests (10) | 8 | Detailed install/developer docs and acceptance/functional/unit test tree; coverage unknown. |
| License clarity (10) | 4 | Exact ELv2 available, but material hosted-service/resale/branding limitations complicate reuse. |
| Operations (5) | 3 | Multiple installation methods and queue/cron guidance; needs maintained server and secrets/backups. |
| Integrations (5) | 4 | Payment gateways, REST API and automation ecosystem documented; verify specific connectors/plan. |
| i18n/RTL (5) | 2 | Multiple currencies/languages advertised, but Arabic and RTL not explicitly verified. |

**Recommendation:** Evaluate, particularly for internal/client-service billing deployments after legal review. Do not infer production readiness, regulatory compliance or audit status.

## Sources opened

1. https://github.com/invoiceninja/invoiceninja
2. https://github.com/invoiceninja/invoiceninja/blob/master/LICENSE
3. https://invoiceninja.github.io/docs/legal/license
4. https://invoiceninja.github.io/docs/self-host/self-host-installation
5. https://invoiceninja.com/features/
6. https://api.github.com/repos/invoiceninja/invoiceninja
7. https://api.github.com/repos/invoiceninja/invoiceninja/releases?per_page=1
8. https://github.com/invoiceninja/invoiceninja/security/advisories
9. https://github.com/invoiceninja/invoiceninja/tree/master/tests
10. https://invoiceninja.github.io/docs (fetch extraction failed; Arabic/RTL not established from this URL)
