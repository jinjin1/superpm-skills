# Exec Update — Week of 2026-04-13

> To: @ceo
> From: @jinjin1 (PM, SuperPM)
> Week of: 2026-04-13
> Status: **Yellow**

---

## TL;DR

- **Win**: PM Recipes expansion launched, 6 new recipes live; Day-1
  engagement 22% above the previous recipe launch
- **Concern**: Signup funnel conversion dropped 11pp, under investigation
  (likely email deliverability on new sender domain — see below)
- **Ask**: Approve 1-week pause on the new signup experiment while I
  isolate the root cause. Decision by Tuesday 4/22, otherwise I'll pause
  default.

## Metrics (this week vs last)

| Metric | This week | Last week | Trend | Note |
|---|---|---|---|---|
| Signup completion (new visitors) | 31% | 42% | ↓ | Email verification step — see Concern |
| Recipe page engagement | 68% | 61% | ↑ | New recipes drawing attention |
| /prompt/[id] copy events | 4,220 | 4,105 | → | Steady |
| Weekly unique visitors | 18,430 | 18,200 | → | Organic search holding |

Status is Yellow because of the signup drop. Everything else is green or
flat, but signup is the acquisition Job — it outweighs the other wins.

## Shipped this week

- 6 new PM Recipes (PRD Writing v2, User Research v2, + 4 new) — [PR #67](link)
- Sitemap fix covering recipe detail + category pages — [PR #68](link)
- PM Harness v1 strategy plan promoted to docs/designs/ — [PR #69](link)

## Shipping next week

- Signup funnel root-cause investigation (@jinjin1, by 4/22)
- Start `pm-writer` exemplar for the SuperPM Skills side project — no
  impact on superpm.app itself

## Lowlights

- Signup experiment launched 2026-03-24 correlates with the 11pp drop.
  Root cause not yet isolated but email deliverability on the new sender
  domain (`welcome@` vs. `noreply@`) is the leading hypothesis.
- If confirmed, revert sender domain and keep other experiment changes.
  Analysis ETA Tuesday 4/22.

## Asks

| Ask | From | By | Why |
|---|---|---|---|
| Approve 1-week pause on signup experiment | @ceo | 2026-04-22 | Need time to isolate root cause. Without pause, we keep losing ~100 signups/day to a likely-reversible issue. |

---

**Reviewer notes**: TL;DR has all three critical elements — win, concern,
ask. Status Yellow (honest) because the core Job-completion metric is
declining, even as secondary metrics hold. The ask has a deadline AND
a "if no response, I default to X" clause. Numbers before reasoning.
