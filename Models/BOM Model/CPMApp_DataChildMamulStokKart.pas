unit CPMApp_DataChildMamulStokKart;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel,
  CPMApp_DataApp, CPMApp_TableItems,
  CpmApp_TableStokSystem, CpmApp_TableUretimSystem;

type

  TAppDataChildCustomMamulStokKart = class;
  TAppDataChildMamulStokKart = class;

  TAppDataChildCustomMamulStokKart = class(TAppDataChild)
  private
  protected
    function GetTable: TTableStokKart;
    procedure SetTable(Value: TTableStokKart);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableStokKart read GetTable write SetTable;
  end;

  TAppDataChildMamulStokKart = class(TAppDataChildCustomMamulStokKart)
  public
    procedure Open(MamulKod: String);
  end;

  TAppDataChildMamulMultiStokKart = class(TAppDataChildMamulStokKart)
  public
    procedure Add(MamulKod: String);
  end;
implementation

{ TAppDataChildCustomMamulStokKart }

constructor TAppDataChildCustomMamulStokKart.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomMamulStokKart.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildCustomMamulStokKart.CreateTable;
begin
  Table := TTableStokKart.Create(DataApp.DataObject);
  Table.Name := 'TableMamulStokKart';
  Table.ProviderName := DefaultProviderName;
end;

destructor TAppDataChildCustomMamulStokKart.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomMamulStokKart.GetTable: TTableStokKart;
begin
  Result := TTableStokKart(inherited GetTable);
end;

procedure TAppDataChildCustomMamulStokKart.SetDefaultValues;
begin
  inherited;
end;

procedure TAppDataChildCustomMamulStokKart.SetTable(Value: TTableStokKart);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomMamulStokKart.SetValidates;
begin
  inherited;
end;

{ TAppDataChildMamulStokKart }

procedure TAppDataChildMamulStokKart.Open(MamulKod: String);
begin
  Table.Close;
  if MamulKod = '' then
    exit;
  with Table.TableItems[0].Where do
  begin
    Clear;
    Add('MALKOD', wcEqual, MamulKod);
  end;
  Table.Open;
  Table.TableItems[0].Where.Clear;
end;

{ TAppDataChildMamulMultiStokKart }

procedure TAppDataChildMamulMultiStokKart.Add(MamulKod: String);
var
  TableCommand: TAppDBTable;
begin
  TableCommand := DataApp.TableCommand;
  with TableCommand do
  begin
    Close;
    if MamulKod = '' then
      exit;
    TableItems.TableNames := 'STKKRT';
    with TableItems[0].Fields do
    begin
      Clear;
      Add('*');
    end;
    with TableItems[0].Where do
    begin
      Clear;
      Add('MALKOD', wcEqual, MamulKod);
    end;
    Open;
    if not IsEmpty then
      Table.AppendTable(TableCommand);
  end;
end;

end.

