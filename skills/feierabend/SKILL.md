---
name: feierabend
description: "Session-Ende: fasst zusammen, was erledigt und offen ist, und schreibt den Stand in die HANDOFF.md des Projekts. Trigger: 'Feierabend', 'Schluss für heute', 'Session beenden', '/feierabend'."
argument-hint: "(keine Argumente)"
allowed-tools:
  - Read
  - Edit
  - Write
  - Bash
  - Glob
  - AskUserQuestion
---

# /feierabend

Sprich Deutsch. Ziel: Beim nächsten Start weiß Claude in zwei Sätzen, wo wir stehen.

## Schritt 1 — Projekt erkennen

`HANDOFF.md` im aktuellen Arbeitsordner suchen. Fehlt sie: sagen „Hier ist kein Projektordner
(keine HANDOFF.md). Bitte den Projektordner unter ~/Claude-Projekte öffnen oder /neues-projekt starten."
und stoppen. Nichts anlegen.

## Schritt 2 — Zusammenfassen

Aus dem Sessionverlauf drei Blöcke bilden, je maximal fünf Stichpunkte:

- **Erledigt** — was heute entstanden oder geändert wurde (Dateinamen nennen).
- **Offen** — was angefangen, aber nicht fertig ist; was die Person noch entscheiden muss.
- **Nächster Schritt** — genau einer, konkret genug, um sofort loszulegen.

Vorschlag zeigen und fragen: **Übernehmen**, **Ändern** (Freitext), **Abbrechen**.

## Schritt 3 — HANDOFF.md aktualisieren

Nach Bestätigung:

- Abschnitt `## Stand` komplett ersetzen: Datum + die Erledigt-Punkte.
- Abschnitt `## Offen` komplett ersetzen.
- Abschnitt `## Nächster Schritt` komplett ersetzen.
- Abschnitt `## Log`: eine Zeile **anhängen**: `- YYYY-MM-DD — <ein Satz>`. Bestehende Log-Zeilen bleiben.

Andere Abschnitte und Dateien nicht anfassen.

## Schritt 4 — Optional: Git

Nur wenn im Projektordner ein `.git`-Ordner liegt: fragen, ob der Stand gesichert werden soll.
Bei Ja zwei **getrennte** Befehle, nacheinander, kein `&&`:

```
git add -A
```

```
git commit -m "Feierabend YYYY-MM-DD"
```

Kein `git push`. Kein `.git` → diesen Schritt still überspringen.

## Schritt 5 — Abschluss

Zwei Zeilen: „HANDOFF.md aktualisiert" und der nächste Schritt. Kein weiterer Vorschlag, keine Nachfrage.
