# Microsoft 365 anbinden

Für Kunden mit Microsoft-365-Konto im Unternehmen (Outlook, SharePoint, Teams), die Claude nicht nur
mit eingeworfenen Dateien füttern, sondern direkt auf Postfach und Ablage zugreifen lassen wollen.

**Das ist nie Teil des ersten Termins.** Es braucht eine Freigabe durch die IT, und die dauert. Der
Onboarding-Termin muss ohne funktionieren; die Anbindung ist der zweite Schritt.

## Was es gibt

Anthropic bietet einen offiziellen Microsoft-365-Connector an. Er ist im Microsoft Marketplace gelistet
und als Publisher verifiziert — also kein Community-Werkzeug. Abgedeckt sind Outlook Mail, Outlook
Kalender, SharePoint, OneDrive und Teams. Der Claude-Plan ist nicht der begrenzende Faktor; die
Microsoft-Seite ist es.

## Die zwei Punkte, die man verstanden haben muss

**Delegierte Rechte.** Der Connector arbeitet ausschließlich mit den Rechten der angemeldeten Person.
Claude sieht genau das, was der Nutzer selbst sehen darf — keinen Dienstkontenzugriff, keine
Tenant-weite Sicht. Das ist das stärkste Argument gegenüber der IT.

**Delegiert heißt nicht lesend.** Es gibt Schreibrechte: Mails senden, Mails und Kalender ändern,
Dateien anlegen und überschreiben. Die Produktseite listet teils nur „Read", der Security-Guide nennt
die Schreib-Scopes — die Schreibfunktionen sind neuer als manche Doku.

> **Gegenüber einer IT-Abteilung niemals „nur Leserechte" behaupten.** Der Admin sieht die tatsächlich
> angefragten Berechtigungen im Consent-Dialog. Eine Aussage, die dort widerlegt wird, kostet das
> Vertrauen für alles Weitere. Schreibrechte offen benennen und vorschlagen, sie für einen Pilot
> abzuwählen — das ist die Position, die trägt.

## Was die IT tun muss

1. **Einmaliger, tenant-weiter Consent durch einen Entra Global Administrator.** Ein einzelner Nutzer
   kann sich das nicht selbst freischalten. Eine bereits erteilte Copilot-Freigabe hilft nicht — das ist
   eine andere Anwendung.
2. Optional, und meist der Weg zum Ja: Zugriff über **„Assignment required"** auf den Service Principals
   auf eine Pilotgruppe begrenzen.
3. Persönliche Microsoft-Konten (`@outlook.com`, `@hotmail.com`) funktionieren nicht. Es braucht einen
   Entra-Tenant mit Business-Plan.

Aktuelle Berechtigungsliste und Sicherheitsdetails stehen im Security-Guide von Anthropic. Bewusst nicht
hier abgeschrieben: Die Scope-Liste bewegt sich, eine Kopie wäre in drei Monaten falsch.

## Vorlage für die Anfrage an die IT

Anpassen, Kundennamen einsetzen, vom Kunden oder in seinem Namen verschicken. Bewusst technisch
gehalten — keine Beratungsleistung, kein Angebot, keine Vertragsfrage.

> Betreff: Freigabe einer Microsoft-365-Anwendung — Rückfrage
>
> Hallo <Name>,
>
> ich arbeite gerade mit dem KI-Assistenten Claude und würde gern prüfen, ob wir ihn an unser
> Microsoft 365 anbinden können. Dafür brauche ich eure Einschätzung.
>
> Um was es geht: Anthropic stellt dafür eine im Microsoft Marketplace gelistete, publisher-verifizierte
> Anwendung bereit. Sie arbeitet mit delegierten Berechtigungen, greift also nur auf das zu, was ich mit
> meinem eigenen Konto ohnehin sehen darf — kein Dienstkonto, keine Tenant-weite Sicht.
>
> Zwei Dinge, die ihr wissen solltet:
> - Das Berechtigungsset enthält neben Leserechten auch Schreibrechte (Mails senden, Kalender und
>   Dateien ändern). Für einen ersten Test bräuchte ich die nicht — falls sich das einschränken lässt,
>   gern ohne.
> - Die Zustimmung muss einmalig tenant-weit durch einen Global Administrator erfolgen. Der Zugriff
>   lässt sich danach über "Assignment required" auf eine kleine Gruppe begrenzen, damit es zunächst
>   nur bei mir läuft.
>
> Die Sicherheitsdokumentation von Anthropic kann ich euch schicken. Habt ihr 20 Minuten für einen
> kurzen Teams-Termin, damit wir uns das gemeinsam ansehen?
>
> Viele Grüße
> <Name>

## Solange die Freigabe nicht da ist

Realistisch und ohne jeden Eingriff im Tenant nutzbar:

- **Projekte** als Hintergrundwissen: Tonalität, Standardformulierungen, Signaturregeln, wiederkehrende
  Fälle. Das deckt den größten Teil der E-Mail-Arbeit ab — Entwürfe, Zusammenfassungen, Ton.
- **Einzelne Threads einwerfen** per Copy-Paste oder als Datei.

Mit einer Einschränkung, die man dem Kunden sagen muss: Ein echter Geschäfts-Thread per Copy-Paste in
ein persönliches Claude-Konto ist derselbe Datentransfer an einen externen Dienst wie über den
Connector — nur ohne Freigabe und ohne Protokoll. **Solange die IT-Klärung läuft, im Termin nur mit
anonymisierten oder erfundenen Beispielen arbeiten.** Für eine Demo macht das keinen Unterschied.
