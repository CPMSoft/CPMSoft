unit CPMApp_TableUretimTempSystem;

interface

uses Windows, Classes, SysUtils, Controls,
    DB, CPMApp_DataObject, CPMApp_DataObjectModel;

type
  TTableUretimTerminalMalzemeTuketimBilgileri = class;    // STHURD
  TTableSiparisHareketUretim = class;    // STHURT
  TTableUretimTerminalBaslik = class;    // URTTEB
  TTableUretimTerminalKaynak = class;    // URTTEK
  TTableUretimTerminalPersonel = class;    // URTTEP
  TTableUretimTerminalKaynakIslemTanim = class;    // URTTIT
  TTableUretimTerminalMessage = class;    // URTTMS
  TTableUretimRotaKaynakNot = class;    // URTRKN

  TTableUretimTerminalMalzemeTuketimBilgileri = class(TAppTable)
  Private
    FfAciklama1: TField;
    FfAciklama10: TField;
    FfAciklama2: TField;
    FfAciklama3: TField;
    FfAciklama4: TField;
    FfAciklama5: TField;
    FfAciklama6: TField;
    FfAciklama7: TField;
    FfAciklama8: TField;
    FfAciklama9: TField;
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
    FfEvrakNo: TField;
    FfEvrakTip: TField;
    FfGirenKaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfHesapKod: TField;
    FfID: TField;
    FfLKod1: TField;
    FfLKod2: TField;
    FfLKod3: TField;
    FfLKod4: TField;
    FfLKod5: TField;
    FfMalKod: TField;
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
    FfSeriNo: TField;
    FfSiraNo: TField;
    FfSiraNo2: TField;
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
    FfUretimNo: TField;
    FfVersiyonNo: TField;
    function GetAciklama1: String;
    function GetAciklama10: String;
    function GetAciklama2: String;
    function GetAciklama3: String;
    function GetAciklama4: String;
    function GetAciklama5: String;
    function GetAciklama6: String;
    function GetAciklama7: String;
    function GetAciklama8: String;
    function GetAciklama9: String;
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
    function GetEvrakNo: String;
    function GetEvrakTip: Integer;
    function GetGirenKaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetHesapKod: String;
    function GetID: Integer;
    function GetLKod1: String;
    function GetLKod2: String;
    function GetLKod3: String;
    function GetLKod4: String;
    function GetLKod5: String;
    function GetMalKod: String;
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
    function GetSeriNo: String;
    function GetSiraNo: Integer;
    function GetSiraNo2: Integer;
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
    function GetUretimNo: String;
    function GetVersiyonNo: String;
    function GetfAciklama1: TField;
    function GetfAciklama10: TField;
    function GetfAciklama2: TField;
    function GetfAciklama3: TField;
    function GetfAciklama4: TField;
    function GetfAciklama5: TField;
    function GetfAciklama6: TField;
    function GetfAciklama7: TField;
    function GetfAciklama8: TField;
    function GetfAciklama9: TField;
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
    function GetfEvrakNo: TField;
    function GetfEvrakTip: TField;
    function GetfGirenKaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfHesapKod: TField;
    function GetfID: TField;
    function GetfLKod1: TField;
    function GetfLKod2: TField;
    function GetfLKod3: TField;
    function GetfLKod4: TField;
    function GetfLKod5: TField;
    function GetfMalKod: TField;
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
    function GetfSeriNo: TField;
    function GetfSiraNo: TField;
    function GetfSiraNo2: TField;
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
    function GetfUretimNo: TField;
    function GetfVersiyonNo: TField;
    procedure SetAciklama1(const Value: String);
    procedure SetAciklama10(const Value: String);
    procedure SetAciklama2(const Value: String);
    procedure SetAciklama3(const Value: String);
    procedure SetAciklama4(const Value: String);
    procedure SetAciklama5(const Value: String);
    procedure SetAciklama6(const Value: String);
    procedure SetAciklama7(const Value: String);
    procedure SetAciklama8(const Value: String);
    procedure SetAciklama9(const Value: String);
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
    procedure SetEvrakNo(const Value: String);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetGirenKaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetHesapKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetLKod1(const Value: String);
    procedure SetLKod2(const Value: String);
    procedure SetLKod3(const Value: String);
    procedure SetLKod4(const Value: String);
    procedure SetLKod5(const Value: String);
    procedure SetMalKod(const Value: String);
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
    procedure SetSeriNo(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSiraNo2(const Value: Integer);
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
    procedure SetUretimNo(const Value: String);
    procedure SetVersiyonNo(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Aciklama1: String read GetAciklama1 write SetAciklama1;
    property Aciklama10: String read GetAciklama10 write SetAciklama10;
    property Aciklama2: String read GetAciklama2 write SetAciklama2;
    property Aciklama3: String read GetAciklama3 write SetAciklama3;
    property Aciklama4: String read GetAciklama4 write SetAciklama4;
    property Aciklama5: String read GetAciklama5 write SetAciklama5;
    property Aciklama6: String read GetAciklama6 write SetAciklama6;
    property Aciklama7: String read GetAciklama7 write SetAciklama7;
    property Aciklama8: String read GetAciklama8 write SetAciklama8;
    property Aciklama9: String read GetAciklama9 write SetAciklama9;
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
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property GirenKaynak: String read GetGirenKaynak write SetGirenKaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property HesapKod: String read GetHesapKod write SetHesapKod;
    property ID: Integer read GetID write SetID;
    property LKod1: String read GetLKod1 write SetLKod1;
    property LKod2: String read GetLKod2 write SetLKod2;
    property LKod3: String read GetLKod3 write SetLKod3;
    property LKod4: String read GetLKod4 write SetLKod4;
    property LKod5: String read GetLKod5 write SetLKod5;
    property MalKod: String read GetMalKod write SetMalKod;
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
    property SeriNo: String read GetSeriNo write SetSeriNo;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SiraNo2: Integer read GetSiraNo2 write SetSiraNo2;
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
    property UretimNo: String read GetUretimNo write SetUretimNo;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fAciklama1:TField read GetfAciklama1;
    property fAciklama10:TField read GetfAciklama10;
    property fAciklama2:TField read GetfAciklama2;
    property fAciklama3:TField read GetfAciklama3;
    property fAciklama4:TField read GetfAciklama4;
    property fAciklama5:TField read GetfAciklama5;
    property fAciklama6:TField read GetfAciklama6;
    property fAciklama7:TField read GetfAciklama7;
    property fAciklama8:TField read GetfAciklama8;
    property fAciklama9:TField read GetfAciklama9;
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
    property fEvrakNo:TField read GetfEvrakNo;
    property fEvrakTip:TField read GetfEvrakTip;
    property fGirenKaynak:TField read GetfGirenKaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fHesapKod:TField read GetfHesapKod;
    property fID:TField read GetfID;
    property fLKod1:TField read GetfLKod1;
    property fLKod2:TField read GetfLKod2;
    property fLKod3:TField read GetfLKod3;
    property fLKod4:TField read GetfLKod4;
    property fLKod5:TField read GetfLKod5;
    property fMalKod:TField read GetfMalKod;
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
    property fSeriNo:TField read GetfSeriNo;
    property fSiraNo:TField read GetfSiraNo;
    property fSiraNo2:TField read GetfSiraNo2;
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
    property fUretimNo:TField read GetfUretimNo;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

  TTableSiparisHareketUretim = class(TAppTable)
  Private
    FfEvrakNo: TField;
    FfEvrakTip: TField;
    FfHesapKod: TField;
    FfID: TField;
    FfKaynakIslemNo: TField;
    FfKonsolideSirketNo: TField;
    FfMRPRenk: TField;
    FfOpbastarih: TField;
    FfOpBasTarihSaat: TField;
    FfOpBitTarih: TField;
    FfOpbittarihsaat: TField;
    FfOpDurum: TField;
    FfOperasyonNo: TField;
    FfOperasyonSiraNo: TField;
    FfOzelrecetetip: TField;
    FfPozno: TField;
    FfRecetekaynaktip: TField;
    FfReceteno: TField;
    FfRecetesirano: TField;
    FfRevizyonNo: TField;
    FfSiraNo: TField;
    FfSirketNo: TField;
    FfSonOpDurum: TField;
    FfYanurunmaliyetoran: TField;
    FfYanurunno: TField;
    function GetEvrakNo: String;
    function GetEvrakTip: Integer;
    function GetHesapKod: String;
    function GetID: Integer;
    function GetKaynakIslemNo: Integer;
    function GetKonsolideSirketNo: String;
    function GetMRPRenk: Integer;
    function GetOpbastarih: TDate;
    function GetOpBasTarihSaat: TDate;
    function GetOpBitTarih: TDate;
    function GetOpbittarihsaat: TDate;
    function GetOpDurum: Integer;
    function GetOperasyonNo: Integer;
    function GetOperasyonSiraNo: Integer;
    function GetOzelrecetetip: Integer;
    function GetPozno: String;
    function GetRecetekaynaktip: Integer;
    function GetReceteno: String;
    function GetRecetesirano: Integer;
    function GetRevizyonNo: String;
    function GetSiraNo: Integer;
    function GetSirketNo: String;
    function GetSonOpDurum: Integer;
    function GetYanurunmaliyetoran: Double;
    function GetYanurunno: Integer;
    function GetfEvrakNo: TField;
    function GetfEvrakTip: TField;
    function GetfHesapKod: TField;
    function GetfID: TField;
    function GetfKaynakIslemNo: TField;
    function GetfKonsolideSirketNo: TField;
    function GetfMRPRenk: TField;
    function GetfOpbastarih: TField;
    function GetfOpBasTarihSaat: TField;
    function GetfOpBitTarih: TField;
    function GetfOpbittarihsaat: TField;
    function GetfOpDurum: TField;
    function GetfOperasyonNo: TField;
    function GetfOperasyonSiraNo: TField;
    function GetfOzelrecetetip: TField;
    function GetfPozno: TField;
    function GetfRecetekaynaktip: TField;
    function GetfReceteno: TField;
    function GetfRecetesirano: TField;
    function GetfRevizyonNo: TField;
    function GetfSiraNo: TField;
    function GetfSirketNo: TField;
    function GetfSonOpDurum: TField;
    function GetfYanurunmaliyetoran: TField;
    function GetfYanurunno: TField;
    procedure SetEvrakNo(const Value: String);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetHesapKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetKaynakIslemNo(const Value: Integer);
    procedure SetKonsolideSirketNo(const Value: String);
    procedure SetMRPRenk(const Value: Integer);
    procedure SetOpbastarih(const Value: TDate);
    procedure SetOpBasTarihSaat(const Value: TDate);
    procedure SetOpBitTarih(const Value: TDate);
    procedure SetOpbittarihsaat(const Value: TDate);
    procedure SetOpDurum(const Value: Integer);
    procedure SetOperasyonNo(const Value: Integer);
    procedure SetOperasyonSiraNo(const Value: Integer);
    procedure SetOzelrecetetip(const Value: Integer);
    procedure SetPozno(const Value: String);
    procedure SetRecetekaynaktip(const Value: Integer);
    procedure SetReceteno(const Value: String);
    procedure SetRecetesirano(const Value: Integer);
    procedure SetRevizyonNo(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSirketNo(const Value: String);
    procedure SetSonOpDurum(const Value: Integer);
    procedure SetYanurunmaliyetoran(const Value: Double);
    procedure SetYanurunno(const Value: Integer);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property HesapKod: String read GetHesapKod write SetHesapKod;
    property ID: Integer read GetID write SetID;
    property KaynakIslemNo: Integer read GetKaynakIslemNo write SetKaynakIslemNo;
    property KonsolideSirketNo: String read GetKonsolideSirketNo write SetKonsolideSirketNo;
    property MRPRenk: Integer read GetMRPRenk write SetMRPRenk;
    property Opbastarih: TDate read GetOpbastarih write SetOpbastarih;
    property OpBasTarihSaat: TDate read GetOpBasTarihSaat write SetOpBasTarihSaat;
    property OpBitTarih: TDate read GetOpBitTarih write SetOpBitTarih;
    property Opbittarihsaat: TDate read GetOpbittarihsaat write SetOpbittarihsaat;
    property OpDurum: Integer read GetOpDurum write SetOpDurum;
    property OperasyonNo: Integer read GetOperasyonNo write SetOperasyonNo;
    property OperasyonSiraNo: Integer read GetOperasyonSiraNo write SetOperasyonSiraNo;
    property Ozelrecetetip: Integer read GetOzelrecetetip write SetOzelrecetetip;
    property Pozno: String read GetPozno write SetPozno;
    property Recetekaynaktip: Integer read GetRecetekaynaktip write SetRecetekaynaktip;
    property Receteno: String read GetReceteno write SetReceteno;
    property Recetesirano: Integer read GetRecetesirano write SetRecetesirano;
    property RevizyonNo: String read GetRevizyonNo write SetRevizyonNo;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property SonOpDurum: Integer read GetSonOpDurum write SetSonOpDurum;
    property Yanurunmaliyetoran: Double read GetYanurunmaliyetoran write SetYanurunmaliyetoran;
    property Yanurunno: Integer read GetYanurunno write SetYanurunno;
    property fEvrakNo:TField read GetfEvrakNo;
    property fEvrakTip:TField read GetfEvrakTip;
    property fHesapKod:TField read GetfHesapKod;
    property fID:TField read GetfID;
    property fKaynakIslemNo:TField read GetfKaynakIslemNo;
    property fKonsolideSirketNo:TField read GetfKonsolideSirketNo;
    property fMRPRenk:TField read GetfMRPRenk;
    property fOpbastarih:TField read GetfOpbastarih;
    property fOpBasTarihSaat:TField read GetfOpBasTarihSaat;
    property fOpBitTarih:TField read GetfOpBitTarih;
    property fOpbittarihsaat:TField read GetfOpbittarihsaat;
    property fOpDurum:TField read GetfOpDurum;
    property fOperasyonNo:TField read GetfOperasyonNo;
    property fOperasyonSiraNo:TField read GetfOperasyonSiraNo;
    property fOzelrecetetip:TField read GetfOzelrecetetip;
    property fPozno:TField read GetfPozno;
    property fRecetekaynaktip:TField read GetfRecetekaynaktip;
    property fReceteno:TField read GetfReceteno;
    property fRecetesirano:TField read GetfRecetesirano;
    property fRevizyonNo:TField read GetfRevizyonNo;
    property fSiraNo:TField read GetfSiraNo;
    property fSirketNo:TField read GetfSirketNo;
    property fSonOpDurum:TField read GetfSonOpDurum;
    property fYanurunmaliyetoran:TField read GetfYanurunmaliyetoran;
    property fYanurunno:TField read GetfYanurunno;
  end;

  TTableUretimTerminalBaslik = class(TAppTable)
  Private
    FfBarkodcalismaayar: TField;
    FfBarkodmalkodayar: TField;
    FfBarkodserinoayar: TField;
    FfCalismaAyar: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDurumGosterTip: TField;
    FfDuyuru: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfID: TField;
    FfKayitTur: TField;
    FfOpetorGosterTip: TField;
    FfOtomatiktuket: TField;
    FfSirketNo: TField;
    FfTerminalAd: TField;
    FfTerminalKod: TField;
    function GetBarkodcalismaayar: Integer;
    function GetBarkodmalkodayar: Integer;
    function GetBarkodserinoayar: Integer;
    function GetCalismaAyar: Integer;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDurumGosterTip: Integer;
    function GetDuyuru: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetID: Integer;
    function GetKayitTur: Integer;
    function GetOpetorGosterTip: Integer;
    function GetOtomatiktuket: Integer;
    function GetSirketNo: String;
    function GetTerminalAd: String;
    function GetTerminalKod: String;
    function GetfBarkodcalismaayar: TField;
    function GetfBarkodmalkodayar: TField;
    function GetfBarkodserinoayar: TField;
    function GetfCalismaAyar: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDurumGosterTip: TField;
    function GetfDuyuru: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfID: TField;
    function GetfKayitTur: TField;
    function GetfOpetorGosterTip: TField;
    function GetfOtomatiktuket: TField;
    function GetfSirketNo: TField;
    function GetfTerminalAd: TField;
    function GetfTerminalKod: TField;
    procedure SetBarkodcalismaayar(const Value: Integer);
    procedure SetBarkodmalkodayar(const Value: Integer);
    procedure SetBarkodserinoayar(const Value: Integer);
    procedure SetCalismaAyar(const Value: Integer);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDurumGosterTip(const Value: Integer);
    procedure SetDuyuru(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetOpetorGosterTip(const Value: Integer);
    procedure SetOtomatiktuket(const Value: Integer);
    procedure SetSirketNo(const Value: String);
    procedure SetTerminalAd(const Value: String);
    procedure SetTerminalKod(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Barkodcalismaayar: Integer read GetBarkodcalismaayar write SetBarkodcalismaayar;
    property Barkodmalkodayar: Integer read GetBarkodmalkodayar write SetBarkodmalkodayar;
    property Barkodserinoayar: Integer read GetBarkodserinoayar write SetBarkodserinoayar;
    property CalismaAyar: Integer read GetCalismaAyar write SetCalismaAyar;
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property DurumGosterTip: Integer read GetDurumGosterTip write SetDurumGosterTip;
    property Duyuru: String read GetDuyuru write SetDuyuru;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property ID: Integer read GetID write SetID;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property OpetorGosterTip: Integer read GetOpetorGosterTip write SetOpetorGosterTip;
    property Otomatiktuket: Integer read GetOtomatiktuket write SetOtomatiktuket;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property TerminalAd: String read GetTerminalAd write SetTerminalAd;
    property TerminalKod: String read GetTerminalKod write SetTerminalKod;
    property fBarkodcalismaayar:TField read GetfBarkodcalismaayar;
    property fBarkodmalkodayar:TField read GetfBarkodmalkodayar;
    property fBarkodserinoayar:TField read GetfBarkodserinoayar;
    property fCalismaAyar:TField read GetfCalismaAyar;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDurumGosterTip:TField read GetfDurumGosterTip;
    property fDuyuru:TField read GetfDuyuru;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fID:TField read GetfID;
    property fKayitTur:TField read GetfKayitTur;
    property fOpetorGosterTip:TField read GetfOpetorGosterTip;
    property fOtomatiktuket:TField read GetfOtomatiktuket;
    property fSirketNo:TField read GetfSirketNo;
    property fTerminalAd:TField read GetfTerminalAd;
    property fTerminalKod:TField read GetfTerminalKod;
  end;

  TTableUretimTerminalKaynak = class(TAppTable)
  Private
    FfBasTarih: TField;
    FfBitTarih: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfID: TField;
    FfIsEmriSecim: TField;
    FfKayitTur: TField;
    FfKaynakKod: TField;
    FfOpBasTuketimTip: TField;
    FfOpBitTuketimTip: TField;
    FfSicilKod: TField;
    FfSirketNo: TField;
    FfTerminalKod: TField;
    function GetBasTarih: TDate;
    function GetBitTarih: TDate;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetID: Integer;
    function GetIsEmriSecim: Integer;
    function GetKayitTur: Integer;
    function GetKaynakKod: String;
    function GetOpBasTuketimTip: Integer;
    function GetOpBitTuketimTip: Integer;
    function GetSicilKod: String;
    function GetSirketNo: String;
    function GetTerminalKod: String;
    function GetfBasTarih: TField;
    function GetfBitTarih: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfID: TField;
    function GetfIsEmriSecim: TField;
    function GetfKayitTur: TField;
    function GetfKaynakKod: TField;
    function GetfOpBasTuketimTip: TField;
    function GetfOpBitTuketimTip: TField;
    function GetfSicilKod: TField;
    function GetfSirketNo: TField;
    function GetfTerminalKod: TField;
    procedure SetBasTarih(const Value: TDate);
    procedure SetBitTarih(const Value: TDate);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetIsEmriSecim(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetOpBasTuketimTip(const Value: Integer);
    procedure SetOpBitTuketimTip(const Value: Integer);
    procedure SetSicilKod(const Value: String);
    procedure SetSirketNo(const Value: String);
    procedure SetTerminalKod(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property BasTarih: TDate read GetBasTarih write SetBasTarih;
    property BitTarih: TDate read GetBitTarih write SetBitTarih;
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property ID: Integer read GetID write SetID;
    property IsEmriSecim: Integer read GetIsEmriSecim write SetIsEmriSecim;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property OpBasTuketimTip: Integer read GetOpBasTuketimTip write SetOpBasTuketimTip;
    property OpBitTuketimTip: Integer read GetOpBitTuketimTip write SetOpBitTuketimTip;
    property SicilKod: String read GetSicilKod write SetSicilKod;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property TerminalKod: String read GetTerminalKod write SetTerminalKod;
    property fBasTarih:TField read GetfBasTarih;
    property fBitTarih:TField read GetfBitTarih;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fID:TField read GetfID;
    property fIsEmriSecim:TField read GetfIsEmriSecim;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakKod:TField read GetfKaynakKod;
    property fOpBasTuketimTip:TField read GetfOpBasTuketimTip;
    property fOpBitTuketimTip:TField read GetfOpBitTuketimTip;
    property fSicilKod:TField read GetfSicilKod;
    property fSirketNo:TField read GetfSirketNo;
    property fTerminalKod:TField read GetfTerminalKod;
  end;

  TTableUretimTerminalPersonel = class(TAppTable)
  Private
    FfBasTarih: TField;
    FfBitTarih: TField;
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
    FfKayitTur: TField;
    FfOperatorKod: TField;
    FfPlansizYukleme: TField;
    FfSicilKod: TField;
    FfSirketNo: TField;
    FfTerminalKod: TField;
    function GetBasTarih: TDate;
    function GetBitTarih: TDate;
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
    function GetKayitTur: Integer;
    function GetOperatorKod: String;
    function GetPlansizYukleme: Integer;
    function GetSicilKod: String;
    function GetSirketNo: String;
    function GetTerminalKod: String;
    function GetfBasTarih: TField;
    function GetfBitTarih: TField;
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
    function GetfKayitTur: TField;
    function GetfOperatorKod: TField;
    function GetfPlansizYukleme: TField;
    function GetfSicilKod: TField;
    function GetfSirketNo: TField;
    function GetfTerminalKod: TField;
    procedure SetBasTarih(const Value: TDate);
    procedure SetBitTarih(const Value: TDate);
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
    procedure SetKayitTur(const Value: Integer);
    procedure SetOperatorKod(const Value: String);
    procedure SetPlansizYukleme(const Value: Integer);
    procedure SetSicilKod(const Value: String);
    procedure SetSirketNo(const Value: String);
    procedure SetTerminalKod(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property BasTarih: TDate read GetBasTarih write SetBasTarih;
    property BitTarih: TDate read GetBitTarih write SetBitTarih;
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
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property OperatorKod: String read GetOperatorKod write SetOperatorKod;
    property PlansizYukleme: Integer read GetPlansizYukleme write SetPlansizYukleme;
    property SicilKod: String read GetSicilKod write SetSicilKod;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property TerminalKod: String read GetTerminalKod write SetTerminalKod;
    property fBasTarih:TField read GetfBasTarih;
    property fBitTarih:TField read GetfBitTarih;
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
    property fKayitTur:TField read GetfKayitTur;
    property fOperatorKod:TField read GetfOperatorKod;
    property fPlansizYukleme:TField read GetfPlansizYukleme;
    property fSicilKod:TField read GetfSicilKod;
    property fSirketNo:TField read GetfSirketNo;
    property fTerminalKod:TField read GetfTerminalKod;
  end;

  TTableUretimTerminalKaynakIslemTanim = class(TAppTable)
  Private
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfID: TField;
    FfIslemNo: TField;
    FfKayitTur: TField;
    FfKaynakKod: TField;
    FfKullanilan: TField;
    FfSicilKod: TField;
    FfSirketNo: TField;
    FfTerminalKod: TField;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetID: Integer;
    function GetIslemNo: Integer;
    function GetKayitTur: Integer;
    function GetKaynakKod: String;
    function GetKullanilan: Integer;
    function GetSicilKod: String;
    function GetSirketNo: String;
    function GetTerminalKod: String;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfID: TField;
    function GetfIslemNo: TField;
    function GetfKayitTur: TField;
    function GetfKaynakKod: TField;
    function GetfKullanilan: TField;
    function GetfSicilKod: TField;
    function GetfSirketNo: TField;
    function GetfTerminalKod: TField;
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetIslemNo(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetKullanilan(const Value: Integer);
    procedure SetSicilKod(const Value: String);
    procedure SetSirketNo(const Value: String);
    procedure SetTerminalKod(const Value: String);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property ID: Integer read GetID write SetID;
    property IslemNo: Integer read GetIslemNo write SetIslemNo;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property Kullanilan: Integer read GetKullanilan write SetKullanilan;
    property SicilKod: String read GetSicilKod write SetSicilKod;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property TerminalKod: String read GetTerminalKod write SetTerminalKod;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fID:TField read GetfID;
    property fIslemNo:TField read GetfIslemNo;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakKod:TField read GetfKaynakKod;
    property fKullanilan:TField read GetfKullanilan;
    property fSicilKod:TField read GetfSicilKod;
    property fSirketNo:TField read GetfSirketNo;
    property fTerminalKod:TField read GetfTerminalKod;
  end;

  TTableUretimTerminalMessage = class(TAppTable)
  Private
    FfAciklama1: TField;
    FfAciklama2: TField;
    FfAciklama3: TField;
    FfAciklama4: TField;
    FfAciklama5: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfEvrakNo: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfHedefIslemAd: TField;
    FfHedefIslemNo: TField;
    FfHedefOperatorKod: TField;
    FfHedefSaat: TField;
    FfHedefSicilKod: TField;
    FfHedefTarih: TField;
    FfID: TField;
    FfKaynakIslemAd: TField;
    FfKaynakIslemNo: TField;
    FfKaynakKod: TField;
    FfKaynakOperatorKod: TField;
    FfKaynakSaat: TField;
    FfKaynakSicilKod: TField;
    FfKaynakTarih: TField;
    FfMamulKod: TField;
    FfNKod1: TField;
    FfNKod2: TField;
    FfNKod3: TField;
    FfNKod4: TField;
    FfNKod5: TField;
    FfOkundu: TField;
    FfOperasyonNo: TField;
    FfSeriNo: TField;
    FfSirketNo: TField;
    FfUretimNo: TField;
    FfUretimSiraNo: TField;
    FfVersiyonNo: TField;
    function GetAciklama1: String;
    function GetAciklama2: String;
    function GetAciklama3: String;
    function GetAciklama4: String;
    function GetAciklama5: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetEvrakNo: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetHedefIslemAd: String;
    function GetHedefIslemNo: Integer;
    function GetHedefOperatorKod: String;
    function GetHedefSaat: TDate;
    function GetHedefSicilKod: String;
    function GetHedefTarih: TDate;
    function GetID: Integer;
    function GetKaynakIslemAd: String;
    function GetKaynakIslemNo: Integer;
    function GetKaynakKod: String;
    function GetKaynakOperatorKod: String;
    function GetKaynakSaat: TDate;
    function GetKaynakSicilKod: String;
    function GetKaynakTarih: TDate;
    function GetMamulKod: String;
    function GetNKod1: Double;
    function GetNKod2: Double;
    function GetNKod3: Double;
    function GetNKod4: Double;
    function GetNKod5: Double;
    function GetOkundu: Integer;
    function GetOperasyonNo: Integer;
    function GetSeriNo: String;
    function GetSirketNo: String;
    function GetUretimNo: String;
    function GetUretimSiraNo: Integer;
    function GetVersiyonNo: String;
    function GetfAciklama1: TField;
    function GetfAciklama2: TField;
    function GetfAciklama3: TField;
    function GetfAciklama4: TField;
    function GetfAciklama5: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfEvrakNo: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfHedefIslemAd: TField;
    function GetfHedefIslemNo: TField;
    function GetfHedefOperatorKod: TField;
    function GetfHedefSaat: TField;
    function GetfHedefSicilKod: TField;
    function GetfHedefTarih: TField;
    function GetfID: TField;
    function GetfKaynakIslemAd: TField;
    function GetfKaynakIslemNo: TField;
    function GetfKaynakKod: TField;
    function GetfKaynakOperatorKod: TField;
    function GetfKaynakSaat: TField;
    function GetfKaynakSicilKod: TField;
    function GetfKaynakTarih: TField;
    function GetfMamulKod: TField;
    function GetfNKod1: TField;
    function GetfNKod2: TField;
    function GetfNKod3: TField;
    function GetfNKod4: TField;
    function GetfNKod5: TField;
    function GetfOkundu: TField;
    function GetfOperasyonNo: TField;
    function GetfSeriNo: TField;
    function GetfSirketNo: TField;
    function GetfUretimNo: TField;
    function GetfUretimSiraNo: TField;
    function GetfVersiyonNo: TField;
    procedure SetAciklama1(const Value: String);
    procedure SetAciklama2(const Value: String);
    procedure SetAciklama3(const Value: String);
    procedure SetAciklama4(const Value: String);
    procedure SetAciklama5(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetEvrakNo(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetHedefIslemAd(const Value: String);
    procedure SetHedefIslemNo(const Value: Integer);
    procedure SetHedefOperatorKod(const Value: String);
    procedure SetHedefSaat(const Value: TDate);
    procedure SetHedefSicilKod(const Value: String);
    procedure SetHedefTarih(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetKaynakIslemAd(const Value: String);
    procedure SetKaynakIslemNo(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetKaynakOperatorKod(const Value: String);
    procedure SetKaynakSaat(const Value: TDate);
    procedure SetKaynakSicilKod(const Value: String);
    procedure SetKaynakTarih(const Value: TDate);
    procedure SetMamulKod(const Value: String);
    procedure SetNKod1(const Value: Double);
    procedure SetNKod2(const Value: Double);
    procedure SetNKod3(const Value: Double);
    procedure SetNKod4(const Value: Double);
    procedure SetNKod5(const Value: Double);
    procedure SetOkundu(const Value: Integer);
    procedure SetOperasyonNo(const Value: Integer);
    procedure SetSeriNo(const Value: String);
    procedure SetSirketNo(const Value: String);
    procedure SetUretimNo(const Value: String);
    procedure SetUretimSiraNo(const Value: Integer);
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
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property HedefIslemAd: String read GetHedefIslemAd write SetHedefIslemAd;
    property HedefIslemNo: Integer read GetHedefIslemNo write SetHedefIslemNo;
    property HedefOperatorKod: String read GetHedefOperatorKod write SetHedefOperatorKod;
    property HedefSaat: TDate read GetHedefSaat write SetHedefSaat;
    property HedefSicilKod: String read GetHedefSicilKod write SetHedefSicilKod;
    property HedefTarih: TDate read GetHedefTarih write SetHedefTarih;
    property ID: Integer read GetID write SetID;
    property KaynakIslemAd: String read GetKaynakIslemAd write SetKaynakIslemAd;
    property KaynakIslemNo: Integer read GetKaynakIslemNo write SetKaynakIslemNo;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property KaynakOperatorKod: String read GetKaynakOperatorKod write SetKaynakOperatorKod;
    property KaynakSaat: TDate read GetKaynakSaat write SetKaynakSaat;
    property KaynakSicilKod: String read GetKaynakSicilKod write SetKaynakSicilKod;
    property KaynakTarih: TDate read GetKaynakTarih write SetKaynakTarih;
    property MamulKod: String read GetMamulKod write SetMamulKod;
    property NKod1: Double read GetNKod1 write SetNKod1;
    property NKod2: Double read GetNKod2 write SetNKod2;
    property NKod3: Double read GetNKod3 write SetNKod3;
    property NKod4: Double read GetNKod4 write SetNKod4;
    property NKod5: Double read GetNKod5 write SetNKod5;
    property Okundu: Integer read GetOkundu write SetOkundu;
    property OperasyonNo: Integer read GetOperasyonNo write SetOperasyonNo;
    property SeriNo: String read GetSeriNo write SetSeriNo;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property UretimNo: String read GetUretimNo write SetUretimNo;
    property UretimSiraNo: Integer read GetUretimSiraNo write SetUretimSiraNo;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fAciklama1:TField read GetfAciklama1;
    property fAciklama2:TField read GetfAciklama2;
    property fAciklama3:TField read GetfAciklama3;
    property fAciklama4:TField read GetfAciklama4;
    property fAciklama5:TField read GetfAciklama5;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fEvrakNo:TField read GetfEvrakNo;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fHedefIslemAd:TField read GetfHedefIslemAd;
    property fHedefIslemNo:TField read GetfHedefIslemNo;
    property fHedefOperatorKod:TField read GetfHedefOperatorKod;
    property fHedefSaat:TField read GetfHedefSaat;
    property fHedefSicilKod:TField read GetfHedefSicilKod;
    property fHedefTarih:TField read GetfHedefTarih;
    property fID:TField read GetfID;
    property fKaynakIslemAd:TField read GetfKaynakIslemAd;
    property fKaynakIslemNo:TField read GetfKaynakIslemNo;
    property fKaynakKod:TField read GetfKaynakKod;
    property fKaynakOperatorKod:TField read GetfKaynakOperatorKod;
    property fKaynakSaat:TField read GetfKaynakSaat;
    property fKaynakSicilKod:TField read GetfKaynakSicilKod;
    property fKaynakTarih:TField read GetfKaynakTarih;
    property fMamulKod:TField read GetfMamulKod;
    property fNKod1:TField read GetfNKod1;
    property fNKod2:TField read GetfNKod2;
    property fNKod3:TField read GetfNKod3;
    property fNKod4:TField read GetfNKod4;
    property fNKod5:TField read GetfNKod5;
    property fOkundu:TField read GetfOkundu;
    property fOperasyonNo:TField read GetfOperasyonNo;
    property fSeriNo:TField read GetfSeriNo;
    property fSirketNo:TField read GetfSirketNo;
    property fUretimNo:TField read GetfUretimNo;
    property fUretimSiraNo:TField read GetfUretimSiraNo;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

TTableUretimRotaKaynakNot = class(TAppTable)
  Private
    FfAciklama: TField;
    FfAciklama1: TField;
    FfAciklama2: TField;
    FfAciklama3: TField;
    FfAciklama4: TField;
    FfAciklama5: TField;
    FfDegistirenKaynak: TField;
    FfDegistirenKullanici: TField;
    FfDegistirenSaat: TField;
    FfDegistirenSurum: TField;
    FfDegistirenTarih: TField;
    FfEvrakNo: TField;
    FfEvrakTip: TField;
    FfGirenkaynak: TField;
    FfGirenKullanici: TField;
    FfGirenSaat: TField;
    FfGirenSurum: TField;
    FfGirenTarih: TField;
    FfID: TField;
    FfIslemNo: TField;
    FfIsMerkezKod: TField;
    FfKayitTur: TField;
    FfKaynakKod: TField;
    FfMamulKod: TField;
    FfOperasyonNo: TField;
    FfOperatorKod: TField;
    FfSiraNo: TField;
    FfSirketNo: TField;
    FfUretimNo: TField;
    FfUretimSiraNo: TField;
    FfVersiyonNo: TField;
    function GetAciklama: String;
    function GetAciklama1: String;
    function GetAciklama2: String;
    function GetAciklama3: String;
    function GetAciklama4: String;
    function GetAciklama5: String;
    function GetDegistirenKaynak: String;
    function GetDegistirenKullanici: String;
    function GetDegistirenSaat: TDate;
    function GetDegistirenSurum: String;
    function GetDegistirenTarih: TDate;
    function GetEvrakNo: String;
    function GetEvrakTip: Integer;
    function GetGirenkaynak: String;
    function GetGirenKullanici: String;
    function GetGirenSaat: TDate;
    function GetGirenSurum: String;
    function GetGirenTarih: TDate;
    function GetID: Integer;
    function GetIslemNo: Integer;
    function GetIsMerkezKod: String;
    function GetKayitTur: Integer;
    function GetKaynakKod: String;
    function GetMamulKod: String;
    function GetOperasyonNo: Integer;
    function GetOperatorKod: String;
    function GetSiraNo: Integer;
    function GetSirketNo: String;
    function GetUretimNo: String;
    function GetUretimSiraNo: Integer;
    function GetVersiyonNo: String;
    function GetfAciklama: TField;
    function GetfAciklama1: TField;
    function GetfAciklama2: TField;
    function GetfAciklama3: TField;
    function GetfAciklama4: TField;
    function GetfAciklama5: TField;
    function GetfDegistirenKaynak: TField;
    function GetfDegistirenKullanici: TField;
    function GetfDegistirenSaat: TField;
    function GetfDegistirenSurum: TField;
    function GetfDegistirenTarih: TField;
    function GetfEvrakNo: TField;
    function GetfEvrakTip: TField;
    function GetfGirenkaynak: TField;
    function GetfGirenKullanici: TField;
    function GetfGirenSaat: TField;
    function GetfGirenSurum: TField;
    function GetfGirenTarih: TField;
    function GetfID: TField;
    function GetfIslemNo: TField;
    function GetfIsMerkezKod: TField;
    function GetfKayitTur: TField;
    function GetfKaynakKod: TField;
    function GetfMamulKod: TField;
    function GetfOperasyonNo: TField;
    function GetfOperatorKod: TField;
    function GetfSiraNo: TField;
    function GetfSirketNo: TField;
    function GetfUretimNo: TField;
    function GetfUretimSiraNo: TField;
    function GetfVersiyonNo: TField;
    procedure SetAciklama(const Value: String);
    procedure SetAciklama1(const Value: String);
    procedure SetAciklama2(const Value: String);
    procedure SetAciklama3(const Value: String);
    procedure SetAciklama4(const Value: String);
    procedure SetAciklama5(const Value: String);
    procedure SetDegistirenKaynak(const Value: String);
    procedure SetDegistirenKullanici(const Value: String);
    procedure SetDegistirenSaat(const Value: TDate);
    procedure SetDegistirenSurum(const Value: String);
    procedure SetDegistirenTarih(const Value: TDate);
    procedure SetEvrakNo(const Value: String);
    procedure SetEvrakTip(const Value: Integer);
    procedure SetGirenkaynak(const Value: String);
    procedure SetGirenKullanici(const Value: String);
    procedure SetGirenSaat(const Value: TDate);
    procedure SetGirenSurum(const Value: String);
    procedure SetGirenTarih(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetIslemNo(const Value: Integer);
    procedure SetIsMerkezKod(const Value: String);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetMamulKod(const Value: String);
    procedure SetOperasyonNo(const Value: Integer);
    procedure SetOperatorKod(const Value: String);
    procedure SetSiraNo(const Value: Integer);
    procedure SetSirketNo(const Value: String);
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
    property Aciklama1: String read GetAciklama1 write SetAciklama1;
    property Aciklama2: String read GetAciklama2 write SetAciklama2;
    property Aciklama3: String read GetAciklama3 write SetAciklama3;
    property Aciklama4: String read GetAciklama4 write SetAciklama4;
    property Aciklama5: String read GetAciklama5 write SetAciklama5;
    property DegistirenKaynak: String read GetDegistirenKaynak write SetDegistirenKaynak;
    property DegistirenKullanici: String read GetDegistirenKullanici write SetDegistirenKullanici;
    property DegistirenSaat: TDate read GetDegistirenSaat write SetDegistirenSaat;
    property DegistirenSurum: String read GetDegistirenSurum write SetDegistirenSurum;
    property DegistirenTarih: TDate read GetDegistirenTarih write SetDegistirenTarih;
    property EvrakNo: String read GetEvrakNo write SetEvrakNo;
    property EvrakTip: Integer read GetEvrakTip write SetEvrakTip;
    property Girenkaynak: String read GetGirenkaynak write SetGirenkaynak;
    property GirenKullanici: String read GetGirenKullanici write SetGirenKullanici;
    property GirenSaat: TDate read GetGirenSaat write SetGirenSaat;
    property GirenSurum: String read GetGirenSurum write SetGirenSurum;
    property GirenTarih: TDate read GetGirenTarih write SetGirenTarih;
    property ID: Integer read GetID write SetID;
    property IslemNo: Integer read GetIslemNo write SetIslemNo;
    property IsMerkezKod: String read GetIsMerkezKod write SetIsMerkezKod;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property MamulKod: String read GetMamulKod write SetMamulKod;
    property OperasyonNo: Integer read GetOperasyonNo write SetOperasyonNo;
    property OperatorKod: String read GetOperatorKod write SetOperatorKod;
    property SiraNo: Integer read GetSiraNo write SetSiraNo;
    property SirketNo: String read GetSirketNo write SetSirketNo;
    property UretimNo: String read GetUretimNo write SetUretimNo;
    property UretimSiraNo: Integer read GetUretimSiraNo write SetUretimSiraNo;
    property VersiyonNo: String read GetVersiyonNo write SetVersiyonNo;
    property fAciklama:TField read GetfAciklama;
    property fAciklama1:TField read GetfAciklama1;
    property fAciklama2:TField read GetfAciklama2;
    property fAciklama3:TField read GetfAciklama3;
    property fAciklama4:TField read GetfAciklama4;
    property fAciklama5:TField read GetfAciklama5;
    property fDegistirenKaynak:TField read GetfDegistirenKaynak;
    property fDegistirenKullanici:TField read GetfDegistirenKullanici;
    property fDegistirenSaat:TField read GetfDegistirenSaat;
    property fDegistirenSurum:TField read GetfDegistirenSurum;
    property fDegistirenTarih:TField read GetfDegistirenTarih;
    property fEvrakNo:TField read GetfEvrakNo;
    property fEvrakTip:TField read GetfEvrakTip;
    property fGirenkaynak:TField read GetfGirenkaynak;
    property fGirenKullanici:TField read GetfGirenKullanici;
    property fGirenSaat:TField read GetfGirenSaat;
    property fGirenSurum:TField read GetfGirenSurum;
    property fGirenTarih:TField read GetfGirenTarih;
    property fID:TField read GetfID;
    property fIslemNo:TField read GetfIslemNo;
    property fIsMerkezKod:TField read GetfIsMerkezKod;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakKod:TField read GetfKaynakKod;
    property fMamulKod:TField read GetfMamulKod;
    property fOperasyonNo:TField read GetfOperasyonNo;
    property fOperatorKod:TField read GetfOperatorKod;
    property fSiraNo:TField read GetfSiraNo;
    property fSirketNo:TField read GetfSirketNo;
    property fUretimNo:TField read GetfUretimNo;
    property fUretimSiraNo:TField read GetfUretimSiraNo;
    property fVersiyonNo:TField read GetfVersiyonNo;
  end;

implementation
uses CPMApp_Security;

{ TTableUretimTerminalMalzemeTuketimBilgileri }

constructor TTableUretimTerminalMalzemeTuketimBilgileri.Create(AOwner: TComponent);
begin
  inherited;
  Name := 'TTableUretimTerminalMalzemeTuketimBilgileri';
  TableItems.TableNames := 'STHURD';
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.DoAfterOpen;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  if FfAciklama10 = nil then
    FfAciklama10 := FindField('ACIKLAMA10');
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  if FfAciklama6 = nil then
    FfAciklama6 := FindField('ACIKLAMA6');
  if FfAciklama7 = nil then
    FfAciklama7 := FindField('ACIKLAMA7');
  if FfAciklama8 = nil then
    FfAciklama8 := FindField('ACIKLAMA8');
  if FfAciklama9 = nil then
    FfAciklama9 := FindField('ACIKLAMA9');
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
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  if FfID = nil then
    FfID := FindField('ID');
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
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
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
  if FfSeriNo = nil then
    FfSeriNo := FindField('SERINO');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSiraNo2 = nil then
    FfSiraNo2 := FindField('SIRANO2');
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
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama1 := nil;
    FfAciklama10 := nil;
    FfAciklama2 := nil;
    FfAciklama3 := nil;
    FfAciklama4 := nil;
    FfAciklama5 := nil;
    FfAciklama6 := nil;
    FfAciklama7 := nil;
    FfAciklama8 := nil;
    FfAciklama9 := nil;
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
    FfEvrakNo := nil;
    FfEvrakTip := nil;
    FfGirenKaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfHesapKod := nil;
    FfID := nil;
    FfLKod1 := nil;
    FfLKod2 := nil;
    FfLKod3 := nil;
    FfLKod4 := nil;
    FfLKod5 := nil;
    FfMalKod := nil;
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
    FfSeriNo := nil;
    FfSiraNo := nil;
    FfSiraNo2 := nil;
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
    FfUretimNo := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetAciklama1: String;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetAciklama10: String;
begin
  if FfAciklama10 = nil then
    FfAciklama10 := FindField('ACIKLAMA10');
  Result := FfAciklama10.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetAciklama2: String;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetAciklama3: String;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetAciklama4: String;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetAciklama5: String;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetAciklama6: String;
begin
  if FfAciklama6 = nil then
    FfAciklama6 := FindField('ACIKLAMA6');
  Result := FfAciklama6.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetAciklama7: String;
begin
  if FfAciklama7 = nil then
    FfAciklama7 := FindField('ACIKLAMA7');
  Result := FfAciklama7.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetAciklama8: String;
begin
  if FfAciklama8 = nil then
    FfAciklama8 := FindField('ACIKLAMA8');
  Result := FfAciklama8.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetAciklama9: String;
begin
  if FfAciklama9 = nil then
    FfAciklama9 := FindField('ACIKLAMA9');
  Result := FfAciklama9.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetBKod1: Integer;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1.AsInteger;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetBKod2: Integer;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2.AsInteger;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetBKod3: Integer;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3.AsInteger;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetBKod4: Integer;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4.AsInteger;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetBKod5: Integer;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5.AsInteger;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetHesapKod: String;
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  Result := FfHesapKod.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetLKod1: String;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetLKod2: String;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetLKod3: String;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetLKod4: String;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetLKod5: String;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetMalKod: String;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetMKod1: String;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetMKod2: String;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetMKod3: String;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetMKod4: String;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetMKod5: String;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetNKod1: Double;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1.AsFloat;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetNKod2: Double;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2.AsFloat;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetNKod3: Double;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3.AsFloat;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetNKod4: Double;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4.AsFloat;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetNKod5: Double;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5.AsFloat;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetSeriNo: String;
begin
  if FfSeriNo = nil then
    FfSeriNo := FindField('SERINO');
  Result := FfSeriNo.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetSiraNo2: Integer;
begin
  if FfSiraNo2 = nil then
    FfSiraNo2 := FindField('SIRANO2');
  Result := FfSiraNo2.AsInteger;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetSKod1: String;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetSKod2: String;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetSKod3: String;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetSKod4: String;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetSKod5: String;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetTarih1: TDate;
begin
  if FfTarih1 = nil then
    FfTarih1 := FindField('TARIH1');
  Result := FfTarih1.AsDateTime;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetTarih2: TDate;
begin
  if FfTarih2 = nil then
    FfTarih2 := FindField('TARIH2');
  Result := FfTarih2.AsDateTime;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetTarih3: TDate;
begin
  if FfTarih3 = nil then
    FfTarih3 := FindField('TARIH3');
  Result := FfTarih3.AsDateTime;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetTarih4: TDate;
begin
  if FfTarih4 = nil then
    FfTarih4 := FindField('TARIH4');
  Result := FfTarih4.AsDateTime;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetTarih5: TDate;
begin
  if FfTarih5 = nil then
    FfTarih5 := FindField('TARIH5');
  Result := FfTarih5.AsDateTime;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetUretimNo: String;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfAciklama1: TField;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfAciklama10: TField;
begin
  if FfAciklama10 = nil then
    FfAciklama10 := FindField('ACIKLAMA10');
  Result := FfAciklama10;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfAciklama2: TField;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfAciklama3: TField;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfAciklama4: TField;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfAciklama5: TField;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfAciklama6: TField;
begin
  if FfAciklama6 = nil then
    FfAciklama6 := FindField('ACIKLAMA6');
  Result := FfAciklama6;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfAciklama7: TField;
begin
  if FfAciklama7 = nil then
    FfAciklama7 := FindField('ACIKLAMA7');
  Result := FfAciklama7;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfAciklama8: TField;
begin
  if FfAciklama8 = nil then
    FfAciklama8 := FindField('ACIKLAMA8');
  Result := FfAciklama8;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfAciklama9: TField;
begin
  if FfAciklama9 = nil then
    FfAciklama9 := FindField('ACIKLAMA9');
  Result := FfAciklama9;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfBKod1: TField;
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  Result := FfBKod1;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfBKod2: TField;
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  Result := FfBKod2;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfBKod3: TField;
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  Result := FfBKod3;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfBKod4: TField;
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  Result := FfBKod4;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfBKod5: TField;
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  Result := FfBKod5;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfHesapKod: TField;
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  Result := FfHesapKod;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfLKod1: TField;
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  Result := FfLKod1;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfLKod2: TField;
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  Result := FfLKod2;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfLKod3: TField;
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  Result := FfLKod3;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfLKod4: TField;
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  Result := FfLKod4;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfLKod5: TField;
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  Result := FfLKod5;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfMalKod: TField;
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  Result := FfMalKod;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfMKod1: TField;
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  Result := FfMKod1;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfMKod2: TField;
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  Result := FfMKod2;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfMKod3: TField;
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  Result := FfMKod3;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfMKod4: TField;
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  Result := FfMKod4;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfMKod5: TField;
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  Result := FfMKod5;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfNKod1: TField;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfNKod2: TField;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfNKod3: TField;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfNKod4: TField;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfNKod5: TField;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfSeriNo: TField;
begin
  if FfSeriNo = nil then
    FfSeriNo := FindField('SERINO');
  Result := FfSeriNo;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfSiraNo2: TField;
begin
  if FfSiraNo2 = nil then
    FfSiraNo2 := FindField('SIRANO2');
  Result := FfSiraNo2;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfSKod1: TField;
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  Result := FfSKod1;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfSKod2: TField;
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  Result := FfSKod2;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfSKod3: TField;
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  Result := FfSKod3;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfSKod4: TField;
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  Result := FfSKod4;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfSKod5: TField;
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  Result := FfSKod5;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfTarih1: TField;
begin
  if FfTarih1 = nil then
    FfTarih1 := FindField('TARIH1');
  Result := FfTarih1;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfTarih2: TField;
begin
  if FfTarih2 = nil then
    FfTarih2 := FindField('TARIH2');
  Result := FfTarih2;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfTarih3: TField;
begin
  if FfTarih3 = nil then
    FfTarih3 := FindField('TARIH3');
  Result := FfTarih3;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfTarih4: TField;
begin
  if FfTarih4 = nil then
    FfTarih4 := FindField('TARIH4');
  Result := FfTarih4;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfTarih5: TField;
begin
  if FfTarih5 = nil then
    FfTarih5 := FindField('TARIH5');
  Result := FfTarih5;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfUretimNo: TField;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo;
end;

function TTableUretimTerminalMalzemeTuketimBilgileri.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetAciklama1(const Value: String);
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  FfAciklama1.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetAciklama10(const Value: String);
begin
  if FfAciklama10 = nil then
    FfAciklama10 := FindField('ACIKLAMA10');
  FfAciklama10.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetAciklama2(const Value: String);
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  FfAciklama2.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetAciklama3(const Value: String);
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  FfAciklama3.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetAciklama4(const Value: String);
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  FfAciklama4.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetAciklama5(const Value: String);
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  FfAciklama5.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetAciklama6(const Value: String);
begin
  if FfAciklama6 = nil then
    FfAciklama6 := FindField('ACIKLAMA6');
  FfAciklama6.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetAciklama7(const Value: String);
begin
  if FfAciklama7 = nil then
    FfAciklama7 := FindField('ACIKLAMA7');
  FfAciklama7.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetAciklama8(const Value: String);
begin
  if FfAciklama8 = nil then
    FfAciklama8 := FindField('ACIKLAMA8');
  FfAciklama8.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetAciklama9(const Value: String);
begin
  if FfAciklama9 = nil then
    FfAciklama9 := FindField('ACIKLAMA9');
  FfAciklama9.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetBKod1(const Value: Integer);
begin
  if FfBKod1 = nil then
    FfBKod1 := FindField('BKOD1');
  FfBKod1.AsInteger := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetBKod2(const Value: Integer);
begin
  if FfBKod2 = nil then
    FfBKod2 := FindField('BKOD2');
  FfBKod2.AsInteger := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetBKod3(const Value: Integer);
begin
  if FfBKod3 = nil then
    FfBKod3 := FindField('BKOD3');
  FfBKod3.AsInteger := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetBKod4(const Value: Integer);
begin
  if FfBKod4 = nil then
    FfBKod4 := FindField('BKOD4');
  FfBKod4.AsInteger := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetBKod5(const Value: Integer);
begin
  if FfBKod5 = nil then
    FfBKod5 := FindField('BKOD5');
  FfBKod5.AsInteger := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetHesapKod(const Value: String);
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  FfHesapKod.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetLKod1(const Value: String);
begin
  if FfLKod1 = nil then
    FfLKod1 := FindField('LKOD1');
  FfLKod1.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetLKod2(const Value: String);
begin
  if FfLKod2 = nil then
    FfLKod2 := FindField('LKOD2');
  FfLKod2.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetLKod3(const Value: String);
begin
  if FfLKod3 = nil then
    FfLKod3 := FindField('LKOD3');
  FfLKod3.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetLKod4(const Value: String);
begin
  if FfLKod4 = nil then
    FfLKod4 := FindField('LKOD4');
  FfLKod4.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetLKod5(const Value: String);
begin
  if FfLKod5 = nil then
    FfLKod5 := FindField('LKOD5');
  FfLKod5.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetMalKod(const Value: String);
begin
  if FfMalKod = nil then
    FfMalKod := FindField('MALKOD');
  FfMalKod.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetMKod1(const Value: String);
begin
  if FfMKod1 = nil then
    FfMKod1 := FindField('MKOD1');
  FfMKod1.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetMKod2(const Value: String);
begin
  if FfMKod2 = nil then
    FfMKod2 := FindField('MKOD2');
  FfMKod2.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetMKod3(const Value: String);
begin
  if FfMKod3 = nil then
    FfMKod3 := FindField('MKOD3');
  FfMKod3.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetMKod4(const Value: String);
begin
  if FfMKod4 = nil then
    FfMKod4 := FindField('MKOD4');
  FfMKod4.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetMKod5(const Value: String);
begin
  if FfMKod5 = nil then
    FfMKod5 := FindField('MKOD5');
  FfMKod5.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetNKod1(const Value: Double);
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  FfNKod1.AsFloat := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetNKod2(const Value: Double);
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  FfNKod2.AsFloat := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetNKod3(const Value: Double);
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  FfNKod3.AsFloat := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetNKod4(const Value: Double);
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  FfNKod4.AsFloat := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetNKod5(const Value: Double);
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  FfNKod5.AsFloat := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetSeriNo(const Value: String);
begin
  if FfSeriNo = nil then
    FfSeriNo := FindField('SERINO');
  FfSeriNo.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetSiraNo2(const Value: Integer);
begin
  if FfSiraNo2 = nil then
    FfSiraNo2 := FindField('SIRANO2');
  FfSiraNo2.AsInteger := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetSKod1(const Value: String);
begin
  if FfSKod1 = nil then
    FfSKod1 := FindField('SKOD1');
  FfSKod1.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetSKod2(const Value: String);
begin
  if FfSKod2 = nil then
    FfSKod2 := FindField('SKOD2');
  FfSKod2.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetSKod3(const Value: String);
begin
  if FfSKod3 = nil then
    FfSKod3 := FindField('SKOD3');
  FfSKod3.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetSKod4(const Value: String);
begin
  if FfSKod4 = nil then
    FfSKod4 := FindField('SKOD4');
  FfSKod4.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetSKod5(const Value: String);
begin
  if FfSKod5 = nil then
    FfSKod5 := FindField('SKOD5');
  FfSKod5.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetTarih1(const Value: TDate);
begin
  if FfTarih1 = nil then
    FfTarih1 := FindField('TARIH1');
  FfTarih1.AsDateTime := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetTarih2(const Value: TDate);
begin
  if FfTarih2 = nil then
    FfTarih2 := FindField('TARIH2');
  FfTarih2.AsDateTime := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetTarih3(const Value: TDate);
begin
  if FfTarih3 = nil then
    FfTarih3 := FindField('TARIH3');
  FfTarih3.AsDateTime := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetTarih4(const Value: TDate);
begin
  if FfTarih4 = nil then
    FfTarih4 := FindField('TARIH4');
  FfTarih4.AsDateTime := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetTarih5(const Value: TDate);
begin
  if FfTarih5 = nil then
    FfTarih5 := FindField('TARIH5');
  FfTarih5.AsDateTime := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetUretimNo(const Value: String);
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  FfUretimNo.AsString := Value;
end;

procedure TTableUretimTerminalMalzemeTuketimBilgileri.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TTableSiparisHareketUretim }

constructor TTableSiparisHareketUretim.Create(AOwner: TComponent);
begin
  inherited;
  Name := 'TTableSiparisHareketUretim';
  TableItems.TableNames := 'STHURT';
end;

procedure TTableSiparisHareketUretim.DoAfterOpen;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKaynakIslemNo = nil then
    FfKaynakIslemNo := FindField('KAYNAKISLEMNO');
  if FfKonsolideSirketNo = nil then
    FfKonsolideSirketNo := FindField('KONSOLIDESIRKETNO');
  if FfMRPRenk = nil then
    FfMRPRenk := FindField('MRPRENK');
  if FfOpbastarih = nil then
    FfOpbastarih := FindField('OPBASTARIH');
  if FfOpBasTarihSaat = nil then
    FfOpBasTarihSaat := FindField('OPBASTARIHSAAT');
  if FfOpBitTarih = nil then
    FfOpBitTarih := FindField('OPBITTARIH');
  if FfOpbittarihsaat = nil then
    FfOpbittarihsaat := FindField('OPBITTARIHSAAT');
  if FfOpDurum = nil then
    FfOpDurum := FindField('OPDURUM');
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  if FfOperasyonSiraNo = nil then
    FfOperasyonSiraNo := FindField('OPERASYONSIRANO');
  if FfOzelrecetetip = nil then
    FfOzelrecetetip := FindField('OZELRECETETIP');
  if FfPozno = nil then
    FfPozno := FindField('POZNO');
  if FfRecetekaynaktip = nil then
    FfRecetekaynaktip := FindField('RECETEKAYNAKTIP');
  if FfReceteno = nil then
    FfReceteno := FindField('RECETENO');
  if FfRecetesirano = nil then
    FfRecetesirano := FindField('RECETESIRANO');
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfSonOpDurum = nil then
    FfSonOpDurum := FindField('SONOPDURUM');
  if FfYanurunmaliyetoran = nil then
    FfYanurunmaliyetoran := FindField('YANURUNMALIYETORAN');
  if FfYanurunno = nil then
    FfYanurunno := FindField('YANURUNNO');
  inherited;
end;

procedure TTableSiparisHareketUretim.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfEvrakNo := nil;
    FfEvrakTip := nil;
    FfHesapKod := nil;
    FfID := nil;
    FfKaynakIslemNo := nil;
    FfKonsolideSirketNo := nil;
    FfMRPRenk := nil;
    FfOpbastarih := nil;
    FfOpBasTarihSaat := nil;
    FfOpBitTarih := nil;
    FfOpbittarihsaat := nil;
    FfOpDurum := nil;
    FfOperasyonNo := nil;
    FfOperasyonSiraNo := nil;
    FfOzelrecetetip := nil;
    FfPozno := nil;
    FfRecetekaynaktip := nil;
    FfReceteno := nil;
    FfRecetesirano := nil;
    FfRevizyonNo := nil;
    FfSiraNo := nil;
    FfSirketNo := nil;
    FfSonOpDurum := nil;
    FfYanurunmaliyetoran := nil;
    FfYanurunno := nil;
  end;
  inherited;
end;

function TTableSiparisHareketUretim.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableSiparisHareketUretim.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableSiparisHareketUretim.GetHesapKod: String;
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  Result := FfHesapKod.AsString;
end;

function TTableSiparisHareketUretim.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableSiparisHareketUretim.GetKaynakIslemNo: Integer;
begin
  if FfKaynakIslemNo = nil then
    FfKaynakIslemNo := FindField('KAYNAKISLEMNO');
  Result := FfKaynakIslemNo.AsInteger;
end;

function TTableSiparisHareketUretim.GetKonsolideSirketNo: String;
begin
  if FfKonsolideSirketNo = nil then
    FfKonsolideSirketNo := FindField('KONSOLIDESIRKETNO');
  Result := FfKonsolideSirketNo.AsString;
end;

function TTableSiparisHareketUretim.GetMRPRenk: Integer;
begin
  if FfMRPRenk = nil then
    FfMRPRenk := FindField('MRPRENK');
  Result := FfMRPRenk.AsInteger;
end;

function TTableSiparisHareketUretim.GetOpbastarih: TDate;
begin
  if FfOpbastarih = nil then
    FfOpbastarih := FindField('OPBASTARIH');
  Result := FfOpbastarih.AsDateTime;
end;

function TTableSiparisHareketUretim.GetOpBasTarihSaat: TDate;
begin
  if FfOpBasTarihSaat = nil then
    FfOpBasTarihSaat := FindField('OPBASTARIHSAAT');
  Result := FfOpBasTarihSaat.AsDateTime;
end;

function TTableSiparisHareketUretim.GetOpBitTarih: TDate;
begin
  if FfOpBitTarih = nil then
    FfOpBitTarih := FindField('OPBITTARIH');
  Result := FfOpBitTarih.AsDateTime;
end;

function TTableSiparisHareketUretim.GetOpbittarihsaat: TDate;
begin
  if FfOpbittarihsaat = nil then
    FfOpbittarihsaat := FindField('OPBITTARIHSAAT');
  Result := FfOpbittarihsaat.AsDateTime;
end;

function TTableSiparisHareketUretim.GetOpDurum: Integer;
begin
  if FfOpDurum = nil then
    FfOpDurum := FindField('OPDURUM');
  Result := FfOpDurum.AsInteger;
end;

function TTableSiparisHareketUretim.GetOperasyonNo: Integer;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo.AsInteger;
end;

function TTableSiparisHareketUretim.GetOperasyonSiraNo: Integer;
begin
  if FfOperasyonSiraNo = nil then
    FfOperasyonSiraNo := FindField('OPERASYONSIRANO');
  Result := FfOperasyonSiraNo.AsInteger;
end;

function TTableSiparisHareketUretim.GetOzelrecetetip: Integer;
begin
  if FfOzelrecetetip = nil then
    FfOzelrecetetip := FindField('OZELRECETETIP');
  Result := FfOzelrecetetip.AsInteger;
end;

function TTableSiparisHareketUretim.GetPozno: String;
begin
  if FfPozno = nil then
    FfPozno := FindField('POZNO');
  Result := FfPozno.AsString;
end;

function TTableSiparisHareketUretim.GetRecetekaynaktip: Integer;
begin
  if FfRecetekaynaktip = nil then
    FfRecetekaynaktip := FindField('RECETEKAYNAKTIP');
  Result := FfRecetekaynaktip.AsInteger;
end;

function TTableSiparisHareketUretim.GetReceteno: String;
begin
  if FfReceteno = nil then
    FfReceteno := FindField('RECETENO');
  Result := FfReceteno.AsString;
end;

function TTableSiparisHareketUretim.GetRecetesirano: Integer;
begin
  if FfRecetesirano = nil then
    FfRecetesirano := FindField('RECETESIRANO');
  Result := FfRecetesirano.AsInteger;
end;

function TTableSiparisHareketUretim.GetRevizyonNo: String;
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  Result := FfRevizyonNo.AsString;
end;

function TTableSiparisHareketUretim.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableSiparisHareketUretim.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableSiparisHareketUretim.GetSonOpDurum: Integer;
begin
  if FfSonOpDurum = nil then
    FfSonOpDurum := FindField('SONOPDURUM');
  Result := FfSonOpDurum.AsInteger;
end;

function TTableSiparisHareketUretim.GetYanurunmaliyetoran: Double;
begin
  if FfYanurunmaliyetoran = nil then
    FfYanurunmaliyetoran := FindField('YANURUNMALIYETORAN');
  Result := FfYanurunmaliyetoran.AsFloat;
end;

function TTableSiparisHareketUretim.GetYanurunno: Integer;
begin
  if FfYanurunno = nil then
    FfYanurunno := FindField('YANURUNNO');
  Result := FfYanurunno.AsInteger;
end;

function TTableSiparisHareketUretim.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableSiparisHareketUretim.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableSiparisHareketUretim.GetfHesapKod: TField;
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  Result := FfHesapKod;
end;

function TTableSiparisHareketUretim.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableSiparisHareketUretim.GetfKaynakIslemNo: TField;
begin
  if FfKaynakIslemNo = nil then
    FfKaynakIslemNo := FindField('KAYNAKISLEMNO');
  Result := FfKaynakIslemNo;
end;

function TTableSiparisHareketUretim.GetfKonsolideSirketNo: TField;
begin
  if FfKonsolideSirketNo = nil then
    FfKonsolideSirketNo := FindField('KONSOLIDESIRKETNO');
  Result := FfKonsolideSirketNo;
end;

function TTableSiparisHareketUretim.GetfMRPRenk: TField;
begin
  if FfMRPRenk = nil then
    FfMRPRenk := FindField('MRPRENK');
  Result := FfMRPRenk;
end;

function TTableSiparisHareketUretim.GetfOpbastarih: TField;
begin
  if FfOpbastarih = nil then
    FfOpbastarih := FindField('OPBASTARIH');
  Result := FfOpbastarih;
end;

function TTableSiparisHareketUretim.GetfOpBasTarihSaat: TField;
begin
  if FfOpBasTarihSaat = nil then
    FfOpBasTarihSaat := FindField('OPBASTARIHSAAT');
  Result := FfOpBasTarihSaat;
end;

function TTableSiparisHareketUretim.GetfOpBitTarih: TField;
begin
  if FfOpBitTarih = nil then
    FfOpBitTarih := FindField('OPBITTARIH');
  Result := FfOpBitTarih;
end;

function TTableSiparisHareketUretim.GetfOpbittarihsaat: TField;
begin
  if FfOpbittarihsaat = nil then
    FfOpbittarihsaat := FindField('OPBITTARIHSAAT');
  Result := FfOpbittarihsaat;
end;

function TTableSiparisHareketUretim.GetfOpDurum: TField;
begin
  if FfOpDurum = nil then
    FfOpDurum := FindField('OPDURUM');
  Result := FfOpDurum;
end;

function TTableSiparisHareketUretim.GetfOperasyonNo: TField;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo;
end;

function TTableSiparisHareketUretim.GetfOperasyonSiraNo: TField;
begin
  if FfOperasyonSiraNo = nil then
    FfOperasyonSiraNo := FindField('OPERASYONSIRANO');
  Result := FfOperasyonSiraNo;
end;

function TTableSiparisHareketUretim.GetfOzelrecetetip: TField;
begin
  if FfOzelrecetetip = nil then
    FfOzelrecetetip := FindField('OZELRECETETIP');
  Result := FfOzelrecetetip;
end;

function TTableSiparisHareketUretim.GetfPozno: TField;
begin
  if FfPozno = nil then
    FfPozno := FindField('POZNO');
  Result := FfPozno;
end;

function TTableSiparisHareketUretim.GetfRecetekaynaktip: TField;
begin
  if FfRecetekaynaktip = nil then
    FfRecetekaynaktip := FindField('RECETEKAYNAKTIP');
  Result := FfRecetekaynaktip;
end;

function TTableSiparisHareketUretim.GetfReceteno: TField;
begin
  if FfReceteno = nil then
    FfReceteno := FindField('RECETENO');
  Result := FfReceteno;
end;

function TTableSiparisHareketUretim.GetfRecetesirano: TField;
begin
  if FfRecetesirano = nil then
    FfRecetesirano := FindField('RECETESIRANO');
  Result := FfRecetesirano;
end;

function TTableSiparisHareketUretim.GetfRevizyonNo: TField;
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  Result := FfRevizyonNo;
end;

function TTableSiparisHareketUretim.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableSiparisHareketUretim.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableSiparisHareketUretim.GetfSonOpDurum: TField;
begin
  if FfSonOpDurum = nil then
    FfSonOpDurum := FindField('SONOPDURUM');
  Result := FfSonOpDurum;
end;

function TTableSiparisHareketUretim.GetfYanurunmaliyetoran: TField;
begin
  if FfYanurunmaliyetoran = nil then
    FfYanurunmaliyetoran := FindField('YANURUNMALIYETORAN');
  Result := FfYanurunmaliyetoran;
end;

function TTableSiparisHareketUretim.GetfYanurunno: TField;
begin
  if FfYanurunno = nil then
    FfYanurunno := FindField('YANURUNNO');
  Result := FfYanurunno;
end;

procedure TTableSiparisHareketUretim.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableSiparisHareketUretim.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableSiparisHareketUretim.SetHesapKod(const Value: String);
begin
  if FfHesapKod = nil then
    FfHesapKod := FindField('HESAPKOD');
  FfHesapKod.AsString := Value;
end;

procedure TTableSiparisHareketUretim.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableSiparisHareketUretim.SetKaynakIslemNo(const Value: Integer);
begin
  if FfKaynakIslemNo = nil then
    FfKaynakIslemNo := FindField('KAYNAKISLEMNO');
  FfKaynakIslemNo.AsInteger := Value;
end;

procedure TTableSiparisHareketUretim.SetKonsolideSirketNo(const Value: String);
begin
  if FfKonsolideSirketNo = nil then
    FfKonsolideSirketNo := FindField('KONSOLIDESIRKETNO');
  FfKonsolideSirketNo.AsString := Value;
end;

procedure TTableSiparisHareketUretim.SetMRPRenk(const Value: Integer);
begin
  if FfMRPRenk = nil then
    FfMRPRenk := FindField('MRPRENK');
  FfMRPRenk.AsInteger := Value;
end;

procedure TTableSiparisHareketUretim.SetOpbastarih(const Value: TDate);
begin
  if FfOpbastarih = nil then
    FfOpbastarih := FindField('OPBASTARIH');
  FfOpbastarih.AsDateTime := Value;
end;

procedure TTableSiparisHareketUretim.SetOpBasTarihSaat(const Value: TDate);
begin
  if FfOpBasTarihSaat = nil then
    FfOpBasTarihSaat := FindField('OPBASTARIHSAAT');
  FfOpBasTarihSaat.AsDateTime := Value;
end;

procedure TTableSiparisHareketUretim.SetOpBitTarih(const Value: TDate);
begin
  if FfOpBitTarih = nil then
    FfOpBitTarih := FindField('OPBITTARIH');
  FfOpBitTarih.AsDateTime := Value;
end;

procedure TTableSiparisHareketUretim.SetOpbittarihsaat(const Value: TDate);
begin
  if FfOpbittarihsaat = nil then
    FfOpbittarihsaat := FindField('OPBITTARIHSAAT');
  FfOpbittarihsaat.AsDateTime := Value;
end;

procedure TTableSiparisHareketUretim.SetOpDurum(const Value: Integer);
begin
  if FfOpDurum = nil then
    FfOpDurum := FindField('OPDURUM');
  FfOpDurum.AsInteger := Value;
end;

procedure TTableSiparisHareketUretim.SetOperasyonNo(const Value: Integer);
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  FfOperasyonNo.AsInteger := Value;
end;

procedure TTableSiparisHareketUretim.SetOperasyonSiraNo(const Value: Integer);
begin
  if FfOperasyonSiraNo = nil then
    FfOperasyonSiraNo := FindField('OPERASYONSIRANO');
  FfOperasyonSiraNo.AsInteger := Value;
end;

procedure TTableSiparisHareketUretim.SetOzelrecetetip(const Value: Integer);
begin
  if FfOzelrecetetip = nil then
    FfOzelrecetetip := FindField('OZELRECETETIP');
  FfOzelrecetetip.AsInteger := Value;
end;

procedure TTableSiparisHareketUretim.SetPozno(const Value: String);
begin
  if FfPozno = nil then
    FfPozno := FindField('POZNO');
  FfPozno.AsString := Value;
end;

procedure TTableSiparisHareketUretim.SetRecetekaynaktip(const Value: Integer);
begin
  if FfRecetekaynaktip = nil then
    FfRecetekaynaktip := FindField('RECETEKAYNAKTIP');
  FfRecetekaynaktip.AsInteger := Value;
end;

procedure TTableSiparisHareketUretim.SetReceteno(const Value: String);
begin
  if FfReceteno = nil then
    FfReceteno := FindField('RECETENO');
  FfReceteno.AsString := Value;
end;

procedure TTableSiparisHareketUretim.SetRecetesirano(const Value: Integer);
begin
  if FfRecetesirano = nil then
    FfRecetesirano := FindField('RECETESIRANO');
  FfRecetesirano.AsInteger := Value;
end;

procedure TTableSiparisHareketUretim.SetRevizyonNo(const Value: String);
begin
  if FfRevizyonNo = nil then
    FfRevizyonNo := FindField('REVIZYONNO');
  FfRevizyonNo.AsString := Value;
end;

procedure TTableSiparisHareketUretim.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableSiparisHareketUretim.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableSiparisHareketUretim.SetSonOpDurum(const Value: Integer);
begin
  if FfSonOpDurum = nil then
    FfSonOpDurum := FindField('SONOPDURUM');
  FfSonOpDurum.AsInteger := Value;
end;

procedure TTableSiparisHareketUretim.SetYanurunmaliyetoran(const Value: Double);
begin
  if FfYanurunmaliyetoran = nil then
    FfYanurunmaliyetoran := FindField('YANURUNMALIYETORAN');
  FfYanurunmaliyetoran.AsFloat := Value;
end;

procedure TTableSiparisHareketUretim.SetYanurunno(const Value: Integer);
begin
  if FfYanurunno = nil then
    FfYanurunno := FindField('YANURUNNO');
  FfYanurunno.AsInteger := Value;
end;

{ TTableUretimTerminalBaslik }

constructor TTableUretimTerminalBaslik.Create(AOwner: TComponent);
begin
  inherited;
  Name := 'TTableUretimTerminalBaslik';
  TableItems.TableNames := 'URTTEB';
end;

procedure TTableUretimTerminalBaslik.DoAfterOpen;
begin
  if FfBarkodcalismaayar = nil then
    FfBarkodcalismaayar := FindField('BARKODCALISMAAYAR');
  if FfBarkodmalkodayar = nil then
    FfBarkodmalkodayar := FindField('BARKODMALKODAYAR');
  if FfBarkodserinoayar = nil then
    FfBarkodserinoayar := FindField('BARKODSERINOAYAR');
  if FfCalismaAyar = nil then
    FfCalismaAyar := FindField('CALISMAAYAR');
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  if FfDurumGosterTip = nil then
    FfDurumGosterTip := FindField('DURUMGOSTERTIP');
  if FfDuyuru = nil then
    FfDuyuru := FindField('DUYURU');
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfOpetorGosterTip = nil then
    FfOpetorGosterTip := FindField('OPETORGOSTERTIP');
  if FfOtomatiktuket = nil then
    FfOtomatiktuket := FindField('OTOMATIKTUKET');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfTerminalAd = nil then
    FfTerminalAd := FindField('TERMINALAD');
  if FfTerminalKod = nil then
    FfTerminalKod := FindField('TERMINALKOD');
  inherited;
end;

procedure TTableUretimTerminalBaslik.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfBarkodcalismaayar := nil;
    FfBarkodmalkodayar := nil;
    FfBarkodserinoayar := nil;
    FfCalismaAyar := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDurumGosterTip := nil;
    FfDuyuru := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfID := nil;
    FfKayitTur := nil;
    FfOpetorGosterTip := nil;
    FfOtomatiktuket := nil;
    FfSirketNo := nil;
    FfTerminalAd := nil;
    FfTerminalKod := nil;
  end;
  inherited;
end;

function TTableUretimTerminalBaslik.GetBarkodcalismaayar: Integer;
begin
  if FfBarkodcalismaayar = nil then
    FfBarkodcalismaayar := FindField('BARKODCALISMAAYAR');
  Result := FfBarkodcalismaayar.AsInteger;
end;

function TTableUretimTerminalBaslik.GetBarkodmalkodayar: Integer;
begin
  if FfBarkodmalkodayar = nil then
    FfBarkodmalkodayar := FindField('BARKODMALKODAYAR');
  Result := FfBarkodmalkodayar.AsInteger;
end;

function TTableUretimTerminalBaslik.GetBarkodserinoayar: Integer;
begin
  if FfBarkodserinoayar = nil then
    FfBarkodserinoayar := FindField('BARKODSERINOAYAR');
  Result := FfBarkodserinoayar.AsInteger;
end;

function TTableUretimTerminalBaslik.GetCalismaAyar: Integer;
begin
  if FfCalismaAyar = nil then
    FfCalismaAyar := FindField('CALISMAAYAR');
  Result := FfCalismaAyar.AsInteger;
end;

function TTableUretimTerminalBaslik.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimTerminalBaslik.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimTerminalBaslik.GetDurumGosterTip: Integer;
begin
  if FfDurumGosterTip = nil then
    FfDurumGosterTip := FindField('DURUMGOSTERTIP');
  Result := FfDurumGosterTip.AsInteger;
end;

function TTableUretimTerminalBaslik.GetDuyuru: String;
begin
  if FfDuyuru = nil then
    FfDuyuru := FindField('DUYURU');
  Result := FfDuyuru.AsString;
end;

function TTableUretimTerminalBaslik.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableUretimTerminalBaslik.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimTerminalBaslik.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimTerminalBaslik.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimTerminalBaslik.GetOpetorGosterTip: Integer;
begin
  if FfOpetorGosterTip = nil then
    FfOpetorGosterTip := FindField('OPETORGOSTERTIP');
  Result := FfOpetorGosterTip.AsInteger;
end;

function TTableUretimTerminalBaslik.GetOtomatiktuket: Integer;
begin
  if FfOtomatiktuket = nil then
    FfOtomatiktuket := FindField('OTOMATIKTUKET');
  Result := FfOtomatiktuket.AsInteger;
end;

function TTableUretimTerminalBaslik.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimTerminalBaslik.GetTerminalAd: String;
begin
  if FfTerminalAd = nil then
    FfTerminalAd := FindField('TERMINALAD');
  Result := FfTerminalAd.AsString;
end;

function TTableUretimTerminalBaslik.GetTerminalKod: String;
begin
  if FfTerminalKod = nil then
    FfTerminalKod := FindField('TERMINALKOD');
  Result := FfTerminalKod.AsString;
end;

function TTableUretimTerminalBaslik.GetfBarkodcalismaayar: TField;
begin
  if FfBarkodcalismaayar = nil then
    FfBarkodcalismaayar := FindField('BARKODCALISMAAYAR');
  Result := FfBarkodcalismaayar;
end;

function TTableUretimTerminalBaslik.GetfBarkodmalkodayar: TField;
begin
  if FfBarkodmalkodayar = nil then
    FfBarkodmalkodayar := FindField('BARKODMALKODAYAR');
  Result := FfBarkodmalkodayar;
end;

function TTableUretimTerminalBaslik.GetfBarkodserinoayar: TField;
begin
  if FfBarkodserinoayar = nil then
    FfBarkodserinoayar := FindField('BARKODSERINOAYAR');
  Result := FfBarkodserinoayar;
end;

function TTableUretimTerminalBaslik.GetfCalismaAyar: TField;
begin
  if FfCalismaAyar = nil then
    FfCalismaAyar := FindField('CALISMAAYAR');
  Result := FfCalismaAyar;
end;

function TTableUretimTerminalBaslik.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimTerminalBaslik.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimTerminalBaslik.GetfDurumGosterTip: TField;
begin
  if FfDurumGosterTip = nil then
    FfDurumGosterTip := FindField('DURUMGOSTERTIP');
  Result := FfDurumGosterTip;
end;

function TTableUretimTerminalBaslik.GetfDuyuru: TField;
begin
  if FfDuyuru = nil then
    FfDuyuru := FindField('DUYURU');
  Result := FfDuyuru;
end;

function TTableUretimTerminalBaslik.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableUretimTerminalBaslik.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimTerminalBaslik.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimTerminalBaslik.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimTerminalBaslik.GetfOpetorGosterTip: TField;
begin
  if FfOpetorGosterTip = nil then
    FfOpetorGosterTip := FindField('OPETORGOSTERTIP');
  Result := FfOpetorGosterTip;
end;

function TTableUretimTerminalBaslik.GetfOtomatiktuket: TField;
begin
  if FfOtomatiktuket = nil then
    FfOtomatiktuket := FindField('OTOMATIKTUKET');
  Result := FfOtomatiktuket;
end;

function TTableUretimTerminalBaslik.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimTerminalBaslik.GetfTerminalAd: TField;
begin
  if FfTerminalAd = nil then
    FfTerminalAd := FindField('TERMINALAD');
  Result := FfTerminalAd;
end;

function TTableUretimTerminalBaslik.GetfTerminalKod: TField;
begin
  if FfTerminalKod = nil then
    FfTerminalKod := FindField('TERMINALKOD');
  Result := FfTerminalKod;
end;

procedure TTableUretimTerminalBaslik.SetBarkodcalismaayar(const Value: Integer);
begin
  if FfBarkodcalismaayar = nil then
    FfBarkodcalismaayar := FindField('BARKODCALISMAAYAR');
  FfBarkodcalismaayar.AsInteger := Value;
end;

procedure TTableUretimTerminalBaslik.SetBarkodmalkodayar(const Value: Integer);
begin
  if FfBarkodmalkodayar = nil then
    FfBarkodmalkodayar := FindField('BARKODMALKODAYAR');
  FfBarkodmalkodayar.AsInteger := Value;
end;

procedure TTableUretimTerminalBaslik.SetBarkodserinoayar(const Value: Integer);
begin
  if FfBarkodserinoayar = nil then
    FfBarkodserinoayar := FindField('BARKODSERINOAYAR');
  FfBarkodserinoayar.AsInteger := Value;
end;

procedure TTableUretimTerminalBaslik.SetCalismaAyar(const Value: Integer);
begin
  if FfCalismaAyar = nil then
    FfCalismaAyar := FindField('CALISMAAYAR');
  FfCalismaAyar.AsInteger := Value;
end;

procedure TTableUretimTerminalBaslik.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimTerminalBaslik.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimTerminalBaslik.SetDurumGosterTip(const Value: Integer);
begin
  if FfDurumGosterTip = nil then
    FfDurumGosterTip := FindField('DURUMGOSTERTIP');
  FfDurumGosterTip.AsInteger := Value;
end;

procedure TTableUretimTerminalBaslik.SetDuyuru(const Value: String);
begin
  if FfDuyuru = nil then
    FfDuyuru := FindField('DUYURU');
  FfDuyuru.AsString := Value;
end;

procedure TTableUretimTerminalBaslik.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableUretimTerminalBaslik.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimTerminalBaslik.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimTerminalBaslik.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimTerminalBaslik.SetOpetorGosterTip(const Value: Integer);
begin
  if FfOpetorGosterTip = nil then
    FfOpetorGosterTip := FindField('OPETORGOSTERTIP');
  FfOpetorGosterTip.AsInteger := Value;
end;

procedure TTableUretimTerminalBaslik.SetOtomatiktuket(const Value: Integer);
begin
  if FfOtomatiktuket = nil then
    FfOtomatiktuket := FindField('OTOMATIKTUKET');
  FfOtomatiktuket.AsInteger := Value;
end;

procedure TTableUretimTerminalBaslik.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimTerminalBaslik.SetTerminalAd(const Value: String);
begin
  if FfTerminalAd = nil then
    FfTerminalAd := FindField('TERMINALAD');
  FfTerminalAd.AsString := Value;
end;

procedure TTableUretimTerminalBaslik.SetTerminalKod(const Value: String);
begin
  if FfTerminalKod = nil then
    FfTerminalKod := FindField('TERMINALKOD');
  FfTerminalKod.AsString := Value;
end;

{ TTableUretimTerminalKaynak }

constructor TTableUretimTerminalKaynak.Create(AOwner: TComponent);
begin
  inherited;
  Name := 'TTableUretimTerminalKaynak';
  TableItems.TableNames := 'URTTEK';
end;

procedure TTableUretimTerminalKaynak.DoAfterOpen;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIsEmriSecim = nil then
    FfIsEmriSecim := FindField('ISEMRISECIM');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfOpBasTuketimTip = nil then
    FfOpBasTuketimTip := FindField('OPBASTUKETIMTIP');
  if FfOpBitTuketimTip = nil then
    FfOpBitTuketimTip := FindField('OPBITTUKETIMTIP');
  if FfSicilKod = nil then
    FfSicilKod := FindField('SICILKOD');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfTerminalKod = nil then
    FfTerminalKod := FindField('TERMINALKOD');
  inherited;
end;

procedure TTableUretimTerminalKaynak.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfBasTarih := nil;
    FfBitTarih := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfID := nil;
    FfIsEmriSecim := nil;
    FfKayitTur := nil;
    FfKaynakKod := nil;
    FfOpBasTuketimTip := nil;
    FfOpBitTuketimTip := nil;
    FfSicilKod := nil;
    FfSirketNo := nil;
    FfTerminalKod := nil;
  end;
  inherited;
end;

function TTableUretimTerminalKaynak.GetBasTarih: TDate;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih.AsDateTime;
end;

function TTableUretimTerminalKaynak.GetBitTarih: TDate;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih.AsDateTime;
end;

function TTableUretimTerminalKaynak.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimTerminalKaynak.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimTerminalKaynak.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableUretimTerminalKaynak.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimTerminalKaynak.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimTerminalKaynak.GetIsEmriSecim: Integer;
begin
  if FfIsEmriSecim = nil then
    FfIsEmriSecim := FindField('ISEMRISECIM');
  Result := FfIsEmriSecim.AsInteger;
end;

function TTableUretimTerminalKaynak.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimTerminalKaynak.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimTerminalKaynak.GetOpBasTuketimTip: Integer;
begin
  if FfOpBasTuketimTip = nil then
    FfOpBasTuketimTip := FindField('OPBASTUKETIMTIP');
  Result := FfOpBasTuketimTip.AsInteger;
end;

function TTableUretimTerminalKaynak.GetOpBitTuketimTip: Integer;
begin
  if FfOpBitTuketimTip = nil then
    FfOpBitTuketimTip := FindField('OPBITTUKETIMTIP');
  Result := FfOpBitTuketimTip.AsInteger;
end;

function TTableUretimTerminalKaynak.GetSicilKod: String;
begin
  if FfSicilKod = nil then
    FfSicilKod := FindField('SICILKOD');
  Result := FfSicilKod.AsString;
end;

function TTableUretimTerminalKaynak.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimTerminalKaynak.GetTerminalKod: String;
begin
  if FfTerminalKod = nil then
    FfTerminalKod := FindField('TERMINALKOD');
  Result := FfTerminalKod.AsString;
end;

function TTableUretimTerminalKaynak.GetfBasTarih: TField;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih;
end;

function TTableUretimTerminalKaynak.GetfBitTarih: TField;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih;
end;

function TTableUretimTerminalKaynak.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimTerminalKaynak.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimTerminalKaynak.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableUretimTerminalKaynak.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimTerminalKaynak.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimTerminalKaynak.GetfIsEmriSecim: TField;
begin
  if FfIsEmriSecim = nil then
    FfIsEmriSecim := FindField('ISEMRISECIM');
  Result := FfIsEmriSecim;
end;

function TTableUretimTerminalKaynak.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimTerminalKaynak.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimTerminalKaynak.GetfOpBasTuketimTip: TField;
begin
  if FfOpBasTuketimTip = nil then
    FfOpBasTuketimTip := FindField('OPBASTUKETIMTIP');
  Result := FfOpBasTuketimTip;
end;

function TTableUretimTerminalKaynak.GetfOpBitTuketimTip: TField;
begin
  if FfOpBitTuketimTip = nil then
    FfOpBitTuketimTip := FindField('OPBITTUKETIMTIP');
  Result := FfOpBitTuketimTip;
end;

function TTableUretimTerminalKaynak.GetfSicilKod: TField;
begin
  if FfSicilKod = nil then
    FfSicilKod := FindField('SICILKOD');
  Result := FfSicilKod;
end;

function TTableUretimTerminalKaynak.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimTerminalKaynak.GetfTerminalKod: TField;
begin
  if FfTerminalKod = nil then
    FfTerminalKod := FindField('TERMINALKOD');
  Result := FfTerminalKod;
end;

procedure TTableUretimTerminalKaynak.SetBasTarih(const Value: TDate);
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  FfBasTarih.AsDateTime := Value;
end;

procedure TTableUretimTerminalKaynak.SetBitTarih(const Value: TDate);
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  FfBitTarih.AsDateTime := Value;
end;

procedure TTableUretimTerminalKaynak.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimTerminalKaynak.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimTerminalKaynak.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableUretimTerminalKaynak.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimTerminalKaynak.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimTerminalKaynak.SetIsEmriSecim(const Value: Integer);
begin
  if FfIsEmriSecim = nil then
    FfIsEmriSecim := FindField('ISEMRISECIM');
  FfIsEmriSecim.AsInteger := Value;
end;

procedure TTableUretimTerminalKaynak.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimTerminalKaynak.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimTerminalKaynak.SetOpBasTuketimTip(const Value: Integer);
begin
  if FfOpBasTuketimTip = nil then
    FfOpBasTuketimTip := FindField('OPBASTUKETIMTIP');
  FfOpBasTuketimTip.AsInteger := Value;
end;

procedure TTableUretimTerminalKaynak.SetOpBitTuketimTip(const Value: Integer);
begin
  if FfOpBitTuketimTip = nil then
    FfOpBitTuketimTip := FindField('OPBITTUKETIMTIP');
  FfOpBitTuketimTip.AsInteger := Value;
end;

procedure TTableUretimTerminalKaynak.SetSicilKod(const Value: String);
begin
  if FfSicilKod = nil then
    FfSicilKod := FindField('SICILKOD');
  FfSicilKod.AsString := Value;
end;

procedure TTableUretimTerminalKaynak.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimTerminalKaynak.SetTerminalKod(const Value: String);
begin
  if FfTerminalKod = nil then
    FfTerminalKod := FindField('TERMINALKOD');
  FfTerminalKod.AsString := Value;
end;

{ TTableUretimTerminalPersonel }

constructor TTableUretimTerminalPersonel.Create(AOwner: TComponent);
begin
  inherited;
  Name := 'TTableUretimTerminalPersonel';
  TableItems.TableNames := 'URTTEP';
end;

procedure TTableUretimTerminalPersonel.DoAfterOpen;
begin
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
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  if FfPlansizYukleme = nil then
    FfPlansizYukleme := FindField('PLANSIZYUKLEME');
  if FfSicilKod = nil then
    FfSicilKod := FindField('SICILKOD');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfTerminalKod = nil then
    FfTerminalKod := FindField('TERMINALKOD');
  inherited;
end;

procedure TTableUretimTerminalPersonel.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfBasTarih := nil;
    FfBitTarih := nil;
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
    FfKayitTur := nil;
    FfOperatorKod := nil;
    FfPlansizYukleme := nil;
    FfSicilKod := nil;
    FfSirketNo := nil;
    FfTerminalKod := nil;
  end;
  inherited;
end;

function TTableUretimTerminalPersonel.GetBasTarih: TDate;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih.AsDateTime;
end;

function TTableUretimTerminalPersonel.GetBitTarih: TDate;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih.AsDateTime;
end;

function TTableUretimTerminalPersonel.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableUretimTerminalPersonel.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimTerminalPersonel.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimTerminalPersonel.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableUretimTerminalPersonel.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableUretimTerminalPersonel.GetGirenKaynak: String;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak.AsString;
end;

function TTableUretimTerminalPersonel.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableUretimTerminalPersonel.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimTerminalPersonel.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableUretimTerminalPersonel.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableUretimTerminalPersonel.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimTerminalPersonel.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimTerminalPersonel.GetOperatorKod: String;
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  Result := FfOperatorKod.AsString;
end;

function TTableUretimTerminalPersonel.GetPlansizYukleme: Integer;
begin
  if FfPlansizYukleme = nil then
    FfPlansizYukleme := FindField('PLANSIZYUKLEME');
  Result := FfPlansizYukleme.AsInteger;
end;

function TTableUretimTerminalPersonel.GetSicilKod: String;
begin
  if FfSicilKod = nil then
    FfSicilKod := FindField('SICILKOD');
  Result := FfSicilKod.AsString;
end;

function TTableUretimTerminalPersonel.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimTerminalPersonel.GetTerminalKod: String;
begin
  if FfTerminalKod = nil then
    FfTerminalKod := FindField('TERMINALKOD');
  Result := FfTerminalKod.AsString;
end;

function TTableUretimTerminalPersonel.GetfBasTarih: TField;
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  Result := FfBasTarih;
end;

function TTableUretimTerminalPersonel.GetfBitTarih: TField;
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  Result := FfBitTarih;
end;

function TTableUretimTerminalPersonel.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableUretimTerminalPersonel.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimTerminalPersonel.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimTerminalPersonel.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableUretimTerminalPersonel.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableUretimTerminalPersonel.GetfGirenKaynak: TField;
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  Result := FfGirenKaynak;
end;

function TTableUretimTerminalPersonel.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableUretimTerminalPersonel.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimTerminalPersonel.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableUretimTerminalPersonel.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableUretimTerminalPersonel.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimTerminalPersonel.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimTerminalPersonel.GetfOperatorKod: TField;
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  Result := FfOperatorKod;
end;

function TTableUretimTerminalPersonel.GetfPlansizYukleme: TField;
begin
  if FfPlansizYukleme = nil then
    FfPlansizYukleme := FindField('PLANSIZYUKLEME');
  Result := FfPlansizYukleme;
end;

function TTableUretimTerminalPersonel.GetfSicilKod: TField;
begin
  if FfSicilKod = nil then
    FfSicilKod := FindField('SICILKOD');
  Result := FfSicilKod;
end;

function TTableUretimTerminalPersonel.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimTerminalPersonel.GetfTerminalKod: TField;
begin
  if FfTerminalKod = nil then
    FfTerminalKod := FindField('TERMINALKOD');
  Result := FfTerminalKod;
end;

procedure TTableUretimTerminalPersonel.SetBasTarih(const Value: TDate);
begin
  if FfBasTarih = nil then
    FfBasTarih := FindField('BASTARIH');
  FfBasTarih.AsDateTime := Value;
end;

procedure TTableUretimTerminalPersonel.SetBitTarih(const Value: TDate);
begin
  if FfBitTarih = nil then
    FfBitTarih := FindField('BITTARIH');
  FfBitTarih.AsDateTime := Value;
end;

procedure TTableUretimTerminalPersonel.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableUretimTerminalPersonel.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimTerminalPersonel.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimTerminalPersonel.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableUretimTerminalPersonel.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableUretimTerminalPersonel.SetGirenKaynak(const Value: String);
begin
  if FfGirenKaynak = nil then
    FfGirenKaynak := FindField('GIRENKAYNAK');
  FfGirenKaynak.AsString := Value;
end;

procedure TTableUretimTerminalPersonel.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableUretimTerminalPersonel.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimTerminalPersonel.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableUretimTerminalPersonel.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableUretimTerminalPersonel.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimTerminalPersonel.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimTerminalPersonel.SetOperatorKod(const Value: String);
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  FfOperatorKod.AsString := Value;
end;

procedure TTableUretimTerminalPersonel.SetPlansizYukleme(const Value: Integer);
begin
  if FfPlansizYukleme = nil then
    FfPlansizYukleme := FindField('PLANSIZYUKLEME');
  FfPlansizYukleme.AsInteger := Value;
end;

procedure TTableUretimTerminalPersonel.SetSicilKod(const Value: String);
begin
  if FfSicilKod = nil then
    FfSicilKod := FindField('SICILKOD');
  FfSicilKod.AsString := Value;
end;

procedure TTableUretimTerminalPersonel.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimTerminalPersonel.SetTerminalKod(const Value: String);
begin
  if FfTerminalKod = nil then
    FfTerminalKod := FindField('TERMINALKOD');
  FfTerminalKod.AsString := Value;
end;

{ TTableUretimTerminalKaynakIslemTanim }

constructor TTableUretimTerminalKaynakIslemTanim.Create(AOwner: TComponent);
begin
  inherited;
  Name := 'TTableUretimTerminalKaynakIslemTanim';
  TableItems.TableNames := 'URTTIT';
end;

procedure TTableUretimTerminalKaynakIslemTanim.DoAfterOpen;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfKullanilan = nil then
    FfKullanilan := FindField('KULLANILAN');
  if FfSicilKod = nil then
    FfSicilKod := FindField('SICILKOD');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfTerminalKod = nil then
    FfTerminalKod := FindField('TERMINALKOD');
  inherited;
end;

procedure TTableUretimTerminalKaynakIslemTanim.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfID := nil;
    FfIslemNo := nil;
    FfKayitTur := nil;
    FfKaynakKod := nil;
    FfKullanilan := nil;
    FfSicilKod := nil;
    FfSirketNo := nil;
    FfTerminalKod := nil;
  end;
  inherited;
end;

function TTableUretimTerminalKaynakIslemTanim.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimTerminalKaynakIslemTanim.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimTerminalKaynakIslemTanim.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableUretimTerminalKaynakIslemTanim.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimTerminalKaynakIslemTanim.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimTerminalKaynakIslemTanim.GetIslemNo: Integer;
begin
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  Result := FfIslemNo.AsInteger;
end;

function TTableUretimTerminalKaynakIslemTanim.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimTerminalKaynakIslemTanim.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimTerminalKaynakIslemTanim.GetKullanilan: Integer;
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('KULLANILAN');
  Result := FfKullanilan.AsInteger;
end;

function TTableUretimTerminalKaynakIslemTanim.GetSicilKod: String;
begin
  if FfSicilKod = nil then
    FfSicilKod := FindField('SICILKOD');
  Result := FfSicilKod.AsString;
end;

function TTableUretimTerminalKaynakIslemTanim.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimTerminalKaynakIslemTanim.GetTerminalKod: String;
begin
  if FfTerminalKod = nil then
    FfTerminalKod := FindField('TERMINALKOD');
  Result := FfTerminalKod.AsString;
end;

function TTableUretimTerminalKaynakIslemTanim.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimTerminalKaynakIslemTanim.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimTerminalKaynakIslemTanim.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableUretimTerminalKaynakIslemTanim.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimTerminalKaynakIslemTanim.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimTerminalKaynakIslemTanim.GetfIslemNo: TField;
begin
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  Result := FfIslemNo;
end;

function TTableUretimTerminalKaynakIslemTanim.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimTerminalKaynakIslemTanim.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimTerminalKaynakIslemTanim.GetfKullanilan: TField;
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('KULLANILAN');
  Result := FfKullanilan;
end;

function TTableUretimTerminalKaynakIslemTanim.GetfSicilKod: TField;
begin
  if FfSicilKod = nil then
    FfSicilKod := FindField('SICILKOD');
  Result := FfSicilKod;
end;

function TTableUretimTerminalKaynakIslemTanim.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimTerminalKaynakIslemTanim.GetfTerminalKod: TField;
begin
  if FfTerminalKod = nil then
    FfTerminalKod := FindField('TERMINALKOD');
  Result := FfTerminalKod;
end;

procedure TTableUretimTerminalKaynakIslemTanim.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimTerminalKaynakIslemTanim.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimTerminalKaynakIslemTanim.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableUretimTerminalKaynakIslemTanim.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimTerminalKaynakIslemTanim.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimTerminalKaynakIslemTanim.SetIslemNo(const Value: Integer);
begin
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  FfIslemNo.AsInteger := Value;
end;

procedure TTableUretimTerminalKaynakIslemTanim.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimTerminalKaynakIslemTanim.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimTerminalKaynakIslemTanim.SetKullanilan(const Value: Integer);
begin
  if FfKullanilan = nil then
    FfKullanilan := FindField('KULLANILAN');
  FfKullanilan.AsInteger := Value;
end;

procedure TTableUretimTerminalKaynakIslemTanim.SetSicilKod(const Value: String);
begin
  if FfSicilKod = nil then
    FfSicilKod := FindField('SICILKOD');
  FfSicilKod.AsString := Value;
end;

procedure TTableUretimTerminalKaynakIslemTanim.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimTerminalKaynakIslemTanim.SetTerminalKod(const Value: String);
begin
  if FfTerminalKod = nil then
    FfTerminalKod := FindField('TERMINALKOD');
  FfTerminalKod.AsString := Value;
end;

{ TTableUretimTerminalMessage }

constructor TTableUretimTerminalMessage.Create(AOwner: TComponent);
begin
  inherited;
  Name := 'TTableUretimTerminalMessage';
  TableItems.TableNames := 'URTTMS';
end;

procedure TTableUretimTerminalMessage.DoAfterOpen;
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
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  if FfHedefIslemAd = nil then
    FfHedefIslemAd := FindField('HEDEFISLEMAD');
  if FfHedefIslemNo = nil then
    FfHedefIslemNo := FindField('HEDEFISLEMNO');
  if FfHedefOperatorKod = nil then
    FfHedefOperatorKod := FindField('HEDEFOPERATORKOD');
  if FfHedefSaat = nil then
    FfHedefSaat := FindField('HEDEFSAAT');
  if FfHedefSicilKod = nil then
    FfHedefSicilKod := FindField('HEDEFSICILKOD');
  if FfHedefTarih = nil then
    FfHedefTarih := FindField('HEDEFTARIH');
  if FfID = nil then
    FfID := FindField('ID');
  if FfKaynakIslemAd = nil then
    FfKaynakIslemAd := FindField('KAYNAKISLEMAD');
  if FfKaynakIslemNo = nil then
    FfKaynakIslemNo := FindField('KAYNAKISLEMNO');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfKaynakOperatorKod = nil then
    FfKaynakOperatorKod := FindField('KAYNAKOPERATORKOD');
  if FfKaynakSaat = nil then
    FfKaynakSaat := FindField('KAYNAKSAAT');
  if FfKaynakSicilKod = nil then
    FfKaynakSicilKod := FindField('KAYNAKSICILKOD');
  if FfKaynakTarih = nil then
    FfKaynakTarih := FindField('KAYNAKTARIH');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
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
  if FfOkundu = nil then
    FfOkundu := FindField('OKUNDU');
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  if FfSeriNo = nil then
    FfSeriNo := FindField('SERINO');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableUretimTerminalMessage.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama1 := nil;
    FfAciklama2 := nil;
    FfAciklama3 := nil;
    FfAciklama4 := nil;
    FfAciklama5 := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfEvrakNo := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfHedefIslemAd := nil;
    FfHedefIslemNo := nil;
    FfHedefOperatorKod := nil;
    FfHedefSaat := nil;
    FfHedefSicilKod := nil;
    FfHedefTarih := nil;
    FfID := nil;
    FfKaynakIslemAd := nil;
    FfKaynakIslemNo := nil;
    FfKaynakKod := nil;
    FfKaynakOperatorKod := nil;
    FfKaynakSaat := nil;
    FfKaynakSicilKod := nil;
    FfKaynakTarih := nil;
    FfMamulKod := nil;
    FfNKod1 := nil;
    FfNKod2 := nil;
    FfNKod3 := nil;
    FfNKod4 := nil;
    FfNKod5 := nil;
    FfOkundu := nil;
    FfOperasyonNo := nil;
    FfSeriNo := nil;
    FfSirketNo := nil;
    FfUretimNo := nil;
    FfUretimSiraNo := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableUretimTerminalMessage.GetAciklama1: String;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1.AsString;
end;

function TTableUretimTerminalMessage.GetAciklama2: String;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2.AsString;
end;

function TTableUretimTerminalMessage.GetAciklama3: String;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3.AsString;
end;

function TTableUretimTerminalMessage.GetAciklama4: String;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4.AsString;
end;

function TTableUretimTerminalMessage.GetAciklama5: String;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5.AsString;
end;

function TTableUretimTerminalMessage.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimTerminalMessage.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimTerminalMessage.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableUretimTerminalMessage.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableUretimTerminalMessage.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimTerminalMessage.GetHedefIslemAd: String;
begin
  if FfHedefIslemAd = nil then
    FfHedefIslemAd := FindField('HEDEFISLEMAD');
  Result := FfHedefIslemAd.AsString;
end;

function TTableUretimTerminalMessage.GetHedefIslemNo: Integer;
begin
  if FfHedefIslemNo = nil then
    FfHedefIslemNo := FindField('HEDEFISLEMNO');
  Result := FfHedefIslemNo.AsInteger;
end;

function TTableUretimTerminalMessage.GetHedefOperatorKod: String;
begin
  if FfHedefOperatorKod = nil then
    FfHedefOperatorKod := FindField('HEDEFOPERATORKOD');
  Result := FfHedefOperatorKod.AsString;
end;

function TTableUretimTerminalMessage.GetHedefSaat: TDate;
begin
  if FfHedefSaat = nil then
    FfHedefSaat := FindField('HEDEFSAAT');
  Result := FfHedefSaat.AsDateTime;
end;

function TTableUretimTerminalMessage.GetHedefSicilKod: String;
begin
  if FfHedefSicilKod = nil then
    FfHedefSicilKod := FindField('HEDEFSICILKOD');
  Result := FfHedefSicilKod.AsString;
end;

function TTableUretimTerminalMessage.GetHedefTarih: TDate;
begin
  if FfHedefTarih = nil then
    FfHedefTarih := FindField('HEDEFTARIH');
  Result := FfHedefTarih.AsDateTime;
end;

function TTableUretimTerminalMessage.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimTerminalMessage.GetKaynakIslemAd: String;
begin
  if FfKaynakIslemAd = nil then
    FfKaynakIslemAd := FindField('KAYNAKISLEMAD');
  Result := FfKaynakIslemAd.AsString;
end;

function TTableUretimTerminalMessage.GetKaynakIslemNo: Integer;
begin
  if FfKaynakIslemNo = nil then
    FfKaynakIslemNo := FindField('KAYNAKISLEMNO');
  Result := FfKaynakIslemNo.AsInteger;
end;

function TTableUretimTerminalMessage.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimTerminalMessage.GetKaynakOperatorKod: String;
begin
  if FfKaynakOperatorKod = nil then
    FfKaynakOperatorKod := FindField('KAYNAKOPERATORKOD');
  Result := FfKaynakOperatorKod.AsString;
end;

function TTableUretimTerminalMessage.GetKaynakSaat: TDate;
begin
  if FfKaynakSaat = nil then
    FfKaynakSaat := FindField('KAYNAKSAAT');
  Result := FfKaynakSaat.AsDateTime;
end;

function TTableUretimTerminalMessage.GetKaynakSicilKod: String;
begin
  if FfKaynakSicilKod = nil then
    FfKaynakSicilKod := FindField('KAYNAKSICILKOD');
  Result := FfKaynakSicilKod.AsString;
end;

function TTableUretimTerminalMessage.GetKaynakTarih: TDate;
begin
  if FfKaynakTarih = nil then
    FfKaynakTarih := FindField('KAYNAKTARIH');
  Result := FfKaynakTarih.AsDateTime;
end;

function TTableUretimTerminalMessage.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableUretimTerminalMessage.GetNKod1: Double;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1.AsFloat;
end;

function TTableUretimTerminalMessage.GetNKod2: Double;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2.AsFloat;
end;

function TTableUretimTerminalMessage.GetNKod3: Double;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3.AsFloat;
end;

function TTableUretimTerminalMessage.GetNKod4: Double;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4.AsFloat;
end;

function TTableUretimTerminalMessage.GetNKod5: Double;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5.AsFloat;
end;

function TTableUretimTerminalMessage.GetOkundu: Integer;
begin
  if FfOkundu = nil then
    FfOkundu := FindField('OKUNDU');
  Result := FfOkundu.AsInteger;
end;

function TTableUretimTerminalMessage.GetOperasyonNo: Integer;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo.AsInteger;
end;

function TTableUretimTerminalMessage.GetSeriNo: String;
begin
  if FfSeriNo = nil then
    FfSeriNo := FindField('SERINO');
  Result := FfSeriNo.AsString;
end;

function TTableUretimTerminalMessage.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimTerminalMessage.GetUretimNo: String;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo.AsString;
end;

function TTableUretimTerminalMessage.GetUretimSiraNo: Integer;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo.AsInteger;
end;

function TTableUretimTerminalMessage.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableUretimTerminalMessage.GetfAciklama1: TField;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1;
end;

function TTableUretimTerminalMessage.GetfAciklama2: TField;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2;
end;

function TTableUretimTerminalMessage.GetfAciklama3: TField;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3;
end;

function TTableUretimTerminalMessage.GetfAciklama4: TField;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4;
end;

function TTableUretimTerminalMessage.GetfAciklama5: TField;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5;
end;

function TTableUretimTerminalMessage.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimTerminalMessage.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimTerminalMessage.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableUretimTerminalMessage.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableUretimTerminalMessage.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimTerminalMessage.GetfHedefIslemAd: TField;
begin
  if FfHedefIslemAd = nil then
    FfHedefIslemAd := FindField('HEDEFISLEMAD');
  Result := FfHedefIslemAd;
end;

function TTableUretimTerminalMessage.GetfHedefIslemNo: TField;
begin
  if FfHedefIslemNo = nil then
    FfHedefIslemNo := FindField('HEDEFISLEMNO');
  Result := FfHedefIslemNo;
end;

function TTableUretimTerminalMessage.GetfHedefOperatorKod: TField;
begin
  if FfHedefOperatorKod = nil then
    FfHedefOperatorKod := FindField('HEDEFOPERATORKOD');
  Result := FfHedefOperatorKod;
end;

function TTableUretimTerminalMessage.GetfHedefSaat: TField;
begin
  if FfHedefSaat = nil then
    FfHedefSaat := FindField('HEDEFSAAT');
  Result := FfHedefSaat;
end;

function TTableUretimTerminalMessage.GetfHedefSicilKod: TField;
begin
  if FfHedefSicilKod = nil then
    FfHedefSicilKod := FindField('HEDEFSICILKOD');
  Result := FfHedefSicilKod;
end;

function TTableUretimTerminalMessage.GetfHedefTarih: TField;
begin
  if FfHedefTarih = nil then
    FfHedefTarih := FindField('HEDEFTARIH');
  Result := FfHedefTarih;
end;

function TTableUretimTerminalMessage.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimTerminalMessage.GetfKaynakIslemAd: TField;
begin
  if FfKaynakIslemAd = nil then
    FfKaynakIslemAd := FindField('KAYNAKISLEMAD');
  Result := FfKaynakIslemAd;
end;

function TTableUretimTerminalMessage.GetfKaynakIslemNo: TField;
begin
  if FfKaynakIslemNo = nil then
    FfKaynakIslemNo := FindField('KAYNAKISLEMNO');
  Result := FfKaynakIslemNo;
end;

function TTableUretimTerminalMessage.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimTerminalMessage.GetfKaynakOperatorKod: TField;
begin
  if FfKaynakOperatorKod = nil then
    FfKaynakOperatorKod := FindField('KAYNAKOPERATORKOD');
  Result := FfKaynakOperatorKod;
end;

function TTableUretimTerminalMessage.GetfKaynakSaat: TField;
begin
  if FfKaynakSaat = nil then
    FfKaynakSaat := FindField('KAYNAKSAAT');
  Result := FfKaynakSaat;
end;

function TTableUretimTerminalMessage.GetfKaynakSicilKod: TField;
begin
  if FfKaynakSicilKod = nil then
    FfKaynakSicilKod := FindField('KAYNAKSICILKOD');
  Result := FfKaynakSicilKod;
end;

function TTableUretimTerminalMessage.GetfKaynakTarih: TField;
begin
  if FfKaynakTarih = nil then
    FfKaynakTarih := FindField('KAYNAKTARIH');
  Result := FfKaynakTarih;
end;

function TTableUretimTerminalMessage.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableUretimTerminalMessage.GetfNKod1: TField;
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  Result := FfNKod1;
end;

function TTableUretimTerminalMessage.GetfNKod2: TField;
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  Result := FfNKod2;
end;

function TTableUretimTerminalMessage.GetfNKod3: TField;
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  Result := FfNKod3;
end;

function TTableUretimTerminalMessage.GetfNKod4: TField;
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  Result := FfNKod4;
end;

function TTableUretimTerminalMessage.GetfNKod5: TField;
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  Result := FfNKod5;
end;

function TTableUretimTerminalMessage.GetfOkundu: TField;
begin
  if FfOkundu = nil then
    FfOkundu := FindField('OKUNDU');
  Result := FfOkundu;
end;

function TTableUretimTerminalMessage.GetfOperasyonNo: TField;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo;
end;

function TTableUretimTerminalMessage.GetfSeriNo: TField;
begin
  if FfSeriNo = nil then
    FfSeriNo := FindField('SERINO');
  Result := FfSeriNo;
end;

function TTableUretimTerminalMessage.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimTerminalMessage.GetfUretimNo: TField;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo;
end;

function TTableUretimTerminalMessage.GetfUretimSiraNo: TField;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo;
end;

function TTableUretimTerminalMessage.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableUretimTerminalMessage.SetAciklama1(const Value: String);
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  FfAciklama1.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetAciklama2(const Value: String);
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  FfAciklama2.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetAciklama3(const Value: String);
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  FfAciklama3.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetAciklama4(const Value: String);
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  FfAciklama4.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetAciklama5(const Value: String);
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  FfAciklama5.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimTerminalMessage.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimTerminalMessage.SetHedefIslemAd(const Value: String);
begin
  if FfHedefIslemAd = nil then
    FfHedefIslemAd := FindField('HEDEFISLEMAD');
  FfHedefIslemAd.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetHedefIslemNo(const Value: Integer);
begin
  if FfHedefIslemNo = nil then
    FfHedefIslemNo := FindField('HEDEFISLEMNO');
  FfHedefIslemNo.AsInteger := Value;
end;

procedure TTableUretimTerminalMessage.SetHedefOperatorKod(const Value: String);
begin
  if FfHedefOperatorKod = nil then
    FfHedefOperatorKod := FindField('HEDEFOPERATORKOD');
  FfHedefOperatorKod.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetHedefSaat(const Value: TDate);
begin
  if FfHedefSaat = nil then
    FfHedefSaat := FindField('HEDEFSAAT');
  FfHedefSaat.AsDateTime := Value;
end;

procedure TTableUretimTerminalMessage.SetHedefSicilKod(const Value: String);
begin
  if FfHedefSicilKod = nil then
    FfHedefSicilKod := FindField('HEDEFSICILKOD');
  FfHedefSicilKod.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetHedefTarih(const Value: TDate);
begin
  if FfHedefTarih = nil then
    FfHedefTarih := FindField('HEDEFTARIH');
  FfHedefTarih.AsDateTime := Value;
end;

procedure TTableUretimTerminalMessage.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimTerminalMessage.SetKaynakIslemAd(const Value: String);
begin
  if FfKaynakIslemAd = nil then
    FfKaynakIslemAd := FindField('KAYNAKISLEMAD');
  FfKaynakIslemAd.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetKaynakIslemNo(const Value: Integer);
begin
  if FfKaynakIslemNo = nil then
    FfKaynakIslemNo := FindField('KAYNAKISLEMNO');
  FfKaynakIslemNo.AsInteger := Value;
end;

procedure TTableUretimTerminalMessage.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetKaynakOperatorKod(const Value: String);
begin
  if FfKaynakOperatorKod = nil then
    FfKaynakOperatorKod := FindField('KAYNAKOPERATORKOD');
  FfKaynakOperatorKod.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetKaynakSaat(const Value: TDate);
begin
  if FfKaynakSaat = nil then
    FfKaynakSaat := FindField('KAYNAKSAAT');
  FfKaynakSaat.AsDateTime := Value;
end;

procedure TTableUretimTerminalMessage.SetKaynakSicilKod(const Value: String);
begin
  if FfKaynakSicilKod = nil then
    FfKaynakSicilKod := FindField('KAYNAKSICILKOD');
  FfKaynakSicilKod.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetKaynakTarih(const Value: TDate);
begin
  if FfKaynakTarih = nil then
    FfKaynakTarih := FindField('KAYNAKTARIH');
  FfKaynakTarih.AsDateTime := Value;
end;

procedure TTableUretimTerminalMessage.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetNKod1(const Value: Double);
begin
  if FfNKod1 = nil then
    FfNKod1 := FindField('NKOD1');
  FfNKod1.AsFloat := Value;
end;

procedure TTableUretimTerminalMessage.SetNKod2(const Value: Double);
begin
  if FfNKod2 = nil then
    FfNKod2 := FindField('NKOD2');
  FfNKod2.AsFloat := Value;
end;

procedure TTableUretimTerminalMessage.SetNKod3(const Value: Double);
begin
  if FfNKod3 = nil then
    FfNKod3 := FindField('NKOD3');
  FfNKod3.AsFloat := Value;
end;

procedure TTableUretimTerminalMessage.SetNKod4(const Value: Double);
begin
  if FfNKod4 = nil then
    FfNKod4 := FindField('NKOD4');
  FfNKod4.AsFloat := Value;
end;

procedure TTableUretimTerminalMessage.SetNKod5(const Value: Double);
begin
  if FfNKod5 = nil then
    FfNKod5 := FindField('NKOD5');
  FfNKod5.AsFloat := Value;
end;

procedure TTableUretimTerminalMessage.SetOkundu(const Value: Integer);
begin
  if FfOkundu = nil then
    FfOkundu := FindField('OKUNDU');
  FfOkundu.AsInteger := Value;
end;

procedure TTableUretimTerminalMessage.SetOperasyonNo(const Value: Integer);
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  FfOperasyonNo.AsInteger := Value;
end;

procedure TTableUretimTerminalMessage.SetSeriNo(const Value: String);
begin
  if FfSeriNo = nil then
    FfSeriNo := FindField('SERINO');
  FfSeriNo.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetUretimNo(const Value: String);
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  FfUretimNo.AsString := Value;
end;

procedure TTableUretimTerminalMessage.SetUretimSiraNo(const Value: Integer);
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  FfUretimSiraNo.AsInteger := Value;
end;

procedure TTableUretimTerminalMessage.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;

{ TableUretimRotaKaynaknot }

constructor TTableUretimRotaKaynakNot.Create(AOwner: TComponent);
begin
  inherited;
  Name := 'TTableUretimTerminalMalzemeTuketimBilgileri';
  TableItems.TableNames := 'URTRKN';
end;

procedure TTableUretimRotaKaynakNot.DoAfterOpen;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
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
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  inherited;
end;

procedure TTableUretimRotaKaynakNot.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAciklama := nil;
    FfAciklama1 := nil;
    FfAciklama2 := nil;
    FfAciklama3 := nil;
    FfAciklama4 := nil;
    FfAciklama5 := nil;
    FfDegistirenKaynak := nil;
    FfDegistirenKullanici := nil;
    FfDegistirenSaat := nil;
    FfDegistirenSurum := nil;
    FfDegistirenTarih := nil;
    FfEvrakNo := nil;
    FfEvrakTip := nil;
    FfGirenkaynak := nil;
    FfGirenKullanici := nil;
    FfGirenSaat := nil;
    FfGirenSurum := nil;
    FfGirenTarih := nil;
    FfID := nil;
    FfIslemNo := nil;
    FfIsMerkezKod := nil;
    FfKayitTur := nil;
    FfKaynakKod := nil;
    FfMamulKod := nil;
    FfOperasyonNo := nil;
    FfOperatorKod := nil;
    FfSiraNo := nil;
    FfSirketNo := nil;
    FfUretimNo := nil;
    FfUretimSiraNo := nil;
    FfVersiyonNo := nil;
  end;
  inherited;
end;

function TTableUretimRotaKaynakNot.GetAciklama: String;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama.AsString;
end;

function TTableUretimRotaKaynakNot.GetAciklama1: String;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1.AsString;
end;

function TTableUretimRotaKaynakNot.GetAciklama2: String;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2.AsString;
end;

function TTableUretimRotaKaynakNot.GetAciklama3: String;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3.AsString;
end;

function TTableUretimRotaKaynakNot.GetAciklama4: String;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4.AsString;
end;

function TTableUretimRotaKaynakNot.GetAciklama5: String;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5.AsString;
end;

function TTableUretimRotaKaynakNot.GetDegistirenKaynak: String;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak.AsString;
end;

function TTableUretimRotaKaynakNot.GetDegistirenKullanici: String;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici.AsString;
end;

function TTableUretimRotaKaynakNot.GetDegistirenSaat: TDate;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat.AsDateTime;
end;

function TTableUretimRotaKaynakNot.GetDegistirenSurum: String;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum.AsString;
end;

function TTableUretimRotaKaynakNot.GetDegistirenTarih: TDate;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih.AsDateTime;
end;

function TTableUretimRotaKaynakNot.GetEvrakNo: String;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo.AsString;
end;

function TTableUretimRotaKaynakNot.GetEvrakTip: Integer;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip.AsInteger;
end;

function TTableUretimRotaKaynakNot.GetGirenkaynak: String;
begin
  if FfGirenkaynak = nil then
    FfGirenkaynak := FindField('GIRENKAYNAK');
  Result := FfGirenkaynak.AsString;
end;

function TTableUretimRotaKaynakNot.GetGirenKullanici: String;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici.AsString;
end;

function TTableUretimRotaKaynakNot.GetGirenSaat: TDate;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat.AsDateTime;
end;

function TTableUretimRotaKaynakNot.GetGirenSurum: String;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum.AsString;
end;

function TTableUretimRotaKaynakNot.GetGirenTarih: TDate;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih.AsDateTime;
end;

function TTableUretimRotaKaynakNot.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimRotaKaynakNot.GetIslemNo: Integer;
begin
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  Result := FfIslemNo.AsInteger;
end;

function TTableUretimRotaKaynakNot.GetIsMerkezKod: String;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod.AsString;
end;

function TTableUretimRotaKaynakNot.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimRotaKaynakNot.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimRotaKaynakNot.GetMamulKod: String;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod.AsString;
end;

function TTableUretimRotaKaynakNot.GetOperasyonNo: Integer;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo.AsInteger;
end;

function TTableUretimRotaKaynakNot.GetOperatorKod: String;
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  Result := FfOperatorKod.AsString;
end;

function TTableUretimRotaKaynakNot.GetSiraNo: Integer;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo.AsInteger;
end;

function TTableUretimRotaKaynakNot.GetSirketNo: String;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo.AsString;
end;

function TTableUretimRotaKaynakNot.GetUretimNo: String;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo.AsString;
end;

function TTableUretimRotaKaynakNot.GetUretimSiraNo: Integer;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo.AsInteger;
end;

function TTableUretimRotaKaynakNot.GetVersiyonNo: String;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo.AsString;
end;

function TTableUretimRotaKaynakNot.GetfAciklama: TField;
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  Result := FfAciklama;
end;

function TTableUretimRotaKaynakNot.GetfAciklama1: TField;
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  Result := FfAciklama1;
end;

function TTableUretimRotaKaynakNot.GetfAciklama2: TField;
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  Result := FfAciklama2;
end;

function TTableUretimRotaKaynakNot.GetfAciklama3: TField;
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  Result := FfAciklama3;
end;

function TTableUretimRotaKaynakNot.GetfAciklama4: TField;
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  Result := FfAciklama4;
end;

function TTableUretimRotaKaynakNot.GetfAciklama5: TField;
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  Result := FfAciklama5;
end;

function TTableUretimRotaKaynakNot.GetfDegistirenKaynak: TField;
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  Result := FfDegistirenKaynak;
end;

function TTableUretimRotaKaynakNot.GetfDegistirenKullanici: TField;
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  Result := FfDegistirenKullanici;
end;

function TTableUretimRotaKaynakNot.GetfDegistirenSaat: TField;
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  Result := FfDegistirenSaat;
end;

function TTableUretimRotaKaynakNot.GetfDegistirenSurum: TField;
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  Result := FfDegistirenSurum;
end;

function TTableUretimRotaKaynakNot.GetfDegistirenTarih: TField;
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  Result := FfDegistirenTarih;
end;

function TTableUretimRotaKaynakNot.GetfEvrakNo: TField;
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  Result := FfEvrakNo;
end;

function TTableUretimRotaKaynakNot.GetfEvrakTip: TField;
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  Result := FfEvrakTip;
end;

function TTableUretimRotaKaynakNot.GetfGirenkaynak: TField;
begin
  if FfGirenkaynak = nil then
    FfGirenkaynak := FindField('GIRENKAYNAK');
  Result := FfGirenkaynak;
end;

function TTableUretimRotaKaynakNot.GetfGirenKullanici: TField;
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  Result := FfGirenKullanici;
end;

function TTableUretimRotaKaynakNot.GetfGirenSaat: TField;
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  Result := FfGirenSaat;
end;

function TTableUretimRotaKaynakNot.GetfGirenSurum: TField;
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  Result := FfGirenSurum;
end;

function TTableUretimRotaKaynakNot.GetfGirenTarih: TField;
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  Result := FfGirenTarih;
end;

function TTableUretimRotaKaynakNot.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimRotaKaynakNot.GetfIslemNo: TField;
begin
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  Result := FfIslemNo;
end;

function TTableUretimRotaKaynakNot.GetfIsMerkezKod: TField;
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  Result := FfIsMerkezKod;
end;

function TTableUretimRotaKaynakNot.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimRotaKaynakNot.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimRotaKaynakNot.GetfMamulKod: TField;
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  Result := FfMamulKod;
end;

function TTableUretimRotaKaynakNot.GetfOperasyonNo: TField;
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  Result := FfOperasyonNo;
end;

function TTableUretimRotaKaynakNot.GetfOperatorKod: TField;
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  Result := FfOperatorKod;
end;

function TTableUretimRotaKaynakNot.GetfSiraNo: TField;
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  Result := FfSiraNo;
end;

function TTableUretimRotaKaynakNot.GetfSirketNo: TField;
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  Result := FfSirketNo;
end;

function TTableUretimRotaKaynakNot.GetfUretimNo: TField;
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  Result := FfUretimNo;
end;

function TTableUretimRotaKaynakNot.GetfUretimSiraNo: TField;
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  Result := FfUretimSiraNo;
end;

function TTableUretimRotaKaynakNot.GetfVersiyonNo: TField;
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  Result := FfVersiyonNo;
end;

procedure TTableUretimRotaKaynakNot.SetAciklama(const Value: String);
begin
  if FfAciklama = nil then
    FfAciklama := FindField('ACIKLAMA');
  FfAciklama.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetAciklama1(const Value: String);
begin
  if FfAciklama1 = nil then
    FfAciklama1 := FindField('ACIKLAMA1');
  FfAciklama1.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetAciklama2(const Value: String);
begin
  if FfAciklama2 = nil then
    FfAciklama2 := FindField('ACIKLAMA2');
  FfAciklama2.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetAciklama3(const Value: String);
begin
  if FfAciklama3 = nil then
    FfAciklama3 := FindField('ACIKLAMA3');
  FfAciklama3.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetAciklama4(const Value: String);
begin
  if FfAciklama4 = nil then
    FfAciklama4 := FindField('ACIKLAMA4');
  FfAciklama4.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetAciklama5(const Value: String);
begin
  if FfAciklama5 = nil then
    FfAciklama5 := FindField('ACIKLAMA5');
  FfAciklama5.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetDegistirenKaynak(const Value: String);
begin
  if FfDegistirenKaynak = nil then
    FfDegistirenKaynak := FindField('DEGISTIRENKAYNAK');
  FfDegistirenKaynak.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetDegistirenKullanici(const Value: String);
begin
  if FfDegistirenKullanici = nil then
    FfDegistirenKullanici := FindField('DEGISTIRENKULLANICI');
  FfDegistirenKullanici.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetDegistirenSaat(const Value: TDate);
begin
  if FfDegistirenSaat = nil then
    FfDegistirenSaat := FindField('DEGISTIRENSAAT');
  FfDegistirenSaat.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakNot.SetDegistirenSurum(const Value: String);
begin
  if FfDegistirenSurum = nil then
    FfDegistirenSurum := FindField('DEGISTIRENSURUM');
  FfDegistirenSurum.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetDegistirenTarih(const Value: TDate);
begin
  if FfDegistirenTarih = nil then
    FfDegistirenTarih := FindField('DEGISTIRENTARIH');
  FfDegistirenTarih.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakNot.SetEvrakNo(const Value: String);
begin
  if FfEvrakNo = nil then
    FfEvrakNo := FindField('EVRAKNO');
  FfEvrakNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetEvrakTip(const Value: Integer);
begin
  if FfEvrakTip = nil then
    FfEvrakTip := FindField('EVRAKTIP');
  FfEvrakTip.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakNot.SetGirenkaynak(const Value: String);
begin
  if FfGirenkaynak = nil then
    FfGirenkaynak := FindField('GIRENKAYNAK');
  FfGirenkaynak.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetGirenKullanici(const Value: String);
begin
  if FfGirenKullanici = nil then
    FfGirenKullanici := FindField('GIRENKULLANICI');
  FfGirenKullanici.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetGirenSaat(const Value: TDate);
begin
  if FfGirenSaat = nil then
    FfGirenSaat := FindField('GIRENSAAT');
  FfGirenSaat.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakNot.SetGirenSurum(const Value: String);
begin
  if FfGirenSurum = nil then
    FfGirenSurum := FindField('GIRENSURUM');
  FfGirenSurum.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetGirenTarih(const Value: TDate);
begin
  if FfGirenTarih = nil then
    FfGirenTarih := FindField('GIRENTARIH');
  FfGirenTarih.AsDateTime := Value;
end;

procedure TTableUretimRotaKaynakNot.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakNot.SetIslemNo(const Value: Integer);
begin
  if FfIslemNo = nil then
    FfIslemNo := FindField('ISLEMNO');
  FfIslemNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakNot.SetIsMerkezKod(const Value: String);
begin
  if FfIsMerkezKod = nil then
    FfIsMerkezKod := FindField('ISMERKEZKOD');
  FfIsMerkezKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakNot.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetMamulKod(const Value: String);
begin
  if FfMamulKod = nil then
    FfMamulKod := FindField('MAMULKOD');
  FfMamulKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetOperasyonNo(const Value: Integer);
begin
  if FfOperasyonNo = nil then
    FfOperasyonNo := FindField('OPERASYONNO');
  FfOperasyonNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakNot.SetOperatorKod(const Value: String);
begin
  if FfOperatorKod = nil then
    FfOperatorKod := FindField('OPERATORKOD');
  FfOperatorKod.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetSiraNo(const Value: Integer);
begin
  if FfSiraNo = nil then
    FfSiraNo := FindField('SIRANO');
  FfSiraNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakNot.SetSirketNo(const Value: String);
begin
  if FfSirketNo = nil then
    FfSirketNo := FindField('SIRKETNO');
  FfSirketNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetUretimNo(const Value: String);
begin
  if FfUretimNo = nil then
    FfUretimNo := FindField('URETIMNO');
  FfUretimNo.AsString := Value;
end;

procedure TTableUretimRotaKaynakNot.SetUretimSiraNo(const Value: Integer);
begin
  if FfUretimSiraNo = nil then
    FfUretimSiraNo := FindField('URETIMSIRANO');
  FfUretimSiraNo.AsInteger := Value;
end;

procedure TTableUretimRotaKaynakNot.SetVersiyonNo(const Value: String);
begin
  if FfVersiyonNo = nil then
    FfVersiyonNo := FindField('VERSIYONNO');
  FfVersiyonNo.AsString := Value;
end;


end.

