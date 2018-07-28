# Gerinterpreter
A repository for the Interpreter I wrote for Jugend-Forscht in 2014

Don't judge me too hard for my bad code, I promise I won't do it again!

"Official" "Website": https://www.sites.google.com/site/gerinterpreter

# disclaimer

Many features are quite buggy, and will stay buggy for eternity.
This is the latest version I could find in my mail archive, though I know for sure that I had fixed this bug in a later release, which I might upload as well, if I manage to find it!

# features 
schreiben (<text>) -> schreibt den in eckigen Klammern angegebenen Text.

schreiben (zeit) -> schreibt die Systemzeit aus.

schreiben (gross.ja/klein.ja/gross.nein/klein.nein) -> entscheidet, ob der Text ab dieser Zeile gross oder klein geschrieben werden soll.

schreiben (variable{variablenname}) -> schreibt den Wert einer Variable aus

schreiben (zufall.zahl$maxwert) -> schreibt eine zufällige Zahl aus, die höchstens den Wert von Maxwert hat.

neueVariable (wert, Name:text/zahl) -> erstellt eine neue Variable, die die angegebenen Parameter besitzt

variable1=(var2+/-/*/\var3) -> berechnet den Wert von 2 Variablen.

piep -> piepst

nachricht(<text>) -> gibt eine Nachrichtenbox aus

schreiben (neuezeile.ja/.nein) -> entscheidet, ob für jede Ausgabe eine neue Zeile genommen wird

schreiben (eingabe) -> gibt eine Benutzerdefiniert Eingabe aus

nachricht (eingabe) -> Gibt als Nachricht eine benutzerdefinierte Eingabe aus.

punktSetzen (namedesHaltepunkts) -> markiert eine bestimmte Stelle im Code, in der gehezu() weitermachen soll  Einsprungspunkt

gehezu(namedesHaltepunkts) -> springt in der Ausführung zu dem Punkt, der durch Punktsetzen () gesetzt wurde  Einsprungspunkt

konsole(leeren) -> leert den Inhalt der Konsole.

fertig -> geht zur letzten Stelle, wo gehezu() aufgerufen wurde.

synonym|Bedeutung -->erstellt ein Synonym, dass immer den Befehl ersetzen kann.

Konsole(farbe)->Ändert die Farbe der Konsole; bis jetzt wird grün, gelb rot blau und normal unterstützt

stoppen->bricht die Ausführung komplett ab.

variable1==variable2->vergleicht die Variablen. Sind die Variablen ungleich, wird die nächste Zeile übersprungen.

variable1!=variable2->vergleicht die Variablen. Sind die Variablen gleich, wird die nächste Zeile übersprungen.

variable =?->schreibt den Wert der Variable in die Konsole.

variable =++  -> erhöht den wert Der Variable um eins.

variable =--  -> erniedrigt die Variable um eins.

variable = eingabe  -> die Variable bekommt den Wert, den der Nutzer ihr zuweist.

variable = zufall$maximaler_wert ->die Variable bekommt einen zufälligen Wert, der maximal den Wert von maximaler_wert hat.

variable = lzeile -> die Variable kriegt den Wert der zuletzt ausgegebenen Zeile.

variable = variable/wert -> gibt der Variable den Wert der Variable, oder den Konstanten, angegebenen Wert.


