unit CPMApp_DataChildUretimRotaKaynakIslem;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_Rule_ClientIncrement,
  CPMApp_TableBOMSystem, CPMApp_TableUretimSystem, CPMApp_TableStokSystem;

type
  TAppDataChildCustomUretimRotaKaynakIslem = class;
  TAppDataChildUretimRotaKaynakIslem = class;

  TAppDataChildCustomUretimRotaKaynakIslem = class(TAppDataChild)
  private
    FTableClone: TTableUretimRotaKaynakIslem;
  protected
    function GetTable: TTableUretimRotaKaynakIslem;
    procedure SetTable(Value: TTableUretimRotaKaynakIslem);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimRotaKaynakIslem read GetTable write SetTable;
    property TableClone: TTableUretimRotaKaynakIslem read FTableClone write FTableClone;
  end;

  TAppRuleUretimRotaKaynakIslemSure = class(TAppTableRule)
  private
    FDataChild: TAppDataChildUretimRotaKaynakIslem;
    FTable: TTableUretimRotaKaynakIslem;
    FInUse: Boolean;
  protected
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
  public
    constructor Create(AOwner: TAppDataChildUretimRotaKaynakIslem); reintroduce;
  end;

  TAppDataChildUretimRotaKaynakIslem = class(TAppDataChildCustomUretimRotaKaynakIslem)
  private
    FRuleSure: TAppRuleUretimRotaKaynakIslemSure;
  protected
    procedure CreateRules; override;
  published
    property RuleSure: TAppRuleUretimRotaKaynakIslemSure read FRuleSure;
  end;

implementation

uses
  DateUtils,
  CPMApp_Date,
  CPMApp_Math,
  CPMApp_Dialogs,
  CPMApp_TableItems,
  CPMApp_Rule_FieldValidate;

{ TAppDataChildCustomUretimRotaKaynakIslem }

constructor TAppDataChildCustomUretimRotaKaynakIslem.Create(
  AOwner: TAppDataApp);
begin
  FreeAndNil(FTableClone);
  inherited;
end;

procedure TAppDataChildCustomUretimRotaKaynakIslem.CreateTable;
begin
  Table := TTableUretimRotaKaynakIslem.Create(DataApp.DataObject);
  Table.Name := 'TableUretimRotaKaynakIslem';
  Table.TableItems.TableCaptions := 'Üretim Rota Kaynak Ýþlem';

  FTableClone := TTableUretimRotaKaynakIslem.Create(nil);
  FTableClone.Name := Table.Name;
  FTableClone.ProviderName := Table.ProviderName;
  FTableClone.Connection := DataApp.DataObject.Connection;
  Table.AddClone(FTableClone);


//  Table.TableItems[0].Where.Clear;
//  Table.TableItems[0].Where.Add('KULLANILAN', wcEqual, 1);  // Veysel
end;

destructor TAppDataChildCustomUretimRotaKaynakIslem.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimRotaKaynakIslem.GetTable: TTableUretimRotaKaynakIslem;
begin
  Result := TTableUretimRotaKaynakIslem(inherited GetTable);
end;

procedure TAppDataChildCustomUretimRotaKaynakIslem.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
    Add('KULLANILAN', 1);
    Add('DURUM', 0);
  end;
end;

procedure TAppDataChildCustomUretimRotaKaynakIslem.SetTable(Value: TTableUretimRotaKaynakIslem);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimRotaKaynakIslem.SetValidates;
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
    AddNonBlank('ISLEMNO');
  end;
end;

{ TAppRuleUretimRotaKaynakIslemSure }

constructor TAppRuleUretimRotaKaynakIslemSure.Create(AOwner: TAppDataChildUretimRotaKaynakIslem);
begin
  inherited Create;
  FDataChild := AOwner;
  FTable := AOwner.Table;
  FTable.DataEvents.AddRule(Self);
end;

procedure TAppRuleUretimRotaKaynakIslemSure.DoOnFieldChanged(
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
  finally
    FInUse := False;
  end;
end;

{ TAppDataChildUretimRotaKaynakIslem }

procedure TAppDataChildUretimRotaKaynakIslem.CreateRules;
begin
  inherited;
  FRuleSure := TAppRuleUretimRotaKaynakIslemSure.Create(Self);
  Rules.AddRule(FRuleSure);
end;

end.
