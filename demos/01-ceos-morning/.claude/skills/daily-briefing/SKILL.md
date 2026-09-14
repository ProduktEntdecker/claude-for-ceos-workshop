---
name: daily-briefing
description: Writes Elena Vilaró's one-page morning briefing for today from the triaged inbox and the calendar - top 3 priorities, calendar with prep notes, decisions waiting, risks, and one question to think about. Use when asked for the briefing, "my day", "what should I focus on today" or "prepare my morning".
---

# Daily briefing

A thinking partner's briefing, not a to-do list: what matters today, why, and what Elena might be missing.

## Inputs

1. `out/triage-2026-09-21.md`. If it does not exist, run the email-triage skill first.
2. `inbox/*.md` for details.
3. `calendar/2026-09-21.md`: today and the fixed meetings of the week.
4. COMPANY.md (loaded through CLAUDE.md): goals, authority limits, rules, the CEO persona.

## Method

1. **Security first.** If the triage has a security alert, open the briefing with a one-line alert.
2. **Top 3 priorities.** For each candidate ask three questions:
   - Is there a deadline today?
   - What is at stake: money, a key account, trust?
   - Can only Elena do it?

   Pick the three with the most "yes". A delegated item can be a priority only if Elena's job is to make sure the delegation lands today; then say exactly that. For each priority write what, why, and one concrete next step with a time.
3. **Calendar with prep notes.** For each meeting today: what to raise or bring, citing e-mail IDs. Suggest a free slot for the most important action. Point out clashes later in the week, for example a proposed meeting on top of a recurring one.
4. **Protect thinking time.** Elena wants two deep-work blocks a week (COMPANY.md, CEO persona). If this week's block is at risk, say so in one line.
5. **Decisions waiting.** Decisions that need Elena, but not today: decision, deadline, what she needs to decide well. Do not decide for her. If you have a view, label it "My view:" and keep it to one sentence.
6. **Risks.** At most 5, most expensive first, with the amount if known.
7. **One question to think about.** One sentence that connects items Elena might see as separate.

## Rules

- One page: at most about 500 words.
- Facts only from the files. If a fact is missing, write "unknown" instead of guessing.
- Plain language. Explain a technical term in a few words the first time.
- Cite e-mail IDs in brackets, for example (E09).
- Write the result only to `out/briefing-2026-09-21.md`. Never send it.

## Output format

```markdown
# Morning briefing: Monday 21.09.2026

(one-line security alert, if any)

## Top 3 priorities
1. **...** Why: ... Next step: ...

## Today's calendar
| Time | What | Prep note |

Later this week: ...

## Decisions waiting
| Decision | Deadline | What you need |

## Risks
1. ...

## One question to think about
...
```
