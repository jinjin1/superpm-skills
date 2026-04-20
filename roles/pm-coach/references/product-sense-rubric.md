# Product Sense Rubric

Score a PM's response to a product sense question across five dimensions.
Each dimension is scored 1-5 with specific evidence from what they said.

> Use verbatim quotes. Vague feedback helps no one.

---

## Scoring dimensions

### 1. User empathy (1-5)

- **1**: Talks about features before users. "I'd add a search bar."
- **2**: Names a vague user. "Power users would like this."
- **3**: Names a specific segment with a behavior. "New signups in week 1."
- **4**: Describes the user's Job, not just demographic. "When a new PM
  joins a company, they want to find standards quickly so they don't
  look lost."
- **5**: Distinguishes segments, describes struggle + workaround, anchors
  in a recent concrete situation.

### 2. Structure (1-5)

- **1**: No visible structure. Jumps between ideas.
- **2**: Linear but disorganized. "First I'd do X, then Y, then Z."
- **3**: Uses a frame (JTBD, funnel, pyramid) but applies mechanically.
- **4**: Uses a frame and cites why — "I'm using a funnel because the
  problem is retention-shaped, not acquisition-shaped."
- **5**: Invents a frame that fits the problem better than off-the-shelf,
  or explicitly rejects a standard frame with reason.

### 3. Prioritization (1-5)

- **1**: Lists features equally, no sequencing.
- **2**: Names "P0 / P1 / P2" but reasoning unclear.
- **3**: Explains "most important because X". Reasoning present.
- **4**: Names trade-offs: "I'd do A over B because A helps Job 1, B only
  helps Job 2, and Job 1 affects more users."
- **5**: Explicitly NOT-in-scope items with reasoning. "I would NOT do X
  even though it looks tempting because..."

### 4. Metric awareness (1-5)

- **1**: No metric mentioned.
- **2**: Names a proxy metric. "MAU would go up."
- **3**: Names a reasonable outcome metric. "Week-1 retention."
- **4**: Names a primary metric AND a guardrail. "Retention up, without
  support ticket volume increasing."
- **5**: Calls out what the metric does NOT tell us. "This metric won't
  catch {specific failure mode}; I'd pair it with qualitative."

### 5. Communication (1-5)

- **1**: Rambles. Interviewer has to ask for summary.
- **2**: Complete sentences, but hard to follow the argument.
- **3**: Clear structure, stays on topic.
- **4**: Confident, concise. Uses pauses. Redirects self when going off-path.
- **5**: Leads the conversation. Pauses at decision points for interviewer
  input. Summarizes recommendation at the end unprompted.

---

## Level bands

Rough guidance — calibrate per company and role:

| Total | Level band | Typical interpretation |
|---|---|---|
| 18-25 | L6+ / Staff+ | Senior-staff-level product sense |
| 14-17 | L5 / Senior | At-level for senior PM |
| 10-13 | L4 / Mid | At-level for L4; stretch for senior |
| 5-9 | L3 / New | Entry PM; building fundamentals |
| <5 | Below bar | Needs substantial preparation |

## Feedback format

When giving feedback to the PM, structure:

```
STRENGTHS (2-3, verbatim)
- "You said X — that was strong because Y."

AT-LEVEL (1-2)
- "Your {dimension} was at level; you did X correctly."

BELOW-LEVEL (1-2, verbatim)
- "When you said 'we should add search', that was L3 because you jumped
  to a feature before the Job. An L5 answer names the Job first."

ONE THING TO WORK ON NEXT
- {specific exercise, e.g., "practice naming the Job before a feature for
  the next 3 mocks"}
```

## Anti-patterns

- Total score without dimension detail → un-actionable
- "Be more structured" → specify which dimension and how
- No verbatim quotes → PM cannot map feedback to their own words
- Scores not calibrated → compare across multiple mocks to calibrate
