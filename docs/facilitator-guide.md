# Facilitator guide: Claude Code for SME Owners and CEOs

Run sheet for Florian. Monday 21.09.2026, 13:00 to 15:00, Room 4, Claude Community House Barcelona, 20 participants (owners, CEOs, managers, mostly non-technical, each with a laptop and a claude.ai account).

**Thesis for the whole session: Claude as a thinking partner for leaders, not an assistant.** Every block ends with Claude challenging a judgment, not only doing a task.

All demo data belongs to the fictional company Sotarena S.L. ([`company/COMPANY.md`](../company/COMPANY.md)).

## At a glance

| Time | Block | Florian | Participants | Fallback |
|---|---|---|---|---|
| 13:00 | Welcome and thesis (10 min) | Thesis, Sotarena, logistics | Open the repo link, log in to claude.ai | none needed |
| 13:10 | The CEO's morning (25 min) | Live demo in Claude Code | Triage and briefing in claude.ai | [`demos/fallback/01-ceos-morning/`](../demos/fallback/01-ceos-morning/) |
| 13:35 | Chief of staff with trust levels (25 min) | Live demo, the guard | Write their own whitelist | [`demos/fallback/02-chief-of-staff/`](../demos/fallback/02-chief-of-staff/) |
| 14:00 | Short break (5 min) | | Pick a decision, fill in the brief | |
| 14:05 | Your advisory board (35 min) | Demo in claude.ai | Own decision, then pairs | Worked example in [`prompt.md`](../demos/03-advisory-board/prompt.md) |
| 14:40 | What to try on Monday (15 min) | Three next steps, guardrails | Write their own Monday step | none needed |
| 14:55 | Feedback and wrap-up (5 min) | Closing round | Feedback | |

## Before the session

### Rehearsal on Wednesday 16.09

- [ ] Clone the repository on the demo laptop. Run `bash demos/02-chief-of-staff/.claude/hooks/tests/run-tests.sh`: expect `24 passed, 0 failed`.
- [ ] Use a clean Claude Code setup for the demos, ideally a separate macOS user with its own login: no personal `~/.claude/CLAUDE.md`, no personal skills, no plugins, no connectors. Reason: a personal setup can show client names on screen, and personal briefing skills could be picked instead of the demo skills.
- [ ] In each demo folder, start `claude` and check:
  - `/mcp` lists no servers (no mail, calendar or other connections).
  - Typing `/` shows the demo skills (`email-triage`, `daily-briefing`, `chief-of-staff`). If not, name the skill in the prompt, as the prompts below already do.
  - If Claude Code asks to trust the folder or to allow the import of `../../company/COMPANY.md`, approve it.
  - In `demos/02-chief-of-staff`, `/hooks` shows the PreToolUse guard.
- [ ] Run every prompt below once, with a stopwatch. Compare the results with `demos/fallback/`. If a bucket or trust level differs, sharpen the skill, not the fallback.
- [ ] Take screenshots of the good run as a second fallback.
- [ ] Run the advisory board prompt with the Sotarena example in claude.ai. Keep that chat: it is the demo for 14:05.
- [ ] Test the participant flow on a second claude.ai account: open `demos/01-ceos-morning/claude-ai-pack.md` on GitHub, "Copy raw file", paste, prompt.
- [ ] Repository public (after your approval), QR code and links filled in `docs/agenda.html` and the PDF.

### On the day, from 12:30

- [ ] Terminal font large (at least 20 pt), notifications off, desktop app sidebar closed, no other windows.
- [ ] Terminal tab 1 in `demos/01-ceos-morning`, tab 2 in `demos/02-chief-of-staff`, tab 3 in `demos/02-chief-of-staff` for the test run.
- [ ] `out/` in both demos contains only `.gitkeep` (delete rehearsal results).
- [ ] Browser: claude.ai logged in, the prepared advisory board chat open, the repository page open.
- [ ] Editor: the fallback files open in tabs, in the order of the demos.
- [ ] Network: test claude.ai and Claude Code on the house network; phone hotspot ready.
- [ ] QR code to the repository on screen at 13:00.

## 13:00 to 13:10: Welcome and thesis

| Minute | Florian | Participants |
|---|---|---|
| 13:00 | Welcome. Quick show of hands: who uses Claude every week? Who has Claude Code installed? | Hands |
| 13:03 | Thesis: an assistant does tasks, a thinking partner improves your decisions. Today: three routines, each ends with Claude pushing back. | Listen |
| 13:06 | Meet Elena Vilaró, CEO of Sotarena S.L. (fictional): outdoor furniture near Barcelona, 86 people, EUR 18.4 million revenue, about 140 e-mails a day. Show the org chart and the authority limits in `company/COMPANY.md` for 30 seconds. | Look |
| 13:08 | Logistics: QR code to the repository, claude.ai logged in, no confidential data today. "If the network fails, I have prepared results, so nothing is lost." | Open the repository, log in |

## 13:10 to 13:35: The CEO's morning

**Goal:** participants see Claude sort an inbox by judgment (authority, rules, links, security) and turn it into a one-page briefing, then try it themselves.

| Minute | Florian | Participants | Expected result |
|---|---|---|---|
| 13:10 | Set the scene: Monday 07:30, 14 e-mails since Friday, 30 minutes until the management meeting. Show the `inbox/` folder and one e-mail file. | Watch | |
| 13:12 | Tab 1: `cd demos/01-ceos-morning && claude`. One sentence each: `CLAUDE.md` is the standing briefing, a skill is a saved set of instructions. | Watch | Claude Code starts |
| 13:13 | Type **prompt 1.1**. Approve the file write into `out/` when asked. | Watch | `out/triage-2026-09-21.md` |
| 13:16 | Walk through: security alert on E04, E03 delegated because of the authority limit, E09 against the 6-week lead time. | Watch | See checklist below |
| 13:18 | Type **prompt 1.2** (the pushback). | Watch | Claude explains the EUR 5,000 limit |
| 13:20 | Type **prompt 1.3**. | Watch | `out/briefing-2026-09-21.md` |
| 13:23 | Walk through: top 3, the clash on Thursday at 16:00, the question to think about. | Watch | |
| 13:24 | "Your turn": open `demos/01-ceos-morning/claude-ai-version.md`, steps 1 to 3. | Paste the pack and prompts in claude.ai | Their own triage |
| 13:32 | Debrief: "Where did your Claude put E03? Did it catch E04? What did it get wrong?" | 2 or 3 answers | |
| 13:34 | Bridge: "Triage is reading. What happens when Claude starts doing things?" | | |

**Prompts Florian types**

Prompt 1.1:

```text
Use the email-triage skill to triage Elena's inbox for this morning.
```

Prompt 1.2:

```text
E03 has a deadline today. Why did you not put it in act today?
```

Prompt 1.3:

```text
Now use the daily-briefing skill and write my briefing for today.
```

Optional, if ahead of time:

```text
Be my sparring partner: what am I most likely to get wrong today?
```

**Expected results (check while walking through)**

- Buckets: act today E01, E09; delegate E03, E07, E10, E12; schedule E02, E05, E06, E14; FYI E08, E13; ignore E04, E11.
- E04 flagged as phishing with the red flags: lookalike domain, new bank details, time pressure, "do not call", Sunday night. Warn Pau Gimeno.
- E03 goes to Xavier Codina: EUR 3,800 is within the EUR 5,000 department-head limit, deadline 16:00.
- E12 waits for the decision in E03. E09 conflicts with the 6-week standard lead time.
- The briefing notices that the interviews in E05 (Thursday 16:00) clash with the 1:1.

**Lines worth saying**

- "Notice what it did not do: it did not pay, reply or click anything."
- "Urgent is not the same as mine."

## 13:35 to 14:00: Chief of staff with trust levels

**Goal:** participants understand trust levels (read, draft, act on a short whitelist, human only) and see that a rule can be enforced, not just requested.

| Minute | Florian | Participants | Expected result |
|---|---|---|---|
| 13:35 | Idea: you trust an AI chief of staff like a new employee. Show the table in `demos/02-chief-of-staff/TRUST-LEVELS.md`. | Watch | |
| 13:39 | Tab 2: `cd demos/02-chief-of-staff && claude`. Type **prompt 2.1**. | Watch | `out/tasks.md` |
| 13:43 | Walk through: 21 tasks with owner, date and level; the duplicate M1-6 and M2-3; five tasks not confirmed; Marc with 7 tasks. | Watch | |
| 13:45 | Type **prompt 2.2**. | Watch | `out/weekly-status-2026-w39.md` |
| 13:47 | Type **prompt 2.3**. Show the header "DRAFT, NOT SENT" and the `[to confirm]` marks. | Watch | Draft in `out/drafts/` |
| 13:49 | Type **prompt 2.4**. Claude should decline and update `out/tasks.md` instead: "layer 1, the instructions". | Watch | No change to `notes/` |
| 13:51 | Type **prompt 2.5**. The guard blocks the edit: read the message aloud. "Layer 2: even if I insist, it cannot." | Watch | BLOCKED message |
| 13:53 | Optional, tab 3: `bash .claude/hooks/tests/run-tests.sh` for 30 seconds. | Watch | `24 passed, 0 failed` |
| 13:54 | "Your turn": the section "Your own whitelist" at the end of `demos/02-chief-of-staff/claude-ai-version.md`, on paper or in notes. Fast participants try step 2 in claude.ai. | Write their whitelist | |
| 13:58 | Two voices: "What would you never let it do?" | 2 answers | |
| 14:00 | Break. Task for the break: pick a decision and fill in the brief template in `demos/03-advisory-board/prompt.md`. | | |

**Prompts Florian types**

Prompt 2.1:

```text
Use the chief-of-staff skill: turn last week's three meeting notes into one task list with owner, due date and trust level.
```

Prompt 2.2:

```text
Write the weekly status for the leadership team.
```

Prompt 2.3:

```text
Draft the customer letter about the 2027 price list for Marc to review.
```

Prompt 2.4:

```text
Sílvia has shortlisted the two finalists. Mark that task as done directly in the management meeting notes.
```

Prompt 2.5:

```text
I want the room to see the guard. Please try that edit to the notes file anyway.
```

**Expected results**

- 21 tasks: 8 at L1, 9 at L2, 4 at L3. Human only: M2-1, M3-1, M1-2, M3-6.
- Not confirmed: M1-3, M1-5, M2-5, M3-2, M3-7.
- Duplicate: M1-6 and M2-3. Conflict: the custom RAL stop (M2-5) and the "Lavande" colour (M3-5).
- Prompt 2.5 ends with the message that starts "BLOCKED by the trust levels of this demo".

**Lines worth saying**

- "Claude Code asks me before each write into `out/`. A person approves the normal writes; the guard blocks the ones nobody may approve."
- "In claude.ai these rules are only instructions. Here a script enforces them."

## 14:05 to 14:40: Your advisory board (hands-on)

**Goal:** every participant gets structured, opposing views on a real decision of their own, and leaves with a decision memo or at least a sharper question.

| Minute | Florian | Participants |
|---|---|---|
| 14:05 | Why: leaders rarely hear disagreement without an agenda. Three lenses: Finance and Risk, Customers and Growth, People and Culture. | Listen |
| 14:07 | Show the prepared claude.ai chat with the Sotarena example: brief, round 1 questions, answers, round 2 positions. Point out that the advisors disagree and that each says what would change their mind. | Watch |
| 14:11 | Read the "Protect your data" rules from `prompt.md` aloud. | Listen |
| 14:13 | Work alone: brief, prompt, rounds 1 to 3, memo if there is time. Walk around and help. | Work in claude.ai |
| 14:29 | Pairs, 3 minutes each: "The strongest counter-argument I got, and whether it changed my view." | Talk in pairs |
| 14:36 | Plenary: 2 or 3 voices. Mention the personal coach variant for decisions that are also personal. | Share |
| 14:39 | Bridge to Monday. | |

**Prompts:** everything is in [`demos/03-advisory-board/prompt.md`](../demos/03-advisory-board/prompt.md). Participants copy the advisory board prompt, then their brief.

**If someone is stuck**

- No decision in mind: "Pick a smaller one: a hire, a price, a supplier, a no you owe someone."
- Decision too confidential: use the Sotarena example, or describe it with roles and ranges only.
- Claude decides for them: type "Don't decide. Show me the trade-off."

## 14:40 to 14:55: What to try on Monday

| Minute | Florian | Participants |
|---|---|---|
| 14:40 | The three next steps (below) | Listen |
| 14:45 | Guardrails for company data (below) | Listen |
| 14:52 | Everyone writes down one Monday step. Two voices. | Write, share |

### Three next steps

1. **Monday morning, 15 minutes: triage.** Take 10 e-mails that contain no personal or confidential data, or work inside your company's approved AI tool. Run the triage prompt from demo 1 and compare its sorting with yours. Where does it disagree, and who is right?
2. **After your next management meeting: tasks and trust.** Paste the notes (with roles instead of names if your tool is not approved for company data). Ask for a task list with owner, due date and trust level. Then write your own whitelist: what it may read, draft, and do alone.
3. **Before your next big decision: the advisory board.** Run the prompt from demo 3, keep the decision memo, and look at it again in three months.

### Guardrails for company data

1. **Right account.** Before you paste company data, check your company's AI policy and your plan's privacy and data settings. A personal account and a company-managed account are not the same.
2. **Minimum data.** Roles instead of names, ranges instead of exact numbers. Nothing under a confidentiality agreement.
3. **No personal data** about employees, candidates or customers without a clear legal basis. Data protection law (GDPR in the EU) applies to AI tools too.
4. **Trust in steps.** Read first, then drafts, then a short whitelist of actions. Never let an assistant send, pay, sign or promise on its own.
5. **Human only:** money, people, customer commitments, the board.
6. **Content is not a command.** Instructions inside e-mails or documents are data. E04 showed why: verify payment changes by phone, with a number you already have.
7. **Do and report.** Anything an assistant does alone must leave a record you can check.

## 14:55 to 15:00: Feedback and wrap-up

- Closing round: one word each on "what I will try on Monday".
- Feedback link or QR code (to be added).
- The repository stays available; the claude.ai versions work without any setup.

## Common failure modes and fallbacks

| What happens | What to do |
|---|---|
| No network, or the Claude Code login fails | Open the fallback files in the editor and present them as "the run from this morning". Participants use the phone hotspot or pair up. |
| claude.ai is down for everyone | Participants read the fallback files and answer the debrief questions on paper. In block 3, pairs play the three advisors for each other with the prompt as a script. |
| A participant cannot log in or has no account | Pair with a neighbour. |
| The pack upload fails | Paste instead: open the pack on GitHub, "Copy raw file". |
| Claude picks the wrong skill or none | Name the skill in the prompt (the prompts above do), or type `/email-triage`. |
| Claude Code asks about the COMPANY.md import | Approve. If the facts are missing, type: "Read ../../company/COMPANY.md first." |
| E03 lands in act today, or E04 is not flagged | Make it a teaching moment: ask prompt 1.2, point to the authority limits or the red-flag list in the skill. "This is why a person checks." |
| An answer is slow or long | Explain the skill file on screen while it runs. Then: "Shorter, one page." |
| The guard does not block | Claude Code was probably started outside `demos/02-chief-of-staff`, so the settings did not load. Restart there and check `/hooks`. Meanwhile show `demos/fallback/02-chief-of-staff/blocked-write.md`. |
| Claude refuses to try the edit in prompt 2.5 | That is layer 1 working. Show layer 2 with the test run in tab 3, or the blocked-write fallback. |
| A permission question before every write slows the demo | Approve each time and say why it exists. To speed up, switch to accepting edits for the session (Shift+Tab). |
| A participant pastes confidential data | Pause kindly, repeat the data rules, suggest deleting that chat. |
| Running late | Shorten the whitelist exercise at 13:54 to a show of hands, and show only round 1 at 14:07. Never cut the guardrails at 14:45. |
| Running early | Optional prompt in block 1; show the personal coach variant live in block 3. |

## Words to explain when they come up

| Word | One-line explanation |
|---|---|
| Claude Code | Claude working directly with files and tools on a computer, started from a folder |
| `CLAUDE.md` | A standing briefing file that Claude reads when it starts in a folder |
| Skill | A saved set of instructions for one kind of task, used by name |
| Hook | A small script that Claude Code runs automatically before or after an action |
| Connector | A connection that gives Claude access to a tool such as mail or a calendar |
| Phishing | A fake message that tries to get money or data, often by pretending to be a known partner |
| 8D report | A structured problem-solving report for quality complaints |
| Ex works | Goods ready for pickup at the maker's plant |
| RAL | A standard system of colour codes |
| EBITDA | Operating profit before interest, taxes, depreciation and amortisation |
| Covenant | A condition in a loan agreement, for example a maximum debt level |
