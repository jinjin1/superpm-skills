# SuperPM Skills

**Your virtual PM team of 8** — a role-based Skills collection for Claude Code.

From writing PRDs to handling crises, the work of a single PM spans too many
roles. SuperPM Skills splits that work into 8 specialist roles you can invoke
by name, plus 8 scenario sessions that orchestrate multiple roles for specific
situations ("launch week", "growth pause", "crisis mode").

Language: the base content is English, but every skill mirrors your language.
Type in Korean, get Korean. Type in English, get English.

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

Korean works too:

```
PRD 써줘
포스트모템 정리해줘
임원용 1-pager로 만들어줘
```

## What's inside

### 8 Roles (your virtual PM teammates)

| Role | Identity | Covers |
|---|---|---|
| `pm-writer` | The writer | PRD · 1-pager · RFC · launch notes · postmortem · decision memo |
| `pm-strategist` | The strategist | Market/competitive analysis · OKRs · quarterly strategy · pivot calls |
| `pm-researcher` | The researcher | Interview design · JTBD · synthesis · personas |
| `pm-analyst` | The analyst | Funnels · retention · cohorts · experiment design |
| `pm-critic` | The challenger | Premise challenge · scope cuts · risk map |
| `pm-communicator` | The communicator | Exec updates · stakeholder alignment · customer escalations |
| `pm-operator` | The operator | Launch · crisis response · incident retros |
| `pm-coach` | The coach | PM interview prep · career · skill diagnosis |

### 8 Scenarios (situational sessions)

Orchestrate multiple roles in sequence for a specific situation.

- `launch-week` — Launch week runbook (strategist · writer · communicator · operator)
- `discovery-sprint` — One-week discovery (researcher · strategist · analyst)
- `growth-pause` — Growth stall diagnostic (analyst · researcher · strategist)
- `quarterly-cycle` — Quarter-end / quarter-start ritual (strategist · analyst · communicator)
- `crisis-mode` — Incident / PR crisis response (operator · communicator · critic)
- `interview-season` — Job hunt week (coach · writer · critic)
- `new-role-onboarding` — First 30 days as PM (writer · communicator · strategist)
- `board-prep` — Board meeting prep (strategist · analyst · writer · communicator)

## Philosophy

[`ETHOS.md`](./ETHOS.md) holds the shared values every skill inherits.
Read it once; every role applies it.

## Update

```bash
cd ~/.claude/skills/superpm
git pull
```

(Or re-run `./setup.sh` if you want to reinstall.)

## Architecture

This repo is the **content source** for SuperPM skills. It is deliberately
separate from the SuperPM web app repo so that:

- Users install skills directly from this repo (no web app dependency)
- The web app renders skill docs on `/roles/[slug]` and `/scenarios/[slug]`
  by including this repo as a git submodule

Repos:
- Skills (this one): https://github.com/jinjin1/superpm-skills
- Web app: https://github.com/jinjin1/prompt
- Strategy doc: [`docs/designs/pm-harness-v1.md`](https://github.com/jinjin1/prompt/blob/main/docs/designs/pm-harness-v1.md) (in web app repo)

## License

MIT. See [`LICENSE`](./LICENSE).
