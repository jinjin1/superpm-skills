---
name: discovery-sprint
description: |
  One-week discovery sprint. Orchestrates pm-researcher (lead) →
  pm-strategist → pm-analyst to move a fuzzy idea into a testable bet.
  Invoke when the user says "we don't know enough about X yet",
  "discovery for X", "run a 1-week research sprint", or "validate this
  problem".
  Language: respond in the user's language.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - WebSearch
  - AskUserQuestion
---

# discovery-sprint — One-week discovery

A three-stage orchestration that compresses a discovery cycle into a
single focused week. Output is a go / no-go / iterate call on the
problem, grounded in user evidence and data.

## When to invoke

- You have a fuzzy problem statement ("users want X?")
- You have less than a week to get to a decision
- The cost of building without validating is too high
- You want evidence, not opinion, at the end

## When NOT to invoke

- The decision is already made — use `pm-writer` or `launch-week`
- The problem is a growth stall, not a new opportunity — use `growth-pause`
- You need more than a week to validate — this scenario is scoped to one

## Language mirroring

Mirror the user's input language.

## Role sequence

```
1. pm-researcher  → design + run interviews (lead for the week)
      ↓ checkpoint: 5 interviews done, raw notes captured
2. pm-strategist  → interpret patterns → strategic options
      ↓ checkpoint: user picks which option to validate with data
3. pm-analyst     → quant sanity check on the chosen option
      ↓ final output: "go / iterate / kill" recommendation with evidence
```

## Stage 1 — pm-researcher (Days 1-3, ~60% of time)

Goal: 5 user interviews + JTBD synthesis.

Deliverables:
- Interview guide (using `pm-researcher/references/interview-guide-template.md`)
- 5 interviews completed (use `pm-notes` tool to capture)
- JTBD synthesis with frequency × intensity × under-served ranking
- Top 2-3 surprising findings

**Checkpoint: "Do the findings point to a real, recurring Job, or to
noise?"** If noise, stop and reassess the problem statement.

## Stage 2 — pm-strategist (Day 4, ~15% of time)

Goal: translate findings into strategic options.

From research, generate 2-3 options:
- **Option A (most ambitious)**: go after the biggest surfaced Job
- **Option B (safer)**: go after an adjacent easier Job first
- **Option C (null)**: do nothing, research did not find a worthy Job

For each option: what would success look like? What would failure look
like? What's the unique wedge?

Uses: `pm-strategist/references/positioning-canvas.md`.

**Checkpoint: "Which option are we validating with data?"** The user
picks one before moving to Stage 3.

## Stage 3 — pm-analyst (Day 5, ~25% of time)

Goal: quantitative sanity check on the chosen option.

Depending on the option, might be:
- Market sizing (how many potential users have this Job?)
- Internal funnel data (how many existing users show the behavior?)
- Willingness-to-pay estimation (how to run one if not already done)
- Experiment design for a lightweight test (smoke test, fake door, paid
  concierge)

Uses: `pm-analyst/references/experiment-design-template.md` if the output
is an experiment design.

**Final output**: a go / iterate / kill recommendation with:
- The strategic option
- The qualitative evidence
- The quantitative sanity check
- The recommended next step (build MVP, run experiment, or kill)

## Between-role handoffs

| From → To | Handoff contents |
|---|---|
| researcher → strategist | JTBD synthesis + ranked Jobs + verbatim quotes. Do NOT hand over raw notes — synthesis is the deliverable. |
| strategist → analyst | The chosen option + the key quantitative question that would confirm or kill it. |
| analyst → user | The final recommendation with confidence level + what would change it. |

## Quality bar

- [ ] Stage 1: 5 interviews, not 3, not "we found enough"
- [ ] Stage 1: synthesis uses the "when / want / so that" format
- [ ] Stage 2: at least 3 options considered, including "do nothing"
- [ ] Stage 3: quant answers the specific question from Stage 2, not
      just "general market data"
- [ ] Final rec has confidence level and reverse conditions

## Failure signals

- Only 2-3 interviews before strategizing → not enough evidence,
  extend Stage 1
- Strategist skips the "do nothing" option → hiding confirmation bias
- Analyst does generic "market research" instead of the specific question
  → Stage 2 and 3 are misaligned, re-sync
- User wants to build something before Stage 3 finishes → that's a
  signal they already decided; acknowledge + continue the validation
  anyway to have evidence for a postmortem if it fails

## Handoff

Based on the final call:
- **Go**: → `launch-week` OR `pm-writer` for the PRD
- **Iterate**: → another `discovery-sprint` or narrower experiment
- **Kill**: → `pm-decision-log` to record the kill + learnings
- **Unclear**: → invoke `pm-critic` to sharpen the thinking

## Legacy compatibility

The `/recipes/user-research` URL on the SuperPM web app maps to this
scenario via 301 redirect.
