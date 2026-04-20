---
name: growth-pause
description: |
  Growth stall diagnostic. Orchestrates pm-analyst → pm-researcher →
  pm-strategist to diagnose why growth has paused and propose the next
  bet.
  Invoke when the user says "growth has stalled", "metric X isn't
  moving", "diagnose our retention drop", "we missed growth targets", or
  "growth audit".
  Language: respond in the user's language.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - AskUserQuestion
---

# growth-pause — Growth stall diagnostic

Three-stage orchestration specifically for diagnosing WHY a growth
metric has paused and what to do next. Data-led, with qualitative
grounding.

## When to invoke

- A key growth metric (acquisition, activation, retention, revenue) has
  stalled for 4+ weeks
- You need to distinguish "product issue" from "market issue" from
  "execution issue"
- You want a ranked list of next experiments, not a vague "do more"

## When NOT to invoke

- You have a specific experiment to run — use `pm-analyst` directly
- You haven't yet launched the product — use `discovery-sprint`
- The problem is a crisis (acute, user-visible) — use `crisis-mode`

## Language mirroring

Mirror the user's input language.

## Role sequence

```
1. pm-analyst     → quantify the stall + locate it in the funnel / cohort
      ↓ checkpoint: we know WHERE the stall is
2. pm-researcher  → 3-5 user calls to understand WHY at that surface
      ↓ checkpoint: we know the qualitative cause
3. pm-strategist  → ranked experiment list with hypothesized lift
      ↓ final output: top 3 bets with confidence + expected impact
```

## Stage 1 — pm-analyst (2-3 days)

Goal: locate the stall precisely. Growth rarely stalls uniformly — it
stalls at a specific step, for a specific segment.

Deliverables:
- Funnel decomposition: where in the funnel did the change happen?
- Cohort decomposition: which cohort shows the stall most? (often
  power users vs median vs bottom quartile move differently)
- Segment breakdown: new vs returning, paid vs organic, by geography,
  etc.
- Top 3 candidate stall points ranked by size × recency

Uses: `pm-analyst/examples/funnel-drop-diagnosis.md` as a worked pattern.

**Checkpoint: "Which specific step + segment is the stall?"** The
analyst's job ends when this is named. Going further without user input
risks wrong-problem work.

## Stage 2 — pm-researcher (2 days)

Goal: 3-5 interviews with users AT THE EXACT STALL POINT.

Critical: interview the right users, not just "some users".
- If the stall is at activation step 3, interview users who hit step 2
  and bounced
- If the stall is among power users' retention, interview power users
  who just stopped returning
- Include a few who successfully completed the step (control)

Deliverables:
- Interview guide tailored to the stall point
- 3-5 interviews with verbatim quotes
- Ranked friction causes at that step

Uses: `pm-researcher/references/interview-guide-template.md`.

**Checkpoint: "Do we understand why users bounce at that step?"** If not,
extend research rather than rush to strategy.

## Stage 3 — pm-strategist (1 day)

Goal: from evidence to experiment list.

Deliverables:
```
TOP 3 EXPERIMENTS (ranked):

1. {Experiment name}
   - Hypothesis: {specific, falsifiable}
   - Expected lift: {pp / %}
   - Confidence: {low/med/high}
   - Cost: {eng weeks}
   - Risk: {what could go wrong}

2. ...

3. ...

NOT DOING (and why):
- {tempting idea that was rejected} — {reason from evidence}
```

The NOT-DOING list is critical. It prevents the team from back-doing
rejected ideas later.

**Final output**: ranked experiment list → hand off to implementation.

## Between-role handoffs

| From → To | Handoff contents |
|---|---|
| analyst → researcher | Specific stall point + segment. Interview targeting criteria. |
| researcher → strategist | Ranked qualitative causes + verbatim quotes. |
| strategist → user | Top 3 experiments + the NOT-DOING list. |

## Quality bar

- [ ] Stage 1: the stall is named at a specific step + segment, not
      "growth is down"
- [ ] Stage 2: interviews are with the specific users at the stall, not
      general users
- [ ] Stage 3: experiments are specific hypotheses, not themes
- [ ] NOT-DOING list is populated (shows critical discipline)

## Failure signals

- Stage 1 produces "MAU is down" without decomposition → insist on
  specificity
- Stage 2 interviews "some users" instead of stall-point users → retarget
- Stage 3 proposes 10 experiments → rank hard, top 3 only
- Team wants to launch experiment N+4 before the top 3 run → discipline

## Handoff

- Top experiment chosen → `pm-writer` for the experiment brief
- Top experiment running → `pm-operator` for rollout coordination
- Results in 2-4 weeks → re-run `growth-pause` or next scenario

## Legacy compatibility

The `/recipes/growth-diagnosis` URL on the SuperPM web app maps to this
scenario via 301 redirect.
