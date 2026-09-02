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
2. **Ängste und Erwartungen.** Was soll auf keinen Fall passieren (Daten weg, etwas verschickt, Kosten)?
   Was wäre in vier Wochen ein Erfolg? Beides wörtlich notieren, es taucht in der Nachbereitung wieder auf.
3. **Leidenschaftsthema finden.** Kein Arbeits-Schmerzpunkt. Hobby, Verein, Familie, Reise, Sammlung.
   Kriterium: Die Person redet von selbst weiter. Das wird Frage 5 in `/einrichten`.
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

Claude schlägt eine Aufgabe vor. Ziel ist ein sichtbares Ergebnis in `ergebnis/`. Der Kunde formuliert
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
