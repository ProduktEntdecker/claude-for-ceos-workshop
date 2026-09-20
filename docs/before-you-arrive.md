# Before you arrive

Claude Code for SME Owners and CEOs, Monday 21 September 2026, 13:00, Room 4,
Carrer de Bilbao 128, Barcelona.

**Please do this before Monday.** Fifteen minutes at home beats fifteen minutes in
a full room. If it fails, come anyway and find me before we start, but try it now
rather than at 13:00.

---

## Install Claude Code in the terminal

This is the way I run it on stage, and it is the way the API credits work. Both
matter on Monday.

### Mac

1. Press `Cmd` and the space bar together. A search box appears.
2. Type `terminal` and press Return. A window with a blinking cursor opens.
3. Copy the line below, click into the terminal window, paste it with `Cmd+V`,
   press Return.

```
curl -fsSL https://claude.ai/install.sh | bash
```

### Windows

1. Press the Windows key, type `powershell`, open **Windows PowerShell**.
2. Copy the line below, click into the blue window, paste it with `Ctrl+V` or
   right-click, press Return.

```
irm https://claude.ai/install.ps1 | iex
```

### Both, and this is the step everyone skips

Text scrolls past for about a minute. When it stops, **close the window
completely and open a new one.** The old window does not know about the new
command yet, and this causes almost every "it did not work".

In the new window, type this and press Return:

```
claude
```

Your browser opens and asks you to sign in. Sign in, come back to the terminal,
and you are connected. If you have no Claude account yet, create one at claude.ai
first. A free account is enough.

Type `/exit` to leave.

**Do not put `sudo` in front of the install line.** The installer refuses it on
purpose, because it would install into the wrong home folder.

---

## About the API credits

We hand out $50 in Claude API credits at the start of the workshop, first come,
first served. Two things about them:

**They are API credits.** They do not pay for a Claude.ai subscription. To spend
them, your Claude Code has to be signed in for API billing rather than for a
subscription. In the terminal that is one command:

```
claude auth login --console
```

The default is the subscription login. If you stay on that, your claimed credits
simply sit there unused.

**You will need your Organization ID**, not your personal account id. You find it
at **platform.claude.com**. The older address console.anthropic.com redirects to
the same place. A wrong id is rejected and cannot be corrected afterwards, so take
the extra ten seconds on the day.

---

## If something goes wrong

**"command not found: claude" after installing.**
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
fight it in the room. Come anyway: blocks 1 and 3 also run in your browser at
claude.ai with a ready-made pack, and you will be able to do every exercise. Talk
to your IT afterwards.

**The browser does not open at sign-in.**
Copy the address the terminal prints and paste it into a browser yourself.

**Nothing pastes into the terminal.**
Click inside the window once so it has focus, then paste.

**You would rather not use a terminal at all.**
There is a desktop app at claude.com/download that runs Claude Code in a normal
window. It is comfortable, but be aware: the API credits are tied to API billing,
and the sign-in flow there is built around the subscription. If the credits matter
to you, use the terminal.

**You only have a phone or tablet.**
Claude Code needs a computer. Come anyway and use claude.ai in the browser.

---

## What to bring

A laptop and a charger. Guest wifi details are on the first slide and on the flip
chart in the room.

See you Monday.
