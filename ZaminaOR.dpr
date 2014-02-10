program ZaminaOR;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uLog in 'uLog.pas' {frmLog};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Заміна особового рахунку в базі ЕДАРП';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmLog, frmLog);
  Application.Run;
end.
