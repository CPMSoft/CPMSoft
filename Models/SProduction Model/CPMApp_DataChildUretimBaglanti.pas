unit CPMApp_DataChildUretimBaglanti;

interface

uses
  CPMApp_DataApp,
  CPMApp_TableUretimSystem;

type
  TAppDataChildUretimBaglanti = class(TAppDataChild)
  protected
    function GetTable: TTableUretimBaglanti;
    procedure SetTable(Value: TTableUretimBaglanti);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
    property Table: TTableUretimBaglanti read GetTable write SetTable;
  end;

implementation

uses
  SysUtils,
  CPMApp_Rule_FieldValidate;

{ TAppDataChildUretimBaglanti }

procedure TAppDataChildUretimBaglanti.CreateRules;
begin
  inherited;
end;

procedure TAppDataChildUretimBaglanti.CreateTable;
begin
  Table := TTableUretimBaglanti.Create(DataApp.DataObject);
  Table.Name := 'TableUretimBaglanti';
end;

function TAppDataChildUretimBaglanti.GetTable: TTableUretimBaglanti;
begin
  Result := TTableUretimBaglanti(inherited GetTable);
end;

procedure TAppDataChildUretimBaglanti.SetDefaultValues;
begin
  inherited;
end;

procedure TAppDataChildUretimBaglanti.SetTable(Value: TTableUretimBaglanti);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildUretimBaglanti.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('EVRAKTIP');
    AddNonBlank('HESAPKOD');
    AddNonBlank('URETIMNO');
    AddNonBlank('SIRANO');
  end;
end;

end.
