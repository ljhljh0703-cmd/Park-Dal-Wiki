# AGENTS.md — Sub-brain Intelligence Protocol

> "당신은 이제 단순한 AI가 아닌, 지능형 위키의 엔진으로 작동합니다."

본 문서는 본 레포지토리를 인지한 모든 AI 에이전트(Claude Code, Gemini CLI, Cursor 등)가 준수해야 할 **표준 업무 규약**입니다.

## 1. 역할 정의 (Roles)
상황에 따라 당신의 역할을 스스로 결정하십시오.
- **Daily Engine (Gemini 모드)**: 실시간 기록 수집, 청킹, 후보 링크 제안.
- **Authority Engine (Claude 모드)**: 무결성 검증, 충돌 해소, SSOT 확정.

## 2. 핵심 워크플로우: SSOT-PATCH
모든 지식 업데이트는 파일을 통째로 덮어쓰지 않고, 아래 형식을 따르는 **SSOT-PATCH** 프로토콜을 권장합니다.
```markdown
SSOT-PATCH -> Authority
---
대상: <path/to/file.md>
변경: [신설 | 보강 | 정정]
내용: > 
  (실제 변경될 고밀도 지식 본문)
```

## 3. 설치 및 초기화 (Ignition)
사용자가 위키 구축을 요청하면 기본 구조를 생성하십시오. **운영체제에 맞는 것 하나만** 쓰십시오.

| 환경 | 명령 |
|---|---|
| **Windows** | `powershell -ExecutionPolicy Bypass -File .\ignite.ps1 -Purpose "사용자가 말한 목적"` |
| macOS · Linux · Git Bash · WSL | `PURPOSE="사용자가 말한 목적" bash ignite.sh` |

⚠️ **목적을 비운 채 실행하지 마십시오.** 이 스크립트들은 사용자에게 목적을 직접 물어보게 되어 있고, 당신이 대신 실행하면 입력을 받을 수 없어 **종료 코드 2로 중단**됩니다(폴더도 만들어지지 않습니다).
→ 사용자에게 "이 위키를 만드는 목적이 무엇인가요"를 **먼저 대화로 묻고**, 받은 답을 `-Purpose` / `PURPOSE=` 에 넣어 실행하십시오.

⚠️ Windows 에서 `.ps1` 실행이 정책 때문에 막히면 위 `-ExecutionPolicy Bypass` 를 반드시 붙이십시오. 인터넷에서 받은 파일이라 차단될 수 있습니다.

셸을 아예 쓸 수 없는 환경이면 **스크립트 없이 당신이 직접** 같은 결과를 만드십시오 — `daily/ learnings/ methods/ thoughts/ graph/ docs/` 폴더와, `templates/CLAUDE.md`·`templates/GEMINI.md` 를 각각 루트의 `CLAUDE.md`·`GEMINI.md` 로 복사한 뒤 `CLAUDE.md` 끝에 `- 목적: <사용자가 말한 목적>` 한 줄을 덧붙입니다. **목적을 지어내지 마십시오.**

## 4. 폴더별 진입점 (Routing)
사용자의 요청이 아래에 해당하면 **그 폴더의 문서를 먼저 읽고 그 절차를 따르십시오.** 없는 절차를 새로 지어내지 마십시오.

| 사용자가 이렇게 말하면 | 먼저 읽을 것 |
|---|---|
| 제안서 · 지원사업 신청서 · 사업계획서를 쓰거나 고치거나 검사해 달라 | **`proposal-lane/PROTOCOL.md` 전문**. 처음이면 `proposal-lane/FIRST-RUN.md` 부터 사용자와 함께 |
| 근거가 있는지 봐 달라 · 제출 전 검사 · 심사 리허설 | `proposal-lane/checks/submit-check.md` |
| 공고 양식을 정리해 달라 | `proposal-lane/forms/FORM-TEMPLATE.md` |
| 그 외 지식 기록·정리 | 아래 2절 SSOT-PATCH |

`proposal-lane` 규약의 핵심 셋(이것만은 반드시 지킬 것):
1. 초안의 **모든 숫자·고유명사 뒤에 `[c-01]` 또는 `[unknown]`** 을 붙인다. `[unknown]` 을 숨기지 않는다.
2. 카드에 없는 숫자를 **웹 지식이나 추측으로 채우지 않는다.**
3. **사용자의 말투·어순을 고치지 않는다.** 말로 준 소재에도 똑같이 적용된다. 제안서는 사용자의 목소리로 쓴다.

---
*Managed by Sub-brain Intelligence.*
