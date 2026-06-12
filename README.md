# Park-Dal-Wiki: The Dual-Engine Intelligence Framework

> "영감을 자산으로, 파편을 지능으로. 나만의 커스텀 LLM Wiki를 구축하는 전문 작가의 프로토콜."

## 🚀 Overview
본 레포지토리는 고밀도 지식 베이스인 **LLM Wiki**를 박달재 식으로 구축하기 위한 핵심 아키텍처와 운영 지침을 제공합니다. Andrej Karpathy의 행동 원칙과 Dual-Engine(Gemini/Claude) 오케스트레이션 로직 기반 위에 Hermes의 자기성장 구조를 반영해 설계했습니다.

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

### Mac / Linux 사용자
```bash
bash ignite.sh
```

### Windows 사용자
Windows 기본 CMD 또는 PowerShell 환경에서는 .sh 스크립트가 직접 실행되지 않습니다. 반드시 Git Bash 또는 WSL(Windows Subsystem for Linux) 환경이 필요합니다.

```bash
# WSL(Windows Subsystem for Linux) 사용 시 실행 예시
wsl bash ignite.sh

# Git Bash 사용 시 실행 예시
bash ignite.sh
```
*(추후 Windows 네이티브 환경을 지원하는 ignite.bat 파일이 추가될 예정입니다.)*

---

## ⚡ 06.12 Windows 실행 방법 (Windows + Claude Code CLI 통합 가이드)

### 1. 사전 필수 작업 (Python 세팅)
Obsidian 내장 터미널 플러그인이 로컬 프로세스를 정상적으로 감지하려면 공식 파이썬 환경이 필수적입니다.
1. **MS 스토어 가짜 링크 차단**: 윈도우 검색창에 "앱 실행 별칭 관리" 검색 후 진입하여 `python.exe`, `python3.exe`, `py.exe` 항목을 전부 **끔(Off)**으로 토글합니다.
2. **공식 Python 설치**:
   - Python 공식 홈페이지에서 최신 Windows Installer를 다운로드하여 실행합니다.
   - **[필수]** 설치 창 최하단의 `Add python.exe to PATH` 체크박스를 반드시 체크한 뒤 `Install Now`를 진행합니다.
3. **의존성 패키지 설치**:
   - 윈도우 명령 프롬프트(CMD)를 새로 열고 아래 명령어를 실행합니다.
   ```cmd
   pip install psutil pywinctl typing_extensions
   ```

### 2. Obsidian 내장 터미널 플러그인 세팅
외부 터미널 창 이동 없이 Obsidian 안에서 CLI를 제어하기 위한 세팅입니다.
1. Obsidian 실행 후 **설정(⚙️) → 커뮤니티 플러그인(Community plugins)**으로 이동합니다.
2. **제한 모드 해제(Turn off restricted mode)**를 클릭합니다.
3. 탐색(Browse) 버튼을 누른 뒤 `Terminal` (개발자: polyipseity) 플러그인을 검색하여 설치(Install) 및 **활성화(Enable)**합니다.
4. 단축키 `Ctrl + P`를 눌러 명령어 팔레트를 켠 뒤, 아래 명령어를 선택해 내장 터미널을 분할 창으로 띄웁니다.
   ```text
   Terminal: Open root directory in terminal: Integrated
   ```

### 3. Claude Code CLI 네이티브 설치
오류가 잦은 Node.js(npm) 방식 대신 Anthropic 공식 Windows 네이티브 스크립트를 사용합니다.
1. 띄워놓은 Obsidian 내장 터미널(CMD) 창에 아래 명령어를 입력하고 엔터를 누릅니다.
   ```cmd
   curl -fsSL [https://claude.ai/install.cmd](https://claude.ai/install.cmd) -o install.cmd && install.cmd && del install.cmd
   ```
2. 터미널에 `Installation complete!` 문구가 뜰 때까지 대기합니다.

### 4. 환경 변수 오류 우회 및 최종 실행
윈도우 시스템 특성상 설치 직후 `claude` 명령어 단독 입력 시 경로를 찾지 못하는 에러(*내부 또는 외부 명령...이 아닙니다*)가 발생합니다. 이때는 절대 경로 직구 방식으로 즉시 강제 실행할 수 있습니다.
1. Obsidian 내장 터미널 창에 아래 절대 경로 명령어를 따옴표를 포함하여 그대로 입력합니다.
   ```cmd
   "%USERPROFILE%\.local\bin\claude"
   ```
2. 정상적으로 로딩 창이 뜨면 앤트로픽 계정 웹 로그인 인증을 진행합니다.
3. 인증 완료 후, Obsidian 내부에서 자유롭게 Claude 에이전트를 구동하며 노트를 분석하고 위키를 자동 빌드할 수 있습니다.

> ⚠️ **주의**: 만약 추후에 절대 경로 없이 `claude` 단독 명령어만 치고 싶다면, 설정을 마친 후 Obsidian 프로그램을 완전히 종료했다가 다시 실행해야 윈도우 환경 변수가 완전히 동기화됩니다.

---

## 🧠 첫 번째 지식 Ingest 하기
터미널 세팅과 위키 초기화(`ignite.sh`)가 완료되었다면, 별도의 복잡한 스크립트 없이 즉시 AI에게 자연어로 데이터 정리와 저장을 지시할 수 있습니다. 터미널에 아래와 같이 입력하여 첫 지식을 적재해 보십시오.

### 실제 활용 예시
```bash
# Claude를 활용한 문서 정리 및 적재
claude "오늘 읽은 글 내용 정리해서 learnings 폴더에 ingest 해줘"

# Gemini를 활용한 기존 지식과의 구조화 연동
gemini "새 아이디어를 methods 폴더 내용과 연결해서 구조화해줘"
```

---
*Inspired by Sub-brain Intelligence. Built for Collective Wisdom.*
