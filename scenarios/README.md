# Scenarios Layer

**What situation are you in?**

A Scenario orchestrates multiple Roles in a deliberate sequence for a
recurring PM situation. Use when the work spans several perspectives in a
defined order.

For the taxonomy, see [`../ARCHITECTURE.md`](../ARCHITECTURE.md).

## Scenarios in this layer

| Scenario | Status | Roles called (in order) |
|---|---|---|
| `launch-week` | planned | strategist → writer → communicator → operator |
| `discovery-sprint` | planned | researcher → strategist → analyst |
| `growth-pause` | planned | analyst → researcher → strategist |
| `quarterly-cycle` | planned | strategist → analyst → communicator |
| `crisis-mode` | planned | operator → communicator → critic |
| `interview-season` | planned | coach → writer → critic |
| `new-role-onboarding` | planned | writer → communicator → strategist |
| `board-prep` | planned | strategist → analyst → writer → communicator |

## When to call a Scenario

- "We're launching next week" → `launch-week`
- "Growth has stalled, diagnose" → `growth-pause`
- "Prepping the board deck" → `board-prep`
- "PR incident in progress" → `crisis-mode`

## When NOT to call a Scenario

- If you need one specific perspective, call a **Role** directly.
- If you want the full review pipeline for a single proposal (not a
  situation), use the **Orchestration** layer (`pm-autorun`).

## Scenario vs Orchestration

| | Scenario | Orchestration (`pm-autorun`) |
|---|---|---|
| Trigger | situational ("I'm in launch week") | artifact-based ("review this proposal") |
| Sequence | hand-designed per scenario | standard pipeline: strategist → researcher → analyst → writer → critic |
| Customization | the scenario owns its role choices | generic review flow |

## Legacy URL compatibility

The web app's existing `/recipes/[slug]` URLs (e.g., `/recipes/prd-writing`,
`/recipes/user-research`) map to these scenarios via 301 redirect. The old
Recipe checklist UI is preserved for users who prefer step-by-step manual
progression.
