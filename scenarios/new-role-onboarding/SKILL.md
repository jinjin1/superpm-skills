---
name: new-role-onboarding
description: |
  First 30 days as a PM in a new role. Orchestrates pm-writer →
  pm-communicator → pm-strategist to produce the artifacts and
  relationships a new PM needs before they own roadmap direction.
  Invoke when the user says "I just started as PM at X", "first 30 days
  plan", "I'm new to this team", or "onboarding plan for my PM role".
  Language: respond in the user's language.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - AskUserQuestion
---

# new-role-onboarding — First 30 days as a PM

Three-stage orchestration for the transition into a new PM role.
Covers: documentation of learnings, relationship-building
communication, and the first strategic point-of-view to share.

## When to invoke

- New PM at a new company
- Internal transfer to a new product / team
- First time stepping into PM role from an adjacent function

## When NOT to invoke

- Established PM mid-role — not needed
- Transferring to a role with identical product context — partial use
  only; skip Stage 3
- PM interview prep — use `interview-season`

## Language mirroring

Mirror the user's input language.

## Role sequence

```
Week 1-2 — Stage 1 (pm-writer)
  → learnings doc, context brief, initial 30-60-90 plan
  ↓ checkpoint: you have artifacts to discuss with your manager
Week 2-3 — Stage 2 (pm-communicator)
  → stakeholder outreach messages, 1:1 prep, team intro
  ↓ checkpoint: relationships initiated, credibility established
Week 3-4 — Stage 3 (pm-strategist)
  → your first strategic point-of-view + bets for next quarter
  ↓ final output: a POV your team can respond to
```

Sequence order is intentional. New PMs who lead with strategy
(Stage 3) before building context (Stage 1) and relationships (Stage 2)
lose credibility fast.

## Stage 1 — pm-writer (Week 1-2)

Goal: capture everything. The first weeks have maximum signal, minimum
bias. Write it down before you lose it.

Deliverables:
- **Learnings doc**: what I'm learning, organized by topic (product,
  users, team, organization, competitors). Updated daily.
- **Context brief**: who are the users, what's the business, what's the
  current product state — in 1-2 pages for your own reference.
- **30-60-90 plan**: draft of what you plan to accomplish in each
  window. Starts as a guess; refined continuously.
- **Question list**: things you don't understand yet, prioritized by
  decision-relevance.

Uses: `pm-writer/SKILL.md` patterns + personal style.

**Checkpoint: "Could your manager read these and get a complete
picture of your understanding without asking a question?"** If no,
iterate.

## Stage 2 — pm-communicator (Week 2-3)

Goal: relationships before roadmap. The first 30 days are less about
brilliant product thinking and more about trust.

Deliverables (drafted together with `pm-communicator`):
- **1:1 prep notes** for your manager: "here's what I'm learning, here
  are my open questions, here's what I need from you"
- **Stakeholder outreach messages**: for each cross-functional peer
  (eng lead, design lead, data lead, support lead, key engineers), a
  short "I'd like to learn from you, here's what I'd like to understand"
- **Team introduction**: a Slack post or 1-pager introducing yourself
  to the team — humble, specific about your background, light on
  promises
- **Customer outreach** (if applicable): 3-5 customer calls to hear
  from users directly, with the recognition that you won't yet know
  enough to interpret

Uses: `pm-communicator/SKILL.md` audience rules.

**Checkpoint: "After these conversations, do you have one ally on
each major cross-functional team?"** If not, more conversations.

## Stage 3 — pm-strategist (Week 3-4)

Goal: your first strategic point-of-view, offered humbly but clearly.

Deliverables:
- **Observations**: 3-5 things you've noticed (neutral, not proposals)
- **Hypotheses**: 2-3 strategic hypotheses about what the product should
  be doing more / less of, with reasoning
- **Proposed bets**: 1-2 specific things you'd like to do in the next
  quarter, with reasoning
- **Where you want input**: what you're uncertain about, what
  perspectives you want challenge on

Critical: frame as hypothesis, not conclusion. You are 30 days in. The
team has been here longer. Your outside perspective is valuable; your
judgment is still being calibrated.

Uses: `pm-strategist/examples/pivot-assessment.md` for shape; adapt for
new-role context.

**Final output**: a POV your team can engage with. They should feel
invited to push back, not lectured to.

## Between-role handoffs

| From → To | Handoff contents |
|---|---|
| writer → communicator | Learnings + question list. Communicator uses these to ask the right questions in 1:1s. |
| communicator → strategist | Perspectives gathered from cross-functional peers. Strategist weighs these in the POV. |
| strategist → user | A living POV document that gets revised as more context arrives. |

## Quality bar

- [ ] Stage 1: learnings updated at least weekly
- [ ] Stage 2: at least 5 cross-functional 1:1s in weeks 2-3
- [ ] Stage 2: team intro is specific about background, light on promises
- [ ] Stage 3: POV framed as hypotheses, not conclusions
- [ ] Stage 3: explicit "where I want your input" list

## Failure signals

- Writing a strategy plan in week 1 → too early; you don't yet know
  enough. Write a learnings doc instead.
- Making grand promises in the team intro → you will regret them by week 4
- Skipping cross-functional 1:1s because "I'm busy learning the product"
  → relationships enable the learning, not compete with it
- POV that reads like lecture → reframe as hypothesis with invited
  pushback

## Handoff

- Week 4 POV shared → invite `pm-critic` for a brutal review before
  broader distribution
- Questions accumulating → `pm-researcher` for user voice
- Quantitative gaps → `pm-analyst` for data literacy on this product
- Transitioning from onboarding to execution → invoke `quarterly-cycle`
  at the next Q boundary

## Legacy compatibility

No existing `/recipes/` URL maps here. This scenario is new — "new role
onboarding" was not previously a Recipe.
