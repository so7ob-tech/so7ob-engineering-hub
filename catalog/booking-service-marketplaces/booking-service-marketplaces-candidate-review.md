On **2026-10-14**, this screening covers **six** verified Booking & Service Marketplaces candidates—exactly the six successful results supplied, with no padding. The central finding is that the mature, fully open-source, end-to-end service-marketplace base So7ob would ideally want is not present in this set. **Cocorico** is the only candidate evidenced as a genuine two-sided service/rental marketplace, but it is a legacy reference with 2021 code activity and old PHP/Symfony dependencies. The other five are appointment, resource-booking, or field-service products whose marketplace layer is absent or unverified. Every candidate is therefore `reference_only`; the scores are screening signals, not adoption approval.
No research-agent failures were reported in the supplied structured results.

## Findings by actual use case

### Single-provider appointment booking

**Cal.diy** and **Easy!Appointments** are the closest fits when the actual requirement is a scheduling component for one provider or one organization—not a marketplace. Cal.diy provides event types, recurring/seated events, availability, public booking, booking management, calendar/conferencing connectors, paid events, embeds, webhooks and API v2 seams, but its own documentation recommends personal, non-production use and the community edition lacks marketplace discovery, provider onboarding, commissions, split settlement and escrow. [1] [2] [7] [8] [9] [10] [11] [12] [13] Its unresolved authorization issue reports are a material blocker. [Cal.diy (Cal.com community edition) evidence note](../../research-sources/booking-service-candidates/01-cal-diy.md).

Easy!Appointments models customers, services, providers, secretaries, schedules and appointments, with a documented REST/OpenAPI boundary and integrations such as Google Calendar, CalDAV, LDAP/AD, SMTP, webhooks, Matomo, Jitsi, Google Meet, ICS and ALTCHA. It remains a single-installation business/team scheduler, not a vendor network with onboarding, cross-vendor discovery, commissions, payouts, disputes or marketplace checkout. The stable 1.6.0 and 1.6.1-beta.1 tags are encouraging, but the main branch version mismatch (composer declares 1.5.2) requires immutable-release packaging. [18] [19] [21] [27] [28] [30] [31] [32] [36] [37] [Easy!Appointments evidence note](../../research-sources/booking-service-candidates/02-easyappointments.md).

### Resource reservation

**LibreBooking** is the strongest resource-booking reference: rooms, equipment, desks, labs, calendars, slots, quotas/credits, approvals, waitlists, utilization reporting, RBAC, ICS and a JSON API are evidenced. It does not evidence provider storefronts, public service discovery, reviews, commissions, payouts or multi-party settlement. It should be treated as an internal/resource reservation component, not the So7ob marketplace base. [38] [39] [44] [48] [LibreBooking evidence note](../../research-sources/booking-service-candidates/03-librebooking.md).

The security gate is unusually clear: official warnings say versions before 7.1.0 permit unauthenticated account takeover through forged Remember Me cookies, and earlier versions carried another critical administrator-takeover vulnerability; fixes are not backported. Only v7.1.0 or later merits evaluation, and even then the small volunteer team and latest-release-only support remain capacity risks. [39] [40] [41] [53]

### Service/rental marketplace

**Cocorico** is the only candidate with verified marketplace primitives: listings, asker/offerer roles, availability and time-unit rules, booking requests and acceptance, fees, refunds, messaging, notifications, administration, and payment-era flows. That makes it the closest domain match for two-sided services or rentals. [55] [62] [63] [64] [65] [72]

The qualification is decisive: GitHub metadata records a 2021-10-19 last push, the latest release is v0.15.1 from 2020-07-09, the stack is legacy PHP 7.1/Symfony 3.4, CI is old syntax-only Travis, no security policy was found, and no maintained public REST/OpenAPI contract was verified. The current repository description says Cocorico evolved into Second, while the README still presents Cocorico as an open-source platform; the commercial Second service and trademarks must not be assumed to be this codebase. [56] [57] [58] [59] [60] [61] [67] [69] [70] [73] [Cocorico evidence note](../../research-sources/booking-service-candidates/04-cocorico.md).

### Field-service dispatch

**OpenFieldService** and **Beveren Field Service Management** are useful for provider-side operations, not consumer marketplace booking. OpenFieldService has compact Preact/TypeScript/Vite plus Hono/OpenAPI and SQLite/D1 seams, with jobs, technicians, customers, service types, equipment/sites, invoices, checklists and offline packets. However, public discovery, provider onboarding, availability search, checkout, commissions, reviews, customer portal, tenancy and external connectors are not verified. Its current MIT status follows a documented AGPL-vs-MIT README conflict corrected by merged PR #18; no auth/authorization contract, security policy or production-operations runbook was verified. [74] [75] [76] [77] [78] [79] [80] [83] [84] [85] [87] [88] [OpenFieldService evidence note](../../research-sources/booking-service-candidates/05-open-fieldservice.md).

Beveren is an ERPNext/Frappe extension whose workflow runs from service request and optional quotation through service order, appointment, technician dispatch, execution and invoice. It is active but early, develop-branch-based and unreleased, with no verified public catalog, consumer booking, marketplace payments, payouts, reviews or settlement. Its license metadata conflicts: repository/GitHub identify AGPL-3.0, while hooks.py says app_license=mit and root package.json says ISC. Treat AGPL as governing pending legal review. [91] [92] [93] [94] [95] [96] [97] [98] [99] [100] [101] [102] [103] [104] [105] [106] [Beveren Field Service Management evidence note](../../research-sources/booking-service-candidates/06-beveren-fsm.md).

## Scores and interpretation

The shared screening rubric is out of 100, but **these classes are not one universal ranking**: feature-domain fit rewards different things in an appointment scheduler, a resource reservation system, a marketplace, and a dispatch app. A high score can mean “good reference for its own class,” not “good So7ob marketplace base.” All six recommendations are `reference_only`.
- **Cal.diy (Cal.com community edition)** — midpoint **65**, range **48–72**; confidence **medium**; recommendation **`reference_only`**.
- **Easy!Appointments** — midpoint **71**, range **63–78**; confidence **medium**; recommendation **`reference_only`**.
- **LibreBooking** — midpoint **70**, range **62–76**; confidence **medium**; recommendation **`reference_only`**.
- **Cocorico** — midpoint **51**, range **43–59**; confidence **medium-low**; recommendation **`reference_only`**.
- **OpenFieldService** — midpoint **60.5**, range **48.5–68.5**; confidence **medium**; recommendation **`reference_only`**.
- **Beveren Field Service Management** — midpoint **49**, range **34–61**; confidence **medium**; recommendation **`reference_only`**.

The score ranges reflect evidence uncertainty and should not be read as probabilities, vendor SLAs, or security certifications. Sources are point-in-time snapshots from the checked date. A score does not grant adoption approval.

## Cross-cutting adoption unknowns and gates

- **Arabic and RTL:** coverage is uneven. Cal.diy and Easy!Appointments have Arabic locale evidence but no end-to-end acceptance matrix; Beveren sets RTL direction for Arabic but lacks production-level coverage evidence; LibreBooking and Cocorico have unknown RTL behavior; OpenFieldService has no implementation-level localization. So7ob should gate every option on Arabic booking, availability, checkout/payment, email, admin, mobile, date/number/currency, accessibility and bidi regression tests.
- **License and distribution:** Cal.diy is MIT; Cocorico and current OpenFieldService are MIT, with OpenFieldService retaining a documented historical README conflict; Easy!Appointments is GPLv3 with CC BY 3.0 content noted; LibreBooking is GPL-3.0-only; Beveren’s repository AGPL-3.0 conflicts with app/package metadata. Legal review must cover modifications, containers, plugins, SaaS/hosted use, notices, source obligations, third-party bundles and the Cocorico/Second boundary.
- **Security and operations:** unresolved Cal.diy authorization reports, LibreBooking pre-7.1.0 takeover warnings, Cocorico’s legacy dependencies/no security policy, OpenFieldService’s offline customer-data cache and absent security controls, Beveren’s unverified identity/security posture, and Easy!Appointments’ reproducibility and authorization gates all require remediation or explicit risk acceptance. None of the supplied results establishes a production security certification or current independent vulnerability audit.
- **Payments and regulated operation:** payment-related code or connectors do not by themselves prove marketplace checkout, split payouts, refunds, reconciliation, KYC/AML, tax handling, PCI scope, consumer-protection workflows, disputes, data residency, healthcare/travel compliance, or other regulated-domain controls. These are not verified for the set and must be designed and tested by So7ob where applicable.
- **Architecture and ownership:** the likely path is to borrow bounded scheduling/resource/dispatch patterns while owning the marketplace layer—provider onboarding, catalog/discovery, availability aggregation, identity/tenant boundaries, checkout, commissions/payouts, reviews, moderation, disputes, notifications, auditability and mobile/Arabic UX—in So7ob-controlled services. No candidate’s evidence justifies treating its commercial hosted successor, premium services, or unrelated enterprise edition as open-source capability.

## Complete source references

[1]: https://github.com/calcom/cal.diy "GitHub repository/source page"
[2]: https://www.cal.diy/ "Official documentation/site"
[3]: https://raw.githubusercontent.com/calcom/cal.diy/main/LICENSE "Canonical repository file"
[4]: https://raw.githubusercontent.com/calcom/cal.diy/main/SECURITY.md "Canonical repository file"
[5]: https://raw.githubusercontent.com/calcom/cal.diy/main/package.json "Canonical repository file"
[6]: https://raw.githubusercontent.com/calcom/cal.diy/main/docker-compose.yml "Canonical repository file"
[7]: https://www.cal.diy/installation "Official documentation/site"
[8]: https://github.com/calcom/cal.diy/releases "GitHub repository/source page"
[9]: https://github.com/calcom/cal.diy/issues/29955 "GitHub repository/source page"
[10]: https://github.com/calcom/cal.diy/issues/29956 "GitHub repository/source page"
[11]: https://github.com/calcom/cal.diy/issues/29957 "GitHub repository/source page"
[12]: https://raw.githubusercontent.com/calcom/cal.diy/main/apps/api/v2/README.md "Canonical repository file"
[13]: https://raw.githubusercontent.com/calcom/cal.diy/main/apps/api/v2/README-PLATFORM.md "Canonical repository file"
[14]: https://raw.githubusercontent.com/calcom/cal.diy/main/i18n.json "Canonical repository file"
[15]: https://raw.githubusercontent.com/calcom/cal.diy/main/packages/i18n/next-i18next.config.js "Canonical repository file"
[16]: https://raw.githubusercontent.com/calcom/cal.diy/main/.github/workflows/security-audit.yml "Canonical repository file"
[17]: https://raw.githubusercontent.com/calcom/cal.diy/main/.github/workflows/i18n.yml "Canonical repository file"
[18]: https://github.com/alextselegidis/easyappointments "GitHub repository/source page"
[19]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/README.md "Canonical repository file"
[20]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/LICENSE "Canonical repository file"
[21]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/composer.json "Canonical repository file"
[22]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/package.json "Canonical repository file"
[23]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/CHANGELOG.md "Canonical repository file"
[24]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/.github/SECURITY.md "Canonical repository file"
[25]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/docs/installation-guide.md "Canonical repository file"
[26]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/docs/docker.md "Canonical repository file"
[27]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/docs/rest-api.md "Canonical repository file"
[28]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/openapi.yml "Canonical repository file"
[29]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/docs/manage-translations.md "Canonical repository file"
[30]: https://easyappointments.org/ "Official documentation/site"
[31]: https://easyappointments.org/features/ "Official documentation/site"
[32]: https://github.com/alextselegidis/easyappointments/releases "GitHub repository/source page"
[33]: https://easyappointments.org/blog/easyappointments-v1-6-0-release/ "Official documentation/site"
[34]: https://github.com/alextselegidis/easyappointments-docker "GitHub repository/source page"
[35]: https://github.com/alextselegidis/easyappointments/blob/main/.github/workflows/ci.yml "GitHub repository/source page"
[36]: https://raw.githubusercontent.com/alextselegidis/easyappointments/main/application/language/arabic/translations_lang.php "Canonical repository file"
[37]: https://github.com/alextselegidis/easyappointments/commits/main/ "GitHub repository/source page"
[38]: https://github.com/LibreBooking/LibreBooking "GitHub repository/source page"
[39]: https://librebooking.readthedocs.io/en/latest/ "Official documentation/site"
[40]: https://github.com/LibreBooking/LibreBooking/releases "GitHub repository/source page"
[41]: https://github.com/LibreBooking/LibreBooking/blob/develop/SECURITY.md "GitHub repository/source page"
[42]: https://github.com/LibreBooking/LibreBooking/blob/develop/LICENSE.md "GitHub repository/source page"
[43]: https://github.com/LibreBooking/LibreBooking/blob/develop/composer.json "GitHub repository/source page"
[44]: https://github.com/LibreBooking/LibreBooking/blob/develop/docs/source/API.rst "GitHub repository/source page"
[45]: https://github.com/LibreBooking/LibreBooking/blob/develop/docs/source/INSTALLATION.rst "GitHub repository/source page"
[46]: https://github.com/LibreBooking/LibreBooking/blob/develop/docs/source/Oauth2-Configuration.rst "GitHub repository/source page"
[47]: https://github.com/LibreBooking/LibreBooking/blob/develop/docs/source/SAML-Configuration.rst "GitHub repository/source page"
[48]: https://github.com/LibreBooking/LibreBooking/blob/develop/lang/ar.php "GitHub repository/source page"
[49]: https://github.com/LibreBooking/LibreBooking/blob/develop/lang/he.php "GitHub repository/source page"
[50]: https://github.com/LibreBooking/LibreBooking/blob/develop/phpunit.xml.dist "GitHub repository/source page"
[51]: https://github.com/LibreBooking/docker "GitHub repository/source page"
[52]: https://github.com/LibreBooking/docker/blob/main/RUN.md "GitHub repository/source page"
[53]: https://github.com/LibreBooking/LibreBooking/blob/develop/CHANGELOG.md "GitHub repository/source page"
[54]: https://github.com/Cocolabs-SAS/cocorico "GitHub repository/source page"
[55]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/README.md "Canonical repository file"
[56]: https://api.github.com/repos/Cocolabs-SAS/cocorico "GitHub API evidence"
[57]: https://api.github.com/repos/Cocolabs-SAS/cocorico/commits?per_page=5 "GitHub API evidence"
[58]: https://api.github.com/repos/Cocolabs-SAS/cocorico/releases?per_page=10 "GitHub API evidence"
[59]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/composer.json "Canonical repository file"
[60]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/LICENSE "Canonical repository file"
[61]: https://github.com/Cocolabs-SAS/cocorico/security/policy "GitHub repository/source page"
[62]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/index.md "Canonical repository file"
[63]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/times.md "Canonical repository file"
[64]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/prices.md "Canonical repository file"
[65]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/crons.md "Canonical repository file"
[66]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/translations.md "Canonical repository file"
[67]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/doc/installation-server-linux.md "Canonical repository file"
[68]: https://github.com/Cocolabs-SAS/cocorico-docker "GitHub repository/source page"
[69]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/.travis.yml "Canonical repository file"
[70]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/ROADMAP.md "Canonical repository file"
[71]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/CHANGELOG.md "Canonical repository file"
[72]: https://raw.githubusercontent.com/Cocolabs-SAS/cocorico/master/features/BookingContext.php "Canonical repository file"
[73]: https://www.scnd.com/ "Official documentation/site"
[74]: https://github.com/clawnify/OpenFieldService "GitHub repository/source page"
[75]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/README.md "Canonical repository file"
[76]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/LICENSE "Canonical repository file"
[77]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/package.json "Canonical repository file"
[78]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/pnpm-lock.yaml "Canonical repository file"
[79]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/src/server/index.ts "Canonical repository file"
[80]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/agent.md "Canonical repository file"
[81]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/clawnify.json "Canonical repository file"
[82]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/wrangler.toml "Canonical repository file"
[83]: https://api.github.com/repos/clawnify/OpenFieldService "GitHub API evidence"
[84]: https://api.github.com/repos/clawnify/OpenFieldService/commits?per_page=10 "GitHub API evidence"
[85]: https://api.github.com/repos/clawnify/OpenFieldService/releases "GitHub API evidence"
[86]: https://api.github.com/repos/clawnify/OpenFieldService/git/trees/main?recursive=1 "GitHub API evidence"
[87]: https://api.github.com/repos/clawnify/OpenFieldService/pulls/18 "GitHub API evidence"
[88]: https://api.github.com/repos/clawnify/OpenFieldService/issues/17 "GitHub API evidence"
[89]: https://raw.githubusercontent.com/clawnify/OpenFieldService/main/.github/workflows/sync-branches.yml "Canonical repository file"
[90]: https://api.github.com/repos/clawnify/OpenFieldService/branches "GitHub API evidence"
[91]: https://github.com/Beveren-Software-Inc/Field_Service_Management "GitHub repository/source page"
[92]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/README.md "Canonical repository file"
[93]: https://github.com/Beveren-Software-Inc/Field_Service_Management/blob/develop/license.txt "GitHub repository/source page"
[94]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/beveren_fsm/hooks.py "Canonical repository file"
[95]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/pyproject.toml "Canonical repository file"
[96]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/package.json "Canonical repository file"
[97]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/schedule/package.json "Canonical repository file"
[98]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/.github/workflows/ci.yaml "Canonical repository file"
[99]: https://github.com/Beveren-Software-Inc/Field_Service_Management/security "GitHub repository/source page"
[100]: https://github.com/Beveren-Software-Inc/Field_Service_Management/releases "GitHub repository/source page"
[101]: https://github.com/Beveren-Software-Inc/Field_Service_Management/tree/develop/docs "GitHub repository/source page"
[102]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/beveren_fsm/field_service_management/api/user.py "Canonical repository file"
[103]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/beveren_fsm/field_service_management/api/schedule.py "Canonical repository file"
[104]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/beveren_fsm/field_service_management/api/service_appointment.py "Canonical repository file"
[105]: https://raw.githubusercontent.com/Beveren-Software-Inc/Field_Service_Management/develop/schedule/src/components/schedule/settings-view.tsx "Canonical repository file"
[106]: https://github.com/Beveren-Software-Inc/Field_Service_Management/tree/develop/beveren_fsm/field_service_management/doctype "GitHub repository/source page"
[107]: https://beverensoftware.com/ "Official documentation/site"
[108]: https://beverensoftware.com/solutions/services/ "Official documentation/site"
[109]: https://api.github.com/repos/Beveren-Software-Inc/Field_Service_Management "GitHub API evidence"
[110]: https://api.github.com/repos/Beveren-Software-Inc/Field_Service_Management/commits?sha=develop&per_page=20 "GitHub API evidence"
