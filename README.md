# Gerinterpreter
A repository for the Interpreter I wrote for Jugend-Forscht in 2014

Don't judge me too hard for my bad code, I promise I won't do it again!

"Official" "Website": https://www.sites.google.com/site/gerinterpreter

# disclaimer

Many features are quite buggy, and will stay buggy for eternity.
This is the latest version I could find in my mail archive, though I know for sure that I had fixed many bugs in a later release, which I might upload as well, if I manage to find it!

# features 
schreiben (<text>) -> Outputs the text delimited by "<" and ">"

schreiben (zeit) -> Outputs the current time.

schreiben (gross.ja/klein.ja/gross.nein/klein.nein) -> Changes the text decoration to either Uppercase or Lowercase.

schreiben (variable{variablenname}) -> Outputs the value of a variable

schreiben (zufall.zahl$maxwert) -> Outputs a random number that is guaranteed to be smaller than "maxwert"

neueVariable (wert, Name:text/zahl) -> Creates a new variable with the given value and datatype

variable1=(var2+/-/*/\var3) -> Performs an operation on two variables and stores it in the third one

piep -> Beeps (might only work on some machines)

nachricht(<text>) -> Outputs a message as dialog prompt

schreiben (neuezeile.ja/.nein) -> Switches between adding a line after every output and not doing so.

schreiben (eingabe) -> Outputs a user-entered value

nachricht (eingabe) -> Outputs a user-entered value as dialog prompt.

punktSetzen (namedesHaltepunkts) -> creates a goto-label

gehezu(namedesHaltepunkts) -> Jumps to a goto-label

konsole(leeren) -> Empties the console

fertig -> Jumps to the last position where gehezu was called.

synonym|Bedeutung -> Creates a macro-like synonyme.

Konsole(farbe)->Changes the color of the console to either "grün", "gelb", "rot", "blau" or "normal"

stoppen -> Stops the execution 

variable1==variable2-> Skips the next line of code if both variables are equal

variable1!=variable2->Skips the next line of code if both variables aren't equal 

variable =?->Outputs the value of the variable

variable =++  -> increments the variable by one

variable =--  -> decrements the variable by one.

variable = eingabe  -> Lets the user input a variable.

variable = zufall$maximaler_wert -> Assign a random value to the variable, the value will be smaller than "maximaler_wert"

variable = lzeile -> The variable becomes the last line that was outputted

variable = variable/wert -> Assigns another variable's value or a constant value to the first variable


