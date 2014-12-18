unit CPMApp_DataChildUretimRotaKaynakHata;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_Rule_ClientIncrement,
  CPMApp_TableBOMSystem, CPMApp_TableUretimSystem;

type
  TAppDataChildCustomUretimRotaKaynakHata = class;
  TAppDataChildUretimRotaKaynakHata = class;

  TAppDataChildCustomUretimRotaKaynakHata = class(TAppDataChild)
  private
    FTableClone: TTableUretimRotaKaynakHata;
    FTableFindHata: TTableUretimHataKart;
  protected
    function GetTable: TTableUretimRotaKaynakHata;
    procedure SetTable(Value: TTableUretimRotaKaynakHata);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimRotaKaynakHata read GetTable write SetTable;
    property TableClone: TTableUretimRotaKaynakHata read FTableClone;
    property TableFindHata: TTableUretimHataKart read FTableFindHata;
  end;

  TAppRuleUretimRotaKaynakHataFind = class(TAppTableRule)
  private
    FTable: TTableUretimRotaKaynakHata;
    FDataChild: TAppDataChildUretimRotaKaynakHata;
    function FindHata(HataKod: String): Boolean;
  protected
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
  public
    constructor Create(AOwner: TTableUretimRotaKaynakHata); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimRotaKaynakHata); reintroduce; overload;
  end;

  TAppRuleUretimRotaKaynakHataCustom = class(TAppTableRule)
  private
    FTable: TTableUretimRotaKaynakHata;
    FDataChild: TAppDataChildUretimRotaKaynakHata;
  protected
  public
    constructor Create(AOwner: TTableUretimRotaKaynakHata); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimRotaKaynakHata); reintroduce; overload;
  end;

  TAppDataChildUretimRotaKaynakHata = class(TAppDataChildCustomUretimRotaKaynakHata)
  private
    FRuleSiraNo: TAppRuleClientIncrement;
    FRuleCustom: TAppRuleUretimRotaKaynakHataCustom;
    FRuleFind: TAppRuleUretimRotaKaynakHataFind;
  protected
    procedure CreateRules; override;
  published
    property RuleSiraNo: TAppRuleClientIncrement read FRuleSiraNo;
    property RuleFind: TAppRuleUretimRotaKaynakHataFind read FRuleFind;
    property RuleCustom: TAppRuleUretimRotaKaynakHataCustom read FRuleCustom;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_Date, DateUtils, CPMApp_TableItems;

{ TAppDataChildCustomUretimRotaKaynakHata }

constructor TAppDataChildCustomUretimRotaKaynakHata.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimRotaKaynakHata.CreateTable;
begin
  Table := TTableUretimRotaKaynakHata.Create(DataApp.DataObject);
  Table.Name := 'TableUretimRotaKaynakHata';
  Table.TableItems.TableCaptions := 'Üretim Rota Kaynak Hata';

  FTableClone := TTableUretimRotaKaynakHata.Create(nil);
  FTableClone.Name := Table.Name;
  FTableClone.ProviderName := Table.ProviderName;
  FTableClone.Connection := DataApp.DataObject.Connection;
  Table.AddClone(FTableClone);

  FTableFindHata := TTableUretimHataKart.Create(nil);
  FTableFindHata.Name := 'TableFindHataForOperasyon';
  FTableFindHata.ProviderName := 'pr' + FTableFindHata.Name;
  FTableFindHata.Connection := DataApp.Connection;
  FTableFindHata.Connection.CPMAppServer.AddProvider(FTableFindHata.ProviderName);
end;

destructor TAppDataChildCustomUretimRotaKaynakHata.Destroy;
begin
  FreeAndNil(FTableClone);
  FreeAndNil(FTableFindHata);
  inherited;
end;

function TAppDataChildCustomUretimRotaKaynakHata.GetTable: TTableUretimRotaKaynakHata;
begin
  Result := TTableUretimRotaKaynakHata(inherited GetTable);
end;

procedure TAppDataChildCustomUretimRotaKaynakHata.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
  end;
end;

procedure TAppDataChildCustomUretimRotaKaynakHata.SetTable(Value: TTableUretimRotaKaynakHata);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimRotaKaynakHata.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('EVRAKTIP');
    AddNonBlank('EVRAKNO');
    AddNonBlank('SIRANO');
    AddNonBlank('MAMULKOD');
    AddNonBlank('OPERASYONNO');
    AddNonBlank('ISMERKEZKOD');
    AddNonBlank('KAYNAKKOD');
    AddNonBlank('VARDIYAKOD');
    AddNonBlank('OPERATORKOD');
    AddNonBlank('HATAKOD');
    AddNonBlank('MIKTAR');
  end;
end;

{ TAppRuleUretimRotaKaynakHataCustom }

constructor TAppRuleUretimRotaKaynakHataCustom.Create(AOwner: TTableUretimRotaKaynakHata);
begin
  inherited Create;
  FTable := AOwner;
  FTable.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimRotaKaynakHataCustom.Create(AOwner: TAppDataChildUretimRotaKaynakHata);
begin
  Create(AOwner.Table);
  FDataChild := AOwner;
end;

{ TAppDataChildUretimRotaKaynakHata }

procedure TAppDataChildUretimRotaKaynakHata.CreateRules;
begin
  inherited;
  FRuleSiraNo := TAppRuleClientIncrement.Create(Table);
  Rules.AddRule(FRuleSiraNo);
  FRuleSiraNo.FieldName := 'SIRANO';

  FRuleFind := TAppRuleUretimRotaKaynakHataFind.Create(Self);
  Rules.AddRule(FRuleFind);

  FRuleCustom := TAppRuleUretimRotaKaynakHataCustom.Create(Self);
  Rules.AddRule(FRuleCustom);
end;

{ TAppRuleUretimRotaKaynakHataFind }

constructor TAppRuleUretimRotaKaynakHataFind.Create(
  AOwner: TTableUretimRotaKaynakHata);
begin
  inherited Create;
  FTable := AOwner;
  FTable.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimRotaKaynakHataFind.Create(
  AOwner: TAppDataChildUretimRotaKaynakHata);
begin
  Create(AOwner.Table);
  FDataChild := AOwner;
end;

procedure TAppRuleUretimRotaKaynakHataFind.DoOnFieldChanged(
  Table: TAppCustomTable; Field: TField);
begin
  inherited;
  try
    if Field = FTable.fHataKod then
    begin
      if Field.AsString <> '' then
        if FindHata(Field.AsString) then
        begin
        end;
    end
  finally
  end;
end;

function TAppRuleUretimRotaKaynakHataFind.FindHata(
  HataKod: String): Boolean;
begin
  FDataChild.TableFindHata.Close;
  FDataChild.TableFindHata.TableItems.TableNames := 'URTOHK';
  with FDataChild.TableFindHata.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('HATAKOD');
    end;
    with Where do
    begin
      Clear;
      Add('HATAKOD', wcEqual, HataKod).DataType := ftString;
    end;
  end;

  FDataChild.TableFindHata.Open;
  Result := FDataChild.TableFindHata.RecordCount > 0;
end;

end.
