---
name: competitive-intelligence
description: |
  Competitive intelligence session. Orchestrates pm-strategist ×3
  (market → features → positioning) → pm-critic for an end-to-end
  competitive read.
  Invoke when the user says "competitive analysis", "who else is doing
  this", "how do we position vs. X", or "scan the competitive landscape".
  Language: respond in the user's language.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - WebSearch
  - WebFetch
  - AskUserQuestion
---

# competitive-intelligence — Competitive analysis

A focused multi-pass orchestration that runs pm-strategist three times
— for market, features, and positioning — then hands to pm-critic for a
final adversarial read. Replaces and extends the former Competitive
Analysis Framework Recipe.

## When to invoke

- Considering entering a new market and need to understand incumbents
- Repositioning against a specific competitor
- Quarterly competitive refresh
- Due-diligence for a product decision that hinges on competitive reality

## When NOT to invoke

- You want a single competitor's profile — invoke `pm-strategist`
  directly
- You need user research on competitive switching behavior — add
  `pm-researcher`
- You need to know if we should pivot — use `growth-pause` or
  `discovery-sprint` first

## Language mirroring

Mirror the user's input language.

## Pass sequence

```
Pass 1 — pm-strategist (market landscape)
  → who is in the space, ranked by relevance
Pass 2 — pm-strategist (feature comparison)
  → feature / capability matrix vs. our current product
Pass 3 — pm-strategist (positioning)
  → how we position vs. the top 2-3 competitors
Pass 4 — pm-critic (adversarial read)
  → stress-test the competitive story
```

Three strategist passes are deliberate — each applies a different lens
to the same input. Trying to do all three in one pass produces shallow
work.

## Pass 1 — Market landscape

Goal: who is out there, ranked.

Method:
- Start with 10-15 candidates (customers, incumbents, adjacent plays)
- Cluster by similarity to our target market
- Score by: relevance, momentum (growth, press, funding), threat level
- Output: top 5-8, with one-line characterization each

Uses: `WebSearch` and `WebFetch` tools for external research; `pm-browse`
if exploring competitor sites is needed.

**Checkpoint: "Are the right competitors in the top 5? Did we miss
someone?"** Let the user correct.

## Pass 2 — Feature comparison

Goal: a feature / capability matrix.

Method:
- Pick 10-15 dimensions that matter to your target user's Job
- For each competitor in the top 5, score: does not exist / basic /
  good / excellent
- Score your product on the same dimensions
- Identify: where we are ahead, where behind, where nobody is serving

Do NOT include features that do not matter. "Has a dashboard" is not a
dimension if the Job is interview prep.

**Checkpoint: "Is there a dimension where we are meaningfully ahead AND
the user cares? That's our wedge."**

## Pass 3 — Positioning

Goal: how do we position in light of passes 1 and 2?

Use `pm-strategist/references/positioning-canvas.md`:
- Who we are for (and NOT for)
- The Job they have
- Our category
- Our primary benefit
- **Unlike**: the ONE competitor we pit against
- Our structural advantage (not just temporary product lead)

Output: a positioning statement + competitive matrix.

Uses: `pm-strategist/examples/pivot-assessment.md` format adapted.

**Checkpoint: "Would our target user describe us using our positioning
statement, or do they still see us as a variant of competitor X?"** If
the latter, positioning needs sharpening.

## Pass 4 — pm-critic (adversarial)

Goal: stress-test the whole thing.

Questions:
- Are we overstating our advantages? (What would a competitor say
  about us?)
- Did we miss a competitor? (Who have we not mentioned?)
- Is our positioning differentiated enough to pull a customer, or just
  rationalized?
- If we lose a deal to {competitor X} in the next quarter, what will the
  reason be?

Uses: `pm-critic/references/premortem-template.md` adapted for
competitive pre-mortem.

## Between-pass handoffs

| From → To | Handoff contents |
|---|---|
| Pass 1 → Pass 2 | Top 5 competitors, confirmed with user |
| Pass 2 → Pass 3 | Feature matrix + our wedge dimension |
| Pass 3 → Pass 4 | Positioning statement + matrix for stress-testing |

## Quality bar

- [ ] Pass 1: at least 10 candidates considered before narrowing to 5
- [ ] Pass 2: dimensions reflect the user's Job, not feature parity
- [ ] Pass 3: positioning names ONE primary competitor, not "the market"
- [ ] Pass 3: structural advantage identified, not just temporary
- [ ] Pass 4: at least 3 counter-arguments surfaced and addressed

## Failure signals

- Stopping at Pass 1 ("we know who the competitors are, that's enough")
  → the insight is in passes 2-3, not 1
- Feature matrix with 50 dimensions → prioritize to 10-15 that matter
- Positioning against "the category" rather than a specific competitor
  → vague positioning, will not land
- Pass 4 returns no concerns → critic was too soft, re-run

## Handoff

- Positioning established → `pm-writer` for the market-facing assets
- Competitive gap surfaced → `discovery-sprint` to validate the Job is
  still unserved
- Competitor releases a threatening feature → `growth-pause` + urgent
  `pm-strategist` read

## Legacy compatibility

The `/recipes/competitive-intelligence` and
`/recipes/competitive-analysis-framework` URLs on the SuperPM web app
map to this scenario via 301 redirect.
