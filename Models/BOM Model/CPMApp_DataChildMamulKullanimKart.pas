unit CPMApp_DataChildMamulKullanimKart;

interface

uses
  CPMApp_DataApp,
  CPMApp_TableBOMSystem;

type
  TAppDataChildMamulKullanimKart = class(TAppDataChild)
  protected
    function GetTable: TTableMamulKullanimKart;
    procedure SetTable(Value: TTableMamulKullanimKart);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
    property Table: TTableMamulKullanimKart read GetTable write SetTable;
  end;

implementation

uses
  Variants,
  CPMApp_Rule_FieldValidate;

{ TAppDataChildMamulKullanimKart }

procedure TAppDataChildMamulKullanimKart.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildMamulKullanimKart.CreateTable;
begin
  Table := TTableMamulKullanimKart.Create(DataApp.DataObject);
  Table.Name := 'TableMamulKullanimKart';
  Table.TableItems.TableNames := VarArrayOf(['MAMKUK']);
  Table.TableItems.TableCaptions := VarArrayOf(['Mamül Kullaným Kart']);
  LoadFields('TableMamulKullanimKart');
end;

function TAppDataChildMamulKullanimKart.GetTable: TTableMamulKullanimKart;
begin
  Result := TTableMamulKullanimKart(inherited GetTable);
end;

procedure TAppDataChildMamulKullanimKart.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
  end;
end;

procedure TAppDataChildMamulKullanimKart.SetTable(Value: TTableMamulKullanimKart);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildMamulKullanimKart.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
  end;
end;

end.


