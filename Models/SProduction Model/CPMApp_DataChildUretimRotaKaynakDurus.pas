unit CPMApp_DataChildUretimRotaKaynakDurus;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_Rule_ClientIncrement,
  CPMApp_TableBOMSystem, CPMApp_TableUretimSystem;

type
  TAppDataChildCustomUretimRotaKaynakDurus = class;
  TAppDataChildUretimRotaKaynakDurus = class;

  TAppDataChildCustomUretimRotaKaynakDurus = class(TAppDataChild)
  private
    FTableClone: TTableUretimRotaKaynakDurus;
    FTableFindDurus: TTableUretimDurusKart;
  protected
    function GetTable: TTableUretimRotaKaynakDurus;
    procedure SetTable(Value: TTableUretimRotaKaynakDurus);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimRotaKaynakDurus read GetTable write SetTable;
    property TableClone: TTableUretimRotaKaynakDurus read FTableClone;
    property TableFindDurus: TTableUretimDurusKart read FTableFindDurus;
  end;

  TAppRuleUretimRotaKaynakDurusFind = class(TAppTableRule)
  private
    FTable: TTableUretimRotaKaynakDurus;
    FDataChild: TAppDataChildUretimRotaKaynakDurus;
    function FindDurus(DurusKod: String): Boolean;
  protected
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
  public
    constructor Create(AOwner: TTableUretimRotaKaynakDurus); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimRotaKaynakDurus); reintroduce; overload;
  end;

  TAppRuleUretimRotaKaynakDurusCustom = class(TAppTableRule)
  private
    FInUse: Boolean;
    FTable: TTableUretimRotaKaynakDurus;
    FDataChild: TAppDataChildUretimRotaKaynakDurus;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
  public
    constructor Create(AOwner: TTableUretimRotaKaynakDurus); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimRotaKaynakDurus); reintroduce; overload;
  end;

  TAppDataChildUretimRotaKaynakDurus = class(TAppDataChildCustomUretimRotaKaynakDurus)
  private
    FRuleSiraNo: TAppRuleClientIncrement;
    FRuleCustom: TAppRuleUretimRotaKaynakDurusCustom;
    FRuleFind: TAppRuleUretimRotaKaynakDurusFind;
  protected
    procedure CreateRules; override;
  published
    property RuleSiraNo: TAppRuleClientIncrement read FRuleSiraNo;
    property RuleFind: TAppRuleUretimRotaKaynakDurusFind read FRuleFind;
    property RuleCustom: TAppRuleUretimRotaKaynakDurusCustom read FRuleCustom;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_Date, DateUtils, CPMApp_TableItems;

{ TAppDataChildCustomUretimRotaKaynakDurus }

constructor TAppDataChildCustomUretimRotaKaynakDurus.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimRotaKaynakDurus.CreateTable;
begin
  Table := TTableUretimRotaKaynakDurus.Create(DataApp.DataObject);
  Table.Name := 'TableUretimRotaKaynakDurus';
  Table.TableItems.TableCaptions := 'Üretim Rota Kaynak Duruþ';

  FTableClone := TTableUretimRotaKaynakDurus.Create(nil);
  FTableClone.Name := Table.Name;
  FTableClone.ProviderName := Table.ProviderName;
  FTableClone.Connection := DataApp.DataObject.Connection;
  Table.AddClone(FTableClone);

  FTableFindDurus := TTableUretimDurusKart.Create(nil);
  FTableFindDurus.Name := 'TableFindDurusForOperasyon';
  FTableFindDurus.ProviderName := 'pr' + FTableFindDurus.Name;
  FTableFindDurus.Connection := DataApp.Connection;
  FTableFindDurus.Connection.CPMAppServer.AddProvider(FTableFindDurus.ProviderName);
end;

destructor TAppDataChildCustomUretimRotaKaynakDurus.Destroy;
begin
  FreeAndNil(FTableClone);
  FreeAndNil(FTableFindDurus);
  inherited;
end;

function TAppDataChildCustomUretimRotaKaynakDurus.GetTable: TTableUretimRotaKaynakDurus;
begin
  Result := TTableUretimRotaKaynakDurus(inherited GetTable);
end;

procedure TAppDataChildCustomUretimRotaKaynakDurus.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
    Add('BASTARIH', Date);
    Add('BASTARIHSAAT', Date);
    Add('BITTARIH', Date);
    Add('BITTARIHSAAT', Date);
  end;
end;

procedure TAppDataChildCustomUretimRotaKaynakDurus.SetTable(Value: TTableUretimRotaKaynakDurus);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimRotaKaynakDurus.SetValidates;
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
    AddNonBlank('ISLEMKOD');
    AddNonBlank('ADET');
  end;
end;

{ TAppRuleUretimRotaKaynakDurusCustom }

constructor TAppRuleUretimRotaKaynakDurusCustom.Create(AOwner: TTableUretimRotaKaynakDurus);
begin
  inherited Create;
  FTable := AOwner;
  FTable.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimRotaKaynakDurusCustom.Create(AOwner: TAppDataChildUretimRotaKaynakDurus);
begin
  Create(AOwner.Table);
  FDataChild := AOwner;
end;

procedure TAppRuleUretimRotaKaynakDurusCustom.DoOnFieldChanged(
  Table: TAppCustomTable; Field: TField);
  procedure UpdateBitTarihSaat;
  begin
    FTable.BitTarihSaat := IncMinute(FTable.BasTarihSaat, Trunc(FTable.Sure));
    FTable.BitTarih := DateOf(FTable.BitTarihSaat);
  end;
  procedure UpdateSureByAdet;
  begin
    FTable.Sure := FTable.Adet * FTable.BirimSure;
    UpdateBitTarihSaat;
  end;
  procedure UpdateBirimSure;
  begin
    if FTable.Adet = 0 then
      FTable.Adet := 1;
    FTable.BirimSure := FTable.Sure / FTable.Adet;
  end;
  procedure UpdateSure;
  begin
    FTable.Sure := MinutesBetween(FTable.BasTarihSaat, FTable.BitTarihSaat);
    UpdateBirimSure;
  end;
begin
  inherited;
  if FInUse then
    exit;
  FInUse := True;
  try
    if Field = FTable.fBasTarih then
    begin
      FTable.BasTarihSaat := DateOf(FTable.BasTarih) + TimeOf(FTable.BasTarihSaat);
      UpdateBitTarihSaat;
    end
    else if Field = FTable.fBasTarihSaat then
    begin
      FTable.BasTarih := DateOf(FTable.BasTarihSaat);
      UpdateBitTarihSaat;
    end
    else if Field = FTable.fBitTarih then
    begin
      FTable.BitTarihSaat := DateOf(FTable.BitTarih) + TimeOf(FTable.BitTarihSaat);
      UpdateSure;
    end
    else if Field = FTable.fBitTarihSaat then
    begin
      FTable.BitTarih := DateOf(FTable.BitTarihSaat);
      UpdateSure;
    end
    else if Field = FTable.fSure then
    begin
      UpdateBitTarihSaat;
      UpdateBirimSure;
    end
    else if Field = FTable.fAdet then
    begin
      UpdateSureByAdet;
    end
    else if Field = FTable.fBirimSure then
    begin
      UpdateSureByAdet;
    end;
  finally
    FInUse := False;
  end;
end;

procedure TAppRuleUretimRotaKaynakDurusCustom.DoOnNewRecord(
  Table: TAppCustomTable);
begin
  inherited;
  FTable.Adet := 1;
end;

{ TAppDataChildUretimRotaKaynakDurus }

procedure TAppDataChildUretimRotaKaynakDurus.CreateRules;
begin
  inherited;
  FRuleSiraNo := TAppRuleClientIncrement.Create(Table);
  Rules.AddRule(FRuleSiraNo);
  FRuleSiraNo.FieldName := 'SIRANO';

  FRuleFind := TAppRuleUretimRotaKaynakDurusFind.Create(Self);
  Rules.AddRule(FRuleFind);

  FRuleCustom := TAppRuleUretimRotaKaynakDurusCustom.Create(Self);
  Rules.AddRule(FRuleCustom);
end;

{ TAppRuleUretimRotaKaynakDurusFind }

constructor TAppRuleUretimRotaKaynakDurusFind.Create(
  AOwner: TTableUretimRotaKaynakDurus);
begin
  inherited Create;
  FTable := AOwner;
  FTable.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimRotaKaynakDurusFind.Create(
  AOwner: TAppDataChildUretimRotaKaynakDurus);
begin
  Create(AOwner.Table);
  FDataChild := AOwner;
end;

procedure TAppRuleUretimRotaKaynakDurusFind.DoOnFieldChanged(
  Table: TAppCustomTable; Field: TField);
begin
  inherited;
  try
    if Field = FTable.fDurusKod then
    begin
      if Field.AsString <> '' then
        if FindDurus(Field.AsString) then
        begin
          FTable.BirimSure := FDataChild.TableFindDurus.BirimSure;
        end;
    end
  finally
  end;
end;

function TAppRuleUretimRotaKaynakDurusFind.FindDurus(
  DurusKod: String): Boolean;
begin
  FDataChild.TableFindDurus.Close;
  FDataChild.TableFindDurus.TableItems.TableNames := 'URTODK';
  with FDataChild.TableFindDurus.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('DURUSKOD');
      Add('BIRIMSURE');
    end;
    with Where do
    begin
      Clear;
      Add('DURUSKOD', wcEqual, DurusKod).DataType := ftString;
    end;
  end;

  FDataChild.TableFindDurus.Open;
  Result := FDataChild.TableFindDurus.RecordCount > 0;
end;

end.
