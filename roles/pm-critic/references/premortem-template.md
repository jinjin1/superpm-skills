# Pre-mortem Template

> "Imagine it is 6 months from now and this plan failed. Write the
> postmortem."

The pre-mortem inverts our bias toward optimism. It surfaces load-bearing
assumptions by asking the mind to reason backwards from failure.

---

## Setup

- **Plan reviewed**: {title + link}
- **Date**: {YYYY-MM-DD}
- **Facilitator**: {@pm-critic}
- **Participants**: {PM, eng lead, design lead, decision-maker}

## The prompt

Read aloud or post async:

> "It is now {today + 6 months}. The plan failed. Specifically, {the
> primary success metric} did not move. Users did not adopt. Execs are
> asking why we invested."

Each participant independently writes down (10 min):
- The single biggest reason the plan failed
- Two early warning signs we could have caught

Do NOT brainstorm together initially. Individual silent writing prevents
groupthink.

## Collect and cluster

- Gather all reasons
- Cluster similar failures
- Count how many participants raised each
- **Priority = (number of votes) × (magnitude if true)**

## Top-5 failure modes

| # | Failure mode | Votes | Magnitude | Priority | Early warning |
|---|---|---|---|---|---|
| 1 | {cause} | N | H/M/L | HML | {observable before it hurts} |
| 2 | ... | | | | |

## Root-cause analysis (5 Whys) on the top-1

For the highest-priority failure mode, run 5 Whys:

1. **Why?** {first-level cause}
2. **Why?** {second}
3. **Why?** {third}
4. **Why?** {fourth}
5. **Why?** {root — usually a process, incentive, or assumption, not a
   person}

## Mitigations

For the top-3 failure modes:

| Failure mode | Early warning signal | Owner | Mitigation | When |
|---|---|---|---|---|
| {#1} | {specific signal} | {@person} | {action} | {deadline or trigger} |

## Load-bearing assumptions (exposed)

Pre-mortem output should surface 2-3 **load-bearing assumptions** — things
that, if wrong, sink the whole plan. List them explicitly.

- Assumption 1: {what we are assuming}
  - **If wrong**: {consequence}
  - **How to test**: {cheapest way to verify}

- Assumption 2: ...

## Kill criteria (agreed in advance)

Rather than wait for the postmortem, agree now on what would cause us to
stop this plan mid-flight:

- If {signal X} is observed by {date Y}, we stop and reassess
- If {metric Z} fails to reach {threshold} by {date}, we stop

Kill criteria pre-committed are harder to rationalize away later.

## Output

A pre-mortem produces (1) ranked failure modes, (2) early-warning signals,
(3) load-bearing assumptions, (4) kill criteria. All four go into the
plan doc as a new section.

## Anti-patterns

- "We can't think of how this would fail" → you did not try hard enough,
  re-run with an adversarial framing
- Blaming people, not systems → 5 Whys did not go deep enough
- Vague early-warning signals ("things seem off") → must be observable
- No kill criteria → plan will self-protect; add them
