unit UMain2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TMainForm2 = class(TForm)
    LayoutMAIN: TLayout;
    MainPanel: TPanel;
    Rectangle3: TRectangle;
    toptext: TText;
    Layout2: TLayout;
    RoundRect1: TRoundRect;
    Text3: TText;
    LayoutLogin: TLayout;
    RoundRect2: TRoundRect;
    Text1: TText;
    LY_Menu1: TLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Label1: TLabel;
    Edit1: TEdit;
    Layout1: TLayout;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Label2: TLabel;
    procedure TalkFormClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm2: TMainForm2;

implementation

{$R *.fmx}

uses UTalking;

procedure TMainForm2.TalkFormClick(Sender: TObject);
begin
  if not Assigned(TalkForm) then
    TalkForm := TTalkForm.Create(self);

  TalkForm.SHOW;
end;

end.
