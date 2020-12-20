unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynEdit, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, Grids, Menus, Unit2, Unit3, Unit4;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Image1: TImage;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    Memo1: TSynEdit;
    Memo2: TMemo;
    Memo3: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure leerzeichenentferner();
    procedure Memo1Change(Sender: TObject);
    procedure Memo1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure syntable();



private
    procedure Core();
    procedure schreiben ();
    procedure grklschreibung();
    procedure umwandlung();
    procedure Anweisungenabpruefen();
    procedure eingabeschreiben();
    procedure Anweisungsfenster();
    function randominteger(maxhoehe:integer) : integer;
    procedure zufallschreiben();
    procedure variablenmain();
    procedure variablen_erzeugen();
    procedure Variablen_suchen(var varname:string);
    procedure variable_schreiben();
    procedure piepsen();
    procedure variablenresetten();
    procedure gehezu();
    procedure gehezu_punktesetzen();
    procedure varspeichern();
    procedure variablenrechnen();
    procedure var_zeichenermitteln();
    procedure minusrechnen();
    procedure plusrechnen();
    procedure malrechnen();
    procedure geteiltrechnen();
    procedure zeitschreiben ();
    procedure schreibenNeueZeileAusgabe();
    procedure schreibenAusgabe();
    procedure Konsole();
    procedure Konsoleleeren();
    procedure GUIausblenden();
    procedure GUIeinblenden();
    procedure inkrement();
    procedure schreibenNeueZeile();
    function eingabefunktion() : string;
    procedure formcaption();
    procedure inkrementfnc(index:integer);
    procedure varausgabe(index:integer);
    procedure dekrementfnc(index:integer);
    procedure varzufallfnc(index:integer);
    procedure kontrollstruktur ();
    procedure istgleich();
    procedure abbruch();
    procedure preprozessor;
    procedure istnicht ();
    procedure formfarbe ();
    procedure synonymeeintragen ();
    procedure synonymeersetzen ();
    procedure vartable ();
  public
    { public declarations }
  end;
      //GLobale variablen
var Form1: TForm1;
var totallines:integer;
var momline:integer;
var momlinestring:string;
var mompos:integer;
var anzBuchstaben:integer;
var momposstring:string;
var inderklammer:boolean;
var nachderklammer:string;
var platzklammern:integer;
var platzeckklammer:integer;
var uppercaseb:boolean;
var lowercaseb:boolean;
var schreibstring:string;
var warten:boolean;
var platzzwischenklammern:integer;
var nachricht:string;
var zufallergebniss:integer;
var komma:integer;
var variablen : array of array [1..3] of string;
var counter:integer;
var found: boolean= false;
var gesuchterwert:string;
var punkte: array [1..100, 1..2] of string;
var punktezaehler : integer;
var anz_var:integer=1;
var gesuchtername:string;
var vorderklammer:string;
var dpplpkt : integer;
var momname:string;
var momwert:string;
var vordemistgl:string;
var gespeichert:boolean=false;
var zahl1:boolean;
var zahl2:boolean;
var zahl1_intg:integer;
var zahl2_intg:integer;
var varsuchstr:string;
var counter_var:integer;
var neuezeile:boolean=true;
var anzMemo2Zeilen:integer;
var zwischenspeicher:string;
var Ausfuehren:boolean;
var suchstr:string;
var nachdemistgl:string;
var variablenwert:integer;
var debugger:boolean;
var weiter:boolean;
var synonyme : array of array [1..2] of string;
var anz_synonyme : integer;



implementation

{$R *.lfm}

{ TForm1 }


procedure tform1.syntable();
var i:integer;
begin
   form4.Memo1.text:='';
  if anz_synonyme = 0 then
   begin
     form3.memo1.Text:='Es gibt noch keine Synonyme';
   end else
   begin
        for i :=0 to anz_synonyme -1 do
        begin
             form4.memo1.lines.add ('Synonym :' + synonyme[i, 1] + ' bedeutet: ' + synonyme[i, 2]);
        end;
   end;
end;

procedure tform1.vartable ();
var i:integer;
begin
  form3.Memo1.text:='';
  if anz_var = 0 then
   begin
     form3.memo1.Text:='Es gibt noch keine Variablen';
   end else
   begin
        for i :=0 to anz_var -1 do
        begin
             form3.memo1.lines.add ('Variable :' + variablen[i, 2] + ' = ' + variablen[i, 1] + ' : ' + variablen[i, 3]);
        end;
   end;
end;

procedure tform1.synonymeersetzen ();
var scope : integer;
begin
  if anz_synonyme <> 0 then
   begin
     for scope:=0 to anz_synonyme-1 do
         vorderklammer:=StringReplace (vorderklammer, synonyme[scope, 1], synonyme[scope, 2], [rfReplaceAll]);
   end;
end;

procedure tform1.synonymeeintragen();
var dpplpktpos:integer=0;
begin
    dpplpktpos:=pos('|', momlinestring);
    if dpplpktpos <> 0 then
     begin
       inc (anz_synonyme);
       setlength (synonyme, anz_synonyme);
        synonyme[anz_synonyme-1, 1]:=copy (momlinestring, 0, dpplpktpos-1);
        synonyme[anz_synonyme-1, 2]:=copy (momlinestring, dpplpktpos+1, length (momlinestring)-1);
     end;
end;

procedure tform1.formfarbe ();
begin
  if nachderklammer = '(grün)' then
   begin
     form1.color:=clgreen;
     memo1.color:=clgreen;
     memo2.color:=clgreen;
     memo3.color:=clgreen;
   end;
    if nachderklammer = '(gelb)' then
   begin
     form1.color:=clyellow;
     memo1.color:=clyellow;
     memo2.color:=clyellow;
     memo3.color:=clyellow;
   end;
      if nachderklammer = '(rot)' then
   begin
     form1.color:=clred;
     memo1.color:=clred;
     memo2.color:=clred;
     memo3.color:=clred;
   end;
        if nachderklammer = '(blau)' then
   begin
     form1.color:=clblue;
     memo1.color:=clblue;
     memo2.color:=clblue;
     memo3.color:=clblue;
   end;
          if nachderklammer = '(normal)' then
   begin
     form1.color:=cldefault;
     memo1.color:=clwhite;
     memo2.color:=cldefault;
     memo3.color:=cldefault;
   end;
end;

procedure tform1.istnicht ();
var index1:integer;
var index2:integer;
var varname:string;
begin
   if pos('!=', momlinestring)<>0 then
    begin
      varname:=copy(momlinestring, 0, pos('!=', momlinestring)-1);
       variablen_suchen(varname);
       index1:=counter_var;
       varname:=copy(momlinestring, pos('!=', momlinestring)+2, length(momlinestring)-1);
       variablen_suchen(varname);
       index2:=counter_var;
                 if variablen[index1, 1] <> variablen[index2, 1] then
                  begin
                     //void
                  end else
                      inc(momline);
    end;
end;


procedure tform1.preprozessor;
begin
   while (momline < totallines) do
   begin
    leerzeichenentferner();
    synonymeeintragen();
    vorderklammer:= copy(momlinestring, 0, pos('(', momlinestring)-1);
    platzklammern:= pos(')', momlinestring) - pos('(', momlinestring) + 1;
    nachderklammer:=copy(momlinestring, pos ('(', momlinestring), platzklammern);
    application.processmessages();
    synonymeersetzen ();
     if lowercase(vorderklammer) = 'punktsetzen' then
      begin
         gehezu_punktesetzen;
      end;
    inc(momline);
  end;
   momline:=0;
end;

procedure tform1.abbruch();
begin
   if momlinestring = 'stoppen' then
    begin
        ausfuehren:=false;
    end;
end;

procedure tform1.istgleich();
var index1:integer;
var index2:integer;
var varname:string;
begin
   if pos('==', momlinestring)<>0 then
    begin
      varname:=copy(momlinestring, 0, pos('==', momlinestring)-1);
       variablen_suchen(varname);
       index1:=counter_var;
       varname:=copy(momlinestring, pos('==', momlinestring)+2, length(momlinestring)-1);
       variablen_suchen(varname);
       index2:=counter_var;
                 if variablen[index1, 1] = variablen[index2, 1] then
                  begin
                     //void
                  end else
                      inc(momline);
    end;
end;

procedure tform1.kontrollstruktur();
begin
   istgleich ();
   istnicht ();
end;

procedure tform1.varzufallfnc(index:integer);
var maxzufall:integer;
begin
          try
             maxzufall:= StrToInt(copy(nachdemistgl, pos('$', nachdemistgl)+1, length(memo1.lines[momline])- 1));
          except
             showmessage('Der Wert, den du als Maximal bei einer Zufallsberechnung eingegeben hast, ist ungültig. Zeile: ' + IntToStr(momline+1));
          end;
              if nachdemistgl = 'zufall$'+IntToStr(maxzufall) then
                 begin
                     variablen[index, 1]:=IntToStr(randominteger(maxzufall));
                 end;
end;

procedure tform1.dekrementfnc(index:integer);
begin
   variablenwert:=StrToInt(variablen[index, 1]);
   dec(variablenwert);
   variablen[index, 1]:=IntToStr(variablenwert);
end;

procedure tform1.varausgabe(index:integer);
begin
   memo2.lines.add(variablen[index, 1]);
end;

procedure tform1.inkrementfnc(index:integer);
begin
       if variablen[counter_var, 3] = 'zahl' then
       begin
         variablenwert:=StrToInt(variablen[index, 1]);
         inc(variablenwert);
         variablen[index, 1]:=IntToStr(variablenwert);
      end;
end;

procedure tform1.formcaption();
begin
   if lowercase(nachderklammer) = '(schrift)' then
    begin
      if pos ('=', momlinestring) <> 0 then
       begin
           form1.caption:=copy (momlinestring, pos('=', momlinestring)+1, length(memo1.lines[momline]))+'--> Interpreter --> '+savedialog1.filename;
       end
          else
          begin
            showmessage('Bei konsole(schrift) fehlt ein Istgleich und der Wert. Zeile: ' + IntToStr(momline+1));
          end;
    end;
   if lowercase(nachderklammer) = '(schriftreset)' then
    begin
           form1.caption:='Interpreter' + savedialog1.FileName;
    end;
end;

function tform1.eingabefunktion() : string;
begin
          form2.edit1.text:='';
          form2.visible:=true;
          form1.enabled:=false;
          form2.eingabe:=false;
          while (form2.eingabe=false) and (ausfuehren = true) do
          begin
            application.Processmessages;
            if form2.abbruch = true then
             begin
               form2.abbruch:=false;
               ausfuehren:=false;
               form2.visible:=false;
             end;
          end;
          vartable();
          eingabefunktion:=form2.edit1.text;
          form2.eingabe:=false;
          form2.visible:=false;
          form1.enabled:=true;
          form1.BringToFront;
end;

procedure tform1.schreibenNeueZeileAusgabe();
begin
   if (lowercase(nachderklammer) = '(nzeile)') or (lowercase(nachderklammer) = '(neuezeile)') then
   begin
      memo2.lines.add('');
   end;
end;

procedure tform1.inkrement();
begin
             if gesuchterwert<>'' then
             begin
                if nachdemistgl = '++' then
                   begin
                       inkrementfnc(counter_var);
                   end else
                   begin
                       if nachdemistgl = '?' then
                          begin
                             varausgabe(counter_var);
                          end else
                          begin
                             if nachdemistgl = '--' then
                                begin
                                   dekrementfnc(counter_var);
                                end else
                                          begin
                                              if nachdemistgl = 'lzeile' then
                                                 begin
                                                    try
                                                        variablen[counter_var, 1]:=memo2.lines[memo2.lines.Count-1];
                                                    except
                                                       memo3.lines.add('Der Wert, der der Variable zugewiesen werden soll passt nicht zum Variablenwert. Zeile:' +IntToStr(momline+1));
                                                    end;
                                                 end
                                                    else
                                                    begin
                                                        if pos('$', nachdemistgl) <> 0 then
                                                           begin
                                                            varzufallfnc(counter_var);
                                                           end else
                                                           begin
                                                               if nachdemistgl = 'eingabe' then
                                                                   begin
                                                                       variablen[counter_var, 1]:=eingabefunktion();
                                                                   end else
                                                                   begin
                                                                      var_zeichenermitteln();
                                                                   end;
                                                           end;
                                                    end;
                                              end;
                                          end;
                           end;
           end;
end;


procedure tform1.GUIeinblenden ();
begin
  Ausfuehren:=false;
  button3.visible:=true;
  memo1.readonly:=false;
  debugger:=false;
  form3.memo1.Text:='';
  form3.visible:=false;
  form4.visible:=false;
  form4.memo1.text:='';
  memo1.ClearBookMark(0);
end;

procedure tform1.GUIausblenden();
begin
   Ausfuehren:=true;
   button3.visible:=false;
   memo1.readonly:=true;
   menuitem8.enabled:=true;
end;


procedure tform1.konsoleleeren ();
begin
   if lowercase(nachderklammer) = '(leeren)' then
    begin
       memo2.text:='';
    end;
end;

procedure tform1.Konsole;
begin
  if lowercase(vorderklammer) = 'konsole' then
   begin
      konsoleleeren();
      formcaption();
      formfarbe();
   end;
end;

procedure tform1.schreibenAusgabe();
begin
           if (neuezeile = true) then
              begin
                   memo2.lines.add(schreibstring);
              end else if neuezeile = false then
                  begin
                       anzMemo2Zeilen := memo2.lines.count;
                       zwischenspeicher := memo2.lines[anzMemo2Zeilen-1];
                       anzMemo2Zeilen := memo2.lines.count;
                       memo2.lines[anzMemo2Zeilen-1]:= zwischenspeicher + schreibstring;
                  end;
end;

procedure Tform1.schreibenNeueZeile();
begin
  if lowercase (nachderklammer) = '(neuezeile.ja)' then
   begin
     neuezeile:=true;
   end;
   if lowercase (nachderklammer) = '(neuezeile.nein)' then
    begin
      neuezeile:=false;
      memo2.lines.add('');
    end;
end;

procedure tform1.zeitschreiben();
begin
     if lowercase(nachderklammer) = '(zeit)' then
      begin
        schreibstring:=TimeToStr(time);
      end;
end;
procedure tform1.geteiltrechnen();
begin
  if pos('\', nachderklammer) <> 0 then  ////////////////////////////////////////////////////////////////////////////////////////Z
      begin
        varsuchstr:=copy (nachderklammer, pos('(', nachderklammer)+1, pos('\', nachderklammer)-pos('(', nachderklammer) -1);

        variablen_suchen (varsuchstr);
        if (variablen[counter_var, 3]='zahl') and (gesuchterwert <> '') then
         begin
            zahl1:=true;
            zahl1_intg:=StrToInt(variablen[counter_var, 1]);
         end else
          begin
             try
                 zahl1:=true;
                 zahl1_intg:=StrToInt(varsuchstr);
             except
                 memo3.Lines.add('Die zu rechnende Variable existiert nicht, oder ist keine Zahl. Zeile: '+ IntToStr(momline+1));
                 zahl1:=false;
             end;
         end;

         varsuchstr:=copy(nachderklammer, pos('\', nachderklammer)+1, pos(')', nachderklammer)-pos('\', nachderklammer)-1);
         variablen_suchen(varsuchstr);
         if (variablen[counter_var, 3]='zahl') and (gesuchterwert <> '') then
          begin
              zahl2:=true;
              zahl2_intg:=StrToInt(variablen[counter_var, 1]);
          end else
          begin
            try
                zahl2:=true;
                zahl2_intg:=StrToInt(varsuchstr);
             except
                 memo3.Lines.add('Die zu rechnende Variable existiert nicht, oder ist keine Zahl. Zeile: '+ IntToStr(momline+1));
                 zahl2:=false;
             end;

          end;

          if (zahl1=true) and (zahl2=true) then
          begin
                variablen_suchen(vordemistgl);
                variablen[counter_var, 1]:=IntToStr(round(zahl1_intg/zahl2_intg));
          end;
     end;
end;

procedure tform1.malrechnen();
begin
  if pos('*', nachderklammer) <> 0 then  ////////////////////////////////////////////////////////////////////////////////////////Z
    begin
      varsuchstr:=copy (nachderklammer, pos('(', nachderklammer)+1, pos('*', nachderklammer)-pos('(', nachderklammer) -1);

      variablen_suchen (varsuchstr);
      if (variablen[counter_var, 3]='zahl') and (gesuchterwert <> '') then
       begin
          zahl1:=true;
          zahl1_intg:=StrToInt(variablen[counter_var, 1]);
       end else
        begin
             try
                 zahl1_intg:=StrToInt(varsuchstr);
                 zahl1:=true;
             except
                 memo3.Lines.add('Die zu rechnende Variable existiert nicht, oder ist keine Zahl. Zeile: '+ IntToStr(momline+1));
                 zahl1:=false;
             end;

        end;

       varsuchstr:=copy(nachderklammer, pos('*', nachderklammer)+1, pos(')', nachderklammer)-pos('*', nachderklammer)-1);
       variablen_suchen(varsuchstr);
       if (variablen[counter_var, 3]='zahl') and (gesuchterwert <> '') then
        begin
            zahl2:=true;
            zahl2_intg:=StrToInt(variablen[counter_var, 1]);
        end else
        begin
             try
                zahl2:=true;
                zahl2_intg:=StrToInt(varsuchstr);
             except
                 memo3.Lines.add('Die zu rechnende Variable existiert nicht, oder ist keine Zahl. Zeile: '+ IntToStr(momline+1));
                 zahl2:=false;
             end;

        end;

        if (zahl1=true) and (zahl2=true) then
        begin
              variablen_suchen(vordemistgl);
              variablen[counter_var, 1]:=IntToStr(zahl1_intg*zahl2_intg);
        end;
        zahl1:=false;
        zahl2:=false;
   end;
end;

procedure tform1.plusrechnen();
begin
    if pos('+', nachderklammer) <> 0 then  ////////////////////////////////////////////////////////////////////////////////////////Z
    begin
      varsuchstr:=copy (nachderklammer, pos('(', nachderklammer)+1, pos('+', nachderklammer)-pos('(', nachderklammer) -1);

      variablen_suchen (varsuchstr);
      if (variablen[counter_var, 3]='zahl') and (gesuchterwert <> '') then
       begin
          zahl1:=true;
          zahl1_intg:=StrToInt(variablen[counter_var, 1]);
       end else
        begin
             try
                zahl1:=true;
                zahl1_intg:=StrToInt(varsuchstr);
             except
                 memo3.Lines.add('Die zu rechnende Variable existiert nicht, oder ist keine Zahl. Zeile: '+ IntToStr(momline+1));
                 zahl1:=false;
             end;

        end;

       varsuchstr:=copy(nachderklammer, pos('+', nachderklammer)+1, pos(')', nachderklammer)-pos('+', nachderklammer)-1);
       variablen_suchen(varsuchstr);
       if (variablen[counter_var, 3]='zahl') and (gesuchterwert <> '') then
        begin
            zahl2:=true;
            zahl2_intg:=StrToInt(variablen[counter_var, 1]);
        end else
        begin
             try
                zahl2:=true;
                zahl2_intg:=StrToInt(varsuchstr);
             except
                 memo3.Lines.add('Die zu rechnende Variable existiert nicht, oder ist keine Zahl. Zeile: '+ IntToStr(momline+1));
                 zahl2:=false;
             end;
        end;

        if (zahl1=true) and (zahl2=true) then
        begin
              variablen_suchen(vordemistgl);
              variablen[counter_var, 1]:=IntToStr(zahl1_intg+zahl2_intg);
        end;
   end;
end;

procedure tform1.minusrechnen();
begin
  if pos('-', nachderklammer) <> 0 then  ////////////////////////////////////////////////////////////////////////////////////////Z
    begin
      varsuchstr:=copy (nachderklammer, pos('(', nachderklammer)+1, pos('-', nachderklammer)-pos('(', nachderklammer) -1);

      variablen_suchen (varsuchstr);
      if (variablen[counter_var, 3]='zahl') and (gesuchterwert <> '') then
       begin
          zahl1:=true;
          zahl1_intg:=StrToInt(variablen[counter_var, 1]);
       end else
        begin
             try
                zahl1:=true;
                zahl1_intg:=StrToInt(varsuchstr);
             except
                 memo3.Lines.add('Die zu rechnende Variable existiert nicht, oder ist keine Zahl. Zeile: '+ IntToStr(momline+1));
                   zahl1:=false;
             end;


        end;

       varsuchstr:=copy(nachderklammer, pos('-', nachderklammer)+1, pos(')', nachderklammer)-pos('-', nachderklammer)-1);
       variablen_suchen(varsuchstr);
       if (variablen[counter_var, 3]='zahl') and (gesuchterwert <> '') then
        begin
            zahl2:=true;
            zahl2_intg:=StrToInt(variablen[counter_var, 1]);
        end else
        begin
             try
                zahl2:=true;
                zahl2_intg:=StrToInt(varsuchstr);
             except
                 memo3.Lines.add('Die zu rechnende Variable existiert nicht, oder ist keine Zahl. Zeile: '+ IntToStr(momline+1));
                 zahl2:=false;
             end;

        end;

        if (zahl1=true) and (zahl2=true) then
        begin
              variablen_suchen(vordemistgl);
              variablen[counter_var, 1]:=IntToStr(zahl1_intg-zahl2_intg);
        end;
   end;
end;

procedure tform1.var_zeichenermitteln();
begin
  zahl1_intg:=0;
  zahl2_intg:=0;


   plusrechnen();
   malrechnen();
   geteiltrechnen();
   minusrechnen();
end;
 //////////////////////////////////////////////////RECHNEN/////////////////
procedure tform1.variablenrechnen();
begin
     nachdemistgl:=copy(momlinestring, pos('=', momlinestring)+1, length(momlinestring));
     vordemistgl:=copy(momlinestring, 0, pos('=', momlinestring)-1);

     if vordemistgl <> '' then
     begin
          suchstr:= lowercase(vordemistgl);
          variablen_suchen(suchstr);
          inkrement();
     end;

end;

procedure tform1.varspeichern();
begin

            setlength (variablen, anz_var+1);
            variablen [anz_var, 1]:=momwert;
            variablen [anz_var, 2]:=momname;
            variablen [anz_var, 3] := copy (momlinestring, dpplpkt+1, pos (')', momlinestring)-dpplpkt-1);
            anz_var:=length(variablen);

end;

procedure tform1.gehezu_punktesetzen;
begin
     punkte [punktezaehler, 1] := lowercase(nachderklammer);
     punkte [punktezaehler, 2] := IntToStr(momline);
     inc (punktezaehler);
end;

procedure tform1.gehezu();
var zaehler:integer;
begin
     zaehler:=0;
     if lowercase(vorderklammer) = 'gehezu'  then
      begin
         while zaehler <= 100 do
         begin
           if punkte [zaehler, 1] = lowercase(nachderklammer) then
            begin
               momline := StrToInt (punkte[zaehler, 2]);
            end;
           inc (zaehler);
         end;
      end;
end;

procedure tform1.variablenresetten ();
begin
     punktezaehler:=0;
     counter:=0;
     totallines:=memo1.lines.count;
     momline:=0;
     memo2.text:='';
     memo3.text:='';
     uppercaseb:=false;
     lowercaseb:=false;
     vorderklammer:= copy(momlinestring, 0, pos('(', momlinestring)-1);
     setlength(variablen, 0);
     counter_var:=0;
     anz_var:=0;
     gesuchterwert:='';
     setlength (synonyme, 0);
     anz_synonyme:=0;
end;

procedure tform1.piepsen();
begin
  if lowercase(momlinestring)='piep' then
   begin
     beep;
   end;
end;

procedure tform1.variable_schreiben ();   //array variable [1] = wert //arraay variable [2] = name //array variable [3] = variablentyp
var cvar:string;
begin
   cvar:=lowercase( copy (nachderklammer, pos('{', nachderklammer)+1, pos ('}', nachderklammer)-pos('{', nachderklammer)-1));
    if lowercase(nachderklammer)= '(variable{'+cvar+'})' then
     begin
         variablen_suchen(cvar);
         if gesuchtername = '' then
          begin
             memo3.lines.add('Die Variable, die Ausgeschrieben werden soll existiert nicht. Zeile: '+ IntToStr(momline+1));
          end else
          begin
            schreibstring:=gesuchtername;
          end;

     end;
end;

     ///////////////////////////////////////////////VARIABLEN SUCHEN///////
procedure tform1.variablen_suchen (var varname:string);
begin
        counter_var:=0;
        if anz_var >= 1 then
         begin
                gesuchterwert:='';
                gesuchtername:='';
            while counter_var <= anz_var-1 do
            begin
             if lowercase(varname) = lowercase(variablen [counter_var, 2]) then
              begin
                 gesuchterwert:= variablen [counter_var, 2];
                 gesuchtername:= variablen [counter_var, 1];
                 break;
              end else
              begin
                gesuchterwert:='';
                gesuchtername:='';
              end;
             inc(counter_var);
            end;
         end;
end;
   ////////////////////////////////////////VARIABLENERZEUGEN//////////////////////////////////////////
procedure tform1.variablen_erzeugen();  // in der klammer:   erste angabe: wert zweite angabe: name dritte angabe: typ !!!!! (Merke:)

begin
 if lowercase(vorderklammer)='neuevariable'  then
  begin
         komma:=pos (',', momlinestring);
         dpplpkt:=pos (':', momlinestring);
         momname:=  copy (momlinestring, komma+1, dpplpkt-komma-1); //
         momwert:=  copy (momlinestring, pos ('(',momlinestring)+1, komma-pos ('(',momlinestring)-1);
         variablen_suchen(momname);
         if momname = '' then
          begin
             memo3.Lines.add('Bei einer Variablendeklaration gab es einen Fehler, da Die Variable keinen Namen bekommen hat. Zeile: '+IntToStr(momline+1));
          end else
          begin
                if gesuchterwert = momname then
                begin
                     memo3.Lines.add('Dieser Variablenname wurde schon verwendet... Deshalb konnte er nicht nochmal verwendet werden. Zeile: '+IntToStr(momline+1));
                end  else
                     begin
                          varspeichern();
                     end;
          end;
  end;
end;

procedure tform1.variablenmain();//////////////////////////////////////////////VARIABLEN MAIN////////////////////////////////////////
begin
      variablen_erzeugen();
      variablenrechnen();
end;

procedure tform1.zufallschreiben ();
var maxhoehe:integer;
var maxhoehestr:string;
begin
          try
            maxhoehestr := copy (nachderklammer, pos ('-', nachderklammer)+1, pos(')', nachderklammer)-1-pos('-', nachderklammer));
          except
          end;
           if lowercase(nachderklammer) = '(zufall.zahl$'+maxhoehestr+')' then
            begin
                 try
                    maxhoehe:= StrToInt(maxhoehestr);
                    schreibstring:=IntToStr(randominteger(maxhoehe));
                 except
                       memo3.lines.Add('Die maximale größe bei der Zufallszahl ist keine/eine zu große Zahl. Bitte ändern. Zeile : '+IntToStr(momline+1));
                 end;

            end;
end;

function tform1.randominteger (maxhoehe:integer) : integer;
begin
   randomize;
   randominteger:=random(maxhoehe+1);
end;


       ///////////////////////////////////////SHOWMESSAGE//////////////////////////////////////
procedure tform1.Anweisungsfenster();
begin
    If lowercase(momlinestring) = 'nachricht' + lowercase(nachderklammer) then
     begin
       if nachderklammer = '(eingabe)'then
        begin
             showmessage(eingabefunktion);
        end else
        begin
              platzzwischenklammern:= pos ('>', nachderklammer) - pos('<', nachderklammer)-1 ;
              schreibstring:=copy ( nachderklammer, pos('<',nachderklammer)+1, platzzwischenklammern);
              umwandlung;
              nachricht:=schreibstring;
              showmessage (nachricht);
        end;
     end;
end;

////////////////////////EIngabeschreiben//////////////////////////////////////////7
procedure tform1.eingabeschreiben();
begin
 if lowercase(nachderklammer)='(eingabe)' then
  begin
       schreibstring:=eingabefunktion();
  end;
end;
////////////////////////////////////////umwandlung////////////////////////////////////////////
procedure tform1.umwandlung();
begin
  if uppercaseb=true then
         begin
             schreibstring:=Uppercase (copy ( momlinestring, pos ('<', momlinestring)+1,  platzeckklammer-2));
         end;
  if lowercaseb=true then
         begin
            schreibstring:=lowercase(schreibstring);
         end;
end;
  ///////////////////////////////////ANWEISUNGEN PRÜFEN///////////////////////////////////////

procedure tform1.Anweisungenabpruefen();
begin
     schreiben();
     Anweisungsfenster();
     variablenmain();
     piepsen();
     gehezu();
     konsole();
     kontrollstruktur();
     abbruch();
end;
////////////////////////////////////////grkleinschreibung//////////////////////////////////
procedure tform1.grklschreibung();
begin
    if lowercase(nachderklammer) = '(gross.ja)' then
         begin
           warten:=true;
           uppercaseb:=true;
           Lowercaseb:=false;
         end;
      if lowercase(nachderklammer)= '(gross.nein)'then
         begin
           warten:=true;
           uppercaseb:=false;
           Lowercaseb:=false;
         end;
      if lowercase(nachderklammer)= '(klein.ja)' then
         begin
           warten:=true;
           uppercaseb:=false;
           lowercaseb:=true;
         end;
      if lowercase(nachderklammer)= '(klein.nein)' then
         begin
           warten:=true;
            Lowercaseb:=false;
            uppercaseb:=false;
         end;
end;


procedure TForm1.Timer1Timer(Sender: TObject);
var counterautosave:integer;
begin
  if gespeichert=true then
     begin
       if menuitem3.checked=true then
          begin
             if counterautosave = 200 then
                begin
                   Memo1.Lines.SaveToFile(savedialog1.filename);
                   memo3.lines.add('Datei wurde automatisch in dieser Lokation: ' + savedialog1.filename + ' gespeichert. Denke aber trotzdem an Backups :)')
                end;
          end;
     end;
  inc(counterautosave);
end;


///////////////////schreiben////////////////////////////////////
Procedure tform1.schreiben ();
begin
 if lowercase(vorderklammer) = 'schreiben'  then
    begin
      grklschreibung();//Gross und klein-schreibung
      platzeckklammer:=pos ('>', momlinestring) - pos ('<', momlinestring)+1;
      schreibstring:=  copy ( momlinestring, pos ('<', momlinestring)+1,  platzeckklammer-2);
      umwandlung(); //umwandlung der gross und kleinschreibung
      eingabeschreiben(); //schreiben der EIngabe des Benutzers
      zufallschreiben (); // schreiben einer zufälligen Zahl
      variable_schreiben();//ausschreiben des Wertes einer Variable
      zeitschreiben();
      schreibenNeueZeile();
      schreibenNeueZeileAusgabe();
      if schreibstring <> '' then
         begin
           schreibenAusgabe();
         end;
    end;
end;

////////////////////////Leerzeichenentfernen///////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
procedure tform1.leerzeichenentferner(); //
begin
   momlinestring:=memo1.lines[momline];
   anzBuchstaben:=length(momlinestring);
   mompos:=0;
   while (mompos <> anzBuchstaben) and (Ausfuehren = true) do
   begin
      application.processmessages;
      momposstring := copy(momlinestring, mompos, 1);
    if lowercase(momposstring) = '<' then
    begin
      inderklammer:=true;
    end;
    if lowercase(momposstring)='>' then
    begin
      inderklammer:=false;
    end;
               if lowercase(momposstring) <>' ' then
               begin

               end;
               if (lowercase(momposstring) = ' ') and (inderklammer= false) then
                begin
                  delete(momlinestring, mompos, 1);
                  anzBuchstaben:=length(memo1.lines[momline]);
                  dec(mompos, 1);
                end;
     inc (mompos, 1);
    end;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
 if memo1.text = 'Quellcode' Then
  begin
     memo1.Text:='';
  end;
end;

procedure TForm1.Memo1Click(Sender: TObject);
begin
   if memo1.text = 'Quellcode' then
    begin
       memo1.text:='';
    end;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  button3.click;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  if menuitem3.Checked = true then
   begin
     menuitem3.Checked:=false;
   end else
   begin
     menuitem3.Checked:=true;
   end;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
   memo1.text:='';
   memo2.text:='';
   memo3.text:='';
   gespeichert:=false;
   form1.caption:='Interpreter';
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
   showmessage('Drücke F8, um eine Zeile weiter zu kommen. Um abzubrechen, drücke auf den "Start" Knopf.');
   debugger:=true;
   core;
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
   form3.visible:=true;
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
     form4.visible:=true;
end;

/////////////////////////Kern////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

procedure tform1.core();
begin
  try
  variablenresetten();
  GUIausblenden();
  weiter:=false;
  preprozessor();
  menuitem7.enabled:=true;
  syntable();
  while (momline < totallines) and (Ausfuehren = true) do
  begin
    memo1.SetBookMark(0, 1, momline+1);
    memo1.SetBookMark(0, 1, 0);
    leerzeichenentferner();
    vorderklammer:= copy(momlinestring, 0, pos('(', momlinestring)-1);
    platzklammern:= pos(')', momlinestring) - pos('(', momlinestring) + 1;
    nachderklammer:=copy(momlinestring, pos ('(', momlinestring), platzklammern);
    synonymeersetzen ();
    Anweisungenabpruefen();
    application.processmessages();

    vartable();

        while (weiter=false) and (ausfuehren = true) do
        begin
             if debugger=false then
                begin
                  break;
                end;
             application.processmessages;
        end;
        weiter:=false;
        inc(momline);
  end;
  debugger:=false;
  except
        memo3.lines.add('Es gab einen unbekannten Fehler. Zeile: ' + IntToStr(momline+1) + '. Da ich zum Verbessern wissen muss, wie er zustande kam, schicke mir den Code per mail: wittmaxi@outlook.de. Die Ausführung wurde abgebrochen.');
  end;
  GUIeinblenden();
  menuitem7.enabled:=false;
  menuitem8.enabled:=false;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var i:integer;
begin
   if (key=119) and (debugger=true) then
   begin
      weiter:=true;
   end;
   if key = 120 then
   begin
      If Ausfuehren = true then
      begin
            Ausfuehren:=false;
      end else
          begin
               core();
          end
   end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: char);
begin
   if Key = #09 then
   begin
    Key := #0;
   end;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  If Ausfuehren = true then
   begin
         Ausfuehren:=false;
   end else
   begin
         core();
   end;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  BUtton3.click;
end;


//////////////////////////////////////////////////////////////////////////
procedure TForm1.FormCreate(Sender: TObject);
begin
    memo1.text:='Quellcode';
    memo2.text:='Ausgabe';
    memo3.text:='Fehlermeldungen';
    form1.keypreview:=true;
    setlength(variablen, 0);
    memo1.BookMarkOptions.BookmarkImages := imagelist1;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if savedialog1.Execute then
   begin
     try
         Memo1.Lines.SaveToFile(savedialog1.filename);
         form1.Caption:='Interpreter -->' + savedialog1.FileName;
     except
        memo3.Lines.add('Der Dateipfad ist Fehlerhaft, existiert nicht, oder ist durch administratorbeschränkungen gesperrt... Die Datei konnt nicht gespeichert werden Zeile:'+IntToStr(momline+1));
     end;
   end;
end;

procedure TForm1.Button3Click(Sender: TObject);
          var dateiendung: string;
          var dateiname : string;
          var punktposition: integer;
begin
  gespeichert:=true;
  if opendialog1.Execute then
   begin
     form1.color:=cldefault;
     memo1.color:=clwhite;
     memo2.color:=cldefault;
     memo3.color:=cldefault;
     dateiname:=opendialog1.FileName;
     form1.Caption:='Interpreter --> ' + opendialog1.filename;
     punktposition:=pos('.', dateiname);
       dateiendung:= copy (dateiname, punktposition, 6);
       if dateiendung = '.IGIDE' then
        begin
          memo1.lines.LoadFromFile(dateiname);
        end;
   end;
end;


end.
