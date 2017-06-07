unit UDm;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, Datasnap.DSConnect, UClientClass;

type
  TDM = class(TDataModule)
    LibConnection: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    Cl_qryUser: TClientDataSet;
    CL_qryCheckLogin: TClientDataSet;
    UserSource: TDataSource;
    CheckLoginSource: TDataSource;
    Cl_qryUserUSER_SEQ: TIntegerField;
    Cl_qryUserUSER_NAME: TWideStringField;
    Cl_qryUserUSER_ID: TStringField;
    Cl_qryUserUSER_PW: TStringField;
    Cl_qryUserUSER_PHONE: TStringField;
    Cl_qryUserUSER_MAIL: TWideStringField;
    Cl_qryUserUSER_OUT_YN: TStringField;
    Cl_DuplicateID: TClientDataSet;
    DuplicatedIDSource: TDataSource;
    Cl_qryLibAddress: TClientDataSet;
    LibAddressSource: TDataSource;
    Cl_qryLibName: TClientDataSet;
    LibNameSource: TDataSource;
    Cl_qryLibNameLIB_SEQ: TAutoIncField;
    Cl_qryLibNameLIBNAME: TWideStringField;
    Cl_qryLibNameLIBADDRESS: TWideStringField;
    Cl_qryLibNameLIBOPEN: TTimeField;
    Cl_qryLibNameLIBCLOSE: TTimeField;
    Cl_qryLibNameLIBHOLIDAY: TDateField;
    Cl_qryLibNameLIBROOMNUM: TIntegerField;
    RentSource: TDataSource;
    Cl_qryRent: TClientDataSet;
    Cl_qrySeat: TClientDataSet;
    qrySeat_Source: TDataSource;
    Cl_DupSeat: TClientDataSet;
    qryDupSeat_source: TDataSource;
    Cl_qrySeatRENT_SEATNUM: TIntegerField;
    Cl_qryTalking: TClientDataSet;
    TalkingSource: TDataSource;

    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;
  demo: TServerMethods1Client;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  demo := TServerMethods1Client.CREATE(LibConnection.DBXConnection);
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  demo.Free;
end;

end.
