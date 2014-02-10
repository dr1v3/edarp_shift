unit uLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PngBitBtn;

type
  TfrmLog = class(TForm)
    mmMain: TMemo;
    btnSave: TPngBitBtn;
    dlgSave: TSaveDialog;
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLog: TfrmLog;

implementation

{$R *.dfm}

procedure TfrmLog.btnSaveClick(Sender: TObject);
begin
try
  if dlgSave.Execute then mmMain.Lines.SaveToFile(dlgSave.FileName);
except
  ShowMessage('Помилка: Неможливо зберегти файл!');
end;
end;

procedure TfrmLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mmMain.Lines.Clear;
end;

end.
