unit CPMApp_TableMRPSystem;

interface

uses Windows, Classes, SysUtils, Controls,
    DB, CPMApp_DataObject, CPMApp_DataObjectModel, CPMApp_AggregateTable;

type
  TTableMRMNavBar = class;    // MRMNVB
  TTableMRPBaslik = class;    // MRPBAS
  TTableMRPDetay = class;    // MRPDTY
  TTableMRPError = class;    // MRPERR
  TTableMRPEvrak = class;    // MRPEVR
  TTableMRPException = class;    // MRPEXC
  TTableMRPEylemPlan = class;    // MRPEYP
  TTableMRPIhtiyac = class;    // MRPIHT
  TTableMRPListDepReq = class;    // MRPLDR
  TTableMRPListError = class;    // MRPLER
  TTableMRPListException = class;    // MRPLEX
  TTableMRPListHeader = class;    // MRPLHD
  TTableMRPListItems = class;    // MRPLST
  TTableMRPPlan = class;    // MRPPLN
  TTableMRPParametre = class;    // MRPPRM
  TTableStokKarsilamaPolitika = class;    // MRPSKP
  TTableMRPStok = class;    // MRPSTH
  TTableUretimPlanlamaKaynakTakvim = class;    // URTPKT
  TTableUretimPlanlamaBaslik = class;    // URTPLB
  TTableUretimPlanlamaDetay = class;    // URTPLD
  TTableUretimPlanlama = class;    // URTPLN
  TTableUretimPlanlamaStokTakvim = class;    // URTPST
  TTableUretimPlanlamaSatisYuzde = class;    // URTPSY
  TTableUretimTahminBaslik = class;    // URTTHB
  TTableUretimTahminKaynak = class;    // URTTHK
  TTableUretimTahmin = class;    // URTTHM
  TTableUretimTahminNot = class;    // URTTHN
  TTableUretimTahminToplam = class;    // URTTHT
  TTableUretimTahminVardiya = class;    // URTTHV

  TTableMRMNavBar = class(TAppTable)
  Private
    FfAramaTip: TField;
    FfBasMalAd: TField;
    FfBasMalKod: TField;
    FfBitMalAd: TField;
    FfBitMalKod: TField;
    FfFabrikaKod: TField;
    FfMalAd: TField;
    FfMalKod: TField;
    FfMRPAlanKod: TField;
    FfVersiyonNo: TField;
    function GetAramaTip: Integer;
    function GetBasMalAd: String;
    function GetBasMalKod: String;
    function GetBitMalAd: String;
    function GetBitMalKod: String;
    function GetFabrikaKod: String;
    function GetMalAd: String;
    function GetMalKod: String;
    function GetMRPAlanKod: String;
    function GetVersiyonNo: String;
    function GetfAramaTip: TField;
    function GetfBasMalAd: TField;
    function GetfBasMalKod: TField;
    function GetfBitMalAd: TField;
    function GetfBitMalKod: TField;
    function GetfFabrikaKod: TField;
    function GetfMalAd: TField;
    function GetfMalKod: TField;
    function GetfMRPAlanKod: TField;
    function GetfVersiyonNo: TField;
    procedure SetAramaTip(const Value: Integer);
    procedure SetBasMalAd(const Value: String);
    procedure SetBasMalKod(const Value: String);
    procedure SetBitMalAd(const Value: String);
    procedure SetBitMalKod(const Value: String);
    procedure SetFabrikaKod(const Value: String);
    procedure SetMalAd(const Value: String);
    procedure SetMalKod(const Value: String);
    procedure SetMRPAlanKod(const Value: String);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AramaTip: Integer read GetAramaTip write SetAramaTip;
    property BasMalAd: String read GetBasMalAd write SetBasMalAd;
    property BasMalKod: String read GetBasMalKod write SetBasMalKod;
    property BitMalAd: String read GetBitMalAd write SetBitMalAd;
    property BitMalKod: String read GetBitMalKod write SetBitMalKod;
    property FabrikaKod: String read GetFabrikaKod write SetFabrikaKod;
    property MalAd: String read GetMalAd write SetMalAd;
    property MalKod: String read GetMalKod write SetMalKod;
    property MRPAlanKod: String read GetMRPAlanKod write SetMRPAlanKod;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fAramaTip:TField read GetfAramaTip;
    property fBasMalAd:TField read GetfBasMalAd;
    property fBasMalKod:TField read GetfBasMalKod;
    property fBitMalAd:TField read GetfBitMalAd;
    property fBitMalKod:TField read GetfBitMalKod;
    property fFabrikaKod:TField read GetfFabrikaKod;
    property fMalAd:TField read GetfMalAd;
    property fMalKod:TField read GetfMalKod;
    property fMRPAlanKod:TField read GetfMRPAlanKod;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableMRPBaslik = class(TAppTable)
  Private
    FfAciklama: TField;
    FfAlimPartiHesapla: TField;
    FfAlimSiparisKapat: TField;
    FfDegistirenKaynak: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
    FfFabrikaKod: TField;
    FfFireHesapla: TField;
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfID: TField;
    FfMinStokKapat: TField;
    FfMRPListeKaydet: TField;
    FfPlanNo: TField;
    FfRowGuid: TField;
    FfSatisSiparisKapat: TField;
    FfStokKapat: TField;
    FfUretimPlanBasTarih: TField;
    FfUretimPlanBitTarih: TField;
    FfUretimPlanNo: TField;
    FfUretimPlanTip: TField;
    FfUretimSiparisKapat: TField;
    FfUretimTahminBasTarih: TField;
    FfUretimTahminBitTarih: TField;
    FfUretimTahminNo: TField;
    FfYuvarla: TField;
    function GetAciklama: String;
    function GetAlimPartiHesapla: Integer;
    function GetAlimSiparisKapat: Integer;
    function GetDegistirenKaynak: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
    function GetFabrikaKod: String;
    function GetFireHesapla: Integer;
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetID: Integer;
    function GetMinStokKapat: Integer;
    function GetMRPListeKaydet: Integer;
    function GetPlanNo: String;
    function GetRowGuid: String;
    function GetSatisSiparisKapat: Integer;
    function GetStokKapat: Integer;
    function GetUretimPlanBasTarih: TDate;
    function GetUretimPlanBitTarih: TDate;
    function GetUretimPlanNo: String;
    function GetUretimPlanTip: Integer;
    function GetUretimSiparisKapat: Integer;
    function GetUretimTahminBasTarih: TDate;
    function GetUretimTahminBitTarih: TDate;
    function GetUretimTahminNo: String;
    function GetYuvarla: Integer;
    function GetfAciklama: TField;
    function GetfAlimPartiHesapla: TField;
    function GetfAlimSiparisKapat: TField;
    function GetfDegistirenKaynak: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
    function GetfFabrikaKod: TField;
    function GetfFireHesapla: TField;
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfID: TField;
    function GetfMinStokKapat: TField;
    function GetfMRPListeKaydet: TField;
    function GetfPlanNo: TField;
    function GetfRowGuid: TField;
    function GetfSatisSiparisKapat: TField;
    function GetfStokKapat: TField;
    function GetfUretimPlanBasTarih: TField;
    function GetfUretimPlanBitTarih: TField;
    function GetfUretimPlanNo: TField;
    function GetfUretimPlanTip: TField;
    function GetfUretimSiparisKapat: TField;
    function GetfUretimTahminBasTarih: TField;
    function GetfUretimTahminBitTarih: TField;
    function GetfUretimTahminNo: TField;
    function GetfYuvarla: TField;
    procedure SetAciklama(const Value: String);
    procedure SetAlimPartiHesapla(const Value: Integer);
    procedure SetAlimSiparisKapat(const Value: Integer);
    procedure SetDegistirenKaynak(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
    procedure SetFabrikaKod(const Value: String);
    procedure SetFireHesapla(const Value: Integer);
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetMinStokKapat(const Value: Integer);
    procedure SetMRPListeKaydet(const Value: Integer);
    procedure SetPlanNo(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSatisSiparisKapat(const Value: Integer);
    procedure SetStokKapat(const Value: Integer);
    procedure SetUretimPlanBasTarih(const Value: TDate);
    procedure SetUretimPlanBitTarih(const Value: TDate);
    procedure SetUretimPlanNo(const Value: String);
    procedure SetUretimPlanTip(const Value: Integer);
    procedure SetUretimSiparisKapat(const Value: Integer);
    procedure SetUretimTahminBasTarih(const Value: TDate);
    procedure SetUretimTahminBitTarih(const Value: TDate);
    procedure SetUretimTahminNo(const Value: String);
    procedure SetYuvarla(const Value: Integer);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property AlimPartiHesapla: Integer read GetAlimPartiHesapla write SetAlimPartiHesapla;
    property AlimSiparisKapat: Integer read GetAlimSiparisKapat write SetAlimSiparisKapat;
    property DegistirenKaynak: String read GetDegistirenKaynak write SetDegistirenKaynak;
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property DegistirenSurum: String read GetDegistirenSurum write SetDegistirenSurum;
    property DegistirenTarih: TDate read GetDegistirenTarih write SetDegistirenTarih;
    property FabrikaKod: String read GetFabrikaKod write SetFabrikaKod;
    property FireHesapla: Integer read GetFireHesapla write SetFireHesapla;
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property ID: Integer read GetID write SetID;
    property MinStokKapat: Integer read GetMinStokKapat write SetMinStokKapat;
    property MRPListeKaydet: Integer read GetMRPListeKaydet write SetMRPListeKaydet;
    property PlanNo: String read GetPlanNo write SetPlanNo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SatisSiparisKapat: Integer read GetSatisSiparisKapat write SetSatisSiparisKapat;
    property StokKapat: Integer read GetStokKapat write SetStokKapat;
    property UretimPlanBasTarih: TDate read GetUretimPlanBasTarih write SetUretimPlanBasTarih;
    property UretimPlanBitTarih: TDate read GetUretimPlanBitTarih write SetUretimPlanBitTarih;
    property UretimPlanNo: String read GetUretimPlanNo write SetUretimPlanNo;
    property UretimPlanTip: Integer read GetUretimPlanTip write SetUretimPlanTip;
    property UretimSiparisKapat: Integer read GetUretimSiparisKapat write SetUretimSiparisKapat;
    property UretimTahminBasTarih: TDate read GetUretimTahminBasTarih write SetUretimTahminBasTarih;
    property UretimTahminBitTarih: TDate read GetUretimTahminBitTarih write SetUretimTahminBitTarih;
    property UretimTahminNo: String read GetUretimTahminNo write SetUretimTahminNo;
    property Yuvarla: Integer read GetYuvarla write SetYuvarla;
    property fAciklama:TField read GetfAciklama;
    property fAlimPartiHesapla:TField read GetfAlimPartiHesapla;
    property fAlimSiparisKapat:TField read GetfAlimSiparisKapat;
    property fDegistirenKaynak:TField read GetfDegistirenKaynak;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
    property fFabrikaKod:TField read GetfFabrikaKod;
    property fFireHesapla:TField read GetfFireHesapla;
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fID:TField read GetfID;
    property fMinStokKapat:TField read GetfMinStokKapat;
    property fMRPListeKaydet:TField read GetfMRPListeKaydet;
    property fPlanNo:TField read GetfPlanNo;
    property fRowGuid:TField read GetfRowGuid;
    property fSatisSiparisKapat:TField read GetfSatisSiparisKapat;
    property fStokKapat:TField read GetfStokKapat;
    property fUretimPlanBasTarih:TField read GetfUretimPlanBasTarih;
    property fUretimPlanBitTarih:TField read GetfUretimPlanBitTarih;
    property fUretimPlanNo:TField read GetfUretimPlanNo;
    property fUretimPlanTip:TField read GetfUretimPlanTip;
    property fUretimSiparisKapat:TField read GetfUretimSiparisKapat;
    property fUretimTahminBasTarih:TField read GetfUretimTahminBasTarih;
    property fUretimTahminBitTarih:TField read GetfUretimTahminBitTarih;
    property fUretimTahminNo:TField read GetfUretimTahminNo;
    property fYuvarla:TField read GetfYuvarla;
  end;

  TTableMRPDetay = class(TAppTable)
  Private
    FfID: TField;
    FfMalKod: TField;
    FfMiktar: TField;
    FfMRPAlanKod: TField;
    FfPlanNo: TField;
    FfRowGuid: TField;
    FfSiraNo: TField;
    FfTarih: TField;
    FfVersiyonNo: TField;
    function GetID: Integer;
    function GetMalKod: String;
    function GetMiktar: Double;
    function GetMRPAlanKod: String;
    function GetPlanNo: String;
    function GetRowGuid: String;
    function GetSiraNo: Integer;
    function GetTarih: TDate;
    function GetVersiyonNo: String;
    function GetfID: TField;
    function GetfMalKod: TField;
    function GetfMiktar: TField;
    function GetfMRPAlanKod: TField;
    function GetfPlanNo: TField;
    function GetfRowGuid: TField;
    function GetfSiraNo: TField;
    function GetfTarih: TField;
    function GetfVersiyonNo: TField;
    procedure SetID(const Value: Integer);
    procedure SetMalKod(const Value: String);
    procedure SetMiktar(const Value: Double);
    procedure SetMRPAlanKod(const Value: String);
    procedure SetPlanNo(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetTarih(const Value: TDate);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ID: Integer read GetID write SetID;
    property MalKod: String read GetMalKod write SetMalKod;
    property Miktar: Double read GetMiktar write SetMiktar;
    property MRPAlanKod: String read GetMRPAlanKod write SetMRPAlanKod;
    property PlanNo: String read GetPlanNo write SetPlanNo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property Tarih: TDate read GetTarih write SetTarih;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fID:TField read GetfID;
    property fMalKod:TField read GetfMalKod;
    property fMiktar:TField read GetfMiktar;
    property fMRPAlanKod:TField read GetfMRPAlanKod;
    property fPlanNo:TField read GetfPlanNo;
    property fRowGuid:TField read GetfRowGuid;
    property fSiraNo:TField read GetfSiraNo;
    property fTarih:TField read GetfTarih;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableMRPError = class(TAppTable)
  Private
    FfAciklama: TField;
    FfID: TField;
    FfKod: TField;
    FfMalKod: TField;
    FfPlanNo: TField;
    FfRowGuid: TField;
    FfSiraNo: TField;
    FfSiraNo2: TField;
    function GetAciklama: String;
    function GetID: Integer;
    function GetKod: String;
    function GetMalKod: String;
    function GetPlanNo: String;
    function GetRowGuid: String;
    function GetSiraNo: Integer;
    function GetSiraNo2: Integer;
    function GetfAciklama: TField;
    function GetfID: TField;
    function GetfKod: TField;
    function GetfMalKod: TField;
    function GetfPlanNo: TField;
    function GetfRowGuid: TField;
    function GetfSiraNo: TField;
    function GetfSiraNo2: TField;
    procedure SetAciklama(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetKod(const Value: String);
    procedure SetMalKod(const Value: String);
    procedure SetPlanNo(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSiraNo2(const Value: Integer);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property ID: Integer read GetID write SetID;
    property Kod: String read GetKod write SetKod;
    property MalKod: String read GetMalKod write SetMalKod;
    property PlanNo: String read GetPlanNo write SetPlanNo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SiraNo2: Integer read GetSiraNo2 write SetSiraNo2;
    property fAciklama:TField read GetfAciklama;
    property fID:TField read GetfID;
    property fKod:TField read GetfKod;
    property fMalKod:TField read GetfMalKod;
    property fPlanNo:TField read GetfPlanNo;
    property fRowGuid:TField read GetfRowGuid;
    property fSiraNo:TField read GetfSiraNo;
    property fSiraNo2:TField read GetfSiraNo2;
  end;

  TTableMRPEvrak = class(TAppTable)
  Private
    FfDegistirenKaynak: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
    FfEvrakNo: TField;
    FfEvrakSiraNo: TField;
    FfEvrakTip: TField;
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfHesapKod: TField;
    FfID: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfMRPMiktar: TField;
    FfMRPPlanTip: TField;
    FfMRPSiraNo: TField;
    FfMRPTarih: TField;
    FfSirketNo: TField;
    FfUretimDurum: TField;
    FfUretimKonum: TField;
    FfUretimNo: TField;
    FfUretimPlanNo: TField;
    function GetDegistirenKaynak: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
    function GetEvrakNo: String;
    function GetEvrakSiraNo: Integer;
    function GetEvrakTip: Integer;
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetHesapKod: String;
    function GetID: Integer;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetMRPMiktar: Double;
    function GetMRPPlanTip: String;
    function GetMRPSiraNo: Integer;
    function GetMRPTarih: TDate;
    function GetSirketNo: String;
    function GetUretimDurum: String;
    function GetUretimKonum: String;
    function GetUretimNo: String;
    function GetUretimPlanNo: String;
    function GetfDegistirenKaynak: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
    function GetfEvrakNo: TField;
    function GetfEvrakSiraNo: TField;
    function GetfEvrakTip: TField;
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfHesapKod: TField;
    function GetfID: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfMRPMiktar: TField;
    function GetfMRPPlanTip: TField;
    function GetfMRPSiraNo: TField;
    function GetfMRPTarih: TField;
    function GetfSirketNo: TField;
    function GetfUretimDurum: TField;
    function GetfUretimKonum: TField;
    function GetfUretimNo: TField;
    function GetfUretimPlanNo: TField;
    procedure SetDegistirenKaynak(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
    procedure SetEvrakNo(const Value: String);
    procedure SetEvrakSiraNo(const Value: Integer);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetHesapKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetMRPMiktar(const Value: Double);
    procedure SetMRPPlanTip(const Value: String);
    procedure SetMRPSiraNo(const Value: Integer);
    procedure SetMRPTarih(const Value: TDate);
    procedure SetSirketNo(const Value: String);
    procedure SetUretimDurum(const Value: String);
    procedure SetUretimKonum(const Value: String);
    procedure SetUretimNo(const Value: String);
    procedure SetUretimPlanNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property DegistirenKaynak: String read GetDegistirenKaynak write SetDegistirenKaynak;
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property DegistirenSurum: String read GetDegistirenSurum write SetDegistirenSurum;
    property DegistirenTarih: TDate read GetDegistirenTarih write SetDegistirenTarih;
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property EvrakSiraNo: Integer read GetEvrakSiraNo write SetEvrakSiraNo;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property HesapKod: String read GetHesapKod write SetHesapKod;
    property ID: Integer read GetID write SetID;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property MRPMiktar: Double read GetMRPMiktar write SetMRPMiktar;
    property MRPPlanTip: String read GetMRPPlanTip write SetMRPPlanTip;
    property MRPSiraNo: Integer read GetMRPSiraNo write SetMRPSiraNo;
    property MRPTarih: TDate read GetMRPTarih write SetMRPTarih;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property UretimDurum: String read GetUretimDurum write SetUretimDurum;
    property UretimKonum: String read GetUretimKonum write SetUretimKonum;
    property UretimNo: String read GetUretimNo write SetUretimNo;
    property UretimPlanNo: String read GetUretimPlanNo write SetUretimPlanNo;
    property fDegistirenKaynak:TField read GetfDegistirenKaynak;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
    property fEvrakNo:TField read GetfEvrakNo;
    property fEvrakSiraNo:TField read GetfEvrakSiraNo;
    property fEvrakTip:TField read GetfEvrakTip;
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fHesapKod:TField read GetfHesapKod;
    property fID:TField read GetfID;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fMRPMiktar:TField read GetfMRPMiktar;
    property fMRPPlanTip:TField read GetfMRPPlanTip;
    property fMRPSiraNo:TField read GetfMRPSiraNo;
    property fMRPTarih:TField read GetfMRPTarih;
    property fSirketNo:TField read GetfSirketNo;
    property fUretimDurum:TField read GetfUretimDurum;
    property fUretimKonum:TField read GetfUretimKonum;
    property fUretimNo:TField read GetfUretimNo;
    property fUretimPlanNo:TField read GetfUretimPlanNo;
  end;

  TTableMRPException = class(TAppTable)
  Private
    FfAciklama: TField;
    FfID: TField;
    FfKod: TField;
    FfMalKod: TField;
    FfPlanNo: TField;
    FfRowGuid: TField;
    FfSiraNo: TField;
    function GetAciklama: String;
    function GetID: Integer;
    function GetKod: String;
    function GetMalKod: String;
    function GetPlanNo: String;
    function GetRowGuid: String;
    function GetSiraNo: Integer;
    function GetfAciklama: TField;
    function GetfID: TField;
    function GetfKod: TField;
    function GetfMalKod: TField;
    function GetfPlanNo: TField;
    function GetfRowGuid: TField;
    function GetfSiraNo: TField;
    procedure SetAciklama(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetKod(const Value: String);
    procedure SetMalKod(const Value: String);
    procedure SetPlanNo(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSiraNo(const Value: Integer);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property ID: Integer read GetID write SetID;
    property Kod: String read GetKod write SetKod;
    property MalKod: String read GetMalKod write SetMalKod;
    property PlanNo: String read GetPlanNo write SetPlanNo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property fAciklama:TField read GetfAciklama;
    property fID:TField read GetfID;
    property fKod:TField read GetfKod;
    property fMalKod:TField read GetfMalKod;
    property fPlanNo:TField read GetfPlanNo;
    property fRowGuid:TField read GetfRowGuid;
    property fSiraNo:TField read GetfSiraNo;
  end;

  TTableMRPEylemPlan = class(TAppTable)
  Private
    FfAlimTip: TField;
    FfCariKart_BolgeKod: TField;
    FfCariKart_FirmaTip: TField;
    FfCariKart_Opsiyon: TField;
    FfEylemBirim: TField;
    FfEylemCikisDepoKod: TField;
    FfEylemDepoKod: TField;
    FfEylemHesapKod: TField;
    FfEylemMiktar: TField;
    FfEylemOzelYontem: TField;
    FfEylemSevkHesapKod: TField;
    FfEylemSevkTarih: TField;
    FfEylemSiparisTarih: TField;
    FfEylemTarih: TField;
    FfEylemTeslimTarih: TField;
    FfEylemTip: TField;
    FfEylemUygula: TField;
    FfEylemYontem: TField;
    FfID: TField;
    FfKaynakEvrakNo: TField;
    FfKaynakEvrakTip: TField;
    FfKaynakHesapKod: TField;
    FfKaynakMiktar: TField;
    FfKaynakSiraNo: TField;
    FfKaynakTarih: TField;
    FfMalKod: TField;
    FfMRPAlanKod: TField;
    FfMRPSiraNo: TField;
    FfOzelReceteTip: TField;
    FfPlanNo: TField;
    FfRowGuid: TField;
    FfSiraNo: TField;
    FfStokKart_KDVOran: TField;
    FfStokKart_MalAd: TField;
    FfStokKart_TeminTip: TField;
    FfStokKart_TeminYontem: TField;
    FfVersiyonNo: TField;
    function GetAlimTip: Integer;
    function GetCariKart_BolgeKod: String;
    function GetCariKart_FirmaTip: Integer;
    function GetCariKart_Opsiyon: Integer;
    function GetEylemBirim: String;
    function GetEylemCikisDepoKod: String;
    function GetEylemDepoKod: String;
    function GetEylemHesapKod: String;
    function GetEylemMiktar: Double;
    function GetEylemOzelYontem: Integer;
    function GetEylemSevkHesapKod: String;
    function GetEylemSevkTarih: TDate;
    function GetEylemSiparisTarih: TDate;
    function GetEylemTarih: TDate;
    function GetEylemTeslimTarih: TDate;
    function GetEylemTip: Integer;
    function GetEylemUygula: Integer;
    function GetEylemYontem: Integer;
    function GetID: Integer;
    function GetKaynakEvrakNo: String;
    function GetKaynakEvrakTip: Integer;
    function GetKaynakHesapKod: String;
    function GetKaynakMiktar: Double;
    function GetKaynakSiraNo: Integer;
    function GetKaynakTarih: TDate;
    function GetMalKod: String;
    function GetMRPAlanKod: String;
    function GetMRPSiraNo: Integer;
    function GetOzelReceteTip: Integer;
    function GetPlanNo: String;
    function GetRowGuid: String;
    function GetSiraNo: Integer;
    function GetStokKart_KDVOran: Integer;
    function GetStokKart_MalAd: String;
    function GetStokKart_TeminTip: Integer;
    function GetStokKart_TeminYontem: Integer;
    function GetVersiyonNo: String;
    function GetfAlimTip: TField;
    function GetfCariKart_BolgeKod: TField;
    function GetfCariKart_FirmaTip: TField;
    function GetfCariKart_Opsiyon: TField;
    function GetfEylemBirim: TField;
    function GetfEylemCikisDepoKod: TField;
    function GetfEylemDepoKod: TField;
    function GetfEylemHesapKod: TField;
    function GetfEylemMiktar: TField;
    function GetfEylemOzelYontem: TField;
    function GetfEylemSevkHesapKod: TField;
    function GetfEylemSevkTarih: TField;
    function GetfEylemSiparisTarih: TField;
    function GetfEylemTarih: TField;
    function GetfEylemTeslimTarih: TField;
    function GetfEylemTip: TField;
    function GetfEylemUygula: TField;
    function GetfEylemYontem: TField;
    function GetfID: TField;
    function GetfKaynakEvrakNo: TField;
    function GetfKaynakEvrakTip: TField;
    function GetfKaynakHesapKod: TField;
    function GetfKaynakMiktar: TField;
    function GetfKaynakSiraNo: TField;
    function GetfKaynakTarih: TField;
    function GetfMalKod: TField;
    function GetfMRPAlanKod: TField;
    function GetfMRPSiraNo: TField;
    function GetfOzelReceteTip: TField;
    function GetfPlanNo: TField;
    function GetfRowGuid: TField;
    function GetfSiraNo: TField;
    function GetfStokKart_KDVOran: TField;
    function GetfStokKart_MalAd: TField;
    function GetfStokKart_TeminTip: TField;
    function GetfStokKart_TeminYontem: TField;
    function GetfVersiyonNo: TField;
    procedure SetAlimTip(const Value: Integer);
    procedure SetCariKart_BolgeKod(const Value: String);
    procedure SetCariKart_FirmaTip(const Value: Integer);
    procedure SetCariKart_Opsiyon(const Value: Integer);
    procedure SetEylemBirim(const Value: String);
    procedure SetEylemCikisDepoKod(const Value: String);
    procedure SetEylemDepoKod(const Value: String);
    procedure SetEylemHesapKod(const Value: String);
    procedure SetEylemMiktar(const Value: Double);
    procedure SetEylemOzelYontem(const Value: Integer);
    procedure SetEylemSevkHesapKod(const Value: String);
    procedure SetEylemSevkTarih(const Value: TDate);
    procedure SetEylemSiparisTarih(const Value: TDate);
    procedure SetEylemTarih(const Value: TDate);
    procedure SetEylemTeslimTarih(const Value: TDate);
    procedure SetEylemTip(const Value: Integer);
    procedure SetEylemUygula(const Value: Integer);
    procedure SetEylemYontem(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetKaynakEvrakNo(const Value: String);
    procedure SetKaynakEvrakTip(const Value: Integer);
    procedure SetKaynakHesapKod(const Value: String);
    procedure SetKaynakMiktar(const Value: Double);
    procedure SetKaynakSiraNo(const Value: Integer);
    procedure SetKaynakTarih(const Value: TDate);
    procedure SetMalKod(const Value: String);
    procedure SetMRPAlanKod(const Value: String);
    procedure SetMRPSiraNo(const Value: Integer);
    procedure SetOzelReceteTip(const Value: Integer);
    procedure SetPlanNo(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetStokKart_KDVOran(const Value: Integer);
    procedure SetStokKart_MalAd(const Value: String);
    procedure SetStokKart_TeminTip(const Value: Integer);
    procedure SetStokKart_TeminYontem(const Value: Integer);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AlimTip: Integer read GetAlimTip write SetAlimTip;
    property CariKart_BolgeKod: String read GetCariKart_BolgeKod write SetCariKart_BolgeKod;
    property CariKart_FirmaTip: Integer read GetCariKart_FirmaTip write SetCariKart_FirmaTip;
    property CariKart_Opsiyon: Integer read GetCariKart_Opsiyon write SetCariKart_Opsiyon;
    property EylemBirim: String read GetEylemBirim write SetEylemBirim;
    property EylemCikisDepoKod: String read GetEylemCikisDepoKod write SetEylemCikisDepoKod;
    property EylemDepoKod: String read GetEylemDepoKod write SetEylemDepoKod;
    property EylemHesapKod: String read GetEylemHesapKod write SetEylemHesapKod;
    property EylemMiktar: Double read GetEylemMiktar write SetEylemMiktar;
    property EylemOzelYontem: Integer read GetEylemOzelYontem write SetEylemOzelYontem;
    property EylemSevkHesapKod: String read GetEylemSevkHesapKod write SetEylemSevkHesapKod;
    property EylemSevkTarih: TDate read GetEylemSevkTarih write SetEylemSevkTarih;
    property EylemSiparisTarih: TDate read GetEylemSiparisTarih write SetEylemSiparisTarih;
    property EylemTarih: TDate read GetEylemTarih write SetEylemTarih;
    property EylemTeslimTarih: TDate read GetEylemTeslimTarih write SetEylemTeslimTarih;
    property EylemTip: Integer read GetEylemTip write SetEylemTip;
    property EylemUygula: Integer read GetEylemUygula write SetEylemUygula;
    property EylemYontem: Integer read GetEylemYontem write SetEylemYontem;
    property ID: Integer read GetID write SetID;
    property KaynakEvrakNo: String read GetKaynakEvrakNo write SetKaynakEvrakNo;
    property KaynakEvrakTip: Integer read GetKaynakEvrakTip write SetKaynakEvrakTip;
    property KaynakHesapKod: String read GetKaynakHesapKod write SetKaynakHesapKod;
    property KaynakMiktar: Double read GetKaynakMiktar write SetKaynakMiktar;
    property KaynakSiraNo: Integer read GetKaynakSiraNo write SetKaynakSiraNo;
    property KaynakTarih: TDate read GetKaynakTarih write SetKaynakTarih;
    property MalKod: String read GetMalKod write SetMalKod;
    property MRPAlanKod: String read GetMRPAlanKod write SetMRPAlanKod;
    property MRPSiraNo: Integer read GetMRPSiraNo write SetMRPSiraNo;
    property OzelReceteTip: Integer read GetOzelReceteTip write SetOzelReceteTip;
    property PlanNo: String read GetPlanNo write SetPlanNo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property StokKart_KDVOran: Integer read GetStokKart_KDVOran write SetStokKart_KDVOran;
    property StokKart_MalAd: String read GetStokKart_MalAd write SetStokKart_MalAd;
    property StokKart_TeminTip: Integer read GetStokKart_TeminTip write SetStokKart_TeminTip;
    property StokKart_TeminYontem: Integer read GetStokKart_TeminYontem write SetStokKart_TeminYontem;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fAlimTip:TField read GetfAlimTip;
    property fCariKart_BolgeKod:TField read GetfCariKart_BolgeKod;
    property fCariKart_FirmaTip:TField read GetfCariKart_FirmaTip;
    property fCariKart_Opsiyon:TField read GetfCariKart_Opsiyon;
    property fEylemBirim:TField read GetfEylemBirim;
    property fEylemCikisDepoKod:TField read GetfEylemCikisDepoKod;
    property fEylemDepoKod:TField read GetfEylemDepoKod;
    property fEylemHesapKod:TField read GetfEylemHesapKod;
    property fEylemMiktar:TField read GetfEylemMiktar;
    property fEylemOzelYontem:TField read GetfEylemOzelYontem;
    property fEylemSevkHesapKod:TField read GetfEylemSevkHesapKod;
    property fEylemSevkTarih:TField read GetfEylemSevkTarih;
    property fEylemSiparisTarih:TField read GetfEylemSiparisTarih;
    property fEylemTarih:TField read GetfEylemTarih;
    property fEylemTeslimTarih:TField read GetfEylemTeslimTarih;
    property fEylemTip:TField read GetfEylemTip;
    property fEylemUygula:TField read GetfEylemUygula;
    property fEylemYontem:TField read GetfEylemYontem;
    property fID:TField read GetfID;
    property fKaynakEvrakNo:TField read GetfKaynakEvrakNo;
    property fKaynakEvrakTip:TField read GetfKaynakEvrakTip;
    property fKaynakHesapKod:TField read GetfKaynakHesapKod;
    property fKaynakMiktar:TField read GetfKaynakMiktar;
    property fKaynakSiraNo:TField read GetfKaynakSiraNo;
    property fKaynakTarih:TField read GetfKaynakTarih;
    property fMalKod:TField read GetfMalKod;
    property fMRPAlanKod:TField read GetfMRPAlanKod;
    property fMRPSiraNo:TField read GetfMRPSiraNo;
    property fOzelReceteTip:TField read GetfOzelReceteTip;
    property fPlanNo:TField read GetfPlanNo;
    property fRowGuid:TField read GetfRowGuid;
    property fSiraNo:TField read GetfSiraNo;
    property fStokKart_KDVOran:TField read GetfStokKart_KDVOran;
    property fStokKart_MalAd:TField read GetfStokKart_MalAd;
    property fStokKart_TeminTip:TField read GetfStokKart_TeminTip;
    property fStokKart_TeminYontem:TField read GetfStokKart_TeminYontem;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableMRPIhtiyac = class(TAppTable)
  Private
    FfAlimTip: TField;
    FfBirim: TField;
    FfDepoKod: TField;
    FfID: TField;
    FfKalan: TField;
    FfKaynakEvrakNo: TField;
    FfKaynakEvrakTip: TField;
    FfKaynakHesapKod: TField;
    FfKaynakSiraNo: TField;
    FfKullanilan: TField;
    FfMalKod: TField;
    FfMiktar: TField;
    FfMRPAlanKod: TField;
    FfMRPSiraNo: TField;
    FfOzelReceteTip: TField;
    FfPlanNo: TField;
    FfRowGuid: TField;
    FfSiraNo: TField;
    FfTarih: TField;
    FfTip: TField;
    FfVersiyonNo: TField;
    function GetAlimTip: Integer;
    function GetBirim: String;
    function GetDepoKod: String;
    function GetID: Integer;
    function GetKalan: Double;
    function GetKaynakEvrakNo: String;
    function GetKaynakEvrakTip: Integer;
    function GetKaynakHesapKod: String;
    function GetKaynakSiraNo: Integer;
    function GetKullanilan: Double;
    function GetMalKod: String;
    function GetMiktar: Double;
    function GetMRPAlanKod: String;
    function GetMRPSiraNo: Integer;
    function GetOzelReceteTip: Integer;
    function GetPlanNo: String;
    function GetRowGuid: String;
    function GetSiraNo: Integer;
    function GetTarih: TDate;
    function GetTip: Integer;
    function GetVersiyonNo: String;
    function GetfAlimTip: TField;
    function GetfBirim: TField;
    function GetfDepoKod: TField;
    function GetfID: TField;
    function GetfKalan: TField;
    function GetfKaynakEvrakNo: TField;
    function GetfKaynakEvrakTip: TField;
    function GetfKaynakHesapKod: TField;
    function GetfKaynakSiraNo: TField;
    function GetfKullanilan: TField;
    function GetfMalKod: TField;
    function GetfMiktar: TField;
    function GetfMRPAlanKod: TField;
    function GetfMRPSiraNo: TField;
    function GetfOzelReceteTip: TField;
    function GetfPlanNo: TField;
    function GetfRowGuid: TField;
    function GetfSiraNo: TField;
    function GetfTarih: TField;
    function GetfTip: TField;
    function GetfVersiyonNo: TField;
    procedure SetAlimTip(const Value: Integer);
    procedure SetBirim(const Value: String);
    procedure SetDepoKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetKalan(const Value: Double);
    procedure SetKaynakEvrakNo(const Value: String);
    procedure SetKaynakEvrakTip(const Value: Integer);
    procedure SetKaynakHesapKod(const Value: String);
    procedure SetKaynakSiraNo(const Value: Integer);
    procedure SetKullanilan(const Value: Double);
    procedure SetMalKod(const Value: String);
    procedure SetMiktar(const Value: Double);
    procedure SetMRPAlanKod(const Value: String);
    procedure SetMRPSiraNo(const Value: Integer);
    procedure SetOzelReceteTip(const Value: Integer);
    procedure SetPlanNo(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetTarih(const Value: TDate);
    procedure SetTip(const Value: Integer);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AlimTip: Integer read GetAlimTip write SetAlimTip;
    property Birim: String read GetBirim write SetBirim;
    property DepoKod: String read GetDepoKod write SetDepoKod;
    property ID: Integer read GetID write SetID;
    property Kalan: Double read GetKalan write SetKalan;
    property KaynakEvrakNo: String read GetKaynakEvrakNo write SetKaynakEvrakNo;
    property KaynakEvrakTip: Integer read GetKaynakEvrakTip write SetKaynakEvrakTip;
    property KaynakHesapKod: String read GetKaynakHesapKod write SetKaynakHesapKod;
    property KaynakSiraNo: Integer read GetKaynakSiraNo write SetKaynakSiraNo;
    property Kullanilan: Double read GetKullanilan write SetKullanilan;
    property MalKod: String read GetMalKod write SetMalKod;
    property Miktar: Double read GetMiktar write SetMiktar;
    property MRPAlanKod: String read GetMRPAlanKod write SetMRPAlanKod;
    property MRPSiraNo: Integer read GetMRPSiraNo write SetMRPSiraNo;
    property OzelReceteTip: Integer read GetOzelReceteTip write SetOzelReceteTip;
    property PlanNo: String read GetPlanNo write SetPlanNo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property Tarih: TDate read GetTarih write SetTarih;
    property Tip: Integer read GetTip write SetTip;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fAlimTip:TField read GetfAlimTip;
    property fBirim:TField read GetfBirim;
    property fDepoKod:TField read GetfDepoKod;
    property fID:TField read GetfID;
    property fKalan:TField read GetfKalan;
    property fKaynakEvrakNo:TField read GetfKaynakEvrakNo;
    property fKaynakEvrakTip:TField read GetfKaynakEvrakTip;
    property fKaynakHesapKod:TField read GetfKaynakHesapKod;
    property fKaynakSiraNo:TField read GetfKaynakSiraNo;
    property fKullanilan:TField read GetfKullanilan;
    property fMalKod:TField read GetfMalKod;
    property fMiktar:TField read GetfMiktar;
    property fMRPAlanKod:TField read GetfMRPAlanKod;
    property fMRPSiraNo:TField read GetfMRPSiraNo;
    property fOzelReceteTip:TField read GetfOzelReceteTip;
    property fPlanNo:TField read GetfPlanNo;
    property fRowGuid:TField read GetfRowGuid;
    property fSiraNo:TField read GetfSiraNo;
    property fTarih:TField read GetfTarih;
    property fTip:TField read GetfTip;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableMRPListDepReq = class(TAppTable)
  Private
    FfCikisDepoKod: TField;
    FfCikisEvrakSiraNo: TField;
    FfCikisFabrikaKod: TField;
    FfCikisIslemTip: TField;
    FfCikisMalKod: TField;
    FfCikisMiktar: TField;
    FfCikisMRPAlanKod: TField;
    FfCikisSiraNo: TField;
    FfCikisTarih: TField;
    FfCikisVersiyonNo: TField;
    FfDepoKod: TField;
    FfEvrakNo: TField;
    FfEvrakSiraNo: TField;
    FfEvrakTip: TField;
    FfFabrikaKod: TField;
    FfHesapKod: TField;
    FfID: TField;
    FfMalKod: TField;
    FfMRPAlanKod: TField;
    FfRowGuid: TField;
    FfSiraNo: TField;
    FfSirketNo: TField;
    FfVersiyonNo: TField;
    function GetCikisDepoKod: String;
    function GetCikisEvrakSiraNo: Integer;
    function GetCikisFabrikaKod: String;
    function GetCikisIslemTip: Integer;
    function GetCikisMalKod: String;
    function GetCikisMiktar: Double;
    function GetCikisMRPAlanKod: String;
    function GetCikisSiraNo: Integer;
    function GetCikisTarih: TDate;
    function GetCikisVersiyonNo: String;
    function GetDepoKod: String;
    function GetEvrakNo: String;
    function GetEvrakSiraNo: Integer;
    function GetEvrakTip: Integer;
    function GetFabrikaKod: String;
    function GetHesapKod: String;
    function GetID: Integer;
    function GetMalKod: String;
    function GetMRPAlanKod: String;
    function GetRowGuid: String;
    function GetSiraNo: Integer;
    function GetSirketNo: String;
    function GetVersiyonNo: String;
    function GetfCikisDepoKod: TField;
    function GetfCikisEvrakSiraNo: TField;
    function GetfCikisFabrikaKod: TField;
    function GetfCikisIslemTip: TField;
    function GetfCikisMalKod: TField;
    function GetfCikisMiktar: TField;
    function GetfCikisMRPAlanKod: TField;
    function GetfCikisSiraNo: TField;
    function GetfCikisTarih: TField;
    function GetfCikisVersiyonNo: TField;
    function GetfDepoKod: TField;
    function GetfEvrakNo: TField;
    function GetfEvrakSiraNo: TField;
    function GetfEvrakTip: TField;
    function GetfFabrikaKod: TField;
    function GetfHesapKod: TField;
    function GetfID: TField;
    function GetfMalKod: TField;
    function GetfMRPAlanKod: TField;
    function GetfRowGuid: TField;
    function GetfSiraNo: TField;
    function GetfSirketNo: TField;
    function GetfVersiyonNo: TField;
    procedure SetCikisDepoKod(const Value: String);
    procedure SetCikisEvrakSiraNo(const Value: Integer);
    procedure SetCikisFabrikaKod(const Value: String);
    procedure SetCikisIslemTip(const Value: Integer);
    procedure SetCikisMalKod(const Value: String);
    procedure SetCikisMiktar(const Value: Double);
    procedure SetCikisMRPAlanKod(const Value: String);
    procedure SetCikisSiraNo(const Value: Integer);
    procedure SetCikisTarih(const Value: TDate);
    procedure SetCikisVersiyonNo(const Value: String);
    procedure SetDepoKod(const Value: String);
    procedure SetEvrakNo(const Value: String);
    procedure SetEvrakSiraNo(const Value: Integer);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetFabrikaKod(const Value: String);
    procedure SetHesapKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetMalKod(const Value: String);
    procedure SetMRPAlanKod(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSirketNo(const Value: String);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property CikisDepoKod: String read GetCikisDepoKod write SetCikisDepoKod;
    property CikisEvrakSiraNo: Integer read GetCikisEvrakSiraNo write SetCikisEvrakSiraNo;
    property CikisFabrikaKod: String read GetCikisFabrikaKod write SetCikisFabrikaKod;
    property CikisIslemTip: Integer read GetCikisIslemTip write SetCikisIslemTip;
    property CikisMalKod: String read GetCikisMalKod write SetCikisMalKod;
    property CikisMiktar: Double read GetCikisMiktar write SetCikisMiktar;
    property CikisMRPAlanKod: String read GetCikisMRPAlanKod write SetCikisMRPAlanKod;
    property CikisSiraNo: Integer read GetCikisSiraNo write SetCikisSiraNo;
    property CikisTarih: TDate read GetCikisTarih write SetCikisTarih;
    property CikisVersiyonNo: String read GetCikisVersiyonNo write SetCikisVersiyonNo;
    property DepoKod: String read GetDepoKod write SetDepoKod;
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property EvrakSiraNo: Integer read GetEvrakSiraNo write SetEvrakSiraNo;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property FabrikaKod: String read GetFabrikaKod write SetFabrikaKod;
    property HesapKod: String read GetHesapKod write SetHesapKod;
    property ID: Integer read GetID write SetID;
    property MalKod: String read GetMalKod write SetMalKod;
    property MRPAlanKod: String read GetMRPAlanKod write SetMRPAlanKod;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fCikisDepoKod:TField read GetfCikisDepoKod;
    property fCikisEvrakSiraNo:TField read GetfCikisEvrakSiraNo;
    property fCikisFabrikaKod:TField read GetfCikisFabrikaKod;
    property fCikisIslemTip:TField read GetfCikisIslemTip;
    property fCikisMalKod:TField read GetfCikisMalKod;
    property fCikisMiktar:TField read GetfCikisMiktar;
    property fCikisMRPAlanKod:TField read GetfCikisMRPAlanKod;
    property fCikisSiraNo:TField read GetfCikisSiraNo;
    property fCikisTarih:TField read GetfCikisTarih;
    property fCikisVersiyonNo:TField read GetfCikisVersiyonNo;
    property fDepoKod:TField read GetfDepoKod;
    property fEvrakNo:TField read GetfEvrakNo;
    property fEvrakSiraNo:TField read GetfEvrakSiraNo;
    property fEvrakTip:TField read GetfEvrakTip;
    property fFabrikaKod:TField read GetfFabrikaKod;
    property fHesapKod:TField read GetfHesapKod;
    property fID:TField read GetfID;
    property fMalKod:TField read GetfMalKod;
    property fMRPAlanKod:TField read GetfMRPAlanKod;
    property fRowGuid:TField read GetfRowGuid;
    property fSiraNo:TField read GetfSiraNo;
    property fSirketNo:TField read GetfSirketNo;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableMRPListError = class(TAppTable)
  Private
    FfFabrikaKod: TField;
    FfHataKod: TField;
    FfHataMesaj: TField;
    FfHataNo: TField;
    FfID: TField;
    FfMalKod: TField;
    FfMRPAlanKod: TField;
    FfRowGuid: TField;
    FfSirketNo: TField;
    FfVersiyonNo: TField;
    function GetFabrikaKod: String;
    function GetHataKod: String;
    function GetHataMesaj: String;
    function GetHataNo: Integer;
    function GetID: Integer;
    function GetMalKod: String;
    function GetMRPAlanKod: String;
    function GetRowGuid: String;
    function GetSirketNo: String;
    function GetVersiyonNo: String;
    function GetfFabrikaKod: TField;
    function GetfHataKod: TField;
    function GetfHataMesaj: TField;
    function GetfHataNo: TField;
    function GetfID: TField;
    function GetfMalKod: TField;
    function GetfMRPAlanKod: TField;
    function GetfRowGuid: TField;
    function GetfSirketNo: TField;
    function GetfVersiyonNo: TField;
    procedure SetFabrikaKod(const Value: String);
    procedure SetHataKod(const Value: String);
    procedure SetHataMesaj(const Value: String);
    procedure SetHataNo(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetMalKod(const Value: String);
    procedure SetMRPAlanKod(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSirketNo(const Value: String);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property FabrikaKod: String read GetFabrikaKod write SetFabrikaKod;
    property HataKod: String read GetHataKod write SetHataKod;
    property HataMesaj: String read GetHataMesaj write SetHataMesaj;
    property HataNo: Integer read GetHataNo write SetHataNo;
    property ID: Integer read GetID write SetID;
    property MalKod: String read GetMalKod write SetMalKod;
    property MRPAlanKod: String read GetMRPAlanKod write SetMRPAlanKod;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fFabrikaKod:TField read GetfFabrikaKod;
    property fHataKod:TField read GetfHataKod;
    property fHataMesaj:TField read GetfHataMesaj;
    property fHataNo:TField read GetfHataNo;
    property fID:TField read GetfID;
    property fMalKod:TField read GetfMalKod;
    property fMRPAlanKod:TField read GetfMRPAlanKod;
    property fRowGuid:TField read GetfRowGuid;
    property fSirketNo:TField read GetfSirketNo;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableMRPListException = class(TAppTable)
  Private
    FfFabrikaKod: TField;
    FfID: TField;
    FfIstisnaKod: TField;
    FfIstisnaMesaj: TField;
    FfIstisnaNo: TField;
    FfMalKod: TField;
    FfMRPAlanKod: TField;
    FfRowGuid: TField;
    FfSiraNo: TField;
    FfSirketNo: TField;
    FfVersiyonNo: TField;
    function GetFabrikaKod: String;
    function GetID: Integer;
    function GetIstisnaKod: String;
    function GetIstisnaMesaj: String;
    function GetIstisnaNo: Integer;
    function GetMalKod: String;
    function GetMRPAlanKod: String;
    function GetRowGuid: String;
    function GetSiraNo: Integer;
    function GetSirketNo: String;
    function GetVersiyonNo: String;
    function GetfFabrikaKod: TField;
    function GetfID: TField;
    function GetfIstisnaKod: TField;
    function GetfIstisnaMesaj: TField;
    function GetfIstisnaNo: TField;
    function GetfMalKod: TField;
    function GetfMRPAlanKod: TField;
    function GetfRowGuid: TField;
    function GetfSiraNo: TField;
    function GetfSirketNo: TField;
    function GetfVersiyonNo: TField;
    procedure SetFabrikaKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetIstisnaKod(const Value: String);
    procedure SetIstisnaMesaj(const Value: String);
    procedure SetIstisnaNo(const Value: Integer);
    procedure SetMalKod(const Value: String);
    procedure SetMRPAlanKod(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSirketNo(const Value: String);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property FabrikaKod: String read GetFabrikaKod write SetFabrikaKod;
    property ID: Integer read GetID write SetID;
    property IstisnaKod: String read GetIstisnaKod write SetIstisnaKod;
    property IstisnaMesaj: String read GetIstisnaMesaj write SetIstisnaMesaj;
    property IstisnaNo: Integer read GetIstisnaNo write SetIstisnaNo;
    property MalKod: String read GetMalKod write SetMalKod;
    property MRPAlanKod: String read GetMRPAlanKod write SetMRPAlanKod;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fFabrikaKod:TField read GetfFabrikaKod;
    property fID:TField read GetfID;
    property fIstisnaKod:TField read GetfIstisnaKod;
    property fIstisnaMesaj:TField read GetfIstisnaMesaj;
    property fIstisnaNo:TField read GetfIstisnaNo;
    property fMalKod:TField read GetfMalKod;
    property fMRPAlanKod:TField read GetfMRPAlanKod;
    property fRowGuid:TField read GetfRowGuid;
    property fSiraNo:TField read GetfSiraNo;
    property fSirketNo:TField read GetfSirketNo;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableMRPListHeader = class(TAppTable)
  Private
    FfAlimDagitimBasTarih: TField;
    FfAlimDagitimTip: TField;
    FfAlimGumrukSure: TField;
    FfAlimIslemSure: TField;
    FfAlimPartiBuyukluk: TField;
    FfBasKulStokMiktar: TField;
    FfBilesenFireOran: TField;
    FfBitKulStokMiktar: TField;
    FfBrutIhtiyacMiktar: TField;
    FfFabrikaKod: TField;
    FfGirisDepoKod: TField;
    FfGirisSiparisMiktar: TField;
    FfGuvenlikSure: TField;
    FfGuvenlikSureDonemKod: TField;
    FfGuvenlikSureOran: TField;
    FfGuvenlikSureTip: TField;
    FfID: TField;
    FfKritikStokMiktar: TField;
    FfMalKod: TField;
    FfMaxAlimMiktar: TField;
    FfMaxStokMiktar: TField;
    FfMinAlimMiktar: TField;
    FfMinStokMiktar: TField;
    FfMontajFireOran: TField;
    FfMRPAlanKod: TField;
    FfMRPGrupKod: TField;
    FfMRPTarih: TField;
    FfMRPTip: TField;
    FfRowGuid: TField;
    FfSabitAlimMiktar: TField;
    FfServisSeviyeOran: TField;
    FfSirketNo: TField;
    FfStokKarsilamaKod: TField;
    FfTeminHazirlamaSure: TField;
    FfTeminOzelYontem: TField;
    FfTeminPlanlamaGun: TField;
    FfTeminSevkiyatGun: TField;
    FfTeminSevkiyatSure: TField;
    FfTeminStokKapat: TField;
    FfTeminTip: TField;
    FfTeminYer: TField;
    FfTeminYontem: TField;
    FfVersiyonNo: TField;
    FfYeniGirisSiparisMiktar: TField;
    FfYuvarlama: TField;
    function GetAlimDagitimBasTarih: TDate;
    function GetAlimDagitimTip: Integer;
    function GetAlimGumrukSure: Integer;
    function GetAlimIslemSure: Integer;
    function GetAlimPartiBuyukluk: Double;
    function GetBasKulStokMiktar: Double;
    function GetBilesenFireOran: Double;
    function GetBitKulStokMiktar: Double;
    function GetBrutIhtiyacMiktar: Double;
    function GetFabrikaKod: String;
    function GetGirisDepoKod: String;
    function GetGirisSiparisMiktar: Double;
    function GetGuvenlikSure: Integer;
    function GetGuvenlikSureDonemKod: String;
    function GetGuvenlikSureOran: Integer;
    function GetGuvenlikSureTip: Integer;
    function GetID: Integer;
    function GetKritikStokMiktar: Double;
    function GetMalKod: String;
    function GetMaxAlimMiktar: Double;
    function GetMaxStokMiktar: Double;
    function GetMinAlimMiktar: Double;
    function GetMinStokMiktar: Double;
    function GetMontajFireOran: Double;
    function GetMRPAlanKod: String;
    function GetMRPGrupKod: String;
    function GetMRPTarih: TDate;
    function GetMRPTip: Integer;
    function GetRowGuid: String;
    function GetSabitAlimMiktar: Double;
    function GetServisSeviyeOran: Integer;
    function GetSirketNo: String;
    function GetStokKarsilamaKod: String;
    function GetTeminHazirlamaSure: Integer;
    function GetTeminOzelYontem: Integer;
    function GetTeminPlanlamaGun: String;
    function GetTeminSevkiyatGun: String;
    function GetTeminSevkiyatSure: Integer;
    function GetTeminStokKapat: Integer;
    function GetTeminTip: Integer;
    function GetTeminYer: String;
    function GetTeminYontem: Integer;
    function GetVersiyonNo: String;
    function GetYeniGirisSiparisMiktar: Double;
    function GetYuvarlama: Integer;
    function GetfAlimDagitimBasTarih: TField;
    function GetfAlimDagitimTip: TField;
    function GetfAlimGumrukSure: TField;
    function GetfAlimIslemSure: TField;
    function GetfAlimPartiBuyukluk: TField;
    function GetfBasKulStokMiktar: TField;
    function GetfBilesenFireOran: TField;
    function GetfBitKulStokMiktar: TField;
    function GetfBrutIhtiyacMiktar: TField;
    function GetfFabrikaKod: TField;
    function GetfGirisDepoKod: TField;
    function GetfGirisSiparisMiktar: TField;
    function GetfGuvenlikSure: TField;
    function GetfGuvenlikSureDonemKod: TField;
    function GetfGuvenlikSureOran: TField;
    function GetfGuvenlikSureTip: TField;
    function GetfID: TField;
    function GetfKritikStokMiktar: TField;
    function GetfMalKod: TField;
    function GetfMaxAlimMiktar: TField;
    function GetfMaxStokMiktar: TField;
    function GetfMinAlimMiktar: TField;
    function GetfMinStokMiktar: TField;
    function GetfMontajFireOran: TField;
    function GetfMRPAlanKod: TField;
    function GetfMRPGrupKod: TField;
    function GetfMRPTarih: TField;
    function GetfMRPTip: TField;
    function GetfRowGuid: TField;
    function GetfSabitAlimMiktar: TField;
    function GetfServisSeviyeOran: TField;
    function GetfSirketNo: TField;
    function GetfStokKarsilamaKod: TField;
    function GetfTeminHazirlamaSure: TField;
    function GetfTeminOzelYontem: TField;
    function GetfTeminPlanlamaGun: TField;
    function GetfTeminSevkiyatGun: TField;
    function GetfTeminSevkiyatSure: TField;
    function GetfTeminStokKapat: TField;
    function GetfTeminTip: TField;
    function GetfTeminYer: TField;
    function GetfTeminYontem: TField;
    function GetfVersiyonNo: TField;
    function GetfYeniGirisSiparisMiktar: TField;
    function GetfYuvarlama: TField;
    procedure SetAlimDagitimBasTarih(const Value: TDate);
    procedure SetAlimDagitimTip(const Value: Integer);
    procedure SetAlimGumrukSure(const Value: Integer);
    procedure SetAlimIslemSure(const Value: Integer);
    procedure SetAlimPartiBuyukluk(const Value: Double);
    procedure SetBasKulStokMiktar(const Value: Double);
    procedure SetBilesenFireOran(const Value: Double);
    procedure SetBitKulStokMiktar(const Value: Double);
    procedure SetBrutIhtiyacMiktar(const Value: Double);
    procedure SetFabrikaKod(const Value: String);
    procedure SetGirisDepoKod(const Value: String);
    procedure SetGirisSiparisMiktar(const Value: Double);
    procedure SetGuvenlikSure(const Value: Integer);
    procedure SetGuvenlikSureDonemKod(const Value: String);
    procedure SetGuvenlikSureOran(const Value: Integer);
    procedure SetGuvenlikSureTip(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetKritikStokMiktar(const Value: Double);
    procedure SetMalKod(const Value: String);
    procedure SetMaxAlimMiktar(const Value: Double);
    procedure SetMaxStokMiktar(const Value: Double);
    procedure SetMinAlimMiktar(const Value: Double);
    procedure SetMinStokMiktar(const Value: Double);
    procedure SetMontajFireOran(const Value: Double);
    procedure SetMRPAlanKod(const Value: String);
    procedure SetMRPGrupKod(const Value: String);
    procedure SetMRPTarih(const Value: TDate);
    procedure SetMRPTip(const Value: Integer);
    procedure SetRowGuid(const Value: String);
    procedure SetSabitAlimMiktar(const Value: Double);
    procedure SetServisSeviyeOran(const Value: Integer);
    procedure SetSirketNo(const Value: String);
    procedure SetStokKarsilamaKod(const Value: String);
    procedure SetTeminHazirlamaSure(const Value: Integer);
    procedure SetTeminOzelYontem(const Value: Integer);
    procedure SetTeminPlanlamaGun(const Value: String);
    procedure SetTeminSevkiyatGun(const Value: String);
    procedure SetTeminSevkiyatSure(const Value: Integer);
    procedure SetTeminStokKapat(const Value: Integer);
    procedure SetTeminTip(const Value: Integer);
    procedure SetTeminYer(const Value: String);
    procedure SetTeminYontem(const Value: Integer);
    procedure SetVersiyonNo(const Value: String);
    procedure SetYeniGirisSiparisMiktar(const Value: Double);
    procedure SetYuvarlama(const Value: Integer);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AlimDagitimBasTarih: TDate read GetAlimDagitimBasTarih write SetAlimDagitimBasTarih;
    property AlimDagitimTip: Integer read GetAlimDagitimTip write SetAlimDagitimTip;
    property AlimGumrukSure: Integer read GetAlimGumrukSure write SetAlimGumrukSure;
    property AlimIslemSure: Integer read GetAlimIslemSure write SetAlimIslemSure;
    property AlimPartiBuyukluk: Double read GetAlimPartiBuyukluk write SetAlimPartiBuyukluk;
    property BasKulStokMiktar: Double read GetBasKulStokMiktar write SetBasKulStokMiktar;
    property BilesenFireOran: Double read GetBilesenFireOran write SetBilesenFireOran;
    property BitKulStokMiktar: Double read GetBitKulStokMiktar write SetBitKulStokMiktar;
    property BrutIhtiyacMiktar: Double read GetBrutIhtiyacMiktar write SetBrutIhtiyacMiktar;
    property FabrikaKod: String read GetFabrikaKod write SetFabrikaKod;
    property GirisDepoKod: String read GetGirisDepoKod write SetGirisDepoKod;
    property GirisSiparisMiktar: Double read GetGirisSiparisMiktar write SetGirisSiparisMiktar;
    property GuvenlikSure: Integer read GetGuvenlikSure write SetGuvenlikSure;
    property GuvenlikSureDonemKod: String read GetGuvenlikSureDonemKod write SetGuvenlikSureDonemKod;
    property GuvenlikSureOran: Integer read GetGuvenlikSureOran write SetGuvenlikSureOran;
    property GuvenlikSureTip: Integer read GetGuvenlikSureTip write SetGuvenlikSureTip;
    property ID: Integer read GetID write SetID;
    property KritikStokMiktar: Double read GetKritikStokMiktar write SetKritikStokMiktar;
    property MalKod: String read GetMalKod write SetMalKod;
    property MaxAlimMiktar: Double read GetMaxAlimMiktar write SetMaxAlimMiktar;
    property MaxStokMiktar: Double read GetMaxStokMiktar write SetMaxStokMiktar;
    property MinAlimMiktar: Double read GetMinAlimMiktar write SetMinAlimMiktar;
    property MinStokMiktar: Double read GetMinStokMiktar write SetMinStokMiktar;
    property MontajFireOran: Double read GetMontajFireOran write SetMontajFireOran;
    property MRPAlanKod: String read GetMRPAlanKod write SetMRPAlanKod;
    property MRPGrupKod: String read GetMRPGrupKod write SetMRPGrupKod;
    property MRPTarih: TDate read GetMRPTarih write SetMRPTarih;
    property MRPTip: Integer read GetMRPTip write SetMRPTip;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SabitAlimMiktar: Double read GetSabitAlimMiktar write SetSabitAlimMiktar;
    property ServisSeviyeOran: Integer read GetServisSeviyeOran write SetServisSeviyeOran;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property StokKarsilamaKod: String read GetStokKarsilamaKod write SetStokKarsilamaKod;
    property TeminHazirlamaSure: Integer read GetTeminHazirlamaSure write SetTeminHazirlamaSure;
    property TeminOzelYontem: Integer read GetTeminOzelYontem write SetTeminOzelYontem;
    property TeminPlanlamaGun: String read GetTeminPlanlamaGun write SetTeminPlanlamaGun;
    property TeminSevkiyatGun: String read GetTeminSevkiyatGun write SetTeminSevkiyatGun;
    property TeminSevkiyatSure: Integer read GetTeminSevkiyatSure write SetTeminSevkiyatSure;
    property TeminStokKapat: Integer read GetTeminStokKapat write SetTeminStokKapat;
    property TeminTip: Integer read GetTeminTip write SetTeminTip;
    property TeminYer: String read GetTeminYer write SetTeminYer;
    property TeminYontem: Integer read GetTeminYontem write SetTeminYontem;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property YeniGirisSiparisMiktar: Double read GetYeniGirisSiparisMiktar write SetYeniGirisSiparisMiktar;
    property Yuvarlama: Integer read GetYuvarlama write SetYuvarlama;
    property fAlimDagitimBasTarih:TField read GetfAlimDagitimBasTarih;
    property fAlimDagitimTip:TField read GetfAlimDagitimTip;
    property fAlimGumrukSure:TField read GetfAlimGumrukSure;
    property fAlimIslemSure:TField read GetfAlimIslemSure;
    property fAlimPartiBuyukluk:TField read GetfAlimPartiBuyukluk;
    property fBasKulStokMiktar:TField read GetfBasKulStokMiktar;
    property fBilesenFireOran:TField read GetfBilesenFireOran;
    property fBitKulStokMiktar:TField read GetfBitKulStokMiktar;
    property fBrutIhtiyacMiktar:TField read GetfBrutIhtiyacMiktar;
    property fFabrikaKod:TField read GetfFabrikaKod;
    property fGirisDepoKod:TField read GetfGirisDepoKod;
    property fGirisSiparisMiktar:TField read GetfGirisSiparisMiktar;
    property fGuvenlikSure:TField read GetfGuvenlikSure;
    property fGuvenlikSureDonemKod:TField read GetfGuvenlikSureDonemKod;
    property fGuvenlikSureOran:TField read GetfGuvenlikSureOran;
    property fGuvenlikSureTip:TField read GetfGuvenlikSureTip;
    property fID:TField read GetfID;
    property fKritikStokMiktar:TField read GetfKritikStokMiktar;
    property fMalKod:TField read GetfMalKod;
    property fMaxAlimMiktar:TField read GetfMaxAlimMiktar;
    property fMaxStokMiktar:TField read GetfMaxStokMiktar;
    property fMinAlimMiktar:TField read GetfMinAlimMiktar;
    property fMinStokMiktar:TField read GetfMinStokMiktar;
    property fMontajFireOran:TField read GetfMontajFireOran;
    property fMRPAlanKod:TField read GetfMRPAlanKod;
    property fMRPGrupKod:TField read GetfMRPGrupKod;
    property fMRPTarih:TField read GetfMRPTarih;
    property fMRPTip:TField read GetfMRPTip;
    property fRowGuid:TField read GetfRowGuid;
    property fSabitAlimMiktar:TField read GetfSabitAlimMiktar;
    property fServisSeviyeOran:TField read GetfServisSeviyeOran;
    property fSirketNo:TField read GetfSirketNo;
    property fStokKarsilamaKod:TField read GetfStokKarsilamaKod;
    property fTeminHazirlamaSure:TField read GetfTeminHazirlamaSure;
    property fTeminOzelYontem:TField read GetfTeminOzelYontem;
    property fTeminPlanlamaGun:TField read GetfTeminPlanlamaGun;
    property fTeminSevkiyatGun:TField read GetfTeminSevkiyatGun;
    property fTeminSevkiyatSure:TField read GetfTeminSevkiyatSure;
    property fTeminStokKapat:TField read GetfTeminStokKapat;
    property fTeminTip:TField read GetfTeminTip;
    property fTeminYer:TField read GetfTeminYer;
    property fTeminYontem:TField read GetfTeminYontem;
    property fVersiyonNo:TField read GetfVersiyonNo;
    property fYeniGirisSiparisMiktar:TField read GetfYeniGirisSiparisMiktar;
    property fYuvarlama:TField read GetfYuvarlama;
  end;

  TTableMRPListItems = class(TAppTable)
  Private
    FfCariKart_BolgeKod: TField;
    FfCariKart_FirmaTip: TField;
    FfCariKart_Opsiyon: TField;
    FfCikisDepoKod: TField;
    FfDepoKod: TField;
    FfEvrakNo: TField;
    FfEvrakSiraNo: TField;
    FfEvrakTip: TField;
    FfEylemTip: TField;
    FfFabrikaKod: TField;
    FfGirisCikis: TField;
    FfHesapKod: TField;
    FfID: TField;
    FfIslemTip: TField;
    FfIstisnaKod: TField;
    FfKulStokMiktar: TField;
    FfMalKod: TField;
    FfMiktar: TField;
    FfMRPAlanKod: TField;
    FfPlanTip: TField;
    FfRowGuid: TField;
    FfSevkTarih: TField;
    FfSiparisTarih: TField;
    FfSiraNo: TField;
    FfSiraTip: TField;
    FfSirketNo: TField;
    FfStokKart_Birim: TField;
    FfStokKart_KDVOran: TField;
    FfStokKart_MalAd: TField;
    FfStokKart_TeminYontem: TField;
    FfTarih: TField;
    FfTeslimTarih: TField;
    FfVersiyonNo: TField;
    function GetCariKart_BolgeKod: String;
    function GetCariKart_FirmaTip: Integer;
    function GetCariKart_Opsiyon: Integer;
    function GetCikisDepoKod: String;
    function GetDepoKod: String;
    function GetEvrakNo: String;
    function GetEvrakSiraNo: Integer;
    function GetEvrakTip: Integer;
    function GetEylemTip: Integer;
    function GetFabrikaKod: String;
    function GetGirisCikis: Integer;
    function GetHesapKod: String;
    function GetID: Integer;
    function GetIslemTip: Integer;
    function GetIstisnaKod: String;
    function GetKulStokMiktar: Double;
    function GetMalKod: String;
    function GetMiktar: Double;
    function GetMRPAlanKod: String;
    function GetPlanTip: Integer;
    function GetRowGuid: String;
    function GetSevkTarih: TDate;
    function GetSiparisTarih: TDate;
    function GetSiraNo: Integer;
    function GetSiraTip: Integer;
    function GetSirketNo: String;
    function GetStokKart_Birim: String;
    function GetStokKart_KDVOran: Integer;
    function GetStokKart_MalAd: String;
    function GetStokKart_TeminYontem: Integer;
    function GetTarih: TDate;
    function GetTeslimTarih: TDate;
    function GetVersiyonNo: String;
    function GetfCariKart_BolgeKod: TField;
    function GetfCariKart_FirmaTip: TField;
    function GetfCariKart_Opsiyon: TField;
    function GetfCikisDepoKod: TField;
    function GetfDepoKod: TField;
    function GetfEvrakNo: TField;
    function GetfEvrakSiraNo: TField;
    function GetfEvrakTip: TField;
    function GetfEylemTip: TField;
    function GetfFabrikaKod: TField;
    function GetfGirisCikis: TField;
    function GetfHesapKod: TField;
    function GetfID: TField;
    function GetfIslemTip: TField;
    function GetfIstisnaKod: TField;
    function GetfKulStokMiktar: TField;
    function GetfMalKod: TField;
    function GetfMiktar: TField;
    function GetfMRPAlanKod: TField;
    function GetfPlanTip: TField;
    function GetfRowGuid: TField;
    function GetfSevkTarih: TField;
    function GetfSiparisTarih: TField;
    function GetfSiraNo: TField;
    function GetfSiraTip: TField;
    function GetfSirketNo: TField;
    function GetfStokKart_Birim: TField;
    function GetfStokKart_KDVOran: TField;
    function GetfStokKart_MalAd: TField;
    function GetfStokKart_TeminYontem: TField;
    function GetfTarih: TField;
    function GetfTeslimTarih: TField;
    function GetfVersiyonNo: TField;
    procedure SetCariKart_BolgeKod(const Value: String);
    procedure SetCariKart_FirmaTip(const Value: Integer);
    procedure SetCariKart_Opsiyon(const Value: Integer);
    procedure SetCikisDepoKod(const Value: String);
    procedure SetDepoKod(const Value: String);
    procedure SetEvrakNo(const Value: String);
    procedure SetEvrakSiraNo(const Value: Integer);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetEylemTip(const Value: Integer);
    procedure SetFabrikaKod(const Value: String);
    procedure SetGirisCikis(const Value: Integer);
    procedure SetHesapKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetIslemTip(const Value: Integer);
    procedure SetIstisnaKod(const Value: String);
    procedure SetKulStokMiktar(const Value: Double);
    procedure SetMalKod(const Value: String);
    procedure SetMiktar(const Value: Double);
    procedure SetMRPAlanKod(const Value: String);
    procedure SetPlanTip(const Value: Integer);
    procedure SetRowGuid(const Value: String);
    procedure SetSevkTarih(const Value: TDate);
    procedure SetSiparisTarih(const Value: TDate);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSiraTip(const Value: Integer);
    procedure SetSirketNo(const Value: String);
    procedure SetStokKart_Birim(const Value: String);
    procedure SetStokKart_KDVOran(const Value: Integer);
    procedure SetStokKart_MalAd(const Value: String);
    procedure SetStokKart_TeminYontem(const Value: Integer);
    procedure SetTarih(const Value: TDate);
    procedure SetTeslimTarih(const Value: TDate);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property CariKart_BolgeKod: String read GetCariKart_BolgeKod write SetCariKart_BolgeKod;
    property CariKart_FirmaTip: Integer read GetCariKart_FirmaTip write SetCariKart_FirmaTip;
    property CariKart_Opsiyon: Integer read GetCariKart_Opsiyon write SetCariKart_Opsiyon;
    property CikisDepoKod: String read GetCikisDepoKod write SetCikisDepoKod;
    property DepoKod: String read GetDepoKod write SetDepoKod;
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property EvrakSiraNo: Integer read GetEvrakSiraNo write SetEvrakSiraNo;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property EylemTip: Integer read GetEylemTip write SetEylemTip;
    property FabrikaKod: String read GetFabrikaKod write SetFabrikaKod;
    property GirisCikis: Integer read GetGirisCikis write SetGirisCikis;
    property HesapKod: String read GetHesapKod write SetHesapKod;
    property ID: Integer read GetID write SetID;
    property IslemTip: Integer read GetIslemTip write SetIslemTip;
    property IstisnaKod: String read GetIstisnaKod write SetIstisnaKod;
    property KulStokMiktar: Double read GetKulStokMiktar write SetKulStokMiktar;
    property MalKod: String read GetMalKod write SetMalKod;
    property Miktar: Double read GetMiktar write SetMiktar;
    property MRPAlanKod: String read GetMRPAlanKod write SetMRPAlanKod;
    property PlanTip: Integer read GetPlanTip write SetPlanTip;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SevkTarih: TDate read GetSevkTarih write SetSevkTarih;
    property SiparisTarih: TDate read GetSiparisTarih write SetSiparisTarih;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SiraTip: Integer read GetSiraTip write SetSiraTip;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property StokKart_Birim: String read GetStokKart_Birim write SetStokKart_Birim;
    property StokKart_KDVOran: Integer read GetStokKart_KDVOran write SetStokKart_KDVOran;
    property StokKart_MalAd: String read GetStokKart_MalAd write SetStokKart_MalAd;
    property StokKart_TeminYontem: Integer read GetStokKart_TeminYontem write SetStokKart_TeminYontem;
    property Tarih: TDate read GetTarih write SetTarih;
    property TeslimTarih: TDate read GetTeslimTarih write SetTeslimTarih;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fCariKart_BolgeKod:TField read GetfCariKart_BolgeKod;
    property fCariKart_FirmaTip:TField read GetfCariKart_FirmaTip;
    property fCariKart_Opsiyon:TField read GetfCariKart_Opsiyon;
    property fCikisDepoKod:TField read GetfCikisDepoKod;
    property fDepoKod:TField read GetfDepoKod;
    property fEvrakNo:TField read GetfEvrakNo;
    property fEvrakSiraNo:TField read GetfEvrakSiraNo;
    property fEvrakTip:TField read GetfEvrakTip;
    property fEylemTip:TField read GetfEylemTip;
    property fFabrikaKod:TField read GetfFabrikaKod;
    property fGirisCikis:TField read GetfGirisCikis;
    property fHesapKod:TField read GetfHesapKod;
    property fID:TField read GetfID;
    property fIslemTip:TField read GetfIslemTip;
    property fIstisnaKod:TField read GetfIstisnaKod;
    property fKulStokMiktar:TField read GetfKulStokMiktar;
    property fMalKod:TField read GetfMalKod;
    property fMiktar:TField read GetfMiktar;
    property fMRPAlanKod:TField read GetfMRPAlanKod;
    property fPlanTip:TField read GetfPlanTip;
    property fRowGuid:TField read GetfRowGuid;
    property fSevkTarih:TField read GetfSevkTarih;
    property fSiparisTarih:TField read GetfSiparisTarih;
    property fSiraNo:TField read GetfSiraNo;
    property fSiraTip:TField read GetfSiraTip;
    property fSirketNo:TField read GetfSirketNo;
    property fStokKart_Birim:TField read GetfStokKart_Birim;
    property fStokKart_KDVOran:TField read GetfStokKart_KDVOran;
    property fStokKart_MalAd:TField read GetfStokKart_MalAd;
    property fStokKart_TeminYontem:TField read GetfStokKart_TeminYontem;
    property fTarih:TField read GetfTarih;
    property fTeslimTarih:TField read GetfTeslimTarih;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableMRPPlan = class(TAppTable)
  Private
    FfAciklama: TField;
    FfBasTarih: TField;
    FfBitTarih: TField;
    FfDegistirenKaynak: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
    FfEventType: TField;
    FfEvrakNo: TField;
    FfEvrakSiraNo: TField;
    FfEvrakTip: TField;
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfID: TField;
    FfIslemTip: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKaynakKod: TField;
    FfLabelColor: TField;
    FfLocation: TField;
    FfMamulKod: TField;
    FfMessage: TField;
    FfOptions: TField;
    FfParentID: TField;
    FfRecurrenceIndex: TField;
    FfRecurrenceInfo: TField;
    FfRowGuid: TField;
    FfSirketNo: TField;
    FfState: TField;
    FfTaskCompleteField: TField;
    FfTaskIndexField: TField;
    FfTaskLinksField: TField;
    FfTaskStatusField: TField;
    FfTypex: TField;
    FfUretimNo: TField;
    FfUretimPlanNo: TField;
    FfUretimSiraNo: TField;
    FfUretimTip: TField;
    function GetAciklama: String;
    function GetBasTarih: TDate;
    function GetBitTarih: TDate;
    function GetDegistirenKaynak: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
    function GetEventType: Integer;
    function GetEvrakNo: String;
    function GetEvrakSiraNo: Integer;
    function GetEvrakTip: Integer;
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetID: Integer;
    function GetIslemTip: Integer;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKaynakKod: String;
    function GetLabelColor: String;
    function GetLocation: Integer;
    function GetMamulKod: String;
    function GetMessage: String;
    function GetOptions: Integer;
    function GetParentID: Integer;
    function GetRecurrenceIndex: Integer;
    function GetRecurrenceInfo: Integer;
    function GetRowGuid: String;
    function GetSirketNo: String;
    function GetState: String;
    function GetTaskCompleteField: String;
    function GetTaskIndexField: String;
    function GetTaskLinksField: Integer;
    function GetTaskStatusField: String;
    function GetTypex: String;
    function GetUretimNo: String;
    function GetUretimPlanNo: String;
    function GetUretimSiraNo: Integer;
    function GetUretimTip: Integer;
    function GetfAciklama: TField;
    function GetfBasTarih: TField;
    function GetfBitTarih: TField;
    function GetfDegistirenKaynak: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
    function GetfEventType: TField;
    function GetfEvrakNo: TField;
    function GetfEvrakSiraNo: TField;
    function GetfEvrakTip: TField;
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfID: TField;
    function GetfIslemTip: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKaynakKod: TField;
    function GetfLabelColor: TField;
    function GetfLocation: TField;
    function GetfMamulKod: TField;
    function GetfMessage: TField;
    function GetfOptions: TField;
    function GetfParentID: TField;
    function GetfRecurrenceIndex: TField;
    function GetfRecurrenceInfo: TField;
    function GetfRowGuid: TField;
    function GetfSirketNo: TField;
    function GetfState: TField;
    function GetfTaskCompleteField: TField;
    function GetfTaskIndexField: TField;
    function GetfTaskLinksField: TField;
    function GetfTaskStatusField: TField;
    function GetfTypex: TField;
    function GetfUretimNo: TField;
    function GetfUretimPlanNo: TField;
    function GetfUretimSiraNo: TField;
    function GetfUretimTip: TField;
    procedure SetAciklama(const Value: String);
    procedure SetBasTarih(const Value: TDate);
    procedure SetBitTarih(const Value: TDate);
    procedure SetDegistirenKaynak(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
    procedure SetEventType(const Value: Integer);
    procedure SetEvrakNo(const Value: String);
    procedure SetEvrakSiraNo(const Value: Integer);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetIslemTip(const Value: Integer);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetLabelColor(const Value: String);
    procedure SetLocation(const Value: Integer);
    procedure SetMamulKod(const Value: String);
    procedure SetMessage(const Value: String);
    procedure SetOptions(const Value: Integer);
    procedure SetParentID(const Value: Integer);
    procedure SetRecurrenceIndex(const Value: Integer);
    procedure SetRecurrenceInfo(const Value: Integer);
    procedure SetRowGuid(const Value: String);
    procedure SetSirketNo(const Value: String);
    procedure SetState(const Value: String);
    procedure SetTaskCompleteField(const Value: String);
    procedure SetTaskIndexField(const Value: String);
    procedure SetTaskLinksField(const Value: Integer);
    procedure SetTaskStatusField(const Value: String);
    procedure SetTypex(const Value: String);
    procedure SetUretimNo(const Value: String);
    procedure SetUretimPlanNo(const Value: String);
    procedure SetUretimSiraNo(const Value: Integer);
    procedure SetUretimTip(const Value: Integer);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property BasTarih: TDate read GetBasTarih write SetBasTarih;
    property BitTarih: TDate read GetBitTarih write SetBitTarih;
    property DegistirenKaynak: String read GetDegistirenKaynak write SetDegistirenKaynak;
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property DegistirenSurum: String read GetDegistirenSurum write SetDegistirenSurum;
    property DegistirenTarih: TDate read GetDegistirenTarih write SetDegistirenTarih;
    property EventType: Integer read GetEventType write SetEventType;
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property EvrakSiraNo: Integer read GetEvrakSiraNo write SetEvrakSiraNo;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property ID: Integer read GetID write SetID;
    property IslemTip: Integer read GetIslemTip write SetIslemTip;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property LabelColor: String read GetLabelColor write SetLabelColor;
    property Location: Integer read GetLocation write SetLocation;
    property MamulKod: String read GetMamulKod write SetMamulKod;
    property Message: String read GetMessage write SetMessage;
    property Options: Integer read GetOptions write SetOptions;
    property ParentID: Integer read GetParentID write SetParentID;
    property RecurrenceIndex: Integer read GetRecurrenceIndex write SetRecurrenceIndex;
    property RecurrenceInfo: Integer read GetRecurrenceInfo write SetRecurrenceInfo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property State: String read GetState write SetState;
    property TaskCompleteField: String read GetTaskCompleteField write SetTaskCompleteField;
    property TaskIndexField: String read GetTaskIndexField write SetTaskIndexField;
    property TaskLinksField: Integer read GetTaskLinksField write SetTaskLinksField;
    property TaskStatusField: String read GetTaskStatusField write SetTaskStatusField;
    property Typex: String read GetTypex write SetTypex;
    property UretimNo: String read GetUretimNo write SetUretimNo;
    property UretimPlanNo: String read GetUretimPlanNo write SetUretimPlanNo;
    property UretimSiraNo: Integer read GetUretimSiraNo write SetUretimSiraNo;
    property UretimTip: Integer read GetUretimTip write SetUretimTip;
    property fAciklama:TField read GetfAciklama;
    property fBasTarih:TField read GetfBasTarih;
    property fBitTarih:TField read GetfBitTarih;
    property fDegistirenKaynak:TField read GetfDegistirenKaynak;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
    property fEventType:TField read GetfEventType;
    property fEvrakNo:TField read GetfEvrakNo;
    property fEvrakSiraNo:TField read GetfEvrakSiraNo;
    property fEvrakTip:TField read GetfEvrakTip;
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fID:TField read GetfID;
    property fIslemTip:TField read GetfIslemTip;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakKod:TField read GetfKaynakKod;
    property fLabelColor:TField read GetfLabelColor;
    property fLocation:TField read GetfLocation;
    property fMamulKod:TField read GetfMamulKod;
    property fMessage:TField read GetfMessage;
    property fOptions:TField read GetfOptions;
    property fParentID:TField read GetfParentID;
    property fRecurrenceIndex:TField read GetfRecurrenceIndex;
    property fRecurrenceInfo:TField read GetfRecurrenceInfo;
    property fRowGuid:TField read GetfRowGuid;
    property fSirketNo:TField read GetfSirketNo;
    property fState:TField read GetfState;
    property fTaskCompleteField:TField read GetfTaskCompleteField;
    property fTaskIndexField:TField read GetfTaskIndexField;
    property fTaskLinksField:TField read GetfTaskLinksField;
    property fTaskStatusField:TField read GetfTaskStatusField;
    property fTypex:TField read GetfTypex;
    property fUretimNo:TField read GetfUretimNo;
    property fUretimPlanNo:TField read GetfUretimPlanNo;
    property fUretimSiraNo:TField read GetfUretimSiraNo;
    property fUretimTip:TField read GetfUretimTip;
  end;

  TTableMRPParametre = class(TAppTable)
  Private
    FfAltSeviyeKodHesapDurum: TField;
    FfAltSeviyeKodHesapTip: TField;
    FfID: TField;
    FfKullanimGrupNo: TField;
    FfMRPAlanMRPTip: TField;
    FfRowGuid: TField;
    FfSirketNo: TField;
    FfVersiyonMRPTip: TField;
    function GetAltSeviyeKodHesapDurum: Integer;
    function GetAltSeviyeKodHesapTip: Integer;
    function GetID: Integer;
    function GetKullanimGrupNo: Integer;
    function GetMRPAlanMRPTip: Integer;
    function GetRowGuid: String;
    function GetSirketNo: String;
    function GetVersiyonMRPTip: Integer;
    function GetfAltSeviyeKodHesapDurum: TField;
    function GetfAltSeviyeKodHesapTip: TField;
    function GetfID: TField;
    function GetfKullanimGrupNo: TField;
    function GetfMRPAlanMRPTip: TField;
    function GetfRowGuid: TField;
    function GetfSirketNo: TField;
    function GetfVersiyonMRPTip: TField;
    procedure SetAltSeviyeKodHesapDurum(const Value: Integer);
    procedure SetAltSeviyeKodHesapTip(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetKullanimGrupNo(const Value: Integer);
    procedure SetMRPAlanMRPTip(const Value: Integer);
    procedure SetRowGuid(const Value: String);
    procedure SetSirketNo(const Value: String);
    procedure SetVersiyonMRPTip(const Value: Integer);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AltSeviyeKodHesapDurum: Integer read GetAltSeviyeKodHesapDurum write SetAltSeviyeKodHesapDurum;
    property AltSeviyeKodHesapTip: Integer read GetAltSeviyeKodHesapTip write SetAltSeviyeKodHesapTip;
    property ID: Integer read GetID write SetID;
    property KullanimGrupNo: Integer read GetKullanimGrupNo write SetKullanimGrupNo;
    property MRPAlanMRPTip: Integer read GetMRPAlanMRPTip write SetMRPAlanMRPTip;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property VersiyonMRPTip: Integer read GetVersiyonMRPTip write SetVersiyonMRPTip;
    property fAltSeviyeKodHesapDurum:TField read GetfAltSeviyeKodHesapDurum;
    property fAltSeviyeKodHesapTip:TField read GetfAltSeviyeKodHesapTip;
    property fID:TField read GetfID;
    property fKullanimGrupNo:TField read GetfKullanimGrupNo;
    property fMRPAlanMRPTip:TField read GetfMRPAlanMRPTip;
    property fRowGuid:TField read GetfRowGuid;
    property fSirketNo:TField read GetfSirketNo;
    property fVersiyonMRPTip:TField read GetfVersiyonMRPTip;
  end;

  TTableStokKarsilamaPolitika = class(TAppTable)
  Private
    FfAciklama: TField;
    FfDonemAdet: TField;
    FfDonemGunAdet: TField;
    FfDonemGunTip: TField;
    FfDonemTip: TField;
    FfHedefStokSure: TField;
    FfID: TField;
    FfMaxStokSure: TField;
    FfMinStokSure: TField;
    FfRowGuid: TField;
    FfStokKarsilamaKod: TField;
    function GetAciklama: String;
    function GetDonemAdet: Integer;
    function GetDonemGunAdet: Integer;
    function GetDonemGunTip: Integer;
    function GetDonemTip: Integer;
    function GetHedefStokSure: Integer;
    function GetID: Integer;
    function GetMaxStokSure: Integer;
    function GetMinStokSure: Integer;
    function GetRowGuid: String;
    function GetStokKarsilamaKod: String;
    function GetfAciklama: TField;
    function GetfDonemAdet: TField;
    function GetfDonemGunAdet: TField;
    function GetfDonemGunTip: TField;
    function GetfDonemTip: TField;
    function GetfHedefStokSure: TField;
    function GetfID: TField;
    function GetfMaxStokSure: TField;
    function GetfMinStokSure: TField;
    function GetfRowGuid: TField;
    function GetfStokKarsilamaKod: TField;
    procedure SetAciklama(const Value: String);
    procedure SetDonemAdet(const Value: Integer);
    procedure SetDonemGunAdet(const Value: Integer);
    procedure SetDonemGunTip(const Value: Integer);
    procedure SetDonemTip(const Value: Integer);
    procedure SetHedefStokSure(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetMaxStokSure(const Value: Integer);
    procedure SetMinStokSure(const Value: Integer);
    procedure SetRowGuid(const Value: String);
    procedure SetStokKarsilamaKod(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property DonemAdet: Integer read GetDonemAdet write SetDonemAdet;
    property DonemGunAdet: Integer read GetDonemGunAdet write SetDonemGunAdet;
    property DonemGunTip: Integer read GetDonemGunTip write SetDonemGunTip;
    property DonemTip: Integer read GetDonemTip write SetDonemTip;
    property HedefStokSure: Integer read GetHedefStokSure write SetHedefStokSure;
    property ID: Integer read GetID write SetID;
    property MaxStokSure: Integer read GetMaxStokSure write SetMaxStokSure;
    property MinStokSure: Integer read GetMinStokSure write SetMinStokSure;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property StokKarsilamaKod: String read GetStokKarsilamaKod write SetStokKarsilamaKod;
    property fAciklama:TField read GetfAciklama;
    property fDonemAdet:TField read GetfDonemAdet;
    property fDonemGunAdet:TField read GetfDonemGunAdet;
    property fDonemGunTip:TField read GetfDonemGunTip;
    property fDonemTip:TField read GetfDonemTip;
    property fHedefStokSure:TField read GetfHedefStokSure;
    property fID:TField read GetfID;
    property fMaxStokSure:TField read GetfMaxStokSure;
    property fMinStokSure:TField read GetfMinStokSure;
    property fRowGuid:TField read GetfRowGuid;
    property fStokKarsilamaKod:TField read GetfStokKarsilamaKod;
  end;

  TTableMRPStok = class(TAppTable)
  Private
    FfBirim: TField;
    FfDepoKod: TField;
    FfID: TField;
    FfIlkIhtiyacTarih: TField;
    FfKalan: TField;
    FfKaynakEvrakNo: TField;
    FfKaynakEvrakTip: TField;
    FfKaynakHesapKod: TField;
    FfKaynakMalKod: TField;
    FfKaynakSiraNo: TField;
    FfKaynakVersiyonNo: TField;
    FfKullanilan: TField;
    FfMalKod: TField;
    FfMiktar: TField;
    FfMRPAlanKod: TField;
    FfPlanNo: TField;
    FfRowGuid: TField;
    FfSiraNo: TField;
    FfSonIhtiyacTarih: TField;
    FfTarih: TField;
    FfTip: TField;
    FfVersiyonNo: TField;
    function GetBirim: String;
    function GetDepoKod: String;
    function GetID: Integer;
    function GetIlkIhtiyacTarih: TDate;
    function GetKalan: Double;
    function GetKaynakEvrakNo: String;
    function GetKaynakEvrakTip: Integer;
    function GetKaynakHesapKod: String;
    function GetKaynakMalKod: String;
    function GetKaynakSiraNo: Integer;
    function GetKaynakVersiyonNo: String;
    function GetKullanilan: Double;
    function GetMalKod: String;
    function GetMiktar: Double;
    function GetMRPAlanKod: String;
    function GetPlanNo: String;
    function GetRowGuid: String;
    function GetSiraNo: Integer;
    function GetSonIhtiyacTarih: TDate;
    function GetTarih: TDate;
    function GetTip: Integer;
    function GetVersiyonNo: String;
    function GetfBirim: TField;
    function GetfDepoKod: TField;
    function GetfID: TField;
    function GetfIlkIhtiyacTarih: TField;
    function GetfKalan: TField;
    function GetfKaynakEvrakNo: TField;
    function GetfKaynakEvrakTip: TField;
    function GetfKaynakHesapKod: TField;
    function GetfKaynakMalKod: TField;
    function GetfKaynakSiraNo: TField;
    function GetfKaynakVersiyonNo: TField;
    function GetfKullanilan: TField;
    function GetfMalKod: TField;
    function GetfMiktar: TField;
    function GetfMRPAlanKod: TField;
    function GetfPlanNo: TField;
    function GetfRowGuid: TField;
    function GetfSiraNo: TField;
    function GetfSonIhtiyacTarih: TField;
    function GetfTarih: TField;
    function GetfTip: TField;
    function GetfVersiyonNo: TField;
    procedure SetBirim(const Value: String);
    procedure SetDepoKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetIlkIhtiyacTarih(const Value: TDate);
    procedure SetKalan(const Value: Double);
    procedure SetKaynakEvrakNo(const Value: String);
    procedure SetKaynakEvrakTip(const Value: Integer);
    procedure SetKaynakHesapKod(const Value: String);
    procedure SetKaynakMalKod(const Value: String);
    procedure SetKaynakSiraNo(const Value: Integer);
    procedure SetKaynakVersiyonNo(const Value: String);
    procedure SetKullanilan(const Value: Double);
    procedure SetMalKod(const Value: String);
    procedure SetMiktar(const Value: Double);
    procedure SetMRPAlanKod(const Value: String);
    procedure SetPlanNo(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSonIhtiyacTarih(const Value: TDate);
    procedure SetTarih(const Value: TDate);
    procedure SetTip(const Value: Integer);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Birim: String read GetBirim write SetBirim;
    property DepoKod: String read GetDepoKod write SetDepoKod;
    property ID: Integer read GetID write SetID;
    property IlkIhtiyacTarih: TDate read GetIlkIhtiyacTarih write SetIlkIhtiyacTarih;
    property Kalan: Double read GetKalan write SetKalan;
    property KaynakEvrakNo: String read GetKaynakEvrakNo write SetKaynakEvrakNo;
    property KaynakEvrakTip: Integer read GetKaynakEvrakTip write SetKaynakEvrakTip;
    property KaynakHesapKod: String read GetKaynakHesapKod write SetKaynakHesapKod;
    property KaynakMalKod: String read GetKaynakMalKod write SetKaynakMalKod;
    property KaynakSiraNo: Integer read GetKaynakSiraNo write SetKaynakSiraNo;
    property KaynakVersiyonNo: String read GetKaynakVersiyonNo write SetKaynakVersiyonNo;
    property Kullanilan: Double read GetKullanilan write SetKullanilan;
    property MalKod: String read GetMalKod write SetMalKod;
    property Miktar: Double read GetMiktar write SetMiktar;
    property MRPAlanKod: String read GetMRPAlanKod write SetMRPAlanKod;
    property PlanNo: String read GetPlanNo write SetPlanNo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SonIhtiyacTarih: TDate read GetSonIhtiyacTarih write SetSonIhtiyacTarih;
    property Tarih: TDate read GetTarih write SetTarih;
    property Tip: Integer read GetTip write SetTip;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fBirim:TField read GetfBirim;
    property fDepoKod:TField read GetfDepoKod;
    property fID:TField read GetfID;
    property fIlkIhtiyacTarih:TField read GetfIlkIhtiyacTarih;
    property fKalan:TField read GetfKalan;
    property fKaynakEvrakNo:TField read GetfKaynakEvrakNo;
    property fKaynakEvrakTip:TField read GetfKaynakEvrakTip;
    property fKaynakHesapKod:TField read GetfKaynakHesapKod;
    property fKaynakMalKod:TField read GetfKaynakMalKod;
    property fKaynakSiraNo:TField read GetfKaynakSiraNo;
    property fKaynakVersiyonNo:TField read GetfKaynakVersiyonNo;
    property fKullanilan:TField read GetfKullanilan;
    property fMalKod:TField read GetfMalKod;
    property fMiktar:TField read GetfMiktar;
    property fMRPAlanKod:TField read GetfMRPAlanKod;
    property fPlanNo:TField read GetfPlanNo;
    property fRowGuid:TField read GetfRowGuid;
    property fSiraNo:TField read GetfSiraNo;
    property fSonIhtiyacTarih:TField read GetfSonIhtiyacTarih;
    property fTarih:TField read GetfTarih;
    property fTip:TField read GetfTip;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableUretimPlanlamaKaynakTakvim = class(TAppTable)
  Private
    FfFazlaMesai: TField;
    FfFazlaMesaiVardiyaKod: TField;
    FfID: TField;
    FfKaynakKod: TField;
    FfPlanNo: TField;
    FfTakvimKod: TField;
    function GetFazlaMesai: Double;
    function GetFazlaMesaiVardiyaKod: String;
    function GetID: Integer;
    function GetKaynakKod: String;
    function GetPlanNo: String;
    function GetTakvimKod: String;
    function GetfFazlaMesai: TField;
    function GetfFazlaMesaiVardiyaKod: TField;
    function GetfID: TField;
    function GetfKaynakKod: TField;
    function GetfPlanNo: TField;
    function GetfTakvimKod: TField;
    procedure SetFazlaMesai(const Value: Double);
    procedure SetFazlaMesaiVardiyaKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetPlanNo(const Value: String);
    procedure SetTakvimKod(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property FazlaMesai: Double read GetFazlaMesai write SetFazlaMesai;
    property FazlaMesaiVardiyaKod: String read GetFazlaMesaiVardiyaKod write SetFazlaMesaiVardiyaKod;
    property ID: Integer read GetID write SetID;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property PlanNo: String read GetPlanNo write SetPlanNo;
    property TakvimKod: String read GetTakvimKod write SetTakvimKod;
    property fFazlaMesai:TField read GetfFazlaMesai;
    property fFazlaMesaiVardiyaKod:TField read GetfFazlaMesaiVardiyaKod;
    property fID:TField read GetfID;
    property fKaynakKod:TField read GetfKaynakKod;
    property fPlanNo:TField read GetfPlanNo;
    property fTakvimKod:TField read GetfTakvimKod;
  end;

  TTableUretimPlanlamaBaslik = class(TAppTable)
  Private
    FfAciklama: TField;
    FfBasTarih: TField;
    FfBitTarih: TField;
    FfFazlaMesai: TField;
    FfFazlaMesaiVardiyaKod: TField;
    FfID: TField;
    FfPlanNo: TField;
    FfTakvimKod: TField;
    function GetAciklama: String;
    function GetBasTarih: TDate;
    function GetBitTarih: TDate;
    function GetFazlaMesai: Double;
    function GetFazlaMesaiVardiyaKod: String;
    function GetID: Integer;
    function GetPlanNo: String;
    function GetTakvimKod: String;
    function GetfAciklama: TField;
    function GetfBasTarih: TField;
    function GetfBitTarih: TField;
    function GetfFazlaMesai: TField;
    function GetfFazlaMesaiVardiyaKod: TField;
    function GetfID: TField;
    function GetfPlanNo: TField;
    function GetfTakvimKod: TField;
    procedure SetAciklama(const Value: String);
    procedure SetBasTarih(const Value: TDate);
    procedure SetBitTarih(const Value: TDate);
    procedure SetFazlaMesai(const Value: Double);
    procedure SetFazlaMesaiVardiyaKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetPlanNo(const Value: String);
    procedure SetTakvimKod(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property BasTarih: TDate read GetBasTarih write SetBasTarih;
    property BitTarih: TDate read GetBitTarih write SetBitTarih;
    property FazlaMesai: Double read GetFazlaMesai write SetFazlaMesai;
    property FazlaMesaiVardiyaKod: String read GetFazlaMesaiVardiyaKod write SetFazlaMesaiVardiyaKod;
    property ID: Integer read GetID write SetID;
    property PlanNo: String read GetPlanNo write SetPlanNo;
    property TakvimKod: String read GetTakvimKod write SetTakvimKod;
    property fAciklama:TField read GetfAciklama;
    property fBasTarih:TField read GetfBasTarih;
    property fBitTarih:TField read GetfBitTarih;
    property fFazlaMesai:TField read GetfFazlaMesai;
    property fFazlaMesaiVardiyaKod:TField read GetfFazlaMesaiVardiyaKod;
    property fID:TField read GetfID;
    property fPlanNo:TField read GetfPlanNo;
    property fTakvimKod:TField read GetfTakvimKod;
  end;

  TTableUretimPlanlamaDetay = class(TAppTable)
  Private
    FfBasTarih: TField;
    FfBasTarihSaat: TField;
    FfBitTarih: TField;
    FfBitTarihSaat: TField;
    FfCalismaSure: TField;
    FfID: TField;
    FfIsMerkezKod: TField;
    FfKaynakKod: TField;
    FfKurulumSure: TField;
    FfMalKod: TField;
    FfMiktar: TField;
    FfPlanBasTarih: TField;
    FfPlanBitTarih: TField;
    FfPlanNo: TField;
    FfPlanSiraNo: TField;
    FfSiraNo: TField;
    FfSokumSure: TField;
    FfMalAd: TField;
    FfToplamSure: TField;
    function GetBasTarih: TDate;
    function GetBasTarihSaat: TDate;
    function GetBitTarih: TDate;
    function GetBitTarihSaat: TDate;
    function GetCalismaSure: Double;
    function GetID: Integer;
    function GetIsMerkezKod: String;
    function GetKaynakKod: String;
    function GetKurulumSure: Double;
    function GetMalKod: String;
    function GetMiktar: Double;
    function GetPlanBasTarih: TDate;
    function GetPlanBitTarih: TDate;
    function GetPlanNo: String;
    function GetPlanSiraNo: Integer;
    function GetSiraNo: Integer;
    function GetSokumSure: Double;
    function GetMalAd: String;
    function GetToplamSure: Double;
    function GetfBasTarih: TField;
    function GetfBasTarihSaat: TField;
    function GetfBitTarih: TField;
    function GetfBitTarihSaat: TField;
    function GetfCalismaSure: TField;
    function GetfID: TField;
    function GetfIsMerkezKod: TField;
    function GetfKaynakKod: TField;
    function GetfKurulumSure: TField;
    function GetfMalKod: TField;
    function GetfMiktar: TField;
    function GetfPlanBasTarih: TField;
    function GetfPlanBitTarih: TField;
    function GetfPlanNo: TField;
    function GetfPlanSiraNo: TField;
    function GetfSiraNo: TField;
    function GetfSokumSure: TField;
    function GetfMalAd: TField;
    function GetfToplamSure: TField;
    procedure SetBasTarih(const Value: TDate);
    procedure SetBasTarihSaat(const Value: TDate);
    procedure SetBitTarih(const Value: TDate);
    procedure SetBitTarihSaat(const Value: TDate);
    procedure SetCalismaSure(const Value: Double);
    procedure SetID(const Value: Integer);
    procedure SetIsMerkezKod(const Value: String);
    procedure SetKaynakKod(const Value: String);
    procedure SetKurulumSure(const Value: Double);
    procedure SetMalKod(const Value: String);
    procedure SetMiktar(const Value: Double);
    procedure SetPlanBasTarih(const Value: TDate);
    procedure SetPlanBitTarih(const Value: TDate);
    procedure SetPlanNo(const Value: String);
    procedure SetPlanSiraNo(const Value: Integer);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSokumSure(const Value: Double);
    procedure SetMalAd(const Value: String);
    procedure SetToplamSure(const Value: Double);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property BasTarih: TDate read GetBasTarih write SetBasTarih;
    property BasTarihSaat: TDate read GetBasTarihSaat write SetBasTarihSaat;
    property BitTarih: TDate read GetBitTarih write SetBitTarih;
    property BitTarihSaat: TDate read GetBitTarihSaat write SetBitTarihSaat;
    property CalismaSure: Double read GetCalismaSure write SetCalismaSure;
    property ID: Integer read GetID write SetID;
    property IsMerkezKod: String read GetIsMerkezKod write SetIsMerkezKod;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property KurulumSure: Double read GetKurulumSure write SetKurulumSure;
    property MalKod: String read GetMalKod write SetMalKod;
    property Miktar: Double read GetMiktar write SetMiktar;
    property PlanBasTarih: TDate read GetPlanBasTarih write SetPlanBasTarih;
    property PlanBitTarih: TDate read GetPlanBitTarih write SetPlanBitTarih;
    property PlanNo: String read GetPlanNo write SetPlanNo;
    property PlanSiraNo: Integer read GetPlanSiraNo write SetPlanSiraNo;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SokumSure: Double read GetSokumSure write SetSokumSure;
    property MalAd: String read GetMalAd write SetMalAd;
    property ToplamSure: Double read GetToplamSure write SetToplamSure;
    property fBasTarih:TField read GetfBasTarih;
    property fBasTarihSaat:TField read GetfBasTarihSaat;
    property fBitTarih:TField read GetfBitTarih;
    property fBitTarihSaat:TField read GetfBitTarihSaat;
    property fCalismaSure:TField read GetfCalismaSure;
    property fID:TField read GetfID;
    property fIsMerkezKod:TField read GetfIsMerkezKod;
    property fKaynakKod:TField read GetfKaynakKod;
    property fKurulumSure:TField read GetfKurulumSure;
    property fMalKod:TField read GetfMalKod;
    property fMiktar:TField read GetfMiktar;
    property fPlanBasTarih:TField read GetfPlanBasTarih;
    property fPlanBitTarih:TField read GetfPlanBitTarih;
    property fPlanNo:TField read GetfPlanNo;
    property fPlanSiraNo:TField read GetfPlanSiraNo;
    property fSiraNo:TField read GetfSiraNo;
    property fSokumSure:TField read GetfSokumSure;
    property fMalAd:TField read GetfMalAd;
    property fToplamSure:TField read GetfToplamSure;
  end;

  TTableUretimPlanlama = class(TAppTable)
  Private
    FfPlanlamaStokTukenisMiktar: TField;
    FfPlanlamaStokTukenisTarih: TField;
    FfTamamlandi: TField;
    FfBasStokMiktar: TField;
    FfBasTarih: TField;
    FfBasTarihSaat: TField;
    FfBitStokMiktar: TField;
    FfBitTarih: TField;
    FfDagitimYuzde: TField;
    FfGrup: TField;
    FfGrupSiraNo: TField;
    FfID: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKaynakKod: TField;
    FfMalKod: TField;
    FfMiktar: TField;
    FfOncelik: TField;
    FfPlanNo: TField;
    FfSatisHedef: TField;
    FfSiraNo: TField;
    FfStokOrtalamaTasimaMiktar: TField;
    FfStokTukenisMiktar: TField;
    FfStokTukenisTarih: TField;
    FfUretimMiktar: TField;
    function GetPlanlamaStokTukenisMiktar: Double;
    function GetPlanlamaStokTukenisTarih: TDate;
    function GetTamamlandi: Integer;
    function GetBasStokMiktar: Double;
    function GetBasTarih: TDate;
    function GetBasTarihSaat: TDate;
    function GetBitStokMiktar: Double;
    function GetBitTarih: TDate;
    function GetDagitimYuzde: Integer;
    function GetGrup: Integer;
    function GetGrupSiraNo: Integer;
    function GetID: Integer;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKaynakKod: String;
    function GetMalKod: String;
    function GetMiktar: Double;
    function GetOncelik: Integer;
    function GetPlanNo: String;
    function GetSatisHedef: Double;
    function GetSiraNo: Integer;
    function GetStokOrtalamaTasimaMiktar: Double;
    function GetStokTukenisMiktar: Double;
    function GetStokTukenisTarih: TDate;
    function GetUretimMiktar: Double;
    function GetfPlanlamaStokTukenisMiktar: TField;
    function GetfPlanlamaStokTukenisTarih: TField;
    function GetfTamamlandi: TField;
    function GetfBasStokMiktar: TField;
    function GetfBasTarih: TField;
    function GetfBasTarihSaat: TField;
    function GetfBitStokMiktar: TField;
    function GetfBitTarih: TField;
    function GetfDagitimYuzde: TField;
    function GetfGrup: TField;
    function GetfGrupSiraNo: TField;
    function GetfID: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKaynakKod: TField;
    function GetfMalKod: TField;
    function GetfMiktar: TField;
    function GetfOncelik: TField;
    function GetfPlanNo: TField;
    function GetfSatisHedef: TField;
    function GetfSiraNo: TField;
    function GetfStokOrtalamaTasimaMiktar: TField;
    function GetfStokTukenisMiktar: TField;
    function GetfStokTukenisTarih: TField;
    function GetfUretimMiktar: TField;
    procedure SetPlanlamaStokTukenisMiktar(const Value: Double);
    procedure SetPlanlamaStokTukenisTarih(const Value: TDate);
    procedure SetTamamlandi(const Value: Integer);
    procedure SetBasStokMiktar(const Value: Double);
    procedure SetBasTarih(const Value: TDate);
    procedure SetBasTarihSaat(const Value: TDate);
    procedure SetBitStokMiktar(const Value: Double);
    procedure SetBitTarih(const Value: TDate);
    procedure SetDagitimYuzde(const Value: Integer);
    procedure SetGrup(const Value: Integer);
    procedure SetGrupSiraNo(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetMalKod(const Value: String);
    procedure SetMiktar(const Value: Double);
    procedure SetOncelik(const Value: Integer);
    procedure SetPlanNo(const Value: String);
    procedure SetSatisHedef(const Value: Double);
    procedure SetSiraNo(const Value: Integer);
    procedure SetStokOrtalamaTasimaMiktar(const Value: Double);
    procedure SetStokTukenisMiktar(const Value: Double);
    procedure SetStokTukenisTarih(const Value: TDate);
    procedure SetUretimMiktar(const Value: Double);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property PlanlamaStokTukenisMiktar: Double read GetPlanlamaStokTukenisMiktar write SetPlanlamaStokTukenisMiktar;
    property PlanlamaStokTukenisTarih: TDate read GetPlanlamaStokTukenisTarih write SetPlanlamaStokTukenisTarih;
    property Tamamlandi: Integer read GetTamamlandi write SetTamamlandi;
    property BasStokMiktar: Double read GetBasStokMiktar write SetBasStokMiktar;
    property BasTarih: TDate read GetBasTarih write SetBasTarih;
    property BasTarihSaat: TDate read GetBasTarihSaat write SetBasTarihSaat;
    property BitStokMiktar: Double read GetBitStokMiktar write SetBitStokMiktar;
    property BitTarih: TDate read GetBitTarih write SetBitTarih;
    property DagitimYuzde: Integer read GetDagitimYuzde write SetDagitimYuzde;
    property Grup: Integer read GetGrup write SetGrup;
    property GrupSiraNo: Integer read GetGrupSiraNo write SetGrupSiraNo;
    property ID: Integer read GetID write SetID;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property MalKod: String read GetMalKod write SetMalKod;
    property Miktar: Double read GetMiktar write SetMiktar;
    property Oncelik: Integer read GetOncelik write SetOncelik;
    property PlanNo: String read GetPlanNo write SetPlanNo;
    property SatisHedef: Double read GetSatisHedef write SetSatisHedef;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property StokOrtalamaTasimaMiktar: Double read GetStokOrtalamaTasimaMiktar write SetStokOrtalamaTasimaMiktar;
    property StokTukenisMiktar: Double read GetStokTukenisMiktar write SetStokTukenisMiktar;
    property StokTukenisTarih: TDate read GetStokTukenisTarih write SetStokTukenisTarih;
    property UretimMiktar: Double read GetUretimMiktar write SetUretimMiktar;
    property fPlanlamaStokTukenisMiktar:TField read GetfPlanlamaStokTukenisMiktar;
    property fPlanlamaStokTukenisTarih:TField read GetfPlanlamaStokTukenisTarih;
    property fTamamlandi:TField read GetfTamamlandi;
    property fBasStokMiktar:TField read GetfBasStokMiktar;
    property fBasTarih:TField read GetfBasTarih;
    property fBasTarihSaat:TField read GetfBasTarihSaat;
    property fBitStokMiktar:TField read GetfBitStokMiktar;
    property fBitTarih:TField read GetfBitTarih;
    property fDagitimYuzde:TField read GetfDagitimYuzde;
    property fGrup:TField read GetfGrup;
    property fGrupSiraNo:TField read GetfGrupSiraNo;
    property fID:TField read GetfID;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakKod:TField read GetfKaynakKod;
    property fMalKod:TField read GetfMalKod;
    property fMiktar:TField read GetfMiktar;
    property fOncelik:TField read GetfOncelik;
    property fPlanNo:TField read GetfPlanNo;
    property fSatisHedef:TField read GetfSatisHedef;
    property fSiraNo:TField read GetfSiraNo;
    property fStokOrtalamaTasimaMiktar:TField read GetfStokOrtalamaTasimaMiktar;
    property fStokTukenisMiktar:TField read GetfStokTukenisMiktar;
    property fStokTukenisTarih:TField read GetfStokTukenisTarih;
    property fUretimMiktar:TField read GetfUretimMiktar;
  end;

  TTableUretimPlanlamaStokTakvim = class(TAppTable)
  Private
    FfGunBasiMiktar: TField;
    FfGunSonuMiktar: TField;
    FfMalAd: TField;
    FfMalKod: TField;
    FfSatisMiktar: TField;
    FfStokOrtalamaTasimaMiktar: TField;
    FfTarih: TField;
    FfUretimMiktar: TField;
    function GetGunBasiMiktar: Double;
    function GetGunSonuMiktar: Double;
    function GetMalAd: String;
    function GetMalKod: String;
    function GetSatisMiktar: Double;
    function GetStokOrtalamaTasimaMiktar: Double;
    function GetTarih: TDate;
    function GetUretimMiktar: Double;
    function GetfGunBasiMiktar: TField;
    function GetfGunSonuMiktar: TField;
    function GetfMalAd: TField;
    function GetfMalKod: TField;
    function GetfSatisMiktar: TField;
    function GetfStokOrtalamaTasimaMiktar: TField;
    function GetfTarih: TField;
    function GetfUretimMiktar: TField;
    procedure SetGunBasiMiktar(const Value: Double);
    procedure SetGunSonuMiktar(const Value: Double);
    procedure SetMalAd(const Value: String);
    procedure SetMalKod(const Value: String);
    procedure SetSatisMiktar(const Value: Double);
    procedure SetStokOrtalamaTasimaMiktar(const Value: Double);
    procedure SetTarih(const Value: TDate);
    procedure SetUretimMiktar(const Value: Double);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property GunBasiMiktar: Double read GetGunBasiMiktar write SetGunBasiMiktar;
    property GunSonuMiktar: Double read GetGunSonuMiktar write SetGunSonuMiktar;
    property MalAd: String read GetMalAd write SetMalAd;
    property MalKod: String read GetMalKod write SetMalKod;
    property SatisMiktar: Double read GetSatisMiktar write SetSatisMiktar;
    property StokOrtalamaTasimaMiktar: Double read GetStokOrtalamaTasimaMiktar write SetStokOrtalamaTasimaMiktar;
    property Tarih: TDate read GetTarih write SetTarih;
    property UretimMiktar: Double read GetUretimMiktar write SetUretimMiktar;
    property fGunBasiMiktar:TField read GetfGunBasiMiktar;
    property fGunSonuMiktar:TField read GetfGunSonuMiktar;
    property fMalAd:TField read GetfMalAd;
    property fMalKod:TField read GetfMalKod;
    property fSatisMiktar:TField read GetfSatisMiktar;
    property fStokOrtalamaTasimaMiktar:TField read GetfStokOrtalamaTasimaMiktar;
    property fTarih:TField read GetfTarih;
    property fUretimMiktar:TField read GetfUretimMiktar;
  end;

  TTableUretimPlanlamaSatisYuzde = class(TAppTable)
  Private
    FfBasTarih: TField;
    FfBitTarih: TField;
    FfID: TField;
    FfMalKod: TField;
    FfPlanNo: TField;
    FfSatisYuzde: TField;
    function GetBasTarih: TDate;
    function GetBitTarih: TDate;
    function GetID: Integer;
    function GetMalKod: String;
    function GetPlanNo: String;
    function GetSatisYuzde: Integer;
    function GetfBasTarih: TField;
    function GetfBitTarih: TField;
    function GetfID: TField;
    function GetfMalKod: TField;
    function GetfPlanNo: TField;
    function GetfSatisYuzde: TField;
    procedure SetBasTarih(const Value: TDate);
    procedure SetBitTarih(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetMalKod(const Value: String);
    procedure SetPlanNo(const Value: String);
    procedure SetSatisYuzde(const Value: Integer);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property BasTarih: TDate read GetBasTarih write SetBasTarih;
    property BitTarih: TDate read GetBitTarih write SetBitTarih;
    property ID: Integer read GetID write SetID;
    property MalKod: String read GetMalKod write SetMalKod;
    property PlanNo: String read GetPlanNo write SetPlanNo;
    property SatisYuzde: Integer read GetSatisYuzde write SetSatisYuzde;
    property fBasTarih:TField read GetfBasTarih;
    property fBitTarih:TField read GetfBitTarih;
    property fID:TField read GetfID;
    property fMalKod:TField read GetfMalKod;
    property fPlanNo:TField read GetfPlanNo;
    property fSatisYuzde:TField read GetfSatisYuzde;
  end;

  TTableUretimTahminBaslik = class(TAppTable)
  Private
    FfAciklama: TField;
    FfBasTarih: TField;
    FfBirim: TField;
    FfBitTarih: TField;
    FfButceBasTarih: TField;
    FfButceBitTarih: TField;
    FfButceDonemAdet: TField;
    FfButceDonemTip: TField;
    FfButceKod: TField;
    FfButceSurum: TField;
    FfDonemAdet: TField;
    FfDonemTip: TField;
    FfID: TField;
    FfIslemBasTarih: TField;
    FfIslemBitTarih: TField;
    FfIslemDonemAdet: TField;
    FfIslemDonemTip: TField;
    FfIslemIsMerkezKod: TField;
    FfRowGuid: TField;
    FfSKod1: TField;
    FfSKod2: TField;
    FfSKod3: TField;
    FfSKod4: TField;
    FfSKod5: TField;
    FfTahminNo: TField;
    FfTamKapasiteTakvimKod: TField;
    function GetAciklama: String;
    function GetBasTarih: TDate;
    function GetBirim: String;
    function GetBitTarih: TDate;
    function GetButceBasTarih: TDate;
    function GetButceBitTarih: TDate;
    function GetButceDonemAdet: Integer;
    function GetButceDonemTip: Integer;
    function GetButceKod: String;
    function GetButceSurum: String;
    function GetDonemAdet: Integer;
    function GetDonemTip: Integer;
    function GetID: Integer;
    function GetIslemBasTarih: TDate;
    function GetIslemBitTarih: TDate;
    function GetIslemDonemAdet: Integer;
    function GetIslemDonemTip: Integer;
    function GetIslemIsMerkezKod: String;
    function GetRowGuid: String;
    function GetSKod1: String;
    function GetSKod2: String;
    function GetSKod3: String;
    function GetSKod4: String;
    function GetSKod5: String;
    function GetTahminNo: String;
    function GetTamKapasiteTakvimKod: String;
    function GetfAciklama: TField;
    function GetfBasTarih: TField;
    function GetfBirim: TField;
    function GetfBitTarih: TField;
    function GetfButceBasTarih: TField;
    function GetfButceBitTarih: TField;
    function GetfButceDonemAdet: TField;
    function GetfButceDonemTip: TField;
    function GetfButceKod: TField;
    function GetfButceSurum: TField;
    function GetfDonemAdet: TField;
    function GetfDonemTip: TField;
    function GetfID: TField;
    function GetfIslemBasTarih: TField;
    function GetfIslemBitTarih: TField;
    function GetfIslemDonemAdet: TField;
    function GetfIslemDonemTip: TField;
    function GetfIslemIsMerkezKod: TField;
    function GetfRowGuid: TField;
    function GetfSKod1: TField;
    function GetfSKod2: TField;
    function GetfSKod3: TField;
    function GetfSKod4: TField;
    function GetfSKod5: TField;
    function GetfTahminNo: TField;
    function GetfTamKapasiteTakvimKod: TField;
    procedure SetAciklama(const Value: String);
    procedure SetBasTarih(const Value: TDate);
    procedure SetBirim(const Value: String);
    procedure SetBitTarih(const Value: TDate);
    procedure SetButceBasTarih(const Value: TDate);
    procedure SetButceBitTarih(const Value: TDate);
    procedure SetButceDonemAdet(const Value: Integer);
    procedure SetButceDonemTip(const Value: Integer);
    procedure SetButceKod(const Value: String);
    procedure SetButceSurum(const Value: String);
    procedure SetDonemAdet(const Value: Integer);
    procedure SetDonemTip(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetIslemBasTarih(const Value: TDate);
    procedure SetIslemBitTarih(const Value: TDate);
    procedure SetIslemDonemAdet(const Value: Integer);
    procedure SetIslemDonemTip(const Value: Integer);
    procedure SetIslemIsMerkezKod(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSKod1(const Value: String);
    procedure SetSKod2(const Value: String);
    procedure SetSKod3(const Value: String);
    procedure SetSKod4(const Value: String);
    procedure SetSKod5(const Value: String);
    procedure SetTahminNo(const Value: String);
    procedure SetTamKapasiteTakvimKod(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property BasTarih: TDate read GetBasTarih write SetBasTarih;
    property Birim: String read GetBirim write SetBirim;
    property BitTarih: TDate read GetBitTarih write SetBitTarih;
    property ButceBasTarih: TDate read GetButceBasTarih write SetButceBasTarih;
    property ButceBitTarih: TDate read GetButceBitTarih write SetButceBitTarih;
    property ButceDonemAdet: Integer read GetButceDonemAdet write SetButceDonemAdet;
    property ButceDonemTip: Integer read GetButceDonemTip write SetButceDonemTip;
    property ButceKod: String read GetButceKod write SetButceKod;
    property ButceSurum: String read GetButceSurum write SetButceSurum;
    property DonemAdet: Integer read GetDonemAdet write SetDonemAdet;
    property DonemTip: Integer read GetDonemTip write SetDonemTip;
    property ID: Integer read GetID write SetID;
    property IslemBasTarih: TDate read GetIslemBasTarih write SetIslemBasTarih;
    property IslemBitTarih: TDate read GetIslemBitTarih write SetIslemBitTarih;
    property IslemDonemAdet: Integer read GetIslemDonemAdet write SetIslemDonemAdet;
    property IslemDonemTip: Integer read GetIslemDonemTip write SetIslemDonemTip;
    property IslemIsMerkezKod: String read GetIslemIsMerkezKod write SetIslemIsMerkezKod;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SKod1: String read GetSKod1 write SetSKod1;
    property SKod2: String read GetSKod2 write SetSKod2;
    property SKod3: String read GetSKod3 write SetSKod3;
    property SKod4: String read GetSKod4 write SetSKod4;
    property SKod5: String read GetSKod5 write SetSKod5;
    property TahminNo: String read GetTahminNo write SetTahminNo;
    property TamKapasiteTakvimKod: String read GetTamKapasiteTakvimKod write SetTamKapasiteTakvimKod;
    property fAciklama:TField read GetfAciklama;
    property fBasTarih:TField read GetfBasTarih;
    property fBirim:TField read GetfBirim;
    property fBitTarih:TField read GetfBitTarih;
    property fButceBasTarih:TField read GetfButceBasTarih;
    property fButceBitTarih:TField read GetfButceBitTarih;
    property fButceDonemAdet:TField read GetfButceDonemAdet;
    property fButceDonemTip:TField read GetfButceDonemTip;
    property fButceKod:TField read GetfButceKod;
    property fButceSurum:TField read GetfButceSurum;
    property fDonemAdet:TField read GetfDonemAdet;
    property fDonemTip:TField read GetfDonemTip;
    property fID:TField read GetfID;
    property fIslemBasTarih:TField read GetfIslemBasTarih;
    property fIslemBitTarih:TField read GetfIslemBitTarih;
    property fIslemDonemAdet:TField read GetfIslemDonemAdet;
    property fIslemDonemTip:TField read GetfIslemDonemTip;
    property fIslemIsMerkezKod:TField read GetfIslemIsMerkezKod;
    property fRowGuid:TField read GetfRowGuid;
    property fSKod1:TField read GetfSKod1;
    property fSKod2:TField read GetfSKod2;
    property fSKod3:TField read GetfSKod3;
    property fSKod4:TField read GetfSKod4;
    property fSKod5:TField read GetfSKod5;
    property fTahminNo:TField read GetfTahminNo;
    property fTamKapasiteTakvimKod:TField read GetfTamKapasiteTakvimKod;
  end;

  TTableUretimTahminKaynak = class(TAppTable)
  Private
    FfTahminKalanKapasite: TField;
    FfTahminKalanMiktar: TField;
    FfBirimMiktar: TField;
    FfID: TField;
    FfKaynakKod: TField;
    FfSiraNo: TField;
    FfTahminKapasite: TField;
    FfTahminKullanilanKapasite: TField;
    FfTahminKullanilanMiktar: TField;
    FfTahminMiktar: TField;
    FfTahminNo: TField;
    FfTamKapasite: TField;
    FfTamMiktar: TField;
    FfTarih: TField;
    function GetTahminKalanKapasite: Double;
    function GetTahminKalanMiktar: Double;
    function GetBirimMiktar: Double;
    function GetID: Integer;
    function GetKaynakKod: String;
    function GetSiraNo: Integer;
    function GetTahminKapasite: Double;
    function GetTahminKullanilanKapasite: Double;
    function GetTahminKullanilanMiktar: Double;
    function GetTahminMiktar: Double;
    function GetTahminNo: String;
    function GetTamKapasite: Double;
    function GetTamMiktar: Double;
    function GetTarih: TDate;
    function GetfTahminKalanKapasite: TField;
    function GetfTahminKalanMiktar: TField;
    function GetfBirimMiktar: TField;
    function GetfID: TField;
    function GetfKaynakKod: TField;
    function GetfSiraNo: TField;
    function GetfTahminKapasite: TField;
    function GetfTahminKullanilanKapasite: TField;
    function GetfTahminKullanilanMiktar: TField;
    function GetfTahminMiktar: TField;
    function GetfTahminNo: TField;
    function GetfTamKapasite: TField;
    function GetfTamMiktar: TField;
    function GetfTarih: TField;
    procedure SetTahminKalanKapasite(const Value: Double);
    procedure SetTahminKalanMiktar(const Value: Double);
    procedure SetBirimMiktar(const Value: Double);
    procedure SetID(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetTahminKapasite(const Value: Double);
    procedure SetTahminKullanilanKapasite(const Value: Double);
    procedure SetTahminKullanilanMiktar(const Value: Double);
    procedure SetTahminMiktar(const Value: Double);
    procedure SetTahminNo(const Value: String);
    procedure SetTamKapasite(const Value: Double);
    procedure SetTamMiktar(const Value: Double);
    procedure SetTarih(const Value: TDate);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property TahminKalanKapasite: Double read GetTahminKalanKapasite write SetTahminKalanKapasite;
    property TahminKalanMiktar: Double read GetTahminKalanMiktar write SetTahminKalanMiktar;
    property BirimMiktar: Double read GetBirimMiktar write SetBirimMiktar;
    property ID: Integer read GetID write SetID;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property TahminKapasite: Double read GetTahminKapasite write SetTahminKapasite;
    property TahminKullanilanKapasite: Double read GetTahminKullanilanKapasite write SetTahminKullanilanKapasite;
    property TahminKullanilanMiktar: Double read GetTahminKullanilanMiktar write SetTahminKullanilanMiktar;
    property TahminMiktar: Double read GetTahminMiktar write SetTahminMiktar;
    property TahminNo: String read GetTahminNo write SetTahminNo;
    property TamKapasite: Double read GetTamKapasite write SetTamKapasite;
    property TamMiktar: Double read GetTamMiktar write SetTamMiktar;
    property Tarih: TDate read GetTarih write SetTarih;
    property fTahminKalanKapasite:TField read GetfTahminKalanKapasite;
    property fTahminKalanMiktar:TField read GetfTahminKalanMiktar;
    property fBirimMiktar:TField read GetfBirimMiktar;
    property fID:TField read GetfID;
    property fKaynakKod:TField read GetfKaynakKod;
    property fSiraNo:TField read GetfSiraNo;
    property fTahminKapasite:TField read GetfTahminKapasite;
    property fTahminKullanilanKapasite:TField read GetfTahminKullanilanKapasite;
    property fTahminKullanilanMiktar:TField read GetfTahminKullanilanMiktar;
    property fTahminMiktar:TField read GetfTahminMiktar;
    property fTahminNo:TField read GetfTahminNo;
    property fTamKapasite:TField read GetfTamKapasite;
    property fTamMiktar:TField read GetfTamMiktar;
    property fTarih:TField read GetfTarih;
  end;

  TTableUretimTahmin = class(TAppTable)
  Private
    FfABCKod: TField;
    FfBasStokMiktar: TField;
    FfBasStokSure: TField;
    FfBirim: TField;
    FfBitStokMiktar: TField;
    FfHedefStokMiktar: TField;
    FfID: TField;
    FfIsMerkezKod: TField;
    FfMalKod: TField;
    FfMRPAlanKod: TField;
    FfRowGuid: TField;
    FfSatisMiktar: TField;
    FfSatisMiktarGrupYuzde: TField;
    FfSatisMiktarYuzde: TField;
    FfSiraNo: TField;
    FfMalAd: TField;
    FfTahminNo: TField;
    FfTarih: TField;
    FfUretimMiktar: TField;
    FfVersiyonNo: TField;
    FfYMUretimMiktar: TField;
    function GetABCKod: String;
    function GetBasStokMiktar: Double;
    function GetBasStokSure: Double;
    function GetBirim: String;
    function GetBitStokMiktar: Double;
    function GetHedefStokMiktar: Double;
    function GetID: Integer;
    function GetIsMerkezKod: String;
    function GetMalKod: String;
    function GetMRPAlanKod: String;
    function GetRowGuid: String;
    function GetSatisMiktar: Double;
    function GetSatisMiktarGrupYuzde: Double;
    function GetSatisMiktarYuzde: Double;
    function GetSiraNo: Integer;
    function GetMalAd: String;
    function GetTahminNo: String;
    function GetTarih: TDate;
    function GetUretimMiktar: Double;
    function GetVersiyonNo: String;
    function GetYMUretimMiktar: Double;
    function GetfABCKod: TField;
    function GetfBasStokMiktar: TField;
    function GetfBasStokSure: TField;
    function GetfBirim: TField;
    function GetfBitStokMiktar: TField;
    function GetfHedefStokMiktar: TField;
    function GetfID: TField;
    function GetfIsMerkezKod: TField;
    function GetfMalKod: TField;
    function GetfMRPAlanKod: TField;
    function GetfRowGuid: TField;
    function GetfSatisMiktar: TField;
    function GetfSatisMiktarGrupYuzde: TField;
    function GetfSatisMiktarYuzde: TField;
    function GetfSiraNo: TField;
    function GetfMalAd: TField;
    function GetfTahminNo: TField;
    function GetfTarih: TField;
    function GetfUretimMiktar: TField;
    function GetfVersiyonNo: TField;
    function GetfYMUretimMiktar: TField;
    procedure SetABCKod(const Value: String);
    procedure SetBasStokMiktar(const Value: Double);
    procedure SetBasStokSure(const Value: Double);
    procedure SetBirim(const Value: String);
    procedure SetBitStokMiktar(const Value: Double);
    procedure SetHedefStokMiktar(const Value: Double);
    procedure SetID(const Value: Integer);
    procedure SetIsMerkezKod(const Value: String);
    procedure SetMalKod(const Value: String);
    procedure SetMRPAlanKod(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSatisMiktar(const Value: Double);
    procedure SetSatisMiktarGrupYuzde(const Value: Double);
    procedure SetSatisMiktarYuzde(const Value: Double);
    procedure SetSiraNo(const Value: Integer);
    procedure SetMalAd(const Value: String);
    procedure SetTahminNo(const Value: String);
    procedure SetTarih(const Value: TDate);
    procedure SetUretimMiktar(const Value: Double);
    procedure SetVersiyonNo(const Value: String);
    procedure SetYMUretimMiktar(const Value: Double);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ABCKod: String read GetABCKod write SetABCKod;
    property BasStokMiktar: Double read GetBasStokMiktar write SetBasStokMiktar;
    property BasStokSure: Double read GetBasStokSure write SetBasStokSure;
    property Birim: String read GetBirim write SetBirim;
    property BitStokMiktar: Double read GetBitStokMiktar write SetBitStokMiktar;
    property HedefStokMiktar: Double read GetHedefStokMiktar write SetHedefStokMiktar;
    property ID: Integer read GetID write SetID;
    property IsMerkezKod: String read GetIsMerkezKod write SetIsMerkezKod;
    property MalKod: String read GetMalKod write SetMalKod;
    property MRPAlanKod: String read GetMRPAlanKod write SetMRPAlanKod;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SatisMiktar: Double read GetSatisMiktar write SetSatisMiktar;
    property SatisMiktarGrupYuzde: Double read GetSatisMiktarGrupYuzde write SetSatisMiktarGrupYuzde;
    property SatisMiktarYuzde: Double read GetSatisMiktarYuzde write SetSatisMiktarYuzde;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property MalAd: String read GetMalAd write SetMalAd;
    property TahminNo: String read GetTahminNo write SetTahminNo;
    property Tarih: TDate read GetTarih write SetTarih;
    property UretimMiktar: Double read GetUretimMiktar write SetUretimMiktar;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property YMUretimMiktar: Double read GetYMUretimMiktar write SetYMUretimMiktar;
    property fABCKod:TField read GetfABCKod;
    property fBasStokMiktar:TField read GetfBasStokMiktar;
    property fBasStokSure:TField read GetfBasStokSure;
    property fBirim:TField read GetfBirim;
    property fBitStokMiktar:TField read GetfBitStokMiktar;
    property fHedefStokMiktar:TField read GetfHedefStokMiktar;
    property fID:TField read GetfID;
    property fIsMerkezKod:TField read GetfIsMerkezKod;
    property fMalKod:TField read GetfMalKod;
    property fMRPAlanKod:TField read GetfMRPAlanKod;
    property fRowGuid:TField read GetfRowGuid;
    property fSatisMiktar:TField read GetfSatisMiktar;
    property fSatisMiktarGrupYuzde:TField read GetfSatisMiktarGrupYuzde;
    property fSatisMiktarYuzde:TField read GetfSatisMiktarYuzde;
    property fSiraNo:TField read GetfSiraNo;
    property fMalAd:TField read GetfMalAd;
    property fTahminNo:TField read GetfTahminNo;
    property fTarih:TField read GetfTarih;
    property fUretimMiktar:TField read GetfUretimMiktar;
    property fVersiyonNo:TField read GetfVersiyonNo;
    property fYMUretimMiktar:TField read GetfYMUretimMiktar;
  end;

  TTableUretimTahminNot = class(TAppTable)
  Private
    FfAd: TField;
    FfBelge: TField;
    FfDeger: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
    FfDosya: TField;
    FfDosyaAd: TField;
    FfDosyaDizin: TField;
    FfDosyaUzunluk: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfGrupKod: TField;
    FfID: TField;
    FfRowGuid: TField;
    FfSiraNo: TField;
    FfTahminNo: TField;
    function GetAd: String;
    function GetBelge: String;
    function GetDeger: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
    function GetDosya: String;
    function GetDosyaAd: String;
    function GetDosyaDizin: String;
    function GetDosyaUzunluk: Integer;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetGrupKod: String;
    function GetID: Integer;
    function GetRowGuid: String;
    function GetSiraNo: Integer;
    function GetTahminNo: String;
    function GetfAd: TField;
    function GetfBelge: TField;
    function GetfDeger: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
    function GetfDosya: TField;
    function GetfDosyaAd: TField;
    function GetfDosyaDizin: TField;
    function GetfDosyaUzunluk: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfGrupKod: TField;
    function GetfID: TField;
    function GetfRowGuid: TField;
    function GetfSiraNo: TField;
    function GetfTahminNo: TField;
    procedure SetAd(const Value: String);
    procedure SetBelge(const Value: String);
    procedure SetDeger(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
    procedure SetDosya(const Value: String);
    procedure SetDosyaAd(const Value: String);
    procedure SetDosyaDizin(const Value: String);
    procedure SetDosyaUzunluk(const Value: Integer);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetGrupKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetRowGuid(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetTahminNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Ad: String read GetAd write SetAd;
    property Belge: String read GetBelge write SetBelge;
    property Deger: String read GetDeger write SetDeger;
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property DegistirenSurum: String read GetDegistirenSurum write SetDegistirenSurum;
    property DegistirenTarih: TDate read GetDegistirenTarih write SetDegistirenTarih;
    property Dosya: String read GetDosya write SetDosya;
    property DosyaAd: String read GetDosyaAd write SetDosyaAd;
    property DosyaDizin: String read GetDosyaDizin write SetDosyaDizin;
    property DosyaUzunluk: Integer read GetDosyaUzunluk write SetDosyaUzunluk;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property GrupKod: String read GetGrupKod write SetGrupKod;
    property ID: Integer read GetID write SetID;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property TahminNo: String read GetTahminNo write SetTahminNo;
    property fAd:TField read GetfAd;
    property fBelge:TField read GetfBelge;
    property fDeger:TField read GetfDeger;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
    property fDosya:TField read GetfDosya;
    property fDosyaAd:TField read GetfDosyaAd;
    property fDosyaDizin:TField read GetfDosyaDizin;
    property fDosyaUzunluk:TField read GetfDosyaUzunluk;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fGrupKod:TField read GetfGrupKod;
    property fID:TField read GetfID;
    property fRowGuid:TField read GetfRowGuid;
    property fSiraNo:TField read GetfSiraNo;
    property fTahminNo:TField read GetfTahminNo;
  end;

  TTableUretimTahminToplam = class(TAppTable)
  Private
    FfTahminKalanKapasite: TField;
    FfTahminKalanMiktar: TField;
    FfBasStokMiktar: TField;
    FfBitStokMiktar: TField;
    FfHedefStokMiktar: TField;
    FfID: TField;
    FfIsMerkezKod: TField;
    FfSatisMiktar: TField;
    FfSiraNo: TField;
    FfTahminKapasite: TField;
    FfTahminKullanilanKapasite: TField;
    FfTahminKullanilanMiktar: TField;
    FfTahminMiktar: TField;
    FfTahminNo: TField;
    FfTamKapasite: TField;
    FfTamMiktar: TField;
    FfTarih: TField;
    FfUretimMiktar: TField;
    function GetTahminKalanKapasite: Double;
    function GetTahminKalanMiktar: Double;
    function GetBasStokMiktar: Double;
    function GetBitStokMiktar: Double;
    function GetHedefStokMiktar: Double;
    function GetID: Integer;
    function GetIsMerkezKod: String;
    function GetSatisMiktar: Double;
    function GetSiraNo: Integer;
    function GetTahminKapasite: Double;
    function GetTahminKullanilanKapasite: Double;
    function GetTahminKullanilanMiktar: Double;
    function GetTahminMiktar: Double;
    function GetTahminNo: String;
    function GetTamKapasite: Double;
    function GetTamMiktar: Double;
    function GetTarih: TDate;
    function GetUretimMiktar: Double;
    function GetfTahminKalanKapasite: TField;
    function GetfTahminKalanMiktar: TField;
    function GetfBasStokMiktar: TField;
    function GetfBitStokMiktar: TField;
    function GetfHedefStokMiktar: TField;
    function GetfID: TField;
    function GetfIsMerkezKod: TField;
    function GetfSatisMiktar: TField;
    function GetfSiraNo: TField;
    function GetfTahminKapasite: TField;
    function GetfTahminKullanilanKapasite: TField;
    function GetfTahminKullanilanMiktar: TField;
    function GetfTahminMiktar: TField;
    function GetfTahminNo: TField;
    function GetfTamKapasite: TField;
    function GetfTamMiktar: TField;
    function GetfTarih: TField;
    function GetfUretimMiktar: TField;
    procedure SetTahminKalanKapasite(const Value: Double);
    procedure SetTahminKalanMiktar(const Value: Double);
    procedure SetBasStokMiktar(const Value: Double);
    procedure SetBitStokMiktar(const Value: Double);
    procedure SetHedefStokMiktar(const Value: Double);
    procedure SetID(const Value: Integer);
    procedure SetIsMerkezKod(const Value: String);
    procedure SetSatisMiktar(const Value: Double);
    procedure SetSiraNo(const Value: Integer);
    procedure SetTahminKapasite(const Value: Double);
    procedure SetTahminKullanilanKapasite(const Value: Double);
    procedure SetTahminKullanilanMiktar(const Value: Double);
    procedure SetTahminMiktar(const Value: Double);
    procedure SetTahminNo(const Value: String);
    procedure SetTamKapasite(const Value: Double);
    procedure SetTamMiktar(const Value: Double);
    procedure SetTarih(const Value: TDate);
    procedure SetUretimMiktar(const Value: Double);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property TahminKalanKapasite: Double read GetTahminKalanKapasite write SetTahminKalanKapasite;
    property TahminKalanMiktar: Double read GetTahminKalanMiktar write SetTahminKalanMiktar;
    property BasStokMiktar: Double read GetBasStokMiktar write SetBasStokMiktar;
    property BitStokMiktar: Double read GetBitStokMiktar write SetBitStokMiktar;
    property HedefStokMiktar: Double read GetHedefStokMiktar write SetHedefStokMiktar;
    property ID: Integer read GetID write SetID;
    property IsMerkezKod: String read GetIsMerkezKod write SetIsMerkezKod;
    property SatisMiktar: Double read GetSatisMiktar write SetSatisMiktar;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property TahminKapasite: Double read GetTahminKapasite write SetTahminKapasite;
    property TahminKullanilanKapasite: Double read GetTahminKullanilanKapasite write SetTahminKullanilanKapasite;
    property TahminKullanilanMiktar: Double read GetTahminKullanilanMiktar write SetTahminKullanilanMiktar;
    property TahminMiktar: Double read GetTahminMiktar write SetTahminMiktar;
    property TahminNo: String read GetTahminNo write SetTahminNo;
    property TamKapasite: Double read GetTamKapasite write SetTamKapasite;
    property TamMiktar: Double read GetTamMiktar write SetTamMiktar;
    property Tarih: TDate read GetTarih write SetTarih;
    property UretimMiktar: Double read GetUretimMiktar write SetUretimMiktar;
    property fTahminKalanKapasite:TField read GetfTahminKalanKapasite;
    property fTahminKalanMiktar:TField read GetfTahminKalanMiktar;
    property fBasStokMiktar:TField read GetfBasStokMiktar;
    property fBitStokMiktar:TField read GetfBitStokMiktar;
    property fHedefStokMiktar:TField read GetfHedefStokMiktar;
    property fID:TField read GetfID;
    property fIsMerkezKod:TField read GetfIsMerkezKod;
    property fSatisMiktar:TField read GetfSatisMiktar;
    property fSiraNo:TField read GetfSiraNo;
    property fTahminKapasite:TField read GetfTahminKapasite;
    property fTahminKullanilanKapasite:TField read GetfTahminKullanilanKapasite;
    property fTahminKullanilanMiktar:TField read GetfTahminKullanilanMiktar;
    property fTahminMiktar:TField read GetfTahminMiktar;
    property fTahminNo:TField read GetfTahminNo;
    property fTamKapasite:TField read GetfTamKapasite;
    property fTamMiktar:TField read GetfTamMiktar;
    property fTarih:TField read GetfTarih;
    property fUretimMiktar:TField read GetfUretimMiktar;
  end;

  TTableUretimTahminVardiya = class(TAppTable)
  Private
    FfFazlaMesai: TField;
    FfFazlaMesaiVardiyaKod: TField;
    FfID: TField;
    FfKaynakKod: TField;
    FfSiraNo: TField;
    FfTahminNo: TField;
    FfTakvimKod: TField;
    FfTarih: TField;
    function GetFazlaMesai: Double;
    function GetFazlaMesaiVardiyaKod: String;
    function GetID: Integer;
    function GetKaynakKod: String;
    function GetSiraNo: Integer;
    function GetTahminNo: String;
    function GetTakvimKod: String;
    function GetTarih: TDate;
    function GetfFazlaMesai: TField;
    function GetfFazlaMesaiVardiyaKod: TField;
    function GetfID: TField;
    function GetfKaynakKod: TField;
    function GetfSiraNo: TField;
    function GetfTahminNo: TField;
    function GetfTakvimKod: TField;
    function GetfTarih: TField;
    procedure SetFazlaMesai(const Value: Double);
    procedure SetFazlaMesaiVardiyaKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetTahminNo(const Value: String);
    procedure SetTakvimKod(const Value: String);
    procedure SetTarih(const Value: TDate);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property FazlaMesai: Double read GetFazlaMesai write SetFazlaMesai;
    property FazlaMesaiVardiyaKod: String read GetFazlaMesaiVardiyaKod write SetFazlaMesaiVardiyaKod;
    property ID: Integer read GetID write SetID;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property TahminNo: String read GetTahminNo write SetTahminNo;
    property TakvimKod: String read GetTakvimKod write SetTakvimKod;
    property Tarih: TDate read GetTarih write SetTarih;
    property fFazlaMesai:TField read GetfFazlaMesai;
    property fFazlaMesaiVardiyaKod:TField read GetfFazlaMesaiVardiyaKod;
    property fID:TField read GetfID;
    property fKaynakKod:TField read GetfKaynakKod;
    property fSiraNo:TField read GetfSiraNo;
    property fTahminNo:TField read GetfTahminNo;
    property fTakvimKod:TField read GetfTakvimKod;
    property fTarih:TField read GetfTarih;
  end;

implementation

uses CPMApp_Math;

{ TTableMRMNavBar }

constructor TTableMRMNavBar.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRMNVB';
end;

procedure TTableMRMNavBar.DoAfterOpen;
begin
  if FfAramaTip = nil then
    FfAramaTip := FindField('ARAMATIP');
  if FfBasMalAd = nil then
    FfBasMalAd := FindField('BASMALAD');
  if FfBasMalKod = nil then
    FfBasMalKod := FindField('BASMALKOD');
  if FfBitMalAd = nil then
    FfBitMalAd := FindField('BITMALAD');
  if FfBitMalKod = nil then
    FfBitMalKod := FindField('BITMALKOD');
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  if FfMalAd = nil then
    FfMalAd := FindField('MALAD');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableMRMNavBar.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAramaTip := nil;
    FfBasMalAd := nil;
    FfBasMalKod := nil;
    FfBitMalAd := nil;
    FfBitMalKod := nil;
    FfFabrikaKod := nil;
    FfMalAd := nil;
    FfMalKod := nil;
    FfMRPAlanKod := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableMRMNavBar.GetAramaTip: Integer;
begin
  if FfAramaTip = nil then
    FfAramaTip := FindField('ARAMATIP');
  Result := FfAramaTip.AsInteger;
end;

function TTableMRMNavBar.GetBasMalAd: String;
begin
  if FfBasMalAd = nil then
    FfBasMalAd := FindField('BASMALAD');
  Result := FfBasMalAd.AsString;
end;

function TTableMRMNavBar.GetBasMalKod: String;
begin
  if FfBasMalKod = nil then
    FfBasMalKod := FindField('BASMALKOD');
  Result := FfBasMalKod.AsString;
end;

function TTableMRMNavBar.GetBitMalAd: String;
begin
  if FfBitMalAd = nil then
    FfBitMalAd := FindField('BITMALAD');
  Result := FfBitMalAd.AsString;
end;

function TTableMRMNavBar.GetBitMalKod: String;
begin
  if FfBitMalKod = nil then
    FfBitMalKod := FindField('BITMALKOD');
  Result := FfBitMalKod.AsString;
end;

function TTableMRMNavBar.GetFabrikaKod: String;
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  Result := FfFabrikaKod.AsString;
end;

function TTableMRMNavBar.GetMalAd: String;
begin
  if FfMalAd = nil then
    FfMalAd := FindField('MALAD');
  Result := FfMalAd.AsString;
end;

function TTableMRMNavBar.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableMRMNavBar.GetMRPAlanKod: String;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod.AsString;
end;

function TTableMRMNavBar.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableMRMNavBar.GetfAramaTip: TField;
begin
  if FfAramaTip = nil then
    FfAramaTip := FindField('ARAMATIP');
  Result := FfAramaTip;
end;

function TTableMRMNavBar.GetfBasMalAd: TField;
begin
  if FfBasMalAd = nil then
    FfBasMalAd := FindField('BASMALAD');
  Result := FfBasMalAd;
end;

function TTableMRMNavBar.GetfBasMalKod: TField;
begin
  if FfBasMalKod = nil then
    FfBasMalKod := FindField('BASMALKOD');
  Result := FfBasMalKod;
end;

function TTableMRMNavBar.GetfBitMalAd: TField;
begin
  if FfBitMalAd = nil then
    FfBitMalAd := FindField('BITMALAD');
  Result := FfBitMalAd;
end;

function TTableMRMNavBar.GetfBitMalKod: TField;
begin
  if FfBitMalKod = nil then
    FfBitMalKod := FindField('BITMALKOD');
  Result := FfBitMalKod;
end;

function TTableMRMNavBar.GetfFabrikaKod: TField;
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  Result := FfFabrikaKod;
end;

function TTableMRMNavBar.GetfMalAd: TField;
begin
  if FfMalAd = nil then
    FfMalAd := FindField('MALAD');
  Result := FfMalAd;
end;

function TTableMRMNavBar.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableMRMNavBar.GetfMRPAlanKod: TField;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod;
end;

function TTableMRMNavBar.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableMRMNavBar.SetAramaTip(const Value: Integer);
begin
  if FfAramaTip = nil then
    FfAramaTip := FindField('ARAMATIP');
  FfAramaTip.AsInteger := Value;
end;

procedure TTableMRMNavBar.SetBasMalAd(const Value: String);
begin
  if FfBasMalAd = nil then
    FfBasMalAd := FindField('BASMALAD');
  FfBasMalAd.AsString := Value;
end;

procedure TTableMRMNavBar.SetBasMalKod(const Value: String);
begin
  if FfBasMalKod = nil then
    FfBasMalKod := FindField('BASMALKOD');
  FfBasMalKod.AsString := Value;
end;

procedure TTableMRMNavBar.SetBitMalAd(const Value: String);
begin
  if FfBitMalAd = nil then
    FfBitMalAd := FindField('BITMALAD');
  FfBitMalAd.AsString := Value;
end;

procedure TTableMRMNavBar.SetBitMalKod(const Value: String);
begin
  if FfBitMalKod = nil then
    FfBitMalKod := FindField('BITMALKOD');
  FfBitMalKod.AsString := Value;
end;

procedure TTableMRMNavBar.SetFabrikaKod(const Value: String);
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  FfFabrikaKod.AsString := Value;
end;

procedure TTableMRMNavBar.SetMalAd(const Value: String);
begin
  if FfMalAd = nil then
    FfMalAd := FindField('MALAD');
  FfMalAd.AsString := Value;
end;

procedure TTableMRMNavBar.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableMRMNavBar.SetMRPAlanKod(const Value: String);
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  FfMRPAlanKod.AsString := Value;
end;

procedure TTableMRMNavBar.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableMRPBaslik }

constructor TTableMRPBaslik.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRPBAS';
end;

procedure TTableMRPBaslik.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfAlimPartiHesapla = nil then
    FfAlimPartiHesapla := FindField('ALIMPARTIHESAPLA');
  if FfAlimSiparisKapat = nil then
    FfAlimSiparisKapat := FindField('ALIMSIPARISKAPAT');
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  if FfFireHesapla = nil then
    FfFireHesapla := FindField('FIREHESAPLA');
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  if FfID = nil then
    FfID := FindField('ID');
  if FfMinStokKapat = nil then
    FfMinStokKapat := FindField('MINSTOKKAPAT');
  if FfMRPListeKaydet = nil then
    FfMRPListeKaydet := FindField('MRPLISTEKAYDET');
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSatisSiparisKapat = nil then
    FfSatisSiparisKapat := FindField('SATISSIPARISKAPAT');
  if FfStokKapat = nil then
    FfStokKapat := FindField('STOKKAPAT');
  if FfUretimPlanBasTarih = nil then
    FfUretimPlanBasTarih := FindField('URETIMPLANBASTARIH');
  if FfUretimPlanBitTarih = nil then
    FfUretimPlanBitTarih := FindField('URETIMPLANBITTARIH');
  if FfUretimPlanNo = nil then
    FfUretimPlanNo := FindField('URETIMPLANNO');
  if FfUretimPlanTip = nil then
    FfUretimPlanTip := FindField('URETIMPLANTIP');
  if FfUretimSiparisKapat = nil then
    FfUretimSiparisKapat := FindField('URETIMSIPARISKAPAT');
  if FfUretimTahminBasTarih = nil then
    FfUretimTahminBasTarih := FindField('URETIMTAHMINBASTARIH');
  if FfUretimTahminBitTarih = nil then
    FfUretimTahminBitTarih := FindField('URETIMTAHMINBITTARIH');
  if FfUretimTahminNo = nil then
    FfUretimTahminNo := FindField('URETIMTAHMINNO');
  if FfYuvarla = nil then
    FfYuvarla := FindField('YUVARLA');
  inherited;
end;

procedure TTableMRPBaslik.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfAlimPartiHesapla := nil;
    FfAlimSiparisKapat := nil;
    FfDegistirenKaynak := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
    FfFabrikaKod := nil;
    FfFireHesapla := nil;
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfID := nil;
    FfMinStokKapat := nil;
    FfMRPListeKaydet := nil;
    FfPlanNo := nil;
    FfRowGuid := nil;
    FfSatisSiparisKapat := nil;
    FfStokKapat := nil;
    FfUretimPlanBasTarih := nil;
    FfUretimPlanBitTarih := nil;
    FfUretimPlanNo := nil;
    FfUretimPlanTip := nil;
    FfUretimSiparisKapat := nil;
    FfUretimTahminBasTarih := nil;
    FfUretimTahminBitTarih := nil;
    FfUretimTahminNo := nil;
    FfYuvarla := nil;
  end;
  inherited;
end;

function TTableMRPBaslik.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableMRPBaslik.GetAlimPartiHesapla: Integer;
begin
  if FfAlimPartiHesapla = nil then
    FfAlimPartiHesapla := FindField('ALIMPARTIHESAPLA');
  Result := FfAlimPartiHesapla.AsInteger;
end;

function TTableMRPBaslik.GetAlimSiparisKapat: Integer;
begin
  if FfAlimSiparisKapat = nil then
    FfAlimSiparisKapat := FindField('ALIMSIPARISKAPAT');
  Result := FfAlimSiparisKapat.AsInteger;
end;

function TTableMRPBaslik.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableMRPBaslik.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableMRPBaslik.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableMRPBaslik.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableMRPBaslik.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableMRPBaslik.GetFabrikaKod: String;
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  Result := FfFabrikaKod.AsString;
end;

function TTableMRPBaslik.GetFireHesapla: Integer;
begin
  if FfFireHesapla = nil then
    FfFireHesapla := FindField('FIREHESAPLA');
  Result := FfFireHesapla.AsInteger;
end;

function TTableMRPBaslik.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableMRPBaslik.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableMRPBaslik.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableMRPBaslik.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableMRPBaslik.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableMRPBaslik.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMRPBaslik.GetMinStokKapat: Integer;
begin
  if FfMinStokKapat = nil then
    FfMinStokKapat := FindField('MINSTOKKAPAT');
  Result := FfMinStokKapat.AsInteger;
end;

function TTableMRPBaslik.GetMRPListeKaydet: Integer;
begin
  if FfMRPListeKaydet = nil then
    FfMRPListeKaydet := FindField('MRPLISTEKAYDET');
  Result := FfMRPListeKaydet.AsInteger;
end;

function TTableMRPBaslik.GetPlanNo: String;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo.AsString;
end;

function TTableMRPBaslik.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMRPBaslik.GetSatisSiparisKapat: Integer;
begin
  if FfSatisSiparisKapat = nil then
    FfSatisSiparisKapat := FindField('SATISSIPARISKAPAT');
  Result := FfSatisSiparisKapat.AsInteger;
end;

function TTableMRPBaslik.GetStokKapat: Integer;
begin
  if FfStokKapat = nil then
    FfStokKapat := FindField('STOKKAPAT');
  Result := FfStokKapat.AsInteger;
end;

function TTableMRPBaslik.GetUretimPlanBasTarih: TDate;
begin
  if FfUretimPlanBasTarih = nil then
    FfUretimPlanBasTarih := FindField('URETIMPLANBASTARIH');
  Result := FfUretimPlanBasTarih.AsDateTime;
end;

function TTableMRPBaslik.GetUretimPlanBitTarih: TDate;
begin
  if FfUretimPlanBitTarih = nil then
    FfUretimPlanBitTarih := FindField('URETIMPLANBITTARIH');
  Result := FfUretimPlanBitTarih.AsDateTime;
end;

function TTableMRPBaslik.GetUretimPlanNo: String;
begin
  if FfUretimPlanNo = nil then
    FfUretimPlanNo := FindField('URETIMPLANNO');
  Result := FfUretimPlanNo.AsString;
end;

function TTableMRPBaslik.GetUretimPlanTip: Integer;
begin
  if FfUretimPlanTip = nil then
    FfUretimPlanTip := FindField('URETIMPLANTIP');
  Result := FfUretimPlanTip.AsInteger;
end;

function TTableMRPBaslik.GetUretimSiparisKapat: Integer;
begin
  if FfUretimSiparisKapat = nil then
    FfUretimSiparisKapat := FindField('URETIMSIPARISKAPAT');
  Result := FfUretimSiparisKapat.AsInteger;
end;

function TTableMRPBaslik.GetUretimTahminBasTarih: TDate;
begin
  if FfUretimTahminBasTarih = nil then
    FfUretimTahminBasTarih := FindField('URETIMTAHMINBASTARIH');
  Result := FfUretimTahminBasTarih.AsDateTime;
end;

function TTableMRPBaslik.GetUretimTahminBitTarih: TDate;
begin
  if FfUretimTahminBitTarih = nil then
    FfUretimTahminBitTarih := FindField('URETIMTAHMINBITTARIH');
  Result := FfUretimTahminBitTarih.AsDateTime;
end;

function TTableMRPBaslik.GetUretimTahminNo: String;
begin
  if FfUretimTahminNo = nil then
    FfUretimTahminNo := FindField('URETIMTAHMINNO');
  Result := FfUretimTahminNo.AsString;
end;

function TTableMRPBaslik.GetYuvarla: Integer;
begin
  if FfYuvarla = nil then
    FfYuvarla := FindField('YUVARLA');
  Result := FfYuvarla.AsInteger;
end;

function TTableMRPBaslik.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableMRPBaslik.GetfAlimPartiHesapla: TField;
begin
  if FfAlimPartiHesapla = nil then
    FfAlimPartiHesapla := FindField('ALIMPARTIHESAPLA');
  Result := FfAlimPartiHesapla;
end;

function TTableMRPBaslik.GetfAlimSiparisKapat: TField;
begin
  if FfAlimSiparisKapat = nil then
    FfAlimSiparisKapat := FindField('ALIMSIPARISKAPAT');
  Result := FfAlimSiparisKapat;
end;

function TTableMRPBaslik.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableMRPBaslik.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableMRPBaslik.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableMRPBaslik.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableMRPBaslik.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableMRPBaslik.GetfFabrikaKod: TField;
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  Result := FfFabrikaKod;
end;

function TTableMRPBaslik.GetfFireHesapla: TField;
begin
  if FfFireHesapla = nil then
    FfFireHesapla := FindField('FIREHESAPLA');
  Result := FfFireHesapla;
end;

function TTableMRPBaslik.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableMRPBaslik.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableMRPBaslik.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableMRPBaslik.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableMRPBaslik.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableMRPBaslik.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMRPBaslik.GetfMinStokKapat: TField;
begin
  if FfMinStokKapat = nil then
    FfMinStokKapat := FindField('MINSTOKKAPAT');
  Result := FfMinStokKapat;
end;

function TTableMRPBaslik.GetfMRPListeKaydet: TField;
begin
  if FfMRPListeKaydet = nil then
    FfMRPListeKaydet := FindField('MRPLISTEKAYDET');
  Result := FfMRPListeKaydet;
end;

function TTableMRPBaslik.GetfPlanNo: TField;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo;
end;

function TTableMRPBaslik.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMRPBaslik.GetfSatisSiparisKapat: TField;
begin
  if FfSatisSiparisKapat = nil then
    FfSatisSiparisKapat := FindField('SATISSIPARISKAPAT');
  Result := FfSatisSiparisKapat;
end;

function TTableMRPBaslik.GetfStokKapat: TField;
begin
  if FfStokKapat = nil then
    FfStokKapat := FindField('STOKKAPAT');
  Result := FfStokKapat;
end;

function TTableMRPBaslik.GetfUretimPlanBasTarih: TField;
begin
  if FfUretimPlanBasTarih = nil then
    FfUretimPlanBasTarih := FindField('URETIMPLANBASTARIH');
  Result := FfUretimPlanBasTarih;
end;

function TTableMRPBaslik.GetfUretimPlanBitTarih: TField;
begin
  if FfUretimPlanBitTarih = nil then
    FfUretimPlanBitTarih := FindField('URETIMPLANBITTARIH');
  Result := FfUretimPlanBitTarih;
end;

function TTableMRPBaslik.GetfUretimPlanNo: TField;
begin
  if FfUretimPlanNo = nil then
    FfUretimPlanNo := FindField('URETIMPLANNO');
  Result := FfUretimPlanNo;
end;

function TTableMRPBaslik.GetfUretimPlanTip: TField;
begin
  if FfUretimPlanTip = nil then
    FfUretimPlanTip := FindField('URETIMPLANTIP');
  Result := FfUretimPlanTip;
end;

function TTableMRPBaslik.GetfUretimSiparisKapat: TField;
begin
  if FfUretimSiparisKapat = nil then
    FfUretimSiparisKapat := FindField('URETIMSIPARISKAPAT');
  Result := FfUretimSiparisKapat;
end;

function TTableMRPBaslik.GetfUretimTahminBasTarih: TField;
begin
  if FfUretimTahminBasTarih = nil then
    FfUretimTahminBasTarih := FindField('URETIMTAHMINBASTARIH');
  Result := FfUretimTahminBasTarih;
end;

function TTableMRPBaslik.GetfUretimTahminBitTarih: TField;
begin
  if FfUretimTahminBitTarih = nil then
    FfUretimTahminBitTarih := FindField('URETIMTAHMINBITTARIH');
  Result := FfUretimTahminBitTarih;
end;

function TTableMRPBaslik.GetfUretimTahminNo: TField;
begin
  if FfUretimTahminNo = nil then
    FfUretimTahminNo := FindField('URETIMTAHMINNO');
  Result := FfUretimTahminNo;
end;

function TTableMRPBaslik.GetfYuvarla: TField;
begin
  if FfYuvarla = nil then
    FfYuvarla := FindField('YUVARLA');
  Result := FfYuvarla;
end;

procedure TTableMRPBaslik.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableMRPBaslik.SetAlimPartiHesapla(const Value: Integer);
begin
  if FfAlimPartiHesapla = nil then
    FfAlimPartiHesapla := FindField('ALIMPARTIHESAPLA');
  FfAlimPartiHesapla.AsInteger := Value;
end;

procedure TTableMRPBaslik.SetAlimSiparisKapat(const Value: Integer);
begin
  if FfAlimSiparisKapat = nil then
    FfAlimSiparisKapat := FindField('ALIMSIPARISKAPAT');
  FfAlimSiparisKapat.AsInteger := Value;
end;

procedure TTableMRPBaslik.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableMRPBaslik.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableMRPBaslik.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableMRPBaslik.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableMRPBaslik.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableMRPBaslik.SetFabrikaKod(const Value: String);
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  FfFabrikaKod.AsString := Value;
end;

procedure TTableMRPBaslik.SetFireHesapla(const Value: Integer);
begin
  if FfFireHesapla = nil then
    FfFireHesapla := FindField('FIREHESAPLA');
  FfFireHesapla.AsInteger := Value;
end;

procedure TTableMRPBaslik.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableMRPBaslik.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableMRPBaslik.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableMRPBaslik.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableMRPBaslik.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableMRPBaslik.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMRPBaslik.SetMinStokKapat(const Value: Integer);
begin
  if FfMinStokKapat = nil then
    FfMinStokKapat := FindField('MINSTOKKAPAT');
  FfMinStokKapat.AsInteger := Value;
end;

procedure TTableMRPBaslik.SetMRPListeKaydet(const Value: Integer);
begin
  if FfMRPListeKaydet = nil then
    FfMRPListeKaydet := FindField('MRPLISTEKAYDET');
  FfMRPListeKaydet.AsInteger := Value;
end;

procedure TTableMRPBaslik.SetPlanNo(const Value: String);
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  FfPlanNo.AsString := Value;
end;

procedure TTableMRPBaslik.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMRPBaslik.SetSatisSiparisKapat(const Value: Integer);
begin
  if FfSatisSiparisKapat = nil then
    FfSatisSiparisKapat := FindField('SATISSIPARISKAPAT');
  FfSatisSiparisKapat.AsInteger := Value;
end;

procedure TTableMRPBaslik.SetStokKapat(const Value: Integer);
begin
  if FfStokKapat = nil then
    FfStokKapat := FindField('STOKKAPAT');
  FfStokKapat.AsInteger := Value;
end;

procedure TTableMRPBaslik.SetUretimPlanBasTarih(const Value: TDate);
begin
  if FfUretimPlanBasTarih = nil then
    FfUretimPlanBasTarih := FindField('URETIMPLANBASTARIH');
  FfUretimPlanBasTarih.AsDateTime := Value;
end;

procedure TTableMRPBaslik.SetUretimPlanBitTarih(const Value: TDate);
begin
  if FfUretimPlanBitTarih = nil then
    FfUretimPlanBitTarih := FindField('URETIMPLANBITTARIH');
  FfUretimPlanBitTarih.AsDateTime := Value;
end;

procedure TTableMRPBaslik.SetUretimPlanNo(const Value: String);
begin
  if FfUretimPlanNo = nil then
    FfUretimPlanNo := FindField('URETIMPLANNO');
  FfUretimPlanNo.AsString := Value;
end;

procedure TTableMRPBaslik.SetUretimPlanTip(const Value: Integer);
begin
  if FfUretimPlanTip = nil then
    FfUretimPlanTip := FindField('URETIMPLANTIP');
  FfUretimPlanTip.AsInteger := Value;
end;

procedure TTableMRPBaslik.SetUretimSiparisKapat(const Value: Integer);
begin
  if FfUretimSiparisKapat = nil then
    FfUretimSiparisKapat := FindField('URETIMSIPARISKAPAT');
  FfUretimSiparisKapat.AsInteger := Value;
end;

procedure TTableMRPBaslik.SetUretimTahminBasTarih(const Value: TDate);
begin
  if FfUretimTahminBasTarih = nil then
    FfUretimTahminBasTarih := FindField('URETIMTAHMINBASTARIH');
  FfUretimTahminBasTarih.AsDateTime := Value;
end;

procedure TTableMRPBaslik.SetUretimTahminBitTarih(const Value: TDate);
begin
  if FfUretimTahminBitTarih = nil then
    FfUretimTahminBitTarih := FindField('URETIMTAHMINBITTARIH');
  FfUretimTahminBitTarih.AsDateTime := Value;
end;

procedure TTableMRPBaslik.SetUretimTahminNo(const Value: String);
begin
  if FfUretimTahminNo = nil then
    FfUretimTahminNo := FindField('URETIMTAHMINNO');
  FfUretimTahminNo.AsString := Value;
end;

procedure TTableMRPBaslik.SetYuvarla(const Value: Integer);
begin
  if FfYuvarla = nil then
    FfYuvarla := FindField('YUVARLA');
  FfYuvarla.AsInteger := Value;
end;

{ TTableMRPDetay }

constructor TTableMRPDetay.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRPDTY';
end;

procedure TTableMRPDetay.DoAfterOpen;
begin
  if FfID = nil then
    FfID := FindField('ID');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableMRPDetay.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfID := nil;
    FfMalKod := nil;
    FfMiktar := nil;
    FfMRPAlanKod := nil;
    FfPlanNo := nil;
    FfRowGuid := nil;
    FfSiraNo := nil;
    FfTarih := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableMRPDetay.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMRPDetay.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableMRPDetay.GetMiktar: Double;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar.AsFloat;
end;

function TTableMRPDetay.GetMRPAlanKod: String;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod.AsString;
end;

function TTableMRPDetay.GetPlanNo: String;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo.AsString;
end;

function TTableMRPDetay.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMRPDetay.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableMRPDetay.GetTarih: TDate;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih.AsDateTime;
end;

function TTableMRPDetay.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableMRPDetay.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMRPDetay.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableMRPDetay.GetfMiktar: TField;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar;
end;

function TTableMRPDetay.GetfMRPAlanKod: TField;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod;
end;

function TTableMRPDetay.GetfPlanNo: TField;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo;
end;

function TTableMRPDetay.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMRPDetay.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableMRPDetay.GetfTarih: TField;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih;
end;

function TTableMRPDetay.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableMRPDetay.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMRPDetay.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableMRPDetay.SetMiktar(const Value: Double);
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  FfMiktar.AsFloat := Value;
end;

procedure TTableMRPDetay.SetMRPAlanKod(const Value: String);
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  FfMRPAlanKod.AsString := Value;
end;

procedure TTableMRPDetay.SetPlanNo(const Value: String);
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  FfPlanNo.AsString := Value;
end;

procedure TTableMRPDetay.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMRPDetay.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableMRPDetay.SetTarih(const Value: TDate);
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  FfTarih.AsDateTime := Value;
end;

procedure TTableMRPDetay.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableMRPError }

constructor TTableMRPError.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRPERR';
end;

procedure TTableMRPError.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKod = nil then
    FfKod := FindField('KOD');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSiraNo2 = nil then
    FfSiraNo2 := FindField('SIRANO2');
  inherited;
end;

procedure TTableMRPError.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfID := nil;
    FfKod := nil;
    FfMalKod := nil;
    FfPlanNo := nil;
    FfRowGuid := nil;
    FfSiraNo := nil;
    FfSiraNo2 := nil;
  end;
  inherited;
end;

function TTableMRPError.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableMRPError.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMRPError.GetKod: String;
begin
  if FfKod = nil then
    FfKod := FindField('KOD');
  Result := FfKod.AsString;
end;

function TTableMRPError.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableMRPError.GetPlanNo: String;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo.AsString;
end;

function TTableMRPError.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMRPError.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableMRPError.GetSiraNo2: Integer;
begin
  if FfSiraNo2 = nil then
    FfSiraNo2 := FindField('SIRANO2');
  Result := FfSiraNo2.AsInteger;
end;

function TTableMRPError.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableMRPError.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMRPError.GetfKod: TField;
begin
  if FfKod = nil then
    FfKod := FindField('KOD');
  Result := FfKod;
end;

function TTableMRPError.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableMRPError.GetfPlanNo: TField;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo;
end;

function TTableMRPError.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMRPError.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableMRPError.GetfSiraNo2: TField;
begin
  if FfSiraNo2 = nil then
    FfSiraNo2 := FindField('SIRANO2');
  Result := FfSiraNo2;
end;

procedure TTableMRPError.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableMRPError.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMRPError.SetKod(const Value: String);
begin
  if FfKod = nil then
    FfKod := FindField('KOD');
  FfKod.AsString := Value;
end;

procedure TTableMRPError.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableMRPError.SetPlanNo(const Value: String);
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  FfPlanNo.AsString := Value;
end;

procedure TTableMRPError.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMRPError.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableMRPError.SetSiraNo2(const Value: Integer);
begin
  if FfSiraNo2 = nil then
    FfSiraNo2 := FindField('SIRANO2');
  FfSiraNo2.AsInteger := Value;
end;

{ TTableMRPEvrak }

constructor TTableMRPEvrak.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRPEVR';
end;

procedure TTableMRPEvrak.DoAfterOpen;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  if FfEvrakSiraNo = nil then
    FfEvrakSiraNo := FindField('EVRAKSIRANO');
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfMRPMiktar = nil then
    FfMRPMiktar := FindField('MRPMIKTAR');
  if FfMRPPlanTip = nil then
    FfMRPPlanTip := FindField('MRPPLANTIP');
  if FfMRPSiraNo = nil then
    FfMRPSiraNo := FindField('MRPSIRANO');
  if FfMRPTarih = nil then
    FfMRPTarih := FindField('MRPTARIH');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfUretimDurum = nil then
    FfUretimDurum := FindField('URETIMDURUM');
  if FfUretimKonum = nil then
    FfUretimKonum := FindField('URETIMKONUM');
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  if FfUretimPlanNo = nil then
    FfUretimPlanNo := FindField('URETIMPLANNO');
  inherited;
end;

procedure TTableMRPEvrak.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfDegistirenKaynak := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
    FfEvrakNo := nil;
    FfEvrakSiraNo := nil;
    FfEvrakTip := nil;
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfHesapKod := nil;
    FfID := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfMRPMiktar := nil;
    FfMRPPlanTip := nil;
    FfMRPSiraNo := nil;
    FfMRPTarih := nil;
    FfSirketNo := nil;
    FfUretimDurum := nil;
    FfUretimKonum := nil;
    FfUretimNo := nil;
    FfUretimPlanNo := nil;
  end;
  inherited;
end;

function TTableMRPEvrak.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableMRPEvrak.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableMRPEvrak.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableMRPEvrak.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableMRPEvrak.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableMRPEvrak.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableMRPEvrak.GetEvrakSiraNo: Integer;
begin
  if FfEvrakSiraNo = nil then
    FfEvrakSiraNo := FindField('EVRAKSIRANO');
  Result := FfEvrakSiraNo.AsInteger;
end;

function TTableMRPEvrak.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableMRPEvrak.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableMRPEvrak.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableMRPEvrak.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableMRPEvrak.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableMRPEvrak.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableMRPEvrak.GetHesapKod: String;
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  Result := FfHesapKod.AsString;
end;

function TTableMRPEvrak.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMRPEvrak.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableMRPEvrak.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableMRPEvrak.GetMRPMiktar: Double;
begin
  if FfMRPMiktar = nil then
    FfMRPMiktar := FindField('MRPMIKTAR');
  Result := FfMRPMiktar.AsFloat;
end;

function TTableMRPEvrak.GetMRPPlanTip: String;
begin
  if FfMRPPlanTip = nil then
    FfMRPPlanTip := FindField('MRPPLANTIP');
  Result := FfMRPPlanTip.AsString;
end;

function TTableMRPEvrak.GetMRPSiraNo: Integer;
begin
  if FfMRPSiraNo = nil then
    FfMRPSiraNo := FindField('MRPSIRANO');
  Result := FfMRPSiraNo.AsInteger;
end;

function TTableMRPEvrak.GetMRPTarih: TDate;
begin
  if FfMRPTarih = nil then
    FfMRPTarih := FindField('MRPTARIH');
  Result := FfMRPTarih.AsDateTime;
end;

function TTableMRPEvrak.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMRPEvrak.GetUretimDurum: String;
begin
  if FfUretimDurum = nil then
    FfUretimDurum := FindField('URETIMDURUM');
  Result := FfUretimDurum.AsString;
end;

function TTableMRPEvrak.GetUretimKonum: String;
begin
  if FfUretimKonum = nil then
    FfUretimKonum := FindField('URETIMKONUM');
  Result := FfUretimKonum.AsString;
end;

function TTableMRPEvrak.GetUretimNo: String;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo.AsString;
end;

function TTableMRPEvrak.GetUretimPlanNo: String;
begin
  if FfUretimPlanNo = nil then
    FfUretimPlanNo := FindField('URETIMPLANNO');
  Result := FfUretimPlanNo.AsString;
end;

function TTableMRPEvrak.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableMRPEvrak.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableMRPEvrak.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableMRPEvrak.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableMRPEvrak.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableMRPEvrak.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableMRPEvrak.GetfEvrakSiraNo: TField;
begin
  if FfEvrakSiraNo = nil then
    FfEvrakSiraNo := FindField('EVRAKSIRANO');
  Result := FfEvrakSiraNo;
end;

function TTableMRPEvrak.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableMRPEvrak.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableMRPEvrak.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableMRPEvrak.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableMRPEvrak.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableMRPEvrak.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableMRPEvrak.GetfHesapKod: TField;
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  Result := FfHesapKod;
end;

function TTableMRPEvrak.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMRPEvrak.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableMRPEvrak.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableMRPEvrak.GetfMRPMiktar: TField;
begin
  if FfMRPMiktar = nil then
    FfMRPMiktar := FindField('MRPMIKTAR');
  Result := FfMRPMiktar;
end;

function TTableMRPEvrak.GetfMRPPlanTip: TField;
begin
  if FfMRPPlanTip = nil then
    FfMRPPlanTip := FindField('MRPPLANTIP');
  Result := FfMRPPlanTip;
end;

function TTableMRPEvrak.GetfMRPSiraNo: TField;
begin
  if FfMRPSiraNo = nil then
    FfMRPSiraNo := FindField('MRPSIRANO');
  Result := FfMRPSiraNo;
end;

function TTableMRPEvrak.GetfMRPTarih: TField;
begin
  if FfMRPTarih = nil then
    FfMRPTarih := FindField('MRPTARIH');
  Result := FfMRPTarih;
end;

function TTableMRPEvrak.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableMRPEvrak.GetfUretimDurum: TField;
begin
  if FfUretimDurum = nil then
    FfUretimDurum := FindField('URETIMDURUM');
  Result := FfUretimDurum;
end;

function TTableMRPEvrak.GetfUretimKonum: TField;
begin
  if FfUretimKonum = nil then
    FfUretimKonum := FindField('URETIMKONUM');
  Result := FfUretimKonum;
end;

function TTableMRPEvrak.GetfUretimNo: TField;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo;
end;

function TTableMRPEvrak.GetfUretimPlanNo: TField;
begin
  if FfUretimPlanNo = nil then
    FfUretimPlanNo := FindField('URETIMPLANNO');
  Result := FfUretimPlanNo;
end;

procedure TTableMRPEvrak.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableMRPEvrak.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableMRPEvrak.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableMRPEvrak.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableMRPEvrak.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableMRPEvrak.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableMRPEvrak.SetEvrakSiraNo(const Value: Integer);
begin
  if FfEvrakSiraNo = nil then
    FfEvrakSiraNo := FindField('EVRAKSIRANO');
  FfEvrakSiraNo.AsInteger := Value;
end;

procedure TTableMRPEvrak.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableMRPEvrak.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableMRPEvrak.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableMRPEvrak.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableMRPEvrak.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableMRPEvrak.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableMRPEvrak.SetHesapKod(const Value: String);
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  FfHesapKod.AsString := Value;
end;

procedure TTableMRPEvrak.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMRPEvrak.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableMRPEvrak.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableMRPEvrak.SetMRPMiktar(const Value: Double);
begin
  if FfMRPMiktar = nil then
    FfMRPMiktar := FindField('MRPMIKTAR');
  FfMRPMiktar.AsFloat := Value;
end;

procedure TTableMRPEvrak.SetMRPPlanTip(const Value: String);
begin
  if FfMRPPlanTip = nil then
    FfMRPPlanTip := FindField('MRPPLANTIP');
  FfMRPPlanTip.AsString := Value;
end;

procedure TTableMRPEvrak.SetMRPSiraNo(const Value: Integer);
begin
  if FfMRPSiraNo = nil then
    FfMRPSiraNo := FindField('MRPSIRANO');
  FfMRPSiraNo.AsInteger := Value;
end;

procedure TTableMRPEvrak.SetMRPTarih(const Value: TDate);
begin
  if FfMRPTarih = nil then
    FfMRPTarih := FindField('MRPTARIH');
  FfMRPTarih.AsDateTime := Value;
end;

procedure TTableMRPEvrak.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableMRPEvrak.SetUretimDurum(const Value: String);
begin
  if FfUretimDurum = nil then
    FfUretimDurum := FindField('URETIMDURUM');
  FfUretimDurum.AsString := Value;
end;

procedure TTableMRPEvrak.SetUretimKonum(const Value: String);
begin
  if FfUretimKonum = nil then
    FfUretimKonum := FindField('URETIMKONUM');
  FfUretimKonum.AsString := Value;
end;

procedure TTableMRPEvrak.SetUretimNo(const Value: String);
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  FfUretimNo.AsString := Value;
end;

procedure TTableMRPEvrak.SetUretimPlanNo(const Value: String);
begin
  if FfUretimPlanNo = nil then
    FfUretimPlanNo := FindField('URETIMPLANNO');
  FfUretimPlanNo.AsString := Value;
end;

{ TTableMRPException }

constructor TTableMRPException.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRPEXC';
end;

procedure TTableMRPException.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKod = nil then
    FfKod := FindField('KOD');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  inherited;
end;

procedure TTableMRPException.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfID := nil;
    FfKod := nil;
    FfMalKod := nil;
    FfPlanNo := nil;
    FfRowGuid := nil;
    FfSiraNo := nil;
  end;
  inherited;
end;

function TTableMRPException.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableMRPException.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMRPException.GetKod: String;
begin
  if FfKod = nil then
    FfKod := FindField('KOD');
  Result := FfKod.AsString;
end;

function TTableMRPException.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableMRPException.GetPlanNo: String;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo.AsString;
end;

function TTableMRPException.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMRPException.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableMRPException.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableMRPException.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMRPException.GetfKod: TField;
begin
  if FfKod = nil then
    FfKod := FindField('KOD');
  Result := FfKod;
end;

function TTableMRPException.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableMRPException.GetfPlanNo: TField;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo;
end;

function TTableMRPException.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMRPException.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

procedure TTableMRPException.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableMRPException.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMRPException.SetKod(const Value: String);
begin
  if FfKod = nil then
    FfKod := FindField('KOD');
  FfKod.AsString := Value;
end;

procedure TTableMRPException.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableMRPException.SetPlanNo(const Value: String);
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  FfPlanNo.AsString := Value;
end;

procedure TTableMRPException.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMRPException.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

{ TTableMRPEylemPlan }

constructor TTableMRPEylemPlan.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRPEYP';
end;

procedure TTableMRPEylemPlan.DoAfterOpen;
begin
  if FfAlimTip = nil then
    FfAlimTip := FindField('ALIMTIP');
  if FfCariKart_BolgeKod = nil then
    FfCariKart_BolgeKod := FindField('CARKRT_BOLGEKOD');
  if FfCariKart_FirmaTip = nil then
    FfCariKart_FirmaTip := FindField('CARKRT_FIRMATIP');
  if FfCariKart_Opsiyon = nil then
    FfCariKart_Opsiyon := FindField('CARKRT_OPSIYON');
  if FfEylemBirim = nil then
    FfEylemBirim := FindField('EYLEMBIRIM');
  if FfEylemCikisDepoKod = nil then
    FfEylemCikisDepoKod := FindField('EYLEMCIKISDEPOKOD');
  if FfEylemDepoKod = nil then
    FfEylemDepoKod := FindField('EYLEMDEPOKOD');
  if FfEylemHesapKod = nil then
    FfEylemHesapKod := FindField('EYLEMHESAPKOD');
  if FfEylemMiktar = nil then
    FfEylemMiktar := FindField('EYLEMMIKTAR');
  if FfEylemOzelYontem = nil then
    FfEylemOzelYontem := FindField('EYLEMOZELYONTEM');
  if FfEylemSevkHesapKod = nil then
    FfEylemSevkHesapKod := FindField('EYLEMSEVKHESAPKOD');
  if FfEylemSevkTarih = nil then
    FfEylemSevkTarih := FindField('EYLEMSEVKTARIH');
  if FfEylemSiparisTarih = nil then
    FfEylemSiparisTarih := FindField('EYLEMSIPARISTARIH');
  if FfEylemTarih = nil then
    FfEylemTarih := FindField('EYLEMTARIH');
  if FfEylemTeslimTarih = nil then
    FfEylemTeslimTarih := FindField('EYLEMTESLIMTARIH');
  if FfEylemTip = nil then
    FfEylemTip := FindField('EYLEMTIP');
  if FfEylemUygula = nil then
    FfEylemUygula := FindField('EYLEMUYGULA');
  if FfEylemYontem = nil then
    FfEylemYontem := FindField('EYLEMYONTEM');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  if FfKaynakMiktar = nil then
    FfKaynakMiktar := FindField('KAYNAKMIKTAR');
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  if FfKaynakTarih = nil then
    FfKaynakTarih := FindField('KAYNAKTARIH');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  if FfMRPSiraNo = nil then
    FfMRPSiraNo := FindField('MRPSIRANO');
  if FfOzelReceteTip = nil then
    FfOzelReceteTip := FindField('OZELRECETETIP');
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfStokKart_KDVOran = nil then
    FfStokKart_KDVOran := FindField('STKKRT_KDVORAN');
  if FfStokKart_MalAd = nil then
    FfStokKart_MalAd := FindField('STKKRT_MALAD');
  if FfStokKart_TeminTip = nil then
    FfStokKart_TeminTip := FindField('STKKRT_TEMINTIP');
  if FfStokKart_TeminYontem = nil then
    FfStokKart_TeminYontem := FindField('STKKRT_TEMINYONTEM');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableMRPEylemPlan.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAlimTip := nil;
    FfCariKart_BolgeKod := nil;
    FfCariKart_FirmaTip := nil;
    FfCariKart_Opsiyon := nil;
    FfEylemBirim := nil;
    FfEylemCikisDepoKod := nil;
    FfEylemDepoKod := nil;
    FfEylemHesapKod := nil;
    FfEylemMiktar := nil;
    FfEylemOzelYontem := nil;
    FfEylemSevkHesapKod := nil;
    FfEylemSevkTarih := nil;
    FfEylemSiparisTarih := nil;
    FfEylemTarih := nil;
    FfEylemTeslimTarih := nil;
    FfEylemTip := nil;
    FfEylemUygula := nil;
    FfEylemYontem := nil;
    FfID := nil;
    FfKaynakEvrakNo := nil;
    FfKaynakEvrakTip := nil;
    FfKaynakHesapKod := nil;
    FfKaynakMiktar := nil;
    FfKaynakSiraNo := nil;
    FfKaynakTarih := nil;
    FfMalKod := nil;
    FfMRPAlanKod := nil;
    FfMRPSiraNo := nil;
    FfOzelReceteTip := nil;
    FfPlanNo := nil;
    FfRowGuid := nil;
    FfSiraNo := nil;
    FfStokKart_KDVOran := nil;
    FfStokKart_MalAd := nil;
    FfStokKart_TeminTip := nil;
    FfStokKart_TeminYontem := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableMRPEylemPlan.GetAlimTip: Integer;
begin
  if FfAlimTip = nil then
    FfAlimTip := FindField('ALIMTIP');
  Result := FfAlimTip.AsInteger;
end;

function TTableMRPEylemPlan.GetCariKart_BolgeKod: String;
begin
  if FfCariKart_BolgeKod = nil then
    FfCariKart_BolgeKod := FindField('CARKRT_BOLGEKOD');
  Result := FfCariKart_BolgeKod.AsString;
end;

function TTableMRPEylemPlan.GetCariKart_FirmaTip: Integer;
begin
  if FfCariKart_FirmaTip = nil then
    FfCariKart_FirmaTip := FindField('CARKRT_FIRMATIP');
  Result := FfCariKart_FirmaTip.AsInteger;
end;

function TTableMRPEylemPlan.GetCariKart_Opsiyon: Integer;
begin
  if FfCariKart_Opsiyon = nil then
    FfCariKart_Opsiyon := FindField('CARKRT_OPSIYON');
  Result := FfCariKart_Opsiyon.AsInteger;
end;

function TTableMRPEylemPlan.GetEylemBirim: String;
begin
  if FfEylemBirim = nil then
    FfEylemBirim := FindField('EYLEMBIRIM');
  Result := FfEylemBirim.AsString;
end;

function TTableMRPEylemPlan.GetEylemCikisDepoKod: String;
begin
  if FfEylemCikisDepoKod = nil then
    FfEylemCikisDepoKod := FindField('EYLEMCIKISDEPOKOD');
  Result := FfEylemCikisDepoKod.AsString;
end;

function TTableMRPEylemPlan.GetEylemDepoKod: String;
begin
  if FfEylemDepoKod = nil then
    FfEylemDepoKod := FindField('EYLEMDEPOKOD');
  Result := FfEylemDepoKod.AsString;
end;

function TTableMRPEylemPlan.GetEylemHesapKod: String;
begin
  if FfEylemHesapKod = nil then
    FfEylemHesapKod := FindField('EYLEMHESAPKOD');
  Result := FfEylemHesapKod.AsString;
end;

function TTableMRPEylemPlan.GetEylemMiktar: Double;
begin
  if FfEylemMiktar = nil then
    FfEylemMiktar := FindField('EYLEMMIKTAR');
  Result := FfEylemMiktar.AsFloat;
end;

function TTableMRPEylemPlan.GetEylemOzelYontem: Integer;
begin
  if FfEylemOzelYontem = nil then
    FfEylemOzelYontem := FindField('EYLEMOZELYONTEM');
  Result := FfEylemOzelYontem.AsInteger;
end;

function TTableMRPEylemPlan.GetEylemSevkHesapKod: String;
begin
  if FfEylemSevkHesapKod = nil then
    FfEylemSevkHesapKod := FindField('EYLEMSEVKHESAPKOD');
  Result := FfEylemSevkHesapKod.AsString;
end;

function TTableMRPEylemPlan.GetEylemSevkTarih: TDate;
begin
  if FfEylemSevkTarih = nil then
    FfEylemSevkTarih := FindField('EYLEMSEVKTARIH');
  Result := FfEylemSevkTarih.AsDateTime;
end;

function TTableMRPEylemPlan.GetEylemSiparisTarih: TDate;
begin
  if FfEylemSiparisTarih = nil then
    FfEylemSiparisTarih := FindField('EYLEMSIPARISTARIH');
  Result := FfEylemSiparisTarih.AsDateTime;
end;

function TTableMRPEylemPlan.GetEylemTarih: TDate;
begin
  if FfEylemTarih = nil then
    FfEylemTarih := FindField('EYLEMTARIH');
  Result := FfEylemTarih.AsDateTime;
end;

function TTableMRPEylemPlan.GetEylemTeslimTarih: TDate;
begin
  if FfEylemTeslimTarih = nil then
    FfEylemTeslimTarih := FindField('EYLEMTESLIMTARIH');
  Result := FfEylemTeslimTarih.AsDateTime;
end;

function TTableMRPEylemPlan.GetEylemTip: Integer;
begin
  if FfEylemTip = nil then
    FfEylemTip := FindField('EYLEMTIP');
  Result := FfEylemTip.AsInteger;
end;

function TTableMRPEylemPlan.GetEylemUygula: Integer;
begin
  if FfEylemUygula = nil then
    FfEylemUygula := FindField('EYLEMUYGULA');
  Result := FfEylemUygula.AsInteger;
end;

function TTableMRPEylemPlan.GetEylemYontem: Integer;
begin
  if FfEylemYontem = nil then
    FfEylemYontem := FindField('EYLEMYONTEM');
  Result := FfEylemYontem.AsInteger;
end;

function TTableMRPEylemPlan.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMRPEylemPlan.GetKaynakEvrakNo: String;
begin
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  Result := FfKaynakEvrakNo.AsString;
end;

function TTableMRPEylemPlan.GetKaynakEvrakTip: Integer;
begin
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  Result := FfKaynakEvrakTip.AsInteger;
end;

function TTableMRPEylemPlan.GetKaynakHesapKod: String;
begin
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  Result := FfKaynakHesapKod.AsString;
end;

function TTableMRPEylemPlan.GetKaynakMiktar: Double;
begin
  if FfKaynakMiktar = nil then
    FfKaynakMiktar := FindField('KAYNAKMIKTAR');
  Result := FfKaynakMiktar.AsFloat;
end;

function TTableMRPEylemPlan.GetKaynakSiraNo: Integer;
begin
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  Result := FfKaynakSiraNo.AsInteger;
end;

function TTableMRPEylemPlan.GetKaynakTarih: TDate;
begin
  if FfKaynakTarih = nil then
    FfKaynakTarih := FindField('KAYNAKTARIH');
  Result := FfKaynakTarih.AsDateTime;
end;

function TTableMRPEylemPlan.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableMRPEylemPlan.GetMRPAlanKod: String;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod.AsString;
end;

function TTableMRPEylemPlan.GetMRPSiraNo: Integer;
begin
  if FfMRPSiraNo = nil then
    FfMRPSiraNo := FindField('MRPSIRANO');
  Result := FfMRPSiraNo.AsInteger;
end;

function TTableMRPEylemPlan.GetOzelReceteTip: Integer;
begin
  if FfOzelReceteTip = nil then
    FfOzelReceteTip := FindField('OZELRECETETIP');
  Result := FfOzelReceteTip.AsInteger;
end;

function TTableMRPEylemPlan.GetPlanNo: String;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo.AsString;
end;

function TTableMRPEylemPlan.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMRPEylemPlan.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableMRPEylemPlan.GetStokKart_KDVOran: Integer;
begin
  if FfStokKart_KDVOran = nil then
    FfStokKart_KDVOran := FindField('STKKRT_KDVORAN');
  Result := FfStokKart_KDVOran.AsInteger;
end;

function TTableMRPEylemPlan.GetStokKart_MalAd: String;
begin
  if FfStokKart_MalAd = nil then
    FfStokKart_MalAd := FindField('STKKRT_MALAD');
  Result := FfStokKart_MalAd.AsString;
end;

function TTableMRPEylemPlan.GetStokKart_TeminTip: Integer;
begin
  if FfStokKart_TeminTip = nil then
    FfStokKart_TeminTip := FindField('STKKRT_TEMINTIP');
  Result := FfStokKart_TeminTip.AsInteger;
end;

function TTableMRPEylemPlan.GetStokKart_TeminYontem: Integer;
begin
  if FfStokKart_TeminYontem = nil then
    FfStokKart_TeminYontem := FindField('STKKRT_TEMINYONTEM');
  Result := FfStokKart_TeminYontem.AsInteger;
end;

function TTableMRPEylemPlan.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableMRPEylemPlan.GetfAlimTip: TField;
begin
  if FfAlimTip = nil then
    FfAlimTip := FindField('ALIMTIP');
  Result := FfAlimTip;
end;

function TTableMRPEylemPlan.GetfCariKart_BolgeKod: TField;
begin
  if FfCariKart_BolgeKod = nil then
    FfCariKart_BolgeKod := FindField('CARKRT_BOLGEKOD');
  Result := FfCariKart_BolgeKod;
end;

function TTableMRPEylemPlan.GetfCariKart_FirmaTip: TField;
begin
  if FfCariKart_FirmaTip = nil then
    FfCariKart_FirmaTip := FindField('CARKRT_FIRMATIP');
  Result := FfCariKart_FirmaTip;
end;

function TTableMRPEylemPlan.GetfCariKart_Opsiyon: TField;
begin
  if FfCariKart_Opsiyon = nil then
    FfCariKart_Opsiyon := FindField('CARKRT_OPSIYON');
  Result := FfCariKart_Opsiyon;
end;

function TTableMRPEylemPlan.GetfEylemBirim: TField;
begin
  if FfEylemBirim = nil then
    FfEylemBirim := FindField('EYLEMBIRIM');
  Result := FfEylemBirim;
end;

function TTableMRPEylemPlan.GetfEylemCikisDepoKod: TField;
begin
  if FfEylemCikisDepoKod = nil then
    FfEylemCikisDepoKod := FindField('EYLEMCIKISDEPOKOD');
  Result := FfEylemCikisDepoKod;
end;

function TTableMRPEylemPlan.GetfEylemDepoKod: TField;
begin
  if FfEylemDepoKod = nil then
    FfEylemDepoKod := FindField('EYLEMDEPOKOD');
  Result := FfEylemDepoKod;
end;

function TTableMRPEylemPlan.GetfEylemHesapKod: TField;
begin
  if FfEylemHesapKod = nil then
    FfEylemHesapKod := FindField('EYLEMHESAPKOD');
  Result := FfEylemHesapKod;
end;

function TTableMRPEylemPlan.GetfEylemMiktar: TField;
begin
  if FfEylemMiktar = nil then
    FfEylemMiktar := FindField('EYLEMMIKTAR');
  Result := FfEylemMiktar;
end;

function TTableMRPEylemPlan.GetfEylemOzelYontem: TField;
begin
  if FfEylemOzelYontem = nil then
    FfEylemOzelYontem := FindField('EYLEMOZELYONTEM');
  Result := FfEylemOzelYontem;
end;

function TTableMRPEylemPlan.GetfEylemSevkHesapKod: TField;
begin
  if FfEylemSevkHesapKod = nil then
    FfEylemSevkHesapKod := FindField('EYLEMSEVKHESAPKOD');
  Result := FfEylemSevkHesapKod;
end;

function TTableMRPEylemPlan.GetfEylemSevkTarih: TField;
begin
  if FfEylemSevkTarih = nil then
    FfEylemSevkTarih := FindField('EYLEMSEVKTARIH');
  Result := FfEylemSevkTarih;
end;

function TTableMRPEylemPlan.GetfEylemSiparisTarih: TField;
begin
  if FfEylemSiparisTarih = nil then
    FfEylemSiparisTarih := FindField('EYLEMSIPARISTARIH');
  Result := FfEylemSiparisTarih;
end;

function TTableMRPEylemPlan.GetfEylemTarih: TField;
begin
  if FfEylemTarih = nil then
    FfEylemTarih := FindField('EYLEMTARIH');
  Result := FfEylemTarih;
end;

function TTableMRPEylemPlan.GetfEylemTeslimTarih: TField;
begin
  if FfEylemTeslimTarih = nil then
    FfEylemTeslimTarih := FindField('EYLEMTESLIMTARIH');
  Result := FfEylemTeslimTarih;
end;

function TTableMRPEylemPlan.GetfEylemTip: TField;
begin
  if FfEylemTip = nil then
    FfEylemTip := FindField('EYLEMTIP');
  Result := FfEylemTip;
end;

function TTableMRPEylemPlan.GetfEylemUygula: TField;
begin
  if FfEylemUygula = nil then
    FfEylemUygula := FindField('EYLEMUYGULA');
  Result := FfEylemUygula;
end;

function TTableMRPEylemPlan.GetfEylemYontem: TField;
begin
  if FfEylemYontem = nil then
    FfEylemYontem := FindField('EYLEMYONTEM');
  Result := FfEylemYontem;
end;

function TTableMRPEylemPlan.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMRPEylemPlan.GetfKaynakEvrakNo: TField;
begin
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  Result := FfKaynakEvrakNo;
end;

function TTableMRPEylemPlan.GetfKaynakEvrakTip: TField;
begin
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  Result := FfKaynakEvrakTip;
end;

function TTableMRPEylemPlan.GetfKaynakHesapKod: TField;
begin
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  Result := FfKaynakHesapKod;
end;

function TTableMRPEylemPlan.GetfKaynakMiktar: TField;
begin
  if FfKaynakMiktar = nil then
    FfKaynakMiktar := FindField('KAYNAKMIKTAR');
  Result := FfKaynakMiktar;
end;

function TTableMRPEylemPlan.GetfKaynakSiraNo: TField;
begin
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  Result := FfKaynakSiraNo;
end;

function TTableMRPEylemPlan.GetfKaynakTarih: TField;
begin
  if FfKaynakTarih = nil then
    FfKaynakTarih := FindField('KAYNAKTARIH');
  Result := FfKaynakTarih;
end;

function TTableMRPEylemPlan.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableMRPEylemPlan.GetfMRPAlanKod: TField;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod;
end;

function TTableMRPEylemPlan.GetfMRPSiraNo: TField;
begin
  if FfMRPSiraNo = nil then
    FfMRPSiraNo := FindField('MRPSIRANO');
  Result := FfMRPSiraNo;
end;

function TTableMRPEylemPlan.GetfOzelReceteTip: TField;
begin
  if FfOzelReceteTip = nil then
    FfOzelReceteTip := FindField('OZELRECETETIP');
  Result := FfOzelReceteTip;
end;

function TTableMRPEylemPlan.GetfPlanNo: TField;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo;
end;

function TTableMRPEylemPlan.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMRPEylemPlan.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableMRPEylemPlan.GetfStokKart_KDVOran: TField;
begin
  if FfStokKart_KDVOran = nil then
    FfStokKart_KDVOran := FindField('STKKRT_KDVORAN');
  Result := FfStokKart_KDVOran;
end;

function TTableMRPEylemPlan.GetfStokKart_MalAd: TField;
begin
  if FfStokKart_MalAd = nil then
    FfStokKart_MalAd := FindField('STKKRT_MALAD');
  Result := FfStokKart_MalAd;
end;

function TTableMRPEylemPlan.GetfStokKart_TeminTip: TField;
begin
  if FfStokKart_TeminTip = nil then
    FfStokKart_TeminTip := FindField('STKKRT_TEMINTIP');
  Result := FfStokKart_TeminTip;
end;

function TTableMRPEylemPlan.GetfStokKart_TeminYontem: TField;
begin
  if FfStokKart_TeminYontem = nil then
    FfStokKart_TeminYontem := FindField('STKKRT_TEMINYONTEM');
  Result := FfStokKart_TeminYontem;
end;

function TTableMRPEylemPlan.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableMRPEylemPlan.SetAlimTip(const Value: Integer);
begin
  if FfAlimTip = nil then
    FfAlimTip := FindField('ALIMTIP');
  FfAlimTip.AsInteger := Value;
end;

procedure TTableMRPEylemPlan.SetCariKart_BolgeKod(const Value: String);
begin
  if FfCariKart_BolgeKod = nil then
    FfCariKart_BolgeKod := FindField('CARKRT_BOLGEKOD');
  FfCariKart_BolgeKod.AsString := Value;
end;

procedure TTableMRPEylemPlan.SetCariKart_FirmaTip(const Value: Integer);
begin
  if FfCariKart_FirmaTip = nil then
    FfCariKart_FirmaTip := FindField('CARKRT_FIRMATIP');
  FfCariKart_FirmaTip.AsInteger := Value;
end;

procedure TTableMRPEylemPlan.SetCariKart_Opsiyon(const Value: Integer);
begin
  if FfCariKart_Opsiyon = nil then
    FfCariKart_Opsiyon := FindField('CARKRT_OPSIYON');
  FfCariKart_Opsiyon.AsInteger := Value;
end;

procedure TTableMRPEylemPlan.SetEylemBirim(const Value: String);
begin
  if FfEylemBirim = nil then
    FfEylemBirim := FindField('EYLEMBIRIM');
  FfEylemBirim.AsString := Value;
end;

procedure TTableMRPEylemPlan.SetEylemCikisDepoKod(const Value: String);
begin
  if FfEylemCikisDepoKod = nil then
    FfEylemCikisDepoKod := FindField('EYLEMCIKISDEPOKOD');
  FfEylemCikisDepoKod.AsString := Value;
end;

procedure TTableMRPEylemPlan.SetEylemDepoKod(const Value: String);
begin
  if FfEylemDepoKod = nil then
    FfEylemDepoKod := FindField('EYLEMDEPOKOD');
  FfEylemDepoKod.AsString := Value;
end;

procedure TTableMRPEylemPlan.SetEylemHesapKod(const Value: String);
begin
  if FfEylemHesapKod = nil then
    FfEylemHesapKod := FindField('EYLEMHESAPKOD');
  FfEylemHesapKod.AsString := Value;
end;

procedure TTableMRPEylemPlan.SetEylemMiktar(const Value: Double);
begin
  if FfEylemMiktar = nil then
    FfEylemMiktar := FindField('EYLEMMIKTAR');
  FfEylemMiktar.AsFloat := Value;
end;

procedure TTableMRPEylemPlan.SetEylemOzelYontem(const Value: Integer);
begin
  if FfEylemOzelYontem = nil then
    FfEylemOzelYontem := FindField('EYLEMOZELYONTEM');
  FfEylemOzelYontem.AsInteger := Value;
end;

procedure TTableMRPEylemPlan.SetEylemSevkHesapKod(const Value: String);
begin
  if FfEylemSevkHesapKod = nil then
    FfEylemSevkHesapKod := FindField('EYLEMSEVKHESAPKOD');
  FfEylemSevkHesapKod.AsString := Value;
end;

procedure TTableMRPEylemPlan.SetEylemSevkTarih(const Value: TDate);
begin
  if FfEylemSevkTarih = nil then
    FfEylemSevkTarih := FindField('EYLEMSEVKTARIH');
  FfEylemSevkTarih.AsDateTime := Value;
end;

procedure TTableMRPEylemPlan.SetEylemSiparisTarih(const Value: TDate);
begin
  if FfEylemSiparisTarih = nil then
    FfEylemSiparisTarih := FindField('EYLEMSIPARISTARIH');
  FfEylemSiparisTarih.AsDateTime := Value;
end;

procedure TTableMRPEylemPlan.SetEylemTarih(const Value: TDate);
begin
  if FfEylemTarih = nil then
    FfEylemTarih := FindField('EYLEMTARIH');
  FfEylemTarih.AsDateTime := Value;
end;

procedure TTableMRPEylemPlan.SetEylemTeslimTarih(const Value: TDate);
begin
  if FfEylemTeslimTarih = nil then
    FfEylemTeslimTarih := FindField('EYLEMTESLIMTARIH');
  FfEylemTeslimTarih.AsDateTime := Value;
end;

procedure TTableMRPEylemPlan.SetEylemTip(const Value: Integer);
begin
  if FfEylemTip = nil then
    FfEylemTip := FindField('EYLEMTIP');
  FfEylemTip.AsInteger := Value;
end;

procedure TTableMRPEylemPlan.SetEylemUygula(const Value: Integer);
begin
  if FfEylemUygula = nil then
    FfEylemUygula := FindField('EYLEMUYGULA');
  FfEylemUygula.AsInteger := Value;
end;

procedure TTableMRPEylemPlan.SetEylemYontem(const Value: Integer);
begin
  if FfEylemYontem = nil then
    FfEylemYontem := FindField('EYLEMYONTEM');
  FfEylemYontem.AsInteger := Value;
end;

procedure TTableMRPEylemPlan.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMRPEylemPlan.SetKaynakEvrakNo(const Value: String);
begin
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  FfKaynakEvrakNo.AsString := Value;
end;

procedure TTableMRPEylemPlan.SetKaynakEvrakTip(const Value: Integer);
begin
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  FfKaynakEvrakTip.AsInteger := Value;
end;

procedure TTableMRPEylemPlan.SetKaynakHesapKod(const Value: String);
begin
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  FfKaynakHesapKod.AsString := Value;
end;

procedure TTableMRPEylemPlan.SetKaynakMiktar(const Value: Double);
begin
  if FfKaynakMiktar = nil then
    FfKaynakMiktar := FindField('KAYNAKMIKTAR');
  FfKaynakMiktar.AsFloat := Value;
end;

procedure TTableMRPEylemPlan.SetKaynakSiraNo(const Value: Integer);
begin
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  FfKaynakSiraNo.AsInteger := Value;
end;

procedure TTableMRPEylemPlan.SetKaynakTarih(const Value: TDate);
begin
  if FfKaynakTarih = nil then
    FfKaynakTarih := FindField('KAYNAKTARIH');
  FfKaynakTarih.AsDateTime := Value;
end;

procedure TTableMRPEylemPlan.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableMRPEylemPlan.SetMRPAlanKod(const Value: String);
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  FfMRPAlanKod.AsString := Value;
end;

procedure TTableMRPEylemPlan.SetMRPSiraNo(const Value: Integer);
begin
  if FfMRPSiraNo = nil then
    FfMRPSiraNo := FindField('MRPSIRANO');
  FfMRPSiraNo.AsInteger := Value;
end;

procedure TTableMRPEylemPlan.SetOzelReceteTip(const Value: Integer);
begin
  if FfOzelReceteTip = nil then
    FfOzelReceteTip := FindField('OZELRECETETIP');
  FfOzelReceteTip.AsInteger := Value;
end;

procedure TTableMRPEylemPlan.SetPlanNo(const Value: String);
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  FfPlanNo.AsString := Value;
end;

procedure TTableMRPEylemPlan.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMRPEylemPlan.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableMRPEylemPlan.SetStokKart_KDVOran(const Value: Integer);
begin
  if FfStokKart_KDVOran = nil then
    FfStokKart_KDVOran := FindField('STKKRT_KDVORAN');
  FfStokKart_KDVOran.AsInteger := Value;
end;

procedure TTableMRPEylemPlan.SetStokKart_MalAd(const Value: String);
begin
  if FfStokKart_MalAd = nil then
    FfStokKart_MalAd := FindField('STKKRT_MALAD');
  FfStokKart_MalAd.AsString := Value;
end;

procedure TTableMRPEylemPlan.SetStokKart_TeminTip(const Value: Integer);
begin
  if FfStokKart_TeminTip = nil then
    FfStokKart_TeminTip := FindField('STKKRT_TEMINTIP');
  FfStokKart_TeminTip.AsInteger := Value;
end;

procedure TTableMRPEylemPlan.SetStokKart_TeminYontem(const Value: Integer);
begin
  if FfStokKart_TeminYontem = nil then
    FfStokKart_TeminYontem := FindField('STKKRT_TEMINYONTEM');
  FfStokKart_TeminYontem.AsInteger := Value;
end;

procedure TTableMRPEylemPlan.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableMRPIhtiyac }

constructor TTableMRPIhtiyac.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRPIHT';
end;

procedure TTableMRPIhtiyac.DoAfterOpen;
begin
  if FfAlimTip = nil then
    FfAlimTip := FindField('ALIMTIP');
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKalan = nil then
    FfKalan := FindField('KALAN');
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  if FfKullanilan = nil then
    FfKullanilan := FindField('KULLANILAN');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  if FfMRPSiraNo = nil then
    FfMRPSiraNo := FindField('MRPSIRANO');
  if FfOzelReceteTip = nil then
    FfOzelReceteTip := FindField('OZELRECETETIP');
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  if FfTip = nil then
    FfTip := FindField('TIP');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableMRPIhtiyac.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAlimTip := nil;
    FfBirim := nil;
    FfDepoKod := nil;
    FfID := nil;
    FfKalan := nil;
    FfKaynakEvrakNo := nil;
    FfKaynakEvrakTip := nil;
    FfKaynakHesapKod := nil;
    FfKaynakSiraNo := nil;
    FfKullanilan := nil;
    FfMalKod := nil;
    FfMiktar := nil;
    FfMRPAlanKod := nil;
    FfMRPSiraNo := nil;
    FfOzelReceteTip := nil;
    FfPlanNo := nil;
    FfRowGuid := nil;
    FfSiraNo := nil;
    FfTarih := nil;
    FfTip := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableMRPIhtiyac.GetAlimTip: Integer;
begin
  if FfAlimTip = nil then
    FfAlimTip := FindField('ALIMTIP');
  Result := FfAlimTip.AsInteger;
end;

function TTableMRPIhtiyac.GetBirim: String;
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  Result := FfBirim.AsString;
end;

function TTableMRPIhtiyac.GetDepoKod: String;
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  Result := FfDepoKod.AsString;
end;

function TTableMRPIhtiyac.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMRPIhtiyac.GetKalan: Double;
begin
  if FfKalan = nil then
    FfKalan := FindField('KALAN');
  Result := FfKalan.AsFloat;
end;

function TTableMRPIhtiyac.GetKaynakEvrakNo: String;
begin
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  Result := FfKaynakEvrakNo.AsString;
end;

function TTableMRPIhtiyac.GetKaynakEvrakTip: Integer;
begin
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  Result := FfKaynakEvrakTip.AsInteger;
end;

function TTableMRPIhtiyac.GetKaynakHesapKod: String;
begin
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  Result := FfKaynakHesapKod.AsString;
end;

function TTableMRPIhtiyac.GetKaynakSiraNo: Integer;
begin
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  Result := FfKaynakSiraNo.AsInteger;
end;

function TTableMRPIhtiyac.GetKullanilan: Double;
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('KULLANILAN');
  Result := FfKullanilan.AsFloat;
end;

function TTableMRPIhtiyac.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableMRPIhtiyac.GetMiktar: Double;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar.AsFloat;
end;

function TTableMRPIhtiyac.GetMRPAlanKod: String;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod.AsString;
end;

function TTableMRPIhtiyac.GetMRPSiraNo: Integer;
begin
  if FfMRPSiraNo = nil then
    FfMRPSiraNo := FindField('MRPSIRANO');
  Result := FfMRPSiraNo.AsInteger;
end;

function TTableMRPIhtiyac.GetOzelReceteTip: Integer;
begin
  if FfOzelReceteTip = nil then
    FfOzelReceteTip := FindField('OZELRECETETIP');
  Result := FfOzelReceteTip.AsInteger;
end;

function TTableMRPIhtiyac.GetPlanNo: String;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo.AsString;
end;

function TTableMRPIhtiyac.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMRPIhtiyac.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableMRPIhtiyac.GetTarih: TDate;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih.AsDateTime;
end;

function TTableMRPIhtiyac.GetTip: Integer;
begin
  if FfTip = nil then
    FfTip := FindField('TIP');
  Result := FfTip.AsInteger;
end;

function TTableMRPIhtiyac.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableMRPIhtiyac.GetfAlimTip: TField;
begin
  if FfAlimTip = nil then
    FfAlimTip := FindField('ALIMTIP');
  Result := FfAlimTip;
end;

function TTableMRPIhtiyac.GetfBirim: TField;
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  Result := FfBirim;
end;

function TTableMRPIhtiyac.GetfDepoKod: TField;
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  Result := FfDepoKod;
end;

function TTableMRPIhtiyac.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMRPIhtiyac.GetfKalan: TField;
begin
  if FfKalan = nil then
    FfKalan := FindField('KALAN');
  Result := FfKalan;
end;

function TTableMRPIhtiyac.GetfKaynakEvrakNo: TField;
begin
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  Result := FfKaynakEvrakNo;
end;

function TTableMRPIhtiyac.GetfKaynakEvrakTip: TField;
begin
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  Result := FfKaynakEvrakTip;
end;

function TTableMRPIhtiyac.GetfKaynakHesapKod: TField;
begin
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  Result := FfKaynakHesapKod;
end;

function TTableMRPIhtiyac.GetfKaynakSiraNo: TField;
begin
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  Result := FfKaynakSiraNo;
end;

function TTableMRPIhtiyac.GetfKullanilan: TField;
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('KULLANILAN');
  Result := FfKullanilan;
end;

function TTableMRPIhtiyac.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableMRPIhtiyac.GetfMiktar: TField;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar;
end;

function TTableMRPIhtiyac.GetfMRPAlanKod: TField;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod;
end;

function TTableMRPIhtiyac.GetfMRPSiraNo: TField;
begin
  if FfMRPSiraNo = nil then
    FfMRPSiraNo := FindField('MRPSIRANO');
  Result := FfMRPSiraNo;
end;

function TTableMRPIhtiyac.GetfOzelReceteTip: TField;
begin
  if FfOzelReceteTip = nil then
    FfOzelReceteTip := FindField('OZELRECETETIP');
  Result := FfOzelReceteTip;
end;

function TTableMRPIhtiyac.GetfPlanNo: TField;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo;
end;

function TTableMRPIhtiyac.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMRPIhtiyac.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableMRPIhtiyac.GetfTarih: TField;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih;
end;

function TTableMRPIhtiyac.GetfTip: TField;
begin
  if FfTip = nil then
    FfTip := FindField('TIP');
  Result := FfTip;
end;

function TTableMRPIhtiyac.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableMRPIhtiyac.SetAlimTip(const Value: Integer);
begin
  if FfAlimTip = nil then
    FfAlimTip := FindField('ALIMTIP');
  FfAlimTip.AsInteger := Value;
end;

procedure TTableMRPIhtiyac.SetBirim(const Value: String);
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  FfBirim.AsString := Value;
end;

procedure TTableMRPIhtiyac.SetDepoKod(const Value: String);
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  FfDepoKod.AsString := Value;
end;

procedure TTableMRPIhtiyac.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMRPIhtiyac.SetKalan(const Value: Double);
begin
  if FfKalan = nil then
    FfKalan := FindField('KALAN');
  FfKalan.AsFloat := Value;
end;

procedure TTableMRPIhtiyac.SetKaynakEvrakNo(const Value: String);
begin
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  FfKaynakEvrakNo.AsString := Value;
end;

procedure TTableMRPIhtiyac.SetKaynakEvrakTip(const Value: Integer);
begin
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  FfKaynakEvrakTip.AsInteger := Value;
end;

procedure TTableMRPIhtiyac.SetKaynakHesapKod(const Value: String);
begin
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  FfKaynakHesapKod.AsString := Value;
end;

procedure TTableMRPIhtiyac.SetKaynakSiraNo(const Value: Integer);
begin
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  FfKaynakSiraNo.AsInteger := Value;
end;

procedure TTableMRPIhtiyac.SetKullanilan(const Value: Double);
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('KULLANILAN');
  FfKullanilan.AsFloat := Value;
end;

procedure TTableMRPIhtiyac.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableMRPIhtiyac.SetMiktar(const Value: Double);
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  FfMiktar.AsFloat := Value;
end;

procedure TTableMRPIhtiyac.SetMRPAlanKod(const Value: String);
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  FfMRPAlanKod.AsString := Value;
end;

procedure TTableMRPIhtiyac.SetMRPSiraNo(const Value: Integer);
begin
  if FfMRPSiraNo = nil then
    FfMRPSiraNo := FindField('MRPSIRANO');
  FfMRPSiraNo.AsInteger := Value;
end;

procedure TTableMRPIhtiyac.SetOzelReceteTip(const Value: Integer);
begin
  if FfOzelReceteTip = nil then
    FfOzelReceteTip := FindField('OZELRECETETIP');
  FfOzelReceteTip.AsInteger := Value;
end;

procedure TTableMRPIhtiyac.SetPlanNo(const Value: String);
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  FfPlanNo.AsString := Value;
end;

procedure TTableMRPIhtiyac.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMRPIhtiyac.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableMRPIhtiyac.SetTarih(const Value: TDate);
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  FfTarih.AsDateTime := Value;
end;

procedure TTableMRPIhtiyac.SetTip(const Value: Integer);
begin
  if FfTip = nil then
    FfTip := FindField('TIP');
  FfTip.AsInteger := Value;
end;

procedure TTableMRPIhtiyac.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableMRPListDepReq }

constructor TTableMRPListDepReq.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRPLDR';
end;

procedure TTableMRPListDepReq.DoAfterOpen;
begin
  if FfCikisDepoKod = nil then
    FfCikisDepoKod := FindField('CIKISDEPOKOD');
  if FfCikisEvrakSiraNo = nil then
    FfCikisEvrakSiraNo := FindField('CIKISEVRAKSIRANO');
  if FfCikisFabrikaKod = nil then
    FfCikisFabrikaKod := FindField('CIKISFABRIKAKOD');
  if FfCikisIslemTip = nil then
    FfCikisIslemTip := FindField('CIKISISLEMTIP');
  if FfCikisMalKod = nil then
    FfCikisMalKod := FindField('CIKISMALKOD');
  if FfCikisMiktar = nil then
    FfCikisMiktar := FindField('CIKISMIKTAR');
  if FfCikisMRPAlanKod = nil then
    FfCikisMRPAlanKod := FindField('CIKISMRPALANKOD');
  if FfCikisSiraNo = nil then
    FfCikisSiraNo := FindField('CIKISSIRANO');
  if FfCikisTarih = nil then
    FfCikisTarih := FindField('CIKISTARIH');
  if FfCikisVersiyonNo = nil then
    FfCikisVersiyonNo := FindField('CIKISVERSIYONNO');
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  if FfEvrakSiraNo = nil then
    FfEvrakSiraNo := FindField('EVRAKSIRANO');
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableMRPListDepReq.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfCikisDepoKod := nil;
    FfCikisEvrakSiraNo := nil;
    FfCikisFabrikaKod := nil;
    FfCikisIslemTip := nil;
    FfCikisMalKod := nil;
    FfCikisMiktar := nil;
    FfCikisMRPAlanKod := nil;
    FfCikisSiraNo := nil;
    FfCikisTarih := nil;
    FfCikisVersiyonNo := nil;
    FfDepoKod := nil;
    FfEvrakNo := nil;
    FfEvrakSiraNo := nil;
    FfEvrakTip := nil;
    FfFabrikaKod := nil;
    FfHesapKod := nil;
    FfID := nil;
    FfMalKod := nil;
    FfMRPAlanKod := nil;
    FfRowGuid := nil;
    FfSiraNo := nil;
    FfSirketNo := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableMRPListDepReq.GetCikisDepoKod: String;
begin
  if FfCikisDepoKod = nil then
    FfCikisDepoKod := FindField('CIKISDEPOKOD');
  Result := FfCikisDepoKod.AsString;
end;

function TTableMRPListDepReq.GetCikisEvrakSiraNo: Integer;
begin
  if FfCikisEvrakSiraNo = nil then
    FfCikisEvrakSiraNo := FindField('CIKISEVRAKSIRANO');
  Result := FfCikisEvrakSiraNo.AsInteger;
end;

function TTableMRPListDepReq.GetCikisFabrikaKod: String;
begin
  if FfCikisFabrikaKod = nil then
    FfCikisFabrikaKod := FindField('CIKISFABRIKAKOD');
  Result := FfCikisFabrikaKod.AsString;
end;

function TTableMRPListDepReq.GetCikisIslemTip: Integer;
begin
  if FfCikisIslemTip = nil then
    FfCikisIslemTip := FindField('CIKISISLEMTIP');
  Result := FfCikisIslemTip.AsInteger;
end;

function TTableMRPListDepReq.GetCikisMalKod: String;
begin
  if FfCikisMalKod = nil then
    FfCikisMalKod := FindField('CIKISMALKOD');
  Result := FfCikisMalKod.AsString;
end;

function TTableMRPListDepReq.GetCikisMiktar: Double;
begin
  if FfCikisMiktar = nil then
    FfCikisMiktar := FindField('CIKISMIKTAR');
  Result := FfCikisMiktar.AsFloat;
end;

function TTableMRPListDepReq.GetCikisMRPAlanKod: String;
begin
  if FfCikisMRPAlanKod = nil then
    FfCikisMRPAlanKod := FindField('CIKISMRPALANKOD');
  Result := FfCikisMRPAlanKod.AsString;
end;

function TTableMRPListDepReq.GetCikisSiraNo: Integer;
begin
  if FfCikisSiraNo = nil then
    FfCikisSiraNo := FindField('CIKISSIRANO');
  Result := FfCikisSiraNo.AsInteger;
end;

function TTableMRPListDepReq.GetCikisTarih: TDate;
begin
  if FfCikisTarih = nil then
    FfCikisTarih := FindField('CIKISTARIH');
  Result := FfCikisTarih.AsDateTime;
end;

function TTableMRPListDepReq.GetCikisVersiyonNo: String;
begin
  if FfCikisVersiyonNo = nil then
    FfCikisVersiyonNo := FindField('CIKISVERSIYONNO');
  Result := FfCikisVersiyonNo.AsString;
end;

function TTableMRPListDepReq.GetDepoKod: String;
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  Result := FfDepoKod.AsString;
end;

function TTableMRPListDepReq.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableMRPListDepReq.GetEvrakSiraNo: Integer;
begin
  if FfEvrakSiraNo = nil then
    FfEvrakSiraNo := FindField('EVRAKSIRANO');
  Result := FfEvrakSiraNo.AsInteger;
end;

function TTableMRPListDepReq.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableMRPListDepReq.GetFabrikaKod: String;
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  Result := FfFabrikaKod.AsString;
end;

function TTableMRPListDepReq.GetHesapKod: String;
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  Result := FfHesapKod.AsString;
end;

function TTableMRPListDepReq.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMRPListDepReq.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableMRPListDepReq.GetMRPAlanKod: String;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod.AsString;
end;

function TTableMRPListDepReq.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMRPListDepReq.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableMRPListDepReq.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMRPListDepReq.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableMRPListDepReq.GetfCikisDepoKod: TField;
begin
  if FfCikisDepoKod = nil then
    FfCikisDepoKod := FindField('CIKISDEPOKOD');
  Result := FfCikisDepoKod;
end;

function TTableMRPListDepReq.GetfCikisEvrakSiraNo: TField;
begin
  if FfCikisEvrakSiraNo = nil then
    FfCikisEvrakSiraNo := FindField('CIKISEVRAKSIRANO');
  Result := FfCikisEvrakSiraNo;
end;

function TTableMRPListDepReq.GetfCikisFabrikaKod: TField;
begin
  if FfCikisFabrikaKod = nil then
    FfCikisFabrikaKod := FindField('CIKISFABRIKAKOD');
  Result := FfCikisFabrikaKod;
end;

function TTableMRPListDepReq.GetfCikisIslemTip: TField;
begin
  if FfCikisIslemTip = nil then
    FfCikisIslemTip := FindField('CIKISISLEMTIP');
  Result := FfCikisIslemTip;
end;

function TTableMRPListDepReq.GetfCikisMalKod: TField;
begin
  if FfCikisMalKod = nil then
    FfCikisMalKod := FindField('CIKISMALKOD');
  Result := FfCikisMalKod;
end;

function TTableMRPListDepReq.GetfCikisMiktar: TField;
begin
  if FfCikisMiktar = nil then
    FfCikisMiktar := FindField('CIKISMIKTAR');
  Result := FfCikisMiktar;
end;

function TTableMRPListDepReq.GetfCikisMRPAlanKod: TField;
begin
  if FfCikisMRPAlanKod = nil then
    FfCikisMRPAlanKod := FindField('CIKISMRPALANKOD');
  Result := FfCikisMRPAlanKod;
end;

function TTableMRPListDepReq.GetfCikisSiraNo: TField;
begin
  if FfCikisSiraNo = nil then
    FfCikisSiraNo := FindField('CIKISSIRANO');
  Result := FfCikisSiraNo;
end;

function TTableMRPListDepReq.GetfCikisTarih: TField;
begin
  if FfCikisTarih = nil then
    FfCikisTarih := FindField('CIKISTARIH');
  Result := FfCikisTarih;
end;

function TTableMRPListDepReq.GetfCikisVersiyonNo: TField;
begin
  if FfCikisVersiyonNo = nil then
    FfCikisVersiyonNo := FindField('CIKISVERSIYONNO');
  Result := FfCikisVersiyonNo;
end;

function TTableMRPListDepReq.GetfDepoKod: TField;
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  Result := FfDepoKod;
end;

function TTableMRPListDepReq.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableMRPListDepReq.GetfEvrakSiraNo: TField;
begin
  if FfEvrakSiraNo = nil then
    FfEvrakSiraNo := FindField('EVRAKSIRANO');
  Result := FfEvrakSiraNo;
end;

function TTableMRPListDepReq.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableMRPListDepReq.GetfFabrikaKod: TField;
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  Result := FfFabrikaKod;
end;

function TTableMRPListDepReq.GetfHesapKod: TField;
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  Result := FfHesapKod;
end;

function TTableMRPListDepReq.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMRPListDepReq.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableMRPListDepReq.GetfMRPAlanKod: TField;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod;
end;

function TTableMRPListDepReq.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMRPListDepReq.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableMRPListDepReq.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableMRPListDepReq.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableMRPListDepReq.SetCikisDepoKod(const Value: String);
begin
  if FfCikisDepoKod = nil then
    FfCikisDepoKod := FindField('CIKISDEPOKOD');
  FfCikisDepoKod.AsString := Value;
end;

procedure TTableMRPListDepReq.SetCikisEvrakSiraNo(const Value: Integer);
begin
  if FfCikisEvrakSiraNo = nil then
    FfCikisEvrakSiraNo := FindField('CIKISEVRAKSIRANO');
  FfCikisEvrakSiraNo.AsInteger := Value;
end;

procedure TTableMRPListDepReq.SetCikisFabrikaKod(const Value: String);
begin
  if FfCikisFabrikaKod = nil then
    FfCikisFabrikaKod := FindField('CIKISFABRIKAKOD');
  FfCikisFabrikaKod.AsString := Value;
end;

procedure TTableMRPListDepReq.SetCikisIslemTip(const Value: Integer);
begin
  if FfCikisIslemTip = nil then
    FfCikisIslemTip := FindField('CIKISISLEMTIP');
  FfCikisIslemTip.AsInteger := Value;
end;

procedure TTableMRPListDepReq.SetCikisMalKod(const Value: String);
begin
  if FfCikisMalKod = nil then
    FfCikisMalKod := FindField('CIKISMALKOD');
  FfCikisMalKod.AsString := Value;
end;

procedure TTableMRPListDepReq.SetCikisMiktar(const Value: Double);
begin
  if FfCikisMiktar = nil then
    FfCikisMiktar := FindField('CIKISMIKTAR');
  FfCikisMiktar.AsFloat := Value;
end;

procedure TTableMRPListDepReq.SetCikisMRPAlanKod(const Value: String);
begin
  if FfCikisMRPAlanKod = nil then
    FfCikisMRPAlanKod := FindField('CIKISMRPALANKOD');
  FfCikisMRPAlanKod.AsString := Value;
end;

procedure TTableMRPListDepReq.SetCikisSiraNo(const Value: Integer);
begin
  if FfCikisSiraNo = nil then
    FfCikisSiraNo := FindField('CIKISSIRANO');
  FfCikisSiraNo.AsInteger := Value;
end;

procedure TTableMRPListDepReq.SetCikisTarih(const Value: TDate);
begin
  if FfCikisTarih = nil then
    FfCikisTarih := FindField('CIKISTARIH');
  FfCikisTarih.AsDateTime := Value;
end;

procedure TTableMRPListDepReq.SetCikisVersiyonNo(const Value: String);
begin
  if FfCikisVersiyonNo = nil then
    FfCikisVersiyonNo := FindField('CIKISVERSIYONNO');
  FfCikisVersiyonNo.AsString := Value;
end;

procedure TTableMRPListDepReq.SetDepoKod(const Value: String);
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  FfDepoKod.AsString := Value;
end;

procedure TTableMRPListDepReq.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableMRPListDepReq.SetEvrakSiraNo(const Value: Integer);
begin
  if FfEvrakSiraNo = nil then
    FfEvrakSiraNo := FindField('EVRAKSIRANO');
  FfEvrakSiraNo.AsInteger := Value;
end;

procedure TTableMRPListDepReq.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableMRPListDepReq.SetFabrikaKod(const Value: String);
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  FfFabrikaKod.AsString := Value;
end;

procedure TTableMRPListDepReq.SetHesapKod(const Value: String);
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  FfHesapKod.AsString := Value;
end;

procedure TTableMRPListDepReq.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMRPListDepReq.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableMRPListDepReq.SetMRPAlanKod(const Value: String);
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  FfMRPAlanKod.AsString := Value;
end;

procedure TTableMRPListDepReq.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMRPListDepReq.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableMRPListDepReq.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableMRPListDepReq.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableMRPListError }

constructor TTableMRPListError.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRPLER';
end;

procedure TTableMRPListError.DoAfterOpen;
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  if FfHataKod = nil then
    FfHataKod := FindField('HATAKOD');
  if FfHataMesaj = nil then
    FfHataMesaj := FindField('HATAMESAJ');
  if FfHataNo = nil then
    FfHataNo := FindField('HATANO');
  if FfID = nil then
    FfID := FindField('ID');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableMRPListError.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfFabrikaKod := nil;
    FfHataKod := nil;
    FfHataMesaj := nil;
    FfHataNo := nil;
    FfID := nil;
    FfMalKod := nil;
    FfMRPAlanKod := nil;
    FfRowGuid := nil;
    FfSirketNo := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableMRPListError.GetFabrikaKod: String;
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  Result := FfFabrikaKod.AsString;
end;

function TTableMRPListError.GetHataKod: String;
begin
  if FfHataKod = nil then
    FfHataKod := FindField('HATAKOD');
  Result := FfHataKod.AsString;
end;

function TTableMRPListError.GetHataMesaj: String;
begin
  if FfHataMesaj = nil then
    FfHataMesaj := FindField('HATAMESAJ');
  Result := FfHataMesaj.AsString;
end;

function TTableMRPListError.GetHataNo: Integer;
begin
  if FfHataNo = nil then
    FfHataNo := FindField('HATANO');
  Result := FfHataNo.AsInteger;
end;

function TTableMRPListError.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMRPListError.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableMRPListError.GetMRPAlanKod: String;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod.AsString;
end;

function TTableMRPListError.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMRPListError.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMRPListError.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableMRPListError.GetfFabrikaKod: TField;
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  Result := FfFabrikaKod;
end;

function TTableMRPListError.GetfHataKod: TField;
begin
  if FfHataKod = nil then
    FfHataKod := FindField('HATAKOD');
  Result := FfHataKod;
end;

function TTableMRPListError.GetfHataMesaj: TField;
begin
  if FfHataMesaj = nil then
    FfHataMesaj := FindField('HATAMESAJ');
  Result := FfHataMesaj;
end;

function TTableMRPListError.GetfHataNo: TField;
begin
  if FfHataNo = nil then
    FfHataNo := FindField('HATANO');
  Result := FfHataNo;
end;

function TTableMRPListError.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMRPListError.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableMRPListError.GetfMRPAlanKod: TField;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod;
end;

function TTableMRPListError.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMRPListError.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableMRPListError.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableMRPListError.SetFabrikaKod(const Value: String);
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  FfFabrikaKod.AsString := Value;
end;

procedure TTableMRPListError.SetHataKod(const Value: String);
begin
  if FfHataKod = nil then
    FfHataKod := FindField('HATAKOD');
  FfHataKod.AsString := Value;
end;

procedure TTableMRPListError.SetHataMesaj(const Value: String);
begin
  if FfHataMesaj = nil then
    FfHataMesaj := FindField('HATAMESAJ');
  FfHataMesaj.AsString := Value;
end;

procedure TTableMRPListError.SetHataNo(const Value: Integer);
begin
  if FfHataNo = nil then
    FfHataNo := FindField('HATANO');
  FfHataNo.AsInteger := Value;
end;

procedure TTableMRPListError.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMRPListError.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableMRPListError.SetMRPAlanKod(const Value: String);
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  FfMRPAlanKod.AsString := Value;
end;

procedure TTableMRPListError.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMRPListError.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableMRPListError.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableMRPListException }

constructor TTableMRPListException.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRPLEX';
end;

procedure TTableMRPListException.DoAfterOpen;
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIstisnaKod = nil then
    FfIstisnaKod := FindField('ISTISNAKOD');
  if FfIstisnaMesaj = nil then
    FfIstisnaMesaj := FindField('ISTISNAMESAJ');
  if FfIstisnaNo = nil then
    FfIstisnaNo := FindField('ISTISNANO');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableMRPListException.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfFabrikaKod := nil;
    FfID := nil;
    FfIstisnaKod := nil;
    FfIstisnaMesaj := nil;
    FfIstisnaNo := nil;
    FfMalKod := nil;
    FfMRPAlanKod := nil;
    FfRowGuid := nil;
    FfSiraNo := nil;
    FfSirketNo := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableMRPListException.GetFabrikaKod: String;
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  Result := FfFabrikaKod.AsString;
end;

function TTableMRPListException.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMRPListException.GetIstisnaKod: String;
begin
  if FfIstisnaKod = nil then
    FfIstisnaKod := FindField('ISTISNAKOD');
  Result := FfIstisnaKod.AsString;
end;

function TTableMRPListException.GetIstisnaMesaj: String;
begin
  if FfIstisnaMesaj = nil then
    FfIstisnaMesaj := FindField('ISTISNAMESAJ');
  Result := FfIstisnaMesaj.AsString;
end;

function TTableMRPListException.GetIstisnaNo: Integer;
begin
  if FfIstisnaNo = nil then
    FfIstisnaNo := FindField('ISTISNANO');
  Result := FfIstisnaNo.AsInteger;
end;

function TTableMRPListException.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableMRPListException.GetMRPAlanKod: String;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod.AsString;
end;

function TTableMRPListException.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMRPListException.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableMRPListException.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMRPListException.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableMRPListException.GetfFabrikaKod: TField;
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  Result := FfFabrikaKod;
end;

function TTableMRPListException.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMRPListException.GetfIstisnaKod: TField;
begin
  if FfIstisnaKod = nil then
    FfIstisnaKod := FindField('ISTISNAKOD');
  Result := FfIstisnaKod;
end;

function TTableMRPListException.GetfIstisnaMesaj: TField;
begin
  if FfIstisnaMesaj = nil then
    FfIstisnaMesaj := FindField('ISTISNAMESAJ');
  Result := FfIstisnaMesaj;
end;

function TTableMRPListException.GetfIstisnaNo: TField;
begin
  if FfIstisnaNo = nil then
    FfIstisnaNo := FindField('ISTISNANO');
  Result := FfIstisnaNo;
end;

function TTableMRPListException.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableMRPListException.GetfMRPAlanKod: TField;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod;
end;

function TTableMRPListException.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMRPListException.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableMRPListException.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableMRPListException.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableMRPListException.SetFabrikaKod(const Value: String);
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  FfFabrikaKod.AsString := Value;
end;

procedure TTableMRPListException.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMRPListException.SetIstisnaKod(const Value: String);
begin
  if FfIstisnaKod = nil then
    FfIstisnaKod := FindField('ISTISNAKOD');
  FfIstisnaKod.AsString := Value;
end;

procedure TTableMRPListException.SetIstisnaMesaj(const Value: String);
begin
  if FfIstisnaMesaj = nil then
    FfIstisnaMesaj := FindField('ISTISNAMESAJ');
  FfIstisnaMesaj.AsString := Value;
end;

procedure TTableMRPListException.SetIstisnaNo(const Value: Integer);
begin
  if FfIstisnaNo = nil then
    FfIstisnaNo := FindField('ISTISNANO');
  FfIstisnaNo.AsInteger := Value;
end;

procedure TTableMRPListException.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableMRPListException.SetMRPAlanKod(const Value: String);
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  FfMRPAlanKod.AsString := Value;
end;

procedure TTableMRPListException.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMRPListException.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableMRPListException.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableMRPListException.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableMRPListHeader }

constructor TTableMRPListHeader.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRPLHD';
end;

procedure TTableMRPListHeader.DoAfterOpen;
begin
  if FfAlimDagitimBasTarih = nil then
    FfAlimDagitimBasTarih := FindField('ALIMDAGITIMBASTARIH');
  if FfAlimDagitimTip = nil then
    FfAlimDagitimTip := FindField('ALIMDAGITIMTIP');
  if FfAlimGumrukSure = nil then
    FfAlimGumrukSure := FindField('ALIMGUMRUKSURE');
  if FfAlimIslemSure = nil then
    FfAlimIslemSure := FindField('ALIMISLEMSURE');
  if FfAlimPartiBuyukluk = nil then
    FfAlimPartiBuyukluk := FindField('ALIMPARTIBUYUKLUK');
  if FfBasKulStokMiktar = nil then
    FfBasKulStokMiktar := FindField('BASKULSTOKMIKTAR');
  if FfBilesenFireOran = nil then
    FfBilesenFireOran := FindField('BILESENFIREORAN');
  if FfBitKulStokMiktar = nil then
    FfBitKulStokMiktar := FindField('BITKULSTOKMIKTAR');
  if FfBrutIhtiyacMiktar = nil then
    FfBrutIhtiyacMiktar := FindField('BRUTIHTIYACMIKTAR');
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  if FfGirisDepoKod = nil then
    FfGirisDepoKod := FindField('GIRISDEPOKOD');
  if FfGirisSiparisMiktar = nil then
    FfGirisSiparisMiktar := FindField('GIRISSIPARISMIKTAR');
  if FfGuvenlikSure = nil then
    FfGuvenlikSure := FindField('GUVENLIKSURE');
  if FfGuvenlikSureDonemKod = nil then
    FfGuvenlikSureDonemKod := FindField('GUVENLIKSUREDONEMKOD');
  if FfGuvenlikSureOran = nil then
    FfGuvenlikSureOran := FindField('GUVENLIKSUREORAN');
  if FfGuvenlikSureTip = nil then
    FfGuvenlikSureTip := FindField('GUVENLIKSURETIP');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKritikStokMiktar = nil then
    FfKritikStokMiktar := FindField('KRITIKSTOKMIKTAR');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfMaxAlimMiktar = nil then
    FfMaxAlimMiktar := FindField('MAXALIMMIKTAR');
  if FfMaxStokMiktar = nil then
    FfMaxStokMiktar := FindField('MAXSTOKMIKTAR');
  if FfMinAlimMiktar = nil then
    FfMinAlimMiktar := FindField('MINALIMMIKTAR');
  if FfMinStokMiktar = nil then
    FfMinStokMiktar := FindField('MINSTOKMIKTAR');
  if FfMontajFireOran = nil then
    FfMontajFireOran := FindField('MONTAJFIREORAN');
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  if FfMRPGrupKod = nil then
    FfMRPGrupKod := FindField('MRPGRUPKOD');
  if FfMRPTarih = nil then
    FfMRPTarih := FindField('MRPTARIH');
  if FfMRPTip = nil then
    FfMRPTip := FindField('MRPTIP');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSabitAlimMiktar = nil then
    FfSabitAlimMiktar := FindField('SABITALIMMIKTAR');
  if FfServisSeviyeOran = nil then
    FfServisSeviyeOran := FindField('SERVISSEVIYEORAN');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfStokKarsilamaKod = nil then
    FfStokKarsilamaKod := FindField('STOKKARSILAMAKOD');
  if FfTeminHazirlamaSure = nil then
    FfTeminHazirlamaSure := FindField('TEMINHAZIRLAMASURE');
  if FfTeminOzelYontem = nil then
    FfTeminOzelYontem := FindField('TEMINOZELYONTEM');
  if FfTeminPlanlamaGun = nil then
    FfTeminPlanlamaGun := FindField('TEMINPLANLAMAGUN');
  if FfTeminSevkiyatGun = nil then
    FfTeminSevkiyatGun := FindField('TEMINSEVKIYATGUN');
  if FfTeminSevkiyatSure = nil then
    FfTeminSevkiyatSure := FindField('TEMINSEVKIYATSURE');
  if FfTeminStokKapat = nil then
    FfTeminStokKapat := FindField('TEMINSTOKKAPAT');
  if FfTeminTip = nil then
    FfTeminTip := FindField('TEMINTIP');
  if FfTeminYer = nil then
    FfTeminYer := FindField('TEMINYER');
  if FfTeminYontem = nil then
    FfTeminYontem := FindField('TEMINYONTEM');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  if FfYeniGirisSiparisMiktar = nil then
    FfYeniGirisSiparisMiktar := FindField('YENIGIRISSIPARISMIKTAR');
  if FfYuvarlama = nil then
    FfYuvarlama := FindField('YUVARLAMA');
  inherited;
end;

procedure TTableMRPListHeader.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAlimDagitimBasTarih := nil;
    FfAlimDagitimTip := nil;
    FfAlimGumrukSure := nil;
    FfAlimIslemSure := nil;
    FfAlimPartiBuyukluk := nil;
    FfBasKulStokMiktar := nil;
    FfBilesenFireOran := nil;
    FfBitKulStokMiktar := nil;
    FfBrutIhtiyacMiktar := nil;
    FfFabrikaKod := nil;
    FfGirisDepoKod := nil;
    FfGirisSiparisMiktar := nil;
    FfGuvenlikSure := nil;
    FfGuvenlikSureDonemKod := nil;
    FfGuvenlikSureOran := nil;
    FfGuvenlikSureTip := nil;
    FfID := nil;
    FfKritikStokMiktar := nil;
    FfMalKod := nil;
    FfMaxAlimMiktar := nil;
    FfMaxStokMiktar := nil;
    FfMinAlimMiktar := nil;
    FfMinStokMiktar := nil;
    FfMontajFireOran := nil;
    FfMRPAlanKod := nil;
    FfMRPGrupKod := nil;
    FfMRPTarih := nil;
    FfMRPTip := nil;
    FfRowGuid := nil;
    FfSabitAlimMiktar := nil;
    FfServisSeviyeOran := nil;
    FfSirketNo := nil;
    FfStokKarsilamaKod := nil;
    FfTeminHazirlamaSure := nil;
    FfTeminOzelYontem := nil;
    FfTeminPlanlamaGun := nil;
    FfTeminSevkiyatGun := nil;
    FfTeminSevkiyatSure := nil;
    FfTeminStokKapat := nil;
    FfTeminTip := nil;
    FfTeminYer := nil;
    FfTeminYontem := nil;
    FfVersiyonNo := nil;
    FfYeniGirisSiparisMiktar := nil;
    FfYuvarlama := nil;
  end;
  inherited;
end;

function TTableMRPListHeader.GetAlimDagitimBasTarih: TDate;
begin
  if FfAlimDagitimBasTarih = nil then
    FfAlimDagitimBasTarih := FindField('ALIMDAGITIMBASTARIH');
  Result := FfAlimDagitimBasTarih.AsDateTime;
end;

function TTableMRPListHeader.GetAlimDagitimTip: Integer;
begin
  if FfAlimDagitimTip = nil then
    FfAlimDagitimTip := FindField('ALIMDAGITIMTIP');
  Result := FfAlimDagitimTip.AsInteger;
end;

function TTableMRPListHeader.GetAlimGumrukSure: Integer;
begin
  if FfAlimGumrukSure = nil then
    FfAlimGumrukSure := FindField('ALIMGUMRUKSURE');
  Result := FfAlimGumrukSure.AsInteger;
end;

function TTableMRPListHeader.GetAlimIslemSure: Integer;
begin
  if FfAlimIslemSure = nil then
    FfAlimIslemSure := FindField('ALIMISLEMSURE');
  Result := FfAlimIslemSure.AsInteger;
end;

function TTableMRPListHeader.GetAlimPartiBuyukluk: Double;
begin
  if FfAlimPartiBuyukluk = nil then
    FfAlimPartiBuyukluk := FindField('ALIMPARTIBUYUKLUK');
  Result := FfAlimPartiBuyukluk.AsFloat;
end;

function TTableMRPListHeader.GetBasKulStokMiktar: Double;
begin
  if FfBasKulStokMiktar = nil then
    FfBasKulStokMiktar := FindField('BASKULSTOKMIKTAR');
  Result := FfBasKulStokMiktar.AsFloat;
end;

function TTableMRPListHeader.GetBilesenFireOran: Double;
begin
  if FfBilesenFireOran = nil then
    FfBilesenFireOran := FindField('BILESENFIREORAN');
  Result := FfBilesenFireOran.AsFloat;
end;

function TTableMRPListHeader.GetBitKulStokMiktar: Double;
begin
  if FfBitKulStokMiktar = nil then
    FfBitKulStokMiktar := FindField('BITKULSTOKMIKTAR');
  Result := FfBitKulStokMiktar.AsFloat;
end;

function TTableMRPListHeader.GetBrutIhtiyacMiktar: Double;
begin
  if FfBrutIhtiyacMiktar = nil then
    FfBrutIhtiyacMiktar := FindField('BRUTIHTIYACMIKTAR');
  Result := FfBrutIhtiyacMiktar.AsFloat;
end;

function TTableMRPListHeader.GetFabrikaKod: String;
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  Result := FfFabrikaKod.AsString;
end;

function TTableMRPListHeader.GetGirisDepoKod: String;
begin
  if FfGirisDepoKod = nil then
    FfGirisDepoKod := FindField('GIRISDEPOKOD');
  Result := FfGirisDepoKod.AsString;
end;

function TTableMRPListHeader.GetGirisSiparisMiktar: Double;
begin
  if FfGirisSiparisMiktar = nil then
    FfGirisSiparisMiktar := FindField('GIRISSIPARISMIKTAR');
  Result := FfGirisSiparisMiktar.AsFloat;
end;

function TTableMRPListHeader.GetGuvenlikSure: Integer;
begin
  if FfGuvenlikSure = nil then
    FfGuvenlikSure := FindField('GUVENLIKSURE');
  Result := FfGuvenlikSure.AsInteger;
end;

function TTableMRPListHeader.GetGuvenlikSureDonemKod: String;
begin
  if FfGuvenlikSureDonemKod = nil then
    FfGuvenlikSureDonemKod := FindField('GUVENLIKSUREDONEMKOD');
  Result := FfGuvenlikSureDonemKod.AsString;
end;

function TTableMRPListHeader.GetGuvenlikSureOran: Integer;
begin
  if FfGuvenlikSureOran = nil then
    FfGuvenlikSureOran := FindField('GUVENLIKSUREORAN');
  Result := FfGuvenlikSureOran.AsInteger;
end;

function TTableMRPListHeader.GetGuvenlikSureTip: Integer;
begin
  if FfGuvenlikSureTip = nil then
    FfGuvenlikSureTip := FindField('GUVENLIKSURETIP');
  Result := FfGuvenlikSureTip.AsInteger;
end;

function TTableMRPListHeader.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMRPListHeader.GetKritikStokMiktar: Double;
begin
  if FfKritikStokMiktar = nil then
    FfKritikStokMiktar := FindField('KRITIKSTOKMIKTAR');
  Result := FfKritikStokMiktar.AsFloat;
end;

function TTableMRPListHeader.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableMRPListHeader.GetMaxAlimMiktar: Double;
begin
  if FfMaxAlimMiktar = nil then
    FfMaxAlimMiktar := FindField('MAXALIMMIKTAR');
  Result := FfMaxAlimMiktar.AsFloat;
end;

function TTableMRPListHeader.GetMaxStokMiktar: Double;
begin
  if FfMaxStokMiktar = nil then
    FfMaxStokMiktar := FindField('MAXSTOKMIKTAR');
  Result := FfMaxStokMiktar.AsFloat;
end;

function TTableMRPListHeader.GetMinAlimMiktar: Double;
begin
  if FfMinAlimMiktar = nil then
    FfMinAlimMiktar := FindField('MINALIMMIKTAR');
  Result := FfMinAlimMiktar.AsFloat;
end;

function TTableMRPListHeader.GetMinStokMiktar: Double;
begin
  if FfMinStokMiktar = nil then
    FfMinStokMiktar := FindField('MINSTOKMIKTAR');
  Result := FfMinStokMiktar.AsFloat;
end;

function TTableMRPListHeader.GetMontajFireOran: Double;
begin
  if FfMontajFireOran = nil then
    FfMontajFireOran := FindField('MONTAJFIREORAN');
  Result := FfMontajFireOran.AsFloat;
end;

function TTableMRPListHeader.GetMRPAlanKod: String;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod.AsString;
end;

function TTableMRPListHeader.GetMRPGrupKod: String;
begin
  if FfMRPGrupKod = nil then
    FfMRPGrupKod := FindField('MRPGRUPKOD');
  Result := FfMRPGrupKod.AsString;
end;

function TTableMRPListHeader.GetMRPTarih: TDate;
begin
  if FfMRPTarih = nil then
    FfMRPTarih := FindField('MRPTARIH');
  Result := FfMRPTarih.AsDateTime;
end;

function TTableMRPListHeader.GetMRPTip: Integer;
begin
  if FfMRPTip = nil then
    FfMRPTip := FindField('MRPTIP');
  Result := FfMRPTip.AsInteger;
end;

function TTableMRPListHeader.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMRPListHeader.GetSabitAlimMiktar: Double;
begin
  if FfSabitAlimMiktar = nil then
    FfSabitAlimMiktar := FindField('SABITALIMMIKTAR');
  Result := FfSabitAlimMiktar.AsFloat;
end;

function TTableMRPListHeader.GetServisSeviyeOran: Integer;
begin
  if FfServisSeviyeOran = nil then
    FfServisSeviyeOran := FindField('SERVISSEVIYEORAN');
  Result := FfServisSeviyeOran.AsInteger;
end;

function TTableMRPListHeader.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMRPListHeader.GetStokKarsilamaKod: String;
begin
  if FfStokKarsilamaKod = nil then
    FfStokKarsilamaKod := FindField('STOKKARSILAMAKOD');
  Result := FfStokKarsilamaKod.AsString;
end;

function TTableMRPListHeader.GetTeminHazirlamaSure: Integer;
begin
  if FfTeminHazirlamaSure = nil then
    FfTeminHazirlamaSure := FindField('TEMINHAZIRLAMASURE');
  Result := FfTeminHazirlamaSure.AsInteger;
end;

function TTableMRPListHeader.GetTeminOzelYontem: Integer;
begin
  if FfTeminOzelYontem = nil then
    FfTeminOzelYontem := FindField('TEMINOZELYONTEM');
  Result := FfTeminOzelYontem.AsInteger;
end;

function TTableMRPListHeader.GetTeminPlanlamaGun: String;
begin
  if FfTeminPlanlamaGun = nil then
    FfTeminPlanlamaGun := FindField('TEMINPLANLAMAGUN');
  Result := FfTeminPlanlamaGun.AsString;
end;

function TTableMRPListHeader.GetTeminSevkiyatGun: String;
begin
  if FfTeminSevkiyatGun = nil then
    FfTeminSevkiyatGun := FindField('TEMINSEVKIYATGUN');
  Result := FfTeminSevkiyatGun.AsString;
end;

function TTableMRPListHeader.GetTeminSevkiyatSure: Integer;
begin
  if FfTeminSevkiyatSure = nil then
    FfTeminSevkiyatSure := FindField('TEMINSEVKIYATSURE');
  Result := FfTeminSevkiyatSure.AsInteger;
end;

function TTableMRPListHeader.GetTeminStokKapat: Integer;
begin
  if FfTeminStokKapat = nil then
    FfTeminStokKapat := FindField('TEMINSTOKKAPAT');
  Result := FfTeminStokKapat.AsInteger;
end;

function TTableMRPListHeader.GetTeminTip: Integer;
begin
  if FfTeminTip = nil then
    FfTeminTip := FindField('TEMINTIP');
  Result := FfTeminTip.AsInteger;
end;

function TTableMRPListHeader.GetTeminYer: String;
begin
  if FfTeminYer = nil then
    FfTeminYer := FindField('TEMINYER');
  Result := FfTeminYer.AsString;
end;

function TTableMRPListHeader.GetTeminYontem: Integer;
begin
  if FfTeminYontem = nil then
    FfTeminYontem := FindField('TEMINYONTEM');
  Result := FfTeminYontem.AsInteger;
end;

function TTableMRPListHeader.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableMRPListHeader.GetYeniGirisSiparisMiktar: Double;
begin
  if FfYeniGirisSiparisMiktar = nil then
    FfYeniGirisSiparisMiktar := FindField('YENIGIRISSIPARISMIKTAR');
  Result := FfYeniGirisSiparisMiktar.AsFloat;
end;

function TTableMRPListHeader.GetYuvarlama: Integer;
begin
  if FfYuvarlama = nil then
    FfYuvarlama := FindField('YUVARLAMA');
  Result := FfYuvarlama.AsInteger;
end;

function TTableMRPListHeader.GetfAlimDagitimBasTarih: TField;
begin
  if FfAlimDagitimBasTarih = nil then
    FfAlimDagitimBasTarih := FindField('ALIMDAGITIMBASTARIH');
  Result := FfAlimDagitimBasTarih;
end;

function TTableMRPListHeader.GetfAlimDagitimTip: TField;
begin
  if FfAlimDagitimTip = nil then
    FfAlimDagitimTip := FindField('ALIMDAGITIMTIP');
  Result := FfAlimDagitimTip;
end;

function TTableMRPListHeader.GetfAlimGumrukSure: TField;
begin
  if FfAlimGumrukSure = nil then
    FfAlimGumrukSure := FindField('ALIMGUMRUKSURE');
  Result := FfAlimGumrukSure;
end;

function TTableMRPListHeader.GetfAlimIslemSure: TField;
begin
  if FfAlimIslemSure = nil then
    FfAlimIslemSure := FindField('ALIMISLEMSURE');
  Result := FfAlimIslemSure;
end;

function TTableMRPListHeader.GetfAlimPartiBuyukluk: TField;
begin
  if FfAlimPartiBuyukluk = nil then
    FfAlimPartiBuyukluk := FindField('ALIMPARTIBUYUKLUK');
  Result := FfAlimPartiBuyukluk;
end;

function TTableMRPListHeader.GetfBasKulStokMiktar: TField;
begin
  if FfBasKulStokMiktar = nil then
    FfBasKulStokMiktar := FindField('BASKULSTOKMIKTAR');
  Result := FfBasKulStokMiktar;
end;

function TTableMRPListHeader.GetfBilesenFireOran: TField;
begin
  if FfBilesenFireOran = nil then
    FfBilesenFireOran := FindField('BILESENFIREORAN');
  Result := FfBilesenFireOran;
end;

function TTableMRPListHeader.GetfBitKulStokMiktar: TField;
begin
  if FfBitKulStokMiktar = nil then
    FfBitKulStokMiktar := FindField('BITKULSTOKMIKTAR');
  Result := FfBitKulStokMiktar;
end;

function TTableMRPListHeader.GetfBrutIhtiyacMiktar: TField;
begin
  if FfBrutIhtiyacMiktar = nil then
    FfBrutIhtiyacMiktar := FindField('BRUTIHTIYACMIKTAR');
  Result := FfBrutIhtiyacMiktar;
end;

function TTableMRPListHeader.GetfFabrikaKod: TField;
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  Result := FfFabrikaKod;
end;

function TTableMRPListHeader.GetfGirisDepoKod: TField;
begin
  if FfGirisDepoKod = nil then
    FfGirisDepoKod := FindField('GIRISDEPOKOD');
  Result := FfGirisDepoKod;
end;

function TTableMRPListHeader.GetfGirisSiparisMiktar: TField;
begin
  if FfGirisSiparisMiktar = nil then
    FfGirisSiparisMiktar := FindField('GIRISSIPARISMIKTAR');
  Result := FfGirisSiparisMiktar;
end;

function TTableMRPListHeader.GetfGuvenlikSure: TField;
begin
  if FfGuvenlikSure = nil then
    FfGuvenlikSure := FindField('GUVENLIKSURE');
  Result := FfGuvenlikSure;
end;

function TTableMRPListHeader.GetfGuvenlikSureDonemKod: TField;
begin
  if FfGuvenlikSureDonemKod = nil then
    FfGuvenlikSureDonemKod := FindField('GUVENLIKSUREDONEMKOD');
  Result := FfGuvenlikSureDonemKod;
end;

function TTableMRPListHeader.GetfGuvenlikSureOran: TField;
begin
  if FfGuvenlikSureOran = nil then
    FfGuvenlikSureOran := FindField('GUVENLIKSUREORAN');
  Result := FfGuvenlikSureOran;
end;

function TTableMRPListHeader.GetfGuvenlikSureTip: TField;
begin
  if FfGuvenlikSureTip = nil then
    FfGuvenlikSureTip := FindField('GUVENLIKSURETIP');
  Result := FfGuvenlikSureTip;
end;

function TTableMRPListHeader.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMRPListHeader.GetfKritikStokMiktar: TField;
begin
  if FfKritikStokMiktar = nil then
    FfKritikStokMiktar := FindField('KRITIKSTOKMIKTAR');
  Result := FfKritikStokMiktar;
end;

function TTableMRPListHeader.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableMRPListHeader.GetfMaxAlimMiktar: TField;
begin
  if FfMaxAlimMiktar = nil then
    FfMaxAlimMiktar := FindField('MAXALIMMIKTAR');
  Result := FfMaxAlimMiktar;
end;

function TTableMRPListHeader.GetfMaxStokMiktar: TField;
begin
  if FfMaxStokMiktar = nil then
    FfMaxStokMiktar := FindField('MAXSTOKMIKTAR');
  Result := FfMaxStokMiktar;
end;

function TTableMRPListHeader.GetfMinAlimMiktar: TField;
begin
  if FfMinAlimMiktar = nil then
    FfMinAlimMiktar := FindField('MINALIMMIKTAR');
  Result := FfMinAlimMiktar;
end;

function TTableMRPListHeader.GetfMinStokMiktar: TField;
begin
  if FfMinStokMiktar = nil then
    FfMinStokMiktar := FindField('MINSTOKMIKTAR');
  Result := FfMinStokMiktar;
end;

function TTableMRPListHeader.GetfMontajFireOran: TField;
begin
  if FfMontajFireOran = nil then
    FfMontajFireOran := FindField('MONTAJFIREORAN');
  Result := FfMontajFireOran;
end;

function TTableMRPListHeader.GetfMRPAlanKod: TField;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod;
end;

function TTableMRPListHeader.GetfMRPGrupKod: TField;
begin
  if FfMRPGrupKod = nil then
    FfMRPGrupKod := FindField('MRPGRUPKOD');
  Result := FfMRPGrupKod;
end;

function TTableMRPListHeader.GetfMRPTarih: TField;
begin
  if FfMRPTarih = nil then
    FfMRPTarih := FindField('MRPTARIH');
  Result := FfMRPTarih;
end;

function TTableMRPListHeader.GetfMRPTip: TField;
begin
  if FfMRPTip = nil then
    FfMRPTip := FindField('MRPTIP');
  Result := FfMRPTip;
end;

function TTableMRPListHeader.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMRPListHeader.GetfSabitAlimMiktar: TField;
begin
  if FfSabitAlimMiktar = nil then
    FfSabitAlimMiktar := FindField('SABITALIMMIKTAR');
  Result := FfSabitAlimMiktar;
end;

function TTableMRPListHeader.GetfServisSeviyeOran: TField;
begin
  if FfServisSeviyeOran = nil then
    FfServisSeviyeOran := FindField('SERVISSEVIYEORAN');
  Result := FfServisSeviyeOran;
end;

function TTableMRPListHeader.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableMRPListHeader.GetfStokKarsilamaKod: TField;
begin
  if FfStokKarsilamaKod = nil then
    FfStokKarsilamaKod := FindField('STOKKARSILAMAKOD');
  Result := FfStokKarsilamaKod;
end;

function TTableMRPListHeader.GetfTeminHazirlamaSure: TField;
begin
  if FfTeminHazirlamaSure = nil then
    FfTeminHazirlamaSure := FindField('TEMINHAZIRLAMASURE');
  Result := FfTeminHazirlamaSure;
end;

function TTableMRPListHeader.GetfTeminOzelYontem: TField;
begin
  if FfTeminOzelYontem = nil then
    FfTeminOzelYontem := FindField('TEMINOZELYONTEM');
  Result := FfTeminOzelYontem;
end;

function TTableMRPListHeader.GetfTeminPlanlamaGun: TField;
begin
  if FfTeminPlanlamaGun = nil then
    FfTeminPlanlamaGun := FindField('TEMINPLANLAMAGUN');
  Result := FfTeminPlanlamaGun;
end;

function TTableMRPListHeader.GetfTeminSevkiyatGun: TField;
begin
  if FfTeminSevkiyatGun = nil then
    FfTeminSevkiyatGun := FindField('TEMINSEVKIYATGUN');
  Result := FfTeminSevkiyatGun;
end;

function TTableMRPListHeader.GetfTeminSevkiyatSure: TField;
begin
  if FfTeminSevkiyatSure = nil then
    FfTeminSevkiyatSure := FindField('TEMINSEVKIYATSURE');
  Result := FfTeminSevkiyatSure;
end;

function TTableMRPListHeader.GetfTeminStokKapat: TField;
begin
  if FfTeminStokKapat = nil then
    FfTeminStokKapat := FindField('TEMINSTOKKAPAT');
  Result := FfTeminStokKapat;
end;

function TTableMRPListHeader.GetfTeminTip: TField;
begin
  if FfTeminTip = nil then
    FfTeminTip := FindField('TEMINTIP');
  Result := FfTeminTip;
end;

function TTableMRPListHeader.GetfTeminYer: TField;
begin
  if FfTeminYer = nil then
    FfTeminYer := FindField('TEMINYER');
  Result := FfTeminYer;
end;

function TTableMRPListHeader.GetfTeminYontem: TField;
begin
  if FfTeminYontem = nil then
    FfTeminYontem := FindField('TEMINYONTEM');
  Result := FfTeminYontem;
end;

function TTableMRPListHeader.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

function TTableMRPListHeader.GetfYeniGirisSiparisMiktar: TField;
begin
  if FfYeniGirisSiparisMiktar = nil then
    FfYeniGirisSiparisMiktar := FindField('YENIGIRISSIPARISMIKTAR');
  Result := FfYeniGirisSiparisMiktar;
end;

function TTableMRPListHeader.GetfYuvarlama: TField;
begin
  if FfYuvarlama = nil then
    FfYuvarlama := FindField('YUVARLAMA');
  Result := FfYuvarlama;
end;

procedure TTableMRPListHeader.SetAlimDagitimBasTarih(const Value: TDate);
begin
  if FfAlimDagitimBasTarih = nil then
    FfAlimDagitimBasTarih := FindField('ALIMDAGITIMBASTARIH');
  FfAlimDagitimBasTarih.AsDateTime := Value;
end;

procedure TTableMRPListHeader.SetAlimDagitimTip(const Value: Integer);
begin
  if FfAlimDagitimTip = nil then
    FfAlimDagitimTip := FindField('ALIMDAGITIMTIP');
  FfAlimDagitimTip.AsInteger := Value;
end;

procedure TTableMRPListHeader.SetAlimGumrukSure(const Value: Integer);
begin
  if FfAlimGumrukSure = nil then
    FfAlimGumrukSure := FindField('ALIMGUMRUKSURE');
  FfAlimGumrukSure.AsInteger := Value;
end;

procedure TTableMRPListHeader.SetAlimIslemSure(const Value: Integer);
begin
  if FfAlimIslemSure = nil then
    FfAlimIslemSure := FindField('ALIMISLEMSURE');
  FfAlimIslemSure.AsInteger := Value;
end;

procedure TTableMRPListHeader.SetAlimPartiBuyukluk(const Value: Double);
begin
  if FfAlimPartiBuyukluk = nil then
    FfAlimPartiBuyukluk := FindField('ALIMPARTIBUYUKLUK');
  FfAlimPartiBuyukluk.AsFloat := Value;
end;

procedure TTableMRPListHeader.SetBasKulStokMiktar(const Value: Double);
begin
  if FfBasKulStokMiktar = nil then
    FfBasKulStokMiktar := FindField('BASKULSTOKMIKTAR');
  FfBasKulStokMiktar.AsFloat := Value;
end;

procedure TTableMRPListHeader.SetBilesenFireOran(const Value: Double);
begin
  if FfBilesenFireOran = nil then
    FfBilesenFireOran := FindField('BILESENFIREORAN');
  FfBilesenFireOran.AsFloat := Value;
end;

procedure TTableMRPListHeader.SetBitKulStokMiktar(const Value: Double);
begin
  if FfBitKulStokMiktar = nil then
    FfBitKulStokMiktar := FindField('BITKULSTOKMIKTAR');
  FfBitKulStokMiktar.AsFloat := Value;
end;

procedure TTableMRPListHeader.SetBrutIhtiyacMiktar(const Value: Double);
begin
  if FfBrutIhtiyacMiktar = nil then
    FfBrutIhtiyacMiktar := FindField('BRUTIHTIYACMIKTAR');
  FfBrutIhtiyacMiktar.AsFloat := Value;
end;

procedure TTableMRPListHeader.SetFabrikaKod(const Value: String);
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  FfFabrikaKod.AsString := Value;
end;

procedure TTableMRPListHeader.SetGirisDepoKod(const Value: String);
begin
  if FfGirisDepoKod = nil then
    FfGirisDepoKod := FindField('GIRISDEPOKOD');
  FfGirisDepoKod.AsString := Value;
end;

procedure TTableMRPListHeader.SetGirisSiparisMiktar(const Value: Double);
begin
  if FfGirisSiparisMiktar = nil then
    FfGirisSiparisMiktar := FindField('GIRISSIPARISMIKTAR');
  FfGirisSiparisMiktar.AsFloat := Value;
end;

procedure TTableMRPListHeader.SetGuvenlikSure(const Value: Integer);
begin
  if FfGuvenlikSure = nil then
    FfGuvenlikSure := FindField('GUVENLIKSURE');
  FfGuvenlikSure.AsInteger := Value;
end;

procedure TTableMRPListHeader.SetGuvenlikSureDonemKod(const Value: String);
begin
  if FfGuvenlikSureDonemKod = nil then
    FfGuvenlikSureDonemKod := FindField('GUVENLIKSUREDONEMKOD');
  FfGuvenlikSureDonemKod.AsString := Value;
end;

procedure TTableMRPListHeader.SetGuvenlikSureOran(const Value: Integer);
begin
  if FfGuvenlikSureOran = nil then
    FfGuvenlikSureOran := FindField('GUVENLIKSUREORAN');
  FfGuvenlikSureOran.AsInteger := Value;
end;

procedure TTableMRPListHeader.SetGuvenlikSureTip(const Value: Integer);
begin
  if FfGuvenlikSureTip = nil then
    FfGuvenlikSureTip := FindField('GUVENLIKSURETIP');
  FfGuvenlikSureTip.AsInteger := Value;
end;

procedure TTableMRPListHeader.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMRPListHeader.SetKritikStokMiktar(const Value: Double);
begin
  if FfKritikStokMiktar = nil then
    FfKritikStokMiktar := FindField('KRITIKSTOKMIKTAR');
  FfKritikStokMiktar.AsFloat := Value;
end;

procedure TTableMRPListHeader.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableMRPListHeader.SetMaxAlimMiktar(const Value: Double);
begin
  if FfMaxAlimMiktar = nil then
    FfMaxAlimMiktar := FindField('MAXALIMMIKTAR');
  FfMaxAlimMiktar.AsFloat := Value;
end;

procedure TTableMRPListHeader.SetMaxStokMiktar(const Value: Double);
begin
  if FfMaxStokMiktar = nil then
    FfMaxStokMiktar := FindField('MAXSTOKMIKTAR');
  FfMaxStokMiktar.AsFloat := Value;
end;

procedure TTableMRPListHeader.SetMinAlimMiktar(const Value: Double);
begin
  if FfMinAlimMiktar = nil then
    FfMinAlimMiktar := FindField('MINALIMMIKTAR');
  FfMinAlimMiktar.AsFloat := Value;
end;

procedure TTableMRPListHeader.SetMinStokMiktar(const Value: Double);
begin
  if FfMinStokMiktar = nil then
    FfMinStokMiktar := FindField('MINSTOKMIKTAR');
  FfMinStokMiktar.AsFloat := Value;
end;

procedure TTableMRPListHeader.SetMontajFireOran(const Value: Double);
begin
  if FfMontajFireOran = nil then
    FfMontajFireOran := FindField('MONTAJFIREORAN');
  FfMontajFireOran.AsFloat := Value;
end;

procedure TTableMRPListHeader.SetMRPAlanKod(const Value: String);
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  FfMRPAlanKod.AsString := Value;
end;

procedure TTableMRPListHeader.SetMRPGrupKod(const Value: String);
begin
  if FfMRPGrupKod = nil then
    FfMRPGrupKod := FindField('MRPGRUPKOD');
  FfMRPGrupKod.AsString := Value;
end;

procedure TTableMRPListHeader.SetMRPTarih(const Value: TDate);
begin
  if FfMRPTarih = nil then
    FfMRPTarih := FindField('MRPTARIH');
  FfMRPTarih.AsDateTime := Value;
end;

procedure TTableMRPListHeader.SetMRPTip(const Value: Integer);
begin
  if FfMRPTip = nil then
    FfMRPTip := FindField('MRPTIP');
  FfMRPTip.AsInteger := Value;
end;

procedure TTableMRPListHeader.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMRPListHeader.SetSabitAlimMiktar(const Value: Double);
begin
  if FfSabitAlimMiktar = nil then
    FfSabitAlimMiktar := FindField('SABITALIMMIKTAR');
  FfSabitAlimMiktar.AsFloat := Value;
end;

procedure TTableMRPListHeader.SetServisSeviyeOran(const Value: Integer);
begin
  if FfServisSeviyeOran = nil then
    FfServisSeviyeOran := FindField('SERVISSEVIYEORAN');
  FfServisSeviyeOran.AsInteger := Value;
end;

procedure TTableMRPListHeader.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableMRPListHeader.SetStokKarsilamaKod(const Value: String);
begin
  if FfStokKarsilamaKod = nil then
    FfStokKarsilamaKod := FindField('STOKKARSILAMAKOD');
  FfStokKarsilamaKod.AsString := Value;
end;

procedure TTableMRPListHeader.SetTeminHazirlamaSure(const Value: Integer);
begin
  if FfTeminHazirlamaSure = nil then
    FfTeminHazirlamaSure := FindField('TEMINHAZIRLAMASURE');
  FfTeminHazirlamaSure.AsInteger := Value;
end;

procedure TTableMRPListHeader.SetTeminOzelYontem(const Value: Integer);
begin
  if FfTeminOzelYontem = nil then
    FfTeminOzelYontem := FindField('TEMINOZELYONTEM');
  FfTeminOzelYontem.AsInteger := Value;
end;

procedure TTableMRPListHeader.SetTeminPlanlamaGun(const Value: String);
begin
  if FfTeminPlanlamaGun = nil then
    FfTeminPlanlamaGun := FindField('TEMINPLANLAMAGUN');
  FfTeminPlanlamaGun.AsString := Value;
end;

procedure TTableMRPListHeader.SetTeminSevkiyatGun(const Value: String);
begin
  if FfTeminSevkiyatGun = nil then
    FfTeminSevkiyatGun := FindField('TEMINSEVKIYATGUN');
  FfTeminSevkiyatGun.AsString := Value;
end;

procedure TTableMRPListHeader.SetTeminSevkiyatSure(const Value: Integer);
begin
  if FfTeminSevkiyatSure = nil then
    FfTeminSevkiyatSure := FindField('TEMINSEVKIYATSURE');
  FfTeminSevkiyatSure.AsInteger := Value;
end;

procedure TTableMRPListHeader.SetTeminStokKapat(const Value: Integer);
begin
  if FfTeminStokKapat = nil then
    FfTeminStokKapat := FindField('TEMINSTOKKAPAT');
  FfTeminStokKapat.AsInteger := Value;
end;

procedure TTableMRPListHeader.SetTeminTip(const Value: Integer);
begin
  if FfTeminTip = nil then
    FfTeminTip := FindField('TEMINTIP');
  FfTeminTip.AsInteger := Value;
end;

procedure TTableMRPListHeader.SetTeminYer(const Value: String);
begin
  if FfTeminYer = nil then
    FfTeminYer := FindField('TEMINYER');
  FfTeminYer.AsString := Value;
end;

procedure TTableMRPListHeader.SetTeminYontem(const Value: Integer);
begin
  if FfTeminYontem = nil then
    FfTeminYontem := FindField('TEMINYONTEM');
  FfTeminYontem.AsInteger := Value;
end;

procedure TTableMRPListHeader.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

procedure TTableMRPListHeader.SetYeniGirisSiparisMiktar(const Value: Double);
begin
  if FfYeniGirisSiparisMiktar = nil then
    FfYeniGirisSiparisMiktar := FindField('YENIGIRISSIPARISMIKTAR');
  FfYeniGirisSiparisMiktar.AsFloat := Value;
end;

procedure TTableMRPListHeader.SetYuvarlama(const Value: Integer);
begin
  if FfYuvarlama = nil then
    FfYuvarlama := FindField('YUVARLAMA');
  FfYuvarlama.AsInteger := Value;
end;

{ TTableMRPListItems }

constructor TTableMRPListItems.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRPLST';
end;

procedure TTableMRPListItems.DoAfterOpen;
begin
  if FfCariKart_BolgeKod = nil then
    FfCariKart_BolgeKod := FindField('CARKRT_BOLGEKOD');
  if FfCariKart_FirmaTip = nil then
    FfCariKart_FirmaTip := FindField('CARKRT_FIRMATIP');
  if FfCariKart_Opsiyon = nil then
    FfCariKart_Opsiyon := FindField('CARKRT_OPSIYON');
  if FfCikisDepoKod = nil then
    FfCikisDepoKod := FindField('CIKISDEPOKOD');
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  if FfEvrakSiraNo = nil then
    FfEvrakSiraNo := FindField('EVRAKSIRANO');
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  if FfEylemTip = nil then
    FfEylemTip := FindField('EYLEMTIP');
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  if FfGirisCikis = nil then
    FfGirisCikis := FindField('GIRISCIKIS');
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  if FfIstisnaKod = nil then
    FfIstisnaKod := FindField('ISTISNAKOD');
  if FfKulStokMiktar = nil then
    FfKulStokMiktar := FindField('KULSTOKMIKTAR');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  if FfPlanTip = nil then
    FfPlanTip := FindField('PLANTIP');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSevkTarih = nil then
    FfSevkTarih := FindField('SEVKTARIH');
  if FfSiparisTarih = nil then
    FfSiparisTarih := FindField('SIPARISTARIH');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSiraTip = nil then
    FfSiraTip := FindField('SIRATIP');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfStokKart_Birim = nil then
    FfStokKart_Birim := FindField('STKKRT_BIRIM');
  if FfStokKart_KDVOran = nil then
    FfStokKart_KDVOran := FindField('STKKRT_KDVORAN');
  if FfStokKart_MalAd = nil then
    FfStokKart_MalAd := FindField('STKKRT_MALAD');
  if FfStokKart_TeminYontem = nil then
    FfStokKart_TeminYontem := FindField('STKKRT_TEMINYONTEM');
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  if FfTeslimTarih = nil then
    FfTeslimTarih := FindField('TESLIMTARIH');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableMRPListItems.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfCariKart_BolgeKod := nil;
    FfCariKart_FirmaTip := nil;
    FfCariKart_Opsiyon := nil;
    FfCikisDepoKod := nil;
    FfDepoKod := nil;
    FfEvrakNo := nil;
    FfEvrakSiraNo := nil;
    FfEvrakTip := nil;
    FfEylemTip := nil;
    FfFabrikaKod := nil;
    FfGirisCikis := nil;
    FfHesapKod := nil;
    FfID := nil;
    FfIslemTip := nil;
    FfIstisnaKod := nil;
    FfKulStokMiktar := nil;
    FfMalKod := nil;
    FfMiktar := nil;
    FfMRPAlanKod := nil;
    FfPlanTip := nil;
    FfRowGuid := nil;
    FfSevkTarih := nil;
    FfSiparisTarih := nil;
    FfSiraNo := nil;
    FfSiraTip := nil;
    FfSirketNo := nil;
    FfStokKart_Birim := nil;
    FfStokKart_KDVOran := nil;
    FfStokKart_MalAd := nil;
    FfStokKart_TeminYontem := nil;
    FfTarih := nil;
    FfTeslimTarih := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableMRPListItems.GetCariKart_BolgeKod: String;
begin
  if FfCariKart_BolgeKod = nil then
    FfCariKart_BolgeKod := FindField('CARKRT_BOLGEKOD');
  Result := FfCariKart_BolgeKod.AsString;
end;

function TTableMRPListItems.GetCariKart_FirmaTip: Integer;
begin
  if FfCariKart_FirmaTip = nil then
    FfCariKart_FirmaTip := FindField('CARKRT_FIRMATIP');
  Result := FfCariKart_FirmaTip.AsInteger;
end;

function TTableMRPListItems.GetCariKart_Opsiyon: Integer;
begin
  if FfCariKart_Opsiyon = nil then
    FfCariKart_Opsiyon := FindField('CARKRT_OPSIYON');
  Result := FfCariKart_Opsiyon.AsInteger;
end;

function TTableMRPListItems.GetCikisDepoKod: String;
begin
  if FfCikisDepoKod = nil then
    FfCikisDepoKod := FindField('CIKISDEPOKOD');
  Result := FfCikisDepoKod.AsString;
end;

function TTableMRPListItems.GetDepoKod: String;
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  Result := FfDepoKod.AsString;
end;

function TTableMRPListItems.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableMRPListItems.GetEvrakSiraNo: Integer;
begin
  if FfEvrakSiraNo = nil then
    FfEvrakSiraNo := FindField('EVRAKSIRANO');
  Result := FfEvrakSiraNo.AsInteger;
end;

function TTableMRPListItems.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableMRPListItems.GetEylemTip: Integer;
begin
  if FfEylemTip = nil then
    FfEylemTip := FindField('EYLEMTIP');
  Result := FfEylemTip.AsInteger;
end;

function TTableMRPListItems.GetFabrikaKod: String;
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  Result := FfFabrikaKod.AsString;
end;

function TTableMRPListItems.GetGirisCikis: Integer;
begin
  if FfGirisCikis = nil then
    FfGirisCikis := FindField('GIRISCIKIS');
  Result := FfGirisCikis.AsInteger;
end;

function TTableMRPListItems.GetHesapKod: String;
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  Result := FfHesapKod.AsString;
end;

function TTableMRPListItems.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMRPListItems.GetIslemTip: Integer;
begin
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  Result := FfIslemTip.AsInteger;
end;

function TTableMRPListItems.GetIstisnaKod: String;
begin
  if FfIstisnaKod = nil then
    FfIstisnaKod := FindField('ISTISNAKOD');
  Result := FfIstisnaKod.AsString;
end;

function TTableMRPListItems.GetKulStokMiktar: Double;
begin
  if FfKulStokMiktar = nil then
    FfKulStokMiktar := FindField('KULSTOKMIKTAR');
  Result := FfKulStokMiktar.AsFloat;
end;

function TTableMRPListItems.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableMRPListItems.GetMiktar: Double;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar.AsFloat;
end;

function TTableMRPListItems.GetMRPAlanKod: String;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod.AsString;
end;

function TTableMRPListItems.GetPlanTip: Integer;
begin
  if FfPlanTip = nil then
    FfPlanTip := FindField('PLANTIP');
  Result := FfPlanTip.AsInteger;
end;

function TTableMRPListItems.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMRPListItems.GetSevkTarih: TDate;
begin
  if FfSevkTarih = nil then
    FfSevkTarih := FindField('SEVKTARIH');
  Result := FfSevkTarih.AsDateTime;
end;

function TTableMRPListItems.GetSiparisTarih: TDate;
begin
  if FfSiparisTarih = nil then
    FfSiparisTarih := FindField('SIPARISTARIH');
  Result := FfSiparisTarih.AsDateTime;
end;

function TTableMRPListItems.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableMRPListItems.GetSiraTip: Integer;
begin
  if FfSiraTip = nil then
    FfSiraTip := FindField('SIRATIP');
  Result := FfSiraTip.AsInteger;
end;

function TTableMRPListItems.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMRPListItems.GetStokKart_Birim: String;
begin
  if FfStokKart_Birim = nil then
    FfStokKart_Birim := FindField('STKKRT_BIRIM');
  Result := FfStokKart_Birim.AsString;
end;

function TTableMRPListItems.GetStokKart_KDVOran: Integer;
begin
  if FfStokKart_KDVOran = nil then
    FfStokKart_KDVOran := FindField('STKKRT_KDVORAN');
  Result := FfStokKart_KDVOran.AsInteger;
end;

function TTableMRPListItems.GetStokKart_MalAd: String;
begin
  if FfStokKart_MalAd = nil then
    FfStokKart_MalAd := FindField('STKKRT_MALAD');
  Result := FfStokKart_MalAd.AsString;
end;

function TTableMRPListItems.GetStokKart_TeminYontem: Integer;
begin
  if FfStokKart_TeminYontem = nil then
    FfStokKart_TeminYontem := FindField('STKKRT_TEMINYONTEM');
  Result := FfStokKart_TeminYontem.AsInteger;
end;

function TTableMRPListItems.GetTarih: TDate;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih.AsDateTime;
end;

function TTableMRPListItems.GetTeslimTarih: TDate;
begin
  if FfTeslimTarih = nil then
    FfTeslimTarih := FindField('TESLIMTARIH');
  Result := FfTeslimTarih.AsDateTime;
end;

function TTableMRPListItems.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableMRPListItems.GetfCariKart_BolgeKod: TField;
begin
  if FfCariKart_BolgeKod = nil then
    FfCariKart_BolgeKod := FindField('CARKRT_BOLGEKOD');
  Result := FfCariKart_BolgeKod;
end;

function TTableMRPListItems.GetfCariKart_FirmaTip: TField;
begin
  if FfCariKart_FirmaTip = nil then
    FfCariKart_FirmaTip := FindField('CARKRT_FIRMATIP');
  Result := FfCariKart_FirmaTip;
end;

function TTableMRPListItems.GetfCariKart_Opsiyon: TField;
begin
  if FfCariKart_Opsiyon = nil then
    FfCariKart_Opsiyon := FindField('CARKRT_OPSIYON');
  Result := FfCariKart_Opsiyon;
end;

function TTableMRPListItems.GetfCikisDepoKod: TField;
begin
  if FfCikisDepoKod = nil then
    FfCikisDepoKod := FindField('CIKISDEPOKOD');
  Result := FfCikisDepoKod;
end;

function TTableMRPListItems.GetfDepoKod: TField;
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  Result := FfDepoKod;
end;

function TTableMRPListItems.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableMRPListItems.GetfEvrakSiraNo: TField;
begin
  if FfEvrakSiraNo = nil then
    FfEvrakSiraNo := FindField('EVRAKSIRANO');
  Result := FfEvrakSiraNo;
end;

function TTableMRPListItems.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableMRPListItems.GetfEylemTip: TField;
begin
  if FfEylemTip = nil then
    FfEylemTip := FindField('EYLEMTIP');
  Result := FfEylemTip;
end;

function TTableMRPListItems.GetfFabrikaKod: TField;
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  Result := FfFabrikaKod;
end;

function TTableMRPListItems.GetfGirisCikis: TField;
begin
  if FfGirisCikis = nil then
    FfGirisCikis := FindField('GIRISCIKIS');
  Result := FfGirisCikis;
end;

function TTableMRPListItems.GetfHesapKod: TField;
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  Result := FfHesapKod;
end;

function TTableMRPListItems.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMRPListItems.GetfIslemTip: TField;
begin
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  Result := FfIslemTip;
end;

function TTableMRPListItems.GetfIstisnaKod: TField;
begin
  if FfIstisnaKod = nil then
    FfIstisnaKod := FindField('ISTISNAKOD');
  Result := FfIstisnaKod;
end;

function TTableMRPListItems.GetfKulStokMiktar: TField;
begin
  if FfKulStokMiktar = nil then
    FfKulStokMiktar := FindField('KULSTOKMIKTAR');
  Result := FfKulStokMiktar;
end;

function TTableMRPListItems.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableMRPListItems.GetfMiktar: TField;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar;
end;

function TTableMRPListItems.GetfMRPAlanKod: TField;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod;
end;

function TTableMRPListItems.GetfPlanTip: TField;
begin
  if FfPlanTip = nil then
    FfPlanTip := FindField('PLANTIP');
  Result := FfPlanTip;
end;

function TTableMRPListItems.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMRPListItems.GetfSevkTarih: TField;
begin
  if FfSevkTarih = nil then
    FfSevkTarih := FindField('SEVKTARIH');
  Result := FfSevkTarih;
end;

function TTableMRPListItems.GetfSiparisTarih: TField;
begin
  if FfSiparisTarih = nil then
    FfSiparisTarih := FindField('SIPARISTARIH');
  Result := FfSiparisTarih;
end;

function TTableMRPListItems.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableMRPListItems.GetfSiraTip: TField;
begin
  if FfSiraTip = nil then
    FfSiraTip := FindField('SIRATIP');
  Result := FfSiraTip;
end;

function TTableMRPListItems.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableMRPListItems.GetfStokKart_Birim: TField;
begin
  if FfStokKart_Birim = nil then
    FfStokKart_Birim := FindField('STKKRT_BIRIM');
  Result := FfStokKart_Birim;
end;

function TTableMRPListItems.GetfStokKart_KDVOran: TField;
begin
  if FfStokKart_KDVOran = nil then
    FfStokKart_KDVOran := FindField('STKKRT_KDVORAN');
  Result := FfStokKart_KDVOran;
end;

function TTableMRPListItems.GetfStokKart_MalAd: TField;
begin
  if FfStokKart_MalAd = nil then
    FfStokKart_MalAd := FindField('STKKRT_MALAD');
  Result := FfStokKart_MalAd;
end;

function TTableMRPListItems.GetfStokKart_TeminYontem: TField;
begin
  if FfStokKart_TeminYontem = nil then
    FfStokKart_TeminYontem := FindField('STKKRT_TEMINYONTEM');
  Result := FfStokKart_TeminYontem;
end;

function TTableMRPListItems.GetfTarih: TField;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih;
end;

function TTableMRPListItems.GetfTeslimTarih: TField;
begin
  if FfTeslimTarih = nil then
    FfTeslimTarih := FindField('TESLIMTARIH');
  Result := FfTeslimTarih;
end;

function TTableMRPListItems.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableMRPListItems.SetCariKart_BolgeKod(const Value: String);
begin
  if FfCariKart_BolgeKod = nil then
    FfCariKart_BolgeKod := FindField('CARKRT_BOLGEKOD');
  FfCariKart_BolgeKod.AsString := Value;
end;

procedure TTableMRPListItems.SetCariKart_FirmaTip(const Value: Integer);
begin
  if FfCariKart_FirmaTip = nil then
    FfCariKart_FirmaTip := FindField('CARKRT_FIRMATIP');
  FfCariKart_FirmaTip.AsInteger := Value;
end;

procedure TTableMRPListItems.SetCariKart_Opsiyon(const Value: Integer);
begin
  if FfCariKart_Opsiyon = nil then
    FfCariKart_Opsiyon := FindField('CARKRT_OPSIYON');
  FfCariKart_Opsiyon.AsInteger := Value;
end;

procedure TTableMRPListItems.SetCikisDepoKod(const Value: String);
begin
  if FfCikisDepoKod = nil then
    FfCikisDepoKod := FindField('CIKISDEPOKOD');
  FfCikisDepoKod.AsString := Value;
end;

procedure TTableMRPListItems.SetDepoKod(const Value: String);
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  FfDepoKod.AsString := Value;
end;

procedure TTableMRPListItems.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableMRPListItems.SetEvrakSiraNo(const Value: Integer);
begin
  if FfEvrakSiraNo = nil then
    FfEvrakSiraNo := FindField('EVRAKSIRANO');
  FfEvrakSiraNo.AsInteger := Value;
end;

procedure TTableMRPListItems.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableMRPListItems.SetEylemTip(const Value: Integer);
begin
  if FfEylemTip = nil then
    FfEylemTip := FindField('EYLEMTIP');
  FfEylemTip.AsInteger := Value;
end;

procedure TTableMRPListItems.SetFabrikaKod(const Value: String);
begin
  if FfFabrikaKod = nil then
    FfFabrikaKod := FindField('FABRIKAKOD');
  FfFabrikaKod.AsString := Value;
end;

procedure TTableMRPListItems.SetGirisCikis(const Value: Integer);
begin
  if FfGirisCikis = nil then
    FfGirisCikis := FindField('GIRISCIKIS');
  FfGirisCikis.AsInteger := Value;
end;

procedure TTableMRPListItems.SetHesapKod(const Value: String);
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  FfHesapKod.AsString := Value;
end;

procedure TTableMRPListItems.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMRPListItems.SetIslemTip(const Value: Integer);
begin
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  FfIslemTip.AsInteger := Value;
end;

procedure TTableMRPListItems.SetIstisnaKod(const Value: String);
begin
  if FfIstisnaKod = nil then
    FfIstisnaKod := FindField('ISTISNAKOD');
  FfIstisnaKod.AsString := Value;
end;

procedure TTableMRPListItems.SetKulStokMiktar(const Value: Double);
begin
  if FfKulStokMiktar = nil then
    FfKulStokMiktar := FindField('KULSTOKMIKTAR');
  FfKulStokMiktar.AsFloat := Value;
end;

procedure TTableMRPListItems.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableMRPListItems.SetMiktar(const Value: Double);
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  FfMiktar.AsFloat := Value;
end;

procedure TTableMRPListItems.SetMRPAlanKod(const Value: String);
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  FfMRPAlanKod.AsString := Value;
end;

procedure TTableMRPListItems.SetPlanTip(const Value: Integer);
begin
  if FfPlanTip = nil then
    FfPlanTip := FindField('PLANTIP');
  FfPlanTip.AsInteger := Value;
end;

procedure TTableMRPListItems.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMRPListItems.SetSevkTarih(const Value: TDate);
begin
  if FfSevkTarih = nil then
    FfSevkTarih := FindField('SEVKTARIH');
  FfSevkTarih.AsDateTime := Value;
end;

procedure TTableMRPListItems.SetSiparisTarih(const Value: TDate);
begin
  if FfSiparisTarih = nil then
    FfSiparisTarih := FindField('SIPARISTARIH');
  FfSiparisTarih.AsDateTime := Value;
end;

procedure TTableMRPListItems.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableMRPListItems.SetSiraTip(const Value: Integer);
begin
  if FfSiraTip = nil then
    FfSiraTip := FindField('SIRATIP');
  FfSiraTip.AsInteger := Value;
end;

procedure TTableMRPListItems.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableMRPListItems.SetStokKart_Birim(const Value: String);
begin
  if FfStokKart_Birim = nil then
    FfStokKart_Birim := FindField('STKKRT_BIRIM');
  FfStokKart_Birim.AsString := Value;
end;

procedure TTableMRPListItems.SetStokKart_KDVOran(const Value: Integer);
begin
  if FfStokKart_KDVOran = nil then
    FfStokKart_KDVOran := FindField('STKKRT_KDVORAN');
  FfStokKart_KDVOran.AsInteger := Value;
end;

procedure TTableMRPListItems.SetStokKart_MalAd(const Value: String);
begin
  if FfStokKart_MalAd = nil then
    FfStokKart_MalAd := FindField('STKKRT_MALAD');
  FfStokKart_MalAd.AsString := Value;
end;

procedure TTableMRPListItems.SetStokKart_TeminYontem(const Value: Integer);
begin
  if FfStokKart_TeminYontem = nil then
    FfStokKart_TeminYontem := FindField('STKKRT_TEMINYONTEM');
  FfStokKart_TeminYontem.AsInteger := Value;
end;

procedure TTableMRPListItems.SetTarih(const Value: TDate);
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  FfTarih.AsDateTime := Value;
end;

procedure TTableMRPListItems.SetTeslimTarih(const Value: TDate);
begin
  if FfTeslimTarih = nil then
    FfTeslimTarih := FindField('TESLIMTARIH');
  FfTeslimTarih.AsDateTime := Value;
end;

procedure TTableMRPListItems.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableMRPPlan }

constructor TTableMRPPlan.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRPPLN';
end;

procedure TTableMRPPlan.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  if FfEventType = nil then
    FfEventType := FindField('EVENTTYPE');
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  if FfEvrakSiraNo = nil then
    FfEvrakSiraNo := FindField('EVRAKSIRANO');
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfLabelColor = nil then
    FfLabelColor := FindField('LABELCOLOR');
  if FfLocation = nil then
    FfLocation := FindField('LOCATION');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  if FfMessage = nil then
    FfMessage := FindField('MESSAGE');
  if FfOptions = nil then
    FfOptions := FindField('OPTIONS');
  if FfParentID = nil then
    FfParentID := FindField('PARENTID');
  if FfRecurrenceIndex = nil then
    FfRecurrenceIndex := FindField('RECURRENCEINDEX');
  if FfRecurrenceInfo = nil then
    FfRecurrenceInfo := FindField('RECURRENCEINFO');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfState = nil then
    FfState := FindField('STATE');
  if FfTaskCompleteField = nil then
    FfTaskCompleteField := FindField('TASKCOMPLETEFIELD');
  if FfTaskIndexField = nil then
    FfTaskIndexField := FindField('TASKINDEXFIELD');
  if FfTaskLinksField = nil then
    FfTaskLinksField := FindField('TASKLINKSFIELD');
  if FfTaskStatusField = nil then
    FfTaskStatusField := FindField('TASKSTATUSFIELD');
  if FfTypex = nil then
    FfTypex := FindField('TYPE');
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  if FfUretimPlanNo = nil then
    FfUretimPlanNo := FindField('URETIMPLANNO');
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  if FfUretimTip = nil then
    FfUretimTip := FindField('URETIMTIP');
  inherited;
end;

procedure TTableMRPPlan.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfBasTarih := nil;
    FfBitTarih := nil;
    FfDegistirenKaynak := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
    FfEventType := nil;
    FfEvrakNo := nil;
    FfEvrakSiraNo := nil;
    FfEvrakTip := nil;
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfID := nil;
    FfIslemTip := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKaynakKod := nil;
    FfLabelColor := nil;
    FfLocation := nil;
    FfMamulKod := nil;
    FfMessage := nil;
    FfOptions := nil;
    FfParentID := nil;
    FfRecurrenceIndex := nil;
    FfRecurrenceInfo := nil;
    FfRowGuid := nil;
    FfSirketNo := nil;
    FfState := nil;
    FfTaskCompleteField := nil;
    FfTaskIndexField := nil;
    FfTaskLinksField := nil;
    FfTaskStatusField := nil;
    FfTypex := nil;
    FfUretimNo := nil;
    FfUretimPlanNo := nil;
    FfUretimSiraNo := nil;
    FfUretimTip := nil;
  end;
  inherited;
end;

function TTableMRPPlan.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableMRPPlan.GetBasTarih: TDate;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih.AsDateTime;
end;

function TTableMRPPlan.GetBitTarih: TDate;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih.AsDateTime;
end;

function TTableMRPPlan.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableMRPPlan.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableMRPPlan.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableMRPPlan.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableMRPPlan.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableMRPPlan.GetEventType: Integer;
begin
  if FfEventType = nil then
    FfEventType := FindField('EVENTTYPE');
  Result := FfEventType.AsInteger;
end;

function TTableMRPPlan.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableMRPPlan.GetEvrakSiraNo: Integer;
begin
  if FfEvrakSiraNo = nil then
    FfEvrakSiraNo := FindField('EVRAKSIRANO');
  Result := FfEvrakSiraNo.AsInteger;
end;

function TTableMRPPlan.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableMRPPlan.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableMRPPlan.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableMRPPlan.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableMRPPlan.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableMRPPlan.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableMRPPlan.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMRPPlan.GetIslemTip: Integer;
begin
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  Result := FfIslemTip.AsInteger;
end;

function TTableMRPPlan.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableMRPPlan.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableMRPPlan.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableMRPPlan.GetLabelColor: String;
begin
  if FfLabelColor = nil then
    FfLabelColor := FindField('LABELCOLOR');
  Result := FfLabelColor.AsString;
end;

function TTableMRPPlan.GetLocation: Integer;
begin
  if FfLocation = nil then
    FfLocation := FindField('LOCATION');
  Result := FfLocation.AsInteger;
end;

function TTableMRPPlan.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableMRPPlan.GetMessage: String;
begin
  if FfMessage = nil then
    FfMessage := FindField('MESSAGE');
  Result := FfMessage.AsString;
end;

function TTableMRPPlan.GetOptions: Integer;
begin
  if FfOptions = nil then
    FfOptions := FindField('OPTIONS');
  Result := FfOptions.AsInteger;
end;

function TTableMRPPlan.GetParentID: Integer;
begin
  if FfParentID = nil then
    FfParentID := FindField('PARENTID');
  Result := FfParentID.AsInteger;
end;

function TTableMRPPlan.GetRecurrenceIndex: Integer;
begin
  if FfRecurrenceIndex = nil then
    FfRecurrenceIndex := FindField('RECURRENCEINDEX');
  Result := FfRecurrenceIndex.AsInteger;
end;

function TTableMRPPlan.GetRecurrenceInfo: Integer;
begin
  if FfRecurrenceInfo = nil then
    FfRecurrenceInfo := FindField('RECURRENCEINFO');
  Result := FfRecurrenceInfo.AsInteger;
end;

function TTableMRPPlan.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMRPPlan.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMRPPlan.GetState: String;
begin
  if FfState = nil then
    FfState := FindField('STATE');
  Result := FfState.AsString;
end;

function TTableMRPPlan.GetTaskCompleteField: String;
begin
  if FfTaskCompleteField = nil then
    FfTaskCompleteField := FindField('TASKCOMPLETEFIELD');
  Result := FfTaskCompleteField.AsString;
end;

function TTableMRPPlan.GetTaskIndexField: String;
begin
  if FfTaskIndexField = nil then
    FfTaskIndexField := FindField('TASKINDEXFIELD');
  Result := FfTaskIndexField.AsString;
end;

function TTableMRPPlan.GetTaskLinksField: Integer;
begin
  if FfTaskLinksField = nil then
    FfTaskLinksField := FindField('TASKLINKSFIELD');
  Result := FfTaskLinksField.AsInteger;
end;

function TTableMRPPlan.GetTaskStatusField: String;
begin
  if FfTaskStatusField = nil then
    FfTaskStatusField := FindField('TASKSTATUSFIELD');
  Result := FfTaskStatusField.AsString;
end;

function TTableMRPPlan.GetTypex: String;
begin
  if FfTypex = nil then
    FfTypex := FindField('TYPE');
  Result := FfTypex.AsString;
end;

function TTableMRPPlan.GetUretimNo: String;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo.AsString;
end;

function TTableMRPPlan.GetUretimPlanNo: String;
begin
  if FfUretimPlanNo = nil then
    FfUretimPlanNo := FindField('URETIMPLANNO');
  Result := FfUretimPlanNo.AsString;
end;

function TTableMRPPlan.GetUretimSiraNo: Integer;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo.AsInteger;
end;

function TTableMRPPlan.GetUretimTip: Integer;
begin
  if FfUretimTip = nil then
    FfUretimTip := FindField('URETIMTIP');
  Result := FfUretimTip.AsInteger;
end;

function TTableMRPPlan.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableMRPPlan.GetfBasTarih: TField;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih;
end;

function TTableMRPPlan.GetfBitTarih: TField;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih;
end;

function TTableMRPPlan.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableMRPPlan.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableMRPPlan.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableMRPPlan.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableMRPPlan.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableMRPPlan.GetfEventType: TField;
begin
  if FfEventType = nil then
    FfEventType := FindField('EVENTTYPE');
  Result := FfEventType;
end;

function TTableMRPPlan.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableMRPPlan.GetfEvrakSiraNo: TField;
begin
  if FfEvrakSiraNo = nil then
    FfEvrakSiraNo := FindField('EVRAKSIRANO');
  Result := FfEvrakSiraNo;
end;

function TTableMRPPlan.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableMRPPlan.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableMRPPlan.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableMRPPlan.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableMRPPlan.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableMRPPlan.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableMRPPlan.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMRPPlan.GetfIslemTip: TField;
begin
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  Result := FfIslemTip;
end;

function TTableMRPPlan.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableMRPPlan.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableMRPPlan.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableMRPPlan.GetfLabelColor: TField;
begin
  if FfLabelColor = nil then
    FfLabelColor := FindField('LABELCOLOR');
  Result := FfLabelColor;
end;

function TTableMRPPlan.GetfLocation: TField;
begin
  if FfLocation = nil then
    FfLocation := FindField('LOCATION');
  Result := FfLocation;
end;

function TTableMRPPlan.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableMRPPlan.GetfMessage: TField;
begin
  if FfMessage = nil then
    FfMessage := FindField('MESSAGE');
  Result := FfMessage;
end;

function TTableMRPPlan.GetfOptions: TField;
begin
  if FfOptions = nil then
    FfOptions := FindField('OPTIONS');
  Result := FfOptions;
end;

function TTableMRPPlan.GetfParentID: TField;
begin
  if FfParentID = nil then
    FfParentID := FindField('PARENTID');
  Result := FfParentID;
end;

function TTableMRPPlan.GetfRecurrenceIndex: TField;
begin
  if FfRecurrenceIndex = nil then
    FfRecurrenceIndex := FindField('RECURRENCEINDEX');
  Result := FfRecurrenceIndex;
end;

function TTableMRPPlan.GetfRecurrenceInfo: TField;
begin
  if FfRecurrenceInfo = nil then
    FfRecurrenceInfo := FindField('RECURRENCEINFO');
  Result := FfRecurrenceInfo;
end;

function TTableMRPPlan.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMRPPlan.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableMRPPlan.GetfState: TField;
begin
  if FfState = nil then
    FfState := FindField('STATE');
  Result := FfState;
end;

function TTableMRPPlan.GetfTaskCompleteField: TField;
begin
  if FfTaskCompleteField = nil then
    FfTaskCompleteField := FindField('TASKCOMPLETEFIELD');
  Result := FfTaskCompleteField;
end;

function TTableMRPPlan.GetfTaskIndexField: TField;
begin
  if FfTaskIndexField = nil then
    FfTaskIndexField := FindField('TASKINDEXFIELD');
  Result := FfTaskIndexField;
end;

function TTableMRPPlan.GetfTaskLinksField: TField;
begin
  if FfTaskLinksField = nil then
    FfTaskLinksField := FindField('TASKLINKSFIELD');
  Result := FfTaskLinksField;
end;

function TTableMRPPlan.GetfTaskStatusField: TField;
begin
  if FfTaskStatusField = nil then
    FfTaskStatusField := FindField('TASKSTATUSFIELD');
  Result := FfTaskStatusField;
end;

function TTableMRPPlan.GetfTypex: TField;
begin
  if FfTypex = nil then
    FfTypex := FindField('TYPE');
  Result := FfTypex;
end;

function TTableMRPPlan.GetfUretimNo: TField;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo;
end;

function TTableMRPPlan.GetfUretimPlanNo: TField;
begin
  if FfUretimPlanNo = nil then
    FfUretimPlanNo := FindField('URETIMPLANNO');
  Result := FfUretimPlanNo;
end;

function TTableMRPPlan.GetfUretimSiraNo: TField;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo;
end;

function TTableMRPPlan.GetfUretimTip: TField;
begin
  if FfUretimTip = nil then
    FfUretimTip := FindField('URETIMTIP');
  Result := FfUretimTip;
end;

procedure TTableMRPPlan.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableMRPPlan.SetBasTarih(const Value: TDate);
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  FfBasTarih.AsDateTime := Value;
end;

procedure TTableMRPPlan.SetBitTarih(const Value: TDate);
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  FfBitTarih.AsDateTime := Value;
end;

procedure TTableMRPPlan.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableMRPPlan.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableMRPPlan.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableMRPPlan.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableMRPPlan.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableMRPPlan.SetEventType(const Value: Integer);
begin
  if FfEventType = nil then
    FfEventType := FindField('EVENTTYPE');
  FfEventType.AsInteger := Value;
end;

procedure TTableMRPPlan.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableMRPPlan.SetEvrakSiraNo(const Value: Integer);
begin
  if FfEvrakSiraNo = nil then
    FfEvrakSiraNo := FindField('EVRAKSIRANO');
  FfEvrakSiraNo.AsInteger := Value;
end;

procedure TTableMRPPlan.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableMRPPlan.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableMRPPlan.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableMRPPlan.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableMRPPlan.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableMRPPlan.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableMRPPlan.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMRPPlan.SetIslemTip(const Value: Integer);
begin
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  FfIslemTip.AsInteger := Value;
end;

procedure TTableMRPPlan.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableMRPPlan.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableMRPPlan.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableMRPPlan.SetLabelColor(const Value: String);
begin
  if FfLabelColor = nil then
    FfLabelColor := FindField('LABELCOLOR');
  FfLabelColor.AsString := Value;
end;

procedure TTableMRPPlan.SetLocation(const Value: Integer);
begin
  if FfLocation = nil then
    FfLocation := FindField('LOCATION');
  FfLocation.AsInteger := Value;
end;

procedure TTableMRPPlan.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableMRPPlan.SetMessage(const Value: String);
begin
  if FfMessage = nil then
    FfMessage := FindField('MESSAGE');
  FfMessage.AsString := Value;
end;

procedure TTableMRPPlan.SetOptions(const Value: Integer);
begin
  if FfOptions = nil then
    FfOptions := FindField('OPTIONS');
  FfOptions.AsInteger := Value;
end;

procedure TTableMRPPlan.SetParentID(const Value: Integer);
begin
  if FfParentID = nil then
    FfParentID := FindField('PARENTID');
  FfParentID.AsInteger := Value;
end;

procedure TTableMRPPlan.SetRecurrenceIndex(const Value: Integer);
begin
  if FfRecurrenceIndex = nil then
    FfRecurrenceIndex := FindField('RECURRENCEINDEX');
  FfRecurrenceIndex.AsInteger := Value;
end;

procedure TTableMRPPlan.SetRecurrenceInfo(const Value: Integer);
begin
  if FfRecurrenceInfo = nil then
    FfRecurrenceInfo := FindField('RECURRENCEINFO');
  FfRecurrenceInfo.AsInteger := Value;
end;

procedure TTableMRPPlan.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMRPPlan.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableMRPPlan.SetState(const Value: String);
begin
  if FfState = nil then
    FfState := FindField('STATE');
  FfState.AsString := Value;
end;

procedure TTableMRPPlan.SetTaskCompleteField(const Value: String);
begin
  if FfTaskCompleteField = nil then
    FfTaskCompleteField := FindField('TASKCOMPLETEFIELD');
  FfTaskCompleteField.AsString := Value;
end;

procedure TTableMRPPlan.SetTaskIndexField(const Value: String);
begin
  if FfTaskIndexField = nil then
    FfTaskIndexField := FindField('TASKINDEXFIELD');
  FfTaskIndexField.AsString := Value;
end;

procedure TTableMRPPlan.SetTaskLinksField(const Value: Integer);
begin
  if FfTaskLinksField = nil then
    FfTaskLinksField := FindField('TASKLINKSFIELD');
  FfTaskLinksField.AsInteger := Value;
end;

procedure TTableMRPPlan.SetTaskStatusField(const Value: String);
begin
  if FfTaskStatusField = nil then
    FfTaskStatusField := FindField('TASKSTATUSFIELD');
  FfTaskStatusField.AsString := Value;
end;

procedure TTableMRPPlan.SetTypex(const Value: String);
begin
  if FfTypex = nil then
    FfTypex := FindField('TYPE');
  FfTypex.AsString := Value;
end;

procedure TTableMRPPlan.SetUretimNo(const Value: String);
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  FfUretimNo.AsString := Value;
end;

procedure TTableMRPPlan.SetUretimPlanNo(const Value: String);
begin
  if FfUretimPlanNo = nil then
    FfUretimPlanNo := FindField('URETIMPLANNO');
  FfUretimPlanNo.AsString := Value;
end;

procedure TTableMRPPlan.SetUretimSiraNo(const Value: Integer);
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  FfUretimSiraNo.AsInteger := Value;
end;

procedure TTableMRPPlan.SetUretimTip(const Value: Integer);
begin
  if FfUretimTip = nil then
    FfUretimTip := FindField('URETIMTIP');
  FfUretimTip.AsInteger := Value;
end;

{ TTableMRPParametre }

constructor TTableMRPParametre.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRPPRM';
end;

procedure TTableMRPParametre.DoAfterOpen;
begin
  if FfAltSeviyeKodHesapDurum = nil then
    FfAltSeviyeKodHesapDurum := FindField('ALTSEVIYEKODHESAPDURUM');
  if FfAltSeviyeKodHesapTip = nil then
    FfAltSeviyeKodHesapTip := FindField('ALTSEVIYEKODHESAPTIP');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKullanimGrupNo = nil then
    FfKullanimGrupNo := FindField('KULLANIMGRUPNO');
  if FfMRPAlanMRPTip = nil then
    FfMRPAlanMRPTip := FindField('MRPALANMRPTIP');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfVersiyonMRPTip = nil then
    FfVersiyonMRPTip := FindField('VERSIYONMRPTIP');
  inherited;
end;

procedure TTableMRPParametre.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAltSeviyeKodHesapDurum := nil;
    FfAltSeviyeKodHesapTip := nil;
    FfID := nil;
    FfKullanimGrupNo := nil;
    FfMRPAlanMRPTip := nil;
    FfRowGuid := nil;
    FfSirketNo := nil;
    FfVersiyonMRPTip := nil;
  end;
  inherited;
end;

function TTableMRPParametre.GetAltSeviyeKodHesapDurum: Integer;
begin
  if FfAltSeviyeKodHesapDurum = nil then
    FfAltSeviyeKodHesapDurum := FindField('ALTSEVIYEKODHESAPDURUM');
  Result := FfAltSeviyeKodHesapDurum.AsInteger;
end;

function TTableMRPParametre.GetAltSeviyeKodHesapTip: Integer;
begin
  if FfAltSeviyeKodHesapTip = nil then
    FfAltSeviyeKodHesapTip := FindField('ALTSEVIYEKODHESAPTIP');
  Result := FfAltSeviyeKodHesapTip.AsInteger;
end;

function TTableMRPParametre.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMRPParametre.GetKullanimGrupNo: Integer;
begin
  if FfKullanimGrupNo = nil then
    FfKullanimGrupNo := FindField('KULLANIMGRUPNO');
  Result := FfKullanimGrupNo.AsInteger;
end;

function TTableMRPParametre.GetMRPAlanMRPTip: Integer;
begin
  if FfMRPAlanMRPTip = nil then
    FfMRPAlanMRPTip := FindField('MRPALANMRPTIP');
  Result := FfMRPAlanMRPTip.AsInteger;
end;

function TTableMRPParametre.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMRPParametre.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMRPParametre.GetVersiyonMRPTip: Integer;
begin
  if FfVersiyonMRPTip = nil then
    FfVersiyonMRPTip := FindField('VERSIYONMRPTIP');
  Result := FfVersiyonMRPTip.AsInteger;
end;

function TTableMRPParametre.GetfAltSeviyeKodHesapDurum: TField;
begin
  if FfAltSeviyeKodHesapDurum = nil then
    FfAltSeviyeKodHesapDurum := FindField('ALTSEVIYEKODHESAPDURUM');
  Result := FfAltSeviyeKodHesapDurum;
end;

function TTableMRPParametre.GetfAltSeviyeKodHesapTip: TField;
begin
  if FfAltSeviyeKodHesapTip = nil then
    FfAltSeviyeKodHesapTip := FindField('ALTSEVIYEKODHESAPTIP');
  Result := FfAltSeviyeKodHesapTip;
end;

function TTableMRPParametre.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMRPParametre.GetfKullanimGrupNo: TField;
begin
  if FfKullanimGrupNo = nil then
    FfKullanimGrupNo := FindField('KULLANIMGRUPNO');
  Result := FfKullanimGrupNo;
end;

function TTableMRPParametre.GetfMRPAlanMRPTip: TField;
begin
  if FfMRPAlanMRPTip = nil then
    FfMRPAlanMRPTip := FindField('MRPALANMRPTIP');
  Result := FfMRPAlanMRPTip;
end;

function TTableMRPParametre.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMRPParametre.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableMRPParametre.GetfVersiyonMRPTip: TField;
begin
  if FfVersiyonMRPTip = nil then
    FfVersiyonMRPTip := FindField('VERSIYONMRPTIP');
  Result := FfVersiyonMRPTip;
end;

procedure TTableMRPParametre.SetAltSeviyeKodHesapDurum(const Value: Integer);
begin
  if FfAltSeviyeKodHesapDurum = nil then
    FfAltSeviyeKodHesapDurum := FindField('ALTSEVIYEKODHESAPDURUM');
  FfAltSeviyeKodHesapDurum.AsInteger := Value;
end;

procedure TTableMRPParametre.SetAltSeviyeKodHesapTip(const Value: Integer);
begin
  if FfAltSeviyeKodHesapTip = nil then
    FfAltSeviyeKodHesapTip := FindField('ALTSEVIYEKODHESAPTIP');
  FfAltSeviyeKodHesapTip.AsInteger := Value;
end;

procedure TTableMRPParametre.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMRPParametre.SetKullanimGrupNo(const Value: Integer);
begin
  if FfKullanimGrupNo = nil then
    FfKullanimGrupNo := FindField('KULLANIMGRUPNO');
  FfKullanimGrupNo.AsInteger := Value;
end;

procedure TTableMRPParametre.SetMRPAlanMRPTip(const Value: Integer);
begin
  if FfMRPAlanMRPTip = nil then
    FfMRPAlanMRPTip := FindField('MRPALANMRPTIP');
  FfMRPAlanMRPTip.AsInteger := Value;
end;

procedure TTableMRPParametre.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMRPParametre.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableMRPParametre.SetVersiyonMRPTip(const Value: Integer);
begin
  if FfVersiyonMRPTip = nil then
    FfVersiyonMRPTip := FindField('VERSIYONMRPTIP');
  FfVersiyonMRPTip.AsInteger := Value;
end;

{ TTableStokKarsilamaPolitika }

constructor TTableStokKarsilamaPolitika.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRPSKP';
end;

procedure TTableStokKarsilamaPolitika.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfDonemAdet = nil then
    FfDonemAdet := FindField('DONEMADET');
  if FfDonemGunAdet = nil then
    FfDonemGunAdet := FindField('DONEMGUNADET');
  if FfDonemGunTip = nil then
    FfDonemGunTip := FindField('DONEMGUNTIP');
  if FfDonemTip = nil then
    FfDonemTip := FindField('DONEMTIP');
  if FfHedefStokSure = nil then
    FfHedefStokSure := FindField('HEDEFSTOKSURE');
  if FfID = nil then
    FfID := FindField('ID');
  if FfMaxStokSure = nil then
    FfMaxStokSure := FindField('MAXSTOKSURE');
  if FfMinStokSure = nil then
    FfMinStokSure := FindField('MINSTOKSURE');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfStokKarsilamaKod = nil then
    FfStokKarsilamaKod := FindField('STOKKARSILAMAKOD');
  inherited;
end;

procedure TTableStokKarsilamaPolitika.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfDonemAdet := nil;
    FfDonemGunAdet := nil;
    FfDonemGunTip := nil;
    FfDonemTip := nil;
    FfHedefStokSure := nil;
    FfID := nil;
    FfMaxStokSure := nil;
    FfMinStokSure := nil;
    FfRowGuid := nil;
    FfStokKarsilamaKod := nil;
  end;
  inherited;
end;

function TTableStokKarsilamaPolitika.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableStokKarsilamaPolitika.GetDonemAdet: Integer;
begin
  if FfDonemAdet = nil then
    FfDonemAdet := FindField('DONEMADET');
  Result := FfDonemAdet.AsInteger;
end;

function TTableStokKarsilamaPolitika.GetDonemGunAdet: Integer;
begin
  if FfDonemGunAdet = nil then
    FfDonemGunAdet := FindField('DONEMGUNADET');
  Result := FfDonemGunAdet.AsInteger;
end;

function TTableStokKarsilamaPolitika.GetDonemGunTip: Integer;
begin
  if FfDonemGunTip = nil then
    FfDonemGunTip := FindField('DONEMGUNTIP');
  Result := FfDonemGunTip.AsInteger;
end;

function TTableStokKarsilamaPolitika.GetDonemTip: Integer;
begin
  if FfDonemTip = nil then
    FfDonemTip := FindField('DONEMTIP');
  Result := FfDonemTip.AsInteger;
end;

function TTableStokKarsilamaPolitika.GetHedefStokSure: Integer;
begin
  if FfHedefStokSure = nil then
    FfHedefStokSure := FindField('HEDEFSTOKSURE');
  Result := FfHedefStokSure.AsInteger;
end;

function TTableStokKarsilamaPolitika.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableStokKarsilamaPolitika.GetMaxStokSure: Integer;
begin
  if FfMaxStokSure = nil then
    FfMaxStokSure := FindField('MAXSTOKSURE');
  Result := FfMaxStokSure.AsInteger;
end;

function TTableStokKarsilamaPolitika.GetMinStokSure: Integer;
begin
  if FfMinStokSure = nil then
    FfMinStokSure := FindField('MINSTOKSURE');
  Result := FfMinStokSure.AsInteger;
end;

function TTableStokKarsilamaPolitika.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableStokKarsilamaPolitika.GetStokKarsilamaKod: String;
begin
  if FfStokKarsilamaKod = nil then
    FfStokKarsilamaKod := FindField('STOKKARSILAMAKOD');
  Result := FfStokKarsilamaKod.AsString;
end;

function TTableStokKarsilamaPolitika.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableStokKarsilamaPolitika.GetfDonemAdet: TField;
begin
  if FfDonemAdet = nil then
    FfDonemAdet := FindField('DONEMADET');
  Result := FfDonemAdet;
end;

function TTableStokKarsilamaPolitika.GetfDonemGunAdet: TField;
begin
  if FfDonemGunAdet = nil then
    FfDonemGunAdet := FindField('DONEMGUNADET');
  Result := FfDonemGunAdet;
end;

function TTableStokKarsilamaPolitika.GetfDonemGunTip: TField;
begin
  if FfDonemGunTip = nil then
    FfDonemGunTip := FindField('DONEMGUNTIP');
  Result := FfDonemGunTip;
end;

function TTableStokKarsilamaPolitika.GetfDonemTip: TField;
begin
  if FfDonemTip = nil then
    FfDonemTip := FindField('DONEMTIP');
  Result := FfDonemTip;
end;

function TTableStokKarsilamaPolitika.GetfHedefStokSure: TField;
begin
  if FfHedefStokSure = nil then
    FfHedefStokSure := FindField('HEDEFSTOKSURE');
  Result := FfHedefStokSure;
end;

function TTableStokKarsilamaPolitika.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableStokKarsilamaPolitika.GetfMaxStokSure: TField;
begin
  if FfMaxStokSure = nil then
    FfMaxStokSure := FindField('MAXSTOKSURE');
  Result := FfMaxStokSure;
end;

function TTableStokKarsilamaPolitika.GetfMinStokSure: TField;
begin
  if FfMinStokSure = nil then
    FfMinStokSure := FindField('MINSTOKSURE');
  Result := FfMinStokSure;
end;

function TTableStokKarsilamaPolitika.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableStokKarsilamaPolitika.GetfStokKarsilamaKod: TField;
begin
  if FfStokKarsilamaKod = nil then
    FfStokKarsilamaKod := FindField('STOKKARSILAMAKOD');
  Result := FfStokKarsilamaKod;
end;

procedure TTableStokKarsilamaPolitika.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableStokKarsilamaPolitika.SetDonemAdet(const Value: Integer);
begin
  if FfDonemAdet = nil then
    FfDonemAdet := FindField('DONEMADET');
  FfDonemAdet.AsInteger := Value;
end;

procedure TTableStokKarsilamaPolitika.SetDonemGunAdet(const Value: Integer);
begin
  if FfDonemGunAdet = nil then
    FfDonemGunAdet := FindField('DONEMGUNADET');
  FfDonemGunAdet.AsInteger := Value;
end;

procedure TTableStokKarsilamaPolitika.SetDonemGunTip(const Value: Integer);
begin
  if FfDonemGunTip = nil then
    FfDonemGunTip := FindField('DONEMGUNTIP');
  FfDonemGunTip.AsInteger := Value;
end;

procedure TTableStokKarsilamaPolitika.SetDonemTip(const Value: Integer);
begin
  if FfDonemTip = nil then
    FfDonemTip := FindField('DONEMTIP');
  FfDonemTip.AsInteger := Value;
end;

procedure TTableStokKarsilamaPolitika.SetHedefStokSure(const Value: Integer);
begin
  if FfHedefStokSure = nil then
    FfHedefStokSure := FindField('HEDEFSTOKSURE');
  FfHedefStokSure.AsInteger := Value;
end;

procedure TTableStokKarsilamaPolitika.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableStokKarsilamaPolitika.SetMaxStokSure(const Value: Integer);
begin
  if FfMaxStokSure = nil then
    FfMaxStokSure := FindField('MAXSTOKSURE');
  FfMaxStokSure.AsInteger := Value;
end;

procedure TTableStokKarsilamaPolitika.SetMinStokSure(const Value: Integer);
begin
  if FfMinStokSure = nil then
    FfMinStokSure := FindField('MINSTOKSURE');
  FfMinStokSure.AsInteger := Value;
end;

procedure TTableStokKarsilamaPolitika.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableStokKarsilamaPolitika.SetStokKarsilamaKod(const Value: String);
begin
  if FfStokKarsilamaKod = nil then
    FfStokKarsilamaKod := FindField('STOKKARSILAMAKOD');
  FfStokKarsilamaKod.AsString := Value;
end;

{ TTableMRPStok }

constructor TTableMRPStok.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MRPSTH';
end;

procedure TTableMRPStok.DoAfterOpen;
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIlkIhtiyacTarih = nil then
    FfIlkIhtiyacTarih := FindField('ILKIHTIYACTARIH');
  if FfKalan = nil then
    FfKalan := FindField('KALAN');
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  if FfKaynakMalKod = nil then
    FfKaynakMalKod := FindField('KAYNAKMALKOD');
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  if FfKaynakVersiyonNo = nil then
    FfKaynakVersiyonNo := FindField('KAYNAKVERSIYONNO');
  if FfKullanilan = nil then
    FfKullanilan := FindField('KULLANILAN');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSonIhtiyacTarih = nil then
    FfSonIhtiyacTarih := FindField('SONIHTIYACTARIH');
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  if FfTip = nil then
    FfTip := FindField('TIP');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableMRPStok.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfBirim := nil;
    FfDepoKod := nil;
    FfID := nil;
    FfIlkIhtiyacTarih := nil;
    FfKalan := nil;
    FfKaynakEvrakNo := nil;
    FfKaynakEvrakTip := nil;
    FfKaynakHesapKod := nil;
    FfKaynakMalKod := nil;
    FfKaynakSiraNo := nil;
    FfKaynakVersiyonNo := nil;
    FfKullanilan := nil;
    FfMalKod := nil;
    FfMiktar := nil;
    FfMRPAlanKod := nil;
    FfPlanNo := nil;
    FfRowGuid := nil;
    FfSiraNo := nil;
    FfSonIhtiyacTarih := nil;
    FfTarih := nil;
    FfTip := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableMRPStok.GetBirim: String;
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  Result := FfBirim.AsString;
end;

function TTableMRPStok.GetDepoKod: String;
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  Result := FfDepoKod.AsString;
end;

function TTableMRPStok.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMRPStok.GetIlkIhtiyacTarih: TDate;
begin
  if FfIlkIhtiyacTarih = nil then
    FfIlkIhtiyacTarih := FindField('ILKIHTIYACTARIH');
  Result := FfIlkIhtiyacTarih.AsDateTime;
end;

function TTableMRPStok.GetKalan: Double;
begin
  if FfKalan = nil then
    FfKalan := FindField('KALAN');
  Result := FfKalan.AsFloat;
end;

function TTableMRPStok.GetKaynakEvrakNo: String;
begin
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  Result := FfKaynakEvrakNo.AsString;
end;

function TTableMRPStok.GetKaynakEvrakTip: Integer;
begin
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  Result := FfKaynakEvrakTip.AsInteger;
end;

function TTableMRPStok.GetKaynakHesapKod: String;
begin
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  Result := FfKaynakHesapKod.AsString;
end;

function TTableMRPStok.GetKaynakMalKod: String;
begin
  if FfKaynakMalKod = nil then
    FfKaynakMalKod := FindField('KAYNAKMALKOD');
  Result := FfKaynakMalKod.AsString;
end;

function TTableMRPStok.GetKaynakSiraNo: Integer;
begin
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  Result := FfKaynakSiraNo.AsInteger;
end;

function TTableMRPStok.GetKaynakVersiyonNo: String;
begin
  if FfKaynakVersiyonNo = nil then
    FfKaynakVersiyonNo := FindField('KAYNAKVERSIYONNO');
  Result := FfKaynakVersiyonNo.AsString;
end;

function TTableMRPStok.GetKullanilan: Double;
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('KULLANILAN');
  Result := FfKullanilan.AsFloat;
end;

function TTableMRPStok.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableMRPStok.GetMiktar: Double;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar.AsFloat;
end;

function TTableMRPStok.GetMRPAlanKod: String;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod.AsString;
end;

function TTableMRPStok.GetPlanNo: String;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo.AsString;
end;

function TTableMRPStok.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMRPStok.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableMRPStok.GetSonIhtiyacTarih: TDate;
begin
  if FfSonIhtiyacTarih = nil then
    FfSonIhtiyacTarih := FindField('SONIHTIYACTARIH');
  Result := FfSonIhtiyacTarih.AsDateTime;
end;

function TTableMRPStok.GetTarih: TDate;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih.AsDateTime;
end;

function TTableMRPStok.GetTip: Integer;
begin
  if FfTip = nil then
    FfTip := FindField('TIP');
  Result := FfTip.AsInteger;
end;

function TTableMRPStok.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableMRPStok.GetfBirim: TField;
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  Result := FfBirim;
end;

function TTableMRPStok.GetfDepoKod: TField;
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  Result := FfDepoKod;
end;

function TTableMRPStok.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMRPStok.GetfIlkIhtiyacTarih: TField;
begin
  if FfIlkIhtiyacTarih = nil then
    FfIlkIhtiyacTarih := FindField('ILKIHTIYACTARIH');
  Result := FfIlkIhtiyacTarih;
end;

function TTableMRPStok.GetfKalan: TField;
begin
  if FfKalan = nil then
    FfKalan := FindField('KALAN');
  Result := FfKalan;
end;

function TTableMRPStok.GetfKaynakEvrakNo: TField;
begin
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  Result := FfKaynakEvrakNo;
end;

function TTableMRPStok.GetfKaynakEvrakTip: TField;
begin
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  Result := FfKaynakEvrakTip;
end;

function TTableMRPStok.GetfKaynakHesapKod: TField;
begin
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  Result := FfKaynakHesapKod;
end;

function TTableMRPStok.GetfKaynakMalKod: TField;
begin
  if FfKaynakMalKod = nil then
    FfKaynakMalKod := FindField('KAYNAKMALKOD');
  Result := FfKaynakMalKod;
end;

function TTableMRPStok.GetfKaynakSiraNo: TField;
begin
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  Result := FfKaynakSiraNo;
end;

function TTableMRPStok.GetfKaynakVersiyonNo: TField;
begin
  if FfKaynakVersiyonNo = nil then
    FfKaynakVersiyonNo := FindField('KAYNAKVERSIYONNO');
  Result := FfKaynakVersiyonNo;
end;

function TTableMRPStok.GetfKullanilan: TField;
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('KULLANILAN');
  Result := FfKullanilan;
end;

function TTableMRPStok.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableMRPStok.GetfMiktar: TField;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar;
end;

function TTableMRPStok.GetfMRPAlanKod: TField;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod;
end;

function TTableMRPStok.GetfPlanNo: TField;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo;
end;

function TTableMRPStok.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMRPStok.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableMRPStok.GetfSonIhtiyacTarih: TField;
begin
  if FfSonIhtiyacTarih = nil then
    FfSonIhtiyacTarih := FindField('SONIHTIYACTARIH');
  Result := FfSonIhtiyacTarih;
end;

function TTableMRPStok.GetfTarih: TField;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih;
end;

function TTableMRPStok.GetfTip: TField;
begin
  if FfTip = nil then
    FfTip := FindField('TIP');
  Result := FfTip;
end;

function TTableMRPStok.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableMRPStok.SetBirim(const Value: String);
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  FfBirim.AsString := Value;
end;

procedure TTableMRPStok.SetDepoKod(const Value: String);
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  FfDepoKod.AsString := Value;
end;

procedure TTableMRPStok.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMRPStok.SetIlkIhtiyacTarih(const Value: TDate);
begin
  if FfIlkIhtiyacTarih = nil then
    FfIlkIhtiyacTarih := FindField('ILKIHTIYACTARIH');
  FfIlkIhtiyacTarih.AsDateTime := Value;
end;

procedure TTableMRPStok.SetKalan(const Value: Double);
begin
  if FfKalan = nil then
    FfKalan := FindField('KALAN');
  FfKalan.AsFloat := Value;
end;

procedure TTableMRPStok.SetKaynakEvrakNo(const Value: String);
begin
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  FfKaynakEvrakNo.AsString := Value;
end;

procedure TTableMRPStok.SetKaynakEvrakTip(const Value: Integer);
begin
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  FfKaynakEvrakTip.AsInteger := Value;
end;

procedure TTableMRPStok.SetKaynakHesapKod(const Value: String);
begin
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  FfKaynakHesapKod.AsString := Value;
end;

procedure TTableMRPStok.SetKaynakMalKod(const Value: String);
begin
  if FfKaynakMalKod = nil then
    FfKaynakMalKod := FindField('KAYNAKMALKOD');
  FfKaynakMalKod.AsString := Value;
end;

procedure TTableMRPStok.SetKaynakSiraNo(const Value: Integer);
begin
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  FfKaynakSiraNo.AsInteger := Value;
end;

procedure TTableMRPStok.SetKaynakVersiyonNo(const Value: String);
begin
  if FfKaynakVersiyonNo = nil then
    FfKaynakVersiyonNo := FindField('KAYNAKVERSIYONNO');
  FfKaynakVersiyonNo.AsString := Value;
end;

procedure TTableMRPStok.SetKullanilan(const Value: Double);
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('KULLANILAN');
  FfKullanilan.AsFloat := Value;
end;

procedure TTableMRPStok.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableMRPStok.SetMiktar(const Value: Double);
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  FfMiktar.AsFloat := Value;
end;

procedure TTableMRPStok.SetMRPAlanKod(const Value: String);
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  FfMRPAlanKod.AsString := Value;
end;

procedure TTableMRPStok.SetPlanNo(const Value: String);
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  FfPlanNo.AsString := Value;
end;

procedure TTableMRPStok.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMRPStok.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableMRPStok.SetSonIhtiyacTarih(const Value: TDate);
begin
  if FfSonIhtiyacTarih = nil then
    FfSonIhtiyacTarih := FindField('SONIHTIYACTARIH');
  FfSonIhtiyacTarih.AsDateTime := Value;
end;

procedure TTableMRPStok.SetTarih(const Value: TDate);
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  FfTarih.AsDateTime := Value;
end;

procedure TTableMRPStok.SetTip(const Value: Integer);
begin
  if FfTip = nil then
    FfTip := FindField('TIP');
  FfTip.AsInteger := Value;
end;

procedure TTableMRPStok.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableUretimPlanlamaKaynakTakvim }

constructor TTableUretimPlanlamaKaynakTakvim.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTPKT';
end;

procedure TTableUretimPlanlamaKaynakTakvim.DoAfterOpen;
begin
  if FfFazlaMesai = nil then
    FfFazlaMesai := FindField('FAZLAMESAI');
  if FfFazlaMesaiVardiyaKod = nil then
    FfFazlaMesaiVardiyaKod := FindField('FAZLAMESAIVARDIYAKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  inherited;
end;

procedure TTableUretimPlanlamaKaynakTakvim.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfFazlaMesai := nil;
    FfFazlaMesaiVardiyaKod := nil;
    FfID := nil;
    FfKaynakKod := nil;
    FfPlanNo := nil;
    FfTakvimKod := nil;
  end;
  inherited;
end;

function TTableUretimPlanlamaKaynakTakvim.GetFazlaMesai: Double;
begin
  if FfFazlaMesai = nil then
    FfFazlaMesai := FindField('FAZLAMESAI');
  Result := FfFazlaMesai.AsFloat;
end;

function TTableUretimPlanlamaKaynakTakvim.GetFazlaMesaiVardiyaKod: String;
begin
  if FfFazlaMesaiVardiyaKod = nil then
    FfFazlaMesaiVardiyaKod := FindField('FAZLAMESAIVARDIYAKOD');
  Result := FfFazlaMesaiVardiyaKod.AsString;
end;

function TTableUretimPlanlamaKaynakTakvim.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimPlanlamaKaynakTakvim.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimPlanlamaKaynakTakvim.GetPlanNo: String;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo.AsString;
end;

function TTableUretimPlanlamaKaynakTakvim.GetTakvimKod: String;
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  Result := FfTakvimKod.AsString;
end;

function TTableUretimPlanlamaKaynakTakvim.GetfFazlaMesai: TField;
begin
  if FfFazlaMesai = nil then
    FfFazlaMesai := FindField('FAZLAMESAI');
  Result := FfFazlaMesai;
end;

function TTableUretimPlanlamaKaynakTakvim.GetfFazlaMesaiVardiyaKod: TField;
begin
  if FfFazlaMesaiVardiyaKod = nil then
    FfFazlaMesaiVardiyaKod := FindField('FAZLAMESAIVARDIYAKOD');
  Result := FfFazlaMesaiVardiyaKod;
end;

function TTableUretimPlanlamaKaynakTakvim.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimPlanlamaKaynakTakvim.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimPlanlamaKaynakTakvim.GetfPlanNo: TField;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo;
end;

function TTableUretimPlanlamaKaynakTakvim.GetfTakvimKod: TField;
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  Result := FfTakvimKod;
end;

procedure TTableUretimPlanlamaKaynakTakvim.SetFazlaMesai(const Value: Double);
begin
  if FfFazlaMesai = nil then
    FfFazlaMesai := FindField('FAZLAMESAI');
  FfFazlaMesai.AsFloat := Value;
end;

procedure TTableUretimPlanlamaKaynakTakvim.SetFazlaMesaiVardiyaKod(const Value: String);
begin
  if FfFazlaMesaiVardiyaKod = nil then
    FfFazlaMesaiVardiyaKod := FindField('FAZLAMESAIVARDIYAKOD');
  FfFazlaMesaiVardiyaKod.AsString := Value;
end;

procedure TTableUretimPlanlamaKaynakTakvim.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimPlanlamaKaynakTakvim.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimPlanlamaKaynakTakvim.SetPlanNo(const Value: String);
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  FfPlanNo.AsString := Value;
end;

procedure TTableUretimPlanlamaKaynakTakvim.SetTakvimKod(const Value: String);
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  FfTakvimKod.AsString := Value;
end;

{ TTableUretimPlanlamaBaslik }

constructor TTableUretimPlanlamaBaslik.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTPLB';
end;

procedure TTableUretimPlanlamaBaslik.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  if FfFazlaMesai = nil then
    FfFazlaMesai := FindField('FAZLAMESAI');
  if FfFazlaMesaiVardiyaKod = nil then
    FfFazlaMesaiVardiyaKod := FindField('FAZLAMESAIVARDIYAKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  inherited;
end;

procedure TTableUretimPlanlamaBaslik.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfBasTarih := nil;
    FfBitTarih := nil;
    FfFazlaMesai := nil;
    FfFazlaMesaiVardiyaKod := nil;
    FfID := nil;
    FfPlanNo := nil;
    FfTakvimKod := nil;
  end;
  inherited;
end;

function TTableUretimPlanlamaBaslik.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableUretimPlanlamaBaslik.GetBasTarih: TDate;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih.AsDateTime;
end;

function TTableUretimPlanlamaBaslik.GetBitTarih: TDate;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih.AsDateTime;
end;

function TTableUretimPlanlamaBaslik.GetFazlaMesai: Double;
begin
  if FfFazlaMesai = nil then
    FfFazlaMesai := FindField('FAZLAMESAI');
  Result := FfFazlaMesai.AsFloat;
end;

function TTableUretimPlanlamaBaslik.GetFazlaMesaiVardiyaKod: String;
begin
  if FfFazlaMesaiVardiyaKod = nil then
    FfFazlaMesaiVardiyaKod := FindField('FAZLAMESAIVARDIYAKOD');
  Result := FfFazlaMesaiVardiyaKod.AsString;
end;

function TTableUretimPlanlamaBaslik.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimPlanlamaBaslik.GetPlanNo: String;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo.AsString;
end;

function TTableUretimPlanlamaBaslik.GetTakvimKod: String;
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  Result := FfTakvimKod.AsString;
end;

function TTableUretimPlanlamaBaslik.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableUretimPlanlamaBaslik.GetfBasTarih: TField;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih;
end;

function TTableUretimPlanlamaBaslik.GetfBitTarih: TField;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih;
end;

function TTableUretimPlanlamaBaslik.GetfFazlaMesai: TField;
begin
  if FfFazlaMesai = nil then
    FfFazlaMesai := FindField('FAZLAMESAI');
  Result := FfFazlaMesai;
end;

function TTableUretimPlanlamaBaslik.GetfFazlaMesaiVardiyaKod: TField;
begin
  if FfFazlaMesaiVardiyaKod = nil then
    FfFazlaMesaiVardiyaKod := FindField('FAZLAMESAIVARDIYAKOD');
  Result := FfFazlaMesaiVardiyaKod;
end;

function TTableUretimPlanlamaBaslik.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimPlanlamaBaslik.GetfPlanNo: TField;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo;
end;

function TTableUretimPlanlamaBaslik.GetfTakvimKod: TField;
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  Result := FfTakvimKod;
end;

procedure TTableUretimPlanlamaBaslik.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableUretimPlanlamaBaslik.SetBasTarih(const Value: TDate);
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  FfBasTarih.AsDateTime := Value;
end;

procedure TTableUretimPlanlamaBaslik.SetBitTarih(const Value: TDate);
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  FfBitTarih.AsDateTime := Value;
end;

procedure TTableUretimPlanlamaBaslik.SetFazlaMesai(const Value: Double);
begin
  if FfFazlaMesai = nil then
    FfFazlaMesai := FindField('FAZLAMESAI');
  FfFazlaMesai.AsFloat := Value;
end;

procedure TTableUretimPlanlamaBaslik.SetFazlaMesaiVardiyaKod(const Value: String);
begin
  if FfFazlaMesaiVardiyaKod = nil then
    FfFazlaMesaiVardiyaKod := FindField('FAZLAMESAIVARDIYAKOD');
  FfFazlaMesaiVardiyaKod.AsString := Value;
end;

procedure TTableUretimPlanlamaBaslik.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimPlanlamaBaslik.SetPlanNo(const Value: String);
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  FfPlanNo.AsString := Value;
end;

procedure TTableUretimPlanlamaBaslik.SetTakvimKod(const Value: String);
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  FfTakvimKod.AsString := Value;
end;

{ TTableUretimPlanlamaDetay }

constructor TTableUretimPlanlamaDetay.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTPLD';
end;

procedure TTableUretimPlanlamaDetay.DoAfterOpen;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  if FfPlanBasTarih = nil then
    FfPlanBasTarih := FindField('PLANBASTARIH');
  if FfPlanBitTarih = nil then
    FfPlanBitTarih := FindField('PLANBITTARIH');
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  if FfPlanSiraNo = nil then
    FfPlanSiraNo := FindField('PLANSIRANO');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  if FfToplamSure = nil then
    FfToplamSure := FindField('TOPLAMSURE');
  inherited;
end;

procedure TTableUretimPlanlamaDetay.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfBasTarih := nil;
    FfBasTarihSaat := nil;
    FfBitTarih := nil;
    FfBitTarihSaat := nil;
    FfCalismaSure := nil;
    FfID := nil;
    FfIsMerkezKod := nil;
    FfKaynakKod := nil;
    FfKurulumSure := nil;
    FfMalKod := nil;
    FfMiktar := nil;
    FfPlanBasTarih := nil;
    FfPlanBitTarih := nil;
    FfPlanNo := nil;
    FfPlanSiraNo := nil;
    FfSiraNo := nil;
    FfSokumSure := nil;
    FfMalAd := nil;
    FfToplamSure := nil;
  end;
  inherited;
end;

function TTableUretimPlanlamaDetay.GetBasTarih: TDate;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih.AsDateTime;
end;

function TTableUretimPlanlamaDetay.GetBasTarihSaat: TDate;
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  Result := FfBasTarihSaat.AsDateTime;
end;

function TTableUretimPlanlamaDetay.GetBitTarih: TDate;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih.AsDateTime;
end;

function TTableUretimPlanlamaDetay.GetBitTarihSaat: TDate;
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  Result := FfBitTarihSaat.AsDateTime;
end;

function TTableUretimPlanlamaDetay.GetCalismaSure: Double;
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  Result := FfCalismaSure.AsFloat;
end;

function TTableUretimPlanlamaDetay.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimPlanlamaDetay.GetIsMerkezKod: String;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod.AsString;
end;

function TTableUretimPlanlamaDetay.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimPlanlamaDetay.GetKurulumSure: Double;
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  Result := FfKurulumSure.AsFloat;
end;

function TTableUretimPlanlamaDetay.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableUretimPlanlamaDetay.GetMiktar: Double;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar.AsFloat;
end;

function TTableUretimPlanlamaDetay.GetPlanBasTarih: TDate;
begin
  if FfPlanBasTarih = nil then
    FfPlanBasTarih := FindField('PLANBASTARIH');
  Result := FfPlanBasTarih.AsDateTime;
end;

function TTableUretimPlanlamaDetay.GetPlanBitTarih: TDate;
begin
  if FfPlanBitTarih = nil then
    FfPlanBitTarih := FindField('PLANBITTARIH');
  Result := FfPlanBitTarih.AsDateTime;
end;

function TTableUretimPlanlamaDetay.GetPlanNo: String;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo.AsString;
end;

function TTableUretimPlanlamaDetay.GetPlanSiraNo: Integer;
begin
  if FfPlanSiraNo = nil then
    FfPlanSiraNo := FindField('PLANSIRANO');
  Result := FfPlanSiraNo.AsInteger;
end;

function TTableUretimPlanlamaDetay.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableUretimPlanlamaDetay.GetSokumSure: Double;
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  Result := FfSokumSure.AsFloat;
end;

function TTableUretimPlanlamaDetay.GetMalAd: String;
begin
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  Result := FfMalAd.AsString;
end;

function TTableUretimPlanlamaDetay.GetToplamSure: Double;
begin
  if FfToplamSure = nil then
    FfToplamSure := FindField('TOPLAMSURE');
  Result := FfToplamSure.AsFloat;
end;

function TTableUretimPlanlamaDetay.GetfBasTarih: TField;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih;
end;

function TTableUretimPlanlamaDetay.GetfBasTarihSaat: TField;
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  Result := FfBasTarihSaat;
end;

function TTableUretimPlanlamaDetay.GetfBitTarih: TField;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih;
end;

function TTableUretimPlanlamaDetay.GetfBitTarihSaat: TField;
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  Result := FfBitTarihSaat;
end;

function TTableUretimPlanlamaDetay.GetfCalismaSure: TField;
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  Result := FfCalismaSure;
end;

function TTableUretimPlanlamaDetay.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimPlanlamaDetay.GetfIsMerkezKod: TField;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod;
end;

function TTableUretimPlanlamaDetay.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimPlanlamaDetay.GetfKurulumSure: TField;
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  Result := FfKurulumSure;
end;

function TTableUretimPlanlamaDetay.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableUretimPlanlamaDetay.GetfMiktar: TField;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar;
end;

function TTableUretimPlanlamaDetay.GetfPlanBasTarih: TField;
begin
  if FfPlanBasTarih = nil then
    FfPlanBasTarih := FindField('PLANBASTARIH');
  Result := FfPlanBasTarih;
end;

function TTableUretimPlanlamaDetay.GetfPlanBitTarih: TField;
begin
  if FfPlanBitTarih = nil then
    FfPlanBitTarih := FindField('PLANBITTARIH');
  Result := FfPlanBitTarih;
end;

function TTableUretimPlanlamaDetay.GetfPlanNo: TField;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo;
end;

function TTableUretimPlanlamaDetay.GetfPlanSiraNo: TField;
begin
  if FfPlanSiraNo = nil then
    FfPlanSiraNo := FindField('PLANSIRANO');
  Result := FfPlanSiraNo;
end;

function TTableUretimPlanlamaDetay.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableUretimPlanlamaDetay.GetfSokumSure: TField;
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  Result := FfSokumSure;
end;

function TTableUretimPlanlamaDetay.GetfMalAd: TField;
begin
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  Result := FfMalAd;
end;

function TTableUretimPlanlamaDetay.GetfToplamSure: TField;
begin
  if FfToplamSure = nil then
    FfToplamSure := FindField('TOPLAMSURE');
  Result := FfToplamSure;
end;

procedure TTableUretimPlanlamaDetay.SetBasTarih(const Value: TDate);
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  FfBasTarih.AsDateTime := Value;
end;

procedure TTableUretimPlanlamaDetay.SetBasTarihSaat(const Value: TDate);
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  FfBasTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimPlanlamaDetay.SetBitTarih(const Value: TDate);
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  FfBitTarih.AsDateTime := Value;
end;

procedure TTableUretimPlanlamaDetay.SetBitTarihSaat(const Value: TDate);
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  FfBitTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimPlanlamaDetay.SetCalismaSure(const Value: Double);
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  FfCalismaSure.AsFloat := Value;
end;

procedure TTableUretimPlanlamaDetay.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimPlanlamaDetay.SetIsMerkezKod(const Value: String);
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  FfIsMerkezKod.AsString := Value;
end;

procedure TTableUretimPlanlamaDetay.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimPlanlamaDetay.SetKurulumSure(const Value: Double);
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  FfKurulumSure.AsFloat := Value;
end;

procedure TTableUretimPlanlamaDetay.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableUretimPlanlamaDetay.SetMiktar(const Value: Double);
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  FfMiktar.AsFloat := Value;
end;

procedure TTableUretimPlanlamaDetay.SetPlanBasTarih(const Value: TDate);
begin
  if FfPlanBasTarih = nil then
    FfPlanBasTarih := FindField('PLANBASTARIH');
  FfPlanBasTarih.AsDateTime := Value;
end;

procedure TTableUretimPlanlamaDetay.SetPlanBitTarih(const Value: TDate);
begin
  if FfPlanBitTarih = nil then
    FfPlanBitTarih := FindField('PLANBITTARIH');
  FfPlanBitTarih.AsDateTime := Value;
end;

procedure TTableUretimPlanlamaDetay.SetPlanNo(const Value: String);
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  FfPlanNo.AsString := Value;
end;

procedure TTableUretimPlanlamaDetay.SetPlanSiraNo(const Value: Integer);
begin
  if FfPlanSiraNo = nil then
    FfPlanSiraNo := FindField('PLANSIRANO');
  FfPlanSiraNo.AsInteger := Value;
end;

procedure TTableUretimPlanlamaDetay.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableUretimPlanlamaDetay.SetSokumSure(const Value: Double);
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  FfSokumSure.AsFloat := Value;
end;

procedure TTableUretimPlanlamaDetay.SetMalAd(const Value: String);
begin
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  FfMalAd.AsString := Value;
end;

procedure TTableUretimPlanlamaDetay.SetToplamSure(const Value: Double);
begin
  if FfToplamSure = nil then
    FfToplamSure := FindField('TOPLAMSURE');
  FfToplamSure.AsFloat := Value;
end;

{ TTableUretimPlanlama }

constructor TTableUretimPlanlama.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTPLN';
end;

procedure TTableUretimPlanlama.DoAfterOpen;
begin
  if FfPlanlamaStokTukenisMiktar = nil then
    FfPlanlamaStokTukenisMiktar := FindField('_PLANLAMASTOKTUKENISMIKTAR');
  if FfPlanlamaStokTukenisTarih = nil then
    FfPlanlamaStokTukenisTarih := FindField('_PLANLAMASTOKTUKENISTARIH');
  if FfTamamlandi = nil then
    FfTamamlandi := FindField('_TAMAMLANDI');
  if FfBasStokMiktar = nil then
    FfBasStokMiktar := FindField('BASSTOKMIKTAR');
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  if FfBitStokMiktar = nil then
    FfBitStokMiktar := FindField('BITSTOKMIKTAR');
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  if FfDagitimYuzde = nil then
    FfDagitimYuzde := FindField('DAGITIMYUZDE');
  if FfGrup = nil then
    FfGrup := FindField('GRUP');
  if FfGrupSiraNo = nil then
    FfGrupSiraNo := FindField('GRUPSIRANO');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  if FfOncelik = nil then
    FfOncelik := FindField('ONCELIK');
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  if FfSatisHedef = nil then
    FfSatisHedef := FindField('SATISHEDEF');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfStokOrtalamaTasimaMiktar = nil then
    FfStokOrtalamaTasimaMiktar := FindField('STOKORTALAMATASIMAMIKTAR');
  if FfStokTukenisMiktar = nil then
    FfStokTukenisMiktar := FindField('STOKTUKENISMIKTAR');
  if FfStokTukenisTarih = nil then
    FfStokTukenisTarih := FindField('STOKTUKENISTARIH');
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('URETIMMIKTAR');
  inherited;
end;

procedure TTableUretimPlanlama.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfPlanlamaStokTukenisMiktar := nil;
    FfPlanlamaStokTukenisTarih := nil;
    FfTamamlandi := nil;
    FfBasStokMiktar := nil;
    FfBasTarih := nil;
    FfBasTarihSaat := nil;
    FfBitStokMiktar := nil;
    FfBitTarih := nil;
    FfDagitimYuzde := nil;
    FfGrup := nil;
    FfGrupSiraNo := nil;
    FfID := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKaynakKod := nil;
    FfMalKod := nil;
    FfMiktar := nil;
    FfOncelik := nil;
    FfPlanNo := nil;
    FfSatisHedef := nil;
    FfSiraNo := nil;
    FfStokOrtalamaTasimaMiktar := nil;
    FfStokTukenisMiktar := nil;
    FfStokTukenisTarih := nil;
    FfUretimMiktar := nil;
  end;
  inherited;
end;

function TTableUretimPlanlama.GetPlanlamaStokTukenisMiktar: Double;
begin
  if FfPlanlamaStokTukenisMiktar = nil then
    FfPlanlamaStokTukenisMiktar := FindField('_PLANLAMASTOKTUKENISMIKTAR');
  Result := FfPlanlamaStokTukenisMiktar.AsFloat;
end;

function TTableUretimPlanlama.GetPlanlamaStokTukenisTarih: TDate;
begin
  if FfPlanlamaStokTukenisTarih = nil then
    FfPlanlamaStokTukenisTarih := FindField('_PLANLAMASTOKTUKENISTARIH');
  Result := FfPlanlamaStokTukenisTarih.AsDateTime;
end;

function TTableUretimPlanlama.GetTamamlandi: Integer;
begin
  if FfTamamlandi = nil then
    FfTamamlandi := FindField('_TAMAMLANDI');
  Result := FfTamamlandi.AsInteger;
end;

function TTableUretimPlanlama.GetBasStokMiktar: Double;
begin
  if FfBasStokMiktar = nil then
    FfBasStokMiktar := FindField('BASSTOKMIKTAR');
  Result := FfBasStokMiktar.AsFloat;
end;

function TTableUretimPlanlama.GetBasTarih: TDate;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih.AsDateTime;
end;

function TTableUretimPlanlama.GetBasTarihSaat: TDate;
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  Result := FfBasTarihSaat.AsDateTime;
end;

function TTableUretimPlanlama.GetBitStokMiktar: Double;
begin
  if FfBitStokMiktar = nil then
    FfBitStokMiktar := FindField('BITSTOKMIKTAR');
  Result := FfBitStokMiktar.AsFloat;
end;

function TTableUretimPlanlama.GetBitTarih: TDate;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih.AsDateTime;
end;

function TTableUretimPlanlama.GetDagitimYuzde: Integer;
begin
  if FfDagitimYuzde = nil then
    FfDagitimYuzde := FindField('DAGITIMYUZDE');
  Result := FfDagitimYuzde.AsInteger;
end;

function TTableUretimPlanlama.GetGrup: Integer;
begin
  if FfGrup = nil then
    FfGrup := FindField('GRUP');
  Result := FfGrup.AsInteger;
end;

function TTableUretimPlanlama.GetGrupSiraNo: Integer;
begin
  if FfGrupSiraNo = nil then
    FfGrupSiraNo := FindField('GRUPSIRANO');
  Result := FfGrupSiraNo.AsInteger;
end;

function TTableUretimPlanlama.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimPlanlama.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableUretimPlanlama.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimPlanlama.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimPlanlama.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableUretimPlanlama.GetMiktar: Double;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar.AsFloat;
end;

function TTableUretimPlanlama.GetOncelik: Integer;
begin
  if FfOncelik = nil then
    FfOncelik := FindField('ONCELIK');
  Result := FfOncelik.AsInteger;
end;

function TTableUretimPlanlama.GetPlanNo: String;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo.AsString;
end;

function TTableUretimPlanlama.GetSatisHedef: Double;
begin
  if FfSatisHedef = nil then
    FfSatisHedef := FindField('SATISHEDEF');
  Result := FfSatisHedef.AsFloat;
end;

function TTableUretimPlanlama.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableUretimPlanlama.GetStokOrtalamaTasimaMiktar: Double;
begin
  if FfStokOrtalamaTasimaMiktar = nil then
    FfStokOrtalamaTasimaMiktar := FindField('STOKORTALAMATASIMAMIKTAR');
  Result := FfStokOrtalamaTasimaMiktar.AsFloat;
end;

function TTableUretimPlanlama.GetStokTukenisMiktar: Double;
begin
  if FfStokTukenisMiktar = nil then
    FfStokTukenisMiktar := FindField('STOKTUKENISMIKTAR');
  Result := FfStokTukenisMiktar.AsFloat;
end;

function TTableUretimPlanlama.GetStokTukenisTarih: TDate;
begin
  if FfStokTukenisTarih = nil then
    FfStokTukenisTarih := FindField('STOKTUKENISTARIH');
  Result := FfStokTukenisTarih.AsDateTime;
end;

function TTableUretimPlanlama.GetUretimMiktar: Double;
begin
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('URETIMMIKTAR');
  Result := FfUretimMiktar.AsFloat;
end;

function TTableUretimPlanlama.GetfPlanlamaStokTukenisMiktar: TField;
begin
  if FfPlanlamaStokTukenisMiktar = nil then
    FfPlanlamaStokTukenisMiktar := FindField('_PLANLAMASTOKTUKENISMIKTAR');
  Result := FfPlanlamaStokTukenisMiktar;
end;

function TTableUretimPlanlama.GetfPlanlamaStokTukenisTarih: TField;
begin
  if FfPlanlamaStokTukenisTarih = nil then
    FfPlanlamaStokTukenisTarih := FindField('_PLANLAMASTOKTUKENISTARIH');
  Result := FfPlanlamaStokTukenisTarih;
end;

function TTableUretimPlanlama.GetfTamamlandi: TField;
begin
  if FfTamamlandi = nil then
    FfTamamlandi := FindField('_TAMAMLANDI');
  Result := FfTamamlandi;
end;

function TTableUretimPlanlama.GetfBasStokMiktar: TField;
begin
  if FfBasStokMiktar = nil then
    FfBasStokMiktar := FindField('BASSTOKMIKTAR');
  Result := FfBasStokMiktar;
end;

function TTableUretimPlanlama.GetfBasTarih: TField;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih;
end;

function TTableUretimPlanlama.GetfBasTarihSaat: TField;
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  Result := FfBasTarihSaat;
end;

function TTableUretimPlanlama.GetfBitStokMiktar: TField;
begin
  if FfBitStokMiktar = nil then
    FfBitStokMiktar := FindField('BITSTOKMIKTAR');
  Result := FfBitStokMiktar;
end;

function TTableUretimPlanlama.GetfBitTarih: TField;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih;
end;

function TTableUretimPlanlama.GetfDagitimYuzde: TField;
begin
  if FfDagitimYuzde = nil then
    FfDagitimYuzde := FindField('DAGITIMYUZDE');
  Result := FfDagitimYuzde;
end;

function TTableUretimPlanlama.GetfGrup: TField;
begin
  if FfGrup = nil then
    FfGrup := FindField('GRUP');
  Result := FfGrup;
end;

function TTableUretimPlanlama.GetfGrupSiraNo: TField;
begin
  if FfGrupSiraNo = nil then
    FfGrupSiraNo := FindField('GRUPSIRANO');
  Result := FfGrupSiraNo;
end;

function TTableUretimPlanlama.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimPlanlama.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableUretimPlanlama.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimPlanlama.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimPlanlama.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableUretimPlanlama.GetfMiktar: TField;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar;
end;

function TTableUretimPlanlama.GetfOncelik: TField;
begin
  if FfOncelik = nil then
    FfOncelik := FindField('ONCELIK');
  Result := FfOncelik;
end;

function TTableUretimPlanlama.GetfPlanNo: TField;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo;
end;

function TTableUretimPlanlama.GetfSatisHedef: TField;
begin
  if FfSatisHedef = nil then
    FfSatisHedef := FindField('SATISHEDEF');
  Result := FfSatisHedef;
end;

function TTableUretimPlanlama.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableUretimPlanlama.GetfStokOrtalamaTasimaMiktar: TField;
begin
  if FfStokOrtalamaTasimaMiktar = nil then
    FfStokOrtalamaTasimaMiktar := FindField('STOKORTALAMATASIMAMIKTAR');
  Result := FfStokOrtalamaTasimaMiktar;
end;

function TTableUretimPlanlama.GetfStokTukenisMiktar: TField;
begin
  if FfStokTukenisMiktar = nil then
    FfStokTukenisMiktar := FindField('STOKTUKENISMIKTAR');
  Result := FfStokTukenisMiktar;
end;

function TTableUretimPlanlama.GetfStokTukenisTarih: TField;
begin
  if FfStokTukenisTarih = nil then
    FfStokTukenisTarih := FindField('STOKTUKENISTARIH');
  Result := FfStokTukenisTarih;
end;

function TTableUretimPlanlama.GetfUretimMiktar: TField;
begin
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('URETIMMIKTAR');
  Result := FfUretimMiktar;
end;

procedure TTableUretimPlanlama.SetPlanlamaStokTukenisMiktar(const Value: Double);
begin
  if FfPlanlamaStokTukenisMiktar = nil then
    FfPlanlamaStokTukenisMiktar := FindField('_PLANLAMASTOKTUKENISMIKTAR');
  FfPlanlamaStokTukenisMiktar.AsFloat := Value;
end;

procedure TTableUretimPlanlama.SetPlanlamaStokTukenisTarih(const Value: TDate);
begin
  if FfPlanlamaStokTukenisTarih = nil then
    FfPlanlamaStokTukenisTarih := FindField('_PLANLAMASTOKTUKENISTARIH');
  FfPlanlamaStokTukenisTarih.AsDateTime := Value;
end;

procedure TTableUretimPlanlama.SetTamamlandi(const Value: Integer);
begin
  if FfTamamlandi = nil then
    FfTamamlandi := FindField('_TAMAMLANDI');
  FfTamamlandi.AsInteger := Value;
end;

procedure TTableUretimPlanlama.SetBasStokMiktar(const Value: Double);
begin
  if FfBasStokMiktar = nil then
    FfBasStokMiktar := FindField('BASSTOKMIKTAR');
  FfBasStokMiktar.AsFloat := Value;
end;

procedure TTableUretimPlanlama.SetBasTarih(const Value: TDate);
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  FfBasTarih.AsDateTime := Value;
end;

procedure TTableUretimPlanlama.SetBasTarihSaat(const Value: TDate);
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  FfBasTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimPlanlama.SetBitStokMiktar(const Value: Double);
begin
  if FfBitStokMiktar = nil then
    FfBitStokMiktar := FindField('BITSTOKMIKTAR');
  FfBitStokMiktar.AsFloat := Value;
end;

procedure TTableUretimPlanlama.SetBitTarih(const Value: TDate);
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  FfBitTarih.AsDateTime := Value;
end;

procedure TTableUretimPlanlama.SetDagitimYuzde(const Value: Integer);
begin
  if FfDagitimYuzde = nil then
    FfDagitimYuzde := FindField('DAGITIMYUZDE');
  FfDagitimYuzde.AsInteger := Value;
end;

procedure TTableUretimPlanlama.SetGrup(const Value: Integer);
begin
  if FfGrup = nil then
    FfGrup := FindField('GRUP');
  FfGrup.AsInteger := Value;
end;

procedure TTableUretimPlanlama.SetGrupSiraNo(const Value: Integer);
begin
  if FfGrupSiraNo = nil then
    FfGrupSiraNo := FindField('GRUPSIRANO');
  FfGrupSiraNo.AsInteger := Value;
end;

procedure TTableUretimPlanlama.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimPlanlama.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableUretimPlanlama.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimPlanlama.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimPlanlama.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableUretimPlanlama.SetMiktar(const Value: Double);
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  FfMiktar.AsFloat := Value;
end;

procedure TTableUretimPlanlama.SetOncelik(const Value: Integer);
begin
  if FfOncelik = nil then
    FfOncelik := FindField('ONCELIK');
  FfOncelik.AsInteger := Value;
end;

procedure TTableUretimPlanlama.SetPlanNo(const Value: String);
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  FfPlanNo.AsString := Value;
end;

procedure TTableUretimPlanlama.SetSatisHedef(const Value: Double);
begin
  if FfSatisHedef = nil then
    FfSatisHedef := FindField('SATISHEDEF');
  FfSatisHedef.AsFloat := Value;
end;

procedure TTableUretimPlanlama.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableUretimPlanlama.SetStokOrtalamaTasimaMiktar(const Value: Double);
begin
  if FfStokOrtalamaTasimaMiktar = nil then
    FfStokOrtalamaTasimaMiktar := FindField('STOKORTALAMATASIMAMIKTAR');
  FfStokOrtalamaTasimaMiktar.AsFloat := Value;
end;

procedure TTableUretimPlanlama.SetStokTukenisMiktar(const Value: Double);
begin
  if FfStokTukenisMiktar = nil then
    FfStokTukenisMiktar := FindField('STOKTUKENISMIKTAR');
  FfStokTukenisMiktar.AsFloat := Value;
end;

procedure TTableUretimPlanlama.SetStokTukenisTarih(const Value: TDate);
begin
  if FfStokTukenisTarih = nil then
    FfStokTukenisTarih := FindField('STOKTUKENISTARIH');
  FfStokTukenisTarih.AsDateTime := Value;
end;

procedure TTableUretimPlanlama.SetUretimMiktar(const Value: Double);
begin
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('URETIMMIKTAR');
  FfUretimMiktar.AsFloat := Value;
end;

{ TTableUretimPlanlamaStokTakvim }

constructor TTableUretimPlanlamaStokTakvim.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTPST';
end;

procedure TTableUretimPlanlamaStokTakvim.DoAfterOpen;
begin
  if FfGunBasiMiktar = nil then
    FfGunBasiMiktar := FindField('GUNBASIMIKTAR');
  if FfGunSonuMiktar = nil then
    FfGunSonuMiktar := FindField('GUNSONUMIKTAR');
  if FfMalAd = nil then
    FfMalAd := FindField('MALAD');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfSatisMiktar = nil then
    FfSatisMiktar := FindField('SATISMIKTAR');
  if FfStokOrtalamaTasimaMiktar = nil then
    FfStokOrtalamaTasimaMiktar := FindField('STOKORTALAMATASIMAMIKTAR');
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('URETIMMIKTAR');
  inherited;
end;

procedure TTableUretimPlanlamaStokTakvim.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfGunBasiMiktar := nil;
    FfGunSonuMiktar := nil;
    FfMalAd := nil;
    FfMalKod := nil;
    FfSatisMiktar := nil;
    FfStokOrtalamaTasimaMiktar := nil;
    FfTarih := nil;
    FfUretimMiktar := nil;
  end;
  inherited;
end;

function TTableUretimPlanlamaStokTakvim.GetGunBasiMiktar: Double;
begin
  if FfGunBasiMiktar = nil then
    FfGunBasiMiktar := FindField('GUNBASIMIKTAR');
  Result := FfGunBasiMiktar.AsFloat;
end;

function TTableUretimPlanlamaStokTakvim.GetGunSonuMiktar: Double;
begin
  if FfGunSonuMiktar = nil then
    FfGunSonuMiktar := FindField('GUNSONUMIKTAR');
  Result := FfGunSonuMiktar.AsFloat;
end;

function TTableUretimPlanlamaStokTakvim.GetMalAd: String;
begin
  if FfMalAd = nil then
    FfMalAd := FindField('MALAD');
  Result := FfMalAd.AsString;
end;

function TTableUretimPlanlamaStokTakvim.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableUretimPlanlamaStokTakvim.GetSatisMiktar: Double;
begin
  if FfSatisMiktar = nil then
    FfSatisMiktar := FindField('SATISMIKTAR');
  Result := FfSatisMiktar.AsFloat;
end;

function TTableUretimPlanlamaStokTakvim.GetStokOrtalamaTasimaMiktar: Double;
begin
  if FfStokOrtalamaTasimaMiktar = nil then
    FfStokOrtalamaTasimaMiktar := FindField('STOKORTALAMATASIMAMIKTAR');
  Result := FfStokOrtalamaTasimaMiktar.AsFloat;
end;

function TTableUretimPlanlamaStokTakvim.GetTarih: TDate;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih.AsDateTime;
end;

function TTableUretimPlanlamaStokTakvim.GetUretimMiktar: Double;
begin
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('URETIMMIKTAR');
  Result := FfUretimMiktar.AsFloat;
end;

function TTableUretimPlanlamaStokTakvim.GetfGunBasiMiktar: TField;
begin
  if FfGunBasiMiktar = nil then
    FfGunBasiMiktar := FindField('GUNBASIMIKTAR');
  Result := FfGunBasiMiktar;
end;

function TTableUretimPlanlamaStokTakvim.GetfGunSonuMiktar: TField;
begin
  if FfGunSonuMiktar = nil then
    FfGunSonuMiktar := FindField('GUNSONUMIKTAR');
  Result := FfGunSonuMiktar;
end;

function TTableUretimPlanlamaStokTakvim.GetfMalAd: TField;
begin
  if FfMalAd = nil then
    FfMalAd := FindField('MALAD');
  Result := FfMalAd;
end;

function TTableUretimPlanlamaStokTakvim.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableUretimPlanlamaStokTakvim.GetfSatisMiktar: TField;
begin
  if FfSatisMiktar = nil then
    FfSatisMiktar := FindField('SATISMIKTAR');
  Result := FfSatisMiktar;
end;

function TTableUretimPlanlamaStokTakvim.GetfStokOrtalamaTasimaMiktar: TField;
begin
  if FfStokOrtalamaTasimaMiktar = nil then
    FfStokOrtalamaTasimaMiktar := FindField('STOKORTALAMATASIMAMIKTAR');
  Result := FfStokOrtalamaTasimaMiktar;
end;

function TTableUretimPlanlamaStokTakvim.GetfTarih: TField;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih;
end;

function TTableUretimPlanlamaStokTakvim.GetfUretimMiktar: TField;
begin
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('URETIMMIKTAR');
  Result := FfUretimMiktar;
end;

procedure TTableUretimPlanlamaStokTakvim.SetGunBasiMiktar(const Value: Double);
begin
  if FfGunBasiMiktar = nil then
    FfGunBasiMiktar := FindField('GUNBASIMIKTAR');
  FfGunBasiMiktar.AsFloat := Value;
end;

procedure TTableUretimPlanlamaStokTakvim.SetGunSonuMiktar(const Value: Double);
begin
  if FfGunSonuMiktar = nil then
    FfGunSonuMiktar := FindField('GUNSONUMIKTAR');
  FfGunSonuMiktar.AsFloat := Value;
end;

procedure TTableUretimPlanlamaStokTakvim.SetMalAd(const Value: String);
begin
  if FfMalAd = nil then
    FfMalAd := FindField('MALAD');
  FfMalAd.AsString := Value;
end;

procedure TTableUretimPlanlamaStokTakvim.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableUretimPlanlamaStokTakvim.SetSatisMiktar(const Value: Double);
begin
  if FfSatisMiktar = nil then
    FfSatisMiktar := FindField('SATISMIKTAR');
  FfSatisMiktar.AsFloat := Value;
end;

procedure TTableUretimPlanlamaStokTakvim.SetStokOrtalamaTasimaMiktar(const Value: Double);
begin
  if FfStokOrtalamaTasimaMiktar = nil then
    FfStokOrtalamaTasimaMiktar := FindField('STOKORTALAMATASIMAMIKTAR');
  FfStokOrtalamaTasimaMiktar.AsFloat := Value;
end;

procedure TTableUretimPlanlamaStokTakvim.SetTarih(const Value: TDate);
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  FfTarih.AsDateTime := Value;
end;

procedure TTableUretimPlanlamaStokTakvim.SetUretimMiktar(const Value: Double);
begin
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('URETIMMIKTAR');
  FfUretimMiktar.AsFloat := Value;
end;

{ TTableUretimPlanlamaSatisYuzde }

constructor TTableUretimPlanlamaSatisYuzde.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTPSY';
end;

procedure TTableUretimPlanlamaSatisYuzde.DoAfterOpen;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  if FfID = nil then
    FfID := FindField('ID');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  if FfSatisYuzde = nil then
    FfSatisYuzde := FindField('SATISYUZDE');
  inherited;
end;

procedure TTableUretimPlanlamaSatisYuzde.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfBasTarih := nil;
    FfBitTarih := nil;
    FfID := nil;
    FfMalKod := nil;
    FfPlanNo := nil;
    FfSatisYuzde := nil;
  end;
  inherited;
end;

function TTableUretimPlanlamaSatisYuzde.GetBasTarih: TDate;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih.AsDateTime;
end;

function TTableUretimPlanlamaSatisYuzde.GetBitTarih: TDate;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih.AsDateTime;
end;

function TTableUretimPlanlamaSatisYuzde.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimPlanlamaSatisYuzde.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableUretimPlanlamaSatisYuzde.GetPlanNo: String;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo.AsString;
end;

function TTableUretimPlanlamaSatisYuzde.GetSatisYuzde: Integer;
begin
  if FfSatisYuzde = nil then
    FfSatisYuzde := FindField('SATISYUZDE');
  Result := FfSatisYuzde.AsInteger;
end;

function TTableUretimPlanlamaSatisYuzde.GetfBasTarih: TField;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih;
end;

function TTableUretimPlanlamaSatisYuzde.GetfBitTarih: TField;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih;
end;

function TTableUretimPlanlamaSatisYuzde.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimPlanlamaSatisYuzde.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableUretimPlanlamaSatisYuzde.GetfPlanNo: TField;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo;
end;

function TTableUretimPlanlamaSatisYuzde.GetfSatisYuzde: TField;
begin
  if FfSatisYuzde = nil then
    FfSatisYuzde := FindField('SATISYUZDE');
  Result := FfSatisYuzde;
end;

procedure TTableUretimPlanlamaSatisYuzde.SetBasTarih(const Value: TDate);
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  FfBasTarih.AsDateTime := Value;
end;

procedure TTableUretimPlanlamaSatisYuzde.SetBitTarih(const Value: TDate);
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  FfBitTarih.AsDateTime := Value;
end;

procedure TTableUretimPlanlamaSatisYuzde.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimPlanlamaSatisYuzde.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableUretimPlanlamaSatisYuzde.SetPlanNo(const Value: String);
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  FfPlanNo.AsString := Value;
end;

procedure TTableUretimPlanlamaSatisYuzde.SetSatisYuzde(const Value: Integer);
begin
  if FfSatisYuzde = nil then
    FfSatisYuzde := FindField('SATISYUZDE');
  FfSatisYuzde.AsInteger := Value;
end;

{ TTableUretimTahminBaslik }

constructor TTableUretimTahminBaslik.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTTHB';
end;

procedure TTableUretimTahminBaslik.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  if FfButceBasTarih = nil then
    FfButceBasTarih := FindField('BUTCEBASTARIH');
  if FfButceBitTarih = nil then
    FfButceBitTarih := FindField('BUTCEBITTARIH');
  if FfButceDonemAdet = nil then
    FfButceDonemAdet := FindField('BUTCEDONEMADET');
  if FfButceDonemTip = nil then
    FfButceDonemTip := FindField('BUTCEDONEMTIP');
  if FfButceKod = nil then
    FfButceKod := FindField('BUTCEKOD');
  if FfButceSurum = nil then
    FfButceSurum := FindField('BUTCESURUM');
  if FfDonemAdet = nil then
    FfDonemAdet := FindField('DONEMADET');
  if FfDonemTip = nil then
    FfDonemTip := FindField('DONEMTIP');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIslemBasTarih = nil then
    FfIslemBasTarih := FindField('ISLEMBASTARIH');
  if FfIslemBitTarih = nil then
    FfIslemBitTarih := FindField('ISLEMBITTARIH');
  if FfIslemDonemAdet = nil then
    FfIslemDonemAdet := FindField('ISLEMDONEMADET');
  if FfIslemDonemTip = nil then
    FfIslemDonemTip := FindField('ISLEMDONEMTIP');
  if FfIslemIsMerkezKod = nil then
    FfIslemIsMerkezKod := FindField('ISLEMISMERKEZKOD');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  if FfTamKapasiteTakvimKod = nil then
    FfTamKapasiteTakvimKod := FindField('TAMKAPASITETAKVIMKOD');
  inherited;
end;

procedure TTableUretimTahminBaslik.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfBasTarih := nil;
    FfBirim := nil;
    FfBitTarih := nil;
    FfButceBasTarih := nil;
    FfButceBitTarih := nil;
    FfButceDonemAdet := nil;
    FfButceDonemTip := nil;
    FfButceKod := nil;
    FfButceSurum := nil;
    FfDonemAdet := nil;
    FfDonemTip := nil;
    FfID := nil;
    FfIslemBasTarih := nil;
    FfIslemBitTarih := nil;
    FfIslemDonemAdet := nil;
    FfIslemDonemTip := nil;
    FfIslemIsMerkezKod := nil;
    FfRowGuid := nil;
    FfSKod1 := nil;
    FfSKod2 := nil;
    FfSKod3 := nil;
    FfSKod4 := nil;
    FfSKod5 := nil;
    FfTahminNo := nil;
    FfTamKapasiteTakvimKod := nil;
  end;
  inherited;
end;

function TTableUretimTahminBaslik.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableUretimTahminBaslik.GetBasTarih: TDate;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih.AsDateTime;
end;

function TTableUretimTahminBaslik.GetBirim: String;
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  Result := FfBirim.AsString;
end;

function TTableUretimTahminBaslik.GetBitTarih: TDate;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih.AsDateTime;
end;

function TTableUretimTahminBaslik.GetButceBasTarih: TDate;
begin
  if FfButceBasTarih = nil then
    FfButceBasTarih := FindField('BUTCEBASTARIH');
  Result := FfButceBasTarih.AsDateTime;
end;

function TTableUretimTahminBaslik.GetButceBitTarih: TDate;
begin
  if FfButceBitTarih = nil then
    FfButceBitTarih := FindField('BUTCEBITTARIH');
  Result := FfButceBitTarih.AsDateTime;
end;

function TTableUretimTahminBaslik.GetButceDonemAdet: Integer;
begin
  if FfButceDonemAdet = nil then
    FfButceDonemAdet := FindField('BUTCEDONEMADET');
  Result := FfButceDonemAdet.AsInteger;
end;

function TTableUretimTahminBaslik.GetButceDonemTip: Integer;
begin
  if FfButceDonemTip = nil then
    FfButceDonemTip := FindField('BUTCEDONEMTIP');
  Result := FfButceDonemTip.AsInteger;
end;

function TTableUretimTahminBaslik.GetButceKod: String;
begin
  if FfButceKod = nil then
    FfButceKod := FindField('BUTCEKOD');
  Result := FfButceKod.AsString;
end;

function TTableUretimTahminBaslik.GetButceSurum: String;
begin
  if FfButceSurum = nil then
    FfButceSurum := FindField('BUTCESURUM');
  Result := FfButceSurum.AsString;
end;

function TTableUretimTahminBaslik.GetDonemAdet: Integer;
begin
  if FfDonemAdet = nil then
    FfDonemAdet := FindField('DONEMADET');
  Result := FfDonemAdet.AsInteger;
end;

function TTableUretimTahminBaslik.GetDonemTip: Integer;
begin
  if FfDonemTip = nil then
    FfDonemTip := FindField('DONEMTIP');
  Result := FfDonemTip.AsInteger;
end;

function TTableUretimTahminBaslik.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimTahminBaslik.GetIslemBasTarih: TDate;
begin
  if FfIslemBasTarih = nil then
    FfIslemBasTarih := FindField('ISLEMBASTARIH');
  Result := FfIslemBasTarih.AsDateTime;
end;

function TTableUretimTahminBaslik.GetIslemBitTarih: TDate;
begin
  if FfIslemBitTarih = nil then
    FfIslemBitTarih := FindField('ISLEMBITTARIH');
  Result := FfIslemBitTarih.AsDateTime;
end;

function TTableUretimTahminBaslik.GetIslemDonemAdet: Integer;
begin
  if FfIslemDonemAdet = nil then
    FfIslemDonemAdet := FindField('ISLEMDONEMADET');
  Result := FfIslemDonemAdet.AsInteger;
end;

function TTableUretimTahminBaslik.GetIslemDonemTip: Integer;
begin
  if FfIslemDonemTip = nil then
    FfIslemDonemTip := FindField('ISLEMDONEMTIP');
  Result := FfIslemDonemTip.AsInteger;
end;

function TTableUretimTahminBaslik.GetIslemIsMerkezKod: String;
begin
  if FfIslemIsMerkezKod = nil then
    FfIslemIsMerkezKod := FindField('ISLEMISMERKEZKOD');
  Result := FfIslemIsMerkezKod.AsString;
end;

function TTableUretimTahminBaslik.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimTahminBaslik.GetSKod1: String;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1.AsString;
end;

function TTableUretimTahminBaslik.GetSKod2: String;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2.AsString;
end;

function TTableUretimTahminBaslik.GetSKod3: String;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3.AsString;
end;

function TTableUretimTahminBaslik.GetSKod4: String;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4.AsString;
end;

function TTableUretimTahminBaslik.GetSKod5: String;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5.AsString;
end;

function TTableUretimTahminBaslik.GetTahminNo: String;
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  Result := FfTahminNo.AsString;
end;

function TTableUretimTahminBaslik.GetTamKapasiteTakvimKod: String;
begin
  if FfTamKapasiteTakvimKod = nil then
    FfTamKapasiteTakvimKod := FindField('TAMKAPASITETAKVIMKOD');
  Result := FfTamKapasiteTakvimKod.AsString;
end;

function TTableUretimTahminBaslik.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableUretimTahminBaslik.GetfBasTarih: TField;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih;
end;

function TTableUretimTahminBaslik.GetfBirim: TField;
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  Result := FfBirim;
end;

function TTableUretimTahminBaslik.GetfBitTarih: TField;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih;
end;

function TTableUretimTahminBaslik.GetfButceBasTarih: TField;
begin
  if FfButceBasTarih = nil then
    FfButceBasTarih := FindField('BUTCEBASTARIH');
  Result := FfButceBasTarih;
end;

function TTableUretimTahminBaslik.GetfButceBitTarih: TField;
begin
  if FfButceBitTarih = nil then
    FfButceBitTarih := FindField('BUTCEBITTARIH');
  Result := FfButceBitTarih;
end;

function TTableUretimTahminBaslik.GetfButceDonemAdet: TField;
begin
  if FfButceDonemAdet = nil then
    FfButceDonemAdet := FindField('BUTCEDONEMADET');
  Result := FfButceDonemAdet;
end;

function TTableUretimTahminBaslik.GetfButceDonemTip: TField;
begin
  if FfButceDonemTip = nil then
    FfButceDonemTip := FindField('BUTCEDONEMTIP');
  Result := FfButceDonemTip;
end;

function TTableUretimTahminBaslik.GetfButceKod: TField;
begin
  if FfButceKod = nil then
    FfButceKod := FindField('BUTCEKOD');
  Result := FfButceKod;
end;

function TTableUretimTahminBaslik.GetfButceSurum: TField;
begin
  if FfButceSurum = nil then
    FfButceSurum := FindField('BUTCESURUM');
  Result := FfButceSurum;
end;

function TTableUretimTahminBaslik.GetfDonemAdet: TField;
begin
  if FfDonemAdet = nil then
    FfDonemAdet := FindField('DONEMADET');
  Result := FfDonemAdet;
end;

function TTableUretimTahminBaslik.GetfDonemTip: TField;
begin
  if FfDonemTip = nil then
    FfDonemTip := FindField('DONEMTIP');
  Result := FfDonemTip;
end;

function TTableUretimTahminBaslik.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimTahminBaslik.GetfIslemBasTarih: TField;
begin
  if FfIslemBasTarih = nil then
    FfIslemBasTarih := FindField('ISLEMBASTARIH');
  Result := FfIslemBasTarih;
end;

function TTableUretimTahminBaslik.GetfIslemBitTarih: TField;
begin
  if FfIslemBitTarih = nil then
    FfIslemBitTarih := FindField('ISLEMBITTARIH');
  Result := FfIslemBitTarih;
end;

function TTableUretimTahminBaslik.GetfIslemDonemAdet: TField;
begin
  if FfIslemDonemAdet = nil then
    FfIslemDonemAdet := FindField('ISLEMDONEMADET');
  Result := FfIslemDonemAdet;
end;

function TTableUretimTahminBaslik.GetfIslemDonemTip: TField;
begin
  if FfIslemDonemTip = nil then
    FfIslemDonemTip := FindField('ISLEMDONEMTIP');
  Result := FfIslemDonemTip;
end;

function TTableUretimTahminBaslik.GetfIslemIsMerkezKod: TField;
begin
  if FfIslemIsMerkezKod = nil then
    FfIslemIsMerkezKod := FindField('ISLEMISMERKEZKOD');
  Result := FfIslemIsMerkezKod;
end;

function TTableUretimTahminBaslik.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimTahminBaslik.GetfSKod1: TField;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1;
end;

function TTableUretimTahminBaslik.GetfSKod2: TField;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2;
end;

function TTableUretimTahminBaslik.GetfSKod3: TField;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3;
end;

function TTableUretimTahminBaslik.GetfSKod4: TField;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4;
end;

function TTableUretimTahminBaslik.GetfSKod5: TField;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5;
end;

function TTableUretimTahminBaslik.GetfTahminNo: TField;
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  Result := FfTahminNo;
end;

function TTableUretimTahminBaslik.GetfTamKapasiteTakvimKod: TField;
begin
  if FfTamKapasiteTakvimKod = nil then
    FfTamKapasiteTakvimKod := FindField('TAMKAPASITETAKVIMKOD');
  Result := FfTamKapasiteTakvimKod;
end;

procedure TTableUretimTahminBaslik.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableUretimTahminBaslik.SetBasTarih(const Value: TDate);
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  FfBasTarih.AsDateTime := Value;
end;

procedure TTableUretimTahminBaslik.SetBirim(const Value: String);
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  FfBirim.AsString := Value;
end;

procedure TTableUretimTahminBaslik.SetBitTarih(const Value: TDate);
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  FfBitTarih.AsDateTime := Value;
end;

procedure TTableUretimTahminBaslik.SetButceBasTarih(const Value: TDate);
begin
  if FfButceBasTarih = nil then
    FfButceBasTarih := FindField('BUTCEBASTARIH');
  FfButceBasTarih.AsDateTime := Value;
end;

procedure TTableUretimTahminBaslik.SetButceBitTarih(const Value: TDate);
begin
  if FfButceBitTarih = nil then
    FfButceBitTarih := FindField('BUTCEBITTARIH');
  FfButceBitTarih.AsDateTime := Value;
end;

procedure TTableUretimTahminBaslik.SetButceDonemAdet(const Value: Integer);
begin
  if FfButceDonemAdet = nil then
    FfButceDonemAdet := FindField('BUTCEDONEMADET');
  FfButceDonemAdet.AsInteger := Value;
end;

procedure TTableUretimTahminBaslik.SetButceDonemTip(const Value: Integer);
begin
  if FfButceDonemTip = nil then
    FfButceDonemTip := FindField('BUTCEDONEMTIP');
  FfButceDonemTip.AsInteger := Value;
end;

procedure TTableUretimTahminBaslik.SetButceKod(const Value: String);
begin
  if FfButceKod = nil then
    FfButceKod := FindField('BUTCEKOD');
  FfButceKod.AsString := Value;
end;

procedure TTableUretimTahminBaslik.SetButceSurum(const Value: String);
begin
  if FfButceSurum = nil then
    FfButceSurum := FindField('BUTCESURUM');
  FfButceSurum.AsString := Value;
end;

procedure TTableUretimTahminBaslik.SetDonemAdet(const Value: Integer);
begin
  if FfDonemAdet = nil then
    FfDonemAdet := FindField('DONEMADET');
  FfDonemAdet.AsInteger := Value;
end;

procedure TTableUretimTahminBaslik.SetDonemTip(const Value: Integer);
begin
  if FfDonemTip = nil then
    FfDonemTip := FindField('DONEMTIP');
  FfDonemTip.AsInteger := Value;
end;

procedure TTableUretimTahminBaslik.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimTahminBaslik.SetIslemBasTarih(const Value: TDate);
begin
  if FfIslemBasTarih = nil then
    FfIslemBasTarih := FindField('ISLEMBASTARIH');
  FfIslemBasTarih.AsDateTime := Value;
end;

procedure TTableUretimTahminBaslik.SetIslemBitTarih(const Value: TDate);
begin
  if FfIslemBitTarih = nil then
    FfIslemBitTarih := FindField('ISLEMBITTARIH');
  FfIslemBitTarih.AsDateTime := Value;
end;

procedure TTableUretimTahminBaslik.SetIslemDonemAdet(const Value: Integer);
begin
  if FfIslemDonemAdet = nil then
    FfIslemDonemAdet := FindField('ISLEMDONEMADET');
  FfIslemDonemAdet.AsInteger := Value;
end;

procedure TTableUretimTahminBaslik.SetIslemDonemTip(const Value: Integer);
begin
  if FfIslemDonemTip = nil then
    FfIslemDonemTip := FindField('ISLEMDONEMTIP');
  FfIslemDonemTip.AsInteger := Value;
end;

procedure TTableUretimTahminBaslik.SetIslemIsMerkezKod(const Value: String);
begin
  if FfIslemIsMerkezKod = nil then
    FfIslemIsMerkezKod := FindField('ISLEMISMERKEZKOD');
  FfIslemIsMerkezKod.AsString := Value;
end;

procedure TTableUretimTahminBaslik.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimTahminBaslik.SetSKod1(const Value: String);
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  FfSKod1.AsString := Value;
end;

procedure TTableUretimTahminBaslik.SetSKod2(const Value: String);
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  FfSKod2.AsString := Value;
end;

procedure TTableUretimTahminBaslik.SetSKod3(const Value: String);
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  FfSKod3.AsString := Value;
end;

procedure TTableUretimTahminBaslik.SetSKod4(const Value: String);
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  FfSKod4.AsString := Value;
end;

procedure TTableUretimTahminBaslik.SetSKod5(const Value: String);
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  FfSKod5.AsString := Value;
end;

procedure TTableUretimTahminBaslik.SetTahminNo(const Value: String);
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  FfTahminNo.AsString := Value;
end;

procedure TTableUretimTahminBaslik.SetTamKapasiteTakvimKod(const Value: String);
begin
  if FfTamKapasiteTakvimKod = nil then
    FfTamKapasiteTakvimKod := FindField('TAMKAPASITETAKVIMKOD');
  FfTamKapasiteTakvimKod.AsString := Value;
end;

{ TTableUretimTahminKaynak }

constructor TTableUretimTahminKaynak.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTTHK';
end;

procedure TTableUretimTahminKaynak.DoAfterOpen;
begin
  if FfTahminKalanKapasite = nil then
    FfTahminKalanKapasite := FindField('_TAHMINKALANKAPASITE');
  if FfTahminKalanMiktar = nil then
    FfTahminKalanMiktar := FindField('_TAHMINKALANMIKTAR');
  if FfBirimMiktar = nil then
    FfBirimMiktar := FindField('BIRIMMIKTAR');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfTahminKapasite = nil then
    FfTahminKapasite := FindField('TAHMINKAPASITE');
  if FfTahminKullanilanKapasite = nil then
    FfTahminKullanilanKapasite := FindField('TAHMINKULLANILANKAPASITE');
  if FfTahminKullanilanMiktar = nil then
    FfTahminKullanilanMiktar := FindField('TAHMINKULLANILANMIKTAR');
  if FfTahminMiktar = nil then
    FfTahminMiktar := FindField('TAHMINMIKTAR');
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  if FfTamKapasite = nil then
    FfTamKapasite := FindField('TAMKAPASITE');
  if FfTamMiktar = nil then
    FfTamMiktar := FindField('TAMMIKTAR');
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  inherited;
end;

procedure TTableUretimTahminKaynak.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfTahminKalanKapasite := nil;
    FfTahminKalanMiktar := nil;
    FfBirimMiktar := nil;
    FfID := nil;
    FfKaynakKod := nil;
    FfSiraNo := nil;
    FfTahminKapasite := nil;
    FfTahminKullanilanKapasite := nil;
    FfTahminKullanilanMiktar := nil;
    FfTahminMiktar := nil;
    FfTahminNo := nil;
    FfTamKapasite := nil;
    FfTamMiktar := nil;
    FfTarih := nil;
  end;
  inherited;
end;

function TTableUretimTahminKaynak.GetTahminKalanKapasite: Double;
begin
  if FfTahminKalanKapasite = nil then
    FfTahminKalanKapasite := FindField('_TAHMINKALANKAPASITE');
  Result := FfTahminKalanKapasite.AsFloat;
end;

function TTableUretimTahminKaynak.GetTahminKalanMiktar: Double;
begin
  if FfTahminKalanMiktar = nil then
    FfTahminKalanMiktar := FindField('_TAHMINKALANMIKTAR');
  Result := FfTahminKalanMiktar.AsFloat;
end;

function TTableUretimTahminKaynak.GetBirimMiktar: Double;
begin
  if FfBirimMiktar = nil then
    FfBirimMiktar := FindField('BIRIMMIKTAR');
  Result := FfBirimMiktar.AsFloat;
end;

function TTableUretimTahminKaynak.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimTahminKaynak.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimTahminKaynak.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableUretimTahminKaynak.GetTahminKapasite: Double;
begin
  if FfTahminKapasite = nil then
    FfTahminKapasite := FindField('TAHMINKAPASITE');
  Result := FfTahminKapasite.AsFloat;
end;

function TTableUretimTahminKaynak.GetTahminKullanilanKapasite: Double;
begin
  if FfTahminKullanilanKapasite = nil then
    FfTahminKullanilanKapasite := FindField('TAHMINKULLANILANKAPASITE');
  Result := FfTahminKullanilanKapasite.AsFloat;
end;

function TTableUretimTahminKaynak.GetTahminKullanilanMiktar: Double;
begin
  if FfTahminKullanilanMiktar = nil then
    FfTahminKullanilanMiktar := FindField('TAHMINKULLANILANMIKTAR');
  Result := FfTahminKullanilanMiktar.AsFloat;
end;

function TTableUretimTahminKaynak.GetTahminMiktar: Double;
begin
  if FfTahminMiktar = nil then
    FfTahminMiktar := FindField('TAHMINMIKTAR');
  Result := FfTahminMiktar.AsFloat;
end;

function TTableUretimTahminKaynak.GetTahminNo: String;
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  Result := FfTahminNo.AsString;
end;

function TTableUretimTahminKaynak.GetTamKapasite: Double;
begin
  if FfTamKapasite = nil then
    FfTamKapasite := FindField('TAMKAPASITE');
  Result := FfTamKapasite.AsFloat;
end;

function TTableUretimTahminKaynak.GetTamMiktar: Double;
begin
  if FfTamMiktar = nil then
    FfTamMiktar := FindField('TAMMIKTAR');
  Result := FfTamMiktar.AsFloat;
end;

function TTableUretimTahminKaynak.GetTarih: TDate;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih.AsDateTime;
end;

function TTableUretimTahminKaynak.GetfTahminKalanKapasite: TField;
begin
  if FfTahminKalanKapasite = nil then
    FfTahminKalanKapasite := FindField('_TAHMINKALANKAPASITE');
  Result := FfTahminKalanKapasite;
end;

function TTableUretimTahminKaynak.GetfTahminKalanMiktar: TField;
begin
  if FfTahminKalanMiktar = nil then
    FfTahminKalanMiktar := FindField('_TAHMINKALANMIKTAR');
  Result := FfTahminKalanMiktar;
end;

function TTableUretimTahminKaynak.GetfBirimMiktar: TField;
begin
  if FfBirimMiktar = nil then
    FfBirimMiktar := FindField('BIRIMMIKTAR');
  Result := FfBirimMiktar;
end;

function TTableUretimTahminKaynak.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimTahminKaynak.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimTahminKaynak.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableUretimTahminKaynak.GetfTahminKapasite: TField;
begin
  if FfTahminKapasite = nil then
    FfTahminKapasite := FindField('TAHMINKAPASITE');
  Result := FfTahminKapasite;
end;

function TTableUretimTahminKaynak.GetfTahminKullanilanKapasite: TField;
begin
  if FfTahminKullanilanKapasite = nil then
    FfTahminKullanilanKapasite := FindField('TAHMINKULLANILANKAPASITE');
  Result := FfTahminKullanilanKapasite;
end;

function TTableUretimTahminKaynak.GetfTahminKullanilanMiktar: TField;
begin
  if FfTahminKullanilanMiktar = nil then
    FfTahminKullanilanMiktar := FindField('TAHMINKULLANILANMIKTAR');
  Result := FfTahminKullanilanMiktar;
end;

function TTableUretimTahminKaynak.GetfTahminMiktar: TField;
begin
  if FfTahminMiktar = nil then
    FfTahminMiktar := FindField('TAHMINMIKTAR');
  Result := FfTahminMiktar;
end;

function TTableUretimTahminKaynak.GetfTahminNo: TField;
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  Result := FfTahminNo;
end;

function TTableUretimTahminKaynak.GetfTamKapasite: TField;
begin
  if FfTamKapasite = nil then
    FfTamKapasite := FindField('TAMKAPASITE');
  Result := FfTamKapasite;
end;

function TTableUretimTahminKaynak.GetfTamMiktar: TField;
begin
  if FfTamMiktar = nil then
    FfTamMiktar := FindField('TAMMIKTAR');
  Result := FfTamMiktar;
end;

function TTableUretimTahminKaynak.GetfTarih: TField;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih;
end;

procedure TTableUretimTahminKaynak.SetTahminKalanKapasite(const Value: Double);
begin
  if FfTahminKalanKapasite = nil then
    FfTahminKalanKapasite := FindField('_TAHMINKALANKAPASITE');
  FfTahminKalanKapasite.AsFloat := Value;
end;

procedure TTableUretimTahminKaynak.SetTahminKalanMiktar(const Value: Double);
begin
  if FfTahminKalanMiktar = nil then
    FfTahminKalanMiktar := FindField('_TAHMINKALANMIKTAR');
  FfTahminKalanMiktar.AsFloat := Value;
end;

procedure TTableUretimTahminKaynak.SetBirimMiktar(const Value: Double);
begin
  if FfBirimMiktar = nil then
    FfBirimMiktar := FindField('BIRIMMIKTAR');
  FfBirimMiktar.AsFloat := Value;
end;

procedure TTableUretimTahminKaynak.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimTahminKaynak.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimTahminKaynak.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableUretimTahminKaynak.SetTahminKapasite(const Value: Double);
begin
  if FfTahminKapasite = nil then
    FfTahminKapasite := FindField('TAHMINKAPASITE');
  FfTahminKapasite.AsFloat := Value;
end;

procedure TTableUretimTahminKaynak.SetTahminKullanilanKapasite(const Value: Double);
begin
  if FfTahminKullanilanKapasite = nil then
    FfTahminKullanilanKapasite := FindField('TAHMINKULLANILANKAPASITE');
  FfTahminKullanilanKapasite.AsFloat := Value;
end;

procedure TTableUretimTahminKaynak.SetTahminKullanilanMiktar(const Value: Double);
begin
  if FfTahminKullanilanMiktar = nil then
    FfTahminKullanilanMiktar := FindField('TAHMINKULLANILANMIKTAR');
  FfTahminKullanilanMiktar.AsFloat := Value;
end;

procedure TTableUretimTahminKaynak.SetTahminMiktar(const Value: Double);
begin
  if FfTahminMiktar = nil then
    FfTahminMiktar := FindField('TAHMINMIKTAR');
  FfTahminMiktar.AsFloat := Value;
end;

procedure TTableUretimTahminKaynak.SetTahminNo(const Value: String);
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  FfTahminNo.AsString := Value;
end;

procedure TTableUretimTahminKaynak.SetTamKapasite(const Value: Double);
begin
  if FfTamKapasite = nil then
    FfTamKapasite := FindField('TAMKAPASITE');
  FfTamKapasite.AsFloat := Value;
end;

procedure TTableUretimTahminKaynak.SetTamMiktar(const Value: Double);
begin
  if FfTamMiktar = nil then
    FfTamMiktar := FindField('TAMMIKTAR');
  FfTamMiktar.AsFloat := Value;
end;

procedure TTableUretimTahminKaynak.SetTarih(const Value: TDate);
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  FfTarih.AsDateTime := Value;
end;

{ TTableUretimTahmin }

constructor TTableUretimTahmin.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTTHM';
end;

procedure TTableUretimTahmin.DoAfterOpen;
begin
  if FfABCKod = nil then
    FfABCKod := FindField('ABCKOD');
  if FfBasStokMiktar = nil then
    FfBasStokMiktar := FindField('BASSTOKMIKTAR');
  if FfBasStokSure = nil then
    FfBasStokSure := FindField('BASSTOKSURE');
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  if FfBitStokMiktar = nil then
    FfBitStokMiktar := FindField('BITSTOKMIKTAR');
  if FfHedefStokMiktar = nil then
    FfHedefStokMiktar := FindField('HEDEFSTOKMIKTAR');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSatisMiktar = nil then
    FfSatisMiktar := FindField('SATISMIKTAR');
  if FfSatisMiktarGrupYuzde = nil then
    FfSatisMiktarGrupYuzde := FindField('SATISMIKTARGRUPYUZDE');
  if FfSatisMiktarYuzde = nil then
    FfSatisMiktarYuzde := FindField('SATISMIKTARYUZDE');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('URETIMMIKTAR');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  if FfYMUretimMiktar = nil then
    FfYMUretimMiktar := FindField('YMURETIMMIKTAR');
  inherited;
end;

procedure TTableUretimTahmin.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfABCKod := nil;
    FfBasStokMiktar := nil;
    FfBasStokSure := nil;
    FfBirim := nil;
    FfBitStokMiktar := nil;
    FfHedefStokMiktar := nil;
    FfID := nil;
    FfIsMerkezKod := nil;
    FfMalKod := nil;
    FfMRPAlanKod := nil;
    FfRowGuid := nil;
    FfSatisMiktar := nil;
    FfSatisMiktarGrupYuzde := nil;
    FfSatisMiktarYuzde := nil;
    FfSiraNo := nil;
    FfMalAd := nil;
    FfTahminNo := nil;
    FfTarih := nil;
    FfUretimMiktar := nil;
    FfVersiyonNo := nil;
    FfYMUretimMiktar := nil;
  end;
  inherited;
end;

function TTableUretimTahmin.GetABCKod: String;
begin
  if FfABCKod = nil then
    FfABCKod := FindField('ABCKOD');
  Result := FfABCKod.AsString;
end;

function TTableUretimTahmin.GetBasStokMiktar: Double;
begin
  if FfBasStokMiktar = nil then
    FfBasStokMiktar := FindField('BASSTOKMIKTAR');
  Result := FfBasStokMiktar.AsFloat;
end;

function TTableUretimTahmin.GetBasStokSure: Double;
begin
  if FfBasStokSure = nil then
    FfBasStokSure := FindField('BASSTOKSURE');
  Result := FfBasStokSure.AsFloat;
end;

function TTableUretimTahmin.GetBirim: String;
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  Result := FfBirim.AsString;
end;

function TTableUretimTahmin.GetBitStokMiktar: Double;
begin
  if FfBitStokMiktar = nil then
    FfBitStokMiktar := FindField('BITSTOKMIKTAR');
  Result := FfBitStokMiktar.AsFloat;
end;

function TTableUretimTahmin.GetHedefStokMiktar: Double;
begin
  if FfHedefStokMiktar = nil then
    FfHedefStokMiktar := FindField('HEDEFSTOKMIKTAR');
  Result := FfHedefStokMiktar.AsFloat;
end;

function TTableUretimTahmin.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimTahmin.GetIsMerkezKod: String;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod.AsString;
end;

function TTableUretimTahmin.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableUretimTahmin.GetMRPAlanKod: String;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod.AsString;
end;

function TTableUretimTahmin.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimTahmin.GetSatisMiktar: Double;
begin
  if FfSatisMiktar = nil then
    FfSatisMiktar := FindField('SATISMIKTAR');
  Result := FfSatisMiktar.AsFloat;
end;

function TTableUretimTahmin.GetSatisMiktarGrupYuzde: Double;
begin
  if FfSatisMiktarGrupYuzde = nil then
    FfSatisMiktarGrupYuzde := FindField('SATISMIKTARGRUPYUZDE');
  Result := FfSatisMiktarGrupYuzde.AsFloat;
end;

function TTableUretimTahmin.GetSatisMiktarYuzde: Double;
begin
  if FfSatisMiktarYuzde = nil then
    FfSatisMiktarYuzde := FindField('SATISMIKTARYUZDE');
  Result := FfSatisMiktarYuzde.AsFloat;
end;

function TTableUretimTahmin.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableUretimTahmin.GetMalAd: String;
begin
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  Result := FfMalAd.AsString;
end;

function TTableUretimTahmin.GetTahminNo: String;
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  Result := FfTahminNo.AsString;
end;

function TTableUretimTahmin.GetTarih: TDate;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih.AsDateTime;
end;

function TTableUretimTahmin.GetUretimMiktar: Double;
begin
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('URETIMMIKTAR');
  Result := FfUretimMiktar.AsFloat;
end;

function TTableUretimTahmin.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableUretimTahmin.GetYMUretimMiktar: Double;
begin
  if FfYMUretimMiktar = nil then
    FfYMUretimMiktar := FindField('YMURETIMMIKTAR');
  Result := FfYMUretimMiktar.AsFloat;
end;

function TTableUretimTahmin.GetfABCKod: TField;
begin
  if FfABCKod = nil then
    FfABCKod := FindField('ABCKOD');
  Result := FfABCKod;
end;

function TTableUretimTahmin.GetfBasStokMiktar: TField;
begin
  if FfBasStokMiktar = nil then
    FfBasStokMiktar := FindField('BASSTOKMIKTAR');
  Result := FfBasStokMiktar;
end;

function TTableUretimTahmin.GetfBasStokSure: TField;
begin
  if FfBasStokSure = nil then
    FfBasStokSure := FindField('BASSTOKSURE');
  Result := FfBasStokSure;
end;

function TTableUretimTahmin.GetfBirim: TField;
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  Result := FfBirim;
end;

function TTableUretimTahmin.GetfBitStokMiktar: TField;
begin
  if FfBitStokMiktar = nil then
    FfBitStokMiktar := FindField('BITSTOKMIKTAR');
  Result := FfBitStokMiktar;
end;

function TTableUretimTahmin.GetfHedefStokMiktar: TField;
begin
  if FfHedefStokMiktar = nil then
    FfHedefStokMiktar := FindField('HEDEFSTOKMIKTAR');
  Result := FfHedefStokMiktar;
end;

function TTableUretimTahmin.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimTahmin.GetfIsMerkezKod: TField;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod;
end;

function TTableUretimTahmin.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableUretimTahmin.GetfMRPAlanKod: TField;
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  Result := FfMRPAlanKod;
end;

function TTableUretimTahmin.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimTahmin.GetfSatisMiktar: TField;
begin
  if FfSatisMiktar = nil then
    FfSatisMiktar := FindField('SATISMIKTAR');
  Result := FfSatisMiktar;
end;

function TTableUretimTahmin.GetfSatisMiktarGrupYuzde: TField;
begin
  if FfSatisMiktarGrupYuzde = nil then
    FfSatisMiktarGrupYuzde := FindField('SATISMIKTARGRUPYUZDE');
  Result := FfSatisMiktarGrupYuzde;
end;

function TTableUretimTahmin.GetfSatisMiktarYuzde: TField;
begin
  if FfSatisMiktarYuzde = nil then
    FfSatisMiktarYuzde := FindField('SATISMIKTARYUZDE');
  Result := FfSatisMiktarYuzde;
end;

function TTableUretimTahmin.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableUretimTahmin.GetfMalAd: TField;
begin
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  Result := FfMalAd;
end;

function TTableUretimTahmin.GetfTahminNo: TField;
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  Result := FfTahminNo;
end;

function TTableUretimTahmin.GetfTarih: TField;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih;
end;

function TTableUretimTahmin.GetfUretimMiktar: TField;
begin
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('URETIMMIKTAR');
  Result := FfUretimMiktar;
end;

function TTableUretimTahmin.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

function TTableUretimTahmin.GetfYMUretimMiktar: TField;
begin
  if FfYMUretimMiktar = nil then
    FfYMUretimMiktar := FindField('YMURETIMMIKTAR');
  Result := FfYMUretimMiktar;
end;

procedure TTableUretimTahmin.SetABCKod(const Value: String);
begin
  if FfABCKod = nil then
    FfABCKod := FindField('ABCKOD');
  FfABCKod.AsString := Value;
end;

procedure TTableUretimTahmin.SetBasStokMiktar(const Value: Double);
begin
  if FfBasStokMiktar = nil then
    FfBasStokMiktar := FindField('BASSTOKMIKTAR');
  FfBasStokMiktar.AsFloat := Value;
end;

procedure TTableUretimTahmin.SetBasStokSure(const Value: Double);
begin
  if FfBasStokSure = nil then
    FfBasStokSure := FindField('BASSTOKSURE');
  FfBasStokSure.AsFloat := Value;
end;

procedure TTableUretimTahmin.SetBirim(const Value: String);
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  FfBirim.AsString := Value;
end;

procedure TTableUretimTahmin.SetBitStokMiktar(const Value: Double);
begin
  if FfBitStokMiktar = nil then
    FfBitStokMiktar := FindField('BITSTOKMIKTAR');
  FfBitStokMiktar.AsFloat := Value;
end;

procedure TTableUretimTahmin.SetHedefStokMiktar(const Value: Double);
begin
  if FfHedefStokMiktar = nil then
    FfHedefStokMiktar := FindField('HEDEFSTOKMIKTAR');
  FfHedefStokMiktar.AsFloat := Value;
end;

procedure TTableUretimTahmin.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimTahmin.SetIsMerkezKod(const Value: String);
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  FfIsMerkezKod.AsString := Value;
end;

procedure TTableUretimTahmin.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableUretimTahmin.SetMRPAlanKod(const Value: String);
begin
  if FfMRPAlanKod = nil then
    FfMRPAlanKod := FindField('MRPALANKOD');
  FfMRPAlanKod.AsString := Value;
end;

procedure TTableUretimTahmin.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimTahmin.SetSatisMiktar(const Value: Double);
begin
  if FfSatisMiktar = nil then
    FfSatisMiktar := FindField('SATISMIKTAR');
  FfSatisMiktar.AsFloat := Value;
end;

procedure TTableUretimTahmin.SetSatisMiktarGrupYuzde(const Value: Double);
begin
  if FfSatisMiktarGrupYuzde = nil then
    FfSatisMiktarGrupYuzde := FindField('SATISMIKTARGRUPYUZDE');
  FfSatisMiktarGrupYuzde.AsFloat := Value;
end;

procedure TTableUretimTahmin.SetSatisMiktarYuzde(const Value: Double);
begin
  if FfSatisMiktarYuzde = nil then
    FfSatisMiktarYuzde := FindField('SATISMIKTARYUZDE');
  FfSatisMiktarYuzde.AsFloat := Value;
end;

procedure TTableUretimTahmin.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableUretimTahmin.SetMalAd(const Value: String);
begin
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  FfMalAd.AsString := Value;
end;

procedure TTableUretimTahmin.SetTahminNo(const Value: String);
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  FfTahminNo.AsString := Value;
end;

procedure TTableUretimTahmin.SetTarih(const Value: TDate);
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  FfTarih.AsDateTime := Value;
end;

procedure TTableUretimTahmin.SetUretimMiktar(const Value: Double);
begin
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('URETIMMIKTAR');
  FfUretimMiktar.AsFloat := Value;
end;

procedure TTableUretimTahmin.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

procedure TTableUretimTahmin.SetYMUretimMiktar(const Value: Double);
begin
  if FfYMUretimMiktar = nil then
    FfYMUretimMiktar := FindField('YMURETIMMIKTAR');
  FfYMUretimMiktar.AsFloat := Value;
end;

{ TTableUretimTahminNot }

constructor TTableUretimTahminNot.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTTHN';
end;

procedure TTableUretimTahminNot.DoAfterOpen;
begin
  if FfAd = nil then
    FfAd := FindField('AD');
  if FfBelge = nil then
    FfBelge := FindField('BELGE');
  if FfDeger = nil then
    FfDeger := FindField('DEGER');
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  if FfDosya = nil then
    FfDosya := FindField('DOSYA');
  if FfDosyaAd = nil then
    FfDosyaAd := FindField('DOSYAAD');
  if FfDosyaDizin = nil then
    FfDosyaDizin := FindField('DOSYADIZIN');
  if FfDosyaUzunluk = nil then
    FfDosyaUzunluk := FindField('DOSYAUZUNLUK');
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  if FfGrupKod = nil then
    FfGrupKod := FindField('GRUPKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  inherited;
end;

procedure TTableUretimTahminNot.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAd := nil;
    FfBelge := nil;
    FfDeger := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
    FfDosya := nil;
    FfDosyaAd := nil;
    FfDosyaDizin := nil;
    FfDosyaUzunluk := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfGrupKod := nil;
    FfID := nil;
    FfRowGuid := nil;
    FfSiraNo := nil;
    FfTahminNo := nil;
  end;
  inherited;
end;

function TTableUretimTahminNot.GetAd: String;
begin
  if FfAd = nil then
    FfAd := FindField('AD');
  Result := FfAd.AsString;
end;

function TTableUretimTahminNot.GetBelge: String;
begin
  if FfBelge = nil then
    FfBelge := FindField('BELGE');
  Result := FfBelge.AsString;
end;

function TTableUretimTahminNot.GetDeger: String;
begin
  if FfDeger = nil then
    FfDeger := FindField('DEGER');
  Result := FfDeger.AsString;
end;

function TTableUretimTahminNot.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimTahminNot.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimTahminNot.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableUretimTahminNot.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableUretimTahminNot.GetDosya: String;
begin
  if FfDosya = nil then
    FfDosya := FindField('DOSYA');
  Result := FfDosya.AsString;
end;

function TTableUretimTahminNot.GetDosyaAd: String;
begin
  if FfDosyaAd = nil then
    FfDosyaAd := FindField('DOSYAAD');
  Result := FfDosyaAd.AsString;
end;

function TTableUretimTahminNot.GetDosyaDizin: String;
begin
  if FfDosyaDizin = nil then
    FfDosyaDizin := FindField('DOSYADIZIN');
  Result := FfDosyaDizin.AsString;
end;

function TTableUretimTahminNot.GetDosyaUzunluk: Integer;
begin
  if FfDosyaUzunluk = nil then
    FfDosyaUzunluk := FindField('DOSYAUZUNLUK');
  Result := FfDosyaUzunluk.AsInteger;
end;

function TTableUretimTahminNot.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableUretimTahminNot.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimTahminNot.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableUretimTahminNot.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableUretimTahminNot.GetGrupKod: String;
begin
  if FfGrupKod = nil then
    FfGrupKod := FindField('GRUPKOD');
  Result := FfGrupKod.AsString;
end;

function TTableUretimTahminNot.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimTahminNot.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimTahminNot.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableUretimTahminNot.GetTahminNo: String;
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  Result := FfTahminNo.AsString;
end;

function TTableUretimTahminNot.GetfAd: TField;
begin
  if FfAd = nil then
    FfAd := FindField('AD');
  Result := FfAd;
end;

function TTableUretimTahminNot.GetfBelge: TField;
begin
  if FfBelge = nil then
    FfBelge := FindField('BELGE');
  Result := FfBelge;
end;

function TTableUretimTahminNot.GetfDeger: TField;
begin
  if FfDeger = nil then
    FfDeger := FindField('DEGER');
  Result := FfDeger;
end;

function TTableUretimTahminNot.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimTahminNot.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimTahminNot.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableUretimTahminNot.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableUretimTahminNot.GetfDosya: TField;
begin
  if FfDosya = nil then
    FfDosya := FindField('DOSYA');
  Result := FfDosya;
end;

function TTableUretimTahminNot.GetfDosyaAd: TField;
begin
  if FfDosyaAd = nil then
    FfDosyaAd := FindField('DOSYAAD');
  Result := FfDosyaAd;
end;

function TTableUretimTahminNot.GetfDosyaDizin: TField;
begin
  if FfDosyaDizin = nil then
    FfDosyaDizin := FindField('DOSYADIZIN');
  Result := FfDosyaDizin;
end;

function TTableUretimTahminNot.GetfDosyaUzunluk: TField;
begin
  if FfDosyaUzunluk = nil then
    FfDosyaUzunluk := FindField('DOSYAUZUNLUK');
  Result := FfDosyaUzunluk;
end;

function TTableUretimTahminNot.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableUretimTahminNot.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimTahminNot.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableUretimTahminNot.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableUretimTahminNot.GetfGrupKod: TField;
begin
  if FfGrupKod = nil then
    FfGrupKod := FindField('GRUPKOD');
  Result := FfGrupKod;
end;

function TTableUretimTahminNot.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimTahminNot.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimTahminNot.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableUretimTahminNot.GetfTahminNo: TField;
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  Result := FfTahminNo;
end;

procedure TTableUretimTahminNot.SetAd(const Value: String);
begin
  if FfAd = nil then
    FfAd := FindField('AD');
  FfAd.AsString := Value;
end;

procedure TTableUretimTahminNot.SetBelge(const Value: String);
begin
  if FfBelge = nil then
    FfBelge := FindField('BELGE');
  FfBelge.AsString := Value;
end;

procedure TTableUretimTahminNot.SetDeger(const Value: String);
begin
  if FfDeger = nil then
    FfDeger := FindField('DEGER');
  FfDeger.AsString := Value;
end;

procedure TTableUretimTahminNot.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimTahminNot.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimTahminNot.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableUretimTahminNot.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableUretimTahminNot.SetDosya(const Value: String);
begin
  if FfDosya = nil then
    FfDosya := FindField('DOSYA');
  FfDosya.AsString := Value;
end;

procedure TTableUretimTahminNot.SetDosyaAd(const Value: String);
begin
  if FfDosyaAd = nil then
    FfDosyaAd := FindField('DOSYAAD');
  FfDosyaAd.AsString := Value;
end;

procedure TTableUretimTahminNot.SetDosyaDizin(const Value: String);
begin
  if FfDosyaDizin = nil then
    FfDosyaDizin := FindField('DOSYADIZIN');
  FfDosyaDizin.AsString := Value;
end;

procedure TTableUretimTahminNot.SetDosyaUzunluk(const Value: Integer);
begin
  if FfDosyaUzunluk = nil then
    FfDosyaUzunluk := FindField('DOSYAUZUNLUK');
  FfDosyaUzunluk.AsInteger := Value;
end;

procedure TTableUretimTahminNot.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableUretimTahminNot.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimTahminNot.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableUretimTahminNot.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableUretimTahminNot.SetGrupKod(const Value: String);
begin
  if FfGrupKod = nil then
    FfGrupKod := FindField('GRUPKOD');
  FfGrupKod.AsString := Value;
end;

procedure TTableUretimTahminNot.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimTahminNot.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimTahminNot.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableUretimTahminNot.SetTahminNo(const Value: String);
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  FfTahminNo.AsString := Value;
end;

{ TTableUretimTahminToplam }

constructor TTableUretimTahminToplam.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTTHT';
end;

procedure TTableUretimTahminToplam.DoAfterOpen;
begin
  if FfTahminKalanKapasite = nil then
    FfTahminKalanKapasite := FindField('_TAHMINKALANKAPASITE');
  if FfTahminKalanMiktar = nil then
    FfTahminKalanMiktar := FindField('_TAHMINKALANMIKTAR');
  if FfBasStokMiktar = nil then
    FfBasStokMiktar := FindField('BASSTOKMIKTAR');
  if FfBitStokMiktar = nil then
    FfBitStokMiktar := FindField('BITSTOKMIKTAR');
  if FfHedefStokMiktar = nil then
    FfHedefStokMiktar := FindField('HEDEFSTOKMIKTAR');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  if FfSatisMiktar = nil then
    FfSatisMiktar := FindField('SATISMIKTAR');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfTahminKapasite = nil then
    FfTahminKapasite := FindField('TAHMINKAPASITE');
  if FfTahminKullanilanKapasite = nil then
    FfTahminKullanilanKapasite := FindField('TAHMINKULLANILANKAPASITE');
  if FfTahminKullanilanMiktar = nil then
    FfTahminKullanilanMiktar := FindField('TAHMINKULLANILANMIKTAR');
  if FfTahminMiktar = nil then
    FfTahminMiktar := FindField('TAHMINMIKTAR');
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  if FfTamKapasite = nil then
    FfTamKapasite := FindField('TAMKAPASITE');
  if FfTamMiktar = nil then
    FfTamMiktar := FindField('TAMMIKTAR');
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('URETIMMIKTAR');
  inherited;
end;

procedure TTableUretimTahminToplam.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfTahminKalanKapasite := nil;
    FfTahminKalanMiktar := nil;
    FfBasStokMiktar := nil;
    FfBitStokMiktar := nil;
    FfHedefStokMiktar := nil;
    FfID := nil;
    FfIsMerkezKod := nil;
    FfSatisMiktar := nil;
    FfSiraNo := nil;
    FfTahminKapasite := nil;
    FfTahminKullanilanKapasite := nil;
    FfTahminKullanilanMiktar := nil;
    FfTahminMiktar := nil;
    FfTahminNo := nil;
    FfTamKapasite := nil;
    FfTamMiktar := nil;
    FfTarih := nil;
    FfUretimMiktar := nil;
  end;
  inherited;
end;

function TTableUretimTahminToplam.GetTahminKalanKapasite: Double;
begin
  if FfTahminKalanKapasite = nil then
    FfTahminKalanKapasite := FindField('_TAHMINKALANKAPASITE');
  Result := FfTahminKalanKapasite.AsFloat;
end;

function TTableUretimTahminToplam.GetTahminKalanMiktar: Double;
begin
  if FfTahminKalanMiktar = nil then
    FfTahminKalanMiktar := FindField('_TAHMINKALANMIKTAR');
  Result := FfTahminKalanMiktar.AsFloat;
end;

function TTableUretimTahminToplam.GetBasStokMiktar: Double;
begin
  if FfBasStokMiktar = nil then
    FfBasStokMiktar := FindField('BASSTOKMIKTAR');
  Result := FfBasStokMiktar.AsFloat;
end;

function TTableUretimTahminToplam.GetBitStokMiktar: Double;
begin
  if FfBitStokMiktar = nil then
    FfBitStokMiktar := FindField('BITSTOKMIKTAR');
  Result := FfBitStokMiktar.AsFloat;
end;

function TTableUretimTahminToplam.GetHedefStokMiktar: Double;
begin
  if FfHedefStokMiktar = nil then
    FfHedefStokMiktar := FindField('HEDEFSTOKMIKTAR');
  Result := FfHedefStokMiktar.AsFloat;
end;

function TTableUretimTahminToplam.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimTahminToplam.GetIsMerkezKod: String;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod.AsString;
end;

function TTableUretimTahminToplam.GetSatisMiktar: Double;
begin
  if FfSatisMiktar = nil then
    FfSatisMiktar := FindField('SATISMIKTAR');
  Result := FfSatisMiktar.AsFloat;
end;

function TTableUretimTahminToplam.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableUretimTahminToplam.GetTahminKapasite: Double;
begin
  if FfTahminKapasite = nil then
    FfTahminKapasite := FindField('TAHMINKAPASITE');
  Result := FfTahminKapasite.AsFloat;
end;

function TTableUretimTahminToplam.GetTahminKullanilanKapasite: Double;
begin
  if FfTahminKullanilanKapasite = nil then
    FfTahminKullanilanKapasite := FindField('TAHMINKULLANILANKAPASITE');
  Result := FfTahminKullanilanKapasite.AsFloat;
end;

function TTableUretimTahminToplam.GetTahminKullanilanMiktar: Double;
begin
  if FfTahminKullanilanMiktar = nil then
    FfTahminKullanilanMiktar := FindField('TAHMINKULLANILANMIKTAR');
  Result := FfTahminKullanilanMiktar.AsFloat;
end;

function TTableUretimTahminToplam.GetTahminMiktar: Double;
begin
  if FfTahminMiktar = nil then
    FfTahminMiktar := FindField('TAHMINMIKTAR');
  Result := FfTahminMiktar.AsFloat;
end;

function TTableUretimTahminToplam.GetTahminNo: String;
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  Result := FfTahminNo.AsString;
end;

function TTableUretimTahminToplam.GetTamKapasite: Double;
begin
  if FfTamKapasite = nil then
    FfTamKapasite := FindField('TAMKAPASITE');
  Result := FfTamKapasite.AsFloat;
end;

function TTableUretimTahminToplam.GetTamMiktar: Double;
begin
  if FfTamMiktar = nil then
    FfTamMiktar := FindField('TAMMIKTAR');
  Result := FfTamMiktar.AsFloat;
end;

function TTableUretimTahminToplam.GetTarih: TDate;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih.AsDateTime;
end;

function TTableUretimTahminToplam.GetUretimMiktar: Double;
begin
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('URETIMMIKTAR');
  Result := FfUretimMiktar.AsFloat;
end;

function TTableUretimTahminToplam.GetfTahminKalanKapasite: TField;
begin
  if FfTahminKalanKapasite = nil then
    FfTahminKalanKapasite := FindField('_TAHMINKALANKAPASITE');
  Result := FfTahminKalanKapasite;
end;

function TTableUretimTahminToplam.GetfTahminKalanMiktar: TField;
begin
  if FfTahminKalanMiktar = nil then
    FfTahminKalanMiktar := FindField('_TAHMINKALANMIKTAR');
  Result := FfTahminKalanMiktar;
end;

function TTableUretimTahminToplam.GetfBasStokMiktar: TField;
begin
  if FfBasStokMiktar = nil then
    FfBasStokMiktar := FindField('BASSTOKMIKTAR');
  Result := FfBasStokMiktar;
end;

function TTableUretimTahminToplam.GetfBitStokMiktar: TField;
begin
  if FfBitStokMiktar = nil then
    FfBitStokMiktar := FindField('BITSTOKMIKTAR');
  Result := FfBitStokMiktar;
end;

function TTableUretimTahminToplam.GetfHedefStokMiktar: TField;
begin
  if FfHedefStokMiktar = nil then
    FfHedefStokMiktar := FindField('HEDEFSTOKMIKTAR');
  Result := FfHedefStokMiktar;
end;

function TTableUretimTahminToplam.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimTahminToplam.GetfIsMerkezKod: TField;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod;
end;

function TTableUretimTahminToplam.GetfSatisMiktar: TField;
begin
  if FfSatisMiktar = nil then
    FfSatisMiktar := FindField('SATISMIKTAR');
  Result := FfSatisMiktar;
end;

function TTableUretimTahminToplam.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableUretimTahminToplam.GetfTahminKapasite: TField;
begin
  if FfTahminKapasite = nil then
    FfTahminKapasite := FindField('TAHMINKAPASITE');
  Result := FfTahminKapasite;
end;

function TTableUretimTahminToplam.GetfTahminKullanilanKapasite: TField;
begin
  if FfTahminKullanilanKapasite = nil then
    FfTahminKullanilanKapasite := FindField('TAHMINKULLANILANKAPASITE');
  Result := FfTahminKullanilanKapasite;
end;

function TTableUretimTahminToplam.GetfTahminKullanilanMiktar: TField;
begin
  if FfTahminKullanilanMiktar = nil then
    FfTahminKullanilanMiktar := FindField('TAHMINKULLANILANMIKTAR');
  Result := FfTahminKullanilanMiktar;
end;

function TTableUretimTahminToplam.GetfTahminMiktar: TField;
begin
  if FfTahminMiktar = nil then
    FfTahminMiktar := FindField('TAHMINMIKTAR');
  Result := FfTahminMiktar;
end;

function TTableUretimTahminToplam.GetfTahminNo: TField;
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  Result := FfTahminNo;
end;

function TTableUretimTahminToplam.GetfTamKapasite: TField;
begin
  if FfTamKapasite = nil then
    FfTamKapasite := FindField('TAMKAPASITE');
  Result := FfTamKapasite;
end;

function TTableUretimTahminToplam.GetfTamMiktar: TField;
begin
  if FfTamMiktar = nil then
    FfTamMiktar := FindField('TAMMIKTAR');
  Result := FfTamMiktar;
end;

function TTableUretimTahminToplam.GetfTarih: TField;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih;
end;

function TTableUretimTahminToplam.GetfUretimMiktar: TField;
begin
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('URETIMMIKTAR');
  Result := FfUretimMiktar;
end;

procedure TTableUretimTahminToplam.SetTahminKalanKapasite(const Value: Double);
begin
  if FfTahminKalanKapasite = nil then
    FfTahminKalanKapasite := FindField('_TAHMINKALANKAPASITE');
  FfTahminKalanKapasite.AsFloat := Value;
end;

procedure TTableUretimTahminToplam.SetTahminKalanMiktar(const Value: Double);
begin
  if FfTahminKalanMiktar = nil then
    FfTahminKalanMiktar := FindField('_TAHMINKALANMIKTAR');
  FfTahminKalanMiktar.AsFloat := Value;
end;

procedure TTableUretimTahminToplam.SetBasStokMiktar(const Value: Double);
begin
  if FfBasStokMiktar = nil then
    FfBasStokMiktar := FindField('BASSTOKMIKTAR');
  FfBasStokMiktar.AsFloat := Value;
end;

procedure TTableUretimTahminToplam.SetBitStokMiktar(const Value: Double);
begin
  if FfBitStokMiktar = nil then
    FfBitStokMiktar := FindField('BITSTOKMIKTAR');
  FfBitStokMiktar.AsFloat := Value;
end;

procedure TTableUretimTahminToplam.SetHedefStokMiktar(const Value: Double);
begin
  if FfHedefStokMiktar = nil then
    FfHedefStokMiktar := FindField('HEDEFSTOKMIKTAR');
  FfHedefStokMiktar.AsFloat := Value;
end;

procedure TTableUretimTahminToplam.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimTahminToplam.SetIsMerkezKod(const Value: String);
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  FfIsMerkezKod.AsString := Value;
end;

procedure TTableUretimTahminToplam.SetSatisMiktar(const Value: Double);
begin
  if FfSatisMiktar = nil then
    FfSatisMiktar := FindField('SATISMIKTAR');
  FfSatisMiktar.AsFloat := Value;
end;

procedure TTableUretimTahminToplam.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableUretimTahminToplam.SetTahminKapasite(const Value: Double);
begin
  if FfTahminKapasite = nil then
    FfTahminKapasite := FindField('TAHMINKAPASITE');
  FfTahminKapasite.AsFloat := Value;
end;

procedure TTableUretimTahminToplam.SetTahminKullanilanKapasite(const Value: Double);
begin
  if FfTahminKullanilanKapasite = nil then
    FfTahminKullanilanKapasite := FindField('TAHMINKULLANILANKAPASITE');
  FfTahminKullanilanKapasite.AsFloat := Value;
end;

procedure TTableUretimTahminToplam.SetTahminKullanilanMiktar(const Value: Double);
begin
  if FfTahminKullanilanMiktar = nil then
    FfTahminKullanilanMiktar := FindField('TAHMINKULLANILANMIKTAR');
  FfTahminKullanilanMiktar.AsFloat := Value;
end;

procedure TTableUretimTahminToplam.SetTahminMiktar(const Value: Double);
begin
  if FfTahminMiktar = nil then
    FfTahminMiktar := FindField('TAHMINMIKTAR');
  FfTahminMiktar.AsFloat := Value;
end;

procedure TTableUretimTahminToplam.SetTahminNo(const Value: String);
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  FfTahminNo.AsString := Value;
end;

procedure TTableUretimTahminToplam.SetTamKapasite(const Value: Double);
begin
  if FfTamKapasite = nil then
    FfTamKapasite := FindField('TAMKAPASITE');
  FfTamKapasite.AsFloat := Value;
end;

procedure TTableUretimTahminToplam.SetTamMiktar(const Value: Double);
begin
  if FfTamMiktar = nil then
    FfTamMiktar := FindField('TAMMIKTAR');
  FfTamMiktar.AsFloat := Value;
end;

procedure TTableUretimTahminToplam.SetTarih(const Value: TDate);
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  FfTarih.AsDateTime := Value;
end;

procedure TTableUretimTahminToplam.SetUretimMiktar(const Value: Double);
begin
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('URETIMMIKTAR');
  FfUretimMiktar.AsFloat := Value;
end;

{ TTableUretimTahminVardiya }

constructor TTableUretimTahminVardiya.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTTHV';
end;

procedure TTableUretimTahminVardiya.DoAfterOpen;
begin
  if FfFazlaMesai = nil then
    FfFazlaMesai := FindField('FAZLAMESAI');
  if FfFazlaMesaiVardiyaKod = nil then
    FfFazlaMesaiVardiyaKod := FindField('FAZLAMESAIVARDIYAKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  inherited;
end;

procedure TTableUretimTahminVardiya.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfFazlaMesai := nil;
    FfFazlaMesaiVardiyaKod := nil;
    FfID := nil;
    FfKaynakKod := nil;
    FfSiraNo := nil;
    FfTahminNo := nil;
    FfTakvimKod := nil;
    FfTarih := nil;
  end;
  inherited;
end;

function TTableUretimTahminVardiya.GetFazlaMesai: Double;
begin
  if FfFazlaMesai = nil then
    FfFazlaMesai := FindField('FAZLAMESAI');
  Result := FfFazlaMesai.AsFloat;
end;

function TTableUretimTahminVardiya.GetFazlaMesaiVardiyaKod: String;
begin
  if FfFazlaMesaiVardiyaKod = nil then
    FfFazlaMesaiVardiyaKod := FindField('FAZLAMESAIVARDIYAKOD');
  Result := FfFazlaMesaiVardiyaKod.AsString;
end;

function TTableUretimTahminVardiya.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimTahminVardiya.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimTahminVardiya.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableUretimTahminVardiya.GetTahminNo: String;
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  Result := FfTahminNo.AsString;
end;

function TTableUretimTahminVardiya.GetTakvimKod: String;
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  Result := FfTakvimKod.AsString;
end;

function TTableUretimTahminVardiya.GetTarih: TDate;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih.AsDateTime;
end;

function TTableUretimTahminVardiya.GetfFazlaMesai: TField;
begin
  if FfFazlaMesai = nil then
    FfFazlaMesai := FindField('FAZLAMESAI');
  Result := FfFazlaMesai;
end;

function TTableUretimTahminVardiya.GetfFazlaMesaiVardiyaKod: TField;
begin
  if FfFazlaMesaiVardiyaKod = nil then
    FfFazlaMesaiVardiyaKod := FindField('FAZLAMESAIVARDIYAKOD');
  Result := FfFazlaMesaiVardiyaKod;
end;

function TTableUretimTahminVardiya.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimTahminVardiya.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimTahminVardiya.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableUretimTahminVardiya.GetfTahminNo: TField;
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  Result := FfTahminNo;
end;

function TTableUretimTahminVardiya.GetfTakvimKod: TField;
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  Result := FfTakvimKod;
end;

function TTableUretimTahminVardiya.GetfTarih: TField;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih;
end;

procedure TTableUretimTahminVardiya.SetFazlaMesai(const Value: Double);
begin
  if FfFazlaMesai = nil then
    FfFazlaMesai := FindField('FAZLAMESAI');
  FfFazlaMesai.AsFloat := Value;
end;

procedure TTableUretimTahminVardiya.SetFazlaMesaiVardiyaKod(const Value: String);
begin
  if FfFazlaMesaiVardiyaKod = nil then
    FfFazlaMesaiVardiyaKod := FindField('FAZLAMESAIVARDIYAKOD');
  FfFazlaMesaiVardiyaKod.AsString := Value;
end;

procedure TTableUretimTahminVardiya.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimTahminVardiya.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimTahminVardiya.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableUretimTahminVardiya.SetTahminNo(const Value: String);
begin
  if FfTahminNo = nil then
    FfTahminNo := FindField('TAHMINNO');
  FfTahminNo.AsString := Value;
end;

procedure TTableUretimTahminVardiya.SetTakvimKod(const Value: String);
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  FfTakvimKod.AsString := Value;
end;

procedure TTableUretimTahminVardiya.SetTarih(const Value: TDate);
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  FfTarih.AsDateTime := Value;
end;

end.

