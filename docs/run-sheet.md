# Run sheet: Claude Code for SME Owners and CEOs

Claude Community House Barcelona, Bilbao 128, Room 4.
Monday 21 September 2026, 13:00 to 15:00. 20 seats, sold out, waiting list managed at the door.

Room 4 is occupied until 13:00 and again from 15:00. Start and finish on time.

## The promise

> A one-person company running the back office of a twenty-person company. You will see every building block, and you will build one yourself.

This is not a tour of features. It follows one job through the company: how knowledge comes in, how it turns into revenue, and what a human still decides.

## Audience assumption

Claude Code runs on most laptops in the room. Block 3 is hands-on at their own keyboard. Participants who arrive without a working setup pair with a neighbour: no setup clinic on stage, it costs everyone else 20 minutes.

## Relationship to the 11:00 talk

The talk in the Auditorium ("Second Brain for Claude") explains the LLM wiki as a concept. This workshop shows the same idea in production at 13:10, with real project wikis fed by meeting transcripts. Attendees of both get theory and proof. Each session stands on its own: assume half the room was not upstairs.

## Blocks

| # | Time | Block | Mode |
|---|---|---|---|
| 0 | 13:00 to 13:10 | The day starts with a briefing, not an inbox | Demo |
| 1 | 13:10 to 13:35 | In: how knowledge enters the company | Demo |
| 2 | 13:35 to 14:00 | Out: how it turns into business | Demo |
| - | 14:00 to 14:10 | Break | |
| 3 | 14:10 to 14:45 | Build one block yourself | Hands-on |
| 4 | 14:45 to 15:00 | What it costs, what it cannot do, what you take home | Close |

---

## Block 0: The day starts with a briefing (13:00 to 13:10)

**Point:** the first thing a company owner sees in the morning should be a decision list, not 60 unread emails.

| Step | What runs | What they see |
|---|---|---|
| 0.1 | Morning briefing | Yesterday's commitments, today's deadlines, what needs a decision |
| 0.2 | Cockpit dashboard | The same picture as one screen |

**Say:** "Nothing here was typed this morning. Every line comes from a system that was already running. The rest of the session is how those systems got there."

**Data:** touches real pipeline and calendar data. See the privacy checklist: this block runs on the demo dataset.

---

## Block 1: In (13:10 to 13:35)

**Point:** the bottleneck is not writing, it is that the company forgets. Knowledge arrives as meetings, messages and mail, and evaporates.

| Step | Time | What runs | What they see |
|---|---|---|---|
| 1.1 | 5 min | Granola meeting transcript, ingested into a per-customer LLM wiki | One call becomes linked, cited pages: who was there, what was decided, what is open |
| 1.2 | 8 min | The wiki answers a question about that customer | The path: root map, index, pages. No search index |
| 1.3 | 7 min | Connectors read LinkedIn, WhatsApp and mail | The same assistant sees the channels where the work actually happens |
| 1.4 | 5 min | Questions | |

**Bridge to the talk:** "If you were upstairs at eleven, this is that folder with six months of use on it."

**Say at 1.3:** "This is the part people underestimate. Not that it can write a reply, but that it has read the thread before it does."

**Data:** 1.1 and 1.2 run on the Sotarena example company from the talk repo. 1.3 is the sensitive one. See the privacy checklist.

---

## Block 2: Out (13:35 to 14:00)

**Point:** the same knowledge base is what makes outbound specific, quotes fast and invoices correct.

| Step | Time | What runs | What they see |
|---|---|---|---|
| 2.1 | 8 min | Ads pipeline from `gtm-stack` | One JSON config produces 1,529 ad variations with images and copy, a review gallery, and a report that pauses the losers |
| 2.2 | 7 min | Inbound lead to CRM to project to invoice | Attio, Linear and LexOffice as one chain, not three tools |
| 2.3 | 5 min | Quote and invoice generated from delivered work | The document comes from the record, not from memory |
| 2.4 | 5 min | Questions | |

**Say at 2.1:** "One config, 1,529 creatives, uploaded and measured. No manual creative work. The interesting number is not 1,529, it is that the losers get paused without me looking."

**Hook order:** open 2.1 with the finished ad image on screen before explaining anything. Work backwards from the output.

**Data:** 2.1 is clean, it contains no customer data. 2.2 and 2.3 touch live CRM and accounting records. See the privacy checklist.

---

## Break (14:00 to 14:10)

Leave the ad gallery on screen. It is the best conversation starter in the room.

---

## Block 3: Build one block yourself (14:10 to 14:45)

Structure borrowed from the Kassel workshop format: **Show, Do, Share**.

| Step | Time | What |
|---|---|---|
| 3.1 Show | 5 min | One build, start to finish, on stage. Small enough to finish, real enough to matter |
| 3.2 Do | 22 min | Everyone builds the same block for their own company. Two tracks, see below |
| 3.3 Share | 8 min | Three participants show their result. Not a critique round, a proof round |

### Tracks

- **Track A, with Claude Code:** clone the starter repo, drop in one of their own documents, run ingest and lint. They leave with a wiki that has their own company in it.
- **Track B, without a working setup:** write the company profile that the whole system depends on, in any editor. Who we are, what we sell, who decides what, how we talk. This is the file that makes every later answer specific, and it needs no terminal.

Both tracks produce a file they own. Nobody sits and watches.

**Say before 3.2:** "Twenty-two minutes is short on purpose. The goal is not a finished system, it is that you have done the first step once, so the second one happens at home instead of never."

---

## Block 4: Close (14:45 to 15:00)

| Step | Time | What |
|---|---|---|
| 4.1 | 5 min | What this actually costs: subscriptions, build time, maintenance. Real numbers |
| 4.2 | 5 min | What it cannot do. Where it has burned me |
| 4.3 | 5 min | Take-home: repos, handout, how to reach me |

**4.2 is not modesty, it is the credibility block.** An audience of owners has heard the optimistic version already. Name the failure modes: a wrong page gets cited and starts to look confirmed, connectors break silently, a system nobody maintains decays in weeks, and none of this replaces the decision about which source wins.

**Leave at 15:00 sharp.** The next session needs the room.

## Reserve material

If a station fails or the room wants more, in this order:

1. Keynoter: turning a talk into slides, notes and sources
2. CxO agents: CEO, CFO, COO, CPTO and CRO as separate reviewers of the same plan
3. Retro: the weekly review assembled from git, Linear and accounting

Deliberately not in the main thread. They are impressive and they do not sit on the path a job takes through the company.
