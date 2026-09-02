# Interview für `/einrichten`

Fünf Fragen, feste Reihenfolge, **eine Frage pro Nachricht** (AskUserQuestion). Jede Auswahlfrage
hat automatisch eine Freitext-Option. Erst wenn alle fünf Antworten vorliegen, wird etwas geschrieben.
Bricht die Person ab, wird nichts geschrieben.

Die Slots rechts füllen `templates/global-CLAUDE.md` und die Projektvorlagen aus `neues-projekt`.

## Frage 1 — Name, Anrede, Sprache

Drei Teilfragen in einer Nachricht.

| Teilfrage | Optionen | Slot |
|---|---|---|
| Wie heißt du / heißen Sie? | Freitext | `{{name}}` (Vorname reicht) |
| Anrede | **Du** (Default) · Sie | `{{anrede}}` → „Du" oder „Sie" |
| Sprache | **Deutsch** (Default) · andere (Freitext) | `{{sprache}}` |

## Frage 2 — Rolle und Alltag

Freitext, 1–2 Sätze: „Was machst du beruflich, und wie sieht ein normaler Arbeitstag aus?"

Slots: `{{rolle}}` (Kurzform, z. B. „Physiotherapeutin mit eigener Praxis"), `{{alltag}}` (ein Satz).

## Frage 3 — Erklär-Tiefe

„Wie vertraut bist du mit Ordnern, Dateipfaden und dem Computer allgemein?"

| Option | Slot `{{erklaerungen}}` |
|---|---|
| Ich arbeite viel am Computer, Ordner und Dateipfade sind mir vertraut | Fachbegriffe ohne lange Erklärung, Dateipfade nur nennen. |
| Ich nutze Office und Browser, mit Ordnerstrukturen eher wenig **(Default)** | Dateipfade, Fachbegriffe und Befehle beim ersten Auftreten kurz erklären. Nie voraussetzen, dass ich weiß, wo eine Datei liegt. |
| Computer sind nicht mein Ding | Alles Schritt für Schritt, nur ein Schritt pro Nachricht, jeden Fachbegriff erklären. Immer sagen, wo eine Datei liegt und wie man sie öffnet. |

## Frage 4 — Arbeitsstil

Drei Teilfragen in einer Nachricht.

| Teilfrage | Optionen | Slot |
|---|---|---|
| Antwortlänge | **Kurz, nur das Nötige** (Default) · Ausführlich mit Hintergrund | `{{antwortlaenge}}` |
| Rückfragen | **Bei Unklarheit nachfragen** (Default) · Einfach machen, ich korrigiere danach | `{{rueckfragen}}` |
| Änderungen an bestehenden Dateien | Immer vorher fragen · **Nur vor Löschen und Überschreiben fragen** (Default) · Einfach machen, Löschen bleibt Frage | `{{dateiaenderungen}}` |

Slot-Texte:

- `{{antwortlaenge}}`: „Kurz. Nur das, was ich für den nächsten Schritt brauche." / „Ausführlich. Hintergrund und Alternativen dazu."
- `{{rueckfragen}}`: „Bei Unklarheit erst fragen, dann machen." / „Bei Unklarheit die wahrscheinlichste Lesart nehmen, machen, und sagen, was angenommen wurde."
- `{{dateiaenderungen}}`: „Vor jeder Änderung an einer bestehenden Datei fragen." / „Kleine Änderungen einfach machen. Vor Löschen und Überschreiben immer fragen." / „Änderungen machen und danach kurz sagen, was sich geändert hat. Löschen bleibt immer eine Frage."

## Frage 5 — Erstes Projekt

Bewusst **privat**: ein Thema, das Spaß macht, kein Arbeits-Schmerzpunkt. Vier Teilfragen in einer Nachricht.

| Teilfrage | Optionen | Slot |
|---|---|---|
| Worum geht es? | Freitext (z. B. „Kochbuch der Familie", „Vereinschronik", „Reiseplanung Norwegen") | `{{projektname}}` |
| Ziel in einem Satz | Freitext | `{{ziel}}` |
| Woran merkst du, dass es fertig ist? | Freitext | `{{fertig}}` |
| Art | **Texte** · Daten/Tabellen · Web · Sonstiges | `{{art}}` |

Der Projektname wird zum Ordnernamen (Slug): Kleinbuchstaben, ä→ae ö→oe ü→ue ß→ss, Leerzeichen→`-`, Rest weg.
Beispiel: „Kochbuch der Familie" → `kochbuch-der-familie`.

## Slots, die nicht gefragt werden

- `{{datum}}`: heutiges Datum, `YYYY-MM-DD`.
- `{{erste_aufgabe}}`: schlägt Claude nach dem Interview selbst vor (siehe SKILL.md, Schritt 6).
