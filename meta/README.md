# Meta Layer

**Memory and quality of the PM practice itself.**

Meta skills persist knowledge across sessions and audit the practice. They
are read-mostly — they capture what already happened rather than generating
new work.

For the taxonomy, see [`../ARCHITECTURE.md`](../ARCHITECTURE.md).

## Meta skills in this layer

| Skill | Status | Purpose |
|---|---|---|
| `pm-decision-log` | planned | Capture and maintain ADR-style records: decision, rationale, owner, date |
| `pm-learn` | planned | Record learnings about the team / product / market that future sessions should know |
| `pm-health` | planned | Audit PM practice: enough user research? decisions logged? scope creeping? |

## When to call Meta

- Any time a non-trivial decision is made → `pm-decision-log`
- Any time a surprising pattern is observed → `pm-learn`
- Quarterly or at end of a project → `pm-health`

## Memory surfaces

Each Meta skill writes to a specific location in the user's project:

- `pm-decision-log` → `decision-records/YYYY-MM-DD-<slug>.md`
- `pm-learn` → `~/.claude/projects/<project-slug>/memory/` (long-term
  cross-session memory)
- `pm-health` → `docs/pm-health/YYYY-MM-DD.md` (point-in-time audit)

## Meta vs Lifecycle

| | Meta | Lifecycle |
|---|---|---|
| Focus | knowledge & quality | project phase artifacts |
| Triggered by | events (decision made, pattern spotted) | time / phase |
| Output | persistent records | phase-specific docs |

## Inspiration

gstack has `/learn` (persistent learnings), `/health` (code quality audit),
`/checkpoint`. SuperPM's Meta is the PM-native analog — focused on PM
knowledge and practice quality.
