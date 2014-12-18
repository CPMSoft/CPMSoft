unit CPMApp_DataChildUretimKaynakMakine;

interface

uses
  DB, Variants,
  CPMApp_DataObject,
  CPMApp_DataApp,
  CPMApp_TableBOMSystem,
  CPMApp_Rule_Increment;


type
  TAppDataChildCustomUretimKaynakMakine = class;
  TAppDataChildUretimKaynakMakine = class;

  TAppDataChildCustomUretimKaynakMakine = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimKaynakMakine;
    procedure SetTable(Value: TTableUretimKaynakMakine);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimKaynakMakine read GetTable write SetTable;
  end;

  TAppRuleIncrementBakimNo = class(TAppRuleIncrement)
  private
    FTableUretimKaynakMakine: TTableUretimKaynakMakine;
    FDataChildUretimKaynakMakine: TAppDataChildUretimKaynakMakine;
  protected
    procedure DoBeforePost(Table: TAppCustomTable); override;
    procedure DoAfterPost(Table: TAppCustomTable); override;

  public
    constructor Create(AOwner: TTableUretimKaynakMakine); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimKaynakMakine); reintroduce; overload;
  published
  end;

  TAppDataChildUretimKaynakMakine = class(TAppDataChildCustomUretimKaynakMakine)
  private
    FRuleIncrementBakimNo: TAppRuleIncrementBakimNo;
  protected
    procedure CreateRules; override;
  published
    property RuleIncrementBakimNo: TAppRuleIncrementBakimNo read FRuleIncrementBakimNo;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_Security;

{ TAppDataChildCustomUretimKaynakMakine }

constructor TAppDataChildCustomUretimKaynakMakine.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimKaynakMakine.CreateTable;
begin
  Table := TTableUretimKaynakMakine.Create(DataApp.DataObject);
  Table.Name := 'TableUretimKaynakMakine';
  Table.ProviderName := 'prURTKMA';
  Table.TableItems.TableNames := VarArrayOf(['URTKMA', 'STKKRT']);
  Table.TableItems.TableCaptions := VarArrayOf(['Üretim Kaynak Makine', 'Stok Kart']);
  Table.IndexFieldNames := 'SIRKETNO;KAYNAKKOD';

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
      Add('SIRKETNO', 'SIRKETNO');
      Add('MALKOD', 'MALKOD');
    end;

  end;
  Table.LookupTableItems.Add(Table.TableItems[1]);
end;

destructor TAppDataChildCustomUretimKaynakMakine.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimKaynakMakine.GetTable: TTableUretimKaynakMakine;
begin
  Result := TTableUretimKaynakMakine(inherited GetTable);
end;

procedure TAppDataChildCustomUretimKaynakMakine.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
    Add('VERIMLILIK', 100);
  end;
end;

procedure TAppDataChildCustomUretimKaynakMakine.SetTable(Value: TTableUretimKaynakMakine);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimKaynakMakine.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('MALKOD');
    AddNonBlank('BASTARIH');
    AddNonBlank('BITTARIH');
    AddNonBlank('VERIMLILIK');
  end;
end;

{ TAppDataChildUretimKaynakMakine }

procedure TAppDataChildUretimKaynakMakine.CreateRules;
begin
  inherited;
  FRuleIncrementBakimNo := TAppRuleIncrementBakimNo.Create(Self);
  Rules.AddRule(FRuleIncrementBakimNo);
end;

{ TAppRuleBakimNoIncrement }

constructor TAppRuleIncrementBakimNo.Create(
  AOwner: TTableUretimKaynakMakine);
begin
  inherited Create(AOwner);
  FTableUretimKaynakMakine := AOwner;
  FieldName := 'SIRKETNO;KAYNAKKOD';
end;

constructor TAppRuleIncrementBakimNo.Create(
  AOwner: TAppDataChildUretimKaynakMakine);
begin
  Create(AOwner.Table);
  FDataChildUretimKaynakMakine := AOwner;
end;

procedure TAppRuleIncrementBakimNo.DoAfterPost(Table: TAppCustomTable);
begin
  inherited;
end;

procedure TAppRuleIncrementBakimNo.DoBeforePost(Table: TAppCustomTable);
begin
  inherited;
  if not Table.IsEmpty then
    if Table.State in [dsInsert] then
      Table.FieldValues['SIRKETNO'] := AppSecurity.CompanyNo;
end;

end.
