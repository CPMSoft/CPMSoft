unit CPMApp_DataChildUretimStokHareket;

interface

uses
  CPMApp_DataApp,
  CPMApp_TableStokSystem,
  CPMApp_Rule_ClientIncrement;

type
  TAppDataChildUretimStokHareket = class(TAppDataChild)
  private
    FRuleIncrementSiraNo: TAppRuleClientIncrement;
  protected
    function GetTable: TTableStokHareket;
    procedure SetTable(Value: TTableStokHareket);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
    procedure CreateRules; override;
  published
    property Table: TTableStokHareket read GetTable write SetTable;
    property RuleIncrementSiraNo: TAppRuleClientIncrement read FRuleIncrementSiraNo;
  end;

implementation

uses
  CPMApp_Rule_FieldValidate,
  CPMApp_Rule_FieldDefaultValue;

{ TAppDataChildUretimStokHareket }

procedure TAppDataChildUretimStokHareket.CreateRules;
begin
  inherited;
  FRuleIncrementSiraNo := TAppRuleClientIncrement.Create(Table);
  FRuleIncrementSiraNo.FieldName := 'SIRANO';
  Rules.AddRule(FRuleIncrementSiraNo);
end;

procedure TAppDataChildUretimStokHareket.CreateTable;
begin
  inherited;
  Table := TTableStokHareket.Create(DataApp.DataObject);
  Table.Name := 'TableUretimStokHareket';
  Table.KeyFieldName := 'KALEMSN';
end;

function TAppDataChildUretimStokHareket.GetTable: TTableStokHareket;
begin
  Result := TTableStokHareket(inherited GetTable);
end;

procedure TAppDataChildUretimStokHareket.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
    Add('SIRKETNO', DataApp.CompanyNo);
  end;
end;

procedure TAppDataChildUretimStokHareket.SetTable(
  Value: TTableStokHareket);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildUretimStokHareket.SetValidates;
begin
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('EVRAKNO');
    AddNonBlank('HESAPKOD');
  end;
end;

end.

