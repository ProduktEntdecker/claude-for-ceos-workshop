# Before you arrive

Claude Code for SME Owners and CEOs, Monday 21 September 2026, 13:00, Room 4,
Carrer de Bilbao 128, Barcelona.

**You do not need to install anything to take part.** Everything we do together
also runs in your browser. Read this only if you want to follow along on your own
machine, and give it fifteen minutes at home rather than fifteen minutes in a full
room.

If anything below fails, come anyway and find me before we start.

---

## Pick one of three

| | What you get | What it costs you |
|---|---|---|
| **A. The desktop app** | Claude Code with a normal window, no terminal | One download, about five minutes |
| **B. Nothing at all** | Every exercise in blocks 1 and 3, in your browser | Nothing |
| **C. The terminal** | Claude Code the way I run it on stage | One pasted line, about ten minutes |

If you are not sure, take **A**. If you are on a locked-down work laptop, take **B**.

---

## A. The desktop app, no terminal needed

1. Open **https://claude.com/download** in your browser.
2. Download the version for your computer. The page picks the right one.
3. Open the downloaded file and install it the way you install anything else.
   On a Mac, drag the Claude icon onto the Applications folder.
   On Windows, click through the installer.
4. Start the app. It asks you to sign in with your Claude account.
5. If you do not have an account, create one at **claude.ai** first. A free account
   is enough for this workshop.

That is it. You now have Claude Code without ever seeing a terminal.

## B. Nothing at all

Open **claude.ai** in your browser and sign in. Blocks 1 and 3 of the workshop run
entirely there, with ready-made data packs I hand out on the day. You will be able
to do every exercise.

Block 2 is a live demonstration either way, so you lose nothing by choosing this.

## C. The terminal, if you want the same setup I use

**On a Mac.** Press `Cmd` and the space bar together, type `terminal`, press Return.
Paste this line and press Return:

```
curl -fsSL https://claude.ai/install.sh | bash
```

**On Windows.** Press the Windows key, type `powershell`, open Windows PowerShell.
Paste this line and press Return:

```
irm https://claude.ai/install.ps1 | iex
```

Text scrolls past for about a minute. Then **close the window completely and open a
new one.** This step gets skipped by almost everyone and causes almost every
failure: the old window does not know about the new command yet.

In the new window, type `claude` and press Return. Your browser opens for sign-in.
Sign in, come back, and you are connected.

Do not put `sudo` in front of the install line. The installer refuses it on purpose,
because it would install into the wrong home folder.

---

## If something goes wrong

**"command not found: claude" after installing (option C).**
You are still in the window that was open during the install. Close it, open a new
one. If it persists on a Mac, run this once and open a new window again:

```
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
```

**Windows says "running scripts is disabled on this system".**
Run this once in PowerShell, then repeat the install line:

```
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

**Your work laptop blocks the install.**
Many company machines block installers, or the network blocks the download. Do not
fight it in the room. Take option B and talk to your IT afterwards.

**The browser does not open at sign-in.**
Copy the address the app or terminal prints and paste it into a browser yourself.

**You only have a phone or tablet.**
Take option B. Everything in blocks 1 and 3 works in a mobile browser, though a
laptop is far more comfortable.

**Nothing pastes into the terminal.**
Click inside the window once so it has focus, then paste. Mac `Cmd+V`, Windows
`Ctrl+V` or right-click.

---

## About the API credits

You will get fifty US dollars in Claude API credits on the day, first come, first
served. Two things decide whether it works, and neither can be corrected afterwards:

- You submit an **Organization ID**, not your personal account id.
- You find it at **platform.claude.com** (the older address console.anthropic.com
  redirects there).

The credits are for the **API**. They do not pay for a Claude.ai subscription.
There is one claim per person and a wrong submission cannot be fixed, so take the
extra ten seconds on the day.

## What to bring

A laptop and a charger. Guest wifi details are on the first slide and on the flip
chart in the room.

See you Monday.
