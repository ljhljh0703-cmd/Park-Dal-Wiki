# LLM Wiki Starter: The Dual-Engine Intelligence Framework

> "영감을 자산으로, 파편을 지능으로. 나만의 커스텀 LLM Wiki를 구축하는 가장 완벽한 프로토콜."

## 🚀 Overview
본 레포지토리는 고밀도 지식 베이스인 **LLM Wiki**를 구축하기 위한 핵심 아키텍처와 운영 지침을 제공합니다. Andrej Karpathy의 행동 원칙과 Dual-Engine(Gemini/Claude) 오케스트레이션 로직을 기반으로 설계되었습니다.

---

## 🏗️ Core Assets
- **[AGENTS.md](./AGENTS.md)**: 외부 AI 에이전트가 이 레포지토리를 인지했을 때 수행해야 할 업무 지침.
- **[templates/](./templates/)**: 'Lite' 버전의 운영 프로토콜(CLAUDE.md, GEMINI.md) 포함.
- **[ignite.sh](./ignite.sh)**: 사용자 목적에 맞춰 위키 구조를 자동 생성하는 초기화 스크립트.

---

## 🛠️ Setup Guide (설치 및 세팅)
본 시스템을 가동하기 위한 OS별 필수 도구 설치 가이드입니다.

### 1. Obsidian (지식 보관소) 설치
- **macOS/Windows**: [공식 다운로드](https://obsidian.md/download)에서 설치하십시오.

### 2. Obsidian 터미널 플러그인 설치 (권장)
옵시디언 내부에서 AI 엔진과 즉각적으로 소통하기 위해 터미널 환경을 구축합니다.
1. Obsidian 실행 후 좌측 하단 `Settings (설정)` 접속.
2. `Community plugins` -> `Turn on community plugins` 활성화.
3. `Browse` 버튼 클릭 후 **"Terminal"** 검색.
4. `Terminal` (또는 선호하는 터미널 플러그인) 설치 및 **Enable(활성화)**.

### 3. 에이전트 CLI 세팅
- **Claude CLI**: `npm install -g @anthropic-ai/claude-code`
- **Gemini CLI**: `npm install -g @google/gemini-cli`

---

## 💻 CLI 실행 및 로그인 (Authentication)
설치가 완료되면 터미널에서 아래 명령어를 통해 AI를 즉시 호출할 수 있습니다.

**기본 실행 명령어**
- Claude CLI: `claude`
- Gemini CLI: `gemini`

**초기 로그인 및 설정 방식**
- **플랫폼 구독자**: 명령어 입력 시 브라우저 창이 팝업되며, 웹 로그인 연동을 통해 즉시 사용 가능합니다.
- **비구독자 (API 사용자)**: 각 플랫폼의 API Key 발급이 선행되어야 합니다. 초기 실행 시 터미널 안내에 따라 API Key를 입력하여 환경을 세팅하십시오.

---

## 🚀 실행 방법 (Getting Started)
터미널 플러그인을 열거나 로컬 터미널에서 아래 명령어를 실행하여 나만의 위키 구조를 생성하십시오. 추가적인 시스템 개념은 [인터랙티브 가이드](https://ljhljh0703-cmd.github.io/sub-brain-engine/)에서 확인 가능합니다.

**Mac / Linux 사용자**
```bash
bash ignite.sh
