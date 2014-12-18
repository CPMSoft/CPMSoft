unit CPMApp_DataChildMamulRevizyon;

interface

uses
  DB,
  Dialogs,
  CPMApp_DataObject,
  CPMApp_DataApp,
  CPMApp_TableBOMSystem;

type
  TAppDataChildMamulRevizyon = class;

  TAppDataChildCustomMamulRevizyon = class(TAppDataChild)
  private
  protected
    function GetTable: TTableMamulRevizyon;
    procedure SetTable(Value: TTableMamulRevizyon);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
    property Table: TTableMamulRevizyon read GetTable write SetTable;
  end;

  TAppRuleMamulRevizyonCustom = class(TAppTableRule)
  private
    FTable: TTableMamulRevizyon;
    FDataChild: TAppDataChildMamulRevizyon;
  protected
    procedure DoOnAllowEditing(Table: TAppCustomTable; Field: TField; var Allow: Boolean); override;
  public
    constructor Create(AOwner: TAppDataChildMamulRevizyon); reintroduce;
  end;

  TAppDataChildMamulRevizyon = class(TAppDataChildCustomMamulRevizyon)
  private
    FRuleCustom: TAppRuleMamulRevizyonCustom;
  protected
    procedure CreateRules; override;
  published
    property RuleCustom: TAppRuleMamulRevizyonCustom read FRuleCustom;
  end;

implementation

uses
  Variants,
  CPMApp_Rule_FieldValidate,
  CPMApp_DAPCustomMamulKart;

{ TAppDataChildCustomMamulRevizyon }

procedure TAppDataChildCustomMamulRevizyon.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildCustomMamulRevizyon.CreateTable;
begin
  Table := TTableMamulRevizyon.Create(DataApp.DataObject);
  Table.Name := 'TableMamulRevizyon';
  Table.TableItems.TableNames := VarArrayOf(['MAMREV']);
  Table.TableItems.TableCaptions := VarArrayOf(['Mamül Revizyon']);
end;

function TAppDataChildCustomMamulRevizyon.GetTable: TTableMamulRevizyon;
begin
  Result := TTableMamulRevizyon(inherited GetTable);
end;

procedure TAppDataChildCustomMamulRevizyon.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
  end;
end;

procedure TAppDataChildCustomMamulRevizyon.SetTable(Value: TTableMamulRevizyon);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomMamulRevizyon.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
  end;
end;

{ TAppDataChildMamulRevizyon }

procedure TAppDataChildMamulRevizyon.CreateRules;
begin
  inherited;
  FRuleCustom := TAppRuleMamulRevizyonCustom.Create(Self);
  Rules.AddRule(FRuleCustom);
end;

{ TAppRuleMamulRevizyonCustom }

constructor TAppRuleMamulRevizyonCustom.Create(AOwner: TAppDataChildMamulRevizyon);
begin
  inherited Create;
  FDataChild := AOwner;
  FTable := AOwner.Table;
  FTable.DataEvents.AddRule(Self);
end;

procedure TAppRuleMamulRevizyonCustom.DoOnAllowEditing(Table: TAppCustomTable;
  Field: TField; var Allow: Boolean);
var
  FDAP: TAppDAPCustomMamulKart;
begin
  inherited;
  FDAP := TAppDAPCustomMamulKart(FDataChild.DataApp);
  if Field = FTable.fRevizyonNo then
  begin
    if FTable.UpdateStatus <> usInserted then
    begin
      Allow := FDAP.MamulKart.Table.IsEmpty and FDAP.MamulRota.Table.IsEmpty;
      if not Allow then
        ShowMessage('Kayýtlý mamül aðacýnda mamül kartý ve/veya mamül rotasý varken revizyon no deðiþtirilemez.');
    end;
  end;
end;

end.
