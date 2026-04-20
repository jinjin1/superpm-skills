---
name: board-prep
description: |
  Board meeting preparation. Orchestrates pm-strategist → pm-analyst →
  pm-writer → pm-communicator to produce board pre-reads, metric decks,
  and boards-level narratives.
  Invoke when the user says "prep board materials", "board meeting next
  week", "investor update", or "quarterly board deck".
  Language: respond in the user's language.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - AskUserQuestion
---

# board-prep — Board meeting preparation

Four-stage orchestration specifically for the board rhythm. Board
materials have different rules than exec updates: shorter,
more-narrative, investor-alert, no surprises.

## When to invoke

- Board meeting in the next 1-2 weeks
- Investor update due
- Board committee meeting (audit, comp, product)

## When NOT to invoke

- Internal exec update — use `quarterly-cycle` Stage 3
- Crisis response toward the board — use `crisis-mode` + special comm
- One-off founder-investor chat — less structured, do not force this

## Language mirroring

Mirror the user's input language. Note that board materials often need
to be in English even when the team works in another language; flag
this to the user if it applies.

## Role sequence

```
1. pm-strategist → "the narrative": our bet, our progress, what's next
      ↓ checkpoint: narrative fits in 3 sentences
2. pm-analyst    → key metrics, cohort trends, health indicators
      ↓ checkpoint: numbers match the narrative without cherry-picking
3. pm-writer     → board pre-read (2 pages max)
      ↓ checkpoint: pre-read stands alone, no verbal explanation needed
4. pm-communicator → Q&A prep, talking points, edge-case answers
      ↓ final output: pre-read + metric deck + Q&A cheat sheet
```

## Stage 1 — pm-strategist (2-3 hours)

Goal: the narrative. Board members read many updates; they remember
narratives, not tables.

Deliverables:
- **The arc**: where we were last board → where we are → where we're
  going next
- **The single most important thing this quarter**: one sentence
- **What we got wrong** (if applicable): honest, specific, learning
  included
- **The ask**: what do we want the board to know / decide / help with

Rule: no surprises. If something is going badly, the board must have
heard about it before the meeting. The board meeting is not where bad
news arrives.

Uses: `pm-strategist/examples/pivot-assessment.md` format adapted for
board narrative.

**Checkpoint: "If you could only say one sentence to a board member in
an elevator, what would it be?"** That's the narrative.

## Stage 2 — pm-analyst (3-4 hours)

Goal: a metric deck that supports the narrative without cherry-picking.

Deliverables:
- **Top 5-7 metrics** (not 20): North Star + guardrails + health
- **Q-over-Q trends**: last 4-6 quarters on each key metric
- **Cohort / retention curves**: how is the product aging?
- **Benchmark** (where available): vs. similar-stage companies
- **Red numbers**: metrics moving in the wrong direction, with
  explanation

Critical: include the numbers that are going the wrong way. Hiding them
until the next quarter destroys trust when discovered.

Uses: `pm-analyst/examples/funnel-drop-diagnosis.md` format if a
specific stall needs explaining.

**Checkpoint: "Do the numbers tell the same story as the narrative?"**
If not, either the narrative is wrong or the numbers are cherry-picked.

## Stage 3 — pm-writer (2-3 hours)

Goal: the board pre-read. Typically 2 pages max. Board members read
pre-reads; they do NOT read the full deck.

Structure:
```
Page 1:
- Narrative (3 sentences)
- Key metric table (5-7 rows, Q-over-Q)
- Top win + top concern (1 line each)
- Asks (if any)

Page 2:
- Deeper context on top concern
- One strategic bet for next quarter with rationale
- Appendix pointer: "see deck sections X-Z for detail"
```

The deck itself is 15-20 slides of supporting material; the pre-read is
the spine. Board members read the spine.

Uses: `pm-writer/references/1-pager-template.md` structure, extended to 2
pages.

**Checkpoint: "If a board member missed the meeting and read only this
pre-read, would they know enough to email back one comment?"** If not,
it fails.

## Stage 4 — pm-communicator (1-2 hours)

Goal: Q&A prep, not the presentation itself.

Deliverables:
- **Top 10 likely board questions** with 30-second answers
- **Toughest 3 questions**: what you do NOT want to be asked, with
  rehearsed honest answers
- **Red team simulation** (optional): invoke `pm-red-team` adversarial
  skill to stress-test the Q&A
- **Next-step commitments**: what will you do between this board and
  the next?

Rule: do not memorize the deck. Memorize the Q&A. The deck is a
reference; the Q&A is live fire.

Uses: `pm-communicator/SKILL.md` board rules.

## Between-role handoffs

| From → To | Handoff contents |
|---|---|
| strategist → analyst | Narrative arc. Analyst picks metrics that support it without cherry-picking. |
| analyst → writer | Final metric table + red numbers. Writer weaves these into the pre-read. |
| writer → communicator | Pre-read + deck. Communicator imagines board reading it and preps Q&A. |

## Quality bar

- [ ] Stage 1: narrative fits in one sentence
- [ ] Stage 1: "what we got wrong" is included if applicable
- [ ] Stage 2: red numbers are shown, not hidden
- [ ] Stage 2: metric count ≤ 7
- [ ] Stage 3: pre-read is ≤ 2 pages
- [ ] Stage 4: top 3 tough questions are rehearsed
- [ ] Across stages: no surprises — board has heard the big items before

## Failure signals

- Cherry-picked metrics → will be caught by a sharp investor; erodes
  trust
- Pre-read > 2 pages → board won't read it; compress
- Narrative that fights the numbers → numbers win; fix the narrative
- Q&A prep skipped → the meeting is the rehearsal; always lose
- "Surprise" bad news in the meeting → always bad; disclose before

## Handoff

- Post-board: action items to follow up → `pm-writer` for the follow-up
  memo
- Board pressure on a decision → `pm-critic` to pressure-test it
- New strategic direction surfaced in the board → `pm-strategist`
  standalone for the next POV

## Legacy compatibility

No existing `/recipes/` URL maps here. Board prep was not previously a
Recipe.
