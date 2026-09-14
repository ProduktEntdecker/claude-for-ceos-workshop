# Claude Code for SME Owners and CEOs

Materials for the session **"Claude Code for SME Owners and CEOs"** at the Claude Community House, Barcelona, Monday 21 September 2026, 13:00 to 15:00, Room 4. Presented by Florian Steiner, Claude Community Ambassador Munich.

The idea: Claude as a thinking partner for leaders, not only an assistant.

> **Sotarena S.L. is fictional.** The company, its people, customers, suppliers, e-mails and meetings were invented for training. Any resemblance to real companies or persons is coincidental.

## Contents

- [`docs/agenda.html`](docs/agenda.html): agenda with timeline. Open it in a browser and print to PDF, or use [`docs/agenda.pdf`](docs/agenda.pdf).
- [`docs/facilitator-guide.md`](docs/facilitator-guide.md): run sheet with exact prompts, fallbacks and the guardrails for company data.
- [`company/COMPANY.md`](company/COMPANY.md): the fictional example company used in all demos.
- [`demos/01-ceos-morning/`](demos/01-ceos-morning/): daily briefing and e-mail triage.
- [`demos/02-chief-of-staff/`](demos/02-chief-of-staff/): chief of staff with trust levels.
- [`demos/03-advisory-board/prompt.md`](demos/03-advisory-board/prompt.md): your advisory board, plus a personal coach variant.
- [`demos/fallback/`](demos/fallback/): prepared results of demos 1 and 2, in case the network or a login fails.
- `handout/`: one-page handout with next steps and guardrails (planned).

## What is in each demo

### 1. The CEO's morning

Monday, 07:30. Elena Vilaró, CEO of Sotarena, has 14 new e-mails and 30 minutes.

- `inbox/`: 14 e-mails, one file each, including a customer complaint, a supplier delay, a board request and a phishing attempt
- `calendar/2026-09-21.md`: her day and the fixed meetings of the week
- `CLAUDE.md`: the standing briefing Claude reads in this folder
- `.claude/skills/email-triage/`: sorts the inbox into act today, delegate (with an owner from the org chart), schedule, FYI and ignore, and flags phishing
- `.claude/skills/daily-briefing/`: one page with top 3 priorities, calendar with prep notes, decisions waiting and risks
- `claude-ai-version.md` and `claude-ai-pack.md`: the same exercise in claude.ai

### 2. Chief of staff with trust levels

Three meeting notes from last week become a task list, a weekly status and draft messages, without anything being sent.

- `notes/`: notes of three meetings, written without a fixed template
- `TRUST-LEVELS.md`: read always; draft only into `out/drafts/`; act only on a short whitelist; money, people and customer commitments stay human
- `.claude/skills/chief-of-staff/`: task list with owner, due date and trust level, weekly status, follow-up drafts
- `.claude/settings.json` and `.claude/hooks/trust-guard.sh`: a guard that blocks every file write outside `out/`, plus tests in `.claude/hooks/tests/`
- `claude-ai-version.md` and `claude-ai-pack.md`: the same exercise in claude.ai

### 3. Your advisory board

A copy-paste prompt for claude.ai: three advisors with opposing lenses (finance and risk, customers and growth, people and culture) ask questions first, then argue. A synthesis names the strongest counter-argument, and a decision memo template closes it. Includes a worked example with a Sotarena decision, rules for using your own decision without confidential data, and a personal coach variant.

## Run demos 1 and 2 in Claude Code

You need Claude Code installed and logged in, and a copy of this repository (clone it, or download it as ZIP from GitHub).

Start Claude Code **inside** the demo folder. That is where its briefing, skills and (in demo 2) the guard live.

```bash
cd demos/01-ceos-morning && claude
```

Then type, for example:

```text
Use the email-triage skill to triage Elena's inbox for this morning.
Now use the daily-briefing skill and write my briefing for today.
```

```bash
cd demos/02-chief-of-staff && claude
```

```text
Use the chief-of-staff skill: turn last week's three meeting notes into one task list with owner, due date and trust level.
Write the weekly status for the leadership team.
```

Results are written to `out/` in the demo folder. Compare them with [`demos/fallback/`](demos/fallback/). All prompts of the live session are in the [facilitator guide](docs/facilitator-guide.md).

To test the guard of demo 2 (needs `jq`):

```bash
bash demos/02-chief-of-staff/.claude/hooks/tests/run-tests.sh
```

## Do them in claude.ai

No installation needed. Each guide explains how to upload or paste one data file and which prompts to use:

- Demo 1: [`demos/01-ceos-morning/claude-ai-version.md`](demos/01-ceos-morning/claude-ai-version.md)
- Demo 2: [`demos/02-chief-of-staff/claude-ai-version.md`](demos/02-chief-of-staff/claude-ai-version.md)
- Demo 3: [`demos/03-advisory-board/prompt.md`](demos/03-advisory-board/prompt.md)

If you have connected e-mail, calendar or other tools to claude.ai, switch them off for these exercises.

## Words used here

| Word | Meaning |
|---|---|
| Claude Code | Claude working directly with files and tools on a computer, started from a folder |
| `CLAUDE.md` | A standing briefing file that Claude reads when it starts in a folder |
| Skill | A saved set of instructions for one kind of task, used by name |
| Hook | A small script that Claude Code runs automatically before or after an action |
| Trust level | How much an assistant may do alone: read, draft, act on a whitelist, or nothing (human only) |

## For maintainers

- `company/COMPANY.md` is the single source of truth. Every fact in `demos/` must match it.
- After changing an e-mail, the calendar, a meeting note or `TRUST-LEVELS.md`, rebuild the claude.ai packs: `bash scripts/build-claude-ai-pack.sh`.
- Keep the guard tests green and the fallback files in line with the skills.
- Install the pre-commit secret scan once per clone: `cp scripts/hooks/pre-commit .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit`

## Disclaimer

An independent community resource, not affiliated with or endorsed by Anthropic.
