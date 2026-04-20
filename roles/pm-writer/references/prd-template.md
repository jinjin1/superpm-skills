# PRD — {feature / product name}

> Status: {Draft | In Review | Approved | Shipped}
> Owner: {@owner}
> Last updated: {YYYY-MM-DD}
> Decision by: {decision-maker name / role}, {deadline}

---

## TL;DR

- {one line: what are we building}
- {one line: whose Job does it solve}
- {one line: the decision requested — approval and deadline}

## Job to be Done

**Who:** {target user persona — one or two}
**When / in what situation:** {triggering context}
**What they are trying to do:** {Job verb + object}
**Current workaround:** {how they solve this today — if none, say "none (= give up / churn)"}
**Why now:** {timing rationale — market, competition, internal readiness}

### Evidence (from 5 user conversations)

> A PRD without evidence gets bounced. Invoke `pm-researcher` first for JTBD
> synthesis if missing.

- {quote 1: which user, what they said, date}
- {quote 2}
- {quote 3}
- ...at least 3, ideally 5

## Success Metrics

**North Star:** {one Job-completion metric — no proxies}
- Example: "Share of new PMs who copy their first prompt within 15 minutes of landing"
- Anti-example: "DAU" · "pageviews" · "session duration"

**Guardrails:** {two or three things we must not break}
- {existing metric X does not drop by more than Y%}
- {metric Z holds or improves}

**Measurement:** {dashboard location · event name · cohort definition}
**Baseline:** {current value}
**Target:** {Day 30 / Day 90}

## Scope

### In scope (v1)
- [ ] {component 1}
- [ ] {component 2}
- [ ] {component 3}

### NOT in scope (explicit exclusions)

> One-line reason per item. Missing this section = scope fight guaranteed.

- {excluded item A} — {reason}
- {excluded item B} — {reason}
- {excluded item C} — {reason}

## User flow

```
[entry] → [step 1] → [step 2] → [success state]
              ↓
         [error / edge case]
```

One primary flow + two or three key edge cases. ASCII diagrams beat long
prose.

## Functional requirements

1. {requirement 1, written as a behavior}
2. {requirement 2}
3. ...

## Non-functional requirements

- **Performance:** {e.g., p95 response time}
- **Accessibility:** {WCAG level, mobile behavior}
- **Supported environments:** {browsers, devices}
- **Security / privacy:** {data handling, logging}

## Dependencies

- {dependent team / system 1}
- {dependent team / system 2}

## Timeline

| Milestone | Deadline | Owner |
|---|---|---|
| Design review | YYYY-MM-DD | @designer |
| Eng kickoff | YYYY-MM-DD | @engineer |
| Alpha (internal) | YYYY-MM-DD | @engineer |
| Beta (5% users) | YYYY-MM-DD | @engineer |
| GA | YYYY-MM-DD | @engineer |

## Open questions

- {open issue 1 — owner and deadline for the decision}
- {open issue 2}

## Decision log

| Date | Decision | Who | Why |
|---|---|---|---|
| YYYY-MM-DD | {decision} | {person} | {rationale} |

## References

- Original user research: {link}
- Competitor analysis: {link}
- Related PRDs: {link}
- Figma / prototype: {link}

---

## Self-review checklist (before submission)

- [ ] Can the TL;DR alone support a decision?
- [ ] Is the JTBD stated as one clear sentence?
- [ ] Are there at least 3 user quotes in Evidence?
- [ ] Is the success metric free of proxies?
- [ ] Is there a NOT-in-scope section?
- [ ] Does every action item have an owner and a deadline?
- [ ] Are guardrail metrics defined?
- [ ] Are decision-maker and deadline named?
