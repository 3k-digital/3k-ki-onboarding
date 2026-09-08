# Checkliste — Onboarding-Termin

Zum Ausdrucken oder Abhaken. Details in `playbook.md`.

## Vorab (eine Woche vorher)

- [ ] Bei Dienstrechner: geklärt, ob auf dem Gerät installiert werden darf — Frage mit Programmname
      (Claude Desktop) und Herausgeber (Anthropic) an die IT, nicht als Frage nach „KI"
- [ ] Kontotyp geklärt: verwaltetes Team-/Enterprise-Konto oder persönliches Pro-Konto (entscheidet,
      ob mit echtem Arbeitsmaterial gearbeitet werden darf)
- [ ] Vorab-Mail geschickt (Windows- oder Mac-Variante); Git/CLT darin als optional gekennzeichnet
- [ ] Falls möglich: kurzes Teams-Gespräch vorab für Abo, App und Git — spart im Termin 10 Minuten
- [ ] Bei Kunden mit ChatGPT-Historie: Hinweis mitgeschickt, ChatGPT-Zugang griffbereit zu halten
- [ ] Termin 90 min geblockt, Screenshare oder vor Ort geklärt
- [ ] Repo-Link griffbereit

## Termin

**Gespräch (15 min)**
- [ ] Bisherige KI-Nutzung, was genervt hat
- [ ] Bei Copilot: Lizenzstufe gefragt (oder als Frage an die IT notiert)
- [ ] Ängste und Erwartungen wörtlich notiert
- [ ] Einstiegsthema gefunden (Person redet von selbst weiter, kommt ohne Systemzugriff aus)

**Installation (10 min)**
- [ ] Abo aktiv, Claude Desktop geöffnet, Tab „Code" war schon offen
- [ ] `git --version` zeigt Versionsnummer (sonst: jetzt gemeinsam installieren, +10 min)
- [ ] Repo geclont
- [ ] Install-Script gelaufen, keine `ABBRUCH`-Zeile, Warnungen gelesen
- [ ] Claude Desktop, Ordner `Claude-Projekte` geöffnet
- [ ] Falls die App durch die IT blockiert ist: auf den Browser-Pfad gewechselt statt weiterzusuchen

**Browser-Pfad (nur falls die Desktop-App nicht installierbar ist)**
- [ ] Projekt auf claude.ai angelegt, Projektanweisung gemeinsam gefüllt (ersetzt `/einrichten`)
- [ ] Wissensraum mit den ersten Dateien bestückt
- [ ] Gesagt, was heute fehlt und was nach der Freigabe dazukommt
- [ ] `it-freigabe.md` mitgegeben, Freigabe als Aufgabe für den Folgetermin notiert

**`/einrichten` (20 min)**
- [ ] Nach ChatGPT-Wissen gefragt; bei Bedarf Kurzpfad gemacht (ca. 5 min)
- [ ] „Zu prüfen" und „Heikel" gemeinsam durchgegangen, Kunde hat entschieden
- [ ] Fünf Fragen beantwortet, Kunde hat selbst getippt
- [ ] CLAUDE.md gemeinsam gelesen
- [ ] settings.json übernommen (oder bewusst behalten)
- [ ] Projektordner existiert mit CLAUDE.md und HANDOFF.md

**Erste Aufgabe (30 min)**
- [ ] Nur anonymisierte oder erfundene Beispiele verwendet, falls mit Arbeitsmaterial gearbeitet wurde
- [ ] Sichtbares Ergebnis in `ergebnis/`
- [ ] Ersten Permission-Prompt erklärt

**Abschluss (10 min)**
- [ ] `/feierabend` ausgeführt, HANDOFF.md gezeigt
- [ ] Limits erklärt (5-Stunden-Fenster, Wochengrenze)
- [ ] Auto-Modus erwähnt
- [ ] Follow-up-Termin in zwei Wochen vereinbart

## Danach

- [ ] Kunden-Notiz in eigener Ablage (nicht im Repo)
- [ ] Neue Stolpersteine ins Playbook
