unit CPMApp_DataChildUretimRotaKaynakOperasyon;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_Rule_ClientIncrement,
  CPMApp_TableBOMSystem, CPMApp_TableUretimSystem, CPMApp_TableStokSystem;

type
  TAppDataChildCustomUretimRotaKaynakOperasyon = class;
  TAppDataChildUretimRotaKaynakOperasyon = class;

  TAppDataChildCustomUretimRotaKaynakOperasyon = class(TAppDataChild)
  private
    FTableClone: TTableUretimRotaKaynakOperasyon;
    FTableFindKaynak: TTableUretimKaynakKart;
    FTableFindKaynakMamulKurulum: TTableUretimKaynakMamulKurulum;
    FTableFindStokKart: TTableStokKart;
    FTableFindStokBirim: TTableStokKartBirim;
  protected
    function GetTable: TTableUretimRotaKaynakOperasyon;
    procedure SetTable(Value: TTableUretimRotaKaynakOperasyon);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimRotaKaynakOperasyon read GetTable write SetTable;
    property TableClone: TTableUretimRotaKaynakOperasyon read FTableClone;
    property TableFindKaynak: TTableUretimKaynakKart read FTableFindKaynak;
    property TableFindKaynakMamulKurulum: TTableUretimKaynakMamulKurulum read FTableFindKaynakMamulKurulum;
    property TableFindStokKart: TTableStokKart read FTableFindStokKart;
    property TableFindStokBirim: TTableStokKartBirim read FTableFindStokBirim;
  end;

  TAppRuleUretimRotaKaynakOperasyonFind = class(TAppTableRule)
  private
    FTable: TTableUretimRotaKaynakOperasyon;
    FDataChild: TAppDataChildUretimRotaKaynakOperasyon;
    function FindKaynak(KaynakKod: String): Boolean;
    function FindKaynakMamulKurulum(KaynakKod, MamulKod: String): Boolean;
    function FindStokKart(MalKod: String): Boolean;
    function FindStokBirim(MalKod, Birim: String): Boolean;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
  public
    constructor Create(AOwner: TTableUretimRotaKaynakOperasyon); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimRotaKaynakOperasyon); reintroduce; overload;
  end;

  TAppRuleUretimRotaKaynakOperasyonSure = class(TAppTableRule)
  private
    FInUse: Boolean;
    FTable: TTableUretimRotaKaynakOperasyon;
    FDataChild: TAppDataChildUretimRotaKaynakOperasyon;
  protected
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
  public
    constructor Create(AOwner: TTableUretimRotaKaynakOperasyon); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimRotaKaynakOperasyon); reintroduce; overload;
  end;

  TAppRuleUretimRotaKaynakOperasyonMiktar = class(TAppTableRule)
  private
    FInUse: Boolean;
    FTable: TTableUretimRotaKaynakOperasyon;
    FDataChild: TAppDataChildUretimRotaKaynakOperasyon;
  protected
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
  public
    constructor Create(AOwner: TTableUretimRotaKaynakOperasyon); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimRotaKaynakOperasyon); reintroduce; overload;
  end;

  TAppDataChildUretimRotaKaynakOperasyon = class(TAppDataChildCustomUretimRotaKaynakOperasyon)
  private
    FRuleSiraNo: TAppRuleClientIncrement;
    FRuleFind: TAppRuleUretimRotaKaynakOperasyonFind;
    FRuleMiktar: TAppRuleUretimRotaKaynakOperasyonMiktar;
    FRuleSure: TAppRuleUretimRotaKaynakOperasyonSure;
  protected
    procedure CreateRules; override;
  published
    property RuleSiraNo: TAppRuleClientIncrement read FRuleSiraNo;
    property RuleFind: TAppRuleUretimRotaKaynakOperasyonFind read FRuleFind;
    property RuleMiktar: TAppRuleUretimRotaKaynakOperasyonMiktar read FRuleMiktar;
    property RuleSure: TAppRuleUretimRotaKaynakOperasyonSure read FRuleSure;
  end;

implementation

uses
  DateUtils,
  CPMApp_Date,
  CPMApp_Math,
  CPMApp_Dialogs,
  CPMApp_TableItems,
  CPMApp_Rule_FieldValidate;

{ TAppDataChildCustomUretimRotaKaynakOperasyon }

constructor TAppDataChildCustomUretimRotaKaynakOperasyon.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimRotaKaynakOperasyon.CreateTable;
begin
  Table := TTableUretimRotaKaynakOperasyon.Create(DataApp.DataObject);
  Table.Name := 'TableUretimRotaKaynakOperasyon';
  Table.TableItems.TableCaptions := 'Üretim Rota Kaynak Operasyon';

  FTableClone := TTableUretimRotaKaynakOperasyon.Create(nil);
  FTableClone.Name := Table.Name;
  FTableClone.ProviderName := Table.ProviderName;
  FTableClone.Connection := DataApp.DataObject.Connection;
  Table.AddClone(FTableClone);

  FTableFindKaynak := TTableUretimKaynakKart.Create(nil);
  FTableFindKaynak.Name := 'TableFindKaynakForOperasyon';
  FTableFindKaynak.ProviderName := 'pr' + FTableFindKaynak.Name;
  FTableFindKaynak.Connection := DataApp.Connection;
  FTableFindKaynak.Connection.CPMAppServer.AddProvider(FTableFindKaynak.ProviderName);

  FTableFindKaynakMamulKurulum := TTableUretimKaynakMamulKurulum.Create(nil);
  FTableFindKaynakMamulKurulum.Name := 'TableFindKaynakMamulKurulumForOperasyon';
  FTableFindKaynakMamulKurulum.ProviderName := 'pr' + FTableFindKaynakMamulKurulum.Name;
  FTableFindKaynakMamulKurulum.Connection := DataApp.Connection;
  FTableFindKaynakMamulKurulum.Connection.CPMAppServer.AddProvider(FTableFindKaynakMamulKurulum.ProviderName);

  FTableFindStokBirim := TTableStokKartBirim.Create(nil);
  FTableFindStokBirim.Name := 'TableFindStokBirimForOperasyon';
  FTableFindStokBirim.ProviderName := 'pr' + FTableFindStokBirim.Name;
  FTableFindStokBirim.Connection := DataApp.Connection;
  FTableFindStokBirim.Connection.CPMAppServer.AddProvider(FTableFindStokBirim.ProviderName);

  FTableFindStokKart := TTableStokKart.Create(nil);
  FTableFindStokKart.Name := 'TableFindStokKartForOperasyon';
  FTableFindStokKart.ProviderName := 'pr' + FTableFindStokKart.Name;
  FTableFindStokKart.Connection := DataApp.Connection;
  FTableFindStokKart.Connection.CPMAppServer.AddProvider(FTableFindStokKart.ProviderName);
end;

destructor TAppDataChildCustomUretimRotaKaynakOperasyon.Destroy;
begin
  FreeAndNil(FTableClone);
  FreeAndNil(FTableFindKaynak);
  FreeAndNil(FTableFindKaynakMamulKurulum);
  FreeAndNil(FTableFindStokKart);
  FreeAndNil(FTableFindStokBirim);
  inherited;
end;

function TAppDataChildCustomUretimRotaKaynakOperasyon.GetTable: TTableUretimRotaKaynakOperasyon;
begin
  Result := TTableUretimRotaKaynakOperasyon(inherited GetTable);
end;

procedure TAppDataChildCustomUretimRotaKaynakOperasyon.SetDefaultValues;
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
    Add('DURUM', 1);
  end;
end;

procedure TAppDataChildCustomUretimRotaKaynakOperasyon.SetTable(Value: TTableUretimRotaKaynakOperasyon);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimRotaKaynakOperasyon.SetValidates;
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
  end;
end;

{ TAppRuleUretimRotaKaynakOperasyonSure }

constructor TAppRuleUretimRotaKaynakOperasyonSure.Create(AOwner: TTableUretimRotaKaynakOperasyon);
begin
  inherited Create;
  FTable := AOwner;
  FTable.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimRotaKaynakOperasyonSure.Create(AOwner: TAppDataChildUretimRotaKaynakOperasyon);
begin
  Create(AOwner.Table);
  FDataChild := AOwner;
end;

procedure TAppRuleUretimRotaKaynakOperasyonSure.DoOnFieldChanged(
  Table: TAppCustomTable; Field: TField);
  procedure UpdateBitTarihSaat;
  begin
    FTable.BitTarihSaat := IncMinute(FTable.BasTarihSaat, Trunc(FTable.Sure));
    FTable.BitTarih := DateOf(FTable.BitTarihSaat);
  end;
  procedure UpdateSure;
  var
    AFark: TDateTime;
    ASure: Double;
  begin
    AFark := FTable.BitTarihSaat - FTable.BasTarihSaat;
    ASure := AFark * 24 * 60;
    FTable.Sure := AppRound(ASure);
  end;
  procedure UpdateMekanikBitSaat;
  var
    BasDakika, BitDakika: Double;
    msBitInt, msBitFrac: Double;
  begin
    BasDakika := (Int(FTable.MekanikSaatBas) * 60) + (Frac(FTable.MekanikSaatBas) * FTable.MekanikSaatKatSayi);
    BitDakika := BasDakika + FTable.MekanikSaatSure;
    msBitInt := Int(BitDakika / 60);
    if FTable.MekanikSaatKatSayi > 0 then
      msBitFrac := (BitDakika - (msBitInt * 60)) / FTable.MekanikSaatKatSayi
    else
      msBitFrac := 0;
    FTable.MekanikSaatBit := AppRoundMoney(msBitInt + msBitFrac);
  end;
  procedure UpdateMekanikSaatSure;
  var
    ABas, ABit: Double;
  begin
    ABas := (Int(FTable.MekanikSaatBas) * 60) + (Frac(FTable.MekanikSaatBas) * FTable.MekanikSaatKatSayi);
    ABit := (Int(FTable.MekanikSaatBit) * 60) + (Frac(FTable.MekanikSaatBit) * FTable.MekanikSaatKatSayi);
    FTable.MekanikSaatSure := AppRoundDate(ABit - ABas);
  end;
  procedure UpdateOptCalismaSure;
  begin
    FTable.OptCalismaSure := AppRoundDate((FTable.Miktar + FTable.FireMiktar) * FTable.OptCalismaBirimSure);
  end;
  procedure UpdateOptCalismaBirimSure;
  begin
    if FTable.Miktar <> 0 then
      FTable.OptCalismaBirimSure := FTable.OptCalismaSure / (FTable.Miktar + FTable.FireMiktar);
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
    end
    else if Field = FTable.fMekanikSaatBas then
    begin
      UpdateMekanikBitSaat;
    end
    else if Field = FTable.fMekanikSaatBit then
    begin
      UpdateMekanikSaatSure;
    end
    else if Field = FTable.fMekanikSaatKatSayi then
    begin
      UpdateMekanikSaatSure;
    end
    else if Field = FTable.fMekanikSaatSure then
    begin
      UpdateMekanikBitSaat;
    end
    else if Field = FTable.fOptCalismaBirimSure then
    begin
      UpdateOptCalismaSure;
    end
    else if Field = FTable.fOptCalismaBirimSure then
    begin
      UpdateOptCalismaBirimSure;
    end
    else if (Field = FTable.fMiktar) or (Field = FTable.fFireMiktar) then
    begin
      UpdateOptCalismaSure;
    end;
  finally
    FInUse := False;
  end;
end;

{ TAppDataChildUretimRotaKaynakOperasyon }

procedure TAppDataChildUretimRotaKaynakOperasyon.CreateRules;
begin
  inherited;
  FRuleSiraNo := TAppRuleClientIncrement.Create(Table);
  Rules.AddRule(FRuleSiraNo);
  FRuleSiraNo.FieldName := 'SIRANO';

  FRuleFind := TAppRuleUretimRotaKaynakOperasyonFind.Create(Self);
  Rules.AddRule(FRuleFind);

  FRuleMiktar := TAppRuleUretimRotaKaynakOperasyonMiktar.Create(Self);
  Rules.AddRule(FRuleMiktar);

  FRuleSure := TAppRuleUretimRotaKaynakOperasyonSure.Create(Self);
  Rules.AddRule(FRuleSure);
end;

{ TAppRuleUretimRotaKaynakOperasyonCalcMiktar }

constructor TAppRuleUretimRotaKaynakOperasyonFind.Create(
  AOwner: TTableUretimRotaKaynakOperasyon);
begin
  inherited Create;
  FTable := AOwner;
  FTable.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimRotaKaynakOperasyonFind.Create(
  AOwner: TAppDataChildUretimRotaKaynakOperasyon);
begin
  Create(AOwner.Table);
  FDataChild := AOwner;
end;

procedure TAppRuleUretimRotaKaynakOperasyonFind.DoOnFieldChanged(
  Table: TAppCustomTable; Field: TField);
begin
  inherited;
  try
    if Field = FTable.fKaynakKod then
    begin
      if Field.AsString <> '' then
        if FindKaynak(Field.AsString) then
        begin
          FTable.OptCalismaBirimSure := FDataChild.TableFindKaynak.OptCalismaSure;
          FTable.MekanikSaatKatSayi := FDataChild.TableFindKaynak.MekanikSaatKatSayi;
        end;
    end
    else if Field = FTable.fMamulKod then
    begin
      if Field.AsString <> '' then
      begin
        if FindStokKart(FTable.MamulKod) then
        begin
          if SameText(FDataChild.FTableFindStokKart.AlimEvrakBirim, '') then
            FTable.EvrakBirim := FDataChild.FTableFindStokKart.Birim
          else
            FTable.EvrakBirim := FDataChild.FTableFindStokKart.AlimEvrakBirim;
        end;
        if FindKaynakMamulKurulum(FTable.KaynakKod, FTable.MamulKod) then
        begin
          if FDataChild.TableFindKaynakMamulKurulum.OptCalismaSure > 0 then
            FTable.OptCalismaBirimSure := FDataChild.TableFindKaynakMamulKurulum.OptCalismaSure;
        end;
      end;
    end
    else if Field = FTable.fEvrakBirim then
    begin
      if Field.AsString <> '' then
        if FindStokKart(FTable.MamulKod) then
        begin
          if SameText(FDataChild.FTableFindStokKart.Birim, FTable.EvrakBirim) then
            FTable.EvrakBirimKatsayi := 1
          else if FindStokBirim(FTable.MamulKod, FTable.EvrakBirim) then
            FTable.EvrakBirimKatsayi := FDataChild.FTableFindStokBirim.KatSayi
          else
          begin
            AppShowMessage(format('%s biriminin %s birimine çevrim katsayýsý bulunamadý.', [FTable.EvrakBirim, FDataChild.FTableFindStokKart.Birim]));
            FTable.EvrakBirim := FDataChild.FTableFindStokKart.Birim;
          end;
        end;
    end;
  finally
  end;
end;

procedure TAppRuleUretimRotaKaynakOperasyonFind.DoOnNewRecord(
  Table: TAppCustomTable);
begin
  inherited;
  if FindKaynak(FTable.KaynakKod) then
  begin
    FTable.OptCalismaBirimSure := FDataChild.TableFindKaynak.OptCalismaSure;
    FTable.MekanikSaatKatSayi := FDataChild.TableFindKaynak.MekanikSaatKatSayi;
    if FindKaynakMamulKurulum(FTable.KaynakKod, FTable.MamulKod) then
    begin
      if FDataChild.TableFindKaynakMamulKurulum.OptCalismaSure > 0 then
        FTable.OptCalismaBirimSure := FDataChild.TableFindKaynakMamulKurulum.OptCalismaSure;
    end;
  end;
  if FindStokKart(FTable.MamulKod) then
    if SameText(FDataChild.FTableFindStokKart.AlimEvrakBirim, '') then
      FTable.EvrakBirim := FDataChild.FTableFindStokKart.Birim
    else
      FTable.EvrakBirim := FDataChild.FTableFindStokKart.AlimEvrakBirim;
end;

function TAppRuleUretimRotaKaynakOperasyonFind.FindKaynak(
  KaynakKod: String): Boolean;
begin
  FDataChild.TableFindKaynak.Close;
  FDataChild.TableFindKaynak.TableItems.TableNames := 'URTKYN';
  with FDataChild.TableFindKaynak.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('KAYNAKKOD');
      Add('OPTCALISMASURE');
      Add('MEKANIKSAATKATSAYI');
    end;
    with Where do
    begin
      Clear;
      Add('KAYNAKKOD', wcEqual, KaynakKod).DataType := ftString;
    end;
  end;

  FDataChild.TableFindKaynak.Open;
  Result := FDataChild.TableFindKaynak.RecordCount > 0;
end;

function TAppRuleUretimRotaKaynakOperasyonFind.FindKaynakMamulKurulum(
  KaynakKod, MamulKod: String): Boolean;
begin
  FDataChild.TableFindKaynakMamulKurulum.Close;
  FDataChild.TableFindKaynakMamulKurulum.TableItems.TableNames := 'URTKMK';
  with FDataChild.TableFindKaynakMamulKurulum.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('KAYNAKKOD');
      Add('MAMULKOD');
      Add('OPTCALISMASURE');
    end;
    with Where do
    begin
      Clear;
      Add('KAYNAKKOD', wcEqual, KaynakKod).DataType := ftString;
      AddOperator(woAnd);
      Add('MAMULKOD', wcEqual, MamulKod).DataType := ftString;
    end;
  end;

  FDataChild.TableFindKaynakMamulKurulum.Open;
  Result := FDataChild.TableFindKaynakMamulKurulum.RecordCount > 0;
end;

function TAppRuleUretimRotaKaynakOperasyonFind.FindStokBirim(MalKod,
  Birim: String): Boolean;
begin
  if FDataChild.TableFindStokBirim.Active then
    if (FDataChild.TableFindStokBirim.MalKod = MalKod) and (FDataChild.TableFindStokBirim.Birim = Birim) then
    begin
      Result := True;
      Exit;
    end;
  FDataChild.TableFindStokBirim.Close;
  FDataChild.TableFindStokBirim.TableItems.TableNames := 'STKBRM';
  with FDataChild.TableFindStokBirim.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALKOD');
      Add('BIRIM');
      Add('KATSAYI');
    end;
    with Where do
    begin
      Clear;
      Add('MALKOD', wcEqual, MalKod);
      AddOperator(woAnd);
      Add('BIRIM', wcEqual, Birim);
    end;
  end;

  FDataChild.TableFindStokBirim.Open;
  Result := FDataChild.TableFindStokBirim.RecordCount > 0;
end;

function TAppRuleUretimRotaKaynakOperasyonFind.FindStokKart(
  MalKod: String): Boolean;
begin
  if FDataChild.TableFindStokKart.Active then
    if MalKod = FDataChild.TableFindStokKart.MalKod then
    begin
      Result := True;
      Exit;
    end;
  FDataChild.TableFindStokKart.Close;
  FDataChild.TableFindStokKart.TableItems.TableNames := 'STKKRT';
  with FDataChild.TableFindStokKart.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALKOD');
      Add('BIRIM');
      Add('ALIMEVRAKBIRIM');
    end;
    with Where do
    begin
      Clear;
      Add('MALKOD', wcEqual, MalKod);
    end;
  end;

  FDataChild.TableFindStokKart.Open;
  Result := FDataChild.TableFindStokKart.RecordCount > 0;
end;

{ TAppRuleUretimRotaKaynakOperasyonMiktar }

constructor TAppRuleUretimRotaKaynakOperasyonMiktar.Create(
  AOwner: TTableUretimRotaKaynakOperasyon);
begin
  inherited Create;
  FTable := AOwner;
  FTable.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimRotaKaynakOperasyonMiktar.Create(
  AOwner: TAppDataChildUretimRotaKaynakOperasyon);
begin
  Create(AOwner.Table);
  FDataChild := AOwner;
end;

procedure TAppRuleUretimRotaKaynakOperasyonMiktar.DoOnFieldChanged(
  Table: TAppCustomTable; Field: TField);
  procedure UpdateMiktar;
  begin
    FTable.Miktar := FTable.EvrakMiktar * FTable.EvrakBirimKatsayi;
  end;
  procedure UpdateFireMiktar;
  begin
    FTable.FireMiktar := FTable.EvrakFireMiktar * FTable.EvrakBirimKatsayi;
  end;
  procedure UpdateEvrakMiktar;
  begin
    if FTable.EvrakBirimKatsayi = 0 then
      FTable.EvrakBirimKatsayi := 1;
    FTable.EvrakMiktar := FTable.Miktar / FTable.EvrakBirimKatsayi;
  end;
  procedure UpdateEvrakFireMiktar;
  begin
    if FTable.EvrakBirimKatsayi = 0 then
      FTable.EvrakBirimKatsayi := 1;
    FTable.EvrakFireMiktar := FTable.FireMiktar / FTable.EvrakBirimKatsayi;
  end;
begin
  inherited;
  if FInUse then
    exit;
  FInUse := True;
  try
    if Field = FTable.fEvrakMiktar then
    begin
      UpdateMiktar;
    end
    else if Field = FTable.fEvrakFireMiktar then
    begin
      UpdateFireMiktar;
    end
    else if Field = FTable.fEvrakBirimKatsayi then
    begin
      UpdateMiktar;
      UpdateFireMiktar;
    end
    else if Field = FTable.fMiktar then
    begin
      UpdateEvrakMiktar;
    end
    else if Field = FTable.fFireMiktar then
    begin
      UpdateEvrakFireMiktar;
    end;
  finally
    FInUse := False;
  end;
end;

end.
