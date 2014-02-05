unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, ExtCtrls, StdCtrls, Buttons, PngSpeedButton, ComCtrls;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    elDbf: TLabeledEdit;
    elReestr: TLabeledEdit;
    PngSpeedButton1: TPngSpeedButton;
    PngSpeedButton2: TPngSpeedButton;
    ProgressBar1: TProgressBar;
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
