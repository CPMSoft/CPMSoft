unit CPMApp_DataChildFMEAFormBaslik;

interface

uses
  CPMApp_DataApp,
  CPMApp_TableQualitySystem;

type
  TAppDataChildFMEAFormBaslik = class(TAppDataChild)
  protected
    function GetTable: TTableFMEAFormBaslik;
    procedure SetTable(Value: TTableFMEAFormBaslik);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
    property Table: TTableFMEAFormBaslik read GetTable write SetTable;
  end;

implementation

uses
  Variants,
  CPMApp_Rule_FieldValidate;

{ TAppDataChildFMEAFormBaslik }

procedure TAppDataChildFMEAFormBaslik.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildFMEAFormBaslik.CreateTable;
begin
  Table := TTableFMEAFormBaslik.Create(DataApp.DataObject);
  Table.Name := 'TableFMEAFormBaslik';
  Table.TableItems.TableNames := VarArrayOf(['FMEAHD']);
  Table.TableItems.TableCaptions := VarArrayOf(['FMEA Form Baþlýk']);
end;

function TAppDataChildFMEAFormBaslik.GetTable: TTableFMEAFormBaslik;
begin
  Result := TTableFMEAFormBaslik(inherited GetTable);
end;

procedure TAppDataChildFMEAFormBaslik.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
  end;
end;

procedure TAppDataChildFMEAFormBaslik.SetTable(Value: TTableFMEAFormBaslik);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildFMEAFormBaslik.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('OPERASYONNO');
  end;
end;

end.
