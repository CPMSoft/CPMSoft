unit CPMApp_DataChildFMEAFormRevizyon;

interface

uses
  CPMApp_DataApp,
  CPMApp_TableQualitySystem;

type
  TAppDataChildFMEAFormRevizyon = class(TAppDataChild)
  protected
    function GetTable: TTableFMEAFormRevizyon;
    procedure SetTable(Value: TTableFMEAFormRevizyon);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
    property Table: TTableFMEAFormRevizyon read GetTable write SetTable;
  end;

implementation

uses
  Variants,
  CPMApp_Rule_FieldValidate;

{ TAppDataChildFMEAFormRevizyon }

procedure TAppDataChildFMEAFormRevizyon.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildFMEAFormRevizyon.CreateTable;
begin
  Table := TTableFMEAFormRevizyon.Create(DataApp.DataObject);
  Table.Name := 'TableFMEAFormRevizyon';
  Table.TableItems.TableNames := VarArrayOf(['FMEARV']);
  Table.TableItems.TableCaptions := VarArrayOf(['FMEA Form Revizyon']);
end;

function TAppDataChildFMEAFormRevizyon.GetTable: TTableFMEAFormRevizyon;
begin
  Result := TTableFMEAFormRevizyon(inherited GetTable);
end;

procedure TAppDataChildFMEAFormRevizyon.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
  end;
end;

procedure TAppDataChildFMEAFormRevizyon.SetTable(Value: TTableFMEAFormRevizyon);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildFMEAFormRevizyon.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
  end;
end;

end.
