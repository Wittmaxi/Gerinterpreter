unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1EditingDone(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
  private
    { private declarations }
  public
    var eingabe: boolean;
    var abbruch: boolean;
    { public declarations }
  end;

var
  Form2: TForm2;


implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin
   eingabe := true;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
   showmessage ('Das Programm wird nun abgebrochen. um es wieder auszuführen, drücke einfach auf den Startknopf.');
   abbruch := true;
end;

procedure TForm2.Edit1EditingDone(Sender: TObject);
begin
  button1.click;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  button2.click;
end;

end.

