# Product Sense Mock — "Design a Calendar for Doctors"

> Mock type: Product sense, 35 minutes
> PM interviewed: 3-year IC PM at consumer app, targeting Sr PM at health
> tech
> Coach: pm-coach
> Date: 2026-04-18

---

## Question posed

"You're the PM for a new product at a health-tech company. Design a
calendar product for doctors. You have 35 minutes."

## Transcript (abbreviated)

**Coach**: Take your time. I'll let you run.

**PM (0:00-1:30)**: OK. So, first I'd clarify — what kind of doctor?
Because a GP's schedule looks nothing like an ER doctor's, or a surgeon's.
Let me assume solo-practice GPs for now — they schedule most of their
own work, and they're under-served by existing tools.

**Coach (internal)**: Good — clarifying questions first. ★★ for
segmentation instinct.

**PM (1:30-6:00)**: So the GP's Job — I think it's something like: "When
my week starts, I want to see which patients need follow-up, which
appointments are booked, and where I have gaps, so I can plan my clinical
time AND my admin time." The existing tools — like Google Calendar or
even EHRs — show bookings, but they don't layer in the clinical context.

Three segments within GPs: solo practice, small clinic, hospital
employed. Let me start with solo practice — that's where calendar is most
painful and there's real budget.

**Coach (internal)**: ★★★ — JTBD articulated with "so that" clause.
Segmented with rationale.

**PM (6:00-14:00)**: Key features for v1... let me think about
prioritization.

Priority 1: layered view — calendar bookings + patient notes + lab
follow-ups in one place. This is the "central pane" Job.

Priority 2: automated gap detection — "you have 30 min Wednesday, 2
patients are overdue for follow-up." This is the "make me better at my
job" Job.

Priority 3: patient-facing booking — let patients self-book into real
availability, not just fake slots. Less urgent because they already
have Calendly-like tools.

**Coach**: What would you NOT do?

**PM (14:00-17:00)**: I would NOT build billing integration or EHR
integration in v1. Tempting because doctors ask for it, but (a) EHR
integrations take 6+ months of vendor dance, (b) billing is a different
Job owned by a different person in the clinic, and (c) doing them poorly
is worse than not doing them.

I'd also skip mobile app in v1 — make it excellent on desktop first.
Doctors plan at desktops; they execute at bedside. Different Jobs.

**Coach (internal)**: ★★★★ — explicit NOT-in-scope with reasoning per
item. Rare at this level.

**PM (17:00-25:00)**: Success metric... let me think carefully here.
Not "minutes saved per week" — that's a proxy. The real Job is "did the
GP provide better care AND feel less overwhelmed?" Hard to measure
directly.

Proxy I'd use: % of patient follow-ups that happen within the clinical
window (standard is 48h for urgent, 2 weeks for routine). This is a
Job-completion signal — we made care more timely.

Guardrails: GP burnout survey (quarterly, qualitative) and patient
satisfaction scores from the clinic.

**Coach**: What could this metric miss?

**PM (25:00-29:00)**: It could miss... it could improve without the GP
feeling better. A GP might hit the 48h follow-up window because the tool
nags them, but feel more stressed because they're squeezed. The metric
goes up, the Job goes down. So the burnout survey is load-bearing — can't
drop it.

Also — could improve in aggregate but hurt complex patients who need
more time per visit. Would want to segment by patient complexity.

**Coach (internal)**: ★★★★★ — calls out the proxy-metric trap
unprompted. This is senior+ thinking.

**PM (29:00-33:00)**: Wrap-up. Summary:
- For solo-practice GPs
- Job: see bookings + clinical context + gaps in one view to plan
  clinical AND admin time
- v1: layered calendar view, gap + follow-up detection
- NOT v1: billing, EHR integration, mobile, multi-practice
- Primary metric: % follow-ups in clinical window
- Guardrail: GP burnout + patient complexity breakdown

Open questions: How do we get to 20 beta GPs? What does pricing look like
when doctors are the buyer but clinics the payer in some cases? I'd want
to talk to 10 GPs before any build.

**Coach**: Time's up. Thank you.

---

## Rubric scoring

| Dimension | Score | Evidence |
|---|---|---|
| User empathy | 5/5 | Segmented GPs → picked solo practice with rationale. Named specific Job with "so that" clause. Distinguished "plan at desktop vs. execute at bedside". |
| Structure | 4/5 | Clear flow, used JTBD framework, explicit NOT-in-scope. Did not invent a novel frame (would be 5), but applied standard frames well. |
| Prioritization | 5/5 | Named priorities with reasoning. Explicit NOT-in-scope with per-item rationale. "Doing them poorly is worse than not doing them" is senior-level judgment. |
| Metric awareness | 5/5 | Rejected "minutes saved" as proxy. Named a Job-completion primary (follow-up timeliness). Unprompted guardrail (burnout survey) + called out complex-patient segmentation. Proxy-metric trap identified without prompting. |
| Communication | 4/5 | Stayed on time, structured summary, named open questions. Occasional filler ("let me think about this"); not critical but noticeable. 5/5 would lead the conversation more decisively. |

**Total: 23/25** → **Senior+ / Staff PM territory.**

## Feedback to the PM

**Strengths (verbatim)**:
- "When you said 'doing them poorly is worse than not doing them' for
  billing and EHR — that was Staff-level judgment. You named a structural
  reason to say no, not just 'we don't have time'."
- "Calling out the proxy-metric trap on your own metric, without me
  asking — rare at your level. That instinct will make you dangerous."

**At-level**:
- Segmentation instinct, JTBD articulation, NOT-in-scope discipline. All
  at or above senior bar.

**Below-level (verbatim)**:
- "You said 'let me think about this' three times before the metric
  discussion. At Staff level, interviewers expect you to think aloud
  with structure — not pause to think silently. Practice walking me
  through your thought process as it's forming."

**One thing to work on next**:
- **Lead the conversation more actively**. At 14:00, I had to prompt
  "what would you NOT do?" — a Staff candidate would volunteer this
  without being asked. Practice checking in: "before I continue, does
  my framing make sense, or should I adjust?"

Recommend 3 more mocks focused on **actively leading the interviewer**.

## Handoff

- Next session: book another mock focused on Fermi estimation (weakest
  signal in this mock, untested)
- Track growth in `pm-learn` (meta layer): strength = NOT-in-scope
  discipline; gap = leading the conversation

---

**Reviewer notes**: Verbatim quotes. Specific dimension scoring. Strengths
and below-level both concrete, not general. One actionable next step, not
a laundry list.
