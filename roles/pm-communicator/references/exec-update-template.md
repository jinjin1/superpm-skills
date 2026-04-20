# Exec Update — Weekly Template

> To: {exec name / role}
> From: {@PM}
> Week of: {YYYY-MM-DD}
> Status: {Green / Yellow / Red}

---

## TL;DR

- **Win**: {biggest win this week, one line, with a number}
- **Concern**: {biggest risk or lowlight, one line}
- **Ask**: {what you need from the exec, with a deadline — or "no asks" if honest}

## Metrics (this week vs. last)

| Metric | This week | Last week | Trend | Note |
|---|---|---|---|---|
| {North Star} | X | Y | ↑↓→ | {why} |
| {Guardrail 1} | X | Y | ↑↓→ | {why} |
| {Guardrail 2} | X | Y | ↑↓→ | {why} |

Status rule:
- **Green**: on track, no intervention needed
- **Yellow**: at risk, you're managing it
- **Red**: off track, you need help

Never lie with Green. An exec who finds out a Green should have been Red
loses trust permanently.

## Shipped this week

- {one-line item} — {link to PR / doc / metric}
- {one-line item} — ...

## Shipping next week

- {one-line item} — {owner, expected date}
- ...

## Lowlights

Things that went wrong or are going wrong. Be specific and forward-looking.
Not: "sprint was challenging". Yes: "migration rollout stalled on Tuesday
due to {X}; mitigation is {Y}, owner {@person}, resolution by {date}".

## Asks

| Ask | From | By | Why |
|---|---|---|---|
| {specific request} | {person} | {date} | {consequence if delayed} |

If no asks, write "No asks this week." Do not fabricate asks to fill
space. And do not bury a real ask in prose.

---

## Writing rules

1. **3 lines max in TL;DR.** An exec reads the TL;DR. Assume nothing else
   gets read.
2. **Numbers before reasoning.** "Retention +2pp" beats "retention improved".
3. **Parallel bullet structure.** Don't mix full sentences with fragments.
4. **No AI-slop.** Ban: "thrilled to share", "we are excited", "leverage
   our capabilities", "at a high level". Just say what happened.
5. **Every ask has a deadline and a consequence of delay.** "Approval needed
   by 5/10 — without it, launch slips to 5/17."

## Anti-patterns

- Burying bad news in paragraph 3 → move to TL;DR
- "Status: Green" when it's not → always hurts more than honest Yellow
- Listing every completed task → execs read outcomes, not activity
- "Here are 12 metrics" → pick the North Star + 2 guardrails, that's it
- Vague asks ("need more resources") → must be specific (what, by when, from whom)

## When to deviate from the template

- **Crisis / incident**: use `pm-communicator` crisis format instead
- **Monthly / quarterly**: extend to include trends over 4+ weeks, OKR status
- **Board update**: expand but keep the 1-pager discipline; the board reads
  even less than execs
