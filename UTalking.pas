unit UTalking;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Edit,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.TMSBaseControl, FMX.TMSLabelEdit,
  FMX.TMSCustomEdit, FMX.TMSSearchEdit, UDm, UMain;

type
  TTalkForm = class(TForm)
    LY_Talking: TLayout;
    Panel4: TPanel;
    Rectangle3: TRectangle;
    Text15: TText;
    Circle3: TCircle;
    Text17: TText;
    Image1: TImage;
    LY_Send: TLayout;
    RoundRect9: TRoundRect;
    Text7: TText;
    LY_Remake: TLayout;
    RoundRect10: TRoundRect;
    Text4: TText;
    LY_SubTitle: TLayout;
    Layout2: TLayout;
    RoundRect1: TRoundRect;
    Text1: TText;
    LY_Letter: TLayout;
    ToolBar6: TToolBar;
    Text14: TText;
    masterbutton: TButton;
    Rectangle1: TRectangle;
    EditLetter: TEdit;
    procedure remakebutton(Sender: TObject);
    procedure masterbuttonClick(Sender: TObject);
    function SendMSG: Boolean;
    procedure SendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TalkForm: TTalkForm;

implementation

{$R *.fmx}

procedure TTalkForm.masterbuttonClick(Sender: TObject);
begin
  TalkForm.Close;
end;

procedure TTalkForm.remakebutton(Sender: TObject);
begin
  EditLetter.Text.Empty;
end;

function TTalkForm.SendMSG: Boolean; // qryTalking 에 예약정보 보내는 function
var
  UserID: string;
  MesContent: string;
begin
  Dm.Cl_qryTalking.Append;

  UserID := MainForm.MYID;
  MesContent := EditLetter.Text;

  Dm.Cl_qryTalking.FieldByName('USer_ID').AsString := UserID;
  Dm.Cl_qryTalking.FieldByName('MES_CONTENT').AsString := MesContent;
  Dm.Cl_qryTalking.post;
  ShowMessage('메시지 전송');

  if Dm.Cl_qryTalking.ChangeCount > 0 then
  begin
    Dm.Cl_qryTalking.applyUpdates(0);
  end;

end;

procedure TTalkForm.SendClick(Sender: TObject);
begin
  SendMSG;
end;

end.
