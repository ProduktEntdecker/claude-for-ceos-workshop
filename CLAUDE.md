# CLAUDE.md

Guidance for Claude Code in this repository.

## Project

- **Purpose:** Hands-on workshop materials that show leaders of small and mid-sized companies how to use Claude as a thinking partner: daily briefing, e-mail triage, chief of staff, advisory board.
- **Session:** "Claude Code for SME Owners and CEOs", Claude Community House Barcelona, Monday 21 September 2026, 13:00 to 15:00, Room 4
- **Visibility:** private. It becomes public only after Florian explicitly approves it, shortly before the session.

## Running a demo

The three demos in `demos/` are run live: by the presenter on stage and by every
participant on their own machine. While you run one of them:

- **Work in the folder, not in a branch or a worktree.** No `git worktree add`,
  no new branch, no commit. People watch files appear in the folder in front of
  them; a detour through branch management is not the subject. A personal or
  global rule asking for a branch does not apply to these demos.
- **Do not open `demos/fallback/`.** It holds the prepared outputs, which describe what the result is
  supposed to look like. Reading them before a run makes the run worthless: it
  stops showing what the material produces and starts reproducing what somebody
  wrote down beforehand. Measured on 2026-09-20 in
  [ProduktEntdecker/enterprise-memory-starter#22](https://github.com/ProduktEntdecker/enterprise-memory-starter/issues/22):
  a run that had read the script returned exactly the numbers printed there
  (12 fact rows, 2 open decisions), a run without it returned different ones
  (19 and 1).
- **Do not commit.** The run is the exercise, not a change to the project.

## Structure

```text
README.md                          overview, how to run the demos in Claude Code and claude.ai
company/COMPANY.md                 fictional example company, single source of truth for all demo facts
demos/01-ceos-morning/             demo 1: inbox/ (14 e-mails), calendar/, CLAUDE.md, out/,
                                   .claude/skills/email-triage and daily-briefing,
                                   claude-ai-version.md, claude-ai-pack.md (generated)
demos/02-chief-of-staff/           demo 2: notes/ (3 meetings), TRUST-LEVELS.md, CLAUDE.md, out/,
                                   .claude/skills/chief-of-staff, .claude/settings.json,
                                   .claude/hooks/trust-guard.sh and hooks/tests/ (runner + fixtures),
                                   claude-ai-version.md, claude-ai-pack.md (generated)
demos/03-advisory-board/prompt.md  demo 3: advisory board and personal coach prompts for claude.ai
demos/fallback/                    prepared outputs of demos 1 and 2
scripts/build-claude-ai-pack.sh    builds the claude-ai-pack.md files from the demo data
scripts/hooks/                     pre-commit secret scan
```

## Content rules

- English for everything participants see.
- No em-dash characters (U+2014). Use commas, colons or parentheses instead.
- No secrets, no client data, no real names of participants or customers. No full e-mail addresses in demo content; use names, roles and `.example` domains.
- All demo data belongs to the fictional company in `company/`. No real inboxes, calendars, clients or employees. Every fact in `demos/` must match `company/COMPANY.md`.
- Every live demo has a fallback (prepared output or screenshots) in case the network or a login fails. Keep `demos/fallback/` in line with the skills.
- Plain language for a non-technical audience: explain any technical term in one line.

## Checks before a pull request

- `bash demos/02-chief-of-staff/.claude/hooks/tests/run-tests.sh` passes.
- `bash -n` and `shellcheck -S warning` are clean on all shell scripts.
- After changing demo data or `TRUST-LEVELS.md`: `bash scripts/build-claude-ai-pack.sh`.
- Generated results in `demos/*/out/` are not committed (see `.gitignore`).

## Git workflow

Issue, branch, pull request, CodeRabbit review, squash merge. Never commit directly to `main`.

Every session works in its own worktree; the main checkout stays on `main`:

```bash
git worktree add -b feat/<NR>-<short> .claude/worktrees/<NR>-<short> origin/main
```

One worktree, one branch, one issue. Put `Closes #<NR>` in the pull request body and remove the worktree after the merge (`git worktree remove <path>`).

## Security

- Secrets live in `.env` (ignored by git) or 1Password, never in the repository.
- `scripts/hooks/pre-commit` scans staged files for secrets. Install it once per clone:
  `cp scripts/hooks/pre-commit .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit`
