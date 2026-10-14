# So7ob Core Modules

**Maturity: planned portfolio; no reusable runtime modules are implemented in this repository yet.** Each module should be independently versioned, have documented contracts, threat model, migrations, tests, operational notes, and clear dependencies before being declared reusable.

| ID | Module | Core contract / design concern | Security and test baseline |
|---|---|---|---|
| identity | Authentication & Identity | OIDC/OAuth integration boundary; session/token strategy | MFA/session expiry, CSRF, secret handling; authn integration tests |
| organizations | Users & Organizations | organization membership and lifecycle | tenant isolation; membership invariants |
| access-control | Roles & Permissions | permission checks and policy evaluation | deny-by-default; authorization matrix tests |
| tenancy | Multi-tenancy | tenant context propagation and isolation | cross-tenant access tests; tenant-aware indexes |
| notifications | Notifications | channel-neutral event-to-delivery contract | preferences, deduplication, abuse controls |
| messaging | Email & SMS | provider adapters and template IDs | PII minimization, consent, secret rotation, sandbox tests |
| payments | Payments & Billing | provider-neutral payment intents/webhooks | never store PAN/CVV; signature/idempotency tests; provider PCI scope review |
| subscriptions | Subscriptions | plan, entitlement and lifecycle events | idempotent billing state transitions |
| media | File & Media Management | signed upload/download and metadata | content scanning, MIME verification, access-control tests |
| search | Search & Advanced Filtering | query schema and filter DSL | parameterization, query limits, ACL filtering |
| audit | Audit Logs | append-only actor/action/target record | integrity, retention, redaction, access tests |
| activity | Activity Timeline | normalized domain events | avoid sensitive payload leakage |
| analytics | Reports & Analytics | read models and export contract | row-level access, aggregation/privacy review |
| import-export | Import & Export | versioned formats, async job API | formula injection, validation, authorization tests |
| settings | Settings & Configuration | typed config with defaults and scope | secrets excluded; schema validation |
| localization | Localization & Translation | locale negotiation and message catalog | bidi tests, interpolation safety |
| workflow | Approval Workflows | state machine and transition events | separation of duties; invalid transition tests |
| appointments | Calendar & Appointments | availability, timezone, booking contract | race-condition and timezone tests |
| integrations | API Integration Layer | adapter, retry, error normalization | SSRF controls, credential isolation, contract tests |
| jobs | Background Jobs & Queues | enqueue/consume/retry contract | idempotency, poison messages, ACL tests |
| cache | Caching | cache-aside/key invalidation policy | tenant-key separation, stale-data tests |
| flags | Feature Flags | typed flag evaluation and targeting | fail-safe defaults; no sensitive targeting data |
| backup | Backup & Recovery | backup schedule/restore runbook | encrypted backup and restore drills |
| observability | Observability & Error Tracking | logs, metrics, traces, error adapter | scrub secrets/PII; telemetry tests |
| delivery | CI/CD & Deployment Templates | reusable pipelines and environment manifests | least privilege, pinned actions/images, deployment checks |

## Implementation gate

Before changing maturity to `implemented`, add code and API contract. Before `tested`, include a repeatable automated test command and passing results in CI. Track module dependencies and supported runtime versions. Prefer modular monolith packages until independent deployment or scaling needs justify services.