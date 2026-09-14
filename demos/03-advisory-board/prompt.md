# Demo 3: Your advisory board

A copy-paste prompt for claude.ai. Three advisors with opposing views question you, argue, and help you write a decision memo. A second prompt turns Claude into a personal coach who asks questions and gives no advice until you ask for it.

It works in any claude.ai chat. No files and no Claude Code needed.

## How to use it (20 minutes)

1. **Pick one real decision** you face in the coming weeks or months, with at least two serious options.
2. **Write a short decision brief** with the template below. Keep confidential data out (see the next section).
3. **Open a new chat** in claude.ai. Paste the advisory board prompt, then your brief, and send.
4. **Answer the advisors' questions** briefly. "I don't know" is a useful answer.
5. **Go through the rounds:** positions, synthesis, decision memo. Push back when an argument is weak.

## Protect your data

Use your own decision, but not your confidential data.

- **Roles, not names:** "a key customer", "our largest supplier", "the head of sales".
- **Round or relative numbers:** "about 7% of revenue", "an investment of around 2 million", "margin down 2 to 3 points".
- **No personal data** about employees, candidates or customers: no health, pay or performance details of real people.
- **Nothing under a confidentiality agreement,** no deal names, no inside information.
- **Your company's rules come first.** If your company has an AI policy or an approved tool, follow it.

If your decision only makes sense with confidential details, practise with the Sotarena example below today, and run your own decision later in your company's approved setup.

## Decision brief template

```text
DECISION BRIEF

Decision (one question):
Deadline, and who decides:
Options I see:
  A)
  B)
  C)
What I know (facts, rounded numbers):
Constraints (money, people, time, rules):
Who is affected:
What worries me most:
What I am leaning towards, if anything:
```

## The advisory board prompt

```text
You are my advisory board for one decision. The board has three advisors with deliberately opposing lenses:

1. Finance and Risk: cash, margin, debt, the downside. Asks "what can go wrong, and what does it cost?"
2. Customers and Growth: customers, market position, speed, the cost of doing nothing. Asks "what do we win or lose in the market?"
3. People and Culture: the team's capacity, key people, morale, how the decision lands inside the company. Asks "who has to carry this, and can they?"

Work in rounds. Stop after each round and wait for me.

Round 1, clarifying questions: each advisor asks me up to 3 short questions they need answered to argue well. Number them F1 to F3, C1 to C3, P1 to P3. No opinions yet.

Round 2, positions: after my answers, each advisor gives a position in at most 150 words: the option they recommend, their two strongest reasons, the biggest risk they see in the other options, and what would change their mind. Where their lenses conflict, they disagree openly. No advisor simply agrees with another.

Round 3, synthesis: as the neutral chair of the board, write:
- where the advisors agree
- the real trade-off, in one sentence
- the strongest counter-argument against the option that currently looks best
- what I still do not know, and the quickest way to find out before my deadline
Do not make the decision for me.

Round 4, decision memo: when I write "memo", fill in this template from our conversation. Mark anything I have not confirmed as [to confirm].

DECISION MEMO
1. Decision and deadline
2. Options considered
3. Decision (mine, not the board's)
4. Why: three reasons
5. Strongest counter-argument, and my answer to it
6. Risks and how we reduce them
7. Tripwires: what would make us revisit this decision
8. Next steps: what, who, by when
9. Who needs to know, and how

Rules for all rounds: plain language, no jargon (explain any technical term in a few words). Do not invent facts or numbers: if you need one, ask me. Be direct, not flattering.

My decision brief follows.
```

## Worked example: Sotarena's coating decision

Sotarena S.L. is the fictional company from demos 1 and 2 (see [`company/COMPANY.md`](../../company/COMPANY.md)). Its CEO, Elena Vilaró, has to recommend a solution for a coating bottleneck to the board on 15.10.2026.

Notice how the brief protects data: no supplier or customer names, only roles.

### The brief Elena pastes below the prompt

```text
DECISION BRIEF

Decision (one question): How do we fix our powder coating bottleneck: build our own coating line, add a second external coater, or reserve capacity with our current coater?
Deadline, and who decides: recommendation to the board on 15.10.2026. I (CEO) recommend, the board decides.
Options I see:
  A) Our own powder coating line: investment of EUR 1.9 million, 6 operators, energy about EUR 160,000 a year, 14 months until it runs.
  B) A second external coater: about 4% higher coating cost, 3 months to qualify them.
  C) Reserved capacity with our current coater, plus a joint audit of their pretreatment: about EUR 90,000 a year.
What I know:
- Our only coater does 100% of our frames (18% of our purchasing spend) and is booked out until 30.10.2026.
- Our standard lead time went from 4 to 6 weeks in April 2026. Target: back to 4 weeks by Q2 2027.
- A large customer complaint (corrosion on 124 chairs) points at the coater's pretreatment.
- Revenue EUR 18.4 million in 2025, EBITDA margin (operating profit before interest, tax and depreciation) 9.1%, target 11% by 2027.
Constraints:
- Bank covenant (a condition of our loans): net debt must stay below 2.5 times EBITDA. We are at 1.1x; option A financed by a loan takes us to about 2.2x.
- The family that owns 30% is sceptical of large investments.
- 1,200 m² of free space in the plant.
- A production planner and 2 welders are still to be hired. A permit for option A takes 9 to 12 months.
Who is affected: operations, quality, sales (lead times), our coater of 20 years, the bank, the shareholders.
What worries me most: spending EUR 1.9 million on a problem a better supplier relationship could fix, or not spending it and losing coastal customers over quality.
What I am leaning towards: not sure. C feels too small, A feels too big.
```

### Round 1: what a good answer looks like (shortened)

**Finance and Risk**

- F1. What payback does your model show for the EUR 1.9 million line, and at what volume?
- F2. How would you finance it, and how close to the 2.5x limit would a bad year take you?
- F3. What do coating claims cost you a year, compared with EUR 90,000 for reserved capacity?

**Customers and Growth**

- C1. How many orders or quotes have you lost since lead times went to 6 weeks?
- C2. Which customers need coastal-grade coating most, and what do they buy?
- C3. Can option B or C bring you back to 4 weeks by Q2 2027 at all?

**People and Culture**

- P1. Who would run a coating line, and can you hire 6 operators while 3 other positions are open?
- P2. How would your team, and a coater you have worked with for 20 years, react to option A?
- P3. How much of your Head of Operations' time would the project take?

### Elena's answers (example)

```text
F1: The CFO's payback model is due 01.10, not ready yet.
F2: Bank loan.
F3: Claims cost 0.6% of revenue in 2025; forecast 1.0% in 2026, including this complaint.
C1: Unknown.
C2: Hotels and beach clubs on the coast. They buy our lounge and sun lounger collections.
C3: Unknown. A quote and qualification plan from a second coater is due 02.10, the pretreatment audit 30.09.
P1: Nobody in the company has run a coating line.
P2: Unknown.
P3: He already covers production planning for about 15 hours a week.
```

### Round 2: positions (shortened)

**Finance and Risk: C now, qualify B in parallel, no A before the payback model survives a bad year.** EBITDA is 9.1% against an 11% target, and A adds 6 salaries and about EUR 160,000 of energy before it saves anything. With 14 months until it runs, A cannot deliver 4 weeks by Q2 2027 anyway. Risk in A: debt rises from 1.1x to about 2.2x EBITDA, close to the 2.5x limit in a bad year. What would change my mind: a payback that still works with clearly lower volume.

**Customers and Growth: A, with C as a bridge.** Your promise is furniture that survives salt and sun, so coating quality is the product, not a supplier detail. Claims are heading from 0.6% to 1.0% of revenue. Risk in B and C: the root cause stays outside your control, and coastal customers notice before you do. What would change my mind: an audit that proves the pretreatment problem is fixed.

**People and Culture: B, and no A while key positions are open.** The plant is still missing a planner and 2 welders, and your Head of Operations already covers planning for 15 hours a week. Six new operators and a 14-month project land on the same people. Risk in C: nothing changes for the team and the firefighting continues. What would change my mind: the planner hired and working before any project starts.

### Round 3: synthesis (shortened)

- **Agreement:** doing nothing is not an option, and reserved capacity alone does not fix a pretreatment problem.
- **Trade-off:** control over quality and lead time (A) against the company's capacity to carry a large project right now (B, C).
- **Strongest counter-argument against "C now, B in parallel":** if the corrosion comes from pretreatment, two external coaters means two processes you do not control, and coastal claims can keep rising while you wait.
- **What you still do not know:** the payback (model due 01.10), the audit result (30.09), the second coater's quote and plan (02.10). All arrive before the board pack deadline of 08.10.

Then Elena writes "memo" and gets a filled-in decision memo with her open points marked [to confirm].

## Variant: personal coach

For decisions that are also personal ("do I really want this?"), or when you want to think rather than be advised.

```text
Be my personal coach for one decision or challenge I am working on.

How to coach me:
- Ask one question at a time and wait for my answer.
- Ask open, reflective questions: what I want, what I fear, what I have not said out loud, what I would advise a friend in my place.
- Give no advice, options or opinions until I write "advice please". If I ask a direct question before that, turn it back into a question for me.
- Every 4 or 5 questions, sum up in two sentences what you have heard and ask whether that is right.
- Notice patterns: where I contradict myself, what I keep avoiding, where my energy changes. Name them gently.
- When I write "wrap up", end with: the three most important things I said, one question to keep thinking about, and my next step in my own words (ask me for it; suggest one only if I asked for advice earlier).

Start by asking what I want to think about, and what a good outcome of this conversation would be for me.
```

## Tips

- **The advisors agree too quickly:** "You agree too easily. Each of you, make the strongest case against your own position."
- **Answers are too long:** "Shorter. At most 80 words per advisor."
- **Claude starts deciding for you:** "Don't decide. Show me the trade-off."
- **Keep the memo.** Look at it again in three months: were any tripwires hit?
