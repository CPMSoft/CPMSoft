unit CPMApp_TableBOMSystem;

interface

uses Windows, Classes, SysUtils, Controls,
    DB, CPMApp_DataObject, CPMApp_DataObjectModel, CPMApp_AggregateTable;

type
  TTableMamulBaslik = class;    // MAMBAS
  TTableMamulKart = class;    // MAMKRT
  TTableMamulKullanimGrup = class;    // MAMKUG
  TTableMamulKullanimKart = class;    // MAMKUK
  TTableMamulRotaKaynak = class;    // MAMKYN
  TTableMamulRevizyon = class;    // MAMREV
  TTableMamulRotaSonrakiOperasyon = class;    // MAMROP
  TTableMamulRota = class;    // MAMROT
  TTableMamulYanUrun = class;    // MAMYAN
  TTableIsMerkezKaynak = class;    // URTISK
  TTableIsMerkezKart = class;    // URTISM
  TTableUretimKaynakIslemTanim = class;    // URTKIT
  TTableUretimKaynakMamulDegisim = class;    // URTKMD
  TTableUretimKaynakMamulKurulum = class;    // URTKMK
  TTableUretimKaynakDevamsizlik = class;    // URTKYD
  TTableUretimKaynakKart = class;    // URTKYN
  TTableUretimKaynakSonDurum = class;    // URTKYS
  TTableUretimKaynakTakvim = class;    // URTKYT
  TTableUretimDurusKart = class;    // URTODK
  TTableUretimHataKart = class;    // URTOHK
  TTableUretimParametre = class;    // URTPRM
  TTableUretimTakvimKart = class;    // URTTKB
  TTableUretimTakvimVardiya = class;    // URTTKV
  TTableUretimVardiyaKart = class;    // URTVRB
  TTableUretimVardiyaKaynak = class;    // URTVRK
  TTableUretimVardiyaSaat = class;    // URTVRS
  TTableUretimYilKart = class;    // URTYIL
  TTableUretimYilTatil = class;    // URTYRT

  TTableMamulBaslik = class(TAppTable)
  Private
    FfAciklama1: TField;
    FfAciklama2: TField;
    FfAciklama3: TField;
    FfAciklama4: TField;
    FfAciklama5: TField;
    FfBirim: TField;
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
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfHammaddeDepoKod: TField;
    FfID: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKullanimKod: TField;
    FfKullanimSekli: TField;
    FfKurulumKod1: TField;
    FfKurulumKod2: TField;
    FfKurulumKod3: TField;
    FfKurulumKod4: TField;
    FfKurulumKod5: TField;
    FfKurulumKod6: TField;
    FfKurulumKod7: TField;
    FfKurulumKod8: TField;
    FfKurulumKod9: TField;
    FfLKod1: TField;
    FfLKod2: TField;
    FfLKod3: TField;
    FfLKod4: TField;
    FfLKod5: TField;
    FfKodBakim: TField;
    FfKodDizayn: TField;
    FfKodMaliyet: TField;
    FfKodSatis: TField;
    FfKodUretim: TField;
    FfKodYedekParca: TField;
    FfMamulDepokod: TField;
    FfMamulKod: TField;
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
    FfReceteNo: TField;
    FfRotaTip: TField;
    FfRowGuid: TField;
    FfSirketNo: TField;
    FfSKod1: TField;
    FfSKod2: TField;
    FfSKod3: TField;
    FfSKod4: TField;
    FfSKod5: TField;
    FfSokumKod1: TField;
    FfSokumKod2: TField;
    FfKullanilabilir: TField;
    FfStokCikis: TField;
    FfStokGiris: TField;
    FfStokMiktar: TField;
    FfDovizCins: TField;
    FfMalAd: TField;
    FfMaliyet1: TField;
    FfMaliyet2: TField;
    FfMaliyet3: TField;
    FfSurumNo: TField;
    FfVersiyonNo: TField;
    function GetAciklama1: String;
    function GetAciklama2: String;
    function GetAciklama3: String;
    function GetAciklama4: String;
    function GetAciklama5: String;
    function GetBirim: String;
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
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetHammaddeDepoKod: String;
    function GetID: Integer;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKullanimKod: String;
    function GetKullanimSekli: Integer;
    function GetKurulumKod1: String;
    function GetKurulumKod2: String;
    function GetKurulumKod3: String;
    function GetKurulumKod4: String;
    function GetKurulumKod5: String;
    function GetKurulumKod6: String;
    function GetKurulumKod7: String;
    function GetKurulumKod8: String;
    function GetKurulumKod9: String;
    function GetLKod1: String;
    function GetLKod2: String;
    function GetLKod3: String;
    function GetLKod4: String;
    function GetLKod5: String;
    function GetKodBakim: Integer;
    function GetKodDizayn: Integer;
    function GetKodMaliyet: Integer;
    function GetKodSatis: Integer;
    function GetKodUretim: Integer;
    function GetKodYedekParca: Integer;
    function GetMamulDepokod: String;
    function GetMamulKod: String;
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
    function GetReceteNo: String;
    function GetRotaTip: Integer;
    function GetRowGuid: String;
    function GetSirketNo: String;
    function GetSKod1: String;
    function GetSKod2: String;
    function GetSKod3: String;
    function GetSKod4: String;
    function GetSKod5: String;
    function GetSokumKod1: String;
    function GetSokumKod2: String;
    function GetKullanilabilir: Double;
    function GetStokCikis: Double;
    function GetStokGiris: Double;
    function GetStokMiktar: Double;
    function GetDovizCins: String;
    function GetMalAd: String;
    function GetMaliyet1: Double;
    function GetMaliyet2: Double;
    function GetMaliyet3: Double;
    function GetSurumNo: Integer;
    function GetVersiyonNo: String;
    function GetfAciklama1: TField;
    function GetfAciklama2: TField;
    function GetfAciklama3: TField;
    function GetfAciklama4: TField;
    function GetfAciklama5: TField;
    function GetfBirim: TField;
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
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfHammaddeDepoKod: TField;
    function GetfID: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKullanimKod: TField;
    function GetfKullanimSekli: TField;
    function GetfKurulumKod1: TField;
    function GetfKurulumKod2: TField;
    function GetfKurulumKod3: TField;
    function GetfKurulumKod4: TField;
    function GetfKurulumKod5: TField;
    function GetfKurulumKod6: TField;
    function GetfKurulumKod7: TField;
    function GetfKurulumKod8: TField;
    function GetfKurulumKod9: TField;
    function GetfLKod1: TField;
    function GetfLKod2: TField;
    function GetfLKod3: TField;
    function GetfLKod4: TField;
    function GetfLKod5: TField;
    function GetfKodBakim: TField;
    function GetfKodDizayn: TField;
    function GetfKodMaliyet: TField;
    function GetfKodSatis: TField;
    function GetfKodUretim: TField;
    function GetfKodYedekParca: TField;
    function GetfMamulDepokod: TField;
    function GetfMamulKod: TField;
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
    function GetfReceteNo: TField;
    function GetfRotaTip: TField;
    function GetfRowGuid: TField;
    function GetfSirketNo: TField;
    function GetfSKod1: TField;
    function GetfSKod2: TField;
    function GetfSKod3: TField;
    function GetfSKod4: TField;
    function GetfSKod5: TField;
    function GetfSokumKod1: TField;
    function GetfSokumKod2: TField;
    function GetfKullanilabilir: TField;
    function GetfStokCikis: TField;
    function GetfStokGiris: TField;
    function GetfStokMiktar: TField;
    function GetfDovizCins: TField;
    function GetfMalAd: TField;
    function GetfMaliyet1: TField;
    function GetfMaliyet2: TField;
    function GetfMaliyet3: TField;
    function GetfSurumNo: TField;
    function GetfVersiyonNo: TField;
    procedure SetAciklama1(const Value: String);
    procedure SetAciklama2(const Value: String);
    procedure SetAciklama3(const Value: String);
    procedure SetAciklama4(const Value: String);
    procedure SetAciklama5(const Value: String);
    procedure SetBirim(const Value: String);
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
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetHammaddeDepoKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKullanimKod(const Value: String);
    procedure SetKullanimSekli(const Value: Integer);
    procedure SetKurulumKod1(const Value: String);
    procedure SetKurulumKod2(const Value: String);
    procedure SetKurulumKod3(const Value: String);
    procedure SetKurulumKod4(const Value: String);
    procedure SetKurulumKod5(const Value: String);
    procedure SetKurulumKod6(const Value: String);
    procedure SetKurulumKod7(const Value: String);
    procedure SetKurulumKod8(const Value: String);
    procedure SetKurulumKod9(const Value: String);
    procedure SetLKod1(const Value: String);
    procedure SetLKod2(const Value: String);
    procedure SetLKod3(const Value: String);
    procedure SetLKod4(const Value: String);
    procedure SetLKod5(const Value: String);
    procedure SetKodBakim(const Value: Integer);
    procedure SetKodDizayn(const Value: Integer);
    procedure SetKodMaliyet(const Value: Integer);
    procedure SetKodSatis(const Value: Integer);
    procedure SetKodUretim(const Value: Integer);
    procedure SetKodYedekParca(const Value: Integer);
    procedure SetMamulDepokod(const Value: String);
    procedure SetMamulKod(const Value: String);
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
    procedure SetReceteNo(const Value: String);
    procedure SetRotaTip(const Value: Integer);
    procedure SetRowGuid(const Value: String);
    procedure SetSirketNo(const Value: String);
    procedure SetSKod1(const Value: String);
    procedure SetSKod2(const Value: String);
    procedure SetSKod3(const Value: String);
    procedure SetSKod4(const Value: String);
    procedure SetSKod5(const Value: String);
    procedure SetSokumKod1(const Value: String);
    procedure SetSokumKod2(const Value: String);
    procedure SetKullanilabilir(const Value: Double);
    procedure SetStokCikis(const Value: Double);
    procedure SetStokGiris(const Value: Double);
    procedure SetStokMiktar(const Value: Double);
    procedure SetDovizCins(const Value: String);
    procedure SetMalAd(const Value: String);
    procedure SetMaliyet1(const Value: Double);
    procedure SetMaliyet2(const Value: Double);
    procedure SetMaliyet3(const Value: Double);
    procedure SetSurumNo(const Value: Integer);
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
    property Birim: String read GetBirim write SetBirim;
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
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property HammaddeDepoKod: String read GetHammaddeDepoKod write SetHammaddeDepoKod;
    property ID: Integer read GetID write SetID;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KullanimKod: String read GetKullanimKod write SetKullanimKod;
    property KullanimSekli: Integer read GetKullanimSekli write SetKullanimSekli;
    property KurulumKod1: String read GetKurulumKod1 write SetKurulumKod1;
    property KurulumKod2: String read GetKurulumKod2 write SetKurulumKod2;
    property KurulumKod3: String read GetKurulumKod3 write SetKurulumKod3;
    property KurulumKod4: String read GetKurulumKod4 write SetKurulumKod4;
    property KurulumKod5: String read GetKurulumKod5 write SetKurulumKod5;
    property KurulumKod6: String read GetKurulumKod6 write SetKurulumKod6;
    property KurulumKod7: String read GetKurulumKod7 write SetKurulumKod7;
    property KurulumKod8: String read GetKurulumKod8 write SetKurulumKod8;
    property KurulumKod9: String read GetKurulumKod9 write SetKurulumKod9;
    property LKod1: String read GetLKod1 write SetLKod1;
    property LKod2: String read GetLKod2 write SetLKod2;
    property LKod3: String read GetLKod3 write SetLKod3;
    property LKod4: String read GetLKod4 write SetLKod4;
    property LKod5: String read GetLKod5 write SetLKod5;
    property KodBakim: Integer read GetKodBakim write SetKodBakim;
    property KodDizayn: Integer read GetKodDizayn write SetKodDizayn;
    property KodMaliyet: Integer read GetKodMaliyet write SetKodMaliyet;
    property KodSatis: Integer read GetKodSatis write SetKodSatis;
    property KodUretim: Integer read GetKodUretim write SetKodUretim;
    property KodYedekParca: Integer read GetKodYedekParca write SetKodYedekParca;
    property MamulDepokod: String read GetMamulDepokod write SetMamulDepokod;
    property MamulKod: String read GetMamulKod write SetMamulKod;
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
    property ReceteNo: String read GetReceteNo write SetReceteNo;
    property RotaTip: Integer read GetRotaTip write SetRotaTip;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property SKod1: String read GetSKod1 write SetSKod1;
    property SKod2: String read GetSKod2 write SetSKod2;
    property SKod3: String read GetSKod3 write SetSKod3;
    property SKod4: String read GetSKod4 write SetSKod4;
    property SKod5: String read GetSKod5 write SetSKod5;
    property SokumKod1: String read GetSokumKod1 write SetSokumKod1;
    property SokumKod2: String read GetSokumKod2 write SetSokumKod2;
    property Kullanilabilir: Double read GetKullanilabilir write SetKullanilabilir;
    property StokCikis: Double read GetStokCikis write SetStokCikis;
    property StokGiris: Double read GetStokGiris write SetStokGiris;
    property StokMiktar: Double read GetStokMiktar write SetStokMiktar;
    property DovizCins: String read GetDovizCins write SetDovizCins;
    property MalAd: String read GetMalAd write SetMalAd;
    property Maliyet1: Double read GetMaliyet1 write SetMaliyet1;
    property Maliyet2: Double read GetMaliyet2 write SetMaliyet2;
    property Maliyet3: Double read GetMaliyet3 write SetMaliyet3;
    property SurumNo: Integer read GetSurumNo write SetSurumNo;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fAciklama1:TField read GetfAciklama1;
    property fAciklama2:TField read GetfAciklama2;
    property fAciklama3:TField read GetfAciklama3;
    property fAciklama4:TField read GetfAciklama4;
    property fAciklama5:TField read GetfAciklama5;
    property fBirim:TField read GetfBirim;
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
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fHammaddeDepoKod:TField read GetfHammaddeDepoKod;
    property fID:TField read GetfID;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKullanimKod:TField read GetfKullanimKod;
    property fKullanimSekli:TField read GetfKullanimSekli;
    property fKurulumKod1:TField read GetfKurulumKod1;
    property fKurulumKod2:TField read GetfKurulumKod2;
    property fKurulumKod3:TField read GetfKurulumKod3;
    property fKurulumKod4:TField read GetfKurulumKod4;
    property fKurulumKod5:TField read GetfKurulumKod5;
    property fKurulumKod6:TField read GetfKurulumKod6;
    property fKurulumKod7:TField read GetfKurulumKod7;
    property fKurulumKod8:TField read GetfKurulumKod8;
    property fKurulumKod9:TField read GetfKurulumKod9;
    property fLKod1:TField read GetfLKod1;
    property fLKod2:TField read GetfLKod2;
    property fLKod3:TField read GetfLKod3;
    property fLKod4:TField read GetfLKod4;
    property fLKod5:TField read GetfLKod5;
    property fKodBakim:TField read GetfKodBakim;
    property fKodDizayn:TField read GetfKodDizayn;
    property fKodMaliyet:TField read GetfKodMaliyet;
    property fKodSatis:TField read GetfKodSatis;
    property fKodUretim:TField read GetfKodUretim;
    property fKodYedekParca:TField read GetfKodYedekParca;
    property fMamulDepokod:TField read GetfMamulDepokod;
    property fMamulKod:TField read GetfMamulKod;
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
    property fReceteNo:TField read GetfReceteNo;
    property fRotaTip:TField read GetfRotaTip;
    property fRowGuid:TField read GetfRowGuid;
    property fSirketNo:TField read GetfSirketNo;
    property fSKod1:TField read GetfSKod1;
    property fSKod2:TField read GetfSKod2;
    property fSKod3:TField read GetfSKod3;
    property fSKod4:TField read GetfSKod4;
    property fSKod5:TField read GetfSKod5;
    property fSokumKod1:TField read GetfSokumKod1;
    property fSokumKod2:TField read GetfSokumKod2;
    property fKullanilabilir:TField read GetfKullanilabilir;
    property fStokCikis:TField read GetfStokCikis;
    property fStokGiris:TField read GetfStokGiris;
    property fStokMiktar:TField read GetfStokMiktar;
    property fDovizCins:TField read GetfDovizCins;
    property fMalAd:TField read GetfMalAd;
    property fMaliyet1:TField read GetfMaliyet1;
    property fMaliyet2:TField read GetfMaliyet2;
    property fMaliyet3:TField read GetfMaliyet3;
    property fSurumNo:TField read GetfSurumNo;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableMamulKart = class(TAppTable)
  Private
    FfKeyID: TField;
    FfKeyParentID: TField;
    FfUretimMiktar: TField;
    FfAciklama1: TField;
    FfAciklama2: TField;
    FfAciklama3: TField;
    FfAciklama4: TField;
    FfAciklama5: TField;
    FfBasTarih: TField;
    FfBilesenFireOran: TField;
    FfBitTarih: TField;
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
    FfDepoKod: TField;
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfHammaddeBirim: TField;
    FfHammaddeKod: TField;
    FfHammaddeKullanimSekli: TField;
    FfHammaddeSurumNo: TField;
    FfHammaddeVersiyonNo: TField;
    FfID: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKaynakIslemNo: TField;
    FfKodBakim: TField;
    FfKodDizayn: TField;
    FfKodMaliyet: TField;
    FfKodSatis: TField;
    FfKodUretim: TField;
    FfKodYedekParca: TField;
    FfLKod1: TField;
    FfLKod2: TField;
    FfLKod3: TField;
    FfLKod4: TField;
    FfLKod5: TField;
    FfMamulBirim: TField;
    FfMamulHammaddeDepoKod: TField;
    FfMamulKullanimSekli: TField;
    FfMamulDepoKod: TField;
    FfMamulMalKod: TField;
    FfMamulStokBirimKatsayi: TField;
    FfMamulStokKartBirim: TField;
    FfMamulStokKartMontajFireOran: TField;
    FfMamulStokKartYuvarlama: TField;
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
    FfNKod6: TField;
    FfNKod7: TField;
    FfNKod8: TField;
    FfNKod9: TField;
    FfOperasyonFireKullan: TField;
    FfOperasyonFireMiktar: TField;
    FfOperasyonFireOran: TField;
    FfOperasyonNo: TField;
    FfPozNo: TField;
    FfReceteNo: TField;
    FfRevizyonNo: TField;
    FfRowGuid: TField;
    FfSiraNo: TField;
    FfSirketNo: TField;
    FfSKod1: TField;
    FfSKod2: TField;
    FfSKod3: TField;
    FfSKod4: TField;
    FfSKod5: TField;
    FfHammaddeStokBirimKatsayi: TField;
    FfKullanilabilir: TField;
    FfStokCikis: TField;
    FfStokGiris: TField;
    FfStokMiktar: TField;
    FfHammaddeStokKartBilesenFireOran: TField;
    FfHammaddeStokKartBirim: TField;
    FfHammaddeStokKartDovizCins: TField;
    FfHammaddeStokKartMaliyetGrupNo: TField;
    FfHammaddeAd: TField;
    FfMaliyet1: TField;
    FfMaliyet2: TField;
    FfMaliyet3: TField;
    FfHammaddeStokKartMRPTip: TField;
    FfHammaddeStokKartTeminTip: TField;
    FfHammaddeStokKartTeminYontem: TField;
    FfHammaddeStokKartYuvarlama: TField;
    FfSurumNo: TField;
    FfVersiyonNo: TField;
    FfYanUrunMaliyetOran: TField;
    FfYanUrunMaliyetTip: TField;
    FfYanUrunMiktar: TField;
    FfYanUrunNo: TField;
    function GetKeyID: Integer;
    function GetKeyParentID: Integer;
    function GetUretimMiktar: Double;
    function GetAciklama1: String;
    function GetAciklama2: String;
    function GetAciklama3: String;
    function GetAciklama4: String;
    function GetAciklama5: String;
    function GetBasTarih: TDate;
    function GetBilesenFireOran: Double;
    function GetBitTarih: TDate;
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
    function GetDepoKod: String;
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetHammaddeBirim: String;
    function GetHammaddeKod: String;
    function GetHammaddeKullanimSekli: Integer;
    function GetHammaddeSurumNo: Integer;
    function GetHammaddeVersiyonNo: String;
    function GetID: Integer;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKaynakIslemNo: Integer;
    function GetKodBakim: Integer;
    function GetKodDizayn: Integer;
    function GetKodMaliyet: Integer;
    function GetKodSatis: Integer;
    function GetKodUretim: Integer;
    function GetKodYedekParca: Integer;
    function GetLKod1: String;
    function GetLKod2: String;
    function GetLKod3: String;
    function GetLKod4: String;
    function GetLKod5: String;
    function GetMamulBirim: String;
    function GetMamulHammaddeDepoKod: String;
    function GetMamulKullanimSekli: Integer;
    function GetMamulDepoKod: String;
    function GetMamulMalKod: String;
    function GetMamulStokBirimKatsayi: Double;
    function GetMamulStokKartBirim: String;
    function GetMamulStokKartMontajFireOran: Double;
    function GetMamulStokKartYuvarlama: Integer;
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
    function GetNKod6: Double;
    function GetNKod7: Double;
    function GetNKod8: Double;
    function GetNKod9: Double;
    function GetOperasyonFireKullan: Integer;
    function GetOperasyonFireMiktar: Double;
    function GetOperasyonFireOran: Double;
    function GetOperasyonNo: Integer;
    function GetPozNo: String;
    function GetReceteNo: String;
    function GetRevizyonNo: String;
    function GetRowGuid: String;
    function GetSiraNo: Integer;
    function GetSirketNo: String;
    function GetSKod1: String;
    function GetSKod2: String;
    function GetSKod3: String;
    function GetSKod4: String;
    function GetSKod5: String;
    function GetHammaddeStokBirimKatsayi: Double;
    function GetKullanilabilir: Double;
    function GetStokCikis: Double;
    function GetStokGiris: Double;
    function GetStokMiktar: Double;
    function GetHammaddeStokKartBilesenFireOran: Double;
    function GetHammaddeStokKartBirim: String;
    function GetHammaddeStokKartDovizCins: String;
    function GetHammaddeStokKartMaliyetGrupNo: Integer;
    function GetHammaddeAd: String;
    function GetMaliyet1: Double;
    function GetMaliyet2: Double;
    function GetMaliyet3: Double;
    function GetHammaddeStokKartMRPTip: Integer;
    function GetHammaddeStokKartTeminTip: Integer;
    function GetHammaddeStokKartTeminYontem: Integer;
    function GetHammaddeStokKartYuvarlama: Integer;
    function GetSurumNo: Integer;
    function GetVersiyonNo: String;
    function GetYanUrunMaliyetOran: Double;
    function GetYanUrunMaliyetTip: Integer;
    function GetYanUrunMiktar: Double;
    function GetYanUrunNo: Integer;
    function GetfKeyID: TField;
    function GetfKeyParentID: TField;
    function GetfUretimMiktar: TField;
    function GetfAciklama1: TField;
    function GetfAciklama2: TField;
    function GetfAciklama3: TField;
    function GetfAciklama4: TField;
    function GetfAciklama5: TField;
    function GetfBasTarih: TField;
    function GetfBilesenFireOran: TField;
    function GetfBitTarih: TField;
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
    function GetfDepoKod: TField;
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfHammaddeBirim: TField;
    function GetfHammaddeKod: TField;
    function GetfHammaddeKullanimSekli: TField;
    function GetfHammaddeSurumNo: TField;
    function GetfHammaddeVersiyonNo: TField;
    function GetfID: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKaynakIslemNo: TField;
    function GetfKodBakim: TField;
    function GetfKodDizayn: TField;
    function GetfKodMaliyet: TField;
    function GetfKodSatis: TField;
    function GetfKodUretim: TField;
    function GetfKodYedekParca: TField;
    function GetfLKod1: TField;
    function GetfLKod2: TField;
    function GetfLKod3: TField;
    function GetfLKod4: TField;
    function GetfLKod5: TField;
    function GetfMamulBirim: TField;
    function GetfMamulHammaddeDepoKod: TField;
    function GetfMamulKullanimSekli: TField;
    function GetfMamulDepoKod: TField;
    function GetfMamulMalKod: TField;
    function GetfMamulStokBirimKatsayi: TField;
    function GetfMamulStokKartBirim: TField;
    function GetfMamulStokKartMontajFireOran: TField;
    function GetfMamulStokKartYuvarlama: TField;
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
    function GetfNKod6: TField;
    function GetfNKod7: TField;
    function GetfNKod8: TField;
    function GetfNKod9: TField;
    function GetfOperasyonFireKullan: TField;
    function GetfOperasyonFireMiktar: TField;
    function GetfOperasyonFireOran: TField;
    function GetfOperasyonNo: TField;
    function GetfPozNo: TField;
    function GetfReceteNo: TField;
    function GetfRevizyonNo: TField;
    function GetfRowGuid: TField;
    function GetfSiraNo: TField;
    function GetfSirketNo: TField;
    function GetfSKod1: TField;
    function GetfSKod2: TField;
    function GetfSKod3: TField;
    function GetfSKod4: TField;
    function GetfSKod5: TField;
    function GetfHammaddeStokBirimKatsayi: TField;
    function GetfKullanilabilir: TField;
    function GetfStokCikis: TField;
    function GetfStokGiris: TField;
    function GetfStokMiktar: TField;
    function GetfHammaddeStokKartBilesenFireOran: TField;
    function GetfHammaddeStokKartBirim: TField;
    function GetfHammaddeStokKartDovizCins: TField;
    function GetfHammaddeStokKartMaliyetGrupNo: TField;
    function GetfHammaddeAd: TField;
    function GetfMaliyet1: TField;
    function GetfMaliyet2: TField;
    function GetfMaliyet3: TField;
    function GetfHammaddeStokKartMRPTip: TField;
    function GetfHammaddeStokKartTeminTip: TField;
    function GetfHammaddeStokKartTeminYontem: TField;
    function GetfHammaddeStokKartYuvarlama: TField;
    function GetfSurumNo: TField;
    function GetfVersiyonNo: TField;
    function GetfYanUrunMaliyetOran: TField;
    function GetfYanUrunMaliyetTip: TField;
    function GetfYanUrunMiktar: TField;
    function GetfYanUrunNo: TField;
    procedure SetKeyID(const Value: Integer);
    procedure SetKeyParentID(const Value: Integer);
    procedure SetUretimMiktar(const Value: Double);
    procedure SetAciklama1(const Value: String);
    procedure SetAciklama2(const Value: String);
    procedure SetAciklama3(const Value: String);
    procedure SetAciklama4(const Value: String);
    procedure SetAciklama5(const Value: String);
    procedure SetBasTarih(const Value: TDate);
    procedure SetBilesenFireOran(const Value: Double);
    procedure SetBitTarih(const Value: TDate);
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
    procedure SetDepoKod(const Value: String);
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetHammaddeBirim(const Value: String);
    procedure SetHammaddeKod(const Value: String);
    procedure SetHammaddeKullanimSekli(const Value: Integer);
    procedure SetHammaddeSurumNo(const Value: Integer);
    procedure SetHammaddeVersiyonNo(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakIslemNo(const Value: Integer);
    procedure SetKodBakim(const Value: Integer);
    procedure SetKodDizayn(const Value: Integer);
    procedure SetKodMaliyet(const Value: Integer);
    procedure SetKodSatis(const Value: Integer);
    procedure SetKodUretim(const Value: Integer);
    procedure SetKodYedekParca(const Value: Integer);
    procedure SetLKod1(const Value: String);
    procedure SetLKod2(const Value: String);
    procedure SetLKod3(const Value: String);
    procedure SetLKod4(const Value: String);
    procedure SetLKod5(const Value: String);
    procedure SetMamulBirim(const Value: String);
    procedure SetMamulHammaddeDepoKod(const Value: String);
    procedure SetMamulKullanimSekli(const Value: Integer);
    procedure SetMamulDepoKod(const Value: String);
    procedure SetMamulMalKod(const Value: String);
    procedure SetMamulStokBirimKatsayi(const Value: Double);
    procedure SetMamulStokKartBirim(const Value: String);
    procedure SetMamulStokKartMontajFireOran(const Value: Double);
    procedure SetMamulStokKartYuvarlama(const Value: Integer);
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
    procedure SetNKod6(const Value: Double);
    procedure SetNKod7(const Value: Double);
    procedure SetNKod8(const Value: Double);
    procedure SetNKod9(const Value: Double);
    procedure SetOperasyonFireKullan(const Value: Integer);
    procedure SetOperasyonFireMiktar(const Value: Double);
    procedure SetOperasyonFireOran(const Value: Double);
    procedure SetOperasyonNo(const Value: Integer);
    procedure SetPozNo(const Value: String);
    procedure SetReceteNo(const Value: String);
    procedure SetRevizyonNo(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSirketNo(const Value: String);
    procedure SetSKod1(const Value: String);
    procedure SetSKod2(const Value: String);
    procedure SetSKod3(const Value: String);
    procedure SetSKod4(const Value: String);
    procedure SetSKod5(const Value: String);
    procedure SetHammaddeStokBirimKatsayi(const Value: Double);
    procedure SetKullanilabilir(const Value: Double);
    procedure SetStokCikis(const Value: Double);
    procedure SetStokGiris(const Value: Double);
    procedure SetStokMiktar(const Value: Double);
    procedure SetHammaddeStokKartBilesenFireOran(const Value: Double);
    procedure SetHammaddeStokKartBirim(const Value: String);
    procedure SetHammaddeStokKartDovizCins(const Value: String);
    procedure SetHammaddeStokKartMaliyetGrupNo(const Value: Integer);
    procedure SetHammaddeAd(const Value: String);
    procedure SetMaliyet1(const Value: Double);
    procedure SetMaliyet2(const Value: Double);
    procedure SetMaliyet3(const Value: Double);
    procedure SetHammaddeStokKartMRPTip(const Value: Integer);
    procedure SetHammaddeStokKartTeminTip(const Value: Integer);
    procedure SetHammaddeStokKartTeminYontem(const Value: Integer);
    procedure SetHammaddeStokKartYuvarlama(const Value: Integer);
    procedure SetSurumNo(const Value: Integer);
    procedure SetVersiyonNo(const Value: String);
    procedure SetYanUrunMaliyetOran(const Value: Double);
    procedure SetYanUrunMaliyetTip(const Value: Integer);
    procedure SetYanUrunMiktar(const Value: Double);
    procedure SetYanUrunNo(const Value: Integer);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property KeyID: Integer read GetKeyID write SetKeyID;
    property KeyParentID: Integer read GetKeyParentID write SetKeyParentID;
    property UretimMiktar: Double read GetUretimMiktar write SetUretimMiktar;
    property Aciklama1: String read GetAciklama1 write SetAciklama1;
    property Aciklama2: String read GetAciklama2 write SetAciklama2;
    property Aciklama3: String read GetAciklama3 write SetAciklama3;
    property Aciklama4: String read GetAciklama4 write SetAciklama4;
    property Aciklama5: String read GetAciklama5 write SetAciklama5;
    property BasTarih: TDate read GetBasTarih write SetBasTarih;
    property BilesenFireOran: Double read GetBilesenFireOran write SetBilesenFireOran;
    property BitTarih: TDate read GetBitTarih write SetBitTarih;
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
    property DepoKod: String read GetDepoKod write SetDepoKod;
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property HammaddeBirim: String read GetHammaddeBirim write SetHammaddeBirim;
    property HammaddeKod: String read GetHammaddeKod write SetHammaddeKod;
    property HammaddeKullanimSekli: Integer read GetHammaddeKullanimSekli write SetHammaddeKullanimSekli;
    property HammaddeSurumNo: Integer read GetHammaddeSurumNo write SetHammaddeSurumNo;
    property HammaddeVersiyonNo: String read GetHammaddeVersiyonNo write SetHammaddeVersiyonNo;
    property ID: Integer read GetID write SetID;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakIslemNo: Integer read GetKaynakIslemNo write SetKaynakIslemNo;
    property KodBakim: Integer read GetKodBakim write SetKodBakim;
    property KodDizayn: Integer read GetKodDizayn write SetKodDizayn;
    property KodMaliyet: Integer read GetKodMaliyet write SetKodMaliyet;
    property KodSatis: Integer read GetKodSatis write SetKodSatis;
    property KodUretim: Integer read GetKodUretim write SetKodUretim;
    property KodYedekParca: Integer read GetKodYedekParca write SetKodYedekParca;
    property LKod1: String read GetLKod1 write SetLKod1;
    property LKod2: String read GetLKod2 write SetLKod2;
    property LKod3: String read GetLKod3 write SetLKod3;
    property LKod4: String read GetLKod4 write SetLKod4;
    property LKod5: String read GetLKod5 write SetLKod5;
    property MamulBirim: String read GetMamulBirim write SetMamulBirim;
    property MamulHammaddeDepoKod: String read GetMamulHammaddeDepoKod write SetMamulHammaddeDepoKod;
    property MamulKullanimSekli: Integer read GetMamulKullanimSekli write SetMamulKullanimSekli;
    property MamulDepoKod: String read GetMamulDepoKod write SetMamulDepoKod;
    property MamulMalKod: String read GetMamulMalKod write SetMamulMalKod;
    property MamulStokBirimKatsayi: Double read GetMamulStokBirimKatsayi write SetMamulStokBirimKatsayi;
    property MamulStokKartBirim: String read GetMamulStokKartBirim write SetMamulStokKartBirim;
    property MamulStokKartMontajFireOran: Double read GetMamulStokKartMontajFireOran write SetMamulStokKartMontajFireOran;
    property MamulStokKartYuvarlama: Integer read GetMamulStokKartYuvarlama write SetMamulStokKartYuvarlama;
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
    property NKod6: Double read GetNKod6 write SetNKod6;
    property NKod7: Double read GetNKod7 write SetNKod7;
    property NKod8: Double read GetNKod8 write SetNKod8;
    property NKod9: Double read GetNKod9 write SetNKod9;
    property OperasyonFireKullan: Integer read GetOperasyonFireKullan write SetOperasyonFireKullan;
    property OperasyonFireMiktar: Double read GetOperasyonFireMiktar write SetOperasyonFireMiktar;
    property OperasyonFireOran: Double read GetOperasyonFireOran write SetOperasyonFireOran;
    property OperasyonNo: Integer read GetOperasyonNo write SetOperasyonNo;
    property PozNo: String read GetPozNo write SetPozNo;
    property ReceteNo: String read GetReceteNo write SetReceteNo;
    property RevizyonNo: String read GetRevizyonNo write SetRevizyonNo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property SKod1: String read GetSKod1 write SetSKod1;
    property SKod2: String read GetSKod2 write SetSKod2;
    property SKod3: String read GetSKod3 write SetSKod3;
    property SKod4: String read GetSKod4 write SetSKod4;
    property SKod5: String read GetSKod5 write SetSKod5;
    property HammaddeStokBirimKatsayi: Double read GetHammaddeStokBirimKatsayi write SetHammaddeStokBirimKatsayi;
    property Kullanilabilir: Double read GetKullanilabilir write SetKullanilabilir;
    property StokCikis: Double read GetStokCikis write SetStokCikis;
    property StokGiris: Double read GetStokGiris write SetStokGiris;
    property StokMiktar: Double read GetStokMiktar write SetStokMiktar;
    property HammaddeStokKartBilesenFireOran: Double read GetHammaddeStokKartBilesenFireOran write SetHammaddeStokKartBilesenFireOran;
    property HammaddeStokKartBirim: String read GetHammaddeStokKartBirim write SetHammaddeStokKartBirim;
    property HammaddeStokKartDovizCins: String read GetHammaddeStokKartDovizCins write SetHammaddeStokKartDovizCins;
    property HammaddeStokKartMaliyetGrupNo: Integer read GetHammaddeStokKartMaliyetGrupNo write SetHammaddeStokKartMaliyetGrupNo;
    property HammaddeAd: String read GetHammaddeAd write SetHammaddeAd;
    property Maliyet1: Double read GetMaliyet1 write SetMaliyet1;
    property Maliyet2: Double read GetMaliyet2 write SetMaliyet2;
    property Maliyet3: Double read GetMaliyet3 write SetMaliyet3;
    property HammaddeStokKartMRPTip: Integer read GetHammaddeStokKartMRPTip write SetHammaddeStokKartMRPTip;
    property HammaddeStokKartTeminTip: Integer read GetHammaddeStokKartTeminTip write SetHammaddeStokKartTeminTip;
    property HammaddeStokKartTeminYontem: Integer read GetHammaddeStokKartTeminYontem write SetHammaddeStokKartTeminYontem;
    property HammaddeStokKartYuvarlama: Integer read GetHammaddeStokKartYuvarlama write SetHammaddeStokKartYuvarlama;
    property SurumNo: Integer read GetSurumNo write SetSurumNo;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property YanUrunMaliyetOran: Double read GetYanUrunMaliyetOran write SetYanUrunMaliyetOran;
    property YanUrunMaliyetTip: Integer read GetYanUrunMaliyetTip write SetYanUrunMaliyetTip;
    property YanUrunMiktar: Double read GetYanUrunMiktar write SetYanUrunMiktar;
    property YanUrunNo: Integer read GetYanUrunNo write SetYanUrunNo;
    property fKeyID:TField read GetfKeyID;
    property fKeyParentID:TField read GetfKeyParentID;
    property fUretimMiktar:TField read GetfUretimMiktar;
    property fAciklama1:TField read GetfAciklama1;
    property fAciklama2:TField read GetfAciklama2;
    property fAciklama3:TField read GetfAciklama3;
    property fAciklama4:TField read GetfAciklama4;
    property fAciklama5:TField read GetfAciklama5;
    property fBasTarih:TField read GetfBasTarih;
    property fBilesenFireOran:TField read GetfBilesenFireOran;
    property fBitTarih:TField read GetfBitTarih;
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
    property fDepoKod:TField read GetfDepoKod;
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fHammaddeBirim:TField read GetfHammaddeBirim;
    property fHammaddeKod:TField read GetfHammaddeKod;
    property fHammaddeKullanimSekli:TField read GetfHammaddeKullanimSekli;
    property fHammaddeSurumNo:TField read GetfHammaddeSurumNo;
    property fHammaddeVersiyonNo:TField read GetfHammaddeVersiyonNo;
    property fID:TField read GetfID;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakIslemNo:TField read GetfKaynakIslemNo;
    property fKodBakim:TField read GetfKodBakim;
    property fKodDizayn:TField read GetfKodDizayn;
    property fKodMaliyet:TField read GetfKodMaliyet;
    property fKodSatis:TField read GetfKodSatis;
    property fKodUretim:TField read GetfKodUretim;
    property fKodYedekParca:TField read GetfKodYedekParca;
    property fLKod1:TField read GetfLKod1;
    property fLKod2:TField read GetfLKod2;
    property fLKod3:TField read GetfLKod3;
    property fLKod4:TField read GetfLKod4;
    property fLKod5:TField read GetfLKod5;
    property fMamulBirim:TField read GetfMamulBirim;
    property fMamulHammaddeDepoKod:TField read GetfMamulHammaddeDepoKod;
    property fMamulKullanimSekli:TField read GetfMamulKullanimSekli;
    property fMamulDepoKod:TField read GetfMamulDepoKod;
    property fMamulMalKod:TField read GetfMamulMalKod;
    property fMamulStokBirimKatsayi:TField read GetfMamulStokBirimKatsayi;
    property fMamulStokKartBirim:TField read GetfMamulStokKartBirim;
    property fMamulStokKartMontajFireOran:TField read GetfMamulStokKartMontajFireOran;
    property fMamulStokKartYuvarlama:TField read GetfMamulStokKartYuvarlama;
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
    property fNKod6:TField read GetfNKod6;
    property fNKod7:TField read GetfNKod7;
    property fNKod8:TField read GetfNKod8;
    property fNKod9:TField read GetfNKod9;
    property fOperasyonFireKullan:TField read GetfOperasyonFireKullan;
    property fOperasyonFireMiktar:TField read GetfOperasyonFireMiktar;
    property fOperasyonFireOran:TField read GetfOperasyonFireOran;
    property fOperasyonNo:TField read GetfOperasyonNo;
    property fPozNo:TField read GetfPozNo;
    property fReceteNo:TField read GetfReceteNo;
    property fRevizyonNo:TField read GetfRevizyonNo;
    property fRowGuid:TField read GetfRowGuid;
    property fSiraNo:TField read GetfSiraNo;
    property fSirketNo:TField read GetfSirketNo;
    property fSKod1:TField read GetfSKod1;
    property fSKod2:TField read GetfSKod2;
    property fSKod3:TField read GetfSKod3;
    property fSKod4:TField read GetfSKod4;
    property fSKod5:TField read GetfSKod5;
    property fHammaddeStokBirimKatsayi:TField read GetfHammaddeStokBirimKatsayi;
    property fKullanilabilir:TField read GetfKullanilabilir;
    property fStokCikis:TField read GetfStokCikis;
    property fStokGiris:TField read GetfStokGiris;
    property fStokMiktar:TField read GetfStokMiktar;
    property fHammaddeStokKartBilesenFireOran:TField read GetfHammaddeStokKartBilesenFireOran;
    property fHammaddeStokKartBirim:TField read GetfHammaddeStokKartBirim;
    property fHammaddeStokKartDovizCins:TField read GetfHammaddeStokKartDovizCins;
    property fHammaddeStokKartMaliyetGrupNo:TField read GetfHammaddeStokKartMaliyetGrupNo;
    property fHammaddeAd:TField read GetfHammaddeAd;
    property fMaliyet1:TField read GetfMaliyet1;
    property fMaliyet2:TField read GetfMaliyet2;
    property fMaliyet3:TField read GetfMaliyet3;
    property fHammaddeStokKartMRPTip:TField read GetfHammaddeStokKartMRPTip;
    property fHammaddeStokKartTeminTip:TField read GetfHammaddeStokKartTeminTip;
    property fHammaddeStokKartTeminYontem:TField read GetfHammaddeStokKartTeminYontem;
    property fHammaddeStokKartYuvarlama:TField read GetfHammaddeStokKartYuvarlama;
    property fSurumNo:TField read GetfSurumNo;
    property fVersiyonNo:TField read GetfVersiyonNo;
    property fYanUrunMaliyetOran:TField read GetfYanUrunMaliyetOran;
    property fYanUrunMaliyetTip:TField read GetfYanUrunMaliyetTip;
    property fYanUrunMiktar:TField read GetfYanUrunMiktar;
    property fYanUrunNo:TField read GetfYanUrunNo;
  end;

  TTableMamulKullanimGrup = class(TAppTable)
  Private
    FfGrupNo: TField;
    FfID: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKullanimKod: TField;
    FfRowGuid: TField;
    FfSiraNo: TField;
    FfSirketNo: TField;
    function GetGrupNo: Integer;
    function GetID: Integer;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKullanimKod: String;
    function GetRowGuid: String;
    function GetSiraNo: Integer;
    function GetSirketNo: String;
    function GetfGrupNo: TField;
    function GetfID: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKullanimKod: TField;
    function GetfRowGuid: TField;
    function GetfSiraNo: TField;
    function GetfSirketNo: TField;
    procedure SetGrupNo(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKullanimKod(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSirketNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property GrupNo: Integer read GetGrupNo write SetGrupNo;
    property ID: Integer read GetID write SetID;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KullanimKod: String read GetKullanimKod write SetKullanimKod;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property fGrupNo:TField read GetfGrupNo;
    property fID:TField read GetfID;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKullanimKod:TField read GetfKullanimKod;
    property fRowGuid:TField read GetfRowGuid;
    property fSiraNo:TField read GetfSiraNo;
    property fSirketNo:TField read GetfSirketNo;
  end;

  TTableMamulKullanimKart = class(TAppTable)
  Private
    FfAciklama: TField;
    FfID: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKodBakim: TField;
    FfKodDizayn: TField;
    FfKodMaliyet: TField;
    FfKodSatis: TField;
    FfKodUretim: TField;
    FfKodYedekParca: TField;
    FfKullanimKod: TField;
    FfRowGuid: TField;
    FfSirketNo: TField;
    function GetAciklama: String;
    function GetID: Integer;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKodBakim: Integer;
    function GetKodDizayn: Integer;
    function GetKodMaliyet: Integer;
    function GetKodSatis: Integer;
    function GetKodUretim: Integer;
    function GetKodYedekParca: Integer;
    function GetKullanimKod: String;
    function GetRowGuid: String;
    function GetSirketNo: String;
    function GetfAciklama: TField;
    function GetfID: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKodBakim: TField;
    function GetfKodDizayn: TField;
    function GetfKodMaliyet: TField;
    function GetfKodSatis: TField;
    function GetfKodUretim: TField;
    function GetfKodYedekParca: TField;
    function GetfKullanimKod: TField;
    function GetfRowGuid: TField;
    function GetfSirketNo: TField;
    procedure SetAciklama(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKodBakim(const Value: Integer);
    procedure SetKodDizayn(const Value: Integer);
    procedure SetKodMaliyet(const Value: Integer);
    procedure SetKodSatis(const Value: Integer);
    procedure SetKodUretim(const Value: Integer);
    procedure SetKodYedekParca(const Value: Integer);
    procedure SetKullanimKod(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSirketNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property ID: Integer read GetID write SetID;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KodBakim: Integer read GetKodBakim write SetKodBakim;
    property KodDizayn: Integer read GetKodDizayn write SetKodDizayn;
    property KodMaliyet: Integer read GetKodMaliyet write SetKodMaliyet;
    property KodSatis: Integer read GetKodSatis write SetKodSatis;
    property KodUretim: Integer read GetKodUretim write SetKodUretim;
    property KodYedekParca: Integer read GetKodYedekParca write SetKodYedekParca;
    property KullanimKod: String read GetKullanimKod write SetKullanimKod;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property fAciklama:TField read GetfAciklama;
    property fID:TField read GetfID;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKodBakim:TField read GetfKodBakim;
    property fKodDizayn:TField read GetfKodDizayn;
    property fKodMaliyet:TField read GetfKodMaliyet;
    property fKodSatis:TField read GetfKodSatis;
    property fKodUretim:TField read GetfKodUretim;
    property fKodYedekParca:TField read GetfKodYedekParca;
    property fKullanimKod:TField read GetfKullanimKod;
    property fRowGuid:TField read GetfRowGuid;
    property fSirketNo:TField read GetfSirketNo;
  end;

  TTableMamulRotaKaynak = class(TAppTable)
  Private
    FfCalcCalismaSure: TField;
    FfCalcToplamSure: TField;
    FfDegistirenKaynak: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
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
    FfKullanimSiraNo: TField;
    FfKullanimTip: TField;
    FfKurulumKod1: TField;
    FfKurulumKod2: TField;
    FfKurulumKod3: TField;
    FfKurulumKod4: TField;
    FfKurulumKod5: TField;
    FfSokumKod1: TField;
    FfSokumKod2: TField;
    FfMamulKod: TField;
    FfOperasyonNo: TField;
    FfReceteNo: TField;
    FfRevizyonNo: TField;
    FfRowGuid: TField;
    FfSirketNo: TField;
    FfSurumNo: TField;
    FfKaynakCalismaSure: TField;
    FfKaynakAd: TField;
    FfKaynakKurulumSure: TField;
    FfKaynakSokumSure: TField;
    FfVersiyonNo: TField;
    function GetCalcCalismaSure: Double;
    function GetCalcToplamSure: Double;
    function GetDegistirenKaynak: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
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
    function GetKullanimSiraNo: Integer;
    function GetKullanimTip: Integer;
    function GetKurulumKod1: String;
    function GetKurulumKod2: String;
    function GetKurulumKod3: String;
    function GetKurulumKod4: String;
    function GetKurulumKod5: String;
    function GetSokumKod1: String;
    function GetSokumKod2: String;
    function GetMamulKod: String;
    function GetOperasyonNo: Integer;
    function GetReceteNo: String;
    function GetRevizyonNo: String;
    function GetRowGuid: String;
    function GetSirketNo: String;
    function GetSurumNo: Integer;
    function GetKaynakCalismaSure: Double;
    function GetKaynakAd: String;
    function GetKaynakKurulumSure: Double;
    function GetKaynakSokumSure: Double;
    function GetVersiyonNo: String;
    function GetfCalcCalismaSure: TField;
    function GetfCalcToplamSure: TField;
    function GetfDegistirenKaynak: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
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
    function GetfKullanimSiraNo: TField;
    function GetfKullanimTip: TField;
    function GetfKurulumKod1: TField;
    function GetfKurulumKod2: TField;
    function GetfKurulumKod3: TField;
    function GetfKurulumKod4: TField;
    function GetfKurulumKod5: TField;
    function GetfSokumKod1: TField;
    function GetfSokumKod2: TField;
    function GetfMamulKod: TField;
    function GetfOperasyonNo: TField;
    function GetfReceteNo: TField;
    function GetfRevizyonNo: TField;
    function GetfRowGuid: TField;
    function GetfSirketNo: TField;
    function GetfSurumNo: TField;
    function GetfKaynakCalismaSure: TField;
    function GetfKaynakAd: TField;
    function GetfKaynakKurulumSure: TField;
    function GetfKaynakSokumSure: TField;
    function GetfVersiyonNo: TField;
    procedure SetCalcCalismaSure(const Value: Double);
    procedure SetCalcToplamSure(const Value: Double);
    procedure SetDegistirenKaynak(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
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
    procedure SetKullanimSiraNo(const Value: Integer);
    procedure SetKullanimTip(const Value: Integer);
    procedure SetKurulumKod1(const Value: String);
    procedure SetKurulumKod2(const Value: String);
    procedure SetKurulumKod3(const Value: String);
    procedure SetKurulumKod4(const Value: String);
    procedure SetKurulumKod5(const Value: String);
    procedure SetSokumKod1(const Value: String);
    procedure SetSokumKod2(const Value: String);
    procedure SetMamulKod(const Value: String);
    procedure SetOperasyonNo(const Value: Integer);
    procedure SetReceteNo(const Value: String);
    procedure SetRevizyonNo(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSirketNo(const Value: String);
    procedure SetSurumNo(const Value: Integer);
    procedure SetKaynakCalismaSure(const Value: Double);
    procedure SetKaynakAd(const Value: String);
    procedure SetKaynakKurulumSure(const Value: Double);
    procedure SetKaynakSokumSure(const Value: Double);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property CalcCalismaSure: Double read GetCalcCalismaSure write SetCalcCalismaSure;
    property CalcToplamSure: Double read GetCalcToplamSure write SetCalcToplamSure;
    property DegistirenKaynak: String read GetDegistirenKaynak write SetDegistirenKaynak;
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property DegistirenSurum: String read GetDegistirenSurum write SetDegistirenSurum;
    property DegistirenTarih: TDate read GetDegistirenTarih write SetDegistirenTarih;
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
    property KullanimSiraNo: Integer read GetKullanimSiraNo write SetKullanimSiraNo;
    property KullanimTip: Integer read GetKullanimTip write SetKullanimTip;
    property KurulumKod1: String read GetKurulumKod1 write SetKurulumKod1;
    property KurulumKod2: String read GetKurulumKod2 write SetKurulumKod2;
    property KurulumKod3: String read GetKurulumKod3 write SetKurulumKod3;
    property KurulumKod4: String read GetKurulumKod4 write SetKurulumKod4;
    property KurulumKod5: String read GetKurulumKod5 write SetKurulumKod5;
    property SokumKod1: String read GetSokumKod1 write SetSokumKod1;
    property SokumKod2: String read GetSokumKod2 write SetSokumKod2;
    property MamulKod: String read GetMamulKod write SetMamulKod;
    property OperasyonNo: Integer read GetOperasyonNo write SetOperasyonNo;
    property ReceteNo: String read GetReceteNo write SetReceteNo;
    property RevizyonNo: String read GetRevizyonNo write SetRevizyonNo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property SurumNo: Integer read GetSurumNo write SetSurumNo;
    property KaynakCalismaSure: Double read GetKaynakCalismaSure write SetKaynakCalismaSure;
    property KaynakAd: String read GetKaynakAd write SetKaynakAd;
    property KaynakKurulumSure: Double read GetKaynakKurulumSure write SetKaynakKurulumSure;
    property KaynakSokumSure: Double read GetKaynakSokumSure write SetKaynakSokumSure;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fCalcCalismaSure:TField read GetfCalcCalismaSure;
    property fCalcToplamSure:TField read GetfCalcToplamSure;
    property fDegistirenKaynak:TField read GetfDegistirenKaynak;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
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
    property fKullanimSiraNo:TField read GetfKullanimSiraNo;
    property fKullanimTip:TField read GetfKullanimTip;
    property fKurulumKod1:TField read GetfKurulumKod1;
    property fKurulumKod2:TField read GetfKurulumKod2;
    property fKurulumKod3:TField read GetfKurulumKod3;
    property fKurulumKod4:TField read GetfKurulumKod4;
    property fKurulumKod5:TField read GetfKurulumKod5;
    property fSokumKod1:TField read GetfSokumKod1;
    property fSokumKod2:TField read GetfSokumKod2;
    property fMamulKod:TField read GetfMamulKod;
    property fOperasyonNo:TField read GetfOperasyonNo;
    property fReceteNo:TField read GetfReceteNo;
    property fRevizyonNo:TField read GetfRevizyonNo;
    property fRowGuid:TField read GetfRowGuid;
    property fSirketNo:TField read GetfSirketNo;
    property fSurumNo:TField read GetfSurumNo;
    property fKaynakCalismaSure:TField read GetfKaynakCalismaSure;
    property fKaynakAd:TField read GetfKaynakAd;
    property fKaynakKurulumSure:TField read GetfKaynakKurulumSure;
    property fKaynakSokumSure:TField read GetfKaynakSokumSure;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableMamulRevizyon = class(TAppTable)
  Private
    FfBasTarih: TField;
    FfBitTarih: TField;
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
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfID: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfLKod1: TField;
    FfLKod2: TField;
    FfLKod3: TField;
    FfLKod4: TField;
    FfLKod5: TField;
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
    FfReceteNo: TField;
    FfRevizyonNo: TField;
    FfRowGuid: TField;
    FfSirketNo: TField;
    FfSKod1: TField;
    FfSKod2: TField;
    FfSKod3: TField;
    FfSKod4: TField;
    FfSKod5: TField;
    FfTarih1: TField;
    FfTarih2: TField;
    FfTarih3: TField;
    FfTarih4: TField;
    FfTarih5: TField;
    function GetBasTarih: TDate;
    function GetBitTarih: TDate;
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
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetID: Integer;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetLKod1: String;
    function GetLKod2: String;
    function GetLKod3: String;
    function GetLKod4: String;
    function GetLKod5: String;
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
    function GetReceteNo: String;
    function GetRevizyonNo: String;
    function GetRowGuid: String;
    function GetSirketNo: String;
    function GetSKod1: String;
    function GetSKod2: String;
    function GetSKod3: String;
    function GetSKod4: String;
    function GetSKod5: String;
    function GetTarih1: TDate;
    function GetTarih2: TDate;
    function GetTarih3: TDate;
    function GetTarih4: TDate;
    function GetTarih5: TDate;
    function GetfBasTarih: TField;
    function GetfBitTarih: TField;
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
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfID: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfLKod1: TField;
    function GetfLKod2: TField;
    function GetfLKod3: TField;
    function GetfLKod4: TField;
    function GetfLKod5: TField;
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
    function GetfReceteNo: TField;
    function GetfRevizyonNo: TField;
    function GetfRowGuid: TField;
    function GetfSirketNo: TField;
    function GetfSKod1: TField;
    function GetfSKod2: TField;
    function GetfSKod3: TField;
    function GetfSKod4: TField;
    function GetfSKod5: TField;
    function GetfTarih1: TField;
    function GetfTarih2: TField;
    function GetfTarih3: TField;
    function GetfTarih4: TField;
    function GetfTarih5: TField;
    procedure SetBasTarih(const Value: TDate);
    procedure SetBitTarih(const Value: TDate);
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
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetLKod1(const Value: String);
    procedure SetLKod2(const Value: String);
    procedure SetLKod3(const Value: String);
    procedure SetLKod4(const Value: String);
    procedure SetLKod5(const Value: String);
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
    procedure SetReceteNo(const Value: String);
    procedure SetRevizyonNo(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSirketNo(const Value: String);
    procedure SetSKod1(const Value: String);
    procedure SetSKod2(const Value: String);
    procedure SetSKod3(const Value: String);
    procedure SetSKod4(const Value: String);
    procedure SetSKod5(const Value: String);
    procedure SetTarih1(const Value: TDate);
    procedure SetTarih2(const Value: TDate);
    procedure SetTarih3(const Value: TDate);
    procedure SetTarih4(const Value: TDate);
    procedure SetTarih5(const Value: TDate);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property BasTarih: TDate read GetBasTarih write SetBasTarih;
    property BitTarih: TDate read GetBitTarih write SetBitTarih;
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
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property ID: Integer read GetID write SetID;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property LKod1: String read GetLKod1 write SetLKod1;
    property LKod2: String read GetLKod2 write SetLKod2;
    property LKod3: String read GetLKod3 write SetLKod3;
    property LKod4: String read GetLKod4 write SetLKod4;
    property LKod5: String read GetLKod5 write SetLKod5;
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
    property ReceteNo: String read GetReceteNo write SetReceteNo;
    property RevizyonNo: String read GetRevizyonNo write SetRevizyonNo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property SKod1: String read GetSKod1 write SetSKod1;
    property SKod2: String read GetSKod2 write SetSKod2;
    property SKod3: String read GetSKod3 write SetSKod3;
    property SKod4: String read GetSKod4 write SetSKod4;
    property SKod5: String read GetSKod5 write SetSKod5;
    property Tarih1: TDate read GetTarih1 write SetTarih1;
    property Tarih2: TDate read GetTarih2 write SetTarih2;
    property Tarih3: TDate read GetTarih3 write SetTarih3;
    property Tarih4: TDate read GetTarih4 write SetTarih4;
    property Tarih5: TDate read GetTarih5 write SetTarih5;
    property fBasTarih:TField read GetfBasTarih;
    property fBitTarih:TField read GetfBitTarih;
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
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fID:TField read GetfID;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fLKod1:TField read GetfLKod1;
    property fLKod2:TField read GetfLKod2;
    property fLKod3:TField read GetfLKod3;
    property fLKod4:TField read GetfLKod4;
    property fLKod5:TField read GetfLKod5;
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
    property fReceteNo:TField read GetfReceteNo;
    property fRevizyonNo:TField read GetfRevizyonNo;
    property fRowGuid:TField read GetfRowGuid;
    property fSirketNo:TField read GetfSirketNo;
    property fSKod1:TField read GetfSKod1;
    property fSKod2:TField read GetfSKod2;
    property fSKod3:TField read GetfSKod3;
    property fSKod4:TField read GetfSKod4;
    property fSKod5:TField read GetfSKod5;
    property fTarih1:TField read GetfTarih1;
    property fTarih2:TField read GetfTarih2;
    property fTarih3:TField read GetfTarih3;
    property fTarih4:TField read GetfTarih4;
    property fTarih5:TField read GetfTarih5;
  end;

  TTableMamulRotaSonrakiOperasyon = class(TAppTable)
  Private
    FfID: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfMamulKod: TField;
    FfOperasyonNo: TField;
    FfReceteNo: TField;
    FfRevizyonNo: TField;
    FfRowGuid: TField;
    FfSirketNo: TField;
    FfSonrakiOperasyonNo: TField;
    FfSurumNo: TField;
    FfVersiyonNo: TField;
    function GetID: Integer;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetMamulKod: String;
    function GetOperasyonNo: Integer;
    function GetReceteNo: String;
    function GetRevizyonNo: String;
    function GetRowGuid: String;
    function GetSirketNo: String;
    function GetSonrakiOperasyonNo: Integer;
    function GetSurumNo: Integer;
    function GetVersiyonNo: String;
    function GetfID: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfMamulKod: TField;
    function GetfOperasyonNo: TField;
    function GetfReceteNo: TField;
    function GetfRevizyonNo: TField;
    function GetfRowGuid: TField;
    function GetfSirketNo: TField;
    function GetfSonrakiOperasyonNo: TField;
    function GetfSurumNo: TField;
    function GetfVersiyonNo: TField;
    procedure SetID(const Value: Integer);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetMamulKod(const Value: String);
    procedure SetOperasyonNo(const Value: Integer);
    procedure SetReceteNo(const Value: String);
    procedure SetRevizyonNo(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSirketNo(const Value: String);
    procedure SetSonrakiOperasyonNo(const Value: Integer);
    procedure SetSurumNo(const Value: Integer);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ID: Integer read GetID write SetID;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property MamulKod: String read GetMamulKod write SetMamulKod;
    property OperasyonNo: Integer read GetOperasyonNo write SetOperasyonNo;
    property ReceteNo: String read GetReceteNo write SetReceteNo;
    property RevizyonNo: String read GetRevizyonNo write SetRevizyonNo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property SonrakiOperasyonNo: Integer read GetSonrakiOperasyonNo write SetSonrakiOperasyonNo;
    property SurumNo: Integer read GetSurumNo write SetSurumNo;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fID:TField read GetfID;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fMamulKod:TField read GetfMamulKod;
    property fOperasyonNo:TField read GetfOperasyonNo;
    property fReceteNo:TField read GetfReceteNo;
    property fRevizyonNo:TField read GetfRevizyonNo;
    property fRowGuid:TField read GetfRowGuid;
    property fSirketNo:TField read GetfSirketNo;
    property fSonrakiOperasyonNo:TField read GetfSonrakiOperasyonNo;
    property fSurumNo:TField read GetfSurumNo;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableMamulRota = class(TAppTable)
  Private
    FfAciklama: TField;
    FfDegistirenKaynak: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfID: TField;
    FfIsMerkezKod: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKaynakKullanimTip: TField;
    FfMamulKod: TField;
    FfOperasyonNo: TField;
    FfReceteNo: TField;
    FfRevizyonNo: TField;
    FfRowGuid: TField;
    FfSirketNo: TField;
    FfSurumNo: TField;
    FfIsMerkezAd: TField;
    FfMaliyet1: TField;
    FfMaliyet2: TField;
    FfMaliyet3: TField;
    FfVersiyonNo: TField;
    function GetAciklama: String;
    function GetDegistirenKaynak: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetID: Integer;
    function GetIsMerkezKod: String;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKaynakKullanimTip: Integer;
    function GetMamulKod: String;
    function GetOperasyonNo: Integer;
    function GetReceteNo: String;
    function GetRevizyonNo: String;
    function GetRowGuid: String;
    function GetSirketNo: String;
    function GetSurumNo: Integer;
    function GetIsMerkezAd: String;
    function GetMaliyet1: Double;
    function GetMaliyet2: Double;
    function GetMaliyet3: Double;
    function GetVersiyonNo: String;
    function GetfAciklama: TField;
    function GetfDegistirenKaynak: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfID: TField;
    function GetfIsMerkezKod: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKaynakKullanimTip: TField;
    function GetfMamulKod: TField;
    function GetfOperasyonNo: TField;
    function GetfReceteNo: TField;
    function GetfRevizyonNo: TField;
    function GetfRowGuid: TField;
    function GetfSirketNo: TField;
    function GetfSurumNo: TField;
    function GetfIsMerkezAd: TField;
    function GetfMaliyet1: TField;
    function GetfMaliyet2: TField;
    function GetfMaliyet3: TField;
    function GetfVersiyonNo: TField;
    procedure SetAciklama(const Value: String);
    procedure SetDegistirenKaynak(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetIsMerkezKod(const Value: String);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakKullanimTip(const Value: Integer);
    procedure SetMamulKod(const Value: String);
    procedure SetOperasyonNo(const Value: Integer);
    procedure SetReceteNo(const Value: String);
    procedure SetRevizyonNo(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSirketNo(const Value: String);
    procedure SetSurumNo(const Value: Integer);
    procedure SetIsMerkezAd(const Value: String);
    procedure SetMaliyet1(const Value: Double);
    procedure SetMaliyet2(const Value: Double);
    procedure SetMaliyet3(const Value: Double);
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
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property ID: Integer read GetID write SetID;
    property IsMerkezKod: String read GetIsMerkezKod write SetIsMerkezKod;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakKullanimTip: Integer read GetKaynakKullanimTip write SetKaynakKullanimTip;
    property MamulKod: String read GetMamulKod write SetMamulKod;
    property OperasyonNo: Integer read GetOperasyonNo write SetOperasyonNo;
    property ReceteNo: String read GetReceteNo write SetReceteNo;
    property RevizyonNo: String read GetRevizyonNo write SetRevizyonNo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property SurumNo: Integer read GetSurumNo write SetSurumNo;
    property IsMerkezAd: String read GetIsMerkezAd write SetIsMerkezAd;
    property Maliyet1: Double read GetMaliyet1 write SetMaliyet1;
    property Maliyet2: Double read GetMaliyet2 write SetMaliyet2;
    property Maliyet3: Double read GetMaliyet3 write SetMaliyet3;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fAciklama:TField read GetfAciklama;
    property fDegistirenKaynak:TField read GetfDegistirenKaynak;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fID:TField read GetfID;
    property fIsMerkezKod:TField read GetfIsMerkezKod;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakKullanimTip:TField read GetfKaynakKullanimTip;
    property fMamulKod:TField read GetfMamulKod;
    property fOperasyonNo:TField read GetfOperasyonNo;
    property fReceteNo:TField read GetfReceteNo;
    property fRevizyonNo:TField read GetfRevizyonNo;
    property fRowGuid:TField read GetfRowGuid;
    property fSirketNo:TField read GetfSirketNo;
    property fSurumNo:TField read GetfSurumNo;
    property fIsMerkezAd:TField read GetfIsMerkezAd;
    property fMaliyet1:TField read GetfMaliyet1;
    property fMaliyet2:TField read GetfMaliyet2;
    property fMaliyet3:TField read GetfMaliyet3;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableMamulYanUrun = class(TAppTable)
  Private
    FfMaliyet: TField;
    FfMaliyetGrup1: TField;
    FfMaliyetGrup2: TField;
    FfMaliyetGrup3: TField;
    FfMaliyetGrup4: TField;
    FfMaliyetGrupDiger: TField;
    FfYerelMaliyet: TField;
    FfYerelMaliyet1: TField;
    FfYerelMaliyet2: TField;
    FfYerelMaliyet3: TField;
    FfYerelMaliyetGrup1: TField;
    FfYerelMaliyetGrup2: TField;
    FfYerelMaliyetGrup3: TField;
    FfYerelMaliyetGrup4: TField;
    FfYerelMaliyetGrupDiger: TField;
    FfAciklama1: TField;
    FfAciklama2: TField;
    FfAciklama3: TField;
    FfAciklama4: TField;
    FfAciklama5: TField;
    FfBasTarih: TField;
    FfBirim: TField;
    FfBitTarih: TField;
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
    FfDepoKod: TField;
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfID: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfLKod1: TField;
    FfLKod2: TField;
    FfLKod3: TField;
    FfLKod4: TField;
    FfLKod5: TField;
    FfMaliyetOran: TField;
    FfMaliyetTip: TField;
    FfMalKod: TField;
    FfMamulBirim: TField;
    FfMamulDepoKod: TField;
    FfMamulMalKod: TField;
    FfMamulVersiyonNo: TField;
    FfMamulStokBirimKatSayi: TField;
    FfMamulStokKartBirim: TField;
    FfMamulStokKartMontajFireOran: TField;
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
    FfNKod6: TField;
    FfNKod7: TField;
    FfNKod8: TField;
    FfNKod9: TField;
    FfOperasyonNo: TField;
    FfReceteNo: TField;
    FfRevizyonNo: TField;
    FfRowGuid: TField;
    FfSirketNo: TField;
    FfSKod1: TField;
    FfSKod2: TField;
    FfSKod3: TField;
    FfSKod4: TField;
    FfSKod5: TField;
    FfHammaddeStokBirimKatsayi: TField;
    FfHammaddeStokKartBilesenFireOran: TField;
    FfHammaddeStokKartBirim: TField;
    FfHammaddeStokKartMaliyetGrupNo: TField;
    FfHammaddeStokKartMRPTip: TField;
    FfHammaddeStokKartTeminTip: TField;
    FfHammaddeStokKartTeminYontem: TField;
    FfHammaddeStokKartYuvarlama: TField;
    FfVersiyonNo: TField;
    FfYanUrunNo: TField;
    function GetMaliyet: Double;
    function GetMaliyetGrup1: Double;
    function GetMaliyetGrup2: Double;
    function GetMaliyetGrup3: Double;
    function GetMaliyetGrup4: Double;
    function GetMaliyetGrupDiger: Double;
    function GetYerelMaliyet: Double;
    function GetYerelMaliyet1: Double;
    function GetYerelMaliyet2: Double;
    function GetYerelMaliyet3: Double;
    function GetYerelMaliyetGrup1: Double;
    function GetYerelMaliyetGrup2: Double;
    function GetYerelMaliyetGrup3: Double;
    function GetYerelMaliyetGrup4: Double;
    function GetYerelMaliyetGrupDiger: Double;
    function GetAciklama1: String;
    function GetAciklama2: String;
    function GetAciklama3: String;
    function GetAciklama4: String;
    function GetAciklama5: String;
    function GetBasTarih: TDate;
    function GetBirim: String;
    function GetBitTarih: TDate;
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
    function GetDepoKod: String;
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetID: Integer;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetLKod1: String;
    function GetLKod2: String;
    function GetLKod3: String;
    function GetLKod4: String;
    function GetLKod5: String;
    function GetMaliyetOran: Double;
    function GetMaliyetTip: Integer;
    function GetMalKod: String;
    function GetMamulBirim: String;
    function GetMamulDepoKod: String;
    function GetMamulMalKod: String;
    function GetMamulVersiyonNo: String;
    function GetMamulStokBirimKatSayi: Double;
    function GetMamulStokKartBirim: String;
    function GetMamulStokKartMontajFireOran: Double;
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
    function GetNKod6: Double;
    function GetNKod7: Double;
    function GetNKod8: Double;
    function GetNKod9: Double;
    function GetOperasyonNo: Integer;
    function GetReceteNo: String;
    function GetRevizyonNo: String;
    function GetRowGuid: String;
    function GetSirketNo: String;
    function GetSKod1: String;
    function GetSKod2: String;
    function GetSKod3: String;
    function GetSKod4: String;
    function GetSKod5: String;
    function GetHammaddeStokBirimKatsayi: Double;
    function GetHammaddeStokKartBilesenFireOran: Double;
    function GetHammaddeStokKartBirim: String;
    function GetHammaddeStokKartMaliyetGrupNo: Integer;
    function GetHammaddeStokKartMRPTip: Integer;
    function GetHammaddeStokKartTeminTip: Integer;
    function GetHammaddeStokKartTeminYontem: Integer;
    function GetHammaddeStokKartYuvarlama: Integer;
    function GetVersiyonNo: String;
    function GetYanUrunNo: Integer;
    function GetfMaliyet: TField;
    function GetfMaliyetGrup1: TField;
    function GetfMaliyetGrup2: TField;
    function GetfMaliyetGrup3: TField;
    function GetfMaliyetGrup4: TField;
    function GetfMaliyetGrupDiger: TField;
    function GetfYerelMaliyet: TField;
    function GetfYerelMaliyet1: TField;
    function GetfYerelMaliyet2: TField;
    function GetfYerelMaliyet3: TField;
    function GetfYerelMaliyetGrup1: TField;
    function GetfYerelMaliyetGrup2: TField;
    function GetfYerelMaliyetGrup3: TField;
    function GetfYerelMaliyetGrup4: TField;
    function GetfYerelMaliyetGrupDiger: TField;
    function GetfAciklama1: TField;
    function GetfAciklama2: TField;
    function GetfAciklama3: TField;
    function GetfAciklama4: TField;
    function GetfAciklama5: TField;
    function GetfBasTarih: TField;
    function GetfBirim: TField;
    function GetfBitTarih: TField;
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
    function GetfDepoKod: TField;
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfID: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfLKod1: TField;
    function GetfLKod2: TField;
    function GetfLKod3: TField;
    function GetfLKod4: TField;
    function GetfLKod5: TField;
    function GetfMaliyetOran: TField;
    function GetfMaliyetTip: TField;
    function GetfMalKod: TField;
    function GetfMamulBirim: TField;
    function GetfMamulDepoKod: TField;
    function GetfMamulMalKod: TField;
    function GetfMamulVersiyonNo: TField;
    function GetfMamulStokBirimKatSayi: TField;
    function GetfMamulStokKartBirim: TField;
    function GetfMamulStokKartMontajFireOran: TField;
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
    function GetfNKod6: TField;
    function GetfNKod7: TField;
    function GetfNKod8: TField;
    function GetfNKod9: TField;
    function GetfOperasyonNo: TField;
    function GetfReceteNo: TField;
    function GetfRevizyonNo: TField;
    function GetfRowGuid: TField;
    function GetfSirketNo: TField;
    function GetfSKod1: TField;
    function GetfSKod2: TField;
    function GetfSKod3: TField;
    function GetfSKod4: TField;
    function GetfSKod5: TField;
    function GetfHammaddeStokBirimKatsayi: TField;
    function GetfHammaddeStokKartBilesenFireOran: TField;
    function GetfHammaddeStokKartBirim: TField;
    function GetfHammaddeStokKartMaliyetGrupNo: TField;
    function GetfHammaddeStokKartMRPTip: TField;
    function GetfHammaddeStokKartTeminTip: TField;
    function GetfHammaddeStokKartTeminYontem: TField;
    function GetfHammaddeStokKartYuvarlama: TField;
    function GetfVersiyonNo: TField;
    function GetfYanUrunNo: TField;
    procedure SetMaliyet(const Value: Double);
    procedure SetMaliyetGrup1(const Value: Double);
    procedure SetMaliyetGrup2(const Value: Double);
    procedure SetMaliyetGrup3(const Value: Double);
    procedure SetMaliyetGrup4(const Value: Double);
    procedure SetMaliyetGrupDiger(const Value: Double);
    procedure SetYerelMaliyet(const Value: Double);
    procedure SetYerelMaliyet1(const Value: Double);
    procedure SetYerelMaliyet2(const Value: Double);
    procedure SetYerelMaliyet3(const Value: Double);
    procedure SetYerelMaliyetGrup1(const Value: Double);
    procedure SetYerelMaliyetGrup2(const Value: Double);
    procedure SetYerelMaliyetGrup3(const Value: Double);
    procedure SetYerelMaliyetGrup4(const Value: Double);
    procedure SetYerelMaliyetGrupDiger(const Value: Double);
    procedure SetAciklama1(const Value: String);
    procedure SetAciklama2(const Value: String);
    procedure SetAciklama3(const Value: String);
    procedure SetAciklama4(const Value: String);
    procedure SetAciklama5(const Value: String);
    procedure SetBasTarih(const Value: TDate);
    procedure SetBirim(const Value: String);
    procedure SetBitTarih(const Value: TDate);
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
    procedure SetDepoKod(const Value: String);
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetLKod1(const Value: String);
    procedure SetLKod2(const Value: String);
    procedure SetLKod3(const Value: String);
    procedure SetLKod4(const Value: String);
    procedure SetLKod5(const Value: String);
    procedure SetMaliyetOran(const Value: Double);
    procedure SetMaliyetTip(const Value: Integer);
    procedure SetMalKod(const Value: String);
    procedure SetMamulBirim(const Value: String);
    procedure SetMamulDepoKod(const Value: String);
    procedure SetMamulMalKod(const Value: String);
    procedure SetMamulVersiyonNo(const Value: String);
    procedure SetMamulStokBirimKatSayi(const Value: Double);
    procedure SetMamulStokKartBirim(const Value: String);
    procedure SetMamulStokKartMontajFireOran(const Value: Double);
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
    procedure SetNKod6(const Value: Double);
    procedure SetNKod7(const Value: Double);
    procedure SetNKod8(const Value: Double);
    procedure SetNKod9(const Value: Double);
    procedure SetOperasyonNo(const Value: Integer);
    procedure SetReceteNo(const Value: String);
    procedure SetRevizyonNo(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSirketNo(const Value: String);
    procedure SetSKod1(const Value: String);
    procedure SetSKod2(const Value: String);
    procedure SetSKod3(const Value: String);
    procedure SetSKod4(const Value: String);
    procedure SetSKod5(const Value: String);
    procedure SetHammaddeStokBirimKatsayi(const Value: Double);
    procedure SetHammaddeStokKartBilesenFireOran(const Value: Double);
    procedure SetHammaddeStokKartBirim(const Value: String);
    procedure SetHammaddeStokKartMaliyetGrupNo(const Value: Integer);
    procedure SetHammaddeStokKartMRPTip(const Value: Integer);
    procedure SetHammaddeStokKartTeminTip(const Value: Integer);
    procedure SetHammaddeStokKartTeminYontem(const Value: Integer);
    procedure SetHammaddeStokKartYuvarlama(const Value: Integer);
    procedure SetVersiyonNo(const Value: String);
    procedure SetYanUrunNo(const Value: Integer);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Maliyet: Double read GetMaliyet write SetMaliyet;
    property MaliyetGrup1: Double read GetMaliyetGrup1 write SetMaliyetGrup1;
    property MaliyetGrup2: Double read GetMaliyetGrup2 write SetMaliyetGrup2;
    property MaliyetGrup3: Double read GetMaliyetGrup3 write SetMaliyetGrup3;
    property MaliyetGrup4: Double read GetMaliyetGrup4 write SetMaliyetGrup4;
    property MaliyetGrupDiger: Double read GetMaliyetGrupDiger write SetMaliyetGrupDiger;
    property YerelMaliyet: Double read GetYerelMaliyet write SetYerelMaliyet;
    property YerelMaliyet1: Double read GetYerelMaliyet1 write SetYerelMaliyet1;
    property YerelMaliyet2: Double read GetYerelMaliyet2 write SetYerelMaliyet2;
    property YerelMaliyet3: Double read GetYerelMaliyet3 write SetYerelMaliyet3;
    property YerelMaliyetGrup1: Double read GetYerelMaliyetGrup1 write SetYerelMaliyetGrup1;
    property YerelMaliyetGrup2: Double read GetYerelMaliyetGrup2 write SetYerelMaliyetGrup2;
    property YerelMaliyetGrup3: Double read GetYerelMaliyetGrup3 write SetYerelMaliyetGrup3;
    property YerelMaliyetGrup4: Double read GetYerelMaliyetGrup4 write SetYerelMaliyetGrup4;
    property YerelMaliyetGrupDiger: Double read GetYerelMaliyetGrupDiger write SetYerelMaliyetGrupDiger;
    property Aciklama1: String read GetAciklama1 write SetAciklama1;
    property Aciklama2: String read GetAciklama2 write SetAciklama2;
    property Aciklama3: String read GetAciklama3 write SetAciklama3;
    property Aciklama4: String read GetAciklama4 write SetAciklama4;
    property Aciklama5: String read GetAciklama5 write SetAciklama5;
    property BasTarih: TDate read GetBasTarih write SetBasTarih;
    property Birim: String read GetBirim write SetBirim;
    property BitTarih: TDate read GetBitTarih write SetBitTarih;
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
    property DepoKod: String read GetDepoKod write SetDepoKod;
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property ID: Integer read GetID write SetID;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property LKod1: String read GetLKod1 write SetLKod1;
    property LKod2: String read GetLKod2 write SetLKod2;
    property LKod3: String read GetLKod3 write SetLKod3;
    property LKod4: String read GetLKod4 write SetLKod4;
    property LKod5: String read GetLKod5 write SetLKod5;
    property MaliyetOran: Double read GetMaliyetOran write SetMaliyetOran;
    property MaliyetTip: Integer read GetMaliyetTip write SetMaliyetTip;
    property MalKod: String read GetMalKod write SetMalKod;
    property MamulBirim: String read GetMamulBirim write SetMamulBirim;
    property MamulDepoKod: String read GetMamulDepoKod write SetMamulDepoKod;
    property MamulMalKod: String read GetMamulMalKod write SetMamulMalKod;
    property MamulVersiyonNo: String read GetMamulVersiyonNo write SetMamulVersiyonNo;
    property MamulStokBirimKatSayi: Double read GetMamulStokBirimKatSayi write SetMamulStokBirimKatSayi;
    property MamulStokKartBirim: String read GetMamulStokKartBirim write SetMamulStokKartBirim;
    property MamulStokKartMontajFireOran: Double read GetMamulStokKartMontajFireOran write SetMamulStokKartMontajFireOran;
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
    property NKod6: Double read GetNKod6 write SetNKod6;
    property NKod7: Double read GetNKod7 write SetNKod7;
    property NKod8: Double read GetNKod8 write SetNKod8;
    property NKod9: Double read GetNKod9 write SetNKod9;
    property OperasyonNo: Integer read GetOperasyonNo write SetOperasyonNo;
    property ReceteNo: String read GetReceteNo write SetReceteNo;
    property RevizyonNo: String read GetRevizyonNo write SetRevizyonNo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property SKod1: String read GetSKod1 write SetSKod1;
    property SKod2: String read GetSKod2 write SetSKod2;
    property SKod3: String read GetSKod3 write SetSKod3;
    property SKod4: String read GetSKod4 write SetSKod4;
    property SKod5: String read GetSKod5 write SetSKod5;
    property HammaddeStokBirimKatsayi: Double read GetHammaddeStokBirimKatsayi write SetHammaddeStokBirimKatsayi;
    property HammaddeStokKartBilesenFireOran: Double read GetHammaddeStokKartBilesenFireOran write SetHammaddeStokKartBilesenFireOran;
    property HammaddeStokKartBirim: String read GetHammaddeStokKartBirim write SetHammaddeStokKartBirim;
    property HammaddeStokKartMaliyetGrupNo: Integer read GetHammaddeStokKartMaliyetGrupNo write SetHammaddeStokKartMaliyetGrupNo;
    property HammaddeStokKartMRPTip: Integer read GetHammaddeStokKartMRPTip write SetHammaddeStokKartMRPTip;
    property HammaddeStokKartTeminTip: Integer read GetHammaddeStokKartTeminTip write SetHammaddeStokKartTeminTip;
    property HammaddeStokKartTeminYontem: Integer read GetHammaddeStokKartTeminYontem write SetHammaddeStokKartTeminYontem;
    property HammaddeStokKartYuvarlama: Integer read GetHammaddeStokKartYuvarlama write SetHammaddeStokKartYuvarlama;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property YanUrunNo: Integer read GetYanUrunNo write SetYanUrunNo;
    property fMaliyet:TField read GetfMaliyet;
    property fMaliyetGrup1:TField read GetfMaliyetGrup1;
    property fMaliyetGrup2:TField read GetfMaliyetGrup2;
    property fMaliyetGrup3:TField read GetfMaliyetGrup3;
    property fMaliyetGrup4:TField read GetfMaliyetGrup4;
    property fMaliyetGrupDiger:TField read GetfMaliyetGrupDiger;
    property fYerelMaliyet:TField read GetfYerelMaliyet;
    property fYerelMaliyet1:TField read GetfYerelMaliyet1;
    property fYerelMaliyet2:TField read GetfYerelMaliyet2;
    property fYerelMaliyet3:TField read GetfYerelMaliyet3;
    property fYerelMaliyetGrup1:TField read GetfYerelMaliyetGrup1;
    property fYerelMaliyetGrup2:TField read GetfYerelMaliyetGrup2;
    property fYerelMaliyetGrup3:TField read GetfYerelMaliyetGrup3;
    property fYerelMaliyetGrup4:TField read GetfYerelMaliyetGrup4;
    property fYerelMaliyetGrupDiger:TField read GetfYerelMaliyetGrupDiger;
    property fAciklama1:TField read GetfAciklama1;
    property fAciklama2:TField read GetfAciklama2;
    property fAciklama3:TField read GetfAciklama3;
    property fAciklama4:TField read GetfAciklama4;
    property fAciklama5:TField read GetfAciklama5;
    property fBasTarih:TField read GetfBasTarih;
    property fBirim:TField read GetfBirim;
    property fBitTarih:TField read GetfBitTarih;
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
    property fDepoKod:TField read GetfDepoKod;
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fID:TField read GetfID;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fLKod1:TField read GetfLKod1;
    property fLKod2:TField read GetfLKod2;
    property fLKod3:TField read GetfLKod3;
    property fLKod4:TField read GetfLKod4;
    property fLKod5:TField read GetfLKod5;
    property fMaliyetOran:TField read GetfMaliyetOran;
    property fMaliyetTip:TField read GetfMaliyetTip;
    property fMalKod:TField read GetfMalKod;
    property fMamulBirim:TField read GetfMamulBirim;
    property fMamulDepoKod:TField read GetfMamulDepoKod;
    property fMamulMalKod:TField read GetfMamulMalKod;
    property fMamulVersiyonNo:TField read GetfMamulVersiyonNo;
    property fMamulStokBirimKatSayi:TField read GetfMamulStokBirimKatSayi;
    property fMamulStokKartBirim:TField read GetfMamulStokKartBirim;
    property fMamulStokKartMontajFireOran:TField read GetfMamulStokKartMontajFireOran;
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
    property fNKod6:TField read GetfNKod6;
    property fNKod7:TField read GetfNKod7;
    property fNKod8:TField read GetfNKod8;
    property fNKod9:TField read GetfNKod9;
    property fOperasyonNo:TField read GetfOperasyonNo;
    property fReceteNo:TField read GetfReceteNo;
    property fRevizyonNo:TField read GetfRevizyonNo;
    property fRowGuid:TField read GetfRowGuid;
    property fSirketNo:TField read GetfSirketNo;
    property fSKod1:TField read GetfSKod1;
    property fSKod2:TField read GetfSKod2;
    property fSKod3:TField read GetfSKod3;
    property fSKod4:TField read GetfSKod4;
    property fSKod5:TField read GetfSKod5;
    property fHammaddeStokBirimKatsayi:TField read GetfHammaddeStokBirimKatsayi;
    property fHammaddeStokKartBilesenFireOran:TField read GetfHammaddeStokKartBilesenFireOran;
    property fHammaddeStokKartBirim:TField read GetfHammaddeStokKartBirim;
    property fHammaddeStokKartMaliyetGrupNo:TField read GetfHammaddeStokKartMaliyetGrupNo;
    property fHammaddeStokKartMRPTip:TField read GetfHammaddeStokKartMRPTip;
    property fHammaddeStokKartTeminTip:TField read GetfHammaddeStokKartTeminTip;
    property fHammaddeStokKartTeminYontem:TField read GetfHammaddeStokKartTeminYontem;
    property fHammaddeStokKartYuvarlama:TField read GetfHammaddeStokKartYuvarlama;
    property fVersiyonNo:TField read GetfVersiyonNo;
    property fYanUrunNo:TField read GetfYanUrunNo;
  end;

  TTableIsMerkezKaynak = class(TAppTable)
  Private
    FfKapasite: TField;
    FfKullanilan: TField;
    FfID: TField;
    FfIsMerkezKod: TField;
    FfKaynakKod: TField;
    FfKullanimSiraNo: TField;
    FfBeklemeSure: TField;
    FfCalismaSure: TField;
    FfKurulumSure: TField;
    FfKurulumSure1: TField;
    FfKurulumSure2: TField;
    FfKurulumSure3: TField;
    FfKurulumSure4: TField;
    FfKurulumSure5: TField;
    FfKuyrukSure: TField;
    FfOnUretimMiktar: TField;
    FfSokumSure: TField;
    FfSokumSure1: TField;
    FfSokumSure2: TField;
    FfTasimaSure: TField;
    function GetKapasite: Double;
    function GetKullanilan: Double;
    function GetID: Integer;
    function GetIsMerkezKod: String;
    function GetKaynakKod: String;
    function GetKullanimSiraNo: Integer;
    function GetBeklemeSure: Double;
    function GetCalismaSure: Double;
    function GetKurulumSure: Double;
    function GetKurulumSure1: Double;
    function GetKurulumSure2: Double;
    function GetKurulumSure3: Double;
    function GetKurulumSure4: Double;
    function GetKurulumSure5: Double;
    function GetKuyrukSure: Double;
    function GetOnUretimMiktar: Double;
    function GetSokumSure: Double;
    function GetSokumSure1: Double;
    function GetSokumSure2: Double;
    function GetTasimaSure: Double;
    function GetfKapasite: TField;
    function GetfKullanilan: TField;
    function GetfID: TField;
    function GetfIsMerkezKod: TField;
    function GetfKaynakKod: TField;
    function GetfKullanimSiraNo: TField;
    function GetfBeklemeSure: TField;
    function GetfCalismaSure: TField;
    function GetfKurulumSure: TField;
    function GetfKurulumSure1: TField;
    function GetfKurulumSure2: TField;
    function GetfKurulumSure3: TField;
    function GetfKurulumSure4: TField;
    function GetfKurulumSure5: TField;
    function GetfKuyrukSure: TField;
    function GetfOnUretimMiktar: TField;
    function GetfSokumSure: TField;
    function GetfSokumSure1: TField;
    function GetfSokumSure2: TField;
    function GetfTasimaSure: TField;
    procedure SetKapasite(const Value: Double);
    procedure SetKullanilan(const Value: Double);
    procedure SetID(const Value: Integer);
    procedure SetIsMerkezKod(const Value: String);
    procedure SetKaynakKod(const Value: String);
    procedure SetKullanimSiraNo(const Value: Integer);
    procedure SetBeklemeSure(const Value: Double);
    procedure SetCalismaSure(const Value: Double);
    procedure SetKurulumSure(const Value: Double);
    procedure SetKurulumSure1(const Value: Double);
    procedure SetKurulumSure2(const Value: Double);
    procedure SetKurulumSure3(const Value: Double);
    procedure SetKurulumSure4(const Value: Double);
    procedure SetKurulumSure5(const Value: Double);
    procedure SetKuyrukSure(const Value: Double);
    procedure SetOnUretimMiktar(const Value: Double);
    procedure SetSokumSure(const Value: Double);
    procedure SetSokumSure1(const Value: Double);
    procedure SetSokumSure2(const Value: Double);
    procedure SetTasimaSure(const Value: Double);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Kapasite: Double read GetKapasite write SetKapasite;
    property Kullanilan: Double read GetKullanilan write SetKullanilan;
    property ID: Integer read GetID write SetID;
    property IsMerkezKod: String read GetIsMerkezKod write SetIsMerkezKod;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property KullanimSiraNo: Integer read GetKullanimSiraNo write SetKullanimSiraNo;
    property BeklemeSure: Double read GetBeklemeSure write SetBeklemeSure;
    property CalismaSure: Double read GetCalismaSure write SetCalismaSure;
    property KurulumSure: Double read GetKurulumSure write SetKurulumSure;
    property KurulumSure1: Double read GetKurulumSure1 write SetKurulumSure1;
    property KurulumSure2: Double read GetKurulumSure2 write SetKurulumSure2;
    property KurulumSure3: Double read GetKurulumSure3 write SetKurulumSure3;
    property KurulumSure4: Double read GetKurulumSure4 write SetKurulumSure4;
    property KurulumSure5: Double read GetKurulumSure5 write SetKurulumSure5;
    property KuyrukSure: Double read GetKuyrukSure write SetKuyrukSure;
    property OnUretimMiktar: Double read GetOnUretimMiktar write SetOnUretimMiktar;
    property SokumSure: Double read GetSokumSure write SetSokumSure;
    property SokumSure1: Double read GetSokumSure1 write SetSokumSure1;
    property SokumSure2: Double read GetSokumSure2 write SetSokumSure2;
    property TasimaSure: Double read GetTasimaSure write SetTasimaSure;
    property fKapasite:TField read GetfKapasite;
    property fKullanilan:TField read GetfKullanilan;
    property fID:TField read GetfID;
    property fIsMerkezKod:TField read GetfIsMerkezKod;
    property fKaynakKod:TField read GetfKaynakKod;
    property fKullanimSiraNo:TField read GetfKullanimSiraNo;
    property fBeklemeSure:TField read GetfBeklemeSure;
    property fCalismaSure:TField read GetfCalismaSure;
    property fKurulumSure:TField read GetfKurulumSure;
    property fKurulumSure1:TField read GetfKurulumSure1;
    property fKurulumSure2:TField read GetfKurulumSure2;
    property fKurulumSure3:TField read GetfKurulumSure3;
    property fKurulumSure4:TField read GetfKurulumSure4;
    property fKurulumSure5:TField read GetfKurulumSure5;
    property fKuyrukSure:TField read GetfKuyrukSure;
    property fOnUretimMiktar:TField read GetfOnUretimMiktar;
    property fSokumSure:TField read GetfSokumSure;
    property fSokumSure1:TField read GetfSokumSure1;
    property fSokumSure2:TField read GetfSokumSure2;
    property fTasimaSure:TField read GetfTasimaSure;
  end;

  TTableIsMerkezKart = class(TAppTable)
  Private
    FfCalismaSure: TField;
    FfDegistirenKaynak: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfGrupKod: TField;
    FfID: TField;
    FfIsMerkezAd: TField;
    FfIsMerkezKod: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKurulumSure: TField;
    FfMaliyet1: TField;
    FfMaliyet2: TField;
    FfMaliyet3: TField;
    FfSirketNo: TField;
    function GetCalismaSure: Double;
    function GetDegistirenKaynak: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetGrupKod: String;
    function GetID: Integer;
    function GetIsMerkezAd: String;
    function GetIsMerkezKod: String;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKurulumSure: Double;
    function GetMaliyet1: Double;
    function GetMaliyet2: Double;
    function GetMaliyet3: Double;
    function GetSirketNo: String;
    function GetfCalismaSure: TField;
    function GetfDegistirenKaynak: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfGrupKod: TField;
    function GetfID: TField;
    function GetfIsMerkezAd: TField;
    function GetfIsMerkezKod: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKurulumSure: TField;
    function GetfMaliyet1: TField;
    function GetfMaliyet2: TField;
    function GetfMaliyet3: TField;
    function GetfSirketNo: TField;
    procedure SetCalismaSure(const Value: Double);
    procedure SetDegistirenKaynak(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetGrupKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetIsMerkezAd(const Value: String);
    procedure SetIsMerkezKod(const Value: String);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKurulumSure(const Value: Double);
    procedure SetMaliyet1(const Value: Double);
    procedure SetMaliyet2(const Value: Double);
    procedure SetMaliyet3(const Value: Double);
    procedure SetSirketNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property CalismaSure: Double read GetCalismaSure write SetCalismaSure;
    property DegistirenKaynak: String read GetDegistirenKaynak write SetDegistirenKaynak;
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property DegistirenSurum: String read GetDegistirenSurum write SetDegistirenSurum;
    property DegistirenTarih: TDate read GetDegistirenTarih write SetDegistirenTarih;
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property GrupKod: String read GetGrupKod write SetGrupKod;
    property ID: Integer read GetID write SetID;
    property IsMerkezAd: String read GetIsMerkezAd write SetIsMerkezAd;
    property IsMerkezKod: String read GetIsMerkezKod write SetIsMerkezKod;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KurulumSure: Double read GetKurulumSure write SetKurulumSure;
    property Maliyet1: Double read GetMaliyet1 write SetMaliyet1;
    property Maliyet2: Double read GetMaliyet2 write SetMaliyet2;
    property Maliyet3: Double read GetMaliyet3 write SetMaliyet3;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property fCalismaSure:TField read GetfCalismaSure;
    property fDegistirenKaynak:TField read GetfDegistirenKaynak;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fGrupKod:TField read GetfGrupKod;
    property fID:TField read GetfID;
    property fIsMerkezAd:TField read GetfIsMerkezAd;
    property fIsMerkezKod:TField read GetfIsMerkezKod;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKurulumSure:TField read GetfKurulumSure;
    property fMaliyet1:TField read GetfMaliyet1;
    property fMaliyet2:TField read GetfMaliyet2;
    property fMaliyet3:TField read GetfMaliyet3;
    property fSirketNo:TField read GetfSirketNo;
  end;

  TTableUretimKaynakIslemTanim = class(TAppTable)
  Private
    FfAciklama: TField;
    FfID: TField;
    FfIslemNo: TField;
    FfIslemTip: TField;
    FfKaynakKod: TField;
    FfOperatorKod: TField;
    function GetAciklama: String;
    function GetID: Integer;
    function GetIslemNo: Integer;
    function GetIslemTip: Integer;
    function GetKaynakKod: String;
    function GetOperatorKod: String;
    function GetfAciklama: TField;
    function GetfID: TField;
    function GetfIslemNo: TField;
    function GetfIslemTip: TField;
    function GetfKaynakKod: TField;
    function GetfOperatorKod: TField;
    procedure SetAciklama(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetIslemNo(const Value: Integer);
    procedure SetIslemTip(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetOperatorKod(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property ID: Integer read GetID write SetID;
    property IslemNo: Integer read GetIslemNo write SetIslemNo;
    property IslemTip: Integer read GetIslemTip write SetIslemTip;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property OperatorKod: String read GetOperatorKod write SetOperatorKod;
    property fAciklama:TField read GetfAciklama;
    property fID:TField read GetfID;
    property fIslemNo:TField read GetfIslemNo;
    property fIslemTip:TField read GetfIslemTip;
    property fKaynakKod:TField read GetfKaynakKod;
    property fOperatorKod:TField read GetfOperatorKod;
  end;

  TTableUretimKaynakMamulDegisim = class(TAppTable)
  Private
    FfID: TField;
    FfKaynakKod: TField;
    FfKurulumMamulKod: TField;
    FfKurulumSure: TField;
    FfSokumMamulKod: TField;
    FfSokumSure: TField;
    FfToplamSure: TField;
    function GetID: Integer;
    function GetKaynakKod: String;
    function GetKurulumMamulKod: String;
    function GetKurulumSure: Double;
    function GetSokumMamulKod: String;
    function GetSokumSure: Double;
    function GetToplamSure: Double;
    function GetfID: TField;
    function GetfKaynakKod: TField;
    function GetfKurulumMamulKod: TField;
    function GetfKurulumSure: TField;
    function GetfSokumMamulKod: TField;
    function GetfSokumSure: TField;
    function GetfToplamSure: TField;
    procedure SetID(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetKurulumMamulKod(const Value: String);
    procedure SetKurulumSure(const Value: Double);
    procedure SetSokumMamulKod(const Value: String);
    procedure SetSokumSure(const Value: Double);
    procedure SetToplamSure(const Value: Double);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ID: Integer read GetID write SetID;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property KurulumMamulKod: String read GetKurulumMamulKod write SetKurulumMamulKod;
    property KurulumSure: Double read GetKurulumSure write SetKurulumSure;
    property SokumMamulKod: String read GetSokumMamulKod write SetSokumMamulKod;
    property SokumSure: Double read GetSokumSure write SetSokumSure;
    property ToplamSure: Double read GetToplamSure write SetToplamSure;
    property fID:TField read GetfID;
    property fKaynakKod:TField read GetfKaynakKod;
    property fKurulumMamulKod:TField read GetfKurulumMamulKod;
    property fKurulumSure:TField read GetfKurulumSure;
    property fSokumMamulKod:TField read GetfSokumMamulKod;
    property fSokumSure:TField read GetfSokumSure;
    property fToplamSure:TField read GetfToplamSure;
  end;

  TTableUretimKaynakMamulKurulum = class(TAppTable)
  Private
    FfBeklemeSure: TField;
    FfCalismaSure: TField;
    FfID: TField;
    FfKaynakKod: TField;
    FfKurulumSure: TField;
    FfKurulumSure1: TField;
    FfKurulumSure2: TField;
    FfKurulumSure3: TField;
    FfKurulumSure4: TField;
    FfKurulumSure5: TField;
    FfKuyrukSure: TField;
    FfMamulKod: TField;
    FfOptCalismaSure: TField;
    FfRowGuid: TField;
    FfSokumSure: TField;
    FfSokumSure1: TField;
    FfSokumSure2: TField;
    FfTasimaSure: TField;
    function GetBeklemeSure: Double;
    function GetCalismaSure: Double;
    function GetID: Integer;
    function GetKaynakKod: String;
    function GetKurulumSure: Double;
    function GetKurulumSure1: Double;
    function GetKurulumSure2: Double;
    function GetKurulumSure3: Double;
    function GetKurulumSure4: Double;
    function GetKurulumSure5: Double;
    function GetKuyrukSure: Double;
    function GetMamulKod: String;
    function GetOptCalismaSure: Double;
    function GetRowGuid: String;
    function GetSokumSure: Double;
    function GetSokumSure1: Double;
    function GetSokumSure2: Double;
    function GetTasimaSure: Double;
    function GetfBeklemeSure: TField;
    function GetfCalismaSure: TField;
    function GetfID: TField;
    function GetfKaynakKod: TField;
    function GetfKurulumSure: TField;
    function GetfKurulumSure1: TField;
    function GetfKurulumSure2: TField;
    function GetfKurulumSure3: TField;
    function GetfKurulumSure4: TField;
    function GetfKurulumSure5: TField;
    function GetfKuyrukSure: TField;
    function GetfMamulKod: TField;
    function GetfOptCalismaSure: TField;
    function GetfRowGuid: TField;
    function GetfSokumSure: TField;
    function GetfSokumSure1: TField;
    function GetfSokumSure2: TField;
    function GetfTasimaSure: TField;
    procedure SetBeklemeSure(const Value: Double);
    procedure SetCalismaSure(const Value: Double);
    procedure SetID(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetKurulumSure(const Value: Double);
    procedure SetKurulumSure1(const Value: Double);
    procedure SetKurulumSure2(const Value: Double);
    procedure SetKurulumSure3(const Value: Double);
    procedure SetKurulumSure4(const Value: Double);
    procedure SetKurulumSure5(const Value: Double);
    procedure SetKuyrukSure(const Value: Double);
    procedure SetMamulKod(const Value: String);
    procedure SetOptCalismaSure(const Value: Double);
    procedure SetRowGuid(const Value: String);
    procedure SetSokumSure(const Value: Double);
    procedure SetSokumSure1(const Value: Double);
    procedure SetSokumSure2(const Value: Double);
    procedure SetTasimaSure(const Value: Double);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property BeklemeSure: Double read GetBeklemeSure write SetBeklemeSure;
    property CalismaSure: Double read GetCalismaSure write SetCalismaSure;
    property ID: Integer read GetID write SetID;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property KurulumSure: Double read GetKurulumSure write SetKurulumSure;
    property KurulumSure1: Double read GetKurulumSure1 write SetKurulumSure1;
    property KurulumSure2: Double read GetKurulumSure2 write SetKurulumSure2;
    property KurulumSure3: Double read GetKurulumSure3 write SetKurulumSure3;
    property KurulumSure4: Double read GetKurulumSure4 write SetKurulumSure4;
    property KurulumSure5: Double read GetKurulumSure5 write SetKurulumSure5;
    property KuyrukSure: Double read GetKuyrukSure write SetKuyrukSure;
    property MamulKod: String read GetMamulKod write SetMamulKod;
    property OptCalismaSure: Double read GetOptCalismaSure write SetOptCalismaSure;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SokumSure: Double read GetSokumSure write SetSokumSure;
    property SokumSure1: Double read GetSokumSure1 write SetSokumSure1;
    property SokumSure2: Double read GetSokumSure2 write SetSokumSure2;
    property TasimaSure: Double read GetTasimaSure write SetTasimaSure;
    property fBeklemeSure:TField read GetfBeklemeSure;
    property fCalismaSure:TField read GetfCalismaSure;
    property fID:TField read GetfID;
    property fKaynakKod:TField read GetfKaynakKod;
    property fKurulumSure:TField read GetfKurulumSure;
    property fKurulumSure1:TField read GetfKurulumSure1;
    property fKurulumSure2:TField read GetfKurulumSure2;
    property fKurulumSure3:TField read GetfKurulumSure3;
    property fKurulumSure4:TField read GetfKurulumSure4;
    property fKurulumSure5:TField read GetfKurulumSure5;
    property fKuyrukSure:TField read GetfKuyrukSure;
    property fMamulKod:TField read GetfMamulKod;
    property fOptCalismaSure:TField read GetfOptCalismaSure;
    property fRowGuid:TField read GetfRowGuid;
    property fSokumSure:TField read GetfSokumSure;
    property fSokumSure1:TField read GetfSokumSure1;
    property fSokumSure2:TField read GetfSokumSure2;
    property fTasimaSure:TField read GetfTasimaSure;
  end;

  TTableUretimKaynakDevamsizlik = class(TAppTable)
  Private
    FfAciklama: TField;
    FfBasSaat: TField;
    FfBitSaat: TField;
    FfDegistirenKaynak: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
    FfDurusKod: TField;
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfID: TField;
    FfKapasite: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKaynakKod: TField;
    FfSirketNo: TField;
    FfTakvimYil: TField;
    FfTarih: TField;
    function GetAciklama: String;
    function GetBasSaat: TDate;
    function GetBitSaat: TDate;
    function GetDegistirenKaynak: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
    function GetDurusKod: String;
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetID: Integer;
    function GetKapasite: Double;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKaynakKod: String;
    function GetSirketNo: String;
    function GetTakvimYil: Integer;
    function GetTarih: TDate;
    function GetfAciklama: TField;
    function GetfBasSaat: TField;
    function GetfBitSaat: TField;
    function GetfDegistirenKaynak: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
    function GetfDurusKod: TField;
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfID: TField;
    function GetfKapasite: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKaynakKod: TField;
    function GetfSirketNo: TField;
    function GetfTakvimYil: TField;
    function GetfTarih: TField;
    procedure SetAciklama(const Value: String);
    procedure SetBasSaat(const Value: TDate);
    procedure SetBitSaat(const Value: TDate);
    procedure SetDegistirenKaynak(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
    procedure SetDurusKod(const Value: String);
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetKapasite(const Value: Double);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetSirketNo(const Value: String);
    procedure SetTakvimYil(const Value: Integer);
    procedure SetTarih(const Value: TDate);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property BasSaat: TDate read GetBasSaat write SetBasSaat;
    property BitSaat: TDate read GetBitSaat write SetBitSaat;
    property DegistirenKaynak: String read GetDegistirenKaynak write SetDegistirenKaynak;
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property DegistirenSurum: String read GetDegistirenSurum write SetDegistirenSurum;
    property DegistirenTarih: TDate read GetDegistirenTarih write SetDegistirenTarih;
    property DurusKod: String read GetDurusKod write SetDurusKod;
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property ID: Integer read GetID write SetID;
    property Kapasite: Double read GetKapasite write SetKapasite;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property TakvimYil: Integer read GetTakvimYil write SetTakvimYil;
    property Tarih: TDate read GetTarih write SetTarih;
    property fAciklama:TField read GetfAciklama;
    property fBasSaat:TField read GetfBasSaat;
    property fBitSaat:TField read GetfBitSaat;
    property fDegistirenKaynak:TField read GetfDegistirenKaynak;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
    property fDurusKod:TField read GetfDurusKod;
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fID:TField read GetfID;
    property fKapasite:TField read GetfKapasite;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakKod:TField read GetfKaynakKod;
    property fSirketNo:TField read GetfSirketNo;
    property fTakvimYil:TField read GetfTakvimYil;
    property fTarih:TField read GetfTarih;
  end;

  TTableUretimKaynakKart = class(TAppTable)
  Private
    FfBeklemeSure: TField;
    FfCalismaSure: TField;
    FfDegistirenKaynak: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
    FfEsZamanliKapasite: TField;
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfID: TField;
    FfKapasite: TField;
    FfKapasiteSinirli: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKaynakAd: TField;
    FfKaynakKod: TField;
    FfKaynakTip: TField;
    FfKritikYuk: TField;
    FfKurulumSure: TField;
    FfKuyrukSure: TField;
    FfMaliyet1: TField;
    FfMaliyet2: TField;
    FfMaliyet3: TField;
    FfMaxIslemSure: TField;
    FfMekanikSaatKatSayi: TField;
    FfMinIslemSure: TField;
    FfOnUretimMiktar: TField;
    FfOptCalismaSure: TField;
    FfRowGuid: TField;
    FfSirketNo: TField;
    FfSokumSure: TField;
    FfSonumleyici: TField;
    FfTasimaSure: TField;
    FfVerimlilik: TField;
    function GetBeklemeSure: Double;
    function GetCalismaSure: Double;
    function GetDegistirenKaynak: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
    function GetEsZamanliKapasite: Double;
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetID: Integer;
    function GetKapasite: Double;
    function GetKapasiteSinirli: Integer;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKaynakAd: String;
    function GetKaynakKod: String;
    function GetKaynakTip: Integer;
    function GetKritikYuk: Double;
    function GetKurulumSure: Double;
    function GetKuyrukSure: Double;
    function GetMaliyet1: Double;
    function GetMaliyet2: Double;
    function GetMaliyet3: Double;
    function GetMaxIslemSure: Double;
    function GetMekanikSaatKatSayi: Double;
    function GetMinIslemSure: Double;
    function GetOnUretimMiktar: Double;
    function GetOptCalismaSure: Double;
    function GetRowGuid: String;
    function GetSirketNo: String;
    function GetSokumSure: Double;
    function GetSonumleyici: Double;
    function GetTasimaSure: Double;
    function GetVerimlilik: Double;
    function GetfBeklemeSure: TField;
    function GetfCalismaSure: TField;
    function GetfDegistirenKaynak: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
    function GetfEsZamanliKapasite: TField;
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfID: TField;
    function GetfKapasite: TField;
    function GetfKapasiteSinirli: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKaynakAd: TField;
    function GetfKaynakKod: TField;
    function GetfKaynakTip: TField;
    function GetfKritikYuk: TField;
    function GetfKurulumSure: TField;
    function GetfKuyrukSure: TField;
    function GetfMaliyet1: TField;
    function GetfMaliyet2: TField;
    function GetfMaliyet3: TField;
    function GetfMaxIslemSure: TField;
    function GetfMekanikSaatKatSayi: TField;
    function GetfMinIslemSure: TField;
    function GetfOnUretimMiktar: TField;
    function GetfOptCalismaSure: TField;
    function GetfRowGuid: TField;
    function GetfSirketNo: TField;
    function GetfSokumSure: TField;
    function GetfSonumleyici: TField;
    function GetfTasimaSure: TField;
    function GetfVerimlilik: TField;
    procedure SetBeklemeSure(const Value: Double);
    procedure SetCalismaSure(const Value: Double);
    procedure SetDegistirenKaynak(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
    procedure SetEsZamanliKapasite(const Value: Double);
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetKapasite(const Value: Double);
    procedure SetKapasiteSinirli(const Value: Integer);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakAd(const Value: String);
    procedure SetKaynakKod(const Value: String);
    procedure SetKaynakTip(const Value: Integer);
    procedure SetKritikYuk(const Value: Double);
    procedure SetKurulumSure(const Value: Double);
    procedure SetKuyrukSure(const Value: Double);
    procedure SetMaliyet1(const Value: Double);
    procedure SetMaliyet2(const Value: Double);
    procedure SetMaliyet3(const Value: Double);
    procedure SetMaxIslemSure(const Value: Double);
    procedure SetMekanikSaatKatSayi(const Value: Double);
    procedure SetMinIslemSure(const Value: Double);
    procedure SetOnUretimMiktar(const Value: Double);
    procedure SetOptCalismaSure(const Value: Double);
    procedure SetRowGuid(const Value: String);
    procedure SetSirketNo(const Value: String);
    procedure SetSokumSure(const Value: Double);
    procedure SetSonumleyici(const Value: Double);
    procedure SetTasimaSure(const Value: Double);
    procedure SetVerimlilik(const Value: Double);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property BeklemeSure: Double read GetBeklemeSure write SetBeklemeSure;
    property CalismaSure: Double read GetCalismaSure write SetCalismaSure;
    property DegistirenKaynak: String read GetDegistirenKaynak write SetDegistirenKaynak;
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property DegistirenSurum: String read GetDegistirenSurum write SetDegistirenSurum;
    property DegistirenTarih: TDate read GetDegistirenTarih write SetDegistirenTarih;
    property EsZamanliKapasite: Double read GetEsZamanliKapasite write SetEsZamanliKapasite;
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property ID: Integer read GetID write SetID;
    property Kapasite: Double read GetKapasite write SetKapasite;
    property KapasiteSinirli: Integer read GetKapasiteSinirli write SetKapasiteSinirli;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakAd: String read GetKaynakAd write SetKaynakAd;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property KaynakTip: Integer read GetKaynakTip write SetKaynakTip;
    property KritikYuk: Double read GetKritikYuk write SetKritikYuk;
    property KurulumSure: Double read GetKurulumSure write SetKurulumSure;
    property KuyrukSure: Double read GetKuyrukSure write SetKuyrukSure;
    property Maliyet1: Double read GetMaliyet1 write SetMaliyet1;
    property Maliyet2: Double read GetMaliyet2 write SetMaliyet2;
    property Maliyet3: Double read GetMaliyet3 write SetMaliyet3;
    property MaxIslemSure: Double read GetMaxIslemSure write SetMaxIslemSure;
    property MekanikSaatKatSayi: Double read GetMekanikSaatKatSayi write SetMekanikSaatKatSayi;
    property MinIslemSure: Double read GetMinIslemSure write SetMinIslemSure;
    property OnUretimMiktar: Double read GetOnUretimMiktar write SetOnUretimMiktar;
    property OptCalismaSure: Double read GetOptCalismaSure write SetOptCalismaSure;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property SokumSure: Double read GetSokumSure write SetSokumSure;
    property Sonumleyici: Double read GetSonumleyici write SetSonumleyici;
    property TasimaSure: Double read GetTasimaSure write SetTasimaSure;
    property Verimlilik: Double read GetVerimlilik write SetVerimlilik;
    property fBeklemeSure:TField read GetfBeklemeSure;
    property fCalismaSure:TField read GetfCalismaSure;
    property fDegistirenKaynak:TField read GetfDegistirenKaynak;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
    property fEsZamanliKapasite:TField read GetfEsZamanliKapasite;
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fID:TField read GetfID;
    property fKapasite:TField read GetfKapasite;
    property fKapasiteSinirli:TField read GetfKapasiteSinirli;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakAd:TField read GetfKaynakAd;
    property fKaynakKod:TField read GetfKaynakKod;
    property fKaynakTip:TField read GetfKaynakTip;
    property fKritikYuk:TField read GetfKritikYuk;
    property fKurulumSure:TField read GetfKurulumSure;
    property fKuyrukSure:TField read GetfKuyrukSure;
    property fMaliyet1:TField read GetfMaliyet1;
    property fMaliyet2:TField read GetfMaliyet2;
    property fMaliyet3:TField read GetfMaliyet3;
    property fMaxIslemSure:TField read GetfMaxIslemSure;
    property fMekanikSaatKatSayi:TField read GetfMekanikSaatKatSayi;
    property fMinIslemSure:TField read GetfMinIslemSure;
    property fOnUretimMiktar:TField read GetfOnUretimMiktar;
    property fOptCalismaSure:TField read GetfOptCalismaSure;
    property fRowGuid:TField read GetfRowGuid;
    property fSirketNo:TField read GetfSirketNo;
    property fSokumSure:TField read GetfSokumSure;
    property fSonumleyici:TField read GetfSonumleyici;
    property fTasimaSure:TField read GetfTasimaSure;
    property fVerimlilik:TField read GetfVerimlilik;
  end;

  TTableUretimKaynakSonDurum = class(TAppTable)
  Private
    FfID: TField;
    FfKaynakKod: TField;
    FfSonBitTarih: TField;
    FfSonBitTarihSaat: TField;
    FfSonMamulKod: TField;
    function GetID: Integer;
    function GetKaynakKod: String;
    function GetSonBitTarih: TDate;
    function GetSonBitTarihSaat: TDate;
    function GetSonMamulKod: String;
    function GetfID: TField;
    function GetfKaynakKod: TField;
    function GetfSonBitTarih: TField;
    function GetfSonBitTarihSaat: TField;
    function GetfSonMamulKod: TField;
    procedure SetID(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetSonBitTarih(const Value: TDate);
    procedure SetSonBitTarihSaat(const Value: TDate);
    procedure SetSonMamulKod(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ID: Integer read GetID write SetID;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property SonBitTarih: TDate read GetSonBitTarih write SetSonBitTarih;
    property SonBitTarihSaat: TDate read GetSonBitTarihSaat write SetSonBitTarihSaat;
    property SonMamulKod: String read GetSonMamulKod write SetSonMamulKod;
    property fID:TField read GetfID;
    property fKaynakKod:TField read GetfKaynakKod;
    property fSonBitTarih:TField read GetfSonBitTarih;
    property fSonBitTarihSaat:TField read GetfSonBitTarihSaat;
    property fSonMamulKod:TField read GetfSonMamulKod;
  end;

  TTableUretimKaynakTakvim = class(TAppTable)
  Private
    FfKullanilan: TField;
    FfBasSaat: TField;
    FfBasTarihSaat: TField;
    FfBitSaat: TField;
    FfBitTarihSaat: TField;
    FfEtkinKapasite: TField;
    FfID: TField;
    FfKapasite: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfKaynakKod: TField;
    FfKullanilanKapasite: TField;
    FfSirketNo: TField;
    FfTakvimYil: TField;
    FfTarih: TField;
    FfToplamKapasite: TField;
    FfVardiyaKod: TField;
    FfVerimlilik: TField;
    function GetKullanilan: Double;
    function GetBasSaat: TDate;
    function GetBasTarihSaat: TDate;
    function GetBitSaat: TDate;
    function GetBitTarihSaat: TDate;
    function GetEtkinKapasite: Double;
    function GetID: Integer;
    function GetKapasite: Double;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetKaynakKod: String;
    function GetKullanilanKapasite: Double;
    function GetSirketNo: String;
    function GetTakvimYil: Integer;
    function GetTarih: TDate;
    function GetToplamKapasite: Double;
    function GetVardiyaKod: String;
    function GetVerimlilik: Double;
    function GetfKullanilan: TField;
    function GetfBasSaat: TField;
    function GetfBasTarihSaat: TField;
    function GetfBitSaat: TField;
    function GetfBitTarihSaat: TField;
    function GetfEtkinKapasite: TField;
    function GetfID: TField;
    function GetfKapasite: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfKaynakKod: TField;
    function GetfKullanilanKapasite: TField;
    function GetfSirketNo: TField;
    function GetfTakvimYil: TField;
    function GetfTarih: TField;
    function GetfToplamKapasite: TField;
    function GetfVardiyaKod: TField;
    function GetfVerimlilik: TField;
    procedure SetKullanilan(const Value: Double);
    procedure SetBasSaat(const Value: TDate);
    procedure SetBasTarihSaat(const Value: TDate);
    procedure SetBitSaat(const Value: TDate);
    procedure SetBitTarihSaat(const Value: TDate);
    procedure SetEtkinKapasite(const Value: Double);
    procedure SetID(const Value: Integer);
    procedure SetKapasite(const Value: Double);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetKullanilanKapasite(const Value: Double);
    procedure SetSirketNo(const Value: String);
    procedure SetTakvimYil(const Value: Integer);
    procedure SetTarih(const Value: TDate);
    procedure SetToplamKapasite(const Value: Double);
    procedure SetVardiyaKod(const Value: String);
    procedure SetVerimlilik(const Value: Double);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Kullanilan: Double read GetKullanilan write SetKullanilan;
    property BasSaat: TDate read GetBasSaat write SetBasSaat;
    property BasTarihSaat: TDate read GetBasTarihSaat write SetBasTarihSaat;
    property BitSaat: TDate read GetBitSaat write SetBitSaat;
    property BitTarihSaat: TDate read GetBitTarihSaat write SetBitTarihSaat;
    property EtkinKapasite: Double read GetEtkinKapasite write SetEtkinKapasite;
    property ID: Integer read GetID write SetID;
    property Kapasite: Double read GetKapasite write SetKapasite;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property KullanilanKapasite: Double read GetKullanilanKapasite write SetKullanilanKapasite;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property TakvimYil: Integer read GetTakvimYil write SetTakvimYil;
    property Tarih: TDate read GetTarih write SetTarih;
    property ToplamKapasite: Double read GetToplamKapasite write SetToplamKapasite;
    property VardiyaKod: String read GetVardiyaKod write SetVardiyaKod;
    property Verimlilik: Double read GetVerimlilik write SetVerimlilik;
    property fKullanilan:TField read GetfKullanilan;
    property fBasSaat:TField read GetfBasSaat;
    property fBasTarihSaat:TField read GetfBasTarihSaat;
    property fBitSaat:TField read GetfBitSaat;
    property fBitTarihSaat:TField read GetfBitTarihSaat;
    property fEtkinKapasite:TField read GetfEtkinKapasite;
    property fID:TField read GetfID;
    property fKapasite:TField read GetfKapasite;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakKod:TField read GetfKaynakKod;
    property fKullanilanKapasite:TField read GetfKullanilanKapasite;
    property fSirketNo:TField read GetfSirketNo;
    property fTakvimYil:TField read GetfTakvimYil;
    property fTarih:TField read GetfTarih;
    property fToplamKapasite:TField read GetfToplamKapasite;
    property fVardiyaKod:TField read GetfVardiyaKod;
    property fVerimlilik:TField read GetfVerimlilik;
  end;

  TTableUretimDurusKart = class(TAppTable)
  Private
    FfAciklama: TField;
    FfBirimSure: TField;
    FfDurusKod: TField;
    FfDurusTip: TField;
    FfGrupKod: TField;
    FfID: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfOzelKod: TField;
    FfPlanTip: TField;
    FfRowGuid: TField;
    FfSirketNo: TField;
    function GetAciklama: String;
    function GetBirimSure: Double;
    function GetDurusKod: String;
    function GetDurusTip: Integer;
    function GetGrupKod: String;
    function GetID: Integer;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetOzelKod: String;
    function GetPlanTip: Integer;
    function GetRowGuid: String;
    function GetSirketNo: String;
    function GetfAciklama: TField;
    function GetfBirimSure: TField;
    function GetfDurusKod: TField;
    function GetfDurusTip: TField;
    function GetfGrupKod: TField;
    function GetfID: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfOzelKod: TField;
    function GetfPlanTip: TField;
    function GetfRowGuid: TField;
    function GetfSirketNo: TField;
    procedure SetAciklama(const Value: String);
    procedure SetBirimSure(const Value: Double);
    procedure SetDurusKod(const Value: String);
    procedure SetDurusTip(const Value: Integer);
    procedure SetGrupKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetOzelKod(const Value: String);
    procedure SetPlanTip(const Value: Integer);
    procedure SetRowGuid(const Value: String);
    procedure SetSirketNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property BirimSure: Double read GetBirimSure write SetBirimSure;
    property DurusKod: String read GetDurusKod write SetDurusKod;
    property DurusTip: Integer read GetDurusTip write SetDurusTip;
    property GrupKod: String read GetGrupKod write SetGrupKod;
    property ID: Integer read GetID write SetID;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property OzelKod: String read GetOzelKod write SetOzelKod;
    property PlanTip: Integer read GetPlanTip write SetPlanTip;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property fAciklama:TField read GetfAciklama;
    property fBirimSure:TField read GetfBirimSure;
    property fDurusKod:TField read GetfDurusKod;
    property fDurusTip:TField read GetfDurusTip;
    property fGrupKod:TField read GetfGrupKod;
    property fID:TField read GetfID;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fOzelKod:TField read GetfOzelKod;
    property fPlanTip:TField read GetfPlanTip;
    property fRowGuid:TField read GetfRowGuid;
    property fSirketNo:TField read GetfSirketNo;
  end;

  TTableUretimHataKart = class(TAppTable)
  Private
    FfAciklama: TField;
    FfGrupKod: TField;
    FfHataKod: TField;
    FfHataTip: TField;
    FfID: TField;
    FfKayitDurum: TField;
    FfKayitTur: TField;
    FfOzelKod: TField;
    FfRowGuid: TField;
    FfSirketNo: TField;
    function GetAciklama: String;
    function GetGrupKod: String;
    function GetHataKod: String;
    function GetHataTip: Integer;
    function GetID: Integer;
    function GetKayitDurum: Integer;
    function GetKayitTur: Integer;
    function GetOzelKod: String;
    function GetRowGuid: String;
    function GetSirketNo: String;
    function GetfAciklama: TField;
    function GetfGrupKod: TField;
    function GetfHataKod: TField;
    function GetfHataTip: TField;
    function GetfID: TField;
    function GetfKayitDurum: TField;
    function GetfKayitTur: TField;
    function GetfOzelKod: TField;
    function GetfRowGuid: TField;
    function GetfSirketNo: TField;
    procedure SetAciklama(const Value: String);
    procedure SetGrupKod(const Value: String);
    procedure SetHataKod(const Value: String);
    procedure SetHataTip(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetKayitDurum(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetOzelKod(const Value: String);
    procedure SetRowGuid(const Value: String);
    procedure SetSirketNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property GrupKod: String read GetGrupKod write SetGrupKod;
    property HataKod: String read GetHataKod write SetHataKod;
    property HataTip: Integer read GetHataTip write SetHataTip;
    property ID: Integer read GetID write SetID;
    property KayitDurum: Integer read GetKayitDurum write SetKayitDurum;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property OzelKod: String read GetOzelKod write SetOzelKod;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property fAciklama:TField read GetfAciklama;
    property fGrupKod:TField read GetfGrupKod;
    property fHataKod:TField read GetfHataKod;
    property fHataTip:TField read GetfHataTip;
    property fID:TField read GetfID;
    property fKayitDurum:TField read GetfKayitDurum;
    property fKayitTur:TField read GetfKayitTur;
    property fOzelKod:TField read GetfOzelKod;
    property fRowGuid:TField read GetfRowGuid;
    property fSirketNo:TField read GetfSirketNo;
  end;

  TTableUretimParametre = class(TAppTable)
  Private
    FfFireHesapla: TField;
    FfID: TField;
    FfKullanimGrupNo: TField;
    FfRowGuid: TField;
    FfSiparisSeriNoKapat: TField;
    FfSiparisTip: TField;
    FfSirketNo: TField;
    FfUretimSeriNoKapat: TField;
    FfUretimTip: TField;
    FfYuvarla: TField;
    function GetFireHesapla: Integer;
    function GetID: Integer;
    function GetKullanimGrupNo: Integer;
    function GetRowGuid: String;
    function GetSiparisSeriNoKapat: Integer;
    function GetSiparisTip: Integer;
    function GetSirketNo: String;
    function GetUretimSeriNoKapat: Integer;
    function GetUretimTip: Integer;
    function GetYuvarla: Integer;
    function GetfFireHesapla: TField;
    function GetfID: TField;
    function GetfKullanimGrupNo: TField;
    function GetfRowGuid: TField;
    function GetfSiparisSeriNoKapat: TField;
    function GetfSiparisTip: TField;
    function GetfSirketNo: TField;
    function GetfUretimSeriNoKapat: TField;
    function GetfUretimTip: TField;
    function GetfYuvarla: TField;
    procedure SetFireHesapla(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetKullanimGrupNo(const Value: Integer);
    procedure SetRowGuid(const Value: String);
    procedure SetSiparisSeriNoKapat(const Value: Integer);
    procedure SetSiparisTip(const Value: Integer);
    procedure SetSirketNo(const Value: String);
    procedure SetUretimSeriNoKapat(const Value: Integer);
    procedure SetUretimTip(const Value: Integer);
    procedure SetYuvarla(const Value: Integer);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property FireHesapla: Integer read GetFireHesapla write SetFireHesapla;
    property ID: Integer read GetID write SetID;
    property KullanimGrupNo: Integer read GetKullanimGrupNo write SetKullanimGrupNo;
    property RowGuid: String read GetRowGuid write SetRowGuid;
    property SiparisSeriNoKapat: Integer read GetSiparisSeriNoKapat write SetSiparisSeriNoKapat;
    property SiparisTip: Integer read GetSiparisTip write SetSiparisTip;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property UretimSeriNoKapat: Integer read GetUretimSeriNoKapat write SetUretimSeriNoKapat;
    property UretimTip: Integer read GetUretimTip write SetUretimTip;
    property Yuvarla: Integer read GetYuvarla write SetYuvarla;
    property fFireHesapla:TField read GetfFireHesapla;
    property fID:TField read GetfID;
    property fKullanimGrupNo:TField read GetfKullanimGrupNo;
    property fRowGuid:TField read GetfRowGuid;
    property fSiparisSeriNoKapat:TField read GetfSiparisSeriNoKapat;
    property fSiparisTip:TField read GetfSiparisTip;
    property fSirketNo:TField read GetfSirketNo;
    property fUretimSeriNoKapat:TField read GetfUretimSeriNoKapat;
    property fUretimTip:TField read GetfUretimTip;
    property fYuvarla:TField read GetfYuvarla;
  end;

  TTableUretimTakvimKart = class(TAppTable)
  Private
    FfID: TField;
    FfTakvimKod: TField;
    function GetID: Integer;
    function GetTakvimKod: String;
    function GetfID: TField;
    function GetfTakvimKod: TField;
    procedure SetID(const Value: Integer);
    procedure SetTakvimKod(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ID: Integer read GetID write SetID;
    property TakvimKod: String read GetTakvimKod write SetTakvimKod;
    property fID:TField read GetfID;
    property fTakvimKod:TField read GetfTakvimKod;
  end;

  TTableUretimTakvimVardiya = class(TAppTable)
  Private
    FfDegistirenKaynak: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfID: TField;
    FfTakvimKod: TField;
    FfVardiyaKod: TField;
    function GetDegistirenKaynak: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetID: Integer;
    function GetTakvimKod: String;
    function GetVardiyaKod: String;
    function GetfDegistirenKaynak: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfID: TField;
    function GetfTakvimKod: TField;
    function GetfVardiyaKod: TField;
    procedure SetDegistirenKaynak(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetTakvimKod(const Value: String);
    procedure SetVardiyaKod(const Value: String);
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
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property ID: Integer read GetID write SetID;
    property TakvimKod: String read GetTakvimKod write SetTakvimKod;
    property VardiyaKod: String read GetVardiyaKod write SetVardiyaKod;
    property fDegistirenKaynak:TField read GetfDegistirenKaynak;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fID:TField read GetfID;
    property fTakvimKod:TField read GetfTakvimKod;
    property fVardiyaKod:TField read GetfVardiyaKod;
  end;

  TTableUretimVardiyaKart = class(TAppTable)
  Private
    FfID: TField;
    FfVardiyaKod: TField;
    function GetID: Integer;
    function GetVardiyaKod: String;
    function GetfID: TField;
    function GetfVardiyaKod: TField;
    procedure SetID(const Value: Integer);
    procedure SetVardiyaKod(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ID: Integer read GetID write SetID;
    property VardiyaKod: String read GetVardiyaKod write SetVardiyaKod;
    property fID:TField read GetfID;
    property fVardiyaKod:TField read GetfVardiyaKod;
  end;

  TTableUretimVardiyaKaynak = class(TAppTable)
  Private
    FfDegistirenKaynak: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfID: TField;
    FfKaynakKod: TField;
    FfKapasite: TField;
    FfVardiyaAd: TField;
    FfVerimlilik: TField;
    FfVardiyaKod: TField;
    function GetDegistirenKaynak: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetID: Integer;
    function GetKaynakKod: String;
    function GetKapasite: Double;
    function GetVardiyaAd: String;
    function GetVerimlilik: Double;
    function GetVardiyaKod: String;
    function GetfDegistirenKaynak: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfID: TField;
    function GetfKaynakKod: TField;
    function GetfKapasite: TField;
    function GetfVardiyaAd: TField;
    function GetfVerimlilik: TField;
    function GetfVardiyaKod: TField;
    procedure SetDegistirenKaynak(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetKapasite(const Value: Double);
    procedure SetVardiyaAd(const Value: String);
    procedure SetVerimlilik(const Value: Double);
    procedure SetVardiyaKod(const Value: String);
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
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property ID: Integer read GetID write SetID;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property Kapasite: Double read GetKapasite write SetKapasite;
    property VardiyaAd: String read GetVardiyaAd write SetVardiyaAd;
    property Verimlilik: Double read GetVerimlilik write SetVerimlilik;
    property VardiyaKod: String read GetVardiyaKod write SetVardiyaKod;
    property fDegistirenKaynak:TField read GetfDegistirenKaynak;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fID:TField read GetfID;
    property fKaynakKod:TField read GetfKaynakKod;
    property fKapasite:TField read GetfKapasite;
    property fVardiyaAd:TField read GetfVardiyaAd;
    property fVerimlilik:TField read GetfVerimlilik;
    property fVardiyaKod:TField read GetfVardiyaKod;
  end;

  TTableUretimVardiyaSaat = class(TAppTable)
  Private
    FfAciklama: TField;
    FfBasSaat: TField;
    FfBitSaat: TField;
    FfDegistirenKaynak: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfGun: TField;
    FfID: TField;
    FfVardiyaKod: TField;
    function GetAciklama: String;
    function GetBasSaat: TDate;
    function GetBitSaat: TDate;
    function GetDegistirenKaynak: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetGun: Integer;
    function GetID: Integer;
    function GetVardiyaKod: String;
    function GetfAciklama: TField;
    function GetfBasSaat: TField;
    function GetfBitSaat: TField;
    function GetfDegistirenKaynak: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfGun: TField;
    function GetfID: TField;
    function GetfVardiyaKod: TField;
    procedure SetAciklama(const Value: String);
    procedure SetBasSaat(const Value: TDate);
    procedure SetBitSaat(const Value: TDate);
    procedure SetDegistirenKaynak(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetGun(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetVardiyaKod(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property BasSaat: TDate read GetBasSaat write SetBasSaat;
    property BitSaat: TDate read GetBitSaat write SetBitSaat;
    property DegistirenKaynak: String read GetDegistirenKaynak write SetDegistirenKaynak;
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property DegistirenSurum: String read GetDegistirenSurum write SetDegistirenSurum;
    property DegistirenTarih: TDate read GetDegistirenTarih write SetDegistirenTarih;
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property Gun: Integer read GetGun write SetGun;
    property ID: Integer read GetID write SetID;
    property VardiyaKod: String read GetVardiyaKod write SetVardiyaKod;
    property fAciklama:TField read GetfAciklama;
    property fBasSaat:TField read GetfBasSaat;
    property fBitSaat:TField read GetfBitSaat;
    property fDegistirenKaynak:TField read GetfDegistirenKaynak;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fGun:TField read GetfGun;
    property fID:TField read GetfID;
    property fVardiyaKod:TField read GetfVardiyaKod;
  end;

  TTableUretimYilKart = class(TAppTable)
  Private
    FfID: TField;
    FfTakvimYil: TField;
    function GetID: Integer;
    function GetTakvimYil: Integer;
    function GetfID: TField;
    function GetfTakvimYil: TField;
    procedure SetID(const Value: Integer);
    procedure SetTakvimYil(const Value: Integer);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ID: Integer read GetID write SetID;
    property TakvimYil: Integer read GetTakvimYil write SetTakvimYil;
    property fID:TField read GetfID;
    property fTakvimYil:TField read GetfTakvimYil;
  end;

  TTableUretimYilTatil = class(TAppTable)
  Private
    FfAciklama: TField;
    FfBasSaat: TField;
    FfBitSaat: TField;
    FfDegistirenKaynak: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
    FfGirenkaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfID: TField;
    FfTakvimYil: TField;
    FfTarih: TField;
    function GetAciklama: String;
    function GetBasSaat: TDate;
    function GetBitSaat: TDate;
    function GetDegistirenKaynak: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
    function GetGirenkaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetID: Integer;
    function GetTakvimYil: Integer;
    function GetTarih: TDate;
    function GetfAciklama: TField;
    function GetfBasSaat: TField;
    function GetfBitSaat: TField;
    function GetfDegistirenKaynak: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
    function GetfGirenkaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfID: TField;
    function GetfTakvimYil: TField;
    function GetfTarih: TField;
    procedure SetAciklama(const Value: String);
    procedure SetBasSaat(const Value: TDate);
    procedure SetBitSaat(const Value: TDate);
    procedure SetDegistirenKaynak(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
    procedure SetGirenkaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetTakvimYil(const Value: Integer);
    procedure SetTarih(const Value: TDate);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama: String read GetAciklama write SetAciklama;
    property BasSaat: TDate read GetBasSaat write SetBasSaat;
    property BitSaat: TDate read GetBitSaat write SetBitSaat;
    property DegistirenKaynak: String read GetDegistirenKaynak write SetDegistirenKaynak;
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property DegistirenSurum: String read GetDegistirenSurum write SetDegistirenSurum;
    property DegistirenTarih: TDate read GetDegistirenTarih write SetDegistirenTarih;
    property Girenkaynak: String read GetGirenkaynak write SetGirenkaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property ID: Integer read GetID write SetID;
    property TakvimYil: Integer read GetTakvimYil write SetTakvimYil;
    property Tarih: TDate read GetTarih write SetTarih;
    property fAciklama:TField read GetfAciklama;
    property fBasSaat:TField read GetfBasSaat;
    property fBitSaat:TField read GetfBitSaat;
    property fDegistirenKaynak:TField read GetfDegistirenKaynak;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
    property fGirenkaynak:TField read GetfGirenkaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fID:TField read GetfID;
    property fTakvimYil:TField read GetfTakvimYil;
    property fTarih:TField read GetfTarih;
  end;

implementation

uses CPMApp_Math;

{ TTableMamulBaslik }

constructor TTableMamulBaslik.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MAMBAS';
end;

procedure TTableMamulBaslik.DoAfterOpen;
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
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
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
  if FfHammaddeDepoKod = nil then
    FfHammaddeDepoKod := FindField('HAMMADDEDEPOKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKullanimKod = nil then
    FfKullanimKod := FindField('KULLANIMKOD');
  if FfKullanimSekli = nil then
    FfKullanimSekli := FindField('KULLANIMSEKLI');
  if FfKurulumKod1 = nil then
    FfKurulumKod1 := FindField('KURULUMKOD1');
  if FfKurulumKod2 = nil then
    FfKurulumKod2 := FindField('KURULUMKOD2');
  if FfKurulumKod3 = nil then
    FfKurulumKod3 := FindField('KURULUMKOD3');
  if FfKurulumKod4 = nil then
    FfKurulumKod4 := FindField('KURULUMKOD4');
  if FfKurulumKod5 = nil then
    FfKurulumKod5 := FindField('KURULUMKOD5');
  if FfKurulumKod6 = nil then
    FfKurulumKod6 := FindField('KURULUMKOD6');
  if FfKurulumKod7 = nil then
    FfKurulumKod7 := FindField('KURULUMKOD7');
  if FfKurulumKod8 = nil then
    FfKurulumKod8 := FindField('KURULUMKOD8');
  if FfKurulumKod9 = nil then
    FfKurulumKod9 := FindField('KURULUMKOD9');
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
  if FfKodBakim = nil then
    FfKodBakim := FindField('MAMKUK_KODBAKIM');
  if FfKodDizayn = nil then
    FfKodDizayn := FindField('MAMKUK_KODDIZAYN');
  if FfKodMaliyet = nil then
    FfKodMaliyet := FindField('MAMKUK_KODMALIYET');
  if FfKodSatis = nil then
    FfKodSatis := FindField('MAMKUK_KODSATIS');
  if FfKodUretim = nil then
    FfKodUretim := FindField('MAMKUK_KODURETIM');
  if FfKodYedekParca = nil then
    FfKodYedekParca := FindField('MAMKUK_KODYEDEKPARCA');
  if FfMamulDepokod = nil then
    FfMamulDepokod := FindField('MAMULDEPOKOD');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
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
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  if FfRotaTip = nil then
    FfRotaTip := FindField('ROTATIP');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
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
  if FfSokumKod1 = nil then
    FfSokumKod1 := FindField('SOKUMKOD1');
  if FfSokumKod2 = nil then
    FfSokumKod2 := FindField('SOKUMKOD2');
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
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('STKKRT_MALIYET1');
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('STKKRT_MALIYET2');
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('STKKRT_MALIYET3');
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableMamulBaslik.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama1 := nil;
    FfAciklama2 := nil;
    FfAciklama3 := nil;
    FfAciklama4 := nil;
    FfAciklama5 := nil;
    FfBirim := nil;
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
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfHammaddeDepoKod := nil;
    FfID := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKullanimKod := nil;
    FfKullanimSekli := nil;
    FfKurulumKod1 := nil;
    FfKurulumKod2 := nil;
    FfKurulumKod3 := nil;
    FfKurulumKod4 := nil;
    FfKurulumKod5 := nil;
    FfKurulumKod6 := nil;
    FfKurulumKod7 := nil;
    FfKurulumKod8 := nil;
    FfKurulumKod9 := nil;
    FfLKod1 := nil;
    FfLKod2 := nil;
    FfLKod3 := nil;
    FfLKod4 := nil;
    FfLKod5 := nil;
    FfKodBakim := nil;
    FfKodDizayn := nil;
    FfKodMaliyet := nil;
    FfKodSatis := nil;
    FfKodUretim := nil;
    FfKodYedekParca := nil;
    FfMamulDepokod := nil;
    FfMamulKod := nil;
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
    FfReceteNo := nil;
    FfRotaTip := nil;
    FfRowGuid := nil;
    FfSirketNo := nil;
    FfSKod1 := nil;
    FfSKod2 := nil;
    FfSKod3 := nil;
    FfSKod4 := nil;
    FfSKod5 := nil;
    FfSokumKod1 := nil;
    FfSokumKod2 := nil;
    FfKullanilabilir := nil;
    FfStokCikis := nil;
    FfStokGiris := nil;
    FfStokMiktar := nil;
    FfDovizCins := nil;
    FfMalAd := nil;
    FfMaliyet1 := nil;
    FfMaliyet2 := nil;
    FfMaliyet3 := nil;
    FfSurumNo := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableMamulBaslik.GetAciklama1: String;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1.AsString;
end;

function TTableMamulBaslik.GetAciklama2: String;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2.AsString;
end;

function TTableMamulBaslik.GetAciklama3: String;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3.AsString;
end;

function TTableMamulBaslik.GetAciklama4: String;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4.AsString;
end;

function TTableMamulBaslik.GetAciklama5: String;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5.AsString;
end;

function TTableMamulBaslik.GetBirim: String;
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  Result := FfBirim.AsString;
end;

function TTableMamulBaslik.GetBKod1: Integer;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1.AsInteger;
end;

function TTableMamulBaslik.GetBKod2: Integer;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2.AsInteger;
end;

function TTableMamulBaslik.GetBKod3: Integer;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3.AsInteger;
end;

function TTableMamulBaslik.GetBKod4: Integer;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4.AsInteger;
end;

function TTableMamulBaslik.GetBKod5: Integer;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5.AsInteger;
end;

function TTableMamulBaslik.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableMamulBaslik.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableMamulBaslik.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableMamulBaslik.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableMamulBaslik.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableMamulBaslik.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableMamulBaslik.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableMamulBaslik.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableMamulBaslik.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableMamulBaslik.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableMamulBaslik.GetHammaddeDepoKod: String;
begin
  if FfHammaddeDepoKod = nil then
    FfHammaddeDepoKod := FindField('HAMMADDEDEPOKOD');
  Result := FfHammaddeDepoKod.AsString;
end;

function TTableMamulBaslik.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMamulBaslik.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableMamulBaslik.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableMamulBaslik.GetKullanimKod: String;
begin
  if FfKullanimKod = nil then
    FfKullanimKod := FindField('KULLANIMKOD');
  Result := FfKullanimKod.AsString;
end;

function TTableMamulBaslik.GetKullanimSekli: Integer;
begin
  if FfKullanimSekli = nil then
    FfKullanimSekli := FindField('KULLANIMSEKLI');
  Result := FfKullanimSekli.AsInteger;
end;

function TTableMamulBaslik.GetKurulumKod1: String;
begin
  if FfKurulumKod1 = nil then
    FfKurulumKod1 := FindField('KURULUMKOD1');
  Result := FfKurulumKod1.AsString;
end;

function TTableMamulBaslik.GetKurulumKod2: String;
begin
  if FfKurulumKod2 = nil then
    FfKurulumKod2 := FindField('KURULUMKOD2');
  Result := FfKurulumKod2.AsString;
end;

function TTableMamulBaslik.GetKurulumKod3: String;
begin
  if FfKurulumKod3 = nil then
    FfKurulumKod3 := FindField('KURULUMKOD3');
  Result := FfKurulumKod3.AsString;
end;

function TTableMamulBaslik.GetKurulumKod4: String;
begin
  if FfKurulumKod4 = nil then
    FfKurulumKod4 := FindField('KURULUMKOD4');
  Result := FfKurulumKod4.AsString;
end;

function TTableMamulBaslik.GetKurulumKod5: String;
begin
  if FfKurulumKod5 = nil then
    FfKurulumKod5 := FindField('KURULUMKOD5');
  Result := FfKurulumKod5.AsString;
end;

function TTableMamulBaslik.GetKurulumKod6: String;
begin
  if FfKurulumKod6 = nil then
    FfKurulumKod6 := FindField('KURULUMKOD6');
  Result := FfKurulumKod6.AsString;
end;

function TTableMamulBaslik.GetKurulumKod7: String;
begin
  if FfKurulumKod7 = nil then
    FfKurulumKod7 := FindField('KURULUMKOD7');
  Result := FfKurulumKod7.AsString;
end;

function TTableMamulBaslik.GetKurulumKod8: String;
begin
  if FfKurulumKod8 = nil then
    FfKurulumKod8 := FindField('KURULUMKOD8');
  Result := FfKurulumKod8.AsString;
end;

function TTableMamulBaslik.GetKurulumKod9: String;
begin
  if FfKurulumKod9 = nil then
    FfKurulumKod9 := FindField('KURULUMKOD9');
  Result := FfKurulumKod9.AsString;
end;

function TTableMamulBaslik.GetLKod1: String;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1.AsString;
end;

function TTableMamulBaslik.GetLKod2: String;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2.AsString;
end;

function TTableMamulBaslik.GetLKod3: String;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3.AsString;
end;

function TTableMamulBaslik.GetLKod4: String;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4.AsString;
end;

function TTableMamulBaslik.GetLKod5: String;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5.AsString;
end;

function TTableMamulBaslik.GetKodBakim: Integer;
begin
  if FfKodBakim = nil then
    FfKodBakim := FindField('MAMKUK_KODBAKIM');
  Result := FfKodBakim.AsInteger;
end;

function TTableMamulBaslik.GetKodDizayn: Integer;
begin
  if FfKodDizayn = nil then
    FfKodDizayn := FindField('MAMKUK_KODDIZAYN');
  Result := FfKodDizayn.AsInteger;
end;

function TTableMamulBaslik.GetKodMaliyet: Integer;
begin
  if FfKodMaliyet = nil then
    FfKodMaliyet := FindField('MAMKUK_KODMALIYET');
  Result := FfKodMaliyet.AsInteger;
end;

function TTableMamulBaslik.GetKodSatis: Integer;
begin
  if FfKodSatis = nil then
    FfKodSatis := FindField('MAMKUK_KODSATIS');
  Result := FfKodSatis.AsInteger;
end;

function TTableMamulBaslik.GetKodUretim: Integer;
begin
  if FfKodUretim = nil then
    FfKodUretim := FindField('MAMKUK_KODURETIM');
  Result := FfKodUretim.AsInteger;
end;

function TTableMamulBaslik.GetKodYedekParca: Integer;
begin
  if FfKodYedekParca = nil then
    FfKodYedekParca := FindField('MAMKUK_KODYEDEKPARCA');
  Result := FfKodYedekParca.AsInteger;
end;

function TTableMamulBaslik.GetMamulDepokod: String;
begin
  if FfMamulDepokod = nil then
    FfMamulDepokod := FindField('MAMULDEPOKOD');
  Result := FfMamulDepokod.AsString;
end;

function TTableMamulBaslik.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableMamulBaslik.GetMKod1: String;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1.AsString;
end;

function TTableMamulBaslik.GetMKod2: String;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2.AsString;
end;

function TTableMamulBaslik.GetMKod3: String;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3.AsString;
end;

function TTableMamulBaslik.GetMKod4: String;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4.AsString;
end;

function TTableMamulBaslik.GetMKod5: String;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5.AsString;
end;

function TTableMamulBaslik.GetNKod1: Double;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1.AsFloat;
end;

function TTableMamulBaslik.GetNKod2: Double;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2.AsFloat;
end;

function TTableMamulBaslik.GetNKod3: Double;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3.AsFloat;
end;

function TTableMamulBaslik.GetNKod4: Double;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4.AsFloat;
end;

function TTableMamulBaslik.GetNKod5: Double;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5.AsFloat;
end;

function TTableMamulBaslik.GetReceteNo: String;
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  Result := FfReceteNo.AsString;
end;

function TTableMamulBaslik.GetRotaTip: Integer;
begin
  if FfRotaTip = nil then
    FfRotaTip := FindField('ROTATIP');
  Result := FfRotaTip.AsInteger;
end;

function TTableMamulBaslik.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMamulBaslik.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMamulBaslik.GetSKod1: String;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1.AsString;
end;

function TTableMamulBaslik.GetSKod2: String;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2.AsString;
end;

function TTableMamulBaslik.GetSKod3: String;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3.AsString;
end;

function TTableMamulBaslik.GetSKod4: String;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4.AsString;
end;

function TTableMamulBaslik.GetSKod5: String;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5.AsString;
end;

function TTableMamulBaslik.GetSokumKod1: String;
begin
  if FfSokumKod1 = nil then
    FfSokumKod1 := FindField('SOKUMKOD1');
  Result := FfSokumKod1.AsString;
end;

function TTableMamulBaslik.GetSokumKod2: String;
begin
  if FfSokumKod2 = nil then
    FfSokumKod2 := FindField('SOKUMKOD2');
  Result := FfSokumKod2.AsString;
end;

function TTableMamulBaslik.GetKullanilabilir: Double;
begin
  if FfKullanilabilir = nil then
    FfKullanilabilir := FindField('STKDRM_KULLANILABILIR');
  Result := FfKullanilabilir.AsFloat;
end;

function TTableMamulBaslik.GetStokCikis: Double;
begin
  if FfStokCikis = nil then
    FfStokCikis := FindField('STKDRM_STOKCIKIS');
  Result := FfStokCikis.AsFloat;
end;

function TTableMamulBaslik.GetStokGiris: Double;
begin
  if FfStokGiris = nil then
    FfStokGiris := FindField('STKDRM_STOKGIRIS');
  Result := FfStokGiris.AsFloat;
end;

function TTableMamulBaslik.GetStokMiktar: Double;
begin
  if FfStokMiktar = nil then
    FfStokMiktar := FindField('STKDRM_STOKMIKTAR');
  Result := FfStokMiktar.AsFloat;
end;

function TTableMamulBaslik.GetDovizCins: String;
begin
  if FfDovizCins = nil then
    FfDovizCins := FindField('STKKRT_DOVIZCINS');
  Result := FfDovizCins.AsString;
end;

function TTableMamulBaslik.GetMalAd: String;
begin
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  Result := FfMalAd.AsString;
end;

function TTableMamulBaslik.GetMaliyet1: Double;
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('STKKRT_MALIYET1');
  Result := FfMaliyet1.AsFloat;
end;

function TTableMamulBaslik.GetMaliyet2: Double;
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('STKKRT_MALIYET2');
  Result := FfMaliyet2.AsFloat;
end;

function TTableMamulBaslik.GetMaliyet3: Double;
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('STKKRT_MALIYET3');
  Result := FfMaliyet3.AsFloat;
end;

function TTableMamulBaslik.GetSurumNo: Integer;
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  Result := FfSurumNo.AsInteger;
end;

function TTableMamulBaslik.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableMamulBaslik.GetfAciklama1: TField;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1;
end;

function TTableMamulBaslik.GetfAciklama2: TField;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2;
end;

function TTableMamulBaslik.GetfAciklama3: TField;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3;
end;

function TTableMamulBaslik.GetfAciklama4: TField;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4;
end;

function TTableMamulBaslik.GetfAciklama5: TField;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5;
end;

function TTableMamulBaslik.GetfBirim: TField;
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  Result := FfBirim;
end;

function TTableMamulBaslik.GetfBKod1: TField;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1;
end;

function TTableMamulBaslik.GetfBKod2: TField;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2;
end;

function TTableMamulBaslik.GetfBKod3: TField;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3;
end;

function TTableMamulBaslik.GetfBKod4: TField;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4;
end;

function TTableMamulBaslik.GetfBKod5: TField;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5;
end;

function TTableMamulBaslik.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableMamulBaslik.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableMamulBaslik.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableMamulBaslik.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableMamulBaslik.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableMamulBaslik.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableMamulBaslik.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableMamulBaslik.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableMamulBaslik.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableMamulBaslik.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableMamulBaslik.GetfHammaddeDepoKod: TField;
begin
  if FfHammaddeDepoKod = nil then
    FfHammaddeDepoKod := FindField('HAMMADDEDEPOKOD');
  Result := FfHammaddeDepoKod;
end;

function TTableMamulBaslik.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMamulBaslik.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableMamulBaslik.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableMamulBaslik.GetfKullanimKod: TField;
begin
  if FfKullanimKod = nil then
    FfKullanimKod := FindField('KULLANIMKOD');
  Result := FfKullanimKod;
end;

function TTableMamulBaslik.GetfKullanimSekli: TField;
begin
  if FfKullanimSekli = nil then
    FfKullanimSekli := FindField('KULLANIMSEKLI');
  Result := FfKullanimSekli;
end;

function TTableMamulBaslik.GetfKurulumKod1: TField;
begin
  if FfKurulumKod1 = nil then
    FfKurulumKod1 := FindField('KURULUMKOD1');
  Result := FfKurulumKod1;
end;

function TTableMamulBaslik.GetfKurulumKod2: TField;
begin
  if FfKurulumKod2 = nil then
    FfKurulumKod2 := FindField('KURULUMKOD2');
  Result := FfKurulumKod2;
end;

function TTableMamulBaslik.GetfKurulumKod3: TField;
begin
  if FfKurulumKod3 = nil then
    FfKurulumKod3 := FindField('KURULUMKOD3');
  Result := FfKurulumKod3;
end;

function TTableMamulBaslik.GetfKurulumKod4: TField;
begin
  if FfKurulumKod4 = nil then
    FfKurulumKod4 := FindField('KURULUMKOD4');
  Result := FfKurulumKod4;
end;

function TTableMamulBaslik.GetfKurulumKod5: TField;
begin
  if FfKurulumKod5 = nil then
    FfKurulumKod5 := FindField('KURULUMKOD5');
  Result := FfKurulumKod5;
end;

function TTableMamulBaslik.GetfKurulumKod6: TField;
begin
  if FfKurulumKod6 = nil then
    FfKurulumKod6 := FindField('KURULUMKOD6');
  Result := FfKurulumKod6;
end;

function TTableMamulBaslik.GetfKurulumKod7: TField;
begin
  if FfKurulumKod7 = nil then
    FfKurulumKod7 := FindField('KURULUMKOD7');
  Result := FfKurulumKod7;
end;

function TTableMamulBaslik.GetfKurulumKod8: TField;
begin
  if FfKurulumKod8 = nil then
    FfKurulumKod8 := FindField('KURULUMKOD8');
  Result := FfKurulumKod8;
end;

function TTableMamulBaslik.GetfKurulumKod9: TField;
begin
  if FfKurulumKod9 = nil then
    FfKurulumKod9 := FindField('KURULUMKOD9');
  Result := FfKurulumKod9;
end;

function TTableMamulBaslik.GetfLKod1: TField;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1;
end;

function TTableMamulBaslik.GetfLKod2: TField;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2;
end;

function TTableMamulBaslik.GetfLKod3: TField;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3;
end;

function TTableMamulBaslik.GetfLKod4: TField;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4;
end;

function TTableMamulBaslik.GetfLKod5: TField;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5;
end;

function TTableMamulBaslik.GetfKodBakim: TField;
begin
  if FfKodBakim = nil then
    FfKodBakim := FindField('MAMKUK_KODBAKIM');
  Result := FfKodBakim;
end;

function TTableMamulBaslik.GetfKodDizayn: TField;
begin
  if FfKodDizayn = nil then
    FfKodDizayn := FindField('MAMKUK_KODDIZAYN');
  Result := FfKodDizayn;
end;

function TTableMamulBaslik.GetfKodMaliyet: TField;
begin
  if FfKodMaliyet = nil then
    FfKodMaliyet := FindField('MAMKUK_KODMALIYET');
  Result := FfKodMaliyet;
end;

function TTableMamulBaslik.GetfKodSatis: TField;
begin
  if FfKodSatis = nil then
    FfKodSatis := FindField('MAMKUK_KODSATIS');
  Result := FfKodSatis;
end;

function TTableMamulBaslik.GetfKodUretim: TField;
begin
  if FfKodUretim = nil then
    FfKodUretim := FindField('MAMKUK_KODURETIM');
  Result := FfKodUretim;
end;

function TTableMamulBaslik.GetfKodYedekParca: TField;
begin
  if FfKodYedekParca = nil then
    FfKodYedekParca := FindField('MAMKUK_KODYEDEKPARCA');
  Result := FfKodYedekParca;
end;

function TTableMamulBaslik.GetfMamulDepokod: TField;
begin
  if FfMamulDepokod = nil then
    FfMamulDepokod := FindField('MAMULDEPOKOD');
  Result := FfMamulDepokod;
end;

function TTableMamulBaslik.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableMamulBaslik.GetfMKod1: TField;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1;
end;

function TTableMamulBaslik.GetfMKod2: TField;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2;
end;

function TTableMamulBaslik.GetfMKod3: TField;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3;
end;

function TTableMamulBaslik.GetfMKod4: TField;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4;
end;

function TTableMamulBaslik.GetfMKod5: TField;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5;
end;

function TTableMamulBaslik.GetfNKod1: TField;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1;
end;

function TTableMamulBaslik.GetfNKod2: TField;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2;
end;

function TTableMamulBaslik.GetfNKod3: TField;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3;
end;

function TTableMamulBaslik.GetfNKod4: TField;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4;
end;

function TTableMamulBaslik.GetfNKod5: TField;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5;
end;

function TTableMamulBaslik.GetfReceteNo: TField;
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  Result := FfReceteNo;
end;

function TTableMamulBaslik.GetfRotaTip: TField;
begin
  if FfRotaTip = nil then
    FfRotaTip := FindField('ROTATIP');
  Result := FfRotaTip;
end;

function TTableMamulBaslik.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMamulBaslik.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableMamulBaslik.GetfSKod1: TField;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1;
end;

function TTableMamulBaslik.GetfSKod2: TField;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2;
end;

function TTableMamulBaslik.GetfSKod3: TField;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3;
end;

function TTableMamulBaslik.GetfSKod4: TField;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4;
end;

function TTableMamulBaslik.GetfSKod5: TField;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5;
end;

function TTableMamulBaslik.GetfSokumKod1: TField;
begin
  if FfSokumKod1 = nil then
    FfSokumKod1 := FindField('SOKUMKOD1');
  Result := FfSokumKod1;
end;

function TTableMamulBaslik.GetfSokumKod2: TField;
begin
  if FfSokumKod2 = nil then
    FfSokumKod2 := FindField('SOKUMKOD2');
  Result := FfSokumKod2;
end;

function TTableMamulBaslik.GetfKullanilabilir: TField;
begin
  if FfKullanilabilir = nil then
    FfKullanilabilir := FindField('STKDRM_KULLANILABILIR');
  Result := FfKullanilabilir;
end;

function TTableMamulBaslik.GetfStokCikis: TField;
begin
  if FfStokCikis = nil then
    FfStokCikis := FindField('STKDRM_STOKCIKIS');
  Result := FfStokCikis;
end;

function TTableMamulBaslik.GetfStokGiris: TField;
begin
  if FfStokGiris = nil then
    FfStokGiris := FindField('STKDRM_STOKGIRIS');
  Result := FfStokGiris;
end;

function TTableMamulBaslik.GetfStokMiktar: TField;
begin
  if FfStokMiktar = nil then
    FfStokMiktar := FindField('STKDRM_STOKMIKTAR');
  Result := FfStokMiktar;
end;

function TTableMamulBaslik.GetfDovizCins: TField;
begin
  if FfDovizCins = nil then
    FfDovizCins := FindField('STKKRT_DOVIZCINS');
  Result := FfDovizCins;
end;

function TTableMamulBaslik.GetfMalAd: TField;
begin
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  Result := FfMalAd;
end;

function TTableMamulBaslik.GetfMaliyet1: TField;
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('STKKRT_MALIYET1');
  Result := FfMaliyet1;
end;

function TTableMamulBaslik.GetfMaliyet2: TField;
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('STKKRT_MALIYET2');
  Result := FfMaliyet2;
end;

function TTableMamulBaslik.GetfMaliyet3: TField;
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('STKKRT_MALIYET3');
  Result := FfMaliyet3;
end;

function TTableMamulBaslik.GetfSurumNo: TField;
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  Result := FfSurumNo;
end;

function TTableMamulBaslik.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableMamulBaslik.SetAciklama1(const Value: String);
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  FfAciklama1.AsString := Value;
end;

procedure TTableMamulBaslik.SetAciklama2(const Value: String);
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  FfAciklama2.AsString := Value;
end;

procedure TTableMamulBaslik.SetAciklama3(const Value: String);
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  FfAciklama3.AsString := Value;
end;

procedure TTableMamulBaslik.SetAciklama4(const Value: String);
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  FfAciklama4.AsString := Value;
end;

procedure TTableMamulBaslik.SetAciklama5(const Value: String);
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  FfAciklama5.AsString := Value;
end;

procedure TTableMamulBaslik.SetBirim(const Value: String);
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  FfBirim.AsString := Value;
end;

procedure TTableMamulBaslik.SetBKod1(const Value: Integer);
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  FfBKod1.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetBKod2(const Value: Integer);
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  FfBKod2.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetBKod3(const Value: Integer);
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  FfBKod3.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetBKod4(const Value: Integer);
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  FfBKod4.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetBKod5(const Value: Integer);
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  FfBKod5.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableMamulBaslik.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableMamulBaslik.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableMamulBaslik.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableMamulBaslik.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableMamulBaslik.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableMamulBaslik.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableMamulBaslik.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableMamulBaslik.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableMamulBaslik.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableMamulBaslik.SetHammaddeDepoKod(const Value: String);
begin
  if FfHammaddeDepoKod = nil then
    FfHammaddeDepoKod := FindField('HAMMADDEDEPOKOD');
  FfHammaddeDepoKod.AsString := Value;
end;

procedure TTableMamulBaslik.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetKullanimKod(const Value: String);
begin
  if FfKullanimKod = nil then
    FfKullanimKod := FindField('KULLANIMKOD');
  FfKullanimKod.AsString := Value;
end;

procedure TTableMamulBaslik.SetKullanimSekli(const Value: Integer);
begin
  if FfKullanimSekli = nil then
    FfKullanimSekli := FindField('KULLANIMSEKLI');
  FfKullanimSekli.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetKurulumKod1(const Value: String);
begin
  if FfKurulumKod1 = nil then
    FfKurulumKod1 := FindField('KURULUMKOD1');
  FfKurulumKod1.AsString := Value;
end;

procedure TTableMamulBaslik.SetKurulumKod2(const Value: String);
begin
  if FfKurulumKod2 = nil then
    FfKurulumKod2 := FindField('KURULUMKOD2');
  FfKurulumKod2.AsString := Value;
end;

procedure TTableMamulBaslik.SetKurulumKod3(const Value: String);
begin
  if FfKurulumKod3 = nil then
    FfKurulumKod3 := FindField('KURULUMKOD3');
  FfKurulumKod3.AsString := Value;
end;

procedure TTableMamulBaslik.SetKurulumKod4(const Value: String);
begin
  if FfKurulumKod4 = nil then
    FfKurulumKod4 := FindField('KURULUMKOD4');
  FfKurulumKod4.AsString := Value;
end;

procedure TTableMamulBaslik.SetKurulumKod5(const Value: String);
begin
  if FfKurulumKod5 = nil then
    FfKurulumKod5 := FindField('KURULUMKOD5');
  FfKurulumKod5.AsString := Value;
end;

procedure TTableMamulBaslik.SetKurulumKod6(const Value: String);
begin
  if FfKurulumKod6 = nil then
    FfKurulumKod6 := FindField('KURULUMKOD6');
  FfKurulumKod6.AsString := Value;
end;

procedure TTableMamulBaslik.SetKurulumKod7(const Value: String);
begin
  if FfKurulumKod7 = nil then
    FfKurulumKod7 := FindField('KURULUMKOD7');
  FfKurulumKod7.AsString := Value;
end;

procedure TTableMamulBaslik.SetKurulumKod8(const Value: String);
begin
  if FfKurulumKod8 = nil then
    FfKurulumKod8 := FindField('KURULUMKOD8');
  FfKurulumKod8.AsString := Value;
end;

procedure TTableMamulBaslik.SetKurulumKod9(const Value: String);
begin
  if FfKurulumKod9 = nil then
    FfKurulumKod9 := FindField('KURULUMKOD9');
  FfKurulumKod9.AsString := Value;
end;

procedure TTableMamulBaslik.SetLKod1(const Value: String);
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  FfLKod1.AsString := Value;
end;

procedure TTableMamulBaslik.SetLKod2(const Value: String);
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  FfLKod2.AsString := Value;
end;

procedure TTableMamulBaslik.SetLKod3(const Value: String);
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  FfLKod3.AsString := Value;
end;

procedure TTableMamulBaslik.SetLKod4(const Value: String);
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  FfLKod4.AsString := Value;
end;

procedure TTableMamulBaslik.SetLKod5(const Value: String);
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  FfLKod5.AsString := Value;
end;

procedure TTableMamulBaslik.SetKodBakim(const Value: Integer);
begin
  if FfKodBakim = nil then
    FfKodBakim := FindField('MAMKUK_KODBAKIM');
  FfKodBakim.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetKodDizayn(const Value: Integer);
begin
  if FfKodDizayn = nil then
    FfKodDizayn := FindField('MAMKUK_KODDIZAYN');
  FfKodDizayn.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetKodMaliyet(const Value: Integer);
begin
  if FfKodMaliyet = nil then
    FfKodMaliyet := FindField('MAMKUK_KODMALIYET');
  FfKodMaliyet.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetKodSatis(const Value: Integer);
begin
  if FfKodSatis = nil then
    FfKodSatis := FindField('MAMKUK_KODSATIS');
  FfKodSatis.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetKodUretim(const Value: Integer);
begin
  if FfKodUretim = nil then
    FfKodUretim := FindField('MAMKUK_KODURETIM');
  FfKodUretim.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetKodYedekParca(const Value: Integer);
begin
  if FfKodYedekParca = nil then
    FfKodYedekParca := FindField('MAMKUK_KODYEDEKPARCA');
  FfKodYedekParca.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetMamulDepokod(const Value: String);
begin
  if FfMamulDepokod = nil then
    FfMamulDepokod := FindField('MAMULDEPOKOD');
  FfMamulDepokod.AsString := Value;
end;

procedure TTableMamulBaslik.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableMamulBaslik.SetMKod1(const Value: String);
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  FfMKod1.AsString := Value;
end;

procedure TTableMamulBaslik.SetMKod2(const Value: String);
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  FfMKod2.AsString := Value;
end;

procedure TTableMamulBaslik.SetMKod3(const Value: String);
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  FfMKod3.AsString := Value;
end;

procedure TTableMamulBaslik.SetMKod4(const Value: String);
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  FfMKod4.AsString := Value;
end;

procedure TTableMamulBaslik.SetMKod5(const Value: String);
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  FfMKod5.AsString := Value;
end;

procedure TTableMamulBaslik.SetNKod1(const Value: Double);
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  FfNKod1.AsFloat := Value;
end;

procedure TTableMamulBaslik.SetNKod2(const Value: Double);
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  FfNKod2.AsFloat := Value;
end;

procedure TTableMamulBaslik.SetNKod3(const Value: Double);
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  FfNKod3.AsFloat := Value;
end;

procedure TTableMamulBaslik.SetNKod4(const Value: Double);
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  FfNKod4.AsFloat := Value;
end;

procedure TTableMamulBaslik.SetNKod5(const Value: Double);
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  FfNKod5.AsFloat := Value;
end;

procedure TTableMamulBaslik.SetReceteNo(const Value: String);
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  FfReceteNo.AsString := Value;
end;

procedure TTableMamulBaslik.SetRotaTip(const Value: Integer);
begin
  if FfRotaTip = nil then
    FfRotaTip := FindField('ROTATIP');
  FfRotaTip.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMamulBaslik.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableMamulBaslik.SetSKod1(const Value: String);
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  FfSKod1.AsString := Value;
end;

procedure TTableMamulBaslik.SetSKod2(const Value: String);
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  FfSKod2.AsString := Value;
end;

procedure TTableMamulBaslik.SetSKod3(const Value: String);
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  FfSKod3.AsString := Value;
end;

procedure TTableMamulBaslik.SetSKod4(const Value: String);
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  FfSKod4.AsString := Value;
end;

procedure TTableMamulBaslik.SetSKod5(const Value: String);
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  FfSKod5.AsString := Value;
end;

procedure TTableMamulBaslik.SetSokumKod1(const Value: String);
begin
  if FfSokumKod1 = nil then
    FfSokumKod1 := FindField('SOKUMKOD1');
  FfSokumKod1.AsString := Value;
end;

procedure TTableMamulBaslik.SetSokumKod2(const Value: String);
begin
  if FfSokumKod2 = nil then
    FfSokumKod2 := FindField('SOKUMKOD2');
  FfSokumKod2.AsString := Value;
end;

procedure TTableMamulBaslik.SetKullanilabilir(const Value: Double);
begin
  if FfKullanilabilir = nil then
    FfKullanilabilir := FindField('STKDRM_KULLANILABILIR');
  FfKullanilabilir.AsFloat := Value;
end;

procedure TTableMamulBaslik.SetStokCikis(const Value: Double);
begin
  if FfStokCikis = nil then
    FfStokCikis := FindField('STKDRM_STOKCIKIS');
  FfStokCikis.AsFloat := Value;
end;

procedure TTableMamulBaslik.SetStokGiris(const Value: Double);
begin
  if FfStokGiris = nil then
    FfStokGiris := FindField('STKDRM_STOKGIRIS');
  FfStokGiris.AsFloat := Value;
end;

procedure TTableMamulBaslik.SetStokMiktar(const Value: Double);
begin
  if FfStokMiktar = nil then
    FfStokMiktar := FindField('STKDRM_STOKMIKTAR');
  FfStokMiktar.AsFloat := Value;
end;

procedure TTableMamulBaslik.SetDovizCins(const Value: String);
begin
  if FfDovizCins = nil then
    FfDovizCins := FindField('STKKRT_DOVIZCINS');
  FfDovizCins.AsString := Value;
end;

procedure TTableMamulBaslik.SetMalAd(const Value: String);
begin
  if FfMalAd = nil then
    FfMalAd := FindField('STKKRT_MALAD');
  FfMalAd.AsString := Value;
end;

procedure TTableMamulBaslik.SetMaliyet1(const Value: Double);
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('STKKRT_MALIYET1');
  FfMaliyet1.AsFloat := Value;
end;

procedure TTableMamulBaslik.SetMaliyet2(const Value: Double);
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('STKKRT_MALIYET2');
  FfMaliyet2.AsFloat := Value;
end;

procedure TTableMamulBaslik.SetMaliyet3(const Value: Double);
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('STKKRT_MALIYET3');
  FfMaliyet3.AsFloat := Value;
end;

procedure TTableMamulBaslik.SetSurumNo(const Value: Integer);
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  FfSurumNo.AsInteger := Value;
end;

procedure TTableMamulBaslik.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableMamulKart }

constructor TTableMamulKart.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MAMKRT';
end;

procedure TTableMamulKart.DoAfterOpen;
begin
  if FfKeyID = nil then
    FfKeyID := FindField('_KEYID');
  if FfKeyParentID = nil then
    FfKeyParentID := FindField('_KEYPARENTID');
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('_URETIMMIKTAR');
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
  if FfBilesenFireOran = nil then
    FfBilesenFireOran := FindField('BILESENFIREORAN');
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
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
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
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
  if FfHammaddeBirim = nil then
    FfHammaddeBirim := FindField('HAMMADDEBIRIM');
  if FfHammaddeKod = nil then
    FfHammaddeKod := FindField('HAMMADDEKOD');
  if FfHammaddeKullanimSekli = nil then
    FfHammaddeKullanimSekli := FindField('HAMMADDEKULLANIMSEKLI');
  if FfHammaddeSurumNo = nil then
    FfHammaddeSurumNo := FindField('HAMMADDESURUMNO');
  if FfHammaddeVersiyonNo = nil then
    FfHammaddeVersiyonNo := FindField('HAMMADDEVERSIYONNO');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKaynakIslemNo = nil then
    FfKaynakIslemNo := FindField('KAYNAKISLEMNO');
  if FfKodBakim = nil then
    FfKodBakim := FindField('KODBAKIM');
  if FfKodDizayn = nil then
    FfKodDizayn := FindField('KODDIZAYN');
  if FfKodMaliyet = nil then
    FfKodMaliyet := FindField('KODMALIYET');
  if FfKodSatis = nil then
    FfKodSatis := FindField('KODSATIS');
  if FfKodUretim = nil then
    FfKodUretim := FindField('KODURETIM');
  if FfKodYedekParca = nil then
    FfKodYedekParca := FindField('KODYEDEKPARCA');
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
  if FfMamulBirim = nil then
    FfMamulBirim := FindField('MAMBAS_BIRIM');
  if FfMamulHammaddeDepoKod = nil then
    FfMamulHammaddeDepoKod := FindField('MAMBAS_HAMMADDEDEPOKOD');
  if FfMamulKullanimSekli = nil then
    FfMamulKullanimSekli := FindField('MAMBAS_KULLANIMSEKLI');
  if FfMamulDepoKod = nil then
    FfMamulDepoKod := FindField('MAMBAS_MAMULDEPOKOD');
  if FfMamulMalKod = nil then
    FfMamulMalKod := FindField('MAMBAS_MAMULKOD');
  if FfMamulStokBirimKatsayi = nil then
    FfMamulStokBirimKatsayi := FindField('MAMBRM_KATSAYI');
  if FfMamulStokKartBirim = nil then
    FfMamulStokKartBirim := FindField('MAMSTK_BIRIM');
  if FfMamulStokKartMontajFireOran = nil then
    FfMamulStokKartMontajFireOran := FindField('MAMSTK_MONTAJFIREORAN');
  if FfMamulStokKartYuvarlama = nil then
    FfMamulStokKartYuvarlama := FindField('MAMSTK_YUVARLAMA');
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
  if FfNKod6 = nil then
    FfNKod6 := FindField('NKOD6');
  if FfNKod7 = nil then
    FfNKod7 := FindField('NKOD7');
  if FfNKod8 = nil then
    FfNKod8 := FindField('NKOD8');
  if FfNKod9 = nil then
    FfNKod9 := FindField('NKOD9');
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
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
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
  if FfHammaddeStokBirimKatsayi = nil then
    FfHammaddeStokBirimKatsayi := FindField('STKBRM_KATSAYI');
  if FfKullanilabilir = nil then
    FfKullanilabilir := FindField('STKDRM_KULLANILABILIR');
  if FfStokCikis = nil then
    FfStokCikis := FindField('STKDRM_STOKCIKIS');
  if FfStokGiris = nil then
    FfStokGiris := FindField('STKDRM_STOKGIRIS');
  if FfStokMiktar = nil then
    FfStokMiktar := FindField('STKDRM_STOKMIKTAR');
  if FfHammaddeStokKartBilesenFireOran = nil then
    FfHammaddeStokKartBilesenFireOran := FindField('STKKRT_BILESENFIREORAN');
  if FfHammaddeStokKartBirim = nil then
    FfHammaddeStokKartBirim := FindField('STKKRT_BIRIM');
  if FfHammaddeStokKartDovizCins = nil then
    FfHammaddeStokKartDovizCins := FindField('STKKRT_DOVIZCINS');
  if FfHammaddeStokKartMaliyetGrupNo = nil then
    FfHammaddeStokKartMaliyetGrupNo := FindField('STKKRT_GRUPNO');
  if FfHammaddeAd = nil then
    FfHammaddeAd := FindField('STKKRT_MALAD');
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('STKKRT_MALIYET1');
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('STKKRT_MALIYET2');
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('STKKRT_MALIYET3');
  if FfHammaddeStokKartMRPTip = nil then
    FfHammaddeStokKartMRPTip := FindField('STKKRT_MRPTIP');
  if FfHammaddeStokKartTeminTip = nil then
    FfHammaddeStokKartTeminTip := FindField('STKKRT_TEMINTIP');
  if FfHammaddeStokKartTeminYontem = nil then
    FfHammaddeStokKartTeminYontem := FindField('STKKRT_TEMINYONTEM');
  if FfHammaddeStokKartYuvarlama = nil then
    FfHammaddeStokKartYuvarlama := FindField('STKKRT_YUVARLAMA');
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  if FfYanUrunMaliyetOran = nil then
    FfYanUrunMaliyetOran := FindField('YANURUNMALIYETORAN');
  if FfYanUrunMaliyetTip = nil then
    FfYanUrunMaliyetTip := FindField('YANURUNMALIYETTIP');
  if FfYanUrunMiktar = nil then
    FfYanUrunMiktar := FindField('YANURUNMIKTAR');
  if FfYanUrunNo = nil then
    FfYanUrunNo := FindField('YANURUNNO');
  inherited;
end;

procedure TTableMamulKart.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfKeyID := nil;
    FfKeyParentID := nil;
    FfUretimMiktar := nil;
    FfAciklama1 := nil;
    FfAciklama2 := nil;
    FfAciklama3 := nil;
    FfAciklama4 := nil;
    FfAciklama5 := nil;
    FfBasTarih := nil;
    FfBilesenFireOran := nil;
    FfBitTarih := nil;
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
    FfDepoKod := nil;
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfHammaddeBirim := nil;
    FfHammaddeKod := nil;
    FfHammaddeKullanimSekli := nil;
    FfHammaddeSurumNo := nil;
    FfHammaddeVersiyonNo := nil;
    FfID := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKaynakIslemNo := nil;
    FfKodBakim := nil;
    FfKodDizayn := nil;
    FfKodMaliyet := nil;
    FfKodSatis := nil;
    FfKodUretim := nil;
    FfKodYedekParca := nil;
    FfLKod1 := nil;
    FfLKod2 := nil;
    FfLKod3 := nil;
    FfLKod4 := nil;
    FfLKod5 := nil;
    FfMamulBirim := nil;
    FfMamulHammaddeDepoKod := nil;
    FfMamulKullanimSekli := nil;
    FfMamulDepoKod := nil;
    FfMamulMalKod := nil;
    FfMamulStokBirimKatsayi := nil;
    FfMamulStokKartBirim := nil;
    FfMamulStokKartMontajFireOran := nil;
    FfMamulStokKartYuvarlama := nil;
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
    FfNKod6 := nil;
    FfNKod7 := nil;
    FfNKod8 := nil;
    FfNKod9 := nil;
    FfOperasyonFireKullan := nil;
    FfOperasyonFireMiktar := nil;
    FfOperasyonFireOran := nil;
    FfOperasyonNo := nil;
    FfPozNo := nil;
    FfReceteNo := nil;
    FfRevizyonNo := nil;
    FfRowGuid := nil;
    FfSiraNo := nil;
    FfSirketNo := nil;
    FfSKod1 := nil;
    FfSKod2 := nil;
    FfSKod3 := nil;
    FfSKod4 := nil;
    FfSKod5 := nil;
    FfHammaddeStokBirimKatsayi := nil;
    FfKullanilabilir := nil;
    FfStokCikis := nil;
    FfStokGiris := nil;
    FfStokMiktar := nil;
    FfHammaddeStokKartBilesenFireOran := nil;
    FfHammaddeStokKartBirim := nil;
    FfHammaddeStokKartDovizCins := nil;
    FfHammaddeStokKartMaliyetGrupNo := nil;
    FfHammaddeAd := nil;
    FfMaliyet1 := nil;
    FfMaliyet2 := nil;
    FfMaliyet3 := nil;
    FfHammaddeStokKartMRPTip := nil;
    FfHammaddeStokKartTeminTip := nil;
    FfHammaddeStokKartTeminYontem := nil;
    FfHammaddeStokKartYuvarlama := nil;
    FfSurumNo := nil;
    FfVersiyonNo := nil;
    FfYanUrunMaliyetOran := nil;
    FfYanUrunMaliyetTip := nil;
    FfYanUrunMiktar := nil;
    FfYanUrunNo := nil;
  end;
  inherited;
end;

function TTableMamulKart.GetKeyID: Integer;
begin
  if FfKeyID = nil then
    FfKeyID := FindField('_KEYID');
  Result := FfKeyID.AsInteger;
end;

function TTableMamulKart.GetKeyParentID: Integer;
begin
  if FfKeyParentID = nil then
    FfKeyParentID := FindField('_KEYPARENTID');
  Result := FfKeyParentID.AsInteger;
end;

function TTableMamulKart.GetUretimMiktar: Double;
begin
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('_URETIMMIKTAR');
  Result := FfUretimMiktar.AsFloat;
end;

function TTableMamulKart.GetAciklama1: String;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1.AsString;
end;

function TTableMamulKart.GetAciklama2: String;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2.AsString;
end;

function TTableMamulKart.GetAciklama3: String;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3.AsString;
end;

function TTableMamulKart.GetAciklama4: String;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4.AsString;
end;

function TTableMamulKart.GetAciklama5: String;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5.AsString;
end;

function TTableMamulKart.GetBasTarih: TDate;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih.AsDateTime;
end;

function TTableMamulKart.GetBilesenFireOran: Double;
begin
  if FfBilesenFireOran = nil then
    FfBilesenFireOran := FindField('BILESENFIREORAN');
  Result := FfBilesenFireOran.AsFloat;
end;

function TTableMamulKart.GetBitTarih: TDate;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih.AsDateTime;
end;

function TTableMamulKart.GetBKod1: Integer;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1.AsInteger;
end;

function TTableMamulKart.GetBKod2: Integer;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2.AsInteger;
end;

function TTableMamulKart.GetBKod3: Integer;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3.AsInteger;
end;

function TTableMamulKart.GetBKod4: Integer;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4.AsInteger;
end;

function TTableMamulKart.GetBKod5: Integer;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5.AsInteger;
end;

function TTableMamulKart.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableMamulKart.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableMamulKart.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableMamulKart.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableMamulKart.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableMamulKart.GetDepoKod: String;
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  Result := FfDepoKod.AsString;
end;

function TTableMamulKart.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableMamulKart.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableMamulKart.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableMamulKart.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableMamulKart.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableMamulKart.GetHammaddeBirim: String;
begin
  if FfHammaddeBirim = nil then
    FfHammaddeBirim := FindField('HAMMADDEBIRIM');
  Result := FfHammaddeBirim.AsString;
end;

function TTableMamulKart.GetHammaddeKod: String;
begin
  if FfHammaddeKod = nil then
    FfHammaddeKod := FindField('HAMMADDEKOD');
  Result := FfHammaddeKod.AsString;
end;

function TTableMamulKart.GetHammaddeKullanimSekli: Integer;
begin
  if FfHammaddeKullanimSekli = nil then
    FfHammaddeKullanimSekli := FindField('HAMMADDEKULLANIMSEKLI');
  Result := FfHammaddeKullanimSekli.AsInteger;
end;

function TTableMamulKart.GetHammaddeSurumNo: Integer;
begin
  if FfHammaddeSurumNo = nil then
    FfHammaddeSurumNo := FindField('HAMMADDESURUMNO');
  Result := FfHammaddeSurumNo.AsInteger;
end;

function TTableMamulKart.GetHammaddeVersiyonNo: String;
begin
  if FfHammaddeVersiyonNo = nil then
    FfHammaddeVersiyonNo := FindField('HAMMADDEVERSIYONNO');
  Result := FfHammaddeVersiyonNo.AsString;
end;

function TTableMamulKart.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMamulKart.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableMamulKart.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableMamulKart.GetKaynakIslemNo: Integer;
begin
  if FfKaynakIslemNo = nil then
    FfKaynakIslemNo := FindField('KAYNAKISLEMNO');
  Result := FfKaynakIslemNo.AsInteger;
end;

function TTableMamulKart.GetKodBakim: Integer;
begin
  if FfKodBakim = nil then
    FfKodBakim := FindField('KODBAKIM');
  Result := FfKodBakim.AsInteger;
end;

function TTableMamulKart.GetKodDizayn: Integer;
begin
  if FfKodDizayn = nil then
    FfKodDizayn := FindField('KODDIZAYN');
  Result := FfKodDizayn.AsInteger;
end;

function TTableMamulKart.GetKodMaliyet: Integer;
begin
  if FfKodMaliyet = nil then
    FfKodMaliyet := FindField('KODMALIYET');
  Result := FfKodMaliyet.AsInteger;
end;

function TTableMamulKart.GetKodSatis: Integer;
begin
  if FfKodSatis = nil then
    FfKodSatis := FindField('KODSATIS');
  Result := FfKodSatis.AsInteger;
end;

function TTableMamulKart.GetKodUretim: Integer;
begin
  if FfKodUretim = nil then
    FfKodUretim := FindField('KODURETIM');
  Result := FfKodUretim.AsInteger;
end;

function TTableMamulKart.GetKodYedekParca: Integer;
begin
  if FfKodYedekParca = nil then
    FfKodYedekParca := FindField('KODYEDEKPARCA');
  Result := FfKodYedekParca.AsInteger;
end;

function TTableMamulKart.GetLKod1: String;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1.AsString;
end;

function TTableMamulKart.GetLKod2: String;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2.AsString;
end;

function TTableMamulKart.GetLKod3: String;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3.AsString;
end;

function TTableMamulKart.GetLKod4: String;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4.AsString;
end;

function TTableMamulKart.GetLKod5: String;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5.AsString;
end;

function TTableMamulKart.GetMamulBirim: String;
begin
  if FfMamulBirim = nil then
    FfMamulBirim := FindField('MAMBAS_BIRIM');
  Result := FfMamulBirim.AsString;
end;

function TTableMamulKart.GetMamulHammaddeDepoKod: String;
begin
  if FfMamulHammaddeDepoKod = nil then
    FfMamulHammaddeDepoKod := FindField('MAMBAS_HAMMADDEDEPOKOD');
  Result := FfMamulHammaddeDepoKod.AsString;
end;

function TTableMamulKart.GetMamulKullanimSekli: Integer;
begin
  if FfMamulKullanimSekli = nil then
    FfMamulKullanimSekli := FindField('MAMBAS_KULLANIMSEKLI');
  Result := FfMamulKullanimSekli.AsInteger;
end;

function TTableMamulKart.GetMamulDepoKod: String;
begin
  if FfMamulDepoKod = nil then
    FfMamulDepoKod := FindField('MAMBAS_MAMULDEPOKOD');
  Result := FfMamulDepoKod.AsString;
end;

function TTableMamulKart.GetMamulMalKod: String;
begin
  if FfMamulMalKod = nil then
    FfMamulMalKod := FindField('MAMBAS_MAMULKOD');
  Result := FfMamulMalKod.AsString;
end;

function TTableMamulKart.GetMamulStokBirimKatsayi: Double;
begin
  if FfMamulStokBirimKatsayi = nil then
    FfMamulStokBirimKatsayi := FindField('MAMBRM_KATSAYI');
  Result := FfMamulStokBirimKatsayi.AsFloat;
end;

function TTableMamulKart.GetMamulStokKartBirim: String;
begin
  if FfMamulStokKartBirim = nil then
    FfMamulStokKartBirim := FindField('MAMSTK_BIRIM');
  Result := FfMamulStokKartBirim.AsString;
end;

function TTableMamulKart.GetMamulStokKartMontajFireOran: Double;
begin
  if FfMamulStokKartMontajFireOran = nil then
    FfMamulStokKartMontajFireOran := FindField('MAMSTK_MONTAJFIREORAN');
  Result := FfMamulStokKartMontajFireOran.AsFloat;
end;

function TTableMamulKart.GetMamulStokKartYuvarlama: Integer;
begin
  if FfMamulStokKartYuvarlama = nil then
    FfMamulStokKartYuvarlama := FindField('MAMSTK_YUVARLAMA');
  Result := FfMamulStokKartYuvarlama.AsInteger;
end;

function TTableMamulKart.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableMamulKart.GetMiktar: Double;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar.AsFloat;
end;

function TTableMamulKart.GetMiktarTip: Integer;
begin
  if FfMiktarTip = nil then
    FfMiktarTip := FindField('MIKTARTIP');
  Result := FfMiktarTip.AsInteger;
end;

function TTableMamulKart.GetMKod1: String;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1.AsString;
end;

function TTableMamulKart.GetMKod2: String;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2.AsString;
end;

function TTableMamulKart.GetMKod3: String;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3.AsString;
end;

function TTableMamulKart.GetMKod4: String;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4.AsString;
end;

function TTableMamulKart.GetMKod5: String;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5.AsString;
end;

function TTableMamulKart.GetNKod1: Double;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1.AsFloat;
end;

function TTableMamulKart.GetNKod2: Double;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2.AsFloat;
end;

function TTableMamulKart.GetNKod3: Double;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3.AsFloat;
end;

function TTableMamulKart.GetNKod4: Double;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4.AsFloat;
end;

function TTableMamulKart.GetNKod5: Double;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5.AsFloat;
end;

function TTableMamulKart.GetNKod6: Double;
begin
  if FfNKod6 = nil then
    FfNKod6 := FindField('NKOD6');
  Result := FfNKod6.AsFloat;
end;

function TTableMamulKart.GetNKod7: Double;
begin
  if FfNKod7 = nil then
    FfNKod7 := FindField('NKOD7');
  Result := FfNKod7.AsFloat;
end;

function TTableMamulKart.GetNKod8: Double;
begin
  if FfNKod8 = nil then
    FfNKod8 := FindField('NKOD8');
  Result := FfNKod8.AsFloat;
end;

function TTableMamulKart.GetNKod9: Double;
begin
  if FfNKod9 = nil then
    FfNKod9 := FindField('NKOD9');
  Result := FfNKod9.AsFloat;
end;

function TTableMamulKart.GetOperasyonFireKullan: Integer;
begin
  if FfOperasyonFireKullan = nil then
    FfOperasyonFireKullan := FindField('OPERASYONFIREKULLAN');
  Result := FfOperasyonFireKullan.AsInteger;
end;

function TTableMamulKart.GetOperasyonFireMiktar: Double;
begin
  if FfOperasyonFireMiktar = nil then
    FfOperasyonFireMiktar := FindField('OPERASYONFIREMIKTAR');
  Result := FfOperasyonFireMiktar.AsFloat;
end;

function TTableMamulKart.GetOperasyonFireOran: Double;
begin
  if FfOperasyonFireOran = nil then
    FfOperasyonFireOran := FindField('OPERASYONFIREORAN');
  Result := FfOperasyonFireOran.AsFloat;
end;

function TTableMamulKart.GetOperasyonNo: Integer;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo.AsInteger;
end;

function TTableMamulKart.GetPozNo: String;
begin
  if FfPozNo = nil then
    FfPozNo := FindField('POZNO');
  Result := FfPozNo.AsString;
end;

function TTableMamulKart.GetReceteNo: String;
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  Result := FfReceteNo.AsString;
end;

function TTableMamulKart.GetRevizyonNo: String;
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  Result := FfRevizyonNo.AsString;
end;

function TTableMamulKart.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMamulKart.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableMamulKart.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMamulKart.GetSKod1: String;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1.AsString;
end;

function TTableMamulKart.GetSKod2: String;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2.AsString;
end;

function TTableMamulKart.GetSKod3: String;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3.AsString;
end;

function TTableMamulKart.GetSKod4: String;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4.AsString;
end;

function TTableMamulKart.GetSKod5: String;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5.AsString;
end;

function TTableMamulKart.GetHammaddeStokBirimKatsayi: Double;
begin
  if FfHammaddeStokBirimKatsayi = nil then
    FfHammaddeStokBirimKatsayi := FindField('STKBRM_KATSAYI');
  Result := FfHammaddeStokBirimKatsayi.AsFloat;
end;

function TTableMamulKart.GetKullanilabilir: Double;
begin
  if FfKullanilabilir = nil then
    FfKullanilabilir := FindField('STKDRM_KULLANILABILIR');
  Result := FfKullanilabilir.AsFloat;
end;

function TTableMamulKart.GetStokCikis: Double;
begin
  if FfStokCikis = nil then
    FfStokCikis := FindField('STKDRM_STOKCIKIS');
  Result := FfStokCikis.AsFloat;
end;

function TTableMamulKart.GetStokGiris: Double;
begin
  if FfStokGiris = nil then
    FfStokGiris := FindField('STKDRM_STOKGIRIS');
  Result := FfStokGiris.AsFloat;
end;

function TTableMamulKart.GetStokMiktar: Double;
begin
  if FfStokMiktar = nil then
    FfStokMiktar := FindField('STKDRM_STOKMIKTAR');
  Result := FfStokMiktar.AsFloat;
end;

function TTableMamulKart.GetHammaddeStokKartBilesenFireOran: Double;
begin
  if FfHammaddeStokKartBilesenFireOran = nil then
    FfHammaddeStokKartBilesenFireOran := FindField('STKKRT_BILESENFIREORAN');
  Result := FfHammaddeStokKartBilesenFireOran.AsFloat;
end;

function TTableMamulKart.GetHammaddeStokKartBirim: String;
begin
  if FfHammaddeStokKartBirim = nil then
    FfHammaddeStokKartBirim := FindField('STKKRT_BIRIM');
  Result := FfHammaddeStokKartBirim.AsString;
end;

function TTableMamulKart.GetHammaddeStokKartDovizCins: String;
begin
  if FfHammaddeStokKartDovizCins = nil then
    FfHammaddeStokKartDovizCins := FindField('STKKRT_DOVIZCINS');
  Result := FfHammaddeStokKartDovizCins.AsString;
end;

function TTableMamulKart.GetHammaddeStokKartMaliyetGrupNo: Integer;
begin
  if FfHammaddeStokKartMaliyetGrupNo = nil then
    FfHammaddeStokKartMaliyetGrupNo := FindField('STKKRT_GRUPNO');
  Result := FfHammaddeStokKartMaliyetGrupNo.AsInteger;
end;

function TTableMamulKart.GetHammaddeAd: String;
begin
  if FfHammaddeAd = nil then
    FfHammaddeAd := FindField('STKKRT_MALAD');
  Result := FfHammaddeAd.AsString;
end;

function TTableMamulKart.GetMaliyet1: Double;
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('STKKRT_MALIYET1');
  Result := FfMaliyet1.AsFloat;
end;

function TTableMamulKart.GetMaliyet2: Double;
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('STKKRT_MALIYET2');
  Result := FfMaliyet2.AsFloat;
end;

function TTableMamulKart.GetMaliyet3: Double;
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('STKKRT_MALIYET3');
  Result := FfMaliyet3.AsFloat;
end;

function TTableMamulKart.GetHammaddeStokKartMRPTip: Integer;
begin
  if FfHammaddeStokKartMRPTip = nil then
    FfHammaddeStokKartMRPTip := FindField('STKKRT_MRPTIP');
  Result := FfHammaddeStokKartMRPTip.AsInteger;
end;

function TTableMamulKart.GetHammaddeStokKartTeminTip: Integer;
begin
  if FfHammaddeStokKartTeminTip = nil then
    FfHammaddeStokKartTeminTip := FindField('STKKRT_TEMINTIP');
  Result := FfHammaddeStokKartTeminTip.AsInteger;
end;

function TTableMamulKart.GetHammaddeStokKartTeminYontem: Integer;
begin
  if FfHammaddeStokKartTeminYontem = nil then
    FfHammaddeStokKartTeminYontem := FindField('STKKRT_TEMINYONTEM');
  Result := FfHammaddeStokKartTeminYontem.AsInteger;
end;

function TTableMamulKart.GetHammaddeStokKartYuvarlama: Integer;
begin
  if FfHammaddeStokKartYuvarlama = nil then
    FfHammaddeStokKartYuvarlama := FindField('STKKRT_YUVARLAMA');
  Result := FfHammaddeStokKartYuvarlama.AsInteger;
end;

function TTableMamulKart.GetSurumNo: Integer;
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  Result := FfSurumNo.AsInteger;
end;

function TTableMamulKart.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableMamulKart.GetYanUrunMaliyetOran: Double;
begin
  if FfYanUrunMaliyetOran = nil then
    FfYanUrunMaliyetOran := FindField('YANURUNMALIYETORAN');
  Result := FfYanUrunMaliyetOran.AsFloat;
end;

function TTableMamulKart.GetYanUrunMaliyetTip: Integer;
begin
  if FfYanUrunMaliyetTip = nil then
    FfYanUrunMaliyetTip := FindField('YANURUNMALIYETTIP');
  Result := FfYanUrunMaliyetTip.AsInteger;
end;

function TTableMamulKart.GetYanUrunMiktar: Double;
begin
  if FfYanUrunMiktar = nil then
    FfYanUrunMiktar := FindField('YANURUNMIKTAR');
  Result := FfYanUrunMiktar.AsFloat;
end;

function TTableMamulKart.GetYanUrunNo: Integer;
begin
  if FfYanUrunNo = nil then
    FfYanUrunNo := FindField('YANURUNNO');
  Result := FfYanUrunNo.AsInteger;
end;

function TTableMamulKart.GetfKeyID: TField;
begin
  if FfKeyID = nil then
    FfKeyID := FindField('_KEYID');
  Result := FfKeyID;
end;

function TTableMamulKart.GetfKeyParentID: TField;
begin
  if FfKeyParentID = nil then
    FfKeyParentID := FindField('_KEYPARENTID');
  Result := FfKeyParentID;
end;

function TTableMamulKart.GetfUretimMiktar: TField;
begin
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('_URETIMMIKTAR');
  Result := FfUretimMiktar;
end;

function TTableMamulKart.GetfAciklama1: TField;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1;
end;

function TTableMamulKart.GetfAciklama2: TField;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2;
end;

function TTableMamulKart.GetfAciklama3: TField;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3;
end;

function TTableMamulKart.GetfAciklama4: TField;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4;
end;

function TTableMamulKart.GetfAciklama5: TField;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5;
end;

function TTableMamulKart.GetfBasTarih: TField;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih;
end;

function TTableMamulKart.GetfBilesenFireOran: TField;
begin
  if FfBilesenFireOran = nil then
    FfBilesenFireOran := FindField('BILESENFIREORAN');
  Result := FfBilesenFireOran;
end;

function TTableMamulKart.GetfBitTarih: TField;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih;
end;

function TTableMamulKart.GetfBKod1: TField;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1;
end;

function TTableMamulKart.GetfBKod2: TField;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2;
end;

function TTableMamulKart.GetfBKod3: TField;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3;
end;

function TTableMamulKart.GetfBKod4: TField;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4;
end;

function TTableMamulKart.GetfBKod5: TField;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5;
end;

function TTableMamulKart.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableMamulKart.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableMamulKart.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableMamulKart.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableMamulKart.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableMamulKart.GetfDepoKod: TField;
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  Result := FfDepoKod;
end;

function TTableMamulKart.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableMamulKart.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableMamulKart.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableMamulKart.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableMamulKart.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableMamulKart.GetfHammaddeBirim: TField;
begin
  if FfHammaddeBirim = nil then
    FfHammaddeBirim := FindField('HAMMADDEBIRIM');
  Result := FfHammaddeBirim;
end;

function TTableMamulKart.GetfHammaddeKod: TField;
begin
  if FfHammaddeKod = nil then
    FfHammaddeKod := FindField('HAMMADDEKOD');
  Result := FfHammaddeKod;
end;

function TTableMamulKart.GetfHammaddeKullanimSekli: TField;
begin
  if FfHammaddeKullanimSekli = nil then
    FfHammaddeKullanimSekli := FindField('HAMMADDEKULLANIMSEKLI');
  Result := FfHammaddeKullanimSekli;
end;

function TTableMamulKart.GetfHammaddeSurumNo: TField;
begin
  if FfHammaddeSurumNo = nil then
    FfHammaddeSurumNo := FindField('HAMMADDESURUMNO');
  Result := FfHammaddeSurumNo;
end;

function TTableMamulKart.GetfHammaddeVersiyonNo: TField;
begin
  if FfHammaddeVersiyonNo = nil then
    FfHammaddeVersiyonNo := FindField('HAMMADDEVERSIYONNO');
  Result := FfHammaddeVersiyonNo;
end;

function TTableMamulKart.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMamulKart.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableMamulKart.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableMamulKart.GetfKaynakIslemNo: TField;
begin
  if FfKaynakIslemNo = nil then
    FfKaynakIslemNo := FindField('KAYNAKISLEMNO');
  Result := FfKaynakIslemNo;
end;

function TTableMamulKart.GetfKodBakim: TField;
begin
  if FfKodBakim = nil then
    FfKodBakim := FindField('KODBAKIM');
  Result := FfKodBakim;
end;

function TTableMamulKart.GetfKodDizayn: TField;
begin
  if FfKodDizayn = nil then
    FfKodDizayn := FindField('KODDIZAYN');
  Result := FfKodDizayn;
end;

function TTableMamulKart.GetfKodMaliyet: TField;
begin
  if FfKodMaliyet = nil then
    FfKodMaliyet := FindField('KODMALIYET');
  Result := FfKodMaliyet;
end;

function TTableMamulKart.GetfKodSatis: TField;
begin
  if FfKodSatis = nil then
    FfKodSatis := FindField('KODSATIS');
  Result := FfKodSatis;
end;

function TTableMamulKart.GetfKodUretim: TField;
begin
  if FfKodUretim = nil then
    FfKodUretim := FindField('KODURETIM');
  Result := FfKodUretim;
end;

function TTableMamulKart.GetfKodYedekParca: TField;
begin
  if FfKodYedekParca = nil then
    FfKodYedekParca := FindField('KODYEDEKPARCA');
  Result := FfKodYedekParca;
end;

function TTableMamulKart.GetfLKod1: TField;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1;
end;

function TTableMamulKart.GetfLKod2: TField;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2;
end;

function TTableMamulKart.GetfLKod3: TField;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3;
end;

function TTableMamulKart.GetfLKod4: TField;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4;
end;

function TTableMamulKart.GetfLKod5: TField;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5;
end;

function TTableMamulKart.GetfMamulBirim: TField;
begin
  if FfMamulBirim = nil then
    FfMamulBirim := FindField('MAMBAS_BIRIM');
  Result := FfMamulBirim;
end;

function TTableMamulKart.GetfMamulHammaddeDepoKod: TField;
begin
  if FfMamulHammaddeDepoKod = nil then
    FfMamulHammaddeDepoKod := FindField('MAMBAS_HAMMADDEDEPOKOD');
  Result := FfMamulHammaddeDepoKod;
end;

function TTableMamulKart.GetfMamulKullanimSekli: TField;
begin
  if FfMamulKullanimSekli = nil then
    FfMamulKullanimSekli := FindField('MAMBAS_KULLANIMSEKLI');
  Result := FfMamulKullanimSekli;
end;

function TTableMamulKart.GetfMamulDepoKod: TField;
begin
  if FfMamulDepoKod = nil then
    FfMamulDepoKod := FindField('MAMBAS_MAMULDEPOKOD');
  Result := FfMamulDepoKod;
end;

function TTableMamulKart.GetfMamulMalKod: TField;
begin
  if FfMamulMalKod = nil then
    FfMamulMalKod := FindField('MAMBAS_MAMULKOD');
  Result := FfMamulMalKod;
end;

function TTableMamulKart.GetfMamulStokBirimKatsayi: TField;
begin
  if FfMamulStokBirimKatsayi = nil then
    FfMamulStokBirimKatsayi := FindField('MAMBRM_KATSAYI');
  Result := FfMamulStokBirimKatsayi;
end;

function TTableMamulKart.GetfMamulStokKartBirim: TField;
begin
  if FfMamulStokKartBirim = nil then
    FfMamulStokKartBirim := FindField('MAMSTK_BIRIM');
  Result := FfMamulStokKartBirim;
end;

function TTableMamulKart.GetfMamulStokKartMontajFireOran: TField;
begin
  if FfMamulStokKartMontajFireOran = nil then
    FfMamulStokKartMontajFireOran := FindField('MAMSTK_MONTAJFIREORAN');
  Result := FfMamulStokKartMontajFireOran;
end;

function TTableMamulKart.GetfMamulStokKartYuvarlama: TField;
begin
  if FfMamulStokKartYuvarlama = nil then
    FfMamulStokKartYuvarlama := FindField('MAMSTK_YUVARLAMA');
  Result := FfMamulStokKartYuvarlama;
end;

function TTableMamulKart.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableMamulKart.GetfMiktar: TField;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar;
end;

function TTableMamulKart.GetfMiktarTip: TField;
begin
  if FfMiktarTip = nil then
    FfMiktarTip := FindField('MIKTARTIP');
  Result := FfMiktarTip;
end;

function TTableMamulKart.GetfMKod1: TField;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1;
end;

function TTableMamulKart.GetfMKod2: TField;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2;
end;

function TTableMamulKart.GetfMKod3: TField;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3;
end;

function TTableMamulKart.GetfMKod4: TField;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4;
end;

function TTableMamulKart.GetfMKod5: TField;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5;
end;

function TTableMamulKart.GetfNKod1: TField;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1;
end;

function TTableMamulKart.GetfNKod2: TField;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2;
end;

function TTableMamulKart.GetfNKod3: TField;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3;
end;

function TTableMamulKart.GetfNKod4: TField;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4;
end;

function TTableMamulKart.GetfNKod5: TField;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5;
end;

function TTableMamulKart.GetfNKod6: TField;
begin
  if FfNKod6 = nil then
    FfNKod6 := FindField('NKOD6');
  Result := FfNKod6;
end;

function TTableMamulKart.GetfNKod7: TField;
begin
  if FfNKod7 = nil then
    FfNKod7 := FindField('NKOD7');
  Result := FfNKod7;
end;

function TTableMamulKart.GetfNKod8: TField;
begin
  if FfNKod8 = nil then
    FfNKod8 := FindField('NKOD8');
  Result := FfNKod8;
end;

function TTableMamulKart.GetfNKod9: TField;
begin
  if FfNKod9 = nil then
    FfNKod9 := FindField('NKOD9');
  Result := FfNKod9;
end;

function TTableMamulKart.GetfOperasyonFireKullan: TField;
begin
  if FfOperasyonFireKullan = nil then
    FfOperasyonFireKullan := FindField('OPERASYONFIREKULLAN');
  Result := FfOperasyonFireKullan;
end;

function TTableMamulKart.GetfOperasyonFireMiktar: TField;
begin
  if FfOperasyonFireMiktar = nil then
    FfOperasyonFireMiktar := FindField('OPERASYONFIREMIKTAR');
  Result := FfOperasyonFireMiktar;
end;

function TTableMamulKart.GetfOperasyonFireOran: TField;
begin
  if FfOperasyonFireOran = nil then
    FfOperasyonFireOran := FindField('OPERASYONFIREORAN');
  Result := FfOperasyonFireOran;
end;

function TTableMamulKart.GetfOperasyonNo: TField;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo;
end;

function TTableMamulKart.GetfPozNo: TField;
begin
  if FfPozNo = nil then
    FfPozNo := FindField('POZNO');
  Result := FfPozNo;
end;

function TTableMamulKart.GetfReceteNo: TField;
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  Result := FfReceteNo;
end;

function TTableMamulKart.GetfRevizyonNo: TField;
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  Result := FfRevizyonNo;
end;

function TTableMamulKart.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMamulKart.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableMamulKart.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableMamulKart.GetfSKod1: TField;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1;
end;

function TTableMamulKart.GetfSKod2: TField;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2;
end;

function TTableMamulKart.GetfSKod3: TField;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3;
end;

function TTableMamulKart.GetfSKod4: TField;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4;
end;

function TTableMamulKart.GetfSKod5: TField;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5;
end;

function TTableMamulKart.GetfHammaddeStokBirimKatsayi: TField;
begin
  if FfHammaddeStokBirimKatsayi = nil then
    FfHammaddeStokBirimKatsayi := FindField('STKBRM_KATSAYI');
  Result := FfHammaddeStokBirimKatsayi;
end;

function TTableMamulKart.GetfKullanilabilir: TField;
begin
  if FfKullanilabilir = nil then
    FfKullanilabilir := FindField('STKDRM_KULLANILABILIR');
  Result := FfKullanilabilir;
end;

function TTableMamulKart.GetfStokCikis: TField;
begin
  if FfStokCikis = nil then
    FfStokCikis := FindField('STKDRM_STOKCIKIS');
  Result := FfStokCikis;
end;

function TTableMamulKart.GetfStokGiris: TField;
begin
  if FfStokGiris = nil then
    FfStokGiris := FindField('STKDRM_STOKGIRIS');
  Result := FfStokGiris;
end;

function TTableMamulKart.GetfStokMiktar: TField;
begin
  if FfStokMiktar = nil then
    FfStokMiktar := FindField('STKDRM_STOKMIKTAR');
  Result := FfStokMiktar;
end;

function TTableMamulKart.GetfHammaddeStokKartBilesenFireOran: TField;
begin
  if FfHammaddeStokKartBilesenFireOran = nil then
    FfHammaddeStokKartBilesenFireOran := FindField('STKKRT_BILESENFIREORAN');
  Result := FfHammaddeStokKartBilesenFireOran;
end;

function TTableMamulKart.GetfHammaddeStokKartBirim: TField;
begin
  if FfHammaddeStokKartBirim = nil then
    FfHammaddeStokKartBirim := FindField('STKKRT_BIRIM');
  Result := FfHammaddeStokKartBirim;
end;

function TTableMamulKart.GetfHammaddeStokKartDovizCins: TField;
begin
  if FfHammaddeStokKartDovizCins = nil then
    FfHammaddeStokKartDovizCins := FindField('STKKRT_DOVIZCINS');
  Result := FfHammaddeStokKartDovizCins;
end;

function TTableMamulKart.GetfHammaddeStokKartMaliyetGrupNo: TField;
begin
  if FfHammaddeStokKartMaliyetGrupNo = nil then
    FfHammaddeStokKartMaliyetGrupNo := FindField('STKKRT_GRUPNO');
  Result := FfHammaddeStokKartMaliyetGrupNo;
end;

function TTableMamulKart.GetfHammaddeAd: TField;
begin
  if FfHammaddeAd = nil then
    FfHammaddeAd := FindField('STKKRT_MALAD');
  Result := FfHammaddeAd;
end;

function TTableMamulKart.GetfMaliyet1: TField;
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('STKKRT_MALIYET1');
  Result := FfMaliyet1;
end;

function TTableMamulKart.GetfMaliyet2: TField;
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('STKKRT_MALIYET2');
  Result := FfMaliyet2;
end;

function TTableMamulKart.GetfMaliyet3: TField;
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('STKKRT_MALIYET3');
  Result := FfMaliyet3;
end;

function TTableMamulKart.GetfHammaddeStokKartMRPTip: TField;
begin
  if FfHammaddeStokKartMRPTip = nil then
    FfHammaddeStokKartMRPTip := FindField('STKKRT_MRPTIP');
  Result := FfHammaddeStokKartMRPTip;
end;

function TTableMamulKart.GetfHammaddeStokKartTeminTip: TField;
begin
  if FfHammaddeStokKartTeminTip = nil then
    FfHammaddeStokKartTeminTip := FindField('STKKRT_TEMINTIP');
  Result := FfHammaddeStokKartTeminTip;
end;

function TTableMamulKart.GetfHammaddeStokKartTeminYontem: TField;
begin
  if FfHammaddeStokKartTeminYontem = nil then
    FfHammaddeStokKartTeminYontem := FindField('STKKRT_TEMINYONTEM');
  Result := FfHammaddeStokKartTeminYontem;
end;

function TTableMamulKart.GetfHammaddeStokKartYuvarlama: TField;
begin
  if FfHammaddeStokKartYuvarlama = nil then
    FfHammaddeStokKartYuvarlama := FindField('STKKRT_YUVARLAMA');
  Result := FfHammaddeStokKartYuvarlama;
end;

function TTableMamulKart.GetfSurumNo: TField;
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  Result := FfSurumNo;
end;

function TTableMamulKart.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

function TTableMamulKart.GetfYanUrunMaliyetOran: TField;
begin
  if FfYanUrunMaliyetOran = nil then
    FfYanUrunMaliyetOran := FindField('YANURUNMALIYETORAN');
  Result := FfYanUrunMaliyetOran;
end;

function TTableMamulKart.GetfYanUrunMaliyetTip: TField;
begin
  if FfYanUrunMaliyetTip = nil then
    FfYanUrunMaliyetTip := FindField('YANURUNMALIYETTIP');
  Result := FfYanUrunMaliyetTip;
end;

function TTableMamulKart.GetfYanUrunMiktar: TField;
begin
  if FfYanUrunMiktar = nil then
    FfYanUrunMiktar := FindField('YANURUNMIKTAR');
  Result := FfYanUrunMiktar;
end;

function TTableMamulKart.GetfYanUrunNo: TField;
begin
  if FfYanUrunNo = nil then
    FfYanUrunNo := FindField('YANURUNNO');
  Result := FfYanUrunNo;
end;

procedure TTableMamulKart.SetKeyID(const Value: Integer);
begin
  if FfKeyID = nil then
    FfKeyID := FindField('_KEYID');
  FfKeyID.AsInteger := Value;
end;

procedure TTableMamulKart.SetKeyParentID(const Value: Integer);
begin
  if FfKeyParentID = nil then
    FfKeyParentID := FindField('_KEYPARENTID');
  FfKeyParentID.AsInteger := Value;
end;

procedure TTableMamulKart.SetUretimMiktar(const Value: Double);
begin
  if FfUretimMiktar = nil then
    FfUretimMiktar := FindField('_URETIMMIKTAR');
  FfUretimMiktar.AsFloat := Value;
end;

procedure TTableMamulKart.SetAciklama1(const Value: String);
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  FfAciklama1.AsString := Value;
end;

procedure TTableMamulKart.SetAciklama2(const Value: String);
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  FfAciklama2.AsString := Value;
end;

procedure TTableMamulKart.SetAciklama3(const Value: String);
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  FfAciklama3.AsString := Value;
end;

procedure TTableMamulKart.SetAciklama4(const Value: String);
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  FfAciklama4.AsString := Value;
end;

procedure TTableMamulKart.SetAciklama5(const Value: String);
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  FfAciklama5.AsString := Value;
end;

procedure TTableMamulKart.SetBasTarih(const Value: TDate);
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  FfBasTarih.AsDateTime := Value;
end;

procedure TTableMamulKart.SetBilesenFireOran(const Value: Double);
begin
  if FfBilesenFireOran = nil then
    FfBilesenFireOran := FindField('BILESENFIREORAN');
  FfBilesenFireOran.AsFloat := Value;
end;

procedure TTableMamulKart.SetBitTarih(const Value: TDate);
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  FfBitTarih.AsDateTime := Value;
end;

procedure TTableMamulKart.SetBKod1(const Value: Integer);
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  FfBKod1.AsInteger := Value;
end;

procedure TTableMamulKart.SetBKod2(const Value: Integer);
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  FfBKod2.AsInteger := Value;
end;

procedure TTableMamulKart.SetBKod3(const Value: Integer);
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  FfBKod3.AsInteger := Value;
end;

procedure TTableMamulKart.SetBKod4(const Value: Integer);
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  FfBKod4.AsInteger := Value;
end;

procedure TTableMamulKart.SetBKod5(const Value: Integer);
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  FfBKod5.AsInteger := Value;
end;

procedure TTableMamulKart.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableMamulKart.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableMamulKart.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableMamulKart.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableMamulKart.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableMamulKart.SetDepoKod(const Value: String);
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  FfDepoKod.AsString := Value;
end;

procedure TTableMamulKart.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableMamulKart.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableMamulKart.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableMamulKart.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableMamulKart.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableMamulKart.SetHammaddeBirim(const Value: String);
begin
  if FfHammaddeBirim = nil then
    FfHammaddeBirim := FindField('HAMMADDEBIRIM');
  FfHammaddeBirim.AsString := Value;
end;

procedure TTableMamulKart.SetHammaddeKod(const Value: String);
begin
  if FfHammaddeKod = nil then
    FfHammaddeKod := FindField('HAMMADDEKOD');
  FfHammaddeKod.AsString := Value;
end;

procedure TTableMamulKart.SetHammaddeKullanimSekli(const Value: Integer);
begin
  if FfHammaddeKullanimSekli = nil then
    FfHammaddeKullanimSekli := FindField('HAMMADDEKULLANIMSEKLI');
  FfHammaddeKullanimSekli.AsInteger := Value;
end;

procedure TTableMamulKart.SetHammaddeSurumNo(const Value: Integer);
begin
  if FfHammaddeSurumNo = nil then
    FfHammaddeSurumNo := FindField('HAMMADDESURUMNO');
  FfHammaddeSurumNo.AsInteger := Value;
end;

procedure TTableMamulKart.SetHammaddeVersiyonNo(const Value: String);
begin
  if FfHammaddeVersiyonNo = nil then
    FfHammaddeVersiyonNo := FindField('HAMMADDEVERSIYONNO');
  FfHammaddeVersiyonNo.AsString := Value;
end;

procedure TTableMamulKart.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMamulKart.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableMamulKart.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableMamulKart.SetKaynakIslemNo(const Value: Integer);
begin
  if FfKaynakIslemNo = nil then
    FfKaynakIslemNo := FindField('KAYNAKISLEMNO');
  FfKaynakIslemNo.AsInteger := Value;
end;

procedure TTableMamulKart.SetKodBakim(const Value: Integer);
begin
  if FfKodBakim = nil then
    FfKodBakim := FindField('KODBAKIM');
  FfKodBakim.AsInteger := Value;
end;

procedure TTableMamulKart.SetKodDizayn(const Value: Integer);
begin
  if FfKodDizayn = nil then
    FfKodDizayn := FindField('KODDIZAYN');
  FfKodDizayn.AsInteger := Value;
end;

procedure TTableMamulKart.SetKodMaliyet(const Value: Integer);
begin
  if FfKodMaliyet = nil then
    FfKodMaliyet := FindField('KODMALIYET');
  FfKodMaliyet.AsInteger := Value;
end;

procedure TTableMamulKart.SetKodSatis(const Value: Integer);
begin
  if FfKodSatis = nil then
    FfKodSatis := FindField('KODSATIS');
  FfKodSatis.AsInteger := Value;
end;

procedure TTableMamulKart.SetKodUretim(const Value: Integer);
begin
  if FfKodUretim = nil then
    FfKodUretim := FindField('KODURETIM');
  FfKodUretim.AsInteger := Value;
end;

procedure TTableMamulKart.SetKodYedekParca(const Value: Integer);
begin
  if FfKodYedekParca = nil then
    FfKodYedekParca := FindField('KODYEDEKPARCA');
  FfKodYedekParca.AsInteger := Value;
end;

procedure TTableMamulKart.SetLKod1(const Value: String);
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  FfLKod1.AsString := Value;
end;

procedure TTableMamulKart.SetLKod2(const Value: String);
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  FfLKod2.AsString := Value;
end;

procedure TTableMamulKart.SetLKod3(const Value: String);
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  FfLKod3.AsString := Value;
end;

procedure TTableMamulKart.SetLKod4(const Value: String);
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  FfLKod4.AsString := Value;
end;

procedure TTableMamulKart.SetLKod5(const Value: String);
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  FfLKod5.AsString := Value;
end;

procedure TTableMamulKart.SetMamulBirim(const Value: String);
begin
  if FfMamulBirim = nil then
    FfMamulBirim := FindField('MAMBAS_BIRIM');
  FfMamulBirim.AsString := Value;
end;

procedure TTableMamulKart.SetMamulHammaddeDepoKod(const Value: String);
begin
  if FfMamulHammaddeDepoKod = nil then
    FfMamulHammaddeDepoKod := FindField('MAMBAS_HAMMADDEDEPOKOD');
  FfMamulHammaddeDepoKod.AsString := Value;
end;

procedure TTableMamulKart.SetMamulKullanimSekli(const Value: Integer);
begin
  if FfMamulKullanimSekli = nil then
    FfMamulKullanimSekli := FindField('MAMBAS_KULLANIMSEKLI');
  FfMamulKullanimSekli.AsInteger := Value;
end;

procedure TTableMamulKart.SetMamulDepoKod(const Value: String);
begin
  if FfMamulDepoKod = nil then
    FfMamulDepoKod := FindField('MAMBAS_MAMULDEPOKOD');
  FfMamulDepoKod.AsString := Value;
end;

procedure TTableMamulKart.SetMamulMalKod(const Value: String);
begin
  if FfMamulMalKod = nil then
    FfMamulMalKod := FindField('MAMBAS_MAMULKOD');
  FfMamulMalKod.AsString := Value;
end;

procedure TTableMamulKart.SetMamulStokBirimKatsayi(const Value: Double);
begin
  if FfMamulStokBirimKatsayi = nil then
    FfMamulStokBirimKatsayi := FindField('MAMBRM_KATSAYI');
  FfMamulStokBirimKatsayi.AsFloat := Value;
end;

procedure TTableMamulKart.SetMamulStokKartBirim(const Value: String);
begin
  if FfMamulStokKartBirim = nil then
    FfMamulStokKartBirim := FindField('MAMSTK_BIRIM');
  FfMamulStokKartBirim.AsString := Value;
end;

procedure TTableMamulKart.SetMamulStokKartMontajFireOran(const Value: Double);
begin
  if FfMamulStokKartMontajFireOran = nil then
    FfMamulStokKartMontajFireOran := FindField('MAMSTK_MONTAJFIREORAN');
  FfMamulStokKartMontajFireOran.AsFloat := Value;
end;

procedure TTableMamulKart.SetMamulStokKartYuvarlama(const Value: Integer);
begin
  if FfMamulStokKartYuvarlama = nil then
    FfMamulStokKartYuvarlama := FindField('MAMSTK_YUVARLAMA');
  FfMamulStokKartYuvarlama.AsInteger := Value;
end;

procedure TTableMamulKart.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableMamulKart.SetMiktar(const Value: Double);
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  FfMiktar.AsFloat := Value;
end;

procedure TTableMamulKart.SetMiktarTip(const Value: Integer);
begin
  if FfMiktarTip = nil then
    FfMiktarTip := FindField('MIKTARTIP');
  FfMiktarTip.AsInteger := Value;
end;

procedure TTableMamulKart.SetMKod1(const Value: String);
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  FfMKod1.AsString := Value;
end;

procedure TTableMamulKart.SetMKod2(const Value: String);
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  FfMKod2.AsString := Value;
end;

procedure TTableMamulKart.SetMKod3(const Value: String);
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  FfMKod3.AsString := Value;
end;

procedure TTableMamulKart.SetMKod4(const Value: String);
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  FfMKod4.AsString := Value;
end;

procedure TTableMamulKart.SetMKod5(const Value: String);
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  FfMKod5.AsString := Value;
end;

procedure TTableMamulKart.SetNKod1(const Value: Double);
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  FfNKod1.AsFloat := Value;
end;

procedure TTableMamulKart.SetNKod2(const Value: Double);
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  FfNKod2.AsFloat := Value;
end;

procedure TTableMamulKart.SetNKod3(const Value: Double);
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  FfNKod3.AsFloat := Value;
end;

procedure TTableMamulKart.SetNKod4(const Value: Double);
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  FfNKod4.AsFloat := Value;
end;

procedure TTableMamulKart.SetNKod5(const Value: Double);
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  FfNKod5.AsFloat := Value;
end;

procedure TTableMamulKart.SetNKod6(const Value: Double);
begin
  if FfNKod6 = nil then
    FfNKod6 := FindField('NKOD6');
  FfNKod6.AsFloat := Value;
end;

procedure TTableMamulKart.SetNKod7(const Value: Double);
begin
  if FfNKod7 = nil then
    FfNKod7 := FindField('NKOD7');
  FfNKod7.AsFloat := Value;
end;

procedure TTableMamulKart.SetNKod8(const Value: Double);
begin
  if FfNKod8 = nil then
    FfNKod8 := FindField('NKOD8');
  FfNKod8.AsFloat := Value;
end;

procedure TTableMamulKart.SetNKod9(const Value: Double);
begin
  if FfNKod9 = nil then
    FfNKod9 := FindField('NKOD9');
  FfNKod9.AsFloat := Value;
end;

procedure TTableMamulKart.SetOperasyonFireKullan(const Value: Integer);
begin
  if FfOperasyonFireKullan = nil then
    FfOperasyonFireKullan := FindField('OPERASYONFIREKULLAN');
  FfOperasyonFireKullan.AsInteger := Value;
end;

procedure TTableMamulKart.SetOperasyonFireMiktar(const Value: Double);
begin
  if FfOperasyonFireMiktar = nil then
    FfOperasyonFireMiktar := FindField('OPERASYONFIREMIKTAR');
  FfOperasyonFireMiktar.AsFloat := Value;
end;

procedure TTableMamulKart.SetOperasyonFireOran(const Value: Double);
begin
  if FfOperasyonFireOran = nil then
    FfOperasyonFireOran := FindField('OPERASYONFIREORAN');
  FfOperasyonFireOran.AsFloat := Value;
end;

procedure TTableMamulKart.SetOperasyonNo(const Value: Integer);
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  FfOperasyonNo.AsInteger := Value;
end;

procedure TTableMamulKart.SetPozNo(const Value: String);
begin
  if FfPozNo = nil then
    FfPozNo := FindField('POZNO');
  FfPozNo.AsString := Value;
end;

procedure TTableMamulKart.SetReceteNo(const Value: String);
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  FfReceteNo.AsString := Value;
end;

procedure TTableMamulKart.SetRevizyonNo(const Value: String);
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  FfRevizyonNo.AsString := Value;
end;

procedure TTableMamulKart.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMamulKart.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableMamulKart.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableMamulKart.SetSKod1(const Value: String);
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  FfSKod1.AsString := Value;
end;

procedure TTableMamulKart.SetSKod2(const Value: String);
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  FfSKod2.AsString := Value;
end;

procedure TTableMamulKart.SetSKod3(const Value: String);
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  FfSKod3.AsString := Value;
end;

procedure TTableMamulKart.SetSKod4(const Value: String);
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  FfSKod4.AsString := Value;
end;

procedure TTableMamulKart.SetSKod5(const Value: String);
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  FfSKod5.AsString := Value;
end;

procedure TTableMamulKart.SetHammaddeStokBirimKatsayi(const Value: Double);
begin
  if FfHammaddeStokBirimKatsayi = nil then
    FfHammaddeStokBirimKatsayi := FindField('STKBRM_KATSAYI');
  FfHammaddeStokBirimKatsayi.AsFloat := Value;
end;

procedure TTableMamulKart.SetKullanilabilir(const Value: Double);
begin
  if FfKullanilabilir = nil then
    FfKullanilabilir := FindField('STKDRM_KULLANILABILIR');
  FfKullanilabilir.AsFloat := Value;
end;

procedure TTableMamulKart.SetStokCikis(const Value: Double);
begin
  if FfStokCikis = nil then
    FfStokCikis := FindField('STKDRM_STOKCIKIS');
  FfStokCikis.AsFloat := Value;
end;

procedure TTableMamulKart.SetStokGiris(const Value: Double);
begin
  if FfStokGiris = nil then
    FfStokGiris := FindField('STKDRM_STOKGIRIS');
  FfStokGiris.AsFloat := Value;
end;

procedure TTableMamulKart.SetStokMiktar(const Value: Double);
begin
  if FfStokMiktar = nil then
    FfStokMiktar := FindField('STKDRM_STOKMIKTAR');
  FfStokMiktar.AsFloat := Value;
end;

procedure TTableMamulKart.SetHammaddeStokKartBilesenFireOran(const Value: Double);
begin
  if FfHammaddeStokKartBilesenFireOran = nil then
    FfHammaddeStokKartBilesenFireOran := FindField('STKKRT_BILESENFIREORAN');
  FfHammaddeStokKartBilesenFireOran.AsFloat := Value;
end;

procedure TTableMamulKart.SetHammaddeStokKartBirim(const Value: String);
begin
  if FfHammaddeStokKartBirim = nil then
    FfHammaddeStokKartBirim := FindField('STKKRT_BIRIM');
  FfHammaddeStokKartBirim.AsString := Value;
end;

procedure TTableMamulKart.SetHammaddeStokKartDovizCins(const Value: String);
begin
  if FfHammaddeStokKartDovizCins = nil then
    FfHammaddeStokKartDovizCins := FindField('STKKRT_DOVIZCINS');
  FfHammaddeStokKartDovizCins.AsString := Value;
end;

procedure TTableMamulKart.SetHammaddeStokKartMaliyetGrupNo(const Value: Integer);
begin
  if FfHammaddeStokKartMaliyetGrupNo = nil then
    FfHammaddeStokKartMaliyetGrupNo := FindField('STKKRT_GRUPNO');
  FfHammaddeStokKartMaliyetGrupNo.AsInteger := Value;
end;

procedure TTableMamulKart.SetHammaddeAd(const Value: String);
begin
  if FfHammaddeAd = nil then
    FfHammaddeAd := FindField('STKKRT_MALAD');
  FfHammaddeAd.AsString := Value;
end;

procedure TTableMamulKart.SetMaliyet1(const Value: Double);
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('STKKRT_MALIYET1');
  FfMaliyet1.AsFloat := Value;
end;

procedure TTableMamulKart.SetMaliyet2(const Value: Double);
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('STKKRT_MALIYET2');
  FfMaliyet2.AsFloat := Value;
end;

procedure TTableMamulKart.SetMaliyet3(const Value: Double);
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('STKKRT_MALIYET3');
  FfMaliyet3.AsFloat := Value;
end;

procedure TTableMamulKart.SetHammaddeStokKartMRPTip(const Value: Integer);
begin
  if FfHammaddeStokKartMRPTip = nil then
    FfHammaddeStokKartMRPTip := FindField('STKKRT_MRPTIP');
  FfHammaddeStokKartMRPTip.AsInteger := Value;
end;

procedure TTableMamulKart.SetHammaddeStokKartTeminTip(const Value: Integer);
begin
  if FfHammaddeStokKartTeminTip = nil then
    FfHammaddeStokKartTeminTip := FindField('STKKRT_TEMINTIP');
  FfHammaddeStokKartTeminTip.AsInteger := Value;
end;

procedure TTableMamulKart.SetHammaddeStokKartTeminYontem(const Value: Integer);
begin
  if FfHammaddeStokKartTeminYontem = nil then
    FfHammaddeStokKartTeminYontem := FindField('STKKRT_TEMINYONTEM');
  FfHammaddeStokKartTeminYontem.AsInteger := Value;
end;

procedure TTableMamulKart.SetHammaddeStokKartYuvarlama(const Value: Integer);
begin
  if FfHammaddeStokKartYuvarlama = nil then
    FfHammaddeStokKartYuvarlama := FindField('STKKRT_YUVARLAMA');
  FfHammaddeStokKartYuvarlama.AsInteger := Value;
end;

procedure TTableMamulKart.SetSurumNo(const Value: Integer);
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  FfSurumNo.AsInteger := Value;
end;

procedure TTableMamulKart.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

procedure TTableMamulKart.SetYanUrunMaliyetOran(const Value: Double);
begin
  if FfYanUrunMaliyetOran = nil then
    FfYanUrunMaliyetOran := FindField('YANURUNMALIYETORAN');
  FfYanUrunMaliyetOran.AsFloat := Value;
end;

procedure TTableMamulKart.SetYanUrunMaliyetTip(const Value: Integer);
begin
  if FfYanUrunMaliyetTip = nil then
    FfYanUrunMaliyetTip := FindField('YANURUNMALIYETTIP');
  FfYanUrunMaliyetTip.AsInteger := Value;
end;

procedure TTableMamulKart.SetYanUrunMiktar(const Value: Double);
begin
  if FfYanUrunMiktar = nil then
    FfYanUrunMiktar := FindField('YANURUNMIKTAR');
  FfYanUrunMiktar.AsFloat := Value;
end;

procedure TTableMamulKart.SetYanUrunNo(const Value: Integer);
begin
  if FfYanUrunNo = nil then
    FfYanUrunNo := FindField('YANURUNNO');
  FfYanUrunNo.AsInteger := Value;
end;

{ TTableMamulKullanimGrup }

constructor TTableMamulKullanimGrup.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MAMKUG';
end;

procedure TTableMamulKullanimGrup.DoAfterOpen;
begin
  if FfGrupNo = nil then
    FfGrupNo := FindField('GRUPNO');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKullanimKod = nil then
    FfKullanimKod := FindField('KULLANIMKOD');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  inherited;
end;

procedure TTableMamulKullanimGrup.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfGrupNo := nil;
    FfID := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKullanimKod := nil;
    FfRowGuid := nil;
    FfSiraNo := nil;
    FfSirketNo := nil;
  end;
  inherited;
end;

function TTableMamulKullanimGrup.GetGrupNo: Integer;
begin
  if FfGrupNo = nil then
    FfGrupNo := FindField('GRUPNO');
  Result := FfGrupNo.AsInteger;
end;

function TTableMamulKullanimGrup.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMamulKullanimGrup.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableMamulKullanimGrup.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableMamulKullanimGrup.GetKullanimKod: String;
begin
  if FfKullanimKod = nil then
    FfKullanimKod := FindField('KULLANIMKOD');
  Result := FfKullanimKod.AsString;
end;

function TTableMamulKullanimGrup.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMamulKullanimGrup.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableMamulKullanimGrup.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMamulKullanimGrup.GetfGrupNo: TField;
begin
  if FfGrupNo = nil then
    FfGrupNo := FindField('GRUPNO');
  Result := FfGrupNo;
end;

function TTableMamulKullanimGrup.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMamulKullanimGrup.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableMamulKullanimGrup.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableMamulKullanimGrup.GetfKullanimKod: TField;
begin
  if FfKullanimKod = nil then
    FfKullanimKod := FindField('KULLANIMKOD');
  Result := FfKullanimKod;
end;

function TTableMamulKullanimGrup.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMamulKullanimGrup.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableMamulKullanimGrup.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

procedure TTableMamulKullanimGrup.SetGrupNo(const Value: Integer);
begin
  if FfGrupNo = nil then
    FfGrupNo := FindField('GRUPNO');
  FfGrupNo.AsInteger := Value;
end;

procedure TTableMamulKullanimGrup.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMamulKullanimGrup.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableMamulKullanimGrup.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableMamulKullanimGrup.SetKullanimKod(const Value: String);
begin
  if FfKullanimKod = nil then
    FfKullanimKod := FindField('KULLANIMKOD');
  FfKullanimKod.AsString := Value;
end;

procedure TTableMamulKullanimGrup.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMamulKullanimGrup.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableMamulKullanimGrup.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

{ TTableMamulKullanimKart }

constructor TTableMamulKullanimKart.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MAMKUK';
end;

procedure TTableMamulKullanimKart.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKodBakim = nil then
    FfKodBakim := FindField('KODBAKIM');
  if FfKodDizayn = nil then
    FfKodDizayn := FindField('KODDIZAYN');
  if FfKodMaliyet = nil then
    FfKodMaliyet := FindField('KODMALIYET');
  if FfKodSatis = nil then
    FfKodSatis := FindField('KODSATIS');
  if FfKodUretim = nil then
    FfKodUretim := FindField('KODURETIM');
  if FfKodYedekParca = nil then
    FfKodYedekParca := FindField('KODYEDEKPARCA');
  if FfKullanimKod = nil then
    FfKullanimKod := FindField('KULLANIMKOD');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  inherited;
end;

procedure TTableMamulKullanimKart.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfID := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKodBakim := nil;
    FfKodDizayn := nil;
    FfKodMaliyet := nil;
    FfKodSatis := nil;
    FfKodUretim := nil;
    FfKodYedekParca := nil;
    FfKullanimKod := nil;
    FfRowGuid := nil;
    FfSirketNo := nil;
  end;
  inherited;
end;

function TTableMamulKullanimKart.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableMamulKullanimKart.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMamulKullanimKart.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableMamulKullanimKart.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableMamulKullanimKart.GetKodBakim: Integer;
begin
  if FfKodBakim = nil then
    FfKodBakim := FindField('KODBAKIM');
  Result := FfKodBakim.AsInteger;
end;

function TTableMamulKullanimKart.GetKodDizayn: Integer;
begin
  if FfKodDizayn = nil then
    FfKodDizayn := FindField('KODDIZAYN');
  Result := FfKodDizayn.AsInteger;
end;

function TTableMamulKullanimKart.GetKodMaliyet: Integer;
begin
  if FfKodMaliyet = nil then
    FfKodMaliyet := FindField('KODMALIYET');
  Result := FfKodMaliyet.AsInteger;
end;

function TTableMamulKullanimKart.GetKodSatis: Integer;
begin
  if FfKodSatis = nil then
    FfKodSatis := FindField('KODSATIS');
  Result := FfKodSatis.AsInteger;
end;

function TTableMamulKullanimKart.GetKodUretim: Integer;
begin
  if FfKodUretim = nil then
    FfKodUretim := FindField('KODURETIM');
  Result := FfKodUretim.AsInteger;
end;

function TTableMamulKullanimKart.GetKodYedekParca: Integer;
begin
  if FfKodYedekParca = nil then
    FfKodYedekParca := FindField('KODYEDEKPARCA');
  Result := FfKodYedekParca.AsInteger;
end;

function TTableMamulKullanimKart.GetKullanimKod: String;
begin
  if FfKullanimKod = nil then
    FfKullanimKod := FindField('KULLANIMKOD');
  Result := FfKullanimKod.AsString;
end;

function TTableMamulKullanimKart.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMamulKullanimKart.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMamulKullanimKart.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableMamulKullanimKart.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMamulKullanimKart.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableMamulKullanimKart.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableMamulKullanimKart.GetfKodBakim: TField;
begin
  if FfKodBakim = nil then
    FfKodBakim := FindField('KODBAKIM');
  Result := FfKodBakim;
end;

function TTableMamulKullanimKart.GetfKodDizayn: TField;
begin
  if FfKodDizayn = nil then
    FfKodDizayn := FindField('KODDIZAYN');
  Result := FfKodDizayn;
end;

function TTableMamulKullanimKart.GetfKodMaliyet: TField;
begin
  if FfKodMaliyet = nil then
    FfKodMaliyet := FindField('KODMALIYET');
  Result := FfKodMaliyet;
end;

function TTableMamulKullanimKart.GetfKodSatis: TField;
begin
  if FfKodSatis = nil then
    FfKodSatis := FindField('KODSATIS');
  Result := FfKodSatis;
end;

function TTableMamulKullanimKart.GetfKodUretim: TField;
begin
  if FfKodUretim = nil then
    FfKodUretim := FindField('KODURETIM');
  Result := FfKodUretim;
end;

function TTableMamulKullanimKart.GetfKodYedekParca: TField;
begin
  if FfKodYedekParca = nil then
    FfKodYedekParca := FindField('KODYEDEKPARCA');
  Result := FfKodYedekParca;
end;

function TTableMamulKullanimKart.GetfKullanimKod: TField;
begin
  if FfKullanimKod = nil then
    FfKullanimKod := FindField('KULLANIMKOD');
  Result := FfKullanimKod;
end;

function TTableMamulKullanimKart.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMamulKullanimKart.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

procedure TTableMamulKullanimKart.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableMamulKullanimKart.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMamulKullanimKart.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableMamulKullanimKart.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableMamulKullanimKart.SetKodBakim(const Value: Integer);
begin
  if FfKodBakim = nil then
    FfKodBakim := FindField('KODBAKIM');
  FfKodBakim.AsInteger := Value;
end;

procedure TTableMamulKullanimKart.SetKodDizayn(const Value: Integer);
begin
  if FfKodDizayn = nil then
    FfKodDizayn := FindField('KODDIZAYN');
  FfKodDizayn.AsInteger := Value;
end;

procedure TTableMamulKullanimKart.SetKodMaliyet(const Value: Integer);
begin
  if FfKodMaliyet = nil then
    FfKodMaliyet := FindField('KODMALIYET');
  FfKodMaliyet.AsInteger := Value;
end;

procedure TTableMamulKullanimKart.SetKodSatis(const Value: Integer);
begin
  if FfKodSatis = nil then
    FfKodSatis := FindField('KODSATIS');
  FfKodSatis.AsInteger := Value;
end;

procedure TTableMamulKullanimKart.SetKodUretim(const Value: Integer);
begin
  if FfKodUretim = nil then
    FfKodUretim := FindField('KODURETIM');
  FfKodUretim.AsInteger := Value;
end;

procedure TTableMamulKullanimKart.SetKodYedekParca(const Value: Integer);
begin
  if FfKodYedekParca = nil then
    FfKodYedekParca := FindField('KODYEDEKPARCA');
  FfKodYedekParca.AsInteger := Value;
end;

procedure TTableMamulKullanimKart.SetKullanimKod(const Value: String);
begin
  if FfKullanimKod = nil then
    FfKullanimKod := FindField('KULLANIMKOD');
  FfKullanimKod.AsString := Value;
end;

procedure TTableMamulKullanimKart.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMamulKullanimKart.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

{ TTableMamulRotaKaynak }

constructor TTableMamulRotaKaynak.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MAMKYN';
end;

procedure TTableMamulRotaKaynak.DoAfterOpen;
begin
  if FfCalcCalismaSure = nil then
    FfCalcCalismaSure := FindField('_CALCCALISMASURE');
  if FfCalcToplamSure = nil then
    FfCalcToplamSure := FindField('_CALCTOPLAMSURE');
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
  if FfKullanimSiraNo = nil then
    FfKullanimSiraNo := FindField('KULLANIMSIRANO');
  if FfKullanimTip = nil then
    FfKullanimTip := FindField('KULLANIMTIP');
  if FfKurulumKod1 = nil then
    FfKurulumKod1 := FindField('MAMBAS_KURULUMKOD1');
  if FfKurulumKod2 = nil then
    FfKurulumKod2 := FindField('MAMBAS_KURULUMKOD2');
  if FfKurulumKod3 = nil then
    FfKurulumKod3 := FindField('MAMBAS_KURULUMKOD3');
  if FfKurulumKod4 = nil then
    FfKurulumKod4 := FindField('MAMBAS_KURULUMKOD4');
  if FfKurulumKod5 = nil then
    FfKurulumKod5 := FindField('MAMBAS_KURULUMKOD5');
  if FfSokumKod1 = nil then
    FfSokumKod1 := FindField('MAMBAS_SOKUMKOD1');
  if FfSokumKod2 = nil then
    FfSokumKod2 := FindField('MAMBAS_SOKUMKOD2');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  if FfKaynakCalismaSure = nil then
    FfKaynakCalismaSure := FindField('URTKYN_CALISMASURE');
  if FfKaynakAd = nil then
    FfKaynakAd := FindField('URTKYN_KAYNAKAD');
  if FfKaynakKurulumSure = nil then
    FfKaynakKurulumSure := FindField('URTKYN_KURULUMSURE');
  if FfKaynakSokumSure = nil then
    FfKaynakSokumSure := FindField('URTKYN_SOKUMSURE');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableMamulRotaKaynak.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfCalcCalismaSure := nil;
    FfCalcToplamSure := nil;
    FfDegistirenKaynak := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
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
    FfKullanimSiraNo := nil;
    FfKullanimTip := nil;
    FfKurulumKod1 := nil;
    FfKurulumKod2 := nil;
    FfKurulumKod3 := nil;
    FfKurulumKod4 := nil;
    FfKurulumKod5 := nil;
    FfSokumKod1 := nil;
    FfSokumKod2 := nil;
    FfMamulKod := nil;
    FfOperasyonNo := nil;
    FfReceteNo := nil;
    FfRevizyonNo := nil;
    FfRowGuid := nil;
    FfSirketNo := nil;
    FfSurumNo := nil;
    FfKaynakCalismaSure := nil;
    FfKaynakAd := nil;
    FfKaynakKurulumSure := nil;
    FfKaynakSokumSure := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableMamulRotaKaynak.GetCalcCalismaSure: Double;
begin
  if FfCalcCalismaSure = nil then
    FfCalcCalismaSure := FindField('_CALCCALISMASURE');
  Result := FfCalcCalismaSure.AsFloat;
end;

function TTableMamulRotaKaynak.GetCalcToplamSure: Double;
begin
  if FfCalcToplamSure = nil then
    FfCalcToplamSure := FindField('_CALCTOPLAMSURE');
  Result := FfCalcToplamSure.AsFloat;
end;

function TTableMamulRotaKaynak.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableMamulRotaKaynak.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableMamulRotaKaynak.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableMamulRotaKaynak.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableMamulRotaKaynak.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableMamulRotaKaynak.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableMamulRotaKaynak.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableMamulRotaKaynak.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableMamulRotaKaynak.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableMamulRotaKaynak.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableMamulRotaKaynak.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMamulRotaKaynak.GetIsMerkezKod: String;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod.AsString;
end;

function TTableMamulRotaKaynak.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableMamulRotaKaynak.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableMamulRotaKaynak.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableMamulRotaKaynak.GetKullanimSiraNo: Integer;
begin
  if FfKullanimSiraNo = nil then
    FfKullanimSiraNo := FindField('KULLANIMSIRANO');
  Result := FfKullanimSiraNo.AsInteger;
end;

function TTableMamulRotaKaynak.GetKullanimTip: Integer;
begin
  if FfKullanimTip = nil then
    FfKullanimTip := FindField('KULLANIMTIP');
  Result := FfKullanimTip.AsInteger;
end;

function TTableMamulRotaKaynak.GetKurulumKod1: String;
begin
  if FfKurulumKod1 = nil then
    FfKurulumKod1 := FindField('MAMBAS_KURULUMKOD1');
  Result := FfKurulumKod1.AsString;
end;

function TTableMamulRotaKaynak.GetKurulumKod2: String;
begin
  if FfKurulumKod2 = nil then
    FfKurulumKod2 := FindField('MAMBAS_KURULUMKOD2');
  Result := FfKurulumKod2.AsString;
end;

function TTableMamulRotaKaynak.GetKurulumKod3: String;
begin
  if FfKurulumKod3 = nil then
    FfKurulumKod3 := FindField('MAMBAS_KURULUMKOD3');
  Result := FfKurulumKod3.AsString;
end;

function TTableMamulRotaKaynak.GetKurulumKod4: String;
begin
  if FfKurulumKod4 = nil then
    FfKurulumKod4 := FindField('MAMBAS_KURULUMKOD4');
  Result := FfKurulumKod4.AsString;
end;

function TTableMamulRotaKaynak.GetKurulumKod5: String;
begin
  if FfKurulumKod5 = nil then
    FfKurulumKod5 := FindField('MAMBAS_KURULUMKOD5');
  Result := FfKurulumKod5.AsString;
end;

function TTableMamulRotaKaynak.GetSokumKod1: String;
begin
  if FfSokumKod1 = nil then
    FfSokumKod1 := FindField('MAMBAS_SOKUMKOD1');
  Result := FfSokumKod1.AsString;
end;

function TTableMamulRotaKaynak.GetSokumKod2: String;
begin
  if FfSokumKod2 = nil then
    FfSokumKod2 := FindField('MAMBAS_SOKUMKOD2');
  Result := FfSokumKod2.AsString;
end;

function TTableMamulRotaKaynak.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableMamulRotaKaynak.GetOperasyonNo: Integer;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo.AsInteger;
end;

function TTableMamulRotaKaynak.GetReceteNo: String;
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  Result := FfReceteNo.AsString;
end;

function TTableMamulRotaKaynak.GetRevizyonNo: String;
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  Result := FfRevizyonNo.AsString;
end;

function TTableMamulRotaKaynak.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMamulRotaKaynak.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMamulRotaKaynak.GetSurumNo: Integer;
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  Result := FfSurumNo.AsInteger;
end;

function TTableMamulRotaKaynak.GetKaynakCalismaSure: Double;
begin
  if FfKaynakCalismaSure = nil then
    FfKaynakCalismaSure := FindField('URTKYN_CALISMASURE');
  Result := FfKaynakCalismaSure.AsFloat;
end;

function TTableMamulRotaKaynak.GetKaynakAd: String;
begin
  if FfKaynakAd = nil then
    FfKaynakAd := FindField('URTKYN_KAYNAKAD');
  Result := FfKaynakAd.AsString;
end;

function TTableMamulRotaKaynak.GetKaynakKurulumSure: Double;
begin
  if FfKaynakKurulumSure = nil then
    FfKaynakKurulumSure := FindField('URTKYN_KURULUMSURE');
  Result := FfKaynakKurulumSure.AsFloat;
end;

function TTableMamulRotaKaynak.GetKaynakSokumSure: Double;
begin
  if FfKaynakSokumSure = nil then
    FfKaynakSokumSure := FindField('URTKYN_SOKUMSURE');
  Result := FfKaynakSokumSure.AsFloat;
end;

function TTableMamulRotaKaynak.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableMamulRotaKaynak.GetfCalcCalismaSure: TField;
begin
  if FfCalcCalismaSure = nil then
    FfCalcCalismaSure := FindField('_CALCCALISMASURE');
  Result := FfCalcCalismaSure;
end;

function TTableMamulRotaKaynak.GetfCalcToplamSure: TField;
begin
  if FfCalcToplamSure = nil then
    FfCalcToplamSure := FindField('_CALCTOPLAMSURE');
  Result := FfCalcToplamSure;
end;

function TTableMamulRotaKaynak.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableMamulRotaKaynak.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableMamulRotaKaynak.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableMamulRotaKaynak.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableMamulRotaKaynak.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableMamulRotaKaynak.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableMamulRotaKaynak.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableMamulRotaKaynak.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableMamulRotaKaynak.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableMamulRotaKaynak.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableMamulRotaKaynak.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMamulRotaKaynak.GetfIsMerkezKod: TField;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod;
end;

function TTableMamulRotaKaynak.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableMamulRotaKaynak.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableMamulRotaKaynak.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableMamulRotaKaynak.GetfKullanimSiraNo: TField;
begin
  if FfKullanimSiraNo = nil then
    FfKullanimSiraNo := FindField('KULLANIMSIRANO');
  Result := FfKullanimSiraNo;
end;

function TTableMamulRotaKaynak.GetfKullanimTip: TField;
begin
  if FfKullanimTip = nil then
    FfKullanimTip := FindField('KULLANIMTIP');
  Result := FfKullanimTip;
end;

function TTableMamulRotaKaynak.GetfKurulumKod1: TField;
begin
  if FfKurulumKod1 = nil then
    FfKurulumKod1 := FindField('MAMBAS_KURULUMKOD1');
  Result := FfKurulumKod1;
end;

function TTableMamulRotaKaynak.GetfKurulumKod2: TField;
begin
  if FfKurulumKod2 = nil then
    FfKurulumKod2 := FindField('MAMBAS_KURULUMKOD2');
  Result := FfKurulumKod2;
end;

function TTableMamulRotaKaynak.GetfKurulumKod3: TField;
begin
  if FfKurulumKod3 = nil then
    FfKurulumKod3 := FindField('MAMBAS_KURULUMKOD3');
  Result := FfKurulumKod3;
end;

function TTableMamulRotaKaynak.GetfKurulumKod4: TField;
begin
  if FfKurulumKod4 = nil then
    FfKurulumKod4 := FindField('MAMBAS_KURULUMKOD4');
  Result := FfKurulumKod4;
end;

function TTableMamulRotaKaynak.GetfKurulumKod5: TField;
begin
  if FfKurulumKod5 = nil then
    FfKurulumKod5 := FindField('MAMBAS_KURULUMKOD5');
  Result := FfKurulumKod5;
end;

function TTableMamulRotaKaynak.GetfSokumKod1: TField;
begin
  if FfSokumKod1 = nil then
    FfSokumKod1 := FindField('MAMBAS_SOKUMKOD1');
  Result := FfSokumKod1;
end;

function TTableMamulRotaKaynak.GetfSokumKod2: TField;
begin
  if FfSokumKod2 = nil then
    FfSokumKod2 := FindField('MAMBAS_SOKUMKOD2');
  Result := FfSokumKod2;
end;

function TTableMamulRotaKaynak.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableMamulRotaKaynak.GetfOperasyonNo: TField;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo;
end;

function TTableMamulRotaKaynak.GetfReceteNo: TField;
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  Result := FfReceteNo;
end;

function TTableMamulRotaKaynak.GetfRevizyonNo: TField;
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  Result := FfRevizyonNo;
end;

function TTableMamulRotaKaynak.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMamulRotaKaynak.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableMamulRotaKaynak.GetfSurumNo: TField;
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  Result := FfSurumNo;
end;

function TTableMamulRotaKaynak.GetfKaynakCalismaSure: TField;
begin
  if FfKaynakCalismaSure = nil then
    FfKaynakCalismaSure := FindField('URTKYN_CALISMASURE');
  Result := FfKaynakCalismaSure;
end;

function TTableMamulRotaKaynak.GetfKaynakAd: TField;
begin
  if FfKaynakAd = nil then
    FfKaynakAd := FindField('URTKYN_KAYNAKAD');
  Result := FfKaynakAd;
end;

function TTableMamulRotaKaynak.GetfKaynakKurulumSure: TField;
begin
  if FfKaynakKurulumSure = nil then
    FfKaynakKurulumSure := FindField('URTKYN_KURULUMSURE');
  Result := FfKaynakKurulumSure;
end;

function TTableMamulRotaKaynak.GetfKaynakSokumSure: TField;
begin
  if FfKaynakSokumSure = nil then
    FfKaynakSokumSure := FindField('URTKYN_SOKUMSURE');
  Result := FfKaynakSokumSure;
end;

function TTableMamulRotaKaynak.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableMamulRotaKaynak.SetCalcCalismaSure(const Value: Double);
begin
  if FfCalcCalismaSure = nil then
    FfCalcCalismaSure := FindField('_CALCCALISMASURE');
  FfCalcCalismaSure.AsFloat := Value;
end;

procedure TTableMamulRotaKaynak.SetCalcToplamSure(const Value: Double);
begin
  if FfCalcToplamSure = nil then
    FfCalcToplamSure := FindField('_CALCTOPLAMSURE');
  FfCalcToplamSure.AsFloat := Value;
end;

procedure TTableMamulRotaKaynak.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableMamulRotaKaynak.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableMamulRotaKaynak.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableMamulRotaKaynak.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableMamulRotaKaynak.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMamulRotaKaynak.SetIsMerkezKod(const Value: String);
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  FfIsMerkezKod.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableMamulRotaKaynak.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableMamulRotaKaynak.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetKullanimSiraNo(const Value: Integer);
begin
  if FfKullanimSiraNo = nil then
    FfKullanimSiraNo := FindField('KULLANIMSIRANO');
  FfKullanimSiraNo.AsInteger := Value;
end;

procedure TTableMamulRotaKaynak.SetKullanimTip(const Value: Integer);
begin
  if FfKullanimTip = nil then
    FfKullanimTip := FindField('KULLANIMTIP');
  FfKullanimTip.AsInteger := Value;
end;

procedure TTableMamulRotaKaynak.SetKurulumKod1(const Value: String);
begin
  if FfKurulumKod1 = nil then
    FfKurulumKod1 := FindField('MAMBAS_KURULUMKOD1');
  FfKurulumKod1.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetKurulumKod2(const Value: String);
begin
  if FfKurulumKod2 = nil then
    FfKurulumKod2 := FindField('MAMBAS_KURULUMKOD2');
  FfKurulumKod2.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetKurulumKod3(const Value: String);
begin
  if FfKurulumKod3 = nil then
    FfKurulumKod3 := FindField('MAMBAS_KURULUMKOD3');
  FfKurulumKod3.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetKurulumKod4(const Value: String);
begin
  if FfKurulumKod4 = nil then
    FfKurulumKod4 := FindField('MAMBAS_KURULUMKOD4');
  FfKurulumKod4.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetKurulumKod5(const Value: String);
begin
  if FfKurulumKod5 = nil then
    FfKurulumKod5 := FindField('MAMBAS_KURULUMKOD5');
  FfKurulumKod5.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetSokumKod1(const Value: String);
begin
  if FfSokumKod1 = nil then
    FfSokumKod1 := FindField('MAMBAS_SOKUMKOD1');
  FfSokumKod1.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetSokumKod2(const Value: String);
begin
  if FfSokumKod2 = nil then
    FfSokumKod2 := FindField('MAMBAS_SOKUMKOD2');
  FfSokumKod2.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetOperasyonNo(const Value: Integer);
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  FfOperasyonNo.AsInteger := Value;
end;

procedure TTableMamulRotaKaynak.SetReceteNo(const Value: String);
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  FfReceteNo.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetRevizyonNo(const Value: String);
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  FfRevizyonNo.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetSurumNo(const Value: Integer);
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  FfSurumNo.AsInteger := Value;
end;

procedure TTableMamulRotaKaynak.SetKaynakCalismaSure(const Value: Double);
begin
  if FfKaynakCalismaSure = nil then
    FfKaynakCalismaSure := FindField('URTKYN_CALISMASURE');
  FfKaynakCalismaSure.AsFloat := Value;
end;

procedure TTableMamulRotaKaynak.SetKaynakAd(const Value: String);
begin
  if FfKaynakAd = nil then
    FfKaynakAd := FindField('URTKYN_KAYNAKAD');
  FfKaynakAd.AsString := Value;
end;

procedure TTableMamulRotaKaynak.SetKaynakKurulumSure(const Value: Double);
begin
  if FfKaynakKurulumSure = nil then
    FfKaynakKurulumSure := FindField('URTKYN_KURULUMSURE');
  FfKaynakKurulumSure.AsFloat := Value;
end;

procedure TTableMamulRotaKaynak.SetKaynakSokumSure(const Value: Double);
begin
  if FfKaynakSokumSure = nil then
    FfKaynakSokumSure := FindField('URTKYN_SOKUMSURE');
  FfKaynakSokumSure.AsFloat := Value;
end;

procedure TTableMamulRotaKaynak.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableMamulRevizyon }

constructor TTableMamulRevizyon.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MAMREV';
end;

procedure TTableMamulRevizyon.DoAfterOpen;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
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
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
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
  if FfTarih1 = nil then
    FfTarih1 := FindField('TARIH1');
  if FfTarih2 = nil then
    FfTarih2 := FindField('TARIH2');
  if FfTarih3 = nil then
    FfTarih3 := FindField('TARIH3');
  if FfTarih4 = nil then
    FfTarih4 := FindField('TARIH4');
  if FfTarih5 = nil then
    FfTarih5 := FindField('TARIH5');
  inherited;
end;

procedure TTableMamulRevizyon.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfBasTarih := nil;
    FfBitTarih := nil;
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
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfID := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfLKod1 := nil;
    FfLKod2 := nil;
    FfLKod3 := nil;
    FfLKod4 := nil;
    FfLKod5 := nil;
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
    FfReceteNo := nil;
    FfRevizyonNo := nil;
    FfRowGuid := nil;
    FfSirketNo := nil;
    FfSKod1 := nil;
    FfSKod2 := nil;
    FfSKod3 := nil;
    FfSKod4 := nil;
    FfSKod5 := nil;
    FfTarih1 := nil;
    FfTarih2 := nil;
    FfTarih3 := nil;
    FfTarih4 := nil;
    FfTarih5 := nil;
  end;
  inherited;
end;

function TTableMamulRevizyon.GetBasTarih: TDate;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih.AsDateTime;
end;

function TTableMamulRevizyon.GetBitTarih: TDate;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih.AsDateTime;
end;

function TTableMamulRevizyon.GetBKod1: Integer;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1.AsInteger;
end;

function TTableMamulRevizyon.GetBKod2: Integer;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2.AsInteger;
end;

function TTableMamulRevizyon.GetBKod3: Integer;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3.AsInteger;
end;

function TTableMamulRevizyon.GetBKod4: Integer;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4.AsInteger;
end;

function TTableMamulRevizyon.GetBKod5: Integer;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5.AsInteger;
end;

function TTableMamulRevizyon.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableMamulRevizyon.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableMamulRevizyon.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableMamulRevizyon.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableMamulRevizyon.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableMamulRevizyon.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableMamulRevizyon.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableMamulRevizyon.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableMamulRevizyon.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableMamulRevizyon.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableMamulRevizyon.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMamulRevizyon.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableMamulRevizyon.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableMamulRevizyon.GetLKod1: String;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1.AsString;
end;

function TTableMamulRevizyon.GetLKod2: String;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2.AsString;
end;

function TTableMamulRevizyon.GetLKod3: String;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3.AsString;
end;

function TTableMamulRevizyon.GetLKod4: String;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4.AsString;
end;

function TTableMamulRevizyon.GetLKod5: String;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5.AsString;
end;

function TTableMamulRevizyon.GetMKod1: String;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1.AsString;
end;

function TTableMamulRevizyon.GetMKod2: String;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2.AsString;
end;

function TTableMamulRevizyon.GetMKod3: String;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3.AsString;
end;

function TTableMamulRevizyon.GetMKod4: String;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4.AsString;
end;

function TTableMamulRevizyon.GetMKod5: String;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5.AsString;
end;

function TTableMamulRevizyon.GetNKod1: Double;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1.AsFloat;
end;

function TTableMamulRevizyon.GetNKod2: Double;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2.AsFloat;
end;

function TTableMamulRevizyon.GetNKod3: Double;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3.AsFloat;
end;

function TTableMamulRevizyon.GetNKod4: Double;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4.AsFloat;
end;

function TTableMamulRevizyon.GetNKod5: Double;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5.AsFloat;
end;

function TTableMamulRevizyon.GetReceteNo: String;
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  Result := FfReceteNo.AsString;
end;

function TTableMamulRevizyon.GetRevizyonNo: String;
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  Result := FfRevizyonNo.AsString;
end;

function TTableMamulRevizyon.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMamulRevizyon.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMamulRevizyon.GetSKod1: String;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1.AsString;
end;

function TTableMamulRevizyon.GetSKod2: String;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2.AsString;
end;

function TTableMamulRevizyon.GetSKod3: String;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3.AsString;
end;

function TTableMamulRevizyon.GetSKod4: String;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4.AsString;
end;

function TTableMamulRevizyon.GetSKod5: String;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5.AsString;
end;

function TTableMamulRevizyon.GetTarih1: TDate;
begin
  if FfTarih1 = nil then
    FfTarih1 := FindField('TARIH1');
  Result := FfTarih1.AsDateTime;
end;

function TTableMamulRevizyon.GetTarih2: TDate;
begin
  if FfTarih2 = nil then
    FfTarih2 := FindField('TARIH2');
  Result := FfTarih2.AsDateTime;
end;

function TTableMamulRevizyon.GetTarih3: TDate;
begin
  if FfTarih3 = nil then
    FfTarih3 := FindField('TARIH3');
  Result := FfTarih3.AsDateTime;
end;

function TTableMamulRevizyon.GetTarih4: TDate;
begin
  if FfTarih4 = nil then
    FfTarih4 := FindField('TARIH4');
  Result := FfTarih4.AsDateTime;
end;

function TTableMamulRevizyon.GetTarih5: TDate;
begin
  if FfTarih5 = nil then
    FfTarih5 := FindField('TARIH5');
  Result := FfTarih5.AsDateTime;
end;

function TTableMamulRevizyon.GetfBasTarih: TField;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih;
end;

function TTableMamulRevizyon.GetfBitTarih: TField;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih;
end;

function TTableMamulRevizyon.GetfBKod1: TField;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1;
end;

function TTableMamulRevizyon.GetfBKod2: TField;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2;
end;

function TTableMamulRevizyon.GetfBKod3: TField;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3;
end;

function TTableMamulRevizyon.GetfBKod4: TField;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4;
end;

function TTableMamulRevizyon.GetfBKod5: TField;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5;
end;

function TTableMamulRevizyon.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableMamulRevizyon.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableMamulRevizyon.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableMamulRevizyon.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableMamulRevizyon.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableMamulRevizyon.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableMamulRevizyon.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableMamulRevizyon.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableMamulRevizyon.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableMamulRevizyon.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableMamulRevizyon.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMamulRevizyon.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableMamulRevizyon.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableMamulRevizyon.GetfLKod1: TField;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1;
end;

function TTableMamulRevizyon.GetfLKod2: TField;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2;
end;

function TTableMamulRevizyon.GetfLKod3: TField;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3;
end;

function TTableMamulRevizyon.GetfLKod4: TField;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4;
end;

function TTableMamulRevizyon.GetfLKod5: TField;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5;
end;

function TTableMamulRevizyon.GetfMKod1: TField;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1;
end;

function TTableMamulRevizyon.GetfMKod2: TField;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2;
end;

function TTableMamulRevizyon.GetfMKod3: TField;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3;
end;

function TTableMamulRevizyon.GetfMKod4: TField;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4;
end;

function TTableMamulRevizyon.GetfMKod5: TField;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5;
end;

function TTableMamulRevizyon.GetfNKod1: TField;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1;
end;

function TTableMamulRevizyon.GetfNKod2: TField;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2;
end;

function TTableMamulRevizyon.GetfNKod3: TField;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3;
end;

function TTableMamulRevizyon.GetfNKod4: TField;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4;
end;

function TTableMamulRevizyon.GetfNKod5: TField;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5;
end;

function TTableMamulRevizyon.GetfReceteNo: TField;
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  Result := FfReceteNo;
end;

function TTableMamulRevizyon.GetfRevizyonNo: TField;
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  Result := FfRevizyonNo;
end;

function TTableMamulRevizyon.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMamulRevizyon.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableMamulRevizyon.GetfSKod1: TField;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1;
end;

function TTableMamulRevizyon.GetfSKod2: TField;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2;
end;

function TTableMamulRevizyon.GetfSKod3: TField;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3;
end;

function TTableMamulRevizyon.GetfSKod4: TField;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4;
end;

function TTableMamulRevizyon.GetfSKod5: TField;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5;
end;

function TTableMamulRevizyon.GetfTarih1: TField;
begin
  if FfTarih1 = nil then
    FfTarih1 := FindField('TARIH1');
  Result := FfTarih1;
end;

function TTableMamulRevizyon.GetfTarih2: TField;
begin
  if FfTarih2 = nil then
    FfTarih2 := FindField('TARIH2');
  Result := FfTarih2;
end;

function TTableMamulRevizyon.GetfTarih3: TField;
begin
  if FfTarih3 = nil then
    FfTarih3 := FindField('TARIH3');
  Result := FfTarih3;
end;

function TTableMamulRevizyon.GetfTarih4: TField;
begin
  if FfTarih4 = nil then
    FfTarih4 := FindField('TARIH4');
  Result := FfTarih4;
end;

function TTableMamulRevizyon.GetfTarih5: TField;
begin
  if FfTarih5 = nil then
    FfTarih5 := FindField('TARIH5');
  Result := FfTarih5;
end;

procedure TTableMamulRevizyon.SetBasTarih(const Value: TDate);
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  FfBasTarih.AsDateTime := Value;
end;

procedure TTableMamulRevizyon.SetBitTarih(const Value: TDate);
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  FfBitTarih.AsDateTime := Value;
end;

procedure TTableMamulRevizyon.SetBKod1(const Value: Integer);
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  FfBKod1.AsInteger := Value;
end;

procedure TTableMamulRevizyon.SetBKod2(const Value: Integer);
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  FfBKod2.AsInteger := Value;
end;

procedure TTableMamulRevizyon.SetBKod3(const Value: Integer);
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  FfBKod3.AsInteger := Value;
end;

procedure TTableMamulRevizyon.SetBKod4(const Value: Integer);
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  FfBKod4.AsInteger := Value;
end;

procedure TTableMamulRevizyon.SetBKod5(const Value: Integer);
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  FfBKod5.AsInteger := Value;
end;

procedure TTableMamulRevizyon.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableMamulRevizyon.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableMamulRevizyon.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableMamulRevizyon.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableMamulRevizyon.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableMamulRevizyon.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableMamulRevizyon.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableMamulRevizyon.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableMamulRevizyon.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableMamulRevizyon.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableMamulRevizyon.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMamulRevizyon.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableMamulRevizyon.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableMamulRevizyon.SetLKod1(const Value: String);
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  FfLKod1.AsString := Value;
end;

procedure TTableMamulRevizyon.SetLKod2(const Value: String);
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  FfLKod2.AsString := Value;
end;

procedure TTableMamulRevizyon.SetLKod3(const Value: String);
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  FfLKod3.AsString := Value;
end;

procedure TTableMamulRevizyon.SetLKod4(const Value: String);
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  FfLKod4.AsString := Value;
end;

procedure TTableMamulRevizyon.SetLKod5(const Value: String);
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  FfLKod5.AsString := Value;
end;

procedure TTableMamulRevizyon.SetMKod1(const Value: String);
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  FfMKod1.AsString := Value;
end;

procedure TTableMamulRevizyon.SetMKod2(const Value: String);
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  FfMKod2.AsString := Value;
end;

procedure TTableMamulRevizyon.SetMKod3(const Value: String);
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  FfMKod3.AsString := Value;
end;

procedure TTableMamulRevizyon.SetMKod4(const Value: String);
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  FfMKod4.AsString := Value;
end;

procedure TTableMamulRevizyon.SetMKod5(const Value: String);
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  FfMKod5.AsString := Value;
end;

procedure TTableMamulRevizyon.SetNKod1(const Value: Double);
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  FfNKod1.AsFloat := Value;
end;

procedure TTableMamulRevizyon.SetNKod2(const Value: Double);
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  FfNKod2.AsFloat := Value;
end;

procedure TTableMamulRevizyon.SetNKod3(const Value: Double);
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  FfNKod3.AsFloat := Value;
end;

procedure TTableMamulRevizyon.SetNKod4(const Value: Double);
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  FfNKod4.AsFloat := Value;
end;

procedure TTableMamulRevizyon.SetNKod5(const Value: Double);
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  FfNKod5.AsFloat := Value;
end;

procedure TTableMamulRevizyon.SetReceteNo(const Value: String);
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  FfReceteNo.AsString := Value;
end;

procedure TTableMamulRevizyon.SetRevizyonNo(const Value: String);
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  FfRevizyonNo.AsString := Value;
end;

procedure TTableMamulRevizyon.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMamulRevizyon.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableMamulRevizyon.SetSKod1(const Value: String);
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  FfSKod1.AsString := Value;
end;

procedure TTableMamulRevizyon.SetSKod2(const Value: String);
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  FfSKod2.AsString := Value;
end;

procedure TTableMamulRevizyon.SetSKod3(const Value: String);
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  FfSKod3.AsString := Value;
end;

procedure TTableMamulRevizyon.SetSKod4(const Value: String);
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  FfSKod4.AsString := Value;
end;

procedure TTableMamulRevizyon.SetSKod5(const Value: String);
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  FfSKod5.AsString := Value;
end;

procedure TTableMamulRevizyon.SetTarih1(const Value: TDate);
begin
  if FfTarih1 = nil then
    FfTarih1 := FindField('TARIH1');
  FfTarih1.AsDateTime := Value;
end;

procedure TTableMamulRevizyon.SetTarih2(const Value: TDate);
begin
  if FfTarih2 = nil then
    FfTarih2 := FindField('TARIH2');
  FfTarih2.AsDateTime := Value;
end;

procedure TTableMamulRevizyon.SetTarih3(const Value: TDate);
begin
  if FfTarih3 = nil then
    FfTarih3 := FindField('TARIH3');
  FfTarih3.AsDateTime := Value;
end;

procedure TTableMamulRevizyon.SetTarih4(const Value: TDate);
begin
  if FfTarih4 = nil then
    FfTarih4 := FindField('TARIH4');
  FfTarih4.AsDateTime := Value;
end;

procedure TTableMamulRevizyon.SetTarih5(const Value: TDate);
begin
  if FfTarih5 = nil then
    FfTarih5 := FindField('TARIH5');
  FfTarih5.AsDateTime := Value;
end;

{ TTableMamulRotaSonrakiOperasyon }

constructor TTableMamulRotaSonrakiOperasyon.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MAMROP';
end;

procedure TTableMamulRotaSonrakiOperasyon.DoAfterOpen;
begin
  if FfID = nil then
    FfID := FindField('ID');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfSonrakiOperasyonNo = nil then
    FfSonrakiOperasyonNo := FindField('SONRAKIOPERASYONNO');
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableMamulRotaSonrakiOperasyon.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfID := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfMamulKod := nil;
    FfOperasyonNo := nil;
    FfReceteNo := nil;
    FfRevizyonNo := nil;
    FfRowGuid := nil;
    FfSirketNo := nil;
    FfSonrakiOperasyonNo := nil;
    FfSurumNo := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableMamulRotaSonrakiOperasyon.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMamulRotaSonrakiOperasyon.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableMamulRotaSonrakiOperasyon.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableMamulRotaSonrakiOperasyon.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableMamulRotaSonrakiOperasyon.GetOperasyonNo: Integer;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo.AsInteger;
end;

function TTableMamulRotaSonrakiOperasyon.GetReceteNo: String;
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  Result := FfReceteNo.AsString;
end;

function TTableMamulRotaSonrakiOperasyon.GetRevizyonNo: String;
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  Result := FfRevizyonNo.AsString;
end;

function TTableMamulRotaSonrakiOperasyon.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMamulRotaSonrakiOperasyon.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMamulRotaSonrakiOperasyon.GetSonrakiOperasyonNo: Integer;
begin
  if FfSonrakiOperasyonNo = nil then
    FfSonrakiOperasyonNo := FindField('SONRAKIOPERASYONNO');
  Result := FfSonrakiOperasyonNo.AsInteger;
end;

function TTableMamulRotaSonrakiOperasyon.GetSurumNo: Integer;
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  Result := FfSurumNo.AsInteger;
end;

function TTableMamulRotaSonrakiOperasyon.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableMamulRotaSonrakiOperasyon.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMamulRotaSonrakiOperasyon.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableMamulRotaSonrakiOperasyon.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableMamulRotaSonrakiOperasyon.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableMamulRotaSonrakiOperasyon.GetfOperasyonNo: TField;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo;
end;

function TTableMamulRotaSonrakiOperasyon.GetfReceteNo: TField;
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  Result := FfReceteNo;
end;

function TTableMamulRotaSonrakiOperasyon.GetfRevizyonNo: TField;
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  Result := FfRevizyonNo;
end;

function TTableMamulRotaSonrakiOperasyon.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMamulRotaSonrakiOperasyon.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableMamulRotaSonrakiOperasyon.GetfSonrakiOperasyonNo: TField;
begin
  if FfSonrakiOperasyonNo = nil then
    FfSonrakiOperasyonNo := FindField('SONRAKIOPERASYONNO');
  Result := FfSonrakiOperasyonNo;
end;

function TTableMamulRotaSonrakiOperasyon.GetfSurumNo: TField;
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  Result := FfSurumNo;
end;

function TTableMamulRotaSonrakiOperasyon.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableMamulRotaSonrakiOperasyon.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMamulRotaSonrakiOperasyon.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableMamulRotaSonrakiOperasyon.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableMamulRotaSonrakiOperasyon.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableMamulRotaSonrakiOperasyon.SetOperasyonNo(const Value: Integer);
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  FfOperasyonNo.AsInteger := Value;
end;

procedure TTableMamulRotaSonrakiOperasyon.SetReceteNo(const Value: String);
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  FfReceteNo.AsString := Value;
end;

procedure TTableMamulRotaSonrakiOperasyon.SetRevizyonNo(const Value: String);
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  FfRevizyonNo.AsString := Value;
end;

procedure TTableMamulRotaSonrakiOperasyon.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMamulRotaSonrakiOperasyon.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableMamulRotaSonrakiOperasyon.SetSonrakiOperasyonNo(const Value: Integer);
begin
  if FfSonrakiOperasyonNo = nil then
    FfSonrakiOperasyonNo := FindField('SONRAKIOPERASYONNO');
  FfSonrakiOperasyonNo.AsInteger := Value;
end;

procedure TTableMamulRotaSonrakiOperasyon.SetSurumNo(const Value: Integer);
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  FfSurumNo.AsInteger := Value;
end;

procedure TTableMamulRotaSonrakiOperasyon.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableMamulRota }

constructor TTableMamulRota.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MAMROT';
end;

procedure TTableMamulRota.DoAfterOpen;
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
  if FfKaynakKullanimTip = nil then
    FfKaynakKullanimTip := FindField('KAYNAKKULLANIMTIP');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  if FfIsMerkezAd = nil then
    FfIsMerkezAd := FindField('URTISM_ISMERKEZAD');
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('URTISM_MALIYET1');
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('URTISM_MALIYET2');
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('URTISM_MALIYET3');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableMamulRota.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfDegistirenKaynak := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfID := nil;
    FfIsMerkezKod := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKaynakKullanimTip := nil;
    FfMamulKod := nil;
    FfOperasyonNo := nil;
    FfReceteNo := nil;
    FfRevizyonNo := nil;
    FfRowGuid := nil;
    FfSirketNo := nil;
    FfSurumNo := nil;
    FfIsMerkezAd := nil;
    FfMaliyet1 := nil;
    FfMaliyet2 := nil;
    FfMaliyet3 := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableMamulRota.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableMamulRota.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableMamulRota.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableMamulRota.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableMamulRota.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableMamulRota.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableMamulRota.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableMamulRota.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableMamulRota.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableMamulRota.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableMamulRota.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableMamulRota.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMamulRota.GetIsMerkezKod: String;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod.AsString;
end;

function TTableMamulRota.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableMamulRota.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableMamulRota.GetKaynakKullanimTip: Integer;
begin
  if FfKaynakKullanimTip = nil then
    FfKaynakKullanimTip := FindField('KAYNAKKULLANIMTIP');
  Result := FfKaynakKullanimTip.AsInteger;
end;

function TTableMamulRota.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableMamulRota.GetOperasyonNo: Integer;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo.AsInteger;
end;

function TTableMamulRota.GetReceteNo: String;
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  Result := FfReceteNo.AsString;
end;

function TTableMamulRota.GetRevizyonNo: String;
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  Result := FfRevizyonNo.AsString;
end;

function TTableMamulRota.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMamulRota.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMamulRota.GetSurumNo: Integer;
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  Result := FfSurumNo.AsInteger;
end;

function TTableMamulRota.GetIsMerkezAd: String;
begin
  if FfIsMerkezAd = nil then
    FfIsMerkezAd := FindField('URTISM_ISMERKEZAD');
  Result := FfIsMerkezAd.AsString;
end;

function TTableMamulRota.GetMaliyet1: Double;
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('URTISM_MALIYET1');
  Result := FfMaliyet1.AsFloat;
end;

function TTableMamulRota.GetMaliyet2: Double;
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('URTISM_MALIYET2');
  Result := FfMaliyet2.AsFloat;
end;

function TTableMamulRota.GetMaliyet3: Double;
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('URTISM_MALIYET3');
  Result := FfMaliyet3.AsFloat;
end;

function TTableMamulRota.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableMamulRota.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableMamulRota.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableMamulRota.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableMamulRota.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableMamulRota.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableMamulRota.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableMamulRota.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableMamulRota.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableMamulRota.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableMamulRota.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableMamulRota.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableMamulRota.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMamulRota.GetfIsMerkezKod: TField;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod;
end;

function TTableMamulRota.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableMamulRota.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableMamulRota.GetfKaynakKullanimTip: TField;
begin
  if FfKaynakKullanimTip = nil then
    FfKaynakKullanimTip := FindField('KAYNAKKULLANIMTIP');
  Result := FfKaynakKullanimTip;
end;

function TTableMamulRota.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableMamulRota.GetfOperasyonNo: TField;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo;
end;

function TTableMamulRota.GetfReceteNo: TField;
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  Result := FfReceteNo;
end;

function TTableMamulRota.GetfRevizyonNo: TField;
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  Result := FfRevizyonNo;
end;

function TTableMamulRota.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMamulRota.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableMamulRota.GetfSurumNo: TField;
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  Result := FfSurumNo;
end;

function TTableMamulRota.GetfIsMerkezAd: TField;
begin
  if FfIsMerkezAd = nil then
    FfIsMerkezAd := FindField('URTISM_ISMERKEZAD');
  Result := FfIsMerkezAd;
end;

function TTableMamulRota.GetfMaliyet1: TField;
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('URTISM_MALIYET1');
  Result := FfMaliyet1;
end;

function TTableMamulRota.GetfMaliyet2: TField;
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('URTISM_MALIYET2');
  Result := FfMaliyet2;
end;

function TTableMamulRota.GetfMaliyet3: TField;
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('URTISM_MALIYET3');
  Result := FfMaliyet3;
end;

function TTableMamulRota.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableMamulRota.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableMamulRota.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableMamulRota.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableMamulRota.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableMamulRota.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableMamulRota.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableMamulRota.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableMamulRota.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableMamulRota.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableMamulRota.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableMamulRota.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableMamulRota.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMamulRota.SetIsMerkezKod(const Value: String);
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  FfIsMerkezKod.AsString := Value;
end;

procedure TTableMamulRota.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableMamulRota.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableMamulRota.SetKaynakKullanimTip(const Value: Integer);
begin
  if FfKaynakKullanimTip = nil then
    FfKaynakKullanimTip := FindField('KAYNAKKULLANIMTIP');
  FfKaynakKullanimTip.AsInteger := Value;
end;

procedure TTableMamulRota.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableMamulRota.SetOperasyonNo(const Value: Integer);
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  FfOperasyonNo.AsInteger := Value;
end;

procedure TTableMamulRota.SetReceteNo(const Value: String);
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  FfReceteNo.AsString := Value;
end;

procedure TTableMamulRota.SetRevizyonNo(const Value: String);
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  FfRevizyonNo.AsString := Value;
end;

procedure TTableMamulRota.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMamulRota.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableMamulRota.SetSurumNo(const Value: Integer);
begin
  if FfSurumNo = nil then
    FfSurumNo := FindField('SURUMNO');
  FfSurumNo.AsInteger := Value;
end;

procedure TTableMamulRota.SetIsMerkezAd(const Value: String);
begin
  if FfIsMerkezAd = nil then
    FfIsMerkezAd := FindField('URTISM_ISMERKEZAD');
  FfIsMerkezAd.AsString := Value;
end;

procedure TTableMamulRota.SetMaliyet1(const Value: Double);
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('URTISM_MALIYET1');
  FfMaliyet1.AsFloat := Value;
end;

procedure TTableMamulRota.SetMaliyet2(const Value: Double);
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('URTISM_MALIYET2');
  FfMaliyet2.AsFloat := Value;
end;

procedure TTableMamulRota.SetMaliyet3(const Value: Double);
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('URTISM_MALIYET3');
  FfMaliyet3.AsFloat := Value;
end;

procedure TTableMamulRota.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableMamulYanUrun }

constructor TTableMamulYanUrun.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'MAMYAN';
end;

procedure TTableMamulYanUrun.DoAfterOpen;
begin
  if FfMaliyet = nil then
    FfMaliyet := FindField('_MALIYET');
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
  if FfYerelMaliyet = nil then
    FfYerelMaliyet := FindField('_YERELMALIYET');
  if FfYerelMaliyet1 = nil then
    FfYerelMaliyet1 := FindField('_YERELMALIYET1');
  if FfYerelMaliyet2 = nil then
    FfYerelMaliyet2 := FindField('_YERELMALIYET2');
  if FfYerelMaliyet3 = nil then
    FfYerelMaliyet3 := FindField('_YERELMALIYET3');
  if FfYerelMaliyetGrup1 = nil then
    FfYerelMaliyetGrup1 := FindField('_YERELMALIYETGRUP1');
  if FfYerelMaliyetGrup2 = nil then
    FfYerelMaliyetGrup2 := FindField('_YERELMALIYETGRUP2');
  if FfYerelMaliyetGrup3 = nil then
    FfYerelMaliyetGrup3 := FindField('_YERELMALIYETGRUP3');
  if FfYerelMaliyetGrup4 = nil then
    FfYerelMaliyetGrup4 := FindField('_YERELMALIYETGRUP4');
  if FfYerelMaliyetGrupDiger = nil then
    FfYerelMaliyetGrupDiger := FindField('_YERELMALIYETGRUPDIGER');
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
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
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
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
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
  if FfMaliyetOran = nil then
    FfMaliyetOran := FindField('MALIYETORAN');
  if FfMaliyetTip = nil then
    FfMaliyetTip := FindField('MALIYETTIP');
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  if FfMamulBirim = nil then
    FfMamulBirim := FindField('MAMBAS_BIRIM');
  if FfMamulDepoKod = nil then
    FfMamulDepoKod := FindField('MAMBAS_MAMULDEPOKOD');
  if FfMamulMalKod = nil then
    FfMamulMalKod := FindField('MAMBAS_MAMULKOD');
  if FfMamulVersiyonNo = nil then
    FfMamulVersiyonNo := FindField('MAMBAS_VERSIYONNO');
  if FfMamulStokBirimKatSayi = nil then
    FfMamulStokBirimKatSayi := FindField('MAMBRM_KATSAYI');
  if FfMamulStokKartBirim = nil then
    FfMamulStokKartBirim := FindField('MAMSTK_BIRIM');
  if FfMamulStokKartMontajFireOran = nil then
    FfMamulStokKartMontajFireOran := FindField('MAMSTK_MONTAJFIREORAN');
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
  if FfNKod6 = nil then
    FfNKod6 := FindField('NKOD6');
  if FfNKod7 = nil then
    FfNKod7 := FindField('NKOD7');
  if FfNKod8 = nil then
    FfNKod8 := FindField('NKOD8');
  if FfNKod9 = nil then
    FfNKod9 := FindField('NKOD9');
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
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
  if FfHammaddeStokBirimKatsayi = nil then
    FfHammaddeStokBirimKatsayi := FindField('STKBRM_KATSAYI');
  if FfHammaddeStokKartBilesenFireOran = nil then
    FfHammaddeStokKartBilesenFireOran := FindField('STKKRT_BILESENFIREORAN');
  if FfHammaddeStokKartBirim = nil then
    FfHammaddeStokKartBirim := FindField('STKKRT_BIRIM');
  if FfHammaddeStokKartMaliyetGrupNo = nil then
    FfHammaddeStokKartMaliyetGrupNo := FindField('STKKRT_GRUPNO');
  if FfHammaddeStokKartMRPTip = nil then
    FfHammaddeStokKartMRPTip := FindField('STKKRT_MRPTIP');
  if FfHammaddeStokKartTeminTip = nil then
    FfHammaddeStokKartTeminTip := FindField('STKKRT_TEMINTIP');
  if FfHammaddeStokKartTeminYontem = nil then
    FfHammaddeStokKartTeminYontem := FindField('STKKRT_TEMINYONTEM');
  if FfHammaddeStokKartYuvarlama = nil then
    FfHammaddeStokKartYuvarlama := FindField('STKKRT_YUVARLAMA');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  if FfYanUrunNo = nil then
    FfYanUrunNo := FindField('YANURUNNO');
  inherited;
end;

procedure TTableMamulYanUrun.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfMaliyet := nil;
    FfMaliyetGrup1 := nil;
    FfMaliyetGrup2 := nil;
    FfMaliyetGrup3 := nil;
    FfMaliyetGrup4 := nil;
    FfMaliyetGrupDiger := nil;
    FfYerelMaliyet := nil;
    FfYerelMaliyet1 := nil;
    FfYerelMaliyet2 := nil;
    FfYerelMaliyet3 := nil;
    FfYerelMaliyetGrup1 := nil;
    FfYerelMaliyetGrup2 := nil;
    FfYerelMaliyetGrup3 := nil;
    FfYerelMaliyetGrup4 := nil;
    FfYerelMaliyetGrupDiger := nil;
    FfAciklama1 := nil;
    FfAciklama2 := nil;
    FfAciklama3 := nil;
    FfAciklama4 := nil;
    FfAciklama5 := nil;
    FfBasTarih := nil;
    FfBirim := nil;
    FfBitTarih := nil;
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
    FfDepoKod := nil;
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfID := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfLKod1 := nil;
    FfLKod2 := nil;
    FfLKod3 := nil;
    FfLKod4 := nil;
    FfLKod5 := nil;
    FfMaliyetOran := nil;
    FfMaliyetTip := nil;
    FfMalKod := nil;
    FfMamulBirim := nil;
    FfMamulDepoKod := nil;
    FfMamulMalKod := nil;
    FfMamulVersiyonNo := nil;
    FfMamulStokBirimKatSayi := nil;
    FfMamulStokKartBirim := nil;
    FfMamulStokKartMontajFireOran := nil;
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
    FfNKod6 := nil;
    FfNKod7 := nil;
    FfNKod8 := nil;
    FfNKod9 := nil;
    FfOperasyonNo := nil;
    FfReceteNo := nil;
    FfRevizyonNo := nil;
    FfRowGuid := nil;
    FfSirketNo := nil;
    FfSKod1 := nil;
    FfSKod2 := nil;
    FfSKod3 := nil;
    FfSKod4 := nil;
    FfSKod5 := nil;
    FfHammaddeStokBirimKatsayi := nil;
    FfHammaddeStokKartBilesenFireOran := nil;
    FfHammaddeStokKartBirim := nil;
    FfHammaddeStokKartMaliyetGrupNo := nil;
    FfHammaddeStokKartMRPTip := nil;
    FfHammaddeStokKartTeminTip := nil;
    FfHammaddeStokKartTeminYontem := nil;
    FfHammaddeStokKartYuvarlama := nil;
    FfVersiyonNo := nil;
    FfYanUrunNo := nil;
  end;
  inherited;
end;

function TTableMamulYanUrun.GetMaliyet: Double;
begin
  if FfMaliyet = nil then
    FfMaliyet := FindField('_MALIYET');
  Result := FfMaliyet.AsFloat;
end;

function TTableMamulYanUrun.GetMaliyetGrup1: Double;
begin
  if FfMaliyetGrup1 = nil then
    FfMaliyetGrup1 := FindField('_MALIYETGRUP1');
  Result := FfMaliyetGrup1.AsFloat;
end;

function TTableMamulYanUrun.GetMaliyetGrup2: Double;
begin
  if FfMaliyetGrup2 = nil then
    FfMaliyetGrup2 := FindField('_MALIYETGRUP2');
  Result := FfMaliyetGrup2.AsFloat;
end;

function TTableMamulYanUrun.GetMaliyetGrup3: Double;
begin
  if FfMaliyetGrup3 = nil then
    FfMaliyetGrup3 := FindField('_MALIYETGRUP3');
  Result := FfMaliyetGrup3.AsFloat;
end;

function TTableMamulYanUrun.GetMaliyetGrup4: Double;
begin
  if FfMaliyetGrup4 = nil then
    FfMaliyetGrup4 := FindField('_MALIYETGRUP4');
  Result := FfMaliyetGrup4.AsFloat;
end;

function TTableMamulYanUrun.GetMaliyetGrupDiger: Double;
begin
  if FfMaliyetGrupDiger = nil then
    FfMaliyetGrupDiger := FindField('_MALIYETGRUPDIGER');
  Result := FfMaliyetGrupDiger.AsFloat;
end;

function TTableMamulYanUrun.GetYerelMaliyet: Double;
begin
  if FfYerelMaliyet = nil then
    FfYerelMaliyet := FindField('_YERELMALIYET');
  Result := FfYerelMaliyet.AsFloat;
end;

function TTableMamulYanUrun.GetYerelMaliyet1: Double;
begin
  if FfYerelMaliyet1 = nil then
    FfYerelMaliyet1 := FindField('_YERELMALIYET1');
  Result := FfYerelMaliyet1.AsFloat;
end;

function TTableMamulYanUrun.GetYerelMaliyet2: Double;
begin
  if FfYerelMaliyet2 = nil then
    FfYerelMaliyet2 := FindField('_YERELMALIYET2');
  Result := FfYerelMaliyet2.AsFloat;
end;

function TTableMamulYanUrun.GetYerelMaliyet3: Double;
begin
  if FfYerelMaliyet3 = nil then
    FfYerelMaliyet3 := FindField('_YERELMALIYET3');
  Result := FfYerelMaliyet3.AsFloat;
end;

function TTableMamulYanUrun.GetYerelMaliyetGrup1: Double;
begin
  if FfYerelMaliyetGrup1 = nil then
    FfYerelMaliyetGrup1 := FindField('_YERELMALIYETGRUP1');
  Result := FfYerelMaliyetGrup1.AsFloat;
end;

function TTableMamulYanUrun.GetYerelMaliyetGrup2: Double;
begin
  if FfYerelMaliyetGrup2 = nil then
    FfYerelMaliyetGrup2 := FindField('_YERELMALIYETGRUP2');
  Result := FfYerelMaliyetGrup2.AsFloat;
end;

function TTableMamulYanUrun.GetYerelMaliyetGrup3: Double;
begin
  if FfYerelMaliyetGrup3 = nil then
    FfYerelMaliyetGrup3 := FindField('_YERELMALIYETGRUP3');
  Result := FfYerelMaliyetGrup3.AsFloat;
end;

function TTableMamulYanUrun.GetYerelMaliyetGrup4: Double;
begin
  if FfYerelMaliyetGrup4 = nil then
    FfYerelMaliyetGrup4 := FindField('_YERELMALIYETGRUP4');
  Result := FfYerelMaliyetGrup4.AsFloat;
end;

function TTableMamulYanUrun.GetYerelMaliyetGrupDiger: Double;
begin
  if FfYerelMaliyetGrupDiger = nil then
    FfYerelMaliyetGrupDiger := FindField('_YERELMALIYETGRUPDIGER');
  Result := FfYerelMaliyetGrupDiger.AsFloat;
end;

function TTableMamulYanUrun.GetAciklama1: String;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1.AsString;
end;

function TTableMamulYanUrun.GetAciklama2: String;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2.AsString;
end;

function TTableMamulYanUrun.GetAciklama3: String;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3.AsString;
end;

function TTableMamulYanUrun.GetAciklama4: String;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4.AsString;
end;

function TTableMamulYanUrun.GetAciklama5: String;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5.AsString;
end;

function TTableMamulYanUrun.GetBasTarih: TDate;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih.AsDateTime;
end;

function TTableMamulYanUrun.GetBirim: String;
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  Result := FfBirim.AsString;
end;

function TTableMamulYanUrun.GetBitTarih: TDate;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih.AsDateTime;
end;

function TTableMamulYanUrun.GetBKod1: Integer;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1.AsInteger;
end;

function TTableMamulYanUrun.GetBKod2: Integer;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2.AsInteger;
end;

function TTableMamulYanUrun.GetBKod3: Integer;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3.AsInteger;
end;

function TTableMamulYanUrun.GetBKod4: Integer;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4.AsInteger;
end;

function TTableMamulYanUrun.GetBKod5: Integer;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5.AsInteger;
end;

function TTableMamulYanUrun.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableMamulYanUrun.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableMamulYanUrun.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableMamulYanUrun.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableMamulYanUrun.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableMamulYanUrun.GetDepoKod: String;
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  Result := FfDepoKod.AsString;
end;

function TTableMamulYanUrun.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableMamulYanUrun.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableMamulYanUrun.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableMamulYanUrun.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableMamulYanUrun.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableMamulYanUrun.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableMamulYanUrun.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableMamulYanUrun.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableMamulYanUrun.GetLKod1: String;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1.AsString;
end;

function TTableMamulYanUrun.GetLKod2: String;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2.AsString;
end;

function TTableMamulYanUrun.GetLKod3: String;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3.AsString;
end;

function TTableMamulYanUrun.GetLKod4: String;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4.AsString;
end;

function TTableMamulYanUrun.GetLKod5: String;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5.AsString;
end;

function TTableMamulYanUrun.GetMaliyetOran: Double;
begin
  if FfMaliyetOran = nil then
    FfMaliyetOran := FindField('MALIYETORAN');
  Result := FfMaliyetOran.AsFloat;
end;

function TTableMamulYanUrun.GetMaliyetTip: Integer;
begin
  if FfMaliyetTip = nil then
    FfMaliyetTip := FindField('MALIYETTIP');
  Result := FfMaliyetTip.AsInteger;
end;

function TTableMamulYanUrun.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableMamulYanUrun.GetMamulBirim: String;
begin
  if FfMamulBirim = nil then
    FfMamulBirim := FindField('MAMBAS_BIRIM');
  Result := FfMamulBirim.AsString;
end;

function TTableMamulYanUrun.GetMamulDepoKod: String;
begin
  if FfMamulDepoKod = nil then
    FfMamulDepoKod := FindField('MAMBAS_MAMULDEPOKOD');
  Result := FfMamulDepoKod.AsString;
end;

function TTableMamulYanUrun.GetMamulMalKod: String;
begin
  if FfMamulMalKod = nil then
    FfMamulMalKod := FindField('MAMBAS_MAMULKOD');
  Result := FfMamulMalKod.AsString;
end;

function TTableMamulYanUrun.GetMamulVersiyonNo: String;
begin
  if FfMamulVersiyonNo = nil then
    FfMamulVersiyonNo := FindField('MAMBAS_VERSIYONNO');
  Result := FfMamulVersiyonNo.AsString;
end;

function TTableMamulYanUrun.GetMamulStokBirimKatSayi: Double;
begin
  if FfMamulStokBirimKatSayi = nil then
    FfMamulStokBirimKatSayi := FindField('MAMBRM_KATSAYI');
  Result := FfMamulStokBirimKatSayi.AsFloat;
end;

function TTableMamulYanUrun.GetMamulStokKartBirim: String;
begin
  if FfMamulStokKartBirim = nil then
    FfMamulStokKartBirim := FindField('MAMSTK_BIRIM');
  Result := FfMamulStokKartBirim.AsString;
end;

function TTableMamulYanUrun.GetMamulStokKartMontajFireOran: Double;
begin
  if FfMamulStokKartMontajFireOran = nil then
    FfMamulStokKartMontajFireOran := FindField('MAMSTK_MONTAJFIREORAN');
  Result := FfMamulStokKartMontajFireOran.AsFloat;
end;

function TTableMamulYanUrun.GetMiktar: Double;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar.AsFloat;
end;

function TTableMamulYanUrun.GetMKod1: String;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1.AsString;
end;

function TTableMamulYanUrun.GetMKod2: String;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2.AsString;
end;

function TTableMamulYanUrun.GetMKod3: String;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3.AsString;
end;

function TTableMamulYanUrun.GetMKod4: String;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4.AsString;
end;

function TTableMamulYanUrun.GetMKod5: String;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5.AsString;
end;

function TTableMamulYanUrun.GetNKod1: Double;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1.AsFloat;
end;

function TTableMamulYanUrun.GetNKod2: Double;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2.AsFloat;
end;

function TTableMamulYanUrun.GetNKod3: Double;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3.AsFloat;
end;

function TTableMamulYanUrun.GetNKod4: Double;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4.AsFloat;
end;

function TTableMamulYanUrun.GetNKod5: Double;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5.AsFloat;
end;

function TTableMamulYanUrun.GetNKod6: Double;
begin
  if FfNKod6 = nil then
    FfNKod6 := FindField('NKOD6');
  Result := FfNKod6.AsFloat;
end;

function TTableMamulYanUrun.GetNKod7: Double;
begin
  if FfNKod7 = nil then
    FfNKod7 := FindField('NKOD7');
  Result := FfNKod7.AsFloat;
end;

function TTableMamulYanUrun.GetNKod8: Double;
begin
  if FfNKod8 = nil then
    FfNKod8 := FindField('NKOD8');
  Result := FfNKod8.AsFloat;
end;

function TTableMamulYanUrun.GetNKod9: Double;
begin
  if FfNKod9 = nil then
    FfNKod9 := FindField('NKOD9');
  Result := FfNKod9.AsFloat;
end;

function TTableMamulYanUrun.GetOperasyonNo: Integer;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo.AsInteger;
end;

function TTableMamulYanUrun.GetReceteNo: String;
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  Result := FfReceteNo.AsString;
end;

function TTableMamulYanUrun.GetRevizyonNo: String;
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  Result := FfRevizyonNo.AsString;
end;

function TTableMamulYanUrun.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableMamulYanUrun.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableMamulYanUrun.GetSKod1: String;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1.AsString;
end;

function TTableMamulYanUrun.GetSKod2: String;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2.AsString;
end;

function TTableMamulYanUrun.GetSKod3: String;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3.AsString;
end;

function TTableMamulYanUrun.GetSKod4: String;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4.AsString;
end;

function TTableMamulYanUrun.GetSKod5: String;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5.AsString;
end;

function TTableMamulYanUrun.GetHammaddeStokBirimKatsayi: Double;
begin
  if FfHammaddeStokBirimKatsayi = nil then
    FfHammaddeStokBirimKatsayi := FindField('STKBRM_KATSAYI');
  Result := FfHammaddeStokBirimKatsayi.AsFloat;
end;

function TTableMamulYanUrun.GetHammaddeStokKartBilesenFireOran: Double;
begin
  if FfHammaddeStokKartBilesenFireOran = nil then
    FfHammaddeStokKartBilesenFireOran := FindField('STKKRT_BILESENFIREORAN');
  Result := FfHammaddeStokKartBilesenFireOran.AsFloat;
end;

function TTableMamulYanUrun.GetHammaddeStokKartBirim: String;
begin
  if FfHammaddeStokKartBirim = nil then
    FfHammaddeStokKartBirim := FindField('STKKRT_BIRIM');
  Result := FfHammaddeStokKartBirim.AsString;
end;

function TTableMamulYanUrun.GetHammaddeStokKartMaliyetGrupNo: Integer;
begin
  if FfHammaddeStokKartMaliyetGrupNo = nil then
    FfHammaddeStokKartMaliyetGrupNo := FindField('STKKRT_GRUPNO');
  Result := FfHammaddeStokKartMaliyetGrupNo.AsInteger;
end;

function TTableMamulYanUrun.GetHammaddeStokKartMRPTip: Integer;
begin
  if FfHammaddeStokKartMRPTip = nil then
    FfHammaddeStokKartMRPTip := FindField('STKKRT_MRPTIP');
  Result := FfHammaddeStokKartMRPTip.AsInteger;
end;

function TTableMamulYanUrun.GetHammaddeStokKartTeminTip: Integer;
begin
  if FfHammaddeStokKartTeminTip = nil then
    FfHammaddeStokKartTeminTip := FindField('STKKRT_TEMINTIP');
  Result := FfHammaddeStokKartTeminTip.AsInteger;
end;

function TTableMamulYanUrun.GetHammaddeStokKartTeminYontem: Integer;
begin
  if FfHammaddeStokKartTeminYontem = nil then
    FfHammaddeStokKartTeminYontem := FindField('STKKRT_TEMINYONTEM');
  Result := FfHammaddeStokKartTeminYontem.AsInteger;
end;

function TTableMamulYanUrun.GetHammaddeStokKartYuvarlama: Integer;
begin
  if FfHammaddeStokKartYuvarlama = nil then
    FfHammaddeStokKartYuvarlama := FindField('STKKRT_YUVARLAMA');
  Result := FfHammaddeStokKartYuvarlama.AsInteger;
end;

function TTableMamulYanUrun.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableMamulYanUrun.GetYanUrunNo: Integer;
begin
  if FfYanUrunNo = nil then
    FfYanUrunNo := FindField('YANURUNNO');
  Result := FfYanUrunNo.AsInteger;
end;

function TTableMamulYanUrun.GetfMaliyet: TField;
begin
  if FfMaliyet = nil then
    FfMaliyet := FindField('_MALIYET');
  Result := FfMaliyet;
end;

function TTableMamulYanUrun.GetfMaliyetGrup1: TField;
begin
  if FfMaliyetGrup1 = nil then
    FfMaliyetGrup1 := FindField('_MALIYETGRUP1');
  Result := FfMaliyetGrup1;
end;

function TTableMamulYanUrun.GetfMaliyetGrup2: TField;
begin
  if FfMaliyetGrup2 = nil then
    FfMaliyetGrup2 := FindField('_MALIYETGRUP2');
  Result := FfMaliyetGrup2;
end;

function TTableMamulYanUrun.GetfMaliyetGrup3: TField;
begin
  if FfMaliyetGrup3 = nil then
    FfMaliyetGrup3 := FindField('_MALIYETGRUP3');
  Result := FfMaliyetGrup3;
end;

function TTableMamulYanUrun.GetfMaliyetGrup4: TField;
begin
  if FfMaliyetGrup4 = nil then
    FfMaliyetGrup4 := FindField('_MALIYETGRUP4');
  Result := FfMaliyetGrup4;
end;

function TTableMamulYanUrun.GetfMaliyetGrupDiger: TField;
begin
  if FfMaliyetGrupDiger = nil then
    FfMaliyetGrupDiger := FindField('_MALIYETGRUPDIGER');
  Result := FfMaliyetGrupDiger;
end;

function TTableMamulYanUrun.GetfYerelMaliyet: TField;
begin
  if FfYerelMaliyet = nil then
    FfYerelMaliyet := FindField('_YERELMALIYET');
  Result := FfYerelMaliyet;
end;

function TTableMamulYanUrun.GetfYerelMaliyet1: TField;
begin
  if FfYerelMaliyet1 = nil then
    FfYerelMaliyet1 := FindField('_YERELMALIYET1');
  Result := FfYerelMaliyet1;
end;

function TTableMamulYanUrun.GetfYerelMaliyet2: TField;
begin
  if FfYerelMaliyet2 = nil then
    FfYerelMaliyet2 := FindField('_YERELMALIYET2');
  Result := FfYerelMaliyet2;
end;

function TTableMamulYanUrun.GetfYerelMaliyet3: TField;
begin
  if FfYerelMaliyet3 = nil then
    FfYerelMaliyet3 := FindField('_YERELMALIYET3');
  Result := FfYerelMaliyet3;
end;

function TTableMamulYanUrun.GetfYerelMaliyetGrup1: TField;
begin
  if FfYerelMaliyetGrup1 = nil then
    FfYerelMaliyetGrup1 := FindField('_YERELMALIYETGRUP1');
  Result := FfYerelMaliyetGrup1;
end;

function TTableMamulYanUrun.GetfYerelMaliyetGrup2: TField;
begin
  if FfYerelMaliyetGrup2 = nil then
    FfYerelMaliyetGrup2 := FindField('_YERELMALIYETGRUP2');
  Result := FfYerelMaliyetGrup2;
end;

function TTableMamulYanUrun.GetfYerelMaliyetGrup3: TField;
begin
  if FfYerelMaliyetGrup3 = nil then
    FfYerelMaliyetGrup3 := FindField('_YERELMALIYETGRUP3');
  Result := FfYerelMaliyetGrup3;
end;

function TTableMamulYanUrun.GetfYerelMaliyetGrup4: TField;
begin
  if FfYerelMaliyetGrup4 = nil then
    FfYerelMaliyetGrup4 := FindField('_YERELMALIYETGRUP4');
  Result := FfYerelMaliyetGrup4;
end;

function TTableMamulYanUrun.GetfYerelMaliyetGrupDiger: TField;
begin
  if FfYerelMaliyetGrupDiger = nil then
    FfYerelMaliyetGrupDiger := FindField('_YERELMALIYETGRUPDIGER');
  Result := FfYerelMaliyetGrupDiger;
end;

function TTableMamulYanUrun.GetfAciklama1: TField;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1;
end;

function TTableMamulYanUrun.GetfAciklama2: TField;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2;
end;

function TTableMamulYanUrun.GetfAciklama3: TField;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3;
end;

function TTableMamulYanUrun.GetfAciklama4: TField;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4;
end;

function TTableMamulYanUrun.GetfAciklama5: TField;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5;
end;

function TTableMamulYanUrun.GetfBasTarih: TField;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih;
end;

function TTableMamulYanUrun.GetfBirim: TField;
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  Result := FfBirim;
end;

function TTableMamulYanUrun.GetfBitTarih: TField;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih;
end;

function TTableMamulYanUrun.GetfBKod1: TField;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1;
end;

function TTableMamulYanUrun.GetfBKod2: TField;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2;
end;

function TTableMamulYanUrun.GetfBKod3: TField;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3;
end;

function TTableMamulYanUrun.GetfBKod4: TField;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4;
end;

function TTableMamulYanUrun.GetfBKod5: TField;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5;
end;

function TTableMamulYanUrun.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableMamulYanUrun.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableMamulYanUrun.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableMamulYanUrun.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableMamulYanUrun.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableMamulYanUrun.GetfDepoKod: TField;
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  Result := FfDepoKod;
end;

function TTableMamulYanUrun.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableMamulYanUrun.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableMamulYanUrun.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableMamulYanUrun.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableMamulYanUrun.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableMamulYanUrun.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableMamulYanUrun.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableMamulYanUrun.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableMamulYanUrun.GetfLKod1: TField;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1;
end;

function TTableMamulYanUrun.GetfLKod2: TField;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2;
end;

function TTableMamulYanUrun.GetfLKod3: TField;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3;
end;

function TTableMamulYanUrun.GetfLKod4: TField;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4;
end;

function TTableMamulYanUrun.GetfLKod5: TField;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5;
end;

function TTableMamulYanUrun.GetfMaliyetOran: TField;
begin
  if FfMaliyetOran = nil then
    FfMaliyetOran := FindField('MALIYETORAN');
  Result := FfMaliyetOran;
end;

function TTableMamulYanUrun.GetfMaliyetTip: TField;
begin
  if FfMaliyetTip = nil then
    FfMaliyetTip := FindField('MALIYETTIP');
  Result := FfMaliyetTip;
end;

function TTableMamulYanUrun.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableMamulYanUrun.GetfMamulBirim: TField;
begin
  if FfMamulBirim = nil then
    FfMamulBirim := FindField('MAMBAS_BIRIM');
  Result := FfMamulBirim;
end;

function TTableMamulYanUrun.GetfMamulDepoKod: TField;
begin
  if FfMamulDepoKod = nil then
    FfMamulDepoKod := FindField('MAMBAS_MAMULDEPOKOD');
  Result := FfMamulDepoKod;
end;

function TTableMamulYanUrun.GetfMamulMalKod: TField;
begin
  if FfMamulMalKod = nil then
    FfMamulMalKod := FindField('MAMBAS_MAMULKOD');
  Result := FfMamulMalKod;
end;

function TTableMamulYanUrun.GetfMamulVersiyonNo: TField;
begin
  if FfMamulVersiyonNo = nil then
    FfMamulVersiyonNo := FindField('MAMBAS_VERSIYONNO');
  Result := FfMamulVersiyonNo;
end;

function TTableMamulYanUrun.GetfMamulStokBirimKatSayi: TField;
begin
  if FfMamulStokBirimKatSayi = nil then
    FfMamulStokBirimKatSayi := FindField('MAMBRM_KATSAYI');
  Result := FfMamulStokBirimKatSayi;
end;

function TTableMamulYanUrun.GetfMamulStokKartBirim: TField;
begin
  if FfMamulStokKartBirim = nil then
    FfMamulStokKartBirim := FindField('MAMSTK_BIRIM');
  Result := FfMamulStokKartBirim;
end;

function TTableMamulYanUrun.GetfMamulStokKartMontajFireOran: TField;
begin
  if FfMamulStokKartMontajFireOran = nil then
    FfMamulStokKartMontajFireOran := FindField('MAMSTK_MONTAJFIREORAN');
  Result := FfMamulStokKartMontajFireOran;
end;

function TTableMamulYanUrun.GetfMiktar: TField;
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  Result := FfMiktar;
end;

function TTableMamulYanUrun.GetfMKod1: TField;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1;
end;

function TTableMamulYanUrun.GetfMKod2: TField;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2;
end;

function TTableMamulYanUrun.GetfMKod3: TField;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3;
end;

function TTableMamulYanUrun.GetfMKod4: TField;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4;
end;

function TTableMamulYanUrun.GetfMKod5: TField;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5;
end;

function TTableMamulYanUrun.GetfNKod1: TField;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1;
end;

function TTableMamulYanUrun.GetfNKod2: TField;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2;
end;

function TTableMamulYanUrun.GetfNKod3: TField;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3;
end;

function TTableMamulYanUrun.GetfNKod4: TField;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4;
end;

function TTableMamulYanUrun.GetfNKod5: TField;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5;
end;

function TTableMamulYanUrun.GetfNKod6: TField;
begin
  if FfNKod6 = nil then
    FfNKod6 := FindField('NKOD6');
  Result := FfNKod6;
end;

function TTableMamulYanUrun.GetfNKod7: TField;
begin
  if FfNKod7 = nil then
    FfNKod7 := FindField('NKOD7');
  Result := FfNKod7;
end;

function TTableMamulYanUrun.GetfNKod8: TField;
begin
  if FfNKod8 = nil then
    FfNKod8 := FindField('NKOD8');
  Result := FfNKod8;
end;

function TTableMamulYanUrun.GetfNKod9: TField;
begin
  if FfNKod9 = nil then
    FfNKod9 := FindField('NKOD9');
  Result := FfNKod9;
end;

function TTableMamulYanUrun.GetfOperasyonNo: TField;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo;
end;

function TTableMamulYanUrun.GetfReceteNo: TField;
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  Result := FfReceteNo;
end;

function TTableMamulYanUrun.GetfRevizyonNo: TField;
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  Result := FfRevizyonNo;
end;

function TTableMamulYanUrun.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableMamulYanUrun.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableMamulYanUrun.GetfSKod1: TField;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1;
end;

function TTableMamulYanUrun.GetfSKod2: TField;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2;
end;

function TTableMamulYanUrun.GetfSKod3: TField;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3;
end;

function TTableMamulYanUrun.GetfSKod4: TField;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4;
end;

function TTableMamulYanUrun.GetfSKod5: TField;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5;
end;

function TTableMamulYanUrun.GetfHammaddeStokBirimKatsayi: TField;
begin
  if FfHammaddeStokBirimKatsayi = nil then
    FfHammaddeStokBirimKatsayi := FindField('STKBRM_KATSAYI');
  Result := FfHammaddeStokBirimKatsayi;
end;

function TTableMamulYanUrun.GetfHammaddeStokKartBilesenFireOran: TField;
begin
  if FfHammaddeStokKartBilesenFireOran = nil then
    FfHammaddeStokKartBilesenFireOran := FindField('STKKRT_BILESENFIREORAN');
  Result := FfHammaddeStokKartBilesenFireOran;
end;

function TTableMamulYanUrun.GetfHammaddeStokKartBirim: TField;
begin
  if FfHammaddeStokKartBirim = nil then
    FfHammaddeStokKartBirim := FindField('STKKRT_BIRIM');
  Result := FfHammaddeStokKartBirim;
end;

function TTableMamulYanUrun.GetfHammaddeStokKartMaliyetGrupNo: TField;
begin
  if FfHammaddeStokKartMaliyetGrupNo = nil then
    FfHammaddeStokKartMaliyetGrupNo := FindField('STKKRT_GRUPNO');
  Result := FfHammaddeStokKartMaliyetGrupNo;
end;

function TTableMamulYanUrun.GetfHammaddeStokKartMRPTip: TField;
begin
  if FfHammaddeStokKartMRPTip = nil then
    FfHammaddeStokKartMRPTip := FindField('STKKRT_MRPTIP');
  Result := FfHammaddeStokKartMRPTip;
end;

function TTableMamulYanUrun.GetfHammaddeStokKartTeminTip: TField;
begin
  if FfHammaddeStokKartTeminTip = nil then
    FfHammaddeStokKartTeminTip := FindField('STKKRT_TEMINTIP');
  Result := FfHammaddeStokKartTeminTip;
end;

function TTableMamulYanUrun.GetfHammaddeStokKartTeminYontem: TField;
begin
  if FfHammaddeStokKartTeminYontem = nil then
    FfHammaddeStokKartTeminYontem := FindField('STKKRT_TEMINYONTEM');
  Result := FfHammaddeStokKartTeminYontem;
end;

function TTableMamulYanUrun.GetfHammaddeStokKartYuvarlama: TField;
begin
  if FfHammaddeStokKartYuvarlama = nil then
    FfHammaddeStokKartYuvarlama := FindField('STKKRT_YUVARLAMA');
  Result := FfHammaddeStokKartYuvarlama;
end;

function TTableMamulYanUrun.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

function TTableMamulYanUrun.GetfYanUrunNo: TField;
begin
  if FfYanUrunNo = nil then
    FfYanUrunNo := FindField('YANURUNNO');
  Result := FfYanUrunNo;
end;

procedure TTableMamulYanUrun.SetMaliyet(const Value: Double);
begin
  if FfMaliyet = nil then
    FfMaliyet := FindField('_MALIYET');
  FfMaliyet.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetMaliyetGrup1(const Value: Double);
begin
  if FfMaliyetGrup1 = nil then
    FfMaliyetGrup1 := FindField('_MALIYETGRUP1');
  FfMaliyetGrup1.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetMaliyetGrup2(const Value: Double);
begin
  if FfMaliyetGrup2 = nil then
    FfMaliyetGrup2 := FindField('_MALIYETGRUP2');
  FfMaliyetGrup2.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetMaliyetGrup3(const Value: Double);
begin
  if FfMaliyetGrup3 = nil then
    FfMaliyetGrup3 := FindField('_MALIYETGRUP3');
  FfMaliyetGrup3.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetMaliyetGrup4(const Value: Double);
begin
  if FfMaliyetGrup4 = nil then
    FfMaliyetGrup4 := FindField('_MALIYETGRUP4');
  FfMaliyetGrup4.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetMaliyetGrupDiger(const Value: Double);
begin
  if FfMaliyetGrupDiger = nil then
    FfMaliyetGrupDiger := FindField('_MALIYETGRUPDIGER');
  FfMaliyetGrupDiger.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetYerelMaliyet(const Value: Double);
begin
  if FfYerelMaliyet = nil then
    FfYerelMaliyet := FindField('_YERELMALIYET');
  FfYerelMaliyet.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetYerelMaliyet1(const Value: Double);
begin
  if FfYerelMaliyet1 = nil then
    FfYerelMaliyet1 := FindField('_YERELMALIYET1');
  FfYerelMaliyet1.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetYerelMaliyet2(const Value: Double);
begin
  if FfYerelMaliyet2 = nil then
    FfYerelMaliyet2 := FindField('_YERELMALIYET2');
  FfYerelMaliyet2.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetYerelMaliyet3(const Value: Double);
begin
  if FfYerelMaliyet3 = nil then
    FfYerelMaliyet3 := FindField('_YERELMALIYET3');
  FfYerelMaliyet3.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetYerelMaliyetGrup1(const Value: Double);
begin
  if FfYerelMaliyetGrup1 = nil then
    FfYerelMaliyetGrup1 := FindField('_YERELMALIYETGRUP1');
  FfYerelMaliyetGrup1.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetYerelMaliyetGrup2(const Value: Double);
begin
  if FfYerelMaliyetGrup2 = nil then
    FfYerelMaliyetGrup2 := FindField('_YERELMALIYETGRUP2');
  FfYerelMaliyetGrup2.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetYerelMaliyetGrup3(const Value: Double);
begin
  if FfYerelMaliyetGrup3 = nil then
    FfYerelMaliyetGrup3 := FindField('_YERELMALIYETGRUP3');
  FfYerelMaliyetGrup3.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetYerelMaliyetGrup4(const Value: Double);
begin
  if FfYerelMaliyetGrup4 = nil then
    FfYerelMaliyetGrup4 := FindField('_YERELMALIYETGRUP4');
  FfYerelMaliyetGrup4.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetYerelMaliyetGrupDiger(const Value: Double);
begin
  if FfYerelMaliyetGrupDiger = nil then
    FfYerelMaliyetGrupDiger := FindField('_YERELMALIYETGRUPDIGER');
  FfYerelMaliyetGrupDiger.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetAciklama1(const Value: String);
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  FfAciklama1.AsString := Value;
end;

procedure TTableMamulYanUrun.SetAciklama2(const Value: String);
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  FfAciklama2.AsString := Value;
end;

procedure TTableMamulYanUrun.SetAciklama3(const Value: String);
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  FfAciklama3.AsString := Value;
end;

procedure TTableMamulYanUrun.SetAciklama4(const Value: String);
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  FfAciklama4.AsString := Value;
end;

procedure TTableMamulYanUrun.SetAciklama5(const Value: String);
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  FfAciklama5.AsString := Value;
end;

procedure TTableMamulYanUrun.SetBasTarih(const Value: TDate);
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  FfBasTarih.AsDateTime := Value;
end;

procedure TTableMamulYanUrun.SetBirim(const Value: String);
begin
  if FfBirim = nil then
    FfBirim := FindField('BIRIM');
  FfBirim.AsString := Value;
end;

procedure TTableMamulYanUrun.SetBitTarih(const Value: TDate);
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  FfBitTarih.AsDateTime := Value;
end;

procedure TTableMamulYanUrun.SetBKod1(const Value: Integer);
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  FfBKod1.AsInteger := Value;
end;

procedure TTableMamulYanUrun.SetBKod2(const Value: Integer);
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  FfBKod2.AsInteger := Value;
end;

procedure TTableMamulYanUrun.SetBKod3(const Value: Integer);
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  FfBKod3.AsInteger := Value;
end;

procedure TTableMamulYanUrun.SetBKod4(const Value: Integer);
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  FfBKod4.AsInteger := Value;
end;

procedure TTableMamulYanUrun.SetBKod5(const Value: Integer);
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  FfBKod5.AsInteger := Value;
end;

procedure TTableMamulYanUrun.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableMamulYanUrun.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableMamulYanUrun.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableMamulYanUrun.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableMamulYanUrun.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableMamulYanUrun.SetDepoKod(const Value: String);
begin
  if FfDepoKod = nil then
    FfDepoKod := FindField('DEPOKOD');
  FfDepoKod.AsString := Value;
end;

procedure TTableMamulYanUrun.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableMamulYanUrun.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableMamulYanUrun.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableMamulYanUrun.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableMamulYanUrun.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableMamulYanUrun.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableMamulYanUrun.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableMamulYanUrun.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableMamulYanUrun.SetLKod1(const Value: String);
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  FfLKod1.AsString := Value;
end;

procedure TTableMamulYanUrun.SetLKod2(const Value: String);
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  FfLKod2.AsString := Value;
end;

procedure TTableMamulYanUrun.SetLKod3(const Value: String);
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  FfLKod3.AsString := Value;
end;

procedure TTableMamulYanUrun.SetLKod4(const Value: String);
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  FfLKod4.AsString := Value;
end;

procedure TTableMamulYanUrun.SetLKod5(const Value: String);
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  FfLKod5.AsString := Value;
end;

procedure TTableMamulYanUrun.SetMaliyetOran(const Value: Double);
begin
  if FfMaliyetOran = nil then
    FfMaliyetOran := FindField('MALIYETORAN');
  FfMaliyetOran.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetMaliyetTip(const Value: Integer);
begin
  if FfMaliyetTip = nil then
    FfMaliyetTip := FindField('MALIYETTIP');
  FfMaliyetTip.AsInteger := Value;
end;

procedure TTableMamulYanUrun.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableMamulYanUrun.SetMamulBirim(const Value: String);
begin
  if FfMamulBirim = nil then
    FfMamulBirim := FindField('MAMBAS_BIRIM');
  FfMamulBirim.AsString := Value;
end;

procedure TTableMamulYanUrun.SetMamulDepoKod(const Value: String);
begin
  if FfMamulDepoKod = nil then
    FfMamulDepoKod := FindField('MAMBAS_MAMULDEPOKOD');
  FfMamulDepoKod.AsString := Value;
end;

procedure TTableMamulYanUrun.SetMamulMalKod(const Value: String);
begin
  if FfMamulMalKod = nil then
    FfMamulMalKod := FindField('MAMBAS_MAMULKOD');
  FfMamulMalKod.AsString := Value;
end;

procedure TTableMamulYanUrun.SetMamulVersiyonNo(const Value: String);
begin
  if FfMamulVersiyonNo = nil then
    FfMamulVersiyonNo := FindField('MAMBAS_VERSIYONNO');
  FfMamulVersiyonNo.AsString := Value;
end;

procedure TTableMamulYanUrun.SetMamulStokBirimKatSayi(const Value: Double);
begin
  if FfMamulStokBirimKatSayi = nil then
    FfMamulStokBirimKatSayi := FindField('MAMBRM_KATSAYI');
  FfMamulStokBirimKatSayi.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetMamulStokKartBirim(const Value: String);
begin
  if FfMamulStokKartBirim = nil then
    FfMamulStokKartBirim := FindField('MAMSTK_BIRIM');
  FfMamulStokKartBirim.AsString := Value;
end;

procedure TTableMamulYanUrun.SetMamulStokKartMontajFireOran(const Value: Double);
begin
  if FfMamulStokKartMontajFireOran = nil then
    FfMamulStokKartMontajFireOran := FindField('MAMSTK_MONTAJFIREORAN');
  FfMamulStokKartMontajFireOran.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetMiktar(const Value: Double);
begin
  if FfMiktar = nil then
    FfMiktar := FindField('MIKTAR');
  FfMiktar.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetMKod1(const Value: String);
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  FfMKod1.AsString := Value;
end;

procedure TTableMamulYanUrun.SetMKod2(const Value: String);
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  FfMKod2.AsString := Value;
end;

procedure TTableMamulYanUrun.SetMKod3(const Value: String);
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  FfMKod3.AsString := Value;
end;

procedure TTableMamulYanUrun.SetMKod4(const Value: String);
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  FfMKod4.AsString := Value;
end;

procedure TTableMamulYanUrun.SetMKod5(const Value: String);
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  FfMKod5.AsString := Value;
end;

procedure TTableMamulYanUrun.SetNKod1(const Value: Double);
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  FfNKod1.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetNKod2(const Value: Double);
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  FfNKod2.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetNKod3(const Value: Double);
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  FfNKod3.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetNKod4(const Value: Double);
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  FfNKod4.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetNKod5(const Value: Double);
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  FfNKod5.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetNKod6(const Value: Double);
begin
  if FfNKod6 = nil then
    FfNKod6 := FindField('NKOD6');
  FfNKod6.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetNKod7(const Value: Double);
begin
  if FfNKod7 = nil then
    FfNKod7 := FindField('NKOD7');
  FfNKod7.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetNKod8(const Value: Double);
begin
  if FfNKod8 = nil then
    FfNKod8 := FindField('NKOD8');
  FfNKod8.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetNKod9(const Value: Double);
begin
  if FfNKod9 = nil then
    FfNKod9 := FindField('NKOD9');
  FfNKod9.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetOperasyonNo(const Value: Integer);
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  FfOperasyonNo.AsInteger := Value;
end;

procedure TTableMamulYanUrun.SetReceteNo(const Value: String);
begin
  if FfReceteNo = nil then
    FfReceteNo := FindField('RECETENO');
  FfReceteNo.AsString := Value;
end;

procedure TTableMamulYanUrun.SetRevizyonNo(const Value: String);
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  FfRevizyonNo.AsString := Value;
end;

procedure TTableMamulYanUrun.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableMamulYanUrun.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableMamulYanUrun.SetSKod1(const Value: String);
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  FfSKod1.AsString := Value;
end;

procedure TTableMamulYanUrun.SetSKod2(const Value: String);
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  FfSKod2.AsString := Value;
end;

procedure TTableMamulYanUrun.SetSKod3(const Value: String);
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  FfSKod3.AsString := Value;
end;

procedure TTableMamulYanUrun.SetSKod4(const Value: String);
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  FfSKod4.AsString := Value;
end;

procedure TTableMamulYanUrun.SetSKod5(const Value: String);
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  FfSKod5.AsString := Value;
end;

procedure TTableMamulYanUrun.SetHammaddeStokBirimKatsayi(const Value: Double);
begin
  if FfHammaddeStokBirimKatsayi = nil then
    FfHammaddeStokBirimKatsayi := FindField('STKBRM_KATSAYI');
  FfHammaddeStokBirimKatsayi.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetHammaddeStokKartBilesenFireOran(const Value: Double);
begin
  if FfHammaddeStokKartBilesenFireOran = nil then
    FfHammaddeStokKartBilesenFireOran := FindField('STKKRT_BILESENFIREORAN');
  FfHammaddeStokKartBilesenFireOran.AsFloat := Value;
end;

procedure TTableMamulYanUrun.SetHammaddeStokKartBirim(const Value: String);
begin
  if FfHammaddeStokKartBirim = nil then
    FfHammaddeStokKartBirim := FindField('STKKRT_BIRIM');
  FfHammaddeStokKartBirim.AsString := Value;
end;

procedure TTableMamulYanUrun.SetHammaddeStokKartMaliyetGrupNo(const Value: Integer);
begin
  if FfHammaddeStokKartMaliyetGrupNo = nil then
    FfHammaddeStokKartMaliyetGrupNo := FindField('STKKRT_GRUPNO');
  FfHammaddeStokKartMaliyetGrupNo.AsInteger := Value;
end;

procedure TTableMamulYanUrun.SetHammaddeStokKartMRPTip(const Value: Integer);
begin
  if FfHammaddeStokKartMRPTip = nil then
    FfHammaddeStokKartMRPTip := FindField('STKKRT_MRPTIP');
  FfHammaddeStokKartMRPTip.AsInteger := Value;
end;

procedure TTableMamulYanUrun.SetHammaddeStokKartTeminTip(const Value: Integer);
begin
  if FfHammaddeStokKartTeminTip = nil then
    FfHammaddeStokKartTeminTip := FindField('STKKRT_TEMINTIP');
  FfHammaddeStokKartTeminTip.AsInteger := Value;
end;

procedure TTableMamulYanUrun.SetHammaddeStokKartTeminYontem(const Value: Integer);
begin
  if FfHammaddeStokKartTeminYontem = nil then
    FfHammaddeStokKartTeminYontem := FindField('STKKRT_TEMINYONTEM');
  FfHammaddeStokKartTeminYontem.AsInteger := Value;
end;

procedure TTableMamulYanUrun.SetHammaddeStokKartYuvarlama(const Value: Integer);
begin
  if FfHammaddeStokKartYuvarlama = nil then
    FfHammaddeStokKartYuvarlama := FindField('STKKRT_YUVARLAMA');
  FfHammaddeStokKartYuvarlama.AsInteger := Value;
end;

procedure TTableMamulYanUrun.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

procedure TTableMamulYanUrun.SetYanUrunNo(const Value: Integer);
begin
  if FfYanUrunNo = nil then
    FfYanUrunNo := FindField('YANURUNNO');
  FfYanUrunNo.AsInteger := Value;
end;

{ TTableIsMerkezKaynak }

constructor TTableIsMerkezKaynak.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTISK';
end;

procedure TTableIsMerkezKaynak.DoAfterOpen;
begin
  if FfKapasite = nil then
    FfKapasite := FindField('_KAPASITE');
  if FfKullanilan = nil then
    FfKullanilan := FindField('_KULLANILAN');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfKullanimSiraNo = nil then
    FfKullanimSiraNo := FindField('KULLANIMSIRANO');
  if FfBeklemeSure = nil then
    FfBeklemeSure := FindField('URTKYN_BEKLEMESURE');
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('URTKYN_CALISMASURE');
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('URTKYN_KURULUMSURE');
  if FfKurulumSure1 = nil then
    FfKurulumSure1 := FindField('URTKYN_KURULUMSURE1');
  if FfKurulumSure2 = nil then
    FfKurulumSure2 := FindField('URTKYN_KURULUMSURE2');
  if FfKurulumSure3 = nil then
    FfKurulumSure3 := FindField('URTKYN_KURULUMSURE3');
  if FfKurulumSure4 = nil then
    FfKurulumSure4 := FindField('URTKYN_KURULUMSURE4');
  if FfKurulumSure5 = nil then
    FfKurulumSure5 := FindField('URTKYN_KURULUMSURE5');
  if FfKuyrukSure = nil then
    FfKuyrukSure := FindField('URTKYN_KUYRUKSURE');
  if FfOnUretimMiktar = nil then
    FfOnUretimMiktar := FindField('URTKYN_ONURETIMMIKTAR');
  if FfSokumSure = nil then
    FfSokumSure := FindField('URTKYN_SOKUMSURE');
  if FfSokumSure1 = nil then
    FfSokumSure1 := FindField('URTKYN_SOKUMSURE1');
  if FfSokumSure2 = nil then
    FfSokumSure2 := FindField('URTKYN_SOKUMSURE2');
  if FfTasimaSure = nil then
    FfTasimaSure := FindField('URTKYN_TASIMASURE');
  inherited;
end;

procedure TTableIsMerkezKaynak.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfKapasite := nil;
    FfKullanilan := nil;
    FfID := nil;
    FfIsMerkezKod := nil;
    FfKaynakKod := nil;
    FfKullanimSiraNo := nil;
    FfBeklemeSure := nil;
    FfCalismaSure := nil;
    FfKurulumSure := nil;
    FfKurulumSure1 := nil;
    FfKurulumSure2 := nil;
    FfKurulumSure3 := nil;
    FfKurulumSure4 := nil;
    FfKurulumSure5 := nil;
    FfKuyrukSure := nil;
    FfOnUretimMiktar := nil;
    FfSokumSure := nil;
    FfSokumSure1 := nil;
    FfSokumSure2 := nil;
    FfTasimaSure := nil;
  end;
  inherited;
end;

function TTableIsMerkezKaynak.GetKapasite: Double;
begin
  if FfKapasite = nil then
    FfKapasite := FindField('_KAPASITE');
  Result := FfKapasite.AsFloat;
end;

function TTableIsMerkezKaynak.GetKullanilan: Double;
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('_KULLANILAN');
  Result := FfKullanilan.AsFloat;
end;

function TTableIsMerkezKaynak.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableIsMerkezKaynak.GetIsMerkezKod: String;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod.AsString;
end;

function TTableIsMerkezKaynak.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableIsMerkezKaynak.GetKullanimSiraNo: Integer;
begin
  if FfKullanimSiraNo = nil then
    FfKullanimSiraNo := FindField('KULLANIMSIRANO');
  Result := FfKullanimSiraNo.AsInteger;
end;

function TTableIsMerkezKaynak.GetBeklemeSure: Double;
begin
  if FfBeklemeSure = nil then
    FfBeklemeSure := FindField('URTKYN_BEKLEMESURE');
  Result := FfBeklemeSure.AsFloat;
end;

function TTableIsMerkezKaynak.GetCalismaSure: Double;
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('URTKYN_CALISMASURE');
  Result := FfCalismaSure.AsFloat;
end;

function TTableIsMerkezKaynak.GetKurulumSure: Double;
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('URTKYN_KURULUMSURE');
  Result := FfKurulumSure.AsFloat;
end;

function TTableIsMerkezKaynak.GetKurulumSure1: Double;
begin
  if FfKurulumSure1 = nil then
    FfKurulumSure1 := FindField('URTKYN_KURULUMSURE1');
  Result := FfKurulumSure1.AsFloat;
end;

function TTableIsMerkezKaynak.GetKurulumSure2: Double;
begin
  if FfKurulumSure2 = nil then
    FfKurulumSure2 := FindField('URTKYN_KURULUMSURE2');
  Result := FfKurulumSure2.AsFloat;
end;

function TTableIsMerkezKaynak.GetKurulumSure3: Double;
begin
  if FfKurulumSure3 = nil then
    FfKurulumSure3 := FindField('URTKYN_KURULUMSURE3');
  Result := FfKurulumSure3.AsFloat;
end;

function TTableIsMerkezKaynak.GetKurulumSure4: Double;
begin
  if FfKurulumSure4 = nil then
    FfKurulumSure4 := FindField('URTKYN_KURULUMSURE4');
  Result := FfKurulumSure4.AsFloat;
end;

function TTableIsMerkezKaynak.GetKurulumSure5: Double;
begin
  if FfKurulumSure5 = nil then
    FfKurulumSure5 := FindField('URTKYN_KURULUMSURE5');
  Result := FfKurulumSure5.AsFloat;
end;

function TTableIsMerkezKaynak.GetKuyrukSure: Double;
begin
  if FfKuyrukSure = nil then
    FfKuyrukSure := FindField('URTKYN_KUYRUKSURE');
  Result := FfKuyrukSure.AsFloat;
end;

function TTableIsMerkezKaynak.GetOnUretimMiktar: Double;
begin
  if FfOnUretimMiktar = nil then
    FfOnUretimMiktar := FindField('URTKYN_ONURETIMMIKTAR');
  Result := FfOnUretimMiktar.AsFloat;
end;

function TTableIsMerkezKaynak.GetSokumSure: Double;
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('URTKYN_SOKUMSURE');
  Result := FfSokumSure.AsFloat;
end;

function TTableIsMerkezKaynak.GetSokumSure1: Double;
begin
  if FfSokumSure1 = nil then
    FfSokumSure1 := FindField('URTKYN_SOKUMSURE1');
  Result := FfSokumSure1.AsFloat;
end;

function TTableIsMerkezKaynak.GetSokumSure2: Double;
begin
  if FfSokumSure2 = nil then
    FfSokumSure2 := FindField('URTKYN_SOKUMSURE2');
  Result := FfSokumSure2.AsFloat;
end;

function TTableIsMerkezKaynak.GetTasimaSure: Double;
begin
  if FfTasimaSure = nil then
    FfTasimaSure := FindField('URTKYN_TASIMASURE');
  Result := FfTasimaSure.AsFloat;
end;

function TTableIsMerkezKaynak.GetfKapasite: TField;
begin
  if FfKapasite = nil then
    FfKapasite := FindField('_KAPASITE');
  Result := FfKapasite;
end;

function TTableIsMerkezKaynak.GetfKullanilan: TField;
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('_KULLANILAN');
  Result := FfKullanilan;
end;

function TTableIsMerkezKaynak.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableIsMerkezKaynak.GetfIsMerkezKod: TField;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod;
end;

function TTableIsMerkezKaynak.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableIsMerkezKaynak.GetfKullanimSiraNo: TField;
begin
  if FfKullanimSiraNo = nil then
    FfKullanimSiraNo := FindField('KULLANIMSIRANO');
  Result := FfKullanimSiraNo;
end;

function TTableIsMerkezKaynak.GetfBeklemeSure: TField;
begin
  if FfBeklemeSure = nil then
    FfBeklemeSure := FindField('URTKYN_BEKLEMESURE');
  Result := FfBeklemeSure;
end;

function TTableIsMerkezKaynak.GetfCalismaSure: TField;
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('URTKYN_CALISMASURE');
  Result := FfCalismaSure;
end;

function TTableIsMerkezKaynak.GetfKurulumSure: TField;
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('URTKYN_KURULUMSURE');
  Result := FfKurulumSure;
end;

function TTableIsMerkezKaynak.GetfKurulumSure1: TField;
begin
  if FfKurulumSure1 = nil then
    FfKurulumSure1 := FindField('URTKYN_KURULUMSURE1');
  Result := FfKurulumSure1;
end;

function TTableIsMerkezKaynak.GetfKurulumSure2: TField;
begin
  if FfKurulumSure2 = nil then
    FfKurulumSure2 := FindField('URTKYN_KURULUMSURE2');
  Result := FfKurulumSure2;
end;

function TTableIsMerkezKaynak.GetfKurulumSure3: TField;
begin
  if FfKurulumSure3 = nil then
    FfKurulumSure3 := FindField('URTKYN_KURULUMSURE3');
  Result := FfKurulumSure3;
end;

function TTableIsMerkezKaynak.GetfKurulumSure4: TField;
begin
  if FfKurulumSure4 = nil then
    FfKurulumSure4 := FindField('URTKYN_KURULUMSURE4');
  Result := FfKurulumSure4;
end;

function TTableIsMerkezKaynak.GetfKurulumSure5: TField;
begin
  if FfKurulumSure5 = nil then
    FfKurulumSure5 := FindField('URTKYN_KURULUMSURE5');
  Result := FfKurulumSure5;
end;

function TTableIsMerkezKaynak.GetfKuyrukSure: TField;
begin
  if FfKuyrukSure = nil then
    FfKuyrukSure := FindField('URTKYN_KUYRUKSURE');
  Result := FfKuyrukSure;
end;

function TTableIsMerkezKaynak.GetfOnUretimMiktar: TField;
begin
  if FfOnUretimMiktar = nil then
    FfOnUretimMiktar := FindField('URTKYN_ONURETIMMIKTAR');
  Result := FfOnUretimMiktar;
end;

function TTableIsMerkezKaynak.GetfSokumSure: TField;
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('URTKYN_SOKUMSURE');
  Result := FfSokumSure;
end;

function TTableIsMerkezKaynak.GetfSokumSure1: TField;
begin
  if FfSokumSure1 = nil then
    FfSokumSure1 := FindField('URTKYN_SOKUMSURE1');
  Result := FfSokumSure1;
end;

function TTableIsMerkezKaynak.GetfSokumSure2: TField;
begin
  if FfSokumSure2 = nil then
    FfSokumSure2 := FindField('URTKYN_SOKUMSURE2');
  Result := FfSokumSure2;
end;

function TTableIsMerkezKaynak.GetfTasimaSure: TField;
begin
  if FfTasimaSure = nil then
    FfTasimaSure := FindField('URTKYN_TASIMASURE');
  Result := FfTasimaSure;
end;

procedure TTableIsMerkezKaynak.SetKapasite(const Value: Double);
begin
  if FfKapasite = nil then
    FfKapasite := FindField('_KAPASITE');
  FfKapasite.AsFloat := Value;
end;

procedure TTableIsMerkezKaynak.SetKullanilan(const Value: Double);
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('_KULLANILAN');
  FfKullanilan.AsFloat := Value;
end;

procedure TTableIsMerkezKaynak.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableIsMerkezKaynak.SetIsMerkezKod(const Value: String);
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  FfIsMerkezKod.AsString := Value;
end;

procedure TTableIsMerkezKaynak.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableIsMerkezKaynak.SetKullanimSiraNo(const Value: Integer);
begin
  if FfKullanimSiraNo = nil then
    FfKullanimSiraNo := FindField('KULLANIMSIRANO');
  FfKullanimSiraNo.AsInteger := Value;
end;

procedure TTableIsMerkezKaynak.SetBeklemeSure(const Value: Double);
begin
  if FfBeklemeSure = nil then
    FfBeklemeSure := FindField('URTKYN_BEKLEMESURE');
  FfBeklemeSure.AsFloat := Value;
end;

procedure TTableIsMerkezKaynak.SetCalismaSure(const Value: Double);
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('URTKYN_CALISMASURE');
  FfCalismaSure.AsFloat := Value;
end;

procedure TTableIsMerkezKaynak.SetKurulumSure(const Value: Double);
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('URTKYN_KURULUMSURE');
  FfKurulumSure.AsFloat := Value;
end;

procedure TTableIsMerkezKaynak.SetKurulumSure1(const Value: Double);
begin
  if FfKurulumSure1 = nil then
    FfKurulumSure1 := FindField('URTKYN_KURULUMSURE1');
  FfKurulumSure1.AsFloat := Value;
end;

procedure TTableIsMerkezKaynak.SetKurulumSure2(const Value: Double);
begin
  if FfKurulumSure2 = nil then
    FfKurulumSure2 := FindField('URTKYN_KURULUMSURE2');
  FfKurulumSure2.AsFloat := Value;
end;

procedure TTableIsMerkezKaynak.SetKurulumSure3(const Value: Double);
begin
  if FfKurulumSure3 = nil then
    FfKurulumSure3 := FindField('URTKYN_KURULUMSURE3');
  FfKurulumSure3.AsFloat := Value;
end;

procedure TTableIsMerkezKaynak.SetKurulumSure4(const Value: Double);
begin
  if FfKurulumSure4 = nil then
    FfKurulumSure4 := FindField('URTKYN_KURULUMSURE4');
  FfKurulumSure4.AsFloat := Value;
end;

procedure TTableIsMerkezKaynak.SetKurulumSure5(const Value: Double);
begin
  if FfKurulumSure5 = nil then
    FfKurulumSure5 := FindField('URTKYN_KURULUMSURE5');
  FfKurulumSure5.AsFloat := Value;
end;

procedure TTableIsMerkezKaynak.SetKuyrukSure(const Value: Double);
begin
  if FfKuyrukSure = nil then
    FfKuyrukSure := FindField('URTKYN_KUYRUKSURE');
  FfKuyrukSure.AsFloat := Value;
end;

procedure TTableIsMerkezKaynak.SetOnUretimMiktar(const Value: Double);
begin
  if FfOnUretimMiktar = nil then
    FfOnUretimMiktar := FindField('URTKYN_ONURETIMMIKTAR');
  FfOnUretimMiktar.AsFloat := Value;
end;

procedure TTableIsMerkezKaynak.SetSokumSure(const Value: Double);
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('URTKYN_SOKUMSURE');
  FfSokumSure.AsFloat := Value;
end;

procedure TTableIsMerkezKaynak.SetSokumSure1(const Value: Double);
begin
  if FfSokumSure1 = nil then
    FfSokumSure1 := FindField('URTKYN_SOKUMSURE1');
  FfSokumSure1.AsFloat := Value;
end;

procedure TTableIsMerkezKaynak.SetSokumSure2(const Value: Double);
begin
  if FfSokumSure2 = nil then
    FfSokumSure2 := FindField('URTKYN_SOKUMSURE2');
  FfSokumSure2.AsFloat := Value;
end;

procedure TTableIsMerkezKaynak.SetTasimaSure(const Value: Double);
begin
  if FfTasimaSure = nil then
    FfTasimaSure := FindField('URTKYN_TASIMASURE');
  FfTasimaSure.AsFloat := Value;
end;

{ TTableIsMerkezKart }

constructor TTableIsMerkezKart.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTISM';
end;

procedure TTableIsMerkezKart.DoAfterOpen;
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
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
  if FfGrupKod = nil then
    FfGrupKod := FindField('GRUPKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIsMerkezAd = nil then
    FfIsMerkezAd := FindField('ISMERKEZAD');
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('MALIYET1');
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('MALIYET2');
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('MALIYET3');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  inherited;
end;

procedure TTableIsMerkezKart.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfCalismaSure := nil;
    FfDegistirenKaynak := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfGrupKod := nil;
    FfID := nil;
    FfIsMerkezAd := nil;
    FfIsMerkezKod := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKurulumSure := nil;
    FfMaliyet1 := nil;
    FfMaliyet2 := nil;
    FfMaliyet3 := nil;
    FfSirketNo := nil;
  end;
  inherited;
end;

function TTableIsMerkezKart.GetCalismaSure: Double;
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  Result := FfCalismaSure.AsFloat;
end;

function TTableIsMerkezKart.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableIsMerkezKart.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableIsMerkezKart.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableIsMerkezKart.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableIsMerkezKart.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableIsMerkezKart.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableIsMerkezKart.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableIsMerkezKart.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableIsMerkezKart.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableIsMerkezKart.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableIsMerkezKart.GetGrupKod: String;
begin
  if FfGrupKod = nil then
    FfGrupKod := FindField('GRUPKOD');
  Result := FfGrupKod.AsString;
end;

function TTableIsMerkezKart.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableIsMerkezKart.GetIsMerkezAd: String;
begin
  if FfIsMerkezAd = nil then
    FfIsMerkezAd := FindField('ISMERKEZAD');
  Result := FfIsMerkezAd.AsString;
end;

function TTableIsMerkezKart.GetIsMerkezKod: String;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod.AsString;
end;

function TTableIsMerkezKart.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableIsMerkezKart.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableIsMerkezKart.GetKurulumSure: Double;
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  Result := FfKurulumSure.AsFloat;
end;

function TTableIsMerkezKart.GetMaliyet1: Double;
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('MALIYET1');
  Result := FfMaliyet1.AsFloat;
end;

function TTableIsMerkezKart.GetMaliyet2: Double;
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('MALIYET2');
  Result := FfMaliyet2.AsFloat;
end;

function TTableIsMerkezKart.GetMaliyet3: Double;
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('MALIYET3');
  Result := FfMaliyet3.AsFloat;
end;

function TTableIsMerkezKart.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableIsMerkezKart.GetfCalismaSure: TField;
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  Result := FfCalismaSure;
end;

function TTableIsMerkezKart.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableIsMerkezKart.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableIsMerkezKart.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableIsMerkezKart.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableIsMerkezKart.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableIsMerkezKart.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableIsMerkezKart.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableIsMerkezKart.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableIsMerkezKart.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableIsMerkezKart.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableIsMerkezKart.GetfGrupKod: TField;
begin
  if FfGrupKod = nil then
    FfGrupKod := FindField('GRUPKOD');
  Result := FfGrupKod;
end;

function TTableIsMerkezKart.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableIsMerkezKart.GetfIsMerkezAd: TField;
begin
  if FfIsMerkezAd = nil then
    FfIsMerkezAd := FindField('ISMERKEZAD');
  Result := FfIsMerkezAd;
end;

function TTableIsMerkezKart.GetfIsMerkezKod: TField;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod;
end;

function TTableIsMerkezKart.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableIsMerkezKart.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableIsMerkezKart.GetfKurulumSure: TField;
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  Result := FfKurulumSure;
end;

function TTableIsMerkezKart.GetfMaliyet1: TField;
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('MALIYET1');
  Result := FfMaliyet1;
end;

function TTableIsMerkezKart.GetfMaliyet2: TField;
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('MALIYET2');
  Result := FfMaliyet2;
end;

function TTableIsMerkezKart.GetfMaliyet3: TField;
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('MALIYET3');
  Result := FfMaliyet3;
end;

function TTableIsMerkezKart.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

procedure TTableIsMerkezKart.SetCalismaSure(const Value: Double);
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  FfCalismaSure.AsFloat := Value;
end;

procedure TTableIsMerkezKart.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableIsMerkezKart.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableIsMerkezKart.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableIsMerkezKart.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableIsMerkezKart.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableIsMerkezKart.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableIsMerkezKart.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableIsMerkezKart.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableIsMerkezKart.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableIsMerkezKart.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableIsMerkezKart.SetGrupKod(const Value: String);
begin
  if FfGrupKod = nil then
    FfGrupKod := FindField('GRUPKOD');
  FfGrupKod.AsString := Value;
end;

procedure TTableIsMerkezKart.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableIsMerkezKart.SetIsMerkezAd(const Value: String);
begin
  if FfIsMerkezAd = nil then
    FfIsMerkezAd := FindField('ISMERKEZAD');
  FfIsMerkezAd.AsString := Value;
end;

procedure TTableIsMerkezKart.SetIsMerkezKod(const Value: String);
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  FfIsMerkezKod.AsString := Value;
end;

procedure TTableIsMerkezKart.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableIsMerkezKart.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableIsMerkezKart.SetKurulumSure(const Value: Double);
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  FfKurulumSure.AsFloat := Value;
end;

procedure TTableIsMerkezKart.SetMaliyet1(const Value: Double);
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('MALIYET1');
  FfMaliyet1.AsFloat := Value;
end;

procedure TTableIsMerkezKart.SetMaliyet2(const Value: Double);
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('MALIYET2');
  FfMaliyet2.AsFloat := Value;
end;

procedure TTableIsMerkezKart.SetMaliyet3(const Value: Double);
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('MALIYET3');
  FfMaliyet3.AsFloat := Value;
end;

procedure TTableIsMerkezKart.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

{ TTableUretimKaynakIslemTanim }

constructor TTableUretimKaynakIslemTanim.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTKIT';
end;

procedure TTableUretimKaynakIslemTanim.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  inherited;
end;

procedure TTableUretimKaynakIslemTanim.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfID := nil;
    FfIslemNo := nil;
    FfIslemTip := nil;
    FfKaynakKod := nil;
    FfOperatorKod := nil;
  end;
  inherited;
end;

function TTableUretimKaynakIslemTanim.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableUretimKaynakIslemTanim.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimKaynakIslemTanim.GetIslemNo: Integer;
begin
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  Result := FfIslemNo.AsInteger;
end;

function TTableUretimKaynakIslemTanim.GetIslemTip: Integer;
begin
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  Result := FfIslemTip.AsInteger;
end;

function TTableUretimKaynakIslemTanim.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimKaynakIslemTanim.GetOperatorKod: String;
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  Result := FfOperatorKod.AsString;
end;

function TTableUretimKaynakIslemTanim.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableUretimKaynakIslemTanim.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimKaynakIslemTanim.GetfIslemNo: TField;
begin
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  Result := FfIslemNo;
end;

function TTableUretimKaynakIslemTanim.GetfIslemTip: TField;
begin
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  Result := FfIslemTip;
end;

function TTableUretimKaynakIslemTanim.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimKaynakIslemTanim.GetfOperatorKod: TField;
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  Result := FfOperatorKod;
end;

procedure TTableUretimKaynakIslemTanim.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableUretimKaynakIslemTanim.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimKaynakIslemTanim.SetIslemNo(const Value: Integer);
begin
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  FfIslemNo.AsInteger := Value;
end;

procedure TTableUretimKaynakIslemTanim.SetIslemTip(const Value: Integer);
begin
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  FfIslemTip.AsInteger := Value;
end;

procedure TTableUretimKaynakIslemTanim.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimKaynakIslemTanim.SetOperatorKod(const Value: String);
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  FfOperatorKod.AsString := Value;
end;

{ TTableUretimKaynakMamulDegisim }

constructor TTableUretimKaynakMamulDegisim.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTKMD';
end;

procedure TTableUretimKaynakMamulDegisim.DoAfterOpen;
begin
  if FfID = nil then
    FfID := FindField('ID');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfKurulumMamulKod = nil then
    FfKurulumMamulKod := FindField('KURULUMMAMULKOD');
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  if FfSokumMamulKod = nil then
    FfSokumMamulKod := FindField('SOKUMMAMULKOD');
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  if FfToplamSure = nil then
    FfToplamSure := FindField('TOPLAMSURE');
  inherited;
end;

procedure TTableUretimKaynakMamulDegisim.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfID := nil;
    FfKaynakKod := nil;
    FfKurulumMamulKod := nil;
    FfKurulumSure := nil;
    FfSokumMamulKod := nil;
    FfSokumSure := nil;
    FfToplamSure := nil;
  end;
  inherited;
end;

function TTableUretimKaynakMamulDegisim.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimKaynakMamulDegisim.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimKaynakMamulDegisim.GetKurulumMamulKod: String;
begin
  if FfKurulumMamulKod = nil then
    FfKurulumMamulKod := FindField('KURULUMMAMULKOD');
  Result := FfKurulumMamulKod.AsString;
end;

function TTableUretimKaynakMamulDegisim.GetKurulumSure: Double;
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  Result := FfKurulumSure.AsFloat;
end;

function TTableUretimKaynakMamulDegisim.GetSokumMamulKod: String;
begin
  if FfSokumMamulKod = nil then
    FfSokumMamulKod := FindField('SOKUMMAMULKOD');
  Result := FfSokumMamulKod.AsString;
end;

function TTableUretimKaynakMamulDegisim.GetSokumSure: Double;
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  Result := FfSokumSure.AsFloat;
end;

function TTableUretimKaynakMamulDegisim.GetToplamSure: Double;
begin
  if FfToplamSure = nil then
    FfToplamSure := FindField('TOPLAMSURE');
  Result := FfToplamSure.AsFloat;
end;

function TTableUretimKaynakMamulDegisim.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimKaynakMamulDegisim.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimKaynakMamulDegisim.GetfKurulumMamulKod: TField;
begin
  if FfKurulumMamulKod = nil then
    FfKurulumMamulKod := FindField('KURULUMMAMULKOD');
  Result := FfKurulumMamulKod;
end;

function TTableUretimKaynakMamulDegisim.GetfKurulumSure: TField;
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  Result := FfKurulumSure;
end;

function TTableUretimKaynakMamulDegisim.GetfSokumMamulKod: TField;
begin
  if FfSokumMamulKod = nil then
    FfSokumMamulKod := FindField('SOKUMMAMULKOD');
  Result := FfSokumMamulKod;
end;

function TTableUretimKaynakMamulDegisim.GetfSokumSure: TField;
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  Result := FfSokumSure;
end;

function TTableUretimKaynakMamulDegisim.GetfToplamSure: TField;
begin
  if FfToplamSure = nil then
    FfToplamSure := FindField('TOPLAMSURE');
  Result := FfToplamSure;
end;

procedure TTableUretimKaynakMamulDegisim.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimKaynakMamulDegisim.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimKaynakMamulDegisim.SetKurulumMamulKod(const Value: String);
begin
  if FfKurulumMamulKod = nil then
    FfKurulumMamulKod := FindField('KURULUMMAMULKOD');
  FfKurulumMamulKod.AsString := Value;
end;

procedure TTableUretimKaynakMamulDegisim.SetKurulumSure(const Value: Double);
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  FfKurulumSure.AsFloat := Value;
end;

procedure TTableUretimKaynakMamulDegisim.SetSokumMamulKod(const Value: String);
begin
  if FfSokumMamulKod = nil then
    FfSokumMamulKod := FindField('SOKUMMAMULKOD');
  FfSokumMamulKod.AsString := Value;
end;

procedure TTableUretimKaynakMamulDegisim.SetSokumSure(const Value: Double);
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  FfSokumSure.AsFloat := Value;
end;

procedure TTableUretimKaynakMamulDegisim.SetToplamSure(const Value: Double);
begin
  if FfToplamSure = nil then
    FfToplamSure := FindField('TOPLAMSURE');
  FfToplamSure.AsFloat := Value;
end;

{ TTableUretimKaynakMamulKurulum }

constructor TTableUretimKaynakMamulKurulum.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTKMK';
end;

procedure TTableUretimKaynakMamulKurulum.DoAfterOpen;
begin
  if FfBeklemeSure = nil then
    FfBeklemeSure := FindField('BEKLEMESURE');
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  if FfKurulumSure1 = nil then
    FfKurulumSure1 := FindField('KURULUMSURE1');
  if FfKurulumSure2 = nil then
    FfKurulumSure2 := FindField('KURULUMSURE2');
  if FfKurulumSure3 = nil then
    FfKurulumSure3 := FindField('KURULUMSURE3');
  if FfKurulumSure4 = nil then
    FfKurulumSure4 := FindField('KURULUMSURE4');
  if FfKurulumSure5 = nil then
    FfKurulumSure5 := FindField('KURULUMSURE5');
  if FfKuyrukSure = nil then
    FfKuyrukSure := FindField('KUYRUKSURE');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  if FfOptCalismaSure = nil then
    FfOptCalismaSure := FindField('OPTCALISMASURE');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  if FfSokumSure1 = nil then
    FfSokumSure1 := FindField('SOKUMSURE1');
  if FfSokumSure2 = nil then
    FfSokumSure2 := FindField('SOKUMSURE2');
  if FfTasimaSure = nil then
    FfTasimaSure := FindField('TASIMASURE');
  inherited;
end;

procedure TTableUretimKaynakMamulKurulum.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfBeklemeSure := nil;
    FfCalismaSure := nil;
    FfID := nil;
    FfKaynakKod := nil;
    FfKurulumSure := nil;
    FfKurulumSure1 := nil;
    FfKurulumSure2 := nil;
    FfKurulumSure3 := nil;
    FfKurulumSure4 := nil;
    FfKurulumSure5 := nil;
    FfKuyrukSure := nil;
    FfMamulKod := nil;
    FfOptCalismaSure := nil;
    FfRowGuid := nil;
    FfSokumSure := nil;
    FfSokumSure1 := nil;
    FfSokumSure2 := nil;
    FfTasimaSure := nil;
  end;
  inherited;
end;

function TTableUretimKaynakMamulKurulum.GetBeklemeSure: Double;
begin
  if FfBeklemeSure = nil then
    FfBeklemeSure := FindField('BEKLEMESURE');
  Result := FfBeklemeSure.AsFloat;
end;

function TTableUretimKaynakMamulKurulum.GetCalismaSure: Double;
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  Result := FfCalismaSure.AsFloat;
end;

function TTableUretimKaynakMamulKurulum.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimKaynakMamulKurulum.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimKaynakMamulKurulum.GetKurulumSure: Double;
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  Result := FfKurulumSure.AsFloat;
end;

function TTableUretimKaynakMamulKurulum.GetKurulumSure1: Double;
begin
  if FfKurulumSure1 = nil then
    FfKurulumSure1 := FindField('KURULUMSURE1');
  Result := FfKurulumSure1.AsFloat;
end;

function TTableUretimKaynakMamulKurulum.GetKurulumSure2: Double;
begin
  if FfKurulumSure2 = nil then
    FfKurulumSure2 := FindField('KURULUMSURE2');
  Result := FfKurulumSure2.AsFloat;
end;

function TTableUretimKaynakMamulKurulum.GetKurulumSure3: Double;
begin
  if FfKurulumSure3 = nil then
    FfKurulumSure3 := FindField('KURULUMSURE3');
  Result := FfKurulumSure3.AsFloat;
end;

function TTableUretimKaynakMamulKurulum.GetKurulumSure4: Double;
begin
  if FfKurulumSure4 = nil then
    FfKurulumSure4 := FindField('KURULUMSURE4');
  Result := FfKurulumSure4.AsFloat;
end;

function TTableUretimKaynakMamulKurulum.GetKurulumSure5: Double;
begin
  if FfKurulumSure5 = nil then
    FfKurulumSure5 := FindField('KURULUMSURE5');
  Result := FfKurulumSure5.AsFloat;
end;

function TTableUretimKaynakMamulKurulum.GetKuyrukSure: Double;
begin
  if FfKuyrukSure = nil then
    FfKuyrukSure := FindField('KUYRUKSURE');
  Result := FfKuyrukSure.AsFloat;
end;

function TTableUretimKaynakMamulKurulum.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableUretimKaynakMamulKurulum.GetOptCalismaSure: Double;
begin
  if FfOptCalismaSure = nil then
    FfOptCalismaSure := FindField('OPTCALISMASURE');
  Result := FfOptCalismaSure.AsFloat;
end;

function TTableUretimKaynakMamulKurulum.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimKaynakMamulKurulum.GetSokumSure: Double;
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  Result := FfSokumSure.AsFloat;
end;

function TTableUretimKaynakMamulKurulum.GetSokumSure1: Double;
begin
  if FfSokumSure1 = nil then
    FfSokumSure1 := FindField('SOKUMSURE1');
  Result := FfSokumSure1.AsFloat;
end;

function TTableUretimKaynakMamulKurulum.GetSokumSure2: Double;
begin
  if FfSokumSure2 = nil then
    FfSokumSure2 := FindField('SOKUMSURE2');
  Result := FfSokumSure2.AsFloat;
end;

function TTableUretimKaynakMamulKurulum.GetTasimaSure: Double;
begin
  if FfTasimaSure = nil then
    FfTasimaSure := FindField('TASIMASURE');
  Result := FfTasimaSure.AsFloat;
end;

function TTableUretimKaynakMamulKurulum.GetfBeklemeSure: TField;
begin
  if FfBeklemeSure = nil then
    FfBeklemeSure := FindField('BEKLEMESURE');
  Result := FfBeklemeSure;
end;

function TTableUretimKaynakMamulKurulum.GetfCalismaSure: TField;
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  Result := FfCalismaSure;
end;

function TTableUretimKaynakMamulKurulum.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimKaynakMamulKurulum.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimKaynakMamulKurulum.GetfKurulumSure: TField;
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  Result := FfKurulumSure;
end;

function TTableUretimKaynakMamulKurulum.GetfKurulumSure1: TField;
begin
  if FfKurulumSure1 = nil then
    FfKurulumSure1 := FindField('KURULUMSURE1');
  Result := FfKurulumSure1;
end;

function TTableUretimKaynakMamulKurulum.GetfKurulumSure2: TField;
begin
  if FfKurulumSure2 = nil then
    FfKurulumSure2 := FindField('KURULUMSURE2');
  Result := FfKurulumSure2;
end;

function TTableUretimKaynakMamulKurulum.GetfKurulumSure3: TField;
begin
  if FfKurulumSure3 = nil then
    FfKurulumSure3 := FindField('KURULUMSURE3');
  Result := FfKurulumSure3;
end;

function TTableUretimKaynakMamulKurulum.GetfKurulumSure4: TField;
begin
  if FfKurulumSure4 = nil then
    FfKurulumSure4 := FindField('KURULUMSURE4');
  Result := FfKurulumSure4;
end;

function TTableUretimKaynakMamulKurulum.GetfKurulumSure5: TField;
begin
  if FfKurulumSure5 = nil then
    FfKurulumSure5 := FindField('KURULUMSURE5');
  Result := FfKurulumSure5;
end;

function TTableUretimKaynakMamulKurulum.GetfKuyrukSure: TField;
begin
  if FfKuyrukSure = nil then
    FfKuyrukSure := FindField('KUYRUKSURE');
  Result := FfKuyrukSure;
end;

function TTableUretimKaynakMamulKurulum.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableUretimKaynakMamulKurulum.GetfOptCalismaSure: TField;
begin
  if FfOptCalismaSure = nil then
    FfOptCalismaSure := FindField('OPTCALISMASURE');
  Result := FfOptCalismaSure;
end;

function TTableUretimKaynakMamulKurulum.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimKaynakMamulKurulum.GetfSokumSure: TField;
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  Result := FfSokumSure;
end;

function TTableUretimKaynakMamulKurulum.GetfSokumSure1: TField;
begin
  if FfSokumSure1 = nil then
    FfSokumSure1 := FindField('SOKUMSURE1');
  Result := FfSokumSure1;
end;

function TTableUretimKaynakMamulKurulum.GetfSokumSure2: TField;
begin
  if FfSokumSure2 = nil then
    FfSokumSure2 := FindField('SOKUMSURE2');
  Result := FfSokumSure2;
end;

function TTableUretimKaynakMamulKurulum.GetfTasimaSure: TField;
begin
  if FfTasimaSure = nil then
    FfTasimaSure := FindField('TASIMASURE');
  Result := FfTasimaSure;
end;

procedure TTableUretimKaynakMamulKurulum.SetBeklemeSure(const Value: Double);
begin
  if FfBeklemeSure = nil then
    FfBeklemeSure := FindField('BEKLEMESURE');
  FfBeklemeSure.AsFloat := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetCalismaSure(const Value: Double);
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  FfCalismaSure.AsFloat := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetKurulumSure(const Value: Double);
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  FfKurulumSure.AsFloat := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetKurulumSure1(const Value: Double);
begin
  if FfKurulumSure1 = nil then
    FfKurulumSure1 := FindField('KURULUMSURE1');
  FfKurulumSure1.AsFloat := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetKurulumSure2(const Value: Double);
begin
  if FfKurulumSure2 = nil then
    FfKurulumSure2 := FindField('KURULUMSURE2');
  FfKurulumSure2.AsFloat := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetKurulumSure3(const Value: Double);
begin
  if FfKurulumSure3 = nil then
    FfKurulumSure3 := FindField('KURULUMSURE3');
  FfKurulumSure3.AsFloat := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetKurulumSure4(const Value: Double);
begin
  if FfKurulumSure4 = nil then
    FfKurulumSure4 := FindField('KURULUMSURE4');
  FfKurulumSure4.AsFloat := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetKurulumSure5(const Value: Double);
begin
  if FfKurulumSure5 = nil then
    FfKurulumSure5 := FindField('KURULUMSURE5');
  FfKurulumSure5.AsFloat := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetKuyrukSure(const Value: Double);
begin
  if FfKuyrukSure = nil then
    FfKuyrukSure := FindField('KUYRUKSURE');
  FfKuyrukSure.AsFloat := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetOptCalismaSure(const Value: Double);
begin
  if FfOptCalismaSure = nil then
    FfOptCalismaSure := FindField('OPTCALISMASURE');
  FfOptCalismaSure.AsFloat := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetSokumSure(const Value: Double);
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  FfSokumSure.AsFloat := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetSokumSure1(const Value: Double);
begin
  if FfSokumSure1 = nil then
    FfSokumSure1 := FindField('SOKUMSURE1');
  FfSokumSure1.AsFloat := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetSokumSure2(const Value: Double);
begin
  if FfSokumSure2 = nil then
    FfSokumSure2 := FindField('SOKUMSURE2');
  FfSokumSure2.AsFloat := Value;
end;

procedure TTableUretimKaynakMamulKurulum.SetTasimaSure(const Value: Double);
begin
  if FfTasimaSure = nil then
    FfTasimaSure := FindField('TASIMASURE');
  FfTasimaSure.AsFloat := Value;
end;

{ TTableUretimKaynakDevamsizlik }

constructor TTableUretimKaynakDevamsizlik.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTKYD';
end;

procedure TTableUretimKaynakDevamsizlik.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
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
  if FfKapasite = nil then
    FfKapasite := FindField('KAPASITE');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfTakvimYil = nil then
    FfTakvimYil := FindField('TAKVIMYIL');
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  inherited;
end;

procedure TTableUretimKaynakDevamsizlik.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfBasSaat := nil;
    FfBitSaat := nil;
    FfDegistirenKaynak := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
    FfDurusKod := nil;
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfID := nil;
    FfKapasite := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKaynakKod := nil;
    FfSirketNo := nil;
    FfTakvimYil := nil;
    FfTarih := nil;
  end;
  inherited;
end;

function TTableUretimKaynakDevamsizlik.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableUretimKaynakDevamsizlik.GetBasSaat: TDate;
begin
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  Result := FfBasSaat.AsDateTime;
end;

function TTableUretimKaynakDevamsizlik.GetBitSaat: TDate;
begin
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  Result := FfBitSaat.AsDateTime;
end;

function TTableUretimKaynakDevamsizlik.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableUretimKaynakDevamsizlik.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimKaynakDevamsizlik.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimKaynakDevamsizlik.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableUretimKaynakDevamsizlik.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableUretimKaynakDevamsizlik.GetDurusKod: String;
begin
  if FfDurusKod = nil then
    FfDurusKod := FindField('DURUSKOD');
  Result := FfDurusKod.AsString;
end;

function TTableUretimKaynakDevamsizlik.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableUretimKaynakDevamsizlik.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableUretimKaynakDevamsizlik.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimKaynakDevamsizlik.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableUretimKaynakDevamsizlik.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableUretimKaynakDevamsizlik.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimKaynakDevamsizlik.GetKapasite: Double;
begin
  if FfKapasite = nil then
    FfKapasite := FindField('KAPASITE');
  Result := FfKapasite.AsFloat;
end;

function TTableUretimKaynakDevamsizlik.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableUretimKaynakDevamsizlik.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimKaynakDevamsizlik.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimKaynakDevamsizlik.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimKaynakDevamsizlik.GetTakvimYil: Integer;
begin
  if FfTakvimYil = nil then
    FfTakvimYil := FindField('TAKVIMYIL');
  Result := FfTakvimYil.AsInteger;
end;

function TTableUretimKaynakDevamsizlik.GetTarih: TDate;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih.AsDateTime;
end;

function TTableUretimKaynakDevamsizlik.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableUretimKaynakDevamsizlik.GetfBasSaat: TField;
begin
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  Result := FfBasSaat;
end;

function TTableUretimKaynakDevamsizlik.GetfBitSaat: TField;
begin
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  Result := FfBitSaat;
end;

function TTableUretimKaynakDevamsizlik.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableUretimKaynakDevamsizlik.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimKaynakDevamsizlik.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimKaynakDevamsizlik.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableUretimKaynakDevamsizlik.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableUretimKaynakDevamsizlik.GetfDurusKod: TField;
begin
  if FfDurusKod = nil then
    FfDurusKod := FindField('DURUSKOD');
  Result := FfDurusKod;
end;

function TTableUretimKaynakDevamsizlik.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableUretimKaynakDevamsizlik.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableUretimKaynakDevamsizlik.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimKaynakDevamsizlik.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableUretimKaynakDevamsizlik.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableUretimKaynakDevamsizlik.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimKaynakDevamsizlik.GetfKapasite: TField;
begin
  if FfKapasite = nil then
    FfKapasite := FindField('KAPASITE');
  Result := FfKapasite;
end;

function TTableUretimKaynakDevamsizlik.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableUretimKaynakDevamsizlik.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimKaynakDevamsizlik.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimKaynakDevamsizlik.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimKaynakDevamsizlik.GetfTakvimYil: TField;
begin
  if FfTakvimYil = nil then
    FfTakvimYil := FindField('TAKVIMYIL');
  Result := FfTakvimYil;
end;

function TTableUretimKaynakDevamsizlik.GetfTarih: TField;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih;
end;

procedure TTableUretimKaynakDevamsizlik.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetBasSaat(const Value: TDate);
begin
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  FfBasSaat.AsDateTime := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetBitSaat(const Value: TDate);
begin
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  FfBitSaat.AsDateTime := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetDurusKod(const Value: String);
begin
  if FfDurusKod = nil then
    FfDurusKod := FindField('DURUSKOD');
  FfDurusKod.AsString := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetKapasite(const Value: Double);
begin
  if FfKapasite = nil then
    FfKapasite := FindField('KAPASITE');
  FfKapasite.AsFloat := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetTakvimYil(const Value: Integer);
begin
  if FfTakvimYil = nil then
    FfTakvimYil := FindField('TAKVIMYIL');
  FfTakvimYil.AsInteger := Value;
end;

procedure TTableUretimKaynakDevamsizlik.SetTarih(const Value: TDate);
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  FfTarih.AsDateTime := Value;
end;

{ TTableUretimKaynakKart }

constructor TTableUretimKaynakKart.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTKYN';
end;

procedure TTableUretimKaynakKart.DoAfterOpen;
begin
  if FfBeklemeSure = nil then
    FfBeklemeSure := FindField('BEKLEMESURE');
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
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
  if FfEsZamanliKapasite = nil then
    FfEsZamanliKapasite := FindField('ESZAMANLIKAPASITE');
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
  if FfKapasite = nil then
    FfKapasite := FindField('KAPASITE');
  if FfKapasiteSinirli = nil then
    FfKapasiteSinirli := FindField('KAPASITESINIRLI');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKaynakAd = nil then
    FfKaynakAd := FindField('KAYNAKAD');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfKaynakTip = nil then
    FfKaynakTip := FindField('KAYNAKTIP');
  if FfKritikYuk = nil then
    FfKritikYuk := FindField('KRITIKYUK');
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  if FfKuyrukSure = nil then
    FfKuyrukSure := FindField('KUYRUKSURE');
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('MALIYET1');
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('MALIYET2');
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('MALIYET3');
  if FfMaxIslemSure = nil then
    FfMaxIslemSure := FindField('MAXISLEMSURE');
  if FfMekanikSaatKatSayi = nil then
    FfMekanikSaatKatSayi := FindField('MEKANIKSAATKATSAYI');
  if FfMinIslemSure = nil then
    FfMinIslemSure := FindField('MINISLEMSURE');
  if FfOnUretimMiktar = nil then
    FfOnUretimMiktar := FindField('ONURETIMMIKTAR');
  if FfOptCalismaSure = nil then
    FfOptCalismaSure := FindField('OPTCALISMASURE');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  if FfSonumleyici = nil then
    FfSonumleyici := FindField('SONUMLEYICI');
  if FfTasimaSure = nil then
    FfTasimaSure := FindField('TASIMASURE');
  if FfVerimlilik = nil then
    FfVerimlilik := FindField('VERIMLILIK');
  inherited;
end;

procedure TTableUretimKaynakKart.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfBeklemeSure := nil;
    FfCalismaSure := nil;
    FfDegistirenKaynak := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
    FfEsZamanliKapasite := nil;
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfID := nil;
    FfKapasite := nil;
    FfKapasiteSinirli := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKaynakAd := nil;
    FfKaynakKod := nil;
    FfKaynakTip := nil;
    FfKritikYuk := nil;
    FfKurulumSure := nil;
    FfKuyrukSure := nil;
    FfMaliyet1 := nil;
    FfMaliyet2 := nil;
    FfMaliyet3 := nil;
    FfMaxIslemSure := nil;
    FfMekanikSaatKatSayi := nil;
    FfMinIslemSure := nil;
    FfOnUretimMiktar := nil;
    FfOptCalismaSure := nil;
    FfRowGuid := nil;
    FfSirketNo := nil;
    FfSokumSure := nil;
    FfSonumleyici := nil;
    FfTasimaSure := nil;
    FfVerimlilik := nil;
  end;
  inherited;
end;

function TTableUretimKaynakKart.GetBeklemeSure: Double;
begin
  if FfBeklemeSure = nil then
    FfBeklemeSure := FindField('BEKLEMESURE');
  Result := FfBeklemeSure.AsFloat;
end;

function TTableUretimKaynakKart.GetCalismaSure: Double;
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  Result := FfCalismaSure.AsFloat;
end;

function TTableUretimKaynakKart.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableUretimKaynakKart.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimKaynakKart.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimKaynakKart.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableUretimKaynakKart.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableUretimKaynakKart.GetEsZamanliKapasite: Double;
begin
  if FfEsZamanliKapasite = nil then
    FfEsZamanliKapasite := FindField('ESZAMANLIKAPASITE');
  Result := FfEsZamanliKapasite.AsFloat;
end;

function TTableUretimKaynakKart.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableUretimKaynakKart.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableUretimKaynakKart.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimKaynakKart.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableUretimKaynakKart.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableUretimKaynakKart.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimKaynakKart.GetKapasite: Double;
begin
  if FfKapasite = nil then
    FfKapasite := FindField('KAPASITE');
  Result := FfKapasite.AsFloat;
end;

function TTableUretimKaynakKart.GetKapasiteSinirli: Integer;
begin
  if FfKapasiteSinirli = nil then
    FfKapasiteSinirli := FindField('KAPASITESINIRLI');
  Result := FfKapasiteSinirli.AsInteger;
end;

function TTableUretimKaynakKart.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableUretimKaynakKart.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimKaynakKart.GetKaynakAd: String;
begin
  if FfKaynakAd = nil then
    FfKaynakAd := FindField('KAYNAKAD');
  Result := FfKaynakAd.AsString;
end;

function TTableUretimKaynakKart.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimKaynakKart.GetKaynakTip: Integer;
begin
  if FfKaynakTip = nil then
    FfKaynakTip := FindField('KAYNAKTIP');
  Result := FfKaynakTip.AsInteger;
end;

function TTableUretimKaynakKart.GetKritikYuk: Double;
begin
  if FfKritikYuk = nil then
    FfKritikYuk := FindField('KRITIKYUK');
  Result := FfKritikYuk.AsFloat;
end;

function TTableUretimKaynakKart.GetKurulumSure: Double;
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  Result := FfKurulumSure.AsFloat;
end;

function TTableUretimKaynakKart.GetKuyrukSure: Double;
begin
  if FfKuyrukSure = nil then
    FfKuyrukSure := FindField('KUYRUKSURE');
  Result := FfKuyrukSure.AsFloat;
end;

function TTableUretimKaynakKart.GetMaliyet1: Double;
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('MALIYET1');
  Result := FfMaliyet1.AsFloat;
end;

function TTableUretimKaynakKart.GetMaliyet2: Double;
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('MALIYET2');
  Result := FfMaliyet2.AsFloat;
end;

function TTableUretimKaynakKart.GetMaliyet3: Double;
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('MALIYET3');
  Result := FfMaliyet3.AsFloat;
end;

function TTableUretimKaynakKart.GetMaxIslemSure: Double;
begin
  if FfMaxIslemSure = nil then
    FfMaxIslemSure := FindField('MAXISLEMSURE');
  Result := FfMaxIslemSure.AsFloat;
end;

function TTableUretimKaynakKart.GetMekanikSaatKatSayi: Double;
begin
  if FfMekanikSaatKatSayi = nil then
    FfMekanikSaatKatSayi := FindField('MEKANIKSAATKATSAYI');
  Result := FfMekanikSaatKatSayi.AsFloat;
end;

function TTableUretimKaynakKart.GetMinIslemSure: Double;
begin
  if FfMinIslemSure = nil then
    FfMinIslemSure := FindField('MINISLEMSURE');
  Result := FfMinIslemSure.AsFloat;
end;

function TTableUretimKaynakKart.GetOnUretimMiktar: Double;
begin
  if FfOnUretimMiktar = nil then
    FfOnUretimMiktar := FindField('ONURETIMMIKTAR');
  Result := FfOnUretimMiktar.AsFloat;
end;

function TTableUretimKaynakKart.GetOptCalismaSure: Double;
begin
  if FfOptCalismaSure = nil then
    FfOptCalismaSure := FindField('OPTCALISMASURE');
  Result := FfOptCalismaSure.AsFloat;
end;

function TTableUretimKaynakKart.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimKaynakKart.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimKaynakKart.GetSokumSure: Double;
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  Result := FfSokumSure.AsFloat;
end;

function TTableUretimKaynakKart.GetSonumleyici: Double;
begin
  if FfSonumleyici = nil then
    FfSonumleyici := FindField('SONUMLEYICI');
  Result := FfSonumleyici.AsFloat;
end;

function TTableUretimKaynakKart.GetTasimaSure: Double;
begin
  if FfTasimaSure = nil then
    FfTasimaSure := FindField('TASIMASURE');
  Result := FfTasimaSure.AsFloat;
end;

function TTableUretimKaynakKart.GetVerimlilik: Double;
begin
  if FfVerimlilik = nil then
    FfVerimlilik := FindField('VERIMLILIK');
  Result := FfVerimlilik.AsFloat;
end;

function TTableUretimKaynakKart.GetfBeklemeSure: TField;
begin
  if FfBeklemeSure = nil then
    FfBeklemeSure := FindField('BEKLEMESURE');
  Result := FfBeklemeSure;
end;

function TTableUretimKaynakKart.GetfCalismaSure: TField;
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  Result := FfCalismaSure;
end;

function TTableUretimKaynakKart.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableUretimKaynakKart.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimKaynakKart.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimKaynakKart.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableUretimKaynakKart.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableUretimKaynakKart.GetfEsZamanliKapasite: TField;
begin
  if FfEsZamanliKapasite = nil then
    FfEsZamanliKapasite := FindField('ESZAMANLIKAPASITE');
  Result := FfEsZamanliKapasite;
end;

function TTableUretimKaynakKart.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableUretimKaynakKart.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableUretimKaynakKart.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimKaynakKart.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableUretimKaynakKart.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableUretimKaynakKart.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimKaynakKart.GetfKapasite: TField;
begin
  if FfKapasite = nil then
    FfKapasite := FindField('KAPASITE');
  Result := FfKapasite;
end;

function TTableUretimKaynakKart.GetfKapasiteSinirli: TField;
begin
  if FfKapasiteSinirli = nil then
    FfKapasiteSinirli := FindField('KAPASITESINIRLI');
  Result := FfKapasiteSinirli;
end;

function TTableUretimKaynakKart.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableUretimKaynakKart.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimKaynakKart.GetfKaynakAd: TField;
begin
  if FfKaynakAd = nil then
    FfKaynakAd := FindField('KAYNAKAD');
  Result := FfKaynakAd;
end;

function TTableUretimKaynakKart.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimKaynakKart.GetfKaynakTip: TField;
begin
  if FfKaynakTip = nil then
    FfKaynakTip := FindField('KAYNAKTIP');
  Result := FfKaynakTip;
end;

function TTableUretimKaynakKart.GetfKritikYuk: TField;
begin
  if FfKritikYuk = nil then
    FfKritikYuk := FindField('KRITIKYUK');
  Result := FfKritikYuk;
end;

function TTableUretimKaynakKart.GetfKurulumSure: TField;
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  Result := FfKurulumSure;
end;

function TTableUretimKaynakKart.GetfKuyrukSure: TField;
begin
  if FfKuyrukSure = nil then
    FfKuyrukSure := FindField('KUYRUKSURE');
  Result := FfKuyrukSure;
end;

function TTableUretimKaynakKart.GetfMaliyet1: TField;
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('MALIYET1');
  Result := FfMaliyet1;
end;

function TTableUretimKaynakKart.GetfMaliyet2: TField;
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('MALIYET2');
  Result := FfMaliyet2;
end;

function TTableUretimKaynakKart.GetfMaliyet3: TField;
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('MALIYET3');
  Result := FfMaliyet3;
end;

function TTableUretimKaynakKart.GetfMaxIslemSure: TField;
begin
  if FfMaxIslemSure = nil then
    FfMaxIslemSure := FindField('MAXISLEMSURE');
  Result := FfMaxIslemSure;
end;

function TTableUretimKaynakKart.GetfMekanikSaatKatSayi: TField;
begin
  if FfMekanikSaatKatSayi = nil then
    FfMekanikSaatKatSayi := FindField('MEKANIKSAATKATSAYI');
  Result := FfMekanikSaatKatSayi;
end;

function TTableUretimKaynakKart.GetfMinIslemSure: TField;
begin
  if FfMinIslemSure = nil then
    FfMinIslemSure := FindField('MINISLEMSURE');
  Result := FfMinIslemSure;
end;

function TTableUretimKaynakKart.GetfOnUretimMiktar: TField;
begin
  if FfOnUretimMiktar = nil then
    FfOnUretimMiktar := FindField('ONURETIMMIKTAR');
  Result := FfOnUretimMiktar;
end;

function TTableUretimKaynakKart.GetfOptCalismaSure: TField;
begin
  if FfOptCalismaSure = nil then
    FfOptCalismaSure := FindField('OPTCALISMASURE');
  Result := FfOptCalismaSure;
end;

function TTableUretimKaynakKart.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimKaynakKart.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimKaynakKart.GetfSokumSure: TField;
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  Result := FfSokumSure;
end;

function TTableUretimKaynakKart.GetfSonumleyici: TField;
begin
  if FfSonumleyici = nil then
    FfSonumleyici := FindField('SONUMLEYICI');
  Result := FfSonumleyici;
end;

function TTableUretimKaynakKart.GetfTasimaSure: TField;
begin
  if FfTasimaSure = nil then
    FfTasimaSure := FindField('TASIMASURE');
  Result := FfTasimaSure;
end;

function TTableUretimKaynakKart.GetfVerimlilik: TField;
begin
  if FfVerimlilik = nil then
    FfVerimlilik := FindField('VERIMLILIK');
  Result := FfVerimlilik;
end;

procedure TTableUretimKaynakKart.SetBeklemeSure(const Value: Double);
begin
  if FfBeklemeSure = nil then
    FfBeklemeSure := FindField('BEKLEMESURE');
  FfBeklemeSure.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetCalismaSure(const Value: Double);
begin
  if FfCalismaSure = nil then
    FfCalismaSure := FindField('CALISMASURE');
  FfCalismaSure.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableUretimKaynakKart.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimKaynakKart.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimKaynakKart.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableUretimKaynakKart.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableUretimKaynakKart.SetEsZamanliKapasite(const Value: Double);
begin
  if FfEsZamanliKapasite = nil then
    FfEsZamanliKapasite := FindField('ESZAMANLIKAPASITE');
  FfEsZamanliKapasite.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableUretimKaynakKart.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableUretimKaynakKart.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimKaynakKart.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableUretimKaynakKart.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableUretimKaynakKart.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimKaynakKart.SetKapasite(const Value: Double);
begin
  if FfKapasite = nil then
    FfKapasite := FindField('KAPASITE');
  FfKapasite.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetKapasiteSinirli(const Value: Integer);
begin
  if FfKapasiteSinirli = nil then
    FfKapasiteSinirli := FindField('KAPASITESINIRLI');
  FfKapasiteSinirli.AsInteger := Value;
end;

procedure TTableUretimKaynakKart.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableUretimKaynakKart.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimKaynakKart.SetKaynakAd(const Value: String);
begin
  if FfKaynakAd = nil then
    FfKaynakAd := FindField('KAYNAKAD');
  FfKaynakAd.AsString := Value;
end;

procedure TTableUretimKaynakKart.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimKaynakKart.SetKaynakTip(const Value: Integer);
begin
  if FfKaynakTip = nil then
    FfKaynakTip := FindField('KAYNAKTIP');
  FfKaynakTip.AsInteger := Value;
end;

procedure TTableUretimKaynakKart.SetKritikYuk(const Value: Double);
begin
  if FfKritikYuk = nil then
    FfKritikYuk := FindField('KRITIKYUK');
  FfKritikYuk.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetKurulumSure(const Value: Double);
begin
  if FfKurulumSure = nil then
    FfKurulumSure := FindField('KURULUMSURE');
  FfKurulumSure.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetKuyrukSure(const Value: Double);
begin
  if FfKuyrukSure = nil then
    FfKuyrukSure := FindField('KUYRUKSURE');
  FfKuyrukSure.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetMaliyet1(const Value: Double);
begin
  if FfMaliyet1 = nil then
    FfMaliyet1 := FindField('MALIYET1');
  FfMaliyet1.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetMaliyet2(const Value: Double);
begin
  if FfMaliyet2 = nil then
    FfMaliyet2 := FindField('MALIYET2');
  FfMaliyet2.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetMaliyet3(const Value: Double);
begin
  if FfMaliyet3 = nil then
    FfMaliyet3 := FindField('MALIYET3');
  FfMaliyet3.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetMaxIslemSure(const Value: Double);
begin
  if FfMaxIslemSure = nil then
    FfMaxIslemSure := FindField('MAXISLEMSURE');
  FfMaxIslemSure.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetMekanikSaatKatSayi(const Value: Double);
begin
  if FfMekanikSaatKatSayi = nil then
    FfMekanikSaatKatSayi := FindField('MEKANIKSAATKATSAYI');
  FfMekanikSaatKatSayi.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetMinIslemSure(const Value: Double);
begin
  if FfMinIslemSure = nil then
    FfMinIslemSure := FindField('MINISLEMSURE');
  FfMinIslemSure.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetOnUretimMiktar(const Value: Double);
begin
  if FfOnUretimMiktar = nil then
    FfOnUretimMiktar := FindField('ONURETIMMIKTAR');
  FfOnUretimMiktar.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetOptCalismaSure(const Value: Double);
begin
  if FfOptCalismaSure = nil then
    FfOptCalismaSure := FindField('OPTCALISMASURE');
  FfOptCalismaSure.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimKaynakKart.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimKaynakKart.SetSokumSure(const Value: Double);
begin
  if FfSokumSure = nil then
    FfSokumSure := FindField('SOKUMSURE');
  FfSokumSure.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetSonumleyici(const Value: Double);
begin
  if FfSonumleyici = nil then
    FfSonumleyici := FindField('SONUMLEYICI');
  FfSonumleyici.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetTasimaSure(const Value: Double);
begin
  if FfTasimaSure = nil then
    FfTasimaSure := FindField('TASIMASURE');
  FfTasimaSure.AsFloat := Value;
end;

procedure TTableUretimKaynakKart.SetVerimlilik(const Value: Double);
begin
  if FfVerimlilik = nil then
    FfVerimlilik := FindField('VERIMLILIK');
  FfVerimlilik.AsFloat := Value;
end;

{ TTableUretimKaynakSonDurum }

constructor TTableUretimKaynakSonDurum.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTKYS';
end;

procedure TTableUretimKaynakSonDurum.DoAfterOpen;
begin
  if FfID = nil then
    FfID := FindField('ID');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfSonBitTarih = nil then
    FfSonBitTarih := FindField('SONBITTARIH');
  if FfSonBitTarihSaat = nil then
    FfSonBitTarihSaat := FindField('SONBITTARIHSAAT');
  if FfSonMamulKod = nil then
    FfSonMamulKod := FindField('SONMAMULKOD');
  inherited;
end;

procedure TTableUretimKaynakSonDurum.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfID := nil;
    FfKaynakKod := nil;
    FfSonBitTarih := nil;
    FfSonBitTarihSaat := nil;
    FfSonMamulKod := nil;
  end;
  inherited;
end;

function TTableUretimKaynakSonDurum.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimKaynakSonDurum.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimKaynakSonDurum.GetSonBitTarih: TDate;
begin
  if FfSonBitTarih = nil then
    FfSonBitTarih := FindField('SONBITTARIH');
  Result := FfSonBitTarih.AsDateTime;
end;

function TTableUretimKaynakSonDurum.GetSonBitTarihSaat: TDate;
begin
  if FfSonBitTarihSaat = nil then
    FfSonBitTarihSaat := FindField('SONBITTARIHSAAT');
  Result := FfSonBitTarihSaat.AsDateTime;
end;

function TTableUretimKaynakSonDurum.GetSonMamulKod: String;
begin
  if FfSonMamulKod = nil then
    FfSonMamulKod := FindField('SONMAMULKOD');
  Result := FfSonMamulKod.AsString;
end;

function TTableUretimKaynakSonDurum.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimKaynakSonDurum.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimKaynakSonDurum.GetfSonBitTarih: TField;
begin
  if FfSonBitTarih = nil then
    FfSonBitTarih := FindField('SONBITTARIH');
  Result := FfSonBitTarih;
end;

function TTableUretimKaynakSonDurum.GetfSonBitTarihSaat: TField;
begin
  if FfSonBitTarihSaat = nil then
    FfSonBitTarihSaat := FindField('SONBITTARIHSAAT');
  Result := FfSonBitTarihSaat;
end;

function TTableUretimKaynakSonDurum.GetfSonMamulKod: TField;
begin
  if FfSonMamulKod = nil then
    FfSonMamulKod := FindField('SONMAMULKOD');
  Result := FfSonMamulKod;
end;

procedure TTableUretimKaynakSonDurum.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimKaynakSonDurum.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimKaynakSonDurum.SetSonBitTarih(const Value: TDate);
begin
  if FfSonBitTarih = nil then
    FfSonBitTarih := FindField('SONBITTARIH');
  FfSonBitTarih.AsDateTime := Value;
end;

procedure TTableUretimKaynakSonDurum.SetSonBitTarihSaat(const Value: TDate);
begin
  if FfSonBitTarihSaat = nil then
    FfSonBitTarihSaat := FindField('SONBITTARIHSAAT');
  FfSonBitTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimKaynakSonDurum.SetSonMamulKod(const Value: String);
begin
  if FfSonMamulKod = nil then
    FfSonMamulKod := FindField('SONMAMULKOD');
  FfSonMamulKod.AsString := Value;
end;

{ TTableUretimKaynakTakvim }

constructor TTableUretimKaynakTakvim.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTKYT';
end;

procedure TTableUretimKaynakTakvim.DoAfterOpen;
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('_KULLANILAN');
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  if FfEtkinKapasite = nil then
    FfEtkinKapasite := FindField('ETKINKAPASITE');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKapasite = nil then
    FfKapasite := FindField('KAPASITE');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfKullanilanKapasite = nil then
    FfKullanilanKapasite := FindField('KULLANILANKAPASITE');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfTakvimYil = nil then
    FfTakvimYil := FindField('TAKVIMYIL');
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  if FfToplamKapasite = nil then
    FfToplamKapasite := FindField('TOPLAMKAPASITE');
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  if FfVerimlilik = nil then
    FfVerimlilik := FindField('VERIMLILIK');
  inherited;
end;

procedure TTableUretimKaynakTakvim.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfKullanilan := nil;
    FfBasSaat := nil;
    FfBasTarihSaat := nil;
    FfBitSaat := nil;
    FfBitTarihSaat := nil;
    FfEtkinKapasite := nil;
    FfID := nil;
    FfKapasite := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfKaynakKod := nil;
    FfKullanilanKapasite := nil;
    FfSirketNo := nil;
    FfTakvimYil := nil;
    FfTarih := nil;
    FfToplamKapasite := nil;
    FfVardiyaKod := nil;
    FfVerimlilik := nil;
  end;
  inherited;
end;

function TTableUretimKaynakTakvim.GetKullanilan: Double;
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('_KULLANILAN');
  Result := FfKullanilan.AsFloat;
end;

function TTableUretimKaynakTakvim.GetBasSaat: TDate;
begin
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  Result := FfBasSaat.AsDateTime;
end;

function TTableUretimKaynakTakvim.GetBasTarihSaat: TDate;
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  Result := FfBasTarihSaat.AsDateTime;
end;

function TTableUretimKaynakTakvim.GetBitSaat: TDate;
begin
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  Result := FfBitSaat.AsDateTime;
end;

function TTableUretimKaynakTakvim.GetBitTarihSaat: TDate;
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  Result := FfBitTarihSaat.AsDateTime;
end;

function TTableUretimKaynakTakvim.GetEtkinKapasite: Double;
begin
  if FfEtkinKapasite = nil then
    FfEtkinKapasite := FindField('ETKINKAPASITE');
  Result := FfEtkinKapasite.AsFloat;
end;

function TTableUretimKaynakTakvim.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimKaynakTakvim.GetKapasite: Double;
begin
  if FfKapasite = nil then
    FfKapasite := FindField('KAPASITE');
  Result := FfKapasite.AsFloat;
end;

function TTableUretimKaynakTakvim.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableUretimKaynakTakvim.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimKaynakTakvim.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimKaynakTakvim.GetKullanilanKapasite: Double;
begin
  if FfKullanilanKapasite = nil then
    FfKullanilanKapasite := FindField('KULLANILANKAPASITE');
  Result := FfKullanilanKapasite.AsFloat;
end;

function TTableUretimKaynakTakvim.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimKaynakTakvim.GetTakvimYil: Integer;
begin
  if FfTakvimYil = nil then
    FfTakvimYil := FindField('TAKVIMYIL');
  Result := FfTakvimYil.AsInteger;
end;

function TTableUretimKaynakTakvim.GetTarih: TDate;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih.AsDateTime;
end;

function TTableUretimKaynakTakvim.GetToplamKapasite: Double;
begin
  if FfToplamKapasite = nil then
    FfToplamKapasite := FindField('TOPLAMKAPASITE');
  Result := FfToplamKapasite.AsFloat;
end;

function TTableUretimKaynakTakvim.GetVardiyaKod: String;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod.AsString;
end;

function TTableUretimKaynakTakvim.GetVerimlilik: Double;
begin
  if FfVerimlilik = nil then
    FfVerimlilik := FindField('VERIMLILIK');
  Result := FfVerimlilik.AsFloat;
end;

function TTableUretimKaynakTakvim.GetfKullanilan: TField;
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('_KULLANILAN');
  Result := FfKullanilan;
end;

function TTableUretimKaynakTakvim.GetfBasSaat: TField;
begin
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  Result := FfBasSaat;
end;

function TTableUretimKaynakTakvim.GetfBasTarihSaat: TField;
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  Result := FfBasTarihSaat;
end;

function TTableUretimKaynakTakvim.GetfBitSaat: TField;
begin
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  Result := FfBitSaat;
end;

function TTableUretimKaynakTakvim.GetfBitTarihSaat: TField;
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  Result := FfBitTarihSaat;
end;

function TTableUretimKaynakTakvim.GetfEtkinKapasite: TField;
begin
  if FfEtkinKapasite = nil then
    FfEtkinKapasite := FindField('ETKINKAPASITE');
  Result := FfEtkinKapasite;
end;

function TTableUretimKaynakTakvim.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimKaynakTakvim.GetfKapasite: TField;
begin
  if FfKapasite = nil then
    FfKapasite := FindField('KAPASITE');
  Result := FfKapasite;
end;

function TTableUretimKaynakTakvim.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableUretimKaynakTakvim.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimKaynakTakvim.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimKaynakTakvim.GetfKullanilanKapasite: TField;
begin
  if FfKullanilanKapasite = nil then
    FfKullanilanKapasite := FindField('KULLANILANKAPASITE');
  Result := FfKullanilanKapasite;
end;

function TTableUretimKaynakTakvim.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimKaynakTakvim.GetfTakvimYil: TField;
begin
  if FfTakvimYil = nil then
    FfTakvimYil := FindField('TAKVIMYIL');
  Result := FfTakvimYil;
end;

function TTableUretimKaynakTakvim.GetfTarih: TField;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih;
end;

function TTableUretimKaynakTakvim.GetfToplamKapasite: TField;
begin
  if FfToplamKapasite = nil then
    FfToplamKapasite := FindField('TOPLAMKAPASITE');
  Result := FfToplamKapasite;
end;

function TTableUretimKaynakTakvim.GetfVardiyaKod: TField;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod;
end;

function TTableUretimKaynakTakvim.GetfVerimlilik: TField;
begin
  if FfVerimlilik = nil then
    FfVerimlilik := FindField('VERIMLILIK');
  Result := FfVerimlilik;
end;

procedure TTableUretimKaynakTakvim.SetKullanilan(const Value: Double);
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('_KULLANILAN');
  FfKullanilan.AsFloat := Value;
end;

procedure TTableUretimKaynakTakvim.SetBasSaat(const Value: TDate);
begin
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  FfBasSaat.AsDateTime := Value;
end;

procedure TTableUretimKaynakTakvim.SetBasTarihSaat(const Value: TDate);
begin
  if FfBasTarihSaat = nil then
    FfBasTarihSaat := FindField('BASTARIHSAAT');
  FfBasTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimKaynakTakvim.SetBitSaat(const Value: TDate);
begin
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  FfBitSaat.AsDateTime := Value;
end;

procedure TTableUretimKaynakTakvim.SetBitTarihSaat(const Value: TDate);
begin
  if FfBitTarihSaat = nil then
    FfBitTarihSaat := FindField('BITTARIHSAAT');
  FfBitTarihSaat.AsDateTime := Value;
end;

procedure TTableUretimKaynakTakvim.SetEtkinKapasite(const Value: Double);
begin
  if FfEtkinKapasite = nil then
    FfEtkinKapasite := FindField('ETKINKAPASITE');
  FfEtkinKapasite.AsFloat := Value;
end;

procedure TTableUretimKaynakTakvim.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimKaynakTakvim.SetKapasite(const Value: Double);
begin
  if FfKapasite = nil then
    FfKapasite := FindField('KAPASITE');
  FfKapasite.AsFloat := Value;
end;

procedure TTableUretimKaynakTakvim.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableUretimKaynakTakvim.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimKaynakTakvim.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimKaynakTakvim.SetKullanilanKapasite(const Value: Double);
begin
  if FfKullanilanKapasite = nil then
    FfKullanilanKapasite := FindField('KULLANILANKAPASITE');
  FfKullanilanKapasite.AsFloat := Value;
end;

procedure TTableUretimKaynakTakvim.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimKaynakTakvim.SetTakvimYil(const Value: Integer);
begin
  if FfTakvimYil = nil then
    FfTakvimYil := FindField('TAKVIMYIL');
  FfTakvimYil.AsInteger := Value;
end;

procedure TTableUretimKaynakTakvim.SetTarih(const Value: TDate);
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  FfTarih.AsDateTime := Value;
end;

procedure TTableUretimKaynakTakvim.SetToplamKapasite(const Value: Double);
begin
  if FfToplamKapasite = nil then
    FfToplamKapasite := FindField('TOPLAMKAPASITE');
  FfToplamKapasite.AsFloat := Value;
end;

procedure TTableUretimKaynakTakvim.SetVardiyaKod(const Value: String);
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  FfVardiyaKod.AsString := Value;
end;

procedure TTableUretimKaynakTakvim.SetVerimlilik(const Value: Double);
begin
  if FfVerimlilik = nil then
    FfVerimlilik := FindField('VERIMLILIK');
  FfVerimlilik.AsFloat := Value;
end;

{ TTableUretimDurusKart }

constructor TTableUretimDurusKart.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTODK';
end;

procedure TTableUretimDurusKart.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfBirimSure = nil then
    FfBirimSure := FindField('BIRIMSURE');
  if FfDurusKod = nil then
    FfDurusKod := FindField('DURUSKOD');
  if FfDurusTip = nil then
    FfDurusTip := FindField('DURUSTIP');
  if FfGrupKod = nil then
    FfGrupKod := FindField('GRUPKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfOzelKod = nil then
    FfOzelKod := FindField('OZELKOD');
  if FfPlanTip = nil then
    FfPlanTip := FindField('PLANTIP');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  inherited;
end;

procedure TTableUretimDurusKart.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfBirimSure := nil;
    FfDurusKod := nil;
    FfDurusTip := nil;
    FfGrupKod := nil;
    FfID := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfOzelKod := nil;
    FfPlanTip := nil;
    FfRowGuid := nil;
    FfSirketNo := nil;
  end;
  inherited;
end;

function TTableUretimDurusKart.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableUretimDurusKart.GetBirimSure: Double;
begin
  if FfBirimSure = nil then
    FfBirimSure := FindField('BIRIMSURE');
  Result := FfBirimSure.AsFloat;
end;

function TTableUretimDurusKart.GetDurusKod: String;
begin
  if FfDurusKod = nil then
    FfDurusKod := FindField('DURUSKOD');
  Result := FfDurusKod.AsString;
end;

function TTableUretimDurusKart.GetDurusTip: Integer;
begin
  if FfDurusTip = nil then
    FfDurusTip := FindField('DURUSTIP');
  Result := FfDurusTip.AsInteger;
end;

function TTableUretimDurusKart.GetGrupKod: String;
begin
  if FfGrupKod = nil then
    FfGrupKod := FindField('GRUPKOD');
  Result := FfGrupKod.AsString;
end;

function TTableUretimDurusKart.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimDurusKart.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableUretimDurusKart.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimDurusKart.GetOzelKod: String;
begin
  if FfOzelKod = nil then
    FfOzelKod := FindField('OZELKOD');
  Result := FfOzelKod.AsString;
end;

function TTableUretimDurusKart.GetPlanTip: Integer;
begin
  if FfPlanTip = nil then
    FfPlanTip := FindField('PLANTIP');
  Result := FfPlanTip.AsInteger;
end;

function TTableUretimDurusKart.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimDurusKart.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimDurusKart.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableUretimDurusKart.GetfBirimSure: TField;
begin
  if FfBirimSure = nil then
    FfBirimSure := FindField('BIRIMSURE');
  Result := FfBirimSure;
end;

function TTableUretimDurusKart.GetfDurusKod: TField;
begin
  if FfDurusKod = nil then
    FfDurusKod := FindField('DURUSKOD');
  Result := FfDurusKod;
end;

function TTableUretimDurusKart.GetfDurusTip: TField;
begin
  if FfDurusTip = nil then
    FfDurusTip := FindField('DURUSTIP');
  Result := FfDurusTip;
end;

function TTableUretimDurusKart.GetfGrupKod: TField;
begin
  if FfGrupKod = nil then
    FfGrupKod := FindField('GRUPKOD');
  Result := FfGrupKod;
end;

function TTableUretimDurusKart.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimDurusKart.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableUretimDurusKart.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimDurusKart.GetfOzelKod: TField;
begin
  if FfOzelKod = nil then
    FfOzelKod := FindField('OZELKOD');
  Result := FfOzelKod;
end;

function TTableUretimDurusKart.GetfPlanTip: TField;
begin
  if FfPlanTip = nil then
    FfPlanTip := FindField('PLANTIP');
  Result := FfPlanTip;
end;

function TTableUretimDurusKart.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimDurusKart.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

procedure TTableUretimDurusKart.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableUretimDurusKart.SetBirimSure(const Value: Double);
begin
  if FfBirimSure = nil then
    FfBirimSure := FindField('BIRIMSURE');
  FfBirimSure.AsFloat := Value;
end;

procedure TTableUretimDurusKart.SetDurusKod(const Value: String);
begin
  if FfDurusKod = nil then
    FfDurusKod := FindField('DURUSKOD');
  FfDurusKod.AsString := Value;
end;

procedure TTableUretimDurusKart.SetDurusTip(const Value: Integer);
begin
  if FfDurusTip = nil then
    FfDurusTip := FindField('DURUSTIP');
  FfDurusTip.AsInteger := Value;
end;

procedure TTableUretimDurusKart.SetGrupKod(const Value: String);
begin
  if FfGrupKod = nil then
    FfGrupKod := FindField('GRUPKOD');
  FfGrupKod.AsString := Value;
end;

procedure TTableUretimDurusKart.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimDurusKart.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableUretimDurusKart.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimDurusKart.SetOzelKod(const Value: String);
begin
  if FfOzelKod = nil then
    FfOzelKod := FindField('OZELKOD');
  FfOzelKod.AsString := Value;
end;

procedure TTableUretimDurusKart.SetPlanTip(const Value: Integer);
begin
  if FfPlanTip = nil then
    FfPlanTip := FindField('PLANTIP');
  FfPlanTip.AsInteger := Value;
end;

procedure TTableUretimDurusKart.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimDurusKart.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

{ TTableUretimHataKart }

constructor TTableUretimHataKart.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTOHK';
end;

procedure TTableUretimHataKart.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfGrupKod = nil then
    FfGrupKod := FindField('GRUPKOD');
  if FfHataKod = nil then
    FfHataKod := FindField('HATAKOD');
  if FfHataTip = nil then
    FfHataTip := FindField('HATATIP');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfOzelKod = nil then
    FfOzelKod := FindField('OZELKOD');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  inherited;
end;

procedure TTableUretimHataKart.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfGrupKod := nil;
    FfHataKod := nil;
    FfHataTip := nil;
    FfID := nil;
    FfKayitDurum := nil;
    FfKayitTur := nil;
    FfOzelKod := nil;
    FfRowGuid := nil;
    FfSirketNo := nil;
  end;
  inherited;
end;

function TTableUretimHataKart.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableUretimHataKart.GetGrupKod: String;
begin
  if FfGrupKod = nil then
    FfGrupKod := FindField('GRUPKOD');
  Result := FfGrupKod.AsString;
end;

function TTableUretimHataKart.GetHataKod: String;
begin
  if FfHataKod = nil then
    FfHataKod := FindField('HATAKOD');
  Result := FfHataKod.AsString;
end;

function TTableUretimHataKart.GetHataTip: Integer;
begin
  if FfHataTip = nil then
    FfHataTip := FindField('HATATIP');
  Result := FfHataTip.AsInteger;
end;

function TTableUretimHataKart.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimHataKart.GetKayitDurum: Integer;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum.AsInteger;
end;

function TTableUretimHataKart.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimHataKart.GetOzelKod: String;
begin
  if FfOzelKod = nil then
    FfOzelKod := FindField('OZELKOD');
  Result := FfOzelKod.AsString;
end;

function TTableUretimHataKart.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimHataKart.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimHataKart.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableUretimHataKart.GetfGrupKod: TField;
begin
  if FfGrupKod = nil then
    FfGrupKod := FindField('GRUPKOD');
  Result := FfGrupKod;
end;

function TTableUretimHataKart.GetfHataKod: TField;
begin
  if FfHataKod = nil then
    FfHataKod := FindField('HATAKOD');
  Result := FfHataKod;
end;

function TTableUretimHataKart.GetfHataTip: TField;
begin
  if FfHataTip = nil then
    FfHataTip := FindField('HATATIP');
  Result := FfHataTip;
end;

function TTableUretimHataKart.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimHataKart.GetfKayitDurum: TField;
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  Result := FfKayitDurum;
end;

function TTableUretimHataKart.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimHataKart.GetfOzelKod: TField;
begin
  if FfOzelKod = nil then
    FfOzelKod := FindField('OZELKOD');
  Result := FfOzelKod;
end;

function TTableUretimHataKart.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimHataKart.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

procedure TTableUretimHataKart.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableUretimHataKart.SetGrupKod(const Value: String);
begin
  if FfGrupKod = nil then
    FfGrupKod := FindField('GRUPKOD');
  FfGrupKod.AsString := Value;
end;

procedure TTableUretimHataKart.SetHataKod(const Value: String);
begin
  if FfHataKod = nil then
    FfHataKod := FindField('HATAKOD');
  FfHataKod.AsString := Value;
end;

procedure TTableUretimHataKart.SetHataTip(const Value: Integer);
begin
  if FfHataTip = nil then
    FfHataTip := FindField('HATATIP');
  FfHataTip.AsInteger := Value;
end;

procedure TTableUretimHataKart.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimHataKart.SetKayitDurum(const Value: Integer);
begin
  if FfKayitDurum = nil then
    FfKayitDurum := FindField('KAYITDURUM');
  FfKayitDurum.AsInteger := Value;
end;

procedure TTableUretimHataKart.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimHataKart.SetOzelKod(const Value: String);
begin
  if FfOzelKod = nil then
    FfOzelKod := FindField('OZELKOD');
  FfOzelKod.AsString := Value;
end;

procedure TTableUretimHataKart.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimHataKart.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

{ TTableUretimParametre }

constructor TTableUretimParametre.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTPRM';
end;

procedure TTableUretimParametre.DoAfterOpen;
begin
  if FfFireHesapla = nil then
    FfFireHesapla := FindField('FIREHESAPLA');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKullanimGrupNo = nil then
    FfKullanimGrupNo := FindField('KULLANIMGRUPNO');
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  if FfSiparisSeriNoKapat = nil then
    FfSiparisSeriNoKapat := FindField('SIPARISSERINOKAPAT');
  if FfSiparisTip = nil then
    FfSiparisTip := FindField('SIPARISTIP');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfUretimSeriNoKapat = nil then
    FfUretimSeriNoKapat := FindField('URETIMSERINOKAPAT');
  if FfUretimTip = nil then
    FfUretimTip := FindField('URETIMTIP');
  if FfYuvarla = nil then
    FfYuvarla := FindField('YUVARLA');
  inherited;
end;

procedure TTableUretimParametre.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfFireHesapla := nil;
    FfID := nil;
    FfKullanimGrupNo := nil;
    FfRowGuid := nil;
    FfSiparisSeriNoKapat := nil;
    FfSiparisTip := nil;
    FfSirketNo := nil;
    FfUretimSeriNoKapat := nil;
    FfUretimTip := nil;
    FfYuvarla := nil;
  end;
  inherited;
end;

function TTableUretimParametre.GetFireHesapla: Integer;
begin
  if FfFireHesapla = nil then
    FfFireHesapla := FindField('FIREHESAPLA');
  Result := FfFireHesapla.AsInteger;
end;

function TTableUretimParametre.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimParametre.GetKullanimGrupNo: Integer;
begin
  if FfKullanimGrupNo = nil then
    FfKullanimGrupNo := FindField('KULLANIMGRUPNO');
  Result := FfKullanimGrupNo.AsInteger;
end;

function TTableUretimParametre.GetRowGuid: String;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid.AsString;
end;

function TTableUretimParametre.GetSiparisSeriNoKapat: Integer;
begin
  if FfSiparisSeriNoKapat = nil then
    FfSiparisSeriNoKapat := FindField('SIPARISSERINOKAPAT');
  Result := FfSiparisSeriNoKapat.AsInteger;
end;

function TTableUretimParametre.GetSiparisTip: Integer;
begin
  if FfSiparisTip = nil then
    FfSiparisTip := FindField('SIPARISTIP');
  Result := FfSiparisTip.AsInteger;
end;

function TTableUretimParametre.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimParametre.GetUretimSeriNoKapat: Integer;
begin
  if FfUretimSeriNoKapat = nil then
    FfUretimSeriNoKapat := FindField('URETIMSERINOKAPAT');
  Result := FfUretimSeriNoKapat.AsInteger;
end;

function TTableUretimParametre.GetUretimTip: Integer;
begin
  if FfUretimTip = nil then
    FfUretimTip := FindField('URETIMTIP');
  Result := FfUretimTip.AsInteger;
end;

function TTableUretimParametre.GetYuvarla: Integer;
begin
  if FfYuvarla = nil then
    FfYuvarla := FindField('YUVARLA');
  Result := FfYuvarla.AsInteger;
end;

function TTableUretimParametre.GetfFireHesapla: TField;
begin
  if FfFireHesapla = nil then
    FfFireHesapla := FindField('FIREHESAPLA');
  Result := FfFireHesapla;
end;

function TTableUretimParametre.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimParametre.GetfKullanimGrupNo: TField;
begin
  if FfKullanimGrupNo = nil then
    FfKullanimGrupNo := FindField('KULLANIMGRUPNO');
  Result := FfKullanimGrupNo;
end;

function TTableUretimParametre.GetfRowGuid: TField;
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  Result := FfRowGuid;
end;

function TTableUretimParametre.GetfSiparisSeriNoKapat: TField;
begin
  if FfSiparisSeriNoKapat = nil then
    FfSiparisSeriNoKapat := FindField('SIPARISSERINOKAPAT');
  Result := FfSiparisSeriNoKapat;
end;

function TTableUretimParametre.GetfSiparisTip: TField;
begin
  if FfSiparisTip = nil then
    FfSiparisTip := FindField('SIPARISTIP');
  Result := FfSiparisTip;
end;

function TTableUretimParametre.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimParametre.GetfUretimSeriNoKapat: TField;
begin
  if FfUretimSeriNoKapat = nil then
    FfUretimSeriNoKapat := FindField('URETIMSERINOKAPAT');
  Result := FfUretimSeriNoKapat;
end;

function TTableUretimParametre.GetfUretimTip: TField;
begin
  if FfUretimTip = nil then
    FfUretimTip := FindField('URETIMTIP');
  Result := FfUretimTip;
end;

function TTableUretimParametre.GetfYuvarla: TField;
begin
  if FfYuvarla = nil then
    FfYuvarla := FindField('YUVARLA');
  Result := FfYuvarla;
end;

procedure TTableUretimParametre.SetFireHesapla(const Value: Integer);
begin
  if FfFireHesapla = nil then
    FfFireHesapla := FindField('FIREHESAPLA');
  FfFireHesapla.AsInteger := Value;
end;

procedure TTableUretimParametre.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimParametre.SetKullanimGrupNo(const Value: Integer);
begin
  if FfKullanimGrupNo = nil then
    FfKullanimGrupNo := FindField('KULLANIMGRUPNO');
  FfKullanimGrupNo.AsInteger := Value;
end;

procedure TTableUretimParametre.SetRowGuid(const Value: String);
begin
  if FfRowGuid = nil then
    FfRowGuid := FindField('ROWGUID');
  FfRowGuid.AsString := Value;
end;

procedure TTableUretimParametre.SetSiparisSeriNoKapat(const Value: Integer);
begin
  if FfSiparisSeriNoKapat = nil then
    FfSiparisSeriNoKapat := FindField('SIPARISSERINOKAPAT');
  FfSiparisSeriNoKapat.AsInteger := Value;
end;

procedure TTableUretimParametre.SetSiparisTip(const Value: Integer);
begin
  if FfSiparisTip = nil then
    FfSiparisTip := FindField('SIPARISTIP');
  FfSiparisTip.AsInteger := Value;
end;

procedure TTableUretimParametre.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimParametre.SetUretimSeriNoKapat(const Value: Integer);
begin
  if FfUretimSeriNoKapat = nil then
    FfUretimSeriNoKapat := FindField('URETIMSERINOKAPAT');
  FfUretimSeriNoKapat.AsInteger := Value;
end;

procedure TTableUretimParametre.SetUretimTip(const Value: Integer);
begin
  if FfUretimTip = nil then
    FfUretimTip := FindField('URETIMTIP');
  FfUretimTip.AsInteger := Value;
end;

procedure TTableUretimParametre.SetYuvarla(const Value: Integer);
begin
  if FfYuvarla = nil then
    FfYuvarla := FindField('YUVARLA');
  FfYuvarla.AsInteger := Value;
end;

{ TTableUretimTakvimKart }

constructor TTableUretimTakvimKart.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTTKB';
end;

procedure TTableUretimTakvimKart.DoAfterOpen;
begin
  if FfID = nil then
    FfID := FindField('ID');
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  inherited;
end;

procedure TTableUretimTakvimKart.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfID := nil;
    FfTakvimKod := nil;
  end;
  inherited;
end;

function TTableUretimTakvimKart.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimTakvimKart.GetTakvimKod: String;
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  Result := FfTakvimKod.AsString;
end;

function TTableUretimTakvimKart.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimTakvimKart.GetfTakvimKod: TField;
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  Result := FfTakvimKod;
end;

procedure TTableUretimTakvimKart.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimTakvimKart.SetTakvimKod(const Value: String);
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  FfTakvimKod.AsString := Value;
end;

{ TTableUretimTakvimVardiya }

constructor TTableUretimTakvimVardiya.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTTKV';
end;

procedure TTableUretimTakvimVardiya.DoAfterOpen;
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
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  inherited;
end;

procedure TTableUretimTakvimVardiya.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfDegistirenKaynak := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfID := nil;
    FfTakvimKod := nil;
    FfVardiyaKod := nil;
  end;
  inherited;
end;

function TTableUretimTakvimVardiya.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableUretimTakvimVardiya.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimTakvimVardiya.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimTakvimVardiya.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableUretimTakvimVardiya.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableUretimTakvimVardiya.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableUretimTakvimVardiya.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableUretimTakvimVardiya.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimTakvimVardiya.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableUretimTakvimVardiya.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableUretimTakvimVardiya.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimTakvimVardiya.GetTakvimKod: String;
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  Result := FfTakvimKod.AsString;
end;

function TTableUretimTakvimVardiya.GetVardiyaKod: String;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod.AsString;
end;

function TTableUretimTakvimVardiya.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableUretimTakvimVardiya.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimTakvimVardiya.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimTakvimVardiya.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableUretimTakvimVardiya.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableUretimTakvimVardiya.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableUretimTakvimVardiya.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableUretimTakvimVardiya.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimTakvimVardiya.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableUretimTakvimVardiya.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableUretimTakvimVardiya.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimTakvimVardiya.GetfTakvimKod: TField;
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  Result := FfTakvimKod;
end;

function TTableUretimTakvimVardiya.GetfVardiyaKod: TField;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod;
end;

procedure TTableUretimTakvimVardiya.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableUretimTakvimVardiya.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimTakvimVardiya.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimTakvimVardiya.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableUretimTakvimVardiya.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableUretimTakvimVardiya.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableUretimTakvimVardiya.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableUretimTakvimVardiya.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimTakvimVardiya.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableUretimTakvimVardiya.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableUretimTakvimVardiya.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimTakvimVardiya.SetTakvimKod(const Value: String);
begin
  if FfTakvimKod = nil then
    FfTakvimKod := FindField('TAKVIMKOD');
  FfTakvimKod.AsString := Value;
end;

procedure TTableUretimTakvimVardiya.SetVardiyaKod(const Value: String);
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  FfVardiyaKod.AsString := Value;
end;

{ TTableUretimVardiyaKart }

constructor TTableUretimVardiyaKart.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTVRB';
end;

procedure TTableUretimVardiyaKart.DoAfterOpen;
begin
  if FfID = nil then
    FfID := FindField('ID');
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  inherited;
end;

procedure TTableUretimVardiyaKart.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfID := nil;
    FfVardiyaKod := nil;
  end;
  inherited;
end;

function TTableUretimVardiyaKart.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimVardiyaKart.GetVardiyaKod: String;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod.AsString;
end;

function TTableUretimVardiyaKart.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimVardiyaKart.GetfVardiyaKod: TField;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod;
end;

procedure TTableUretimVardiyaKart.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimVardiyaKart.SetVardiyaKod(const Value: String);
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  FfVardiyaKod.AsString := Value;
end;

{ TTableUretimVardiyaKaynak }

constructor TTableUretimVardiyaKaynak.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTVRK';
end;

procedure TTableUretimVardiyaKaynak.DoAfterOpen;
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
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfKapasite = nil then
    FfKapasite := FindField('URTKYN_KAPASITE');
  if FfVardiyaAd = nil then
    FfVardiyaAd := FindField('URTKYN_VARDIYAAD');
  if FfVerimlilik = nil then
    FfVerimlilik := FindField('URTKYN_VERIMLILIK');
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  inherited;
end;

procedure TTableUretimVardiyaKaynak.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfDegistirenKaynak := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfID := nil;
    FfKaynakKod := nil;
    FfKapasite := nil;
    FfVardiyaAd := nil;
    FfVerimlilik := nil;
    FfVardiyaKod := nil;
  end;
  inherited;
end;

function TTableUretimVardiyaKaynak.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableUretimVardiyaKaynak.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimVardiyaKaynak.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimVardiyaKaynak.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableUretimVardiyaKaynak.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableUretimVardiyaKaynak.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableUretimVardiyaKaynak.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableUretimVardiyaKaynak.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimVardiyaKaynak.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableUretimVardiyaKaynak.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableUretimVardiyaKaynak.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimVardiyaKaynak.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimVardiyaKaynak.GetKapasite: Double;
begin
  if FfKapasite = nil then
    FfKapasite := FindField('URTKYN_KAPASITE');
  Result := FfKapasite.AsFloat;
end;

function TTableUretimVardiyaKaynak.GetVardiyaAd: String;
begin
  if FfVardiyaAd = nil then
    FfVardiyaAd := FindField('URTKYN_VARDIYAAD');
  Result := FfVardiyaAd.AsString;
end;

function TTableUretimVardiyaKaynak.GetVerimlilik: Double;
begin
  if FfVerimlilik = nil then
    FfVerimlilik := FindField('URTKYN_VERIMLILIK');
  Result := FfVerimlilik.AsFloat;
end;

function TTableUretimVardiyaKaynak.GetVardiyaKod: String;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod.AsString;
end;

function TTableUretimVardiyaKaynak.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableUretimVardiyaKaynak.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimVardiyaKaynak.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimVardiyaKaynak.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableUretimVardiyaKaynak.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableUretimVardiyaKaynak.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableUretimVardiyaKaynak.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableUretimVardiyaKaynak.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimVardiyaKaynak.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableUretimVardiyaKaynak.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableUretimVardiyaKaynak.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimVardiyaKaynak.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimVardiyaKaynak.GetfKapasite: TField;
begin
  if FfKapasite = nil then
    FfKapasite := FindField('URTKYN_KAPASITE');
  Result := FfKapasite;
end;

function TTableUretimVardiyaKaynak.GetfVardiyaAd: TField;
begin
  if FfVardiyaAd = nil then
    FfVardiyaAd := FindField('URTKYN_VARDIYAAD');
  Result := FfVardiyaAd;
end;

function TTableUretimVardiyaKaynak.GetfVerimlilik: TField;
begin
  if FfVerimlilik = nil then
    FfVerimlilik := FindField('URTKYN_VERIMLILIK');
  Result := FfVerimlilik;
end;

function TTableUretimVardiyaKaynak.GetfVardiyaKod: TField;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod;
end;

procedure TTableUretimVardiyaKaynak.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableUretimVardiyaKaynak.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimVardiyaKaynak.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimVardiyaKaynak.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableUretimVardiyaKaynak.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableUretimVardiyaKaynak.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableUretimVardiyaKaynak.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableUretimVardiyaKaynak.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimVardiyaKaynak.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableUretimVardiyaKaynak.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableUretimVardiyaKaynak.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimVardiyaKaynak.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimVardiyaKaynak.SetKapasite(const Value: Double);
begin
  if FfKapasite = nil then
    FfKapasite := FindField('URTKYN_KAPASITE');
  FfKapasite.AsFloat := Value;
end;

procedure TTableUretimVardiyaKaynak.SetVardiyaAd(const Value: String);
begin
  if FfVardiyaAd = nil then
    FfVardiyaAd := FindField('URTKYN_VARDIYAAD');
  FfVardiyaAd.AsString := Value;
end;

procedure TTableUretimVardiyaKaynak.SetVerimlilik(const Value: Double);
begin
  if FfVerimlilik = nil then
    FfVerimlilik := FindField('URTKYN_VERIMLILIK');
  FfVerimlilik.AsFloat := Value;
end;

procedure TTableUretimVardiyaKaynak.SetVardiyaKod(const Value: String);
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  FfVardiyaKod.AsString := Value;
end;

{ TTableUretimVardiyaSaat }

constructor TTableUretimVardiyaSaat.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTVRS';
end;

procedure TTableUretimVardiyaSaat.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
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
  if FfGun = nil then
    FfGun := FindField('GUN');
  if FfID = nil then
    FfID := FindField('ID');
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  inherited;
end;

procedure TTableUretimVardiyaSaat.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfBasSaat := nil;
    FfBitSaat := nil;
    FfDegistirenKaynak := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfGun := nil;
    FfID := nil;
    FfVardiyaKod := nil;
  end;
  inherited;
end;

function TTableUretimVardiyaSaat.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableUretimVardiyaSaat.GetBasSaat: TDate;
begin
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  Result := FfBasSaat.AsDateTime;
end;

function TTableUretimVardiyaSaat.GetBitSaat: TDate;
begin
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  Result := FfBitSaat.AsDateTime;
end;

function TTableUretimVardiyaSaat.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableUretimVardiyaSaat.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimVardiyaSaat.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimVardiyaSaat.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableUretimVardiyaSaat.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableUretimVardiyaSaat.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableUretimVardiyaSaat.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableUretimVardiyaSaat.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimVardiyaSaat.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableUretimVardiyaSaat.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableUretimVardiyaSaat.GetGun: Integer;
begin
  if FfGun = nil then
    FfGun := FindField('GUN');
  Result := FfGun.AsInteger;
end;

function TTableUretimVardiyaSaat.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimVardiyaSaat.GetVardiyaKod: String;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod.AsString;
end;

function TTableUretimVardiyaSaat.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableUretimVardiyaSaat.GetfBasSaat: TField;
begin
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  Result := FfBasSaat;
end;

function TTableUretimVardiyaSaat.GetfBitSaat: TField;
begin
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  Result := FfBitSaat;
end;

function TTableUretimVardiyaSaat.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableUretimVardiyaSaat.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimVardiyaSaat.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimVardiyaSaat.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableUretimVardiyaSaat.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableUretimVardiyaSaat.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableUretimVardiyaSaat.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableUretimVardiyaSaat.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimVardiyaSaat.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableUretimVardiyaSaat.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableUretimVardiyaSaat.GetfGun: TField;
begin
  if FfGun = nil then
    FfGun := FindField('GUN');
  Result := FfGun;
end;

function TTableUretimVardiyaSaat.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimVardiyaSaat.GetfVardiyaKod: TField;
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  Result := FfVardiyaKod;
end;

procedure TTableUretimVardiyaSaat.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableUretimVardiyaSaat.SetBasSaat(const Value: TDate);
begin
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  FfBasSaat.AsDateTime := Value;
end;

procedure TTableUretimVardiyaSaat.SetBitSaat(const Value: TDate);
begin
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  FfBitSaat.AsDateTime := Value;
end;

procedure TTableUretimVardiyaSaat.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableUretimVardiyaSaat.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimVardiyaSaat.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimVardiyaSaat.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableUretimVardiyaSaat.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableUretimVardiyaSaat.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableUretimVardiyaSaat.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableUretimVardiyaSaat.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimVardiyaSaat.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableUretimVardiyaSaat.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableUretimVardiyaSaat.SetGun(const Value: Integer);
begin
  if FfGun = nil then
    FfGun := FindField('GUN');
  FfGun.AsInteger := Value;
end;

procedure TTableUretimVardiyaSaat.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimVardiyaSaat.SetVardiyaKod(const Value: String);
begin
  if FfVardiyaKod = nil then
    FfVardiyaKod := FindField('VARDIYAKOD');
  FfVardiyaKod.AsString := Value;
end;

{ TTableUretimYilKart }

constructor TTableUretimYilKart.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTYIL';
end;

procedure TTableUretimYilKart.DoAfterOpen;
begin
  if FfID = nil then
    FfID := FindField('ID');
  if FfTakvimYil = nil then
    FfTakvimYil := FindField('TAKVIMYIL');
  inherited;
end;

procedure TTableUretimYilKart.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfID := nil;
    FfTakvimYil := nil;
  end;
  inherited;
end;

function TTableUretimYilKart.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimYilKart.GetTakvimYil: Integer;
begin
  if FfTakvimYil = nil then
    FfTakvimYil := FindField('TAKVIMYIL');
  Result := FfTakvimYil.AsInteger;
end;

function TTableUretimYilKart.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimYilKart.GetfTakvimYil: TField;
begin
  if FfTakvimYil = nil then
    FfTakvimYil := FindField('TAKVIMYIL');
  Result := FfTakvimYil;
end;

procedure TTableUretimYilKart.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimYilKart.SetTakvimYil(const Value: Integer);
begin
  if FfTakvimYil = nil then
    FfTakvimYil := FindField('TAKVIMYIL');
  FfTakvimYil.AsInteger := Value;
end;

{ TTableUretimYilTatil }

constructor TTableUretimYilTatil.Create(AOwner: TComponent);
begin
  inherited;
  TableItems.TableNames := 'URTYRT';
end;

procedure TTableUretimYilTatil.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
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
  if FfGirenkaynak = nil then
    FfGirenkaynak := FindField('GIRENKAYNAK');
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
  if FfTakvimYil = nil then
    FfTakvimYil := FindField('TAKVIMYIL');
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  inherited;
end;

procedure TTableUretimYilTatil.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfBasSaat := nil;
    FfBitSaat := nil;
    FfDegistirenKaynak := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
    FfGirenkaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfID := nil;
    FfTakvimYil := nil;
    FfTarih := nil;
  end;
  inherited;
end;

function TTableUretimYilTatil.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableUretimYilTatil.GetBasSaat: TDate;
begin
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  Result := FfBasSaat.AsDateTime;
end;

function TTableUretimYilTatil.GetBitSaat: TDate;
begin
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  Result := FfBitSaat.AsDateTime;
end;

function TTableUretimYilTatil.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableUretimYilTatil.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimYilTatil.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimYilTatil.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableUretimYilTatil.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableUretimYilTatil.GetGirenkaynak: String;
begin
  if FfGirenkaynak = nil then
    FfGirenkaynak := FindField('GIRENKAYNAK');
  Result := FfGirenkaynak.AsString;
end;

function TTableUretimYilTatil.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableUretimYilTatil.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimYilTatil.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableUretimYilTatil.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableUretimYilTatil.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimYilTatil.GetTakvimYil: Integer;
begin
  if FfTakvimYil = nil then
    FfTakvimYil := FindField('TAKVIMYIL');
  Result := FfTakvimYil.AsInteger;
end;

function TTableUretimYilTatil.GetTarih: TDate;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih.AsDateTime;
end;

function TTableUretimYilTatil.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableUretimYilTatil.GetfBasSaat: TField;
begin
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  Result := FfBasSaat;
end;

function TTableUretimYilTatil.GetfBitSaat: TField;
begin
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  Result := FfBitSaat;
end;

function TTableUretimYilTatil.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableUretimYilTatil.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimYilTatil.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimYilTatil.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableUretimYilTatil.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableUretimYilTatil.GetfGirenkaynak: TField;
begin
  if FfGirenkaynak = nil then
    FfGirenkaynak := FindField('GIRENKAYNAK');
  Result := FfGirenkaynak;
end;

function TTableUretimYilTatil.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableUretimYilTatil.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimYilTatil.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableUretimYilTatil.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableUretimYilTatil.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimYilTatil.GetfTakvimYil: TField;
begin
  if FfTakvimYil = nil then
    FfTakvimYil := FindField('TAKVIMYIL');
  Result := FfTakvimYil;
end;

function TTableUretimYilTatil.GetfTarih: TField;
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  Result := FfTarih;
end;

procedure TTableUretimYilTatil.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableUretimYilTatil.SetBasSaat(const Value: TDate);
begin
  if FfBasSaat = nil then
    FfBasSaat := FindField('BASSAAT');
  FfBasSaat.AsDateTime := Value;
end;

procedure TTableUretimYilTatil.SetBitSaat(const Value: TDate);
begin
  if FfBitSaat = nil then
    FfBitSaat := FindField('BITSAAT');
  FfBitSaat.AsDateTime := Value;
end;

procedure TTableUretimYilTatil.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableUretimYilTatil.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimYilTatil.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimYilTatil.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableUretimYilTatil.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableUretimYilTatil.SetGirenkaynak(const Value: String);
begin
  if FfGirenkaynak = nil then
    FfGirenkaynak := FindField('GIRENKAYNAK');
  FfGirenkaynak.AsString := Value;
end;

procedure TTableUretimYilTatil.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableUretimYilTatil.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimYilTatil.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableUretimYilTatil.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableUretimYilTatil.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimYilTatil.SetTakvimYil(const Value: Integer);
begin
  if FfTakvimYil = nil then
    FfTakvimYil := FindField('TAKVIMYIL');
  FfTakvimYil.AsInteger := Value;
end;

procedure TTableUretimYilTatil.SetTarih(const Value: TDate);
begin
  if FfTarih = nil then
    FfTarih := FindField('TARIH');
  FfTarih.AsDateTime := Value;
end;

end.

