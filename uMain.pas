{
  ##################################

  Author: Dmytro Khalin
  e-mail: d.khalin@gmail.com
  date: 05.02.2014

  ##################################
}


unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, ExtCtrls, StdCtrls, Buttons, PngSpeedButton, ComCtrls,
  PngBitBtn, stcommon, stbase, stsys, DB, dbf, uLog;

type
  TfrmMain = class(TForm)
    pMain: TPanel;
    elDbf: TLabeledEdit;
    elReestr: TLabeledEdit;
    btnSelectDbf: TPngSpeedButton;
    btnSelectReestr: TPngSpeedButton;
    pbMain: TProgressBar;
    lblAcc: TLabel;
    lblAccNo: TLabel;
    btnGo: TPngBitBtn;
    manXP: TXPManifest;
    dlgOpenDbf: TOpenDialog;
    dlgOpenReestr: TOpenDialog;
    dbfMain: TDbf;
    btnAbout: TPngSpeedButton;
    procedure btnSelectDbfClick(Sender: TObject);
    procedure btnSelectReestrClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  pbaseMain : Pbase;
implementation

{$R *.dfm}

function MyFindFD(const s: string): PField;
var ss:array[0..255] of char;
begin
 result:=stFindFD(StrPCopy(ss,s));
end;

procedure TfrmMain.btnSelectDbfClick(Sender: TObject);
begin
  if dlgOpenDbf.Execute then
    elDbf.Text := dlgOpenDbf.FileName
  else
    elDbf.Text := '';
end;

procedure TfrmMain.btnSelectReestrClick(Sender: TObject);
begin
  if dlgOpenReestr.Execute then
    elReestr.Text := dlgOpenReestr.FileName
  else
    elReestr.Text := '';
end;

procedure TfrmMain.btnGoClick(Sender: TObject);
var
  i,y,x,z:integer;
  strNumTax, strFIO, strRS, strRSold:string;
  strLGCODE:integer;
  Field:PField;
  B_LgP:PBase;
  Lg_CdO,R_NumTax:PChar;
  Lg_Cd:PWord;
  R_NCardP:PInteger;
begin
btnGo.Enabled := False;
StayInitiate();
if (elDbf.Text <> '') And (elReestr.Text <> '') then
  begin
    try
      with dbfMain do
      begin
        TableName := elDbf.Text;
        Active := true;
      end;
    except
        ShowMessage ('Помилка: dbf-файл недоступний!');
    end;
    try
      pbaseMain := stBuildBaseFile(PAnsiChar(elReestr.Text));
      stOpen(pbaseMain,RDWR);
      stSetIndex(pbaseMain,1);
      stSetBegin(pbaseMain);
    except
      ShowMessage ('Помилка: Неможливо прочитати REESTRLG.DT!');
    end;
    pbMain.Max := stsize(pbaseMain);
    for y := 1 to stsize(pbaseMain) do
    begin
      Application.ProcessMessages;
      stGetNext(pbaseMain);
      R_NumTax := MyFindFD('R_NumTax').val;
      R_NCardP := MyFindFD('R_NCardP').val;
      lblAccNo.Caption := R_NumTax;
      pbMain.Position := y;
      dbfMain.First;
      for i := 1 to dbfMain.RecordCount do
      begin
       Application.ProcessMessages;
       try
         strNumTax := dbfMain.FieldByName('IDCODE').AsString;
         strFIO := dbfMain.FieldByName('FIO').AsString;
         strRS := Trim(dbfMain.FieldByName('RS').AsString);
         strLGCODE := dbfMain.FieldByName('LGCODE').AsInteger;
        except
         ShowMessage ('Помилка: dbf-файл має невідому структуру!');
        end;
       if R_NumTax = strNumTax then
       begin
          Field:=myFindFD('B_LgP');
          B_LgP:=PBase(Field);
          stSetBegin(B_LgP);
          for x := 1 to stsize(B_LgP) do
          begin
            Application.ProcessMessages;
            stGetNext(B_LgP);
            Lg_Cd := MyFindFD('Lg_Cd').val;
            if Pos(IntToStr(strLGCODE), IntToStr(Lg_Cd^)) > 0 then
            begin
              Lg_CdO := MyFindFD('Lg_CdO').val;
              if Lg_CdO <> strRS then
              begin
                strRSold := Lg_CdO;
                for z:=1 to Length(strRS) do
                begin
                  Lg_CdO^:=strRS[z];
                  Lg_CdO:=Lg_CdO+1;
                end;
                stModify(B_LgP);
                frmLog.mmMain.Lines.Add('Картка №'+IntToStr(R_NCardP^)+' '+strFIO+' '+' (ІН: № '+strNumTax+'),'+' код пільги '+IntToStr(Lg_Cd^)+', заміна ОР '+strRSold+' => '+strRS);
              end;
            end;
          end;
       end;
       dbfMain.Next;
      end;
    end;
    stClose(pbaseMain);
    dbfMain.Active := false;
    ShowMessage('Оброблено '+IntToStr(pbMain.Position)+' записів');
    pbMain.Position := 0;
    btnGo.Enabled := True;
    frmLog.ShowModal;
  end
  else
    ShowMessage ('Помилка: файли не обрані!');
end;

procedure TfrmMain.btnAboutClick(Sender: TObject);
begin
ShowMessage('Програма призначена для пакетної заміни особистих рахунків на основі dbf-файлів для звірки, що подаються підприємствами-надавачами комунальних послуг.'+#13+'Інформація заповнюється при відповідності значення поля IDCODE в dbf-файлі та ідентифікаційного коду пільговика в базі EDARP.'+#13+#13+'Вимоги до системи:'+#13+'- PervasiveSQL Server, якщо REESTRLG.DT знаходиться на локальному компютері'+#13+'- PervasiveSQL Client, якщо REESTRLG.DT знаходиться на сервері'+#13+#13+'dr1v3'+#13+'2014'+#13+#13+'Зауваження приймаються за адресою 2800@list.ru');
end;

end.
