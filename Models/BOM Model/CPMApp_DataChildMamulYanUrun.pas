unit CPMApp_DataChildMamulYanUrun;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem;

type
  TAppDataChildCustomMamulYanUrun = class;
  TAppDataChildMamulYanUrun = class;

  TAppDataChildCustomMamulYanUrun = class(TAppDataChild)
  private
  protected
    function GetTable: TTableMamulYanUrun;
    procedure SetTable(Value: TTableMamulYanUrun);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableMamulYanUrun read GetTable write SetTable;
  end;

  TAppRuleMamulYanUrunCustom = class(TAppTableRule)
  private
    InUse: Boolean;
    FTable: TTableMamulYanUrun;
    FDataChild: TAppDataChildMamulYanUrun;
  protected
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
  public
    constructor Create(AOwner: TTableMamulYanUrun); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildMamulYanUrun); reintroduce; overload;
  end;

  TAppDataChildMamulYanUrun = class(TAppDataChildCustomMamulYanUrun)
  private
    FRuleCustom: TAppRuleMamulYanUrunCustom;
  protected
    procedure CreateTable; override;
    procedure CreateRules; override;
  public
  published
    property RuleCustom: TAppRuleMamulYanUrunCustom read FRuleCustom;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_DAPCustomMamulKart;

{ TAppDataChildCustomMamulYanUrun }

constructor TAppDataChildCustomMamulYanUrun.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomMamulYanUrun.CreateTable;
begin
  Table := TTableMamulYanUrun.Create(DataApp.DataObject);
  Table.Name := 'TableMamulYanUrun';
  Table.TableItems.TableNames := 'MAMYAN';
end;

destructor TAppDataChildCustomMamulYanUrun.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomMamulYanUrun.GetTable: TTableMamulYanUrun;
begin
  Result := TTableMamulYanUrun(inherited GetTable);
end;

procedure TAppDataChildCustomMamulYanUrun.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
  end;
end;

procedure TAppDataChildCustomMamulYanUrun.SetTable(Value: TTableMamulYanUrun);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomMamulYanUrun.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('RECETENO');
    AddNonBlank('MALKOD');
  end;
end;

{ TAppDataChildMamulYanUrun }

procedure TAppDataChildMamulYanUrun.CreateRules;
begin
  inherited;
  FRuleCustom := TAppRuleMamulYanUrunCustom.Create(Self);
  Rules.AddRule(FRuleCustom);
end;

procedure TAppDataChildMamulYanUrun.CreateTable;
begin
  inherited;
  Table.TableItems.TableNames := VarArrayOf(['MAMYAN', 'STKKRT']);
  Table.TableItems.TableCaptions := VarArrayOf(['Yan Ürün', 'Stok Kartý']);
  Table.TableItems.TableItemCaptions := VarArrayOf(['Yan Ürün', '!']);
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
      Add('MALKOD', 'MALKOD');
    end;
  end;
  Table.LookupTableItems.Add(Table.TableItems[1]);
end;

{ TAppRuleMamulYanUrunCustom }

constructor TAppRuleMamulYanUrunCustom.Create(AOwner: TTableMamulYanUrun);
begin
  inherited Create;
  FTable := AOwner;
  FTable.DataEvents.AddRule(Self);
end;

constructor TAppRuleMamulYanUrunCustom.Create(
  AOwner: TAppDataChildMamulYanUrun);
begin
  Create(AOwner.Table);
  FDataChild := AOwner;
end;

procedure TAppRuleMamulYanUrunCustom.DoOnFieldChanged(Table: TAppCustomTable;
  Field: TField);
var
  DAP: TAppDAPCustomMamulKart;
begin
  inherited;
  if InUse then
    exit;
  InUse := True;
  try
    if Field = FTable.fMalKod then
    begin
      // Birim alanýnýn çekilmesi iþlemi geçici olarak Mamül Stok Kartýndan yapýldý.
      // Aslýnda alan aktarým iþlemi geliþtirilmeli ve koddan da alan aktarým tanýmlanabilmeli.
      DAP := TAppDAPCustomMamulKart(FDataChild.DataApp);
      DAP.MamulStokKart.Open(Field.AsString);
      if DAP.MamulStokKart.Table.MalKod = FTable.MalKod then
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
