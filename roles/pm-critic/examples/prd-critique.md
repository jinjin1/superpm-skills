# Critique — PRD for "Smart Reply" Feature

> Reviewing: PRD titled "Smart Reply — AI-Generated Quick Responses for
> Inbox Messages"
> Author: @pm-xyz
> Critique date: 2026-04-15
> Reviewer: pm-critic

---

## TL;DR

**The plan's load-bearing assumption — that our users want faster reply
drafts — is likely wrong.** Evidence points to a different Job (reply
quality, not speed). Ship this and you'll get adoption numbers without
retention.

## Premise challenge

The PRD opens with "users want to reply to messages faster." This is the
premise. Three issues:

1. **Evidence is thin.** The PRD cites "user survey shows 62% want faster
   replies." But:
   - Survey was an in-product toast with 2 options. Not a real preference
     elicitation.
   - The question was "would you like faster replies?" — a classic
     leading question. Users say yes.
   - No qualitative follow-up interviews.

2. **The Job might be different.** In the 3 support tickets attached to
   the PRD, users asked for "better replies, not faster". Two tickets
   mentioned:
   - "I need help writing the right tone, not saving 5 seconds"
   - "My replies sound robotic when I rush"
   - The PRD does not address these signals.

3. **Downstream proxy trap.** The North Star is "average reply time".
   This is a proxy metric (see Ethos rule #3). Users completing the
   underlying Job (landing an effective reply) may not be measured at
   all. You can ship this, move the metric, and make users worse off.

**Recommended action before proceeding**: `pm-researcher` runs 5 user
interviews specifically on reply-writing. Distinguish "users who want
speed" from "users who want quality assistance". This is a 1-week delay
with a 10-week risk reduction.

## Evidence check

| Claim | Source | Solid? |
|---|---|---|
| "Users want faster replies" | In-product survey, leading question | Weak |
| "62% engagement expected" | Benchmark from a different product | Weak — different Job, different users |
| "Engineering cost: 6 weeks" | Eng lead estimate | Solid, trust it |
| "No privacy blocker" | Legal memo 2026-03-05 | Solid |

The quantitative case is thin. The qualitative signal contradicts it.

## Scope check

### What would I cut

- **Voice tone selection**: adds 2 weeks of eng, not central to Job. Defer.
- **Multi-language reply generation**: premature — should prove English
  first, then decide on Korean / Japanese.
- **"Learn from my replies" adaptation**: impressive, but model fine-tuning
  adds legal / privacy complexity that the 6-week plan does not absorb.

### What's missing

- **NOT in scope section**: absent. Anything not mentioned is assumed
  in scope. Add it.
- **Guardrail metric**: only "reply time" is defined. Missing: does
  reply quality hold? Support tickets go up? Customer satisfaction score?
- **User segment**: "our users" is not a segment. Power users? New users?
  Paying customers? This affects the entire design.
- **Decision-maker**: not named. Who signs off on launch?

## Risk map

| Risk | Likelihood | Impact | Early warning | Mitigation |
|---|---|---|---|---|
| Users experience "robotic" replies, satisfaction drops | High | High | Tickets mentioning "sounds like AI" > 5/week | Delay launch until `pm-researcher` validates Job |
| Reply time moves but retention flat or drops | Medium | High | Week 2 retention unchanged vs. control | Add retention as a guardrail, pre-commit kill criterion |
| B2B customers disable the feature because "brand voice" concerns | Medium | Medium | First enterprise escalation within 30 days | Ship with opt-in, not default-on, for paying tier |
| Privacy concerns (training on user messages) | Low | Very High | Any press / social inquiry | Confirm no training; document clearly in FAQ |

## Pre-mortem

"It is 6 months from now. Smart Reply shipped. Adoption hit 45%. Reply
time dropped 40%. But retention fell 3pp over that period. Support
tickets complaining about 'generic replies' climbed. Power users
disabled the feature within 2 weeks of trying it. The team is asking
what went wrong."

**Root cause (5 Whys)**: We measured speed (proxy) instead of reply
effectiveness (Job). We shipped it. Users completed less of their actual
Job, even as the proxy metric improved.

## What I would do

1. **Delay 1 week.** Do not ship this PRD as-is.
2. `pm-researcher` runs 5 interviews: "walk me through the last time you
   wrote a hard reply" — surface the real Job.
3. Rewrite the PRD based on findings. If the Job is "speed", proceed as
   planned. If the Job is "quality / tone", redesign scope.
4. Add: NOT-in-scope section, retention + satisfaction guardrails, named
   decision-maker, kill criteria.
5. Re-critique in 1 week.

## What I would NOT do

- Ship this and hope the metric moves.
- Add "Smart Reply with tone options" as a compromise — that just doubles
  the scope.
- Rely on the in-product survey as primary evidence. Leading questions
  are not data.

---

**Reviewer notes**: Critique does not draft an alternative plan (that's
strategist's job). It names the load-bearing assumption (Job might be
different), pressure-tests evidence, cuts scope, maps risks, and says what
to do next. Direct tone, specific examples.
