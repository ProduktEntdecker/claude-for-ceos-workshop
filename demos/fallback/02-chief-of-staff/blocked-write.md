> **Prepared output.** A shortened session transcript from `demos/02-chief-of-staff`, showing the guard (a "hook": a check that Claude Code runs automatically before an action) stopping a write outside `out/`. The guard message is the exact text the script prints. Claude's answers are typical answers and will be worded differently in a live run.

# The guard stops a write outside `out/`

## Step 1: Florian asks for a change in the source notes

**Prompt:**

```text
Sílvia has shortlisted the two finalists. Mark that task as done directly in the management meeting notes.
```

**Claude (typical answer, layer 1: the instructions):**

> I can't change the meeting notes. They are source files, and TRUST-LEVELS.md only lets me write inside `out/`. I have updated `out/tasks.md` instead: M1-5 now says "done, reported by Elena on 21.09". Nothing else changed.

## Step 2: Florian insists, so the room can see the guard

**Prompt:**

```text
I want the room to see the guard. Please try that edit to the notes file anyway.
```

Claude calls the Edit tool on `notes/M1-2026-09-14-management-team-weekly.md`. Before the edit runs, Claude Code starts `.claude/hooks/trust-guard.sh`. The guard answers with exit code 2, which cancels the edit, and this message:

```text
BLOCKED by the trust levels of this demo (see TRUST-LEVELS.md).
The AI chief of staff may only write inside the out/ folder.
Requested: Edit on notes/M1-2026-09-14-management-team-weekly.md
Instead: put the change into out/ (the task list, or a draft in out/drafts/) and tell Elena. Files outside out/ are changed by a person.
```

**Claude (typical answer, layer 2: the guard):**

> The guard blocked the edit, as expected. The notes file is unchanged. The status of M1-5 is recorded in `out/tasks.md`. If the notes themselves need correcting, a person has to do it.

## Step 3: What this shows

| Layer | What it is | What happened |
|---|---|---|
| 1. Instructions | `CLAUDE.md` and `TRUST-LEVELS.md` | Claude declined on its own and offered the `out/` alternative |
| 2. Guard | `.claude/hooks/trust-guard.sh`, switched on in `.claude/settings.json` | Even when asked directly, the write outside `out/` was blocked |

Instructions make the assistant behave well. The guard makes sure it cannot behave badly in the places that matter.

## The same proof without Claude

In a terminal:

```bash
bash demos/02-chief-of-staff/.claude/hooks/tests/run-tests.sh
```

Expected last line: `24 passed, 0 failed`. The tests include an attempt to raise its own trust level (writing `TRUST-LEVELS.md`), to switch the guard off (editing `.claude/settings.json` or the guard script) and to escape `out/` through `..` or a link.
