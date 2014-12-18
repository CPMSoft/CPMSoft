unit CPMApp_DataChildFMEAFormDetay;

interface

uses
  CPMApp_DataApp,
  CPMApp_TableQualitySystem;

type
  TAppDataChildFMEAFormDetay = class(TAppDataChild)
  protected
    function GetTable: TTableFMEAFormDetay;
    procedure SetTable(Value: TTableFMEAFormDetay);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
    property Table: TTableFMEAFormDetay read GetTable write SetTable;
  end;

implementation

uses
  Variants,
  CPMApp_Rule_FieldValidate;

{ TAppDataChildFMEAFormDetay }

procedure TAppDataChildFMEAFormDetay.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildFMEAFormDetay.CreateTable;
begin
  Table := TTableFMEAFormDetay.Create(DataApp.DataObject);
  Table.Name := 'TableFMEAFormDetay';
  Table.TableItems.TableNames := VarArrayOf(['FMEADT']);
  Table.TableItems.TableCaptions := VarArrayOf(['FMEA Form Detay']);
end;

function TAppDataChildFMEAFormDetay.GetTable: TTableFMEAFormDetay;
begin
  Result := TTableFMEAFormDetay(inherited GetTable);
end;

procedure TAppDataChildFMEAFormDetay.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
  end;
end;

procedure TAppDataChildFMEAFormDetay.SetTable(Value: TTableFMEAFormDetay);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildFMEAFormDetay.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
  end;
end;

end.
