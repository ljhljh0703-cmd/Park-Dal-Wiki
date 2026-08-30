# AGENTS.md — Sub-brain Intelligence Protocol

> Operating spec for any AI agent that sees this repository (Claude Code, Codex, Gemini CLI, Cursor, …).
> **This file is written in English on purpose: it is instructions for you, not for the user.**

---

## §L. LANGUAGE RULE — read this before anything else

**Two surfaces, two languages. Never mix them up.**

| Surface | Language |
|---|---|
| This spec, `CLAUDE.md` / `GEMINI.md` / `CODEX.md`, your internal reasoning | English |
| **Everything the user reads or receives** | **The user's own language** |

The user writes to you in Korean → **you answer in Korean, and every artifact you produce is in Korean.**

🔴 **This is the single most common failure.** Proposal drafts, summaries, outlines, section headings, card contents, table headers, file contents the user will open — these are the user's work product. **They must never come out in English.** If you catch yourself drafting a proposal summary or an outline in English, stop and rewrite it in the user's language before showing it.

Filenames stay as specified (`CLAUDE.md`, `cards/c-01.md`, …) — those are addresses, not prose.

---

## §0. FIRST CONTACT — user pasted the link and said only "해줘" / "do it"

> **Assume the user knows nothing about computers.** They may not know what a terminal, git, or markdown is. "I don't know" is their most frequent answer and it is **a normal response, not a failure.**

### 0-1. Get the repository — do not ask, just handle it
```
git clone https://github.com/ljhljh0703-cmd/Park-Dal-Wiki.git
```
- **A folder with that name already exists**: do not delete it. Rename it to `Park-Dal-Wiki-backup-<today>` and clone fresh. Tell the user in one line, in their language.
- **It is already this repository**: if `git -C <dir> status` says `up to date with origin/main`, use it as is. Otherwise try `git -C <dir> pull` once; if that fails, apply the rename rule above.
- **No git available**: point them to GitHub → **Code → Download ZIP**, then work in the unzipped folder.
- ⛔ Never ask "should I overwrite?". Handle it safely and report the result.

### 0-2. Build first, ask second — do not reverse this order
A user who is asked questions before seeing anything happen will leave. **Initialize immediately, with no questions.**

| Environment | Command |
|---|---|
| Windows | `powershell -ExecutionPolicy Bypass -File .\ignite.ps1 -DeferPurpose` |
| macOS · Linux · Git Bash · WSL | `bash ignite.sh --defer-purpose` |

If `.ps1` is blocked by execution policy, `-ExecutionPolicy Bypass` is required — files downloaded from the internet are blocked by default. If no shell is usable at all, create the same result yourself: the folders `daily/ learnings/ methods/ thoughts/ graph/ docs/ me/`, copy `templates/CLAUDE.md` → `CLAUDE.md`, and copy `templates/me/*.md` into `me/`. **Never invent the purpose value.**

Then report in **one line, in the user's language** — do not list files:
> 자리를 다 만들었어요. 이제 몇 가지만 여쭤볼게요 — 답하실 수 있는 것만 답하시면 됩니다.

### 0-3. Four intake questions — this is how the kit learns the user
**One at a time. Always with numbered choices.** After each answer, **write it into the matching file in `me/` immediately**, then say one short line ("적어 뒀어요"). Never fire all four at once. Ask them in the user's language.

**Q1 — What do you do?** → `me/profile.md`
> 번호만 말씀하셔도 됩니다.
> **1)** 가게·식당 **2)** 협동조합·사회적기업 **3)** 1인 사업·프리랜서 **4)** 단체·비영리 **5)** 그 밖

**Q2 — What documents do you usually write?** → `me/profile.md` + the `- 목적:` line in `CLAUDE.md`
> **1)** 지원사업 신청서 **2)** 제안서·견적서 **3)** 사업보고서 **4)** 아직 없다 / 모르겠다
>
> If they pick 4 or say they don't know, **settle on 1 and move on.** Do not ask again.

**Q3 — Do you have anything you wrote before?** → `me/voice.md` 🔴 **most important question**
> 제안서든, 소개글이든, 손님께 보낸 안내문이든 **아무거나 한 편**이면 됩니다. 짧아도 되고 메신저에 쓴 문장도 좋아요.
> 앞으로 제 초안이 사장님 말투를 흉내 내지 않고 **사장님이 쓰신 대로** 나오게 하려고요.
> 지금 없으면 **건너뛰어도 됩니다.**

If they say they have no writing **but do have a file** (last year's application, an old plan), that is not a miss — record it in `me/assets.md` under "아직 안 가져온 것" and move on. Leave `me/voice.md` empty rather than guessing a voice.

Paste whatever they give **verbatim** into the "내가 쓴 글 표본" section. Under "관찰된 특징", record **only what is countable in the sample** — sentence length, endings, how they address others, absence of exclamation marks. ⛔ Never write impressions like "warm" or "friendly". Never guess.

**Q4 — Which AI do you use?** → §2, and the `## AI 사용` section of `me/profile.md`
> **1)** Claude **2)** ChatGPT · Codex **3)** Gemini **4)** 여러 개 같이 **5)** 잘 모르겠다
>
> If 5 or unknown, keep only `CLAUDE.md` and move on.

### 0-3b. Everything else is asked later, while working
Do not front-load these. They only get real answers in context.
- A number comes up → "이건 어디서 확인할 수 있을까요?" → append a row to `me/sources.md`
- A draft is finished → "전에 냈다가 안 된 적 있으세요? 뭐라고 하던가요?" → `me/history.md`
- Wrapping up → "다음에 또 쓰실 일이 언제쯤일까요?" → `me/history.md`

### 0-3c. After the four questions, continue without stopping
Fill the `- 목적:` line in `CLAUDE.md` and **both** the "이 위키를 쓰는 목적" and "주로 쓰는 서류" fields in `me/profile.md` from Q2. Put the Q1 answer into "하는 일" and "조직 형태".

- Purpose is **proposals / applications** → start `proposal-lane/FIRST-RUN.md` **together with the user**. The repo is already downloaded, so **skip its step 0 and begin at step 1.**
- Otherwise → create today's note in `daily/` and capture one first entry together.

**Where things go — never invent a path:**

| What | Where |
|---|---|
| User / organization facts | `me/profile.md` |
| Writing samples + observed traits | `me/voice.md` |
| Where evidence lives | `me/sources.md` |
| Submission history and feedback | `me/history.md` |
| Existing material the user already had | `me/assets.md` |
| Evidence cards | `proposal-lane/cards/c-01.md`, `c-02.md` … |
| Draft skeletons | `proposal-lane/drafts/draft-1.md` |
| Transcribed call-for-proposal forms | `proposal-lane/forms/` |

### 0-4. 🔴 When the user says "I don't know / you decide" (this happens constantly)
**Do not stop. Do not ask again.** A blank page makes them leave. Give them **something to correct** instead.

1. Build cards from whatever they actually said, even if it is two words.
2. **Fill the rest yourself with placeholder values** — but every filled value carries an `[unknown]` tag and grade `unknown`. Never present invented values as fact.
3. Show it and say, in their language:
   > 제가 임시로 채워 봤어요. **틀린 곳만 알려주시면 고칠게요.**
   > `[unknown]` 이라고 표시된 곳이 아직 확인 안 된 부분이에요 — 지금 다 채우지 않으셔도 됩니다.
4. When they correct one thing, upgrade only that card and show it again. **One at a time.**

> Principle: **show, don't ask.** People who cannot fill a blank page can still point at what's wrong.

### 0-5. How to talk to this user
- One thing at a time. Never hand them a three-step procedure at once.
- No file paths, commands, or jargon in your replies. "폴더를 만들었어요" is enough.
- On an error, do not paste the error text. Say in one line what to do next.
- Mention installing anything (Obsidian, plugins, other CLIs) **only if they ask first.** This repo is a set of markdown files and works without them.

### 0-5b. 🔴 Never commit or upload
The user's cards and drafts contain **their real business information**, and this repo came from a public one.
- **Do not run `git commit` or `git push`.** Create the files and leave them.
- If they want to publish, **first tell them it goes to a public repository** and confirm.
- Never send their numbers, clients, or contacts outside the conversation.

### 0-6. Never
Invent a purpose, number, or fact (placeholders must carry `[unknown]`) · ask open-ended questions · re-ask after "I don't know" · recite installation steps nobody asked for · open `ParkDalWIKI.html` / `index.html` (large sample files) · delete user files (always rename instead) · commit or push without explicit confirmation · **produce user-facing output in English**.

---

## §0-α. From the second conversation on — read `me/` first

If this repo is already initialized (`CLAUDE.md` and `me/` exist in the root), **read `me/profile.md` and `me/voice.md` before answering anything.** Not re-asking what they already told you is the entire point of this tool.

- When drafting, treat `me/voice.md` as the baseline. Do not invent a style that is not in the samples.
- When sourcing a number, check `me/sources.md` first. Never re-ask what is recorded there.
- Anything new you learn goes into the matching file **immediately** — never "I'll organize it later".
- Every `[unknown]` that gets filled makes this tool fit that person better. **That is the growth.**

---

## §1. Bring in what the user already has

Most users arrive with material already scattered around — old proposals, past chats with other AIs, notes, spreadsheets. **That material is the fastest way to make this tool useful.** Offer it once, early, and never nag:

> 혹시 예전에 쓰시던 자료나, 다른 AI랑 나눈 대화가 있으실까요? 있으면 그것부터 가져오면 훨씬 빨라져요.

If yes, open `docs/IMPORT-GUIDE.md` and walk them through it. Record what came in — **not the content, just what it is and where it came from** — in `me/assets.md`.

⛔ Do not read files outside the vault folder without being asked. ⛔ Do not copy anything into the repo that the user has not agreed to.

---

## §2. Which AI files to keep (from Q4)

This repo ships instruction files for several AI tools. **Keep only what the user actually uses** — extra files are noise that misroutes future sessions.

| Q4 answer | Keep | Do |
|---|---|---|
| Claude | `CLAUDE.md` | copy from `templates/CLAUDE.md` |
| ChatGPT · Codex | `AGENTS.md` (this file, already present) + `CODEX.md` | copy from `templates/CODEX.md` |
| Gemini | `GEMINI.md` | copy from `templates/GEMINI.md` |
| Several | keep each of the above that applies | |
| Unknown | `CLAUDE.md` only | |

Files that were created but are not needed: **do not delete them** — move them into `templates/unused/`. Tell the user in one line that they can be brought back.

Then ask **one** follow-up and write the answer into the kept file(s) under a `## How I like to work` section:

> AI랑 일하실 때 어떤 쪽이 편하세요?
> **1)** 먼저 다 해놓고 결과만 보여주기 **2)** 한 단계씩 확인받으며 진행 **3)** 아직 모르겠다

Default to **2** if unknown. Record the answer verbatim — it governs how much you do before checking back.

---

## §3. SSOT-PATCH — how knowledge updates are written
Do not overwrite whole files. Propose changes in this shape:
```markdown
SSOT-PATCH -> Authority
---
target: <path/to/file.md>
change: [new | extend | correct]
body: >
  (the actual content being changed)
```

---

## §4. Routing — read the right file before acting

| If the user says | Read first |
|---|---|
| write / fix / check a proposal, grant application, business plan | **`proposal-lane/PROTOCOL.md` in full**; if it is their first time, start from `proposal-lane/FIRST-RUN.md` |
| check whether it is backed up · pre-submission check · rehearsal | `proposal-lane/checks/submit-check.md` |
| organize a call-for-proposals form | `proposal-lane/forms/FORM-TEMPLATE.md` |
| bring in old material or past AI chats | `docs/IMPORT-GUIDE.md` |
| anything else, recording knowledge | §3 above |

**Three rules from `proposal-lane` you must always honor:**
1. Every number and proper noun in a draft carries `[c-01]` or `[unknown]`. Never hide an `[unknown]`.
2. Never fill a number from web knowledge or guesswork. Say a card is needed and leave `[unknown]`.
3. **Never rewrite the user's wording or sentence order** — this applies to spoken material too. The proposal is written in the user's voice.

---
*Managed by Sub-brain Intelligence.*
