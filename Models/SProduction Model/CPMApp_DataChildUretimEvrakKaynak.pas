unit CPMApp_DataChildUretimEvrakKaynak;

interface

uses
  CPMApp_DataApp,
  CPMApp_TableStokSystem;

type
  TAppDataChildUretimEvrakKaynak = class(TAppDataChild)
  protected
    function GetTable: TTableEvrakKaynak;
    procedure SetTable(Value: TTableEvrakKaynak);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
    property Table: TTableEvrakKaynak read GetTable write SetTable;
  end;
  
implementation

uses
  SysUtils,
  CPMApp_Rule_FieldValidate,
  CPMApp_Rule_FieldDefaultValue;

{ TAppDataChildUretimEvrakKaynak }

procedure TAppDataChildUretimEvrakKaynak.CreateRules;
begin
  inherited;
end;

procedure TAppDataChildUretimEvrakKaynak.CreateTable;
begin
  Table := TTableEvrakKaynak.Create(DataApp.DataObject);
  Table.Name := 'TableEvrakKaynak';
  Table.TableItems.TableNames := 'SHRKYN';
  Table.TableItems.TableCaptions := 'Evrak Kaynak';
end;

function TAppDataChildUretimEvrakKaynak.GetTable: TTableEvrakKaynak;
begin
  Result := TTableEvrakKaynak(inherited GetTable);
end;

procedure TAppDataChildUretimEvrakKaynak.SetDefaultValues;
begin
  inherited;
end;

procedure TAppDataChildUretimEvrakKaynak.SetTable(Value: TTableEvrakKaynak);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildUretimEvrakKaynak.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('EVRAKTIP');
    AddNonBlank('HESAPKOD');
    AddNonBlank('EVRAKNO');
    AddNonBlank('SIRANO');
  end;
end;

end.
