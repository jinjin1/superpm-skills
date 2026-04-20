# Funnel Drop Diagnosis — Signup Conversion Stall

> Question: "Signup conversion dropped from 42% to 31% over the last 4
> weeks. What's going on?"
> Decision target: ship / kill the new signup experiment, currently at
> 50% traffic
> Time window: 2026-03-22 to 2026-04-18 (4 weeks)
> Segment: new visitors, desktop + mobile combined

## Funnel breakdown

| Step | 4 wk ago | This week | Δ | Notes |
|---|---|---|---|---|
| Landing page view | 100% (baseline) | 100% | — | — |
| Click "Sign up" CTA | 68% | 65% | -3pp | mild drop, within noise |
| Email entry | 62% | 59% | -3pp | consistent with CTA drop |
| Email verification click | 55% | 42% | -13pp | **biggest drop** |
| First action in-product | 42% | 31% | -11pp | downstream of verification |

## Biggest drop: email verification

The -13pp drop at the email verification click (between email entry and
clicking the verification link in their inbox) accounts for nearly the
entire funnel decline. Everything downstream moves proportionally.

## Top 3 hypotheses (ranked by likelihood × testability)

### H1 — Email deliverability degraded (high likelihood)

**Evidence**: The experiment launched 2026-03-24 included a sender
domain change from `noreply@superpm.app` to `welcome@superpm.app`.
Domain-reputation for `welcome@` is unknown.

**How to test (24 hours)**:
- Pull bounce / spam rates from the email provider for both domains
- Compare inbox-placement data (if available)
- Cohort-split by email provider (Gmail vs. corporate mail vs. Naver)

**Expected signal**: Gmail / corporate mail verification rate stable,
Naver + Daum drops disproportionately if Korean mail providers treat the
new sender domain as suspicious.

### H2 — Email content change (medium likelihood)

**Evidence**: The experiment also shortened the verification email from
3 paragraphs to 1 sentence + button. Users may be mistaking the brief
email for spam/phishing.

**How to test (2 days)**:
- A/A test the new email template vs. the old template to isolate content
- Manual inspection: does the email land in promotions/spam folder?

### H3 — Verification link expiring too fast (lower likelihood)

**Evidence**: Expiry was tightened from 24 h to 1 h in the same experiment
to reduce account takeover risk.

**How to test (1 day)**:
- Pull verification click timing distribution pre vs. post experiment
- Look at "link expired" error rate in application logs

## What this analysis does NOT tell us

- Whether users who bounced verification bounce permanently or come back
  and try again later (need cohort follow-up over 14 days)
- Whether paid-channel visitors show the same pattern as organic
- Whether the experiment is hurting paying-conversion or just signup

## Recommended next actions

1. **Today**: Pull email deliverability data by domain (H1). 1 hour of
   analyst work.
2. **Today**: Check application logs for verification expiry errors (H3).
   15 minutes.
3. **Tomorrow**: A/A test the email template if H1 is not the answer (H2).
4. **If H1 confirmed**: stop the experiment, revert sender domain, continue
   other experiment elements.
5. **If H2 confirmed**: revert email content, keep other changes.

## Decision framework (pre-committed)

- **Kill the experiment if**: by end of week, any hypothesis confirms
  the experiment is the cause and the degradation is > 5pp. Revert to
  control.
- **Extend the experiment if**: a confounding variable (a provider outage,
  a deliverability rule change) is identified and the experiment itself
  looks clean. Continue with monitoring.
- **Ship the experiment if**: 14 more days show the degradation was a
  pre-existing decline and the experiment variants are actually flat or
  improving.

## Confidence

**High** on the observation (the drop is real, not noise — 4 weeks of
data, sample size sufficient).

**Medium** on H1 as the cause — the timing correlates with experiment
launch, but we have not yet tested deliverability. 24 hours of testing
moves this to High or eliminates it.

## Handoff

- Hypothesis confirmed → `pm-operator` to coordinate the revert
- Pattern points to a product issue beyond this experiment → `pm-researcher`
  for 3-5 quick user calls
- Exec needs update on experiment status → `pm-communicator`

---

**Reviewer notes**: Funnel table shows biggest drop clearly. Three
hypotheses ranked by likelihood with specific tests. Decision framework
pre-committed. Confidence calibrated. Analyst surfaces evidence, does
not jump to recommendation.
