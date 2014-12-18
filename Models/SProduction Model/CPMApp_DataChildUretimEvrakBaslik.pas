unit CPMApp_DataChildUretimEvrakBaslik;

interface

uses
  CPMApp_DataApp,
  CPMApp_TableCariSystem;

type
  TAppDataChildUretimEvrakBaslik = class(TAppDataChild)
  protected
    function GetTable: TTableEvrakBaslik;
    procedure SetTable(Value: TTableEvrakBaslik);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
    procedure CreateRules; override;
  published
    property Table: TTableEvrakBaslik read GetTable write SetTable;
  end;

implementation

uses
  SysUtils,
  CPMApp_Rule_FieldValidate,
  CPMApp_Rule_FieldDefaultValue;

{ TAppDataChildUretimEvrakBaslik }

procedure TAppDataChildUretimEvrakBaslik.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildUretimEvrakBaslik.CreateTable;
begin
  inherited;
  Table := TTableEvrakBaslik.Create(DataApp.DataObject);
  Table.Name := 'TableUretimEvrakBaslik';
  Table.KeyFieldName := 'EVRAKSN';
end;

function TAppDataChildUretimEvrakBaslik.GetTable: TTableEvrakBaslik;
begin
  Result := TTableEvrakBaslik(inherited GetTable);
end;

procedure TAppDataChildUretimEvrakBaslik.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
    Add('SIRKETNO', DataApp.CompanyNo);
  end;
end;

procedure TAppDataChildUretimEvrakBaslik.SetTable(
  Value: TTableEvrakBaslik);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildUretimEvrakBaslik.SetValidates;
begin
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('EVRAKNO');
    AddNonBlank('HESAPKOD');
  end;
end;

end.
