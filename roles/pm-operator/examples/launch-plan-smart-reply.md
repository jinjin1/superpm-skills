# Launch Plan — Smart Reply Feature

> Feature: Smart Reply (AI-assisted reply drafting for inbox)
> PRD: docs/prds/smart-reply.md (v3, approved after pm-critic review)
> Owner: @jinjin1
> Launch target: 2026-05-20 (GA)
> Severity: P1 (user-facing, billing-adjacent)

---

## Timeline

| T-minus | Date | Milestone | Owner | Kill criterion if not met |
|---|---|---|---|---|
| T-4w | 2026-04-22 | Eng complete, feature flag off in prod | @eng-lead | Slip 1 week; if 2nd slip, escalate |
| T-3w | 2026-04-29 | Internal dogfood (30 team members) | @jinjin1 | If < 80% engagement, investigate |
| T-2w | 2026-05-06 | Beta (5% allowlist of paying users) | @jinjin1 | Guardrails hold for 5 days, or re-scope |
| T-1w | 2026-05-13 | Launch readiness review (go/no-go) | @ceo | Missing checklist items without exceptions → NO-GO |
| T-day | 2026-05-20 | Staged rollout: 5% → 25% → 50% → 100% over 5 days | @jinjin1 | Kill if signup conversion drops > 2pp during any stage |
| T+1d | 2026-05-21 | First metric read + bug triage | @pm-analyst + @jinjin1 | — |
| T+7d | 2026-05-27 | Full rollout metrics; scheduled retro | @jinjin1 | — |
| T+14d | 2026-06-03 | Launch postmortem published | @pm-writer | — |

## RACI

| Workstream | R (doing) | A (accountable) | C (consulted) | I (informed) |
|---|---|---|---|---|
| Eng build + deploy | @eng-lead | @jinjin1 | @design | @ceo |
| Analytics + dashboards | @pm-analyst | @jinjin1 | @eng-lead | @ceo |
| Customer communication | @pm-communicator | @jinjin1 | @support | @ceo, @sales |
| Support readiness | @support-lead | @jinjin1 | @eng-lead | — |
| Legal / privacy review | @legal | @jinjin1 | — | @ceo |
| Launch day command | @jinjin1 | @jinjin1 | @eng-lead, @design | @ceo |

## Success metrics (pre-committed)

**Primary**: Share of inbox replies sent with Smart Reply assistance,
among users who've tried it once — target 35% by Day 30.

**Guardrails** (must not break):
- Reply satisfaction score (in-product thumbs) — must stay ≥ current baseline
- Weekly active reply rate — must not drop > 5%
- Support tickets mentioning "robotic / generic" replies — must not exceed
  5/week

**Health metrics**:
- p95 Smart Reply generation latency — target < 800ms
- API error rate — target < 0.5%

## Staged rollout

| Stage | Traffic | Hold gate | If kill criterion hit |
|---|---|---|---|
| 5% | 5% of eligible paying users, 24 h | Guardrails hold | Pause, diagnose before moving to 25% |
| 25% | 25% for 48 h | Guardrails hold, no P0 bugs | Pause if either fails |
| 50% | 50% for 48 h | Guardrails hold, no P0 bugs | Pause if either fails |
| 100% | Full rollout | — | Revert to 50% if catastrophic |

## Rollback procedure

1. Feature flag toggle off (no deploy needed) — takes 2 minutes, any PM
   can do it
2. DNS / CDN revert NOT needed — feature is additive
3. User communication template ready (see `pm-communicator` draft) in
   case of user-visible rollback
4. If rollback triggered, post-incident retro within 24 h

## Blocker tracking

| Blocker | Blocked by | Ask | Escalate by |
|---|---|---|---|
| Legal review of training-on-user-messages question | @legal | Legal sign-off | 2026-04-24, escalate to CEO |
| Beta allowlist criteria (who's in the 5%) | @sales | List of 500 paying users, prioritized by engagement | 2026-04-26 |

## Post-launch retro schedule

- **Day T+2**: Quick sync (30 min) — any P0 bugs? Guardrails holding?
- **Day T+14**: Full retro using the `pm-retro` template — what shipped,
  what broke, what we learned
- **Day T+21**: Postmortem document (via `pm-writer`) published

## Communication plan

| When | Who | What | Format |
|---|---|---|---|
| T-3w | Internal team | "Smart Reply moving to dogfood" | Slack #product |
| T-2w | Beta users (500) | "You're in the beta, here's what to try" | Email from `pm-communicator` |
| T-1w | Exec team | Launch readiness one-pager | Via `pm-writer` + `pm-communicator` |
| T-day | All paying users | Feature announcement | In-product + email |
| T-day | Support team | Launch day briefing + FAQ | Sync stand-up |
| T+7d | Exec team | Launch metrics update | Weekly exec update |

---

**Reviewer notes**: Every row has an owner. Kill criteria pre-committed
at each stage. Rollback is flag-off (fast). Post-launch retro scheduled,
not hopeful. Timeline is specific with dates, not "soon".
