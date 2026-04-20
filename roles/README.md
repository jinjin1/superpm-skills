# Roles Layer

**Who is the agent pretending to be?**

A Role is a PM persona covering a cluster of responsibilities. The same
input produces different output depending on which Role you called.

For the taxonomy and when to call a Role vs. a Scenario, see
[`../ARCHITECTURE.md`](../ARCHITECTURE.md).

## Roles in this layer

| Role | Status | Covers |
|---|---|---|
| `pm-writer` | ✅ shipped | PRD, 1-pager, RFC, launch notes, postmortem, decision memo |
| `pm-strategist` | ✅ shipped | Market, competitive, positioning, OKRs, pivot calls |
| `pm-researcher` | ✅ shipped | Interview design, JTBD, synthesis, personas, usability |
| `pm-analyst` | ✅ shipped | Funnels, retention, cohorts, experiment design, metrics |
| `pm-critic` | ✅ shipped | Premise challenge, scope cuts, risk map, CEO-mode review |
| `pm-communicator` | ✅ shipped | Exec updates, stakeholder alignment, customer escalations, internal FAQs |
| `pm-operator` | ✅ shipped | Launch, crisis response, deploy coordination, incident retros |
| `pm-coach` | ✅ shipped | PM interview prep, career feedback, skill diagnosis |

All 8 Roles are now complete as of 2026-04-20.

## When to call a Role

- "I need a strategist's take on this market"
- "Draft a postmortem from this incident log"
- "Have a researcher design interview questions for this JTBD"

## When NOT to call a Role

- If the situation spans multiple perspectives in sequence, invoke a
  **Scenario** instead (see `../scenarios/`).
- If you want to shape the session's behavior (tone, format, language),
  pair the Role with a **Mode** (see `../modes/`).
- If the Role needs a utility function (browsing, note-taking, metric
  lookup), the Role will invoke a **Tool** (see `../tools/`).
- For adversarial review of a Role's output, use the **Adversarial** layer
  (`../adversarial/`).

## Role composition examples

```
# Writing a PRD
pm-researcher  →  pm-strategist  →  pm-writer  →  pm-critic

# Pricing change proposal
pm-strategist  +  pm-researcher  +  pm-analyst  (parallel)
                       ↓
                   pm-writer (1-pager)
                       ↓
                   pm-communicator (exec message)

# Incident response
pm-operator  →  pm-communicator (real-time) → pm-writer (postmortem)
```

## Role skill structure

Each Role directory contains:

```
<role-name>/
├── SKILL.md                # the role definition (frontmatter + playbook)
├── references/             # templates and reference docs the role reads
└── examples/               # worked examples for pattern study
```

Current state of references and examples:

- `pm-writer/` — exemplar with 3 references + 2 examples
- `pm-researcher/` — interview guide reference
- `pm-analyst/` — experiment design reference
- `pm-communicator/` — exec update reference
- Other roles (`pm-strategist`, `pm-critic`, `pm-operator`, `pm-coach`) —
  SKILL.md shipped, references and examples to be filled in Phase 1b

## Phase status

- Phase 0 (exemplar): ✅ pm-writer with full references + examples
- Phase 1 (remaining 7 SKILL.md): ✅ 2026-04-20
- Phase 1b (references + examples for the other 7): in progress
- Phase 2+: Scenarios, Tools, Lifecycle, Modes, Adversarial, Meta,
  Orchestration layers
