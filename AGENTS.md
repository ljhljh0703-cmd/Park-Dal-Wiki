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
사용자가 위키 구축을 요청하면, 반드시 `./ignite.sh`를 먼저 실행하여 사용자의 목적에 맞는 구조를 생성하십시오.

---
*Managed by Sub-brain Intelligence.*
