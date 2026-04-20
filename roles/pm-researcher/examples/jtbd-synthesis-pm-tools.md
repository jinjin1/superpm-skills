# JTBD Synthesis — PM Tooling Research

> Research question: What Jobs are PMs hiring their current tooling to do,
> and where are tools failing them?
> Method: 5 semi-structured interviews, 45 min each
> Audience: PMs at B2B SaaS companies, 2-5 yrs experience (3 Korean
> B2B SaaS, 2 US SaaS)
> Dates: 2026-04-02 to 2026-04-10

## Top 3 Jobs surfaced

### Job 1 — Get the team unblocked in the next 2 hours

> **Frequency**: 5/5 mentioned. **Intensity**: high. **Under-served**: high.

**When** the eng lead flags a blocker 20 minutes before sprint planning,
**I want to** converge stakeholders around the smallest decision needed,
**so I can** keep the sprint on schedule without dragging 6 people into
an unplanned meeting.

Evidence:
- PM-A (B2B Korea, 4 yr): "I end up Slack-DMing three people at once,
  copying the same context. If I had one tool for 'get answer from these
  three people in next hour', I'd pay for it tomorrow." — 2026-04-04
- PM-C (B2B US, 3 yr): "Most of my week is not big decisions. It's 15
  small unblock decisions that together determine velocity." — 2026-04-07
- PM-E (B2B Korea, 5 yr): "Linear is for tickets. Slack is for noise.
  I want a 'decision thread' type surface." — 2026-04-10

Workarounds: all 5 used Slack DMs + ad-hoc threads. Two also used
Linear comments; three found them slow. None felt solved.

### Job 2 — Prove to execs that this sprint was worth the money

> **Frequency**: 4/5 mentioned. **Intensity**: high. **Under-served**: medium.

**When** a quarterly review approaches, **I want to** assemble a narrative
showing what we shipped, what it moved, and what we learned, **so I can**
defend the roadmap without re-doing a week of data archaeology.

Evidence:
- PM-A: "Every quarter I lose 3 days pulling launch data from 4 places.
  It's not hard, it's just tedious, and it's always last-minute." — 2026-04-04
- PM-B (B2C US, 2 yr): "The exec doesn't care about our process. They
  care about the number moved. I need that number linked to the feature
  in one glance." — 2026-04-05
- PM-D (B2B Korea, 3 yr): "We use Notion for roadmap, Amplitude for
  metrics, Slack for updates. The story lives in my head." — 2026-04-08

Workarounds: manual spreadsheets, screenshots from dashboards, Notion
databases. Nothing reliable.

### Job 3 — Learn what my peers know without a meeting

> **Frequency**: 3/5 mentioned. **Intensity**: medium. **Under-served**: high.

**When** I hit a familiar-seeming problem, **I want to** see how similar
PMs at other companies tackled it, **so I can** avoid reinventing and
move in a week instead of a quarter.

Evidence:
- PM-C: "Everyone's solving the same problems silently. I'd pay a lot for
  a way to see 'here's how 20 PMs at Series-B SaaS approach pricing
  changes' without scheduling coffee with each." — 2026-04-07
- PM-B: "Maven / Reforma / communities help, but they're one-size. I want
  pattern-matched to my specific situation." — 2026-04-05

Workarounds: Slack communities, Twitter, cold coffee outreach. All
high-effort and low-hit-rate.

## Jobs NOT prominent (that I expected)

- "Write better PRDs" — only 1/5 mentioned. PMs did not struggle with PRD
  writing per se; they struggled with getting input to write one, and
  with convincing execs after.
- "Prioritize backlog" — 2/5 mentioned. Half had stable prioritization
  frameworks. The other half said "prioritization is not my hard problem".

This is meaningful negative evidence — do not assume Jobs that users did
not raise.

## Patterns across segments

- Korean B2B PMs emphasized Job 1 (team unblocking) strongly — structural
  reason is flatter hierarchies + daily sync culture
- US B2B PMs emphasized Job 2 (exec narrative) and Job 3 (peer learning)
- All segments were dissatisfied with current Slack-centric workflow

## What this research does NOT tell us

- Willingness-to-pay for any of these Jobs (needs validation round)
- Whether these Jobs change as company size crosses 50 → 200 → 500 PMs
- How this looks for PM managers vs. IC PMs (all 5 were IC)

## Follow-up

1. Pair Job 1 with a quant funnel analysis: where do PM unblock conversations
   actually die? `pm-analyst`
2. Run 5 more interviews with **PM managers** (not IC) to check whether
   Jobs differ
3. Hand off to `pm-strategist` to decide whether to lead on Job 1 or Job 2
   (cannot serve both in v1)

---

**Reviewer notes**: Jobs are in the "when / want / so that" format. Each
Job has frequency + intensity + under-served ranking. Verbatim quotes with
user label + date. NOT-prominent section signals research rigor.
Researcher did not recommend a feature — that is strategist's job.
