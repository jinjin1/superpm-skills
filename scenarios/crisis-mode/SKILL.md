---
name: crisis-mode
description: |
  Incident / PR crisis response. Orchestrates pm-operator →
  pm-communicator → pm-critic in real time during an active crisis, and
  transitions to retrospective after resolution.
  Invoke when the user says "we have an incident", "outage", "PR crisis",
  "data issue", "users are reporting X is broken", or "something just
  broke".
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

# crisis-mode — Incident / PR crisis response

Three-stage orchestration designed for speed under pressure. Unlike other
scenarios, this one runs in real time during the crisis, not as a
one-shot planning exercise.

## When to invoke

- A production incident is active or just started
- A PR / reputational event is unfolding
- Users are reporting a widespread issue
- Leadership needs a crisis response NOW

## When NOT to invoke

- Post-crisis retrospective — use `pm-retro` (lifecycle)
- Small bug fixes — use standard ticket process
- Security incident — additionally loop in security; this scenario is
  product-crisis-focused

## Language mirroring

Mirror the user's input language. Crisis communications often need
bilingual output; the scenario handles each message in its target
language.

## Role sequence (runs in parallel, not strictly sequential)

```
PARALLEL STARTUP:
  pm-operator      → declare severity, name IC, start timeline
  pm-communicator  → draft first message (within 30 min)

ONGOING (every 30-60 min):
  pm-operator      → status, decisions, timeline updates
  pm-communicator  → internal + external updates on cadence

AT RESOLUTION:
  pm-critic        → pre-postmortem critique (what did we miss?)

HANDS OFF POST-CRISIS:
  → pm-retro    (lifecycle, blameless retro)
  → pm-writer   (final postmortem doc)
```

Unlike launch-week, crisis-mode roles run concurrently. pm-operator and
pm-communicator update in parallel because users need real-time info.

## Stage 1 — pm-operator (immediate + ongoing)

Goal: coordinate the incident response.

Immediate (first 30 min):
- Declare severity: P0 (total outage, data loss) / P1 (major
  degradation) / P2 (affecting minority) / P3 (edge case)
- Name the Incident Commander (IC) — often the PM
- Start the incident timeline doc (copy Slack timestamps as-they-happen)

Ongoing:
- Every 30-60 min (severity-dependent): post update to the incident channel
- Log each decision in real time (use `pm-decision-log` meta skill)
- Track "blocked-on" items — who we're waiting for, by when
- Declare resolution only against agreed criteria, not "it seems fine"

Uses: `pm-operator/examples/launch-plan-smart-reply.md` for format;
adapt for crisis instead of launch.

## Stage 2 — pm-communicator (parallel to operator)

Goal: transparent, honest, timely communication.

First 30 minutes:
- **Internal**: acknowledgment in #incidents / #status — "we are aware,
  investigating"
- **External**: status page update if user-visible

Ongoing (every 1-2 hours, depending on severity):
- **Internal**: what we know, what we're doing, what's blocked
- **External**: honest updates, even if "no new info"; silence is worse

At resolution:
- **Internal**: resolution + impact summary
- **External**: resolution notice; postmortem-to-follow if scope warrants

Uses: `pm-communicator/SKILL.md` crisis rules.

Key discipline: do NOT hide behind "we'll share more when we know more."
Either say what you know now, or say "we don't yet know the root cause,
next update in {time}".

## Stage 3 — pm-critic (at resolution, before the formal postmortem)

Goal: a pre-postmortem critique while memory is fresh.

Before the formal blameless retro, run a 15-min critic pass:
- Did we miss an early-warning signal? Which one?
- Was the severity right? Did we over/under-respond?
- Were customer updates on cadence or did we slip?
- What systemic issue (not person) enabled this?

Output: 3-5 sharp observations fed into the formal retro.

Uses: `pm-critic/references/premortem-template.md` (run in post-mortem
direction this time).

## Between-role handoffs

| From → To | Handoff contents |
|---|---|
| operator → communicator (continuous) | Current state, ETA, what's safe to share publicly, what's internal-only |
| communicator → operator (continuous) | Customer reports, escalation volume, visibility pressure |
| operator → critic (at resolution) | Full timeline + decision log |
| critic → retro (post-resolution) | Sharp observations for the blameless retro to pick up |

## Quality bar

- [ ] First customer update within 30 min of impact
- [ ] Update cadence maintained (no silent gaps > agreed interval)
- [ ] Decision log populated in real time (not reconstructed later)
- [ ] Resolution declared against specific criteria, not "feels fine"
- [ ] Retro scheduled within 72 hours of resolution
- [ ] Critique pass done before retro, fed in as input

## Failure signals

- Silence for > cadence interval → communicator must post "no new info,
  next update in X"
- Incident commander changes mid-incident without clear handoff →
  timeline loses coherence; avoid
- Blaming a person in internal chat → redirect to system cause
- "We don't need a retro, it wasn't that bad" → retros are scheduled by
  default; skip only for P3 with explicit call
- Formal postmortem delayed > 2 weeks → you will lose memory; write
  early, edit later

## Handoff

- Resolution confirmed → `pm-retro` (lifecycle) within 72 h
- Retro done → `pm-writer` to draft the formal postmortem (use
  `pm-writer/references/postmortem-template.md`)
- Postmortem published → `pm-communicator` for customer-facing version if
  scope warrants
- Decisions made during crisis → `pm-decision-log` to persist
- Systemic lesson learned → `pm-learn` to capture for future sessions

## Legacy compatibility

No existing `/recipes/` URL maps here. Crisis response was not previously
a Recipe; this scenario is new.
