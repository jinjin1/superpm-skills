# Postmortem — {incident title}

> Status: {Draft | Reviewed | Published}
> Severity: {P0 | P1 | P2 | P3}
> Duration: {MM:SS – MM:SS, total X minutes}
> Owner: {@owner}
> Incident commander: {@IC}

## TL;DR

- {what happened — one line}
- {who was affected — with numbers}
- {root cause in one sentence + the key prevention action}

**Blameless principle:** this document does not blame individuals or teams.
Its purpose is to correct systems and processes.

## Impact

- **Scope:** {how many / what % of users / which flows}
- **Duration:** {start to recovery}
- **Revenue impact:** {estimate, or "under investigation"}
- **Reputational impact:** {social mentions, support tickets}
- **Regulatory / legal:** {present / absent, with detail}

## Timeline (in one timezone, state it)

| Time | Event | Action taken | Owner |
|---|---|---|---|
| HH:MM | {first symptom detected} | {triaged / escalated} | {@person} |
| HH:MM | {first mitigation tried} | {result} | {@person} |
| HH:MM | {root cause identified} | {action} | {@person} |
| HH:MM | {recovery complete} | {verification} | {@person} |
| HH:MM | {communication completed} | {channel} | {@person} |

## Root cause (5 Whys)

**Symptom:** {what was observed}

1. **Why?** {first-level cause}
2. **Why?** {second-level cause}
3. **Why?** {third-level cause}
4. **Why?** {fourth-level cause}
5. **Why?** {root cause}

**Root cause (summary):** {one or two sentences}

## What went right

- {mitigation that worked 1}
- {mitigation that worked 2}
- {monitoring / alert that fired correctly}

Blameless principle: call out the good, clearly.

## What went wrong

- {missed indicator / alarm}
- {slow escalation}
- {runbook that was unclear}

## Action items

> Every item has an owner and a deadline. Unassigned = "unassigned", to be
> assigned in the follow-up meeting.

| Priority | Action | Owner | Deadline | Status |
|---|---|---|---|---|
| P0 | {critical prevention} | {@owner} | {YYYY-MM-DD} | Open |
| P1 | {monitoring improvement} | {@owner} | {YYYY-MM-DD} | Open |
| P2 | {runbook update} | {@owner} | {YYYY-MM-DD} | Open |

## Lessons learned

- {organizational / process lesson 1}
- {organizational / process lesson 2}
- {technical / architectural lesson}

## Customer communication

- **Initial notice:** {time, channel, content link}
- **Update:** {time, channel, content link}
- **Recovery notice:** {time, channel, content link}
- **Follow-up notice (if any):** {plan}

## References

- Monitoring dashboards: {link}
- Related PRs / commits: {link}
- Prior similar incidents: {link}

---

**Writing tips:**
- Build the timeline by copying timestamps from Slack, logs, and tickets. Do
  not rely on memory.
- The 5 Whys is not a ritual. If the answer lands on "individual mistake",
  push one more Why. It must end at a system cause.
- Action items must be concrete and measurable. No "we'll be careful" or
  "we'll pay attention."
