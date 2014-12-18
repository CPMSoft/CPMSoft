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
    Kay�tDurumChanged, DurumChanged, MiktarChanged, BasTarihChanged, BitTarihChanged: Boolean;
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
    raise Exception.Create('�retim kart� yok, rota giri�i yapamazs�n�z!');
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
    raise Exception.Create('�retim rotas� yok, kaynak giri�i yapamazs�n�z!');
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
  if FdcUretimKart.FTableUretimRotaKaynakOperasyon.IsEmpty then // Bo� de�ilse zaten elle de�i�ikli�e izin vermiyorum.
  begin
    if FdcUretimKart.FTableUretimKart.UretimDurum in [Integer(udPlanned), Integer(udFirmPlanned)] then
    begin
      if not (FTableUretimRotaKaynak.OpDurum in [odNone, odCanceled]) then
        raise Exception.Create('Atanan operasyon durumu uygun de�il.');
    end
    else if FdcUretimKart.FTableUretimKart.UretimDurum = Integer(udReleased) then
    begin
      if not (FTableUretimRotaKaynak.OpDurum in [odNone, odReleased, odCanceled]) then
        raise Exception.Create('Atanan operasyon durumu uygun de�il.');
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
  // Serbest miktar alan� sonradan eklendi ge�ici olarak s�f�r ise miktar� al, ileride bunu kald�r direk serbest miktar� al
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
    raise Exception.Create('Sadece serbest b�rak�lm�� �retim emirlerine operasyon girilebilir');
  if FdcUretimKart.FTableUretimRotaKaynak.IsEmpty then
    raise Exception.Create('�retim rota kayna�� yok, operasyon giri�i yapamazs�n�z!');
  if FdcUretimKart.FTableUretimRotaKaynak.OpDurum = odCanceled then
    raise Exception.Create('Bu kayna�a operasyon giremezsiniz, �nce kayna�� aktifle�tirmelisiniz!');
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
  // Serbest miktar alan� sonradan eklendi ge�ici olarak s�f�r ise miktar� al, ileride bunu kald�r direk serbest miktar� al
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
    if FdcUretimKart.FTableUretimRotaKaynakOperasyon.State = dsInsert then // Insert i�in tarih bir �nceki tarihden sonra m� kontrol�
    begin
      if FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.Durum = 0 then
        raise Exception.Create('Bir �nceki operasyon tamamlanmadan sonraki operasyona ba�lanamaz!');
    end else // edit ve delete
    begin
      if FdcUretimKart.FTableUretimRotaKaynakOperasyonClone.SiraNo <> pSiraNo then
        raise Exception.Create('Sadece son kay�tda de�i�iklik yap�labilir!'); // �imdilik, ileride otomatik g�ncelleme yazmam laz�m, tabi otomatik g�ncellemede kaynak update eden koduda d�zeltmeyi unutma
    end;
    if FdcUretimKart.FTableUretimRotaKaynakOperasyon.State in dsEditModes then
    begin
      if pBasTarihSaat < pLastOpBitTarihSaat then
        raise Exception.Create('Ba�lang�� zaman�, bir �nceki operasyonun biti� zaman�ndan sonra olmal�!'); // Veysel taraf�ndan kald�r�ld�. demolarda sorun veriyor.
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

  Kay�tDurumChanged := pOldKayitDurum <> FTableUretimRotaKaynakOperasyon.KayitDurum;
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

  FdcUretimKart.AddAutoBaglanti(ousDelete, otForward, pOperasyonNo, pSiraNo); // �leri Ba�lant� yap�lm��sa Sil
  FdcUretimKart.AddAutoBaglanti(ousDelete, otBackward, pOperasyonNo, pSiraNo); // Geri Ba�lant� yap�lm��sa Sil
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
    FdcUretimKart.AddAutoBaglanti(ousUpdate, otForward, pOperasyonNo, pSiraNo, pBasTarih) // �leri Ba�lant� yap�lm��sa sil ve yeniden ekle
  else if (pDataSetState = dsInsert) or (Kay�tDurumChanged) then
    FdcUretimKart.AddAutoBaglanti(ousInsert, otForward, pOperasyonNo, pSiraNo, pBasTarih); // �leri Ba�lant� ekle

  // Update Backward AutoBaglanti Records
  if (pKayitDurum <> 1) or (pDurum = 0) then // Operasyon Tamamlanmad� ise
    FdcUretimKart.AddAutoBaglanti(ousDelete, otBackward, pOperasyonNo, pSiraNo) // Geri Ba�lant� yap�lm��sa sil
  else if (pDataSetState = dsEdit) and (MiktarChanged or BitTarihChanged) then
    FdcUretimKart.AddAutoBaglanti(ousUpdate, otBackward, pOperasyonNo, pSiraNo, pBitTarih, pMiktar, pFireMiktar) // // Geri Ba�lant� yap�lm��sa sil ve yeniden ekle
  else if (pDataSetState = dsInsert) or (Kay�tDurumChanged or DurumChanged) then
    FdcUretimKart.AddAutoBaglanti(ousInsert, otBackward, pOperasyonNo, pSiraNo, pBitTarih, pMiktar, pFireMiktar); // Geri Ba�lant� ekle
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
      raise Exception.Create('Evrak Birim bo� olamaz!');
    if FTableUretimRotaKaynakOperasyon.BasTarihSaat < FdcUretimKart.FTableUretimRota.SerbestTarihSaat then
      raise Exception.Create(Format('Ba�lang�� zaman�, %s den �nce olamaz!',[DateTimeToStr(FdcUretimKart.FTableUretimRota.SerbestTarihSaat)]));
    if FTableUretimRotaKaynakOperasyon.BitTarihSaat <= FTableUretimRotaKaynakOperasyon.BasTarihSaat then // Terminal Veri� Giri� Demo Sunumlar� esnas�nda sorun olabildi�i i�in ge�ici olarak kald�r�ld�. Antalya sunumundan sonra tekrar eklenecek ya da dakika kontrol�nden ��k�l�p saniye kontrol�ne ge�ilecek. 11.05.2014 Veysel
      raise Exception.Create('Biti� zaman�, ba�lang�� zaman�ndan sonra olmal�!');
    if FTableUretimRotaKaynakOperasyon.MekanikSaatBas > 0 then // Mekanik Saat Kullan�l�yor ise
      if FTableUretimRotaKaynakOperasyon.MekanikSaatBit <= FTableUretimRotaKaynakOperasyon.MekanikSaatBas then
        raise Exception.Create('Mekanik biti� zaman�, mekanik ba�lang�� zaman�ndan sonra olmal�!');
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
//    FTableUretimEvrakBaslik.EvrakTarih := ATableSiparisHareket.SiparisTarih; // Kimteksteki istek nedeniyle de�i�tirildi.
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
    if ATableSiparisHareket.SonKaynakEvrakTip in [aetSatisSiparis, aetIhracatSiparis, aetServisSiparis] then // Ba�lant� alanlar�n� aktar�rken �nceki evraklardan hangisi ilk �zel kapat yapm�� ise onu yazmam laz�m ama vakit olmad��� i�in buradan ald�m, bi ara d�zeltece�im
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

    FTableUretimStokHareket.Insert; // S�ra No yu OnNewRecord da ald�, Evrak �retim i�in s�rano ya m�dahele ediyordum ama �oklu giri� ��k��larda i� kar��maya ba�lad��� i�in kald�rd�m

    FTableUretimStokHareket.MalTip := ATableSiparisHareket.MalTip;
    FTableUretimStokHareket.KayitTur := 1;
    FTableUretimStokHareket.KayitDurum := 1;
    FTableUretimStokHareket.MalKod := ATableSiparisHareket.MalKod;
    FTableUretimStokHareket.VersiyonNo := ATableSiparisHareket.VersiyonNo;
    FTableUretimStokHareket.SurumNo := ATableSiparisHareket.SurumNo;
    FTableUretimStokHareket.DepoKod := ATableSiparisHareket.DepoKod;

    FTableUretimStokHareket.IslemTip := shitUretim;
    FTableUretimStokHareket.GirisCikis := ATableSiparisHareket.GirisCikis;

    FTableUretimStokHareket.EvrakTarih := AIrsaliyeTarih; // �nemli: Evrak tarihi k�s�tlama parametrelerine tak�ls�n, muhasebeye de bu tarihde aktar�ls�n diye hammadenin ��k�� tarihini bas�yoruz.
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
      if ALotBoyut = 1 then // Parti B�y�kl��� 1 ise tek tek giri� yap�lacak
        if AMiktar <> Trunc(AMiktar) then // Girilen miktar tam say� de�ilse tan�m hatas� vard�r, tek tek giri� yap�lamaz
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
      if (FTableUretimStokHareket.ReceteKaynakTip in [Integer(AReceteKaynakTip), Integer(rktBaglanti)]) and // rktBaglanti direk olarak "�retim durumu serbest b�rak�ld�dan planland�ya geri al�nd���nda" elle eklenenleri de silmesi i�in eklendi, di�er ko�ullar operasyon no ve operasyon s�rano kontrol�ne tak�l�r ve soruna neden olmaz zaten
      (FTableUretimStokHareket.OperasyonNo = AOperasyonNo) and
      (FTableUretimStokHareket.OperasyonSiraNo = AOperasyonSiraNo) then
      begin
        ADeleted := True;
        ADeletingMiktar := ADeletingMiktar + FTableUretimStokHareket.Miktar;
        FTableUretimStokHareket.Delete; // FTableUretimEvrakKaynakClone master detail oldu�u i�in otomatik siliniyor
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
      if DirectManufacturing then // �retim Durumu de�i�ikli�inde t�m kay�tlar� tara
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
            if FTableUretimSiparisHareketClone.GirisCikis = gctGiris then // Giri�ler sadece backward i�lemlerinde �retilirler.
            begin
              if AOpType = otBackward then
              begin
                if FTableUretimSiparisHareketClone.MalTip = 5 then
                  pAddingMiktar := AOpMiktar
                else
                  pAddingMiktar := (FTableUretimSiparisHareketClone.Miktar / FTableUretimKart.Miktar) * (AOpMiktar + AOpFireMiktar); // Yan �r�nlere operasyon miktar� kadar giri� yap�l�r
              end;
            end else // ��k��lar sarf y�ntemine g�re t�ketilirler...
            begin
              try
                pSarfYontem := FTableUretimSiparisHareketClone.FieldValues['STKKRT_SARFYONTEM'];
              except
                pSarfYontem := 0;
              end;

              if AOpType in [otForward] then
              begin
                if pSarfYontem in [Integer(syForward), Integer(syPickAndForward)] then // Forward da hen�z t�ketilmemi� (manual t�ketim yap�lm�� olabilir) t�m hammadde t�ketilir.
                  pAddingMiktar := pKalanMiktar;
              end
              else if AOpType = otBackward then
              begin
                if pSarfYontem in [Integer(syForward), Integer(syPickAndForward)] then // Forward da hen�z t�ketilmemi� (manual t�ketim yap�lm�� olabilir) t�m hammadde t�ketilir.
                  pAddingMiktar := pKalanMiktar
                else if pSarfYontem in [Integer(syBackward), Integer(syPickAndBackward)] then // Backward da operasyon miktar� kadar harcama yap�l�r
                  pAddingMiktar := (FTableUretimSiparisHareketClone.Miktar / FTableUretimKart.Miktar) * (AOpMiktar + AOpFireMiktar)
                else if (pSarfYontem in [Integer(syManual)]) and (AOpNo = 0) then // yani �zetle �retim tamamland� ise man�el t�ketilecekler operasyon miktar�na g�re t�ketilir..
                begin
                  // Kimteks'de man�el t�ketimlerin kalan k�s�mlar�n�n otomatik t�ketilmesi s�k�nt�ya neden oldu�u i�in kald�r�ld�.
                  // �leride ba�ka bir firma otomatik t�ketilmesini isterse man�el t�ketimlerin kapat�l�p kapat�lmayaca�� parametrik yap�labilir
                  // pAddingMiktar := (FTableUretimSiparisHareketClone.Miktar / FTableUretimKart.Miktar) * (AOpMiktar + AOpFireMiktar);
                  // Bu uyar� da ileride parametrik yap�labilir veya tamamen kald�r�labilir.
                  AppShowMessage(format('%s nolu hammaddenin sarf y�ntemi elle(0) olup i� emrinde bildirilen miktar�n tamam� t�ketilmemi�tir. Bilginize...',[FTableUretimSiparisHareketClone.MalKod]));
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
  AddInAutoBaglanti(gctCikis); // �nce ��k��lar� Ekle
  AddInAutoBaglanti(gctGiris); // Sonra Giri�leri Ekle
end;

procedure TAppDataControllerUretimKart.OpenTables(SirketNo, KonsolideSirketNo, HesapKod, EvrakNo: String);
var
  ASqlStr: String;
begin
  // Open �retim Sipari� Hareket
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

  // Open �retim Evrak Ba�l�k
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

  // Open �retim Stok Hareket
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

  // Open �retim Stok Hareket Teknik
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

  // Open �retim Stok Hareket �retim
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

  // Open �retim Stok Hareket Kaynak
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

  // Open �retim Seri Kart
  ASqlStr := ReplaceText(ASqlStr, 'SHRKYN', 'STKHAR');
  with FTableUretimSeriKart do // SERKRT ye join edilmi� olan STKHAR tablosuna where ekleniyor
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
  if not PriorOps_IsFound then // �nceki operasyon bulunamad� ise, yani ilk operasyonla ilgili i�lem yap�lm��sa
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
      if OperasyonSerbestKalmaTip = 0 then // �nceki operasyonlar tamamland���nda ba�lar
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
      else if OperasyonSerbestKalmaTip = 1 then // �nceki operasyon ba�lad�ktan 10 dk sonra ba�lar.
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
    AppShowMessage('�retim durumu ayn� verilemez!');
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
      AppShowMessage('Sadece serbest b�rak�lm�� �retim emirleri tamamland� yap�labilir!');
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
        AppShowMessage('Operasyonu ba�lam�� �retim emrinin ��kt� miktar� s�f�rken tamamland� yap�lamaz!');
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
        AppShowMessage('Operasyonu ba�lam�� �retim emri planland�/kesin planland� yap�lamaz!');
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
      AppShowMessage('Tamamlanm�� �retim emri sadece serbest b�rak�ld�ya geri al�nabilir!');
      Exit;
    end;
  end;

  if (ACurUretimDurum = udFinished) and (ANewUretimDurum = udReleased) then // Tamamland� siliniyor ise fazla sevkleri kald�r
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

  if (ACurUretimDurum = udReleased) and (ANewUretimDurum = udFinished) then // Tamamland� yap�l�yor ise kalan� fazla sevk var ve kapat
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
      if FTableUretimKart.OpDurum in [odNone, odReleased] then // Operasyon giri�i yapmadan tamamland� yap�l�yor ise
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
      if FTableUretimKart.OpSure = 0 then // Operasyon giri�i yapmadan tamamlanan �retim geri al�n�yor ise
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

