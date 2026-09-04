# Playbook — Onboarding-Termin

Für die Person, die das Onboarding durchführt. Kundennamen und Notizen zu einzelnen Terminen gehören
**nicht** in dieses Repo, sondern in die eigene Ablage (bei 3K: Vault-Note pro Kunde).

## Warum Claude Code, nicht Cowork

Beide laufen in derselben App auf demselben Modell. Cowork ist der Tab ohne Projektkontext: jede Session
startet bei null, Ordner werden pro Sitzung freigegeben. Claude Code lädt beim Öffnen eines Ordners dessen
CLAUDE.md und HANDOFF.md. Der Kunde arbeitet von Tag 1 in einem Projekt mit Gedächtnis, nicht in
Einzelaufträgen. Das ist die Arbeitsweise, die 3K vermittelt, und die Basis für alles Spätere (Webseite,
Automation). Preis: Git-Installation und ein Terminal-Fenster, das der Kunde nie selbst bedienen muss.

Zwei Dinge ehrlich dazusagen:

- Cowork liefert Office-Skills (Word, PowerPoint, Excel) polierter out of the box. Kein Grund gegen den
  Code-Tab, aber nicht verschweigen.
- Die Kit-Skills (`/einrichten`, `/neues-projekt`, `/feierabend`) erscheinen **nur im Code-Tab**. Cowork
  bezieht seine Skills aus der Customize-Konfiguration des claude.ai-Kontos, nicht aus `~/.claude`.

Antwort auf „Warum nicht der andere Tab?" in einem Satz: *„Der Code-Tab merkt sich dein Projekt, der
Cowork-Tab fängt jedes Mal von vorne an."*

## Phase 0 — Vorab-Mail

Ziel: Der Termin startet ohne Downloads und Wartezeiten. Textbausteine, Anrede anpassen.

**Windows**

> Damit wir beim Termin direkt loslegen können, bitte vorher drei Dinge erledigen:
> 1. Claude-Abo „Pro" abschließen (claude.ai, ca. 20 $/Monat, monatlich kündbar).
> 2. Claude Desktop installieren, einmal öffnen, anmelden und den Tab „Code" anklicken.
>    Download: https://claude.ai/download
> 3. Git for Windows installieren (Standard-Einstellungen durchklicken), danach Claude Desktop neu starten.
>    Download: https://git-scm.com/downloads/win
>
> Wenn etwas hakt: nichts weiter versuchen, wir klären es im Termin.

**Mac**

> Damit wir beim Termin direkt loslegen können, bitte vorher drei Dinge erledigen:
> 1. Claude-Abo „Pro" abschließen (claude.ai, ca. 20 $/Monat, monatlich kündbar).
> 2. Claude Desktop installieren, einmal öffnen, anmelden und den Tab „Code" anklicken.
>    Download: https://claude.ai/download
> 3. Programm „Terminal" öffnen (Spotlight: cmd+Leertaste, „Terminal" tippen), `git --version` eingeben,
>    Enter. Erscheint eine Versionsnummer, ist alles da. Erscheint ein Dialog zur Installation der
>    „Command Line Tools": bestätigen und warten, das kann einige Minuten dauern.
>
> Wenn etwas hakt: nichts weiter versuchen, wir klären es im Termin.

**Zusatz für Kunden, die schon länger mit ChatGPT arbeiten**

Dieser Baustein kommt zu Windows oder Mac dazu, er ersetzt sie nicht. Ohne ihn geht das bisherige
Wissen des Kunden verloren, und das merkt er in der zweiten Woche.

> Du arbeitest ja schon eine Weile mit ChatGPT. Damit das Gelernte nicht verloren geht, gibt es eine
> kurze Anleitung, wie du dieses Wissen in eine Datei bringst, die wir im Termin übernehmen können.
> Rechne mit 20–30 Minuten. Die Anleitung findest du hier: <Link auf docs/wissensuebernahme-chatgpt.md>
>
> Falls du nicht dazu kommst: kein Problem, wir starten dann ohne.

Rechtzeitig schicken — mindestens drei Tage vor dem Termin, sonst entsteht die Datei unter Zeitdruck
und wird nicht geprüft.

## Phase 1 — Termin (ca. 90 Minuten)

| Block | Zeit | Inhalt |
|---|---|---|
| Gespräch | 15 min | siehe Leitfaden unten |
| Installation | 10 min | Repo clonen, Install-Script ausführen |
| `/einrichten` | 20 min | Kunde antwortet, du moderierst |
| Erste Aufgabe | 30 min | gemeinsam im neuen Projekt |
| Abschluss | 10 min | `/feierabend` zeigen, Limits erklären |

### Gesprächsleitfaden (15 min)

Das sind die Fragen, die der Skill nicht stellen kann. Notizen dazu in die eigene Ablage, nicht ins Repo.

1. **Bisherige KI-Nutzung.** Was wurde probiert (ChatGPT im Browser, Copilot, nichts)? Was hat genervt?
   Typisch: Kontext geht verloren, Copy-Paste-Schleifen, Ergebnisse müssen nachbearbeitet werden.
   Das ist der Aufhänger für „Projekt mit Gedächtnis".
   Bei **Copilot** eine Frage weiter: Ist es das kostenlose Copilot Chat oder das kostenpflichtige
   Add-on? Das entscheidet, ob Copilot automatisch über Postfach und SharePoint suchen kann oder nur
   mit dem arbeitet, was gerade offen oder hochgeladen ist. Weiß der Kunde es nicht — der Normalfall —,
   ist das kein Problem: dann ist es eine Frage an seine IT und keine, die im Termin geklärt wird.
   Details in `m365-connector.md`.
2. **Ängste und Erwartungen.** Was soll auf keinen Fall passieren (Daten weg, etwas verschickt, Kosten)?
   Was wäre in vier Wochen ein Erfolg? Beides wörtlich notieren, es taucht in der Nachbereitung wieder auf.
3. **Einstiegsthema finden.** Kriterium: Die Person redet von selbst weiter. Das wird Frage 5 in
   `/einrichten`. Erste Wahl bleibt ein Leidenschaftsthema — Hobby, Verein, Familie, Reise, Sammlung.
   Bringt jemand von sich aus sein Arbeitsthema mit, ist die Frage nicht „privat oder Arbeit", sondern:
   **kommt es ohne Systemzugriff aus?** Texte, Vorlagen, Formulierungen, eingeworfene Beispiele: ja,
   dann ist es sogar das bessere Projekt, weil die Motivation schon da ist. Braucht es Postfach,
   Laufwerk oder Fachanwendung: privates Thema nehmen, das andere als Projekt zwei terminieren.
4. **Warum nicht Cowork** in einem Satz, falls die Frage kommt (siehe oben).

### Installation (10 min)

Windows, in PowerShell (Startmenü, „PowerShell" tippen):

```
git clone https://github.com/3k-digital/3k-ki-onboarding.git "$env:USERPROFILE\3k-ki-onboarding"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\3k-ki-onboarding\install\windows.ps1"
```

Mac, im Terminal:

```
git clone https://github.com/3k-digital/3k-ki-onboarding.git ~/3k-ki-onboarding
bash ~/3k-ki-onboarding/install/mac.sh
```

Das Script meldet jeden Schritt mit `[3K]`. Warnungen lesen, Abbrüche beheben, Script erneut ausführen.
Danach: Claude Desktop, Tab „Code", Ordner `Claude-Projekte` wählen, `/einrichten` eingeben.

### `/einrichten` moderieren (20 min)

- Der Kunde tippt oder wählt selbst. Du erklärst nur, wenn eine Frage unklar ist.
- Bei Frage 3 (Erklär-Tiefe) lieber eine Stufe vorsichtiger wählen. Hochstufen geht später jederzeit.
- Nach dem Interview zeigt Claude die generierte CLAUDE.md. Kurz gemeinsam durchlesen: „Das sind deine
  Regeln, die kannst du jederzeit ändern."

### Erste Aufgabe (30 min)

Claude schlägt eine Aufgabe vor. Ziel ist ein sichtbares Ergebnis in `ergebnis/`.

**Wenn mit Arbeitsmaterial gearbeitet wird: nur anonymisierte oder erfundene Beispiele.** Ein echter
Geschäfts-Thread per Copy-Paste in ein persönliches Claude-Konto ist ein Datentransfer an einen externen
Dienst — auch ohne Connector, nur eben ohne Freigabe und ohne Protokoll. Für eine Demo macht es keinen
Unterschied, für die Anschlussfähigkeit beim Kunden sehr wohl. Einmal ansprechen, nicht dramatisieren. Der Kunde formuliert
selbst, du hältst dich zurück. Wenn Claude nachfragt, lässt du den Kunden antworten. Erklären, was ein
Permission-Prompt ist, wenn der erste erscheint: „Claude fragt, bevor es etwas Wichtiges tut."

### Abschluss (10 min)

- `/feierabend` gemeinsam ausführen, HANDOFF.md zeigen: „Das liest Claude beim nächsten Start."
- Limits: Pro hat ein 5-Stunden-Fenster mit begrenztem Volumen und eine Wochengrenze. Wenn es hakt:
  Pause machen, nicht das Abo wechseln.
- Auto-Modus kurz erwähnen: Claude entscheidet bei unkritischen Aktionen selbst, fragt bei wichtigen.

## Phase 2 — Nachbereitung

- Notiz pro Kunde in der eigenen Ablage: Thema, Erklär-Stufe, Ängste/Erwartungen aus dem Gespräch,
  was gut lief, was hakte. **Nie ins Repo.**
- Follow-up-Termin in zwei Wochen ansetzen. Fragen: Wie oft geöffnet? Wo hängengeblieben? Zweites Projekt?
- Neue Stolpersteine unten ergänzen, Kit anpassen.

## Stolpersteine

- **Git fehlt** (Windows): Code-Tab startet nicht oder Install-Script bricht ab. Git for Windows nachinstallieren, Claude neu starten.
- **Claude Desktop nie geöffnet**: `~/.claude` existiert nicht, Script bricht ab. Einmal öffnen, anmelden, Tab „Code".
- **Windows-Benutzerordner mit Leerzeichen oder Umlaut**: Script warnt. Meist harmlos; bei „Datei nicht gefunden" zuerst hier nachsehen.
- **Mac-Gatekeeper-Dialoge**: „App aus dem Internet geladen" bei Claude Desktop, Command-Line-Tools-Dialog bei `git --version`. Beides bestätigen, warten.
- **Bestehende settings.json**: `/einrichten` fragt. Bei Kunden mit Connectoren (Gmail, Kalender) vorher reinschauen, was drinsteht, bevor „Übernehmen" gewählt wird.
- **Permission-Prompts**: Anfänger klicken reflexartig „Ja". Beim ersten Prompt einmal vorlesen, was gefragt wird.
- **Kunde hat schon Copilot** und fragt, wozu er ein zweites Werkzeug braucht. Keine Abwertung, die
  Rollen sind verschieden: Copilot ist im Tenant zu Hause und findet, was dort liegt. Claude arbeitet in
  Projekten, die sich über Wochen etwas merken, in Dateien, und in wiederverwendbaren Abläufen. In einem
  Satz: *„Copilot weiß, was bei euch liegt. Claude merkt sich, wie du arbeitest."* Was **nicht** gesagt
  wird: dass Copilot nicht handeln könne oder keine Unternehmensdaten sehe — beides ist überholt und
  fällt im nächsten Gespräch mit seiner IT auf ihn zurück.
- **Kunde fragt nach Postfach-Zugriff.** Geht, aber nicht heute: `m365-connector.md`. Im Termin nicht
  anfangen, sonst hängt die verbleibende Zeit an einer Freigabe, die niemand im Raum erteilen kann.
- **Vorwissen-Datei aus ChatGPT fehlt oder ist unbrauchbar.** Kein Grund umzuplanen. `/einrichten`
  fragt einmal danach und läuft ohne genauso durch.
