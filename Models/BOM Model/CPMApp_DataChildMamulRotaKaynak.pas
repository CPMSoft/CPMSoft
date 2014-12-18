unit CPMApp_DataChildMamulRotaKaynak;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_TableItems, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomMamulRotaKaynak = class;
  TAppDataChildMamulRotaKaynak = class;

  TAppDataChildCustomMamulRotaKaynak = class(TAppDataChild)
  private
  protected
    function GetTable: TTableMamulRotaKaynak;
    procedure SetTable(Value: TTableMamulRotaKaynak);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableMamulRotaKaynak read GetTable write SetTable;
  end;

  TAppRuleMamulRotaKaynakCustom = class(TAppTableRule)
  private
    FTableMamulRotaKaynak: TTableMamulRotaKaynak;
    FTableFindIsMerkezKaynak: TTableIsMerkezKaynak;
    FDataChildMamulRotaKaynak: TAppDataChildMamulRotaKaynak;
    function FindKaynak(pKaynakKod, pIsMerkezKod: string): Boolean;
  protected
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
  public
    constructor Create(AOwner: TTableMamulRotaKaynak); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildMamulRotaKaynak); reintroduce; overload;
    destructor Destroy; override;
  end;

  TAppDataChildMamulRotaKaynak = class(TAppDataChildCustomMamulRotaKaynak)
  private
    FRuleCustom: TAppRuleMamulRotaKaynakCustom;
  protected
    procedure CreateTable; override;
    procedure CreateRules; override;
  published
    property RuleCustom: TAppRuleMamulRotaKaynakCustom read FRuleCustom;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_DAPCustomMamulKart, CPMApp_Dialogs;

{ TAppDataChildCustomMamulRotaKaynak }

constructor TAppDataChildCustomMamulRotaKaynak.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomMamulRotaKaynak.CreateTable;
begin
  Table := TTableMamulRotaKaynak.Create(DataApp.DataObject);
  Table.Name := 'TableMamulRotaKaynak';
  Table.TableItems.TableNames := 'MAMKYN';
end;

destructor TAppDataChildCustomMamulRotaKaynak.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomMamulRotaKaynak.GetTable: TTableMamulRotaKaynak;
begin
  Result := TTableMamulRotaKaynak(inherited GetTable);
end;

procedure TAppDataChildCustomMamulRotaKaynak.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
    Add('KULLANIMTIP', 1);
  end;
end;

procedure TAppDataChildCustomMamulRotaKaynak.SetTable(Value: TTableMamulRotaKaynak);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomMamulRotaKaynak.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('KAYNAKKOD');
  end;
end;

{ TAppRuleMamulRotaKaynakCustom }

constructor TAppRuleMamulRotaKaynakCustom.Create(AOwner: TTableMamulRotaKaynak);
begin
  inherited Create;
  FTableMamulRotaKaynak := AOwner;
  FTableMamulRotaKaynak.DataEvents.AddRule(Self);

  FTableFindIsMerkezKaynak := TTableIsMerkezKaynak.Create(nil);
  FTableFindIsMerkezKaynak.Name := 'TableFindIsMerkezKaynak';
  FTableFindIsMerkezKaynak.ProviderName := 'pr' + FTableFindIsMerkezKaynak.Name;
  FTableFindIsMerkezKaynak.Connection := FTableMamulRotaKaynak.Connection;
end;

constructor TAppRuleMamulRotaKaynakCustom.Create(AOwner: TAppDataChildMamulRotaKaynak);
begin
  Create(AOwner.Table);
  FDataChildMamulRotaKaynak := AOwner;
end;

destructor TAppRuleMamulRotaKaynakCustom.Destroy;
begin
  FreeAndNil(FTableFindIsMerkezKaynak);
  inherited;
end;

procedure TAppRuleMamulRotaKaynakCustom.DoOnFieldChanged(Table: TAppCustomTable;
  Field: TField);
begin
  inherited;
  if Field = FTableMamulRotaKaynak.fKaynakKod then
  begin
    if Field.AsString <> '' then
    begin
      if FindKaynak(FTableMamulRotaKaynak.KaynakKod, FTableMamulRotaKaynak.IsMerkezKod) then
      begin
        FTableMamulRotaKaynak.KullanimSiraNo := FTableFindIsMerkezKaynak.KullanimSiraNo;
        //FTableMamulRotaKaynak.KuyrukSure := TableFindIsMerkezKaynak.KuyrukSure;
        //FTableMamulRotaKaynak.KurulumSure := TableFindIsMerkezKaynak.KurulumSure;
        //FTableMamulRotaKaynak.CalismaSure := TableFindIsMerkezKaynak.CalismaSure;
        //FTableMamulRotaKaynak.SokumSure := TableFindIsMerkezKaynak.SokumSure;
        //FTableMamulRotaKaynak.BeklemeSure := TableFindIsMerkezKaynak.BeklemeSure;
        //FTableMamulRotaKaynak.TasimaSure := TableFindIsMerkezKaynak.TasimaSure;
        //FTableMamulRotaKaynak.OnUretimMiktar := TableFindIsMerkezKaynak.OnUretimMiktar;
      end
      else
      begin
        AppShowMessage(format('%s nolu iþ merkezinde %s nolu kaynak kodu bulunamadý.', [FTableMamulRotaKaynak.KaynakKod, FTableMamulRotaKaynak.IsMerkezKod]));
        Field.AsString := '';
      end;
    end;
  end; // if Field = FTableMamulRotaKaynak.fKaynakKod then
end;

function TAppRuleMamulRotaKaynakCustom.FindKaynak(pKaynakKod, pIsMerkezKod: string): Boolean;
begin
  FTableFindIsMerkezKaynak.Close;
  FTableFindIsMerkezKaynak.TableItems.TableNames := VarArrayOf(['URTISK', 'URTKYN']);
  with FTableFindIsMerkezKaynak.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
    end;
    with Where do
    begin
      Clear;
      Add('KAYNAKKOD', wcEqual, pKaynakKod).DataType := ftString;
      AddOperator(woAnd);
      Add('ISMERKEZKOD', wcEqual, pIsMerkezKod).DataType := ftString;
    end;
  end;
  with FTableFindIsMerkezKaynak.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('KUYRUKSURE');
      Add('KURULUMSURE');
      Add('CALISMASURE');
      Add('SOKUMSURE');
      Add('BEKLEMESURE');
      Add('TASIMASURE');
      Add('ONURETIMMIKTAR');
    end;
    with Join do
    begin
      Clear;
      Add('KAYNAKKOD', 'KAYNAKKOD');
    end;
  end;

  FTableFindIsMerkezKaynak.Open;
  Result := FTableFindIsMerkezKaynak.RecordCount > 0;
end;

{ TAppDataChildMamulRotaKaynak }

procedure TAppDataChildMamulRotaKaynak.CreateRules;
begin
  inherited;
  FRuleCustom := TAppRuleMamulRotaKaynakCustom.Create(Self);
  Rules.AddRule(FRuleCustom);
end;


procedure TAppDataChildMamulRotaKaynak.CreateTable;
begin
  inherited;
  Table.TableItems.TableNames := VarArrayOf(['MAMKYN', 'URTKYN']);
  Table.TableItems.TableCaptions := VarArrayOf(['Mamül Rota Kaynak', 'Kaynak Kart']);
  Table.TableItems.TableItemCaptions := VarArrayOf(['Mamül Rota Kaynak', '!']);
  with Table.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('KAYNAKAD');
    end;
    with Join do
    begin
      Clear;
      Add('KAYNAKKOD', 'KAYNAKKOD');
    end;
  end;
  Table.LookupTableItems.Add(Table.TableItems[1]);
end;

end.
