unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, ExtCtrls, StdCtrls, Buttons, PngSpeedButton, ComCtrls,
  PngBitBtn;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

end.
