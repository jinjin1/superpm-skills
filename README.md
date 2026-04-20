# SuperPM Skills

**A multi-layer Skills toolkit for PMs** — installable into Claude Code.

PM work spans too many modes to collapse into a flat list of prompts.
SuperPM Skills organizes that work across **eight layers**: Roles (who),
Scenarios (when), Tools (utility), Lifecycle (phase), Modes (constraint),
Adversarial (challenge), Meta (memory), Orchestration (full-run). Around
**30 skills** in total, composable.

See [`ARCHITECTURE.md`](./ARCHITECTURE.md) for the full design. Below is the
quick tour.

Language: every skill file in this repo is written in English. At runtime,
skills mirror the language you type in. Write to a skill in any language and
it answers you in that language.

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed
- [Git](https://git-scm.com/) installed
- macOS / Linux (Windows: WSL recommended)

## Install

```bash
git clone https://github.com/jinjin1/superpm-skills.git ~/.claude/skills/superpm
cd ~/.claude/skills/superpm
./setup.sh
```

Restart Claude Code, then try:

```
Write a PRD for feature X
Draft a postmortem from this incident log
Turn this into an executive 1-pager
```

Other languages work the same way: write to a skill in your language and it
responds in kind.

## What's inside

### 8 Roles (who the agent is)

| Role | Covers |
|---|---|
| `pm-strategist` | Market, competitive, positioning, OKRs, pivot calls |
| `pm-researcher` | Interview design, JTBD, synthesis, personas |
| `pm-analyst` | Funnels, retention, cohorts, experiment design |
| `pm-writer` | PRD, 1-pager, RFC, launch notes, postmortem |
| `pm-critic` | Premise challenge, scope cuts, risk map |
| `pm-communicator` | Exec updates, stakeholder alignment, customer messages |
| `pm-operator` | Launch, crisis response, incident retros |
| `pm-coach` | PM interview prep, career, skill diagnosis |

### 9 Scenarios (the situation you are in)

- `launch-week` — strategist → writer → communicator → operator
- `discovery-sprint` — researcher → strategist → analyst
- `growth-pause` — analyst → researcher → strategist
- `quarterly-cycle` — strategist → analyst → communicator
- `crisis-mode` — operator ∥ communicator → critic (then retro post-crisis)
- `interview-season` — coach → writer → critic
- `new-role-onboarding` — writer → communicator → strategist
- `board-prep` — strategist → analyst → writer → communicator
- `competitive-intelligence` — strategist × 3 (market / features / positioning) → critic

### 4 Tools (utilities used across roles)

- `pm-browse` — inspect external sites (competitor pages, App Store reviews, industry reports)
- `pm-notes` — capture raw interview notes and synthesize into themes
- `pm-metrics-lookup` — find the right metric for a given problem
- `pm-archive-search` — surface relevant past PRDs, decisions, retros

### 4 Lifecycle Rituals (project-phase skills)

- `pm-kickoff` — Day 1: stakeholder map, success metrics, timeline, RACI
- `pm-checkpoint` — mid-project: state dump of shipped / remaining / blocked / learned
- `pm-retro` — end of sprint or project
- `pm-handoff` — transfer PM work to another PM

### 4 Modes (session-wide behavior constraints)

- `kr-pm-mode` — Korean PM context (language, KST, quarterly OKRs, B2B conventions)
- `exec-mode` — every response in exec 1-pager format
- `focus-mode` — execute only, no scope debate
- `discovery-mode` — challenge every assumption first

### 3 Adversarial (second-opinion / challenge)

- `pm-red-team` — steelman the opposing view
- `pm-ruthless-cut` — scope reduction, default "cut"
- `pm-second-opinion` — external PM cold review

### 3 Meta (memory and quality)

- `pm-decision-log` — capture ADR-style decision records
- `pm-learn` — persist learnings about the team / product
- `pm-health` — audit PM practice quality

### 1 Orchestration

- `pm-autorun` — for a proposal, run strategist → researcher → analyst → writer → critic sequentially with approval checkpoints (gstack's `/autoplan` for PMs)

## Philosophy

[`ETHOS.md`](./ETHOS.md) holds the shared values every skill inherits.

## Architecture

See [`ARCHITECTURE.md`](./ARCHITECTURE.md) for:
- What each layer is and when to use it
- How layers compose (full worked examples)
- Design principles (why Modes are separate from Roles, etc.)

## Update

```bash
cd ~/.claude/skills/superpm
git pull
```

(Or re-run `./setup.sh` if you want to reinstall.)

## Repos

- Skills (this one): https://github.com/jinjin1/superpm-skills
- Web app: https://github.com/jinjin1/prompt
- Strategy doc: [`docs/designs/pm-harness-v1.md`](https://github.com/jinjin1/prompt/blob/main/docs/designs/pm-harness-v1.md) (in the web app repo)

## Status

| Phase | Layer(s) | Status |
|---|---|---|
| 0 | Bootstrap + pm-writer exemplar | ✅ 2026-04-20 |
| 1 | Roles (8) | ✅ 2026-04-20 |
| 1b | References + examples for all Roles | ✅ 2026-04-20 |
| 2 | Scenarios (9) | ✅ 2026-04-20 |
| 3 | Tools + Lifecycle + Modes (12) | ✅ 2026-04-20 |
| 4 | Adversarial + Meta + Orchestration (7) | planned |

Total shipped: 29 skills across 5 layers. Remaining: 6 skills across
3 layers.

## License

MIT. See [`LICENSE`](./LICENSE).
