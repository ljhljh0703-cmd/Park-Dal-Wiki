#!/bin/bash

# Sub-brain Wiki Ignition Script (v1.0)
# 목적: 사용자의 의도에 맞는 위키 디렉토리 구조 및 프로토콜 초기화

echo "🚀 Sub-brain Wiki Ignition 시스템을 가동합니다."
echo "------------------------------------------------"
echo "❓ 이 WIKI를 구축하는 목적은 무엇입니까? (자연어로 입력)"
read -p "> " purpose

echo -e "\n🔍 목적 분석 중: '$purpose'..."
sleep 1

# 기본 디렉토리 생성
mkdir -p daily learnings methods thoughts graph docs

# 템플릿 파일 복사 및 변수 치환
if [ -f "templates/CLAUDE.md" ]; then
    cp templates/CLAUDE.md CLAUDE.md
    echo -e "\n- 목적: $purpose" >> CLAUDE.md
else
    echo "# CLAUDE.md - Authority Engine Protocol" > CLAUDE.md
fi

if [ -f "templates/GEMINI.md" ]; then
    cp templates/GEMINI.md GEMINI.md
else
    echo "# GEMINI.md - Daily Engine Protocol" > GEMINI.md
fi

echo -e "\n✅ 위키 초기화 완료:"
echo "   - learnings/ (지식 자산)"
echo "   - methods/ (실행 방법론)"
echo "   - daily/ (기록 수집)"
echo "   - thoughts/ (영감 파편)"
echo "   - CLAUDE.md / GEMINI.md (운영 프로토콜)"
echo "------------------------------------------------"
echo "🎉 이제 첫 번째 지식을 Ingest하여 엔진을 가동하십시오."
