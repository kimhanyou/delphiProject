program Project_Mobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  UMain in 'UMain.pas' {MainForm},
  UDm in 'UDm.pas' {DM: TDataModule},
  UClientClass in 'UClientClass.pas',
  UInsert in 'UInsert.pas' {InsertForm},
  UReserve in 'UReserve.pas' {ReserveForm},
  UMypage in 'UMypage.pas' {MypageForm},
  UFindLib in 'UFindLib.pas' {FindForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
