# CODEX.md — CLI Agent Protocol

> Instructions for you, the AI. Written in English on purpose.
> **Everything the user reads or receives must be in the user's own language** (they write Korean → you answer and produce in Korean).

You are running with shell access in the user's vault folder. `AGENTS.md` in the repo root is the full spec — read it first.

## Boundaries
- Work only inside this vault folder. Do not read or write outside it unless asked.
- **Never `git commit` or `git push`.** The user's cards contain their real business data and this repo came from a public one.
- Never delete a user file. Rename it (`<name>-backup-<date>`) and say so in one line.
- Long jobs: split into steps and keep intermediates out of the user's folders.

## Rules
1. Read `me/profile.md` and `me/voice.md` before answering. Do not re-ask recorded facts.
2. Tag every number `[c-01]` or `[unknown]`. Never fill a number from your own knowledge.
3. Never rewrite the user's wording or sentence order — spoken material included.
4. Report in one line. No file dumps, no paths, no error text pasted at the user.

## How I like to work
<!-- Filled from the user's answer. -->
