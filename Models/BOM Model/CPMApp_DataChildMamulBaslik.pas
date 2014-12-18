unit CPMApp_DataChildMamulBaslik;

interface

uses
  DB,
  CPMApp_LookupTableItems,
  CPMApp_Rule_Increment,
  CPMApp_DataObject,
  CPMApp_DataApp,
  CPMApp_TableBOMSystem;

type
  TAppDataChildMamulBaslik = class;

  TAppDataChildCustomMamulBaslik = class(TAppDataChild)
  private
  protected
    function GetTable: TTableMamulBaslik;
    procedure SetTable(Value: TTableMamulBaslik);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableMamulBaslik read GetTable write SetTable;
  end;

  TAppRuleMamulBaslikCustom = class(TAppTableRule)
  private
    FDataChild: TAppDataChildMamulBaslik;
    FTable: TTableMamulBaslik;
    InUse: Boolean;
  protected
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
  public
    constructor Create(AOwner: TAppDataChildMamulBaslik); reintroduce;
  end;

  TAppDataChildMamulBaslik = class(TAppDataChildCustomMamulBaslik)
    procedure LookupMAMKUKAfterFetch(Sender: TAppLookupTableItem);
  private
    FRuleCustom: TAppRuleMamulBaslikCustom;
    FRuleIncReceteNo: TAppRuleIncrement;
  protected
    procedure CreateTable; override;
    procedure CreateRules; override;
  published
    property RuleCustom: TAppRuleMamulBaslikCustom read FRuleCustom;
    property RuleIncReceteNo: TAppRuleIncrement read FRuleIncReceteNo;
  end;

implementation

uses
  Variants,
  CPMApp_Rule_FieldValidate,
  CPMApp_Rule_FieldDefaultValue,
  CPMApp_DAPCustomMamulKart;

{ TAppDataChildCustomMamulBaslik }

constructor TAppDataChildCustomMamulBaslik.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomMamulBaslik.CreateTable;
begin
  Table := TTableMamulBaslik.Create(DataApp.DataObject);
  Table.Name := 'TableMamulBaslik';
  Table.TableItems.TableNames := 'MAMBAS';
end;

destructor TAppDataChildCustomMamulBaslik.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomMamulBaslik.GetTable: TTableMamulBaslik;
begin
  Result := TTableMamulBaslik(inherited GetTable);
end;

procedure TAppDataChildCustomMamulBaslik.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
    Add('KULLANIMKOD', 'URETM');
  end;
end;

procedure TAppDataChildCustomMamulBaslik.SetTable(Value: TTableMamulBaslik);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomMamulBaslik.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('RECETENO');
    AddNonBlank('MAMULKOD');
    AddNonBlank('MAMULDEPOKOD');
    AddNonBlank('HAMMADDEDEPOKOD');
    AddNonBlank('KULLANIMKOD');
  end;
end;

{ TAppDataChildMamulBaslik }

procedure TAppDataChildMamulBaslik.CreateRules;
begin
  inherited;

  FRuleIncReceteNo := TAppRuleIncrement.Create(Table);
  FRuleIncReceteNo.AppName := DataApp.AppName;
  FRuleIncReceteNo.FieldName := 'RECETENO';
  Rules.AddRule(FRuleIncReceteNo);

  FRuleCustom := TAppRuleMamulBaslikCustom.Create(Self);
  Rules.AddRule(FRuleCustom);
end;

procedure TAppDataChildMamulBaslik.CreateTable;
begin
  inherited;
  Table.DefaultValue.InitFieldOnNewRecord := True;
  Table.TableItems.TableNames := VarArrayOf(['MAMBAS', 'STKKRT', 'MAMKUK']);
  Table.TableItems.TableCaptions := VarArrayOf(['Mamül Baþlýk', 'Stok Kart', 'Mamül Kullaným Kart']);
  Table.TableItems.TableItemCaptions := VarArrayOf(['Mamül Baþlýk', '!', '!']);
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
      Add('MALKOD', 'MAMULKOD');
    end;
  end;
  with Table.TableItems[2] do // MAMKUK geçiþ sýrasýnda null geleceðinden böyle yapýldý
  begin
    with Fields do
    begin
      Clear;
      Add('KODURETIM');
      Add('KODDIZAYN');
      Add('KODBAKIM');
      Add('KODYEDEKPARCA');
      Add('KODMALIYET');
      Add('KODSATIS');
    end;
    with Join do
    begin
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('KULLANIMKOD', 'KULLANIMKOD');
    end;
  end;

  Table.LookupTableItems.Add(Table.TableItems[1]);
  with Table.LookupTableItems.Add(Table.TableItems[2]) do
  begin
    MainFieldName := 'KULLANIMKOD';
    AfterFetch := LookupMAMKUKAfterFetch;
  end;
end;

procedure TAppDataChildMamulBaslik.LookupMAMKUKAfterFetch(Sender: TAppLookupTableItem);
var
  DAP: TAppDAPCustomMamulKart;
  ABookmark: TAppBookmark;
begin
  if Table.fKullanimKod.IsNull then
    Exit;
  DAP := TAppDAPCustomMamulKart(DataApp);
  if DAP.MamulKart.Table.IsEmpty then
    Exit;
  ABookmark := DAP.MamulKart.Table.GetBookmark;
  try
    DAP.MamulKart.Table.First;
    while not DAP.MamulKart.Table.Eof do
    begin
      DAP.MamulKart.Table.Edit;
      DAP.MamulKart.UpdateCodes;
      DAP.MamulKart.Table.Post;
      DAP.MamulKart.Table.Next;
    end;
    DAP.MamulKart.Table.GotoBookmark(ABookmark);
  finally
    DAP.MamulKart.Table.FreeBookmark(ABookmark);
  end;
end;

{ TAppRuleMamulBaslikCustom }

constructor TAppRuleMamulBaslikCustom.Create(AOwner: TAppDataChildMamulBaslik);
begin
  inherited Create;
  FDataChild := AOwner;
  FTable := AOwner.Table;
  FTable.DataEvents.AddRule(Self);
end;

procedure TAppRuleMamulBaslikCustom.DoOnFieldChanged(Table: TAppCustomTable;
  Field: TField);
var
  DAP: TAppDAPCustomMamulKart;
begin
  inherited;
  if InUse then
    exit;
  InUse := True;
  try
    if Field = FTable.fMamulKod then
    begin
      DAP := TAppDAPCustomMamulKart(FDataChild.DataApp);
      DAP.MamulStokKart.Open(Field.AsString);
      if DAP.MamulStokKart.Table.MalKod = FTable.MamulKod then
      begin
        if FTable.State in dsEditModes then
          FTable.Birim := DAP.MamulStokKart.Table.Birim;
      end;
    end;
  finally
    InUse := False;
  end;
end;

end.

