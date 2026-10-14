# Research catalog

Catalog records live in domain-specific folders. Current research state is partial: **Financial Systems & FinTech, E-commerce, Retail & POS, CMS & Headless CMS, News & Media, Hospital Management & EHR, Clinic Management, ERP, and CRM each have ten source-reviewed candidates with provisional scores. Booking & Service Marketplaces has six suitable candidates**; the smaller count avoids padding a niche with hotel, event-ticketing, or generic e-commerce products. Other domains remain queued. Candidate classes differ, and scores are screening judgments, not adoption approval or universal rankings.

| Domain | Queue status | Record count |
|---|---|---:|
| Financial Systems & FinTech | candidate review complete; scores provisional | 10 |
| E-commerce | candidate review complete; scores provisional | 10 |
| Retail & POS | candidate review complete; provisional scores, mixed categories | 10 |
| CMS & Headless CMS | candidate review complete; provisional scores; mixed license models | 10 |
| News & Media | candidate review complete; provisional scores; distinct product classes | 10 |
| Hospital Management & EHR | candidate review complete; provisional scores; non-interchangeable clinical product classes | 10 |
| Clinic Management | candidate review complete; provisional scores; distinct practice, platform, and specialist classes | 10 |
| Booking & Service Marketplaces | candidate review complete; six evidence-reviewed, class-specific candidates | 6 |
| ERP | candidate review complete; provisional, class-sensitive scores | 10 |
| CRM | candidate review complete; provisional, class-sensitive scores | 10 |

FinTech: [candidate report](business-finance/fintech-candidate-review.md), [JSON records](business-finance/financial-systems-fintech.json), evidence notes in `research-sources/fintech-candidates/`.

E-commerce: [candidate report](commerce/ecommerce-candidate-review.md), [JSON records](commerce/ecommerce-candidate-review.json), evidence notes in `research-sources/ecommerce-candidates/`.

Retail & POS: [candidate report](retail-pos/retail-pos-candidate-review.md), [JSON records](retail-pos/retail-pos-candidate-review.json), evidence notes in `research-sources/retail-pos-candidates/`.

CMS & Headless CMS: [candidate report](cms/cms-headless-cms-candidate-review.md), [JSON records](cms/cms-headless-cms-candidate-review.json), evidence notes in `research-sources/cms-candidates/`.

News & Media: [candidate report](news-media/news-media-candidate-review.md), [JSON records](news-media/news-media-candidate-review.json), evidence notes in `research-sources/news-media-candidates/`.

Hospital Management & EHR: [candidate report](hospital-management-ehr/hospital-management-ehr-candidate-review.md), [JSON records](hospital-management-ehr/hospital-management-ehr-candidate-review.json), evidence notes in `research-sources/hospital-ehr-candidates/`. The set separates integrated hospital suites, clinical-record platforms, ambulatory EHRs, an LIS, and FHIR/openEHR infrastructure; scores are not interchangeable.

Clinic Management: [candidate report](clinic-management/clinic-management-candidate-review.md), [JSON records](clinic-management/clinic-management-candidate-review.json), evidence notes in `research-sources/clinic-management-candidates/`. This set includes direct ambulatory systems, configurable EMR/HMIS foundations, integrated facility suites, a laboratory subsystem and a clinical-software developer platform. OpenELIS is not a general practice EHR, and Medplum is not a turnkey clinic product. No candidate is represented as clinically safe, legally compliant, certified, secure for a specific deployment, or approved for adoption.

Booking & Service Marketplaces: [candidate report](booking-service-marketplaces/booking-service-marketplaces-candidate-review.md), [JSON records](booking-service-marketplaces/booking-service-marketplaces-candidate-review.json), evidence notes in `research-sources/booking-service-candidates/`. The six candidates span appointment booking, resource reservation, service/rental marketplace software and field-service operations. Cocorico is a legacy two-sided marketplace; the others lack evidenced, end-to-end marketplace functions. The current shortlist therefore provides useful components and historical architecture references, not an approved marketplace base.

ERP: [candidate report](erp/erp-candidate-review.md), [JSON records](erp/erp-candidate-review.json), evidence notes in `research-sources/erp-candidates/`. The ten candidates span modular suites, open-core editions, distribution/manufacturing systems and older or limited projects. Module coverage, edition boundaries, license rights, and provisional scores are class-specific. Arabic/RTL, legal, security, accounting and production suitability require separate validation; no candidate is approved for adoption.

CRM: [candidate report](crm/crm-candidate-review.md), [JSON records](crm/crm-candidate-review.json), evidence notes in `research-sources/crm-candidates/`. The ten entries span general-purpose suites, nonprofit CRM, an open-core ERP CRM module, low-code and framework-based products, and a legacy reference-only codebase; scores are class-sensitive and not a universal ranking. HR & Payroll is next in the priority queue.

For each domain, aim for up to ten qualifying entries only after verification. Include fewer with a documented reason if fewer suitable projects are confirmed. The queue is not a ranking.

## Required verification before ranking

Confirm repository identity and project type; inspect the official license; review recent commits and releases; read project docs and deployment instructions; inspect test and security practices; verify technology claims and Arabic/RTL support rather than inferring them; cite the specific sources used and the date checked. A stars count without a date is not an evidence record. Healthcare software also requires release-specific interoperability assessment, independent security/privacy review, clinical governance, and jurisdiction-specific legal and safety validation before any deployment decision.
