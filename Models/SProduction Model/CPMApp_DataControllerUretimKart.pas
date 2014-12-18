unit CPMApp_DataControllerUretimKart;

interface

uses
  SysUtils,
  DB,
  CPMApp_DataObject,
  CPMApp_TableUretimSystem,
  CPMApp_TableStokSystem,
  CPMApp_TableCariSystem,
  CPMApp_BOMConsts,
  CPMApp_DataControllerCommon,
  CPMApp_DataControllerLotKapat;

type
  TAppDataControllerUretimKart = class;

  TAppRuleUretimKartCustom = class(TAppTableRule)
  private
    FTableUretimKart: TTableUretimKart;
    FdcUretimKart: TAppDataControllerUretimKart;
  protected
    procedure DoAfterOpen(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDataControllerUretimKart);
  end;

  TAppRuleUretimRotaCustom = class(TAppTableRule)
  private
    FTableUretimRota: TTableUretimRota;
    FdcUretimKart: TAppDataControllerUretimKart;
    pFirstOpBasTarih, pFirstOpBasTarihSaat, pLastOpBitTarih, pLastOpBitTarihSaat: TDateTime;
    pLastOpMiktar, pTotalOpFireMiktar, pTotalOpSure: Double;
    pKartOpDurum, pLastOpDurum, pOldOpDurum, pOpDurum: Smallint;
    pSonrakiOperasyonNo: String;
    procedure CheckUretimKart;
    procedure PrepareDataForUretimKart(Deleting: Boolean);
    procedure UpdateUretimKart;
  protected
    procedure DoBeforeEdit(Table: TAppCustomTable); override;
    procedure DoBeforeInsert(Table: TAppCustomTable); override;
    procedure DoBeforePost(Table: TAppCustomTable); override;
    procedure DoBeforeDelete(Table: TAppCustomTable); override;
    procedure DoAfterPost(Table: TAppCustomTable); override;
    procedure DoAfterDelete(Table: TAppCustomTable); override;
    procedure DoOnAllowEditing(Table: TAppCustomTable; Field: TField; var Allow: Boolean); override;
    procedure DoOnAllowDeleting(Table: TAppCustomTable; var Allow: Boolean); override;
    procedure DoOnAllowInserting(Table: TAppCustomTable; var Allow: Boolean); override;
  public
    constructor Create(AOwner: TAppDataControllerUretimKart);
  end;

  TAppRuleUretimRotaKaynakCustom = class(TAppTableRule)
  private
    FTableUretimRotaKaynak: TTableUretimRotaKaynak;
    FdcUretimKart: TAppDataControllerUretimKart;
    pFirstOpBasTarih, pFirstOpBasTarihSaat, pLastOpBitTarih, pLastOpBitTarihSaat: TDateTime;
    pTotalOpMiktar, pTotalOpFireMiktar, pTotalOpSure: Double;
    pRotaOpDurum: Smallint;
    procedure CheckUretimRota;
    procedure PrepareDataForUretimRota(Deleting: Boolean);
    procedure UpdateUretimRota;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoBeforeEdit(Table: TAppCustomTable); override;
    procedure DoBeforeInsert(Table: TAppCustomTable); override;
    procedure DoBeforePost(Table: TAppCustomTable); override;
    procedure DoBeforeDelete(Table: TAppCustomTable); override;
    procedure DoAfterPost(Table: TAppCustomTable); override;
    procedure DoAfterDelete(Table: TAppCustomTable); override;
    procedure DoOnAllowEditing(Table: TAppCustomTable; Field: TField; var Allow: Boolean); override;
    procedure DoOnAllowDeleting(Table: TAppCustomTable; var Allow: Boolean); override;
    procedure DoOnAllowInserting(Table: TAppCustomTable; var Allow: Boolean); override;
  public
    constructor Create(AOwner: TAppDataControllerUretimKart);
  end;

  TAppRuleUretimRotaKaynakOperasyonCustom = class(TAppTableRule)
  private
    FTableUretimRotaKaynakOperasyon: TTableUretimRotaKaynakOperasyon;
    FdcUretimKart: TAppDataControllerUretimKart;
    pFirstOpBasTarih, pFirstOpBasTarihSaat, pLastOpBitTarih, pLastOpBitTarihSaat: TDateTime;
    pTotalOpMiktar, pTotalOpFireMiktar, pTotalOpSure: Double;
    pKaynakOpDurum, pLastOpDurum: Smallint;
    pOperasyonNo, pSiraNo: Integer;
    pDurum, pKayitDurum: Smallint;
    pMiktar, pFireMiktar: Double;
    pBasTarih, pBitTarih: TDateTime;
    pDataSetState: TDataSetState;
    pOldKayitDurum, pOldDurum: Smallint;
    pOldMiktar, pOldFireMiktar: Double;
    pOldBasTarih, pOldBitTarih: TDateTime;
    KayýtDurumChanged, DurumChanged, MiktarChanged, BasTarihChanged, BitTarihChanged: Boolean;
    procedure CheckUretimKaynak;
    procedure PrepareDataForUretimKaynak(Deleting: Boolean);
    procedure UpdateUretimKaynak;
  protected
    procedure DoBeforeDelete(Table: TAppCustomTable); override;
    procedure DoBeforeEdit(Table: TAppCustomTable); override;
    procedure DoBeforeInsert(Table: TAppCustomTable); override;
    procedure DoBeforePost(Table: TAppCustomTable); override;
    procedure DoAfterDelete(Table: TAppCustomTable); override;
    procedure DoAfterPost(Table: TAppCustomTable); override;
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDataControllerUretimKart);
  end;

  TAppRuleUretimStokHareketCustom = class(TAppTableRule)
  private
    FTableUretimStokHareket: TTableStokHareket;
    FTableUretimSiparisHareket: TTableStokHareket;
    FdcUretimKart: TAppDataControllerUretimKart;
  protected
    procedure DoAfterCancelUpdates(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDataControllerUretimKart);
  end;

  TAppDataControllerUretimKart = class
  private
    FdcCommon: TAppDataControllerCustomCommon;
    FdcLotKapat: TAppDataControllerCustomLotKapat;
    // Tables
    FTableUretimKart: TTableUretimKart;
    FTableUretimRota: TTableUretimRota;
    FTableUretimRotaClone: TTableUretimRota;
    FTableUretimRotaKaynak: TTableUretimRotaKaynak;
    FTableUretimRotaKaynakClone: TTableUretimRotaKaynak;
    FTableUretimRotaKaynakIslem: TTableUretimRotaKaynakIslem;
    FTableUretimRotaKaynakOperasyon: TTableUretimRotaKaynakOperasyon;
    FTableUretimRotaKaynakOperasyonClone: TTableUretimRotaKaynakOperasyon;
    FTableUretimSiparisHareket: TTableStokHareket;
    FTableUretimSiparisHareketClone: TTableStokHareket;
    FTableUretimEvrakBaslik: TTableEvrakBaslik;
    FTableUretimStokHareket: TTableStokHareket;
    FTableUretimStokHareketClone: TTableStokHareket;
    FTableUretimStokHareketTeknik: TTableStokTeknik;
    FTableUretimStokHareketUretim: TTableStokUretim;
    FTableUretimEvrakKaynak: TTableEvrakKaynak;
    FTableUretimEvrakKaynakClone: TTableEvrakKaynak;
    FTableUretimSeriKart: TTableSeriKart;
    // Rules
    FRuleUretimKartCustom: TAppRuleUretimKartCustom;
    FRuleUretimRotaCustom: TAppRuleUretimRotaCustom;
    FRuleUretimRotaKaynakCustom: TAppRuleUretimRotaKaynakCustom;
    FRuleUretimRotaKaynakOperasyonCustom: TAppRuleUretimRotaKaynakOperasyonCustom;
    FRuleUretimStokHareketCustom: TAppRuleUretimStokHareketCustom;
    procedure AddStokHareket(ATableSiparisHareket: TTableStokHareket; AOperasyonType: TAppOpType; AOperasyonNo, AOperasyonSiraNo: Integer; AIrsaliyeNo: String; AIrsaliyeTarih: TDateTime; AMiktar: Double);
    procedure DeleteStokHareket(ATableSiparisHareket: TTableStokHareket; AOperasyonType: TAppOpType; AOperasyonNo, AOperasyonSiraNo: Integer);
  public
    constructor Create(
      AOwner: TAppDataControllerCustomCommon;
      ATableUretimKart: TTableUretimKart;
      ATableUretimRota: TTableUretimRota;
      ATableUretimRotaKaynak: TTableUretimRotaKaynak;
      ATableUretimRotaKaynakIslem: TTableUretimRotaKaynakIslem;
      ATableUretimRotaKaynakOperasyon: TTableUretimRotaKaynakOperasyon;
      ATableUretimSiparisHareket: TTableStokHareket;
      ATableUretimEvrakBaslik: TTableEvrakBaslik;
      ATableUretimStokHareket: TTableStokHareket;
      ATableUretimStokHareketTeknik: TTableStokTeknik;
      ATableUretimStokHareketUretim: TTableStokUretim;
      ATableUretimEvrakKaynak: TTableEvrakKaynak;
      ATableUretimSeriKart: TTableSeriKart);
    destructor Destroy; override;
    procedure OpenTables(SirketNo, KonsolideSirketNo, HesapKod, EvrakNo: String);
    procedure AddAutoBaglanti(AOpUpdateStatus: TAppOpUpdateStatus; AOpType: TAppOpType; AOpNo, AOpSiraNo: Integer; const AOpTarih: TDateTime = 2; const AOpMiktar: Double = 0; const AOpFireMiktar: Double = 0);
    procedure AddManualBaglanti(AOpUpdateStatus: TAppOpUpdateStatus; AIrsaliyeNo: String; AIrsaliyeTarih: TDateTime; AMiktar: Double);
    procedure UpdateNextRoute(ANextOpNo: String; const ANextOpDurum: Smallint = 0);
    function UretimDurumDegistir(ANewUretimDurum: TAppUretimDurum; ATarih: TDateTime; AMiktar, AFireMiktar: Double): Boolean;
  end;

implementation

uses
  StrUtils,
  CPMApp_Dialogs,
  CPMApp_Date,
  CPMApp_DocConsts,
  CPMApp_DocumentConsts;

{ TAppRuleUretimKartCustom }

constructor TAppRuleUretimKartCustom.Create(AOwner: TAppDataControllerUretimKart);
begin
  inherited Create;
  FdcUretimKart := AOwner;

  FTableUretimKart := FdcUretimKart.FTableUretimKart;
  FTableUretimKart.DataEvents.AddRule(Self);
end;

procedure TAppRuleUretimKartCustom.DoAfterOpen(Table: TAppCustomTable);
begin
  FdcUretimKart.OpenTables(FTableUretimKart.SirketNo, '', FTableUretimKart.HesapKod, FTableUretimKart.EvrakNo);
end;

{ TAppRuleUretimRotaCustom }

procedure TAppRuleUretimRotaCustom.CheckUretimKart;
begin
  if FdcUretimKart.FTableUretimKart.IsEmpty then
    raise Exception.Create('Üretim kartý yok, rota giriþi yapamazsýnýz!');
end;

constructor TAppRuleUretimRotaCustom.Create(
  AOwner: TAppDataControllerUretimKart);
begin
  inherited Create;
  FdcUretimKart := AOwner;

  FTableUretimRota := FdcUretimKart.FTableUretimRota;
  FTableUretimRota.DataEvents.AddRule(Self);
end;

procedure TAppRuleUretimRotaCustom.DoAfterDelete(Table: TAppCustomTable);
begin
  inherited;
  UpdateUretimKart;
end;

procedure TAppRuleUretimRotaCustom.DoAfterPost(Table: TAppCustomTable);
begin
  inherited;
  UpdateUretimKart;
  FdcUretimKart.UpdateNextRoute(pSonrakiOperasyonNo);
end;

procedure TAppRuleUretimRotaCustom.DoBeforeDelete(Table: TAppCustomTable);
begin
  inherited;
  PrepareDataForUretimKart(True);
end;

procedure TAppRuleUretimRotaCustom.DoBeforeEdit(Table: TAppCustomTable);
begin
  inherited;
  CheckUretimKart;
  pOldOpDurum := FTableUretimRota.OpDurum;
end;

procedure TAppRuleUretimRotaCustom.DoBeforeInsert(Table: TAppCustomTable);
begin
  inherited;
  CheckUretimKart;
  pOldOpDurum := odNone;
end;

procedure TAppRuleUretimRotaCustom.DoBeforePost(Table: TAppCustomTable);
begin
  inherited;
  PrepareDataForUretimKart(False);
end;

procedure TAppRuleUretimRotaCustom.DoOnAllowDeleting(Table: TAppCustomTable;
  var Allow: Boolean);
begin
  inherited;
  Allow := FdcUretimKart.FTableUretimKart.UretimDurum in [Integer(udPlanned), Integer(udFirmPlanned)];
end;

procedure TAppRuleUretimRotaCustom.DoOnAllowEditing(Table: TAppCustomTable;
  Field: TField; var Allow: Boolean);
begin
  inherited;
  Allow := FdcUretimKart.FTableUretimKart.UretimDurum in [Integer(udPlanned), Integer(udFirmPlanned)];
end;

procedure TAppRuleUretimRotaCustom.DoOnAllowInserting(Table: TAppCustomTable;
  var Allow: Boolean);
begin
  inherited;
  Allow := FdcUretimKart.FTableUretimKart.UretimDurum in [Integer(udPlanned), Integer(udFirmPlanned)];
end;

procedure TAppRuleUretimRotaCustom.PrepareDataForUretimKart(Deleting: Boolean);
var
  pOperated: Boolean;
  pOperasyonNo: Smallint;
  pOpSure: Double;
  pOpBasTarih, pOpBasTarihSaat: TDateTime;
  pOpBitTarih, pOpBitTarihSaat: TDateTime;
  pKartMiktar, pOpMiktar, pOpFireMiktar: Double;
begin
  pKartMiktar := FdcUretimKart.FTableUretimKart.Miktar;

  pOperasyonNo := FdcUretimKart.FTableUretimRota.OperasyonNo;
  pSonrakiOperasyonNo := FdcUretimKart.FTableUretimRota.SonrakiOperasyonNo;
  pOpMiktar := FdcUretimKart.FTableUretimRota.OpMiktar;
  pOpFireMiktar := FdcUretimKart.FTableUretimRota.OpFireMiktar;
  pOpSure := FdcUretimKart.FTableUretimRota.OpSure;
  pOpBasTarih := FdcUretimKart.FTableUretimRota.OpBasTarih;
  pOpBasTarihSaat := FdcUretimKart.FTableUretimRota.OpBasTarihSaat;
  pOpBitTarih := FdcUretimKart.FTableUretimRota.OpBitTarih;
  pOpBitTarihSaat := FdcUretimKart.FTableUretimRota.OpBitTarihSaat;
  pOpDurum := FdcUretimKart.FTableUretimRota.OpDurum;

  FdcUretimKart.FTableUretimRotaClone.First;
  if FdcUretimKart.FTableUretimRotaClone.OperasyonNo >= pOperasyonNo then
  begin
    pFirstOpBasTarih := pOpBasTarih;
    pFirstOpBasTarihSaat := pOpBasTarihSaat;
    pOperated := pOpDurum in [odStarted, odFinished];
  end else
  begin
    pFirstOpBasTarih := FdcUretimKart.FTableUretimRotaClone.OpBasTarih;
    pFirstOpBasTarihSaat := FdcUretimKart.FTableUretimRotaClone.OpBasTarihSaat;
    pOperated := FdcUretimKart.FTableUretimRotaClone.OpDurum in [odStarted, odFinished];
  end;
  if Deleting then
  begin
    pTotalOpFireMiktar := pOpFireMiktar * -1;
    pTotalOpSure := pOpSure * -1
  end else
  begin
    pTotalOpFireMiktar := pOpFireMiktar;
    pTotalOpSure := pOpSure;
  end;
  while not FdcUretimKart.FTableUretimRotaClone.Eof do
  begin
    if FdcUretimKart.FTableUretimRotaClone.OperasyonNo <> pOperasyonNo then
    begin
      pTotalOpFireMiktar := pTotalOpFireMiktar + FdcUretimKart.FTableUretimRotaClone.OpFireMiktar;
      pTotalOpSure := pTotalOpSure + FdcUretimKart.FTableUretimRotaClone.OpSure;
    end;
    FdcUretimKart.FTableUretimRotaClone.Next;
  end;
  if FdcUretimKart.FTableUretimRotaClone.OperasyonNo <= pOperasyonNo then
  begin
    pLastOpBitTarih := pOpBitTarih;
    pLastOpBitTarihSaat := pOpBitTarihSaat;
    pLastOpMiktar := pOpMiktar;
    pLastOpDurum := pOpDurum;
  end else
  begin
    pLastOpBitTarih := FdcUretimKart.FTableUretimRotaClone.OpBitTarih;
    pLastOpBitTarihSaat := FdcUretimKart.FTableUretimRotaClone.OpBitTarihSaat;
    pLastOpMiktar := FdcUretimKart.FTableUretimRotaClone.OpMiktar;
    pLastOpDurum := FdcUretimKart.FTableUretimRotaClone.OpDurum;
  end;

  if not pOperated then
    pKartOpDurum := odReleased
  else if (pLastOpDurum = odStarted) or (pKartMiktar - pLastOpMiktar - pTotalOpFireMiktar > 0.00001) then
    pKartOpDurum := odStarted
  else
    pKartOpDurum := odFinished;
end;

procedure TAppRuleUretimRotaCustom.UpdateUretimKart;
begin
  if not (FdcUretimKart.FTableUretimKart.State in dsEditModes) then
    FdcUretimKart.FTableUretimKart.Edit;
  if FdcUretimKart.FTableUretimKart.OpBasTarih <> pFirstOpBasTarih then
    FdcUretimKart.FTableUretimKart.OpBasTarih := pFirstOpBasTarih;
  if FdcUretimKart.FTableUretimKart.OpBasTarihSaat <> pFirstOpBasTarihSaat then
    FdcUretimKart.FTableUretimKart.OpBasTarihSaat := pFirstOpBasTarihSaat;
  if FdcUretimKart.FTableUretimKart.OpBitTarih <> pLastOpBitTarih then
    FdcUretimKart.FTableUretimKart.OpBitTarih := pLastOpBitTarih;
  if FdcUretimKart.FTableUretimKart.OpBitTarihSaat <> pLastOpBitTarihSaat then
    FdcUretimKart.FTableUretimKart.OpBitTarihSaat := pLastOpBitTarihSaat;
  if FdcUretimKart.FTableUretimKart.OpMiktar <> pLastOpMiktar then
    FdcUretimKart.FTableUretimKart.OpMiktar := pLastOpMiktar;
  if FdcUretimKart.FTableUretimKart.OpFireMiktar <> pTotalOpFireMiktar then
    FdcUretimKart.FTableUretimKart.OpFireMiktar := pTotalOpFireMiktar;
  if FdcUretimKart.FTableUretimKart.OpSure <> pTotalOpSure then
    FdcUretimKart.FTableUretimKart.OpSure := pTotalOpSure;
  if FdcUretimKart.FTableUretimKart.OpDurum <> pKartOpDurum then
    FdcUretimKart.FTableUretimKart.OpDurum := pKartOpDurum;
  FdcUretimKart.FTableUretimKart.Post;
end;

{ TAppRuleUretimRotaKaynakCustom }

procedure TAppRuleUretimRotaKaynakCustom.CheckUretimRota;
begin
  if FdcUretimKart.FTableUretimRota.IsEmpty then
    raise Exception.Create('Üretim rotasý yok, kaynak giriþi yapamazsýnýz!');
end;

constructor TAppRuleUretimRotaKaynakCustom.Create(
  AOwner: TAppDataControllerUretimKart);
begin
  inherited Create;
  FdcUretimKart := AOwner;

  FTableUretimRotaKaynak := FdcUretimKart.FTableUretimRotaKaynak;
  FTableUretimRotaKaynak.DataEvents.AddRule(Self);
end;

procedure TAppRuleUretimRotaKaynakCustom.DoAfterDelete(Table: TAppCustomTable);
begin
  inherited;
  UpdateUretimRota;
end;

procedure TAppRuleUretimRotaKaynakCustom.DoAfterPost(Table: TAppCustomTable);
begin
  inherited;
  UpdateUretimRota;
end;

procedure TAppRuleUretimRotaKaynakCustom.DoBeforeDelete(Table: TAppCustomTable);
begin
  inherited;
  PrepareDataForUretimRota(True);
end;

procedure TAppRuleUretimRotaKaynakCustom.DoBeforeEdit(Table: TAppCustomTable);
begin
  inherited;
  CheckUretimRota;
end;

procedure TAppRuleUretimRotaKaynakCustom.DoBeforeInsert(Table: TAppCustomTable);
begin
  inherited;
  CheckUretimRota;
end;

procedure TAppRuleUretimRotaKaynakCustom.DoBeforePost(Table: TAppCustomTable);
begin
  if FdcUretimKart.FTableUretimRotaKaynakOperasyon.IsEmpty then // Boþ deðilse zaten elle deðiþikliðe izin vermiyorum.
  begin
    if FdcUretimKart.FTableUretimKart.UretimDurum in [Integer(udPlanned), Integer(udFirmPlanned)] then
    begin
      if not (FTableUretimRotaKaynak.OpDurum in [odNone, odCanceled]) then
        raise Exception.Create('Atanan operasyon durumu uygun deðil.');
    end
    else if FdcUretimKart.FTableUretimKart.UretimDurum = Integer(udReleased) then
    begin
      if not (FTableUretimRotaKaynak.OpDurum in [odNone, odReleased, odCanceled]) then
        raise Exception.Create('Atanan operasyon durumu uygun deðil.');
    end;
  end;

  inherited;
  PrepareDataForUretimRota(False);
end;

procedure TAppRuleUretimRotaKaynakCustom.DoOnAllowDeleting(
  Table: TAppCustomTable; var Allow: Boolean);
begin
  inherited;
  Allow := (FdcUretimKart.FTableUretimKart.UretimDurum in [Integer(udPlanned), Integer(udFirmPlanned), Integer(udReleased)]) and FdcUretimKart.FTableUretimRotaKaynakOperasyon.IsEmpty;
end;

procedure TAppRuleUretimRotaKaynakCustom.DoOnAllowEditing(
  Table: TAppCustomTable; Field: TField; var Allow: Boolean);
begin
  inherited;
  Allow := (FdcUretimKart.FTableUretimKart.UretimDurum in [Integer(udPlanned), Integer(udFirmPlanned), Integer(udReleased)]) and FdcUretimKart.FTableUretimRotaKaynakOperasyon.IsEmpty;
end;

procedure TAppRuleUretimRotaKaynakCustom.DoOnAllowInserting(
  Table: TAppCustomTable; var Allow: Boolean);
begin
  inherited;
  Allow := FdcUretimKart.FTableUretimKart.UretimDurum in [Integer(udPlanned), Integer(udFirmPlanned), Integer(udReleased)];
end;

procedure TAppRuleUretimRotaKaynakCustom.DoOnNewRecord(Table: TAppCustomTable);
begin
  inherited;
  FTableUretimRotaKaynak.OpDurum := odReleased;
end;

procedure TAppRuleUretimRotaKaynakCustom.PrepareDataForUretimRota(Deleting: Boolean);
var
  pOperated, pHasKaynakInAction: Boolean;
  pOperasyonNo, pOpDurum: Smallint;
  pKaynakKod: String;
  pOpMiktar, pOpFireMiktar, pOpSure: Double;
  pOpBasTarih, pOpBasTarihSaat, pOpBitTarih, pOpBitTarihSaat: TDateTime;
  pRotaSerbestMiktar: Double;
begin
  // Serbest miktar alaný sonradan eklendi geçici olarak sýfýr ise miktarý al, ileride bunu kaldýr direk serbest miktarý al
  if FdcUretimKart.FTableUretimRota.SerbestMiktar = 0 then
    pRotaSerbestMiktar := FdcUretimKart.FTableUretimRota.Miktar
  else
    pRotaSerbestMiktar := FdcUretimKart.FTableUretimRota.SerbestMiktar;

  pOperasyonNo := FdcUretimKart.FTableUretimRotaKaynak.OperasyonNo;
  pKaynakKod := FdcUretimKart.FTableUretimRotaKaynak.KaynakKod;
  pOpMiktar := FdcUretimKart.FTableUretimRotaKaynak.OpMiktar;
  pOpFireMiktar := FdcUretimKart.FTableUretimRotaKaynak.OpFireMiktar;
  pOpSure := FdcUretimKart.FTableUretimRotaKaynak.OpSure;
  pOpBasTarih := FdcUretimKart.FTableUretimRotaKaynak.OpBasTarih;
  pOpBasTarihSaat := FdcUretimKart.FTableUretimRotaKaynak.OpBasTarihSaat;
  pOpBitTarih := FdcUretimKart.FTableUretimRotaKaynak.OpBitTarih;
  pOpBitTarihSaat := FdcUretimKart.FTableUretimRotaKaynak.OpBitTarihSaat;
  pOpDurum := FdcUretimKart.FTableUretimRotaKaynak.OpDurum;

  pFirstOpBasTarih := 2;
  pFirstOpBasTarihSaat := 2;
  pLastOpBitTarih := 2;
  pLastOpBitTarihSaat := 2;
  pTotalOpMiktar := 0;
  pTotalOpFireMiktar := 0;
  pTotalOpSure := 0;
  pOperated := False;
  pHasKaynakInAction := False;
  FdcUretimKart.FTableUretimRotaKaynakClone.SetRange([pOperasyonNo], [pOperasyonNo]);
  FdcUretimKart.FTableUretimRotaKaynakClone.First;
  while not FdcUretimKart.FTableUretimRotaKaynakClone.Eof do
  begin
    if FdcUretimKart.FTableUretimRotaKaynakClone.KaynakKod <> pKaynakKod then
    begin
      if (pFirstOpBasTarihSaat = 2) or (pFirstOpBasTarihSaat > FdcUretimKart.FTableUretimRotaKaynakClone.OpBasTarihSaat) then
      begin
        pFirstOpBasTarih := FdcUretimKart.FTableUretimRotaKaynakClone.OpBasTarih;
        pFirstOpBasTarihSaat := FdcUretimKart.FTableUretimRotaKaynakClone.OpBasTarihSaat;
      end;
      if pLastOpBitTarihSaat < FdcUretimKart.FTableUretimRotaKaynakClone.OpBitTarihSaat then
      begin
        pLastOpBitTarih := FdcUretimKart.FTableUretimRotaKaynakClone.OpBitTarih;
        pLastOpBitTarihSaat := FdcUretimKart.FTableUretimRotaKaynakClone.OpBitTarihSaat;
      end;
      pOperated := pOperated or (FdcUretimKart.FTableUretimRotaKaynakClone.OpDurum in [odStarted, odFinished]);
      pHasKaynakInAction := pHasKaynakInAction or (FdcUretimKart.FTableUretimRotaKaynakClone.OpDurum = odStarted);
      pTotalOpMiktar := pTotalOpMiktar + FdcUretimKart.FTableUretimRotaKaynakClone.OpMiktar;
      pTotalOpFireMiktar := pTotalOpFireMiktar + FdcUretimKart.FTableUretimRotaKaynakClone.OpFireMiktar;
      pTotalOpSure := pTotalOpSure + FdcUretimKart.FTableUretimRotaKaynakClone.OpSure;
    end;
    FdcUretimKart.FTableUretimRotaKaynakClone.Next;
  end;
  if not Deleting then
  begin
    if (pFirstOpBasTarihSaat = 2) or (pFirstOpBasTarihSaat > pOpBasTarihSaat) then
    begin
      pFirstOpBasTarih := pOpBasTarih;
      pFirstOpBasTarihSaat := pOpBasTarihSaat;
    end;
    if pLastOpBitTarihSaat < pOpBitTarihSaat then
    begin
      pLastOpBitTarih := pOpBitTarih;
      pLastOpBitTarihSaat := pOpBitTarihSaat;
    end;
    pOperated := pOperated or (pOpDurum in [odStarted, odFinished]);
    pHasKaynakInAction := pHasKaynakInAction or (pOpDurum = odStarted);
    pTotalOpMiktar := pTotalOpMiktar + pOpMiktar;
    pTotalOpFireMiktar := pTotalOpFireMiktar + pOpFireMiktar;
    pTotalOpSure := pTotalOpSure + pOpSure;
  end;

  if not pOperated then
    pRotaOpDurum := odReleased
  else if pHasKaynakInAction or (pRotaSerbestMiktar - pTotalOpMiktar - pTotalOpFireMiktar > 0.00001 ) then
    pRotaOpDurum := odStarted
  else
    pRotaOpDurum := odFinished;
end;

procedure TAppRuleUretimRotaKaynakCustom.UpdateUretimRota;
var
  ABookMark: TAppBookMark;
begin
  ABookMark := FdcUretimKart.FTableUretimRota.GetBookmark;
  try
    if not (FdcUretimKart.FTableUretimRota.State in dsEditModes) then
      FdcUretimKart.FTableUretimRota.Edit;
    if FdcUretimKart.FTableUretimRota.OpBasTarih <> pFirstOpBasTarih then
      FdcUretimKart.FTableUretimRota.OpBasTarih := pFirstOpBasTarih;
    if FdcUretimKart.FTableUretimRota.OpBasTarihSaat <> pFirstOpBasTarihSaat then
      FdcUretimKart.FTableUretimRota.OpBasTarihSaat := pFirstOpBasTarihSaat;
    if FdcUretimKart.FTableUretimRota.OpBitTarih <> pLastOpBitTarih then
      FdcUretimKart.FTableUretimRota.OpBitTarih := pLastOpBitTarih;
    if FdcUretimKart.FTableUretimRota.OpBitTarihSaat <> pLastOpBitTarihSaat then
      FdcUretimKart.FTableUretimRota.OpBitTarihSaat := pLastOpBitTarihSaat;
    if FdcUretimKart.FTableUretimRota.OpMiktar <> pTotalOpMiktar then
      FdcUretimKart.FTableUretimRota.OpMiktar := pTotalOpMiktar;
    if FdcUretimKart.FTableUretimRota.OpFireMiktar <> pTotalOpFireMiktar then
      FdcUretimKart.FTableUretimRota.OpFireMiktar := pTotalOpFireMiktar;
    if FdcUretimKart.FTableUretimRota.OpSure <> pTotalOpSure then
      FdcUretimKart.FTableUretimRota.OpSure := pTotalOpSure;
    if FdcUretimKart.FTableUretimRota.OpDurum <> pRotaOpDurum then
      FdcUretimKart.FTableUretimRota.OpDurum := pRotaOpDurum;
    FdcUretimKart.FTableUretimRota.Post;
  finally
    try
      FdcUretimKart.FTableUretimRota.GotoBookmark(ABookMark);
      FdcUretimKart.FTableUretimRota.FreeBookmark(ABookMark);
    except
    end;
  end;
end;

{ TAppRuleUretimRotaKaynakOperasyonCustom }

procedure TAppRuleUretimRotaKaynakOperasyonCustom.CheckUretimKaynak;
begin
  if FdcUretimKart.FTableUretimKart.UretimDurum <> Integer(udReleased) then
    raise Exception.Create('Sadece serbest býrakýlmýþ üretim emirlerine operasyon girilebilir');
  if FdcUretimKart.FTableUretimRotaKaynak.IsEmpty then
    raise Exception.Create('Üretim rota kaynaðý yok, operasyon giriþi yapamazsýnýz!');
  if FdcUretimKart.FTableUretimRotaKaynak.OpDurum = odCanceled then
    raise Exception.Create('Bu kaynaða operasyon giremezsiniz, önce kaynaðý aktifleþtirmelisiniz!');
end;

constructor TAppRuleUretimRotaKaynakOperasyonCustom.Create(
  AOwner: TAppDataControllerUretimKart);
begin
  inherited Create;
  FdcUretimKart := AOwner;

  FTableUretimRotaKaynakOperasyon := FdcUretimKart.FTableUretimRotaKaynakOperasyon;
  FTableUretimRotaKaynakOperasyon.DataEvents.AddRule(Self);
end;

procedure TAppRuleUretimRotaKaynakOperasyonCustom.DoOnNewRecord(
  Table: TAppCustomTable);
begin
  inherited;
  FTableUretimRotaKaynakOperasyon.Miktar := FdcUretimKart.FTableUretimRotaKaynak.SerbestMiktar - FdcUretimKart.FTableUretimRotaKaynak.OpMiktar;
end;

procedure TAppRuleUretimRotaKaynakOperasyonCustom.PrepareDataForUretimKaynak(Deleting: Boolean);
var
  pOperated: Boolean;
  pKaynakKod: String;
  pSure: Double;
  pBasTarihSaat, pBitTarihSaat: TDateTime;
  pKaynakSerbestMiktar: Double;
begin
  // Serbest miktar alaný sonradan eklendi geçici olarak sýfýr ise miktarý al, ileride bunu kaldýr direk serbest miktarý al
  if FdcUretimKart.FTableUretimRotaKaynak.SerbestMiktar = 0 then
    pKaynakSerbestMiktar := FdcUretimKart.FTableUretimRotaKaynak.Miktar
  else
    pKaynakSerbestMiktar := FdcUretimKart.FTableUretimRotaKaynak.SerbestMiktar;

  pDataSetState := FTableUretimRotaKaynakOperasyon.State;
  pOperasyonNo := FTableUretimRotaKaynakOperasyon.OperasyonNo;
  pKaynakKod := FTableUretimRotaKaynakOperasyon.KaynakKod;
  pSiraNo := FTableUretimRotaKaynakOperasyon.SiraNo;
  pMiktar := FTableUretimRotaKaynakOperasyon.Miktar;
  pFireMiktar := FTableUretimRotaKaynakOperasyon.FireMiktar;
  pSure := FTableUretimRotaKaynakOperasyon.Sure;
  pBasTarih := FTableUretimRotaKaynakOperasyon.BasTarih;
  pBasTarihSaat := FTableUretimRotaKaynakOperasyon.BasTarihSaat;
  pBitTarih := FTableUretimRotaKaynakOperasyon.BitTarih;
  pBitTarihSaat := FTableUretimRotaKaynakOperasyon.BitTarihSaat;
  pDurum := FTableUretimRotaKaynakOperasyon.Durum;
  pKayitDurum := FTableUretimRotaKaynakOperasyon.KayitDurum;

  pFirstOpBasTarih := 2;
  pFirstOpBasTarihSaat := 2;
  pLastOpBitTarih := 2;
  pLastOpBitTarihSaat := 2;
  pLastOpDurum := 1;
  pTotalOpMiktar := 0;
  pTotalOpFireMiktar := 0;
  pTotalOpSure := 0;
  pOperated := False;
  FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.SetRange([pOperasyonNo, pKaynakKod], [pOperasyonNo, pKaynakKod]);
  FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.First;
  while not FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.Eof do
  begin
    if (FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.SiraNo <> pSiraNo) and (FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.KayitDurum = 1) then
    begin
      if (pFirstOpBasTarihSaat = 2) or (pFirstOpBasTarihSaat > FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.BasTarihSaat) then
      begin
        pFirstOpBasTarih := FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.BasTarih;
        pFirstOpBasTarihSaat := FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.BasTarihSaat;
      end;
      if pLastOpBitTarihSaat < FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.BitTarihSaat then
      begin
        pLastOpBitTarih := FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.BitTarih;
        pLastOpBitTarihSaat := FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.BitTarihSaat;
        pLastOpDurum := FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.Durum;
      end;
      pOperated := True;
      pTotalOpMiktar := pTotalOpMiktar + FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.Miktar;
      pTotalOpFireMiktar := pTotalOpFireMiktar + FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.FireMiktar;
      pTotalOpSure := pTotalOpSure + FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.Sure;
    end;
    FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.Next;
  end;
  if not FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.IsEmpty then
  begin
    if FdcUretimKart.FTableUretimRotaKaynakOperasyon.State = dsInsert then // Insert için tarih bir önceki tarihden sonra mý kontrolü
    begin
      if FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.Durum = 0 then
        raise Exception.Create('Bir önceki operasyon tamamlanmadan sonraki operasyona baþlanamaz!');
    end else // edit ve delete
    begin
      if FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.SiraNo <> pSiraNo then
        raise Exception.Create('Sadece son kayýtda deðiþiklik yapýlabilir!'); // Þimdilik, ileride otomatik güncelleme yazmam lazým, tabi otomatik güncellemede kaynak update eden koduda düzeltmeyi unutma
    end;
    if FdcUretimKart.FTableUretimRotaKaynakOperasyon.State in dsEditModes then
    begin
      if pBasTarihSaat < pLastOpBitTarihSaat then
        raise Exception.Create('Baþlangýç zamaný, bir önceki operasyonun bitiþ zamanýndan sonra olmalý!'); // Veysel tarafýndan kaldýrýldý. demolarda sorun veriyor.
    end;
  end;
  if (not Deleting) and (pKayitDurum = 1) then
  begin
    if (pFirstOpBasTarihSaat = 2) or (pFirstOpBasTarihSaat > pBasTarihSaat) then
    begin
      pFirstOpBasTarih := pBasTarih;
      pFirstOpBasTarihSaat := pBasTarihSaat;
    end;
    if pLastOpBitTarihSaat < pBitTarihSaat then
    begin
      pLastOpBitTarih := pBitTarih;
      pLastOpBitTarihSaat := pBitTarihSaat;
      pLastOpDurum := pDurum;
    end;
    pOperated := True;
    pTotalOpMiktar := pTotalOpMiktar + pMiktar;
    pTotalOpFireMiktar := pTotalOpFireMiktar + pFireMiktar;
    pTotalOpSure := pTotalOpSure + pSure;
  end;

  if not pOperated then
    pKaynakOpDurum := odReleased
  else if (pLastOpDurum = 0) or (pKaynakSerbestMiktar - pTotalOpMiktar - pTotalOpFireMiktar > 0.00001 ) then
    pKaynakOpDurum := odStarted
  else
    pKaynakOpDurum := odFinished;

  if pKaynakOpDurum <> odFinished then
  begin
    pLastOpBitTarih := 2;
    pLastOpBitTarihSaat := 2;
  end;

  KayýtDurumChanged := pOldKayitDurum <> FTableUretimRotaKaynakOperasyon.KayitDurum;
  DurumChanged := pOldDurum <> FTableUretimRotaKaynakOperasyon.Durum;
  MiktarChanged := (pOldMiktar <> FTableUretimRotaKaynakOperasyon.Miktar) or (pOldFireMiktar <> FTableUretimRotaKaynakOperasyon.FireMiktar);
  BasTarihChanged := pOldBasTarih <> FTableUretimRotaKaynakOperasyon.BasTarih;
  BitTarihChanged := pOldBitTarih <> FTableUretimRotaKaynakOperasyon.BitTarih;
end;

procedure TAppRuleUretimRotaKaynakOperasyonCustom.DoAfterDelete(
  Table: TAppCustomTable);
begin
  inherited;
  UpdateUretimKaynak;

  FdcUretimKart.AddAutoBaglanti(ousDelete, otForward, pOperasyonNo, pSiraNo); // Ýleri Baðlantý yapýlmýþsa Sil
  FdcUretimKart.AddAutoBaglanti(ousDelete, otBackward, pOperasyonNo, pSiraNo); // Geri Baðlantý yapýlmýþsa Sil
end;

procedure TAppRuleUretimRotaKaynakOperasyonCustom.DoAfterPost(
  Table: TAppCustomTable);
begin
  inherited;
  UpdateUretimKaynak;

  // Update Forward AutoBaglanti Records
  if pKayitDurum <> 1 then
    FdcUretimKart.AddAutoBaglanti(ousDelete, otForward, pOperasyonNo, pSiraNo)
  else if (pDataSetState = dsEdit) and (BasTarihChanged) then
    FdcUretimKart.AddAutoBaglanti(ousUpdate, otForward, pOperasyonNo, pSiraNo, pBasTarih) // Ýleri Baðlantý yapýlmýþsa sil ve yeniden ekle
  else if (pDataSetState = dsInsert) or (KayýtDurumChanged) then
    FdcUretimKart.AddAutoBaglanti(ousInsert, otForward, pOperasyonNo, pSiraNo, pBasTarih); // Ýleri Baðlantý ekle

  // Update Backward AutoBaglanti Records
  if (pKayitDurum <> 1) or (pDurum = 0) then // Operasyon Tamamlanmadý ise
    FdcUretimKart.AddAutoBaglanti(ousDelete, otBackward, pOperasyonNo, pSiraNo) // Geri Baðlantý yapýlmýþsa sil
  else if (pDataSetState = dsEdit) and (MiktarChanged or BitTarihChanged) then
    FdcUretimKart.AddAutoBaglanti(ousUpdate, otBackward, pOperasyonNo, pSiraNo, pBitTarih, pMiktar, pFireMiktar) // // Geri Baðlantý yapýlmýþsa sil ve yeniden ekle
  else if (pDataSetState = dsInsert) or (KayýtDurumChanged or DurumChanged) then
    FdcUretimKart.AddAutoBaglanti(ousInsert, otBackward, pOperasyonNo, pSiraNo, pBitTarih, pMiktar, pFireMiktar); // Geri Baðlantý ekle
end;

procedure TAppRuleUretimRotaKaynakOperasyonCustom.DoBeforeDelete(
  Table: TAppCustomTable);
begin
  inherited;
  CheckUretimKaynak;

  PrepareDataForUretimKaynak(True);
end;

procedure TAppRuleUretimRotaKaynakOperasyonCustom.DoBeforeEdit(
  Table: TAppCustomTable);
begin
  inherited;
  CheckUretimKaynak;
  pOldKayitDurum := FTableUretimRotaKaynakOperasyon.KayitDurum;
  pOldDurum := FTableUretimRotaKaynakOperasyon.Durum;
  pOldMiktar := FTableUretimRotaKaynakOperasyon.Miktar;
  pOldFireMiktar := FTableUretimRotaKaynakOperasyon.FireMiktar;
  pOldBasTarih := FTableUretimRotaKaynakOperasyon.BasTarih;
  pOldBitTarih := FTableUretimRotaKaynakOperasyon.BitTarih;
end;

procedure TAppRuleUretimRotaKaynakOperasyonCustom.DoBeforeInsert(
  Table: TAppCustomTable);
begin
  inherited;
  CheckUretimKaynak;
  pOldKayitDurum := 0;
  pOldDurum := 0;
  pOldMiktar := 0;
  pOldFireMiktar := 0;
  pOldBasTarih := 2;
  pOldBitTarih := 2;
end;

procedure TAppRuleUretimRotaKaynakOperasyonCustom.UpdateUretimKaynak;
var
  ABookMark: TAppBookMark;
begin
  ABookMark := FdcUretimKart.FTableUretimRotaKaynak.GetBookmark;
  try
    if FdcUretimKart.FTableUretimRotaKaynak.State in dsEditModes then
      FdcUretimKart.FTableUretimRotaKaynak.Post;

    FdcUretimKart.FTableUretimRotaKaynak.Edit;
    if FdcUretimKart.FTableUretimRotaKaynak.OpBasTarih <> pFirstOpBasTarih then
      FdcUretimKart.FTableUretimRotaKaynak.OpBasTarih := pFirstOpBasTarih;
    if FdcUretimKart.FTableUretimRotaKaynak.OpBasTarihSaat <> pFirstOpBasTarihSaat then
      FdcUretimKart.FTableUretimRotaKaynak.OpBasTarihSaat := pFirstOpBasTarihSaat;
    if FdcUretimKart.FTableUretimRotaKaynak.OpBitTarih <> pLastOpBitTarih then
      FdcUretimKart.FTableUretimRotaKaynak.OpBitTarih := pLastOpBitTarih;
    if FdcUretimKart.FTableUretimRotaKaynak.OpBitTarihSaat <> pLastOpBitTarihSaat then
      FdcUretimKart.FTableUretimRotaKaynak.OpBitTarihSaat := pLastOpBitTarihSaat;
    if FdcUretimKart.FTableUretimRotaKaynak.OpMiktar <> pTotalOpMiktar then
      FdcUretimKart.FTableUretimRotaKaynak.OpMiktar := pTotalOpMiktar;
    if FdcUretimKart.FTableUretimRotaKaynak.OpFireMiktar <> pTotalOpFireMiktar then
      FdcUretimKart.FTableUretimRotaKaynak.OpFireMiktar := pTotalOpFireMiktar;
    if FdcUretimKart.FTableUretimRotaKaynak.OpSure <> pTotalOpSure then
      FdcUretimKart.FTableUretimRotaKaynak.OpSure := pTotalOpSure;
    if FdcUretimKart.FTableUretimRotaKaynak.OpDurum <> pKaynakOpDurum then
      FdcUretimKart.FTableUretimRotaKaynak.OpDurum := pKaynakOpDurum;
    FdcUretimKart.FTableUretimRotaKaynak.Post;
  finally
    try
      FdcUretimKart.FTableUretimRotaKaynak.GotoBookmark(ABookMark);
      FdcUretimKart.FTableUretimRotaKaynak.FreeBookmark(ABookMark);
    except
    end;
  end;
end;

procedure TAppRuleUretimRotaKaynakOperasyonCustom.DoBeforePost(
  Table: TAppCustomTable);
begin
  inherited;
  if FTableUretimRotaKaynakOperasyon.Durum = 1 then
  begin
    if FTableUretimRotaKaynakOperasyon.EvrakBirim = '' then
      raise Exception.Create('Evrak Birim boþ olamaz!');
    if FTableUretimRotaKaynakOperasyon.BasTarihSaat < FdcUretimKart.FTableUretimRota.SerbestTarihSaat then
      raise Exception.Create(Format('Baþlangýç zamaný, %s den önce olamaz!',[DateTimeToStr(FdcUretimKart.FTableUretimRota.SerbestTarihSaat)]));
    if FTableUretimRotaKaynakOperasyon.BitTarihSaat <= FTableUretimRotaKaynakOperasyon.BasTarihSaat then // Terminal Veriþ Giriþ Demo Sunumlarý esnasýnda sorun olabildiði için geçici olarak kaldýrýldý. Antalya sunumundan sonra tekrar eklenecek ya da dakika kontrolünden çýkýlýp saniye kontrolüne geçilecek. 11.05.2014 Veysel
      raise Exception.Create('Bitiþ zamaný, baþlangýç zamanýndan sonra olmalý!');
    if FTableUretimRotaKaynakOperasyon.MekanikSaatBas > 0 then // Mekanik Saat Kullanýlýyor ise
      if FTableUretimRotaKaynakOperasyon.MekanikSaatBit <= FTableUretimRotaKaynakOperasyon.MekanikSaatBas then
        raise Exception.Create('Mekanik bitiþ zamaný, mekanik baþlangýç zamanýndan sonra olmalý!');
  end;

  PrepareDataForUretimKaynak(False);
end;

{ TAppDataControllerUretimKart }

constructor TAppDataControllerUretimKart.Create(
  AOwner: TAppDataControllerCustomCommon;
  ATableUretimKart: TTableUretimKart;
  ATableUretimRota: TTableUretimRota;
  ATableUretimRotaKaynak: TTableUretimRotaKaynak;
  ATableUretimRotaKaynakIslem: TTableUretimRotaKaynakIslem;
  ATableUretimRotaKaynakOperasyon: TTableUretimRotaKaynakOperasyon;
  ATableUretimSiparisHareket: TTableStokHareket;
  ATableUretimEvrakBaslik: TTableEvrakBaslik;
  ATableUretimStokHareket: TTableStokHareket;
  ATableUretimStokHareketTeknik: TTableStokTeknik;
  ATableUretimStokHareketUretim: TTableStokUretim;
  ATableUretimEvrakKaynak: TTableEvrakKaynak;
  ATableUretimSeriKart: TTableSeriKart);
begin
  // Create Objects
  FdcCommon := AOwner;
  FdcLotKapat := TAppDataControllerCustomLotKapat.Create(AOwner);
  FdcLotKapat.TableStokHareket := ATableUretimStokHareket;

  // Set Tables
  FTableUretimKart := ATableUretimKart;

  FTableUretimRota := ATableUretimRota;
  FTableUretimRotaClone := TTableUretimRota.Create(nil);
  FTableUretimRota.AddClone(FTableUretimRotaClone);
  FTableUretimRotaClone.IndexFieldNames := 'OPERASYONNO';

  FTableUretimRotaKaynak := ATableUretimRotaKaynak;
  FTableUretimRotaKaynakClone := TTableUretimRotaKaynak.Create(nil);
  FTableUretimRotaKaynak.AddClone(FTableUretimRotaKaynakClone);
  FTableUretimRotaKaynakClone.IndexFieldNames := 'OPERASYONNO;KAYNAKKOD';

  FTableUretimRotaKaynakIslem := ATableUretimRotaKaynakIslem;

  FTableUretimRotaKaynakOperasyon := ATableUretimRotaKaynakOperasyon;
  FTableUretimRotaKaynakOperasyonClone := TTableUretimRotaKaynakOperasyon.Create(nil);
  FTableUretimRotaKaynakOperasyon.AddClone(FTableUretimRotaKaynakOperasyonClone);
  FTableUretimRotaKaynakOperasyonClone.IndexFieldNames := 'OPERASYONNO;KAYNAKKOD;SIRANO';

  FTableUretimSiparisHareket := ATableUretimSiparisHareket;
  FTableUretimSiparisHareketClone := TTableStokHareket.Create(nil);
  FTableUretimSiparisHareket.AddClone(FTableUretimSiparisHareketClone);
  FTableUretimSiparisHareketClone.IndexFieldNames := 'GIRISCIKIS;STHURT_OPERASYONNO;SIRANO';

  FTableUretimEvrakBaslik := ATableUretimEvrakBaslik;

  FTableUretimStokHareket := ATableUretimStokHareket;
  FTableUretimStokHareketClone := TTableStokHareket.Create(nil);
  FTableUretimStokHareket.AddClone(FTableUretimStokHareketClone);

  FTableUretimStokHareketTeknik := ATableUretimStokHareketTeknik;
  FTableUretimStokHareketUretim := ATableUretimStokHareketUretim;

  FTableUretimEvrakKaynak := ATableUretimEvrakKaynak;
  FTableUretimEvrakKaynakClone := TTableEvrakKaynak.Create(nil);
  FTableUretimEvrakKaynak.AddClone(FTableUretimEvrakKaynakClone);
  FTableUretimEvrakKaynakClone.IndexFieldNames := 'KAYNAKSIRANO';

  FTableUretimSeriKart := ATableUretimSeriKart;

  // Create Rules
  FRuleUretimKartCustom := TAppRuleUretimKartCustom.Create(Self);
  FRuleUretimRotaCustom := TAppRuleUretimRotaCustom.Create(Self);
  FRuleUretimRotaKaynakCustom := TAppRuleUretimRotaKaynakCustom.Create(Self);
  FRuleUretimRotaKaynakOperasyonCustom := TAppRuleUretimRotaKaynakOperasyonCustom.Create(Self);
  FRuleUretimStokHareketCustom := TAppRuleUretimStokHareketCustom.Create(Self);
end;

destructor TAppDataControllerUretimKart.Destroy;
begin
  if FRuleUretimKartCustom <> nil then
    FreeAndNil(FRuleUretimKartCustom);
  if FRuleUretimRotaCustom <> nil then
    FreeAndNil(FRuleUretimRotaCustom);
  if FRuleUretimRotaKaynakCustom <> nil then
    FreeAndNil(FRuleUretimRotaKaynakCustom);
  if FRuleUretimRotaKaynakOperasyonCustom <> nil then
    FreeAndNil(FRuleUretimRotaKaynakOperasyonCustom);
  if FRuleUretimStokHareketCustom <> nil then
    FreeAndNil(FRuleUretimStokHareketCustom);

  FTableUretimRotaClone := TTableUretimRota.Create(nil);

  FreeAndNil(FTableUretimRotaKaynakClone);
  FreeAndNil(FTableUretimRotaKaynakOperasyonClone);
  FreeAndNil(FTableUretimSiparisHareketClone);
  FreeAndNil(FTableUretimStokHareketClone);
  FreeAndNil(FTableUretimEvrakKaynakClone);

  FreeAndNil(FdcLotKapat);
  inherited;
end;

procedure TAppDataControllerUretimKart.AddStokHareket(ATableSiparisHareket: TTableStokHareket; AOperasyonType: TAppOpType; AOperasyonNo, AOperasyonSiraNo: Integer; AIrsaliyeNo: String; AIrsaliyeTarih: TDateTime; AMiktar: Double);
var
  AReceteKaynakTip: TAppReceteKaynakTip;

  procedure InsertEvrakBaslik;
  begin
    if not FTableUretimEvrakBaslik.IsEmpty then
      Exit;
    FTableUretimEvrakBaslik.Insert;
    FTableUretimEvrakBaslik.KayitTur := 1;
    FTableUretimEvrakBaslik.KayitDurum := 1;
    FTableUretimEvrakBaslik.SirketNo := ATableSiparisHareket.SirketNo;
    FTableUretimEvrakBaslik.EvrakTip := aetUretim;
    FTableUretimEvrakBaslik.HesapKod := ATableSiparisHareket.HesapKod;
    FTableUretimEvrakBaslik.EvrakNo := ATableSiparisHareket.SiparisNo;
    FTableUretimEvrakBaslik.EvrakTarih := AIrsaliyeTarih;
    FTableUretimEvrakBaslik.EvrakSekli := ATableSiparisHareket.EvrakSekli;
//    FTableUretimEvrakBaslik.EvrakTarih := ATableSiparisHareket.SiparisTarih; // Kimteksteki istek nedeniyle deðiþtirildi.
    FTableUretimEvrakBaslik.Post;
  end;

  procedure InsertEvrakKaynak;
  begin
    FTableUretimEvrakKaynak.Insert;
    FTableUretimEvrakKaynak.Kapat := bagMiktarKapat;
    FTableUretimEvrakKaynak.Miktar := ATableSiparisHareket.Miktar;
    FTableUretimEvrakKaynak.KaynakEvrakTip := ATableSiparisHareket.EvrakTip;
    FTableUretimEvrakKaynak.KaynakHesapKod := ATableSiparisHareket.HesapKod;
    FTableUretimEvrakKaynak.KaynakEvrakNo := ATableSiparisHareket.EvrakNo;
    FTableUretimEvrakKaynak.KaynakSiraNo := ATableSiparisHareket.SiraNo;
    if ATableSiparisHareket.SonKaynakEvrakTip in [aetSatisSiparis, aetIhracatSiparis, aetServisSiparis] then // Baðlantý alanlarýný aktarýrken önceki evraklardan hangisi ilk özel kapat yapmýþ ise onu yazmam lazým ama vakit olmadýðý için buradan aldým, bi ara düzelteceðim
    begin
      FTableUretimEvrakKaynak.BaglantiEvrakTip := ATableSiparisHareket.EvrakTip;
      FTableUretimEvrakKaynak.BaglantiHesapKod := ATableSiparisHareket.HesapKod;
      FTableUretimEvrakKaynak.BaglantiEvrakNo := ATableSiparisHareket.EvrakNo;
      FTableUretimEvrakKaynak.BaglantiSiraNo := ATableSiparisHareket.SiraNo;
    end;
    FTableUretimEvrakKaynak.Post;
  end;

  procedure InsertStokHareket(ASeriNo, ASeriNo2: String; AIrsaliyeNo: String; AIrsaliyeTarih: TDateTime; AMiktar: Double);
  begin
    InsertEvrakBaslik;

    FTableUretimStokHareket.Insert; // Sýra No yu OnNewRecord da aldý, Evrak Üretim için sýrano ya müdahele ediyordum ama çoklu giriþ çýkýþlarda iþ karýþmaya baþladýðý için kaldýrdým

    FTableUretimStokHareket.MalTip := ATableSiparisHareket.MalTip;
    FTableUretimStokHareket.KayitTur := 1;
    FTableUretimStokHareket.KayitDurum := 1;
    FTableUretimStokHareket.MalKod := ATableSiparisHareket.MalKod;
    FTableUretimStokHareket.VersiyonNo := ATableSiparisHareket.VersiyonNo;
    FTableUretimStokHareket.SurumNo := ATableSiparisHareket.SurumNo;
    FTableUretimStokHareket.DepoKod := ATableSiparisHareket.DepoKod;

    FTableUretimStokHareket.IslemTip := shitUretim;
    FTableUretimStokHareket.GirisCikis := ATableSiparisHareket.GirisCikis;

    FTableUretimStokHareket.EvrakTarih := AIrsaliyeTarih; // Önemli: Evrak tarihi kýsýtlama parametrelerine takýlsýn, muhasebeye de bu tarihde aktarýlsýn diye hammadenin çýkýþ tarihini basýyoruz.
    FTableUretimStokHareket.SeriNo := ASeriNo;
    FTableUretimStokHareket.SeriNo2 := ASeriNo2;
    FTableUretimStokHareket.EvrakBirim := ATableSiparisHareket.EvrakBirim;
    FTableUretimStokHareket.BirimAgirlik := ATableSiparisHareket.BirimAgirlik;
    FTableUretimStokHareket.Miktar := AMiktar; // Evrak Miktar otomatik

    FTableUretimStokHareket.EvrakDovizCins := ATableSiparisHareket.EvrakDovizCins;
    FTableUretimStokHareket.CariDovizCins := ATableSiparisHareket.CariDovizCins;
    FTableUretimStokHareket.DovizCins := ATableSiparisHareket.DovizCins;
    FTableUretimStokHareket.FiyatSekli := ATableSiparisHareket.FiyatSekli;

    FTableUretimStokHareket.TeklifNo := ATableSiparisHareket.TeklifNo;
    FTableUretimStokHareket.TeklifTarih := ATableSiparisHareket.TeklifTarih;
    FTableUretimStokHareket.SiparisNo := ATableSiparisHareket.SiparisNo;
    FTableUretimStokHareket.SiparisTarih := ATableSiparisHareket.SiparisTarih;
    if AIrsaliyeNo <> '' then
      FTableUretimStokHareket.IrsaliyeNo := AIrsaliyeNo
    else
      FTableUretimStokHareket.IrsaliyeNo := ATableSiparisHareket.SiparisNo;
    FTableUretimStokHareket.IrsaliyeTarih := AIrsaliyeTarih;

    FTableUretimStokHareket.SonKaynakEvrakTip := ATableSiparisHareket.EvrakTip;
    FTableUretimStokHareket.SonKaynakHesapKod := ATableSiparisHareket.HesapKod;
    FTableUretimStokHareket.SonKaynakEvrakNo := ATableSiparisHareket.EvrakNo;
    FTableUretimStokHareket.SonKaynakSiraNo := ATableSiparisHareket.SiraNo;
    FTableUretimStokHareket.SonKaynakEvrakTarih := ATableSiparisHareket.EvrakTarih;

    FTableUretimStokHareket.YanUrunNo := ATableSiparisHareket.YanUrunNo;
    FTableUretimStokHareket.YanUrunMaliyetOran := ATableSiparisHareket.YanUrunMaliyetOran;
    FTableUretimStokHareket.OperasyonNo := AOperasyonNo;
    FTableUretimStokHareket.ReceteKaynakTip := Integer(AReceteKaynakTip);
    FTableUretimStokHareket.OperasyonSiraNo := AOperasyonSiraNo;

    InsertEvrakKaynak;

    FTableUretimStokHareket.Post;
  end;

var
  ASeriNo, ASeriNo2: String;
  ALotMiktar, ALotBoyut: Double;
  I, ACount: Integer;
begin
  if AOperasyonType = otForward then
    AReceteKaynakTip := rktAutoBaglantiIleri
  else if AOperasyonType = otBackward then
    AReceteKaynakTip := rktAutoBaglantiGeri
  else
    AReceteKaynakTip := rktBaglanti;

  if ATableSiparisHareket.GirisCikis = gctGiris then
  begin
    try
      ALotBoyut := ATableSiparisHareket.FieldValues['STKKRT_ALIMPARTIBUYUKLUK'];
      if ALotBoyut = 1 then // Parti Büyüklüðü 1 ise tek tek giriþ yapýlacak
        if AMiktar <> Trunc(AMiktar) then // Girilen miktar tam sayý deðilse taným hatasý vardýr, tek tek giriþ yapýlamaz
          ALotBoyut := 0;
    except on E:EConvertError do
      begin
        ALotBoyut := 0;
        AppShowMessage(E.Message);
      end;
    end;

    if ALotBoyut = 1 then
    begin
      ACount := Trunc(AMiktar);
      for I := 1 to ACount do
        InsertStokHareket(ATableSiparisHareket.SeriNo, ATableSiparisHareket.SeriNo2, AIrsaliyeNo, AIrsaliyeTarih, 1);
    end else
      InsertStokHareket(ATableSiparisHareket.SeriNo, ATableSiparisHareket.SeriNo2, AIrsaliyeNo, AIrsaliyeTarih, AMiktar);
  end else
  begin
    FdcLotKapat.GetLotMiktar(ATableSiparisHareket.MalKod, ATableSiparisHareket.VersiyonNo, ATableSiparisHareket.DepoKod, ATableSiparisHareket.SeriNo, ATableSiparisHareket.SeriNo2, AMiktar);

    FdcLotKapat.TableLot.First;
    while not FdcLotKapat.TableLot.Eof do
    begin
      ASeriNo := FdcLotKapat.TableLot.SeriNo;
      ASeriNo2 := FdcLotKapat.TableLot.SeriNo2;
      ALotMiktar := FdcLotKapat.TableLot.Kullanilabilir;

      InsertStokHareket(ASeriNo, ASeriNo2, AIrsaliyeNo, AIrsaliyeTarih, ALotMiktar);

      FdcLotKapat.TableLot.Next;
    end;
  end;
  ATableSiparisHareket.Edit;
  ATableSiparisHareket.KullanilanMiktar := ATableSiparisHareket.KullanilanMiktar + AMiktar;
  ATableSiparisHareket.KalanMiktar := ATableSiparisHareket.Miktar - ATableSiparisHareket.KullanilanMiktar + ATableSiparisHareket.FazlaSevk;
  ATableSiparisHareket.Post;
end;

procedure TAppDataControllerUretimKart.DeleteStokHareket(ATableSiparisHareket: TTableStokHareket; AOperasyonType: TAppOpType; AOperasyonNo, AOperasyonSiraNo: Integer);
var
  ADeleted: Boolean;
  ADeletingMiktar: Double;
  AReceteKaynakTip: TAppReceteKaynakTip;
begin
  if AOperasyonType = otForward then
    AReceteKaynakTip := rktAutoBaglantiIleri
  else if AOperasyonType = otBackward then
    AReceteKaynakTip := rktAutoBaglantiGeri
  else
    AReceteKaynakTip := rktBaglanti;

  ADeleted := False;
  ADeletingMiktar := 0;
  FTableUretimEvrakKaynakClone.SetRange([ATableSiparisHareket.SiraNo], [ATableSiparisHareket.SiraNo]);
  FTableUretimEvrakKaynakClone.First;
  while not FTableUretimEvrakKaynakClone.Eof do
  begin
    if FTableUretimStokHareket.FindKey([FTableUretimEvrakKaynakClone.SiraNo]) then
    begin
      if (FTableUretimStokHareket.ReceteKaynakTip in [Integer(AReceteKaynakTip), Integer(rktBaglanti)]) and // rktBaglanti direk olarak "üretim durumu serbest býrakýldýdan planlandýya geri alýndýðýnda" elle eklenenleri de silmesi için eklendi, diðer koþullar operasyon no ve operasyon sýrano kontrolüne takýlýr ve soruna neden olmaz zaten
      (FTableUretimStokHareket.OperasyonNo = AOperasyonNo) and
      (FTableUretimStokHareket.OperasyonSiraNo = AOperasyonSiraNo) then
      begin
        ADeleted := True;
        ADeletingMiktar := ADeletingMiktar + FTableUretimStokHareket.Miktar;
        FTableUretimStokHareket.Delete; // FTableUretimEvrakKaynakClone master detail olduðu için otomatik siliniyor
      end;
    end;
    if not ADeleted then
      FTableUretimEvrakKaynakClone.Next
    else
      ADeleted := False;
  end;
  if ADeletingMiktar > 0 then
  begin
    ATableSiparisHareket.Edit;
    ATableSiparisHareket.KullanilanMiktar := ATableSiparisHareket.KullanilanMiktar - ADeletingMiktar;
    ATableSiparisHareket.KalanMiktar := ATableSiparisHareket.Miktar - ATableSiparisHareket.KullanilanMiktar + ATableSiparisHareket.FazlaSevk;
    ATableSiparisHareket.Post;
  end;
end;

procedure TAppDataControllerUretimKart.AddManualBaglanti(AOpUpdateStatus: TAppOpUpdateStatus; AIrsaliyeNo: String; AIrsaliyeTarih: TDateTime; AMiktar: Double);
begin
  if AOpUpdateStatus = ousInsert then
    AddStokHareket(FTableUretimSiparisHareket, otNone, 0, 0, AIrsaliyeNo, AIrsaliyeTarih, AMiktar)
  else if AOpUpdateStatus = ousDelete then
    DeleteStokHareket(FTableUretimSiparisHareket, otNone, 0, 0);
end;

procedure TAppDataControllerUretimKart.AddAutoBaglanti(AOpUpdateStatus: TAppOpUpdateStatus; AOpType: TAppOpType; AOpNo, AOpSiraNo: Integer;
  const AOpTarih: TDateTime;
  const AOpMiktar, AOpFireMiktar: Double);
var
  DirectManufacturing: Boolean;

  procedure AddInAutoBaglanti(AGirisCikis: Smallint);
  var
    pSarfYontem: Smallint;
    pKalanMiktar, pAddingMiktar: Double;
  begin
    FTableUretimStokHareket.DisableControls;
    FTableUretimSiparisHareketClone.DisableControls;
    try
      if DirectManufacturing then // Üretim Durumu deðiþikliðinde tüm kayýtlarý tara
        FTableUretimSiparisHareketClone.SetRange([AGirisCikis], [AGirisCikis])
      else
        FTableUretimSiparisHareketClone.SetRange([AGirisCikis, AOpNo], [AGirisCikis, AOpNo]);
      FTableUretimSiparisHareketClone.First;
      while not FTableUretimSiparisHareketClone.Eof do
      begin
        if AOpUpdateStatus in [ousDelete, ousUpdate] then
          DeleteStokHareket(FTableUretimSiparisHareketClone, AOpType, AOpNo, AOpSiraNo);

        if (AOpUpdateStatus in [ousInsert, ousUpdate]) and (DirectManufacturing or (AOpNo = FTableUretimSiparisHareketClone.OperasyonNo)) then
        begin
          pKalanMiktar := FTableUretimSiparisHareketClone.Miktar - FTableUretimSiparisHareketClone.KullanilanMiktar + FTableUretimSiparisHareketClone.FazlaSevk;
          if pKalanMiktar > 0 then
          begin
            pAddingMiktar := 0;
            if FTableUretimSiparisHareketClone.GirisCikis = gctGiris then // Giriþler sadece backward iþlemlerinde üretilirler.
            begin
              if AOpType = otBackward then
              begin
                if FTableUretimSiparisHareketClone.MalTip = 5 then
                  pAddingMiktar := AOpMiktar
                else
                  pAddingMiktar := (FTableUretimSiparisHareketClone.Miktar / FTableUretimKart.Miktar) * (AOpMiktar + AOpFireMiktar); // Yan ürünlere operasyon miktarý kadar giriþ yapýlýr
              end;
            end else // Çýkýþlar sarf yöntemine göre tüketilirler...
            begin
              try
                pSarfYontem := FTableUretimSiparisHareketClone.FieldValues['STKKRT_SARFYONTEM'];
              except
                pSarfYontem := 0;
              end;

              if AOpType in [otForward] then
              begin
                if pSarfYontem in [Integer(syForward), Integer(syPickAndForward)] then // Forward da henüz tüketilmemiþ (manual tüketim yapýlmýþ olabilir) tüm hammadde tüketilir.
                  pAddingMiktar := pKalanMiktar;
              end
              else if AOpType = otBackward then
              begin
                if pSarfYontem in [Integer(syForward), Integer(syPickAndForward)] then // Forward da henüz tüketilmemiþ (manual tüketim yapýlmýþ olabilir) tüm hammadde tüketilir.
                  pAddingMiktar := pKalanMiktar
                else if pSarfYontem in [Integer(syBackward), Integer(syPickAndBackward)] then // Backward da operasyon miktarý kadar harcama yapýlýr
                  pAddingMiktar := (FTableUretimSiparisHareketClone.Miktar / FTableUretimKart.Miktar) * (AOpMiktar + AOpFireMiktar)
                else if (pSarfYontem in [Integer(syManual)]) and (AOpNo = 0) then // yani özetle üretim tamamlandý ise manüel tüketilecekler operasyon miktarýna göre tüketilir..
                begin
                  // Kimteks'de manüel tüketimlerin kalan kýsýmlarýnýn otomatik tüketilmesi sýkýntýya neden olduðu için kaldýrýldý.
                  // Ýleride baþka bir firma otomatik tüketilmesini isterse manüel tüketimlerin kapatýlýp kapatýlmayacaðý parametrik yapýlabilir
                  // pAddingMiktar := (FTableUretimSiparisHareketClone.Miktar / FTableUretimKart.Miktar) * (AOpMiktar + AOpFireMiktar);
                  // Bu uyarý da ileride parametrik yapýlabilir veya tamamen kaldýrýlabilir.
                  AppShowMessage(format('%s nolu hammaddenin sarf yöntemi elle(0) olup iþ emrinde bildirilen miktarýn tamamý tüketilmemiþtir. Bilginize...',[FTableUretimSiparisHareketClone.MalKod]));
                end;
              end
            end;
            if pAddingMiktar > 0 then
              AddStokHareket(FTableUretimSiparisHareketClone, AOpType, AOpNo, AOpSiraNo, '', AOpTarih, pAddingMiktar);
          end;
        end;
        FTableUretimSiparisHareketClone.Next;
      end;
    finally
      FTableUretimStokHareket.EnableControls;
      FTableUretimSiparisHareketClone.EnableControls;
    end;
  end;

begin
  DirectManufacturing := (AOpNo = 0) and (AOpType = otBackward) and (FTableUretimKart.OpDurum in [odNone, odReleased]);
  AddInAutoBaglanti(gctCikis); // Önce Çýkýþlarý Ekle
  AddInAutoBaglanti(gctGiris); // Sonra Giriþleri Ekle
end;

procedure TAppDataControllerUretimKart.OpenTables(SirketNo, KonsolideSirketNo, HesapKod, EvrakNo: String);
var
  ASqlStr: String;
begin
  // Open Üretim Sipariþ Hareket
  ASqlStr := format('STKHAR.SIRKETNO = ''%s'' AND STKHAR.KONSOLIDESIRKETNO = ''%s'' AND STKHAR.EVRAKTIP = %d AND STKHAR.HESAPKOD = ''%s'' AND STKHAR.SIPARISNO = ''%s''', [SirketNo, KonsolideSirketNo, aetUretimSiparis, HesapKod, EvrakNo]);
  with FTableUretimSiparisHareket do
  begin
    Close;
    TableItems[0].Where.DeleteWhere('dcUretimKart');
    if TableItems[0].Where.Clause = '' then
      TableItems[0].Where.AddText(ASqlStr, 'dcUretimKart')
    else
      TableItems[0].Where.AddAndText(ASqlStr, 'dcUretimKart');
    Open;
  end;

  // Open Üretim Evrak Baþlýk
  ASqlStr := format('EVRBAS.SIRKETNO = ''%s'' AND EVRBAS.KONSOLIDESIRKETNO = ''%s'' AND EVRBAS.EVRAKTIP = %d AND EVRBAS.HESAPKOD = ''%s'' AND EVRBAS.EVRAKNO = ''%s''', [SirketNo, KonsolideSirketNo, aetUretim, HesapKod, EvrakNo]);
  with FTableUretimEvrakBaslik do
  begin
    Close;
    TableItems[0].Where.DeleteWhere('dcUretimKart');
    if TableItems[0].Where.Clause = '' then
      TableItems[0].Where.AddText(ASqlStr, 'dcUretimKart')
    else
      TableItems[0].Where.AddAndText(ASqlStr, 'dcUretimKart');
    Open;
  end;

  // Open Üretim Stok Hareket
  ASqlStr := ReplaceText(ASqlStr, 'EVRBAS', 'STKHAR');
  with FTableUretimStokHareket do
  begin
    Close;
    TableItems[0].Where.DeleteWhere('dcUretimKart');
    if TableItems[0].Where.Clause = '' then
      TableItems[0].Where.AddText(ASqlStr, 'dcUretimKart')
    else
      TableItems[0].Where.AddAndText(ASqlStr, 'dcUretimKart');
    Open;
  end;

  // Open Üretim Stok Hareket Teknik
  ASqlStr := ReplaceText(ASqlStr, 'STKHAR', 'STHTKN');
  with FTableUretimStokHareketTeknik do
  begin
    Close;
    TableItems[0].Where.DeleteWhere('dcUretimKart');
    if TableItems[0].Where.Clause = '' then
      TableItems[0].Where.AddText(ASqlStr, 'dcUretimKart')
    else
      TableItems[0].Where.AddAndText(ASqlStr, 'dcUretimKart');
    Open;
  end;

  // Open Üretim Stok Hareket Üretim
  ASqlStr := ReplaceText(ASqlStr, 'STHTKN', 'STHURT');
  with FTableUretimStokHareketUretim do
  begin
    Close;
    TableItems[0].Where.DeleteWhere('dcUretimKart');
    if TableItems[0].Where.Clause = '' then
      TableItems[0].Where.AddText(ASqlStr, 'dcUretimKart')
    else
      TableItems[0].Where.AddAndText(ASqlStr, 'dcUretimKart');
    Open;
  end;

  // Open Üretim Stok Hareket Kaynak
  ASqlStr := ReplaceText(ASqlStr, 'STHURT', 'SHRKYN');
  with FTableUretimEvrakKaynak do
  begin
    Close;
    TableItems[0].Where.DeleteWhere('dcUretimKart');
    if TableItems[0].Where.Clause = '' then
      TableItems[0].Where.AddText(ASqlStr, 'dcUretimKart')
    else
      TableItems[0].Where.AddAndText(ASqlStr, 'dcUretimKart');
    Open;
  end;

  // Open Üretim Seri Kart
  ASqlStr := ReplaceText(ASqlStr, 'SHRKYN', 'STKHAR');
  with FTableUretimSeriKart do // SERKRT ye join edilmiþ olan STKHAR tablosuna where ekleniyor
  begin
    Close;
    TableItems[1].Where.DeleteWhere('dcUretimKart');
    if TableItems[1].Where.Clause = '' then
      TableItems[1].Where.AddText(ASqlStr, 'dcUretimKart')
    else
      TableItems[1].Where.AddAndText(ASqlStr, 'dcUretimKart');
    Open;
  end;
end;

procedure TAppDataControllerUretimKart.UpdateNextRoute(ANextOpNo: String; const ANextOpDurum: Smallint);
var
  OperasyonSerbestKalmaTip: Integer;
  PriorOps_IsFound, PriorOps_IsStarted, PriorOps_IsFinished: Boolean;
  PriorOps_MinReleasedQuantity: Double;
  PriorOps_MinStartDate, PriorOps_MinStartDateTime: TDateTime;
  PriorOps_MaxFinishDate, PriorOps_MaxFinishDateTime: TDateTime;
  KaynakDagitimMiktar: Double;
begin
  OperasyonSerbestKalmaTip := 0;

  PriorOps_IsFound := False;
  PriorOps_IsStarted := True;
  PriorOps_IsFinished := True;
  PriorOps_MinReleasedQuantity := -1;
  PriorOps_MinStartDate := AppFirstDate;
  PriorOps_MinStartDateTime := AppFirstDate;
  PriorOps_MaxFinishDate := AppFirstDate;
  PriorOps_MaxFinishDateTime := AppFirstDate;
  FTableUretimRotaClone.First;
  while not FTableUretimRotaClone.Eof do
  begin
    if FTableUretimRotaClone.SonrakiOperasyonNo = ANextOpNo then
    begin
      PriorOps_IsFound := True;
      PriorOps_IsStarted := PriorOps_IsStarted and (FTableUretimRotaClone.OpDurum <> odNone);
      PriorOps_IsFinished := PriorOps_IsFinished and (FTableUretimRotaClone.OpDurum = odFinished);
      if (PriorOps_MinReleasedQuantity = -1) or (PriorOps_MinReleasedQuantity > FTableUretimRotaClone.OpMiktar) then
        PriorOps_MinReleasedQuantity := FTableUretimRotaClone.OpMiktar;
      if (PriorOps_MinStartDateTime = AppFirstDate) or (PriorOps_MinStartDateTime > FTableUretimRotaClone.OpBasTarihSaat) then
      begin
        PriorOps_MinStartDate := FTableUretimRotaClone.OpBasTarih;
        PriorOps_MinStartDateTime := FTableUretimRotaClone.OpBasTarihSaat;
      end;
      if PriorOps_MaxFinishDateTime < FTableUretimRotaClone.OpBitTarihSaat then
      begin
        PriorOps_MaxFinishDate := FTableUretimRotaClone.OpBitTarih;
        PriorOps_MaxFinishDateTime := FTableUretimRotaClone.OpBitTarihSaat;
      end;
    end;
    FTableUretimRotaClone.Next;
  end;
  if not PriorOps_IsFound then // Önceki operasyon bulunamadý ise, yani ilk operasyonla ilgili iþlem yapýlmýþsa
  begin
    PriorOps_IsStarted := ANextOpDurum <> odNone;
    PriorOps_IsFinished := ANextOpDurum <> odNone;
    PriorOps_MinReleasedQuantity := FTableUretimKart.Miktar;
  end;

  FTableUretimRotaClone.First;
  while not FTableUretimRotaClone.Eof do
  begin
    if Pos(IntToStr(FTableUretimRotaClone.OperasyonNo), ANextOpNo) > 0 then
    begin
      // Update Next Rota
      FTableUretimRotaClone.Edit;
      if OperasyonSerbestKalmaTip = 0 then // Önceki operasyonlar tamamlandýðýnda baþlar
      begin
        if PriorOps_IsFinished then
        begin
          if not (FTableUretimRotaClone.OpDurum in [odReleased, odStarted, odFinished]) then
          begin
            FTableUretimRotaClone.OpDurum := odReleased;
            FTableUretimRotaClone.SerbestTarih := PriorOps_MaxFinishDate;
            FTableUretimRotaClone.SerbestTarihSaat := PriorOps_MaxFinishDateTime;
          end;
          FTableUretimRotaClone.SerbestMiktar := PriorOps_MinReleasedQuantity;
        end else // odNone yani beklemede
        begin
          if not (FTableUretimRotaClone.OpDurum in [odNone, odStarted, odFinished]) then
          begin
            FTableUretimRotaClone.OpDurum := odNone;
            FTableUretimRotaClone.SerbestTarih := AppFirstDate;
            FTableUretimRotaClone.SerbestTarihSaat := AppFirstDate;
            FTableUretimRotaClone.SerbestMiktar := 0;
          end;
        end;
      end
      else if OperasyonSerbestKalmaTip = 1 then // Önceki operasyon baþladýktan 10 dk sonra baþlar.
      begin
        if PriorOps_IsStarted then
        begin
          if not (FTableUretimRotaClone.OpDurum in [odReleased, odStarted, odFinished]) then
          begin
            FTableUretimRotaClone.OpDurum := odReleased;
            FTableUretimRotaClone.SerbestTarih := PriorOps_MinStartDate;
            FTableUretimRotaClone.SerbestTarihSaat := PriorOps_MinStartDateTime;
          end;
          FTableUretimRotaClone.SerbestMiktar := PriorOps_MinReleasedQuantity;
        end else // odNone yani beklemede
        begin
          if not (FTableUretimRotaClone.OpDurum in [odNone, odStarted, odFinished]) then
          begin
            FTableUretimRotaClone.OpDurum := odNone;
            FTableUretimRotaClone.SerbestTarih := AppFirstDate;
            FTableUretimRotaClone.SerbestTarihSaat := AppFirstDate;
            FTableUretimRotaClone.SerbestMiktar := 0;
          end;
        end;
      end;
      FTableUretimRotaClone.Post;

      // Update Next Rota Kaynak
      KaynakDagitimMiktar := FTableUretimRotaClone.SerbestMiktar;
      FTableUretimRotaKaynakClone.SetRange([FTableUretimRotaClone.OperasyonNo], [FTableUretimRotaClone.OperasyonNo]);
      FTableUretimRotaKaynakClone.First;
      while not FTableUretimRotaKaynakClone.Eof do
      begin
        FTableUretimRotaKaynakClone.Edit;
        if not (FTableUretimRotaKaynakClone.OpDurum in [FTableUretimRotaClone.OpDurum, odStarted, odFinished, odCanceled]) then
          FTableUretimRotaKaynakClone.OpDurum := FTableUretimRotaClone.OpDurum;
        if not (FTableUretimRotaKaynakClone.OpDurum in [odCanceled]) then
        begin
          FTableUretimRotaKaynakClone.SerbestMiktar := KaynakDagitimMiktar;
          KaynakDagitimMiktar := 0;
        end;
        FTableUretimRotaKaynakClone.Post;

        FTableUretimRotaKaynakClone.Next;
      end;
    end;
    FTableUretimRotaClone.Next;
  end;
end;

function TAppDataControllerUretimKart.UretimDurumDegistir(ANewUretimDurum: TAppUretimDurum; ATarih: TDateTime; AMiktar, AFireMiktar: Double): Boolean;
var
  AOpUpdateStatus: TAppOpUpdateStatus;
  AOpType: TAppOpType;
  AOpDurum: Smallint;
  ACurUretimDurum: TAppUretimDurum;
begin
  Result := False;
  AOpUpdateStatus := ousNone;
  AOpType := otNone;
  AOpDurum := FTableUretimKart.OpDurum;
  ACurUretimDurum := TAppUretimDurum(FTableUretimKart.UretimDurum);

  if ACurUretimDurum = ANewUretimDurum then
  begin
    AppShowMessage('Üretim durumu ayný verilemez!');
    Exit;
  end
  else if ACurUretimDurum in [udPlanned, udFirmPlanned] then
  begin
    if ANewUretimDurum = udReleased then
    begin
      AOpUpdateStatus := ousInsert;
      AOpType := otForward;
      AOpDurum := odReleased;
    end
    else if ANewUretimDurum = udFinished then
    begin
      AppShowMessage('Sadece serbest býrakýlmýþ üretim emirleri tamamlandý yapýlabilir!');
      Exit;
    end;
  end
  else if ACurUretimDurum = udReleased then
  begin
    if ANewUretimDurum = udFinished then
    begin
      if (FTableUretimKart.OpDurum in [odNone, odReleased]) or (FTableUretimKart.OpMiktar > 0) then
      begin
        AOpUpdateStatus := ousInsert;
        AOpType := otBackward;
      end else
      begin
        AppShowMessage('Operasyonu baþlamýþ üretim emrinin çýktý miktarý sýfýrken tamamlandý yapýlamaz!');
        Exit;
      end;
    end
    else if ANewUretimDurum in [udPlanned, udFirmPlanned] then
    begin
      if FTableUretimKart.OpDurum in [odNone, odReleased] then
      begin
        AOpUpdateStatus := ousDelete;
        AOpType := otForward;
        AOpDurum := odNone;
      end else
      begin
        AppShowMessage('Operasyonu baþlamýþ üretim emri planlandý/kesin planlandý yapýlamaz!');
        Exit;
      end;
    end;
  end
  else if ACurUretimDurum = udFinished then
  begin
    if ANewUretimDurum = udReleased then
    begin
      AOpUpdateStatus := ousDelete;
      AOpType := otBackward;
    end else
    begin
      AppShowMessage('Tamamlanmýþ üretim emri sadece serbest býrakýldýya geri alýnabilir!');
      Exit;
    end;
  end;

  if (ACurUretimDurum = udFinished) and (ANewUretimDurum = udReleased) then // Tamamlandý siliniyor ise fazla sevkleri kaldýr
  begin
    FTableUretimSiparisHareket.First;
    while not FTableUretimSiparisHareket.Eof do
    begin
      if (FTableUretimSiparisHareket.FazlaSevk <> 0) then      //veysel
      begin
        FTableUretimSiparisHareket.Edit;
        FTableUretimSiparisHareket.FazlaSevk := 0;
        FTableUretimSiparisHareket.KalanMiktar := FTableUretimSiparisHareket.Miktar - FTableUretimSiparisHareket.KullanilanMiktar + FTableUretimSiparisHareket.FazlaSevk;
        FTableUretimSiparisHareket.Post;
      end;
      FTableUretimSiparisHareket.Next;
    end;
  end;

  if AOpType <> otNone then
    AddAutoBaglanti(AOpUpdateStatus, AOpType, 0, 0, ATarih, AMiktar, AFireMiktar);

  if (FTableUretimKart.OpDurum <> AOpDurum) then
  begin
    FTableUretimRotaClone.First;
    UpdateNextRoute(IntToStr(FTableUretimRotaClone.OperasyonNo), AOpDurum)
  end;

  if (ACurUretimDurum = udReleased) and (ANewUretimDurum = udFinished) then // Tamamlandý yapýlýyor ise kalaný fazla sevk var ve kapat
  begin
    FTableUretimSiparisHareket.First;
    while not FTableUretimSiparisHareket.Eof do
    begin
      if FTableUretimSiparisHareket.Miktar - FTableUretimSiparisHareket.KullanilanMiktar + FTableUretimSiparisHareket.FazlaSevk <> 0 then
      begin
        FTableUretimSiparisHareket.Edit;
        FTableUretimSiparisHareket.FazlaSevk := FTableUretimSiparisHareket.KullanilanMiktar - FTableUretimSiparisHareket.Miktar;
        FTableUretimSiparisHareket.KalanMiktar := FTableUretimSiparisHareket.Miktar - FTableUretimSiparisHareket.KullanilanMiktar + FTableUretimSiparisHareket.FazlaSevk;
        FTableUretimSiparisHareket.Post;
      end;
      FTableUretimSiparisHareket.Next;
    end;
  end;

  FTableUretimKart.Edit;
  FTableUretimKart.UretimDurum := Integer(ANewUretimDurum);

  if AOpUpdateStatus = ousInsert then
  begin
    if ANewUretimDurum = udFirmPlanned then
      FTableUretimKart.UretimPlanTarih := ATarih
    else if ANewUretimDurum = udReleased then
      FTableUretimKart.UretimBasTarih := ATarih
    else if ANewUretimDurum = udFinished then
    begin
      FTableUretimKart.UretimBitTarih := ATarih;
      if FTableUretimKart.OpDurum in [odNone, odReleased] then // Operasyon giriþi yapmadan tamamlandý yapýlýyor ise
      begin
        FTableUretimKart.OpBasTarih := ATarih;
        FTableUretimKart.OpBasTarihSaat := ATarih;
        FTableUretimKart.OpBitTarih := ATarih;
        FTableUretimKart.OpBitTarihSaat := ATarih;
        FTableUretimKart.OpSure := 0;
        FTableUretimKart.OpMiktar := AMiktar;
        FTableUretimKart.OpFireMiktar := AFireMiktar;
      end;
    end;
  end
  else if AOpUpdateStatus = ousDelete then
  begin
    if ACurUretimDurum = udFirmPlanned then
      FTableUretimKart.UretimPlanTarih := AppFirstDate
    else if ACurUretimDurum = udReleased then
      FTableUretimKart.UretimBasTarih := AppFirstDate
    else if ACurUretimDurum = udFinished then
    begin
      FTableUretimKart.UretimBitTarih := AppFirstDate;
      if FTableUretimKart.OpSure = 0 then // Operasyon giriþi yapmadan tamamlanan üretim geri alýnýyor ise
      begin
        FTableUretimKart.OpBasTarih := AppFirstDate;
        FTableUretimKart.OpBasTarihSaat := AppFirstDate;
        FTableUretimKart.OpBitTarih := AppFirstDate;
        FTableUretimKart.OpBitTarihSaat := AppFirstDate;
        FTableUretimKart.OpMiktar := 0;
        FTableUretimKart.OpFireMiktar := 0;
      end;
    end;
  end;

  if (FTableUretimKart.OpDurum <> AOpDurum) then
    FTableUretimKart.OpDurum := AOpDurum;
  FTableUretimKart.Post;

  Result := True;
end;

{ TAppRuleUretimStokHareketCustom }

constructor TAppRuleUretimStokHareketCustom.Create(
  AOwner: TAppDataControllerUretimKart);
begin
  inherited Create;
  FdcUretimKart := AOwner;

  FTableUretimStokHareket := FdcUretimKart.FTableUretimStokHareket;
  FTableUretimStokHareket.DataEvents.AddRule(Self);

  FTableUretimSiparisHareket := FdcUretimKart.FTableUretimSiparisHareket;
end;

procedure TAppRuleUretimStokHareketCustom.DoAfterCancelUpdates(
  Table: TAppCustomTable);
begin
  inherited;
  FTableUretimSiparisHareket.CancelUpdates;
end;

end.

