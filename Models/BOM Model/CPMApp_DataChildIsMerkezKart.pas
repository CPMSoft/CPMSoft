unit CPMApp_DataChildIsMerkezKart;

interface

uses
  CPMApp_DataApp,
  CPMApp_TableBOMSystem;

type
  TAppDataChildIsMerkezKart = class(TAppDataChild)
  protected
    function GetTable: TTableIsMerkezKart;
    procedure SetTable(Value: TTableIsMerkezKart);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
    property Table: TTableIsMerkezKart read GetTable write SetTable;
  end;

implementation

uses CPMApp_Rule_FieldValidate;

{ TAppDataChildIsMerkezKart }

procedure TAppDataChildIsMerkezKart.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildIsMerkezKart.CreateTable;
begin
  Table := TTableIsMerkezKart.Create(DataApp.DataObject);
  Table.Name := 'TableIsMerkezKart';
end;

function TAppDataChildIsMerkezKart.GetTable: TTableIsMerkezKart;
begin
  Result := TTableIsMerkezKart(inherited GetTable);
end;

procedure TAppDataChildIsMerkezKart.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
    Add('SIRKETNO', DataApp.CompanyNo);
  end;
end;

procedure TAppDataChildIsMerkezKart.SetTable(Value: TTableIsMerkezKart);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildIsMerkezKart.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('ISMERKEZKOD');
    AddNonBlank('ISMERKEZAD');
  end;
end;

end.
