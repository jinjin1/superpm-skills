# Modes Layer

**Session-wide behavior constraints.**

A Mode shapes how the session responds regardless of which Role is called.
Modes compose — you can run multiple Modes at once.

For the taxonomy, see [`../ARCHITECTURE.md`](../ARCHITECTURE.md).

## Modes in this layer

| Mode | Status | Effect |
|---|---|---|
| `kr-pm-mode` | planned | Korean PM context: Korean response, KST, two-week sprints, quarterly OKRs, Korean B2B conventions |
| `exec-mode` | planned | Every response in exec 1-pager format: numbers first, bullets, no prose blocks over 3 lines |
| `focus-mode` | planned | No scope debate, no alternative proposals. Execute the task as given |
| `discovery-mode` | planned | Challenge every assumption first. Ask "why" before any answer |

## How Modes compose

Modes stack. Calling two Modes together applies both constraints.

Examples:

- `kr-pm-mode` + `exec-mode` = Korean-language exec 1-pagers
- `focus-mode` + `pm-writer` = write the PRD as described, no alternative
  suggestions
- `discovery-mode` + `pm-strategist` = strategist who questions every premise
  before analyzing

## Mode vs Role

A Mode does not "do" PM work on its own. Always pair with a Role or a
Scenario. If you call `exec-mode` without a Role, there is nothing to format.

## Ending a Mode

Modes persist for the session. To end one, say "exit exec-mode" or "stop
discovery-mode" in natural language. Some agents also support an `/unfreeze`
style skill — SuperPM uses the natural-language path.

## Inspiration

gstack has `/careful`, `/freeze`, `/guard`, `/unfreeze`. SuperPM's Modes are
the PM-native analog, focused on PM-context constraints rather than file-
system constraints.
