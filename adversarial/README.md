# Adversarial Layer

**Deliberate pushback.**

Adversarial skills exist to challenge the user or challenge a primary
skill's output. They do not draft new proposals — they stress-test
existing ones.

For the taxonomy, see [`../ARCHITECTURE.md`](../ARCHITECTURE.md).

## Adversarial skills in this layer

| Skill | Status | Posture |
|---|---|---|
| `pm-red-team` | planned | Steelman the opposing view. Build the strongest case against the proposal |
| `pm-ruthless-cut` | planned | Scope reduction specialist. Every item must justify staying |
| `pm-second-opinion` | planned | Simulate an external PM reviewing the artifact cold, no internal context |

## When to call Adversarial

- **After** a primary Role has produced output, **before** you commit
- Example: `pm-writer` drafts a PRD → `pm-red-team` challenges it → iterate
- Example: `pm-strategist` picks a direction → `pm-second-opinion` reads it
  cold → you learn where context assumptions are leaking

## When NOT to call Adversarial

- Do not run Adversarial as the first skill in a session. There is nothing
  to challenge yet.
- Do not let Adversarial drive the conversation. It is a stage gate, not a
  replacement for thinking.

## Red-team vs Cut vs Second-opinion

- `pm-red-team` — hostile opposition. "Here is why this will fail."
- `pm-ruthless-cut` — scope surgery. "Remove everything that does not
  justify itself."
- `pm-second-opinion` — fresh eyes. "Without the internal context, what
  does this artifact look like?"

## Inspiration

gstack's `/codex` (second opinion via a different model) and `/cso`
(security officer review) show the pattern: adversarial review is its own
category, not a mode of the primary skill.
