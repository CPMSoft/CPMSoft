unit CPMApp_DataChildUretimStokMaliyet;

interface

uses
  CPMApp_DataApp,
  CPMApp_TableStokSystem;

type
  TAppDataChildUretimStokMaliyet = class(TAppDataChild)
  protected
    function GetTable: TTableStokMaliyet;
    procedure SetTable(Value: TTableStokMaliyet);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
    procedure CreateRules; override;
  published
    property Table: TTableStokMaliyet read GetTable write SetTable;
  end;

implementation

uses
  CPMApp_Rule_FieldValidate,
  CPMApp_Rule_FieldDefaultValue;

{ TAppDataChildUretimStokMaliyet }

procedure TAppDataChildUretimStokMaliyet.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildUretimStokMaliyet.CreateTable;
begin
  inherited;
  Table := TTableStokMaliyet.Create(DataApp.DataObject);
  Table.Name := 'TableUretimStokMaliyet';
end;

function TAppDataChildUretimStokMaliyet.GetTable: TTableStokMaliyet;
begin
  Result := TTableStokMaliyet(inherited GetTable);
end;

procedure TAppDataChildUretimStokMaliyet.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
  end;
end;

procedure TAppDataChildUretimStokMaliyet.SetTable(
  Value: TTableStokMaliyet);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildUretimStokMaliyet.SetValidates;
begin
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('EVRAKNO');
    AddNonBlank('HESAPKOD');
  end;
end;

end.

