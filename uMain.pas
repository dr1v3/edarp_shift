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
  PngBitBtn, stcommon, stbase, stsys, DB, dbf;

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
    procedure btnSelectDbfClick(Sender: TObject);
    procedure btnSelectReestrClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

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
  i:integer;
  strNumTax, strFIO, strRS:string;
begin
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
    pbMain.Max := dbfMain.RecordCount;
    for i := 1 to dbfMain.RecordCount do
    begin
      Application.ProcessMessages;
      try
        strNumTax := dbfMain.FieldByName('IDCODE').AsString;
        strFIO := dbfMain.FieldByName('FIO').AsString;
        strRS := dbfMain.FieldByName('RS').AsString;
       except
        ShowMessage ('Помилка: dbf-файл має невідому структуру!');
      end;
      lblAccNo.Caption := strNumTax;
      pbMain.Position := i;
      dbfMain.Next;
    end;
    dbfMain.Active := false;
    ShowMessage('Оброблено '+IntToStr(pbMain.Position)+' записів, результати у файлі log.txt');
    pbMain.Position := 0;
  end
  else
    ShowMessage ('Помилка: файли не обрані!');
end;

end.
