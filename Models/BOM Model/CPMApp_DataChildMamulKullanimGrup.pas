unit CPMApp_DataChildMamulKullanimGrup;

interface

uses
  CPMApp_DataApp,
  CPMApp_TableBOMSystem;

type
  TAppDataChildMamulKullanimGrup = class(TAppDataChild)
  protected
    function GetTable: TTableMamulKullanimGrup;
    procedure SetTable(Value: TTableMamulKullanimGrup);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
    property Table: TTableMamulKullanimGrup read GetTable write SetTable;
  end;

implementation

uses
  Variants,
  CPMApp_Rule_FieldValidate,
  CPMApp_Rule_FieldDefaultValue;

{ TAppDataChildMamulKullanimGrup }

procedure TAppDataChildMamulKullanimGrup.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildMamulKullanimGrup.CreateTable;
begin
  Table := TTableMamulKullanimGrup.Create(DataApp.DataObject);
  Table.Name := 'TableMamulKullanimGrup';
  Table.TableItems.TableNames := VarArrayOf(['MAMKUG']);
  Table.TableItems.TableCaptions := VarArrayOf(['Mamül Kullaným Grup']);
  LoadFields('TableMamulKullanimGrup');
end;

function TAppDataChildMamulKullanimGrup.GetTable: TTableMamulKullanimGrup;
begin
  Result := TTableMamulKullanimGrup(inherited GetTable);
end;

procedure TAppDataChildMamulKullanimGrup.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
  end;
// Dikkat - sahtagil - 28.09.2007
// Default Values olarak KEY alaný verdiðim için otomatik edit moddan çýkacaktýr bulunur ise.
// bundan dolayý baþka bir default value veremem ve buna dikkat etmek zorundayým.
// bütün eventlerde sorun çýkarabilir.
end;

procedure TAppDataChildMamulKullanimGrup.SetTable(Value: TTableMamulKullanimGrup);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildMamulKullanimGrup.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('GRUPNO');
    AddNonBlank('SIRANO');
    AddNonBlank('KULLANIMKOD');
  end;
end;

end.


