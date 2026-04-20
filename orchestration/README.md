# Orchestration Layer

**Full-run multi-role pipelines.**

One skill. Runs a standard sequence of Roles for a given input. Checkpoints
for approval between each Role.

For the taxonomy, see [`../ARCHITECTURE.md`](../ARCHITECTURE.md).

## Skills in this layer

| Skill | Status | What it does |
|---|---|---|
| `pm-autorun` | planned | Given a proposal, run strategist → researcher → analyst → writer → critic in sequence. Checkpoint after each. One command, fully reviewed output. |

## When to call Orchestration

- You have a specific proposal (a feature idea, a strategic call) and you
  know you want multiple perspectives on it
- You do not want to invoke each Role by hand

## Orchestration vs Scenario

| | Orchestration (`pm-autorun`) | Scenario |
|---|---|---|
| Trigger | proposal / artifact | situation ("launch week", "growth pause") |
| Sequence | fixed: strategist → researcher → analyst → writer → critic | hand-designed per scenario |
| Checkpoints | between each Role | end of scenario |
| Use | "give me a full PM review of this idea" | "we are in situation X, run the playbook" |

## Why one skill, not many

gstack has `/autoplan` as a single orchestrator that runs CEO → design →
eng → dx review → codex in sequence. SuperPM Orchestration follows the same
pattern: one standard flow that covers the common case. Specialized
orchestrations live in the Scenarios layer.

## Inspiration

gstack's `/autoplan`. SuperPM's `pm-autorun` is the PM-native analog.
