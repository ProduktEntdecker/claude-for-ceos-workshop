# CLAUDE.md

Guidance for Claude Code in this repository.

## Project

- **Purpose:** Hands-on workshop materials that show leaders of small and mid-sized companies how to use Claude as a thinking partner: daily briefing, e-mail triage, chief of staff, advisory board.
- **Session:** "Claude Code for SME Owners and CEOs", Claude Community House Barcelona, Monday 21 September 2026, 13:00 to 15:00, Room 4
- **Visibility:** private. It becomes public only after Florian explicitly approves it, shortly before the session.

## Structure

```text
README.md          overview and setup
docs/agenda.html   session agenda with timeline (print to PDF)
docs/agenda.pdf    exported agenda
company/           fictional example company used in all demos (planned)
demos/             daily briefing, e-mail triage, chief of staff, advisory board (planned)
handout/           one-page handout (planned)
scripts/hooks/     pre-commit secret scan
```

## Content rules

- English for everything participants see.
- No em-dash characters (U+2014). Use commas, colons or parentheses instead.
- No secrets, no client data, no real names of participants or customers.
- All demo data belongs to the fictional company in `company/`. No real inboxes, calendars, clients or employees.
- Every live demo has a fallback (prepared output or screenshots) in case the network or a login fails.

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
