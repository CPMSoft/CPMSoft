unit CPMApp_TableUretimSystem;

interface

uses Windows, Classes, SysUtils, Controls,
    DB, CPMApp_DataObject, CPMApp_DataObjectModel;

type
  TTableUretimBaglanti = class;    // URTBAG
  TTableUretimBaslik = class;    // URTBAS
  TTableUretimHareket = class;    // URTHAR
  TTableUretimKart = class;    // URTKRT
  TTableUretimKaynakTahsisat = class;    // URTKTH
  TTableUretimRotaKaynakDurus = class;    // URTRKD
  TTableUretimRotaKaynakHata = class;    // URTRKH
  TTableUretimRotaKaynakIslem = class;    // URTRKI
  TTableUretimRotaKaynakOperasyon = class;    // URTRKO
  TTableUretimRotaKaynak = class;    // URTROK
  TTableUretimRota = class;    // URTROT

  TTableUretimBaglanti = class(TAppTable)
  Private
    FfBaglantiEvrakNo: TField;
    FfBaglantiEvrakTip: TField;
    FfBaglantiHesapKod: TField;
    FfBaglantiSiraNo: TField;
    FfEvrakTip: TField;
    FfHesapKod: TField;
    FfID: TField;
    FfKapat: TField;
    FfKaynakEvrakNo: TField;
    FfKaynakEvrakTip: TField;
    FfKaynakHesapKod: TField;
    FfKaynakSiraNo: TField;
    FfKonsolideSirketNo: TField;
    FfMiktar: TField;
    FfRowGuid: TField;
    FfSiraNo: TField;
    FfSirketNo: TField;
    FfUretimNo: TField;
    function GetBaglantiEvrakNo: String;
    function GetBaglantiEvrakTip: Integer;
    function GetBaglantiHesapKod: String;
    function GetBaglantiSiraNo: Integer;
    function GetEvrakTip: Integer;
    function GetHesapKod: String;
    function GetID: Integer;
    function GetKapat: Integer;
    function GetKaynakEvrakNo: String;
    function GetKaynakEvrakTip: Integer;
    function GetKaynakHesapKod: String;
    function GetKaynakSiraNo: Integer;
    function GetKonsolideSirketNo: String;
    function GetMiktar: Double;
    function GetRowGuid: String;
    function GetSiraNo: Integer;
    function GetSirketNo: String;
    function GetUretimNo: String;
    function GetfBaglantiEvrakNo: TField;
    function GetfBaglantiEvrakTip: TField;
    function GetfBaglantiHesapKod: TField;
    function GetfBaglantiSiraNo: TField;
    function GetfEvrakTip: TField;
    function GetfHesapKod: TField;
    function GetfID: TField;
    function GetfKapat: TField;
    function GetfKaynakEvrakNo: TField;
    function GetfKaynakEvrakTip: TField;
    function GetfKaynakHesapKod: TField;
    function GetfKaynakSiraNo: TField;
    function GetfKonsolideSirketNo: TField;
    function GetfMiktar: TField;
    function GetfRowGuid: TField;
    function GetfSiraNo: TField;
    function GetfSirketNo: TField;
    function GetfUretimNo: TField;
    procedure SetBaglantiEvrakNo(const Value: String);
    procedure SetBaglantiEvrakTip(const Value: Integer);
    procedure SetBaglantiHesapKod(const Value: String);
    procedure SetBaglantiSiraNo(const Value: Integer);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetHesapKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetKapat(const Value: Integer);
    procedure SetKaynakEvrakNo(const Value: String);
    procedure SetKaynakEvrakTip(const Value: Integer);
    procedure SetKaynakHesapKod(const Value: String);
    procedure SetKaynakSiraNo(const Value: Integer);
    procedure SetKonsolideSirketNo(const Value: String);
    procedure SetMiktar(const Value: Double);
    procedure SetRowGuid(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSirketNo(const Value: String);
    procedure SetUretimNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property BaglantiEvrakNo: String read GetBaglantiEvrakNo write SetBaglantiEvrakNo;
    property BaglantiEvrakTip: Integer read GetBaglantiEvrakTip write SetBaglantiEvrakTip;
    property BaglantiHesapKod: String read GetBaglantiHesapKod write SetBaglantiHesapKod;
    property BaglantiSiraNo: Integer read GetBaglantiSiraNo write SetBaglantiSiraNo;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property HesapKod: String read GetHesapKod write SetHesapKod;
    property ID: Integer read GetID write SetID;
    property Kapat: Integer read GetKapat write SetKapat;
    property KaynakEvrakNo: String read GetKaynakEvrakNo write SetKaynakEvrakNo;
    property KaynakEvrakTip: Integer read GetKaynakEvrakTip write SetKaynakEvrakTip;
    property KaynakHesapKod: String read GetKaynakHesapKod write SetKaynakHesapKod;
    property KaynakSiraNo: Integer read GetKaynakSiraNo write SetKaynakSiraNo;
    property KonsolideSirketNo: String read GetKonsolideSirketNo write SetKonsolideSirketNo;
    property Miktar: Double read GetMiktar write SetMiktar;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property UretimNo: String read GetUretimNo write SetUretimNo;
    property fBaglantiEvrakNo:TField read GetfBaglantiEvrakNo;
    property fBaglantiEvrakTip:TField read GetfBaglantiEvrakTip;
    property fBaglantiHesapKod:TField read GetfBaglantiHesapKod;
    property fBaglantiSiraNo:TField read GetfBaglantiSiraNo;
    property fEvrakTip:TField read GetfEvrakTip;
    property fHesapKod:TField read GetfHesapKod;
    property fID:TField read GetfID;
    property fKapat:TField read GetfKapat;
    property fKaynakEvrakNo:TField read GetfKaynakEvrakNo;
    property fKaynakEvrakTip:TField read GetfKaynakEvrakTip;
    property fKaynakHesapKod:TField read GetfKaynakHesapKod;
    property fKaynakSiraNo:TField read GetfKaynakSiraNo;
    property fKonsolideSirketNo:TField read GetfKonsolideSirketNo;
    property fMiktar:TField read GetfMiktar;
    property fRowGuid:TField read GetfRowGuid;
    property fSiraNo:TField read GetfSiraNo;
    property fSirketNo:TField read GetfSirketNo;
    property fUretimNo:TField read GetfUretimNo;
  end;

  TTableUretimBaslik = class(TAppTable)
  Private
    FfBanka: TField;
    FfDovizTarih: TField;
    FfDovizTip: TField;
    FfEvrakTarih: TField;
    FfEvrakTip: TField;
    FfFazlaMesaiDakika: TField;
    FfFazlaMesaiVardiyaKod: TField;
    FfFiyatSablonNo: TField;
    FfFiyatSekli: TField;
    FfID: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKullanimSekli: TField;
    FfMaliyetTip: TField;
    FfSeviye: TField;
    FfSirketNo: TField;
    FfTakvimKod: TField;
    FfUretimNo: TField;
    FfUretimTarih: TField;
    function GetBanka: Integer;
    function GetDovizTarih: TDate;
    function GetDovizTip: Integer;
    function GetEvrakTarih: TDate;
    function GetEvrakTip: Integer;
    function GetFazlaMesaiDakika: Integer;
    function GetFazlaMesaiVardiyaKod: String;
    function GetFiyatSablonNo: Integer;
    function GetFiyatSekli: String;
    function GetID: Integer;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKullanimSekli: Integer;
    function GetMaliyetTip: Integer;
    function GetSeviye: Integer;
    function GetSirketNo: String;
    function GetTakvimKod: String;
    function GetUretimNo: String;
    function GetUretimTarih: TDate;
    function GetfBanka: TField;
    function GetfDovizTarih: TField;
    function GetfDovizTip: TField;
    function GetfEvrakTarih: TField;
    function GetfEvrakTip: TField;
    function GetfFazlaMesaiDakika: TField;
    function GetfFazlaMesaiVardiyaKod: TField;
    function GetfFiyatSablonNo: TField;
    function GetfFiyatSekli: TField;
    function GetfID: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKullanimSekli: TField;
    function GetfMaliyetTip: TField;
    function GetfSeviye: TField;
    function GetfSirketNo: TField;
    function GetfTakvimKod: TField;
    function GetfUretimNo: TField;
    function GetfUretimTarih: TField;
    procedure SetBanka(const Value: Integer);
    procedure SetDovizTarih(const Value: TDate);
    procedure SetDovizTip(const Value: Integer);
    procedure SetEvrakTarih(const Value: TDate);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetFazlaMesaiDakika(const Value: Integer);
    procedure SetFazlaMesaiVardiyaKod(const Value: String);
    procedure SetFiyatSablonNo(const Value: Integer);
    procedure SetFiyatSekli(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKullanimSekli(const Value: Integer);
    procedure SetMaliyetTip(const Value: Integer);
    procedure SetSeviye(const Value: Integer);
    procedure SetSirketNo(const Value: String);
    procedure SetTakvimKod(const Value: String);
    procedure SetUretimNo(const Value: String);
    procedure SetUretimTarih(const Value: TDate);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Banka: Integer read GetBanka write SetBanka;
    property DovizTarih: TDate read GetDovizTarih write SetDovizTarih;
    property DovizTip: Integer read GetDovizTip write SetDovizTip;
    property EvrakTarih: TDate read GetEvrakTarih write SetEvrakTarih;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property FazlaMesaiDakika: Integer read GetFazlaMesaiDakika write SetFazlaMesaiDakika;
    property FazlaMesaiVardiyaKod: String read GetFazlaMesaiVardiyaKod write SetFazlaMesaiVardiyaKod;
    property FiyatSablonNo: Integer read GetFiyatSablonNo write SetFiyatSablonNo;
    property FiyatSekli: String read GetFiyatSekli write SetFiyatSekli;
    property ID: Integer read GetID write SetID;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KullanimSekli: Integer read GetKullanimSekli write SetKullanimSekli;
    property MaliyetTip: Integer read GetMaliyetTip write SetMaliyetTip;
    property Seviye: Integer read GetSeviye write SetSeviye;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property TakvimKod: String read GetTakvimKod write SetTakvimKod;
    property UretimNo: String read GetUretimNo write SetUretimNo;
    property UretimTarih: TDate read GetUretimTarih write SetUretimTarih;
    property fBanka:TField read GetfBanka;
    property fDovizTarih:TField read GetfDovizTarih;
    property fDovizTip:TField read GetfDovizTip;
    property fEvrakTarih:TField read GetfEvrakTarih;
    property fEvrakTip:TField read GetfEvrakTip;
    property fFazlaMesaiDakika:TField read GetfFazlaMesaiDakika;
    property fFazlaMesaiVardiyaKod:TField read GetfFazlaMesaiVardiyaKod;
    property fFiyatSablonNo:TField read GetfFiyatSablonNo;
    property fFiyatSekli:TField read GetfFiyatSekli;
    property fID:TField read GetfID;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKullanimSekli:TField read GetfKullanimSekli;
    property fMaliyetTip:TField read GetfMaliyetTip;
    property fSeviye:TField read GetfSeviye;
    property fSirketNo:TField read GetfSirketNo;
    property fTakvimKod:TField read GetfTakvimKod;
    property fUretimNo:TField read GetfUretimNo;
    property fUretimTarih:TField read GetfUretimTarih;
  end;

  TTableUretimHareket = class(TAppTable)
  Private
    FfFiyatMaliyet: TField;
    FfFiyatMaliyetGrup1: TField;
    FfFiyatMaliyetGrup2: TField;
    FfFiyatMaliyetGrup3: TField;
    FfFiyatMaliyetGrup4: TField;
    FfFiyatMaliyetGrupDiger: TField;
    FfMaliyetGrup1: TField;
    FfMaliyetGrup2: TField;
    FfMaliyetGrup3: TField;
    FfMaliyetGrup4: TField;
    FfMaliyetGrupDiger: TField;
    FfAciklama1: TField;
    FfAciklama2: TField;
    FfAciklama3: TField;
    FfAciklama4: TField;
    FfAciklama5: TField;
    FfAnaMamulKod: TField;
    FfAnaSiraNo: TField;
    FfBilesenFireOran: TField;
    FfBirim: TField;
    FfBirimMaliyet: TField;
    FfBirimMaliyet1: TField;
    FfBirimMaliyet1DovizCins: TField;
    FfBirimMaliyet1DovizKur: TField;
    FfBirimMaliyet2: TField;
    FfBirimMaliyet3: TField;
    FfBirimMiktar: TField;
    FfBKod1: TField;
    FfBKod2: TField;
    FfBKod3: TField;
    FfBKod4: TField;
    FfBKod5: TField;
    FfDepoKod: TField;
    FfDovizCins: TField;
    FfEvrakNo: TField;
    FfEvrakTarih: TField;
    FfEvrakTip: TField;
    FfGirisCikis: TField;
    FfHesapKod: TField;
    FfID: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKullanimSekli: TField;
    FfLKod1: TField;
    FfLKod2: TField;
    FfLKod3: TField;
    FfLKod4: TField;
    FfLKod5: TField;
    FfMaliyet: TField;
    FfMaliyet1: TField;
    FfMaliyet2: TField;
    FfMaliyet3: TField;
    FfMalKod: TField;
    FfMamulKod: TField;
    FfMiktar: TField;
    FfMiktarTip: TField;
    FfMKod1: TField;
    FfMKod2: TField;
    FfMKod3: TField;
    FfMKod4: TField;
    FfMKod5: TField;
    FfNKod1: TField;
    FfNKod2: TField;
    FfNKod3: TField;
    FfNKod4: TField;
    FfNKod5: TField;
    FfOperasyonFireKullan: TField;
    FfOperasyonFireMiktar: TField;
    FfOperasyonFireOran: TField;
    FfOperasyonNo: TField;
    FfPozNo: TField;
    FfProjeKod: TField;
    FfReceteNo: TField;
    FfReceteSiraNo: TField;
    FfRevizyonNo: TField;
    FfRowGuid: TField;
    FfSeriNo: TField;
    FfSeriNo2: TField;
    FfSeviyeKod: TField;
    FfSiraNo: TField;
    FfSirketNo: TField;
    FfSKod1: TField;
    FfSKod2: TField;
    FfSKod3: TField;
    FfSKod4: TField;
    FfSKod5: TField;
    FfKullanilabilir: TField;
    FfStokCikis: TField;
    FfStokGiris: TField;
    FfStokMiktar: TField;
    FfMalAd: TField;
    FfSurumNo: TField;
    FfTip: TField;
    FfUretimNo: TField;
    FfUretimSiraNo: TField;
    FfVersiyonNo: TField;
    function GetFiyatMaliyet: Double;
    function GetFiyatMaliyetGrup1: Double;
    function GetFiyatMaliyetGrup2: Double;
    function GetFiyatMaliyetGrup3: Double;
    function GetFiyatMaliyetGrup4: Double;
    function GetFiyatMaliyetGrupDiger: Double;
    function GetMaliyetGrup1: Double;
    function GetMaliyetGrup2: Double;
    function GetMaliyetGrup3: Double;
    function GetMaliyetGrup4: Double;
    function GetMaliyetGrupDiger: Double;
    function GetAciklama1: String;
    function GetAciklama2: String;
    function GetAciklama3: String;
    function GetAciklama4: String;
    function GetAciklama5: String;
    function GetAnaMamulKod: String;
    function GetAnaSiraNo: Integer;
    function GetBilesenFireOran: Double;
    function GetBirim: String;
    function GetBirimMaliyet: Double;
    function GetBirimMaliyet1: Double;
    function GetBirimMaliyet1DovizCins: String;
    function GetBirimMaliyet1DovizKur: Double;
    function GetBirimMaliyet2: Double;
    function GetBirimMaliyet3: Double;
    function GetBirimMiktar: Double;
    function GetBKod1: Integer;
    function GetBKod2: Integer;
    function GetBKod3: Integer;
    function GetBKod4: Integer;
    function GetBKod5: Integer;
    function GetDepoKod: String;
    function GetDovizCins: String;
    function GetEvrakNo: String;
    function GetEvrakTarih: TDate;
    function GetEvrakTip: Integer;
    function GetGirisCikis: Integer;
    function GetHesapKod: String;
    function GetID: Integer;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKullanimSekli: Integer;
    function GetLKod1: String;
    function GetLKod2: String;
    function GetLKod3: String;
    function GetLKod4: String;
    function GetLKod5: String;
    function GetMaliyet: Double;
    function GetMaliyet1: Double;
    function GetMaliyet2: Double;
    function GetMaliyet3: Double;
    function GetMalKod: String;
    function GetMamulKod: String;
    function GetMiktar: Double;
    function GetMiktarTip: Integer;
    function GetMKod1: String;
    function GetMKod2: String;
    function GetMKod3: String;
    function GetMKod4: String;
    function GetMKod5: String;
    function GetNKod1: Double;
    function GetNKod2: Double;
    function GetNKod3: Double;
    function GetNKod4: Double;
    function GetNKod5: Double;
    function GetOperasyonFireKullan: Integer;
    function GetOperasyonFireMiktar: Double;
    function GetOperasyonFireOran: Double;
    function GetOperasyonNo: Integer;
    function GetPozNo: String;
    function GetProjeKod: String;
    function GetReceteNo: String;
    function GetReceteSiraNo: Integer;
    function GetRevizyonNo: String;
    function GetRowGuid: String;
    function GetSeriNo: String;
    function GetSeriNo2: String;
    function GetSeviyeKod: Integer;
    function GetSiraNo: Integer;
    function GetSirketNo: String;
    function GetSKod1: String;
    function GetSKod2: String;
    function GetSKod3: String;
    function GetSKod4: String;
    function GetSKod5: String;
    function GetKullanilabilir: Double;
    function GetStokCikis: Double;
    function GetStokGiris: Double;
    function GetStokMiktar: Double;
    function GetMalAd: String;
    function GetSurumNo: Integer;
    function GetTip: Integer;
    function GetUretimNo: String;
    function GetUretimSiraNo: Integer;
    function GetVersiyonNo: String;
    function GetfFiyatMaliyet: TField;
    function GetfFiyatMaliyetGrup1: TField;
    function GetfFiyatMaliyetGrup2: TField;
    function GetfFiyatMaliyetGrup3: TField;
    function GetfFiyatMaliyetGrup4: TField;
    function GetfFiyatMaliyetGrupDiger: TField;
    function GetfMaliyetGrup1: TField;
    function GetfMaliyetGrup2: TField;
    function GetfMaliyetGrup3: TField;
    function GetfMaliyetGrup4: TField;
    function GetfMaliyetGrupDiger: TField;
    function GetfAciklama1: TField;
    function GetfAciklama2: TField;
    function GetfAciklama3: TField;
    function GetfAciklama4: TField;
    function GetfAciklama5: TField;
    function GetfAnaMamulKod: TField;
    function GetfAnaSiraNo: TField;
    function GetfBilesenFireOran: TField;
    function GetfBirim: TField;
    function GetfBirimMaliyet: TField;
    function GetfBirimMaliyet1: TField;
    function GetfBirimMaliyet1DovizCins: TField;
    function GetfBirimMaliyet1DovizKur: TField;
    function GetfBirimMaliyet2: TField;
    function GetfBirimMaliyet3: TField;
    function GetfBirimMiktar: TField;
    function GetfBKod1: TField;
    function GetfBKod2: TField;
    function GetfBKod3: TField;
    function GetfBKod4: TField;
    function GetfBKod5: TField;
    function GetfDepoKod: TField;
    function GetfDovizCins: TField;
    function GetfEvrakNo: TField;
    function GetfEvrakTarih: TField;
    function GetfEvrakTip: TField;
    function GetfGirisCikis: TField;
    function GetfHesapKod: TField;
    function GetfID: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKullanimSekli: TField;
    function GetfLKod1: TField;
    function GetfLKod2: TField;
    function GetfLKod3: TField;
    function GetfLKod4: TField;
    function GetfLKod5: TField;
    function GetfMaliyet: TField;
    function GetfMaliyet1: TField;
    function GetfMaliyet2: TField;
    function GetfMaliyet3: TField;
    function GetfMalKod: TField;
    function GetfMamulKod: TField;
    function GetfMiktar: TField;
    function GetfMiktarTip: TField;
    function GetfMKod1: TField;
    function GetfMKod2: TField;
    function GetfMKod3: TField;
    function GetfMKod4: TField;
    function GetfMKod5: TField;
    function GetfNKod1: TField;
    function GetfNKod2: TField;
    function GetfNKod3: TField;
    function GetfNKod4: TField;
    function GetfNKod5: TField;
    function GetfOperasyonFireKullan: TField;
    function GetfOperasyonFireMiktar: TField;
    function GetfOperasyonFireOran: TField;
    function GetfOperasyonNo: TField;
    function GetfPozNo: TField;
    function GetfProjeKod: TField;
    function GetfReceteNo: TField;
    function GetfReceteSiraNo: TField;
    function GetfRevizyonNo: TField;
    function GetfRowGuid: TField;
    function GetfSeriNo: TField;
    function GetfSeriNo2: TField;
    function GetfSeviyeKod: TField;
    function GetfSiraNo: TField;
    function GetfSirketNo: TField;
    function GetfSKod1: TField;
    function GetfSKod2: TField;
    function GetfSKod3: TField;
    function GetfSKod4: TField;
    function GetfSKod5: TField;
    function GetfKullanilabilir: TField;
    function GetfStokCikis: TField;
    function GetfStokGiris: TField;
    function GetfStokMiktar: TField;
    function GetfMalAd: TField;
    function GetfSurumNo: TField;
    function GetfTip: TField;
    function GetfUretimNo: TField;
    function GetfUretimSiraNo: TField;
    function GetfVersiyonNo: TField;
    procedure SetFiyatMaliyet(const Value: Double);
    procedure SetFiyatMaliyetGrup1(const Value: Double);
    procedure SetFiyatMaliyetGrup2(const Value: Double);
    procedure SetFiyatMaliyetGrup3(const Value: Double);
    procedure SetFiyatMaliyetGrup4(const Value: Double);
    procedure SetFiyatMaliyetGrupDiger(const Value: Double);
    procedure SetMaliyetGrup1(const Value: Double);
    procedure SetMaliyetGrup2(const Value: Double);
    procedure SetMaliyetGrup3(const Value: Double);
    procedure SetMaliyetGrup4(const Value: Double);
    procedure SetMaliyetGrupDiger(const Value: Double);
    procedure SetAciklama1(const Value: String);
    procedure SetAciklama2(const Value: String);
    procedure SetAciklama3(const Value: String);
    procedure SetAciklama4(const Value: String);
    procedure SetAciklama5(const Value: String);
    procedure SetAnaMamulKod(const Value: String);
    procedure SetAnaSiraNo(const Value: Integer);
    procedure SetBilesenFireOran(const Value: Double);
    procedure SetBirim(const Value: String);
    procedure SetBirimMaliyet(const Value: Double);
    procedure SetBirimMaliyet1(const Value: Double);
    procedure SetBirimMaliyet1DovizCins(const Value: String);
    procedure SetBirimMaliyet1DovizKur(const Value: Double);
    procedure SetBirimMaliyet2(const Value: Double);
    procedure SetBirimMaliyet3(const Value: Double);
    procedure SetBirimMiktar(const Value: Double);
    procedure SetBKod1(const Value: Integer);
    procedure SetBKod2(const Value: Integer);
    procedure SetBKod3(const Value: Integer);
    procedure SetBKod4(const Value: Integer);
    procedure SetBKod5(const Value: Integer);
    procedure SetDepoKod(const Value: String);
    procedure SetDovizCins(const Value: String);
    procedure SetEvrakNo(const Value: String);
    procedure SetEvrakTarih(const Value: TDate);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetGirisCikis(const Value: Integer);
    procedure SetHesapKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKullanimSekli(const Value: Integer);
    procedure SetLKod1(const Value: String);
    procedure SetLKod2(const Value: String);
    procedure SetLKod3(const Value: String);
    procedure SetLKod4(const Value: String);
    procedure SetLKod5(const Value: String);
    procedure SetMaliyet(const Value: Double);
    procedure SetMaliyet1(const Value: Double);
    procedure SetMaliyet2(const Value: Double);
    procedure SetMaliyet3(const Value: Double);
    procedure SetMalKod(const Value: String);
    procedure SetMamulKod(const Value: String);
    procedure SetMiktar(const Value: Double);
    procedure SetMiktarTip(const Value: Integer);
    procedure SetMKod1(const Value: String);
    procedure SetMKod2(const Value: String);
    procedure SetMKod3(const Value: String);
    procedure SetMKod4(const Value: String);
    procedure SetMKod5(const Value: String);
    procedure SetNKod1(const Value: Double);
    procedure SetNKod2(const Value: Double);
    procedure SetNKod3(const Value: Double);
    procedure SetNKod4(const Value: Double);
    procedure SetNKod5(const Value: Double);
    procedure SetOperasyonFireKullan(const Value: Integer);
    procedure SetOperasyonFireMiktar(const Value: Double);
    procedure SetOperasyonFireOran(const Value: Double);
    procedure SetOperasyonNo(const Value: Integer);
    procedure SetPozNo(const Value: String);
    procedure SetProjeKod(const Value: String);
    procedure SetReceteNo(const Value: String);
    procedure SetReceteSiraNo(const Value: Integer);
    procedure SetRevizyonNo(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSeriNo(const Value: String);
    procedure SetSeriNo2(const Value: String);
    procedure SetSeviyeKod(const Value: Integer);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSirketNo(const Value: String);
    procedure SetSKod1(const Value: String);
    procedure SetSKod2(const Value: String);
    procedure SetSKod3(const Value: String);
    procedure SetSKod4(const Value: String);
    procedure SetSKod5(const Value: String);
    procedure SetKullanilabilir(const Value: Double);
    procedure SetStokCikis(const Value: Double);
    procedure SetStokGiris(const Value: Double);
    procedure SetStokMiktar(const Value: Double);
    procedure SetMalAd(const Value: String);
    procedure SetSurumNo(const Value: Integer);
    procedure SetTip(const Value: Integer);
    procedure SetUretimNo(const Value: String);
    procedure SetUretimSiraNo(const Value: Integer);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property FiyatMaliyet: Double read GetFiyatMaliyet write SetFiyatMaliyet;
    property FiyatMaliyetGrup1: Double read GetFiyatMaliyetGrup1 write SetFiyatMaliyetGrup1;
    property FiyatMaliyetGrup2: Double read GetFiyatMaliyetGrup2 write SetFiyatMaliyetGrup2;
    property FiyatMaliyetGrup3: Double read GetFiyatMaliyetGrup3 write SetFiyatMaliyetGrup3;
    property FiyatMaliyetGrup4: Double read GetFiyatMaliyetGrup4 write SetFiyatMaliyetGrup4;
    property FiyatMaliyetGrupDiger: Double read GetFiyatMaliyetGrupDiger write SetFiyatMaliyetGrupDiger;
    property MaliyetGrup1: Double read GetMaliyetGrup1 write SetMaliyetGrup1;
    property MaliyetGrup2: Double read GetMaliyetGrup2 write SetMaliyetGrup2;
    property MaliyetGrup3: Double read GetMaliyetGrup3 write SetMaliyetGrup3;
    property MaliyetGrup4: Double read GetMaliyetGrup4 write SetMaliyetGrup4;
    property MaliyetGrupDiger: Double read GetMaliyetGrupDiger write SetMaliyetGrupDiger;
    property Aciklama1: String read GetAciklama1 write SetAciklama1;
    property Aciklama2: String read GetAciklama2 write SetAciklama2;
    property Aciklama3: String read GetAciklama3 write SetAciklama3;
    property Aciklama4: String read GetAciklama4 write SetAciklama4;
    property Aciklama5: String read GetAciklama5 write SetAciklama5;
    property AnaMamulKod: String read GetAnaMamulKod write SetAnaMamulKod;
    property AnaSiraNo: Integer read GetAnaSiraNo write SetAnaSiraNo;
    property BilesenFireOran: Double read GetBilesenFireOran write SetBilesenFireOran;
    property Birim: String read GetBirim write SetBirim;
    property BirimMaliyet: Double read GetBirimMaliyet write SetBirimMaliyet;
    property BirimMaliyet1: Double read GetBirimMaliyet1 write SetBirimMaliyet1;
    property BirimMaliyet1DovizCins: String read GetBirimMaliyet1DovizCins write SetBirimMaliyet1DovizCins;
    property BirimMaliyet1DovizKur: Double read GetBirimMaliyet1DovizKur write SetBirimMaliyet1DovizKur;
    property BirimMaliyet2: Double read GetBirimMaliyet2 write SetBirimMaliyet2;
    property BirimMaliyet3: Double read GetBirimMaliyet3 write SetBirimMaliyet3;
    property BirimMiktar: Double read GetBirimMiktar write SetBirimMiktar;
    property BKod1: Integer read GetBKod1 write SetBKod1;
    property BKod2: Integer read GetBKod2 write SetBKod2;
    property BKod3: Integer read GetBKod3 write SetBKod3;
    property BKod4: Integer read GetBKod4 write SetBKod4;
    property BKod5: Integer read GetBKod5 write SetBKod5;
    property DepoKod: String read GetDepoKod write SetDepoKod;
    property DovizCins: String read GetDovizCins write SetDovizCins;
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property EvrakTarih: TDate read GetEvrakTarih write SetEvrakTarih;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property GirisCikis: Integer read GetGirisCikis write SetGirisCikis;
    property HesapKod: String read GetHesapKod write SetHesapKod;
    property ID: Integer read GetID write SetID;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KullanimSekli: Integer read GetKullanimSekli write SetKullanimSekli;
    property LKod1: String read GetLKod1 write SetLKod1;
    property LKod2: String read GetLKod2 write SetLKod2;
    property LKod3: String read GetLKod3 write SetLKod3;
    property LKod4: String read GetLKod4 write SetLKod4;
    property LKod5: String read GetLKod5 write SetLKod5;
    property Maliyet: Double read GetMaliyet write SetMaliyet;
    property Maliyet1: Double read GetMaliyet1 write SetMaliyet1;
    property Maliyet2: Double read GetMaliyet2 write SetMaliyet2;
    property Maliyet3: Double read GetMaliyet3 write SetMaliyet3;
    property MalKod: String read GetMalKod write SetMalKod;
    property MamulKod: String read GetMamulKod write SetMamulKod;
    property Miktar: Double read GetMiktar write SetMiktar;
    property MiktarTip: Integer read GetMiktarTip write SetMiktarTip;
    property MKod1: String read GetMKod1 write SetMKod1;
    property MKod2: String read GetMKod2 write SetMKod2;
    property MKod3: String read GetMKod3 write SetMKod3;
    property MKod4: String read GetMKod4 write SetMKod4;
    property MKod5: String read GetMKod5 write SetMKod5;
    property NKod1: Double read GetNKod1 write SetNKod1;
    property NKod2: Double read GetNKod2 write SetNKod2;
    property NKod3: Double read GetNKod3 write SetNKod3;
    property NKod4: Double read GetNKod4 write SetNKod4;
    property NKod5: Double read GetNKod5 write SetNKod5;
    property OperasyonFireKullan: Integer read GetOperasyonFireKullan write SetOperasyonFireKullan;
    property OperasyonFireMiktar: Double read GetOperasyonFireMiktar write SetOperasyonFireMiktar;
    property OperasyonFireOran: Double read GetOperasyonFireOran write SetOperasyonFireOran;
    property OperasyonNo: Integer read GetOperasyonNo write SetOperasyonNo;
    property PozNo: String read GetPozNo write SetPozNo;
    property ProjeKod: String read GetProjeKod write SetProjeKod;
    property ReceteNo: String read GetReceteNo write SetReceteNo;
    property ReceteSiraNo: Integer read GetReceteSiraNo write SetReceteSiraNo;
    property RevizyonNo: String read GetRevizyonNo write SetRevizyonNo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SeriNo: String read GetSeriNo write SetSeriNo;
    property SeriNo2: String read GetSeriNo2 write SetSeriNo2;
    property SeviyeKod: Integer read GetSeviyeKod write SetSeviyeKod;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property SKod1: String read GetSKod1 write SetSKod1;
    property SKod2: String read GetSKod2 write SetSKod2;
    property SKod3: String read GetSKod3 write SetSKod3;
    property SKod4: String read GetSKod4 write SetSKod4;
    property SKod5: String read GetSKod5 write SetSKod5;
    property Kullanilabilir: Double read GetKullanilabilir write SetKullanilabilir;
    property StokCikis: Double read GetStokCikis write SetStokCikis;
    property StokGiris: Double read GetStokGiris write SetStokGiris;
    property StokMiktar: Double read GetStokMiktar write SetStokMiktar;
    property MalAd: String read GetMalAd write SetMalAd;
    property SurumNo: Integer read GetSurumNo write SetSurumNo;
    property Tip: Integer read GetTip write SetTip;
    property UretimNo: String read GetUretimNo write SetUretimNo;
    property UretimSiraNo: Integer read GetUretimSiraNo write SetUretimSiraNo;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fFiyatMaliyet:TField read GetfFiyatMaliyet;
    property fFiyatMaliyetGrup1:TField read GetfFiyatMaliyetGrup1;
    property fFiyatMaliyetGrup2:TField read GetfFiyatMaliyetGrup2;
    property fFiyatMaliyetGrup3:TField read GetfFiyatMaliyetGrup3;
    property fFiyatMaliyetGrup4:TField read GetfFiyatMaliyetGrup4;
    property fFiyatMaliyetGrupDiger:TField read GetfFiyatMaliyetGrupDiger;
    property fMaliyetGrup1:TField read GetfMaliyetGrup1;
    property fMaliyetGrup2:TField read GetfMaliyetGrup2;
    property fMaliyetGrup3:TField read GetfMaliyetGrup3;
    property fMaliyetGrup4:TField read GetfMaliyetGrup4;
    property fMaliyetGrupDiger:TField read GetfMaliyetGrupDiger;
    property fAciklama1:TField read GetfAciklama1;
    property fAciklama2:TField read GetfAciklama2;
    property fAciklama3:TField read GetfAciklama3;
    property fAciklama4:TField read GetfAciklama4;
    property fAciklama5:TField read GetfAciklama5;
    property fAnaMamulKod:TField read GetfAnaMamulKod;
    property fAnaSiraNo:TField read GetfAnaSiraNo;
    property fBilesenFireOran:TField read GetfBilesenFireOran;
    property fBirim:TField read GetfBirim;
    property fBirimMaliyet:TField read GetfBirimMaliyet;
    property fBirimMaliyet1:TField read GetfBirimMaliyet1;
    property fBirimMaliyet1DovizCins:TField read GetfBirimMaliyet1DovizCins;
    property fBirimMaliyet1DovizKur:TField read GetfBirimMaliyet1DovizKur;
    property fBirimMaliyet2:TField read GetfBirimMaliyet2;
    property fBirimMaliyet3:TField read GetfBirimMaliyet3;
    property fBirimMiktar:TField read GetfBirimMiktar;
    property fBKod1:TField read GetfBKod1;
    property fBKod2:TField read GetfBKod2;
    property fBKod3:TField read GetfBKod3;
    property fBKod4:TField read GetfBKod4;
    property fBKod5:TField read GetfBKod5;
    property fDepoKod:TField read GetfDepoKod;
    property fDovizCins:TField read GetfDovizCins;
    property fEvrakNo:TField read GetfEvrakNo;
    property fEvrakTarih:TField read GetfEvrakTarih;
    property fEvrakTip:TField read GetfEvrakTip;
    property fGirisCikis:TField read GetfGirisCikis;
    property fHesapKod:TField read GetfHesapKod;
    property fID:TField read GetfID;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKullanimSekli:TField read GetfKullanimSekli;
    property fLKod1:TField read GetfLKod1;
    property fLKod2:TField read GetfLKod2;
    property fLKod3:TField read GetfLKod3;
    property fLKod4:TField read GetfLKod4;
    property fLKod5:TField read GetfLKod5;
    property fMaliyet:TField read GetfMaliyet;
    property fMaliyet1:TField read GetfMaliyet1;
    property fMaliyet2:TField read GetfMaliyet2;
    property fMaliyet3:TField read GetfMaliyet3;
    property fMalKod:TField read GetfMalKod;
    property fMamulKod:TField read GetfMamulKod;
    property fMiktar:TField read GetfMiktar;
    property fMiktarTip:TField read GetfMiktarTip;
    property fMKod1:TField read GetfMKod1;
    property fMKod2:TField read GetfMKod2;
    property fMKod3:TField read GetfMKod3;
    property fMKod4:TField read GetfMKod4;
    property fMKod5:TField read GetfMKod5;
    property fNKod1:TField read GetfNKod1;
    property fNKod2:TField read GetfNKod2;
    property fNKod3:TField read GetfNKod3;
    property fNKod4:TField read GetfNKod4;
    property fNKod5:TField read GetfNKod5;
    property fOperasyonFireKullan:TField read GetfOperasyonFireKullan;
    property fOperasyonFireMiktar:TField read GetfOperasyonFireMiktar;
    property fOperasyonFireOran:TField read GetfOperasyonFireOran;
    property fOperasyonNo:TField read GetfOperasyonNo;
    property fPozNo:TField read GetfPozNo;
    property fProjeKod:TField read GetfProjeKod;
    property fReceteNo:TField read GetfReceteNo;
    property fReceteSiraNo:TField read GetfReceteSiraNo;
    property fRevizyonNo:TField read GetfRevizyonNo;
    property fRowGuid:TField read GetfRowGuid;
    property fSeriNo:TField read GetfSeriNo;
    property fSeriNo2:TField read GetfSeriNo2;
    property fSeviyeKod:TField read GetfSeviyeKod;
    property fSiraNo:TField read GetfSiraNo;
    property fSirketNo:TField read GetfSirketNo;
    property fSKod1:TField read GetfSKod1;
    property fSKod2:TField read GetfSKod2;
    property fSKod3:TField read GetfSKod3;
    property fSKod4:TField read GetfSKod4;
    property fSKod5:TField read GetfSKod5;
    property fKullanilabilir:TField read GetfKullanilabilir;
    property fStokCikis:TField read GetfStokCikis;
    property fStokGiris:TField read GetfStokGiris;
    property fStokMiktar:TField read GetfStokMiktar;
    property fMalAd:TField read GetfMalAd;
    property fSurumNo:TField read GetfSurumNo;
    property fTip:TField read GetfTip;
    property fUretimNo:TField read GetfUretimNo;
    property fUretimSiraNo:TField read GetfUretimSiraNo;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableUretimKart = class(TAppTable)
  Private
    FfAciklama1: TField;
    FfAciklama2: TField;
    FfAciklama3: TField;
    FfAciklama4: TField;
    FfAciklama5: TField;
    FfBasTarih: TField;
    FfBasTarihSaat: TField;
    FfBitTarih: TField;
    FfBitTarihSaat: TField;
    FfBKod1: TField;
    FfBKod2: TField;
    FfBKod3: TField;
    FfBKod4: TField;
    FfBKod5: TField;
    FfEvrakNo: TField;
    FfEvrakTarih: TField;
    FfEvrakTip: TField;
    FfHammaddeDepokod: TField;
    FfHesapKod: TField;
    FfID: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKaynakEvrakNo: TField;
    FfKaynakEvrakTip: TField;
    FfKaynakHesapKod: TField;
    FfKaynakSiraNo: TField;
    FfLKod1: TField;
    FfLKod2: TField;
    FfLKod3: TField;
    FfLKod4: TField;
    FfLKod5: TField;
    FfMaliyetTip: TField;
    FfMamulDepokod: TField;
    FfMamulKod: TField;
    FfMamulSeriNo: TField;
    FfMamulSeriNo2: TField;
    FfMiktar: TField;
    FfMKod1: TField;
    FfMKod2: TField;
    FfMKod3: TField;
    FfMKod4: TField;
    FfMKod5: TField;
    FfNKod1: TField;
    FfNKod2: TField;
    FfNKod3: TField;
    FfNKod4: TField;
    FfNKod5: TField;
    FfOpBasTarih: TField;
    FfOpBasTarihSaat: TField;
    FfOpBitTarih: TField;
    FfOpBitTarihSaat: TField;
    FfOpDurum: TField;
    FfOpFireMiktar: TField;
    FfOpMiktar: TField;
    FfOpSure: TField;
    FfProjeKod: TField;
    FfRezervasyonDurum: TField;
    FfRowGuid: TField;
    FfSiraNo: TField;
    FfSirketNo: TField;
    FfSKod1: TField;
    FfSKod2: TField;
    FfSKod3: TField;
    FfSKod4: TField;
    FfSKod5: TField;
    FfKullanilabilir: TField;
    FfStokCikis: TField;
    FfStokGiris: TField;
    FfStokMiktar: TField;
    FfDovizCins: TField;
    FfMamulAd: TField;
    FfMaliyet1: TField;
    FfMaliyet2: TField;
    FfMaliyet3: TField;
    FfSure: TField;
    FfSurumNo: TField;
    FfUretimBasTarih: TField;
    FfUretimBitTarih: TField;
    FfUretimDurum: TField;
    FfUretimNo: TField;
    FfUretimPlanTarih: TField;
    FfUretimTarih: TField;
    FfVersiyonNo: TField;
    function GetAciklama1: String;
    function GetAciklama2: String;
    function GetAciklama3: String;
    function GetAciklama4: String;
    function GetAciklama5: String;
    function GetBasTarih: TDate;
    function GetBasTarihSaat: TDate;
    function GetBitTarih: TDate;
    function GetBitTarihSaat: TDate;
    function GetBKod1: Integer;
    function GetBKod2: Integer;
    function GetBKod3: Integer;
    function GetBKod4: Integer;
    function GetBKod5: Integer;
    function GetEvrakNo: String;
    function GetEvrakTarih: TDate;
    function GetEvrakTip: Integer;
    function GetHammaddeDepokod: String;
    function GetHesapKod: String;
    function GetID: Integer;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKaynakEvrakNo: String;
    function GetKaynakEvrakTip: Integer;
    function GetKaynakHesapKod: String;
    function GetKaynakSiraNo: Integer;
    function GetLKod1: String;
    function GetLKod2: String;
    function GetLKod3: String;
    function GetLKod4: String;
    function GetLKod5: String;
    function GetMaliyetTip: Integer;
    function GetMamulDepokod: String;
    function GetMamulKod: String;
    function GetMamulSeriNo: String;
    function GetMamulSeriNo2: String;
    function GetMiktar: Double;
    function GetMKod1: String;
    function GetMKod2: String;
    function GetMKod3: String;
    function GetMKod4: String;
    function GetMKod5: String;
    function GetNKod1: Double;
    function GetNKod2: Double;
    function GetNKod3: Double;
    function GetNKod4: Double;
    function GetNKod5: Double;
    function GetOpBasTarih: TDate;
    function GetOpBasTarihSaat: TDate;
    function GetOpBitTarih: TDate;
    function GetOpBitTarihSaat: TDate;
    function GetOpDurum: Integer;
    function GetOpFireMiktar: Double;
    function GetOpMiktar: Double;
    function GetOpSure: Double;
    function GetProjeKod: String;
    function GetRezervasyonDurum: Integer;
    function GetRowGuid: String;
    function GetSiraNo: Integer;
    function GetSirketNo: String;
    function GetSKod1: String;
    function GetSKod2: String;
    function GetSKod3: String;
    function GetSKod4: String;
    function GetSKod5: String;
    function GetKullanilabilir: Double;
    function GetStokCikis: Double;
    function GetStokGiris: Double;
    function GetStokMiktar: Double;
    function GetDovizCins: String;
    function GetMamulAd: String;
    function GetMaliyet1: Double;
    function GetMaliyet2: Double;
    function GetMaliyet3: Double;
    function GetSure: Double;
    function GetSurumNo: Integer;
    function GetUretimBasTarih: TDate;
    function GetUretimBitTarih: TDate;
    function GetUretimDurum: Integer;
    function GetUretimNo: String;
    function GetUretimPlanTarih: TDate;
    function GetUretimTarih: TDate;
    function GetVersiyonNo: String;
    function GetfAciklama1: TField;
    function GetfAciklama2: TField;
    function GetfAciklama3: TField;
    function GetfAciklama4: TField;
    function GetfAciklama5: TField;
    function GetfBasTarih: TField;
    function GetfBasTarihSaat: TField;
    function GetfBitTarih: TField;
    function GetfBitTarihSaat: TField;
    function GetfBKod1: TField;
    function GetfBKod2: TField;
    function GetfBKod3: TField;
    function GetfBKod4: TField;
    function GetfBKod5: TField;
    function GetfEvrakNo: TField;
    function GetfEvrakTarih: TField;
    function GetfEvrakTip: TField;
    function GetfHammaddeDepokod: TField;
    function GetfHesapKod: TField;
    function GetfID: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKaynakEvrakNo: TField;
    function GetfKaynakEvrakTip: TField;
    function GetfKaynakHesapKod: TField;
    function GetfKaynakSiraNo: TField;
    function GetfLKod1: TField;
    function GetfLKod2: TField;
    function GetfLKod3: TField;
    function GetfLKod4: TField;
    function GetfLKod5: TField;
    function GetfMaliyetTip: TField;
    function GetfMamulDepokod: TField;
    function GetfMamulKod: TField;
    function GetfMamulSeriNo: TField;
    function GetfMamulSeriNo2: TField;
    function GetfMiktar: TField;
    function GetfMKod1: TField;
    function GetfMKod2: TField;
    function GetfMKod3: TField;
    function GetfMKod4: TField;
    function GetfMKod5: TField;
    function GetfNKod1: TField;
    function GetfNKod2: TField;
    function GetfNKod3: TField;
    function GetfNKod4: TField;
    function GetfNKod5: TField;
    function GetfOpBasTarih: TField;
    function GetfOpBasTarihSaat: TField;
    function GetfOpBitTarih: TField;
    function GetfOpBitTarihSaat: TField;
    function GetfOpDurum: TField;
    function GetfOpFireMiktar: TField;
    function GetfOpMiktar: TField;
    function GetfOpSure: TField;
    function GetfProjeKod: TField;
    function GetfRezervasyonDurum: TField;
    function GetfRowGuid: TField;
    function GetfSiraNo: TField;
    function GetfSirketNo: TField;
    function GetfSKod1: TField;
    function GetfSKod2: TField;
    function GetfSKod3: TField;
    function GetfSKod4: TField;
    function GetfSKod5: TField;
    function GetfKullanilabilir: TField;
    function GetfStokCikis: TField;
    function GetfStokGiris: TField;
    function GetfStokMiktar: TField;
    function GetfDovizCins: TField;
    function GetfMamulAd: TField;
    function GetfMaliyet1: TField;
    function GetfMaliyet2: TField;
    function GetfMaliyet3: TField;
    function GetfSure: TField;
    function GetfSurumNo: TField;
    function GetfUretimBasTarih: TField;
    function GetfUretimBitTarih: TField;
    function GetfUretimDurum: TField;
    function GetfUretimNo: TField;
    function GetfUretimPlanTarih: TField;
    function GetfUretimTarih: TField;
    function GetfVersiyonNo: TField;
    procedure SetAciklama1(const Value: String);
    procedure SetAciklama2(const Value: String);
    procedure SetAciklama3(const Value: String);
    procedure SetAciklama4(const Value: String);
    procedure SetAciklama5(const Value: String);
    procedure SetBasTarih(const Value: TDate);
    procedure SetBasTarihSaat(const Value: TDate);
    procedure SetBitTarih(const Value: TDate);
    procedure SetBitTarihSaat(const Value: TDate);
    procedure SetBKod1(const Value: Integer);
    procedure SetBKod2(const Value: Integer);
    procedure SetBKod3(const Value: Integer);
    procedure SetBKod4(const Value: Integer);
    procedure SetBKod5(const Value: Integer);
    procedure SetEvrakNo(const Value: String);
    procedure SetEvrakTarih(const Value: TDate);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetHammaddeDepokod(const Value: String);
    procedure SetHesapKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakEvrakNo(const Value: String);
    procedure SetKaynakEvrakTip(const Value: Integer);
    procedure SetKaynakHesapKod(const Value: String);
    procedure SetKaynakSiraNo(const Value: Integer);
    procedure SetLKod1(const Value: String);
    procedure SetLKod2(const Value: String);
    procedure SetLKod3(const Value: String);
    procedure SetLKod4(const Value: String);
    procedure SetLKod5(const Value: String);
    procedure SetMaliyetTip(const Value: Integer);
    procedure SetMamulDepokod(const Value: String);
    procedure SetMamulKod(const Value: String);
    procedure SetMamulSeriNo(const Value: String);
    procedure SetMamulSeriNo2(const Value: String);
    procedure SetMiktar(const Value: Double);
    procedure SetMKod1(const Value: String);
    procedure SetMKod2(const Value: String);
    procedure SetMKod3(const Value: String);
    procedure SetMKod4(const Value: String);
    procedure SetMKod5(const Value: String);
    procedure SetNKod1(const Value: Double);
    procedure SetNKod2(const Value: Double);
    procedure SetNKod3(const Value: Double);
    procedure SetNKod4(const Value: Double);
    procedure SetNKod5(const Value: Double);
    procedure SetOpBasTarih(const Value: TDate);
    procedure SetOpBasTarihSaat(const Value: TDate);
    procedure SetOpBitTarih(const Value: TDate);
    procedure SetOpBitTarihSaat(const Value: TDate);
    procedure SetOpDurum(const Value: Integer);
    procedure SetOpFireMiktar(const Value: Double);
    procedure SetOpMiktar(const Value: Double);
    procedure SetOpSure(const Value: Double);
    procedure SetProjeKod(const Value: String);
    procedure SetRezervasyonDurum(const Value: Integer);
    procedure SetRowGuid(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSirketNo(const Value: String);
    procedure SetSKod1(const Value: String);
    procedure SetSKod2(const Value: String);
    procedure SetSKod3(const Value: String);
    procedure SetSKod4(const Value: String);
    procedure SetSKod5(const Value: String);
    procedure SetKullanilabilir(const Value: Double);
    procedure SetStokCikis(const Value: Double);
    procedure SetStokGiris(const Value: Double);
    procedure SetStokMiktar(const Value: Double);
    procedure SetDovizCins(const Value: String);
    procedure SetMamulAd(const Value: String);
    procedure SetMaliyet1(const Value: Double);
    procedure SetMaliyet2(const Value: Double);
    procedure SetMaliyet3(const Value: Double);
    procedure SetSure(const Value: Double);
    procedure SetSurumNo(const Value: Integer);
    procedure SetUretimBasTarih(const Value: TDate);
    procedure SetUretimBitTarih(const Value: TDate);
    procedure SetUretimDurum(const Value: Integer);
    procedure SetUretimNo(const Value: String);
    procedure SetUretimPlanTarih(const Value: TDate);
    procedure SetUretimTarih(const Value: TDate);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama1: String read GetAciklama1 write SetAciklama1;
    property Aciklama2: String read GetAciklama2 write SetAciklama2;
    property Aciklama3: String read GetAciklama3 write SetAciklama3;
    property Aciklama4: String read GetAciklama4 write SetAciklama4;
    property Aciklama5: String read GetAciklama5 write SetAciklama5;
    property BasTarih: TDate read GetBasTarih write SetBasTarih;
    property BasTarihSaat: TDate read GetBasTarihSaat write SetBasTarihSaat;
    property BitTarih: TDate read GetBitTarih write SetBitTarih;
    property BitTarihSaat: TDate read GetBitTarihSaat write SetBitTarihSaat;
    property BKod1: Integer read GetBKod1 write SetBKod1;
    property BKod2: Integer read GetBKod2 write SetBKod2;
    property BKod3: Integer read GetBKod3 write SetBKod3;
    property BKod4: Integer read GetBKod4 write SetBKod4;
    property BKod5: Integer read GetBKod5 write SetBKod5;
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property EvrakTarih: TDate read GetEvrakTarih write SetEvrakTarih;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property HammaddeDepokod: String read GetHammaddeDepokod write SetHammaddeDepokod;
    property HesapKod: String read GetHesapKod write SetHesapKod;
    property ID: Integer read GetID write SetID;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakEvrakNo: String read GetKaynakEvrakNo write SetKaynakEvrakNo;
    property KaynakEvrakTip: Integer read GetKaynakEvrakTip write SetKaynakEvrakTip;
    property KaynakHesapKod: String read GetKaynakHesapKod write SetKaynakHesapKod;
    property KaynakSiraNo: Integer read GetKaynakSiraNo write SetKaynakSiraNo;
    property LKod1: String read GetLKod1 write SetLKod1;
    property LKod2: String read GetLKod2 write SetLKod2;
    property LKod3: String read GetLKod3 write SetLKod3;
    property LKod4: String read GetLKod4 write SetLKod4;
    property LKod5: String read GetLKod5 write SetLKod5;
    property MaliyetTip: Integer read GetMaliyetTip write SetMaliyetTip;
    property MamulDepokod: String read GetMamulDepokod write SetMamulDepokod;
    property MamulKod: String read GetMamulKod write SetMamulKod;
    property MamulSeriNo: String read GetMamulSeriNo write SetMamulSeriNo;
    property MamulSeriNo2: String read GetMamulSeriNo2 write SetMamulSeriNo2;
    property Miktar: Double read GetMiktar write SetMiktar;
    property MKod1: String read GetMKod1 write SetMKod1;
    property MKod2: String read GetMKod2 write SetMKod2;
    property MKod3: String read GetMKod3 write SetMKod3;
    property MKod4: String read GetMKod4 write SetMKod4;
    property MKod5: String read GetMKod5 write SetMKod5;
    property NKod1: Double read GetNKod1 write SetNKod1;
    property NKod2: Double read GetNKod2 write SetNKod2;
    property NKod3: Double read GetNKod3 write SetNKod3;
    property NKod4: Double read GetNKod4 write SetNKod4;
    property NKod5: Double read GetNKod5 write SetNKod5;
    property OpBasTarih: TDate read GetOpBasTarih write SetOpBasTarih;
    property OpBasTarihSaat: TDate read GetOpBasTarihSaat write SetOpBasTarihSaat;
    property OpBitTarih: TDate read GetOpBitTarih write SetOpBitTarih;
    property OpBitTarihSaat: TDate read GetOpBitTarihSaat write SetOpBitTarihSaat;
    property OpDurum: Integer read GetOpDurum write SetOpDurum;
    property OpFireMiktar: Double read GetOpFireMiktar write SetOpFireMiktar;
    property OpMiktar: Double read GetOpMiktar write SetOpMiktar;
    property OpSure: Double read GetOpSure write SetOpSure;
    property ProjeKod: String read GetProjeKod write SetProjeKod;
    property RezervasyonDurum: Integer read GetRezervasyonDurum write SetRezervasyonDurum;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property SKod1: String read GetSKod1 write SetSKod1;
    property SKod2: String read GetSKod2 write SetSKod2;
    property SKod3: String read GetSKod3 write SetSKod3;
    property SKod4: String read GetSKod4 write SetSKod4;
    property SKod5: String read GetSKod5 write SetSKod5;
    property Kullanilabilir: Double read GetKullanilabilir write SetKullanilabilir;
    property StokCikis: Double read GetStokCikis write SetStokCikis;
    property StokGiris: Double read GetStokGiris write SetStokGiris;
    property StokMiktar: Double read GetStokMiktar write SetStokMiktar;
    property DovizCins: String read GetDovizCins write SetDovizCins;
    property MamulAd: String read GetMamulAd write SetMamulAd;
    property Maliyet1: Double read GetMaliyet1 write SetMaliyet1;
    property Maliyet2: Double read GetMaliyet2 write SetMaliyet2;
    property Maliyet3: Double read GetMaliyet3 write SetMaliyet3;
    property Sure: Double read GetSure write SetSure;
    property SurumNo: Integer read GetSurumNo write SetSurumNo;
    property UretimBasTarih: TDate read GetUretimBasTarih write SetUretimBasTarih;
    property UretimBitTarih: TDate read GetUretimBitTarih write SetUretimBitTarih;
    property UretimDurum: Integer read GetUretimDurum write SetUretimDurum;
    property UretimNo: String read GetUretimNo write SetUretimNo;
    property UretimPlanTarih: TDate read GetUretimPlanTarih write SetUretimPlanTarih;
    property UretimTarih: TDate read GetUretimTarih write SetUretimTarih;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fAciklama1:TField read GetfAciklama1;
    property fAciklama2:TField read GetfAciklama2;
    property fAciklama3:TField read GetfAciklama3;
    property fAciklama4:TField read GetfAciklama4;
    property fAciklama5:TField read GetfAciklama5;
    property fBasTarih:TField read GetfBasTarih;
    property fBasTarihSaat:TField read GetfBasTarihSaat;
    property fBitTarih:TField read GetfBitTarih;
    property fBitTarihSaat:TField read GetfBitTarihSaat;
    property fBKod1:TField read GetfBKod1;
    property fBKod2:TField read GetfBKod2;
    property fBKod3:TField read GetfBKod3;
    property fBKod4:TField read GetfBKod4;
    property fBKod5:TField read GetfBKod5;
    property fEvrakNo:TField read GetfEvrakNo;
    property fEvrakTarih:TField read GetfEvrakTarih;
    property fEvrakTip:TField read GetfEvrakTip;
    property fHammaddeDepokod:TField read GetfHammaddeDepokod;
    property fHesapKod:TField read GetfHesapKod;
    property fID:TField read GetfID;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakEvrakNo:TField read GetfKaynakEvrakNo;
    property fKaynakEvrakTip:TField read GetfKaynakEvrakTip;
    property fKaynakHesapKod:TField read GetfKaynakHesapKod;
    property fKaynakSiraNo:TField read GetfKaynakSiraNo;
    property fLKod1:TField read GetfLKod1;
    property fLKod2:TField read GetfLKod2;
    property fLKod3:TField read GetfLKod3;
    property fLKod4:TField read GetfLKod4;
    property fLKod5:TField read GetfLKod5;
    property fMaliyetTip:TField read GetfMaliyetTip;
    property fMamulDepokod:TField read GetfMamulDepokod;
    property fMamulKod:TField read GetfMamulKod;
    property fMamulSeriNo:TField read GetfMamulSeriNo;
    property fMamulSeriNo2:TField read GetfMamulSeriNo2;
    property fMiktar:TField read GetfMiktar;
    property fMKod1:TField read GetfMKod1;
    property fMKod2:TField read GetfMKod2;
    property fMKod3:TField read GetfMKod3;
    property fMKod4:TField read GetfMKod4;
    property fMKod5:TField read GetfMKod5;
    property fNKod1:TField read GetfNKod1;
    property fNKod2:TField read GetfNKod2;
    property fNKod3:TField read GetfNKod3;
    property fNKod4:TField read GetfNKod4;
    property fNKod5:TField read GetfNKod5;
    property fOpBasTarih:TField read GetfOpBasTarih;
    property fOpBasTarihSaat:TField read GetfOpBasTarihSaat;
    property fOpBitTarih:TField read GetfOpBitTarih;
    property fOpBitTarihSaat:TField read GetfOpBitTarihSaat;
    property fOpDurum:TField read GetfOpDurum;
    property fOpFireMiktar:TField read GetfOpFireMiktar;
    property fOpMiktar:TField read GetfOpMiktar;
    property fOpSure:TField read GetfOpSure;
    property fProjeKod:TField read GetfProjeKod;
    property fRezervasyonDurum:TField read GetfRezervasyonDurum;
    property fRowGuid:TField read GetfRowGuid;
    property fSiraNo:TField read GetfSiraNo;
    property fSirketNo:TField read GetfSirketNo;
    property fSKod1:TField read GetfSKod1;
    property fSKod2:TField read GetfSKod2;
    property fSKod3:TField read GetfSKod3;
    property fSKod4:TField read GetfSKod4;
    property fSKod5:TField read GetfSKod5;
    property fKullanilabilir:TField read GetfKullanilabilir;
    property fStokCikis:TField read GetfStokCikis;
    property fStokGiris:TField read GetfStokGiris;
    property fStokMiktar:TField read GetfStokMiktar;
    property fDovizCins:TField read GetfDovizCins;
    property fMamulAd:TField read GetfMamulAd;
    property fMaliyet1:TField read GetfMaliyet1;
    property fMaliyet2:TField read GetfMaliyet2;
    property fMaliyet3:TField read GetfMaliyet3;
    property fSure:TField read GetfSure;
    property fSurumNo:TField read GetfSurumNo;
    property fUretimBasTarih:TField read GetfUretimBasTarih;
    property fUretimBitTarih:TField read GetfUretimBitTarih;
    property fUretimDurum:TField read GetfUretimDurum;
    property fUretimNo:TField read GetfUretimNo;
    property fUretimPlanTarih:TField read GetfUretimPlanTarih;
    property fUretimTarih:TField read GetfUretimTarih;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableUretimKaynakTahsisat = class(TAppTable)
  Private
    FfBasSaat: TField;
    FfBasTarihSaat: TField;
    FfBitSaat: TField;
    FfBitTarihSaat: TField;
    FfEvrakNo: TField;
    FfEvrakTip: TField;
    FfID: TField;
    FfIsMerkezKod: TField;
    FfKaynakKod: TField;
    FfMamulKod: TField;
    FfMiktar: TField;
    FfOperasyonNo: TField;
    FfPlanNo: TField;
    FfPlanSiraNo: TField;
    FfRowGuid: TField;
    FfSecenekler: TField;
    FfSiraNo: TField;
    FfSirketNo: TField;
    FfMalAd: TField;
    FfSure: TField;
    FfSureTip: TField;
    FfTarih: TField;
    FfTip: TField;
    FfUretimNo: TField;
    FfUretimSiraNo: TField;
    FfVardiyaKod: TField;
    FfVersiyonNo: TField;
    function GetBasSaat: TDate;
    function GetBasTarihSaat: TDate;
    function GetBitSaat: TDate;
    function GetBitTarihSaat: TDate;
    function GetEvrakNo: String;
    function GetEvrakTip: Integer;
    function GetID: Integer;
    function GetIsMerkezKod: String;
    function GetKaynakKod: String;
    function GetMamulKod: String;
    function GetMiktar: Double;
    function GetOperasyonNo: Integer;
    function GetPlanNo: String;
    function GetPlanSiraNo: Integer;
    function GetRowGuid: String;
    function GetSecenekler: Integer;
    function GetSiraNo: Integer;
    function GetSirketNo: String;
    function GetMalAd: String;
    function GetSure: Double;
    function GetSureTip: Integer;
    function GetTarih: TDate;
    function GetTip: Integer;
    function GetUretimNo: String;
    function GetUretimSiraNo: Integer;
    function GetVardiyaKod: String;
    function GetVersiyonNo: String;
    function GetfBasSaat: TField;
    function GetfBasTarihSaat: TField;
    function GetfBitSaat: TField;
    function GetfBitTarihSaat: TField;
    function GetfEvrakNo: TField;
    function GetfEvrakTip: TField;
    function GetfID: TField;
    function GetfIsMerkezKod: TField;
    function GetfKaynakKod: TField;
    function GetfMamulKod: TField;
    function GetfMiktar: TField;
    function GetfOperasyonNo: TField;
    function GetfPlanNo: TField;
    function GetfPlanSiraNo: TField;
    function GetfRowGuid: TField;
    function GetfSecenekler: TField;
    function GetfSiraNo: TField;
    function GetfSirketNo: TField;
    function GetfMalAd: TField;
    function GetfSure: TField;
    function GetfSureTip: TField;
    function GetfTarih: TField;
    function GetfTip: TField;
    function GetfUretimNo: TField;
    function GetfUretimSiraNo: TField;
    function GetfVardiyaKod: TField;
    function GetfVersiyonNo: TField;
    procedure SetBasSaat(const Value: TDate);
    procedure SetBasTarihSaat(const Value: TDate);
    procedure SetBitSaat(const Value: TDate);
    procedure SetBitTarihSaat(const Value: TDate);
    procedure SetEvrakNo(const Value: String);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetIsMerkezKod(const Value: String);
    procedure SetKaynakKod(const Value: String);
    procedure SetMamulKod(const Value: String);
    procedure SetMiktar(const Value: Double);
    procedure SetOperasyonNo(const Value: Integer);
    procedure SetPlanNo(const Value: String);
    procedure SetPlanSiraNo(const Value: Integer);
    procedure SetRowGuid(const Value: String);
    procedure SetSecenekler(const Value: Integer);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSirketNo(const Value: String);
    procedure SetMalAd(const Value: String);
    procedure SetSure(const Value: Double);
    procedure SetSureTip(const Value: Integer);
    procedure SetTarih(const Value: TDate);
    procedure SetTip(const Value: Integer);
    procedure SetUretimNo(const Value: String);
    procedure SetUretimSiraNo(const Value: Integer);
    procedure SetVardiyaKod(const Value: String);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property BasSaat: TDate read GetBasSaat write SetBasSaat;
    property BasTarihSaat: TDate read GetBasTarihSaat write SetBasTarihSaat;
    property BitSaat: TDate read GetBitSaat write SetBitSaat;
    property BitTarihSaat: TDate read GetBitTarihSaat write SetBitTarihSaat;
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property ID: Integer read GetID write SetID;
    property IsMerkezKod: String read GetIsMerkezKod write SetIsMerkezKod;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property MamulKod: String read GetMamulKod write SetMamulKod;
    property Miktar: Double read GetMiktar write SetMiktar;
    property OperasyonNo: Integer read GetOperasyonNo write SetOperasyonNo;
    property PlanNo: String read GetPlanNo write SetPlanNo;
    property PlanSiraNo: Integer read GetPlanSiraNo write SetPlanSiraNo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property Secenekler: Integer read GetSecenekler write SetSecenekler;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property MalAd: String read GetMalAd write SetMalAd;
    property Sure: Double read GetSure write SetSure;
    property SureTip: Integer read GetSureTip write SetSureTip;
    property Tarih: TDate read GetTarih write SetTarih;
    property Tip: Integer read GetTip write SetTip;
    property UretimNo: String read GetUretimNo write SetUretimNo;
    property UretimSiraNo: Integer read GetUretimSiraNo write SetUretimSiraNo;
    property VardiyaKod: String read GetVardiyaKod write SetVardiyaKod;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fBasSaat:TField read GetfBasSaat;
    property fBasTarihSaat:TField read GetfBasTarihSaat;
    property fBitSaat:TField read GetfBitSaat;
    property fBitTarihSaat:TField read GetfBitTarihSaat;
    property fEvrakNo:TField read GetfEvrakNo;
    property fEvrakTip:TField read GetfEvrakTip;
    property fID:TField read GetfID;
    property fIsMerkezKod:TField read GetfIsMerkezKod;
    property fKaynakKod:TField read GetfKaynakKod;
    property fMamulKod:TField read GetfMamulKod;
    property fMiktar:TField read GetfMiktar;
    property fOperasyonNo:TField read GetfOperasyonNo;
    property fPlanNo:TField read GetfPlanNo;
    property fPlanSiraNo:TField read GetfPlanSiraNo;
    property fRowGuid:TField read GetfRowGuid;
    property fSecenekler:TField read GetfSecenekler;
    property fSiraNo:TField read GetfSiraNo;
    property fSirketNo:TField read GetfSirketNo;
    property fMalAd:TField read GetfMalAd;
    property fSure:TField read GetfSure;
    property fSureTip:TField read GetfSureTip;
    property fTarih:TField read GetfTarih;
    property fTip:TField read GetfTip;
    property fUretimNo:TField read GetfUretimNo;
    property fUretimSiraNo:TField read GetfUretimSiraNo;
    property fVardiyaKod:TField read GetfVardiyaKod;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableUretimRotaKaynakDurus = class(TAppTable)
  Private
    FfAciklama: TField;
    FfAdet: TField;
    FfBasTarih: TField;
    FfBasTarihSaat: TField;
    FfBirimSure: TField;
    FfBitTarih: TField;
    FfBitTarihSaat: TField;
    FfDegistirenKaynak: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
    FfDurusKod: TField;
    FfEvrakNo: TField;
    FfEvrakTip: TField;
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfID: TField;
    FfIsMerkezKod: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKaynakKod: TField;
    FfMamulKod: TField;
    FfOperasyonNo: TField;
    FfOperasyonSiraNo: TField;
    FfOperatorKod: TField;
    FfRowGuid: TField;
    FfSiraNo: TField;
    FfSirketNo: TField;
    FfSure: TField;
    FfUretimNo: TField;
    FfUretimSiraNo: TField;
    FfVardiyaKod: TField;
    FfVersiyonNo: TField;
    function GetAciklama: String;
    function GetAdet: Integer;
    function GetBasTarih: TDate;
    function GetBasTarihSaat: TDate;
    function GetBirimSure: Double;
    function GetBitTarih: TDate;
    function GetBitTarihSaat: TDate;
    function GetDegistirenKaynak: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
    function GetDurusKod: String;
    function GetEvrakNo: String;
    function GetEvrakTip: Integer;
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetID: Integer;
    function GetIsMerkezKod: String;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKaynakKod: String;
    function GetMamulKod: String;
    function GetOperasyonNo: Integer;
    function GetOperasyonSiraNo: Integer;
    function GetOperatorKod: String;
    function GetRowGuid: String;
    function GetSiraNo: Integer;
    function GetSirketNo: String;
    function GetSure: Double;
    function GetUretimNo: String;
    function GetUretimSiraNo: Integer;
    function GetVardiyaKod: String;
    function GetVersiyonNo: String;
    function GetfAciklama: TField;
    function GetfAdet: TField;
    function GetfBasTarih: TField;
    function GetfBasTarihSaat: TField;
    function GetfBirimSure: TField;
    function GetfBitTarih: TField;
    function GetfBitTarihSaat: TField;
    function GetfDegistirenKaynak: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
    function GetfDurusKod: TField;
    function GetfEvrakNo: TField;
    function GetfEvrakTip: TField;
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfID: TField;
    function GetfIsMerkezKod: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKaynakKod: TField;
    function GetfMamulKod: TField;
    function GetfOperasyonNo: TField;
    function GetfOperasyonSiraNo: TField;
    function GetfOperatorKod: TField;
    function GetfRowGuid: TField;
    function GetfSiraNo: TField;
    function GetfSirketNo: TField;
    function GetfSure: TField;
    function GetfUretimNo: TField;
    function GetfUretimSiraNo: TField;
    function GetfVardiyaKod: TField;
    function GetfVersiyonNo: TField;
    procedure SetAciklama(const Value: String);
    procedure SetAdet(const Value: Integer);
    procedure SetBasTarih(const Value: TDate);
    procedure SetBasTarihSaat(const Value: TDate);
    procedure SetBirimSure(const Value: Double);
    procedure SetBitTarih(const Value: TDate);
    procedure SetBitTarihSaat(const Value: TDate);
    procedure SetDegistirenKaynak(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
    procedure SetDurusKod(const Value: String);
    procedure SetEvrakNo(const Value: String);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetIsMerkezKod(const Value: String);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetMamulKod(const Value: String);
    procedure SetOperasyonNo(const Value: Integer);
    procedure SetOperasyonSiraNo(const Value: Integer);
    procedure SetOperatorKod(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSirketNo(const Value: String);
    procedure SetSure(const Value: Double);
    procedure SetUretimNo(const Value: String);
    procedure SetUretimSiraNo(const Value: Integer);
    procedure SetVardiyaKod(const Value: String);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property Adet: Integer read GetAdet write SetAdet;
    property BasTarih: TDate read GetBasTarih write SetBasTarih;
    property BasTarihSaat: TDate read GetBasTarihSaat write SetBasTarihSaat;
    property BirimSure: Double read GetBirimSure write SetBirimSure;
    property BitTarih: TDate read GetBitTarih write SetBitTarih;
    property BitTarihSaat: TDate read GetBitTarihSaat write SetBitTarihSaat;
    property DegistirenKaynak: String read GetDegistirenKaynak write SetDegistirenKaynak;
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property DegistirenSurum: String read GetDegistirenSurum write SetDegistirenSurum;
    property DegistirenTarih: TDate read GetDegistirenTarih write SetDegistirenTarih;
    property DurusKod: String read GetDurusKod write SetDurusKod;
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property ID: Integer read GetID write SetID;
    property IsMerkezKod: String read GetIsMerkezKod write SetIsMerkezKod;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property MamulKod: String read GetMamulKod write SetMamulKod;
    property OperasyonNo: Integer read GetOperasyonNo write SetOperasyonNo;
    property OperasyonSiraNo: Integer read GetOperasyonSiraNo write SetOperasyonSiraNo;
    property OperatorKod: String read GetOperatorKod write SetOperatorKod;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property Sure: Double read GetSure write SetSure;
    property UretimNo: String read GetUretimNo write SetUretimNo;
    property UretimSiraNo: Integer read GetUretimSiraNo write SetUretimSiraNo;
    property VardiyaKod: String read GetVardiyaKod write SetVardiyaKod;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fAciklama:TField read GetfAciklama;
    property fAdet:TField read GetfAdet;
    property fBasTarih:TField read GetfBasTarih;
    property fBasTarihSaat:TField read GetfBasTarihSaat;
    property fBirimSure:TField read GetfBirimSure;
    property fBitTarih:TField read GetfBitTarih;
    property fBitTarihSaat:TField read GetfBitTarihSaat;
    property fDegistirenKaynak:TField read GetfDegistirenKaynak;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
    property fDurusKod:TField read GetfDurusKod;
    property fEvrakNo:TField read GetfEvrakNo;
    property fEvrakTip:TField read GetfEvrakTip;
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fID:TField read GetfID;
    property fIsMerkezKod:TField read GetfIsMerkezKod;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakKod:TField read GetfKaynakKod;
    property fMamulKod:TField read GetfMamulKod;
    property fOperasyonNo:TField read GetfOperasyonNo;
    property fOperasyonSiraNo:TField read GetfOperasyonSiraNo;
    property fOperatorKod:TField read GetfOperatorKod;
    property fRowGuid:TField read GetfRowGuid;
    property fSiraNo:TField read GetfSiraNo;
    property fSirketNo:TField read GetfSirketNo;
    property fSure:TField read GetfSure;
    property fUretimNo:TField read GetfUretimNo;
    property fUretimSiraNo:TField read GetfUretimSiraNo;
    property fVardiyaKod:TField read GetfVardiyaKod;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableUretimRotaKaynakHata = class(TAppTable)
  Private
    FfAciklama: TField;
    FfDegistirenKaynak: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
    FfEvrakNo: TField;
    FfEvrakTip: TField;
    FfGirenKaynak: TField;
    FfGirenkullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfHataKod: TField;
    FfID: TField;
    FfIsMerkezKod: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKaynakKod: TField;
    FfMamulKod: TField;
    FfMiktar: TField;
    FfOperasyonNo: TField;
    FfOperasyonSiraNo: TField;
    FfOperatorKod: TField;
    FfRowGuid: TField;
    FfSiraNo: TField;
    FfSirketNo: TField;
    FfUretimNo: TField;
    FfUretimSiraNo: TField;
    FfVardiyaKod: TField;
    FfVersiyonNo: TField;
    function GetAciklama: String;
    function GetDegistirenKaynak: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
    function GetEvrakNo: String;
    function GetEvrakTip: Integer;
    function GetGirenKaynak: String;
    function GetGirenkullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetHataKod: String;
    function GetID: Integer;
    function GetIsMerkezKod: String;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKaynakKod: String;
    function GetMamulKod: String;
    function GetMiktar: Double;
    function GetOperasyonNo: Integer;
    function GetOperasyonSiraNo: Integer;
    function GetOperatorKod: String;
    function GetRowGuid: String;
    function GetSiraNo: Integer;
    function GetSirketNo: String;
    function GetUretimNo: String;
    function GetUretimSiraNo: Integer;
    function GetVardiyaKod: String;
    function GetVersiyonNo: String;
    function GetfAciklama: TField;
    function GetfDegistirenKaynak: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
    function GetfEvrakNo: TField;
    function GetfEvrakTip: TField;
    function GetfGirenKaynak: TField;
    function GetfGirenkullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfHataKod: TField;
    function GetfID: TField;
    function GetfIsMerkezKod: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKaynakKod: TField;
    function GetfMamulKod: TField;
    function GetfMiktar: TField;
    function GetfOperasyonNo: TField;
    function GetfOperasyonSiraNo: TField;
    function GetfOperatorKod: TField;
    function GetfRowGuid: TField;
    function GetfSiraNo: TField;
    function GetfSirketNo: TField;
    function GetfUretimNo: TField;
    function GetfUretimSiraNo: TField;
    function GetfVardiyaKod: TField;
    function GetfVersiyonNo: TField;
    procedure SetAciklama(const Value: String);
    procedure SetDegistirenKaynak(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
    procedure SetEvrakNo(const Value: String);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenkullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetHataKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetIsMerkezKod(const Value: String);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetMamulKod(const Value: String);
    procedure SetMiktar(const Value: Double);
    procedure SetOperasyonNo(const Value: Integer);
    procedure SetOperasyonSiraNo(const Value: Integer);
    procedure SetOperatorKod(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSirketNo(const Value: String);
    procedure SetUretimNo(const Value: String);
    procedure SetUretimSiraNo(const Value: Integer);
    procedure SetVardiyaKod(const Value: String);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property DegistirenKaynak: String read GetDegistirenKaynak write SetDegistirenKaynak;
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property DegistirenSurum: String read GetDegistirenSurum write SetDegistirenSurum;
    property DegistirenTarih: TDate read GetDegistirenTarih write SetDegistirenTarih;
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property Girenkullanici: String read GetGirenkullanici write SetGirenkullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property HataKod: String read GetHataKod write SetHataKod;
    property ID: Integer read GetID write SetID;
    property IsMerkezKod: String read GetIsMerkezKod write SetIsMerkezKod;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property MamulKod: String read GetMamulKod write SetMamulKod;
    property Miktar: Double read GetMiktar write SetMiktar;
    property OperasyonNo: Integer read GetOperasyonNo write SetOperasyonNo;
    property OperasyonSiraNo: Integer read GetOperasyonSiraNo write SetOperasyonSiraNo;
    property OperatorKod: String read GetOperatorKod write SetOperatorKod;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property UretimNo: String read GetUretimNo write SetUretimNo;
    property UretimSiraNo: Integer read GetUretimSiraNo write SetUretimSiraNo;
    property VardiyaKod: String read GetVardiyaKod write SetVardiyaKod;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fAciklama:TField read GetfAciklama;
    property fDegistirenKaynak:TField read GetfDegistirenKaynak;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
    property fEvrakNo:TField read GetfEvrakNo;
    property fEvrakTip:TField read GetfEvrakTip;
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenkullanici:TField read GetfGirenkullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fHataKod:TField read GetfHataKod;
    property fID:TField read GetfID;
    property fIsMerkezKod:TField read GetfIsMerkezKod;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakKod:TField read GetfKaynakKod;
    property fMamulKod:TField read GetfMamulKod;
    property fMiktar:TField read GetfMiktar;
    property fOperasyonNo:TField read GetfOperasyonNo;
    property fOperasyonSiraNo:TField read GetfOperasyonSiraNo;
    property fOperatorKod:TField read GetfOperatorKod;
    property fRowGuid:TField read GetfRowGuid;
    property fSiraNo:TField read GetfSiraNo;
    property fSirketNo:TField read GetfSirketNo;
    property fUretimNo:TField read GetfUretimNo;
    property fUretimSiraNo:TField read GetfUretimSiraNo;
    property fVardiyaKod:TField read GetfVardiyaKod;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableUretimRotaKaynakIslem = class(TAppTable)
  Private
    FfAciklama: TField;
    FfBasTarih: TField;
    FfBasTarihSaat: TField;
    FfBitTarih: TField;
    FfBitTarihSaat: TField;
    FfDurum: TField;
    FfEvrakNo: TField;
    FfEvrakTip: TField;
    FfID: TField;
    FfIslemNo: TField;
    FfIslemTip: TField;
    FfIsMerkezKod: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKaynakKod: TField;
    FfMamulKod: TField;
    FfMekanikSaatBas: TField;
    FfMekanikSaatBit: TField;
    FfMekanikSaatKatSayi: TField;
    FfMekanikSaatSure: TField;
    FfOperasyonNo: TField;
    FfOperatorKod: TField;
    FfSirketNo: TField;
    FfSonrakiIslemNo: TField;
    FfSure: TField;
    FfUretimNo: TField;
    FfUretimSiraNo: TField;
    FfVersiyonNo: TField;
    function GetAciklama: String;
    function GetBasTarih: TDate;
    function GetBasTarihSaat: TDate;
    function GetBitTarih: TDate;
    function GetBitTarihSaat: TDate;
    function GetDurum: Integer;
    function GetEvrakNo: String;
    function GetEvrakTip: Integer;
    function GetID: Integer;
    function GetIslemNo: Integer;
    function GetIslemTip: Integer;
    function GetIsMerkezKod: String;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKaynakKod: String;
    function GetMamulKod: String;
    function GetMekanikSaatBas: Double;
    function GetMekanikSaatBit: Double;
    function GetMekanikSaatKatSayi: Double;
    function GetMekanikSaatSure: Double;
    function GetOperasyonNo: Integer;
    function GetOperatorKod: String;
    function GetSirketNo: String;
    function GetSonrakiIslemNo: String;
    function GetSure: Double;
    function GetUretimNo: String;
    function GetUretimSiraNo: Integer;
    function GetVersiyonNo: String;
    function GetfAciklama: TField;
    function GetfBasTarih: TField;
    function GetfBasTarihSaat: TField;
    function GetfBitTarih: TField;
    function GetfBitTarihSaat: TField;
    function GetfDurum: TField;
    function GetfEvrakNo: TField;
    function GetfEvrakTip: TField;
    function GetfID: TField;
    function GetfIslemNo: TField;
    function GetfIslemTip: TField;
    function GetfIsMerkezKod: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKaynakKod: TField;
    function GetfMamulKod: TField;
    function GetfMekanikSaatBas: TField;
    function GetfMekanikSaatBit: TField;
    function GetfMekanikSaatKatSayi: TField;
    function GetfMekanikSaatSure: TField;
    function GetfOperasyonNo: TField;
    function GetfOperatorKod: TField;
    function GetfSirketNo: TField;
    function GetfSonrakiIslemNo: TField;
    function GetfSure: TField;
    function GetfUretimNo: TField;
    function GetfUretimSiraNo: TField;
    function GetfVersiyonNo: TField;
    procedure SetAciklama(const Value: String);
    procedure SetBasTarih(const Value: TDate);
    procedure SetBasTarihSaat(const Value: TDate);
    procedure SetBitTarih(const Value: TDate);
    procedure SetBitTarihSaat(const Value: TDate);
    procedure SetDurum(const Value: Integer);
    procedure SetEvrakNo(const Value: String);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetIslemNo(const Value: Integer);
    procedure SetIslemTip(const Value: Integer);
    procedure SetIsMerkezKod(const Value: String);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetMamulKod(const Value: String);
    procedure SetMekanikSaatBas(const Value: Double);
    procedure SetMekanikSaatBit(const Value: Double);
    procedure SetMekanikSaatKatSayi(const Value: Double);
    procedure SetMekanikSaatSure(const Value: Double);
    procedure SetOperasyonNo(const Value: Integer);
    procedure SetOperatorKod(const Value: String);
    procedure SetSirketNo(const Value: String);
    procedure SetSonrakiIslemNo(const Value: String);
    procedure SetSure(const Value: Double);
    procedure SetUretimNo(const Value: String);
    procedure SetUretimSiraNo(const Value: Integer);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property BasTarih: TDate read GetBasTarih write SetBasTarih;
    property BasTarihSaat: TDate read GetBasTarihSaat write SetBasTarihSaat;
    property BitTarih: TDate read GetBitTarih write SetBitTarih;
    property BitTarihSaat: TDate read GetBitTarihSaat write SetBitTarihSaat;
    property Durum: Integer read GetDurum write SetDurum;
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property ID: Integer read GetID write SetID;
    property IslemNo: Integer read GetIslemNo write SetIslemNo;
    property IslemTip: Integer read GetIslemTip write SetIslemTip;
    property IsMerkezKod: String read GetIsMerkezKod write SetIsMerkezKod;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property MamulKod: String read GetMamulKod write SetMamulKod;
    property MekanikSaatBas: Double read GetMekanikSaatBas write SetMekanikSaatBas;
    property MekanikSaatBit: Double read GetMekanikSaatBit write SetMekanikSaatBit;
    property MekanikSaatKatSayi: Double read GetMekanikSaatKatSayi write SetMekanikSaatKatSayi;
    property MekanikSaatSure: Double read GetMekanikSaatSure write SetMekanikSaatSure;
    property OperasyonNo: Integer read GetOperasyonNo write SetOperasyonNo;
    property OperatorKod: String read GetOperatorKod write SetOperatorKod;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property SonrakiIslemNo: String read GetSonrakiIslemNo write SetSonrakiIslemNo;
    property Sure: Double read GetSure write SetSure;
    property UretimNo: String read GetUretimNo write SetUretimNo;
    property UretimSiraNo: Integer read GetUretimSiraNo write SetUretimSiraNo;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fAciklama:TField read GetfAciklama;
    property fBasTarih:TField read GetfBasTarih;
    property fBasTarihSaat:TField read GetfBasTarihSaat;
    property fBitTarih:TField read GetfBitTarih;
    property fBitTarihSaat:TField read GetfBitTarihSaat;
    property fDurum:TField read GetfDurum;
    property fEvrakNo:TField read GetfEvrakNo;
    property fEvrakTip:TField read GetfEvrakTip;
    property fID:TField read GetfID;
    property fIslemNo:TField read GetfIslemNo;
    property fIslemTip:TField read GetfIslemTip;
    property fIsMerkezKod:TField read GetfIsMerkezKod;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakKod:TField read GetfKaynakKod;
    property fMamulKod:TField read GetfMamulKod;
    property fMekanikSaatBas:TField read GetfMekanikSaatBas;
    property fMekanikSaatBit:TField read GetfMekanikSaatBit;
    property fMekanikSaatKatSayi:TField read GetfMekanikSaatKatSayi;
    property fMekanikSaatSure:TField read GetfMekanikSaatSure;
    property fOperasyonNo:TField read GetfOperasyonNo;
    property fOperatorKod:TField read GetfOperatorKod;
    property fSirketNo:TField read GetfSirketNo;
    property fSonrakiIslemNo:TField read GetfSonrakiIslemNo;
    property fSure:TField read GetfSure;
    property fUretimNo:TField read GetfUretimNo;
    property fUretimSiraNo:TField read GetfUretimSiraNo;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableUretimRotaKaynakOperasyon = class(TAppTable)
  Private
    FfAciklama1: TField;
    FfAciklama2: TField;
    FfAciklama3: TField;
    FfAciklama4: TField;
    FfAciklama5: TField;
    FfBasTarih: TField;
    FfBasTarihSaat: TField;
    FfBitTarih: TField;
    FfBitTarihSaat: TField;
    FfBKod1: TField;
    FfBKod2: TField;
    FfBKod3: TField;
    FfBKod4: TField;
    FfBKod5: TField;
    FfDegistirenKaynak: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
    FfDurum: TField;
    FfEvrakBirim: TField;
    FfEvrakBirimKatsayi: TField;
    FfEvrakFireMiktar: TField;
    FfEvrakMiktar: TField;
    FfEvrakNo: TField;
    FfEvrakTip: TField;
    FfFireMiktar: TField;
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfID: TField;
    FfIslemNo: TField;
    FfIsMerkezKod: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKaynakKod: TField;
    FfLKod1: TField;
    FfLKod2: TField;
    FfLKod3: TField;
    FfLKod4: TField;
    FfLKod5: TField;
    FfMamulKod: TField;
    FfMekanikSaatBas: TField;
    FfMekanikSaatBit: TField;
    FfMekanikSaatKatSayi: TField;
    FfMekanikSaatSure: TField;
    FfMiktar: TField;
    FfMKod1: TField;
    FfMKod2: TField;
    FfMKod3: TField;
    FfMKod4: TField;
    FfMKod5: TField;
    FfNKod1: TField;
    FfNKod2: TField;
    FfNKod3: TField;
    FfNKod4: TField;
    FfNKod5: TField;
    FfOperasyonNo: TField;
    FfOperatorKod: TField;
    FfOptCalismaBirimSure: TField;
    FfOptCalismaSure: TField;
    FfRowGuid: TField;
    FfSiraNo: TField;
    FfSirketNo: TField;
    FfSKod1: TField;
    FfSKod2: TField;
    FfSKod3: TField;
    FfSKod4: TField;
    FfSKod5: TField;
    FfSure: TField;
    FfUretimNo: TField;
    FfUretimSiraNo: TField;
    FfVardiyaKod: TField;
    FfVersiyonNo: TField;
    FfYetkili1: TField;
    FfYetkili2: TField;
    function GetAciklama1: String;
    function GetAciklama2: String;
    function GetAciklama3: String;
    function GetAciklama4: String;
    function GetAciklama5: String;
    function GetBasTarih: TDate;
    function GetBasTarihSaat: TDate;
    function GetBitTarih: TDate;
    function GetBitTarihSaat: TDate;
    function GetBKod1: Integer;
    function GetBKod2: Integer;
    function GetBKod3: Integer;
    function GetBKod4: Integer;
    function GetBKod5: Integer;
    function GetDegistirenKaynak: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
    function GetDurum: Integer;
    function GetEvrakBirim: String;
    function GetEvrakBirimKatsayi: Double;
    function GetEvrakFireMiktar: Double;
    function GetEvrakMiktar: Double;
    function GetEvrakNo: String;
    function GetEvrakTip: Integer;
    function GetFireMiktar: Double;
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetID: Integer;
    function GetIslemNo: Integer;
    function GetIsMerkezKod: String;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKaynakKod: String;
    function GetLKod1: String;
    function GetLKod2: String;
    function GetLKod3: String;
    function GetLKod4: String;
    function GetLKod5: String;
    function GetMamulKod: String;
    function GetMekanikSaatBas: Double;
    function GetMekanikSaatBit: Double;
    function GetMekanikSaatKatSayi: Double;
    function GetMekanikSaatSure: Double;
    function GetMiktar: Double;
    function GetMKod1: String;
    function GetMKod2: String;
    function GetMKod3: String;
    function GetMKod4: String;
    function GetMKod5: String;
    function GetNKod1: Double;
    function GetNKod2: Double;
    function GetNKod3: Double;
    function GetNKod4: Double;
    function GetNKod5: Double;
    function GetOperasyonNo: Integer;
    function GetOperatorKod: String;
    function GetOptCalismaBirimSure: Double;
    function GetOptCalismaSure: Double;
    function GetRowGuid: String;
    function GetSiraNo: Integer;
    function GetSirketNo: String;
    function GetSKod1: String;
    function GetSKod2: String;
    function GetSKod3: String;
    function GetSKod4: String;
    function GetSKod5: String;
    function GetSure: Double;
    function GetUretimNo: String;
    function GetUretimSiraNo: Integer;
    function GetVardiyaKod: String;
    function GetVersiyonNo: String;
    function GetYetkili1: String;
    function GetYetkili2: String;
    function GetfAciklama1: TField;
    function GetfAciklama2: TField;
    function GetfAciklama3: TField;
    function GetfAciklama4: TField;
    function GetfAciklama5: TField;
    function GetfBasTarih: TField;
    function GetfBasTarihSaat: TField;
    function GetfBitTarih: TField;
    function GetfBitTarihSaat: TField;
    function GetfBKod1: TField;
    function GetfBKod2: TField;
    function GetfBKod3: TField;
    function GetfBKod4: TField;
    function GetfBKod5: TField;
    function GetfDegistirenKaynak: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
    function GetfDurum: TField;
    function GetfEvrakBirim: TField;
    function GetfEvrakBirimKatsayi: TField;
    function GetfEvrakFireMiktar: TField;
    function GetfEvrakMiktar: TField;
    function GetfEvrakNo: TField;
    function GetfEvrakTip: TField;
    function GetfFireMiktar: TField;
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfID: TField;
    function GetfIslemNo: TField;
    function GetfIsMerkezKod: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKaynakKod: TField;
    function GetfLKod1: TField;
    function GetfLKod2: TField;
    function GetfLKod3: TField;
    function GetfLKod4: TField;
    function GetfLKod5: TField;
    function GetfMamulKod: TField;
    function GetfMekanikSaatBas: TField;
    function GetfMekanikSaatBit: TField;
    function GetfMekanikSaatKatSayi: TField;
    function GetfMekanikSaatSure: TField;
    function GetfMiktar: TField;
    function GetfMKod1: TField;
    function GetfMKod2: TField;
    function GetfMKod3: TField;
    function GetfMKod4: TField;
    function GetfMKod5: TField;
    function GetfNKod1: TField;
    function GetfNKod2: TField;
    function GetfNKod3: TField;
    function GetfNKod4: TField;
    function GetfNKod5: TField;
    function GetfOperasyonNo: TField;
    function GetfOperatorKod: TField;
    function GetfOptCalismaBirimSure: TField;
    function GetfOptCalismaSure: TField;
    function GetfRowGuid: TField;
    function GetfSiraNo: TField;
    function GetfSirketNo: TField;
    function GetfSKod1: TField;
    function GetfSKod2: TField;
    function GetfSKod3: TField;
    function GetfSKod4: TField;
    function GetfSKod5: TField;
    function GetfSure: TField;
    function GetfUretimNo: TField;
    function GetfUretimSiraNo: TField;
    function GetfVardiyaKod: TField;
    function GetfVersiyonNo: TField;
    function GetfYetkili1: TField;
    function GetfYetkili2: TField;
    procedure SetAciklama1(const Value: String);
    procedure SetAciklama2(const Value: String);
    procedure SetAciklama3(const Value: String);
    procedure SetAciklama4(const Value: String);
    procedure SetAciklama5(const Value: String);
    procedure SetBasTarih(const Value: TDate);
    procedure SetBasTarihSaat(const Value: TDate);
    procedure SetBitTarih(const Value: TDate);
    procedure SetBitTarihSaat(const Value: TDate);
    procedure SetBKod1(const Value: Integer);
    procedure SetBKod2(const Value: Integer);
    procedure SetBKod3(const Value: Integer);
    procedure SetBKod4(const Value: Integer);
    procedure SetBKod5(const Value: Integer);
    procedure SetDegistirenKaynak(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
    procedure SetDurum(const Value: Integer);
    procedure SetEvrakBirim(const Value: String);
    procedure SetEvrakBirimKatsayi(const Value: Double);
    procedure SetEvrakFireMiktar(const Value: Double);
    procedure SetEvrakMiktar(const Value: Double);
    procedure SetEvrakNo(const Value: String);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetFireMiktar(const Value: Double);
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetIslemNo(const Value: Integer);
    procedure SetIsMerkezKod(const Value: String);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetLKod1(const Value: String);
    procedure SetLKod2(const Value: String);
    procedure SetLKod3(const Value: String);
    procedure SetLKod4(const Value: String);
    procedure SetLKod5(const Value: String);
    procedure SetMamulKod(const Value: String);
    procedure SetMekanikSaatBas(const Value: Double);
    procedure SetMekanikSaatBit(const Value: Double);
    procedure SetMekanikSaatKatSayi(const Value: Double);
    procedure SetMekanikSaatSure(const Value: Double);
    procedure SetMiktar(const Value: Double);
    procedure SetMKod1(const Value: String);
    procedure SetMKod2(const Value: String);
    procedure SetMKod3(const Value: String);
    procedure SetMKod4(const Value: String);
    procedure SetMKod5(const Value: String);
    procedure SetNKod1(const Value: Double);
    procedure SetNKod2(const Value: Double);
    procedure SetNKod3(const Value: Double);
    procedure SetNKod4(const Value: Double);
    procedure SetNKod5(const Value: Double);
    procedure SetOperasyonNo(const Value: Integer);
    procedure SetOperatorKod(const Value: String);
    procedure SetOptCalismaBirimSure(const Value: Double);
    procedure SetOptCalismaSure(const Value: Double);
    procedure SetRowGuid(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSirketNo(const Value: String);
    procedure SetSKod1(const Value: String);
    procedure SetSKod2(const Value: String);
    procedure SetSKod3(const Value: String);
    procedure SetSKod4(const Value: String);
    procedure SetSKod5(const Value: String);
    procedure SetSure(const Value: Double);
    procedure SetUretimNo(const Value: String);
    procedure SetUretimSiraNo(const Value: Integer);
    procedure SetVardiyaKod(const Value: String);
    procedure SetVersiyonNo(const Value: String);
    procedure SetYetkili1(const Value: String);
    procedure SetYetkili2(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama1: String read GetAciklama1 write SetAciklama1;
    property Aciklama2: String read GetAciklama2 write SetAciklama2;
    property Aciklama3: String read GetAciklama3 write SetAciklama3;
    property Aciklama4: String read GetAciklama4 write SetAciklama4;
    property Aciklama5: String read GetAciklama5 write SetAciklama5;
    property BasTarih: TDate read GetBasTarih write SetBasTarih;
    property BasTarihSaat: TDate read GetBasTarihSaat write SetBasTarihSaat;
    property BitTarih: TDate read GetBitTarih write SetBitTarih;
    property BitTarihSaat: TDate read GetBitTarihSaat write SetBitTarihSaat;
    property BKod1: Integer read GetBKod1 write SetBKod1;
    property BKod2: Integer read GetBKod2 write SetBKod2;
    property BKod3: Integer read GetBKod3 write SetBKod3;
    property BKod4: Integer read GetBKod4 write SetBKod4;
    property BKod5: Integer read GetBKod5 write SetBKod5;
    property DegistirenKaynak: String read GetDegistirenKaynak write SetDegistirenKaynak;
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property DegistirenSurum: String read GetDegistirenSurum write SetDegistirenSurum;
    property DegistirenTarih: TDate read GetDegistirenTarih write SetDegistirenTarih;
    property Durum: Integer read GetDurum write SetDurum;
    property EvrakBirim: String read GetEvrakBirim write SetEvrakBirim;
    property EvrakBirimKatsayi: Double read GetEvrakBirimKatsayi write SetEvrakBirimKatsayi;
    property EvrakFireMiktar: Double read GetEvrakFireMiktar write SetEvrakFireMiktar;
    property EvrakMiktar: Double read GetEvrakMiktar write SetEvrakMiktar;
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property FireMiktar: Double read GetFireMiktar write SetFireMiktar;
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property ID: Integer read GetID write SetID;
    property IslemNo: Integer read GetIslemNo write SetIslemNo;
    property IsMerkezKod: String read GetIsMerkezKod write SetIsMerkezKod;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property LKod1: String read GetLKod1 write SetLKod1;
    property LKod2: String read GetLKod2 write SetLKod2;
    property LKod3: String read GetLKod3 write SetLKod3;
    property LKod4: String read GetLKod4 write SetLKod4;
    property LKod5: String read GetLKod5 write SetLKod5;
    property MamulKod: String read GetMamulKod write SetMamulKod;
    property MekanikSaatBas: Double read GetMekanikSaatBas write SetMekanikSaatBas;
    property MekanikSaatBit: Double read GetMekanikSaatBit write SetMekanikSaatBit;
    property MekanikSaatKatSayi: Double read GetMekanikSaatKatSayi write SetMekanikSaatKatSayi;
    property MekanikSaatSure: Double read GetMekanikSaatSure write SetMekanikSaatSure;
    property Miktar: Double read GetMiktar write SetMiktar;
    property MKod1: String read GetMKod1 write SetMKod1;
    property MKod2: String read GetMKod2 write SetMKod2;
    property MKod3: String read GetMKod3 write SetMKod3;
    property MKod4: String read GetMKod4 write SetMKod4;
    property MKod5: String read GetMKod5 write SetMKod5;
    property NKod1: Double read GetNKod1 write SetNKod1;
    property NKod2: Double read GetNKod2 write SetNKod2;
    property NKod3: Double read GetNKod3 write SetNKod3;
    property NKod4: Double read GetNKod4 write SetNKod4;
    property NKod5: Double read GetNKod5 write SetNKod5;
    property OperasyonNo: Integer read GetOperasyonNo write SetOperasyonNo;
    property OperatorKod: String read GetOperatorKod write SetOperatorKod;
    property OptCalismaBirimSure: Double read GetOptCalismaBirimSure write SetOptCalismaBirimSure;
    property OptCalismaSure: Double read GetOptCalismaSure write SetOptCalismaSure;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property SKod1: String read GetSKod1 write SetSKod1;
    property SKod2: String read GetSKod2 write SetSKod2;
    property SKod3: String read GetSKod3 write SetSKod3;
    property SKod4: String read GetSKod4 write SetSKod4;
    property SKod5: String read GetSKod5 write SetSKod5;
    property Sure: Double read GetSure write SetSure;
    property UretimNo: String read GetUretimNo write SetUretimNo;
    property UretimSiraNo: Integer read GetUretimSiraNo write SetUretimSiraNo;
    property VardiyaKod: String read GetVardiyaKod write SetVardiyaKod;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property Yetkili1: String read GetYetkili1 write SetYetkili1;
    property Yetkili2: String read GetYetkili2 write SetYetkili2;
    property fAciklama1:TField read GetfAciklama1;
    property fAciklama2:TField read GetfAciklama2;
    property fAciklama3:TField read GetfAciklama3;
    property fAciklama4:TField read GetfAciklama4;
    property fAciklama5:TField read GetfAciklama5;
    property fBasTarih:TField read GetfBasTarih;
    property fBasTarihSaat:TField read GetfBasTarihSaat;
    property fBitTarih:TField read GetfBitTarih;
    property fBitTarihSaat:TField read GetfBitTarihSaat;
    property fBKod1:TField read GetfBKod1;
    property fBKod2:TField read GetfBKod2;
    property fBKod3:TField read GetfBKod3;
    property fBKod4:TField read GetfBKod4;
    property fBKod5:TField read GetfBKod5;
    property fDegistirenKaynak:TField read GetfDegistirenKaynak;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
    property fDurum:TField read GetfDurum;
    property fEvrakBirim:TField read GetfEvrakBirim;
    property fEvrakBirimKatsayi:TField read GetfEvrakBirimKatsayi;
    property fEvrakFireMiktar:TField read GetfEvrakFireMiktar;
    property fEvrakMiktar:TField read GetfEvrakMiktar;
    property fEvrakNo:TField read GetfEvrakNo;
    property fEvrakTip:TField read GetfEvrakTip;
    property fFireMiktar:TField read GetfFireMiktar;
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fID:TField read GetfID;
    property fIslemNo:TField read GetfIslemNo;
    property fIsMerkezKod:TField read GetfIsMerkezKod;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakKod:TField read GetfKaynakKod;
    property fLKod1:TField read GetfLKod1;
    property fLKod2:TField read GetfLKod2;
    property fLKod3:TField read GetfLKod3;
    property fLKod4:TField read GetfLKod4;
    property fLKod5:TField read GetfLKod5;
    property fMamulKod:TField read GetfMamulKod;
    property fMekanikSaatBas:TField read GetfMekanikSaatBas;
    property fMekanikSaatBit:TField read GetfMekanikSaatBit;
    property fMekanikSaatKatSayi:TField read GetfMekanikSaatKatSayi;
    property fMekanikSaatSure:TField read GetfMekanikSaatSure;
    property fMiktar:TField read GetfMiktar;
    property fMKod1:TField read GetfMKod1;
    property fMKod2:TField read GetfMKod2;
    property fMKod3:TField read GetfMKod3;
    property fMKod4:TField read GetfMKod4;
    property fMKod5:TField read GetfMKod5;
    property fNKod1:TField read GetfNKod1;
    property fNKod2:TField read GetfNKod2;
    property fNKod3:TField read GetfNKod3;
    property fNKod4:TField read GetfNKod4;
    property fNKod5:TField read GetfNKod5;
    property fOperasyonNo:TField read GetfOperasyonNo;
    property fOperatorKod:TField read GetfOperatorKod;
    property fOptCalismaBirimSure:TField read GetfOptCalismaBirimSure;
    property fOptCalismaSure:TField read GetfOptCalismaSure;
    property fRowGuid:TField read GetfRowGuid;
    property fSiraNo:TField read GetfSiraNo;
    property fSirketNo:TField read GetfSirketNo;
    property fSKod1:TField read GetfSKod1;
    property fSKod2:TField read GetfSKod2;
    property fSKod3:TField read GetfSKod3;
    property fSKod4:TField read GetfSKod4;
    property fSKod5:TField read GetfSKod5;
    property fSure:TField read GetfSure;
    property fUretimNo:TField read GetfUretimNo;
    property fUretimSiraNo:TField read GetfUretimSiraNo;
    property fVardiyaKod:TField read GetfVardiyaKod;
    property fVersiyonNo:TField read GetfVersiyonNo;
    property fYetkili1:TField read GetfYetkili1;
    property fYetkili2:TField read GetfYetkili2;
  end;

  TTableUretimRotaKaynak = class(TAppTable)
  Private
    FfBeklemeSure: TField;
    FfBKod1: TField;
    FfBKod2: TField;
    FfBKod3: TField;
    FfBKod4: TField;
    FfBKod5: TField;
    FfCalismaSure: TField;
    FfDurusSure: TField;
    FfEvrakNo: TField;
    FfEvrakTip: TField;
    FfID: TField;
    FfIsMerkezKod: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKaynakKod: TField;
    FfKullanilan: TField;
    FfKullanimSiraNo: TField;
    FfKurulumSure: TField;
    FfKuyrukSure: TField;
    FfLKod1: TField;
    FfLKod2: TField;
    FfLKod3: TField;
    FfLKod4: TField;
    FfLKod5: TField;
    FfMamulKod: TField;
    FfMiktar: TField;
    FfMKod1: TField;
    FfMKod2: TField;
    FfMKod3: TField;
    FfMKod4: TField;
    FfMKod5: TField;
    FfNKod1: TField;
    FfNKod2: TField;
    FfNKod3: TField;
    FfNKod4: TField;
    FfNKod5: TField;
    FfOnUretimMiktar: TField;
    FfOpBasTarih: TField;
    FfOpBasTarihSaat: TField;
    FfOpBitTarih: TField;
    FfOpBitTarihSaat: TField;
    FfOpDurum: TField;
    FfOperasyonNo: TField;
    FfOpFireMiktar: TField;
    FfOpMiktar: TField;
    FfOpSure: TField;
    FfRowGuid: TField;
    FfSerbestMiktar: TField;
    FfSirketNo: TField;
    FfSKod1: TField;
    FfSKod2: TField;
    FfSKod3: TField;
    FfSKod4: TField;
    FfSKod5: TField;
    FfSokumMamulKod: TField;
    FfSokumSure: TField;
    FfTasimaSure: TField;
    FfToplamSure: TField;
    FfUretimNo: TField;
    FfUretimSiraNo: TField;
    FfVersiyonNo: TField;
    function GetBeklemeSure: Double;
    function GetBKod1: Integer;
    function GetBKod2: Integer;
    function GetBKod3: Integer;
    function GetBKod4: Integer;
    function GetBKod5: Integer;
    function GetCalismaSure: Double;
    function GetDurusSure: Double;
    function GetEvrakNo: String;
    function GetEvrakTip: Integer;
    function GetID: Integer;
    function GetIsMerkezKod: String;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKaynakKod: String;
    function GetKullanilan: Integer;
    function GetKullanimSiraNo: Integer;
    function GetKurulumSure: Double;
    function GetKuyrukSure: Double;
    function GetLKod1: String;
    function GetLKod2: String;
    function GetLKod3: String;
    function GetLKod4: String;
    function GetLKod5: String;
    function GetMamulKod: String;
    function GetMiktar: Double;
    function GetMKod1: String;
    function GetMKod2: String;
    function GetMKod3: String;
    function GetMKod4: String;
    function GetMKod5: String;
    function GetNKod1: Double;
    function GetNKod2: Double;
    function GetNKod3: Double;
    function GetNKod4: Double;
    function GetNKod5: Double;
    function GetOnUretimMiktar: Double;
    function GetOpBasTarih: TDate;
    function GetOpBasTarihSaat: TDate;
    function GetOpBitTarih: TDate;
    function GetOpBitTarihSaat: TDate;
    function GetOpDurum: Integer;
    function GetOperasyonNo: Integer;
    function GetOpFireMiktar: Double;
    function GetOpMiktar: Double;
    function GetOpSure: Double;
    function GetRowGuid: String;
    function GetSerbestMiktar: Double;
    function GetSirketNo: String;
    function GetSKod1: String;
    function GetSKod2: String;
    function GetSKod3: String;
    function GetSKod4: String;
    function GetSKod5: String;
    function GetSokumMamulKod: String;
    function GetSokumSure: Double;
    function GetTasimaSure: Double;
    function GetToplamSure: Double;
    function GetUretimNo: String;
    function GetUretimSiraNo: Integer;
    function GetVersiyonNo: String;
    function GetfBeklemeSure: TField;
    function GetfBKod1: TField;
    function GetfBKod2: TField;
    function GetfBKod3: TField;
    function GetfBKod4: TField;
    function GetfBKod5: TField;
    function GetfCalismaSure: TField;
    function GetfDurusSure: TField;
    function GetfEvrakNo: TField;
    function GetfEvrakTip: TField;
    function GetfID: TField;
    function GetfIsMerkezKod: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKaynakKod: TField;
    function GetfKullanilan: TField;
    function GetfKullanimSiraNo: TField;
    function GetfKurulumSure: TField;
    function GetfKuyrukSure: TField;
    function GetfLKod1: TField;
    function GetfLKod2: TField;
    function GetfLKod3: TField;
    function GetfLKod4: TField;
    function GetfLKod5: TField;
    function GetfMamulKod: TField;
    function GetfMiktar: TField;
    function GetfMKod1: TField;
    function GetfMKod2: TField;
    function GetfMKod3: TField;
    function GetfMKod4: TField;
    function GetfMKod5: TField;
    function GetfNKod1: TField;
    function GetfNKod2: TField;
    function GetfNKod3: TField;
    function GetfNKod4: TField;
    function GetfNKod5: TField;
    function GetfOnUretimMiktar: TField;
    function GetfOpBasTarih: TField;
    function GetfOpBasTarihSaat: TField;
    function GetfOpBitTarih: TField;
    function GetfOpBitTarihSaat: TField;
    function GetfOpDurum: TField;
    function GetfOperasyonNo: TField;
    function GetfOpFireMiktar: TField;
    function GetfOpMiktar: TField;
    function GetfOpSure: TField;
    function GetfRowGuid: TField;
    function GetfSerbestMiktar: TField;
    function GetfSirketNo: TField;
    function GetfSKod1: TField;
    function GetfSKod2: TField;
    function GetfSKod3: TField;
    function GetfSKod4: TField;
    function GetfSKod5: TField;
    function GetfSokumMamulKod: TField;
    function GetfSokumSure: TField;
    function GetfTasimaSure: TField;
    function GetfToplamSure: TField;
    function GetfUretimNo: TField;
    function GetfUretimSiraNo: TField;
    function GetfVersiyonNo: TField;
    procedure SetBeklemeSure(const Value: Double);
    procedure SetBKod1(const Value: Integer);
    procedure SetBKod2(const Value: Integer);
    procedure SetBKod3(const Value: Integer);
    procedure SetBKod4(const Value: Integer);
    procedure SetBKod5(const Value: Integer);
    procedure SetCalismaSure(const Value: Double);
    procedure SetDurusSure(const Value: Double);
    procedure SetEvrakNo(const Value: String);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetIsMerkezKod(const Value: String);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetKullanilan(const Value: Integer);
    procedure SetKullanimSiraNo(const Value: Integer);
    procedure SetKurulumSure(const Value: Double);
    procedure SetKuyrukSure(const Value: Double);
    procedure SetLKod1(const Value: String);
    procedure SetLKod2(const Value: String);
    procedure SetLKod3(const Value: String);
    procedure SetLKod4(const Value: String);
    procedure SetLKod5(const Value: String);
    procedure SetMamulKod(const Value: String);
    procedure SetMiktar(const Value: Double);
    procedure SetMKod1(const Value: String);
    procedure SetMKod2(const Value: String);
    procedure SetMKod3(const Value: String);
    procedure SetMKod4(const Value: String);
    procedure SetMKod5(const Value: String);
    procedure SetNKod1(const Value: Double);
    procedure SetNKod2(const Value: Double);
    procedure SetNKod3(const Value: Double);
    procedure SetNKod4(const Value: Double);
    procedure SetNKod5(const Value: Double);
    procedure SetOnUretimMiktar(const Value: Double);
    procedure SetOpBasTarih(const Value: TDate);
    procedure SetOpBasTarihSaat(const Value: TDate);
    procedure SetOpBitTarih(const Value: TDate);
    procedure SetOpBitTarihSaat(const Value: TDate);
    procedure SetOpDurum(const Value: Integer);
    procedure SetOperasyonNo(const Value: Integer);
    procedure SetOpFireMiktar(const Value: Double);
    procedure SetOpMiktar(const Value: Double);
    procedure SetOpSure(const Value: Double);
    procedure SetRowGuid(const Value: String);
    procedure SetSerbestMiktar(const Value: Double);
    procedure SetSirketNo(const Value: String);
    procedure SetSKod1(const Value: String);
    procedure SetSKod2(const Value: String);
    procedure SetSKod3(const Value: String);
    procedure SetSKod4(const Value: String);
    procedure SetSKod5(const Value: String);
    procedure SetSokumMamulKod(const Value: String);
    procedure SetSokumSure(const Value: Double);
    procedure SetTasimaSure(const Value: Double);
    procedure SetToplamSure(const Value: Double);
    procedure SetUretimNo(const Value: String);
    procedure SetUretimSiraNo(const Value: Integer);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property BeklemeSure: Double read GetBeklemeSure write SetBeklemeSure;
    property BKod1: Integer read GetBKod1 write SetBKod1;
    property BKod2: Integer read GetBKod2 write SetBKod2;
    property BKod3: Integer read GetBKod3 write SetBKod3;
    property BKod4: Integer read GetBKod4 write SetBKod4;
    property BKod5: Integer read GetBKod5 write SetBKod5;
    property CalismaSure: Double read GetCalismaSure write SetCalismaSure;
    property DurusSure: Double read GetDurusSure write SetDurusSure;
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property ID: Integer read GetID write SetID;
    property IsMerkezKod: String read GetIsMerkezKod write SetIsMerkezKod;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property Kullanilan: Integer read GetKullanilan write SetKullanilan;
    property KullanimSiraNo: Integer read GetKullanimSiraNo write SetKullanimSiraNo;
    property KurulumSure: Double read GetKurulumSure write SetKurulumSure;
    property KuyrukSure: Double read GetKuyrukSure write SetKuyrukSure;
    property LKod1: String read GetLKod1 write SetLKod1;
    property LKod2: String read GetLKod2 write SetLKod2;
    property LKod3: String read GetLKod3 write SetLKod3;
    property LKod4: String read GetLKod4 write SetLKod4;
    property LKod5: String read GetLKod5 write SetLKod5;
    property MamulKod: String read GetMamulKod write SetMamulKod;
    property Miktar: Double read GetMiktar write SetMiktar;
    property MKod1: String read GetMKod1 write SetMKod1;
    property MKod2: String read GetMKod2 write SetMKod2;
    property MKod3: String read GetMKod3 write SetMKod3;
    property MKod4: String read GetMKod4 write SetMKod4;
    property MKod5: String read GetMKod5 write SetMKod5;
    property NKod1: Double read GetNKod1 write SetNKod1;
    property NKod2: Double read GetNKod2 write SetNKod2;
    property NKod3: Double read GetNKod3 write SetNKod3;
    property NKod4: Double read GetNKod4 write SetNKod4;
    property NKod5: Double read GetNKod5 write SetNKod5;
    property OnUretimMiktar: Double read GetOnUretimMiktar write SetOnUretimMiktar;
    property OpBasTarih: TDate read GetOpBasTarih write SetOpBasTarih;
    property OpBasTarihSaat: TDate read GetOpBasTarihSaat write SetOpBasTarihSaat;
    property OpBitTarih: TDate read GetOpBitTarih write SetOpBitTarih;
    property OpBitTarihSaat: TDate read GetOpBitTarihSaat write SetOpBitTarihSaat;
    property OpDurum: Integer read GetOpDurum write SetOpDurum;
    property OperasyonNo: Integer read GetOperasyonNo write SetOperasyonNo;
    property OpFireMiktar: Double read GetOpFireMiktar write SetOpFireMiktar;
    property OpMiktar: Double read GetOpMiktar write SetOpMiktar;
    property OpSure: Double read GetOpSure write SetOpSure;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SerbestMiktar: Double read GetSerbestMiktar write SetSerbestMiktar;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property SKod1: String read GetSKod1 write SetSKod1;
    property SKod2: String read GetSKod2 write SetSKod2;
    property SKod3: String read GetSKod3 write SetSKod3;
    property SKod4: String read GetSKod4 write SetSKod4;
    property SKod5: String read GetSKod5 write SetSKod5;
    property SokumMamulKod: String read GetSokumMamulKod write SetSokumMamulKod;
    property SokumSure: Double read GetSokumSure write SetSokumSure;
    property TasimaSure: Double read GetTasimaSure write SetTasimaSure;
    property ToplamSure: Double read GetToplamSure write SetToplamSure;
    property UretimNo: String read GetUretimNo write SetUretimNo;
    property UretimSiraNo: Integer read GetUretimSiraNo write SetUretimSiraNo;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fBeklemeSure:TField read GetfBeklemeSure;
    property fBKod1:TField read GetfBKod1;
    property fBKod2:TField read GetfBKod2;
    property fBKod3:TField read GetfBKod3;
    property fBKod4:TField read GetfBKod4;
    property fBKod5:TField read GetfBKod5;
    property fCalismaSure:TField read GetfCalismaSure;
    property fDurusSure:TField read GetfDurusSure;
    property fEvrakNo:TField read GetfEvrakNo;
    property fEvrakTip:TField read GetfEvrakTip;
    property fID:TField read GetfID;
    property fIsMerkezKod:TField read GetfIsMerkezKod;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakKod:TField read GetfKaynakKod;
    property fKullanilan:TField read GetfKullanilan;
    property fKullanimSiraNo:TField read GetfKullanimSiraNo;
    property fKurulumSure:TField read GetfKurulumSure;
    property fKuyrukSure:TField read GetfKuyrukSure;
    property fLKod1:TField read GetfLKod1;
    property fLKod2:TField read GetfLKod2;
    property fLKod3:TField read GetfLKod3;
    property fLKod4:TField read GetfLKod4;
    property fLKod5:TField read GetfLKod5;
    property fMamulKod:TField read GetfMamulKod;
    property fMiktar:TField read GetfMiktar;
    property fMKod1:TField read GetfMKod1;
    property fMKod2:TField read GetfMKod2;
    property fMKod3:TField read GetfMKod3;
    property fMKod4:TField read GetfMKod4;
    property fMKod5:TField read GetfMKod5;
    property fNKod1:TField read GetfNKod1;
    property fNKod2:TField read GetfNKod2;
    property fNKod3:TField read GetfNKod3;
    property fNKod4:TField read GetfNKod4;
    property fNKod5:TField read GetfNKod5;
    property fOnUretimMiktar:TField read GetfOnUretimMiktar;
    property fOpBasTarih:TField read GetfOpBasTarih;
    property fOpBasTarihSaat:TField read GetfOpBasTarihSaat;
    property fOpBitTarih:TField read GetfOpBitTarih;
    property fOpBitTarihSaat:TField read GetfOpBitTarihSaat;
    property fOpDurum:TField read GetfOpDurum;
    property fOperasyonNo:TField read GetfOperasyonNo;
    property fOpFireMiktar:TField read GetfOpFireMiktar;
    property fOpMiktar:TField read GetfOpMiktar;
    property fOpSure:TField read GetfOpSure;
    property fRowGuid:TField read GetfRowGuid;
    property fSerbestMiktar:TField read GetfSerbestMiktar;
    property fSirketNo:TField read GetfSirketNo;
    property fSKod1:TField read GetfSKod1;
    property fSKod2:TField read GetfSKod2;
    property fSKod3:TField read GetfSKod3;
    property fSKod4:TField read GetfSKod4;
    property fSKod5:TField read GetfSKod5;
    property fSokumMamulKod:TField read GetfSokumMamulKod;
    property fSokumSure:TField read GetfSokumSure;
    property fTasimaSure:TField read GetfTasimaSure;
    property fToplamSure:TField read GetfToplamSure;
    property fUretimNo:TField read GetfUretimNo;
    property fUretimSiraNo:TField read GetfUretimSiraNo;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableUretimRota = class(TAppTable)
  Private
    FfAciklama: TField;
    FfBKod1: TField;
    FfBKod2: TField;
    FfBKod3: TField;
    FfBKod4: TField;
    FfBKod5: TField;
    FfEvrakNo: TField;
    FfEvrakTip: TField;
    FfID: TField;
    FfIsMerkezKod: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfLKod1: TField;
    FfLKod2: TField;
    FfLKod3: TField;
    FfLKod4: TField;
    FfLKod5: TField;
    FfMamulKod: TField;
    FfMiktar: TField;
    FfMKod1: TField;
    FfMKod2: TField;
    FfMKod3: TField;
    FfMKod4: TField;
    FfMKod5: TField;
    FfNKod1: TField;
    FfNKod2: TField;
    FfNKod3: TField;
    FfNKod4: TField;
    FfNKod5: TField;
    FfOpBasTarih: TField;
    FfOpBasTarihSaat: TField;
    FfOpBitTarih: TField;
    FfOpBitTarihSaat: TField;
    FfOpDurum: TField;
    FfOperasyonNo: TField;
    FfOpFireMiktar: TField;
    FfOpMiktar: TField;
    FfOpSure: TField;
    FfRowGuid: TField;
    FfSerbestMiktar: TField;
    FfSerbestTarih: TField;
    FfSerbestTarihSaat: TField;
    FfSirketNo: TField;
    FfSKod1: TField;
    FfSKod2: TField;
    FfSKod3: TField;
    FfSKod4: TField;
    FfSKod5: TField;
    FfSonrakiOperasyonNo: TField;
    FfUretimNo: TField;
    FfUretimSiraNo: TField;
    FfVersiyonNo: TField;
    function GetAciklama: String;
    function GetBKod1: Integer;
    function GetBKod2: Integer;
    function GetBKod3: Integer;
    function GetBKod4: Integer;
    function GetBKod5: Integer;
    function GetEvrakNo: String;
    function GetEvrakTip: Integer;
    function GetID: Integer;
    function GetIsMerkezKod: String;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetLKod1: String;
    function GetLKod2: String;
    function GetLKod3: String;
    function GetLKod4: String;
    function GetLKod5: String;
    function GetMamulKod: String;
    function GetMiktar: Double;
    function GetMKod1: String;
    function GetMKod2: String;
    function GetMKod3: String;
    function GetMKod4: String;
    function GetMKod5: String;
    function GetNKod1: Double;
    function GetNKod2: Double;
    function GetNKod3: Double;
    function GetNKod4: Double;
    function GetNKod5: Double;
    function GetOpBasTarih: TDate;
    function GetOpBasTarihSaat: TDate;
    function GetOpBitTarih: TDate;
    function GetOpBitTarihSaat: TDate;
    function GetOpDurum: Integer;
    function GetOperasyonNo: Integer;
    function GetOpFireMiktar: Double;
    function GetOpMiktar: Double;
    function GetOpSure: Double;
    function GetRowGuid: String;
    function GetSerbestMiktar: Double;
    function GetSerbestTarih: TDate;
    function GetSerbestTarihSaat: TDate;
    function GetSirketNo: String;
    function GetSKod1: String;
    function GetSKod2: String;
    function GetSKod3: String;
    function GetSKod4: String;
    function GetSKod5: String;
    function GetSonrakiOperasyonNo: String;
    function GetUretimNo: String;
    function GetUretimSiraNo: Integer;
    function GetVersiyonNo: String;
    function GetfAciklama: TField;
    function GetfBKod1: TField;
    function GetfBKod2: TField;
    function GetfBKod3: TField;
    function GetfBKod4: TField;
    function GetfBKod5: TField;
    function GetfEvrakNo: TField;
    function GetfEvrakTip: TField;
    function GetfID: TField;
    function GetfIsMerkezKod: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfLKod1: TField;
    function GetfLKod2: TField;
    function GetfLKod3: TField;
    function GetfLKod4: TField;
    function GetfLKod5: TField;
    function GetfMamulKod: TField;
    function GetfMiktar: TField;
    function GetfMKod1: TField;
    function GetfMKod2: TField;
    function GetfMKod3: TField;
    function GetfMKod4: TField;
    function GetfMKod5: TField;
    function GetfNKod1: TField;
    function GetfNKod2: TField;
    function GetfNKod3: TField;
    function GetfNKod4: TField;
    function GetfNKod5: TField;
    function GetfOpBasTarih: TField;
    function GetfOpBasTarihSaat: TField;
    function GetfOpBitTarih: TField;
    function GetfOpBitTarihSaat: TField;
    function GetfOpDurum: TField;
    function GetfOperasyonNo: TField;
    function GetfOpFireMiktar: TField;
    function GetfOpMiktar: TField;
    function GetfOpSure: TField;
    function GetfRowGuid: TField;
    function GetfSerbestMiktar: TField;
    function GetfSerbestTarih: TField;
    function GetfSerbestTarihSaat: TField;
    function GetfSirketNo: TField;
    function GetfSKod1: TField;
    function GetfSKod2: TField;
    function GetfSKod3: TField;
    function GetfSKod4: TField;
    function GetfSKod5: TField;
    function GetfSonrakiOperasyonNo: TField;
    function GetfUretimNo: TField;
    function GetfUretimSiraNo: TField;
    function GetfVersiyonNo: TField;
    procedure SetAciklama(const Value: String);
    procedure SetBKod1(const Value: Integer);
    procedure SetBKod2(const Value: Integer);
    procedure SetBKod3(const Value: Integer);
    procedure SetBKod4(const Value: Integer);
    procedure SetBKod5(const Value: Integer);
    procedure SetEvrakNo(const Value: String);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetIsMerkezKod(const Value: String);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetLKod1(const Value: String);
    procedure SetLKod2(const Value: String);
    procedure SetLKod3(const Value: String);
    procedure SetLKod4(const Value: String);
    procedure SetLKod5(const Value: String);
    procedure SetMamulKod(const Value: String);
    procedure SetMiktar(const Value: Double);
    procedure SetMKod1(const Value: String);
    procedure SetMKod2(const Value: String);
    procedure SetMKod3(const Value: String);
    procedure SetMKod4(const Value: String);
    procedure SetMKod5(const Value: String);
    procedure SetNKod1(const Value: Double);
    procedure SetNKod2(const Value: Double);
    procedure SetNKod3(const Value: Double);
    procedure SetNKod4(const Value: Double);
    procedure SetNKod5(const Value: Double);
    procedure SetOpBasTarih(const Value: TDate);
    procedure SetOpBasTarihSaat(const Value: TDate);
    procedure SetOpBitTarih(const Value: TDate);
    procedure SetOpBitTarihSaat(const Value: TDate);
    procedure SetOpDurum(const Value: Integer);
    procedure SetOperasyonNo(const Value: Integer);
    procedure SetOpFireMiktar(const Value: Double);
    procedure SetOpMiktar(const Value: Double);
    procedure SetOpSure(const Value: Double);
    procedure SetRowGuid(const Value: String);
    procedure SetSerbestMiktar(const Value: Double);
    procedure SetSerbestTarih(const Value: TDate);
    procedure SetSerbestTarihSaat(const Value: TDate);
    procedure SetSirketNo(const Value: String);
    procedure SetSKod1(const Value: String);
    procedure SetSKod2(const Value: String);
    procedure SetSKod3(const Value: String);
    procedure SetSKod4(const Value: String);
    procedure SetSKod5(const Value: String);
    procedure SetSonrakiOperasyonNo(const Value: String);
    procedure SetUretimNo(const Value: String);
    procedure SetUretimSiraNo(const Value: Integer);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property BKod1: Integer read GetBKod1 write SetBKod1;
    property BKod2: Integer read GetBKod2 write SetBKod2;
    property BKod3: Integer read GetBKod3 write SetBKod3;
    property BKod4: Integer read GetBKod4 write SetBKod4;
    property BKod5: Integer read GetBKod5 write SetBKod5;
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property ID: Integer read GetID write SetID;
    property IsMerkezKod: String read GetIsMerkezKod write SetIsMerkezKod;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property LKod1: String read GetLKod1 write SetLKod1;
    property LKod2: String read GetLKod2 write SetLKod2;
    property LKod3: String read GetLKod3 write SetLKod3;
    property LKod4: String read GetLKod4 write SetLKod4;
    property LKod5: String read GetLKod5 write SetLKod5;
    property MamulKod: String read GetMamulKod write SetMamulKod;
    property Miktar: Double read GetMiktar write SetMiktar;
    property MKod1: String read GetMKod1 write SetMKod1;
    property MKod2: String read GetMKod2 write SetMKod2;
    property MKod3: String read GetMKod3 write SetMKod3;
    property MKod4: String read GetMKod4 write SetMKod4;
    property MKod5: String read GetMKod5 write SetMKod5;
    property NKod1: Double read GetNKod1 write SetNKod1;
    property NKod2: Double read GetNKod2 write SetNKod2;
    property NKod3: Double read GetNKod3 write SetNKod3;
    property NKod4: Double read GetNKod4 write SetNKod4;
    property NKod5: Double read GetNKod5 write SetNKod5;
    property OpBasTarih: TDate read GetOpBasTarih write SetOpBasTarih;
    property OpBasTarihSaat: TDate read GetOpBasTarihSaat write SetOpBasTarihSaat;
    property OpBitTarih: TDate read GetOpBitTarih write SetOpBitTarih;
    property OpBitTarihSaat: TDate read GetOpBitTarihSaat write SetOpBitTarihSaat;
    property OpDurum: Integer read GetOpDurum write SetOpDurum;
    property OperasyonNo: Integer read GetOperasyonNo write SetOperasyonNo;
    property OpFireMiktar: Double read GetOpFireMiktar write SetOpFireMiktar;
    property OpMiktar: Double read GetOpMiktar write SetOpMiktar;
    property OpSure: Double read GetOpSure write SetOpSure;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SerbestMiktar: Double read GetSerbestMiktar write SetSerbestMiktar;
    property SerbestTarih: TDate read GetSerbestTarih write SetSerbestTarih;
    property SerbestTarihSaat: TDate read GetSerbestTarihSaat write SetSerbestTarihSaat;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property SKod1: String read GetSKod1 write SetSKod1;
    property SKod2: String read GetSKod2 write SetSKod2;
    property SKod3: String read GetSKod3 write SetSKod3;
    property SKod4: String read GetSKod4 write SetSKod4;
    property SKod5: String read GetSKod5 write SetSKod5;
    property SonrakiOperasyonNo: String read GetSonrakiOperasyonNo write SetSonrakiOperasyonNo;
    property UretimNo: String read GetUretimNo write SetUretimNo;
    property UretimSiraNo: Integer read GetUretimSiraNo write SetUretimSiraNo;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fAciklama:TField read GetfAciklama;
    property fBKod1:TField read GetfBKod1;
    property fBKod2:TField read GetfBKod2;
    property fBKod3:TField read GetfBKod3;
    property fBKod4:TField read GetfBKod4;
    property fBKod5:TField read GetfBKod5;
    property fEvrakNo:TField read GetfEvrakNo;
    property fEvrakTip:TField read GetfEvrakTip;
    property fID:TField read GetfID;
    property fIsMerkezKod:TField read GetfIsMerkezKod;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fLKod1:TField read GetfLKod1;
    property fLKod2:TField read GetfLKod2;
    property fLKod3:TField read GetfLKod3;
    property fLKod4:TField read GetfLKod4;
    property fLKod5:TField read GetfLKod5;
    property fMamulKod:TField read GetfMamulKod;
    property fMiktar:TField read GetfMiktar;
    property fMKod1:TField read GetfMKod1;
    property fMKod2:TField read GetfMKod2;
    property fMKod3:TField read GetfMKod3;
    property fMKod4:TField read GetfMKod4;
    property fMKod5:TField read GetfMKod5;
    property fNKod1:TField read GetfNKod1;
    property fNKod2:TField read GetfNKod2;
    property fNKod3:TField read GetfNKod3;
    property fNKod4:TField read GetfNKod4;
    property fNKod5:TField read GetfNKod5;
    property fOpBasTarih:TField read GetfOpBasTarih;
    property fOpBasTarihSaat:TField read GetfOpBasTarihSaat;
    property fOpBitTarih:TField read GetfOpBitTarih;
    property fOpBitTarihSaat:TField read GetfOpBitTarihSaat;
    property fOpDurum:TField read GetfOpDurum;
    property fOperasyonNo:TField read GetfOperasyonNo;
    property fOpFireMiktar:TField read GetfOpFireMiktar;
    property fOpMiktar:TField read GetfOpMiktar;
    property fOpSure:TField read GetfOpSure;
    property fRowGuid:TField read GetfRowGuid;
    property fSerbestMiktar:TField read GetfSerbestMiktar;
    property fSerbestTarih:TField read GetfSerbestTarih;
    property fSerbestTarihSaat:TField read GetfSerbestTarihSaat;
    property fSirketNo:TField read GetfSirketNo;
    property fSKod1:TField read GetfSKod1;
    property fSKod2:TField read GetfSKod2;
    property fSKod3:TField read GetfSKod3;
    property fSKod4:TField read GetfSKod4;
    property fSKod5:TField read GetfSKod5;
    property fSonrakiOperasyonNo:TField read GetfSonrakiOperasyonNo;
    property fUretimNo:TField read GetfUretimNo;
    property fUretimSiraNo:TField read GetfUretimSiraNo;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

implementation

{ TTableUretimBaglanti }

constructor TTableUretimBaglanti.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTBAG';
end;

procedure TTableUretimBaglanti.DoAfterOpen;
begin
  if FfBaglantiEvrakNo = nil then
    FfBaglantiEvrakNo := FindField('BAGLANTIEVRAKNO');
  if FfBaglantiEvrakTip = nil then
    FfBaglantiEvrakTip := FindField('BAGLANTIEVRAKTIP');
  if FfBaglantiHesapKod = nil then
    FfBaglantiHesapKod := FindField('BAGLANTIHESAPKOD');
  if FfBaglantiSiraNo = nil then
    FfBaglantiSiraNo := FindField('BAGLANTISIRANO');
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKapat = nil then
    FfKapat := FindField('KAPAT');
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  if FfKonsolideSirketNo = nil then
    FfKonsolideSirketNo := FindField('KONSOLIDESIRKETNO');
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  inherited;
end;

procedure TTableUretimBaglanti.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfBaglantiEvrakNo := nil;
    FfBaglantiEvrakTip := nil;
    FfBaglantiHesapKod := nil;
    FfBaglantiSiraNo := nil;
    FfEvrakTip := nil;
    FfHesapKod := nil;
    FfID := nil;
    FfKapat := nil;
    FfKaynakEvrakNo := nil;
    FfKaynakEvrakTip := nil;
    FfKaynakHesapKod := nil;
    FfKaynakSiraNo := nil;
    FfKonsolideSirketNo := nil;
    FfMiktar := nil;
    FfRowGuid := nil;
    FfSiraNo := nil;
    FfSirketNo := nil;
    FfUretimNo := nil;
  end;
  inherited;
end;

function TTableUretimBaglanti.GetBaglantiEvrakNo: String;
begin
  if FfBaglantiEvrakNo = nil then
    FfBaglantiEvrakNo := FindField('BAGLANTIEVRAKNO');
  Result := FfBaglantiEvrakNo.AsString;
end;

function TTableUretimBaglanti.GetBaglantiEvrakTip: Integer;
begin
  if FfBaglantiEvrakTip = nil then
    FfBaglantiEvrakTip := FindField('BAGLANTIEVRAKTIP');
  Result := FfBaglantiEvrakTip.AsInteger;
end;

function TTableUretimBaglanti.GetBaglantiHesapKod: String;
begin
  if FfBaglantiHesapKod = nil then
    FfBaglantiHesapKod := FindField('BAGLANTIHESAPKOD');
  Result := FfBaglantiHesapKod.AsString;
end;

function TTableUretimBaglanti.GetBaglantiSiraNo: Integer;
begin
  if FfBaglantiSiraNo = nil then
    FfBaglantiSiraNo := FindField('BAGLANTISIRANO');
  Result := FfBaglantiSiraNo.AsInteger;
end;

function TTableUretimBaglanti.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableUretimBaglanti.GetHesapKod: String;
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  Result := FfHesapKod.AsString;
end;

function TTableUretimBaglanti.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimBaglanti.GetKapat: Integer;
begin
  if FfKapat = nil then
    FfKapat := FindField('KAPAT');
  Result := FfKapat.AsInteger;
end;

function TTableUretimBaglanti.GetKaynakEvrakNo: String;
begin
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  Result := FfKaynakEvrakNo.AsString;
end;

function TTableUretimBaglanti.GetKaynakEvrakTip: Integer;
begin
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  Result := FfKaynakEvrakTip.AsInteger;
end;

function TTableUretimBaglanti.GetKaynakHesapKod: String;
begin
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  Result := FfKaynakHesapKod.AsString;
end;

function TTableUretimBaglanti.GetKaynakSiraNo: Integer;
begin
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  Result := FfKaynakSiraNo.AsInteger;
end;

function TTableUretimBaglanti.GetKonsolideSirketNo: String;
begin
  if FfKonsolideSirketNo = nil then
    FfKonsolideSirketNo := FindField('KONSOLIDESIRKETNO');
  Result := FfKonsolideSirketNo.AsString;
end;

function TTableUretimBaglanti.GetMiktar: Double;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar.AsFloat;
end;

function TTableUretimBaglanti.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimBaglanti.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableUretimBaglanti.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimBaglanti.GetUretimNo: String;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo.AsString;
end;

function TTableUretimBaglanti.GetfBaglantiEvrakNo: TField;
begin
  if FfBaglantiEvrakNo = nil then
    FfBaglantiEvrakNo := FindField('BAGLANTIEVRAKNO');
  Result := FfBaglantiEvrakNo;
end;

function TTableUretimBaglanti.GetfBaglantiEvrakTip: TField;
begin
  if FfBaglantiEvrakTip = nil then
    FfBaglantiEvrakTip := FindField('BAGLANTIEVRAKTIP');
  Result := FfBaglantiEvrakTip;
end;

function TTableUretimBaglanti.GetfBaglantiHesapKod: TField;
begin
  if FfBaglantiHesapKod = nil then
    FfBaglantiHesapKod := FindField('BAGLANTIHESAPKOD');
  Result := FfBaglantiHesapKod;
end;

function TTableUretimBaglanti.GetfBaglantiSiraNo: TField;
begin
  if FfBaglantiSiraNo = nil then
    FfBaglantiSiraNo := FindField('BAGLANTISIRANO');
  Result := FfBaglantiSiraNo;
end;

function TTableUretimBaglanti.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableUretimBaglanti.GetfHesapKod: TField;
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  Result := FfHesapKod;
end;

function TTableUretimBaglanti.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimBaglanti.GetfKapat: TField;
begin
  if FfKapat = nil then
    FfKapat := FindField('KAPAT');
  Result := FfKapat;
end;

function TTableUretimBaglanti.GetfKaynakEvrakNo: TField;
begin
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  Result := FfKaynakEvrakNo;
end;

function TTableUretimBaglanti.GetfKaynakEvrakTip: TField;
begin
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  Result := FfKaynakEvrakTip;
end;

function TTableUretimBaglanti.GetfKaynakHesapKod: TField;
begin
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  Result := FfKaynakHesapKod;
end;

function TTableUretimBaglanti.GetfKaynakSiraNo: TField;
begin
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  Result := FfKaynakSiraNo;
end;

function TTableUretimBaglanti.GetfKonsolideSirketNo: TField;
begin
  if FfKonsolideSirketNo = nil then
    FfKonsolideSirketNo := FindField('KONSOLIDESIRKETNO');
  Result := FfKonsolideSirketNo;
end;

function TTableUretimBaglanti.GetfMiktar: TField;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar;
end;

function TTableUretimBaglanti.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimBaglanti.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableUretimBaglanti.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimBaglanti.GetfUretimNo: TField;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo;
end;

procedure TTableUretimBaglanti.SetBaglantiEvrakNo(const Value: String);
begin
  if FfBaglantiEvrakNo = nil then
    FfBaglantiEvrakNo := FindField('BAGLANTIEVRAKNO');
  FfBaglantiEvrakNo.AsString := Value;
end;

procedure TTableUretimBaglanti.SetBaglantiEvrakTip(const Value: Integer);
begin
  if FfBaglantiEvrakTip = nil then
    FfBaglantiEvrakTip := FindField('BAGLANTIEVRAKTIP');
  FfBaglantiEvrakTip.AsInteger := Value;
end;

procedure TTableUretimBaglanti.SetBaglantiHesapKod(const Value: String);
begin
  if FfBaglantiHesapKod = nil then
    FfBaglantiHesapKod := FindField('BAGLANTIHESAPKOD');
  FfBaglantiHesapKod.AsString := Value;
end;

procedure TTableUretimBaglanti.SetBaglantiSiraNo(const Value: Integer);
begin
  if FfBaglantiSiraNo = nil then
    FfBaglantiSiraNo := FindField('BAGLANTISIRANO');
  FfBaglantiSiraNo.AsInteger := Value;
end;

procedure TTableUretimBaglanti.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableUretimBaglanti.SetHesapKod(const Value: String);
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  FfHesapKod.AsString := Value;
end;

procedure TTableUretimBaglanti.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimBaglanti.SetKapat(const Value: Integer);
begin
  if FfKapat = nil then
    FfKapat := FindField('KAPAT');
  FfKapat.AsInteger := Value;
end;

procedure TTableUretimBaglanti.SetKaynakEvrakNo(const Value: String);
begin
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  FfKaynakEvrakNo.AsString := Value;
end;

procedure TTableUretimBaglanti.SetKaynakEvrakTip(const Value: Integer);
begin
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  FfKaynakEvrakTip.AsInteger := Value;
end;

procedure TTableUretimBaglanti.SetKaynakHesapKod(const Value: String);
begin
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  FfKaynakHesapKod.AsString := Value;
end;

procedure TTableUretimBaglanti.SetKaynakSiraNo(const Value: Integer);
begin
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  FfKaynakSiraNo.AsInteger := Value;
end;

procedure TTableUretimBaglanti.SetKonsolideSirketNo(const Value: String);
begin
  if FfKonsolideSirketNo = nil then
    FfKonsolideSirketNo := FindField('KONSOLIDESIRKETNO');
  FfKonsolideSirketNo.AsString := Value;
end;

procedure TTableUretimBaglanti.SetMiktar(const Value: Double);
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  FfMiktar.AsFloat := Value;
end;

procedure TTableUretimBaglanti.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimBaglanti.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableUretimBaglanti.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimBaglanti.SetUretimNo(const Value: String);
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  FfUretimNo.AsString := Value;
end;

{ TTableUretimBaslik }

constructor TTableUretimBaslik.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTBAS';
end;

procedure TTableUretimBaslik.DoAfterOpen;
begin
  if FfBanka = nil then
    FfBanka := FindField('BANKA');
  if FfDovizTarih = nil then
    FfDovizTarih := FindField('DOVIZTARIH');
  if FfDovizTip = nil then
    FfDovizTip := FindField('DOVIZTIP');
  if FfEvrakTarih = nil then
    FfEvrakTarih := FindField('EVRAKTARIH');
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  if FfFazlaMesaiDakika = nil then
    FfFazlaMesaiDakika := FindField('FAZLAMESAIDAKIKA');
  if FfFazlaMesaiVardiyaKod = nil then
    FfFazlaMesaiVardiyaKod := FindField('FAZLAMESAIVARDIYAKOD');
  if FfFiyatSablonNo = nil then
    FfFiyatSablonNo := FindField('FIYATSABLONNO');
  if FfFiyatSekli = nil then
    FfFiyatSekli := FindField('FIYATSEKLI');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKullanimSekli = nil then
    FfKullanimSekli := FindField('KULLANIMSEKLI');
  if FfMaliyetTip = nil then
    FfMaliyetTip := FindField('MALIYETTIP');
  if FfSeviye = nil then
    FfSeviye := FindField('SEVIYE');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  if FfUretimTarih = nil then
    FfUretimTarih := FindField('URETIMTARIH');
  inherited;
end;

procedure TTableUretimBaslik.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfBanka := nil;
    FfDovizTarih := nil;
    FfDovizTip := nil;
    FfEvrakTarih := nil;
    FfEvrakTip := nil;
    FfFazlaMesaiDakika := nil;
    FfFazlaMesaiVardiyaKod := nil;
    FfFiyatSablonNo := nil;
    FfFiyatSekli := nil;
    FfID := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKullanimSekli := nil;
    FfMaliyetTip := nil;
    FfSeviye := nil;
    FfSirketNo := nil;
    FfTakvimKod := nil;
    FfUretimNo := nil;
    FfUretimTarih := nil;
  end;
  inherited;
end;

function TTableUretimBaslik.GetBanka: Integer;
begin
  if FfBanka = nil then
    FfBanka := FindField('BANKA');
  Result := FfBanka.AsInteger;
end;

function TTableUretimBaslik.GetDovizTarih: TDate;
begin
  if FfDovizTarih = nil then
    FfDovizTarih := FindField('DOVIZTARIH');
  Result := FfDovizTarih.AsDateTime;
end;

function TTableUretimBaslik.GetDovizTip: Integer;
begin
  if FfDovizTip = nil then
    FfDovizTip := FindField('DOVIZTIP');
  Result := FfDovizTip.AsInteger;
end;

function TTableUretimBaslik.GetEvrakTarih: TDate;
begin
  if FfEvrakTarih = nil then
    FfEvrakTarih := FindField('EVRAKTARIH');
  Result := FfEvrakTarih.AsDateTime;
end;

function TTableUretimBaslik.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableUretimBaslik.GetFazlaMesaiDakika: Integer;
begin
  if FfFazlaMesaiDakika = nil then
    FfFazlaMesaiDakika := FindField('FAZLAMESAIDAKIKA');
  Result := FfFazlaMesaiDakika.AsInteger;
end;

function TTableUretimBaslik.GetFazlaMesaiVardiyaKod: String;
begin
  if FfFazlaMesaiVardiyaKod = nil then
    FfFazlaMesaiVardiyaKod := FindField('FAZLAMESAIVARDIYAKOD');
  Result := FfFazlaMesaiVardiyaKod.AsString;
end;

function TTableUretimBaslik.GetFiyatSablonNo: Integer;
begin
  if FfFiyatSablonNo = nil then
    FfFiyatSablonNo := FindField('FIYATSABLONNO');
  Result := FfFiyatSablonNo.AsInteger;
end;

function TTableUretimBaslik.GetFiyatSekli: String;
begin
  if FfFiyatSekli = nil then
    FfFiyatSekli := FindField('FIYATSEKLI');
  Result := FfFiyatSekli.AsString;
end;

function TTableUretimBaslik.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimBaslik.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableUretimBaslik.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimBaslik.GetKullanimSekli: Integer;
begin
  if FfKullanimSekli = nil then
    FfKullanimSekli := FindField('KULLANIMSEKLI');
  Result := FfKullanimSekli.AsInteger;
end;

function TTableUretimBaslik.GetMaliyetTip: Integer;
begin
  if FfMaliyetTip = nil then
    FfMaliyetTip := FindField('MALIYETTIP');
  Result := FfMaliyetTip.AsInteger;
end;

function TTableUretimBaslik.GetSeviye: Integer;
begin
  if FfSeviye = nil then
    FfSeviye := FindField('SEVIYE');
  Result := FfSeviye.AsInteger;
end;

function TTableUretimBaslik.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimBaslik.GetTakvimKod: String;
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  Result := FfTakvimKod.AsString;
end;

function TTableUretimBaslik.GetUretimNo: String;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo.AsString;
end;

function TTableUretimBaslik.GetUretimTarih: TDate;
begin
  if FfUretimTarih = nil then
    FfUretimTarih := FindField('URETIMTARIH');
  Result := FfUretimTarih.AsDateTime;
end;

function TTableUretimBaslik.GetfBanka: TField;
begin
  if FfBanka = nil then
    FfBanka := FindField('BANKA');
  Result := FfBanka;
end;

function TTableUretimBaslik.GetfDovizTarih: TField;
begin
  if FfDovizTarih = nil then
    FfDovizTarih := FindField('DOVIZTARIH');
  Result := FfDovizTarih;
end;

function TTableUretimBaslik.GetfDovizTip: TField;
begin
  if FfDovizTip = nil then
    FfDovizTip := FindField('DOVIZTIP');
  Result := FfDovizTip;
end;

function TTableUretimBaslik.GetfEvrakTarih: TField;
begin
  if FfEvrakTarih = nil then
    FfEvrakTarih := FindField('EVRAKTARIH');
  Result := FfEvrakTarih;
end;

function TTableUretimBaslik.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableUretimBaslik.GetfFazlaMesaiDakika: TField;
begin
  if FfFazlaMesaiDakika = nil then
    FfFazlaMesaiDakika := FindField('FAZLAMESAIDAKIKA');
  Result := FfFazlaMesaiDakika;
end;

function TTableUretimBaslik.GetfFazlaMesaiVardiyaKod: TField;
begin
  if FfFazlaMesaiVardiyaKod = nil then
    FfFazlaMesaiVardiyaKod := FindField('FAZLAMESAIVARDIYAKOD');
  Result := FfFazlaMesaiVardiyaKod;
end;

function TTableUretimBaslik.GetfFiyatSablonNo: TField;
begin
  if FfFiyatSablonNo = nil then
    FfFiyatSablonNo := FindField('FIYATSABLONNO');
  Result := FfFiyatSablonNo;
end;

function TTableUretimBaslik.GetfFiyatSekli: TField;
begin
  if FfFiyatSekli = nil then
    FfFiyatSekli := FindField('FIYATSEKLI');
  Result := FfFiyatSekli;
end;

function TTableUretimBaslik.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimBaslik.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableUretimBaslik.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimBaslik.GetfKullanimSekli: TField;
begin
  if FfKullanimSekli = nil then
    FfKullanimSekli := FindField('KULLANIMSEKLI');
  Result := FfKullanimSekli;
end;

function TTableUretimBaslik.GetfMaliyetTip: TField;
begin
  if FfMaliyetTip = nil then
    FfMaliyetTip := FindField('MALIYETTIP');
  Result := FfMaliyetTip;
end;

function TTableUretimBaslik.GetfSeviye: TField;
begin
  if FfSeviye = nil then
    FfSeviye := FindField('SEVIYE');
  Result := FfSeviye;
end;

function TTableUretimBaslik.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimBaslik.GetfTakvimKod: TField;
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  Result := FfTakvimKod;
end;

function TTableUretimBaslik.GetfUretimNo: TField;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo;
end;

function TTableUretimBaslik.GetfUretimTarih: TField;
begin
  if FfUretimTarih = nil then
    FfUretimTarih := FindField('URETIMTARIH');
  Result := FfUretimTarih;
end;

procedure TTableUretimBaslik.SetBanka(const Value: Integer);
begin
  if FfBanka = nil then
    FfBanka := FindField('BANKA');
  FfBanka.AsInteger := Value;
end;

procedure TTableUretimBaslik.SetDovizTarih(const Value: TDate);
begin
  if FfDovizTarih = nil then
    FfDovizTarih := FindField('DOVIZTARIH');
  FfDovizTarih.AsDateTime := Value;
end;

procedure TTableUretimBaslik.SetDovizTip(const Value: Integer);
begin
  if FfDovizTip = nil then
    FfDovizTip := FindField('DOVIZTIP');
  FfDovizTip.AsInteger := Value;
end;

procedure TTableUretimBaslik.SetEvrakTarih(const Value: TDate);
begin
  if FfEvrakTarih = nil then
    FfEvrakTarih := FindField('EVRAKTARIH');
  FfEvrakTarih.AsDateTime := Value;
end;

procedure TTableUretimBaslik.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableUretimBaslik.SetFazlaMesaiDakika(const Value: Integer);
begin
  if FfFazlaMesaiDakika = nil then
    FfFazlaMesaiDakika := FindField('FAZLAMESAIDAKIKA');
  FfFazlaMesaiDakika.AsInteger := Value;
end;

procedure TTableUretimBaslik.SetFazlaMesaiVardiyaKod(const Value: String);
begin
  if FfFazlaMesaiVardiyaKod = nil then
    FfFazlaMesaiVardiyaKod := FindField('FAZLAMESAIVARDIYAKOD');
  FfFazlaMesaiVardiyaKod.AsString := Value;
end;

procedure TTableUretimBaslik.SetFiyatSablonNo(const Value: Integer);
begin
  if FfFiyatSablonNo = nil then
    FfFiyatSablonNo := FindField('FIYATSABLONNO');
  FfFiyatSablonNo.AsInteger := Value;
end;

procedure TTableUretimBaslik.SetFiyatSekli(const Value: String);
begin
  if FfFiyatSekli = nil then
    FfFiyatSekli := FindField('FIYATSEKLI');
  FfFiyatSekli.AsString := Value;
end;

procedure TTableUretimBaslik.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimBaslik.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableUretimBaslik.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimBaslik.SetKullanimSekli(const Value: Integer);
begin
  if FfKullanimSekli = nil then
    FfKullanimSekli := FindField('KULLANIMSEKLI');
  FfKullanimSekli.AsInteger := Value;
end;

procedure TTableUretimBaslik.SetMaliyetTip(const Value: Integer);
begin
  if FfMaliyetTip = nil then
    FfMaliyetTip := FindField('MALIYETTIP');
  FfMaliyetTip.AsInteger := Value;
end;

procedure TTableUretimBaslik.SetSeviye(const Value: Integer);
begin
  if FfSeviye = nil then
    FfSeviye := FindField('SEVIYE');
  FfSeviye.AsInteger := Value;
end;

procedure TTableUretimBaslik.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimBaslik.SetTakvimKod(const Value: String);
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  FfTakvimKod.AsString := Value;
end;

procedure TTableUretimBaslik.SetUretimNo(const Value: String);
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  FfUretimNo.AsString := Value;
end;

procedure TTableUretimBaslik.SetUretimTarih(const Value: TDate);
begin
  if FfUretimTarih = nil then
    FfUretimTarih := FindField('URETIMTARIH');
  FfUretimTarih.AsDateTime := Value;
end;

{ TTableUretimHareket }

constructor TTableUretimHareket.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTHAR';
end;

procedure TTableUretimHareket.DoAfterOpen;
begin
  if FfFiyatMaliyet = nil then
    FfFiyatMaliyet := FindField('_FIYATMALIYET');
  if FfFiyatMaliyetGrup1 = nil then
    FfFiyatMaliyetGrup1 := FindField('_FIYATMALIYETGRUP1');
  if FfFiyatMaliyetGrup2 = nil then
    FfFiyatMaliyetGrup2 := FindField('_FIYATMALIYETGRUP2');
  if FfFiyatMaliyetGrup3 = nil then
    FfFiyatMaliyetGrup3 := FindField('_FIYATMALIYETGRUP3');
  if FfFiyatMaliyetGrup4 = nil then
    FfFiyatMaliyetGrup4 := FindField('_FIYATMALIYETGRUP4');
  if FfFiyatMaliyetGrupDiger = nil then
    FfFiyatMaliyetGrupDiger := FindField('_FIYATMALIYETGRUPDIGER');
  if FfMaliyetGrup1 = nil then
    FfMaliyetGrup1 := FindField('_MALIYETGRUP1');
  if FfMaliyetGrup2 = nil then
    FfMaliyetGrup2 := FindField('_MALIYETGRUP2');
  if FfMaliyetGrup3 = nil then
    FfMaliyetGrup3 := FindField('_MALIYETGRUP3');
  if FfMaliyetGrup4 = nil then
    FfMaliyetGrup4 := FindField('_MALIYETGRUP4');
  if FfMaliyetGrupDiger = nil then
    FfMaliyetGrupDiger := FindField('_MALIYETGRUPDIGER');
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  if FfAnaMamulKod = nil then
    FfAnaMamulKod := FindField('ANAMAMULKOD');
  if FfAnaSiraNo = nil then
    FfAnaSiraNo := FindField('ANASIRANO');
  if FfBilesenFireOran = nil then
    FfBilesenFireOran := FindField('BILESENFIREORAN');
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  if FfBirimMaliyet = nil then
    FfBirimMaliyet := FindField('BIRIMMALIYET');
  if FfBirimMaliyet1 = nil then
    FfBirimMaliyet1 := FindField('BIRIMMALIYET1');
  if FfBirimMaliyet1DovizCins = nil then
    FfBirimMaliyet1DovizCins := FindField('BIRIMMALIYET1DOVIZCINS');
  if FfBirimMaliyet1DovizKur = nil then
    FfBirimMaliyet1DovizKur := FindField('BIRIMMALIYET1DOVIZKUR');
  if FfBirimMaliyet2 = nil then
    FfBirimMaliyet2 := FindField('BIRIMMALIYET2');
  if FfBirimMaliyet3 = nil then
    FfBirimMaliyet3 := FindField('BIRIMMALIYET3');
  if FfBirimMiktar = nil then
    FfBirimMiktar := FindField('BIRIMMIKTAR');
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  if FfDovizCins = nil then
    FfDovizCins := FindField('DOVIZCINS');
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  if FfEvrakTarih = nil then
    FfEvrakTarih := FindField('EVRAKTARIH');
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  if FfGirisCikis = nil then
    FfGirisCikis := FindField('GIRISCIKIS');
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKullanimSekli = nil then
    FfKullanimSekli := FindField('KULLANIMSEKLI');
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  if FfMaliyet = nil then
    FfMaliyet := FindField('MALIYET');
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('MALIYET1');
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('MALIYET2');
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('MALIYET3');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  if FfMiktarTip = nil then
    FfMiktarTip := FindField('MIKTARTIP');
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  if FfOperasyonFireKullan = nil then
    FfOperasyonFireKullan := FindField('OPERASYONFIREKULLAN');
  if FfOperasyonFireMiktar = nil then
    FfOperasyonFireMiktar := FindField('OPERASYONFIREMIKTAR');
  if FfOperasyonFireOran = nil then
    FfOperasyonFireOran := FindField('OPERASYONFIREORAN');
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  if FfPozNo = nil then
    FfPozNo := FindField('POZNO');
  if FfProjeKod = nil then
    FfProjeKod := FindField('PROJEKOD');
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  if FfReceteSiraNo = nil then
    FfReceteSiraNo := FindField('RECETESIRANO');
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSeriNo = nil then
    FfSeriNo := FindField('SERINO');
  if FfSeriNo2 = nil then
    FfSeriNo2 := FindField('SERINO2');
  if FfSeviyeKod = nil then
    FfSeviyeKod := FindField('SEVIYEKOD');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
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
  if FfKullanilabilir = nil then
    FfKullanilabilir := FindField('STKDRM_KULLANILABILIR');
  if FfStokCikis = nil then
    FfStokCikis := FindField('STKDRM_STOKCIKIS');
  if FfStokGiris = nil then
    FfStokGiris := FindField('STKDRM_STOKGIRIS');
  if FfStokMiktar = nil then
    FfStokMiktar := FindField('STKDRM_STOKMIKTAR');
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  if FfTip = nil then
    FfTip := FindField('TIP');
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableUretimHareket.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfFiyatMaliyet := nil;
    FfFiyatMaliyetGrup1 := nil;
    FfFiyatMaliyetGrup2 := nil;
    FfFiyatMaliyetGrup3 := nil;
    FfFiyatMaliyetGrup4 := nil;
    FfFiyatMaliyetGrupDiger := nil;
    FfMaliyetGrup1 := nil;
    FfMaliyetGrup2 := nil;
    FfMaliyetGrup3 := nil;
    FfMaliyetGrup4 := nil;
    FfMaliyetGrupDiger := nil;
    FfAciklama1 := nil;
    FfAciklama2 := nil;
    FfAciklama3 := nil;
    FfAciklama4 := nil;
    FfAciklama5 := nil;
    FfAnaMamulKod := nil;
    FfAnaSiraNo := nil;
    FfBilesenFireOran := nil;
    FfBirim := nil;
    FfBirimMaliyet := nil;
    FfBirimMaliyet1 := nil;
    FfBirimMaliyet1DovizCins := nil;
    FfBirimMaliyet1DovizKur := nil;
    FfBirimMaliyet2 := nil;
    FfBirimMaliyet3 := nil;
    FfBirimMiktar := nil;
    FfBKod1 := nil;
    FfBKod2 := nil;
    FfBKod3 := nil;
    FfBKod4 := nil;
    FfBKod5 := nil;
    FfDepoKod := nil;
    FfDovizCins := nil;
    FfEvrakNo := nil;
    FfEvrakTarih := nil;
    FfEvrakTip := nil;
    FfGirisCikis := nil;
    FfHesapKod := nil;
    FfID := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKullanimSekli := nil;
    FfLKod1 := nil;
    FfLKod2 := nil;
    FfLKod3 := nil;
    FfLKod4 := nil;
    FfLKod5 := nil;
    FfMaliyet := nil;
    FfMaliyet1 := nil;
    FfMaliyet2 := nil;
    FfMaliyet3 := nil;
    FfMalKod := nil;
    FfMamulKod := nil;
    FfMiktar := nil;
    FfMiktarTip := nil;
    FfMKod1 := nil;
    FfMKod2 := nil;
    FfMKod3 := nil;
    FfMKod4 := nil;
    FfMKod5 := nil;
    FfNKod1 := nil;
    FfNKod2 := nil;
    FfNKod3 := nil;
    FfNKod4 := nil;
    FfNKod5 := nil;
    FfOperasyonFireKullan := nil;
    FfOperasyonFireMiktar := nil;
    FfOperasyonFireOran := nil;
    FfOperasyonNo := nil;
    FfPozNo := nil;
    FfProjeKod := nil;
    FfReceteNo := nil;
    FfReceteSiraNo := nil;
    FfRevizyonNo := nil;
    FfRowGuid := nil;
    FfSeriNo := nil;
    FfSeriNo2 := nil;
    FfSeviyeKod := nil;
    FfSiraNo := nil;
    FfSirketNo := nil;
    FfSKod1 := nil;
    FfSKod2 := nil;
    FfSKod3 := nil;
    FfSKod4 := nil;
    FfSKod5 := nil;
    FfKullanilabilir := nil;
    FfStokCikis := nil;
    FfStokGiris := nil;
    FfStokMiktar := nil;
    FfMalAd := nil;
    FfSurumNo := nil;
    FfTip := nil;
    FfUretimNo := nil;
    FfUretimSiraNo := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableUretimHareket.GetFiyatMaliyet: Double;
begin
  if FfFiyatMaliyet = nil then
    FfFiyatMaliyet := FindField('_FIYATMALIYET');
  Result := FfFiyatMaliyet.AsFloat;
end;

function TTableUretimHareket.GetFiyatMaliyetGrup1: Double;
begin
  if FfFiyatMaliyetGrup1 = nil then
    FfFiyatMaliyetGrup1 := FindField('_FIYATMALIYETGRUP1');
  Result := FfFiyatMaliyetGrup1.AsFloat;
end;

function TTableUretimHareket.GetFiyatMaliyetGrup2: Double;
begin
  if FfFiyatMaliyetGrup2 = nil then
    FfFiyatMaliyetGrup2 := FindField('_FIYATMALIYETGRUP2');
  Result := FfFiyatMaliyetGrup2.AsFloat;
end;

function TTableUretimHareket.GetFiyatMaliyetGrup3: Double;
begin
  if FfFiyatMaliyetGrup3 = nil then
    FfFiyatMaliyetGrup3 := FindField('_FIYATMALIYETGRUP3');
  Result := FfFiyatMaliyetGrup3.AsFloat;
end;

function TTableUretimHareket.GetFiyatMaliyetGrup4: Double;
begin
  if FfFiyatMaliyetGrup4 = nil then
    FfFiyatMaliyetGrup4 := FindField('_FIYATMALIYETGRUP4');
  Result := FfFiyatMaliyetGrup4.AsFloat;
end;

function TTableUretimHareket.GetFiyatMaliyetGrupDiger: Double;
begin
  if FfFiyatMaliyetGrupDiger = nil then
    FfFiyatMaliyetGrupDiger := FindField('_FIYATMALIYETGRUPDIGER');
  Result := FfFiyatMaliyetGrupDiger.AsFloat;
end;

function TTableUretimHareket.GetMaliyetGrup1: Double;
begin
  if FfMaliyetGrup1 = nil then
    FfMaliyetGrup1 := FindField('_MALIYETGRUP1');
  Result := FfMaliyetGrup1.AsFloat;
end;

function TTableUretimHareket.GetMaliyetGrup2: Double;
begin
  if FfMaliyetGrup2 = nil then
    FfMaliyetGrup2 := FindField('_MALIYETGRUP2');
  Result := FfMaliyetGrup2.AsFloat;
end;

function TTableUretimHareket.GetMaliyetGrup3: Double;
begin
  if FfMaliyetGrup3 = nil then
    FfMaliyetGrup3 := FindField('_MALIYETGRUP3');
  Result := FfMaliyetGrup3.AsFloat;
end;

function TTableUretimHareket.GetMaliyetGrup4: Double;
begin
  if FfMaliyetGrup4 = nil then
    FfMaliyetGrup4 := FindField('_MALIYETGRUP4');
  Result := FfMaliyetGrup4.AsFloat;
end;

function TTableUretimHareket.GetMaliyetGrupDiger: Double;
begin
  if FfMaliyetGrupDiger = nil then
    FfMaliyetGrupDiger := FindField('_MALIYETGRUPDIGER');
  Result := FfMaliyetGrupDiger.AsFloat;
end;

function TTableUretimHareket.GetAciklama1: String;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1.AsString;
end;

function TTableUretimHareket.GetAciklama2: String;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2.AsString;
end;

function TTableUretimHareket.GetAciklama3: String;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3.AsString;
end;

function TTableUretimHareket.GetAciklama4: String;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4.AsString;
end;

function TTableUretimHareket.GetAciklama5: String;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5.AsString;
end;

function TTableUretimHareket.GetAnaMamulKod: String;
begin
  if FfAnaMamulKod = nil then
    FfAnaMamulKod := FindField('ANAMAMULKOD');
  Result := FfAnaMamulKod.AsString;
end;

function TTableUretimHareket.GetAnaSiraNo: Integer;
begin
  if FfAnaSiraNo = nil then
    FfAnaSiraNo := FindField('ANASIRANO');
  Result := FfAnaSiraNo.AsInteger;
end;

function TTableUretimHareket.GetBilesenFireOran: Double;
begin
  if FfBilesenFireOran = nil then
    FfBilesenFireOran := FindField('BILESENFIREORAN');
  Result := FfBilesenFireOran.AsFloat;
end;

function TTableUretimHareket.GetBirim: String;
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  Result := FfBirim.AsString;
end;

function TTableUretimHareket.GetBirimMaliyet: Double;
begin
  if FfBirimMaliyet = nil then
    FfBirimMaliyet := FindField('BIRIMMALIYET');
  Result := FfBirimMaliyet.AsFloat;
end;

function TTableUretimHareket.GetBirimMaliyet1: Double;
begin
  if FfBirimMaliyet1 = nil then
    FfBirimMaliyet1 := FindField('BIRIMMALIYET1');
  Result := FfBirimMaliyet1.AsFloat;
end;

function TTableUretimHareket.GetBirimMaliyet1DovizCins: String;
begin
  if FfBirimMaliyet1DovizCins = nil then
    FfBirimMaliyet1DovizCins := FindField('BIRIMMALIYET1DOVIZCINS');
  Result := FfBirimMaliyet1DovizCins.AsString;
end;

function TTableUretimHareket.GetBirimMaliyet1DovizKur: Double;
begin
  if FfBirimMaliyet1DovizKur = nil then
    FfBirimMaliyet1DovizKur := FindField('BIRIMMALIYET1DOVIZKUR');
  Result := FfBirimMaliyet1DovizKur.AsFloat;
end;

function TTableUretimHareket.GetBirimMaliyet2: Double;
begin
  if FfBirimMaliyet2 = nil then
    FfBirimMaliyet2 := FindField('BIRIMMALIYET2');
  Result := FfBirimMaliyet2.AsFloat;
end;

function TTableUretimHareket.GetBirimMaliyet3: Double;
begin
  if FfBirimMaliyet3 = nil then
    FfBirimMaliyet3 := FindField('BIRIMMALIYET3');
  Result := FfBirimMaliyet3.AsFloat;
end;

function TTableUretimHareket.GetBirimMiktar: Double;
begin
  if FfBirimMiktar = nil then
    FfBirimMiktar := FindField('BIRIMMIKTAR');
  Result := FfBirimMiktar.AsFloat;
end;

function TTableUretimHareket.GetBKod1: Integer;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1.AsInteger;
end;

function TTableUretimHareket.GetBKod2: Integer;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2.AsInteger;
end;

function TTableUretimHareket.GetBKod3: Integer;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3.AsInteger;
end;

function TTableUretimHareket.GetBKod4: Integer;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4.AsInteger;
end;

function TTableUretimHareket.GetBKod5: Integer;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5.AsInteger;
end;

function TTableUretimHareket.GetDepoKod: String;
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  Result := FfDepoKod.AsString;
end;

function TTableUretimHareket.GetDovizCins: String;
begin
  if FfDovizCins = nil then
    FfDovizCins := FindField('DOVIZCINS');
  Result := FfDovizCins.AsString;
end;

function TTableUretimHareket.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableUretimHareket.GetEvrakTarih: TDate;
begin
  if FfEvrakTarih = nil then
    FfEvrakTarih := FindField('EVRAKTARIH');
  Result := FfEvrakTarih.AsDateTime;
end;

function TTableUretimHareket.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableUretimHareket.GetGirisCikis: Integer;
begin
  if FfGirisCikis = nil then
    FfGirisCikis := FindField('GIRISCIKIS');
  Result := FfGirisCikis.AsInteger;
end;

function TTableUretimHareket.GetHesapKod: String;
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  Result := FfHesapKod.AsString;
end;

function TTableUretimHareket.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimHareket.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableUretimHareket.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimHareket.GetKullanimSekli: Integer;
begin
  if FfKullanimSekli = nil then
    FfKullanimSekli := FindField('KULLANIMSEKLI');
  Result := FfKullanimSekli.AsInteger;
end;

function TTableUretimHareket.GetLKod1: String;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1.AsString;
end;

function TTableUretimHareket.GetLKod2: String;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2.AsString;
end;

function TTableUretimHareket.GetLKod3: String;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3.AsString;
end;

function TTableUretimHareket.GetLKod4: String;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4.AsString;
end;

function TTableUretimHareket.GetLKod5: String;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5.AsString;
end;

function TTableUretimHareket.GetMaliyet: Double;
begin
  if FfMaliyet = nil then
    FfMaliyet := FindField('MALIYET');
  Result := FfMaliyet.AsFloat;
end;

function TTableUretimHareket.GetMaliyet1: Double;
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('MALIYET1');
  Result := FfMaliyet1.AsFloat;
end;

function TTableUretimHareket.GetMaliyet2: Double;
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('MALIYET2');
  Result := FfMaliyet2.AsFloat;
end;

function TTableUretimHareket.GetMaliyet3: Double;
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('MALIYET3');
  Result := FfMaliyet3.AsFloat;
end;

function TTableUretimHareket.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableUretimHareket.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableUretimHareket.GetMiktar: Double;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar.AsFloat;
end;

function TTableUretimHareket.GetMiktarTip: Integer;
begin
  if FfMiktarTip = nil then
    FfMiktarTip := FindField('MIKTARTIP');
  Result := FfMiktarTip.AsInteger;
end;

function TTableUretimHareket.GetMKod1: String;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1.AsString;
end;

function TTableUretimHareket.GetMKod2: String;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2.AsString;
end;

function TTableUretimHareket.GetMKod3: String;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3.AsString;
end;

function TTableUretimHareket.GetMKod4: String;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4.AsString;
end;

function TTableUretimHareket.GetMKod5: String;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5.AsString;
end;

function TTableUretimHareket.GetNKod1: Double;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1.AsFloat;
end;

function TTableUretimHareket.GetNKod2: Double;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2.AsFloat;
end;

function TTableUretimHareket.GetNKod3: Double;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3.AsFloat;
end;

function TTableUretimHareket.GetNKod4: Double;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4.AsFloat;
end;

function TTableUretimHareket.GetNKod5: Double;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5.AsFloat;
end;

function TTableUretimHareket.GetOperasyonFireKullan: Integer;
begin
  if FfOperasyonFireKullan = nil then
    FfOperasyonFireKullan := FindField('OPERASYONFIREKULLAN');
  Result := FfOperasyonFireKullan.AsInteger;
end;

function TTableUretimHareket.GetOperasyonFireMiktar: Double;
begin
  if FfOperasyonFireMiktar = nil then
    FfOperasyonFireMiktar := FindField('OPERASYONFIREMIKTAR');
  Result := FfOperasyonFireMiktar.AsFloat;
end;

function TTableUretimHareket.GetOperasyonFireOran: Double;
begin
  if FfOperasyonFireOran = nil then
    FfOperasyonFireOran := FindField('OPERASYONFIREORAN');
  Result := FfOperasyonFireOran.AsFloat;
end;

function TTableUretimHareket.GetOperasyonNo: Integer;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo.AsInteger;
end;

function TTableUretimHareket.GetPozNo: String;
begin
  if FfPozNo = nil then
    FfPozNo := FindField('POZNO');
  Result := FfPozNo.AsString;
end;

function TTableUretimHareket.GetProjeKod: String;
begin
  if FfProjeKod = nil then
    FfProjeKod := FindField('PROJEKOD');
  Result := FfProjeKod.AsString;
end;

function TTableUretimHareket.GetReceteNo: String;
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  Result := FfReceteNo.AsString;
end;

function TTableUretimHareket.GetReceteSiraNo: Integer;
begin
  if FfReceteSiraNo = nil then
    FfReceteSiraNo := FindField('RECETESIRANO');
  Result := FfReceteSiraNo.AsInteger;
end;

function TTableUretimHareket.GetRevizyonNo: String;
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  Result := FfRevizyonNo.AsString;
end;

function TTableUretimHareket.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimHareket.GetSeriNo: String;
begin
  if FfSeriNo = nil then
    FfSeriNo := FindField('SERINO');
  Result := FfSeriNo.AsString;
end;

function TTableUretimHareket.GetSeriNo2: String;
begin
  if FfSeriNo2 = nil then
    FfSeriNo2 := FindField('SERINO2');
  Result := FfSeriNo2.AsString;
end;

function TTableUretimHareket.GetSeviyeKod: Integer;
begin
  if FfSeviyeKod = nil then
    FfSeviyeKod := FindField('SEVIYEKOD');
  Result := FfSeviyeKod.AsInteger;
end;

function TTableUretimHareket.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableUretimHareket.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimHareket.GetSKod1: String;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1.AsString;
end;

function TTableUretimHareket.GetSKod2: String;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2.AsString;
end;

function TTableUretimHareket.GetSKod3: String;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3.AsString;
end;

function TTableUretimHareket.GetSKod4: String;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4.AsString;
end;

function TTableUretimHareket.GetSKod5: String;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5.AsString;
end;

function TTableUretimHareket.GetKullanilabilir: Double;
begin
  if FfKullanilabilir = nil then
    FfKullanilabilir := FindField('STKDRM_KULLANILABILIR');
  Result := FfKullanilabilir.AsFloat;
end;

function TTableUretimHareket.GetStokCikis: Double;
begin
  if FfStokCikis = nil then
    FfStokCikis := FindField('STKDRM_STOKCIKIS');
  Result := FfStokCikis.AsFloat;
end;

function TTableUretimHareket.GetStokGiris: Double;
begin
  if FfStokGiris = nil then
    FfStokGiris := FindField('STKDRM_STOKGIRIS');
  Result := FfStokGiris.AsFloat;
end;

function TTableUretimHareket.GetStokMiktar: Double;
begin
  if FfStokMiktar = nil then
    FfStokMiktar := FindField('STKDRM_STOKMIKTAR');
  Result := FfStokMiktar.AsFloat;
end;

function TTableUretimHareket.GetMalAd: String;
begin
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  Result := FfMalAd.AsString;
end;

function TTableUretimHareket.GetSurumNo: Integer;
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  Result := FfSurumNo.AsInteger;
end;

function TTableUretimHareket.GetTip: Integer;
begin
  if FfTip = nil then
    FfTip := FindField('TIP');
  Result := FfTip.AsInteger;
end;

function TTableUretimHareket.GetUretimNo: String;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo.AsString;
end;

function TTableUretimHareket.GetUretimSiraNo: Integer;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo.AsInteger;
end;

function TTableUretimHareket.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableUretimHareket.GetfFiyatMaliyet: TField;
begin
  if FfFiyatMaliyet = nil then
    FfFiyatMaliyet := FindField('_FIYATMALIYET');
  Result := FfFiyatMaliyet;
end;

function TTableUretimHareket.GetfFiyatMaliyetGrup1: TField;
begin
  if FfFiyatMaliyetGrup1 = nil then
    FfFiyatMaliyetGrup1 := FindField('_FIYATMALIYETGRUP1');
  Result := FfFiyatMaliyetGrup1;
end;

function TTableUretimHareket.GetfFiyatMaliyetGrup2: TField;
begin
  if FfFiyatMaliyetGrup2 = nil then
    FfFiyatMaliyetGrup2 := FindField('_FIYATMALIYETGRUP2');
  Result := FfFiyatMaliyetGrup2;
end;

function TTableUretimHareket.GetfFiyatMaliyetGrup3: TField;
begin
  if FfFiyatMaliyetGrup3 = nil then
    FfFiyatMaliyetGrup3 := FindField('_FIYATMALIYETGRUP3');
  Result := FfFiyatMaliyetGrup3;
end;

function TTableUretimHareket.GetfFiyatMaliyetGrup4: TField;
begin
  if FfFiyatMaliyetGrup4 = nil then
    FfFiyatMaliyetGrup4 := FindField('_FIYATMALIYETGRUP4');
  Result := FfFiyatMaliyetGrup4;
end;

function TTableUretimHareket.GetfFiyatMaliyetGrupDiger: TField;
begin
  if FfFiyatMaliyetGrupDiger = nil then
    FfFiyatMaliyetGrupDiger := FindField('_FIYATMALIYETGRUPDIGER');
  Result := FfFiyatMaliyetGrupDiger;
end;

function TTableUretimHareket.GetfMaliyetGrup1: TField;
begin
  if FfMaliyetGrup1 = nil then
    FfMaliyetGrup1 := FindField('_MALIYETGRUP1');
  Result := FfMaliyetGrup1;
end;

function TTableUretimHareket.GetfMaliyetGrup2: TField;
begin
  if FfMaliyetGrup2 = nil then
    FfMaliyetGrup2 := FindField('_MALIYETGRUP2');
  Result := FfMaliyetGrup2;
end;

function TTableUretimHareket.GetfMaliyetGrup3: TField;
begin
  if FfMaliyetGrup3 = nil then
    FfMaliyetGrup3 := FindField('_MALIYETGRUP3');
  Result := FfMaliyetGrup3;
end;

function TTableUretimHareket.GetfMaliyetGrup4: TField;
begin
  if FfMaliyetGrup4 = nil then
    FfMaliyetGrup4 := FindField('_MALIYETGRUP4');
  Result := FfMaliyetGrup4;
end;

function TTableUretimHareket.GetfMaliyetGrupDiger: TField;
begin
  if FfMaliyetGrupDiger = nil then
    FfMaliyetGrupDiger := FindField('_MALIYETGRUPDIGER');
  Result := FfMaliyetGrupDiger;
end;

function TTableUretimHareket.GetfAciklama1: TField;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1;
end;

function TTableUretimHareket.GetfAciklama2: TField;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2;
end;

function TTableUretimHareket.GetfAciklama3: TField;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3;
end;

function TTableUretimHareket.GetfAciklama4: TField;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4;
end;

function TTableUretimHareket.GetfAciklama5: TField;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5;
end;

function TTableUretimHareket.GetfAnaMamulKod: TField;
begin
  if FfAnaMamulKod = nil then
    FfAnaMamulKod := FindField('ANAMAMULKOD');
  Result := FfAnaMamulKod;
end;

function TTableUretimHareket.GetfAnaSiraNo: TField;
begin
  if FfAnaSiraNo = nil then
    FfAnaSiraNo := FindField('ANASIRANO');
  Result := FfAnaSiraNo;
end;

function TTableUretimHareket.GetfBilesenFireOran: TField;
begin
  if FfBilesenFireOran = nil then
    FfBilesenFireOran := FindField('BILESENFIREORAN');
  Result := FfBilesenFireOran;
end;

function TTableUretimHareket.GetfBirim: TField;
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  Result := FfBirim;
end;

function TTableUretimHareket.GetfBirimMaliyet: TField;
begin
  if FfBirimMaliyet = nil then
    FfBirimMaliyet := FindField('BIRIMMALIYET');
  Result := FfBirimMaliyet;
end;

function TTableUretimHareket.GetfBirimMaliyet1: TField;
begin
  if FfBirimMaliyet1 = nil then
    FfBirimMaliyet1 := FindField('BIRIMMALIYET1');
  Result := FfBirimMaliyet1;
end;

function TTableUretimHareket.GetfBirimMaliyet1DovizCins: TField;
begin
  if FfBirimMaliyet1DovizCins = nil then
    FfBirimMaliyet1DovizCins := FindField('BIRIMMALIYET1DOVIZCINS');
  Result := FfBirimMaliyet1DovizCins;
end;

function TTableUretimHareket.GetfBirimMaliyet1DovizKur: TField;
begin
  if FfBirimMaliyet1DovizKur = nil then
    FfBirimMaliyet1DovizKur := FindField('BIRIMMALIYET1DOVIZKUR');
  Result := FfBirimMaliyet1DovizKur;
end;

function TTableUretimHareket.GetfBirimMaliyet2: TField;
begin
  if FfBirimMaliyet2 = nil then
    FfBirimMaliyet2 := FindField('BIRIMMALIYET2');
  Result := FfBirimMaliyet2;
end;

function TTableUretimHareket.GetfBirimMaliyet3: TField;
begin
  if FfBirimMaliyet3 = nil then
    FfBirimMaliyet3 := FindField('BIRIMMALIYET3');
  Result := FfBirimMaliyet3;
end;

function TTableUretimHareket.GetfBirimMiktar: TField;
begin
  if FfBirimMiktar = nil then
    FfBirimMiktar := FindField('BIRIMMIKTAR');
  Result := FfBirimMiktar;
end;

function TTableUretimHareket.GetfBKod1: TField;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1;
end;

function TTableUretimHareket.GetfBKod2: TField;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2;
end;

function TTableUretimHareket.GetfBKod3: TField;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3;
end;

function TTableUretimHareket.GetfBKod4: TField;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4;
end;

function TTableUretimHareket.GetfBKod5: TField;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5;
end;

function TTableUretimHareket.GetfDepoKod: TField;
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  Result := FfDepoKod;
end;

function TTableUretimHareket.GetfDovizCins: TField;
begin
  if FfDovizCins = nil then
    FfDovizCins := FindField('DOVIZCINS');
  Result := FfDovizCins;
end;

function TTableUretimHareket.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableUretimHareket.GetfEvrakTarih: TField;
begin
  if FfEvrakTarih = nil then
    FfEvrakTarih := FindField('EVRAKTARIH');
  Result := FfEvrakTarih;
end;

function TTableUretimHareket.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableUretimHareket.GetfGirisCikis: TField;
begin
  if FfGirisCikis = nil then
    FfGirisCikis := FindField('GIRISCIKIS');
  Result := FfGirisCikis;
end;

function TTableUretimHareket.GetfHesapKod: TField;
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  Result := FfHesapKod;
end;

function TTableUretimHareket.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimHareket.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableUretimHareket.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimHareket.GetfKullanimSekli: TField;
begin
  if FfKullanimSekli = nil then
    FfKullanimSekli := FindField('KULLANIMSEKLI');
  Result := FfKullanimSekli;
end;

function TTableUretimHareket.GetfLKod1: TField;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1;
end;

function TTableUretimHareket.GetfLKod2: TField;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2;
end;

function TTableUretimHareket.GetfLKod3: TField;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3;
end;

function TTableUretimHareket.GetfLKod4: TField;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4;
end;

function TTableUretimHareket.GetfLKod5: TField;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5;
end;

function TTableUretimHareket.GetfMaliyet: TField;
begin
  if FfMaliyet = nil then
    FfMaliyet := FindField('MALIYET');
  Result := FfMaliyet;
end;

function TTableUretimHareket.GetfMaliyet1: TField;
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('MALIYET1');
  Result := FfMaliyet1;
end;

function TTableUretimHareket.GetfMaliyet2: TField;
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('MALIYET2');
  Result := FfMaliyet2;
end;

function TTableUretimHareket.GetfMaliyet3: TField;
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('MALIYET3');
  Result := FfMaliyet3;
end;

function TTableUretimHareket.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableUretimHareket.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableUretimHareket.GetfMiktar: TField;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar;
end;

function TTableUretimHareket.GetfMiktarTip: TField;
begin
  if FfMiktarTip = nil then
    FfMiktarTip := FindField('MIKTARTIP');
  Result := FfMiktarTip;
end;

function TTableUretimHareket.GetfMKod1: TField;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1;
end;

function TTableUretimHareket.GetfMKod2: TField;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2;
end;

function TTableUretimHareket.GetfMKod3: TField;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3;
end;

function TTableUretimHareket.GetfMKod4: TField;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4;
end;

function TTableUretimHareket.GetfMKod5: TField;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5;
end;

function TTableUretimHareket.GetfNKod1: TField;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1;
end;

function TTableUretimHareket.GetfNKod2: TField;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2;
end;

function TTableUretimHareket.GetfNKod3: TField;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3;
end;

function TTableUretimHareket.GetfNKod4: TField;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4;
end;

function TTableUretimHareket.GetfNKod5: TField;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5;
end;

function TTableUretimHareket.GetfOperasyonFireKullan: TField;
begin
  if FfOperasyonFireKullan = nil then
    FfOperasyonFireKullan := FindField('OPERASYONFIREKULLAN');
  Result := FfOperasyonFireKullan;
end;

function TTableUretimHareket.GetfOperasyonFireMiktar: TField;
begin
  if FfOperasyonFireMiktar = nil then
    FfOperasyonFireMiktar := FindField('OPERASYONFIREMIKTAR');
  Result := FfOperasyonFireMiktar;
end;

function TTableUretimHareket.GetfOperasyonFireOran: TField;
begin
  if FfOperasyonFireOran = nil then
    FfOperasyonFireOran := FindField('OPERASYONFIREORAN');
  Result := FfOperasyonFireOran;
end;

function TTableUretimHareket.GetfOperasyonNo: TField;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo;
end;

function TTableUretimHareket.GetfPozNo: TField;
begin
  if FfPozNo = nil then
    FfPozNo := FindField('POZNO');
  Result := FfPozNo;
end;

function TTableUretimHareket.GetfProjeKod: TField;
begin
  if FfProjeKod = nil then
    FfProjeKod := FindField('PROJEKOD');
  Result := FfProjeKod;
end;

function TTableUretimHareket.GetfReceteNo: TField;
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  Result := FfReceteNo;
end;

function TTableUretimHareket.GetfReceteSiraNo: TField;
begin
  if FfReceteSiraNo = nil then
    FfReceteSiraNo := FindField('RECETESIRANO');
  Result := FfReceteSiraNo;
end;

function TTableUretimHareket.GetfRevizyonNo: TField;
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  Result := FfRevizyonNo;
end;

function TTableUretimHareket.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimHareket.GetfSeriNo: TField;
begin
  if FfSeriNo = nil then
    FfSeriNo := FindField('SERINO');
  Result := FfSeriNo;
end;

function TTableUretimHareket.GetfSeriNo2: TField;
begin
  if FfSeriNo2 = nil then
    FfSeriNo2 := FindField('SERINO2');
  Result := FfSeriNo2;
end;

function TTableUretimHareket.GetfSeviyeKod: TField;
begin
  if FfSeviyeKod = nil then
    FfSeviyeKod := FindField('SEVIYEKOD');
  Result := FfSeviyeKod;
end;

function TTableUretimHareket.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableUretimHareket.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimHareket.GetfSKod1: TField;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1;
end;

function TTableUretimHareket.GetfSKod2: TField;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2;
end;

function TTableUretimHareket.GetfSKod3: TField;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3;
end;

function TTableUretimHareket.GetfSKod4: TField;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4;
end;

function TTableUretimHareket.GetfSKod5: TField;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5;
end;

function TTableUretimHareket.GetfKullanilabilir: TField;
begin
  if FfKullanilabilir = nil then
    FfKullanilabilir := FindField('STKDRM_KULLANILABILIR');
  Result := FfKullanilabilir;
end;

function TTableUretimHareket.GetfStokCikis: TField;
begin
  if FfStokCikis = nil then
    FfStokCikis := FindField('STKDRM_STOKCIKIS');
  Result := FfStokCikis;
end;

function TTableUretimHareket.GetfStokGiris: TField;
begin
  if FfStokGiris = nil then
    FfStokGiris := FindField('STKDRM_STOKGIRIS');
  Result := FfStokGiris;
end;

function TTableUretimHareket.GetfStokMiktar: TField;
begin
  if FfStokMiktar = nil then
    FfStokMiktar := FindField('STKDRM_STOKMIKTAR');
  Result := FfStokMiktar;
end;

function TTableUretimHareket.GetfMalAd: TField;
begin
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  Result := FfMalAd;
end;

function TTableUretimHareket.GetfSurumNo: TField;
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  Result := FfSurumNo;
end;

function TTableUretimHareket.GetfTip: TField;
begin
  if FfTip = nil then
    FfTip := FindField('TIP');
  Result := FfTip;
end;

function TTableUretimHareket.GetfUretimNo: TField;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo;
end;

function TTableUretimHareket.GetfUretimSiraNo: TField;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo;
end;

function TTableUretimHareket.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableUretimHareket.SetFiyatMaliyet(const Value: Double);
begin
  if FfFiyatMaliyet = nil then
    FfFiyatMaliyet := FindField('_FIYATMALIYET');
  FfFiyatMaliyet.AsFloat := Value;
end;

procedure TTableUretimHareket.SetFiyatMaliyetGrup1(const Value: Double);
begin
  if FfFiyatMaliyetGrup1 = nil then
    FfFiyatMaliyetGrup1 := FindField('_FIYATMALIYETGRUP1');
  FfFiyatMaliyetGrup1.AsFloat := Value;
end;

procedure TTableUretimHareket.SetFiyatMaliyetGrup2(const Value: Double);
begin
  if FfFiyatMaliyetGrup2 = nil then
    FfFiyatMaliyetGrup2 := FindField('_FIYATMALIYETGRUP2');
  FfFiyatMaliyetGrup2.AsFloat := Value;
end;

procedure TTableUretimHareket.SetFiyatMaliyetGrup3(const Value: Double);
begin
  if FfFiyatMaliyetGrup3 = nil then
    FfFiyatMaliyetGrup3 := FindField('_FIYATMALIYETGRUP3');
  FfFiyatMaliyetGrup3.AsFloat := Value;
end;

procedure TTableUretimHareket.SetFiyatMaliyetGrup4(const Value: Double);
begin
  if FfFiyatMaliyetGrup4 = nil then
    FfFiyatMaliyetGrup4 := FindField('_FIYATMALIYETGRUP4');
  FfFiyatMaliyetGrup4.AsFloat := Value;
end;

procedure TTableUretimHareket.SetFiyatMaliyetGrupDiger(const Value: Double);
begin
  if FfFiyatMaliyetGrupDiger = nil then
    FfFiyatMaliyetGrupDiger := FindField('_FIYATMALIYETGRUPDIGER');
  FfFiyatMaliyetGrupDiger.AsFloat := Value;
end;

procedure TTableUretimHareket.SetMaliyetGrup1(const Value: Double);
begin
  if FfMaliyetGrup1 = nil then
    FfMaliyetGrup1 := FindField('_MALIYETGRUP1');
  FfMaliyetGrup1.AsFloat := Value;
end;

procedure TTableUretimHareket.SetMaliyetGrup2(const Value: Double);
begin
  if FfMaliyetGrup2 = nil then
    FfMaliyetGrup2 := FindField('_MALIYETGRUP2');
  FfMaliyetGrup2.AsFloat := Value;
end;

procedure TTableUretimHareket.SetMaliyetGrup3(const Value: Double);
begin
  if FfMaliyetGrup3 = nil then
    FfMaliyetGrup3 := FindField('_MALIYETGRUP3');
  FfMaliyetGrup3.AsFloat := Value;
end;

procedure TTableUretimHareket.SetMaliyetGrup4(const Value: Double);
begin
  if FfMaliyetGrup4 = nil then
    FfMaliyetGrup4 := FindField('_MALIYETGRUP4');
  FfMaliyetGrup4.AsFloat := Value;
end;

procedure TTableUretimHareket.SetMaliyetGrupDiger(const Value: Double);
begin
  if FfMaliyetGrupDiger = nil then
    FfMaliyetGrupDiger := FindField('_MALIYETGRUPDIGER');
  FfMaliyetGrupDiger.AsFloat := Value;
end;

procedure TTableUretimHareket.SetAciklama1(const Value: String);
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  FfAciklama1.AsString := Value;
end;

procedure TTableUretimHareket.SetAciklama2(const Value: String);
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  FfAciklama2.AsString := Value;
end;

procedure TTableUretimHareket.SetAciklama3(const Value: String);
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  FfAciklama3.AsString := Value;
end;

procedure TTableUretimHareket.SetAciklama4(const Value: String);
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  FfAciklama4.AsString := Value;
end;

procedure TTableUretimHareket.SetAciklama5(const Value: String);
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  FfAciklama5.AsString := Value;
end;

procedure TTableUretimHareket.SetAnaMamulKod(const Value: String);
begin
  if FfAnaMamulKod = nil then
    FfAnaMamulKod := FindField('ANAMAMULKOD');
  FfAnaMamulKod.AsString := Value;
end;

procedure TTableUretimHareket.SetAnaSiraNo(const Value: Integer);
begin
  if FfAnaSiraNo = nil then
    FfAnaSiraNo := FindField('ANASIRANO');
  FfAnaSiraNo.AsInteger := Value;
end;

procedure TTableUretimHareket.SetBilesenFireOran(const Value: Double);
begin
  if FfBilesenFireOran = nil then
    FfBilesenFireOran := FindField('BILESENFIREORAN');
  FfBilesenFireOran.AsFloat := Value;
end;

procedure TTableUretimHareket.SetBirim(const Value: String);
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  FfBirim.AsString := Value;
end;

procedure TTableUretimHareket.SetBirimMaliyet(const Value: Double);
begin
  if FfBirimMaliyet = nil then
    FfBirimMaliyet := FindField('BIRIMMALIYET');
  FfBirimMaliyet.AsFloat := Value;
end;

procedure TTableUretimHareket.SetBirimMaliyet1(const Value: Double);
begin
  if FfBirimMaliyet1 = nil then
    FfBirimMaliyet1 := FindField('BIRIMMALIYET1');
  FfBirimMaliyet1.AsFloat := Value;
end;

procedure TTableUretimHareket.SetBirimMaliyet1DovizCins(const Value: String);
begin
  if FfBirimMaliyet1DovizCins = nil then
    FfBirimMaliyet1DovizCins := FindField('BIRIMMALIYET1DOVIZCINS');
  FfBirimMaliyet1DovizCins.AsString := Value;
end;

procedure TTableUretimHareket.SetBirimMaliyet1DovizKur(const Value: Double);
begin
  if FfBirimMaliyet1DovizKur = nil then
    FfBirimMaliyet1DovizKur := FindField('BIRIMMALIYET1DOVIZKUR');
  FfBirimMaliyet1DovizKur.AsFloat := Value;
end;

procedure TTableUretimHareket.SetBirimMaliyet2(const Value: Double);
begin
  if FfBirimMaliyet2 = nil then
    FfBirimMaliyet2 := FindField('BIRIMMALIYET2');
  FfBirimMaliyet2.AsFloat := Value;
end;

procedure TTableUretimHareket.SetBirimMaliyet3(const Value: Double);
begin
  if FfBirimMaliyet3 = nil then
    FfBirimMaliyet3 := FindField('BIRIMMALIYET3');
  FfBirimMaliyet3.AsFloat := Value;
end;

procedure TTableUretimHareket.SetBirimMiktar(const Value: Double);
begin
  if FfBirimMiktar = nil then
    FfBirimMiktar := FindField('BIRIMMIKTAR');
  FfBirimMiktar.AsFloat := Value;
end;

procedure TTableUretimHareket.SetBKod1(const Value: Integer);
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  FfBKod1.AsInteger := Value;
end;

procedure TTableUretimHareket.SetBKod2(const Value: Integer);
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  FfBKod2.AsInteger := Value;
end;

procedure TTableUretimHareket.SetBKod3(const Value: Integer);
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  FfBKod3.AsInteger := Value;
end;

procedure TTableUretimHareket.SetBKod4(const Value: Integer);
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  FfBKod4.AsInteger := Value;
end;

procedure TTableUretimHareket.SetBKod5(const Value: Integer);
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  FfBKod5.AsInteger := Value;
end;

procedure TTableUretimHareket.SetDepoKod(const Value: String);
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  FfDepoKod.AsString := Value;
end;

procedure TTableUretimHareket.SetDovizCins(const Value: String);
begin
  if FfDovizCins = nil then
    FfDovizCins := FindField('DOVIZCINS');
  FfDovizCins.AsString := Value;
end;

procedure TTableUretimHareket.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableUretimHareket.SetEvrakTarih(const Value: TDate);
begin
  if FfEvrakTarih = nil then
    FfEvrakTarih := FindField('EVRAKTARIH');
  FfEvrakTarih.AsDateTime := Value;
end;

procedure TTableUretimHareket.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableUretimHareket.SetGirisCikis(const Value: Integer);
begin
  if FfGirisCikis = nil then
    FfGirisCikis := FindField('GIRISCIKIS');
  FfGirisCikis.AsInteger := Value;
end;

procedure TTableUretimHareket.SetHesapKod(const Value: String);
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  FfHesapKod.AsString := Value;
end;

procedure TTableUretimHareket.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimHareket.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableUretimHareket.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimHareket.SetKullanimSekli(const Value: Integer);
begin
  if FfKullanimSekli = nil then
    FfKullanimSekli := FindField('KULLANIMSEKLI');
  FfKullanimSekli.AsInteger := Value;
end;

procedure TTableUretimHareket.SetLKod1(const Value: String);
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  FfLKod1.AsString := Value;
end;

procedure TTableUretimHareket.SetLKod2(const Value: String);
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  FfLKod2.AsString := Value;
end;

procedure TTableUretimHareket.SetLKod3(const Value: String);
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  FfLKod3.AsString := Value;
end;

procedure TTableUretimHareket.SetLKod4(const Value: String);
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  FfLKod4.AsString := Value;
end;

procedure TTableUretimHareket.SetLKod5(const Value: String);
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  FfLKod5.AsString := Value;
end;

procedure TTableUretimHareket.SetMaliyet(const Value: Double);
begin
  if FfMaliyet = nil then
    FfMaliyet := FindField('MALIYET');
  FfMaliyet.AsFloat := Value;
end;

procedure TTableUretimHareket.SetMaliyet1(const Value: Double);
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('MALIYET1');
  FfMaliyet1.AsFloat := Value;
end;

procedure TTableUretimHareket.SetMaliyet2(const Value: Double);
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('MALIYET2');
  FfMaliyet2.AsFloat := Value;
end;

procedure TTableUretimHareket.SetMaliyet3(const Value: Double);
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('MALIYET3');
  FfMaliyet3.AsFloat := Value;
end;

procedure TTableUretimHareket.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableUretimHareket.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableUretimHareket.SetMiktar(const Value: Double);
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  FfMiktar.AsFloat := Value;
end;

procedure TTableUretimHareket.SetMiktarTip(const Value: Integer);
begin
  if FfMiktarTip = nil then
    FfMiktarTip := FindField('MIKTARTIP');
  FfMiktarTip.AsInteger := Value;
end;

procedure TTableUretimHareket.SetMKod1(const Value: String);
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  FfMKod1.AsString := Value;
end;

procedure TTableUretimHareket.SetMKod2(const Value: String);
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  FfMKod2.AsString := Value;
end;

procedure TTableUretimHareket.SetMKod3(const Value: String);
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  FfMKod3.AsString := Value;
end;

procedure TTableUretimHareket.SetMKod4(const Value: String);
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  FfMKod4.AsString := Value;
end;

procedure TTableUretimHareket.SetMKod5(const Value: String);
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  FfMKod5.AsString := Value;
end;

procedure TTableUretimHareket.SetNKod1(const Value: Double);
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  FfNKod1.AsFloat := Value;
end;

procedure TTableUretimHareket.SetNKod2(const Value: Double);
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  FfNKod2.AsFloat := Value;
end;

procedure TTableUretimHareket.SetNKod3(const Value: Double);
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  FfNKod3.AsFloat := Value;
end;

procedure TTableUretimHareket.SetNKod4(const Value: Double);
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  FfNKod4.AsFloat := Value;
end;

procedure TTableUretimHareket.SetNKod5(const Value: Double);
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  FfNKod5.AsFloat := Value;
end;

procedure TTableUretimHareket.SetOperasyonFireKullan(const Value: Integer);
begin
  if FfOperasyonFireKullan = nil then
    FfOperasyonFireKullan := FindField('OPERASYONFIREKULLAN');
  FfOperasyonFireKullan.AsInteger := Value;
end;

procedure TTableUretimHareket.SetOperasyonFireMiktar(const Value: Double);
begin
  if FfOperasyonFireMiktar = nil then
    FfOperasyonFireMiktar := FindField('OPERASYONFIREMIKTAR');
  FfOperasyonFireMiktar.AsFloat := Value;
end;

procedure TTableUretimHareket.SetOperasyonFireOran(const Value: Double);
begin
  if FfOperasyonFireOran = nil then
    FfOperasyonFireOran := FindField('OPERASYONFIREORAN');
  FfOperasyonFireOran.AsFloat := Value;
end;

procedure TTableUretimHareket.SetOperasyonNo(const Value: Integer);
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  FfOperasyonNo.AsInteger := Value;
end;

procedure TTableUretimHareket.SetPozNo(const Value: String);
begin
  if FfPozNo = nil then
    FfPozNo := FindField('POZNO');
  FfPozNo.AsString := Value;
end;

procedure TTableUretimHareket.SetProjeKod(const Value: String);
begin
  if FfProjeKod = nil then
    FfProjeKod := FindField('PROJEKOD');
  FfProjeKod.AsString := Value;
end;

procedure TTableUretimHareket.SetReceteNo(const Value: String);
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  FfReceteNo.AsString := Value;
end;

procedure TTableUretimHareket.SetReceteSiraNo(const Value: Integer);
begin
  if FfReceteSiraNo = nil then
    FfReceteSiraNo := FindField('RECETESIRANO');
  FfReceteSiraNo.AsInteger := Value;
end;

procedure TTableUretimHareket.SetRevizyonNo(const Value: String);
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  FfRevizyonNo.AsString := Value;
end;

procedure TTableUretimHareket.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimHareket.SetSeriNo(const Value: String);
begin
  if FfSeriNo = nil then
    FfSeriNo := FindField('SERINO');
  FfSeriNo.AsString := Value;
end;

procedure TTableUretimHareket.SetSeriNo2(const Value: String);
begin
  if FfSeriNo2 = nil then
    FfSeriNo2 := FindField('SERINO2');
  FfSeriNo2.AsString := Value;
end;

procedure TTableUretimHareket.SetSeviyeKod(const Value: Integer);
begin
  if FfSeviyeKod = nil then
    FfSeviyeKod := FindField('SEVIYEKOD');
  FfSeviyeKod.AsInteger := Value;
end;

procedure TTableUretimHareket.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableUretimHareket.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimHareket.SetSKod1(const Value: String);
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  FfSKod1.AsString := Value;
end;

procedure TTableUretimHareket.SetSKod2(const Value: String);
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  FfSKod2.AsString := Value;
end;

procedure TTableUretimHareket.SetSKod3(const Value: String);
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  FfSKod3.AsString := Value;
end;

procedure TTableUretimHareket.SetSKod4(const Value: String);
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  FfSKod4.AsString := Value;
end;

procedure TTableUretimHareket.SetSKod5(const Value: String);
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  FfSKod5.AsString := Value;
end;

procedure TTableUretimHareket.SetKullanilabilir(const Value: Double);
begin
  if FfKullanilabilir = nil then
    FfKullanilabilir := FindField('STKDRM_KULLANILABILIR');
  FfKullanilabilir.AsFloat := Value;
end;

procedure TTableUretimHareket.SetStokCikis(const Value: Double);
begin
  if FfStokCikis = nil then
    FfStokCikis := FindField('STKDRM_STOKCIKIS');
  FfStokCikis.AsFloat := Value;
end;

procedure TTableUretimHareket.SetStokGiris(const Value: Double);
begin
  if FfStokGiris = nil then
    FfStokGiris := FindField('STKDRM_STOKGIRIS');
  FfStokGiris.AsFloat := Value;
end;

procedure TTableUretimHareket.SetStokMiktar(const Value: Double);
begin
  if FfStokMiktar = nil then
    FfStokMiktar := FindField('STKDRM_STOKMIKTAR');
  FfStokMiktar.AsFloat := Value;
end;

procedure TTableUretimHareket.SetMalAd(const Value: String);
begin
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  FfMalAd.AsString := Value;
end;

procedure TTableUretimHareket.SetSurumNo(const Value: Integer);
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  FfSurumNo.AsInteger := Value;
end;

procedure TTableUretimHareket.SetTip(const Value: Integer);
begin
  if FfTip = nil then
    FfTip := FindField('TIP');
  FfTip.AsInteger := Value;
end;

procedure TTableUretimHareket.SetUretimNo(const Value: String);
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  FfUretimNo.AsString := Value;
end;

procedure TTableUretimHareket.SetUretimSiraNo(const Value: Integer);
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  FfUretimSiraNo.AsInteger := Value;
end;

procedure TTableUretimHareket.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableUretimKart }

constructor TTableUretimKart.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTKRT';
end;

procedure TTableUretimKart.DoAfterOpen;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  if FfEvrakTarih = nil then
    FfEvrakTarih := FindField('EVRAKTARIH');
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  if FfHammaddeDepokod = nil then
    FfHammaddeDepokod := FindField('HAMMADDEDEPOKOD');
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  if FfMaliyetTip = nil then
    FfMaliyetTip := FindField('MALIYETTIP');
  if FfMamulDepokod = nil then
    FfMamulDepokod := FindField('MAMULDEPOKOD');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  if FfMamulSeriNo = nil then
    FfMamulSeriNo := FindField('MAMULSERINO');
  if FfMamulSeriNo2 = nil then
    FfMamulSeriNo2 := FindField('MAMULSERINO2');
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  if FfOpBasTarih = nil then
    FfOpBasTarih := FindField('OPBASTARIH');
  if FfOpBasTarihSaat = nil then
    FfOpBasTarihSaat := FindField('OPBASTARIHSAAT');
  if FfOpBitTarih = nil then
    FfOpBitTarih := FindField('OPBITTARIH');
  if FfOpBitTarihSaat = nil then
    FfOpBitTarihSaat := FindField('OPBITTARIHSAAT');
  if FfOpDurum = nil then
    FfOpDurum := FindField('OPDURUM');
  if FfOpFireMiktar = nil then
    FfOpFireMiktar := FindField('OPFIREMIKTAR');
  if FfOpMiktar = nil then
    FfOpMiktar := FindField('OPMIKTAR');
  if FfOpSure = nil then
    FfOpSure := FindField('OPSURE');
  if FfProjeKod = nil then
    FfProjeKod := FindField('PROJEKOD');
  if FfRezervasyonDurum = nil then
    FfRezervasyonDurum := FindField('REZERVASYONDURUM');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
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
  if FfKullanilabilir = nil then
    FfKullanilabilir := FindField('STKDRM_KULLANILABILIR');
  if FfStokCikis = nil then
    FfStokCikis := FindField('STKDRM_STOKCIKIS');
  if FfStokGiris = nil then
    FfStokGiris := FindField('STKDRM_STOKGIRIS');
  if FfStokMiktar = nil then
    FfStokMiktar := FindField('STKDRM_STOKMIKTAR');
  if FfDovizCins = nil then
    FfDovizCins := FindField('STKKRT_DOVIZCINS');
  if FfMamulAd = nil then
    FfMamulAd := FindField('STKKRT_MALAD');
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('STKKRT_MALIYET1');
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('STKKRT_MALIYET2');
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('STKKRT_MALIYET3');
  if FfSure = nil then
    FfSure := FindField('SURE');
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  if FfUretimBasTarih = nil then
    FfUretimBasTarih := FindField('URETIMBASTARIH');
  if FfUretimBitTarih = nil then
    FfUretimBitTarih := FindField('URETIMBITTARIH');
  if FfUretimDurum = nil then
    FfUretimDurum := FindField('URETIMDURUM');
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  if FfUretimPlanTarih = nil then
    FfUretimPlanTarih := FindField('URETIMPLANTARIH');
  if FfUretimTarih = nil then
    FfUretimTarih := FindField('URETIMTARIH');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableUretimKart.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama1 := nil;
    FfAciklama2 := nil;
    FfAciklama3 := nil;
    FfAciklama4 := nil;
    FfAciklama5 := nil;
    FfBasTarih := nil;
    FfBasTarihSaat := nil;
    FfBitTarih := nil;
    FfBitTarihSaat := nil;
    FfBKod1 := nil;
    FfBKod2 := nil;
    FfBKod3 := nil;
    FfBKod4 := nil;
    FfBKod5 := nil;
    FfEvrakNo := nil;
    FfEvrakTarih := nil;
    FfEvrakTip := nil;
    FfHammaddeDepokod := nil;
    FfHesapKod := nil;
    FfID := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKaynakEvrakNo := nil;
    FfKaynakEvrakTip := nil;
    FfKaynakHesapKod := nil;
    FfKaynakSiraNo := nil;
    FfLKod1 := nil;
    FfLKod2 := nil;
    FfLKod3 := nil;
    FfLKod4 := nil;
    FfLKod5 := nil;
    FfMaliyetTip := nil;
    FfMamulDepokod := nil;
    FfMamulKod := nil;
    FfMamulSeriNo := nil;
    FfMamulSeriNo2 := nil;
    FfMiktar := nil;
    FfMKod1 := nil;
    FfMKod2 := nil;
    FfMKod3 := nil;
    FfMKod4 := nil;
    FfMKod5 := nil;
    FfNKod1 := nil;
    FfNKod2 := nil;
    FfNKod3 := nil;
    FfNKod4 := nil;
    FfNKod5 := nil;
    FfOpBasTarih := nil;
    FfOpBasTarihSaat := nil;
    FfOpBitTarih := nil;
    FfOpBitTarihSaat := nil;
    FfOpDurum := nil;
    FfOpFireMiktar := nil;
    FfOpMiktar := nil;
    FfOpSure := nil;
    FfProjeKod := nil;
    FfRezervasyonDurum := nil;
    FfRowGuid := nil;
    FfSiraNo := nil;
    FfSirketNo := nil;
    FfSKod1 := nil;
    FfSKod2 := nil;
    FfSKod3 := nil;
    FfSKod4 := nil;
    FfSKod5 := nil;
    FfKullanilabilir := nil;
    FfStokCikis := nil;
    FfStokGiris := nil;
    FfStokMiktar := nil;
    FfDovizCins := nil;
    FfMamulAd := nil;
    FfMaliyet1 := nil;
    FfMaliyet2 := nil;
    FfMaliyet3 := nil;
    FfSure := nil;
    FfSurumNo := nil;
    FfUretimBasTarih := nil;
    FfUretimBitTarih := nil;
    FfUretimDurum := nil;
    FfUretimNo := nil;
    FfUretimPlanTarih := nil;
    FfUretimTarih := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableUretimKart.GetAciklama1: String;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1.AsString;
end;

function TTableUretimKart.GetAciklama2: String;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2.AsString;
end;

function TTableUretimKart.GetAciklama3: String;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3.AsString;
end;

function TTableUretimKart.GetAciklama4: String;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4.AsString;
end;

function TTableUretimKart.GetAciklama5: String;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5.AsString;
end;

function TTableUretimKart.GetBasTarih: TDate;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih.AsDateTime;
end;

function TTableUretimKart.GetBasTarihSaat: TDate;
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  Result := FfBasTarihSaat.AsDateTime;
end;

function TTableUretimKart.GetBitTarih: TDate;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih.AsDateTime;
end;

function TTableUretimKart.GetBitTarihSaat: TDate;
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  Result := FfBitTarihSaat.AsDateTime;
end;

function TTableUretimKart.GetBKod1: Integer;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1.AsInteger;
end;

function TTableUretimKart.GetBKod2: Integer;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2.AsInteger;
end;

function TTableUretimKart.GetBKod3: Integer;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3.AsInteger;
end;

function TTableUretimKart.GetBKod4: Integer;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4.AsInteger;
end;

function TTableUretimKart.GetBKod5: Integer;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5.AsInteger;
end;

function TTableUretimKart.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableUretimKart.GetEvrakTarih: TDate;
begin
  if FfEvrakTarih = nil then
    FfEvrakTarih := FindField('EVRAKTARIH');
  Result := FfEvrakTarih.AsDateTime;
end;

function TTableUretimKart.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableUretimKart.GetHammaddeDepokod: String;
begin
  if FfHammaddeDepokod = nil then
    FfHammaddeDepokod := FindField('HAMMADDEDEPOKOD');
  Result := FfHammaddeDepokod.AsString;
end;

function TTableUretimKart.GetHesapKod: String;
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  Result := FfHesapKod.AsString;
end;

function TTableUretimKart.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimKart.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableUretimKart.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimKart.GetKaynakEvrakNo: String;
begin
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  Result := FfKaynakEvrakNo.AsString;
end;

function TTableUretimKart.GetKaynakEvrakTip: Integer;
begin
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  Result := FfKaynakEvrakTip.AsInteger;
end;

function TTableUretimKart.GetKaynakHesapKod: String;
begin
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  Result := FfKaynakHesapKod.AsString;
end;

function TTableUretimKart.GetKaynakSiraNo: Integer;
begin
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  Result := FfKaynakSiraNo.AsInteger;
end;

function TTableUretimKart.GetLKod1: String;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1.AsString;
end;

function TTableUretimKart.GetLKod2: String;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2.AsString;
end;

function TTableUretimKart.GetLKod3: String;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3.AsString;
end;

function TTableUretimKart.GetLKod4: String;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4.AsString;
end;

function TTableUretimKart.GetLKod5: String;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5.AsString;
end;

function TTableUretimKart.GetMaliyetTip: Integer;
begin
  if FfMaliyetTip = nil then
    FfMaliyetTip := FindField('MALIYETTIP');
  Result := FfMaliyetTip.AsInteger;
end;

function TTableUretimKart.GetMamulDepokod: String;
begin
  if FfMamulDepokod = nil then
    FfMamulDepokod := FindField('MAMULDEPOKOD');
  Result := FfMamulDepokod.AsString;
end;

function TTableUretimKart.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableUretimKart.GetMamulSeriNo: String;
begin
  if FfMamulSeriNo = nil then
    FfMamulSeriNo := FindField('MAMULSERINO');
  Result := FfMamulSeriNo.AsString;
end;

function TTableUretimKart.GetMamulSeriNo2: String;
begin
  if FfMamulSeriNo2 = nil then
    FfMamulSeriNo2 := FindField('MAMULSERINO2');
  Result := FfMamulSeriNo2.AsString;
end;

function TTableUretimKart.GetMiktar: Double;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar.AsFloat;
end;

function TTableUretimKart.GetMKod1: String;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1.AsString;
end;

function TTableUretimKart.GetMKod2: String;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2.AsString;
end;

function TTableUretimKart.GetMKod3: String;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3.AsString;
end;

function TTableUretimKart.GetMKod4: String;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4.AsString;
end;

function TTableUretimKart.GetMKod5: String;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5.AsString;
end;

function TTableUretimKart.GetNKod1: Double;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1.AsFloat;
end;

function TTableUretimKart.GetNKod2: Double;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2.AsFloat;
end;

function TTableUretimKart.GetNKod3: Double;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3.AsFloat;
end;

function TTableUretimKart.GetNKod4: Double;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4.AsFloat;
end;

function TTableUretimKart.GetNKod5: Double;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5.AsFloat;
end;

function TTableUretimKart.GetOpBasTarih: TDate;
begin
  if FfOpBasTarih = nil then
    FfOpBasTarih := FindField('OPBASTARIH');
  Result := FfOpBasTarih.AsDateTime;
end;

function TTableUretimKart.GetOpBasTarihSaat: TDate;
begin
  if FfOpBasTarihSaat = nil then
    FfOpBasTarihSaat := FindField('OPBASTARIHSAAT');
  Result := FfOpBasTarihSaat.AsDateTime;
end;

function TTableUretimKart.GetOpBitTarih: TDate;
begin
  if FfOpBitTarih = nil then
    FfOpBitTarih := FindField('OPBITTARIH');
  Result := FfOpBitTarih.AsDateTime;
end;

function TTableUretimKart.GetOpBitTarihSaat: TDate;
begin
  if FfOpBitTarihSaat = nil then
    FfOpBitTarihSaat := FindField('OPBITTARIHSAAT');
  Result := FfOpBitTarihSaat.AsDateTime;
end;

function TTableUretimKart.GetOpDurum: Integer;
begin
  if FfOpDurum = nil then
    FfOpDurum := FindField('OPDURUM');
  Result := FfOpDurum.AsInteger;
end;

function TTableUretimKart.GetOpFireMiktar: Double;
begin
  if FfOpFireMiktar = nil then
    FfOpFireMiktar := FindField('OPFIREMIKTAR');
  Result := FfOpFireMiktar.AsFloat;
end;

function TTableUretimKart.GetOpMiktar: Double;
begin
  if FfOpMiktar = nil then
    FfOpMiktar := FindField('OPMIKTAR');
  Result := FfOpMiktar.AsFloat;
end;

function TTableUretimKart.GetOpSure: Double;
begin
  if FfOpSure = nil then
    FfOpSure := FindField('OPSURE');
  Result := FfOpSure.AsFloat;
end;

function TTableUretimKart.GetProjeKod: String;
begin
  if FfProjeKod = nil then
    FfProjeKod := FindField('PROJEKOD');
  Result := FfProjeKod.AsString;
end;

function TTableUretimKart.GetRezervasyonDurum: Integer;
begin
  if FfRezervasyonDurum = nil then
    FfRezervasyonDurum := FindField('REZERVASYONDURUM');
  Result := FfRezervasyonDurum.AsInteger;
end;

function TTableUretimKart.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimKart.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableUretimKart.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimKart.GetSKod1: String;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1.AsString;
end;

function TTableUretimKart.GetSKod2: String;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2.AsString;
end;

function TTableUretimKart.GetSKod3: String;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3.AsString;
end;

function TTableUretimKart.GetSKod4: String;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4.AsString;
end;

function TTableUretimKart.GetSKod5: String;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5.AsString;
end;

function TTableUretimKart.GetKullanilabilir: Double;
begin
  if FfKullanilabilir = nil then
    FfKullanilabilir := FindField('STKDRM_KULLANILABILIR');
  Result := FfKullanilabilir.AsFloat;
end;

function TTableUretimKart.GetStokCikis: Double;
begin
  if FfStokCikis = nil then
    FfStokCikis := FindField('STKDRM_STOKCIKIS');
  Result := FfStokCikis.AsFloat;
end;

function TTableUretimKart.GetStokGiris: Double;
begin
  if FfStokGiris = nil then
    FfStokGiris := FindField('STKDRM_STOKGIRIS');
  Result := FfStokGiris.AsFloat;
end;

function TTableUretimKart.GetStokMiktar: Double;
begin
  if FfStokMiktar = nil then
    FfStokMiktar := FindField('STKDRM_STOKMIKTAR');
  Result := FfStokMiktar.AsFloat;
end;

function TTableUretimKart.GetDovizCins: String;
begin
  if FfDovizCins = nil then
    FfDovizCins := FindField('STKKRT_DOVIZCINS');
  Result := FfDovizCins.AsString;
end;

function TTableUretimKart.GetMamulAd: String;
begin
  if FfMamulAd = nil then
    FfMamulAd := FindField('STKKRT_MALAD');
  Result := FfMamulAd.AsString;
end;

function TTableUretimKart.GetMaliyet1: Double;
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('STKKRT_MALIYET1');
  Result := FfMaliyet1.AsFloat;
end;

function TTableUretimKart.GetMaliyet2: Double;
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('STKKRT_MALIYET2');
  Result := FfMaliyet2.AsFloat;
end;

function TTableUretimKart.GetMaliyet3: Double;
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('STKKRT_MALIYET3');
  Result := FfMaliyet3.AsFloat;
end;

function TTableUretimKart.GetSure: Double;
begin
  if FfSure = nil then
    FfSure := FindField('SURE');
  Result := FfSure.AsFloat;
end;

function TTableUretimKart.GetSurumNo: Integer;
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  Result := FfSurumNo.AsInteger;
end;

function TTableUretimKart.GetUretimBasTarih: TDate;
begin
  if FfUretimBasTarih = nil then
    FfUretimBasTarih := FindField('URETIMBASTARIH');
  Result := FfUretimBasTarih.AsDateTime;
end;

function TTableUretimKart.GetUretimBitTarih: TDate;
begin
  if FfUretimBitTarih = nil then
    FfUretimBitTarih := FindField('URETIMBITTARIH');
  Result := FfUretimBitTarih.AsDateTime;
end;

function TTableUretimKart.GetUretimDurum: Integer;
begin
  if FfUretimDurum = nil then
    FfUretimDurum := FindField('URETIMDURUM');
  Result := FfUretimDurum.AsInteger;
end;

function TTableUretimKart.GetUretimNo: String;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo.AsString;
end;

function TTableUretimKart.GetUretimPlanTarih: TDate;
begin
  if FfUretimPlanTarih = nil then
    FfUretimPlanTarih := FindField('URETIMPLANTARIH');
  Result := FfUretimPlanTarih.AsDateTime;
end;

function TTableUretimKart.GetUretimTarih: TDate;
begin
  if FfUretimTarih = nil then
    FfUretimTarih := FindField('URETIMTARIH');
  Result := FfUretimTarih.AsDateTime;
end;

function TTableUretimKart.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableUretimKart.GetfAciklama1: TField;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1;
end;

function TTableUretimKart.GetfAciklama2: TField;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2;
end;

function TTableUretimKart.GetfAciklama3: TField;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3;
end;

function TTableUretimKart.GetfAciklama4: TField;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4;
end;

function TTableUretimKart.GetfAciklama5: TField;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5;
end;

function TTableUretimKart.GetfBasTarih: TField;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih;
end;

function TTableUretimKart.GetfBasTarihSaat: TField;
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  Result := FfBasTarihSaat;
end;

function TTableUretimKart.GetfBitTarih: TField;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih;
end;

function TTableUretimKart.GetfBitTarihSaat: TField;
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  Result := FfBitTarihSaat;
end;

function TTableUretimKart.GetfBKod1: TField;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1;
end;

function TTableUretimKart.GetfBKod2: TField;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2;
end;

function TTableUretimKart.GetfBKod3: TField;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3;
end;

function TTableUretimKart.GetfBKod4: TField;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4;
end;

function TTableUretimKart.GetfBKod5: TField;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5;
end;

function TTableUretimKart.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableUretimKart.GetfEvrakTarih: TField;
begin
  if FfEvrakTarih = nil then
    FfEvrakTarih := FindField('EVRAKTARIH');
  Result := FfEvrakTarih;
end;

function TTableUretimKart.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableUretimKart.GetfHammaddeDepokod: TField;
begin
  if FfHammaddeDepokod = nil then
    FfHammaddeDepokod := FindField('HAMMADDEDEPOKOD');
  Result := FfHammaddeDepokod;
end;

function TTableUretimKart.GetfHesapKod: TField;
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  Result := FfHesapKod;
end;

function TTableUretimKart.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimKart.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableUretimKart.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimKart.GetfKaynakEvrakNo: TField;
begin
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  Result := FfKaynakEvrakNo;
end;

function TTableUretimKart.GetfKaynakEvrakTip: TField;
begin
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  Result := FfKaynakEvrakTip;
end;

function TTableUretimKart.GetfKaynakHesapKod: TField;
begin
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  Result := FfKaynakHesapKod;
end;

function TTableUretimKart.GetfKaynakSiraNo: TField;
begin
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  Result := FfKaynakSiraNo;
end;

function TTableUretimKart.GetfLKod1: TField;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1;
end;

function TTableUretimKart.GetfLKod2: TField;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2;
end;

function TTableUretimKart.GetfLKod3: TField;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3;
end;

function TTableUretimKart.GetfLKod4: TField;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4;
end;

function TTableUretimKart.GetfLKod5: TField;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5;
end;

function TTableUretimKart.GetfMaliyetTip: TField;
begin
  if FfMaliyetTip = nil then
    FfMaliyetTip := FindField('MALIYETTIP');
  Result := FfMaliyetTip;
end;

function TTableUretimKart.GetfMamulDepokod: TField;
begin
  if FfMamulDepokod = nil then
    FfMamulDepokod := FindField('MAMULDEPOKOD');
  Result := FfMamulDepokod;
end;

function TTableUretimKart.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableUretimKart.GetfMamulSeriNo: TField;
begin
  if FfMamulSeriNo = nil then
    FfMamulSeriNo := FindField('MAMULSERINO');
  Result := FfMamulSeriNo;
end;

function TTableUretimKart.GetfMamulSeriNo2: TField;
begin
  if FfMamulSeriNo2 = nil then
    FfMamulSeriNo2 := FindField('MAMULSERINO2');
  Result := FfMamulSeriNo2;
end;

function TTableUretimKart.GetfMiktar: TField;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar;
end;

function TTableUretimKart.GetfMKod1: TField;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1;
end;

function TTableUretimKart.GetfMKod2: TField;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2;
end;

function TTableUretimKart.GetfMKod3: TField;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3;
end;

function TTableUretimKart.GetfMKod4: TField;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4;
end;

function TTableUretimKart.GetfMKod5: TField;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5;
end;

function TTableUretimKart.GetfNKod1: TField;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1;
end;

function TTableUretimKart.GetfNKod2: TField;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2;
end;

function TTableUretimKart.GetfNKod3: TField;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3;
end;

function TTableUretimKart.GetfNKod4: TField;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4;
end;

function TTableUretimKart.GetfNKod5: TField;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5;
end;

function TTableUretimKart.GetfOpBasTarih: TField;
begin
  if FfOpBasTarih = nil then
    FfOpBasTarih := FindField('OPBASTARIH');
  Result := FfOpBasTarih;
end;

function TTableUretimKart.GetfOpBasTarihSaat: TField;
begin
  if FfOpBasTarihSaat = nil then
    FfOpBasTarihSaat := FindField('OPBASTARIHSAAT');
  Result := FfOpBasTarihSaat;
end;

function TTableUretimKart.GetfOpBitTarih: TField;
begin
  if FfOpBitTarih = nil then
    FfOpBitTarih := FindField('OPBITTARIH');
  Result := FfOpBitTarih;
end;

function TTableUretimKart.GetfOpBitTarihSaat: TField;
begin
  if FfOpBitTarihSaat = nil then
    FfOpBitTarihSaat := FindField('OPBITTARIHSAAT');
  Result := FfOpBitTarihSaat;
end;

function TTableUretimKart.GetfOpDurum: TField;
begin
  if FfOpDurum = nil then
    FfOpDurum := FindField('OPDURUM');
  Result := FfOpDurum;
end;

function TTableUretimKart.GetfOpFireMiktar: TField;
begin
  if FfOpFireMiktar = nil then
    FfOpFireMiktar := FindField('OPFIREMIKTAR');
  Result := FfOpFireMiktar;
end;

function TTableUretimKart.GetfOpMiktar: TField;
begin
  if FfOpMiktar = nil then
    FfOpMiktar := FindField('OPMIKTAR');
  Result := FfOpMiktar;
end;

function TTableUretimKart.GetfOpSure: TField;
begin
  if FfOpSure = nil then
    FfOpSure := FindField('OPSURE');
  Result := FfOpSure;
end;

function TTableUretimKart.GetfProjeKod: TField;
begin
  if FfProjeKod = nil then
    FfProjeKod := FindField('PROJEKOD');
  Result := FfProjeKod;
end;

function TTableUretimKart.GetfRezervasyonDurum: TField;
begin
  if FfRezervasyonDurum = nil then
    FfRezervasyonDurum := FindField('REZERVASYONDURUM');
  Result := FfRezervasyonDurum;
end;

function TTableUretimKart.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimKart.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableUretimKart.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimKart.GetfSKod1: TField;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1;
end;

function TTableUretimKart.GetfSKod2: TField;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2;
end;

function TTableUretimKart.GetfSKod3: TField;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3;
end;

function TTableUretimKart.GetfSKod4: TField;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4;
end;

function TTableUretimKart.GetfSKod5: TField;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5;
end;

function TTableUretimKart.GetfKullanilabilir: TField;
begin
  if FfKullanilabilir = nil then
    FfKullanilabilir := FindField('STKDRM_KULLANILABILIR');
  Result := FfKullanilabilir;
end;

function TTableUretimKart.GetfStokCikis: TField;
begin
  if FfStokCikis = nil then
    FfStokCikis := FindField('STKDRM_STOKCIKIS');
  Result := FfStokCikis;
end;

function TTableUretimKart.GetfStokGiris: TField;
begin
  if FfStokGiris = nil then
    FfStokGiris := FindField('STKDRM_STOKGIRIS');
  Result := FfStokGiris;
end;

function TTableUretimKart.GetfStokMiktar: TField;
begin
  if FfStokMiktar = nil then
    FfStokMiktar := FindField('STKDRM_STOKMIKTAR');
  Result := FfStokMiktar;
end;

function TTableUretimKart.GetfDovizCins: TField;
begin
  if FfDovizCins = nil then
    FfDovizCins := FindField('STKKRT_DOVIZCINS');
  Result := FfDovizCins;
end;

function TTableUretimKart.GetfMamulAd: TField;
begin
  if FfMamulAd = nil then
    FfMamulAd := FindField('STKKRT_MALAD');
  Result := FfMamulAd;
end;

function TTableUretimKart.GetfMaliyet1: TField;
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('STKKRT_MALIYET1');
  Result := FfMaliyet1;
end;

function TTableUretimKart.GetfMaliyet2: TField;
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('STKKRT_MALIYET2');
  Result := FfMaliyet2;
end;

function TTableUretimKart.GetfMaliyet3: TField;
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('STKKRT_MALIYET3');
  Result := FfMaliyet3;
end;

function TTableUretimKart.GetfSure: TField;
begin
  if FfSure = nil then
    FfSure := FindField('SURE');
  Result := FfSure;
end;

function TTableUretimKart.GetfSurumNo: TField;
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  Result := FfSurumNo;
end;

function TTableUretimKart.GetfUretimBasTarih: TField;
begin
  if FfUretimBasTarih = nil then
    FfUretimBasTarih := FindField('URETIMBASTARIH');
  Result := FfUretimBasTarih;
end;

function TTableUretimKart.GetfUretimBitTarih: TField;
begin
  if FfUretimBitTarih = nil then
    FfUretimBitTarih := FindField('URETIMBITTARIH');
  Result := FfUretimBitTarih;
end;

function TTableUretimKart.GetfUretimDurum: TField;
begin
  if FfUretimDurum = nil then
    FfUretimDurum := FindField('URETIMDURUM');
  Result := FfUretimDurum;
end;

function TTableUretimKart.GetfUretimNo: TField;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo;
end;

function TTableUretimKart.GetfUretimPlanTarih: TField;
begin
  if FfUretimPlanTarih = nil then
    FfUretimPlanTarih := FindField('URETIMPLANTARIH');
  Result := FfUretimPlanTarih;
end;

function TTableUretimKart.GetfUretimTarih: TField;
begin
  if FfUretimTarih = nil then
    FfUretimTarih := FindField('URETIMTARIH');
  Result := FfUretimTarih;
end;

function TTableUretimKart.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableUretimKart.SetAciklama1(const Value: String);
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  FfAciklama1.AsString := Value;
end;

procedure TTableUretimKart.SetAciklama2(const Value: String);
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  FfAciklama2.AsString := Value;
end;

procedure TTableUretimKart.SetAciklama3(const Value: String);
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  FfAciklama3.AsString := Value;
end;

procedure TTableUretimKart.SetAciklama4(const Value: String);
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  FfAciklama4.AsString := Value;
end;

procedure TTableUretimKart.SetAciklama5(const Value: String);
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  FfAciklama5.AsString := Value;
end;

procedure TTableUretimKart.SetBasTarih(const Value: TDate);
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  FfBasTarih.AsDateTime := Value;
end;

procedure TTableUretimKart.SetBasTarihSaat(const Value: TDate);
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  FfBasTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimKart.SetBitTarih(const Value: TDate);
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  FfBitTarih.AsDateTime := Value;
end;

procedure TTableUretimKart.SetBitTarihSaat(const Value: TDate);
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  FfBitTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimKart.SetBKod1(const Value: Integer);
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  FfBKod1.AsInteger := Value;
end;

procedure TTableUretimKart.SetBKod2(const Value: Integer);
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  FfBKod2.AsInteger := Value;
end;

procedure TTableUretimKart.SetBKod3(const Value: Integer);
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  FfBKod3.AsInteger := Value;
end;

procedure TTableUretimKart.SetBKod4(const Value: Integer);
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  FfBKod4.AsInteger := Value;
end;

procedure TTableUretimKart.SetBKod5(const Value: Integer);
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  FfBKod5.AsInteger := Value;
end;

procedure TTableUretimKart.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableUretimKart.SetEvrakTarih(const Value: TDate);
begin
  if FfEvrakTarih = nil then
    FfEvrakTarih := FindField('EVRAKTARIH');
  FfEvrakTarih.AsDateTime := Value;
end;

procedure TTableUretimKart.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableUretimKart.SetHammaddeDepokod(const Value: String);
begin
  if FfHammaddeDepokod = nil then
    FfHammaddeDepokod := FindField('HAMMADDEDEPOKOD');
  FfHammaddeDepokod.AsString := Value;
end;

procedure TTableUretimKart.SetHesapKod(const Value: String);
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  FfHesapKod.AsString := Value;
end;

procedure TTableUretimKart.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimKart.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableUretimKart.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimKart.SetKaynakEvrakNo(const Value: String);
begin
  if FfKaynakEvrakNo = nil then
    FfKaynakEvrakNo := FindField('KAYNAKEVRAKNO');
  FfKaynakEvrakNo.AsString := Value;
end;

procedure TTableUretimKart.SetKaynakEvrakTip(const Value: Integer);
begin
  if FfKaynakEvrakTip = nil then
    FfKaynakEvrakTip := FindField('KAYNAKEVRAKTIP');
  FfKaynakEvrakTip.AsInteger := Value;
end;

procedure TTableUretimKart.SetKaynakHesapKod(const Value: String);
begin
  if FfKaynakHesapKod = nil then
    FfKaynakHesapKod := FindField('KAYNAKHESAPKOD');
  FfKaynakHesapKod.AsString := Value;
end;

procedure TTableUretimKart.SetKaynakSiraNo(const Value: Integer);
begin
  if FfKaynakSiraNo = nil then
    FfKaynakSiraNo := FindField('KAYNAKSIRANO');
  FfKaynakSiraNo.AsInteger := Value;
end;

procedure TTableUretimKart.SetLKod1(const Value: String);
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  FfLKod1.AsString := Value;
end;

procedure TTableUretimKart.SetLKod2(const Value: String);
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  FfLKod2.AsString := Value;
end;

procedure TTableUretimKart.SetLKod3(const Value: String);
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  FfLKod3.AsString := Value;
end;

procedure TTableUretimKart.SetLKod4(const Value: String);
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  FfLKod4.AsString := Value;
end;

procedure TTableUretimKart.SetLKod5(const Value: String);
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  FfLKod5.AsString := Value;
end;

procedure TTableUretimKart.SetMaliyetTip(const Value: Integer);
begin
  if FfMaliyetTip = nil then
    FfMaliyetTip := FindField('MALIYETTIP');
  FfMaliyetTip.AsInteger := Value;
end;

procedure TTableUretimKart.SetMamulDepokod(const Value: String);
begin
  if FfMamulDepokod = nil then
    FfMamulDepokod := FindField('MAMULDEPOKOD');
  FfMamulDepokod.AsString := Value;
end;

procedure TTableUretimKart.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableUretimKart.SetMamulSeriNo(const Value: String);
begin
  if FfMamulSeriNo = nil then
    FfMamulSeriNo := FindField('MAMULSERINO');
  FfMamulSeriNo.AsString := Value;
end;

procedure TTableUretimKart.SetMamulSeriNo2(const Value: String);
begin
  if FfMamulSeriNo2 = nil then
    FfMamulSeriNo2 := FindField('MAMULSERINO2');
  FfMamulSeriNo2.AsString := Value;
end;

procedure TTableUretimKart.SetMiktar(const Value: Double);
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  FfMiktar.AsFloat := Value;
end;

procedure TTableUretimKart.SetMKod1(const Value: String);
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  FfMKod1.AsString := Value;
end;

procedure TTableUretimKart.SetMKod2(const Value: String);
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  FfMKod2.AsString := Value;
end;

procedure TTableUretimKart.SetMKod3(const Value: String);
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  FfMKod3.AsString := Value;
end;

procedure TTableUretimKart.SetMKod4(const Value: String);
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  FfMKod4.AsString := Value;
end;

procedure TTableUretimKart.SetMKod5(const Value: String);
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  FfMKod5.AsString := Value;
end;

procedure TTableUretimKart.SetNKod1(const Value: Double);
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  FfNKod1.AsFloat := Value;
end;

procedure TTableUretimKart.SetNKod2(const Value: Double);
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  FfNKod2.AsFloat := Value;
end;

procedure TTableUretimKart.SetNKod3(const Value: Double);
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  FfNKod3.AsFloat := Value;
end;

procedure TTableUretimKart.SetNKod4(const Value: Double);
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  FfNKod4.AsFloat := Value;
end;

procedure TTableUretimKart.SetNKod5(const Value: Double);
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  FfNKod5.AsFloat := Value;
end;

procedure TTableUretimKart.SetOpBasTarih(const Value: TDate);
begin
  if FfOpBasTarih = nil then
    FfOpBasTarih := FindField('OPBASTARIH');
  FfOpBasTarih.AsDateTime := Value;
end;

procedure TTableUretimKart.SetOpBasTarihSaat(const Value: TDate);
begin
  if FfOpBasTarihSaat = nil then
    FfOpBasTarihSaat := FindField('OPBASTARIHSAAT');
  FfOpBasTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimKart.SetOpBitTarih(const Value: TDate);
begin
  if FfOpBitTarih = nil then
    FfOpBitTarih := FindField('OPBITTARIH');
  FfOpBitTarih.AsDateTime := Value;
end;

procedure TTableUretimKart.SetOpBitTarihSaat(const Value: TDate);
begin
  if FfOpBitTarihSaat = nil then
    FfOpBitTarihSaat := FindField('OPBITTARIHSAAT');
  FfOpBitTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimKart.SetOpDurum(const Value: Integer);
begin
  if FfOpDurum = nil then
    FfOpDurum := FindField('OPDURUM');
  FfOpDurum.AsInteger := Value;
end;

procedure TTableUretimKart.SetOpFireMiktar(const Value: Double);
begin
  if FfOpFireMiktar = nil then
    FfOpFireMiktar := FindField('OPFIREMIKTAR');
  FfOpFireMiktar.AsFloat := Value;
end;

procedure TTableUretimKart.SetOpMiktar(const Value: Double);
begin
  if FfOpMiktar = nil then
    FfOpMiktar := FindField('OPMIKTAR');
  FfOpMiktar.AsFloat := Value;
end;

procedure TTableUretimKart.SetOpSure(const Value: Double);
begin
  if FfOpSure = nil then
    FfOpSure := FindField('OPSURE');
  FfOpSure.AsFloat := Value;
end;

procedure TTableUretimKart.SetProjeKod(const Value: String);
begin
  if FfProjeKod = nil then
    FfProjeKod := FindField('PROJEKOD');
  FfProjeKod.AsString := Value;
end;

procedure TTableUretimKart.SetRezervasyonDurum(const Value: Integer);
begin
  if FfRezervasyonDurum = nil then
    FfRezervasyonDurum := FindField('REZERVASYONDURUM');
  FfRezervasyonDurum.AsInteger := Value;
end;

procedure TTableUretimKart.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimKart.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableUretimKart.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimKart.SetSKod1(const Value: String);
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  FfSKod1.AsString := Value;
end;

procedure TTableUretimKart.SetSKod2(const Value: String);
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  FfSKod2.AsString := Value;
end;

procedure TTableUretimKart.SetSKod3(const Value: String);
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  FfSKod3.AsString := Value;
end;

procedure TTableUretimKart.SetSKod4(const Value: String);
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  FfSKod4.AsString := Value;
end;

procedure TTableUretimKart.SetSKod5(const Value: String);
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  FfSKod5.AsString := Value;
end;

procedure TTableUretimKart.SetKullanilabilir(const Value: Double);
begin
  if FfKullanilabilir = nil then
    FfKullanilabilir := FindField('STKDRM_KULLANILABILIR');
  FfKullanilabilir.AsFloat := Value;
end;

procedure TTableUretimKart.SetStokCikis(const Value: Double);
begin
  if FfStokCikis = nil then
    FfStokCikis := FindField('STKDRM_STOKCIKIS');
  FfStokCikis.AsFloat := Value;
end;

procedure TTableUretimKart.SetStokGiris(const Value: Double);
begin
  if FfStokGiris = nil then
    FfStokGiris := FindField('STKDRM_STOKGIRIS');
  FfStokGiris.AsFloat := Value;
end;

procedure TTableUretimKart.SetStokMiktar(const Value: Double);
begin
  if FfStokMiktar = nil then
    FfStokMiktar := FindField('STKDRM_STOKMIKTAR');
  FfStokMiktar.AsFloat := Value;
end;

procedure TTableUretimKart.SetDovizCins(const Value: String);
begin
  if FfDovizCins = nil then
    FfDovizCins := FindField('STKKRT_DOVIZCINS');
  FfDovizCins.AsString := Value;
end;

procedure TTableUretimKart.SetMamulAd(const Value: String);
begin
  if FfMamulAd = nil then
    FfMamulAd := FindField('STKKRT_MALAD');
  FfMamulAd.AsString := Value;
end;

procedure TTableUretimKart.SetMaliyet1(const Value: Double);
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('STKKRT_MALIYET1');
  FfMaliyet1.AsFloat := Value;
end;

procedure TTableUretimKart.SetMaliyet2(const Value: Double);
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('STKKRT_MALIYET2');
  FfMaliyet2.AsFloat := Value;
end;

procedure TTableUretimKart.SetMaliyet3(const Value: Double);
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('STKKRT_MALIYET3');
  FfMaliyet3.AsFloat := Value;
end;

procedure TTableUretimKart.SetSure(const Value: Double);
begin
  if FfSure = nil then
    FfSure := FindField('SURE');
  FfSure.AsFloat := Value;
end;

procedure TTableUretimKart.SetSurumNo(const Value: Integer);
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  FfSurumNo.AsInteger := Value;
end;

procedure TTableUretimKart.SetUretimBasTarih(const Value: TDate);
begin
  if FfUretimBasTarih = nil then
    FfUretimBasTarih := FindField('URETIMBASTARIH');
  FfUretimBasTarih.AsDateTime := Value;
end;

procedure TTableUretimKart.SetUretimBitTarih(const Value: TDate);
begin
  if FfUretimBitTarih = nil then
    FfUretimBitTarih := FindField('URETIMBITTARIH');
  FfUretimBitTarih.AsDateTime := Value;
end;

procedure TTableUretimKart.SetUretimDurum(const Value: Integer);
begin
  if FfUretimDurum = nil then
    FfUretimDurum := FindField('URETIMDURUM');
  FfUretimDurum.AsInteger := Value;
end;

procedure TTableUretimKart.SetUretimNo(const Value: String);
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  FfUretimNo.AsString := Value;
end;

procedure TTableUretimKart.SetUretimPlanTarih(const Value: TDate);
begin
  if FfUretimPlanTarih = nil then
    FfUretimPlanTarih := FindField('URETIMPLANTARIH');
  FfUretimPlanTarih.AsDateTime := Value;
end;

procedure TTableUretimKart.SetUretimTarih(const Value: TDate);
begin
  if FfUretimTarih = nil then
    FfUretimTarih := FindField('URETIMTARIH');
  FfUretimTarih.AsDateTime := Value;
end;

procedure TTableUretimKart.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableUretimKaynakTahsisat }

constructor TTableUretimKaynakTahsisat.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTKTH';
end;

procedure TTableUretimKaynakTahsisat.DoAfterOpen;
begin
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  if FfPlanSiraNo = nil then
    FfPlanSiraNo := FindField('PLANSIRANO');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSecenekler = nil then
    FfSecenekler := FindField('SECENEKLER');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  if FfSure = nil then
    FfSure := FindField('SURE');
  if FfSureTip = nil then
    FfSureTip := FindField('SURETIP');
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  if FfTip = nil then
    FfTip := FindField('TIP');
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableUretimKaynakTahsisat.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfBasSaat := nil;
    FfBasTarihSaat := nil;
    FfBitSaat := nil;
    FfBitTarihSaat := nil;
    FfEvrakNo := nil;
    FfEvrakTip := nil;
    FfID := nil;
    FfIsMerkezKod := nil;
    FfKaynakKod := nil;
    FfMamulKod := nil;
    FfMiktar := nil;
    FfOperasyonNo := nil;
    FfPlanNo := nil;
    FfPlanSiraNo := nil;
    FfRowGuid := nil;
    FfSecenekler := nil;
    FfSiraNo := nil;
    FfSirketNo := nil;
    FfMalAd := nil;
    FfSure := nil;
    FfSureTip := nil;
    FfTarih := nil;
    FfTip := nil;
    FfUretimNo := nil;
    FfUretimSiraNo := nil;
    FfVardiyaKod := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableUretimKaynakTahsisat.GetBasSaat: TDate;
begin
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  Result := FfBasSaat.AsDateTime;
end;

function TTableUretimKaynakTahsisat.GetBasTarihSaat: TDate;
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  Result := FfBasTarihSaat.AsDateTime;
end;

function TTableUretimKaynakTahsisat.GetBitSaat: TDate;
begin
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  Result := FfBitSaat.AsDateTime;
end;

function TTableUretimKaynakTahsisat.GetBitTarihSaat: TDate;
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  Result := FfBitTarihSaat.AsDateTime;
end;

function TTableUretimKaynakTahsisat.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableUretimKaynakTahsisat.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableUretimKaynakTahsisat.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimKaynakTahsisat.GetIsMerkezKod: String;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod.AsString;
end;

function TTableUretimKaynakTahsisat.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimKaynakTahsisat.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableUretimKaynakTahsisat.GetMiktar: Double;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar.AsFloat;
end;

function TTableUretimKaynakTahsisat.GetOperasyonNo: Integer;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo.AsInteger;
end;

function TTableUretimKaynakTahsisat.GetPlanNo: String;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo.AsString;
end;

function TTableUretimKaynakTahsisat.GetPlanSiraNo: Integer;
begin
  if FfPlanSiraNo = nil then
    FfPlanSiraNo := FindField('PLANSIRANO');
  Result := FfPlanSiraNo.AsInteger;
end;

function TTableUretimKaynakTahsisat.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimKaynakTahsisat.GetSecenekler: Integer;
begin
  if FfSecenekler = nil then
    FfSecenekler := FindField('SECENEKLER');
  Result := FfSecenekler.AsInteger;
end;

function TTableUretimKaynakTahsisat.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableUretimKaynakTahsisat.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimKaynakTahsisat.GetMalAd: String;
begin
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  Result := FfMalAd.AsString;
end;

function TTableUretimKaynakTahsisat.GetSure: Double;
begin
  if FfSure = nil then
    FfSure := FindField('SURE');
  Result := FfSure.AsFloat;
end;

function TTableUretimKaynakTahsisat.GetSureTip: Integer;
begin
  if FfSureTip = nil then
    FfSureTip := FindField('SURETIP');
  Result := FfSureTip.AsInteger;
end;

function TTableUretimKaynakTahsisat.GetTarih: TDate;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih.AsDateTime;
end;

function TTableUretimKaynakTahsisat.GetTip: Integer;
begin
  if FfTip = nil then
    FfTip := FindField('TIP');
  Result := FfTip.AsInteger;
end;

function TTableUretimKaynakTahsisat.GetUretimNo: String;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo.AsString;
end;

function TTableUretimKaynakTahsisat.GetUretimSiraNo: Integer;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo.AsInteger;
end;

function TTableUretimKaynakTahsisat.GetVardiyaKod: String;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod.AsString;
end;

function TTableUretimKaynakTahsisat.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableUretimKaynakTahsisat.GetfBasSaat: TField;
begin
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  Result := FfBasSaat;
end;

function TTableUretimKaynakTahsisat.GetfBasTarihSaat: TField;
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  Result := FfBasTarihSaat;
end;

function TTableUretimKaynakTahsisat.GetfBitSaat: TField;
begin
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  Result := FfBitSaat;
end;

function TTableUretimKaynakTahsisat.GetfBitTarihSaat: TField;
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  Result := FfBitTarihSaat;
end;

function TTableUretimKaynakTahsisat.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableUretimKaynakTahsisat.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableUretimKaynakTahsisat.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimKaynakTahsisat.GetfIsMerkezKod: TField;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod;
end;

function TTableUretimKaynakTahsisat.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimKaynakTahsisat.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableUretimKaynakTahsisat.GetfMiktar: TField;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar;
end;

function TTableUretimKaynakTahsisat.GetfOperasyonNo: TField;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo;
end;

function TTableUretimKaynakTahsisat.GetfPlanNo: TField;
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  Result := FfPlanNo;
end;

function TTableUretimKaynakTahsisat.GetfPlanSiraNo: TField;
begin
  if FfPlanSiraNo = nil then
    FfPlanSiraNo := FindField('PLANSIRANO');
  Result := FfPlanSiraNo;
end;

function TTableUretimKaynakTahsisat.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimKaynakTahsisat.GetfSecenekler: TField;
begin
  if FfSecenekler = nil then
    FfSecenekler := FindField('SECENEKLER');
  Result := FfSecenekler;
end;

function TTableUretimKaynakTahsisat.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableUretimKaynakTahsisat.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimKaynakTahsisat.GetfMalAd: TField;
begin
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  Result := FfMalAd;
end;

function TTableUretimKaynakTahsisat.GetfSure: TField;
begin
  if FfSure = nil then
    FfSure := FindField('SURE');
  Result := FfSure;
end;

function TTableUretimKaynakTahsisat.GetfSureTip: TField;
begin
  if FfSureTip = nil then
    FfSureTip := FindField('SURETIP');
  Result := FfSureTip;
end;

function TTableUretimKaynakTahsisat.GetfTarih: TField;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih;
end;

function TTableUretimKaynakTahsisat.GetfTip: TField;
begin
  if FfTip = nil then
    FfTip := FindField('TIP');
  Result := FfTip;
end;

function TTableUretimKaynakTahsisat.GetfUretimNo: TField;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo;
end;

function TTableUretimKaynakTahsisat.GetfUretimSiraNo: TField;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo;
end;

function TTableUretimKaynakTahsisat.GetfVardiyaKod: TField;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod;
end;

function TTableUretimKaynakTahsisat.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableUretimKaynakTahsisat.SetBasSaat(const Value: TDate);
begin
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  FfBasSaat.AsDateTime := Value;
end;

procedure TTableUretimKaynakTahsisat.SetBasTarihSaat(const Value: TDate);
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  FfBasTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimKaynakTahsisat.SetBitSaat(const Value: TDate);
begin
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  FfBitSaat.AsDateTime := Value;
end;

procedure TTableUretimKaynakTahsisat.SetBitTarihSaat(const Value: TDate);
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  FfBitTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimKaynakTahsisat.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableUretimKaynakTahsisat.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableUretimKaynakTahsisat.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimKaynakTahsisat.SetIsMerkezKod(const Value: String);
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  FfIsMerkezKod.AsString := Value;
end;

procedure TTableUretimKaynakTahsisat.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimKaynakTahsisat.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableUretimKaynakTahsisat.SetMiktar(const Value: Double);
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  FfMiktar.AsFloat := Value;
end;

procedure TTableUretimKaynakTahsisat.SetOperasyonNo(const Value: Integer);
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  FfOperasyonNo.AsInteger := Value;
end;

procedure TTableUretimKaynakTahsisat.SetPlanNo(const Value: String);
begin
  if FfPlanNo = nil then
    FfPlanNo := FindField('PLANNO');
  FfPlanNo.AsString := Value;
end;

procedure TTableUretimKaynakTahsisat.SetPlanSiraNo(const Value: Integer);
begin
  if FfPlanSiraNo = nil then
    FfPlanSiraNo := FindField('PLANSIRANO');
  FfPlanSiraNo.AsInteger := Value;
end;

procedure TTableUretimKaynakTahsisat.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimKaynakTahsisat.SetSecenekler(const Value: Integer);
begin
  if FfSecenekler = nil then
    FfSecenekler := FindField('SECENEKLER');
  FfSecenekler.AsInteger := Value;
end;

procedure TTableUretimKaynakTahsisat.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableUretimKaynakTahsisat.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimKaynakTahsisat.SetMalAd(const Value: String);
begin
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  FfMalAd.AsString := Value;
end;

procedure TTableUretimKaynakTahsisat.SetSure(const Value: Double);
begin
  if FfSure = nil then
    FfSure := FindField('SURE');
  FfSure.AsFloat := Value;
end;

procedure TTableUretimKaynakTahsisat.SetSureTip(const Value: Integer);
begin
  if FfSureTip = nil then
    FfSureTip := FindField('SURETIP');
  FfSureTip.AsInteger := Value;
end;

procedure TTableUretimKaynakTahsisat.SetTarih(const Value: TDate);
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  FfTarih.AsDateTime := Value;
end;

procedure TTableUretimKaynakTahsisat.SetTip(const Value: Integer);
begin
  if FfTip = nil then
    FfTip := FindField('TIP');
  FfTip.AsInteger := Value;
end;

procedure TTableUretimKaynakTahsisat.SetUretimNo(const Value: String);
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  FfUretimNo.AsString := Value;
end;

procedure TTableUretimKaynakTahsisat.SetUretimSiraNo(const Value: Integer);
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  FfUretimSiraNo.AsInteger := Value;
end;

procedure TTableUretimKaynakTahsisat.SetVardiyaKod(const Value: String);
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  FfVardiyaKod.AsString := Value;
end;

procedure TTableUretimKaynakTahsisat.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableUretimRotaKaynakDurus }

constructor TTableUretimRotaKaynakDurus.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTRKD';
end;

procedure TTableUretimRotaKaynakDurus.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfAdet = nil then
    FfAdet := FindField('ADET');
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  if FfBirimSure = nil then
    FfBirimSure := FindField('BIRIMSURE');
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
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
  if FfDurusKod = nil then
    FfDurusKod := FindField('DURUSKOD');
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
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
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  if FfOperasyonSiraNo = nil then
    FfOperasyonSiraNo := FindField('OPERASYONSIRANO');
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfSure = nil then
    FfSure := FindField('SURE');
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableUretimRotaKaynakDurus.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfAdet := nil;
    FfBasTarih := nil;
    FfBasTarihSaat := nil;
    FfBirimSure := nil;
    FfBitTarih := nil;
    FfBitTarihSaat := nil;
    FfDegistirenKaynak := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
    FfDurusKod := nil;
    FfEvrakNo := nil;
    FfEvrakTip := nil;
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfID := nil;
    FfIsMerkezKod := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKaynakKod := nil;
    FfMamulKod := nil;
    FfOperasyonNo := nil;
    FfOperasyonSiraNo := nil;
    FfOperatorKod := nil;
    FfRowGuid := nil;
    FfSiraNo := nil;
    FfSirketNo := nil;
    FfSure := nil;
    FfUretimNo := nil;
    FfUretimSiraNo := nil;
    FfVardiyaKod := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableUretimRotaKaynakDurus.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableUretimRotaKaynakDurus.GetAdet: Integer;
begin
  if FfAdet = nil then
    FfAdet := FindField('ADET');
  Result := FfAdet.AsInteger;
end;

function TTableUretimRotaKaynakDurus.GetBasTarih: TDate;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih.AsDateTime;
end;

function TTableUretimRotaKaynakDurus.GetBasTarihSaat: TDate;
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  Result := FfBasTarihSaat.AsDateTime;
end;

function TTableUretimRotaKaynakDurus.GetBirimSure: Double;
begin
  if FfBirimSure = nil then
    FfBirimSure := FindField('BIRIMSURE');
  Result := FfBirimSure.AsFloat;
end;

function TTableUretimRotaKaynakDurus.GetBitTarih: TDate;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih.AsDateTime;
end;

function TTableUretimRotaKaynakDurus.GetBitTarihSaat: TDate;
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  Result := FfBitTarihSaat.AsDateTime;
end;

function TTableUretimRotaKaynakDurus.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableUretimRotaKaynakDurus.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimRotaKaynakDurus.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimRotaKaynakDurus.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableUretimRotaKaynakDurus.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableUretimRotaKaynakDurus.GetDurusKod: String;
begin
  if FfDurusKod = nil then
    FfDurusKod := FindField('DURUSKOD');
  Result := FfDurusKod.AsString;
end;

function TTableUretimRotaKaynakDurus.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableUretimRotaKaynakDurus.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableUretimRotaKaynakDurus.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableUretimRotaKaynakDurus.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableUretimRotaKaynakDurus.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimRotaKaynakDurus.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableUretimRotaKaynakDurus.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableUretimRotaKaynakDurus.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimRotaKaynakDurus.GetIsMerkezKod: String;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod.AsString;
end;

function TTableUretimRotaKaynakDurus.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableUretimRotaKaynakDurus.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimRotaKaynakDurus.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimRotaKaynakDurus.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableUretimRotaKaynakDurus.GetOperasyonNo: Integer;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo.AsInteger;
end;

function TTableUretimRotaKaynakDurus.GetOperasyonSiraNo: Integer;
begin
  if FfOperasyonSiraNo = nil then
    FfOperasyonSiraNo := FindField('OPERASYONSIRANO');
  Result := FfOperasyonSiraNo.AsInteger;
end;

function TTableUretimRotaKaynakDurus.GetOperatorKod: String;
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  Result := FfOperatorKod.AsString;
end;

function TTableUretimRotaKaynakDurus.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimRotaKaynakDurus.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableUretimRotaKaynakDurus.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimRotaKaynakDurus.GetSure: Double;
begin
  if FfSure = nil then
    FfSure := FindField('SURE');
  Result := FfSure.AsFloat;
end;

function TTableUretimRotaKaynakDurus.GetUretimNo: String;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo.AsString;
end;

function TTableUretimRotaKaynakDurus.GetUretimSiraNo: Integer;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo.AsInteger;
end;

function TTableUretimRotaKaynakDurus.GetVardiyaKod: String;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod.AsString;
end;

function TTableUretimRotaKaynakDurus.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableUretimRotaKaynakDurus.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableUretimRotaKaynakDurus.GetfAdet: TField;
begin
  if FfAdet = nil then
    FfAdet := FindField('ADET');
  Result := FfAdet;
end;

function TTableUretimRotaKaynakDurus.GetfBasTarih: TField;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih;
end;

function TTableUretimRotaKaynakDurus.GetfBasTarihSaat: TField;
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  Result := FfBasTarihSaat;
end;

function TTableUretimRotaKaynakDurus.GetfBirimSure: TField;
begin
  if FfBirimSure = nil then
    FfBirimSure := FindField('BIRIMSURE');
  Result := FfBirimSure;
end;

function TTableUretimRotaKaynakDurus.GetfBitTarih: TField;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih;
end;

function TTableUretimRotaKaynakDurus.GetfBitTarihSaat: TField;
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  Result := FfBitTarihSaat;
end;

function TTableUretimRotaKaynakDurus.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableUretimRotaKaynakDurus.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimRotaKaynakDurus.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimRotaKaynakDurus.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableUretimRotaKaynakDurus.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableUretimRotaKaynakDurus.GetfDurusKod: TField;
begin
  if FfDurusKod = nil then
    FfDurusKod := FindField('DURUSKOD');
  Result := FfDurusKod;
end;

function TTableUretimRotaKaynakDurus.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableUretimRotaKaynakDurus.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableUretimRotaKaynakDurus.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableUretimRotaKaynakDurus.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableUretimRotaKaynakDurus.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimRotaKaynakDurus.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableUretimRotaKaynakDurus.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableUretimRotaKaynakDurus.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimRotaKaynakDurus.GetfIsMerkezKod: TField;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod;
end;

function TTableUretimRotaKaynakDurus.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableUretimRotaKaynakDurus.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimRotaKaynakDurus.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimRotaKaynakDurus.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableUretimRotaKaynakDurus.GetfOperasyonNo: TField;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo;
end;

function TTableUretimRotaKaynakDurus.GetfOperasyonSiraNo: TField;
begin
  if FfOperasyonSiraNo = nil then
    FfOperasyonSiraNo := FindField('OPERASYONSIRANO');
  Result := FfOperasyonSiraNo;
end;

function TTableUretimRotaKaynakDurus.GetfOperatorKod: TField;
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  Result := FfOperatorKod;
end;

function TTableUretimRotaKaynakDurus.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimRotaKaynakDurus.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableUretimRotaKaynakDurus.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimRotaKaynakDurus.GetfSure: TField;
begin
  if FfSure = nil then
    FfSure := FindField('SURE');
  Result := FfSure;
end;

function TTableUretimRotaKaynakDurus.GetfUretimNo: TField;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo;
end;

function TTableUretimRotaKaynakDurus.GetfUretimSiraNo: TField;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo;
end;

function TTableUretimRotaKaynakDurus.GetfVardiyaKod: TField;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod;
end;

function TTableUretimRotaKaynakDurus.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableUretimRotaKaynakDurus.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetAdet(const Value: Integer);
begin
  if FfAdet = nil then
    FfAdet := FindField('ADET');
  FfAdet.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetBasTarih(const Value: TDate);
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  FfBasTarih.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetBasTarihSaat(const Value: TDate);
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  FfBasTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetBirimSure(const Value: Double);
begin
  if FfBirimSure = nil then
    FfBirimSure := FindField('BIRIMSURE');
  FfBirimSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetBitTarih(const Value: TDate);
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  FfBitTarih.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetBitTarihSaat(const Value: TDate);
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  FfBitTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetDurusKod(const Value: String);
begin
  if FfDurusKod = nil then
    FfDurusKod := FindField('DURUSKOD');
  FfDurusKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetIsMerkezKod(const Value: String);
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  FfIsMerkezKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetOperasyonNo(const Value: Integer);
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  FfOperasyonNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetOperasyonSiraNo(const Value: Integer);
begin
  if FfOperasyonSiraNo = nil then
    FfOperasyonSiraNo := FindField('OPERASYONSIRANO');
  FfOperasyonSiraNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetOperatorKod(const Value: String);
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  FfOperatorKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetSure(const Value: Double);
begin
  if FfSure = nil then
    FfSure := FindField('SURE');
  FfSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetUretimNo(const Value: String);
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  FfUretimNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetUretimSiraNo(const Value: Integer);
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  FfUretimSiraNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetVardiyaKod(const Value: String);
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  FfVardiyaKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakDurus.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableUretimRotaKaynakHata }

constructor TTableUretimRotaKaynakHata.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTRKH';
end;

procedure TTableUretimRotaKaynakHata.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
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
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  if FfGirenkullanici = nil then
    FfGirenkullanici := FindField('GIRENKULLANICI');
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  if FfHataKod = nil then
    FfHataKod := FindField('HATAKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  if FfOperasyonSiraNo = nil then
    FfOperasyonSiraNo := FindField('OPERASYONSIRANO');
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableUretimRotaKaynakHata.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfDegistirenKaynak := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
    FfEvrakNo := nil;
    FfEvrakTip := nil;
    FfGirenKaynak := nil;
    FfGirenkullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfHataKod := nil;
    FfID := nil;
    FfIsMerkezKod := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKaynakKod := nil;
    FfMamulKod := nil;
    FfMiktar := nil;
    FfOperasyonNo := nil;
    FfOperasyonSiraNo := nil;
    FfOperatorKod := nil;
    FfRowGuid := nil;
    FfSiraNo := nil;
    FfSirketNo := nil;
    FfUretimNo := nil;
    FfUretimSiraNo := nil;
    FfVardiyaKod := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableUretimRotaKaynakHata.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableUretimRotaKaynakHata.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableUretimRotaKaynakHata.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimRotaKaynakHata.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimRotaKaynakHata.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableUretimRotaKaynakHata.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableUretimRotaKaynakHata.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableUretimRotaKaynakHata.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableUretimRotaKaynakHata.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableUretimRotaKaynakHata.GetGirenkullanici: String;
begin
  if FfGirenkullanici = nil then
    FfGirenkullanici := FindField('GIRENKULLANICI');
  Result := FfGirenkullanici.AsString;
end;

function TTableUretimRotaKaynakHata.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimRotaKaynakHata.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableUretimRotaKaynakHata.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableUretimRotaKaynakHata.GetHataKod: String;
begin
  if FfHataKod = nil then
    FfHataKod := FindField('HATAKOD');
  Result := FfHataKod.AsString;
end;

function TTableUretimRotaKaynakHata.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimRotaKaynakHata.GetIsMerkezKod: String;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod.AsString;
end;

function TTableUretimRotaKaynakHata.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableUretimRotaKaynakHata.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimRotaKaynakHata.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimRotaKaynakHata.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableUretimRotaKaynakHata.GetMiktar: Double;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar.AsFloat;
end;

function TTableUretimRotaKaynakHata.GetOperasyonNo: Integer;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo.AsInteger;
end;

function TTableUretimRotaKaynakHata.GetOperasyonSiraNo: Integer;
begin
  if FfOperasyonSiraNo = nil then
    FfOperasyonSiraNo := FindField('OPERASYONSIRANO');
  Result := FfOperasyonSiraNo.AsInteger;
end;

function TTableUretimRotaKaynakHata.GetOperatorKod: String;
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  Result := FfOperatorKod.AsString;
end;

function TTableUretimRotaKaynakHata.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimRotaKaynakHata.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableUretimRotaKaynakHata.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimRotaKaynakHata.GetUretimNo: String;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo.AsString;
end;

function TTableUretimRotaKaynakHata.GetUretimSiraNo: Integer;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo.AsInteger;
end;

function TTableUretimRotaKaynakHata.GetVardiyaKod: String;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod.AsString;
end;

function TTableUretimRotaKaynakHata.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableUretimRotaKaynakHata.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableUretimRotaKaynakHata.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableUretimRotaKaynakHata.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimRotaKaynakHata.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimRotaKaynakHata.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableUretimRotaKaynakHata.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableUretimRotaKaynakHata.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableUretimRotaKaynakHata.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableUretimRotaKaynakHata.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableUretimRotaKaynakHata.GetfGirenkullanici: TField;
begin
  if FfGirenkullanici = nil then
    FfGirenkullanici := FindField('GIRENKULLANICI');
  Result := FfGirenkullanici;
end;

function TTableUretimRotaKaynakHata.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimRotaKaynakHata.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableUretimRotaKaynakHata.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableUretimRotaKaynakHata.GetfHataKod: TField;
begin
  if FfHataKod = nil then
    FfHataKod := FindField('HATAKOD');
  Result := FfHataKod;
end;

function TTableUretimRotaKaynakHata.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimRotaKaynakHata.GetfIsMerkezKod: TField;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod;
end;

function TTableUretimRotaKaynakHata.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableUretimRotaKaynakHata.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimRotaKaynakHata.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimRotaKaynakHata.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableUretimRotaKaynakHata.GetfMiktar: TField;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar;
end;

function TTableUretimRotaKaynakHata.GetfOperasyonNo: TField;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo;
end;

function TTableUretimRotaKaynakHata.GetfOperasyonSiraNo: TField;
begin
  if FfOperasyonSiraNo = nil then
    FfOperasyonSiraNo := FindField('OPERASYONSIRANO');
  Result := FfOperasyonSiraNo;
end;

function TTableUretimRotaKaynakHata.GetfOperatorKod: TField;
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  Result := FfOperatorKod;
end;

function TTableUretimRotaKaynakHata.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimRotaKaynakHata.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableUretimRotaKaynakHata.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimRotaKaynakHata.GetfUretimNo: TField;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo;
end;

function TTableUretimRotaKaynakHata.GetfUretimSiraNo: TField;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo;
end;

function TTableUretimRotaKaynakHata.GetfVardiyaKod: TField;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod;
end;

function TTableUretimRotaKaynakHata.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableUretimRotaKaynakHata.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakHata.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakHata.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakHata.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetGirenkullanici(const Value: String);
begin
  if FfGirenkullanici = nil then
    FfGirenkullanici := FindField('GIRENKULLANICI');
  FfGirenkullanici.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakHata.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakHata.SetHataKod(const Value: String);
begin
  if FfHataKod = nil then
    FfHataKod := FindField('HATAKOD');
  FfHataKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakHata.SetIsMerkezKod(const Value: String);
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  FfIsMerkezKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakHata.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakHata.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetMiktar(const Value: Double);
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  FfMiktar.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakHata.SetOperasyonNo(const Value: Integer);
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  FfOperasyonNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakHata.SetOperasyonSiraNo(const Value: Integer);
begin
  if FfOperasyonSiraNo = nil then
    FfOperasyonSiraNo := FindField('OPERASYONSIRANO');
  FfOperasyonSiraNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakHata.SetOperatorKod(const Value: String);
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  FfOperatorKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakHata.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetUretimNo(const Value: String);
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  FfUretimNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetUretimSiraNo(const Value: Integer);
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  FfUretimSiraNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakHata.SetVardiyaKod(const Value: String);
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  FfVardiyaKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakHata.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableUretimRotaKaynakIslem }

constructor TTableUretimRotaKaynakIslem.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTRKI';
end;

procedure TTableUretimRotaKaynakIslem.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  if FfDurum = nil then
    FfDurum := FindField('DURUM');
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  if FfMekanikSaatBas = nil then
    FfMekanikSaatBas := FindField('MEKANIKSAATBAS');
  if FfMekanikSaatBit = nil then
    FfMekanikSaatBit := FindField('MEKANIKSAATBIT');
  if FfMekanikSaatKatSayi = nil then
    FfMekanikSaatKatSayi := FindField('MEKANIKSAATKATSAYI');
  if FfMekanikSaatSure = nil then
    FfMekanikSaatSure := FindField('MEKANIKSAATSURE');
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfSonrakiIslemNo = nil then
    FfSonrakiIslemNo := FindField('SONRAKIISLEMNO');
  if FfSure = nil then
    FfSure := FindField('SURE');
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableUretimRotaKaynakIslem.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfBasTarih := nil;
    FfBasTarihSaat := nil;
    FfBitTarih := nil;
    FfBitTarihSaat := nil;
    FfDurum := nil;
    FfEvrakNo := nil;
    FfEvrakTip := nil;
    FfID := nil;
    FfIslemNo := nil;
    FfIslemTip := nil;
    FfIsMerkezKod := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKaynakKod := nil;
    FfMamulKod := nil;
    FfMekanikSaatBas := nil;
    FfMekanikSaatBit := nil;
    FfMekanikSaatKatSayi := nil;
    FfMekanikSaatSure := nil;
    FfOperasyonNo := nil;
    FfOperatorKod := nil;
    FfSirketNo := nil;
    FfSonrakiIslemNo := nil;
    FfSure := nil;
    FfUretimNo := nil;
    FfUretimSiraNo := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableUretimRotaKaynakIslem.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableUretimRotaKaynakIslem.GetBasTarih: TDate;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih.AsDateTime;
end;

function TTableUretimRotaKaynakIslem.GetBasTarihSaat: TDate;
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  Result := FfBasTarihSaat.AsDateTime;
end;

function TTableUretimRotaKaynakIslem.GetBitTarih: TDate;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih.AsDateTime;
end;

function TTableUretimRotaKaynakIslem.GetBitTarihSaat: TDate;
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  Result := FfBitTarihSaat.AsDateTime;
end;

function TTableUretimRotaKaynakIslem.GetDurum: Integer;
begin
  if FfDurum = nil then
    FfDurum := FindField('DURUM');
  Result := FfDurum.AsInteger;
end;

function TTableUretimRotaKaynakIslem.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableUretimRotaKaynakIslem.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableUretimRotaKaynakIslem.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimRotaKaynakIslem.GetIslemNo: Integer;
begin
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  Result := FfIslemNo.AsInteger;
end;

function TTableUretimRotaKaynakIslem.GetIslemTip: Integer;
begin
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  Result := FfIslemTip.AsInteger;
end;

function TTableUretimRotaKaynakIslem.GetIsMerkezKod: String;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod.AsString;
end;

function TTableUretimRotaKaynakIslem.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableUretimRotaKaynakIslem.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimRotaKaynakIslem.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimRotaKaynakIslem.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableUretimRotaKaynakIslem.GetMekanikSaatBas: Double;
begin
  if FfMekanikSaatBas = nil then
    FfMekanikSaatBas := FindField('MEKANIKSAATBAS');
  Result := FfMekanikSaatBas.AsFloat;
end;

function TTableUretimRotaKaynakIslem.GetMekanikSaatBit: Double;
begin
  if FfMekanikSaatBit = nil then
    FfMekanikSaatBit := FindField('MEKANIKSAATBIT');
  Result := FfMekanikSaatBit.AsFloat;
end;

function TTableUretimRotaKaynakIslem.GetMekanikSaatKatSayi: Double;
begin
  if FfMekanikSaatKatSayi = nil then
    FfMekanikSaatKatSayi := FindField('MEKANIKSAATKATSAYI');
  Result := FfMekanikSaatKatSayi.AsFloat;
end;

function TTableUretimRotaKaynakIslem.GetMekanikSaatSure: Double;
begin
  if FfMekanikSaatSure = nil then
    FfMekanikSaatSure := FindField('MEKANIKSAATSURE');
  Result := FfMekanikSaatSure.AsFloat;
end;

function TTableUretimRotaKaynakIslem.GetOperasyonNo: Integer;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo.AsInteger;
end;

function TTableUretimRotaKaynakIslem.GetOperatorKod: String;
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  Result := FfOperatorKod.AsString;
end;

function TTableUretimRotaKaynakIslem.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimRotaKaynakIslem.GetSonrakiIslemNo: String;
begin
  if FfSonrakiIslemNo = nil then
    FfSonrakiIslemNo := FindField('SONRAKIISLEMNO');
  Result := FfSonrakiIslemNo.AsString;
end;

function TTableUretimRotaKaynakIslem.GetSure: Double;
begin
  if FfSure = nil then
    FfSure := FindField('SURE');
  Result := FfSure.AsFloat;
end;

function TTableUretimRotaKaynakIslem.GetUretimNo: String;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo.AsString;
end;

function TTableUretimRotaKaynakIslem.GetUretimSiraNo: Integer;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo.AsInteger;
end;

function TTableUretimRotaKaynakIslem.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableUretimRotaKaynakIslem.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableUretimRotaKaynakIslem.GetfBasTarih: TField;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih;
end;

function TTableUretimRotaKaynakIslem.GetfBasTarihSaat: TField;
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  Result := FfBasTarihSaat;
end;

function TTableUretimRotaKaynakIslem.GetfBitTarih: TField;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih;
end;

function TTableUretimRotaKaynakIslem.GetfBitTarihSaat: TField;
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  Result := FfBitTarihSaat;
end;

function TTableUretimRotaKaynakIslem.GetfDurum: TField;
begin
  if FfDurum = nil then
    FfDurum := FindField('DURUM');
  Result := FfDurum;
end;

function TTableUretimRotaKaynakIslem.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableUretimRotaKaynakIslem.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableUretimRotaKaynakIslem.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimRotaKaynakIslem.GetfIslemNo: TField;
begin
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  Result := FfIslemNo;
end;

function TTableUretimRotaKaynakIslem.GetfIslemTip: TField;
begin
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  Result := FfIslemTip;
end;

function TTableUretimRotaKaynakIslem.GetfIsMerkezKod: TField;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod;
end;

function TTableUretimRotaKaynakIslem.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableUretimRotaKaynakIslem.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimRotaKaynakIslem.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimRotaKaynakIslem.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableUretimRotaKaynakIslem.GetfMekanikSaatBas: TField;
begin
  if FfMekanikSaatBas = nil then
    FfMekanikSaatBas := FindField('MEKANIKSAATBAS');
  Result := FfMekanikSaatBas;
end;

function TTableUretimRotaKaynakIslem.GetfMekanikSaatBit: TField;
begin
  if FfMekanikSaatBit = nil then
    FfMekanikSaatBit := FindField('MEKANIKSAATBIT');
  Result := FfMekanikSaatBit;
end;

function TTableUretimRotaKaynakIslem.GetfMekanikSaatKatSayi: TField;
begin
  if FfMekanikSaatKatSayi = nil then
    FfMekanikSaatKatSayi := FindField('MEKANIKSAATKATSAYI');
  Result := FfMekanikSaatKatSayi;
end;

function TTableUretimRotaKaynakIslem.GetfMekanikSaatSure: TField;
begin
  if FfMekanikSaatSure = nil then
    FfMekanikSaatSure := FindField('MEKANIKSAATSURE');
  Result := FfMekanikSaatSure;
end;

function TTableUretimRotaKaynakIslem.GetfOperasyonNo: TField;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo;
end;

function TTableUretimRotaKaynakIslem.GetfOperatorKod: TField;
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  Result := FfOperatorKod;
end;

function TTableUretimRotaKaynakIslem.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimRotaKaynakIslem.GetfSonrakiIslemNo: TField;
begin
  if FfSonrakiIslemNo = nil then
    FfSonrakiIslemNo := FindField('SONRAKIISLEMNO');
  Result := FfSonrakiIslemNo;
end;

function TTableUretimRotaKaynakIslem.GetfSure: TField;
begin
  if FfSure = nil then
    FfSure := FindField('SURE');
  Result := FfSure;
end;

function TTableUretimRotaKaynakIslem.GetfUretimNo: TField;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo;
end;

function TTableUretimRotaKaynakIslem.GetfUretimSiraNo: TField;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo;
end;

function TTableUretimRotaKaynakIslem.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableUretimRotaKaynakIslem.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetBasTarih(const Value: TDate);
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  FfBasTarih.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetBasTarihSaat(const Value: TDate);
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  FfBasTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetBitTarih(const Value: TDate);
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  FfBitTarih.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetBitTarihSaat(const Value: TDate);
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  FfBitTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetDurum(const Value: Integer);
begin
  if FfDurum = nil then
    FfDurum := FindField('DURUM');
  FfDurum.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetIslemNo(const Value: Integer);
begin
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  FfIslemNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetIslemTip(const Value: Integer);
begin
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  FfIslemTip.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetIsMerkezKod(const Value: String);
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  FfIsMerkezKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetMekanikSaatBas(const Value: Double);
begin
  if FfMekanikSaatBas = nil then
    FfMekanikSaatBas := FindField('MEKANIKSAATBAS');
  FfMekanikSaatBas.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetMekanikSaatBit(const Value: Double);
begin
  if FfMekanikSaatBit = nil then
    FfMekanikSaatBit := FindField('MEKANIKSAATBIT');
  FfMekanikSaatBit.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetMekanikSaatKatSayi(const Value: Double);
begin
  if FfMekanikSaatKatSayi = nil then
    FfMekanikSaatKatSayi := FindField('MEKANIKSAATKATSAYI');
  FfMekanikSaatKatSayi.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetMekanikSaatSure(const Value: Double);
begin
  if FfMekanikSaatSure = nil then
    FfMekanikSaatSure := FindField('MEKANIKSAATSURE');
  FfMekanikSaatSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetOperasyonNo(const Value: Integer);
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  FfOperasyonNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetOperatorKod(const Value: String);
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  FfOperatorKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetSonrakiIslemNo(const Value: String);
begin
  if FfSonrakiIslemNo = nil then
    FfSonrakiIslemNo := FindField('SONRAKIISLEMNO');
  FfSonrakiIslemNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetSure(const Value: Double);
begin
  if FfSure = nil then
    FfSure := FindField('SURE');
  FfSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetUretimNo(const Value: String);
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  FfUretimNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetUretimSiraNo(const Value: Integer);
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  FfUretimSiraNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakIslem.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableUretimRotaKaynakOperasyon }

constructor TTableUretimRotaKaynakOperasyon.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTRKO';
end;

procedure TTableUretimRotaKaynakOperasyon.DoAfterOpen;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
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
  if FfDurum = nil then
    FfDurum := FindField('DURUM');
  if FfEvrakBirim = nil then
    FfEvrakBirim := FindField('EVRAKBIRIM');
  if FfEvrakBirimKatsayi = nil then
    FfEvrakBirimKatsayi := FindField('EVRAKBIRIMKATSAYI');
  if FfEvrakFireMiktar = nil then
    FfEvrakFireMiktar := FindField('EVRAKFIREMIKTAR');
  if FfEvrakMiktar = nil then
    FfEvrakMiktar := FindField('EVRAKMIKTAR');
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  if FfFireMiktar = nil then
    FfFireMiktar := FindField('FIREMIKTAR');
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
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  if FfMekanikSaatBas = nil then
    FfMekanikSaatBas := FindField('MEKANIKSAATBAS');
  if FfMekanikSaatBit = nil then
    FfMekanikSaatBit := FindField('MEKANIKSAATBIT');
  if FfMekanikSaatKatSayi = nil then
    FfMekanikSaatKatSayi := FindField('MEKANIKSAATKATSAYI');
  if FfMekanikSaatSure = nil then
    FfMekanikSaatSure := FindField('MEKANIKSAATSURE');
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  if FfOptCalismaBirimSure = nil then
    FfOptCalismaBirimSure := FindField('OPTCALISMABIRIMSURE');
  if FfOptCalismaSure = nil then
    FfOptCalismaSure := FindField('OPTCALISMASURE');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
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
  if FfSure = nil then
    FfSure := FindField('SURE');
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  if FfYetkili1 = nil then
    FfYetkili1 := FindField('YETKILI1');
  if FfYetkili2 = nil then
    FfYetkili2 := FindField('YETKILI2');
  inherited;
end;

procedure TTableUretimRotaKaynakOperasyon.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama1 := nil;
    FfAciklama2 := nil;
    FfAciklama3 := nil;
    FfAciklama4 := nil;
    FfAciklama5 := nil;
    FfBasTarih := nil;
    FfBasTarihSaat := nil;
    FfBitTarih := nil;
    FfBitTarihSaat := nil;
    FfBKod1 := nil;
    FfBKod2 := nil;
    FfBKod3 := nil;
    FfBKod4 := nil;
    FfBKod5 := nil;
    FfDegistirenKaynak := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
    FfDurum := nil;
    FfEvrakBirim := nil;
    FfEvrakBirimKatsayi := nil;
    FfEvrakFireMiktar := nil;
    FfEvrakMiktar := nil;
    FfEvrakNo := nil;
    FfEvrakTip := nil;
    FfFireMiktar := nil;
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfID := nil;
    FfIslemNo := nil;
    FfIsMerkezKod := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKaynakKod := nil;
    FfLKod1 := nil;
    FfLKod2 := nil;
    FfLKod3 := nil;
    FfLKod4 := nil;
    FfLKod5 := nil;
    FfMamulKod := nil;
    FfMekanikSaatBas := nil;
    FfMekanikSaatBit := nil;
    FfMekanikSaatKatSayi := nil;
    FfMekanikSaatSure := nil;
    FfMiktar := nil;
    FfMKod1 := nil;
    FfMKod2 := nil;
    FfMKod3 := nil;
    FfMKod4 := nil;
    FfMKod5 := nil;
    FfNKod1 := nil;
    FfNKod2 := nil;
    FfNKod3 := nil;
    FfNKod4 := nil;
    FfNKod5 := nil;
    FfOperasyonNo := nil;
    FfOperatorKod := nil;
    FfOptCalismaBirimSure := nil;
    FfOptCalismaSure := nil;
    FfRowGuid := nil;
    FfSiraNo := nil;
    FfSirketNo := nil;
    FfSKod1 := nil;
    FfSKod2 := nil;
    FfSKod3 := nil;
    FfSKod4 := nil;
    FfSKod5 := nil;
    FfSure := nil;
    FfUretimNo := nil;
    FfUretimSiraNo := nil;
    FfVardiyaKod := nil;
    FfVersiyonNo := nil;
    FfYetkili1 := nil;
    FfYetkili2 := nil;
  end;
  inherited;
end;

function TTableUretimRotaKaynakOperasyon.GetAciklama1: String;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetAciklama2: String;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetAciklama3: String;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetAciklama4: String;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetAciklama5: String;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetBasTarih: TDate;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih.AsDateTime;
end;

function TTableUretimRotaKaynakOperasyon.GetBasTarihSaat: TDate;
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  Result := FfBasTarihSaat.AsDateTime;
end;

function TTableUretimRotaKaynakOperasyon.GetBitTarih: TDate;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih.AsDateTime;
end;

function TTableUretimRotaKaynakOperasyon.GetBitTarihSaat: TDate;
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  Result := FfBitTarihSaat.AsDateTime;
end;

function TTableUretimRotaKaynakOperasyon.GetBKod1: Integer;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1.AsInteger;
end;

function TTableUretimRotaKaynakOperasyon.GetBKod2: Integer;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2.AsInteger;
end;

function TTableUretimRotaKaynakOperasyon.GetBKod3: Integer;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3.AsInteger;
end;

function TTableUretimRotaKaynakOperasyon.GetBKod4: Integer;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4.AsInteger;
end;

function TTableUretimRotaKaynakOperasyon.GetBKod5: Integer;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5.AsInteger;
end;

function TTableUretimRotaKaynakOperasyon.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimRotaKaynakOperasyon.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableUretimRotaKaynakOperasyon.GetDurum: Integer;
begin
  if FfDurum = nil then
    FfDurum := FindField('DURUM');
  Result := FfDurum.AsInteger;
end;

function TTableUretimRotaKaynakOperasyon.GetEvrakBirim: String;
begin
  if FfEvrakBirim = nil then
    FfEvrakBirim := FindField('EVRAKBIRIM');
  Result := FfEvrakBirim.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetEvrakBirimKatsayi: Double;
begin
  if FfEvrakBirimKatsayi = nil then
    FfEvrakBirimKatsayi := FindField('EVRAKBIRIMKATSAYI');
  Result := FfEvrakBirimKatsayi.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetEvrakFireMiktar: Double;
begin
  if FfEvrakFireMiktar = nil then
    FfEvrakFireMiktar := FindField('EVRAKFIREMIKTAR');
  Result := FfEvrakFireMiktar.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetEvrakMiktar: Double;
begin
  if FfEvrakMiktar = nil then
    FfEvrakMiktar := FindField('EVRAKMIKTAR');
  Result := FfEvrakMiktar.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableUretimRotaKaynakOperasyon.GetFireMiktar: Double;
begin
  if FfFireMiktar = nil then
    FfFireMiktar := FindField('FIREMIKTAR');
  Result := FfFireMiktar.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimRotaKaynakOperasyon.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableUretimRotaKaynakOperasyon.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimRotaKaynakOperasyon.GetIslemNo: Integer;
begin
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  Result := FfIslemNo.AsInteger;
end;

function TTableUretimRotaKaynakOperasyon.GetIsMerkezKod: String;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableUretimRotaKaynakOperasyon.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimRotaKaynakOperasyon.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetLKod1: String;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetLKod2: String;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetLKod3: String;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetLKod4: String;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetLKod5: String;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetMekanikSaatBas: Double;
begin
  if FfMekanikSaatBas = nil then
    FfMekanikSaatBas := FindField('MEKANIKSAATBAS');
  Result := FfMekanikSaatBas.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetMekanikSaatBit: Double;
begin
  if FfMekanikSaatBit = nil then
    FfMekanikSaatBit := FindField('MEKANIKSAATBIT');
  Result := FfMekanikSaatBit.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetMekanikSaatKatSayi: Double;
begin
  if FfMekanikSaatKatSayi = nil then
    FfMekanikSaatKatSayi := FindField('MEKANIKSAATKATSAYI');
  Result := FfMekanikSaatKatSayi.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetMekanikSaatSure: Double;
begin
  if FfMekanikSaatSure = nil then
    FfMekanikSaatSure := FindField('MEKANIKSAATSURE');
  Result := FfMekanikSaatSure.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetMiktar: Double;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetMKod1: String;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetMKod2: String;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetMKod3: String;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetMKod4: String;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetMKod5: String;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetNKod1: Double;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetNKod2: Double;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetNKod3: Double;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetNKod4: Double;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetNKod5: Double;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetOperasyonNo: Integer;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo.AsInteger;
end;

function TTableUretimRotaKaynakOperasyon.GetOperatorKod: String;
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  Result := FfOperatorKod.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetOptCalismaBirimSure: Double;
begin
  if FfOptCalismaBirimSure = nil then
    FfOptCalismaBirimSure := FindField('OPTCALISMABIRIMSURE');
  Result := FfOptCalismaBirimSure.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetOptCalismaSure: Double;
begin
  if FfOptCalismaSure = nil then
    FfOptCalismaSure := FindField('OPTCALISMASURE');
  Result := FfOptCalismaSure.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableUretimRotaKaynakOperasyon.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetSKod1: String;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetSKod2: String;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetSKod3: String;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetSKod4: String;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetSKod5: String;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetSure: Double;
begin
  if FfSure = nil then
    FfSure := FindField('SURE');
  Result := FfSure.AsFloat;
end;

function TTableUretimRotaKaynakOperasyon.GetUretimNo: String;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetUretimSiraNo: Integer;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo.AsInteger;
end;

function TTableUretimRotaKaynakOperasyon.GetVardiyaKod: String;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetYetkili1: String;
begin
  if FfYetkili1 = nil then
    FfYetkili1 := FindField('YETKILI1');
  Result := FfYetkili1.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetYetkili2: String;
begin
  if FfYetkili2 = nil then
    FfYetkili2 := FindField('YETKILI2');
  Result := FfYetkili2.AsString;
end;

function TTableUretimRotaKaynakOperasyon.GetfAciklama1: TField;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1;
end;

function TTableUretimRotaKaynakOperasyon.GetfAciklama2: TField;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2;
end;

function TTableUretimRotaKaynakOperasyon.GetfAciklama3: TField;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3;
end;

function TTableUretimRotaKaynakOperasyon.GetfAciklama4: TField;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4;
end;

function TTableUretimRotaKaynakOperasyon.GetfAciklama5: TField;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5;
end;

function TTableUretimRotaKaynakOperasyon.GetfBasTarih: TField;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih;
end;

function TTableUretimRotaKaynakOperasyon.GetfBasTarihSaat: TField;
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  Result := FfBasTarihSaat;
end;

function TTableUretimRotaKaynakOperasyon.GetfBitTarih: TField;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih;
end;

function TTableUretimRotaKaynakOperasyon.GetfBitTarihSaat: TField;
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  Result := FfBitTarihSaat;
end;

function TTableUretimRotaKaynakOperasyon.GetfBKod1: TField;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1;
end;

function TTableUretimRotaKaynakOperasyon.GetfBKod2: TField;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2;
end;

function TTableUretimRotaKaynakOperasyon.GetfBKod3: TField;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3;
end;

function TTableUretimRotaKaynakOperasyon.GetfBKod4: TField;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4;
end;

function TTableUretimRotaKaynakOperasyon.GetfBKod5: TField;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5;
end;

function TTableUretimRotaKaynakOperasyon.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableUretimRotaKaynakOperasyon.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimRotaKaynakOperasyon.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimRotaKaynakOperasyon.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableUretimRotaKaynakOperasyon.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableUretimRotaKaynakOperasyon.GetfDurum: TField;
begin
  if FfDurum = nil then
    FfDurum := FindField('DURUM');
  Result := FfDurum;
end;

function TTableUretimRotaKaynakOperasyon.GetfEvrakBirim: TField;
begin
  if FfEvrakBirim = nil then
    FfEvrakBirim := FindField('EVRAKBIRIM');
  Result := FfEvrakBirim;
end;

function TTableUretimRotaKaynakOperasyon.GetfEvrakBirimKatsayi: TField;
begin
  if FfEvrakBirimKatsayi = nil then
    FfEvrakBirimKatsayi := FindField('EVRAKBIRIMKATSAYI');
  Result := FfEvrakBirimKatsayi;
end;

function TTableUretimRotaKaynakOperasyon.GetfEvrakFireMiktar: TField;
begin
  if FfEvrakFireMiktar = nil then
    FfEvrakFireMiktar := FindField('EVRAKFIREMIKTAR');
  Result := FfEvrakFireMiktar;
end;

function TTableUretimRotaKaynakOperasyon.GetfEvrakMiktar: TField;
begin
  if FfEvrakMiktar = nil then
    FfEvrakMiktar := FindField('EVRAKMIKTAR');
  Result := FfEvrakMiktar;
end;

function TTableUretimRotaKaynakOperasyon.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableUretimRotaKaynakOperasyon.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableUretimRotaKaynakOperasyon.GetfFireMiktar: TField;
begin
  if FfFireMiktar = nil then
    FfFireMiktar := FindField('FIREMIKTAR');
  Result := FfFireMiktar;
end;

function TTableUretimRotaKaynakOperasyon.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableUretimRotaKaynakOperasyon.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableUretimRotaKaynakOperasyon.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimRotaKaynakOperasyon.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableUretimRotaKaynakOperasyon.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableUretimRotaKaynakOperasyon.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimRotaKaynakOperasyon.GetfIslemNo: TField;
begin
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  Result := FfIslemNo;
end;

function TTableUretimRotaKaynakOperasyon.GetfIsMerkezKod: TField;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod;
end;

function TTableUretimRotaKaynakOperasyon.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableUretimRotaKaynakOperasyon.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimRotaKaynakOperasyon.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimRotaKaynakOperasyon.GetfLKod1: TField;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1;
end;

function TTableUretimRotaKaynakOperasyon.GetfLKod2: TField;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2;
end;

function TTableUretimRotaKaynakOperasyon.GetfLKod3: TField;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3;
end;

function TTableUretimRotaKaynakOperasyon.GetfLKod4: TField;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4;
end;

function TTableUretimRotaKaynakOperasyon.GetfLKod5: TField;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5;
end;

function TTableUretimRotaKaynakOperasyon.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableUretimRotaKaynakOperasyon.GetfMekanikSaatBas: TField;
begin
  if FfMekanikSaatBas = nil then
    FfMekanikSaatBas := FindField('MEKANIKSAATBAS');
  Result := FfMekanikSaatBas;
end;

function TTableUretimRotaKaynakOperasyon.GetfMekanikSaatBit: TField;
begin
  if FfMekanikSaatBit = nil then
    FfMekanikSaatBit := FindField('MEKANIKSAATBIT');
  Result := FfMekanikSaatBit;
end;

function TTableUretimRotaKaynakOperasyon.GetfMekanikSaatKatSayi: TField;
begin
  if FfMekanikSaatKatSayi = nil then
    FfMekanikSaatKatSayi := FindField('MEKANIKSAATKATSAYI');
  Result := FfMekanikSaatKatSayi;
end;

function TTableUretimRotaKaynakOperasyon.GetfMekanikSaatSure: TField;
begin
  if FfMekanikSaatSure = nil then
    FfMekanikSaatSure := FindField('MEKANIKSAATSURE');
  Result := FfMekanikSaatSure;
end;

function TTableUretimRotaKaynakOperasyon.GetfMiktar: TField;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar;
end;

function TTableUretimRotaKaynakOperasyon.GetfMKod1: TField;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1;
end;

function TTableUretimRotaKaynakOperasyon.GetfMKod2: TField;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2;
end;

function TTableUretimRotaKaynakOperasyon.GetfMKod3: TField;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3;
end;

function TTableUretimRotaKaynakOperasyon.GetfMKod4: TField;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4;
end;

function TTableUretimRotaKaynakOperasyon.GetfMKod5: TField;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5;
end;

function TTableUretimRotaKaynakOperasyon.GetfNKod1: TField;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1;
end;

function TTableUretimRotaKaynakOperasyon.GetfNKod2: TField;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2;
end;

function TTableUretimRotaKaynakOperasyon.GetfNKod3: TField;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3;
end;

function TTableUretimRotaKaynakOperasyon.GetfNKod4: TField;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4;
end;

function TTableUretimRotaKaynakOperasyon.GetfNKod5: TField;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5;
end;

function TTableUretimRotaKaynakOperasyon.GetfOperasyonNo: TField;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo;
end;

function TTableUretimRotaKaynakOperasyon.GetfOperatorKod: TField;
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  Result := FfOperatorKod;
end;

function TTableUretimRotaKaynakOperasyon.GetfOptCalismaBirimSure: TField;
begin
  if FfOptCalismaBirimSure = nil then
    FfOptCalismaBirimSure := FindField('OPTCALISMABIRIMSURE');
  Result := FfOptCalismaBirimSure;
end;

function TTableUretimRotaKaynakOperasyon.GetfOptCalismaSure: TField;
begin
  if FfOptCalismaSure = nil then
    FfOptCalismaSure := FindField('OPTCALISMASURE');
  Result := FfOptCalismaSure;
end;

function TTableUretimRotaKaynakOperasyon.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimRotaKaynakOperasyon.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableUretimRotaKaynakOperasyon.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimRotaKaynakOperasyon.GetfSKod1: TField;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1;
end;

function TTableUretimRotaKaynakOperasyon.GetfSKod2: TField;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2;
end;

function TTableUretimRotaKaynakOperasyon.GetfSKod3: TField;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3;
end;

function TTableUretimRotaKaynakOperasyon.GetfSKod4: TField;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4;
end;

function TTableUretimRotaKaynakOperasyon.GetfSKod5: TField;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5;
end;

function TTableUretimRotaKaynakOperasyon.GetfSure: TField;
begin
  if FfSure = nil then
    FfSure := FindField('SURE');
  Result := FfSure;
end;

function TTableUretimRotaKaynakOperasyon.GetfUretimNo: TField;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo;
end;

function TTableUretimRotaKaynakOperasyon.GetfUretimSiraNo: TField;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo;
end;

function TTableUretimRotaKaynakOperasyon.GetfVardiyaKod: TField;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod;
end;

function TTableUretimRotaKaynakOperasyon.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

function TTableUretimRotaKaynakOperasyon.GetfYetkili1: TField;
begin
  if FfYetkili1 = nil then
    FfYetkili1 := FindField('YETKILI1');
  Result := FfYetkili1;
end;

function TTableUretimRotaKaynakOperasyon.GetfYetkili2: TField;
begin
  if FfYetkili2 = nil then
    FfYetkili2 := FindField('YETKILI2');
  Result := FfYetkili2;
end;

procedure TTableUretimRotaKaynakOperasyon.SetAciklama1(const Value: String);
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  FfAciklama1.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetAciklama2(const Value: String);
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  FfAciklama2.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetAciklama3(const Value: String);
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  FfAciklama3.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetAciklama4(const Value: String);
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  FfAciklama4.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetAciklama5(const Value: String);
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  FfAciklama5.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetBasTarih(const Value: TDate);
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  FfBasTarih.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetBasTarihSaat(const Value: TDate);
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  FfBasTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetBitTarih(const Value: TDate);
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  FfBitTarih.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetBitTarihSaat(const Value: TDate);
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  FfBitTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetBKod1(const Value: Integer);
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  FfBKod1.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetBKod2(const Value: Integer);
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  FfBKod2.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetBKod3(const Value: Integer);
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  FfBKod3.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetBKod4(const Value: Integer);
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  FfBKod4.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetBKod5(const Value: Integer);
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  FfBKod5.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetDurum(const Value: Integer);
begin
  if FfDurum = nil then
    FfDurum := FindField('DURUM');
  FfDurum.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetEvrakBirim(const Value: String);
begin
  if FfEvrakBirim = nil then
    FfEvrakBirim := FindField('EVRAKBIRIM');
  FfEvrakBirim.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetEvrakBirimKatsayi(const Value: Double);
begin
  if FfEvrakBirimKatsayi = nil then
    FfEvrakBirimKatsayi := FindField('EVRAKBIRIMKATSAYI');
  FfEvrakBirimKatsayi.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetEvrakFireMiktar(const Value: Double);
begin
  if FfEvrakFireMiktar = nil then
    FfEvrakFireMiktar := FindField('EVRAKFIREMIKTAR');
  FfEvrakFireMiktar.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetEvrakMiktar(const Value: Double);
begin
  if FfEvrakMiktar = nil then
    FfEvrakMiktar := FindField('EVRAKMIKTAR');
  FfEvrakMiktar.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetFireMiktar(const Value: Double);
begin
  if FfFireMiktar = nil then
    FfFireMiktar := FindField('FIREMIKTAR');
  FfFireMiktar.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetIslemNo(const Value: Integer);
begin
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  FfIslemNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetIsMerkezKod(const Value: String);
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  FfIsMerkezKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetLKod1(const Value: String);
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  FfLKod1.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetLKod2(const Value: String);
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  FfLKod2.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetLKod3(const Value: String);
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  FfLKod3.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetLKod4(const Value: String);
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  FfLKod4.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetLKod5(const Value: String);
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  FfLKod5.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetMekanikSaatBas(const Value: Double);
begin
  if FfMekanikSaatBas = nil then
    FfMekanikSaatBas := FindField('MEKANIKSAATBAS');
  FfMekanikSaatBas.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetMekanikSaatBit(const Value: Double);
begin
  if FfMekanikSaatBit = nil then
    FfMekanikSaatBit := FindField('MEKANIKSAATBIT');
  FfMekanikSaatBit.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetMekanikSaatKatSayi(const Value: Double);
begin
  if FfMekanikSaatKatSayi = nil then
    FfMekanikSaatKatSayi := FindField('MEKANIKSAATKATSAYI');
  FfMekanikSaatKatSayi.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetMekanikSaatSure(const Value: Double);
begin
  if FfMekanikSaatSure = nil then
    FfMekanikSaatSure := FindField('MEKANIKSAATSURE');
  FfMekanikSaatSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetMiktar(const Value: Double);
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  FfMiktar.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetMKod1(const Value: String);
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  FfMKod1.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetMKod2(const Value: String);
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  FfMKod2.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetMKod3(const Value: String);
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  FfMKod3.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetMKod4(const Value: String);
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  FfMKod4.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetMKod5(const Value: String);
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  FfMKod5.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetNKod1(const Value: Double);
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  FfNKod1.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetNKod2(const Value: Double);
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  FfNKod2.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetNKod3(const Value: Double);
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  FfNKod3.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetNKod4(const Value: Double);
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  FfNKod4.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetNKod5(const Value: Double);
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  FfNKod5.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetOperasyonNo(const Value: Integer);
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  FfOperasyonNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetOperatorKod(const Value: String);
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  FfOperatorKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetOptCalismaBirimSure(const Value: Double);
begin
  if FfOptCalismaBirimSure = nil then
    FfOptCalismaBirimSure := FindField('OPTCALISMABIRIMSURE');
  FfOptCalismaBirimSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetOptCalismaSure(const Value: Double);
begin
  if FfOptCalismaSure = nil then
    FfOptCalismaSure := FindField('OPTCALISMASURE');
  FfOptCalismaSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetSKod1(const Value: String);
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  FfSKod1.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetSKod2(const Value: String);
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  FfSKod2.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetSKod3(const Value: String);
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  FfSKod3.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetSKod4(const Value: String);
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  FfSKod4.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetSKod5(const Value: String);
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  FfSKod5.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetSure(const Value: Double);
begin
  if FfSure = nil then
    FfSure := FindField('SURE');
  FfSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetUretimNo(const Value: String);
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  FfUretimNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetUretimSiraNo(const Value: Integer);
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  FfUretimSiraNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetVardiyaKod(const Value: String);
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  FfVardiyaKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetYetkili1(const Value: String);
begin
  if FfYetkili1 = nil then
    FfYetkili1 := FindField('YETKILI1');
  FfYetkili1.AsString := Value;
end;

procedure TTableUretimRotaKaynakOperasyon.SetYetkili2(const Value: String);
begin
  if FfYetkili2 = nil then
    FfYetkili2 := FindField('YETKILI2');
  FfYetkili2.AsString := Value;
end;

{ TTableUretimRotaKaynak }

constructor TTableUretimRotaKaynak.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTROK';
end;

procedure TTableUretimRotaKaynak.DoAfterOpen;
begin
  if FfBeklemeSure = nil then
    FfBeklemeSure := FindField('BEKLEMESURE');
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  if FfDurusSure = nil then
    FfDurusSure := FindField('DURUSSURE');
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfKullanilan = nil then
    FfKullanilan := FindField('KULLANILAN');
  if FfKullanimSiraNo = nil then
    FfKullanimSiraNo := FindField('KULLANIMSIRANO');
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  if FfKuyrukSure = nil then
    FfKuyrukSure := FindField('KUYRUKSURE');
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  if FfOnUretimMiktar = nil then
    FfOnUretimMiktar := FindField('ONURETIMMIKTAR');
  if FfOpBasTarih = nil then
    FfOpBasTarih := FindField('OPBASTARIH');
  if FfOpBasTarihSaat = nil then
    FfOpBasTarihSaat := FindField('OPBASTARIHSAAT');
  if FfOpBitTarih = nil then
    FfOpBitTarih := FindField('OPBITTARIH');
  if FfOpBitTarihSaat = nil then
    FfOpBitTarihSaat := FindField('OPBITTARIHSAAT');
  if FfOpDurum = nil then
    FfOpDurum := FindField('OPDURUM');
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  if FfOpFireMiktar = nil then
    FfOpFireMiktar := FindField('OPFIREMIKTAR');
  if FfOpMiktar = nil then
    FfOpMiktar := FindField('OPMIKTAR');
  if FfOpSure = nil then
    FfOpSure := FindField('OPSURE');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSerbestMiktar = nil then
    FfSerbestMiktar := FindField('SERBESTMIKTAR');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
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
  if FfSokumMamulKod = nil then
    FfSokumMamulKod := FindField('SOKUMMAMULKOD');
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  if FfTasimaSure = nil then
    FfTasimaSure := FindField('TASIMASURE');
  if FfToplamSure = nil then
    FfToplamSure := FindField('TOPLAMSURE');
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableUretimRotaKaynak.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfBeklemeSure := nil;
    FfBKod1 := nil;
    FfBKod2 := nil;
    FfBKod3 := nil;
    FfBKod4 := nil;
    FfBKod5 := nil;
    FfCalismaSure := nil;
    FfDurusSure := nil;
    FfEvrakNo := nil;
    FfEvrakTip := nil;
    FfID := nil;
    FfIsMerkezKod := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKaynakKod := nil;
    FfKullanilan := nil;
    FfKullanimSiraNo := nil;
    FfKurulumSure := nil;
    FfKuyrukSure := nil;
    FfLKod1 := nil;
    FfLKod2 := nil;
    FfLKod3 := nil;
    FfLKod4 := nil;
    FfLKod5 := nil;
    FfMamulKod := nil;
    FfMiktar := nil;
    FfMKod1 := nil;
    FfMKod2 := nil;
    FfMKod3 := nil;
    FfMKod4 := nil;
    FfMKod5 := nil;
    FfNKod1 := nil;
    FfNKod2 := nil;
    FfNKod3 := nil;
    FfNKod4 := nil;
    FfNKod5 := nil;
    FfOnUretimMiktar := nil;
    FfOpBasTarih := nil;
    FfOpBasTarihSaat := nil;
    FfOpBitTarih := nil;
    FfOpBitTarihSaat := nil;
    FfOpDurum := nil;
    FfOperasyonNo := nil;
    FfOpFireMiktar := nil;
    FfOpMiktar := nil;
    FfOpSure := nil;
    FfRowGuid := nil;
    FfSerbestMiktar := nil;
    FfSirketNo := nil;
    FfSKod1 := nil;
    FfSKod2 := nil;
    FfSKod3 := nil;
    FfSKod4 := nil;
    FfSKod5 := nil;
    FfSokumMamulKod := nil;
    FfSokumSure := nil;
    FfTasimaSure := nil;
    FfToplamSure := nil;
    FfUretimNo := nil;
    FfUretimSiraNo := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableUretimRotaKaynak.GetBeklemeSure: Double;
begin
  if FfBeklemeSure = nil then
    FfBeklemeSure := FindField('BEKLEMESURE');
  Result := FfBeklemeSure.AsFloat;
end;

function TTableUretimRotaKaynak.GetBKod1: Integer;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1.AsInteger;
end;

function TTableUretimRotaKaynak.GetBKod2: Integer;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2.AsInteger;
end;

function TTableUretimRotaKaynak.GetBKod3: Integer;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3.AsInteger;
end;

function TTableUretimRotaKaynak.GetBKod4: Integer;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4.AsInteger;
end;

function TTableUretimRotaKaynak.GetBKod5: Integer;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5.AsInteger;
end;

function TTableUretimRotaKaynak.GetCalismaSure: Double;
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  Result := FfCalismaSure.AsFloat;
end;

function TTableUretimRotaKaynak.GetDurusSure: Double;
begin
  if FfDurusSure = nil then
    FfDurusSure := FindField('DURUSSURE');
  Result := FfDurusSure.AsFloat;
end;

function TTableUretimRotaKaynak.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableUretimRotaKaynak.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableUretimRotaKaynak.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimRotaKaynak.GetIsMerkezKod: String;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod.AsString;
end;

function TTableUretimRotaKaynak.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableUretimRotaKaynak.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimRotaKaynak.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimRotaKaynak.GetKullanilan: Integer;
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('KULLANILAN');
  Result := FfKullanilan.AsInteger;
end;

function TTableUretimRotaKaynak.GetKullanimSiraNo: Integer;
begin
  if FfKullanimSiraNo = nil then
    FfKullanimSiraNo := FindField('KULLANIMSIRANO');
  Result := FfKullanimSiraNo.AsInteger;
end;

function TTableUretimRotaKaynak.GetKurulumSure: Double;
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  Result := FfKurulumSure.AsFloat;
end;

function TTableUretimRotaKaynak.GetKuyrukSure: Double;
begin
  if FfKuyrukSure = nil then
    FfKuyrukSure := FindField('KUYRUKSURE');
  Result := FfKuyrukSure.AsFloat;
end;

function TTableUretimRotaKaynak.GetLKod1: String;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1.AsString;
end;

function TTableUretimRotaKaynak.GetLKod2: String;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2.AsString;
end;

function TTableUretimRotaKaynak.GetLKod3: String;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3.AsString;
end;

function TTableUretimRotaKaynak.GetLKod4: String;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4.AsString;
end;

function TTableUretimRotaKaynak.GetLKod5: String;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5.AsString;
end;

function TTableUretimRotaKaynak.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableUretimRotaKaynak.GetMiktar: Double;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar.AsFloat;
end;

function TTableUretimRotaKaynak.GetMKod1: String;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1.AsString;
end;

function TTableUretimRotaKaynak.GetMKod2: String;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2.AsString;
end;

function TTableUretimRotaKaynak.GetMKod3: String;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3.AsString;
end;

function TTableUretimRotaKaynak.GetMKod4: String;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4.AsString;
end;

function TTableUretimRotaKaynak.GetMKod5: String;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5.AsString;
end;

function TTableUretimRotaKaynak.GetNKod1: Double;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1.AsFloat;
end;

function TTableUretimRotaKaynak.GetNKod2: Double;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2.AsFloat;
end;

function TTableUretimRotaKaynak.GetNKod3: Double;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3.AsFloat;
end;

function TTableUretimRotaKaynak.GetNKod4: Double;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4.AsFloat;
end;

function TTableUretimRotaKaynak.GetNKod5: Double;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5.AsFloat;
end;

function TTableUretimRotaKaynak.GetOnUretimMiktar: Double;
begin
  if FfOnUretimMiktar = nil then
    FfOnUretimMiktar := FindField('ONURETIMMIKTAR');
  Result := FfOnUretimMiktar.AsFloat;
end;

function TTableUretimRotaKaynak.GetOpBasTarih: TDate;
begin
  if FfOpBasTarih = nil then
    FfOpBasTarih := FindField('OPBASTARIH');
  Result := FfOpBasTarih.AsDateTime;
end;

function TTableUretimRotaKaynak.GetOpBasTarihSaat: TDate;
begin
  if FfOpBasTarihSaat = nil then
    FfOpBasTarihSaat := FindField('OPBASTARIHSAAT');
  Result := FfOpBasTarihSaat.AsDateTime;
end;

function TTableUretimRotaKaynak.GetOpBitTarih: TDate;
begin
  if FfOpBitTarih = nil then
    FfOpBitTarih := FindField('OPBITTARIH');
  Result := FfOpBitTarih.AsDateTime;
end;

function TTableUretimRotaKaynak.GetOpBitTarihSaat: TDate;
begin
  if FfOpBitTarihSaat = nil then
    FfOpBitTarihSaat := FindField('OPBITTARIHSAAT');
  Result := FfOpBitTarihSaat.AsDateTime;
end;

function TTableUretimRotaKaynak.GetOpDurum: Integer;
begin
  if FfOpDurum = nil then
    FfOpDurum := FindField('OPDURUM');
  Result := FfOpDurum.AsInteger;
end;

function TTableUretimRotaKaynak.GetOperasyonNo: Integer;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo.AsInteger;
end;

function TTableUretimRotaKaynak.GetOpFireMiktar: Double;
begin
  if FfOpFireMiktar = nil then
    FfOpFireMiktar := FindField('OPFIREMIKTAR');
  Result := FfOpFireMiktar.AsFloat;
end;

function TTableUretimRotaKaynak.GetOpMiktar: Double;
begin
  if FfOpMiktar = nil then
    FfOpMiktar := FindField('OPMIKTAR');
  Result := FfOpMiktar.AsFloat;
end;

function TTableUretimRotaKaynak.GetOpSure: Double;
begin
  if FfOpSure = nil then
    FfOpSure := FindField('OPSURE');
  Result := FfOpSure.AsFloat;
end;

function TTableUretimRotaKaynak.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimRotaKaynak.GetSerbestMiktar: Double;
begin
  if FfSerbestMiktar = nil then
    FfSerbestMiktar := FindField('SERBESTMIKTAR');
  Result := FfSerbestMiktar.AsFloat;
end;

function TTableUretimRotaKaynak.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimRotaKaynak.GetSKod1: String;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1.AsString;
end;

function TTableUretimRotaKaynak.GetSKod2: String;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2.AsString;
end;

function TTableUretimRotaKaynak.GetSKod3: String;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3.AsString;
end;

function TTableUretimRotaKaynak.GetSKod4: String;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4.AsString;
end;

function TTableUretimRotaKaynak.GetSKod5: String;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5.AsString;
end;

function TTableUretimRotaKaynak.GetSokumMamulKod: String;
begin
  if FfSokumMamulKod = nil then
    FfSokumMamulKod := FindField('SOKUMMAMULKOD');
  Result := FfSokumMamulKod.AsString;
end;

function TTableUretimRotaKaynak.GetSokumSure: Double;
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  Result := FfSokumSure.AsFloat;
end;

function TTableUretimRotaKaynak.GetTasimaSure: Double;
begin
  if FfTasimaSure = nil then
    FfTasimaSure := FindField('TASIMASURE');
  Result := FfTasimaSure.AsFloat;
end;

function TTableUretimRotaKaynak.GetToplamSure: Double;
begin
  if FfToplamSure = nil then
    FfToplamSure := FindField('TOPLAMSURE');
  Result := FfToplamSure.AsFloat;
end;

function TTableUretimRotaKaynak.GetUretimNo: String;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo.AsString;
end;

function TTableUretimRotaKaynak.GetUretimSiraNo: Integer;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo.AsInteger;
end;

function TTableUretimRotaKaynak.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableUretimRotaKaynak.GetfBeklemeSure: TField;
begin
  if FfBeklemeSure = nil then
    FfBeklemeSure := FindField('BEKLEMESURE');
  Result := FfBeklemeSure;
end;

function TTableUretimRotaKaynak.GetfBKod1: TField;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1;
end;

function TTableUretimRotaKaynak.GetfBKod2: TField;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2;
end;

function TTableUretimRotaKaynak.GetfBKod3: TField;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3;
end;

function TTableUretimRotaKaynak.GetfBKod4: TField;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4;
end;

function TTableUretimRotaKaynak.GetfBKod5: TField;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5;
end;

function TTableUretimRotaKaynak.GetfCalismaSure: TField;
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  Result := FfCalismaSure;
end;

function TTableUretimRotaKaynak.GetfDurusSure: TField;
begin
  if FfDurusSure = nil then
    FfDurusSure := FindField('DURUSSURE');
  Result := FfDurusSure;
end;

function TTableUretimRotaKaynak.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableUretimRotaKaynak.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableUretimRotaKaynak.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimRotaKaynak.GetfIsMerkezKod: TField;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod;
end;

function TTableUretimRotaKaynak.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableUretimRotaKaynak.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimRotaKaynak.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimRotaKaynak.GetfKullanilan: TField;
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('KULLANILAN');
  Result := FfKullanilan;
end;

function TTableUretimRotaKaynak.GetfKullanimSiraNo: TField;
begin
  if FfKullanimSiraNo = nil then
    FfKullanimSiraNo := FindField('KULLANIMSIRANO');
  Result := FfKullanimSiraNo;
end;

function TTableUretimRotaKaynak.GetfKurulumSure: TField;
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  Result := FfKurulumSure;
end;

function TTableUretimRotaKaynak.GetfKuyrukSure: TField;
begin
  if FfKuyrukSure = nil then
    FfKuyrukSure := FindField('KUYRUKSURE');
  Result := FfKuyrukSure;
end;

function TTableUretimRotaKaynak.GetfLKod1: TField;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1;
end;

function TTableUretimRotaKaynak.GetfLKod2: TField;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2;
end;

function TTableUretimRotaKaynak.GetfLKod3: TField;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3;
end;

function TTableUretimRotaKaynak.GetfLKod4: TField;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4;
end;

function TTableUretimRotaKaynak.GetfLKod5: TField;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5;
end;

function TTableUretimRotaKaynak.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableUretimRotaKaynak.GetfMiktar: TField;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar;
end;

function TTableUretimRotaKaynak.GetfMKod1: TField;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1;
end;

function TTableUretimRotaKaynak.GetfMKod2: TField;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2;
end;

function TTableUretimRotaKaynak.GetfMKod3: TField;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3;
end;

function TTableUretimRotaKaynak.GetfMKod4: TField;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4;
end;

function TTableUretimRotaKaynak.GetfMKod5: TField;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5;
end;

function TTableUretimRotaKaynak.GetfNKod1: TField;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1;
end;

function TTableUretimRotaKaynak.GetfNKod2: TField;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2;
end;

function TTableUretimRotaKaynak.GetfNKod3: TField;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3;
end;

function TTableUretimRotaKaynak.GetfNKod4: TField;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4;
end;

function TTableUretimRotaKaynak.GetfNKod5: TField;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5;
end;

function TTableUretimRotaKaynak.GetfOnUretimMiktar: TField;
begin
  if FfOnUretimMiktar = nil then
    FfOnUretimMiktar := FindField('ONURETIMMIKTAR');
  Result := FfOnUretimMiktar;
end;

function TTableUretimRotaKaynak.GetfOpBasTarih: TField;
begin
  if FfOpBasTarih = nil then
    FfOpBasTarih := FindField('OPBASTARIH');
  Result := FfOpBasTarih;
end;

function TTableUretimRotaKaynak.GetfOpBasTarihSaat: TField;
begin
  if FfOpBasTarihSaat = nil then
    FfOpBasTarihSaat := FindField('OPBASTARIHSAAT');
  Result := FfOpBasTarihSaat;
end;

function TTableUretimRotaKaynak.GetfOpBitTarih: TField;
begin
  if FfOpBitTarih = nil then
    FfOpBitTarih := FindField('OPBITTARIH');
  Result := FfOpBitTarih;
end;

function TTableUretimRotaKaynak.GetfOpBitTarihSaat: TField;
begin
  if FfOpBitTarihSaat = nil then
    FfOpBitTarihSaat := FindField('OPBITTARIHSAAT');
  Result := FfOpBitTarihSaat;
end;

function TTableUretimRotaKaynak.GetfOpDurum: TField;
begin
  if FfOpDurum = nil then
    FfOpDurum := FindField('OPDURUM');
  Result := FfOpDurum;
end;

function TTableUretimRotaKaynak.GetfOperasyonNo: TField;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo;
end;

function TTableUretimRotaKaynak.GetfOpFireMiktar: TField;
begin
  if FfOpFireMiktar = nil then
    FfOpFireMiktar := FindField('OPFIREMIKTAR');
  Result := FfOpFireMiktar;
end;

function TTableUretimRotaKaynak.GetfOpMiktar: TField;
begin
  if FfOpMiktar = nil then
    FfOpMiktar := FindField('OPMIKTAR');
  Result := FfOpMiktar;
end;

function TTableUretimRotaKaynak.GetfOpSure: TField;
begin
  if FfOpSure = nil then
    FfOpSure := FindField('OPSURE');
  Result := FfOpSure;
end;

function TTableUretimRotaKaynak.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimRotaKaynak.GetfSerbestMiktar: TField;
begin
  if FfSerbestMiktar = nil then
    FfSerbestMiktar := FindField('SERBESTMIKTAR');
  Result := FfSerbestMiktar;
end;

function TTableUretimRotaKaynak.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimRotaKaynak.GetfSKod1: TField;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1;
end;

function TTableUretimRotaKaynak.GetfSKod2: TField;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2;
end;

function TTableUretimRotaKaynak.GetfSKod3: TField;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3;
end;

function TTableUretimRotaKaynak.GetfSKod4: TField;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4;
end;

function TTableUretimRotaKaynak.GetfSKod5: TField;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5;
end;

function TTableUretimRotaKaynak.GetfSokumMamulKod: TField;
begin
  if FfSokumMamulKod = nil then
    FfSokumMamulKod := FindField('SOKUMMAMULKOD');
  Result := FfSokumMamulKod;
end;

function TTableUretimRotaKaynak.GetfSokumSure: TField;
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  Result := FfSokumSure;
end;

function TTableUretimRotaKaynak.GetfTasimaSure: TField;
begin
  if FfTasimaSure = nil then
    FfTasimaSure := FindField('TASIMASURE');
  Result := FfTasimaSure;
end;

function TTableUretimRotaKaynak.GetfToplamSure: TField;
begin
  if FfToplamSure = nil then
    FfToplamSure := FindField('TOPLAMSURE');
  Result := FfToplamSure;
end;

function TTableUretimRotaKaynak.GetfUretimNo: TField;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo;
end;

function TTableUretimRotaKaynak.GetfUretimSiraNo: TField;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo;
end;

function TTableUretimRotaKaynak.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableUretimRotaKaynak.SetBeklemeSure(const Value: Double);
begin
  if FfBeklemeSure = nil then
    FfBeklemeSure := FindField('BEKLEMESURE');
  FfBeklemeSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetBKod1(const Value: Integer);
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  FfBKod1.AsInteger := Value;
end;

procedure TTableUretimRotaKaynak.SetBKod2(const Value: Integer);
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  FfBKod2.AsInteger := Value;
end;

procedure TTableUretimRotaKaynak.SetBKod3(const Value: Integer);
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  FfBKod3.AsInteger := Value;
end;

procedure TTableUretimRotaKaynak.SetBKod4(const Value: Integer);
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  FfBKod4.AsInteger := Value;
end;

procedure TTableUretimRotaKaynak.SetBKod5(const Value: Integer);
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  FfBKod5.AsInteger := Value;
end;

procedure TTableUretimRotaKaynak.SetCalismaSure(const Value: Double);
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  FfCalismaSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetDurusSure(const Value: Double);
begin
  if FfDurusSure = nil then
    FfDurusSure := FindField('DURUSSURE');
  FfDurusSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableUretimRotaKaynak.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimRotaKaynak.SetIsMerkezKod(const Value: String);
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  FfIsMerkezKod.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableUretimRotaKaynak.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimRotaKaynak.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetKullanilan(const Value: Integer);
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('KULLANILAN');
  FfKullanilan.AsInteger := Value;
end;

procedure TTableUretimRotaKaynak.SetKullanimSiraNo(const Value: Integer);
begin
  if FfKullanimSiraNo = nil then
    FfKullanimSiraNo := FindField('KULLANIMSIRANO');
  FfKullanimSiraNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynak.SetKurulumSure(const Value: Double);
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  FfKurulumSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetKuyrukSure(const Value: Double);
begin
  if FfKuyrukSure = nil then
    FfKuyrukSure := FindField('KUYRUKSURE');
  FfKuyrukSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetLKod1(const Value: String);
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  FfLKod1.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetLKod2(const Value: String);
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  FfLKod2.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetLKod3(const Value: String);
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  FfLKod3.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetLKod4(const Value: String);
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  FfLKod4.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetLKod5(const Value: String);
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  FfLKod5.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetMiktar(const Value: Double);
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  FfMiktar.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetMKod1(const Value: String);
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  FfMKod1.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetMKod2(const Value: String);
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  FfMKod2.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetMKod3(const Value: String);
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  FfMKod3.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetMKod4(const Value: String);
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  FfMKod4.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetMKod5(const Value: String);
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  FfMKod5.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetNKod1(const Value: Double);
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  FfNKod1.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetNKod2(const Value: Double);
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  FfNKod2.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetNKod3(const Value: Double);
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  FfNKod3.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetNKod4(const Value: Double);
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  FfNKod4.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetNKod5(const Value: Double);
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  FfNKod5.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetOnUretimMiktar(const Value: Double);
begin
  if FfOnUretimMiktar = nil then
    FfOnUretimMiktar := FindField('ONURETIMMIKTAR');
  FfOnUretimMiktar.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetOpBasTarih(const Value: TDate);
begin
  if FfOpBasTarih = nil then
    FfOpBasTarih := FindField('OPBASTARIH');
  FfOpBasTarih.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynak.SetOpBasTarihSaat(const Value: TDate);
begin
  if FfOpBasTarihSaat = nil then
    FfOpBasTarihSaat := FindField('OPBASTARIHSAAT');
  FfOpBasTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynak.SetOpBitTarih(const Value: TDate);
begin
  if FfOpBitTarih = nil then
    FfOpBitTarih := FindField('OPBITTARIH');
  FfOpBitTarih.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynak.SetOpBitTarihSaat(const Value: TDate);
begin
  if FfOpBitTarihSaat = nil then
    FfOpBitTarihSaat := FindField('OPBITTARIHSAAT');
  FfOpBitTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynak.SetOpDurum(const Value: Integer);
begin
  if FfOpDurum = nil then
    FfOpDurum := FindField('OPDURUM');
  FfOpDurum.AsInteger := Value;
end;

procedure TTableUretimRotaKaynak.SetOperasyonNo(const Value: Integer);
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  FfOperasyonNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynak.SetOpFireMiktar(const Value: Double);
begin
  if FfOpFireMiktar = nil then
    FfOpFireMiktar := FindField('OPFIREMIKTAR');
  FfOpFireMiktar.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetOpMiktar(const Value: Double);
begin
  if FfOpMiktar = nil then
    FfOpMiktar := FindField('OPMIKTAR');
  FfOpMiktar.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetOpSure(const Value: Double);
begin
  if FfOpSure = nil then
    FfOpSure := FindField('OPSURE');
  FfOpSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetSerbestMiktar(const Value: Double);
begin
  if FfSerbestMiktar = nil then
    FfSerbestMiktar := FindField('SERBESTMIKTAR');
  FfSerbestMiktar.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetSKod1(const Value: String);
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  FfSKod1.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetSKod2(const Value: String);
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  FfSKod2.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetSKod3(const Value: String);
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  FfSKod3.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetSKod4(const Value: String);
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  FfSKod4.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetSKod5(const Value: String);
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  FfSKod5.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetSokumMamulKod(const Value: String);
begin
  if FfSokumMamulKod = nil then
    FfSokumMamulKod := FindField('SOKUMMAMULKOD');
  FfSokumMamulKod.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetSokumSure(const Value: Double);
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  FfSokumSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetTasimaSure(const Value: Double);
begin
  if FfTasimaSure = nil then
    FfTasimaSure := FindField('TASIMASURE');
  FfTasimaSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetToplamSure(const Value: Double);
begin
  if FfToplamSure = nil then
    FfToplamSure := FindField('TOPLAMSURE');
  FfToplamSure.AsFloat := Value;
end;

procedure TTableUretimRotaKaynak.SetUretimNo(const Value: String);
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  FfUretimNo.AsString := Value;
end;

procedure TTableUretimRotaKaynak.SetUretimSiraNo(const Value: Integer);
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  FfUretimSiraNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynak.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableUretimRota }

constructor TTableUretimRota.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTROT';
end;

procedure TTableUretimRota.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  if FfOpBasTarih = nil then
    FfOpBasTarih := FindField('OPBASTARIH');
  if FfOpBasTarihSaat = nil then
    FfOpBasTarihSaat := FindField('OPBASTARIHSAAT');
  if FfOpBitTarih = nil then
    FfOpBitTarih := FindField('OPBITTARIH');
  if FfOpBitTarihSaat = nil then
    FfOpBitTarihSaat := FindField('OPBITTARIHSAAT');
  if FfOpDurum = nil then
    FfOpDurum := FindField('OPDURUM');
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  if FfOpFireMiktar = nil then
    FfOpFireMiktar := FindField('OPFIREMIKTAR');
  if FfOpMiktar = nil then
    FfOpMiktar := FindField('OPMIKTAR');
  if FfOpSure = nil then
    FfOpSure := FindField('OPSURE');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSerbestMiktar = nil then
    FfSerbestMiktar := FindField('SERBESTMIKTAR');
  if FfSerbestTarih = nil then
    FfSerbestTarih := FindField('SERBESTTARIH');
  if FfSerbestTarihSaat = nil then
    FfSerbestTarihSaat := FindField('SERBESTTARIHSAAT');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
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
  if FfSonrakiOperasyonNo = nil then
    FfSonrakiOperasyonNo := FindField('SONRAKIOPERASYONNO');
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableUretimRota.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfBKod1 := nil;
    FfBKod2 := nil;
    FfBKod3 := nil;
    FfBKod4 := nil;
    FfBKod5 := nil;
    FfEvrakNo := nil;
    FfEvrakTip := nil;
    FfID := nil;
    FfIsMerkezKod := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfLKod1 := nil;
    FfLKod2 := nil;
    FfLKod3 := nil;
    FfLKod4 := nil;
    FfLKod5 := nil;
    FfMamulKod := nil;
    FfMiktar := nil;
    FfMKod1 := nil;
    FfMKod2 := nil;
    FfMKod3 := nil;
    FfMKod4 := nil;
    FfMKod5 := nil;
    FfNKod1 := nil;
    FfNKod2 := nil;
    FfNKod3 := nil;
    FfNKod4 := nil;
    FfNKod5 := nil;
    FfOpBasTarih := nil;
    FfOpBasTarihSaat := nil;
    FfOpBitTarih := nil;
    FfOpBitTarihSaat := nil;
    FfOpDurum := nil;
    FfOperasyonNo := nil;
    FfOpFireMiktar := nil;
    FfOpMiktar := nil;
    FfOpSure := nil;
    FfRowGuid := nil;
    FfSerbestMiktar := nil;
    FfSerbestTarih := nil;
    FfSerbestTarihSaat := nil;
    FfSirketNo := nil;
    FfSKod1 := nil;
    FfSKod2 := nil;
    FfSKod3 := nil;
    FfSKod4 := nil;
    FfSKod5 := nil;
    FfSonrakiOperasyonNo := nil;
    FfUretimNo := nil;
    FfUretimSiraNo := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableUretimRota.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableUretimRota.GetBKod1: Integer;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1.AsInteger;
end;

function TTableUretimRota.GetBKod2: Integer;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2.AsInteger;
end;

function TTableUretimRota.GetBKod3: Integer;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3.AsInteger;
end;

function TTableUretimRota.GetBKod4: Integer;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4.AsInteger;
end;

function TTableUretimRota.GetBKod5: Integer;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5.AsInteger;
end;

function TTableUretimRota.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableUretimRota.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableUretimRota.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimRota.GetIsMerkezKod: String;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod.AsString;
end;

function TTableUretimRota.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableUretimRota.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimRota.GetLKod1: String;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1.AsString;
end;

function TTableUretimRota.GetLKod2: String;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2.AsString;
end;

function TTableUretimRota.GetLKod3: String;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3.AsString;
end;

function TTableUretimRota.GetLKod4: String;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4.AsString;
end;

function TTableUretimRota.GetLKod5: String;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5.AsString;
end;

function TTableUretimRota.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableUretimRota.GetMiktar: Double;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar.AsFloat;
end;

function TTableUretimRota.GetMKod1: String;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1.AsString;
end;

function TTableUretimRota.GetMKod2: String;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2.AsString;
end;

function TTableUretimRota.GetMKod3: String;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3.AsString;
end;

function TTableUretimRota.GetMKod4: String;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4.AsString;
end;

function TTableUretimRota.GetMKod5: String;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5.AsString;
end;

function TTableUretimRota.GetNKod1: Double;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1.AsFloat;
end;

function TTableUretimRota.GetNKod2: Double;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2.AsFloat;
end;

function TTableUretimRota.GetNKod3: Double;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3.AsFloat;
end;

function TTableUretimRota.GetNKod4: Double;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4.AsFloat;
end;

function TTableUretimRota.GetNKod5: Double;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5.AsFloat;
end;

function TTableUretimRota.GetOpBasTarih: TDate;
begin
  if FfOpBasTarih = nil then
    FfOpBasTarih := FindField('OPBASTARIH');
  Result := FfOpBasTarih.AsDateTime;
end;

function TTableUretimRota.GetOpBasTarihSaat: TDate;
begin
  if FfOpBasTarihSaat = nil then
    FfOpBasTarihSaat := FindField('OPBASTARIHSAAT');
  Result := FfOpBasTarihSaat.AsDateTime;
end;

function TTableUretimRota.GetOpBitTarih: TDate;
begin
  if FfOpBitTarih = nil then
    FfOpBitTarih := FindField('OPBITTARIH');
  Result := FfOpBitTarih.AsDateTime;
end;

function TTableUretimRota.GetOpBitTarihSaat: TDate;
begin
  if FfOpBitTarihSaat = nil then
    FfOpBitTarihSaat := FindField('OPBITTARIHSAAT');
  Result := FfOpBitTarihSaat.AsDateTime;
end;

function TTableUretimRota.GetOpDurum: Integer;
begin
  if FfOpDurum = nil then
    FfOpDurum := FindField('OPDURUM');
  Result := FfOpDurum.AsInteger;
end;

function TTableUretimRota.GetOperasyonNo: Integer;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo.AsInteger;
end;

function TTableUretimRota.GetOpFireMiktar: Double;
begin
  if FfOpFireMiktar = nil then
    FfOpFireMiktar := FindField('OPFIREMIKTAR');
  Result := FfOpFireMiktar.AsFloat;
end;

function TTableUretimRota.GetOpMiktar: Double;
begin
  if FfOpMiktar = nil then
    FfOpMiktar := FindField('OPMIKTAR');
  Result := FfOpMiktar.AsFloat;
end;

function TTableUretimRota.GetOpSure: Double;
begin
  if FfOpSure = nil then
    FfOpSure := FindField('OPSURE');
  Result := FfOpSure.AsFloat;
end;

function TTableUretimRota.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimRota.GetSerbestMiktar: Double;
begin
  if FfSerbestMiktar = nil then
    FfSerbestMiktar := FindField('SERBESTMIKTAR');
  Result := FfSerbestMiktar.AsFloat;
end;

function TTableUretimRota.GetSerbestTarih: TDate;
begin
  if FfSerbestTarih = nil then
    FfSerbestTarih := FindField('SERBESTTARIH');
  Result := FfSerbestTarih.AsDateTime;
end;

function TTableUretimRota.GetSerbestTarihSaat: TDate;
begin
  if FfSerbestTarihSaat = nil then
    FfSerbestTarihSaat := FindField('SERBESTTARIHSAAT');
  Result := FfSerbestTarihSaat.AsDateTime;
end;

function TTableUretimRota.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimRota.GetSKod1: String;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1.AsString;
end;

function TTableUretimRota.GetSKod2: String;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2.AsString;
end;

function TTableUretimRota.GetSKod3: String;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3.AsString;
end;

function TTableUretimRota.GetSKod4: String;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4.AsString;
end;

function TTableUretimRota.GetSKod5: String;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5.AsString;
end;

function TTableUretimRota.GetSonrakiOperasyonNo: String;
begin
  if FfSonrakiOperasyonNo = nil then
    FfSonrakiOperasyonNo := FindField('SONRAKIOPERASYONNO');
  Result := FfSonrakiOperasyonNo.AsString;
end;

function TTableUretimRota.GetUretimNo: String;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo.AsString;
end;

function TTableUretimRota.GetUretimSiraNo: Integer;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo.AsInteger;
end;

function TTableUretimRota.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableUretimRota.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableUretimRota.GetfBKod1: TField;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1;
end;

function TTableUretimRota.GetfBKod2: TField;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2;
end;

function TTableUretimRota.GetfBKod3: TField;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3;
end;

function TTableUretimRota.GetfBKod4: TField;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4;
end;

function TTableUretimRota.GetfBKod5: TField;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5;
end;

function TTableUretimRota.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableUretimRota.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableUretimRota.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimRota.GetfIsMerkezKod: TField;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod;
end;

function TTableUretimRota.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableUretimRota.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimRota.GetfLKod1: TField;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1;
end;

function TTableUretimRota.GetfLKod2: TField;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2;
end;

function TTableUretimRota.GetfLKod3: TField;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3;
end;

function TTableUretimRota.GetfLKod4: TField;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4;
end;

function TTableUretimRota.GetfLKod5: TField;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5;
end;

function TTableUretimRota.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableUretimRota.GetfMiktar: TField;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar;
end;

function TTableUretimRota.GetfMKod1: TField;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1;
end;

function TTableUretimRota.GetfMKod2: TField;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2;
end;

function TTableUretimRota.GetfMKod3: TField;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3;
end;

function TTableUretimRota.GetfMKod4: TField;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4;
end;

function TTableUretimRota.GetfMKod5: TField;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5;
end;

function TTableUretimRota.GetfNKod1: TField;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1;
end;

function TTableUretimRota.GetfNKod2: TField;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2;
end;

function TTableUretimRota.GetfNKod3: TField;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3;
end;

function TTableUretimRota.GetfNKod4: TField;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4;
end;

function TTableUretimRota.GetfNKod5: TField;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5;
end;

function TTableUretimRota.GetfOpBasTarih: TField;
begin
  if FfOpBasTarih = nil then
    FfOpBasTarih := FindField('OPBASTARIH');
  Result := FfOpBasTarih;
end;

function TTableUretimRota.GetfOpBasTarihSaat: TField;
begin
  if FfOpBasTarihSaat = nil then
    FfOpBasTarihSaat := FindField('OPBASTARIHSAAT');
  Result := FfOpBasTarihSaat;
end;

function TTableUretimRota.GetfOpBitTarih: TField;
begin
  if FfOpBitTarih = nil then
    FfOpBitTarih := FindField('OPBITTARIH');
  Result := FfOpBitTarih;
end;

function TTableUretimRota.GetfOpBitTarihSaat: TField;
begin
  if FfOpBitTarihSaat = nil then
    FfOpBitTarihSaat := FindField('OPBITTARIHSAAT');
  Result := FfOpBitTarihSaat;
end;

function TTableUretimRota.GetfOpDurum: TField;
begin
  if FfOpDurum = nil then
    FfOpDurum := FindField('OPDURUM');
  Result := FfOpDurum;
end;

function TTableUretimRota.GetfOperasyonNo: TField;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo;
end;

function TTableUretimRota.GetfOpFireMiktar: TField;
begin
  if FfOpFireMiktar = nil then
    FfOpFireMiktar := FindField('OPFIREMIKTAR');
  Result := FfOpFireMiktar;
end;

function TTableUretimRota.GetfOpMiktar: TField;
begin
  if FfOpMiktar = nil then
    FfOpMiktar := FindField('OPMIKTAR');
  Result := FfOpMiktar;
end;

function TTableUretimRota.GetfOpSure: TField;
begin
  if FfOpSure = nil then
    FfOpSure := FindField('OPSURE');
  Result := FfOpSure;
end;

function TTableUretimRota.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimRota.GetfSerbestMiktar: TField;
begin
  if FfSerbestMiktar = nil then
    FfSerbestMiktar := FindField('SERBESTMIKTAR');
  Result := FfSerbestMiktar;
end;

function TTableUretimRota.GetfSerbestTarih: TField;
begin
  if FfSerbestTarih = nil then
    FfSerbestTarih := FindField('SERBESTTARIH');
  Result := FfSerbestTarih;
end;

function TTableUretimRota.GetfSerbestTarihSaat: TField;
begin
  if FfSerbestTarihSaat = nil then
    FfSerbestTarihSaat := FindField('SERBESTTARIHSAAT');
  Result := FfSerbestTarihSaat;
end;

function TTableUretimRota.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimRota.GetfSKod1: TField;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1;
end;

function TTableUretimRota.GetfSKod2: TField;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2;
end;

function TTableUretimRota.GetfSKod3: TField;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3;
end;

function TTableUretimRota.GetfSKod4: TField;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4;
end;

function TTableUretimRota.GetfSKod5: TField;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5;
end;

function TTableUretimRota.GetfSonrakiOperasyonNo: TField;
begin
  if FfSonrakiOperasyonNo = nil then
    FfSonrakiOperasyonNo := FindField('SONRAKIOPERASYONNO');
  Result := FfSonrakiOperasyonNo;
end;

function TTableUretimRota.GetfUretimNo: TField;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo;
end;

function TTableUretimRota.GetfUretimSiraNo: TField;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo;
end;

function TTableUretimRota.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableUretimRota.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableUretimRota.SetBKod1(const Value: Integer);
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  FfBKod1.AsInteger := Value;
end;

procedure TTableUretimRota.SetBKod2(const Value: Integer);
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  FfBKod2.AsInteger := Value;
end;

procedure TTableUretimRota.SetBKod3(const Value: Integer);
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  FfBKod3.AsInteger := Value;
end;

procedure TTableUretimRota.SetBKod4(const Value: Integer);
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  FfBKod4.AsInteger := Value;
end;

procedure TTableUretimRota.SetBKod5(const Value: Integer);
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  FfBKod5.AsInteger := Value;
end;

procedure TTableUretimRota.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableUretimRota.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableUretimRota.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimRota.SetIsMerkezKod(const Value: String);
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  FfIsMerkezKod.AsString := Value;
end;

procedure TTableUretimRota.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableUretimRota.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimRota.SetLKod1(const Value: String);
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  FfLKod1.AsString := Value;
end;

procedure TTableUretimRota.SetLKod2(const Value: String);
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  FfLKod2.AsString := Value;
end;

procedure TTableUretimRota.SetLKod3(const Value: String);
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  FfLKod3.AsString := Value;
end;

procedure TTableUretimRota.SetLKod4(const Value: String);
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  FfLKod4.AsString := Value;
end;

procedure TTableUretimRota.SetLKod5(const Value: String);
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  FfLKod5.AsString := Value;
end;

procedure TTableUretimRota.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableUretimRota.SetMiktar(const Value: Double);
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  FfMiktar.AsFloat := Value;
end;

procedure TTableUretimRota.SetMKod1(const Value: String);
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  FfMKod1.AsString := Value;
end;

procedure TTableUretimRota.SetMKod2(const Value: String);
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  FfMKod2.AsString := Value;
end;

procedure TTableUretimRota.SetMKod3(const Value: String);
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  FfMKod3.AsString := Value;
end;

procedure TTableUretimRota.SetMKod4(const Value: String);
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  FfMKod4.AsString := Value;
end;

procedure TTableUretimRota.SetMKod5(const Value: String);
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  FfMKod5.AsString := Value;
end;

procedure TTableUretimRota.SetNKod1(const Value: Double);
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  FfNKod1.AsFloat := Value;
end;

procedure TTableUretimRota.SetNKod2(const Value: Double);
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  FfNKod2.AsFloat := Value;
end;

procedure TTableUretimRota.SetNKod3(const Value: Double);
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  FfNKod3.AsFloat := Value;
end;

procedure TTableUretimRota.SetNKod4(const Value: Double);
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  FfNKod4.AsFloat := Value;
end;

procedure TTableUretimRota.SetNKod5(const Value: Double);
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  FfNKod5.AsFloat := Value;
end;

procedure TTableUretimRota.SetOpBasTarih(const Value: TDate);
begin
  if FfOpBasTarih = nil then
    FfOpBasTarih := FindField('OPBASTARIH');
  FfOpBasTarih.AsDateTime := Value;
end;

procedure TTableUretimRota.SetOpBasTarihSaat(const Value: TDate);
begin
  if FfOpBasTarihSaat = nil then
    FfOpBasTarihSaat := FindField('OPBASTARIHSAAT');
  FfOpBasTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimRota.SetOpBitTarih(const Value: TDate);
begin
  if FfOpBitTarih = nil then
    FfOpBitTarih := FindField('OPBITTARIH');
  FfOpBitTarih.AsDateTime := Value;
end;

procedure TTableUretimRota.SetOpBitTarihSaat(const Value: TDate);
begin
  if FfOpBitTarihSaat = nil then
    FfOpBitTarihSaat := FindField('OPBITTARIHSAAT');
  FfOpBitTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimRota.SetOpDurum(const Value: Integer);
begin
  if FfOpDurum = nil then
    FfOpDurum := FindField('OPDURUM');
  FfOpDurum.AsInteger := Value;
end;

procedure TTableUretimRota.SetOperasyonNo(const Value: Integer);
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  FfOperasyonNo.AsInteger := Value;
end;

procedure TTableUretimRota.SetOpFireMiktar(const Value: Double);
begin
  if FfOpFireMiktar = nil then
    FfOpFireMiktar := FindField('OPFIREMIKTAR');
  FfOpFireMiktar.AsFloat := Value;
end;

procedure TTableUretimRota.SetOpMiktar(const Value: Double);
begin
  if FfOpMiktar = nil then
    FfOpMiktar := FindField('OPMIKTAR');
  FfOpMiktar.AsFloat := Value;
end;

procedure TTableUretimRota.SetOpSure(const Value: Double);
begin
  if FfOpSure = nil then
    FfOpSure := FindField('OPSURE');
  FfOpSure.AsFloat := Value;
end;

procedure TTableUretimRota.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimRota.SetSerbestMiktar(const Value: Double);
begin
  if FfSerbestMiktar = nil then
    FfSerbestMiktar := FindField('SERBESTMIKTAR');
  FfSerbestMiktar.AsFloat := Value;
end;

procedure TTableUretimRota.SetSerbestTarih(const Value: TDate);
begin
  if FfSerbestTarih = nil then
    FfSerbestTarih := FindField('SERBESTTARIH');
  FfSerbestTarih.AsDateTime := Value;
end;

procedure TTableUretimRota.SetSerbestTarihSaat(const Value: TDate);
begin
  if FfSerbestTarihSaat = nil then
    FfSerbestTarihSaat := FindField('SERBESTTARIHSAAT');
  FfSerbestTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimRota.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimRota.SetSKod1(const Value: String);
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  FfSKod1.AsString := Value;
end;

procedure TTableUretimRota.SetSKod2(const Value: String);
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  FfSKod2.AsString := Value;
end;

procedure TTableUretimRota.SetSKod3(const Value: String);
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  FfSKod3.AsString := Value;
end;

procedure TTableUretimRota.SetSKod4(const Value: String);
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  FfSKod4.AsString := Value;
end;

procedure TTableUretimRota.SetSKod5(const Value: String);
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  FfSKod5.AsString := Value;
end;

procedure TTableUretimRota.SetSonrakiOperasyonNo(const Value: String);
begin
  if FfSonrakiOperasyonNo = nil then
    FfSonrakiOperasyonNo := FindField('SONRAKIOPERASYONNO');
  FfSonrakiOperasyonNo.AsString := Value;
end;

procedure TTableUretimRota.SetUretimNo(const Value: String);
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  FfUretimNo.AsString := Value;
end;

procedure TTableUretimRota.SetUretimSiraNo(const Value: Integer);
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  FfUretimSiraNo.AsInteger := Value;
end;

procedure TTableUretimRota.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

end.

