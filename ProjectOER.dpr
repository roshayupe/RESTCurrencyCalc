program ProjectOER;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitMain in 'UnitMain.pas' {MainForm},
  UnitDM in 'UnitDM.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
