# Tools Layer

**Utilities shared across Roles.**

Tools are small, focused skills that Roles invoke so each Role does not
reinvent common utilities (browsing, note-taking, metric lookup, archive
search).

For the taxonomy, see [`../ARCHITECTURE.md`](../ARCHITECTURE.md).

## Tools in this layer

| Tool | Status | Purpose |
|---|---|---|
| `pm-browse` | planned | Inspect external sites — competitor pages, App Store reviews, Reddit, industry reports, docs |
| `pm-notes` | planned | Capture raw interview / meeting notes and synthesize into themes + representative quotes |
| `pm-metrics-lookup` | planned | Ask 2-3 questions about the problem, suggest the right metric and where it lives |
| `pm-archive-search` | planned | Find relevant past PRDs, decisions, retros in the user's project repo |

## When to call a Tool

Two ways:

1. **Directly**, as a standalone utility:
   - "pm-browse these three App Store listings and tell me what users complain about"
   - "pm-notes — here are my interview notes, synthesize them"

2. **Indirectly**, inside a Role's workflow:
   - `pm-researcher` invokes `pm-notes` during interview synthesis
   - `pm-strategist` invokes `pm-browse` to scan competitor sites
   - `pm-writer` invokes `pm-archive-search` to find similar past PRDs
   - `pm-analyst` invokes `pm-metrics-lookup` when a metric name is unclear

## Tool vs Role

| | Tool | Role |
|---|---|---|
| Scope | one narrow utility | full PM persona |
| Stateful | typically no | yes — builds context over a session |
| Language | mirror user input | mirror user input |
| Output | structured (notes, URLs, metric names) | prose, documents |

## Inspiration

gstack has `/browse`, `/connect-chrome`, `/setup-browser-cookies`,
`/design-shotgun`, `/design-html`. SuperPM's Tools are the PM-native analog.
