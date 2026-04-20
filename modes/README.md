# Modes Layer

**Session-wide behavior constraints.**

A Mode shapes how the session responds regardless of which Role is called.
Modes compose — you can run multiple Modes at once.

For the taxonomy, see [`../ARCHITECTURE.md`](../ARCHITECTURE.md).

## Modes in this layer

| Mode | Status | Effect |
|---|---|---|
| `kr-pm-mode` | ✅ shipped | Korean PM context: 한국어 응답 · KST · 2주 스프린트 · 분기 OKR · KR B2B 컨벤션 · 업종 프리셋 |
| `exec-mode` | ✅ shipped | Every response in exec 1-pager format: numbers first, bullets, no prose blocks over 3 lines |
| `focus-mode` | ✅ shipped | No scope debate, no alternative proposals. Execute the task as given |
| `discovery-mode` | ✅ shipped | Challenge every assumption first. Ask "why" before any answer |

All 4 Modes are now complete as of 2026-04-20.

## How Modes compose

Modes stack. Calling two Modes together applies both constraints.

Examples:

- `kr-pm-mode` + `exec-mode` = 한국어 임원 1-pager
- `focus-mode` + `pm-writer` = write the PRD as specified, no alternative
  suggestions
- `discovery-mode` + `pm-strategist` = strategist who questions every
  premise before analyzing

## Mode conflicts

Some Modes cannot run together:

| Mode A | Mode B | Conflict |
|---|---|---|
| `focus-mode` | `discovery-mode` | opposite orientations — ask user which wins |
| `focus-mode` | Adversarial layer | focus-mode suppresses challenge, adversarial requires it — adversarial wins temporarily |

## Mode vs Role

A Mode does not "do" PM work on its own. Always pair with a Role or a
Scenario. If you call `exec-mode` without a Role, there is nothing to
format.

## Ending a Mode

Modes persist for the session. To end one, say "exit exec-mode" or "stop
discovery-mode" in natural language. SuperPM uses natural-language mode
exits rather than a separate `/unfreeze` style skill.

## Inspiration

gstack has `/careful`, `/freeze`, `/guard`, `/unfreeze`. SuperPM's Modes
are the PM-native analog, focused on PM-context constraints rather than
file-system constraints.
