---
name: neues-projekt
description: "Legt ein neues Projekt unter ~/Claude-Projekte an: vier kurze Fragen, dann Ordner mit CLAUDE.md und HANDOFF.md. Trigger: 'neues Projekt', 'Projekt anlegen', '/neues-projekt'."
argument-hint: "[projektname]"
allowed-tools:
  - Read
  - Write
  - Bash
  - Glob
  - AskUserQuestion
---

# /neues-projekt

Sprich Deutsch, eine Frage pro Nachricht. Vorlagen liegen in `~/.claude/skills/neues-projekt/templates/`.
Home-Verzeichnis: `echo ~` (Windows: `%USERPROFILE%`).

## Schritt 1 — Fragen

Wurde ein Projektname als Argument übergeben, entfällt die erste Frage.

1. **Worum geht es?** Freitext → `{{projektname}}`.
2. **Ziel in einem Satz** → `{{ziel}}`.
3. **Woran merkst du, dass es fertig ist?** → `{{fertig}}`.
4. **Art:** Texte (Default) · Daten/Tabellen · Web · Sonstiges → `{{art}}`.

Geht es erkennbar um ein **berufliches** Thema — Kunden, Verträge, Angebote, Bewerbungen, Personal,
Rechnungen —, kommt eine fünfte Frage dazu: **Was legst du in `material/` ab?**

| Option | Slot `{{datenregel}}` |
|---|---|
| Erfundene oder anonymisierte Beispiele **(Default)** | „In `material/` liegen nur anonymisierte oder erfundene Beispiele. Weise mich darauf hin, wenn eine Datei echte Namen, Firmen oder Vertragsdaten zu enthalten scheint." |
| Echte Unterlagen, die Freigabe dafür ist geklärt | „In `material/` dürfen echte Unterlagen liegen; die Freigabe dafür ist geklärt. Nichts davon verlässt diesen Ordner ohne meine ausdrückliche Zustimmung." |
| Echte Unterlagen, Freigabe noch offen | „Die Freigabe für echte Unterlagen ist noch nicht geklärt. Bis dahin gehören nur anonymisierte oder erfundene Beispiele in `material/`. Sag mir Bescheid, wenn eine Datei echt aussieht." |

Frag das ohne erhobenen Zeigefinger — es ist eine Sachfrage, keine Belehrung. Bei privaten Themen
(Hobby, Verein, Familie) entfällt sie, `{{datenregel}}` bleibt leer und der Abschnitt im Template
wird weggelassen.

## Schritt 2 — Slug bilden

Aus `{{projektname}}`: Kleinbuchstaben, ä→ae ö→oe ü→ue ß→ss, Leerzeichen→`-`, alles außer `a-z0-9-` entfernen,
doppelte `-` zusammenziehen. Beispiel: „Kochbuch der Familie" → `kochbuch-der-familie`.

Existiert `~/Claude-Projekte/<slug>/` bereits: fragen, ob **anderer Name** oder **Abbrechen**. Nie in einen
bestehenden Ordner schreiben.

## Schritt 3 — Anlegen

1. Ordner: `~/Claude-Projekte/<slug>/`, darin `material/` und `ergebnis/`.
2. `templates/projekt-CLAUDE.md` mit Slots füllen → `<slug>/CLAUDE.md`.
3. `templates/HANDOFF.md` mit Slots füllen → `<slug>/HANDOFF.md`. `{{datum}}` = heute (`YYYY-MM-DD`).
   `{{erste_aufgabe}}` = die Aufgabe aus Schritt 4.
4. Art „Web": `git init` im Projektordner anbieten (Frage, nicht automatisch). Bei allen anderen Arten kein Git.

## Schritt 4 — Erste Aufgabe

Schlage **eine** Aufgabe vor, die in zehn Minuten ein sichtbares Ergebnis in `ergebnis/` bringt, und trage sie
in `HANDOFF.md` unter „Nächster Schritt" ein. Dann direkt anfangen — keine Auswahlfrage, ein Satz
genügt: „Ich schlage vor, wir machen als Erstes … — sag Stopp, wenn du lieber etwas anderes möchtest."

## Schritt 5 — Abschluss

Drei Zeilen: Pfad des Ordners · wie man ihn in Claude Desktop öffnet (Tab *Code*, Ordner wählen) ·
`/feierabend` am Ende der Session.
