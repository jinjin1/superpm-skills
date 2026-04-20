# Lifecycle Layer

**What phase of the project is this?**

Lifecycle skills are rituals tied to a specific project stage. Run them on
a schedule, not only when remembered. They produce structured artifacts.

For the taxonomy, see [`../ARCHITECTURE.md`](../ARCHITECTURE.md).

## Lifecycle skills in this layer

| Skill | Status | When | Produces |
|---|---|---|---|
| `pm-kickoff` | planned | Day 1 of a project | Stakeholder map + success metrics + timeline + RACI |
| `pm-checkpoint` | planned | Mid-project | State dump: shipped / remaining / blocked / learned |
| `pm-retro` | planned | End of sprint or project | What went well / what didn't / action items |
| `pm-handoff` | planned | Transferring PM work | Context dump + decisions log + open questions |

## When to call a Lifecycle skill

- Starting a new project → `pm-kickoff`
- About to take a vacation, mid-project → `pm-checkpoint`
- Every two weeks or end of a release → `pm-retro`
- Moving to a new team or onboarding a successor → `pm-handoff`

## Ritual vs Scenario

| | Lifecycle | Scenario |
|---|---|---|
| Trigger | time / phase | situation |
| Frequency | scheduled (weekly, sprint-end, etc.) | ad-hoc |
| Output | fixed artifact (kickoff doc, retro notes) | free-form session output |

## Inspiration

gstack has `/checkpoint`, `/retro`, `/document-release`. SuperPM's Lifecycle
is the PM-native analog — focused on PM project rituals rather than code
release rituals.
