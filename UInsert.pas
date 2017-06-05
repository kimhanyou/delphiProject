unit UInsert;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit, FMX.Objects, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Layouts, UDm, UClientClass;

type
  TInsertForm = class(TForm)
    LayoutMAIN: TLayout;
    MainPanel: TPanel;
    Rectangle3: TRectangle;
    LayoutINSERT: TLayout;
    RoundRect3: TRoundRect;
    Text2: TText;
    Text1: TText;
    Image1: TImage;
    img_Check: TImage;
    LayoutDuplicteID: TLayout;
    RoundRect2: TRoundRect;
    Text7: TText;
    ToolBar6: TToolBar;
    Text14: TText;
    LayoutID: TLayout;
    Layout2: TLayout;
    RoundRect1: TRoundRect;
    Text3: TText;
    Layout4: TLayout;
    RoundRect4: TRoundRect;
    EditID: TEdit;
    LayoutMAIL: TLayout;
    Layout12: TLayout;
    RoundRect9: TRoundRect;
    Text4: TText;
    Layout13: TLayout;
    RoundRect10: TRoundRect;
    EditMAIL: TEdit;
    LayoutNAME: TLayout;
    Layout6: TLayout;
    RoundRect5: TRoundRect;
    Text5: TText;
    Layout7: TLayout;
    RoundRect6: TRoundRect;
    EditNAME: TEdit;
    LayoutPHONE: TLayout;
    Layout3: TLayout;
    RoundRect8: TRoundRect;
    Text8: TText;
    Layout5: TLayout;
    RoundRect11: TRoundRect;
    EditPHONE: TEdit;
    LayoutPW: TLayout;
    Layout9: TLayout;
    RoundRect12: TRoundRect;
    text10: TText;
    Layout10: TLayout;
    RoundRect13: TRoundRect;
    EditPW: TEdit;
    procedure btnInsert(Sender: TObject);
    procedure btnDuplicatedID(Sender: TObject);
    function UserInsert: Boolean;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function DuplicatedUser: Boolean;
  public
    { Public declarations }
  end;

var
  InsertForm: TInsertForm;

implementation

{$R *.fmx}

uses UMain;

procedure TInsertForm.btnDuplicatedID(Sender: TObject); // ID �ߺ�üũ ��ưŬ��
begin
  DuplicatedUser;
end;

procedure TInsertForm.btnInsert(Sender: TObject); // ȸ������ ��ưŬ��
begin
  if EditNAME.Text = '' then
  begin
    ShowMessage('�̸��� �Է��ϼ���.');
    EditNAME.SetFocus;
    Exit;
  end;

  if EditID.Text = '' then
  begin
    ShowMessage('���̵� �Է��ϼ���.');
    EditID.SetFocus;
    Exit;
  end;

  if EditPW.Text = '' then
  begin
    ShowMessage('��й�ȣ�� �Է��ϼ���.');
    EditPW.SetFocus;
    Exit;
  end;

  if EditPHONE.Text = '' then
  begin
    ShowMessage('��ȭ��ȣ�� �Է��ϼ���.');
    EditPHONE.SetFocus;
    Exit;
  end;

  UserInsert;

  if dm.Cl_qryUser.ChangeCount > 0 then
  begin
    dm.Cl_qryUser.applyUpdates(0);

    begin
      if not Assigned(MainForm) then
        MainForm := TMainForm.Create(Self);
      MainForm.Show;
    end;
  end;

end;

function TInsertForm.UserInsert: Boolean; // ȸ�������ϴ� function
var
  UserNAME, UserID, UserPW, UserPHONE, UserMAIL: string;
begin
  dm.Cl_qryUser.Append;

  UserNAME := EditNAME.Text;
  UserID := EditID.Text;
  UserPW := EditPW.Text;
  UserPHONE := EditPHONE.Text;
  UserMAIL := EditMAIL.Text;

  dm.Cl_qryUser.FieldByName('User_NAME').AsString := UserNAME;
  dm.Cl_qryUser.FieldByName('User_ID').AsString := UserID;
  dm.Cl_qryUser.FieldByName('User_PW').AsString := UserPW;
  dm.Cl_qryUser.FieldByName('User_PHONE').AsString := UserPHONE;
  dm.Cl_qryUser.FieldByName('USER_MAIL').AsString := UserMAIL;

  dm.Cl_qryUser.Post;
  ShowMessage('����Ϸ�');
end;

function TInsertForm.DuplicatedUser: Boolean; // ���̵� �ߺ�üũ
var
  ID: string;
begin
  ID := EditID.Text;

  if (ID = '') then
    Exit;

  if demo.DuplicatedID(ID) then
  begin
    ShowMessage('�̹� ��ϵ� ID �Դϴ�.');
  end

  else
  begin
    ShowMessage('��밡���� ID �Դϴ�.');
    EditPW.enabled := true;
    EditMAIL.enabled := true;
    EditPHONE.enabled := true;
    img_Check.Visible := true;
  end;
end;

procedure TInsertForm.FormCreate(Sender: TObject);
begin
  EditPW.enabled := false;
  EditPHONE.enabled := false;
  EditMAIL.enabled := false;
end;

end.
