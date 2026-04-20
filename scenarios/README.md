# Scenarios Layer

**What situation are you in?**

A Scenario orchestrates multiple Roles in a deliberate sequence for a
recurring PM situation. Use when the work spans several perspectives in a
defined order.

For the taxonomy, see [`../ARCHITECTURE.md`](../ARCHITECTURE.md).

## Scenarios in this layer

| Scenario | Status | Role sequence |
|---|---|---|
| `launch-week` | ✅ shipped | strategist → writer → communicator → operator |
| `discovery-sprint` | ✅ shipped | researcher(lead) → strategist → analyst |
| `growth-pause` | ✅ shipped | analyst → researcher → strategist |
| `quarterly-cycle` | ✅ shipped | strategist → analyst → communicator |
| `crisis-mode` | ✅ shipped | operator ∥ communicator → critic (then retro/writer post-crisis) |
| `interview-season` | ✅ shipped | coach → writer → critic |
| `new-role-onboarding` | ✅ shipped | writer → communicator → strategist |
| `board-prep` | ✅ shipped | strategist → analyst → writer → communicator |
| `competitive-intelligence` | ✅ shipped | strategist × 3 (market / features / positioning) → critic |

All 9 Scenarios are now complete as of 2026-04-20.

## When to call a Scenario

- "We're launching next week" → `launch-week`
- "Growth has stalled, diagnose" → `growth-pause`
- "Prepping the board deck" → `board-prep`
- "PR incident in progress" → `crisis-mode`
- "Competitive refresh" → `competitive-intelligence`
- "I just started as PM at X" → `new-role-onboarding`
- "I'm interviewing next week" → `interview-season`
- "Q-end retro + Q+1 OKRs" → `quarterly-cycle`
- "We don't know enough about X yet" → `discovery-sprint`

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

The web app's existing `/recipes/[slug]` URLs map to Scenarios via 301
redirect. The old Recipe checklist UI is preserved for users who prefer
step-by-step manual progression.

| Old recipe URL | New scenario |
|---|---|
| `/recipes/prd-writing` | inside `launch-week` / via `pm-writer` |
| `/recipes/user-research` | `discovery-sprint` |
| `/recipes/gtm-launch` | `launch-week` |
| `/recipes/annual-strategy` | `quarterly-cycle` |
| `/recipes/growth-diagnosis` | `growth-pause` |
| `/recipes/competitive-intelligence` | `competitive-intelligence` |
| `/recipes/ai-feature-launch` | `launch-week` with `pm-ai-advisor` reference (v1.1+) |
| `/recipes/pm-interview-prep` | `interview-season` |
| `/recipes/competitive-analysis-framework` (archived) | `competitive-intelligence` |
