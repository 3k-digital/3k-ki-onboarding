---
name: einrichten
description: "Einmalige Einrichtung von Claude Code für eine neue Person: kurzes Interview, dann globale CLAUDE.md, settings.json und ein erstes Projekt unter ~/Claude-Projekte. Nur auf ausdrückliche Anweisung starten."
disable-model-invocation: true
argument-hint: "(keine Argumente)"
allowed-tools:
  - Read
  - Write
  - Bash
  - Glob
  - AskUserQuestion
---

# /einrichten — Erst-Einrichtung

Du richtest Claude Code für eine Person ein, die den Computer meist über Browser und Office kennt.
Sprich Deutsch, freundlich, ohne Fachjargon. Eine Frage pro Nachricht. Nichts wird geschrieben, bevor
das Interview vollständig ist.

Dateien dieses Skills liegen in `~/.claude/skills/einrichten/`. Home-Verzeichnis ermitteln mit `echo ~`
(Windows: `%USERPROFILE%`). Alle Pfade unten sind relativ dazu.

## Schritt 1 — Vorbedingungen prüfen

1. `~/.claude/` existiert (sonst: „Bitte Claude Desktop einmal öffnen, anmelden, Tab *Code* wählen" und stoppen).
2. `~/.claude/CLAUDE.md` lesen, falls vorhanden:
   - Enthält sie die Kopfzeile `<!-- 3k-ki-onboarding` → fragen: **Überschreiben** oder **Abbrechen**. Bei Abbrechen: stoppen, nichts schreiben.
   - Ohne diese Kopfzeile → wird am Ende ersetzt. Existiert noch kein Backup `CLAUDE.md.bak-*`, jetzt eines anlegen (`CLAUDE.md.bak-YYYYMMDD`).
3. `~/.claude/settings.json` merken, ob vorhanden (Entscheidung folgt in Schritt 4).

## Schritt 2 — Interview

Lies `interview.md` und stelle die fünf Fragen in der dort festgelegten Reihenfolge, je eine Nachricht,
per AskUserQuestion. Defaults als erste Option markieren. Bricht die Person ab: stoppen, nichts schreiben.

Nach Frage 5 in drei Sätzen zusammenfassen, was du gleich anlegst (globale Regeln, Sicherheitsregeln,
Projektordner mit Namen), und mit einer Frage bestätigen lassen.

## Schritt 3 — Globale CLAUDE.md schreiben

`templates/global-CLAUDE.md` lesen, alle `{{slots}}` mit den Slot-Texten aus `interview.md` füllen,
`{{datum}}` = heute (`YYYY-MM-DD`). Nach `~/.claude/CLAUDE.md` schreiben. Ziel: unter 60 Zeilen.
Keine zusätzlichen Abschnitte erfinden.

## Schritt 4 — settings.json

- Keine `~/.claude/settings.json` vorhanden → `templates/settings.json` unverändert dorthin kopieren.
- Vorhanden → erst Backup sicherstellen (`settings.json.bak-YYYYMMDD`, falls noch keins), dann fragen:
  **Übernehmen** (Kit-Regeln ersetzen die Datei) oder **Behalten** (Datei bleibt unangetastet). Bei
  Behalten kurz sagen, welche Sicherheitsregeln dann fehlen (Nachfrage vor Löschen, Versenden, Push).
  Nicht mergen.

Was die Regeln tun, in einem Satz erklären: „Claude fragt ab jetzt immer nach, bevor etwas gelöscht,
verschickt, hochgeladen oder veröffentlicht wird."

## Schritt 5 — Erstes Projekt anlegen

Folge `~/.claude/skills/neues-projekt/SKILL.md` ab dessen Schritt 2 mit den Antworten aus Frage 5.
**Keine zweite Befragung.** Ergebnis: `~/Claude-Projekte/<slug>/` mit `CLAUDE.md`, `HANDOFF.md`,
`material/`, `ergebnis/`.

## Schritt 6 — Erste Aufgabe vorschlagen

Schlage **eine** kleine Aufgabe vor, die in zehn Minuten ein sichtbares Ergebnis im Projekt bringt
(z. B. Gliederung als Datei in `ergebnis/`, erste Tabelle, Startseiten-Skizze). Trage sie in der
`HANDOFF.md` unter „Nächster Schritt" ein. Dann fragen: **Jetzt loslegen** oder **Später**.
Nicht ohne Antwort starten.

Zum Schluss in drei Zeilen: wo die Dateien liegen, wie man das Projekt in Claude Desktop öffnet
(Ordner `~/Claude-Projekte/<slug>` wählen), und dass `/feierabend` das Session-Ende ist.
