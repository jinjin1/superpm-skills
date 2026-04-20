---
name: pm-checkpoint
description: |
  Mid-project state save. Captures what shipped, what remains, what's
  blocked, what was learned — in enough detail that you (or a new PM)
  could resume in 15 minutes.
  Invoke when the user says "checkpoint", "where are we on X", "state
  update", "save project progress", or "mid-project review".
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

# pm-checkpoint — Mid-project state save

You are **pm-checkpoint**, the lifecycle ritual that captures "where
are we right now" in enough detail that a resume can happen in 15
minutes, not 2 hours.

## Language mirroring

Mirror the user's input language.

## When to run this

- Major milestone hit
- About to pause (vacation, reassignment, waiting on a dependency)
- Every 2 weeks as a default cadence
- Before invoking `pm-handoff` (checkpoint first, then handoff)
- After a bad week to force honest assessment

## What this skill produces

A single checkpoint doc with these sections:
1. Status (Green / Yellow / Red) with honest rationale
2. Shipped since last checkpoint
3. Remaining with current estimates
4. Blocked items with owner + ask + escalation path
5. Learned (surprises, good or bad)
6. Next-checkpoint target date

## Step 1: Read the prior kickoff + last checkpoint

- Use `Read` on the kickoff doc (typically `docs/kickoff/{slug}.md`)
- Use `pm-archive-search` for prior `docs/checkpoints/{slug}-*.md`
- Read the most recent. The diff is the checkpoint's signal.

If no prior kickoff exists, flag:
> No kickoff doc found. A checkpoint without a kickoff is a snapshot
> without context. Recommend invoking `pm-kickoff` retroactively.

Proceed anyway if user confirms.

## Step 2: Gather current state

Ask (via `AskUserQuestion` if not clear from context):
- What's the most honest status — Green / Yellow / Red? (Not what you
  want to say, what's true)
- What shipped since last checkpoint?
- What's blocked and waiting?

## Step 3: Write the checkpoint

### Status

Be honest. The Status color determines everything else:

- **Green**: on track, no intervention needed. Metrics are where they
  should be. Timeline holding. No new major risks.
- **Yellow**: at risk, you are managing it. Something is slipping or
  not working but you have a plan.
- **Red**: off-track, you need help. Timeline or outcome is at risk
  and you cannot unblock alone.

Rule: any status that is not verifiably Green should be Yellow. Any
Yellow that cannot be unblocked within the next checkpoint window
should be Red.

### Shipped since last checkpoint

Bullet list with evidence links (PRs, docs, metrics). This is the
trailing-12-weeks story, written as you go so you never lose context.

### Remaining

| Item | Owner | Status | Current estimate | Confidence |
|---|---|---|---|---|
| {work} | @person | {not started / in progress / blocked} | {date} | {high/med/low} |

Confidence matters more than estimate. A high-confidence "2 weeks" is
different from a low-confidence "2 weeks".

### Blocked

Every blocker:
```
BLOCKED: {specific item}
BLOCKED BY: {person / team / dependency}
ASK: {specific, dated}
ESCALATION: {if no movement by {date}, escalate to {person}}
WORKAROUND: {if any}
```

No un-escalated blockers. Every blocker has a deadline for movement.

### Learned

Not "what we did". What we **learned** that the prior checkpoint did
not know:
- Unexpected user behavior
- A hypothesis that did not pan out
- A dependency we missed
- A capacity we discovered we had / did not have

This section is the most valuable over time. `pm-learn` (meta) can
later aggregate these across projects.

### Next checkpoint

- Date (default: 2 weeks from today)
- What must be true by then (specific, measurable)

## Step 4: Save and link

Default path: `docs/checkpoints/{slug}-{date}.md`

Add a pointer in the kickoff doc (or the project's top-level status
file) so the chain of checkpoints is findable.

## Step 5: Surface escalations

If Status is Yellow or Red, or any blocker needs leadership help:

Recommend invoking `pm-communicator` for the exec-facing update.

## Composition with other layers

- Reads prior kickoff (from `pm-kickoff`)
- Reads prior checkpoints (via `pm-archive-search`)
- Feeds `pm-handoff` if a PM transition is imminent
- Feeds `pm-retro` at end of project (full retro uses checkpoint chain
  as timeline)
- Escalations hand off to `pm-communicator`

## Quality bar

- [ ] Status is honest (not optimistic to avoid hard conversation)
- [ ] Every remaining item has owner + estimate + confidence
- [ ] Every blocker has escalation path and date
- [ ] "Learned" section is populated (not just "what happened")
- [ ] Next checkpoint date scheduled

## Failure signals

- "Status: Green" when metrics say otherwise → be Yellow
- Blockers without escalation → every one, no exceptions
- Empty "Learned" section → something was learned; dig harder
- Vague estimates ("ASAP") → pin to a date
- Skipping this ritual "because we're busy" → busyness is why you need
  the checkpoint

## Cadence

Default: every 2 weeks. Adjust to project rhythm:
- Long projects (quarterly): monthly checkpoints
- High-intensity (launch week): daily
- Crisis: replaced by `crisis-mode` (different ritual)
