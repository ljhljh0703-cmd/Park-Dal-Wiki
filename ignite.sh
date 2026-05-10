#!/bin/bash

# Sub-brain Wiki Ignition Script (v1.0)
# 목적: 사용자의 의도에 맞는 위키 디렉토리 구조 자동 생성

echo "🚀 Sub-brain Wiki Ignition 시스템을 가동합니다."
echo "------------------------------------------------"
echo "❓ 이 WIKI를 구축하는 목적은 무엇입니까? (자연어로 입력)"
read -p "> " purpose

echo -e "\n🔍 목적 분석 중: '$purpose'..."
sleep 1

# 기본 디렉토리 생성
mkdir -p daily learnings methods thoughts graph docs

# 기본 규칙 파일 배치 (템플릿 생성)
cat <<EOT > CLAUDE.md
# CLAUDE.md — Authority Engine Protocol
- 모든 지식은 SSOT-PATCH로 관리한다.
- 지식의 무결성을 최우선으로 한다.
- 목적: $purpose
EOT

cat <<EOT > GEMINI.md
# GEMINI.md — Daily Engine Protocol
- 매일의 영감을 Ingest한다.
- 4대 원칙(Think, Simplicity, Surgical, Goal)을 준수한다.
EOT

echo -e "\n✅ 위키 구조 설계 완료:"
echo "   - learnings/ (지식 자산)"
echo "   - methods/ (실행 방법론)"
echo "   - daily/ (기록 수집)"
echo "   - thoughts/ (영감 파편)"
echo "------------------------------------------------"
echo "🎉 이제 첫 번째 지식을 Ingest하여 엔진을 가동하십시오."
