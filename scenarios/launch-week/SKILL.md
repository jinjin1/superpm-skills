---
name: launch-week
description: |
  Launch week runbook. Orchestrates pm-strategist → pm-writer →
  pm-communicator → pm-operator across the final week before a product
  launch, with checkpoints for user approval between each role.
  Invoke when the user says "we're launching X in a week", "run launch
  week for X", "prep the launch", or "launch runbook".
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

# launch-week — Launch week runbook

A four-stage orchestration that walks a PM through the week before GA.
Each stage hands off to the next with a user checkpoint in between.

## When to invoke

- You have a launch scheduled for the coming week
- You need to go from "feature built" to "feature shipped" without
  dropping anything
- You want the four perspectives (strategy, docs, communication,
  operations) applied in sequence

## When NOT to invoke

- The feature is not close to done — use `discovery-sprint` or invoke
  `pm-writer` to draft the PRD first
- It's a crisis, not a launch — use `crisis-mode`
- Post-launch retrospective — use `pm-retro` (lifecycle layer)

## Language mirroring

Mirror the user's input language. All sub-roles will do the same.

## Role sequence

```
1. pm-strategist  → clarify the "why launch now + who wins"
      ↓ checkpoint: user approves strategic frame
2. pm-writer      → produce launch docs (announcement, PRD update, changelog)
      ↓ checkpoint: user approves docs
3. pm-communicator → audience-specific messages (exec, team, customer)
      ↓ checkpoint: user approves messaging
4. pm-operator    → execute the launch plan (T-minus, RACI, readiness)
```

## Stage 1 — pm-strategist (30 min)

Goal: lock the "why now" and the "win condition" before writing anything.

Questions to confirm:
- What is the single primary Job this launch completes?
- Who is the decision-maker? What is their agenda?
- What is the success metric? What is the kill condition?
- What are we NOT launching that we considered?

Output: a short strategic frame (5-10 bullet points) that anchors the rest
of the week.

**Checkpoint: "Does this framing match what you'd tell a board member in
one sentence?"** If no, iterate strategy before moving on.

## Stage 2 — pm-writer (60-90 min)

Goal: produce the launch docs.

Typical artifacts:
- Launch announcement (1-pager)
- PRD update if scope changed late
- Changelog / release notes
- Internal launch summary

Uses: `pm-writer/references/1-pager-template.md`,
`pm-writer/references/prd-template.md`.

**Checkpoint: "If you forwarded only these docs to an exec, would they
understand the launch without further context?"** If no, cut or clarify.

## Stage 3 — pm-communicator (60 min)

Goal: audience-specific messages.

Typical artifacts:
- Exec update (weekly-style, with launch as the main win)
- Customer-facing announcement email or in-product banner
- Cross-team FAQ
- Support team briefing with canned responses

Uses: `pm-communicator/references/exec-update-template.md`.

**Checkpoint: "For each audience, is the primary ask or takeaway in the
first three lines?"** If no, rewrite.

## Stage 4 — pm-operator (90 min)

Goal: the execution machinery.

Typical artifacts:
- T-minus timeline with milestones
- RACI table
- Launch readiness checklist (go/no-go)
- Staged rollout plan (5% → 25% → 50% → 100%)
- Rollback procedure
- Post-launch retro scheduled

Uses: `pm-operator/references/launch-readiness-checklist.md`.

**Checkpoint: "If the launch goes wrong at 10 PM on launch day, does the
team know exactly what to do without asking?"** If no, tighten the runbook.

## Between-role handoffs

| From → To | Handoff contents |
|---|---|
| strategist → writer | Strategic frame bullets: Job, decision-maker, metric, NOT-in-scope, kill criterion |
| writer → communicator | Final launch docs. Communicator adapts per audience, does not recreate. |
| communicator → operator | All messages in final form, with send times. Operator includes these in the T-minus timeline. |

## Quality bar for the whole orchestration

- [ ] Stage 1: Strategic frame fits in one paragraph
- [ ] Stage 2: Every doc has a 3-line TL;DR
- [ ] Stage 3: Every message names its audience and their agenda
- [ ] Stage 4: Every row in the timeline has an owner + kill criterion
- [ ] All four stages reference the same Job, same metric, same
      decision-maker — no drift

## Failure signals

- Stages drift apart (writer invents new scope, strategist's frame
  ignored) → restart from Stage 1
- Stage 4 is "we'll figure it out day-of" → the runbook is the point,
  insist on specifics
- User wants to skip Stage 1 "because we've already decided" → the
  strategic frame is what keeps the writer and communicator aligned. A
  10-minute quick version is still needed.

## Handoff after launch

- Launch day done → `pm-operator` stays on incident watch
- Post-launch retro in ≤ 72 h → `pm-retro` (lifecycle)
- Postmortem doc → `pm-writer` 
- Launch outcome review for execs → `pm-analyst` + `pm-communicator`

## Legacy compatibility

The `/recipes/gtm-launch` URL on the SuperPM web app maps to this scenario
via 301 redirect.
