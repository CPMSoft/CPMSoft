unit CPMApp_DataChildEvrakUretimError;

interface

uses
  DB,
  CPMApp_DataApp,
  CPMApp_TableMRPSystem, CPMApp_Rule_ClientIncrement;

type

  TAppDataChildEvrakUretimError = class(TAppDataChild)
  private
    FRuleSiraNo: TAppRuleClientIncrement;
    procedure CreateDataSet;
  protected
    function GetTable: TTableMRPError;
    procedure SetTable(Value: TTableMRPError);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
    property Table: TTableMRPError read GetTable write SetTable;
    property RuleSiraNo: TAppRuleClientIncrement read FRuleSiraNo write FRuleSiraNo;
  end;

implementation

{ TAppDataChildEvrakUretimError }

procedure TAppDataChildEvrakUretimError.CreateRules;
begin
  inherited;
  FRuleSiraNo := TAppRuleClientIncrement.Create(Table, True);
  Rules.AddRule(FRuleSiraNo);
  FRuleSiraNo.FieldName := 'SIRANO';
end;

procedure TAppDataChildEvrakUretimError.CreateDataSet;
begin
  Table.FieldDefs.Clear;
  with Table.FieldDefs do
  begin
    Add('SIRANO', ftInteger);
    Add('KOD', ftString, 30);
    Add('ACIKLAMA', ftString, 255);
    Add('MALKOD', ftString, 30);
    Add('SIRANO2', ftInteger);
  end;
  Table.CreateFields;
  Table.CreateDataSet;
  Table.Clone.IndexFieldNames := 'SIRANO';
end;

procedure TAppDataChildEvrakUretimError.CreateTable;
begin
  inherited;
  Table := TTableMRPError.Create(nil);
  Table.Name := 'TableUretimError';
  Table.TableItems.TableNames := 'URTERR';
  Table.TableItems.TableReferans := 'MRPERR';
  Table.TableItems.TableCaptions := 'Üretim Uyarýlarý';
  Table.EnableLogChanges := False;
  CreateDataSet;
end;

function TAppDataChildEvrakUretimError.GetTable: TTableMRPError;
begin
  Result := TTableMRPError(inherited GetTable);
end;

procedure TAppDataChildEvrakUretimError.SetDefaultValues;
begin
  inherited;
end;

procedure TAppDataChildEvrakUretimError.SetTable(Value: TTableMRPError);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildEvrakUretimError.SetValidates;
begin
  inherited;
end;

end.
