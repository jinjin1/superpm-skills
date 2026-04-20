# SuperPM Architecture

This document explains **how** SuperPM Skills are organized and **why** the
architecture has eight layers instead of one flat list.

If you just want to install and use, see [`README.md`](./README.md).

---

## The core idea

PM work is not a single job. On a given week, the same PM writes a PRD,
interviews users, cuts scope, unblocks a launch, and talks a customer off a
ledge. These are fundamentally different modes of thinking.

SuperPM Skills splits that work along eight dimensions. Each dimension is
its own layer. You can invoke one skill at a time, or compose multiple
layers together to attack a situation from several angles.

```
Roles          — whose perspective is the agent taking?
Scenarios      — what situation am I in right now?
Tools          — what utility helps every Role do their work?
Lifecycle      — what phase of the project am I in?
Modes          — what behavior constraint should the session follow?
Adversarial    — who is deliberately pushing back on my thinking?
Meta           — what does the team/product remember from last time?
Orchestration  — how do I run many Roles in sequence?
```

---

## Layer 1 — Roles (8 skills)

**Identity.** Who is the agent pretending to be?

Each Role is a PM persona covering a cluster of responsibilities. Same input
produces different output depending on which Role you called.

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

**When to call a Role:** "I need a strategist's take on this market" or
"draft a postmortem from this incident log."

**When NOT to call a Role:** if the situation is multi-step and spans several
perspectives, use a Scenario instead.

---

## Layer 2 — Scenarios (8 skills)

**Situation.** What am I in the middle of?

A Scenario orchestrates multiple Roles in a deliberate sequence for a
recurring situation.

| Scenario | Roles called |
|---|---|
| `launch-week` | strategist → writer → communicator → operator |
| `discovery-sprint` | researcher → strategist → analyst |
| `growth-pause` | analyst → researcher → strategist |
| `quarterly-cycle` | strategist → analyst → communicator |
| `crisis-mode` | operator → communicator → critic |
| `interview-season` | coach → writer → critic |
| `new-role-onboarding` | writer → communicator → strategist |
| `board-prep` | strategist → analyst → writer → communicator |

**When to call a Scenario:** "we're launching next week" or "growth is
stalling and I need a diagnostic session."

---

## Layer 3 — Tools (4 skills)

**Utilities.** Things every Role uses, pulled out so no Role reinvents them.

| Tool | Purpose |
|---|---|
| `pm-browse` | Look at external sites — competitor pages, App Store reviews, Reddit, industry reports |
| `pm-notes` | Capture raw interview/meeting notes and synthesize into themes + representative quotes |
| `pm-metrics-lookup` | Ask 2-3 questions about the problem, suggest the right metric and where it lives |
| `pm-archive-search` | Find relevant past PRDs, decisions, retros in the user's project |

**When to call a Tool:** by name, during any Role or Scenario. Or standalone:
"pm-browse these three App Store listings and tell me what users complain about."

---

## Layer 4 — Lifecycle Rituals (4 skills)

**Phase.** What stage is the project in?

Each ritual is a structured pass that produces a specific artifact.

| Ritual | When |
|---|---|
| `pm-kickoff` | Day 1. Produces stakeholder map, success metrics, timeline, RACI |
| `pm-checkpoint` | Mid-project. State dump: shipped, remaining, blocked, learned |
| `pm-retro` | End of sprint / project. What went well, what didn't, action items |
| `pm-handoff` | Transferring PM work to another PM. Context + decisions + open questions |

**When to call Lifecycle:** at the beginning, middle, or end of a project
phase. These are "rituals" because you should run them on a schedule, not
only when remembered.

---

## Layer 5 — Modes (4 skills)

**Constraint.** What behavior do I want the session to follow, beyond any
specific Role?

| Mode | Effect |
|---|---|
| `kr-pm-mode` | Korean PM context: Korean response, KST, two-week sprints, quarterly OKRs, Korean B2B conventions |
| `exec-mode` | Every response in exec 1-pager format: numbers first, bullets, no prose blocks over 3 lines |
| `focus-mode` | No scope debate, no alternative proposals. Execute the task as given |
| `discovery-mode` | Challenge every assumption first. Ask "why" before any answer |

**When to call a Mode:** at session start or mid-session to shift the whole
behavior, independent of which Role responds.

**Modes compose:** `kr-pm-mode` + `exec-mode` = "Korean-language exec
1-pagers for the rest of this session."

---

## Layer 6 — Adversarial (3 skills)

**Challenge.** Deliberately push back on the user or on another skill's output.

| Skill | Posture |
|---|---|
| `pm-red-team` | Steelman the opposing view. Strongest case against the proposal |
| `pm-ruthless-cut` | Everything in scope must justify keeping. Default is "cut" |
| `pm-second-opinion` | Simulate an external PM reviewing the artifact cold, without internal context |

**When to call Adversarial:** after a Role has produced output, before
you commit. Run `pm-writer` to draft a PRD, then `pm-red-team` to challenge
it, then iterate.

**Inspired by:** gstack's `/codex` and `/cso` roles that give a second
independent read.

---

## Layer 7 — Meta (3 skills)

**Memory and quality of the practice itself.**

| Skill | Purpose |
|---|---|
| `pm-decision-log` | Capture and maintain ADR-style records: what we decided, why, by whom, when |
| `pm-learn` | Record learnings about the team, product, or market that future sessions should remember |
| `pm-health` | Audit the PM practice: "are we doing enough user research? Are decisions logged? Is scope creeping?" |

**When to call Meta:** quarterly for pm-health, ad-hoc for pm-decision-log
and pm-learn whenever something worth remembering happens.

**Inspired by:** gstack's `/learn`, `/health`, `/retro`.

---

## Layer 8 — Orchestration (1 skill)

**Full-run.** Run multiple Roles in sequence automatically, checkpoint for
approval between each.

| Skill | What it does |
|---|---|
| `pm-autorun` | For a given proposal, runs strategist → researcher → analyst → writer → critic in sequence. Pauses for user approval after each. One command, fully reviewed output. |

**When to call Orchestration:** when you have a proposal and you know you'd
want multiple perspectives on it but don't want to invoke each Role
manually.

**Inspired by:** gstack's `/autoplan`.

---

## How they compose

### Example 1 — Drafting a PRD for a new feature

```
1. pm-kickoff                 (lifecycle: establish stakeholders + success metric)
2. discovery-sprint           (scenario: researcher → strategist → analyst)
3. pm-archive-search          (tool: find similar past PRDs for reference)
4. pm-writer                  (role: draft the PRD)
5. pm-red-team                (adversarial: challenge the PRD)
6. pm-ruthless-cut            (adversarial: scope check)
7. pm-decision-log            (meta: record the approval / rejection)
```

### Example 2 — Korean exec brief for a pricing change

```
1. kr-pm-mode + exec-mode     (modes: Korean response in exec 1-pager format)
2. pm-strategist              (role: analyze the pricing call)
3. pm-writer                  (role: write the 1-pager)
4. pm-second-opinion          (adversarial: external PM reviews it)
5. pm-communicator            (role: draft the internal message)
```

### Example 3 — Crisis

```
1. crisis-mode                (scenario: operator → communicator → critic)
2. pm-notes                   (tool: capture war-room notes in real time)
3. pm-decision-log            (meta: record every call made)
4. pm-retro                   (lifecycle: after recovery, run the retro)
5. pm-writer                  (role: postmortem from the retro)
```

---

## Directory layout

```
superpm-skills/
├── README.md
├── ETHOS.md
├── ARCHITECTURE.md          (this file)
├── LICENSE
├── setup.sh
├── roles/             (8 — who)
├── scenarios/         (8 — when)
├── tools/             (4 — utilities)
├── lifecycle/         (4 — phase)
├── modes/             (4 — constraint)
├── adversarial/       (3 — challenge)
├── meta/              (3 — memory)
└── orchestration/     (1 — full-run)
```

Each layer directory has its own `README.md` that lists the skills in that
layer and when to invoke them.

---

## Design principles

1. **A Role should never do another layer's job.** If `pm-writer` is
   capturing interview notes, it should invoke `pm-notes`, not do it inline.
   Keeps each skill focused and reusable.

2. **Modes do not replace Roles.** `exec-mode` shapes how any Role responds,
   but it does not "do" PM work on its own. Always pair with a Role or
   Scenario.

3. **Adversarial runs AFTER a primary skill, not in place of it.** You draft
   a PRD first (`pm-writer`), then challenge it (`pm-red-team`). Reversing
   the order produces noise.

4. **Meta is read-mostly.** `pm-decision-log` captures, `pm-learn` captures,
   `pm-health` reads. These skills should rarely generate new work; they
   preserve and reflect on work already done.

5. **Orchestration is a convenience, not a requirement.** `pm-autorun`
   exists because some users don't want to call five Roles by hand. Power
   users invoke each Role with surgical precision.

---

## Reference

- Inspired by gstack's multi-layer architecture:
  https://github.com/garrytan/gstack/blob/main/ARCHITECTURE.md
- Strategy doc:
  https://github.com/jinjin1/prompt/blob/main/docs/designs/pm-harness-v1.md
