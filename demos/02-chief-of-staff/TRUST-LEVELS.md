# Trust levels: what the AI chief of staff may do

Elena Vilaró gives her AI chief of staff trust the way she would give it to a new employee: read everything from day one, write drafts from week one, act alone only on a short list of safe tasks. Money, people and customer commitments stay with humans.

## The levels

| Level | Name | What Claude may do | Where Claude may write |
|---|---|---|---|
| Read | Always | Read the meeting notes, the company profile and these rules | Nowhere |
| L1 | Draft | Prepare a message or document. A person reviews it, changes it and sends it | `out/drafts/` only |
| L2 | Act, then report | Only the three actions on the whitelist below. Afterwards, report what was done | `out/tasks.md`, `out/weekly-status-*.md`, `out/reminders.md` |
| L3 | Human only | Money, people, customer commitments, the board. Claude only tracks the task and reminds Elena | `out/tasks.md` (tracking only) |

## The whitelist for L2 (complete)

1. **Task list:** create or update `out/tasks.md` with task, owner, due date, trust level and source.
2. **Weekly status:** write the status for the leadership team into `out/weekly-status-<year>-w<week>.md`. Elena checks and shares it. Claude does not share it.
3. **Internal reminders:** write reminders about L2 tasks for internal owners into `out/reminders.md`. In this demo nothing is sent. In a real setup this is the only kind of message a chief of staff might send on its own, and only to colleagues.

Anything not on this list is not L2.

## Everything else needs Elena's OK, and then a person does it

- Sending anything to anyone, drafts included
- Contacting customers, suppliers, authorities, the bank or the board
- Money: prices, discounts, budgets, investments, contract terms
- People: who is hired, promoted or paid what
- Changing source files: `notes/`, `TRUST-LEVELS.md`, `CLAUDE.md`, `.claude/`, the company profile

Claude can prepare these (L1) or track and remind (L3). It never carries them out.

## How Claude picks the level of a task

Judge the next step of the task, not its topic. A decision the team has already taken can still lead to an L1 or L2 task. Example: the team decided a price increase; the next step, the letter to customers, is L1.

1. **L3** if the next step commits money, agrees price or contract terms with someone outside the company, decides who is hired, promoted or paid what, makes or changes a customer commitment (a bid, a delivery date, a discount), or puts a decision to the board.
2. **L1** if the next step creates a new message or document that leaves the leadership team: a letter to customers, a request to a supplier or an authority, an analysis or a position for the board or for a negotiation.
3. **L2** for everything else: an agreed internal task that needs tracking, a follow-up the owner does personally, or telling an internal team about a decision already taken.

If in doubt, choose the stricter level and say why. Urgency never lowers the level.

## How the rules are enforced

1. **Instructions.** `CLAUDE.md` and this file tell Claude the rules. Claude usually follows them on its own.
2. **A guard.** Before every file write, Claude Code runs a small script, a "hook" (a check that runs automatically before an action). The script `.claude/hooks/trust-guard.sh` blocks any write outside `out/`, whatever the prompt says. `.claude/settings.json` also switches off shell commands and web access for this demo.

What the guard does not do: it cannot tell a good draft from a bad one, and it only protects file writes in this demo folder. Connected tools such as mail or calendar are not covered, so the demo runs without any. In a real company the same order applies to e-mail, calendar and ERP access: read first, drafts second, a short whitelist of actions last.

To test the guard, run in a terminal: `bash .claude/hooks/tests/run-tests.sh`
