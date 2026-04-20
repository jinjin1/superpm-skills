# Experiment Design Template

> Experiment name: {short, unique}
> Owner: {@owner}
> Designer: {@pm-analyst}
> Review by: {@pm-critic} on {date}

---

## Hypothesis

One sentence, testable, falsifiable. Format:
> "If {we do X}, then {metric Y will change by at least Z%} because {causal reason}."

Bad: "Making the button red will improve conversion."
Good: "If we change the signup CTA color from grey to black, then Day-0
signup conversion will increase by at least 2 percentage points because
higher contrast reduces missed CTA clicks on mobile."

## Primary metric

- **Metric name**: {exact name in the analytics system}
- **Definition**: {one sentence}
- **Baseline**: {current value + time window + variance}
- **Why this metric**: {what Job completion does this prove}
- **Direction**: {up = better}

## Guardrail metrics (2-3)

Metrics that must NOT degrade.

| Metric | Threshold | Rationale |
|---|---|---|
| {metric A} | must not drop > X% | {why} |
| {metric B} | must not drop > Y% | {why} |

## Minimum detectable effect (MDE)

What's the smallest lift we'd care about?

- **MDE**: {e.g., +2pp on a 15% baseline}
- **Why this level**: {e.g., product investment threshold, smaller lift doesn't justify}

## Sample size + duration

Using the MDE, baseline variance, and target power (typically 80%) /
significance (typically α=0.05):

- **Sample per variant**: {N}
- **Total sample**: {N × variants}
- **Current traffic**: {users / day through this surface}
- **Duration**: {days or weeks to reach sample}

If duration > 4 weeks, the experiment is suspicious. Either the effect is
too small to justify, or the surface is too low-traffic for a valid test.

## Randomization

- **Unit of randomization**: {user / session / team / account}
- **Stratification**: {if any — e.g., stratify by prior engagement}
- **Exclusions**: {e.g., test users, internal traffic, users in other tests}

## Variants

```
Control (A): {what users see today}
Treatment (B): {the change}
  - Behavior difference: {specific, bullet list}
  - Copy / visual change: {link to spec}
```

For multi-arm tests, list A/B/C/D with clear contrast logic.

## Exit criteria (stop early)

- **Primary metric hits threshold**: {e.g., 95% probability of being
  above 0% after N days — sequential testing}
- **Guardrail violation**: {any guardrail drops beyond threshold → stop}
- **Bug detected**: {stop, fix, restart}
- **Time cap**: {if running beyond X weeks with no signal, stop}

## Pre-registered analysis plan

Before the experiment runs:

1. Primary analysis: {method — e.g., two-tailed t-test on metric per user}
2. Secondary analyses: {list any, with rationale}
3. Segment breakdowns planned: {e.g., new vs. returning, mobile vs. desktop}
4. What we WON'T do: {post-hoc slicing to find a win — explicitly disallow}

Pre-registration prevents p-hacking.

## Gotchas (review each)

- [ ] Novelty effect — will the lift fade after users habituate?
- [ ] Learning effect — users may behave differently once used to the change
- [ ] Network effects — does treatment interact with control? (e.g., chat features)
- [ ] Cross-test pollution — other experiments running on same surface?
- [ ] Seasonality — is the time window stable?
- [ ] Power user skew — will a few heavy users dominate the average?

## Decision framework (post-experiment)

Before running, write down:
- **Ship if**: {primary metric lifts >= X AND all guardrails hold}
- **Iterate if**: {primary lifts but < X, OR mixed guardrails}
- **Kill if**: {no primary lift after full run OR guardrail violation}
- **Extend if**: {inconclusive but trend promising — cap at {N} more days}

## Reviewer checklist

Before the experiment starts:
- [ ] Hypothesis is falsifiable (a specific result would disprove it)
- [ ] Primary metric is Job-completion, not proxy
- [ ] Sample size calculation shown
- [ ] Pre-registered analysis plan written
- [ ] Gotchas reviewed
- [ ] Decision framework pre-committed
- [ ] Invoked `pm-critic` for adversarial review? Recommended for
  P0/P1 experiments.
