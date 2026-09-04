# 3K KI-Onboarding

Starter-Kit für den Einstieg in Claude Code (Desktop-App, Tab „Code") für Menschen, die den Computer vor
allem über Browser und Office kennen. Ein kurzes Interview, danach hat Claude deine Regeln, deine
Sicherheitseinstellungen und ein erstes Projekt mit Gedächtnis.

## Was drin ist

| Ordner | Inhalt |
|---|---|
| `install/` | Ein Script pro System. Prüft Git und Claude, kopiert die Skills, legt `~/Claude-Projekte` an, sichert bestehende Einstellungen. Sonst nichts. |
| `skills/einrichten` | `/einrichten` — fünf Fragen, dann globale `CLAUDE.md`, `settings.json` und erstes Projekt. |
| `skills/neues-projekt` | `/neues-projekt` — legt später weitere Projekte an. |
| `skills/feierabend` | `/feierabend` — schreibt am Ende einer Session den Stand in die `HANDOFF.md`. |
| `docs/` | Playbook und Checkliste für die Person, die das Onboarding durchführt, plus zwei Anleitungen: Wissen aus ChatGPT übernehmen, Microsoft 365 anbinden. |

## Voraussetzungen

- Claude-Abo „Pro" oder höher
- Claude Desktop installiert, einmal geöffnet, angemeldet, Tab „Code" angeklickt
- Windows: Git for Windows (https://git-scm.com/downloads/win), danach Claude neu starten
- Mac: Command Line Tools (im Terminal `git --version` eingeben, Dialog bestätigen)

## Drei Schritte

**Windows** (PowerShell):

```
git clone https://github.com/3k-digital/3k-ki-onboarding.git "$env:USERPROFILE\3k-ki-onboarding"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\3k-ki-onboarding\install\windows.ps1"
```

**Mac** (Terminal):

```
git clone https://github.com/3k-digital/3k-ki-onboarding.git ~/3k-ki-onboarding
bash ~/3k-ki-onboarding/install/mac.sh
```

Dann: Claude Desktop öffnen, Tab „Code", Ordner `Claude-Projekte` wählen, `/einrichten` eingeben.

> `install/mac.sh` ist bisher **ungetestet** auf echter Hardware. Rückmeldungen willkommen.

## Was `/einrichten` anlegt

- `~/.claude/CLAUDE.md` — deine Regeln (Anrede, Erklär-Tiefe, Arbeitsstil, Grenzen). Unter 60 Zeilen, jederzeit änderbar.
- `~/.claude/settings.json` — Claude fragt nach, bevor etwas gelöscht, verschoben, verschickt, hochgeladen oder per `git push` veröffentlicht wird.
- `~/Claude-Projekte/<projekt>/` — `CLAUDE.md` (Ziel), `HANDOFF.md` (Stand), `material/`, `ergebnis/`.

Bestehende `CLAUDE.md` und `settings.json` werden vom Install-Script als `*.bak-YYYYMMDD` gesichert.
Bei vorhandener `settings.json` fragt `/einrichten`, ob sie ersetzt werden soll.

## Lizenz

MIT, siehe `LICENSE`.
