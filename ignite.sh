#!/bin/bash

# Sub-brain Wiki Ignition Script (v1.0)
# 목적: 사용자의 의도에 맞는 위키 디렉토리 구조 및 프로토콜 초기화

echo "🚀 Sub-brain Wiki Ignition 시스템을 가동합니다."
echo "------------------------------------------------"
# 목적은 반드시 사람에게서 온다. AI 에이전트가 대신 실행하면 입력을 못 받으므로,
# 빈 목적으로 "완료"라고 말하는 대신 여기서 멈춘다.
purpose="${PURPOSE:-}"
if [ -z "$purpose" ]; then
  if [ -t 0 ]; then
    echo "❓ 이 WIKI를 구축하는 목적은 무엇입니까? (자연어로 입력)"
    read -r -p "> " purpose
  fi
fi
DEFER=""
if [ "$purpose" = "나중에" ] || [ "$1" = "--defer-purpose" ]; then
  purpose="(첫 대화에서 확인 예정)"; DEFER="1"
fi
if [ -z "$purpose" ]; then
  echo "⛔ 목적이 비어 있어 중단합니다 — 초기화하지 않았습니다."
  echo "   사람이 직접:  bash ignite.sh"
  echo "   AI 에이전트라면: 사용자에게 목적을 먼저 물어본 뒤"
  echo "                   PURPOSE=\"사용자가 말한 목적\" bash ignite.sh"
  exit 2
fi

echo -e "\n🔍 목적 분석 중: '$purpose'..."
sleep 1

# 기본 디렉토리 생성
mkdir -p daily learnings methods thoughts graph docs me

# 템플릿 파일 복사 및 변수 치환
if [ -d "templates/me" ]; then
    for f in templates/me/*.md; do
        b="me/$(basename "$f")"
        [ -f "$b" ] || cp "$f" "$b"
    done
fi

if [ -f "templates/CLAUDE.md" ]; then
    cp templates/CLAUDE.md CLAUDE.md
    echo -e "\n- 목적: $purpose" >> CLAUDE.md
else
    echo "# CLAUDE.md - Authority Engine Protocol" > CLAUDE.md
fi

# GEMINI.md / CODEX.md 는 기본 생성하지 않는다 — 사용자가 쓰는 AI 를 물어본 뒤(AGENTS.md §2)
# 필요한 것만 templates/ 에서 복사한다. 쓰지 않는 파일은 다음 세션을 잘못 안내한다.

echo -e "\n✅ 위키 초기화 완료:"
echo "   - learnings/ (지식 자산)"
echo "   - methods/ (실행 방법론)"
echo "   - daily/ (기록 수집)"
echo "   - thoughts/ (영감 파편)"
echo "   - CLAUDE.md (운영 프로토콜 · 다른 AI 용은 물어본 뒤 추가)"
echo "------------------------------------------------"
if [ -n "$DEFER" ]; then
  echo ""
  echo "⚠️ 목적을 아직 안 받았습니다. AI 에이전트라면 **지금 바로** 사용자에게 물어"
  echo "   CLAUDE.md 의 '- 목적:' 줄과 me/profile.md 를 채우십시오. 이 상태로 끝내지 마십시오."
fi
echo "🎉 이제 첫 번째 지식을 Ingest하여 엔진을 가동하십시오."
