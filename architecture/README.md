# Architecture & Starter Kits

## Default decision guidance

| Pattern | Use when | Watch-outs |
|---|---|---|
| Modular monolith | Most new products; one deployable with enforced domain modules | Boundaries must be enforced; avoid shared-table coupling. |
| Clean / Hexagonal | Core business rules need isolation from frameworks/providers | Can become ceremony; apply proportionally. |
| Domain-Driven Design | Complex domain, meaningful bounded contexts, domain experts available | Do not adopt tactical DDD vocabulary without real domain complexity. |
| API-first | Multiple clients/integrators or contract-led delivery | Versioning, auth, rate limits, and error semantics are product work. |
| Multi-tenant SaaS | Multiple customer organizations share a service | Choose pooled, schema, or database isolation from risk/compliance and ops needs; test isolation. |
| Event-driven | Independent workflows, async integration, or decoupling is valuable | Eventual consistency, delivery guarantees, schema evolution, observability, and replay complexity. |
| Microservices | Independent deploy/scale/ownership needs outweigh network and platform overhead | Not the default for an early product; requires mature CI/CD, tracing, ownership, and reliability. |

Begin with the simplest architecture meeting explicit nonfunctional requirements. Record quality attributes, failure modes, data ownership, and migration path in an ADR before splitting services.

## Starter kit portfolio (all planned, not implemented)

1. SaaS — modular monolith, tenant-aware identity/access, audit, subscription adapter, observability.
2. E-commerce — catalog/cart/order modules, provider adapters, inventory consistency and idempotent checkout.
3. Financial dashboard — read-model first, immutable audit trail, strong authorization, explicit currency/precision rules.
4. Clinic management — appointment/patient workflow, sensitive-data boundary, jurisdictional privacy checklist.
5. Hospital management — bounded clinical/administrative domains, interoperability only when specified and validated.
6. CMS & News — content model, editorial states, preview, publication scheduling, localization.
7. ERP — modular domains, integration boundaries, configurable workflow, reporting read models.
8. CRM — account/contact ownership, pipeline state machine, activity history, consent boundaries.
9. Services booking — availability, timezone, capacity and idempotent reservation lifecycle.
10. Admin dashboard — SDS foundations, authz, audit, accessible data table/filter patterns.

Each future kit must include runtime matrix, threat model, local setup, migrations, tests, CI, deployment configuration, observability, backup/restore, ADRs, and a working sample. This document is blueprint only.