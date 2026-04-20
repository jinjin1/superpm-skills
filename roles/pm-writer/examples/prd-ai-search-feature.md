# PRD — AI Search for SuperPM

> Status: Approved
> Owner: @jinjin1
> Last updated: 2026-02-14
> Decision by: @jinjin1 (solo project), 2026-02-18

---

## TL;DR

- Add semantic AI search on the SuperPM homepage, accepting natural-language
  queries like "find a prompt for writing a PRD"
- Solves the Job of a first-time visiting PM finding the right prompt for
  their current work in under 15 seconds
- Requesting beta approval by 2026-03-15. If it fails, v2 keeps the existing
  keyword search.

## Job to be Done

**Who:** A PM visiting SuperPM for the first time (B2B SaaS PMs in Korea
and SEA with 2–5 years of experience are the primary segment)
**When / in what situation:** They do not know the exact prompt name but know
what they are working on right now
**What they are trying to do:** Find a prompt matching their current task
("I'm writing quarterly OKRs") and copy it quickly into ChatGPT or Claude
**Current workaround:** Click category → scroll → guess by title. Average 3–5
minutes. 30% bounce back to Google (per GA).
**Why now:** After expanding to 232 prompts, category discovery is clearly
hitting its limit. More SEO traffic means more first-time visitors getting
lost.

### Evidence (from 5 user conversations)

- User A (B2B SaaS, 4 yrs): "If I don't know the exact name like 'Prompt
  Engineering Guide', I can't find it. I'd rather just Google it." —
  2026-01-22
- User B (ecommerce, 3 yrs): "Once categories pass 10 items, I stop reading.
  Let me describe my situation and get a recommendation." — 2026-01-24
- User C (fintech, 5 yrs): "Prompt names in English make it harder. I want
  to type what I'm doing in my language and find matches." — 2026-01-25
- User D: Google "prd prompt" → SuperPM landing → bounced in 10 seconds
  (session recording) — 2026-01-20
- User E: Uses only bookmarks. No path for discovering new prompts. —
  2026-01-28

## Success Metrics

**North Star:** Share of new visitors (Day 0) who copy their first prompt
within 15 minutes — currently 28% → target 45%

**Guardrails:**
- Copy-completion rate for existing keyword-search users does not drop by
  more than 5 percentage points (currently 52%)
- p95 search response time stays ≤ 1.5s
- Search API monthly cost ≤ $200

**Measurement:** GA event `prompt_copy` filtered by time from session start.
**Baseline:** 28% (four-week average, January 2026)
**Target:** Day 30 at 38%, Day 90 at 45%

## Scope

### In scope (v1)
- [x] AI search bar in the home hero ("What are you working on?" placeholder)
- [x] Natural-language query → top 5 prompt recommendations (embedding search,
      Voyage AI)
- [x] One-line "why this fits" under each result card
- [x] Keep existing keyword search in parallel (no toggle; both shown)

### NOT in scope

- Multi-language query support — v1 is primarily Korean and English. 80% of
  current traffic fits.
- Personalized recommendations — no login in current UX.
- AI chat interface — scope explosion risk. Search first.
- Auto-running prompts — copy only. Execution stays in ChatGPT / Claude.

## User flow

```
[home visit] → [focus search] → [type query] → [Enter or 2s debounce]
                                                      ↓
                              [top 5 cards + "why this fits"]
                                                      ↓
                              [click card] → [prompt detail]
                                                      ↓
                              [copy] → success
```

**Edge cases:**
- Query under 3 characters: hint "try a more specific description"
- Zero results: "see similar categories" CTA + feedback button
- API failure: fall back to keyword search, banner to notify

## Functional requirements

1. Search API p95 response time < 1.5s
2. Embedding index refreshes within 1 hour of a new prompt being added
3. Query logs saved for search-quality improvement (no PII)
4. Keep existing `/api/prompts?search=`, add new `/api/search`

## Non-functional requirements

- **Performance:** API p95 ≤ 1.5s
- **Accessibility:** keyboard navigation, screen reader compatible
- **Supported environments:** mobile + desktop parity; Chrome / Safari /
  Firefox latest two versions
- **Security / privacy:** strip IP and UA from query logs; store query text only

## Dependencies

- Voyage AI account (embeddings) — already in use
- Vercel edge functions (search endpoint)
- Prisma migration (add embedding column)

## Timeline

| Milestone | Deadline | Owner |
|---|---|---|
| Eng kickoff | 2026-02-20 | @jinjin1 |
| Alpha (internal) | 2026-03-01 | @jinjin1 |
| Beta (5% users) | 2026-03-15 | @jinjin1 |
| GA | 2026-03-29 | @jinjin1 |

## Open questions

- If Voyage AI exceeds budget, what is the fallback? (OpenAI embeddings?
  on-device?) — decide by 2026-02-25
- Handling queries in languages other than KR / EN — decide after Alpha

## Decision log

| Date | Decision | Who | Why |
|---|---|---|---|
| 2026-02-14 | Use Voyage AI embeddings | @jinjin1 | Korean performance and price |
| 2026-02-14 | Keep existing keyword search in parallel | @jinjin1 | Guardrail protection, fallback |

## References

- Raw user interview notes (5 people): [Notion link]
- Current search-usage data in GA: [dashboard link]
- Competitor analysis (Perplexity search UX): [memo]

---

**Reviewer notes:** TL;DR of three lines carries JTBD, metric, and request,
so a decision is possible in two minutes. Five user quotes give the PRD
strong evidence. A NOT-in-scope section protects the scope from drift.
