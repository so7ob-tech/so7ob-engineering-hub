# Mojaloop (`mojaloop/mojaloop`) — candidate note

**Checked:** 2026-10-14. Candidate domain: interoperable retail payments. This is the onboarding/contribution starting-point repository, not the full executable platform; its README points adopters to separate central-ledger, API adapter, account lookup, Helm, and test repositories.

## Evidence-backed facts
- **Project type / fit:** Open-source software, specifications, and standards for interoperable digital payment platforms linking digital financial service providers (DFSPs), customers, merchants, banks, and other providers. Official overview says central services can include a central ledger, identity lookup, fraud management, and scheme-rule enforcement; standardized interfaces and example DFSPs support connections.
- **Exact repo license:** `LICENSE.md` (case-sensitive, not `LICENSE`) states Mojaloop Foundation files are under **Apache License 2.0**, incorporates the upstream license, and provides the standard “AS IS” warranty disclaimer. GitHub API metadata labels the license `Other` / `NOASSERTION`, so use the actual file and review each component/dependency license; the umbrella repo license is not an automatic blanket clearance of every deployment component. Commercial reuse is generally permitted under Apache-2.0 subject to its conditions (license/copyright notices, state changes, preserve relevant notices; patent terms and termination apply); obtain legal review for a commercial financial deployment.
- **Technology/architecture:** A distributed set of central services and participant-side systems connected through standard APIs; this repository itself reports no language. It identifies central-ledger, `ml-api-adapter`, account-lookup-service, Kubernetes Helm charts, and Postman scripts elsewhere in the organization. Do not mistake this hub documentation repo for a turnkey single-package product.
- **Features evidenced:** Interoperable transfers between DFSPs; account/party lookup; merchant payments schemes; cross-border transactions and ISO 20022 are explicitly identified in official product documentation. Official legacy overview describes central ledger, identity lookup, fraud-management and scheme-rule capabilities, plus example sender/receiver DFSP implementations.
- **Arabic/RTL:** No explicit Arabic localization or RTL evidence found in the opened project overview/docs; unknown rather than absent across all components.
- **Maintenance:** GitHub API, checked 2026-10-14, reported 327 stars, 115 forks, not archived, and repository `pushed_at` 2025-03-11. Most recent commit API result was 2025-02-07 (`Update License.md`). This hub repo has no GitHub releases. These signals refer to this exact repository, not the whole Mojaloop organization; inspect component repositories for release currency.
- **Docs/tests:** Official documentation is substantial and separates Adoption, Community, Product, Technical, and Training. Hub README directs contributors to onboarding and identifies Postman scripts for environment testing/management; detailed component-level automated test coverage was not established from these sources.
- **Security:** Official vulnerability-management documentation describes a security committee and coordinated disclosure, SAST/CodeQL, Dependabot, secret scanning, SonarCloud, SBOM/dependency monitoring, Grype container scans, license checks, and signed Helm charts starting with release v17.1.0. The policy scope is Helm-release components; external MySQL, Redis, MongoDB, Kafka are outside that app-code scope. GitHub advisories page was opened but rendered no advisory listing. These are process claims, not evidence of an independent audit or a clean vulnerability state.
- **Operations:** Official hub points to Kubernetes deployment/Helm materials; production requires assembling and operating multiple services and external dependencies. Scale, availability, security configuration, settlement, scheme governance, and country-specific regulatory work require deployment-specific engineering. Do not infer production readiness or regulatory compliance.

## Unknowns and cautions
Exact current component versions and language mix; effective end-to-end test coverage; live performance/SLO evidence; current unresolved security issues across every component and dependency; Arabic/RTL support; operational cost and deployment sizing; country-specific compliance and commercial terms beyond the stated repo license. GitHub release page for this hub repo has no releases, which does not establish absence of releases in component repos.

## Inferences / provisional assessment
Strong domain alignment and a reusable reference architecture for national or multi-provider instant-payment schemes. Adoption is a substantial systems-integration and governance effort, rather than reuse of a ready-made consumer app. **Provisional score: 73/100**, based on the rubric below; score is for candidate evaluation, not production suitability.

| Criterion | Points | Rationale |
|---|---:|---|
| Feature fit /20 | 18 | Directly targets interoperable retail payments, transfers, lookup and merchant/cross-border use cases. |
| Architecture/reuse /15 | 12 | Open specifications and modular central/participant services, but composed across repositories. |
| Maintenance /15 | 8 | Project active at organizational level; exact hub repo latest commit is Feb 2025 and has no releases. |
| Security/dependencies /15 | 11 | Documented security pipeline and disclosure process; no audit conclusion, broad external dependency boundary. |
| Docs/tests /10 | 8 | Extensive official docs and Postman tooling; component test coverage not verified. |
| License clarity /10 | 9 | Explicit Apache-2.0 text in exact LICENSE.md, but GitHub classifier says NOASSERTION and components need review. |
| Operations /5 | 3 | Kubernetes/Helm deployment path exists; significant operational scope and dependencies. |
| Integrations /5 | 4 | Standard DFSP APIs and adapter/lookup components explicitly described. |
| i18n/RTL /5 | 0 | No explicit Arabic/RTL support evidence located. |

**Recommendation:** Evaluate. Do not claim production readiness, certification, security audit, or compliance without independent deployment-specific validation.

## Sources opened
- Canonical repository: https://github.com/mojaloop/mojaloop
- Exact license file: https://github.com/mojaloop/mojaloop/blob/main/LICENSE.md
- Repository metadata (stars, pushed_at, license classifier): https://api.github.com/repos/mojaloop/mojaloop
- Latest commit API: https://api.github.com/repos/mojaloop/mojaloop/commits?per_page=1
- Hub repo releases: https://github.com/mojaloop/mojaloop/releases
- Official docs home: https://docs.mojaloop.io/
- Official legacy overview: https://docs.mojaloop.io/legacy/
- Official product docs: https://docs.mojaloop.io/product/
- Official security overview: https://docs.mojaloop.io/technical/technical/security/security-overview.html
- GitHub security advisories page: https://github.com/mojaloop/mojaloop/security/advisories
- Official site: https://mojaloop.io/
