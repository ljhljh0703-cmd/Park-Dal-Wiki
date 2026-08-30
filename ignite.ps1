<#
  Sub-brain Wiki Ignition (PowerShell) — ignite.sh 의 Windows 판
  사람:  .\ignite.ps1
  AI:    사용자에게 목적을 먼저 물어본 뒤  .\ignite.ps1 -Purpose "사용자가 말한 목적"
  Windows PowerShell 5.1 및 PowerShell 7 이상에서 동작합니다.
#>
[CmdletBinding()]
param([string]$Purpose = "", [switch]$DeferPurpose)

$ErrorActionPreference = "Stop"
try { [Console]::OutputEncoding = [Text.Encoding]::UTF8 } catch { }

function Write-Utf8NoBom([string]$Path, [string]$Text) {
    $enc = New-Object System.Text.UTF8Encoding($false)
    [IO.File]::WriteAllText($Path, $Text, $enc)
}

Write-Output "Sub-brain Wiki Ignition 시스템을 가동합니다."
Write-Output "------------------------------------------------"

if ([string]::IsNullOrWhiteSpace($Purpose)) { $Purpose = $env:PURPOSE }
if ([string]::IsNullOrWhiteSpace($Purpose)) {
    try { $Purpose = Read-Host "이 WIKI를 구축하는 목적은 무엇입니까? (자연어로 입력)" } catch { $Purpose = "" }
}

$Defer = $false
if ($Purpose -eq "나중에" -or $DeferPurpose) { $Purpose = "(첫 대화에서 확인 예정)"; $Defer = $true }

# 목적은 반드시 사람에게서 온다. 빈 목적으로 "완료"라고 말하지 않는다.
if ([string]::IsNullOrWhiteSpace($Purpose)) {
    Write-Output "목적이 비어 있어 중단합니다 - 초기화하지 않았습니다."
    Write-Output "   사람이 직접:      .\ignite.ps1"
    Write-Output "   AI 에이전트라면:  사용자에게 목적을 먼저 물어본 뒤"
    Write-Output "                     .\ignite.ps1 -Purpose `"사용자가 말한 목적`""
    exit 2
}

Write-Output ""
Write-Output "목적: $Purpose"

foreach ($d in @("daily","learnings","methods","thoughts","graph","docs","me")) {
    if (-not (Test-Path -LiteralPath $d)) { New-Item -ItemType Directory -Path $d | Out-Null }
}

if (Test-Path -LiteralPath (Join-Path "templates" "me")) {
    Get-ChildItem -Path (Join-Path "templates" "me") -Filter *.md | ForEach-Object {
        $dst = Join-Path "me" $_.Name
        if (-not (Test-Path -LiteralPath $dst)) { Copy-Item $_.FullName $dst }
    }
}

$claudeSrc = Join-Path "templates" "CLAUDE.md"
if (Test-Path -LiteralPath $claudeSrc) {
    $body = [IO.File]::ReadAllText($claudeSrc)
    Write-Utf8NoBom "CLAUDE.md" ($body + "`n- 목적: " + $Purpose + "`n")
} else {
    Write-Utf8NoBom "CLAUDE.md" ("# CLAUDE.md - Authority Engine Protocol`n`n- 목적: " + $Purpose + "`n")
}

# GEMINI.md / CODEX.md 는 기본 생성하지 않는다 — 사용자가 쓰는 AI 를 물어본 뒤(AGENTS.md §2) 필요한 것만 복사한다.

Write-Output ""
Write-Output "위키 초기화 완료:"
Write-Output "   - learnings/ (지식 자산)"
Write-Output "   - methods/ (실행 방법론)"
Write-Output "   - daily/ (기록 수집)"
Write-Output "   - thoughts/ (영감 파편)"
Write-Output "   - CLAUDE.md (운영 프로토콜 · 다른 AI 용은 물어본 뒤 추가)"
Write-Output "------------------------------------------------"
if ($Defer) {
    Write-Output ""
    Write-Output "[주의] 목적을 아직 안 받았습니다. AI 에이전트라면 지금 바로 사용자에게 물어"
    Write-Output "       CLAUDE.md 의 '- 목적:' 줄과 me/profile.md 를 채우십시오."
}
Write-Output "이제 첫 번째 지식을 Ingest 하여 엔진을 가동하십시오."
exit 0
