# Claude Code for SME Owners and CEOs

Claude Community House Barcelona, Monday 21 September 2026.
Florian Steiner, Produktentdecker. Claude Community Ambassador, Munich.

---

## What you just saw

One company, one working day, five systems. None of them is a product you can buy. All of them are folders of text files and a handful of scripts that Claude reads and writes.

| Block | The idea in one line |
|---|---|
| Morning briefing | The day starts with a decision list, not an inbox |
| Knowledge in | Every meeting, message and mail becomes a linked, cited page instead of evaporating |
| Business out | The same knowledge base makes outbound specific, quotes fast and invoices correct |
| Build one block | The first step is small enough to do in twenty minutes |

The one thing worth remembering: **none of this started as a system.** Each piece began as one annoying task that happened twice a week.

---

## Start here, this week

Pick one. Not three.

### 1. Write the file your company runs on

Before any tooling: one markdown file that answers what a new colleague would ask in week one.

- Who we are and what we actually sell
- Who our customers are, and who they are not
- Who decides what
- How we talk: the words we use, the words we avoid
- What "good" looks like for our work

Save it as `CLAUDE.md` in the folder where you work. Claude reads it before it answers anything. This is the single highest-return file in the whole setup, and it needs no terminal.

**Test it:** ask Claude to draft something typical for your business, once with the file and once without. The difference is the point.

### 2. Give it a memory

The starter repository from the 11:00 talk is a company wiki in plain markdown: a root map, one page per entity, one canonical fact sheet, and a health check that finds contradictions, duplicates and facts that went stale.

```
github.com/ProduktEntdecker/enterprise-memory-starter
```

Three steps to try it on your own company:

1. Clone it and open the folder with Claude Code
2. Drop one of your own documents into `sources/inbox/`
3. Run ingest, then run lint

Twenty minutes. Use a document you would be comfortable emailing to a colleague, not the payroll file.

### 3. Connect one thing

Not everything. One. The rule that works: connect the system where you already lose the most time re-reading things you have read before. For most owners that is mail or the CRM, not the fancy one.

---

## What this costs, honestly

- **Subscription:** one Claude plan per person who builds. Not per employee.
- **Build time:** every block you saw took between an afternoon and three days. The wiki took the longest and pays back the most.
- **Maintenance:** this is the number people forget. Budget a recurring hour a week. A system nobody maintains decays within weeks, and a decayed knowledge base is worse than none, because you still trust it.

---

## Where it fails

Said plainly, because you have heard the optimistic version already:

- **Error compounding.** A wrong page gets cited, then cited again, and starts to look confirmed. This is why the health check and the source dates matter more than they look.
- **Newest is not right.** A fresh document can be wrong, and an older one authoritative. Software cannot decide which source wins. A person has to own each number.
- **Connectors break quietly.** They stop syncing without telling you. Check them on a schedule.
- **It does not replace judgement.** It removes the re-reading, the retyping and the looking-up. The deciding stays with you.

---

## Data, before you point this at your company

Anything you put in a folder is something you choose to share with a model. Three practical rules:

1. Start with material you would send to a colleague without thinking about it.
2. Keep customer data out of any repository that could ever become public. A pre-commit check that scans for names, IBANs and keys costs an hour to set up.
3. Decide who in your company is allowed to connect what, before someone connects it.

---

## Stay in touch

- **Florian Steiner**, Produktentdecker: produktentdecker.com
- **Claude Code Munich meetup:** we run these sessions monthly, and visitors are welcome
- **This week in Barcelona:** AI Summit Tuesday and Wednesday, Claude Impact Lab on Thursday at the House

If you build one of these and it works, tell me. If you build one and it does not, tell me that instead. It is more useful.
