# Roles Layer

**Who is the agent pretending to be?**

A Role is a PM persona covering a cluster of responsibilities. The same
input produces different output depending on which Role you called.

For the taxonomy and when to call a Role vs. a Scenario, see
[`../ARCHITECTURE.md`](../ARCHITECTURE.md).

## Roles in this layer

| Role | Status | Covers |
|---|---|---|
| `pm-writer` | ✅ shipped (exemplar) | PRD, 1-pager, RFC, launch notes, postmortem, decision memo |
| `pm-strategist` | planned | Market, competitive, positioning, OKRs, pivot calls |
| `pm-researcher` | planned | Interview design, JTBD, synthesis, personas, usability |
| `pm-analyst` | planned | Funnels, retention, cohorts, experiment design, metrics |
| `pm-critic` | planned | Premise challenge, scope cuts, risk map, CEO-mode review |
| `pm-communicator` | planned | Exec updates, stakeholder alignment, customer escalations, internal FAQs |
| `pm-operator` | planned | Launch, crisis response, deploy coordination, incident retros |
| `pm-coach` | planned | PM interview prep, career feedback, skill diagnosis |

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

## Role skill structure

Each Role directory contains:

```
<role-name>/
├── SKILL.md                # the role definition (frontmatter + playbook)
├── references/             # templates and reference docs the role reads
└── examples/               # worked examples for pattern study
```

See `pm-writer/` for the exemplar implementing this structure.
