# Knowledge refresh and maintenance

**Automation state: not configured.** The following is a proposed operating workflow, not an active scheduled job.

## Refresh cadence proposal

- Monthly: check release/commit activity for adopted or actively evaluated projects.
- Quarterly: re-check license file/metadata, project status, security advisories, dependency support, and alternatives for high-priority entries.
- On demand: re-review on upstream security notice, license change, customer engagement, new major release, or change in deployment model.

## Workflow

1. Fetch public metadata through approved APIs with rate-limit handling; never use stars as the quality ranking.
2. Compare observed changes to stored evidence and open a proposed catalog update rather than silently overwriting records.
3. Re-run schema/link checks; report unreachable sources as transient failures unless confirmed.
4. Route license/security changes to human review; block any automatic promotion to `adopt`.
5. Append a dated evaluation, evidence set, reviewer, and rationale; keep previous evaluations immutable.

A future GitHub Actions workflow may run link/schema checks on pull requests and a scheduled metadata refresh. It must use least-privilege permissions and repository variables/secrets only if needed. Do not present it as operational until a workflow is installed, enabled, and observed to pass.