# Lifecycle Layer

**What phase of the project is this?**

Lifecycle skills are rituals tied to a specific project stage. Run them on
a schedule, not only when remembered. They produce structured artifacts.

For the taxonomy, see [`../ARCHITECTURE.md`](../ARCHITECTURE.md).

## Lifecycle skills in this layer

| Skill | Status | When | Produces |
|---|---|---|---|
| `pm-kickoff` | ✅ shipped | Day 1 of a project | Stakeholder map + success metrics + timeline + RACI |
| `pm-checkpoint` | ✅ shipped | Mid-project | State dump: shipped / remaining / blocked / learned |
| `pm-retro` | ✅ shipped | End of sprint or project | What went well / what didn't / action items |
| `pm-handoff` | ✅ shipped | Transferring PM work | Context dump + decisions log + open questions |

All 4 Lifecycle skills are now complete as of 2026-04-20.

## When to call a Lifecycle skill

- Starting a new project → `pm-kickoff`
- About to take a vacation, mid-project → `pm-checkpoint`
- Every two weeks or end of a release → `pm-retro`
- Moving to a new team or onboarding a successor → `pm-handoff`

## Typical chain across a project

```
pm-kickoff (Day 1)
    ↓
pm-checkpoint (every 2 weeks)
    ↓
pm-checkpoint (mid-project)
    ↓
pm-retro (sprint end)
    ↓
pm-checkpoint (...)
    ↓
pm-retro (project end)
    ↓
pm-handoff (if transferring)
```

## Ritual vs Scenario

| | Lifecycle | Scenario |
|---|---|---|
| Trigger | time / phase | situation |
| Frequency | scheduled (weekly, sprint-end, etc.) | ad-hoc |
| Output | fixed artifact (kickoff doc, retro notes) | free-form session output |

## Composition

Lifecycle skills chain with each other and read from prior artifacts:

- `pm-checkpoint` reads the prior kickoff + prior checkpoints
- `pm-retro` reads the checkpoint chain for the timeline
- `pm-handoff` reads everything (kickoff + checkpoints + retros)

They also compose with other layers:

- Any Lifecycle skill can invoke `pm-archive-search` (Tool) to find
  prior artifacts
- `pm-retro` can hand off to `pm-writer` for formal postmortem docs
- Escalations from `pm-checkpoint` can hand off to `pm-communicator`

## Inspiration

gstack has `/checkpoint`, `/retro`, `/document-release`. SuperPM's Lifecycle
is the PM-native analog — focused on PM project rituals rather than code
release rituals.
