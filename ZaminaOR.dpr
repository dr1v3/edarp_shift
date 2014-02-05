program ZaminaOR;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Заміна особового рахунку в базі ЕДАРП';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
