# Launch Readiness Checklist

> Go / no-go at T-1 week before a launch. If any row is unchecked without
> a named exception (with owner + date to resolve), the launch is NO-GO.

---

## Product & engineering

- [ ] Core user flow tested end-to-end in production (not staging only)
- [ ] Edge cases exercised: nil input, empty state, high-volume input,
      permission failure, network failure
- [ ] Mobile (iOS + Android) parity confirmed, or scope explicitly web-only
- [ ] Feature flag in place, toggleable without a deploy
- [ ] Rollback procedure documented and rehearsed (how long it takes,
      who can do it)
- [ ] Known open issues (P3/P4) logged with "will not block launch" owner

## Data & analytics

- [ ] All new events firing in production, validated by visual test
- [ ] Event schema matches the documented spec (no silent drift)
- [ ] Dashboards exist for: primary success metric, 2+ guardrails,
      adoption funnel
- [ ] Baseline values captured pre-launch
- [ ] Alerting set up for guardrail threshold breaches

## Monitoring & alerting

- [ ] Error rate monitored (application + API); paged if > {threshold}
- [ ] Latency monitored (p95); paged if > {threshold}
- [ ] Key business metric monitored; alert (not page) if moves > {threshold}
- [ ] On-call schedule in place for launch week (PM + eng lead named)

## Customer support

- [ ] Support team briefed (sync or written)
- [ ] FAQ document written and linked in the support tool
- [ ] Escalation path defined: support → eng on-call → PM
- [ ] Canned responses prepared for expected top 5 issues

## Communication

- [ ] Customer-facing announcement drafted (via `pm-communicator`)
- [ ] Internal team announcement drafted
- [ ] Exec update planned for launch day / day +1 / day +7
- [ ] Social / marketing channels coordinated (if applicable)

## Operational

- [ ] Staged rollout plan: % → % → % → % with hold gates
- [ ] Kill criteria stated: at % X of rollout, if metric Y < Z, pause
- [ ] Post-launch retro scheduled within 72 hours of full rollout
- [ ] Stakeholder sign-offs collected (eng, design, leadership)

## Decision-maker sign-off

The launch readiness review produces a go / no-go call. The decision-maker
(named) signs off on go.

- Decision-maker: {@name}
- Review time: {datetime}
- Decision: {Go / No-Go / Go-with-conditions}
- Conditions (if any): {list}

## After the meeting

- Publish the decision and conditions to the team channel (written, not
  just verbal)
- If No-Go, name the re-review date and what must change
- If Go, the operator hands off to execution mode

---

## Anti-patterns

- Passing items with "should be fine" — must be verified, not assumed
- Skipping rollback because "we're small / fast" — rollback is always
  required
- Un-named exceptions — every unchecked row either ships a fix or names
  a responsible person with a date
- Vague kill criteria — must be specific, observable, pre-committed
