# Privacy checklist per demo station

Every station in this workshop is shown to 20 people in a room, some of whom will photograph the screen. Several stations reach live customer data: names, deal values, invoice amounts, private messages.

**The rule:** nothing identifying a real customer, contact or amount appears on the projector. Not for a second, not "just scrolling past". A recognisable name in a screenshot that ends up on LinkedIn is a data protection incident, and it is the kind that gets photographed precisely because the demo was good.

This is prep work, not a debate. Each station below needs one of three treatments before Monday.

## The three treatments

| Treatment | When to use it | Cost to prepare |
|---|---|---|
| **Demo dataset** | The tool has a sandbox, a test workspace or a fictional project | Medium, do it once, reuse forever |
| **Anonymised view** | The tool can filter to one fictional record, or a saved view with names replaced | Low, but verify nothing leaks at the edges: sidebars, notification toasts, tab titles, autocomplete |
| **Recorded screencast** | Live access is unavoidable or too slow, or the risk of a stray notification is too high | Low, and it removes all live risk. Costs authenticity |

Default to the demo dataset. Fall back to a screencast rather than showing anything real.

## Station by station

| Block | Station | Data it touches | Treatment | Status |
|---|---|---|---|---|
| 0.1 | Morning briefing | Calendar, pipeline, open commitments, real names | Demo dataset | TODO |
| 0.2 | Cockpit dashboard | Revenue, deals, customers | Demo dataset or anonymised view | TODO |
| 1.1 | Granola ingest into customer wiki | Meeting transcript, participant names, what was said | **Sotarena** example company from the talk repo | Ready |
| 1.2 | Wiki answers a customer question | Same | **Sotarena** | Ready |
| 1.3 | Connectors: LinkedIn, WhatsApp, mail | Private conversations with named individuals | **Screencast, staged with a consenting contact or between two own accounts** | TODO, highest risk |
| 2.1 | Ads pipeline (`gtm-stack`) | Fictional brand config, generated images, Meta metrics | None needed, contains no customer data | Ready |
| 2.2 | Attio to Linear to LexOffice chain | CRM records, project data, invoices | Demo dataset in each of the three, or screencast | TODO |
| 2.3 | Quote and invoice from delivered work | Customer name, amounts, bank details | Demo dataset with a fictional customer | TODO |
| 3.x | Hands-on | Participants' own data on their own machines | Not our exposure, but say it out loud | See below |

## Station 1.3 in detail, the one that can go wrong

Reading WhatsApp and LinkedIn is the single most persuasive moment in the workshop, and the least defensible live. A message list shows names, profile photos and message previews from people who never agreed to appear in a conference room.

Do this instead:
- Record it in advance between two accounts you control, or with one contact who has explicitly agreed, using content written for the purpose.
- Crop to the single conversation. No inbox list, no sidebar, no notification area.
- Replace every name in the staged conversation before recording. A first name still identifies a contact in a LinkedIn or WhatsApp thread, so "first name only" is not anonymisation and would contradict the rule above.

Say on stage: "This is recorded, and both sides of that conversation agreed to it. I am not going to open my actual inbox in front of you, and that is worth saying out loud in a session about giving an AI access to everything."

That sentence is not an apology. For a room of company owners weighing exactly this risk, it is the most useful thing in the block.

## What to say in the hands-on block

Before 3.2, one sentence:

> "You are about to point this at your own files. Anything you put in a folder is something you are choosing to share with a model. Start with something you would be comfortable emailing to a colleague, not the payroll file."

## Before the session

- [ ] Every station above marked Ready or carrying a prepared screencast
- [ ] Notifications off at system level: Slack, Mail, WhatsApp, Signal, calendar alerts
- [ ] Separate demo browser profile, no personal bookmarks bar, no autofill
- [ ] Terminal scrollback cleared. A scroll-up during Q&A shows the last session
- [ ] Shell history and any `~/.zsh_history` autocomplete that could surface a customer name
- [ ] Desktop cleared of file names that identify customers
- [ ] Rehearse once with the projector resolution, not just the laptop screen
