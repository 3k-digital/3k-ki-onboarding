# IT-Freigabe — Argumentationsgrundlage

Für das Gespräch mit der IT-Abteilung eines Kunden, wenn die Installation der Claude-Desktop-App blockiert
ist oder eine datenschutzrechtliche Grundlage verlangt wird. Kein Kundendokument im Rohzustand: Stand
prüfen, auf den konkreten Fall kürzen, dann weitergeben.

**Stand der Recherche: 8. September 2026.** Vertragsdokumente ändern sich; vor jedem Gespräch die verlinkten
Originalquellen aufrufen, statt sich auf diese Zusammenfassung zu berufen.

## Die zwei Fragen trennen

Blockaden entstehen regelmäßig, weil zwei unabhängige Fragen als eine behandelt werden:

1. **Darf dieses Programm auf dem Endgerät installiert werden?** Eine Endpoint- und Betriebsfrage.
2. **Dürfen personenbezogene Daten an diesen Anbieter übermittelt werden?** Eine datenschutzrechtliche
   Frage nach Art. 28 DSGVO.

Frage 1 lässt sich unabhängig von Frage 2 beantworten, denn die Nutzung im Browser wirft dieselben
datenschutzrechtlichen Fragen auf wie die Desktop-App — die App ist ein Client, kein zusätzlicher
Datenweg. Umgekehrt gilt: Ist Frage 2 geklärt, ist Frage 1 damit nicht automatisch mitentschieden.

## Frage 1 — Installation

| Angabe | Wert |
|---|---|
| Programm | Claude Desktop |
| Herausgeber | Anthropic PBC |
| Bezugsquelle | https://claude.ai/download |
| Funktion | Client für den Dienst claude.ai; zusätzlich lokaler Arbeitsmodus, der Dateien in einem vom Nutzer freigegebenen Ordner liest und schreibt |
| Netzwerk | ausgehend HTTPS zu Anthropic-Endpunkten |

Zu klären ist, ob die Installation Administratorrechte benötigt oder im Benutzerkontext erfolgt, und ob
eine Freigabe im Software-Katalog des Unternehmens möglich ist. Beides hängt von der jeweiligen
Endpoint-Konfiguration ab und lässt sich nur intern beantworten.

Der lokale Arbeitsmodus ist der eigentliche Unterschied zur Browser-Nutzung: Das Programm liest und
schreibt Dateien in einem Ordner, den der Nutzer explizit auswählt. Wer das nicht möchte, kann die
Freigabe auf einen eigens angelegten Ordner beschränken.

## Frage 2 — Vertragliche Grundlage

Der Punkt, der in der Praxis für Verwirrung sorgt: **Ein Auftragsverarbeitungsvertrag muss bei Anthropic
nicht verhandelt oder gesondert unterzeichnet werden.** Er ist Bestandteil der Commercial Terms.

- Die [Commercial Terms of Service](https://www.anthropic.com/legal/commercial-terms) binden das
  [Data Processing Addendum](https://www.anthropic.com/legal/data-processing-addendum) durch Verweis ein.
  Das DPA ist der Auftragsverarbeitungsvertrag nach Art. 28 DSGVO.
- Das DPA erklärt die EU-Standardvertragsklauseln (Module 2 und 3) für anwendbar und enthält Anhänge für
  UK- und Schweizer Recht. Als zuständige Aufsichtsbehörde ist Irland benannt.
- Unterauftragsverarbeiter sind unter https://www.anthropic.com/subprocessors gelistet; für neue
  Unterauftragsverarbeiter besteht ein Widerspruchsfenster.
- Die Commercial Terms schließen ein Training auf Kundeninhalten aus.

**Entscheidend ist der Kontotyp, nicht das Produkt.** Die Commercial Terms und damit das DPA gelten für die
gewerblichen Angebote (Claude for Work, also Team und Enterprise, sowie die API). Für Claude Free, Pro und
Max gelten die Consumer Terms; dort gibt es keinen Auftragsverarbeitungsvertrag. Ein persönliches
Pro-Konto ist deshalb keine Grundlage für die Verarbeitung personenbezogener Daten des Unternehmens —
unabhängig davon, ob im Browser oder in der App gearbeitet wird.

## Was nicht abgedeckt ist

Damit im Gespräch nichts zugesagt wird, was später zurückgenommen werden muss:

- **Keine EU-Datenresidenz für die First-Party-Dienste.** Nach übereinstimmenden Drittquellen findet die
  Verarbeitung auf US-Infrastruktur statt; der Drittlandtransfer wird über die im DPA eingebundenen
  Standardvertragsklauseln abgesichert. Anthropic weist EU-Residenz für Claude Team oder Enterprise nicht
  als Funktion aus. Wer echte EU-Residenz benötigt, kommt an einem Bezug über AWS Bedrock oder Google
  Vertex AI in einer EU-Region nicht vorbei — eine andere Architektur als die hier besprochene.
  *Diesen Punkt sollte die IT selbst beim Anbieter bestätigen lassen, bevor sie darauf aufbaut.*
- **Zero Data Retention** ist den gewerblichen Vereinbarungen oberhalb des Team-Plans vorbehalten.
- Eine Datenschutz-Folgenabschätzung, ein Verzeichnis von Verarbeitungstätigkeiten und die Bewertung nach
  den internen Richtlinien bleiben Sache des Unternehmens. Diese Zusammenfassung ersetzt keine
  Rechtsberatung.

## Was ohne geklärte Freigabe möglich ist

Für den Einstieg wird kein Auftragsverarbeitungsvertrag benötigt, solange keine personenbezogenen Daten
verarbeitet werden. Praktisch heißt das: eigene Textvorlagen, Formulierungshilfen, Struktur- und
Gliederungsarbeit, öffentlich zugängliche Informationen sowie anonymisierte oder frei erfundene Beispiele.
Nicht dazu gehören Auszüge aus dem Postfach, Personal- und Kundendaten, Vertragsunterlagen und alles, was
Rückschlüsse auf einzelne Personen zulässt.

Diese Abgrenzung trägt eine Einführung und die ersten Wochen. Sie trägt nicht dauerhaft: Sobald mit echtem
Arbeitsmaterial gearbeitet werden soll, führt der Weg über ein Konto unter den Commercial Terms.

## Offene Punkte für das Gespräch

- Welcher Kontotyp liegt vor oder ist vorgesehen: persönliches Pro-Konto oder ein vom Unternehmen
  verwaltetes Team- beziehungsweise Enterprise-Konto?
- Ist die Blockade eine generelle Endpoint-Richtlinie oder eine Einzelfallentscheidung zu diesem Programm?
- Wird EU-Datenresidenz gefordert? Falls ja, ist das eine Architekturentscheidung und keine Vertragsfrage.
- Wer entscheidet, und was braucht diese Stelle als Nachweis?
