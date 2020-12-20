unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Memo1: TMemo;
    function FormHelp(Command: Word; Data: PtrInt; var CallHelp: Boolean
      ): Boolean;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

function TForm3.FormHelp(Command: Word; Data: PtrInt; var CallHelp: Boolean
  ): Boolean;
begin
  showmessage ('Hier werden alle Umgebungsvariablen mit Wert und Typ angezeigt. Das Fenster wird bei beendeter Ausführung geschlossen.');
end;

end.

