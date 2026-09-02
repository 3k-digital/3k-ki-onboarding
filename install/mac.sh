#!/usr/bin/env bash
# 3K KI-Onboarding — Installer für macOS (zsh/bash)
# Prüft Command Line Tools, Git und Claude, kopiert die Kit-Skills, legt ~/Claude-Projekte an,
# sichert bestehende Configs.
# Aufruf:  bash install/mac.sh [--home <Pfad>] [--force]
#   --home   Benutzerordner (Standard: $HOME). Nur für Tests.
#   --force  Vorhandene Kit-Skills überschreiben.
#
# Stand: ungetestet auf echter Hardware (siehe README).

set -euo pipefail

HOME_DIR="$HOME"
FORCE=0
while [[ $# -gt 0 ]]; do
  case "$1" in
    --home) HOME_DIR="$2"; shift 2 ;;
    --force) FORCE=1; shift ;;
    *) echo "Unbekannte Option: $1"; exit 1 ;;
  esac
done

KIT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLAUDE_DIR="$HOME_DIR/.claude"
SKILLS_SRC="$KIT_ROOT/skills"
SKILLS_DST="$CLAUDE_DIR/skills"
PROJEKTE="$HOME_DIR/Claude-Projekte"
STAMP="$(date +%Y%m%d)"

step()    { echo "[3K] $*"; }
warnung() { echo "[3K] WARNUNG: $*"; }
abbruch() { echo "[3K] ABBRUCH: $*"; exit 1; }

# 1. Command Line Tools und Git
if ! xcode-select -p >/dev/null 2>&1; then
  abbruch "Die Command Line Tools fehlen. Bitte im Terminal 'git --version' eingeben. macOS bietet dann die Installation an: bestätigen, warten, danach dieses Script noch einmal ausführen."
fi
if ! command -v git >/dev/null 2>&1; then
  abbruch "Git wurde nicht gefunden. Bitte im Terminal 'git --version' eingeben und den Installations-Dialog bestätigen. Danach dieses Script noch einmal ausführen."
fi
step "Git gefunden: $(git --version)"

# 2. Claude wurde mindestens einmal gestartet
if [[ ! -d "$CLAUDE_DIR" ]]; then
  abbruch "Der Ordner $CLAUDE_DIR fehlt. Bitte Claude Desktop einmal öffnen, anmelden und den Tab 'Code' anklicken. Danach dieses Script noch einmal ausführen."
fi
step "Claude-Ordner gefunden: $CLAUDE_DIR"

# 3. Projektordner
if [[ ! -d "$PROJEKTE" ]]; then
  mkdir -p "$PROJEKTE"
  step "Ordner angelegt: $PROJEKTE"
else
  step "Ordner vorhanden: $PROJEKTE"
fi

# 4. Skills kopieren
mkdir -p "$SKILLS_DST"
for src in "$SKILLS_SRC"/*/; do
  name="$(basename "$src")"
  dst="$SKILLS_DST/$name"
  if [[ -d "$dst" && $FORCE -eq 0 ]]; then
    warnung "Skill '$name' existiert schon in $SKILLS_DST und wurde übersprungen. Mit --force überschreiben."
  else
    rm -rf "$dst"
    cp -R "$src" "$dst"
    step "Skill kopiert: $name"
  fi
done

# 5. Backups bestehender Configs (nur sichern, nicht ersetzen)
for name in CLAUDE.md settings.json; do
  path="$CLAUDE_DIR/$name"
  if [[ -f "$path" ]]; then
    cp "$path" "$path.bak-$STAMP"
    step "Backup: $name -> $name.bak-$STAMP"
  fi
done

# 6. Nächste Schritte
echo
echo "Fertig. So geht es weiter:"
echo "  1. Claude Desktop öffnen, Tab \"Code\"."
echo "  2. Ordner wählen: $PROJEKTE"
echo "  3. Im Chat eingeben: /einrichten"
