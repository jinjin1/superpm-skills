---
name: interview-season
description: |
  PM job-hunt preparation week. Orchestrates pm-coach → pm-writer →
  pm-critic to sharpen mock performance, craft application materials,
  and stress-test the pitch.
  Invoke when the user says "I'm interviewing for PM roles", "prep me
  for a PM interview", "run me through product sense", "review my resume",
  or "help me practice for {company}".
  Language: respond in the user's language.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - WebSearch
  - AskUserQuestion
---

# interview-season — PM job-hunt prep

Three-stage orchestration to get a PM interview-ready. Designed as a
one-week sprint, though users can run each stage independently if they
only need one.

## When to invoke

- Active PM job search
- Upcoming interview at a specific company
- Practicing for a promotion interview at the current company
- Want a structured study plan for PM skills in general

## When NOT to invoke

- Career advice unrelated to PM interviews — out of scope
- Compensation negotiation — this scenario is prep; negotiation is a
  separate skill (not in v1)
- Non-PM interviews — `pm-coach` is PM-specific

## Language mirroring

Mirror the user's input language.

## Role sequence

```
1. pm-coach     → diagnose current level + run mock rounds
      ↓ checkpoint: user has identified their ONE growth area
2. pm-writer    → resume / portfolio / cover letter / PRD samples
      ↓ checkpoint: application materials reflect the current level
3. pm-critic    → adversarial review of everything
      ↓ final output: interview-ready, with stress-tested artifacts
```

## Stage 1 — pm-coach (3-5 days intermittent)

Goal: diagnose level, run multiple mocks, identify ONE thing to improve.

Session pattern:
- **Session 1 (60 min)**: diagnosis — walk through past work, score rubric
  dimensions, identify level and gap
- **Sessions 2-4 (45 min each)**: mocks in the weakest area
  - Product sense (`pm-coach/references/product-sense-rubric.md`,
    `pm-coach/examples/product-sense-mock.md`)
  - Behavioral / STAR
  - Case / estimation (Fermi)
- **Session 5 (30 min)**: level confirmation mock, compare to session 1

Deliverables:
- Rubric scores across dimensions
- Verbatim feedback per mock
- ONE thing to work on before the real interview

**Checkpoint: "Are you at or above target-role level in all 5
dimensions?"** If any dimension is 2+ points below, extend Stage 1.

## Stage 2 — pm-writer (1-2 days)

Goal: application materials that reflect the level demonstrated in mocks.

Deliverables (only what the user needs):
- **Resume** — targeted to the role, with quantified outcomes
- **Portfolio / PRD samples** — 2-3 pieces of real work, cleaned up for
  public sharing
- **Cover letter** — company-specific, referencing the Job the company
  is trying to do (not the applicant's wishlist)
- **STAR stories written up** — 5-7 stories covering common behavioral
  prompts, each ≤ 150 words in STAR format

Uses: `pm-writer/references/1-pager-template.md` adapted for resume
structure.

**Checkpoint: "Does the resume make the reader want to call you?"** If
no, iterate — most resumes are boring because they describe activity not
outcome.

## Stage 3 — pm-critic (1 day)

Goal: adversarial review of everything from Stages 1 and 2.

Targets:
- Resume: would a hiring manager call you based on this? What's weak?
- PRD samples: would you ship this at the target level? What's thin?
- STAR stories: do they actually show the skill claimed, or is it vague?
- Mock recordings (if available): where does the PM stumble repeatedly?

Uses: `pm-critic/examples/prd-critique.md` adapted for career artifacts.

**Final output**: a ranked list of "what must improve before the real
interview" — top 3 items with specific actions.

## Between-role handoffs

| From → To | Handoff contents |
|---|---|
| coach → writer | Level diagnosis + strengths to emphasize + gaps to downplay (until closed) |
| writer → critic | Final artifact drafts for attack review |
| critic → user | Ranked "fix these before interview" list |

## Quality bar

- [ ] Stage 1: at least 3 mocks run, not one
- [ ] Stage 1: ONE specific growth area identified, not "work on
      everything"
- [ ] Stage 2: every resume / portfolio claim is backed by a quantified
      outcome
- [ ] Stage 2: STAR stories name actions (what YOU did), not team actions
- [ ] Stage 3: critique is specific with verbatim examples, not vibes

## Failure signals

- Running mocks without diagnosing level first → feedback misses
- Resume with activities instead of outcomes ("led the team") → rewrite
  with numbers ("shipped X to Y users, moved Z metric by N%")
- STAR stories that describe team work without your specific action →
  rewrite in first person, specific contribution
- Critic pass that is vague ("be more confident") → redo with specific
  observations

## Handoff

- Interview confirmed → run Stage 1 again one day before, for fresh
  calibration
- Post-interview → debrief in `pm-coach` next session; persist patterns
  in `pm-learn`
- Offer received → out of scope, recommend the user's own mentor or
  network

## Legacy compatibility

The `/recipes/pm-interview-prep` URL on the SuperPM web app maps to this
scenario via 301 redirect.
