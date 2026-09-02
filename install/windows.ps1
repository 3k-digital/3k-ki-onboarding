# 3K KI-Onboarding — Installer für Windows (Windows PowerShell 5.1 kompatibel)
# Prüft Git und Claude, kopiert die Kit-Skills, legt ~/Claude-Projekte an, sichert bestehende Configs.
# Aufruf:  powershell -ExecutionPolicy Bypass -File install\windows.ps1 [-HomeDir <Pfad>] [-Force]
#   -HomeDir  Benutzerordner (Standard: %USERPROFILE%). Nur für Tests.
#   -Force    Vorhandene Kit-Skills überschreiben.

param(
    [string]$HomeDir = $env:USERPROFILE,
    [switch]$Force
)

$ErrorActionPreference = 'Stop'

$KitRoot   = Split-Path -Parent $PSScriptRoot
$ClaudeDir = Join-Path $HomeDir '.claude'
$SkillsSrc = Join-Path $KitRoot 'skills'
$SkillsDst = Join-Path $ClaudeDir 'skills'
$Projekte  = Join-Path $HomeDir 'Claude-Projekte'
$Stamp     = Get-Date -Format 'yyyyMMdd'

function Write-Step([string]$Text) { Write-Host "[3K] $Text" }
function Write-Warnung([string]$Text) { Write-Host "[3K] WARNUNG: $Text" -ForegroundColor Yellow }
function Stop-Install([string]$Text) { Write-Host "[3K] ABBRUCH: $Text" -ForegroundColor Red; exit 1 }

# 1. Git
$git = Get-Command git -ErrorAction SilentlyContinue
if ($null -eq $git) {
    Stop-Install "Git ist nicht installiert. Bitte Git for Windows installieren: https://git-scm.com/downloads/win - danach Claude Desktop neu starten und dieses Script noch einmal ausführen."
}
Write-Step "Git gefunden: $(& git --version)"

# 2. Claude wurde mindestens einmal gestartet
if (-not (Test-Path $ClaudeDir)) {
    Stop-Install "Der Ordner $ClaudeDir fehlt. Bitte Claude Desktop einmal öffnen, anmelden und den Tab 'Code' anklicken. Danach dieses Script noch einmal ausführen."
}
Write-Step "Claude-Ordner gefunden: $ClaudeDir"

# Pfad-Check: Leerzeichen oder Umlaute im Benutzerordner
if ($HomeDir -match '\s' -or $HomeDir -match '[^\x00-\x7F]') {
    Write-Warnung "Dein Benutzerordner ($HomeDir) enthält Leerzeichen oder Umlaute. Das funktioniert meistens, aber manche Programme und Skripte stolpern darüber. Meldet später etwas 'Datei nicht gefunden', ist das die erste Stelle zum Nachsehen."
}

# 3. Projektordner
if (-not (Test-Path $Projekte)) {
    New-Item -ItemType Directory -Path $Projekte | Out-Null
    Write-Step "Ordner angelegt: $Projekte"
} else {
    Write-Step "Ordner vorhanden: $Projekte"
}

# 4. Skills kopieren
if (-not (Test-Path $SkillsDst)) { New-Item -ItemType Directory -Path $SkillsDst | Out-Null }
Get-ChildItem -Path $SkillsSrc -Directory | ForEach-Object {
    $dst = Join-Path $SkillsDst $_.Name
    if ((Test-Path $dst) -and (-not $Force)) {
        Write-Warnung "Skill '$($_.Name)' existiert schon in $SkillsDst und wurde übersprungen. Mit -Force überschreiben."
    } else {
        if (Test-Path $dst) { Remove-Item -Recurse -Force -Path $dst }
        Copy-Item -Recurse -Path $_.FullName -Destination $dst
        Write-Step "Skill kopiert: $($_.Name)"
    }
}

# 5. Backups bestehender Configs (nur sichern, nicht ersetzen)
foreach ($name in @('CLAUDE.md', 'settings.json')) {
    $path = Join-Path $ClaudeDir $name
    if (Test-Path $path) {
        $backup = "$path.bak-$Stamp"
        Copy-Item -Path $path -Destination $backup -Force
        Write-Step "Backup: $name -> $(Split-Path -Leaf $backup)"
    }
}

# 6. Nächste Schritte
Write-Host ''
Write-Host 'Fertig. So geht es weiter:'
Write-Host '  1. Claude Desktop öffnen, Tab "Code".'
Write-Host "  2. Ordner wählen: $Projekte"
Write-Host '  3. Im Chat eingeben: /einrichten'
