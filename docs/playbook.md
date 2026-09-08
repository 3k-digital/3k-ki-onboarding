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

**Bei Kunden mit Dienstrechner vor allem anderen: Darf auf dem Gerät überhaupt installiert werden?** Nicht
im Sinne von Adminrechten, sondern: Unterbindet eine Endpoint-Richtlinie die Installation nicht
freigegebener Programme? Die Frage gehört vor die Vorab-Mail, weil sie über den ganzen Termin entscheidet.
Kann der Kunde sie nicht beantworten — der Normalfall —, ist es eine Frage an seine IT, und zwar konkret
mit Programmname (Claude Desktop) und Herausgeber (Anthropic), nicht als allgemeine Frage nach „KI".
Kommt die Antwort nicht rechtzeitig oder fällt sie negativ aus, ist der Termin nicht verloren: dann läuft
er auf dem Browser-Pfad (siehe unten). Argumente für das IT-Gespräch stehen in `it-freigabe.md`.

Punkt 1 und 2 (Abo, Desktop-App) sind Pflicht — ohne sie ist der Termin verloren. **Punkt 3 (Git bzw.
Command Line Tools) ist ausdrücklich optional.** Wer nicht regelmäßig etwas installiert, scheitert daran
allein oder installiert das Falsche, und beides kostet im Termin mehr Zeit, als gemeinsam neu anzufangen.
Besser als eine Hausaufgabe, die niemand macht: **ein kurzes Teams-Gespräch ein paar Tage vorher**, in
dem Abo, App und Git zusammen erledigt werden. Dann bleiben die 90 Minuten für den Inhalt.

**Windows**

> Damit wir beim Termin direkt loslegen können, bitte vorher drei Dinge erledigen:
> 1. Claude-Abo „Pro" abschließen (claude.ai, ca. 20 $/Monat, monatlich kündbar).
> 2. Claude Desktop installieren, einmal öffnen, anmelden und den Tab „Code" anklicken.
>    Download: https://claude.ai/download
> 3. **Falls du dir das zutraust** — sonst überspringen, wir machen es gemeinsam: Git for Windows
>    installieren (Standard-Einstellungen durchklicken), danach Claude Desktop neu starten.
>    Download: https://git-scm.com/downloads/win
>
> Wenn etwas hakt: nichts weiter versuchen, wir klären es im Termin.

**Mac**

> Damit wir beim Termin direkt loslegen können, bitte vorher drei Dinge erledigen:
> 1. Claude-Abo „Pro" abschließen (claude.ai, ca. 20 $/Monat, monatlich kündbar).
> 2. Claude Desktop installieren, einmal öffnen, anmelden und den Tab „Code" anklicken.
>    Download: https://claude.ai/download
> 3. **Falls du dir das zutraust** — sonst überspringen, wir machen es gemeinsam: Programm „Terminal"
>    öffnen (Spotlight: cmd+Leertaste, „Terminal" tippen), `git --version` eingeben, Enter. Erscheint
>    eine Versionsnummer, ist alles da. Erscheint ein Dialog zur Installation der „Command Line Tools":
>    bestätigen und warten, das kann einige Minuten dauern.
>
> Wenn etwas hakt: nichts weiter versuchen, wir klären es im Termin.

**Zusatz für Kunden, die schon länger mit ChatGPT arbeiten**

Nur ein Hinweis, **keine Hausaufgabe**. Die Übernahme selbst passiert im Termin (siehe unten) — sie
dauert etwa fünf Minuten und braucht ohnehin deine Moderation, weil der Kunde entscheiden muss, was
aus seinen Erinnerungen mitkommt.

> Du arbeitest ja schon eine Weile mit ChatGPT. Das dort entstandene Wissen über deine Arbeitsweise
> nehmen wir im Termin mit — dafür musst du nichts vorbereiten. Halte nur deinen ChatGPT-Zugang
> griffbereit, damit wir uns dort kurz einloggen können.

Der einzige Grund für diese Zeile ist das Passwort: Wer sich im Termin nicht einloggen kann, verliert
den Kurzpfad, und nachträglich wird es mühsamer.

## Phase 1 — Termin (ca. 90 Minuten)

| Block | Zeit | Inhalt |
|---|---|---|
| Gespräch | 15 min | siehe Leitfaden unten |
| Installation | 10 min | Repo clonen, Install-Script ausführen. **20 min**, falls Git bzw. Command Line Tools noch fehlen |
| `/einrichten` | 20 min | Kunde antwortet, du moderierst; enthält bei ChatGPT-Vorgeschichte den Kurzpfad (ca. 5 min) |
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

### Fallback: Browser-Pfad (wenn die Desktop-App blockiert ist)

Ohne Desktop-App fällt der gesamte Kit-Teil weg: kein Code-Tab, kein `~/.claude`, keine Skills, kein
`/einrichten`, kein `/feierabend`. Was bleibt, ist claude.ai im Browser, und das trägt einen
90-Minuten-Termin.

- **Projekte statt Projektordner.** Ein Projekt pro Thema, mit eigener Projektanweisung („so arbeite ich,
  so schreibe ich") und eigenem Wissensraum für hochgeladene Dateien. Das ist inhaltlich die Rolle, die
  sonst die CLAUDE.md spielt — im Browser gepflegt statt in einer Datei.
- **Der Gesprächsleitfaden gilt unverändert.** Die Fragen aus `/einrichten` stellst du selbst und
  schreibst die Antworten gemeinsam in die Projektanweisung. Dauert länger als der Skill, führt zum
  selben Ergebnis.
- **Erste Aufgabe wie geplant**, Ergebnis als Download statt in `ergebnis/`.
- **Einmal offen sagen, nicht verschweigen:** Der Kunde bekommt heute die Arbeitsweise, aber noch nicht
  das Gedächtnis in Dateiform. Sobald die App freigegeben ist, wandert die Projektanweisung in eine
  CLAUDE.md, und alles Weitere baut darauf auf. Nichts von heute ist verloren.

Damit hat der Folgetermin eine klare Aufgabe: Freigabe klären, dann nachinstallieren.

### `/einrichten` moderieren (20 min)

- Der Kunde tippt oder wählt selbst. Du erklärst nur, wenn eine Frage unklar ist.
- Bei der Frage nach dem Material im ersten Projekt: Solange die IT-Freigabe für echte Unterlagen
  nicht geklärt ist, ist **„Freigabe noch offen"** die richtige Antwort, auch wenn der Kunde spontan
  „echte Unterlagen" wählen will. Das ist der Unterschied zwischen einer Regel, die im Projekt steht,
  und einer, die nur im Termin gesagt wurde.
- Die erste Frage betrifft das bisherige KI-Werkzeug. Wer ChatGPT genutzt hat, sollte hier **nicht**
  reflexhaft „brauche ich nicht" wählen — einmal nachhaken lohnt sich, denn nachträglich ist es
  mühsamer. Bei „Heikel" und „Zu prüfen" nicht für den Kunden entscheiden, auch wenn es schneller ginge.
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

- **Git fehlt** (Windows): Code-Tab startet nicht oder Install-Script bricht ab. Git for Windows nachinstallieren, Claude neu starten. Der Regelfall, nicht die Ausnahme — Zeit dafür einplanen.
- **Command Line Tools fehlen** (Mac): `install/mac.sh` bricht mit einer Meldung ab. `git --version` im Terminal eingeben, Dialog bestätigen, warten. Dauert je nach Leitung mehrere Minuten und lässt sich nicht beschleunigen; in der Zeit das Gespräch weiterführen statt schweigend zuzusehen.
- **Git ist installiert, aber `git` wird nicht gefunden** (Windows): Die Installation lief durch, das Clonen
  scheitert trotzdem — Git liegt dann nicht im PATH. Erster Versuch: PowerShell schließen und neu öffnen,
  ein Fenster von vor der Installation kennt den neuen PATH nicht. Bleibt es dabei, wurde bei der
  Installation „Use Git from Git Bash only" gewählt: entweder Git for Windows erneut installieren und
  „Git from the command line and also from 3rd-party software" wählen, oder für heute „Git Bash" aus dem
  Startmenü öffnen und die Befehle dort ausführen.
- **Desktop-App durch die IT blockiert**: Nicht mit fehlenden Adminrechten verwechseln — eine Richtlinie
  unterbindet die Installation, teils erst nach dem Download. Wird im Termin nicht gelöst. Auf den
  Browser-Pfad wechseln, Freigabe zum Thema des Folgetermins machen, `it-freigabe.md` mitgeben.
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
- **ChatGPT-Wissen übernehmen** ist Teil des Termins, keine Hausaufgabe. `/einrichten` fragt nicht nach
  einer Datei, sondern danach, ob der Kunde sein ChatGPT-Wissen mitnehmen *will*, und geht dann den
  Kurzpfad: Erinnerungsliste in ChatGPT kopieren, einwerfen, Claude baut die Datei. Etwa fünf Minuten.
  „Zu prüfen" und „Heikel" gehst du gemeinsam durch — das ist der Teil, der Moderation braucht; den
  Rest sieht der Kunde später in Ruhe durch.
- **Kunde kommt ohne ChatGPT-Zugang.** Dann entfällt der Kurzpfad. Kein Drama: `docs/wissensuebernahme-chatgpt.md`
  mitgeben, er macht es zu Hause und bringt die Datei zum Folgetermin mit.
