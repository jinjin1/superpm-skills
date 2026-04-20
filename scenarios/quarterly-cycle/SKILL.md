---
name: quarterly-cycle
description: |
  Quarterly ritual — end of Q and start of next Q. Orchestrates
  pm-strategist → pm-analyst → pm-communicator to close the quarter,
  set the next, and align stakeholders.
  Invoke when the user says "quarterly review", "Q-end retro",
  "Q+1 planning", "OKR cycle", or "close the quarter".
  Language: respond in the user's language.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - AskUserQuestion
---

# quarterly-cycle — Close Q, open Q+1

Three-stage orchestration for the quarterly rhythm. Runs at Q-end and
Q-start; compresses what would otherwise be weeks of scattered prep into
a focused session.

## When to invoke

- 2 weeks before end of quarter, or 1 week before start of next
- Team needs OKR review + setting + stakeholder alignment
- You want strategy, data, and communication aligned from one source

## When NOT to invoke

- Mid-quarter check-in — use `pm-checkpoint` (lifecycle)
- Single OKR drafting — use `pm-strategist` directly
- Crisis retrospective — use `pm-retro` (lifecycle)

## Language mirroring

Mirror the user's input language.

## Role sequence

```
1. pm-strategist → quarter-over-quarter strategic shape
      ↓ checkpoint: the strategic narrative is clear
2. pm-analyst    → OKR scoring + quantitative state-of-the-product
      ↓ checkpoint: numbers are tight, story aligns with data
3. pm-communicator → quarterly update artifacts (exec, team, board)
      ↓ final output: three artifacts ready to send
```

## Stage 1 — pm-strategist (2-3 hours)

Goal: articulate the strategic arc of Q → Q+1.

Deliverables:
- **Q summary**: what we bet on, what happened, what we learned (3
  bullets each)
- **Q+1 bet shape**: the 1-3 strategic priorities for next quarter, with
  "why this" reasoning
- **Why NOT**: things considered and rejected for Q+1, with reasons
- **Kill criteria** for Q+1: what would cause us to reverse a Q+1 bet

Uses: `pm-strategist/references/positioning-canvas.md` if repositioning,
`pm-strategist/examples/pivot-assessment.md` for shape.

**Checkpoint: "Does the Q+1 shape fit in 3 bullets that your CEO would
agree with in one sentence?"** If no, sharpen.

## Stage 2 — pm-analyst (2-3 hours)

Goal: hard numbers + OKR scoring.

Deliverables:
- **OKR scoring**: each Q OKR graded 0.0-1.0 with evidence
- **Metric state-of-the-product**: 5-7 key metrics with Q-over-Q trend
- **Surprises**: 1-2 metrics that moved unexpectedly (either direction),
  with hypothesized cause
- **Q+1 metric targets**: specific numbers for proposed Q+1 OKRs

Uses: `pm-analyst/references/experiment-design-template.md` for any
Q+1 experiments tied to OKRs.

**Checkpoint: "Do the Q+1 metric targets fit the Q+1 strategic bets?"**
If Stage 1 and Stage 2 disagree, resolve before moving on.

## Stage 3 — pm-communicator (2-3 hours)

Goal: three artifacts for three audiences.

Deliverables:
- **Exec quarterly update** (1-pager): wins, lowlights, Q+1 asks,
  metric table
- **Team quarterly summary**: what we shipped, what we learned,
  what's next (more detail + more optimism than exec update)
- **Board pre-read** (if applicable): 2-page max, metrics + narrative +
  strategic asks

Each audience gets the right level of detail and the right frame.

Uses: `pm-communicator/references/exec-update-template.md`,
`pm-communicator/examples/weekly-exec-update.md`.

**Checkpoint: "For each audience, is the main ask in the first three
lines?"** If no, rewrite.

## Between-role handoffs

| From → To | Handoff contents |
|---|---|
| strategist → analyst | Q+1 strategic priorities. Analyst needs to pick metrics that measure these. |
| analyst → communicator | Scored OKRs + metric table + numbers to cite. |
| communicator → user | Three artifacts, each audience-ready. |

## Quality bar

- [ ] Stage 1: Q+1 shape is 1-3 priorities, not 10
- [ ] Stage 1: NOT-in-scope list is populated
- [ ] Stage 2: OKRs graded with evidence, not vibes
- [ ] Stage 2: Q+1 metric targets are specific numbers
- [ ] Stage 3: each artifact fits the audience's attention budget
- [ ] Across stages: strategic bets ↔ metrics ↔ communication all
      point to the same Jobs

## Failure signals

- Stage 1 produces 7 strategic priorities for Q+1 → force to 3 max
- Stage 2 grades OKRs with "partially hit" without a score → pin down
- Stage 3 recycles generic copy from last quarter → the quarter changed,
  the message changes
- Artifacts contradict each other on numbers → re-align before shipping

## Handoff

- Q+1 priorities approved → invoke `pm-writer` for the OKR document
- Team announcement needed → `pm-communicator` standalone
- New bets need deeper validation → `discovery-sprint`
- A bet from Q became a known problem → `growth-pause` or `crisis-mode`

## Legacy compatibility

The `/recipes/annual-strategy` URL on the SuperPM web app maps to this
scenario via 301 redirect.
