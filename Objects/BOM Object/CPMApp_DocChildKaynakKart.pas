unit CPMApp_DocChildKaynakKart;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Forms, Dialogs,
  Controls, DB,
  CPMApp_DocObjectModel,
  CPMApp_Storage,
  CPMApp_DataObjectModel,
  CPMApp_DAPCustomCRPKart,
  CPMApp_TableCRPSystem
  ,CPMApp_Images;

type
  TAppDocChildKaynakKart = class(TAppDocChild)
  private
    FPipeline: TAppPipeline;
    FTableSources: TAppTable;
    FPipelineName: String;
    function GetPipelineName: String;
  protected
  public
    Storage: TAppStorage;
    ParamsSablonTip : Integer;
    FDataApp: TAppDAPCustomCRPKart;
    procedure AfterCreate; override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function CreateForm: TScrollingWinControl; override;
    procedure AddPipeline; override;

    procedure Initialize(IniFile: TAppIniFile); override;
    procedure Finalize(IniFile: TAppIniFile); override;
    property Pipeline: TAppPipeline read FPipeline;
  published
    property DataApp: TAppDAPCustomCRPKart read FDataApp write FDataApp;
    property PipelineName: String read GetPipelineName write FPipelineName;
    property TableSources: TAppTable read FTableSources write FTableSources;
  end;

implementation

uses CPMApp_CRPObjectStrs, CPMApp_DocFormGantt, CPMApp_Dialogs, CPMApp_Security, CPMApp_Lib, CPMApp_StrUtils,
  CPMApp_DataObjectDB;

{ TAppDocChildKaynakKart }

procedure TAppDocChildKaynakKart.AfterCreate;
begin
  inherited;
end;

constructor TAppDocChildKaynakKart.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FTableSources := TAppTable.Create(self);
  FTableSources.Name := 'TableGanttResources';
  FTableSources.Connection := Connection;
  FTableSources.OpenCommandText('SELECT KAYNAKKOD, KAYNAKAD FROM URTKYN WHERE KAYITTUR = ''01'' ORDER BY KAYNAKKOD');
end;

function TAppDocChildKaynakKart.CreateForm: TScrollingWinControl;
begin
  Result := TFrame(TAppDocFormGantt.Create(DocObject.MainForm));
  IForm := TAppDocFormGantt(Result) as IAppDocChildForm;
end;

procedure TAppDocChildKaynakKart.AddPipeline;
begin
  inherited;
  FPipeline := DocObject.Report.CreatePipeline(TAppDocFormGantt(Form).DataSourceGantt, PipelineName);
end;

destructor TAppDocChildKaynakKart.Destroy;
begin
  FreeAndNil(FTableSources);
  inherited;
end;

procedure TAppDocChildKaynakKart.Initialize(IniFile: TAppIniFile);
begin
  inherited;
  TAppDocFormGantt(Form).DataSourceGantt.DataSet := TableObject.DataSet;
  TAppDocFormGantt(Form).DataSourceResources.DataSet := FTableSources.DataSet;
  TAppDocFormGantt(Form).DataApp := DataApp;
end;

procedure TAppDocChildKaynakKart.Finalize(IniFile: TAppIniFile);
begin
  inherited;
end;

function TAppDocChildKaynakKart.GetPipelineName: String;
begin
  Result := FPipelineName;
  if Result = '' then
    Result := 'pp' + Self.Name;
end;

end.

