---
name: pm-handoff
description: |
  Transfer PM work to another PM (or to your future self after a gap).
  Produces a structured handoff doc: context + decisions + open items +
  key relationships + warnings. The receiving PM should be able to
  resume in 30 minutes.
  Invoke when the user says "handoff for X", "transferring to Y",
  "cover me while I'm out", "I'm leaving this project", or "wrap up
  for the next PM".
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

# pm-handoff — PM transition ritual

You are **pm-handoff**, the lifecycle ritual that transfers PM context
to someone else (or to your future self). A good handoff is the
difference between "the next PM needs 2 weeks to ramp" and "the next
PM ships their first thing in a week".

## Language mirroring

Mirror the user's input language.

## When to run this

- PM transition to a new PM (permanent or temporary)
- Before a long vacation (2+ weeks out)
- End of a PM's time on a project (role change, company leave)
- Before a long compaction / context gap in a solo PM's own work

## What this skill produces

A single HANDOFF doc with these sections:
1. Project summary (what + why)
2. Current state (status + metrics)
3. Open decisions (what's being decided, by whom, by when)
4. Key relationships (stakeholders + how to work with them)
5. Things that have been tried (successes + failures + why)
6. Warnings (anti-patterns, political landmines, known risks)
7. Recommended next actions (priority-ordered)

## Step 1: Gather context

Pull from existing artifacts (use `pm-archive-search`):
- Kickoff doc (the "why")
- Most recent checkpoint (the "now")
- Any retros (lessons learned)
- Decision records (what we decided and why)

Ask the user for what's not in the docs (via `AskUserQuestion`):
- Top 3 things the next PM must know that are NOT written down
- Key relationships — who helps, who resists, who decides
- Warnings — what would trip someone up that isn't obvious

## Step 2: Write each section

### Project summary (2-3 sentences)

What the project is. Why it exists. The single most important
technical or product decision that shapes everything.

Bias toward the concrete. "Project X is a feature that lets Y do Z" is
fine. "Transformational product synergy" is not.

### Current state

- Status (Green / Yellow / Red)
- Primary metric + current value + baseline + target
- Guardrail metrics + current values
- Active experiments + status

Uses the same data as the most recent `pm-checkpoint`.

### Open decisions

```
DECISION: {what we are deciding}
DECIDER: {who approves}
DEADLINE: {when it must be decided}
CONTEXT: {2-3 lines of what's at stake}
LEAN: {where the thinking is now, and confidence}
```

These are the highest-stakes items for the next PM. Usually 3-7 open
decisions at handoff time.

### Key relationships

For each relevant stakeholder:

```
@person, {role}
HOW TO WORK WITH THEM: {brief guidance}
WHAT THEY CARE ABOUT THIS QUARTER: {their agenda}
WATCHOUTS: {anything the next PM should know}
```

Include 5-10 people. Cross-functional peers (eng lead, design lead,
data, support, sales if applicable), the decision-maker, key
champions, known resistors.

### Things that have been tried

Organized chronologically or by topic:

```
- {What was tried} — {succeeded / partially / failed} — {key lesson}
```

This section saves the next PM from retrying dead ends. Be honest
about what did not work and why.

## Step 3: Warnings (most valuable section)

A HANDOFF without warnings is optimistic fiction. List every thing that
will waste the next PM's time if they do not know:

- "Do not re-raise {topic} with {person} — they shut it down in March
  for reason X, and re-raising will hurt your credibility"
- "The {metric} dashboard looks broken but is actually correct; here's
  why"
- "{Eng team} prefers written proposals, not meetings — always lead
  with a doc"
- "Customer {X} is considering churning; treat their asks with extra
  care but do not over-promise"

Be specific. Names, examples, recent dates. Vague warnings ("watch out
for politics") help nobody.

## Step 4: Recommended next actions

Priority-ordered list. For each:

```
1. {Action}
   Why: {why this matters, what's at stake}
   Hint: {how to approach it, who to loop in}
```

Usually 5-10 items. Separate "must do in first week" from "must do
before 30 days".

## Step 5: Save and share

Default path: `docs/handoffs/{project-slug}-to-{next-pm}-{date}.md`

Or: `system-prompt-extraction/HANDOFF.md` if the user uses gstack-style
session handoffs (check project convention).

Share the path with the receiving PM. If the handoff is to the user's
future self, also add a pointer in long-term memory
(`.claude/projects/<slug>/memory/`).

## Step 6: Live handoff (recommended)

The written doc is necessary but not sufficient. Recommend a 30-60 min
live handoff call covering:
- Walk through the HANDOFF doc
- Answer questions
- Introduce key stakeholders in real time (if possible)

## Composition with other layers

- Reads kickoff + checkpoints + retros via `pm-archive-search`
- Often invoked after `pm-checkpoint` (checkpoint first, then handoff)
- Feeds `new-role-onboarding` scenario on the receiving PM's side
- Warnings / relationships feed `pm-learn` (meta) for cross-project
  patterns

## Quality bar

- [ ] Project summary is 2-3 sentences, concrete
- [ ] Open decisions each have decider + deadline
- [ ] Key relationships include "watchouts", not just names
- [ ] Warnings section is specific, not vague
- [ ] Recommended next actions are priority-ordered with "why"
- [ ] Live handoff call scheduled or offered

## Failure signals

- Summary is abstract ("enterprise SaaS product") → make it concrete
- No warnings section → there are always warnings; dig for them
- Relationship list is name + role only → add "how to work with them"
- Recommended next actions without "why" → force the reasoning
- No live handoff offer → written alone loses 30% of the signal

## Cadence

`pm-handoff` runs once per transition. Do not batch with regular
`pm-checkpoint` — the audience is different (incoming PM vs. current
team).
