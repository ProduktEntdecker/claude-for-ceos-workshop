# Demo stations: preparation and fallbacks

Companion to [run-sheet.md](run-sheet.md) and [privacy-checklist.md](privacy-checklist.md).

Every station below has three things: what actually runs, what has to be prepared before Monday, and what happens on stage when it fails. **A station without a fallback does not go on stage.** Two hours in front of 20 people is not the moment to debug a connector.

Total preparation budget: about three hours. If time runs short, cut from the bottom of the priority list, not from the fallbacks.

## Priority order

Prepare in this order. Each line is independently useful, so stopping early still leaves a working workshop.

| Prio | Station | Prep | Why this order |
|---|---|---|---|
| 1 | 2.1 Ads pipeline | 20 min | Strongest hook, no customer data, already has a demo plan |
| 2 | 1.1 + 1.2 Wiki ingest and query | 10 min | Reuses the rehearsed Sotarena demo from the 11:00 talk |
| 3 | 3.x Hands-on | 30 min | The block with the most participant time, and the one that fails loudest |
| 4 | 0.1 + 0.2 Briefing and cockpit | 40 min | Opening. Needs a demo dataset |
| 5 | 1.3 Connectors | 45 min | Highest impact, highest risk, needs a recording |
| 6 | 2.2 + 2.3 CRM to invoice chain | 45 min | Three systems, three demo datasets. First to cut |

---

## Station 0.1 and 0.2: Morning briefing and cockpit

**What runs:** the `morning-briefing` skill (Google Calendar, Linear issues, `ONE-THING.md`, North Star, last vault session) and the cockpit dashboard.

**Data:** calendar entries and Linear issues carry real customer names. Treatment required.

**Prep (40 min):**
- Record the briefing output once, then replace customer names with the Sotarena cast (the talk already establishes them, which ties the two sessions together)
- Or: run it live against a demo Linear team and a throwaway calendar
- Cockpit: check whether it reads live data or a fixture. If live, screenshot and redact

**Fallback:** a static screenshot on the slide. This block is scene-setting, not proof, so a still image loses almost nothing.

**Watch for:** Linear MCP calls must run sequentially. Parallel calls return 502, which on stage looks like the whole thing is broken.

---

## Station 1.1 and 1.2: Granola ingest and wiki query

**What runs:** ingest of a meeting note into a per-customer wiki, then a question answered from the wiki.

**Data:** clean. Use the Sotarena wiki from the talk repo, not a real customer.

**Prep (10 min):**
- Fresh clone in a short path
- Leave `S07-kornhagen-complaint.md` in the inbox as the live source (S06 is spent in the 11:00 talk, so this block does not repeat it for anyone who attended both)
- Accept-edits mode on before you start

**Fallback:** `docs/fallback/` in the talk repo has prepared outputs. Narrate them.

**Say:** "If you were upstairs this morning, this is the same folder. This time we use a different document, so you see it work twice on different input."

---

## Station 1.3: Connectors reading LinkedIn, WhatsApp and mail

**What runs:** Claude reading the channels where the work actually arrives.

**Data:** private conversations with named individuals. **Recording, not live.** See the privacy checklist.

**Prep (45 min):**
- Stage a conversation between two accounts you control, or with one contact who agrees in writing
- Record the single thread only. No inbox list, no sidebar, no notification area
- Keep it under 90 seconds

**Fallback:** the recording is the fallback. There is no live version of this station.

**Say on stage:** "This is recorded, and both sides agreed to it. I am not opening my actual inbox in front of you, and in a session about giving an AI access to everything, that is worth saying out loud."

---

## Station 2.1: Ads pipeline

**What runs:** `gtm-stack`. One JSON config produces 1,529 ad variations with images and copy, a review gallery, and a report that pauses the losers.

**Data:** clean. Fictional brand config, generated images, aggregate Meta metrics.

**Prep (20 min):** follow `gtm-stack/demo-plan.md`, which already exists:
- Pre-generate the images. Do not wait on API calls on stage
- Pre-load the gallery with a mix of approved, pending and rejected
- Avoid live calls to Meta or Gemini. Show cached output and the code that makes the calls

**Run it backwards:** open with the finished ad image on screen, then reveal how it got there. The output earns the attention that the pipeline explanation then needs.

**Fallback:** the gallery runs locally and needs no network. If even that fails, the generated images alone carry the point.

---

## Station 2.2 and 2.3: Lead to CRM to project to invoice

**What runs:** Attio, Linear and LexOffice as one chain, ending in a quote and an invoice generated from delivered work.

**Data:** the most sensitive stations in the workshop. CRM records, project data, invoice amounts, bank details.

**Prep (45 min):** one demo record per system, named after the Sotarena world, or a screencast of the whole chain.

**This is the first station to cut.** If Sunday runs out, drop it and say instead: "The same chain continues into CRM, project and invoice. I am not showing you my actual customer records, and I would rather spend the time on your questions." A room of owners will respect that more than a rushed demo with blurred names.

**Fallback:** describe the chain over the run sheet diagram. 90 seconds.

---

## Station 3: Hands-on

**What runs:** participants build one block on their own machines.

**Prep (30 min):**
- Track A instructions on a slide, large enough to read from the back: clone URL, three commands
- Track B instructions on the same slide: the five questions a company profile answers
- Decide the track split in the first two minutes by a show of hands, not by asking individually
- Have the starter repo URL as a short link and as a QR

**Fallback if the room has no usable network:** everyone does Track B. It needs no connection, and it is the higher-return exercise anyway.

**Watch the clock.** At 14:37 stop the work and start the Share round, whether or not people are finished. An unfinished file they own beats a finished demo they watched.

---

## The evening before

- [ ] Every station above either prepared or consciously cut
- [ ] Notifications off at system level
- [ ] Separate demo browser profile, no autofill, no personal bookmarks
- [ ] Terminal scrollback cleared
- [ ] Battery, adapter, and the room's actual projector resolution tested
- [ ] Run sheet printed. When a demo fails, reading beats improvising
