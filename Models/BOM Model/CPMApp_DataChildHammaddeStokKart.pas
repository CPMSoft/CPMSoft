unit CPMApp_DataChildHammaddeStokKart;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel,
  CPMApp_DataApp, CPMApp_TableItems,
  CpmApp_TableStokSystem, CpmApp_TableUretimSystem;

type

  TAppDataChildCustomHammaddeStokKart = class;
  TAppDataChildHammaddeStokKart = class;

  TAppDataChildCustomHammaddeStokKart = class(TAppDataChild)
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

  TAppDataChildHammaddeStokKart = class(TAppDataChildCustomHammaddeStokKart)
  public
    procedure Add(HammaddeKod: String);
  end;
  
implementation

{ TAppDataChildCustomHammaddeStokKart }

constructor TAppDataChildCustomHammaddeStokKart.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomHammaddeStokKart.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildCustomHammaddeStokKart.CreateTable;
begin
  Table := TTableStokKart.Create(DataApp.DataObject);
  Table.Name := 'TableHammaddeStokKart';
  Table.ProviderName := DefaultProviderName;
  Table.TableItems.TableNames := 'STKKRT';
end;

destructor TAppDataChildCustomHammaddeStokKart.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomHammaddeStokKart.GetTable: TTableStokKart;
begin
  Result := TTableStokKart(inherited GetTable);
end;

procedure TAppDataChildCustomHammaddeStokKart.SetDefaultValues;
begin
  inherited;
end;

procedure TAppDataChildCustomHammaddeStokKart.SetTable(Value: TTableStokKart);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomHammaddeStokKart.SetValidates;
begin
  inherited;
end;

{ TAppDataChildHammaddeStokKart }

procedure TAppDataChildHammaddeStokKart.Add(HammaddeKod: String);
var
  TableCommand: TAppDBTable;
begin
  TableCommand := DataApp.TableCommand;
  with TableCommand do
  begin
    Close;
    if HammaddeKod = '' then
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
      Add('MALKOD', wcEqual, HammaddeKod);
    end;
    Open;
    if not IsEmpty then
      Table.AppendTable(TableCommand);
  end;
end;

end.

