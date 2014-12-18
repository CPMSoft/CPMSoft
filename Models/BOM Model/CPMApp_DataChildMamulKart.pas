unit CPMApp_DataChildMamulKart;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_ClientIncrement;

type
  TAppDataChildCustomMamulKart = class;
  TAppDataChildMamulKart = class;

  TAppDataChildCustomMamulKart = class(TAppDataChild)
  private
  protected
    function GetTable: TTableMamulKart;
    procedure SetTable(Value: TTableMamulKart);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableMamulKart read GetTable write SetTable;
  end;

  TAppRuleMamulKartCustom = class(TAppTableRule)
  private
    InUse: Boolean;
    FTable: TTableMamulKart;
    FDataChild: TAppDataChildMamulKart;
  protected
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoOnAllowEditing(Table: TAppCustomTable; Field: TField; var Allow: Boolean); override;
  public
    constructor Create(AOwner: TTableMamulKart); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildMamulKart); reintroduce; overload;
  end;

  TAppDataChildMamulKart = class(TAppDataChildCustomMamulKart)
  private
    FRuleCustom: TAppRuleMamulKartCustom;
    FRuleSiraNo: TAppRuleClientIncrement;
  protected
    procedure CreateTable; override;
    procedure CreateRules; override;
  public
    procedure UpdateCodes;
  published
    property RuleCustom: TAppRuleMamulKartCustom read FRuleCustom;
    property RuleSiraNo: TAppRuleClientIncrement read FRuleSiraNo;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_DAPCustomMamulKart,
  CPMApp_TableStokSystem, CPMApp_Date;

{ TAppDataChildCustomMamulKart }

constructor TAppDataChildCustomMamulKart.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomMamulKart.CreateTable;
begin
  Table := TTableMamulKart.Create(DataApp.DataObject);
  Table.Name := 'TableMamulKart';
  Table.TableItems.TableNames := 'MAMKRT';
end;

destructor TAppDataChildCustomMamulKart.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomMamulKart.GetTable: TTableMamulKart;
begin
  Result := TTableMamulKart(inherited GetTable);
end;

procedure TAppDataChildCustomMamulKart.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
  end;
end;

procedure TAppDataChildCustomMamulKart.SetTable(Value: TTableMamulKart);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomMamulKart.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('RECETENO');
    AddNonBlank('HAMMADDEKOD');
  end;
end;

{ TAppRuleMamulKartCustom }

constructor TAppRuleMamulKartCustom.Create(AOwner: TTableMamulKart);
begin
  inherited Create;
  FTable := AOwner;
  FTable.DataEvents.AddRule(Self);
end;

constructor TAppRuleMamulKartCustom.Create(AOwner: TAppDataChildMamulKart);
begin
  Create(AOwner.Table);
  FDataChild := AOwner;
end;

procedure TAppRuleMamulKartCustom.DoOnAllowEditing(Table: TAppCustomTable;
  Field: TField; var Allow: Boolean);
var
  FDAP: TAppDAPCustomMamulKart;
begin
  inherited;
  FDAP := TAppDAPCustomMamulKart(FDataChild.DataApp);
  if Field = FTable.fKodUretim then
    Allow := FDAP.MamulBaslik.Table.KodUretim = 2
  else if Field = FTable.fKodDizayn then
    Allow := FDAP.MamulBaslik.Table.KodDizayn = 2
  else if Field = FTable.fKodBakim then
    Allow := FDAP.MamulBaslik.Table.KodBakim = 2
  else if Field = FTable.fKodYedekParca then
    Allow := FDAP.MamulBaslik.Table.KodYedekParca = 2
  else if Field = FTable.fKodMaliyet then
    Allow := FDAP.MamulBaslik.Table.KodMaliyet = 2
  else if Field = FTable.fKodSatis then
    Allow := FDAP.MamulBaslik.Table.KodSatis = 2;
end;

procedure TAppRuleMamulKartCustom.DoOnFieldChanged(Table: TAppCustomTable;
  Field: TField);
var
  FDAP: TAppDAPCustomMamulKart;
begin
  inherited;
  if InUse then
    exit;
  InUse := True;
  try
    if Field = FTable.fHammaddeKod then
    begin
      FDAP := TAppDAPCustomMamulKart(FDataChild.DataApp);
      FDAP.HammaddeStokKart.Add(Field.AsString);
      if FDAP.HammaddeStokKart.Table.MalKod = FTable.HammaddeKod then
        FTable.HammaddeBirim := FDAP.HammaddeStokKart.Table.Birim;
    end;
  finally
    InUse := False;
  end;
end;

procedure TAppRuleMamulKartCustom.DoOnNewRecord(Table: TAppCustomTable);
begin
  inherited;
  FDataChild.UpdateCodes;
end;

{ TAppDataChildMamulKart }

procedure TAppDataChildMamulKart.CreateRules;
begin
  inherited;
  FRuleSiraNo := TAppRuleClientIncrement.Create(Table, True);
  FRuleSiraNo.FieldName := 'SIRANO';
  Rules.AddRule(FRuleSiraNo);

  FRuleCustom := TAppRuleMamulKartCustom.Create(Self);
  Rules.AddRule(FRuleCustom);
end;

procedure TAppDataChildMamulKart.CreateTable;
begin
  inherited;
  Table.DefaultValue.InitFieldOnNewRecord := True;
  Table.TableItems.TableNames := VarArrayOf(['MAMKRT', 'STKKRT']);
  Table.TableItems.TableCaptions := VarArrayOf(['Mamül Kart', 'Hammadde Stok Kartý']);
  Table.TableItems.TableItemCaptions := VarArrayOf(['Mamül Kartý', '!']);
  with Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
    end;
  end;
  with Table.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALAD');
    end;
    with Join do
    begin
      Clear;
      Add('MALKOD', 'HAMMADDEKOD');
    end;
  end;
  Table.LookupTableItems.Add(Table.TableItems[1]);
end;

procedure TAppDataChildMamulKart.UpdateCodes;
var
  FDAP: TAppDAPCustomMamulKart;
begin
  FDAP := TAppDAPCustomMamulKart(DataApp);
  if FDAP.MamulBaslik.Table.KodUretim = 1 then
    Table.KodUretim := 1
  else
    Table.KodUretim := 0;
  if FDAP.MamulBaslik.Table.KodDizayn = 1 then
    Table.KodDizayn := 1
  else
    Table.KodDizayn := 0;
  if FDAP.MamulBaslik.Table.KodBakim = 1 then
    Table.KodBakim := 1
  else
    Table.KodBakim := 0;
  if FDAP.MamulBaslik.Table.KodYedekParca = 1 then
    Table.KodYedekParca := 1
  else
    Table.KodYedekParca := 0;
  if FDAP.MamulBaslik.Table.KodMaliyet = 1 then
    Table.KodMaliyet := 1
  else
    Table.KodMaliyet := 0;
  if FDAP.MamulBaslik.Table.KodSatis = 1 then
    Table.KodSatis := 1
  else
    Table.KodSatis := 0;
end;

end.
