unit CPMApp_DOPUretimTerminalVeriGiris;

interface

uses ComCtrls, Windows, Forms, Classes, SysUtils, Controls, Variants, DB, ExtCtrls,
  dxDockControl, dxDockPanel, dxBarExtItems,
  CPMApp_BOMConsts,
  CPMApp_SProductionConsts,
  CPMApp_SProductionStrs,
  CPMApp_DataObjectModel,
  CPMApp_DataObject,
  CPMApp_DataObjectDB,

  CPMApp_DocObjectModel,
  CPMApp_DocApp,
  CPMApp_DocChildVGrid,
  CPMApp_DocChildGrid,
  CPMApp_DocChildGridNote,
  CPMApp_DocChildSearchTable,

  CPMApp_TableBOMSystem,
  CPMApp_TableStokSystem,
  CPMApp_TableUretimSystem,
  CPMApp_TablePersonelSystem,
  CPMApp_TableUretimTempSystem,

  CPMApp_DocFormUretimTerminalSettings,
  CPMApp_DocChildUretimTerminalReports,
  CPMApp_DAPCustomUretimKart,
  CPMApp_DAPCustomUretimTerminalAyarlar,
  CPMApp_DOPCustomUretimTerminalVeriGiris,

  CPMApp_DocChildUretimTerminalKaynakList,
  CPMApp_DocChildUretimTerminalKaynakEvrakList,
  CPMApp_DocChildUretimTerminalKaynakIslem,
  CPMApp_DocChildUretimTerminalKaliteEvrakList,
  CPMApp_DocChildUretimTerminalKaliteIslem,
  CPMApp_DocChildUretimTerminalKaliteHMSecim,
  CPMApp_DocChildUretimTerminalReceteTuketim,
  CPMApp_DocChildUretimTerminalManualTuketim,
  CPMApp_DocChildTerminalRotaKaynakNot,
//  CPMApp_DataChildUretimTerminalMalzemeTuketimBilgileri,
  CPMApp_DocChildUretimTerminalMalzemeBilgileri,
  CPMApp_DocChildUretimTerminalKaynakDurus,
  CPMApp_DocChildUretimTerminalMalzemeDurus,
  CPMApp_DocChildUretimTerminalKaliteDurus,
  CPMApp_DocChildUretimTerminalProperties,
  CPMApp_DocChildUretimTerminalDolumBilgileri,
  CPMApp_DocChildUretimTerminalAmbalajBilgileri,
  CPMApp_DocChildUretimTerminalHMDegisim,
  CPMApp_DocChildUretimTerminalUyariSistem;

type
  TAppDOPUretimTerminalVeriGiris = class;
  TTerminalParametre_ReceteTuketim = class; // Reçete Tüketim Info Screen
  TTerminalParametre_KaynakIslem = class;
  TTerminalParametre_DurusBilgileri = class;

  TClassKaliteKontrol = class;

  TClassKaliteKontrol = class
    private
      FDop: TAppDOPUretimTerminalVeriGiris;
      FChildKaynakEvrakList: TAppDocChildUretimTerminalKaynakList;
      FChildKaliteEvrakList: TAppDocChildUretimTerminalKaliteEvrakList;
      FSourceChildName: String;
    protected
      constructor Create(AOwner: TAppDOPUretimTerminalVeriGiris);
    public
      procedure DoLoadParameters;
      procedure DoOpenDocument;
    published
      property SourceChildName: String read FSourceChildName write FSourceChildName;
  end;

  TTerminalTableIndex = class
  private
    FDataApp: TAppDAPCustomUretimKart;
    FOldIndeks_TableUretimRota: String;
    FOldIndeks_TableUretimRotaKaynak: String;
    FOldIndeks_TableUretimRotaKaynakIslem: String;
    FOldIndeks_TableUretimRotaKaynakOperasyon: String;

    FNewIndeks_TableUretimRota: String;
    FNewIndeks_TableUretimRotaKaynak: String;
    FNewIndeks_TableUretimRotaKaynakIslem: String;
    FNewIndeks_TableUretimRotaKaynakOperasyon: String;
  protected
    constructor Create(AOwner: TAppDAPCustomUretimKart);
  public
    property OldIndeks_TableUretimRota: String read FOldIndeks_TableUretimRota write FOldIndeks_TableUretimRota;
    property OldIndeks_TableUretimRotaKaynak: String read FOldIndeks_TableUretimRotaKaynak write FOldIndeks_TableUretimRotaKaynak;
    property OldIndeks_TableUretimRotaKaynakIslem: String read FOldIndeks_TableUretimRotaKaynakIslem write FOldIndeks_TableUretimRotaKaynakIslem;
    property OldIndeks_TableUretimRotaKaynakOperasyon: String read FOldIndeks_TableUretimRotaKaynakOperasyon write FOldIndeks_TableUretimRotaKaynakOperasyon;
    property NewIndeks_TableUretimRota: String read FNewIndeks_TableUretimRota write FNewIndeks_TableUretimRota;
    property NewIndeks_TableUretimRotaKaynak: String read FNewIndeks_TableUretimRotaKaynak write FNewIndeks_TableUretimRotaKaynak;
    property NewIndeks_TableUretimRotaKaynakIslem: String read FNewIndeks_TableUretimRotaKaynakIslem write FNewIndeks_TableUretimRotaKaynakIslem;
    property NewIndeks_TableUretimRotaKaynakOperasyon: String read FNewIndeks_TableUretimRotaKaynakOperasyon write FNewIndeks_TableUretimRotaKaynakOperasyon;
  end;

  TTerminalParametre = class
  private
    FDOP: TAppDOPUretimTerminalVeriGiris;
    FDataApp: TAppDAPCustomUretimKart;
    FKaynakIslem: TTerminalParametre_KaynakIslem;
    FClassKaliteKontrol: TClassKaliteKontrol;
    FReceteTuketim: TTerminalParametre_ReceteTuketim;
    FDurusBilgileri: TTerminalParametre_DurusBilgileri;

    FFirma: String;
  private
    FActiveChildName: String;
    FSirketNo: String;
    FEvrakNo: String;
    FEvrakTip: Integer;
    FUretimNo: String;
    FUretimSiraNo: Integer;
    FOperasyonNo: Smallint;
    FKaynakKod: String;
    FIslemNo: Integer;
  private
    FNotSecim: String;
  private
    FTerminalKod: String;
    FDuyuru: String;
    FSicilKod: String;
    FOperatorAd: String;
    FOperatorSoyad: String;
    FPlansizYukleme: Smallint;
    FKaynakAd: String;
    FCurrentOperatorKod: String;
    FCurrentIslemNo: Smallint;
    FCurrentIslemAciklama: String;
    FNextOperatorKod: String;
    FNextIslemNo: Smallint;
    FNextIslemAciklama: String;
    FOpIslemTip: Smallint;
    FOpIslemNo: Smallint;
    FOpIslemSiraNo: Smallint;
    fOpSonIslemNo: Smallint;
    FOpSiraNo: Smallint;
    FOpDurum: Smallint;
    FIsEmriSecim: Smallint;
    FFormParam: String;
    FOpBasTuketimTip: Integer;
    FOpBitTuketimTip: Integer;

    FOpDateSettings_DateType: Smallint;
    FOpDateSettings_Date: TDate;
    FOpDateSettings_Time: TTime;

    FOpOtomatikTuket: Boolean;

    FParamDurumGosterTip: Smallint;
    FParamOperatorGosterTip: Smallint;

    function GetEvrakUretimTarih: TDate;
    function GetEvrakUretimSaat: TDateTime;
    procedure ReadDateSettingsFromIniFile;
  protected
    constructor Create(AOwner: TAppDOPUretimTerminalVeriGiris);
  public
    FOpIslemList: Array of Integer;
    property DOP: TAppDOPUretimTerminalVeriGiris read FDOP write FDOP;
    property KaynakIslem: TTerminalParametre_KaynakIslem read FKaynakIslem write FKaynakIslem;
    property ClassKaliteKontrol: TClassKaliteKontrol read FClassKaliteKontrol write FClassKaliteKontrol;
    property ReceteTuketim: TTerminalParametre_ReceteTuketim read FReceteTuketim write FReceteTuketim;
    property DurusBilgileri: TTerminalParametre_DurusBilgileri read FDurusBilgileri write FDurusBilgileri;

  public
    property Firma: String read FFirma write FFirma;
    property ActiveChildName: String read FActiveChildName write FActiveChildName;
    property SirketNo: String read FSirketNo write FSirketNo;
    property EvrakNo: String read FEvrakNo write FEvrakNo;
    property EvrakTip: Integer read FEvrakTip write FEvrakTip;
    property UretimNo: String read FUretimNo write FUretimNo;
    property UretimSiraNo: Integer read FUretimSiraNo write FUretimSiraNo;
    property OperasyonNo: Smallint read FOperasyonNo write FOperasyonNo;
    property KaynakKod: String read FKaynakKod write FKaynakKod;
    property IslemNo: Integer read FIslemNo write FIslemNo;
  public
    property NotSecim: String read FNotSecim write FNotSecim;    
  public
    property TerminalKod: String read FTerminalKod write FTerminalKod;
    property Duyuru: String read FDuyuru write FDuyuru;
    property SicilKod: String read FSicilKod write FSicilKod;
    property OperatorAd: String read FOperatorAd write FOperatorAd;
    property OperatorSoyad: String read FOperatorSoyad write FOperatorSoyad;
    property PlansizYukleme: Smallint read FPlansizYukleme write FPlansizYukleme;
    property KaynakAd: String read FKaynakAd write FKaynakAd;
    property CurrentOperatorKod: String read FCurrentOperatorKod write FCurrentOperatorKod;
    property CurrentIslemNo: Smallint read FCurrentIslemNo write FCurrentIslemNo;
    property CurrentIslemAciklama: String read FCurrentIslemAciklama write FCurrentIslemAciklama;
    property NextOperatorKod: String read FNextOperatorKod write FNextOperatorKod;
    property NextIslemNo: Smallint read FNextIslemNo write FNextIslemNo;
    property NextIslemAciklama: String read FNextIslemAciklama write FNextIslemAciklama;
    property OpIslemTip: Smallint read FOpIslemTip write FOpIslemTip;
    property OpIslemNo: Smallint read FOpIslemNo write FOpIslemNo;
    property OpIslemSiraNo: Smallint read FOpIslemSiraNo write FOpIslemSiraNo;
    property OpSonIslemNo: Smallint read FOpSonIslemNo write FOpSonIslemNo;
    property OpSiraNo: Smallint read FOpSiraNo write FOpSiraNo;
    property OpDurum: Smallint read FOpDurum write FOpDurum;
    property IsEmriSecim: Smallint read FIsEmriSecim write FIsEmriSecim;
    property FormParam: String read FFormParam write FFormParam;
    property OpBasTuketimTip: Integer read FOpBasTuketimTip write FOpBasTuketimTip;
    property OpBitTuketimTip: Integer read FOpBitTuketimTip write FOpBitTuketimTip;

    property OpDateSettings_DateType: Smallint read FOpDateSettings_DateType write FOpDateSettings_DateType;
    property OpDateSettings_Date: TDate read FOpDateSettings_Date write FOpDateSettings_Date;
    property OpDateSettings_Time: TTime read FOpDateSettings_Time write FOpDateSettings_Time;
    property OpOtomatikTuket: Boolean read FOpOtomatikTuket write FOpOtomatikTuket;

    property ParamDurumGosterTip: Smallint read FParamDurumGosterTip write FParamDurumGosterTip;
    property ParamOperatorGosterTip: Smallint read FParamOperatorGosterTip write FParamOperatorGosterTip;

    property EvrakUretimTarih: TDate read GetEvrakUretimTarih;
    property EvrakUretimSaat: TDateTime read GetEvrakUretimSaat;
  end;

  TTerminalParametre_ReceteTuketim = class
  private
    FDataApp: TAppDAPCustomUretimKart;
  private
    FId: Integer;
    FHesapKod: String;
    FEvrakNo: String;
    FSiparisNo: String;
    FMalKod: String;
    FVersiyonNo: String;
    FBirim: String;
    FDepoKod: String;
    FSeriNo: String;
    FSiraNo: Integer;
    FSeriNo2: String;
    FEvrakMiktar: Double;
    FKullanilanMiktar: Double;
    FKalanMiktar: Double;
  public
    constructor Create(AOwner: TAppDAPCustomUretimKart);
  published
    property Id: Integer read FId write FId;
    property HesapKod: String read FHesapKod write FHesapKod;
    property EvrakNo: String read FEvrakNo write FEvrakNo;
    property SiparisNo: String read FSiparisNo write FSiparisNo;
    property MalKod: String read FMalKod write FMalKod;
    property VersiyonNo: String read FVersiyonNo write FVersiyonNo;
    property Birim: String read FBirim write FBirim;
    property DepoKod: String read FDepoKod write FDepoKod;
    property SeriNo: String read FSeriNo write FSeriNo;
    property SeriNo2: String read FSeriNo2 write FSeriNo2;
    property SiraNo: Integer read FSiraNo write FSiraNo;
    property EvrakMiktar: Double read FEvrakMiktar write FEvrakMiktar;
    property KullanilanMiktar: Double read FKullanilanMiktar write FKullanilanMiktar;
    property KalanMiktar: Double read FKalanMiktar write FKalanMiktar;
  end;

  TTerminalParametre_KaynakIslem = class
  private
    FDop: TAppDOPUretimTerminalVeriGiris;
    FDataApp: TAppDAPCustomUretimKart;
  private
    FIslemNo: Smallint;
    FAciklama: String;
    FIslemTip: Smallint;
    FOperatorKod: Smallint;
    FKurulumSureTip: Smallint;
    FCalismaSureTip: Smallint;
    FSokumSureTip: Smallint;
    FTuketimTip: Smallint;
    FAcikalam: String;
    FFirstIslemNo: Smallint;
    FLastIslemNo: Smallint;
  public
    procedure GetFirstLastIslemNo;
    constructor Create(AOwner: TAppDOPUretimTerminalVeriGiris);
  published
    property IslemNo: Smallint read FIslemNo write FIslemNo;
    property Aciklama: String read FAcikalam write FAciklama;
    property IslemTip: Smallint read FIslemTip write FIslemTip;
    property OperatorKod: Smallint read FOperatorKod write FOperatorKod;
    property KurulumSureTip: Smallint read FKurulumSureTip write FKurulumSureTip;
    property CalismaSureTip: Smallint read FCalismaSureTip write FCalismaSureTip;
    property SokumSureTip: Smallint read FSokumSureTip write FSokumSureTip;
    property TuketimTip: Smallint read FTuketimTip write FTuketimTip;
    property FirstIslemNo: Smallint read FFirstIslemNo write FFirstIslemNo;
    property LastIslemNo: Smallint read FLastIslemNo write FLastIslemNo;
  end;

  TTerminalParametre_DurusBilgileri = class
  private
    FDataApp: TAppDAPCustomUretimKart;
  private
    FIslemNo: Smallint;
    FDurusCommand: Smallint;
    FPressedOKButton: String;
    FReturnForm: String;
  public
    constructor Create(AOwner: TAppDAPCustomUretimKart);
  published
    property IslemNo: Smallint read FIslemNo write FIslemNo;
    property DurusCommand: Smallint read FDurusCommand write FDurusCommand;
    property PressedOKButton: string read FPressedOKButton write FPressedOKButton;
    property ReturnForm: string read FReturnForm write FReturnForm;
  end;

  TTerminalBarcode = class
  private
    FDataApp: TAppDAPCustomUretimKart;
  private
    FBarcodeCode: String;
    FBarcodeSeriNo: String;
    FBarcodeMenu: String;
    FBarcodeCalismaAyar: Smallint;
    FBarcodeMalKodAyar: Smallint;
    FBarcodeSeriNoAyar: Smallint;
    FBarcodeActiveChild: TAppDocChildSearchTable;
  protected
    constructor Create(AOwner: TAppDAPCustomUretimKart);
  public
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
    property BarcodeCode: String read FBarcodeCode write FBarcodeCode;
    property BarcodeSeriNo: String read FBarcodeSeriNo write FBarcodeSeriNo;
    property BarcodeMenu: String read FBarcodeMenu write FBarcodeMenu;
    property BarCodeCalismaAyar: Smallint read FBarCodeCalismaAyar write FBarCodeCalismaAyar;
    property BarcodeMalKodAyar: Smallint read FBarcodeMalKodAyar write FBarcodeMalKodAyar;
    property BarcodeSeriNoAyar: Smallint read FBarcodeSeriNoAyar write FBarcodeSeriNoAyar;
    property BarcodeActiveChild: TAppDocChildSearchTable read FBarcodeActiveChild write FBarcodeActiveChild;
  end;

  TAppDateEntryForm = class(TObject)
  private
    FDOP: TAppDOPUretimTerminalVeriGiris;
  private
    procedure CreateForm;
  protected
    constructor Create(Owner: TAppDOPUretimTerminalVeriGiris; const ShowDate: Boolean = true; const ShowTime: Boolean = true; const Caption: String = '');
  public
    property DOP: TAppDOPUretimTerminalVeriGiris read FDOP;
  end;

  TAppRuleUretimRota = class(TAppTableRule)
  private
    FDocApp: TAppDOPUretimTerminalVeriGiris;
  protected
    procedure DoAfterScroll(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDOPUretimTerminalVeriGiris);
  end;

  TAppDOPUretimTerminalVeriGiris = class(TAppDOPCustomUretimTerminalVeriGiris)
  private
    // Daps
//    baredSabitEvrakHareketTarih: TdxBarDateCombo;
    fDocCustomProperties: TAppDocChildUretimTerminalProperties;
    FDocFormSettings: TAppDocFormUretimTerminalSettings;
    AForm: TForm;

    // Class
    FTerminalParametre: TTerminalParametre;
    FTerminalTableIndex: TTerminalTableIndex;
    FTerminalBarcode: TTerminalBarcode;
    FAppDateForm: TAppDateEntryForm;
  // Childs
    FChildTerminalLogin: TAppDocChildGrid;
    FChildUretimTerminalGiris: TAppDocChildVGrid;
    FChildUretimTerminalListe: TAppDocChildGrid;
    FChildUretimKaynakList: TAppDocChildUretimTerminalKaynakList;
    FChildUretimTerminalKaliteEvrakList: TAppDocChildUretimTerminalKaliteEvrakList;
    FChildUretimTerminalKaliteYenidenIslemList: TAppDocChildUretimTerminalKaliteYenidenIslemList;
    FChildUretimTerminalKaliteYenidenIslemSecim: TAppDocChildUretimTerminalKaliteYenidenIslemSecim;
    FChildUretimTerminalKaliteHMSecimHareket: TAppDocChildUretimTerminalKaliteHMSecimHareket;

    FChildUretimTerminalReceteTuketim: TAppDocChildUretimTerminalReceteTuketim;

    FChildUretimTerminalKaliteHMSecimStepOne: TAppDocChildUretimTerminalKaliteHMSecimStepOne;
    FChildUretimTerminalKaliteHMSecimStepTwo: TAppDocChildUretimTerminalKaliteHMSecimStepTwo;
    FChildUretimTerminalReceteTuketimList: TAppDocChildUretimTerminalReceteTuketimList;
    FChildUretimTerminalManualTuketimStepOne: TAppDocChildUretimTerminalManualTuketimStepOne;
    FChildUretimTerminalManualTuketimStepTwo: TAppDocChildUretimTerminalManualTuketimStepTwo;
//    FChildUretimTerminalManualTuketimInfo: TAppDocChildGrid;
    FChildUretimTerminalMalzemeBilgileri: TAppDocChildUretimTerminalMalzemeBilgileri;
    FChildUretimTerminalMalzemeBilgileriGiris: TAppDocChildUretimTerminalMalzemeBilgileriGiris;

    FChildUretimTerminalHMDegisimStepOne: TAppDocChildUretimTerminalHMDegisimStepOne;
    FChildUretimTerminalUyariSistem: TAppDocChildUretimTerminalUyariSistem;

    FChildSearchMamulTalimat: TAppDocSearchChildMamulTalimat;

    FChildUretimSiparisHareket: TAppDocChildGrid;
    FChildUretimStokHareket: TAppDocChildGrid;
    FChildUretimEvrakBaslik: TAppDocChildVGrid;
    FChildUretimKart: TAppDocChildVGrid;
    FChildUretimRota: TAppDocChildGrid;
    FChildUretimRotaKaynak: TAppDocChildGrid;
    FChildUretimRotaKaynakNot: TAppDocChildTerminalRotaKaynakNot;
    FChildUretimKaynakIslem: TAppDocChildUretimTerminalKaynakIslem;
    FChildUretimKaynakIslemInfo: TAppDocChildVGrid;
    FChildUretimRotaKaynakIslem: TAppDocChildGrid;
    FChildUretimRotaKaynakOperasyon: TAppDocChildGrid;
    FChildUretimRotaKaynakDurus: TAppDocChildGrid;
    FChildUretimRotaKaynakHata: TAppDocChildGrid;
    FChildUretimKaynakEvrakList: TAppDocChildUretimTerminalKaynakEvrakList;
    FChildUretimDolumBilgileri: TAppDocChildUretimTerminalDolumBilgileri;
    FChildUretimAmbalajBilgileri: TAppDocChildUretimTerminalAmbalajBilgileri;
    FChildUretimTerminalDurusStepOne: TAppDocChildUretimTerminalDurusStepOne;
    FChildUretimTerminalDurusStepTwo: TAppDocChildUretimTerminalDurusStepTwo;
    FChildUretimTerminalHataKart: TAppDocChildUretimTerminalHataKart;
    FChildTerminalDurusIslemSecim: TAppDocChildTerminalDurusIslemSecim;

    FChildUretimTerminalMalzemeDurusStepOne: TAppDocChildUretimTerminalMalzemeDurusStepOne;
    FChildUretimTerminalMalzemeDurusStepTwo: TAppDocChildUretimTerminalMalzemeDurusStepTwo;
    FChildUretimTerminalMalzemeHataKart: TAppDocChildUretimTerminalMalzemeHataKart;

    FChildUretimTerminalKaliteDurusStepOne: TAppDocChildUretimTerminalKaliteDurusStepOne;
    FChildUretimTerminalKaliteDurusStepTwo: TAppDocChildUretimTerminalKaliteDurusStepTwo;

    FChildUretimTerminalReportDurusList: TAppDocChildUretimTerminalReportDurusList;

    // Rules
    FRuleUretimRota: TAppRuleUretimRota;
    // Events
    procedure LocateUretimRotaRecord;
    // Create Childs;
    procedure CreateChildTerminalLogin;
    procedure CreateChildUretimTerminalGiris;
    procedure CreateChildUretimTerminalListe;
    procedure CreateChildUretimKaynakList;
    procedure CreateChildUretimTerminalKaliteEvrakList;
    procedure CreateChildUretimTerminalKaliteHMSecim;
    procedure CreateChildUretimTerminalHMDegisim;
    procedure CreateChildUretimTerminalUyariSistem;
    procedure CreateChildUretimTerminalKaliteYenidenIslem;
    procedure CreateChildUretimTerminalKaliteYenidenIslemSecim;
    procedure CreateChildUretimTerminalKaliteHMSecimHareket;

    procedure CreateChildUretimEvrakBaslik;
    procedure CreateChildUretimKaynakEvrakList;
    procedure CreateChildUretimDolumBilgileri;
    procedure CreateChildUretimAmbalajBilgileri;
    procedure CreateChildUretimSiparisHareket;
    procedure CreateChildUretimStokHareket;
    procedure CreateChildUretimKaynakIslem;
    procedure CreateChildUretimKaynakIslemInfo;
    procedure CreateChildUretimKart;
    procedure CreateChildUretimRota;
    procedure CreateChildUretimRotaKaynak;
    procedure CreateChildUretimRotaKaynakNot;
    procedure CreateChildUretimRotaKaynakIslem;
    procedure CreateChildUretimRotaKaynakOperasyon;
    procedure CreateChildUretimRotaKaynakHata;
    procedure CreateChildUretimRotaKaynakDurus;

    procedure CreateChildUretimTerminalReceteTuketim;
    procedure CreateChildUretimTerminalReceteTuketimList;
    procedure CreateChildUretimTerminalManualTuketimStepOne;
    procedure CreateChildUretimTerminalManualTuketimStepTwo;
    procedure CreateChildUretimTerminalManualTuketimInfo;
    procedure CreateChildUretimTerminalMalzemeBilgileri;
    procedure CreateChildUretimTerminalMalzemeBilgileriGiris;

    procedure CreateChildUretimTerminalDurusStepOne;
    procedure CreateChildUretimTerminalDurusStepTwo;
    procedure CreateChildUretimTerminalHataKart;
    procedure CreateChildTerminalDurusIslemSecim;

    procedure CreateChildUretimTerminalMalzemeDurusStepOne;
    procedure CreateChildUretimTerminalMalzemeDurusStepTwo;
    procedure CreateChildUretimTerminalMalzemeHataKart;

    procedure CreateChildUretimTerminalKaliteDurusStepOne;
    procedure CreateChildUretimTerminalKaliteDurusStepTwo;

    procedure CreateChildUretimTerminalReportDurusList;

    procedure CreateChildSearchMamulTalimat;
    // Create Rules
    procedure CreateRules;
    procedure CreateObjects;
    procedure CreateForms;
    procedure ChildIsEmriGirisOnActivate(Sender:TdxCustomDockControl; Active: Boolean);
    procedure DoSetBarcodePosition(AChild: TAppDocChildSearchTable);
    procedure AddUyari;
    function GetLastIslemNo: Smallint;
    procedure DoTest;
  protected
    procedure CreateDocChilds; override;
    procedure CreateMenuItems; override;
    procedure SetReport; override;
    procedure SetDAPSecurity; override;
  public
    FPanelChildUretimKaynakIslemInfo: TPanel;
    procedure OnKeyPressBarcode1Text(Sender: TObject; var Key: Char);
    procedure OnKeyPressBarcode2Text(Sender: TObject; var Key: Char);
    procedure OnSetFocusBarcodeText(AChild: TAppDocChildSearchTable);
    procedure DoKeyPressBarcode1Text;
  public
    procedure LoadDocumentInformations;
  public
    function LoadManufactureOrderList(AKaynakKod: String): Boolean;
    procedure ChildUretimKaynakListOnDblClick(Sender: TObject);
    procedure ChildUretimKaynakListOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ChildUretimKaynakEvrakListOnDblClick(Sender: TObject);
    procedure DoOpenDocument;
    procedure DoLoadUserInfo(ATerminalKod, ASicilKod: String);
    procedure DoLoadKaynakList(ATerminalKod, ASicilKod: String);
    procedure DoLoadKaynakEvrakList;
    procedure DoCommand(CommandType: String);
    procedure DoStartOperasyon(const IslemNo: Integer = 0; const CheckIslemStatus: Boolean = true);
    procedure DoFinishOperasyon;
    procedure DoFinishOperasyon2(Miktar: Double; IslemNo: Integer; const CheckIslemStatus: Boolean = true);
    procedure DoChangeOperationStatus(ActiveOperationStatus: Smallint; const vDate: TDate = 19000101; const vTime: TDateTime = 19000101);
    procedure DoSaveNew(const ShowKaynakIslemChild: Boolean = true);
    procedure DoSaveTest;
    procedure DoFilterUretimSiparisHareket(SarfYontem: TAppSarfYontem; MekanikSarfYontem: TAppMekanikSarfYontem);
    procedure DoFinishDurus;
    procedure DoHMDegisim;
    procedure TranslationChanged; override;
    procedure ShowThisDockPanel(ADockPanel: String; const ShowOtherPanels: Boolean = false);
  public
    constructor Create(AOwner: TComponent; const aApplicationName: String); override;
    destructor Destroy; override;
  published
    property FormGlobal: TForm read AForm;
    property ChildTerminalLogin: TAppDocChildGrid read FChildTerminalLogin;
    property ChildUretimTerminalGiris: TAppDocChildVGrid read FChildUretimTerminalGiris;
    property ChildUretimTerminalListe: TAppDocChildGrid read FChildUretimTerminalListe;
    property ChildUretimKaynakEvrakList: TAppDocChildUretimTerminalKaynakEvrakList read FChildUretimKaynakEvrakList;
    property ChildUretimDolumBilgileri: TAppDocChildUretimTerminalDolumBilgileri read FChildUretimDolumBilgileri;
    property ChildUretimAmbalajBilgileri: TAppDocChildUretimTerminalAmbalajBilgileri read FChildUretimAmbalajBilgileri;
    property ChildUretimKaynakList: TAppDocChildUretimTerminalKaynakList read FChildUretimKaynakList;
    property ChildUretimTerminalKaliteEvrakList: TAppDocChildUretimTerminalKaliteEvrakList read FChildUretimTerminalKaliteEvrakList;
    property ChildUretimTerminalKaliteHMSecimStepOne: TAppDocChildUretimTerminalKaliteHMSecimStepOne read FChildUretimTerminalKaliteHMSecimStepOne;
    property ChildUretimTerminalKaliteHMSecimStepTwo: TAppDocChildUretimTerminalKaliteHMSecimStepTwo read FChildUretimTerminalKaliteHMSecimStepTwo;
    property ChildUretimTerminalHMDegisimStepOne: TAppDocChildUretimTerminalHMDegisimStepOne read FChildUretimTerminalHMDegisimStepOne;
    property ChildUretimTerminalUyariSistem: TAppDocChildUretimTerminalUyariSistem read FChildUretimTerminalUyariSistem;
    property ChildUretimTerminalKaliteYenidenIslemList: TAppDocChildUretimTerminalKaliteYenidenIslemList read FChildUretimTerminalKaliteYenidenIslemList;
    property ChildUretimTerminalKaliteYenidenIslemSecim: TAppDocChildUretimTerminalKaliteYenidenIslemSecim read FChildUretimTerminalKaliteYenidenIslemSecim;
    property ChildUretimTerminalKaliteHMSecimHareket: TAppDocChildUretimTerminalKaliteHMSecimHareket read FChildUretimTerminalKaliteHMSecimHareket;
    property ChildUretimRotaKaynakIslem: TAppDocChildGrid read FChildUretimRotaKaynakIslem;
    property ChildUretimRotaKaynakNot: TAppDocChildTerminalRotaKaynakNot read FChildUretimRotaKaynakNot;
    property ChildUretimKaynakIslem: TAppDocChildUretimTerminalKaynakIslem read FChildUretimKaynakIslem;
    property ChildUretimKaynakIslemInfo: TAppDocChildVGrid read FChildUretimKaynakIslemInfo;
    property ChildUretimRotaKaynakOperasyon: TAppDocChildGrid read FChildUretimRotaKaynakOperasyon;
    property ChildUretimRotaKaynakDurus: TAppDocChildGrid read FChildUretimRotaKaynakDurus;
    property ChildUretimTerminalReceteTuketim: TAppDocChildUretimTerminalReceteTuketim read FChildUretimTerminalReceteTuketim;
    property ChildUretimTerminalReceteTuketimList: TAppDocChildUretimTerminalReceteTuketimList read FChildUretimTerminalReceteTuketimList;
    property ChildUretimTerminalManualTuketimStepOne: TAppDocChildUretimTerminalManualTuketimStepOne read FChildUretimTerminalManualTuketimStepOne;
    property ChildUretimTerminalManualTuketimStepTwo: TAppDocChildUretimTerminalManualTuketimStepTwo read FChildUretimTerminalManualTuketimStepTwo;
//    property ChildUretimTerminalManualTuketimInfo: TAppDocChildGrid read  FChildUretimTerminalManualTuketimInfo;
    property ChildUretimTerminalDurusStepOne: TAppDocChildUretimTerminalDurusStepOne read FChildUretimTerminalDurusStepOne;
    property ChildUretimTerminalDurusStepTwo: TAppDocChildUretimTerminalDurusStepTwo read FChildUretimTerminalDurusStepTwo;
    property ChildUretimTerminalHataKart: TAppDocChildUretimTerminalHataKart read FChildUretimTerminalHataKart;
    property ChildTerminalDurusIslemSecim: TAppDocChildTerminalDurusIslemSecim read FChildTerminalDurusIslemSecim;


    property ChildUretimTerminalMalzemeDurusStepOne: TAppDocChildUretimTerminalMalzemeDurusStepOne read FChildUretimTerminalMalzemeDurusStepOne;
    property ChildUretimTerminalMalzemeDurusStepTwo: TAppDocChildUretimTerminalMalzemeDurusStepTwo read FChildUretimTerminalMalzemeDurusStepTwo;
    property ChildUretimTerminalMalzemeHataKart: TAppDocChildUretimTerminalMalzemeHataKart read FChildUretimTerminalMalzemeHataKart;

    property ChildUretimTerminalKaliteDurusStepOne: TAppDocChildUretimTerminalKaliteDurusStepOne read FChildUretimTerminalKaliteDurusStepOne;
    property ChildUretimTerminalKaliteDurusStepTwo: TAppDocChildUretimTerminalKaliteDurusStepTwo read FChildUretimTerminalKaliteDurusStepTwo;

    property TerminalParametre: TTerminalParametre read FTerminalParametre write FTerminalParametre;
    property TerminalTableIndex: TTerminalTableIndex read FTerminalTableIndex write FTerminalTableIndex;
    property TerminalBarcode: TTerminalBarcode read FTerminalBarcode write FTerminalBarcode;
    property AppDateForm: TAppDateEntryForm read FAppDateForm;
    property DocCustomProperties: TAppDocChildUretimTerminalProperties read fDocCustomProperties write fDocCustomProperties;
    property DocFormSettings: TAppDocFormUretimTerminalSettings read FDocFormSettings write FDocFormSettings;
    property ChildUretimTerminalMalzemeBilgileri: TAppDocChildUretimTerminalMalzemeBilgileri read FChildUretimTerminalMalzemeBilgileri write FChildUretimTerminalMalzemeBilgileri;
    property ChildUretimTerminalMalzemeBilgileriGiris: TAppDocChildUretimTerminalMalzemeBilgileriGiris read FChildUretimTerminalMalzemeBilgileriGiris write FChildUretimTerminalMalzemeBilgileriGiris;

    property ChildUretimTerminalReportDurusList: TAppDocChildUretimTerminalReportDurusList read FChildUretimTerminalReportDurusList write FChildUretimTerminalReportDurusList;

    property ChildSearchMamulTalimat: TAppDocSearchChildMamulTalimat read FChildSearchMamulTalimat write FChildSearchMamulTalimat;
  end;

implementation

uses
  cxTextEdit, Graphics,
  ShellApi, dxBar, ActnList, Dialogs,
  IniFiles, DateUtils,
  CPMApp_DocMainForm, CPMApp_Images, CPMApp_Dialogs, CPMApp_Date, CPMApp_TableItems,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_DocFormUretimTerminalNumPad,
  CPMApp_StrUtils, CPMApp_DataChildUretimRotaKaynakIslem;

const
  gcGiris: Integer = 0;
  gcCikis: Integer = 1;

  okDepo: String = 'DEP';
  okUretim: String = 'URT';
  okKalite: String = 'KAL';

  itOperasyon: Smallint = 0;
  itHammaddeTuketim: Smallint = 1;
  itKaliteKontrol: Smallint = 2;

{ TAppDOPUretimTerminalVeriGiris }

procedure TAppDOPUretimTerminalVeriGiris.LocateUretimRotaRecord;
var
  aKaynakKod: String;
  aOperasyonNo: Integer;
var
  ARange: array [0..2] of Variant;
begin
  LoadDocumentInformations;

  DataApp.UretimRota.Table.IndexFieldNames := TerminalTableIndex.NewIndeks_TableUretimRota;
  DataApp.UretimRota.Table.SetRange([TerminalParametre.OperasyonNo], [TerminalParametre.OperasyonNo]);

  ARange[0] := TerminalParametre.OperasyonNo;
  ARange[1] := TerminalParametre.KaynakKod;
  ARange[2] := 1;

  DataApp.UretimRotaKaynak.Table.IndexFieldNames := TerminalTableIndex.NewIndeks_TableUretimRotaKaynak;
//  DataApp.UretimRotaKaynak.Table.SetRange([ARange], [ARange]);
  DataApp.UretimRotaKaynak.Table.SetRange([TerminalParametre.OperasyonNo, TerminalParametre.KaynakKod, 1], [TerminalParametre.OperasyonNo, TerminalParametre.KaynakKod, 1]);

  Exit;

  TerminalParametre.KaynakKod := FChildUretimKaynakList.Table.FieldValues['KAYNAKKOD'];
  TerminalParametre.OperasyonNo := FChildUretimKaynakEvrakList.Table.FieldValues['OPERASYONNO'];;

  aKaynakKod := FChildUretimKaynakList.Table.FieldValues['KAYNAKKOD'];
  aOperasyonNo := FChildUretimKaynakEvrakList.Table.FieldValues['OPERASYONNO'];


  if DataApp.UretimRota.Table.Locate('OPERASYONNO', AOperasyonNo, []) then
    if DataApp.UretimRotaKaynak.Table.Locate('KAYNAKKOD', AKaynakKod, []) then
    begin
//      FChildUretimTerminalGiris.ShowChild;
      DataApp.UretimRotaKaynakOperasyon.Table.Last;
    end;
end;

procedure TAppDOPUretimTerminalVeriGiris.ChildIsEmriGirisOnActivate(
  Sender: TdxCustomDockControl; Active: Boolean);
begin
  inherited;
  TerminalParametre.OperatorAd := ChildUretimKaynakList.Table.FieldByName('PERKRT_AD').AsString;
  TerminalParametre.OperatorSoyad := ChildUretimKaynakList.Table.FieldValues['PERKRT_SOYAD'];
  TerminalParametre.KaynakKod := ChildUretimKaynakList.Table.FieldValues['KAYNAKKOD'];
  TerminalParametre.KaynakAd := ChildUretimKaynakList.Table.FieldValues['URTKYN_KAYNAKAD'];

//  TAppDocFormUretimTerminalMenu(AForm).Information_LabelOperator.Caption := TerminalParametre.OperatorAd + ' ' + TerminalParametre.OperatorSoyad;
  TAppDocFormUretimTerminalMenu(AForm).Information_LabelKaynak.Caption := TerminalParametre.KaynakKod + ' - ' + TerminalParametre.KaynakAd;
end;

procedure TAppDOPUretimTerminalVeriGiris.DoLoadKaynakEvrakList;
begin
  TerminalParametre.IsEmriSecim := FChildUretimKaynakList.Table.FieldByName('ISEMRISECIM').AsInteger;
  FChildUretimKaynakEvrakList.DoRun;

  if FChildUretimKaynakEvrakList.Table.IsEmpty then
  begin
    DocCustomProperties.AppForms.AppFormMessageDialog('Üretim için bekleyen herhangi bir İş Emri bulunamadı!');
    Exit;
  end;

  if TerminalParametre.IsEmriSecim = iesManual then
    ShowThisDockPanel(FChildUretimKaynakEvrakList.DockPanel.Name)
  else
  if TerminalParametre.IsEmriSecim = iesOtomatik then
  begin
    FChildUretimKaynakEvrakList.Table.First;
    DoOpenDocument;
    FChildUretimKaynakIslem.DoRun;
    ShowThisDockPanel(FChildUretimKaynakIslem.DockPanel.Name, true);
  end;
end;

procedure TAppDOPUretimTerminalVeriGiris.DoOpenDocument;
begin
  DataApp.UretimRota.Table.IndexFieldNames := TerminalTableIndex.OldIndeks_TableUretimRota;
  DataApp.UretimRotaKaynak.Table.IndexFieldNames := TerminalTableIndex.OldIndeks_TableUretimRotaKaynak;
  DataApp.UretimRotaKaynakIslem.Table.IndexFieldNames := TerminalTableIndex.OldIndeks_TableUretimRotaKaynakIslem;

//  DataApp.UretimRotaKaynak.Table.IndexFieldNames := TerminalTableIndex.NewIndeks_TableUretimRotaKaynak;
//  DataApp.UretimRotaKaynak.Table.SetRange([TerminalParametre.OperasyonNo, TerminalParametre.KaynakKod, 1], [TerminalParametre.OperasyonNo, TerminalParametre.KaynakKod, 1]);

  DataApp.DataObject.OptionsKey.KeyValues['SIRKETNO'] := FChildUretimKaynakEvrakList.Table.FieldValues['SIRKETNO'];
  DataApp.DataObject.OptionsKey.KeyValues['EVRAKTIP'] := FChildUretimKaynakEvrakList.Table.FieldValues['EVRAKTIP'];
  DataApp.DataObject.OptionsKey.KeyValues['EVRAKNO'] := FChildUretimKaynakEvrakList.Table.FieldValues['EVRAKNO'];
  DataApp.DataObject.Open;

  LocateUretimRotaRecord;
//  FChildUretimKaynakIslem.DoRun; //Veysel Yeni Kaldırdım
//  FChildUretimKaynakIslem.DoRun(DataApp.UretimRota.Table.EvrakNo, DataApp.UretimRota.Table.UretimNo, DataApp.UretimRota.Table.UretimSiraNo, DataApp.UretimRota.Table.OperasyonNo, FChildUretimKaynakList.Table.FieldValues['KAYNAKKOD']);
end;

procedure TAppDOPUretimTerminalVeriGiris.ChildUretimKaynakEvrakListOnDblClick(Sender: TObject);
begin
  DoOpenDocument;
  FChildUretimKaynakIslem.DoRun;
//  ShowThisDockPanel(FChildUretimKaynakIslemInfo.DockPanel.Name);
  ShowThisDockPanel(FChildUretimKaynakIslem.DockPanel.Name);
end;

procedure TAppDOPUretimTerminalVeriGiris.ChildUretimKaynakListOnDblClick(Sender: TObject);
begin
  TerminalParametre.OperatorAd := ChildUretimKaynakList.Table.FieldByName('PERKRT_AD').AsString;
  TerminalParametre.OperatorSoyad := ChildUretimKaynakList.Table.FieldValues['PERKRT_SOYAD'];
  TerminalParametre.KaynakKod := ChildUretimKaynakList.Table.FieldValues['KAYNAKKOD'];
  TerminalParametre.KaynakAd := ChildUretimKaynakList.Table.FieldValues['URTKYN_KAYNAKAD'];
  TerminalParametre.OpBasTuketimTip := ChildUretimKaynakList.Table.FieldValues['OPBASTUKETIMTIP'];
  TerminalParametre.OpBitTuketimTip := ChildUretimKaynakList.Table.FieldValues['OPBITTUKETIMTIP'];

  if LoadManufactureOrderList(TerminalParametre.KaynakKod) then
  begin
    ShowThisDockPanel(ChildUretimKaynakEvrakList.DockPanel.Name);
    DoLoadKaynakEvrakList;
  end;
end;

procedure TAppDOPUretimTerminalVeriGiris.DoKeyPressBarcode1Text;
begin
  if Copy(TerminalBarcode.BarcodeCode, 1, 3) = 'XWO' then
  begin
    if Length(TerminalBarcode.BarcodeCode) > 3 then
      TerminalBarcode.BarcodeCode := Copy(TerminalBarcode.BarcodeCode, 4, Length(TerminalBarcode.BarcodeCode))
    else
      TerminalBarcode.BarcodeCode := '';
    ShowThisDockPanel(ChildUretimKaynakEvrakList.DockPanel.Name);
    TAppDocFormUretimTerminalMenu(AForm).edtBarcode1.Text := TerminalBarcode.BarcodeCode;
    DoKeyPressBarcode1Text;
  end
  else
  if TerminalBarcode.BarcodeCode = 'XEX' then // Logoff
    ShowThisDockPanel(ChildTerminalLogin.DockPanel.Name)
  else
  if TerminalBarcode.BarcodeActiveChild = ChildUretimKaynakEvrakList then
    ChildUretimKaynakEvrakList.OnKeyPressBarcodeText
  else
  if TerminalBarcode.BarcodeActiveChild = ChildUretimKaynakIslem then
    ChildUretimKaynakIslem.OnKeyPressBarcodeText
  else
  if TerminalBarcode.BarcodeActiveChild = ChildUretimTerminalReceteTuketim then
    TAppDocFormUretimTerminalMenu(AForm).edtBarcode2.SetFocus;

end;
procedure TAppDOPUretimTerminalVeriGiris.OnKeyPressBarcode1Text(Sender: TObject; var Key: Char);
begin
  TerminalBarcode.BarcodeCode := TAppDocFormUretimTerminalMenu(AForm).edtBarcode1.Text;
  if TerminalBarcode.BarcodeCode = '' then
    exit;

  if key = #13 then
  begin
    DoKeyPressBarcode1Text;
  end;
end;

procedure TAppDOPUretimTerminalVeriGiris.OnKeyPressBarcode2Text(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    TerminalBarcode.BarcodeCode := TAppDocFormUretimTerminalMenu(AForm).edtBarcode1.Text;
    TerminalBarcode.BarcodeSeriNo := TAppDocFormUretimTerminalMenu(AForm).edtBarcode2.Text;
    TerminalBarcode.BarcodeMenu := 'MALKOD';
    ChildUretimTerminalReceteTuketim.LocateBarcodeRecord;
//    if TerminalBarcode.BarCodeCalismaAyar = 1 then
//      OnSetFocusBarcodeText(ChildUretimTerminalReceteTuketim);
  end;
end;

procedure TAppDOPUretimTerminalVeriGiris.OnSetFocusBarcodeText(AChild: TAppDocChildSearchTable);
begin
  TAppDocFormUretimTerminalMenu(AForm).Information_Barcode.Parent := AChild.Form;
  TAppDocFormUretimTerminalMenu(AForm).edtBarcode1.Clear;
  TAppDocFormUretimTerminalMenu(AForm).edtBarcode1.SetFocus;

  if AChild = ChildUretimTerminalReceteTuketim then
  begin
    TAppDocFormUretimTerminalMenu(AForm).Panel_Barcode2.Visible := true;
    TAppDocFormUretimTerminalMenu(AForm).edtBarcode2.Clear;
  end;
end;


procedure TAppDOPUretimTerminalVeriGiris.DoSetBarcodePosition(AChild: TAppDocChildSearchTable);
begin
  TerminalBarcode.BarcodeActiveChild := AChild;

  TAppDocFormUretimTerminalMenu(AForm).Information_Barcode.Parent := AChild.Form;
  TAppDocFormUretimTerminalMenu(AForm).edtBarcode1.Clear;
  TAppDocFormUretimTerminalMenu(AForm).edtBarcode1.SetFocus;
  TAppDocFormUretimTerminalMenu(AForm).Panel_Barcode2.Visible := false;
  TAppDocFormUretimTerminalMenu(AForm).edtBarcode1.OnKeyPress := OnKeyPressBarcode1Text;

  if AChild = ChildUretimTerminalReceteTuketim then
  begin
    TAppDocFormUretimTerminalMenu(AForm).Panel_Barcode2.Visible := true;
    TAppDocFormUretimTerminalMenu(AForm).edtBarcode2.Clear;
    TAppDocFormUretimTerminalMenu(AForm).edtBarcode2.OnKeyPress := OnKeyPressBarcode2Text;
  end;
end;

procedure TAppDOPUretimTerminalVeriGiris.LoadDocumentInformations;
begin
  if TerminalParametre.ActiveChildName = ChildUretimKaynakEvrakList.DockPanel.Name then
  begin
    TerminalParametre.EvrakNo := ChildUretimKaynakEvrakList.Table.FieldValues['EVRAKNO'];
    TerminalParametre.UretimNo := ChildUretimKaynakEvrakList.Table.FieldValues['URETIMNO'];
    TerminalParametre.UretimSiraNo := ChildUretimKaynakEvrakList.Table.FieldValues['URETIMSIRANO'];
    TerminalParametre.OperasyonNo := ChildUretimKaynakEvrakList.Table.FieldValues['OPERASYONNO'];
    TerminalParametre.KaynakKod := ChildUretimKaynakEvrakList.Table.FieldValues['KAYNAKKOD'];
  end;

  if TerminalParametre.ActiveChildName = ChildUretimKaynakIslem.DockPanel.Name then
  begin
    TerminalParametre.IslemNo := ChildUretimKaynakIslem.Table.FieldValues['ISLEMNO'];
  end;
end;

procedure TAppDOPUretimTerminalVeriGiris.ShowThisDockPanel(ADockPanel: String; const ShowOtherPanels: Boolean = false);
var I: Integer;
begin
  DocObject.MainForm.Enabled := false;
  for I := 0 to DocObject.MainForm.ComponentCount -1 do
  begin
    if DocObject.MainForm.Components[I].ClassType = TdxDockPanel then
    begin
      if TdxDockPanel(DocObject.MainForm.Components[I]).Name = ADockPanel then
        TdxDockPanel(DocObject.MainForm.Components[I]).Visible := true
      else if not ShowOtherPanels then
        TdxDockPanel(DocObject.MainForm.Components[I]).Visible := false;
    end;
  end;
  FPanelChildUretimKaynakIslemInfo.Visible := true;
  DocObject.MainForm.Enabled := true;

  { Begin - Aktif Child'ı alıyoruz }
  TerminalParametre.ActiveChildName := ADockPanel;
  { End - Aktif Child'ı alıyoruz }

  if ADockPanel = ChildUretimKaynakEvrakList.DockPanel.Name then
  begin
    FPanelChildUretimKaynakIslemInfo.Visible := false;
    DoSetBarcodePosition(ChildUretimKaynakEvrakList);
  end;

//  if ADockPanel = ChildUretimTerminalUyariSistem .DockPanel.Name then
//    FPanelChildUretimKaynakIslemInfo.Visible := false;

  if ADockPanel = ChildUretimTerminalKaliteEvrakList.DockPanel.Name then
    FPanelChildUretimKaynakIslemInfo.Visible := false;

  if ADockPanel = ChildUretimTerminalKaliteHMSecimStepOne.DockPanel.Name then
    FPanelChildUretimKaynakIslemInfo.Visible := false;

  if ADockPanel = ChildUretimTerminalKaliteHMSecimHareket.DockPanel.Name then
    FPanelChildUretimKaynakIslemInfo.Visible := false;

  if ADockPanel = ChildUretimTerminalKaliteHMSecimStepTwo.DockPanel.Name then
    FPanelChildUretimKaynakIslemInfo.Visible := false;

  if ADockPanel = ChildUretimTerminalKaliteYenidenIslemSecim.DockPanel.Name then
    FPanelChildUretimKaynakIslemInfo.Visible := false;

  if ADockPanel = ChildUretimTerminalKaliteYenidenIslemList.DockPanel.Name then
    FPanelChildUretimKaynakIslemInfo.Visible := false;

  if ADockPanel = ChildUretimTerminalReceteTuketim.DockPanel.Name then
    DoSetBarcodePosition(ChildUretimTerminalReceteTuketim);

  if ADockPanel = ChildUretimKaynakList.DockPanel.Name then
    FPanelChildUretimKaynakIslemInfo.Visible := false;

  if ADockPanel = ChildUretimKaynakIslem.DockPanel.Name then
  begin
    ChildSearchMamulTalimat.DoRun;
    ChildSearchMamulTalimat.DockPanel.Visible := true;

    ChildUretimKaynakIslem.DoRun;

    DoSetBarcodePosition(ChildUretimKaynakIslem);

    if TerminalParametre.OpDateSettings_DateType = DateSettings_DateType_Otomatik then
      TAppDocFormUretimTerminalMenu(AForm).Information_LabelKaynak.Caption := 'Otomatik Tarih : ' + DateToStr(Date);
    if TerminalParametre.OpDateSettings_DateType = DateSettings_DateType_TarihSor then
      TAppDocFormUretimTerminalMenu(AForm).Information_LabelKaynak.Caption := 'Tarih Bilgisini Sor';
    if TerminalParametre.OpDateSettings_DateType = DateSettings_DateType_SabitTarih then
      TAppDocFormUretimTerminalMenu(AForm).Information_LabelKaynak.Caption := 'Sabit Tarih : ' + DateToStr(TerminalParametre.OpDateSettings_Date);
  end;

  if ADockPanel = ChildTerminalLogin.DockPanel.Name then
  begin
    FPanelChildUretimKaynakIslemInfo.Visible := false;
    TAppDocFormUretimTerminalMenu(AForm).edSicilNo.Clear;
    TAppDocFormUretimTerminalMenu(AForm).edSicilNo.SetFocus;
  end;
end;

function TAppDOPUretimTerminalVeriGiris.LoadManufactureOrderList(AKaynakKod: String): Boolean;
var aSQLStr: String;
begin
//  aSQLStr := Format('URTROK.KAYNAKKOD = ''%s'' And URTROK.OPDURUM In (%d, %d, %d)', [AKaynakKod, odReleased, odStarted, odPaused]);
  aSQLStr := Format('URTROK.KAYNAKKOD = ''%s'' AND URTROK.KULLANILAN = 1', [AKaynakKod]);

  FChildUretimKaynakEvrakList.Table.Close;
  FChildUretimKaynakEvrakList.Table.TableItems[0].Where.Clear;
  FChildUretimKaynakEvrakList.Table.TableItems[0].Where.AddText(aSQLStr, 'wcFilterOrderList');
  FChildUretimKaynakEvrakList.Table.Open;
  FChildUretimKaynakEvrakList.DoRun;

  if FChildUretimKaynakEvrakList.Table.IsEmpty then
    begin
      DocCustomProperties.AppForms.AppFormMessageDialog(Format('%s - %s Kaynağında Serbet Bırakılmış / Başlamış İş Emri Bilgisi Bulunamadı!', [AKaynakKod, ChildUretimKaynakList.Table.FieldValues['URTKYN_KAYNAKAD']]));
      Result := false;
    end
  else
    Result := true;
end;

procedure TAppDOPUretimTerminalVeriGiris.DoLoadUserInfo(ATerminalKod, ASicilKod: String);
var aSQLStr: String;
begin
  aSQLStr := '';
  aSQLStr := aSQLStr + Format(' TERMINALKOD = ''%s'' And URTTEK.SICILKOD = ''%s''', [ATerminalKod, TerminalParametre.SicilKod]);

  ChildUretimKaynakList.Table.Close;
  ChildUretimKaynakList.Table.TableItems[0].Where.Clear;
  ChildUretimKaynakList.Table.TableItems[0].Where.AddText(aSQLStr, 'wcFilterUser');
  ChildUretimKaynakList.Table.Open;
end;

procedure TAppDOPUretimTerminalVeriGiris.DoLoadKaynakList(ATerminalKod, ASicilKod: String);
var aSQLStr: String;
begin
  aSQLStr := '';
  aSQLStr := aSQLStr + Format(' TERMINALKOD = ''%s'' And URTTEK.SICILKOD = ''%s''', [ATerminalKod, TerminalParametre.SicilKod]);
  aSQLStr := aSQLStr + Format(' AND (SELECT COUNT(OPDURUM) FROM URTROK WHERE URTROK.KAYNAKKOD = URTTEK.KAYNAKKOD And URTROK.OPDURUM In (%d, %d)) > 0', [odReleased, odStarted]);
//  aSQLStr := aSQLStr + ' AND URTTEK.KAYNAKKOD In (SELECT URTROK.KAYNAKKOD FROM dbo.URTROK WITH (NOLOCK) LEFT OUTER JOIN dbo.URTKRT WITH (NOLOCK) ON (  URTKRT.SIRKETNO = URTROK.SIRKETNO ';
//  aSQLStr := aSQLStr + ' AND URTKRT.EVRAKNO = URTROK.EVRAKNO AND URTKRT.EVRAKTIP = URTROK.EVRAKTIP ) LEFT OUTER JOIN dbo.STKKRT WITH (NOLOCK) ON (  STKKRT.SIRKETNO = URTROK.SIRKETNO AND ';
//  aSQLStr := aSQLStr + ' STKKRT.MALKOD = URTROK.MAMULKOD ) LEFT OUTER JOIN dbo.URTKYN WITH (NOLOCK) ON (  URTKYN.KAYNAKKOD = URTROK.KAYNAKKOD ) WHERE URTROK.KULLANILAN = 1 AND ';
//  aSQLStr := aSQLStr + ' URTKRT.URETIMDURUM IN (2) Group By URTROK.KAYNAKKOD)';

  ChildUretimKaynakList.Table.Close;
  ChildUretimKaynakList.Table.TableItems[0].Where.Clear;
  ChildUretimKaynakList.Table.TableItems[0].Where.AddText(aSQLStr, 'wcFilterKaynak');
  ChildUretimKaynakList.Table.Open;
end;

procedure TAppDOPUretimTerminalVeriGiris.ChildUretimKaynakListOnKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
begin
end;

constructor TAppDOPUretimTerminalVeriGiris.Create(AOwner: TComponent;
  const aApplicationName: String);
begin
  inherited;
  DocCustomProperties := TAppDocChildUretimTerminalProperties.Create;
  DocCustomProperties.DocApp := Self;
  DocCustomProperties.DataApp := DataApp;

  DocCustomProperties.AppForms.DocApp := Self;
  DocCustomProperties.AppForms.DataApp := DataApp;

  DocFormSettings := TAppDocFormUretimTerminalSettings.Create(Self);

end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildTerminalLogin;
begin
  FChildTerminalLogin := DocObject.CreateChild(TAppDocChildGrid, 'ChildFormTerminalLoginMenu') as TAppDocChildGrid;
  FChildTerminalLogin.Caption := 'Giriş';
  FChildTerminalLogin.TableObject := DataApp.UretimRota.Table;

  DocObject.Macros.AddObject(FChildTerminalLogin, 'ChildFormLogin');
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalGiris;
begin
  FChildUretimTerminalGiris := DocObject.CreateChild(TAppDocChildVGrid, 'ChildUretimTerminalGiris') as TAppDocChildVGrid;
  FChildUretimTerminalGiris.Caption := 'Veri Giriş';
  FChildUretimTerminalGiris.TableObject := DataApp.UretimRota.Table;
  FChildUretimTerminalGiris.DockPanel.OnActivate := ChildIsEmriGirisOnActivate;
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalListe;
begin
  FChildUretimTerminalListe := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimTerminalListe') as TAppDocChildGrid;
  FChildUretimTerminalListe.Caption := 'Terminal Listesi';
  FChildUretimTerminalListe.TableObject := DataApp.UretimRota.Table;
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimKaynakList;
begin
  FChildUretimKaynakList := DocObject.CreateChild(TAppDocChildUretimTerminalKaynakList, 'ChildUretimTerminalKaynak') as TAppDocChildUretimTerminalKaynakList;
  FChildUretimKaynakList.DocApp := Self;
  FChildUretimKaynakList.DataApp := DataApp;

  DocObject.Macros.AddObject(FChildUretimKaynakList, 'ChildUretimKaynakList');
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimKaynakEvrakList;
begin
  FChildUretimKaynakEvrakList := DocObject.CreateChild(TAppDocChildUretimTerminalKaynakEvrakList, 'DocChildUretimTerminalKaynakEvrakList') as TAppDocChildUretimTerminalKaynakEvrakList;
  FChildUretimKaynakEvrakList.DocApp := Self;
  FChildUretimKaynakEvrakList.DataApp := DataApp;
//  FChildUretimKaynakEvrakList.GridView.OnDblClick := ChildUretimKaynakEvrakListOnDblClick;

  FChildUretimKaynakEvrakList.CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);

  DocObject.Macros.AddObject(FChildUretimKaynakEvrakList, 'ChildUretimKaynakEvrakList');
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimDolumBilgileri;
begin
  FChildUretimDolumBilgileri := DocObject.CreateChild(TAppDocChildUretimTerminalDolumBilgileri, 'DocChildUretimTerminalDolumBilgileri') as TAppDocChildUretimTerminalDolumBilgileri;
  FChildUretimDolumBilgileri.DocApp := Self;
  FChildUretimDolumBilgileri.DataApp := DataApp;
  with FChildUretimDolumBilgileri do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);

  DocObject.Macros.AddObject(ChildUretimDolumBilgileri, 'ChildUretimDolumBilgileri');

end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimEvrakBaslik;
begin
  FChildUretimEvrakBaslik := DocObject.CreateChild(TAppDocChildVGrid, 'ChildUretimEvrakBaslik') as TAppDocChildVGrid;
  FChildUretimEvrakBaslik.Caption := 'Üretim Evrak Başlık'; //AppGetRS(@AppDOPUretimTerminalVeriGiris_ChildUretimTerminal);
  FChildUretimEvrakBaslik.TableObject := DataApp.UretimEvrakBaslik.Table;
  with FChildUretimEvrakBaslik.CreateButton('btFChildUretimEvrakBaslik', FChildUretimEvrakBaslik.Caption, 'Sayfalar') do
    ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimAmbalajBilgileri;
begin
  FChildUretimAmbalajBilgileri := DocObject.CreateChild(TAppDocChildUretimTerminalAmbalajBilgileri, 'DocChildUretimTerminalAmbalajBilgileri') as TAppDocChildUretimTerminalAmbalajBilgileri;
  FChildUretimAmbalajBilgileri.DocApp := Self;
  FChildUretimAmbalajBilgileri.DataApp := DataApp;
  with FChildUretimAmbalajBilgileri do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);

  DocObject.Macros.AddObject(ChildUretimAmbalajBilgileri, 'ChildUretimAmbalajBilgileri');

end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimKart;
begin
  FChildUretimKart := DocObject.CreateChild(TAppDocChildVGrid, 'ChildUretimKart') as TAppDocChildVGrid;
  FChildUretimKart.Caption := 'Üretim Kart'; //AppGetRS(@AppDOPUretimTerminalVeriGiris_ChildUretimTerminal);
  FChildUretimKart.TableObject := DataApp.UretimKart.Table;
  with FChildUretimKart.CreateButton('btFChildUretimKart', FChildUretimKart.Caption, 'Sayfalar') do
    ImageIndex := Integer(aiStokDurum);

  DocObject.Macros.AddObject(FChildUretimKart, 'ChildUretimKart');
  DocObject.Macros.AddObject(DataApp.UretimKart, 'UretimKart');


end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimRota;
begin
  FChildUretimRota := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRota') as TAppDocChildGrid;
  FChildUretimRota.Caption := 'Üretim Rota'; //AppGetRS(@AppDOPUretimTerminalVeriGiris_ChildUretimTerminal);
  FChildUretimRota.TableObject := DataApp.UretimRota.Table;
//  DataApp.UretimRota.Table.TableItems[0].Where.Add('OPDURUM', wcNotEqual, 30).DataType := ftInteger;        VEYSEL KALDIRILDI.

//  with FChildUretimRota.CreateButton('btUretimRota', FChildUretimRota.Caption, 'Sayfalar') do ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimRotaKaynak;
begin
  FChildUretimRotaKaynak := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRotaKaynak') as TAppDocChildGrid;
  FChildUretimRotaKaynak.Caption := 'Üretim Rota Kaynak'; //AppGetRS(@AppDOPUretimTerminalVeriGiris_ChildUretimTerminal);
  FChildUretimRotaKaynak.TableObject := DataApp.UretimRotaKaynak.Table;
//  DataApp.UretimRotaKaynak.Table.TableItems[0].Where.Add('OPDURUM', wcNotEqual, 30).DataType := ftInteger;        VEYSEL KALDIRILDI.

//  with FChildUretimRotaKaynak.CreateButton('btUretimRotaKaynak', FChildUretimRotaKaynak.Caption, 'Sayfalar') do
//    ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimRotaKaynakNot;
begin
  FChildUretimRotaKaynakNot := DocObject.CreateChild(TAppDocChildTerminalRotaKaynakNot, 'ChildUretimRotaKaynakNot') as TAppDocChildTerminalRotaKaynakNot;
  FChildUretimRotaKaynakNot.DataApp :=DataApp;
  FChildUretimRotaKaynakNot.DocApp := Self;
  FChildUretimRotaKaynakNot.Caption := 'Üretim Rota Kaynak Not'; //AppGetRS(@AppDOPUretimTerminalVeriGiris_ChildUretimTerminal);
  FChildUretimRotaKaynakNot.TableObject := DataApp.UretimRotaKaynakNot.Table;

  with FChildUretimRotaKaynakNot.CreateButton('btUretimRotaKaynakNot', FChildUretimRotaKaynakNot.Caption, 'Sayfalar') do
    ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimRotaKaynakIslem;
begin
  FChildUretimRotaKaynakIslem := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRotaKaynakIslem') as TAppDocChildGrid;
  FChildUretimRotaKaynakIslem.Caption := 'Üretim Rota Kaynak Islem'; //AppGetRS(@AppDOPUretimTerminalVeriGiris_ChildUretimTerminal);
  FChildUretimRotaKaynakIslem.TableObject := DataApp.UretimRotaKaynakIslem.Table;
  DataApp.UretimRotaKaynakIslem.Table.TableItems.OrderBy.Add('ISLEMNO', otAsc);

//  TAppDocFormUretimTerminalMenu(AForm).PanelMalzemeBilgileri_Top.Parent := FChildUretimRotaKaynakIslem.Form;

  with FChildUretimRotaKaynakIslem.CreateButton('btUretimRotaKaynakIslem', FChildUretimRotaKaynakIslem.Caption, 'Sayfalar') do
    ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimRotaKaynakOperasyon;
begin
  FChildUretimRotaKaynakOperasyon := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRotaKaynakOperasyon') as TAppDocChildGrid;
  FChildUretimRotaKaynakOperasyon.Caption := 'Üretim Rota Kaynak Operasyon'; //AppGetRS(@AppDOPUretimTerminalVeriGiris_ChildUretimTerminal);
  FChildUretimRotaKaynakOperasyon.TableObject := DataApp.UretimRotaKaynakOperasyon.Table;
  with FChildUretimRotaKaynakOperasyon.CreateButton('btUretimRotaKaynakOperasyon', FChildUretimRotaKaynakOperasyon.Caption, 'Sayfalar') do
    ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimRotaKaynakDurus;
begin
  FChildUretimRotaKaynakDurus := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRotaKaynakDurus') as TAppDocChildGrid;
  FChildUretimRotaKaynakDurus.Caption := 'Üretim Rota Kaynak Durus'; //AppGetRS(@AppDOPUretimTerminalVeriGiris_ChildUretimTerminal);
  FChildUretimRotaKaynakDurus.TableObject := DataApp.UretimRotaKaynakDurus.Table;
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimRotaKaynakHata;
begin
  FChildUretimRotaKaynakHata := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRotaKaynakHata') as TAppDocChildGrid;
  FChildUretimRotaKaynakHata.Caption := 'Üretim Rota Kaynak Hata'; //AppGetRS(@AppDOPUretimTerminalVeriGiris_ChildUretimTerminal);
  FChildUretimRotaKaynakHata.TableObject := DataApp.UretimRotaKaynakHata.Table;
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimSiparisHareket;
begin
  FChildUretimSiparisHareket := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimSiparisHareket') as TAppDocChildGrid;
  FChildUretimSiparisHareket.Caption := 'Üretim Sipariş Hareket'; //AppGetRS(@AppDOPUretimTerminalVeriGiris_ChildUretimTerminal);
  FChildUretimSiparisHareket.TableObject := DataApp.UretimSiparisHareket.Table;
  with FChildUretimSiparisHareket.CreateButton('btUretimSiparisHareket', FChildUretimSiparisHareket.Caption, 'Sayfalar') do
    ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimStokHareket;
begin
  FChildUretimStokHareket := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimStokHareket') as TAppDocChildGrid;
  FChildUretimStokHareket.Caption := 'Üretim Stok Hareket'; //AppGetRS(@AppDOPUretimTerminalVeriGiris_ChildUretimTerminal);
  FChildUretimStokHareket.TableObject := DataApp.UretimStokHareket.Table;
  with FChildUretimStokHareket.CreateButton('btUretimStokHareket', FChildUretimStokHareket.Caption, 'Sayfalar') do
    ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimKaynakIslem;
begin
  FChildUretimKaynakIslem := DocObject.CreateChild(TAppDocChildUretimTerminalKaynakIslem, 'ChildTerminalKaynakIslem') as TAppDocChildUretimTerminalKaynakIslem;
  FChildUretimKaynakIslem.DocApp := Self;
  FChildUretimKaynakIslem.DataApp := DataApp;
  with FChildUretimKaynakIslem.CreateButton('btUretimKaynakIslem', FChildUretimKaynakIslem.Caption, 'Sayfalar') do
    ImageIndex := Integer(aiStokDurum);
  DocObject.Macros.AddObject(ChildUretimKaynakIslem, 'ChildUretimKaynakIslem');
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimKaynakIslemInfo;
begin
  ChildUretimKaynakEvrakList.DoRun;
  FChildUretimKaynakIslemInfo := DocObject.CreateChild(TAppDocChildVGrid, 'ChildTerminalKaynakIslemInfo') as TAppDocChildVGrid;
  FChildUretimKaynakIslemInfo.Caption := 'Işlem Bilgisi';
  FChildUretimKaynakIslemInfo.TableObject := ChildUretimKaynakEvrakList.Table;

  with FChildUretimKaynakIslemInfo.CreateButton('btUretimKaynakIslemInfo', FChildUretimKaynakIslemInfo.Caption, 'Sayfalar') do
    ImageIndex := Integer(aiStokDurum);

  FPanelChildUretimKaynakIslemInfo := TPanel.Create(DocObject.MainForm);
  with FPanelChildUretimKaynakIslemInfo do
  begin
    Name := 'FPanelChildUretimKaynakIslemInfo';
    Visible := False;
    Parent := DocObject.MainForm;
    Align := alBottom;
    BevelKind := bkTile;
    Anchors := [akTop];
    Height := 135;
  end;
  FChildUretimKaynakIslemInfo.VGrid.Parent := FPanelChildUretimKaynakIslemInfo;
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalReceteTuketim;
begin
  FChildUretimTerminalReceteTuketim := DocObject.CreateChild(TAppDocChildUretimTerminalReceteTuketim, 'ChildUretimTerminalReceteTuketim') as TAppDocChildUretimTerminalReceteTuketim;
  FChildUretimTerminalReceteTuketim.DocApp := Self;
  FChildUretimTerminalReceteTuketim.DataApp := DataApp;
  with FChildUretimTerminalReceteTuketim do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalReceteTuketimList;
begin
  FChildUretimTerminalReceteTuketimList := DocObject.CreateChild(TAppDocChildUretimTerminalReceteTuketimList, 'ChildUretimTerminalReceteTuketimList') as TAppDocChildUretimTerminalReceteTuketimList;
  FChildUretimTerminalReceteTuketimList.DocApp := Self;
  FChildUretimTerminalReceteTuketimList.DataApp := DataApp;
  with FChildUretimTerminalReceteTuketimList do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);

  DocObject.Macros.AddObject(FChildUretimTerminalReceteTuketimList, 'ChildUretimTerminalReceteTuketimList');
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalManualTuketimStepOne;
begin
  FChildUretimTerminalManualTuketimStepOne := DocObject.CreateChild(TAppDocChildUretimTerminalManualTuketimStepOne, 'ChildUretimTerminalManualTuketimStepOne') as TAppDocChildUretimTerminalManualTuketimStepOne;
  FChildUretimTerminalManualTuketimStepOne.DocApp := Self;
  FChildUretimTerminalManualTuketimStepOne.DataApp := DataApp;
  with FChildUretimTerminalManualTuketimStepOne do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalManualTuketimStepTwo;
begin
  FChildUretimTerminalManualTuketimStepTwo := DocObject.CreateChild(TAppDocChildUretimTerminalManualTuketimStepTwo, 'ChildUretimTerminalManualTuketimStepTwo') as TAppDocChildUretimTerminalManualTuketimStepTwo;
  FChildUretimTerminalManualTuketimStepTwo.DocApp := Self;
  FChildUretimTerminalManualTuketimStepTwo.DataApp := DataApp;
  with FChildUretimTerminalManualTuketimStepTwo do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalManualTuketimInfo;
begin
//  FChildUretimTerminalManualTuketimInfo := DocObject.CreateChild(TAppDocChildGrid, 'Child01') as TAppDocChildGrid;
//  FChildUretimTerminalManualTuketimInfo.Caption := 'Tüketim Listesi'; //AppGetRS(@AppDOPUretimTerminalVeriGiris_ChildUretimTerminal);
//  FChildUretimTerminalManualTuketimInfo.TableObject := DataApp.UretimStokHareket.Table;
//  with FChildUretimTerminalManualTuketimInfo.CreateButton('btUretimSiparisHareketManualTuketimInfo', FChildUretimTerminalManualTuketimInfo.Caption, 'Sayfalar') do
//    ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalMalzemeBilgileri;
begin
  FChildUretimTerminalMalzemeBilgileri := DocObject.CreateChild(TAppDocChildUretimTerminalMalzemeBilgileri, 'Child04') as TAppDocChildUretimTerminalMalzemeBilgileri;
  FChildUretimTerminalMalzemeBilgileri.Caption := 'Terminal Reçete Tüketim Bilgileri'; //AppGetRS(@AppDOPUretimTerminalVeriGiris_ChildUretimTerminal);
  FChildUretimTerminalMalzemeBilgileri.DocApp := Self;
  FChildUretimTerminalMalzemeBilgileri.DataApp := DataApp;
  FChildUretimTerminalMalzemeBilgileri.TableMalzemeTuketimBilgileri.Connection := DataApp.Connection;
  FChildUretimTerminalMalzemeBilgileri.TableObject := FChildUretimTerminalMalzemeBilgileri.TableMalzemeTuketimBilgileri;
  FChildUretimTerminalMalzemeBilgileri.DoRun;

  with FChildUretimTerminalMalzemeBilgileri.CreateButton('ChildUretimTerminalMalzemeBilgileri', FChildUretimTerminalMalzemeBilgileri.Caption, 'Sayfalar') do
    ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalMalzemeBilgileriGiris;
begin
  FChildUretimTerminalMalzemeBilgileriGiris := DocObject.CreateChild(TAppDocChildUretimTerminalMalzemeBilgileriGiris, 'Child05') as TAppDocChildUretimTerminalMalzemeBilgileriGiris;
  FChildUretimTerminalMalzemeBilgileriGiris.Caption := 'Terminal Reçete Tüketim Bilgileri Giris'; //AppGetRS(@AppDOPUretimTerminalVeriGiris_ChildUretimTerminal);
  FChildUretimTerminalMalzemeBilgileriGiris.DocApp := Self;
  FChildUretimTerminalMalzemeBilgileriGiris.DataApp := DataApp;
  FChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.Connection := DataApp.Connection;
  FChildUretimTerminalMalzemeBilgileriGiris.TableObject := FChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri;
  FChildUretimTerminalMalzemeBilgileriGiris.DoRun;

  with FChildUretimTerminalMalzemeBilgileriGiris.CreateButton('ChildUretimTerminalMalzemeBilgileriGiris', FChildUretimTerminalMalzemeBilgileriGiris.Caption, 'Sayfalar') do
    ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalKaliteEvrakList;
begin
  FChildUretimTerminalKaliteEvrakList := DocObject.CreateChild(TAppDocChildUretimTerminalKaliteEvrakList, 'ChildUretimTerminalKaliteEvrakList') as TAppDocChildUretimTerminalKaliteEvrakList;
  FChildUretimTerminalKaliteEvrakList.DocApp := Self;
  FChildUretimTerminalKaliteEvrakList.DataApp := DataApp;
  with FChildUretimTerminalKaliteEvrakList do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalKaliteYenidenIslem;
begin
  FChildUretimTerminalKaliteYenidenIslemList := DocObject.CreateChild(TAppDocChildUretimTerminalKaliteYenidenIslemList, 'ChildUretimTerminalKaliteYenidenIslem') as TAppDocChildUretimTerminalKaliteYenidenIslemList;
  FChildUretimTerminalKaliteYenidenIslemList.DocApp := Self;
  FChildUretimTerminalKaliteYenidenIslemList.DataApp := DataApp;
  with FChildUretimTerminalKaliteYenidenIslemList do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalKaliteYenidenIslemSecim;
begin
  FChildUretimTerminalKaliteYenidenIslemSecim := DocObject.CreateChild(TAppDocChildUretimTerminalKaliteYenidenIslemSecim, 'ChildUretimTerminalKaliteYenidenIslemSecim') as TAppDocChildUretimTerminalKaliteYenidenIslemSecim;
  FChildUretimTerminalKaliteYenidenIslemSecim.DocApp := Self;
  FChildUretimTerminalKaliteYenidenIslemSecim.DataApp := DataApp;
//  FChildUretimTerminalKaliteYenidenIslemSecim.TableObject.Connection := DataApp.Connection;
  with FChildUretimTerminalKaliteYenidenIslemSecim do
    CreateButton('btFChildUretimTerminalKaliteYenidenIslemSecim' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalKaliteHMSecimHareket;
begin
  FChildUretimTerminalKaliteHMSecimHareket := DocObject.CreateChild(TAppDocChildUretimTerminalKaliteHMSecimHareket, 'ChildUretimTerminalKaliteHMSecimHareket') as TAppDocChildUretimTerminalKaliteHMSecimHareket;
  FChildUretimTerminalKaliteHMSecimHareket.TableObject.Connection := DataApp.Connection;
  FChildUretimTerminalKaliteHMSecimHareket.DocApp := Self;
  FChildUretimTerminalKaliteHMSecimHareket.DataApp := DataApp;
  with FChildUretimTerminalKaliteHMSecimHareket do
    CreateButton('btFChildUretimTerminalKaliteHMSecimHareket' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalKaliteHMSecim;
begin
  FChildUretimTerminalKaliteHMSecimStepOne := DocObject.CreateChild(TAppDocChildUretimTerminalKaliteHMSecimStepOne, 'ChildUretimTerminalKaliteHMSecimStepOne') as TAppDocChildUretimTerminalKaliteHMSecimStepOne;
  FChildUretimTerminalKaliteHMSecimStepOne.DocApp := Self;
  FChildUretimTerminalKaliteHMSecimStepOne.DataApp := DataApp;
  with FChildUretimTerminalKaliteHMSecimStepOne do
    CreateButton('btFChildUretimTerminalKaliteHMSecimStepOne' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);

  FChildUretimTerminalKaliteHMSecimStepTwo := DocObject.CreateChild(TAppDocChildUretimTerminalKaliteHMSecimStepTwo, 'ChildUretimTerminalKaliteHMSecimStepTwo') as TAppDocChildUretimTerminalKaliteHMSecimStepTwo;
  FChildUretimTerminalKaliteHMSecimStepTwo.DocApp := Self;
  FChildUretimTerminalKaliteHMSecimStepTwo.DataApp := DataApp;
  with FChildUretimTerminalKaliteHMSecimStepTwo do
    CreateButton('btFChildUretimTerminalKaliteHMSecimStepTwo' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalHMDegisim;
begin
  FChildUretimTerminalHMDegisimStepOne := DocObject.CreateChild(TAppDocChildUretimTerminalHMDegisimStepOne, 'ChildUretimTerminalHMDegisimStepOne') as TAppDocChildUretimTerminalHMDegisimStepOne;
  FChildUretimTerminalHMDegisimStepOne.DocApp := Self;
  FChildUretimTerminalHMDegisimStepOne.DataApp := DataApp;
  with FChildUretimTerminalHMDegisimStepOne do
    CreateButton('btFChildUretimTerminalHMDegisimStepOne' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalUyariSistem;
begin
  FChildUretimTerminalUyariSistem := DocObject.CreateChild(TAppDocChildUretimTerminalUyariSistem, 'ChildUyariSistem') as TAppDocChildUretimTerminalUyariSistem;
  FChildUretimTerminalUyariSistem.DocApp := Self;
  FChildUretimTerminalUyariSistem.DataApp := DataApp;
  with FChildUretimTerminalUyariSistem do
    CreateButton('btChildUyariSistem' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);

  DocObject.Macros.AddObject(FChildUretimTerminalUyariSistem, 'ChildUretimTerminalUyariSistem');
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalDurusStepOne;
begin
  FChildUretimTerminalDurusStepOne := DocObject.CreateChild(TAppDocChildUretimTerminalDurusStepOne, 'ChildUretimTerminalDurusStepOne') as TAppDocChildUretimTerminalDurusStepOne;
  FChildUretimTerminalDurusStepOne.DocApp := Self;
  FChildUretimTerminalDurusStepOne.DataApp := DataApp;
  with FChildUretimTerminalDurusStepOne do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalDurusStepTwo;
begin
  FChildUretimTerminalDurusStepTwo := DocObject.CreateChild(TAppDocChildUretimTerminalDurusStepTwo, 'ChildUretimTerminalDurusStepTwo') as TAppDocChildUretimTerminalDurusStepTwo;
  FChildUretimTerminalDurusStepTwo.DocApp := Self;
  FChildUretimTerminalDurusStepTwo.DataApp := DataApp;
  with FChildUretimTerminalDurusStepTwo do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalHataKart;
begin
  FChildUretimTerminalHataKart := DocObject.CreateChild(TAppDocChildUretimTerminalHataKart, 'ChildUretimTerminalHataKart') as TAppDocChildUretimTerminalHataKart;
  FChildUretimTerminalHataKart.DocApp := Self;
  FChildUretimTerminalHataKart.DataApp := DataApp;
  with FChildUretimTerminalHataKart do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildTerminalDurusIslemSecim;
begin
  FChildTerminalDurusIslemSecim := DocObject.CreateChild(TAppDocChildTerminalDurusIslemSecim, 'ChildTerminalDurusIslemSecim') as TAppDocChildTerminalDurusIslemSecim;
  FChildTerminalDurusIslemSecim.DocApp := Self;
  FChildTerminalDurusIslemSecim.DataApp := DataApp;
  with FChildTerminalDurusIslemSecim do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalMalzemeDurusStepOne;
begin
  FChildUretimTerminalMalzemeDurusStepOne := DocObject.CreateChild(TAppDocChildUretimTerminalMalzemeDurusStepOne, 'ChildUretimTerminalMalzemeDurusStepOne') as TAppDocChildUretimTerminalMalzemeDurusStepOne;
  FChildUretimTerminalMalzemeDurusStepOne.DocApp := Self;
  FChildUretimTerminalMalzemeDurusStepOne.DataApp := DataApp;
  with FChildUretimTerminalMalzemeDurusStepOne do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalMalzemeDurusStepTwo;
begin
  FChildUretimTerminalMalzemeDurusStepTwo := DocObject.CreateChild(TAppDocChildUretimTerminalMalzemeDurusStepTwo, 'ChildUretimTerminalMalzemeDurusStepTwo') as TAppDocChildUretimTerminalMalzemeDurusStepTwo;
  FChildUretimTerminalMalzemeDurusStepTwo.DocApp := Self;
  FChildUretimTerminalMalzemeDurusStepTwo.DataApp := DataApp;
  with FChildUretimTerminalMalzemeDurusStepTwo do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalKaliteDurusStepOne;
begin
  FChildUretimTerminalKaliteDurusStepOne := DocObject.CreateChild(TAppDocChildUretimTerminalKaliteDurusStepOne, 'ChildUretimTerminalKaliteDurusStepOne') as TAppDocChildUretimTerminalKaliteDurusStepOne;
  FChildUretimTerminalKaliteDurusStepOne.DocApp := Self;
  FChildUretimTerminalKaliteDurusStepOne.DataApp := DataApp;
  with FChildUretimTerminalKaliteDurusStepOne do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalKaliteDurusStepTwo;
begin
  FChildUretimTerminalKaliteDurusStepTwo := DocObject.CreateChild(TAppDocChildUretimTerminalKaliteDurusStepTwo, 'ChildUretimTerminalKaliteDurusStepTwo') as TAppDocChildUretimTerminalKaliteDurusStepTwo;
  FChildUretimTerminalKaliteDurusStepTwo.DocApp := Self;
  FChildUretimTerminalKaliteDurusStepTwo.DataApp := DataApp;
  with FChildUretimTerminalKaliteDurusStepTwo do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalMalzemeHataKart;
begin
  FChildUretimTerminalMalzemeHataKart := DocObject.CreateChild(TAppDocChildUretimTerminalMalzemeHataKart, 'ChildUretimTerminalMalzemeHataKart') as TAppDocChildUretimTerminalMalzemeHataKart;
  FChildUretimTerminalMalzemeHataKart.DocApp := Self;
  FChildUretimTerminalMalzemeHataKart.DataApp := DataApp;
  with FChildUretimTerminalMalzemeHataKart do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildUretimTerminalReportDurusList;
begin
  FChildUretimTerminalReportDurusList := DocObject.CreateChild(TAppDocChildUretimTerminalReportDurusList, 'ChildUretimTerminalReportDurusList') as TAppDocChildUretimTerminalReportDurusList;
  FChildUretimTerminalReportDurusList.DocApp := Self;
  FChildUretimTerminalReportDurusList.DataApp := DataApp;
  with FChildUretimTerminalReportDurusList do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateChildSearchMamulTalimat;
begin
  FChildSearchMamulTalimat := DocObject.CreateChild(TAppDocSearchChildMamulTalimat, 'DocSearchChildMamulTalimat') as TAppDocSearchChildMamulTalimat;
  FChildSearchMamulTalimat.DocApp := Self;
  FChildSearchMamulTalimat.DataApp := DataApp;
  with FChildSearchMamulTalimat do
    CreateButton('btMenuButton' + Name, Caption, 'Sayfalar').ImageIndex := Integer(aiStokDurum);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateForms;
  procedure OnClickTitleBack(Sender: TObject);
  begin
//    ShowThisDockPanel(FChildUretimKaynakIslemInfo.DockPanel.Name);
    ShowThisDockPanel(FChildUretimKaynakIslem.DockPanel.Name);
  end;
  procedure OnClickTitleExit(Sender: TObject);
  begin
    ShowThisDockPanel(FChildTerminalLogin.DockPanel.Name);
  end;
  procedure CreateLoginMenu;
  begin
    TAppDocFormUretimTerminalMenu(AForm).pnlLoginMenu.Parent := FChildTerminalLogin.Form;
    TAppDocFormUretimTerminalMenu(AForm).pnlLoginBottom.Caption := 'Terminal Kodu: ' + TerminalParametre.TerminalKod;
  end;
  procedure CreateBottomMenu_KaynakIslemList;
  begin
    TAppDocFormUretimTerminalMenu(AForm).Information_MainPanel.Parent := FPanelChildUretimKaynakIslemInfo;
//    TAppDocFormUretimTerminalMenu(AForm).Information_MainPanel.Parent := FChildUretimKaynakIslemInfo.Form;
  end;
begin
  AForm := TAppDocFormUretimTerminalMenu.Create(nil);
  TAppDocFormUretimTerminalMenu(AForm).DOP := Self;
  CreateLoginMenu;
  CreateBottomMenu_KaynakIslemList;
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateRules;
begin
  FRuleUretimRota := TAppRuleUretimRota.Create(Self);
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateObjects;
begin
  FTerminalParametre := TTerminalParametre.Create(Self);
  FTerminalParametre.DOP := Self;
  FTerminalParametre.Firma := 'CPM';

  FTerminalTableIndex := TTerminalTableIndex.Create(DataApp);

  FTerminalBarcode := TTerminalBarcode.Create(DataApp);

  if TAppDocMainForm(DocObject.MainForm).cmdNewRecordAfterSave.Checked = true then
     TAppDocMainForm(DocObject.MainForm).cmdNewRecordAfterSave.Checked := false;
end;

function TAppDOPUretimTerminalVeriGiris.GetLastIslemNo: Smallint;
var
  ASql: String;
begin
  ASql := '';
  ASql := ASql + '  Select MAX(ISLEMNO) AS _SONISLEMNO ';
  ASql := ASql + '  From URTRKI ';
  ASql := ASql + '  Where EVRAKNO = ' + QuotedStr(TerminalParametre.EvrakNo);// QuotedStr(DataApp.UretimRota.Table.EvrakNo);
  ASql := ASql + '    And URETIMNO = ' + QuotedStr(TerminalParametre.UretimNo); //QuotedStr(DataApp.UretimRota.Table.UretimNo);
  ASql := ASql + '    And URETIMSIRANO = ' + IntToStr(TerminalParametre.UretimSiraNo);// IntToStr(DataApp.UretimRota.Table.UretimSiraNo);
  ASql := ASql + '    And OPERASYONNO = ' + IntToStr(TerminalParametre.OperasyonNo);// IntToStr(DataApp.UretimRota.Table.OperasyonNo);
  ASql := ASql + '    And EVRAKTIP = 54 ';
  ASql := ASql + '    And SIRKETNO = ' + QuotedStr(DataApp.CompanyNo);
  ASql := ASql + '    AND KAYNAKKOD = ' + QuotedStr(TerminalParametre.KaynakKod);// QuotedStr(DataApp.UretimRotaKaynakIslem.Table.KaynakKod);
  ASql := ASql + '    AND KULLANILAN = 1';

  DataApp.TableCommand.OpenCommandText(ASql);

  if not DataApp.TableCommand.IsEmpty then
    Result := DataApp.TableCommand.FieldValues['_SONISLEMNO']
  else
    Result := 0;
end;

procedure TAppDOPUretimTerminalVeriGiris.DoChangeOperationStatus(ActiveOperationStatus: Smallint; const vDate: TDate; const vTime: TDateTime);
var
  vvDate: TDate;
  vvTime: TDateTime;

  function fnNextIslemOperatorKod(ActiveOpIslemNo: Integer): Boolean;
  var aSQLStr: String;
  begin
    aSQLStr := 'Select Top 1 OPERATORKOD, ISLEMNO, ACIKLAMA From URTRKI Where EVRAKNO = ''%s'' And URETIMNO = ''%s'' And URETIMSIRANO = %d And OPERASYONNO = %d And EVRAKTIP = 54 And SIRKETNO = ''%s'' AND KAYNAKKOD = ''%s'' AND KULLANILAN = 1 And ISLEMNO > %d';
    aSQLStr := Format(aSQLStr, [DataApp.UretimRota.Table.EvrakNo, DataApp.UretimRota.Table.UretimNo, DataApp.UretimRota.Table.UretimSiraNo, DataApp.UretimRota.Table.OperasyonNo, DataApp.CompanyNo,
          DataApp.UretimRotaKaynakIslem.Table.KaynakKod, ActiveOpIslemNo]);
    DataApp.TableCommand.OpenCommandText(aSQLStr);

    if not DataApp.TableCommand.IsEmpty then
    begin
      TerminalParametre.NextOperatorKod := DataApp.TableCommand.FieldValues['OPERATORKOD'];
      TerminalParametre.NextIslemNo := DataApp.TableCommand.FieldValues['ISLEMNO'];
      TerminalParametre.NextIslemAciklama := DataApp.TableCommand.FieldValues['ACIKLAMA'];

      if DataApp.TableCommand.FieldValues['OPERATORKOD'] = TerminalParametre.CurrentOperatorKod then
        Result := false
      else
        Result := true;
    end
    else
      Result := false;
  end;

begin
  TerminalParametre.OpSonIslemNo := GetLastIslemNo;

  DataApp.UretimRotaKaynakIslem.Table.Filter := 'KULLANILAN = 1';
  DataApp.UretimRotaKaynakIslem.Table.Filtered := true;

  if not DataApp.UretimRotaKaynakIslem.Table.Locate(DataApp.UretimRotaKaynakIslem.Table.fIslemNo.FieldName, TerminalParametre.OpIslemNo, []) then
    Exit;
  if DataApp.UretimRotaKaynakIslem.Table.IsEmpty then
    Exit;

    vvDate := vDate;
    vvTime := vTime;

    if vvDate = 19000101 then
      vvDate := Date;
    if vvTime = 19000101 then
      vvTime := Now;

    if (ActiveOperationStatus = odStarted) then// and (DataApp.UretimRotaKaynakIslem.Table.Durum = odNone) then
    begin
      DataApp.UretimRotaKaynakIslem.Table.Edit;
      DataApp.UretimRotaKaynakIslem.Table.Durum := ActiveOperationStatus;
      if DataApp.UretimRotaKaynakIslem.Table.BasTarih = EncodeDate(1900, 01, 01) then
      begin
        DataApp.UretimRotaKaynakIslem.Table.BasTarih := vvDate;
        DataApp.UretimRotaKaynakIslem.Table.BasTarihSaat := vvTime;
      end;
      DataApp.UretimRotaKaynakIslem.Table.Post;
    end
    else if ActiveOperationStatus = odFinished then
    begin
      DataApp.UretimRotaKaynakIslem.Table.Edit;
      DataApp.UretimRotaKaynakIslem.Table.Durum := odFinished;
      DataApp.UretimRotaKaynakIslem.Table.BitTarih := vvDate;
      DataApp.UretimRotaKaynakIslem.Table.BitTarihSaat := vvTime;
      DataApp.UretimRotaKaynakIslem.Table.Post;
//      {
      if TerminalParametre.OpIslemNo <> TerminalParametre.OpSonIslemNo then
      begin


        DataApp.UretimRotaKaynakIslem.Table.Next;
        if DataApp.UretimRotaKaynakIslem.Table.FieldValues['ONCEKIISLEMNO']  = '' then
        begin
          if DataApp.UretimRotaKaynakIslem.Table.Durum = odNone then
          begin
            DataApp.UretimRotaKaynakIslem.Table.Edit;
            DataApp.UretimRotaKaynakIslem.Table.FieldValues['SERBESTTARIHSAAT'] := Now();
            DataApp.UretimRotaKaynakIslem.Table.Durum := odReleased;
            DataApp.UretimRotaKaynakIslem.Table.Post;
          end;
        end else
          DataApp.UretimRotaKaynakIslem.Table.Prior;

        if TerminalParametre.Firma = 'Kimteks' then
        begin
          if fnNextIslemOperatorKod(TerminalParametre.OpIslemNo) then
            AddUyari;
        end;
      end;
//      }
    end;
end;

procedure TAppDOPUretimTerminalVeriGiris.AddUyari;
var
  ASql: String;
  vAciklama: String;
begin
  vAciklama :=  AppInputBox('Açıklama', 'Varsa diğer prosesi için notunuzu belirtin', '');
  ASql := '';
  ASql := ASql + 'Insert Into URTTMS ';
  ASql := ASql + '(SIRKETNO, EVRAKNO, URETIMNO, URETIMSIRANO, OPERASYONNO, KAYNAKKOD, MAMULKOD, VERSIYONNO, SERINO, OKUNDU, KAYNAKOPERATORKOD, KAYNAKISLEMNO, KAYNAKISLEMAD, KAYNAKSICILKOD, HEDEFOPERATORKOD, HEDEFISLEMNO, HEDEFISLEMAD, ACIKLAMA1)';
  ASql := ASql + 'Values (''%s'', ''%s'', ''%s'', %d, %d, ''%s'', ''%s'', ''%s'', ''%s'', 1, ''%s'', %d, ''%s'', ''%s'', ''%s'', %d, ''%s'', ''%s'')';
  ASql := Format(ASql, [DataApp.CompanyNo, DataApp.UretimRotaKaynak.Table.EvrakNo, DataApp.UretimRotaKaynak.Table.UretimNo, DataApp.UretimRotaKaynak.Table.UretimSiraNo,
                            DataApp.UretimRotaKaynak.Table.OperasyonNo, DataApp.UretimRotaKaynak.Table.KaynakKod, DataApp.UretimKart.Table.MamulKod, DataApp.UretimKart.Table.VersiyonNo,
                            DataApp.UretimKart.Table.MamulSeriNo, TerminalParametre.CurrentOperatorKod, TerminalParametre.CurrentIslemNo, TerminalParametre.CurrentIslemAciklama,
                            TerminalParametre.SicilKod, TerminalParametre.NextOperatorKod, TerminalParametre.NextIslemNo, TerminalParametre.NextIslemAciklama, vAciklama]);

  DataApp.TableCommand.Execute(ASql);
end;

destructor TAppDOPUretimTerminalVeriGiris.Destroy;
begin
  ChildUretimTerminalUyariSistem.Timer.Enabled := false;
  inherited;
end;

procedure TAppDOPUretimTerminalVeriGiris.DoStartOperasyon(const IslemNo: Integer = 0; const CheckIslemStatus: Boolean = true);
var
  fCanInsert: Boolean;
  fIslemNo: Integer;
begin
  fIslemNo := IslemNo;

  if fIslemNo = 0 then
    fIslemNo := TerminalParametre.IslemNo;

  LocateUretimRotaRecord;
  TerminalParametre.KaynakIslem.GetFirstLastIslemNo;

  fCanInsert := true;
  if CheckIslemStatus then
    fCanInsert := (fIslemNo = TerminalParametre.KaynakIslem.FirstIslemNo) And (DataApp.UretimRotaKaynakOperasyon.Table.IsEmpty);

  if fCanInsert then
  begin
    DataApp.UretimRotaKaynakOperasyon.Table.Insert;
    DataApp.UretimRotaKaynakOperasyon.Table.VardiyaKod := 'Yok';
    DataApp.UretimRotaKaynakOperasyon.Table.OperatorKod := TerminalParametre.SicilKod;
    DataApp.UretimRotaKaynakOperasyon.Table.EvrakMiktar := 0;
    DataApp.UretimRotaKaynakOperasyon.Table.Miktar := 0;
    DataApp.UretimRotaKaynakOperasyon.Table.BasTarih := TerminalParametre.EvrakUretimTarih;
    DataApp.UretimRotaKaynakOperasyon.Table.BasTarihSaat := TerminalParametre.EvrakUretimSaat;
    DataApp.UretimRotaKaynakOperasyon.Table.BitTarih := TerminalParametre.EvrakUretimTarih;
    DataApp.UretimRotaKaynakOperasyon.Table.BitTarihSaat := TerminalParametre.EvrakUretimSaat;
    DataApp.UretimRotaKaynakOperasyon.Table.Durum := 0;
    DataApp.UretimRotaKaynakOperasyon.Table.Post;
    DataApp.UretimRotaKaynakOperasyon.Table.Last;
  end;

  DoChangeOperationStatus(odStarted, TerminalParametre.EvrakUretimTarih, TerminalParametre.EvrakUretimSaat);
  DoTest;
  LocateUretimRotaRecord;
  DoSaveNew;
end;

procedure TAppDOPUretimTerminalVeriGiris.DoFinishOperasyon2(Miktar: Double; IslemNo: Integer;
  const CheckIslemStatus: Boolean = true);
var
  vTarih: TDate;
  vSaat: TDateTime;
  fCanInsert, fCanContuniue: Boolean;
begin
    fCanInsert := true;
    fCanContuniue := true;

  vTarih := TerminalParametre.EvrakUretimTarih;
  vSaat := TerminalParametre.EvrakUretimSaat;

  TerminalParametre.KaynakIslem.GetFirstLastIslemNo;

  {
  if CheckIslemStatus then
  begin
    if IslemNo <> TerminalParametre.KaynakIslem.LastIslemNo then
      Exit;

    if (DataApp.UretimRotaKaynakOperasyon.Table.IsEmpty) then
      Exit;
  end;

  if DataApp.UretimRotaKaynakOperasyon.Table.IsEmpty then
    DataApp.UretimRotaKaynakOperasyon.Table.Insert
  else
  begin
    DataApp.UretimRotaKaynakOperasyon.Table.Last;
    DataApp.UretimRotaKaynakOperasyon.Table.Edit;
  end;
  DataApp.UretimRotaKaynakOperasyon.Table.Miktar := Miktar;
  DataApp.UretimRotaKaynakOperasyon.Table.OperatorKod := TerminalParametre.SicilKod;
  DataApp.UretimRotaKaynakOperasyon.Table.EvrakMiktar := Miktar;
  DataApp.UretimRotaKaynakOperasyon.Table.BitTarih := vTarih;
  DataApp.UretimRotaKaynakOperasyon.Table.BitTarihSaat := vSaat;
  DataApp.UretimRotaKaynakOperasyon.Table.Durum := 1;
  DataApp.UretimRotaKaynakOperasyon.Table.Post;

  if DataApp.UretimRotaKaynakOperasyon.Table.ApplyUpdates(0) <> 0 then
    Exit;

  DoChangeOperationStatus(odFinished, vTarih, vSaat);
  DataApp.UretimRotaKaynakIslem.Table.ApplyUpdates(0);
  DoTest;
  }

  if CheckIslemStatus then
  begin
    if IslemNo = TerminalParametre.KaynakIslem.LastIslemNo then
      fCanInsert := true
    else
      fCanInsert := false;

    if not (DataApp.UretimRotaKaynakOperasyon.Table.IsEmpty) then
      fCanInsert := true
    else
      fCanInsert := false;
  end;


  if fCanInsert then
  begin
    if DataApp.UretimRotaKaynakOperasyon.Table.IsEmpty then
      DataApp.UretimRotaKaynakOperasyon.Table.Insert
    else
    begin
      DataApp.UretimRotaKaynakOperasyon.Table.Last;
      DataApp.UretimRotaKaynakOperasyon.Table.Edit;
    end;
    DataApp.UretimRotaKaynakOperasyon.Table.Miktar := Miktar;
    DataApp.UretimRotaKaynakOperasyon.Table.OperatorKod := TerminalParametre.SicilKod;
    DataApp.UretimRotaKaynakOperasyon.Table.EvrakMiktar := Miktar;
    DataApp.UretimRotaKaynakOperasyon.Table.BitTarih := vTarih;
    DataApp.UretimRotaKaynakOperasyon.Table.BitTarihSaat := vSaat;
    DataApp.UretimRotaKaynakOperasyon.Table.Durum := 1;
    DataApp.UretimRotaKaynakOperasyon.Table.Post;
    if DataApp.UretimRotaKaynakOperasyon.Table.ApplyUpdates(0) = 0 then
      fCanContuniue := true
    else
      fCanContuniue := false;
  end;

  if fCanContuniue then
  begin
    DoChangeOperationStatus(odFinished, vTarih, vSaat);
    DataApp.UretimRotaKaynakIslem.Table.ApplyUpdates(0);
    DoTest;
  end;
end;

procedure TAppDOPUretimTerminalVeriGiris.DoHMDegisim;
begin
  with ChildUretimTerminalHMDegisimStepOne.Table.TableItems[0].Where do
  begin
    Clear;
    Add('SIRKETNO', wcEqual, DataApp.CompanyNo);
    AddOperator(woAnd);
    Add('MALKOD', wcEqual, ChildUretimTerminalReceteTuketim.Table.FieldValues['MALKOD']);
    AddOperator(woAnd);
    Add('KULLANILABILIR', wcGreater, 0);
  end;
  ChildUretimTerminalHMDegisimStepOne.Run;
  ShowThisDockPanel(ChildUretimTerminalHMDegisimStepOne.DockPanel.Name);
end;

procedure TAppDOPUretimTerminalVeriGiris.DoFinishOperasyon;
var
  AMiktar: Double;
  {Kimteks}
    EvrakNo: String;
    EvrakSiraNo: Integer;
    EvrakTip: Integer;
  {Kimteks}
begin
  TerminalParametre.OpSonIslemNo := GetLastIslemNo;
  AMiktar := 0;
  LocateUretimRotaRecord;

  if TerminalParametre.Firma = 'Kimteks' then
  begin
    if TerminalParametre.OpSonIslemNo = TerminalParametre.OpIslemNo then
    begin
      AppShowMessage('Çıkma Ambalajları Eklemeyi Unutmayın!');

      EvrakNo := ChildUretimKaynakEvrakList.Table.FieldValues['URETIMNO'];
      EvrakSiraNo := ChildUretimKaynakEvrakList.Table.FieldValues['URETIMSIRANO'];
      EvrakTip := ChildUretimKaynakEvrakList.Table.FieldValues['EVRAKTIP'];

      ChildUretimDolumBilgileri.DoRun(EvrakNo, EvrakSiraNo, EvrakTip);
      if not ChildUretimDolumBilgileri.Table.IsEmpty then
      begin
        DoFinishOperasyon2(AMiktar, TerminalParametre.OpIslemNo);    // Dolum Bilgileri kendilerine özel Operasyon Başlangıç-Bitiş yaptığı için, mevcut Ambalajlama operasyonunu bitiriyoruz.,
        DoSaveNew(false);
        ShowThisDockPanel(ChildUretimDolumBilgileri.DockPanel.Name);
      end else
      begin
        AMiktar := DocCustomProperties.AppForms.AppFormNumericPad('Üretilen Miktarı Girin!', FloatToStr(DataApp.UretimRotaKaynak.Table.Miktar));
        if AMiktar = 0 then begin
          AppShowMessage('Miktar Girmeden Devam Edemezsiniz!');
          Exit;
        end
        else if AMiktar > 0 then
        begin
          DoFinishOperasyon2(AMiktar, TerminalParametre.OpIslemNo);
          if DataApp.UretimStokHareket.Table.Locate('STHURT_OPERASYONSIRANO', VarArrayOf([DataApp.UretimRotaKaynakOperasyon.Table.SiraNo]), []) then
          begin
            DataApp.UretimStokHareket.Table.Edit;
            DataApp.UretimStokHareket.Table.VersiyonNo := DataApp.UretimStokHareket.Table.SeriNo;
          end;
          DoSaveNew(false);
        end;
      end;
    end else
    begin
      DoFinishOperasyon2(AMiktar, TerminalParametre.OpIslemNo);
      DoSaveNew(false);
    end;
  end;

  if TerminalParametre.Firma = 'CPM' then
  begin
    if TerminalParametre.OpSonIslemNo = TerminalParametre.OpIslemNo then
    begin
      AMiktar := DocCustomProperties.AppForms.AppFormNumericPad('Üretilen Miktarı Girin!', FloatToStr(DataApp.UretimRotaKaynak.Table.Miktar));
      if AMiktar = 0 then begin
        AppShowMessage('Miktar Girmeden Devam Edemezsiniz!');
        Exit;
      end;
    end;
    DoFinishOperasyon2(AMiktar, TerminalParametre.OpIslemNo);
    DoSaveNew(false);
  end;

  if TerminalParametre.Firma = 'Noya' then
  begin
    if TerminalParametre.OpSonIslemNo = TerminalParametre.OpIslemNo then
      AMiktar := 1;//DataApp.UretimKart.Table.Miktar;
    DoFinishOperasyon2(AMiktar, TerminalParametre.OpIslemNo);
    DoSaveNew(false);
  end;

end;

procedure TAppDOPUretimTerminalVeriGiris.DoSaveNew(const ShowKaynakIslemChild: Boolean = true);
begin
  if not DataApp.DataObject.Save then
  begin
    DocCustomProperties.AppForms.AppFormMessageDialog('Kayıt işleminde hata oluştu!');
    DataApp.DataObject.Cancel;
  end;

//  LocateUretimRotaRecord;
  DoOpenDocument;

//  if ShowKaynakIslemChild then
//    ShowThisDockPanel(FChildUretimKaynakIslem.DockPanel.Name);
end;

procedure TAppDOPUretimTerminalVeriGiris.DoSaveTest;
begin
  if DataApp.UretimKart.Table.UpdateStatus in [usModified, usInserted] then
    if DataApp.UretimKart.Table.ApplyUpdates(0) <> 0 then
      AppShowMessage('DataApp.UretimKart.Table Kaydetme Hatası');

  if DataApp.UretimRota.Table.UpdateStatus in [usModified, usInserted] then
    if DataApp.UretimRota.Table.ApplyUpdates(0) <> 0 then
      AppShowMessage('DataApp.UretimRota.Table Kaydetme Hatası');

  if DataApp.UretimRotaKaynak.Table.UpdateStatus in [usModified, usInserted] then
    if DataApp.UretimRotaKaynak.Table.ApplyUpdates(0) <> 0 then
      AppShowMessage('DataApp.UretimRotaKaynak.Table Kaydetme Hatası');

  if DataApp.UretimRotaKaynakIslem.Table.UpdateStatus in [usModified, usInserted] then
    if DataApp.UretimRotaKaynakIslem.Table.ApplyUpdates(0) <> 0 then
      AppShowMessage('DataApp.UretimRotaKaynakIslem.Table Kaydetme Hatası');

  if DataApp.UretimRotaKaynakOperasyon.Table.UpdateStatus in [usModified, usInserted] then
    if DataApp.UretimRotaKaynakOperasyon.Table.ApplyUpdates(0) <> 0 then
      AppShowMessage('DataApp.UretimRotaKaynakOperasyon.Table Kaydetme Hatası');

  if DataApp.UretimRotaKaynakDurus.Table.UpdateStatus in [usModified, usInserted] then
    if DataApp.UretimRotaKaynakDurus.Table.ApplyUpdates(0) <> 0 then
      AppShowMessage('DataApp.UretimRotaKaynakDurus.Table Kaydetme Hatası');

  if DataApp.UretimRotaKaynakHata.Table.UpdateStatus in [usModified, usInserted] then
    if DataApp.UretimRotaKaynakHata.Table.ApplyUpdates(0) <> 0 then
      AppShowMessage('DataApp.UretimRotaKaynakHata.Table Kaydetme Hatası');

  if DataApp.UretimEvrakBaslik.Table.UpdateStatus in [usModified, usInserted] then
    if DataApp.UretimEvrakBaslik.Table.ApplyUpdates(0) <> 0 then
      AppShowMessage('DataApp.UretimEvrakBaslik.Table Kaydetme Hatası');

  if DataApp.UretimSiparisHareket.Table.UpdateStatus in [usModified, usInserted] then
    if DataApp.UretimSiparisHareket.Table.ApplyUpdates(0) <> 0 then
      AppShowMessage('DataApp.UretimSiparisHareket.Table Kaydetme Hatası');

  if DataApp.UretimStokHareket.Table.UpdateStatus in [usModified, usInserted] then
    if DataApp.UretimStokHareket.Table.ApplyUpdates(0) <> 0 then
      AppShowMessage('DataApp.UretimStokHareket.Table Kaydetme Hatası');

  if DataApp.UretimStokHareketTeknik.Table.UpdateStatus in [usModified, usInserted] then
    if DataApp.UretimStokHareketTeknik.Table.ApplyUpdates(0) <> 0 then
      AppShowMessage('DataApp.UretimStokHareketTeknik.Table Kaydetme Hatası');
end;

procedure TAppDOPUretimTerminalVeriGiris.DoFilterUretimSiparisHareket(SarfYontem: TAppSarfYontem; MekanikSarfYontem: TAppMekanikSarfYontem);
var
  aSiparisNo: String;
  aEvrakNo: String;
  aUretimSiraNo: Integer;
begin
  aSiparisNo := DataApp.UretimRotaKaynak.Table.UretimNo;
  aEvrakNo := DataApp.UretimRotaKaynak.Table.EvrakNo;
  aUretimSiraNo := DataApp.UretimRotaKaynak.Table.UretimSiraNo;

  with FChildUretimTerminalReceteTuketim.Table.TableItems[0].Where do
  begin
    Clear;
    Add('KAYITTUR', wcEqual, 1);
    AddOperator(woAnd);
    Add('EVRAKTIP', wcEqual, 54);
    AddOperator(woAnd);
    Add('SIRKETNO', wcEqual, DataApp.CompanyNo);
    AddOperator(woAnd);
    Add('EVRAKNO', wcEqual, aSiparisNo);
    AddOperator(woAnd);
    Add('GIRISCIKIS', wcEqual, gcCikis);
    AddOperator(woAnd);
    Add('SIRANO2', wcEqual, aUretimSiraNo);
  end;

  with FChildUretimTerminalReceteTuketim.Table.TableItems[1].Where do
  begin
    Clear;
    Add('OPERASYONNO', wcEqual, TerminalParametre.OperasyonNo);
    AddOperator(woAnd);
    Add('KAYNAKISLEMNO', wcEqual, TerminalParametre.OpIslemNo);
  end;

  with FChildUretimTerminalReceteTuketim.Table.TableItems[2].Where do
  begin
    Clear;
    Add('SARFYONTEM', wcEqual, Integer(SarfYontem));
  end;
  FChildUretimTerminalReceteTuketim.Run;
end;

procedure TAppDOPUretimTerminalVeriGiris.DoFinishDurus;
begin
  ChildUretimTerminalDurusStepTwo.DoFinish;
  Exit;
  if DataApp.UretimRota.Table.Locate('OPERASYONNO', TerminalParametre.OperasyonNo, []) then
    if DataApp.UretimRotaKaynak.Table.Locate('KAYNAKKOD', TerminalParametre.KaynakKod, []) then
      if DataApp.UretimRotaKaynakIslem.Table.Locate('ISLEMNO', TerminalParametre.OpIslemNo, []) then
    begin
      DataApp.UretimRotaKaynakIslem.Table.Edit;
      DataApp.UretimRotaKaynakIslem.Table.Durum := odStarted;
      DataApp.UretimRotaKaynakIslem.Table.Post;
    end;
  if DataApp.DataObject.Save then
  begin
    DocCustomProperties.AppForms.AppFormMessageDialog('Duruş işlemi sonlandırıldı!');
    DoOpenDocument;
    ShowThisDockPanel(ChildUretimKaynakIslem.DockPanel.Name);
  end;

  Exit;


  DataApp.UretimRotaKaynakDurus.Table.Last;
  try
    DataApp.UretimRotaKaynakDurus.Table.Edit;
    DataApp.UretimRotaKaynakDurus.Table.Sure := Now() - DataApp.UretimRotaKaynakDurus.Table.BasTarihSaat;
    DataApp.UretimRotaKaynakDurus.Table.Post;
  finally
    if DataApp.DataObject.Save then
      DocCustomProperties.AppForms.AppFormMessageDialog('Duruş işlemi sonlandırıldı!');
  end;
end;


procedure TAppDOPUretimTerminalVeriGiris.DoCommand(CommandType: String);
var
  EvrakNo: String;
  EvrakSiraNo, EvrakTip: Integer;
begin
  if CommandType = 'DoStartHammaddeTuketim' then
  begin
    DoFilterUretimSiparisHareket(syManual, msyForward);
    ShowThisDockPanel(FChildUretimTerminalReceteTuketim.DockPanel.Name);
    FChildUretimTerminalReceteTuketim.DisableAllButtons;
    FChildUretimTerminalReceteTuketim.ParamsSelf.AppName := atReceteTuketimForHammaddeTuketim;
  end;

  if CommandType = 'DoStartHammaddeTuketimForOperasyon' then
  begin
    DoFilterUretimSiparisHareket(syManual, msyForward);
    ShowThisDockPanel(FChildUretimTerminalReceteTuketim.DockPanel.Name);
    FChildUretimTerminalReceteTuketim.DisableAllButtons;
    FChildUretimTerminalReceteTuketim.ParamsSelf.AppName := atReceteTuketimForOperasyon;
  end;

  if CommandType = 'DoStartAmbalajBilgileri' then
  begin
    EvrakNo := ChildUretimKaynakEvrakList.Table.FieldValues['URETIMNO'];
    EvrakSiraNo := ChildUretimKaynakEvrakList.Table.FieldValues['URETIMSIRANO'];
    EvrakTip := ChildUretimKaynakEvrakList.Table.FieldValues['EVRAKTIP'];

    ChildUretimAmbalajBilgileri.DoRun(EvrakNo, EvrakSiraNo, EvrakTip);
    if ChildUretimAmbalajBilgileri.Table.IsEmpty then
      DocCustomProperties.AppForms.AppFormMessageDialog('Bu işleme ait tüketilmesi istenen herhangi bir hammadde bilgisi bulunamadı.')
    else
      ShowThisDockPanel(ChildUretimAmbalajBilgileri.DockPanel.Name)
  end;

  if CommandType = 'DoStartOperasyon' then
  begin
    DoStartOperasyon(TerminalParametre.OpIslemNo);
    FChildUretimKaynakIslem.DoRun;
  end;

  if CommandType = 'DoFinishOperasyon' then
  begin
    DoFinishOperasyon;
    FChildUretimKaynakIslem.DoRun;
  end;

  if CommandType = 'DoAddHata' then
    ShowThisDockPanel(ChildUretimTerminalHataKart.DockPanel.Name);

  if CommandType = 'DoStartDurus' then
  begin
    TerminalParametre.DurusBilgileri.IslemNo := DataApp.UretimRotaKaynakOperasyon.Table.IslemNo;
    TerminalParametre.DurusBilgileri.DurusCommand := 1;
    ShowThisDockPanel(ChildUretimTerminalDurusStepOne.DockPanel.Name);
  end;

  if CommandType = 'DoFinishDurus' then
  begin
    TerminalParametre.DurusBilgileri.IslemNo := DataApp.UretimRotaKaynakOperasyon.Table.IslemNo;
    TerminalParametre.DurusBilgileri.DurusCommand := 2;
    DoFinishDurus;
  end;

  if CommandType = 'DoHMDegisim' then
    DoHMDegisim;
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateDocChilds;
begin
  inherited;
//  CreateObjects;
  CreateChildTerminalLogin;
  CreateChildUretimTerminalGiris;
  CreateChildUretimTerminalListe;
  CreateChildUretimKaynakList;
  CreateChildUretimTerminalKaliteEvrakList;

  {
  CreateChildUretimTerminalKaliteYenidenIslem;
  CreateChildUretimTerminalKaliteYenidenIslemSecim;
  }

  CreateChildUretimTerminalKaliteHMSecimHareket;
  CreateChildUretimTerminalKaliteHMSecim;
  CreateChildUretimTerminalHMDegisim;
  CreateChildUretimKaynakEvrakList;

//  if TerminalParametre.Firma = 'Kimteks' then
//  begin
//    CreateChildUretimTerminalUyariSistem;
//    CreateChildUretimDolumBilgileri;
//    CreateChildUretimAmbalajBilgileri;
//  end;

  CreateChildUretimEvrakBaslik;
  CreateChildUretimKart;
  CreateChildUretimRota;
  CreateChildUretimRotaKaynak;
  CreateChildUretimRotaKaynakIslem;
  CreateChildUretimRotaKaynakOperasyon;
  CreateChildUretimRotaKaynakDurus;
  CreateChildUretimRotaKaynakHata;
  CreateChildUretimSiparisHareket;
  CreateChildUretimStokHareket;

  CreateChildUretimKaynakIslem;
  CreateChildUretimKaynakIslemInfo;

  CreateChildUretimTerminalReceteTuketim;
  CreateChildUretimTerminalReceteTuketimList;
  CreateChildUretimTerminalManualTuketimStepOne;
  CreateChildUretimTerminalManualTuketimStepTwo;
  CreateChildUretimTerminalManualTuketimInfo;
  CreateChildUretimTerminalMalzemeBilgileri;
  CreateChildUretimTerminalMalzemeBilgileriGiris;
  CreateChildUretimTerminalDurusStepOne;
  CreateChildUretimTerminalDurusStepTwo;
  CreateChildUretimTerminalHataKart;
  CreateChildTerminalDurusIslemSecim;

  CreateChildUretimTerminalMalzemeDurusStepOne;
  CreateChildUretimTerminalMalzemeDurusStepTwo;
  CreateChildUretimTerminalMalzemeHataKart;

  CreateChildUretimTerminalKaliteDurusStepOne;
  CreateChildUretimTerminalKaliteDurusStepTwo;

  CreateChildUretimTerminalKaliteYenidenIslem;
  CreateChildUretimTerminalKaliteYenidenIslemSecim;

  CreateChildUretimTerminalReportDurusList;
  CreateChildSearchMamulTalimat;

  CreateChildUretimRotaKaynakNot;

  CreateObjects;
  CreateMenuItems;
  CreateForms;
  CreateRules;

  if TerminalParametre.Firma = 'Kimteks' then
  begin
    CreateChildUretimTerminalUyariSistem;
    CreateChildUretimDolumBilgileri;
    CreateChildUretimAmbalajBilgileri;
  end else
//  if TerminalParametre.Firma = 'Noya' then
//  begin
//    DocObject.MainForm.WindowState := wsMaximized;
//    DocObject.MainForm.BorderStyle := bsNone;
//    DocObject.MainForm.Align := alClient;
//  end;
end;

procedure TAppDOPUretimTerminalVeriGiris.CreateMenuItems;
//var
//  suAraclar: TdxBarSubItem;
begin
  inherited;
  //Araçlar
//  suAraclar := TdxBarSubItem(DocObject.DocBar.BarManager.GetItemByName('suAyarlar'));
//  DocObject.DocBar.BarManager.Bars.Clear;
//
//  suAraclar.ShoVisible := false;

//  DocObject.DocBar.CreateButton('btResetOperations', 'Sıfırla (Reset)', 'Araçlar', suAraclar, '', btRestartOperationsOnClick);
//  tdxBarButton(DocObject.DocBar.BarManager.GetItemByName('btResetOperations')).PaintStyle := psCaptionGlyph;

//  AParamsBar := DocObject.DocBar.CreateBar('barParams', 'Parametre Çubuğu');
//  AParamsBar.DockingStyle := dsTop;

//  baredSabitEvrakHareketTarih := DocObject.DocBar.CreateDateCombo('edEvrakSabitHareketTarihi', 'Sabit Evrak Hareket Tarihi', 'Evrak Tarih Ayarları');
//  baredSabitEvrakHareketTarih.Date := 2;

//  baredSabitEvrakHareketTarih := DocObject.DocBar.CreateDateCombo('baredSabitEvrakHareketTarih', 'Devir Tarihi', 'Parametreler', suParametreler, nil);
//  baredSabitEvrakHareketTarih := DocObject.DocBar.CreateDateCombo('baredSabitEvrakHareketTarih', 'Devir Tarihi', 'Parametreler', suParametreler, AParamsBar);

end;

procedure TAppDOPUretimTerminalVeriGiris.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.UretimKart.Table, 'URTKRT', 'Üretim Kart');
  Security.AddTable(DataApp.UretimRota.Table, 'URTROT', 'Rota');
  Security.AddTable(DataApp.UretimRotaKaynak.Table, 'URTROK', 'Rota Kaynak');
  Security.AddTable(DataApp.UretimRotaKaynakIslem.Table, 'URTRKI', 'Rota Kaynak Işlemleri');
  Security.AddTable(DataApp.UretimRotaKaynakOperasyon.Table, 'URTRKO', 'Rota Kaynak Operasyon');
  Security.AddTable(DataApp.UretimRotaKaynakDurus.Table, 'URTRKD', 'Rota Kaynak Duruş');
  Security.AddTable(DataApp.UretimRotaKaynakHata.Table, 'URTRKH', 'Rota Kaynak Hata');
  Security.AddTable(DataApp.UretimEvrakBaslik.Table, 'EVRBAS', 'Evrak Başlık');
  Security.AddTable(DataApp.UretimStokHareket.Table, 'STKHAR', 'Stok Hareket');
end;

procedure TAppDOPUretimTerminalVeriGiris.SetReport;
begin
  inherited;
end;

procedure TAppDOPUretimTerminalVeriGiris.TranslationChanged;
  procedure SetChildCaption(aChild: TAppDocChild; aCaption: String; const aButtonCaption: String = '');
  begin
    if aChild <> nil then
    begin
      aChild.Caption := aCaption;
      if not SameText(aButtonCaption, '') then
        aChild.ButtonCaption := aButtonCaption;
    end;
  end;
begin
  inherited;

  if AppName = AppSProductionConsts.AppName(odtUretimTerminalVeriGiris) then
    Caption := AppSProductionConsts.Caption(odtUretimTerminalVeriGiris);
end;

procedure TAppDOPUretimTerminalVeriGiris.DoTest;
  function ListSonrakiIslem: Smallint;
  begin
    DataApp.UretimRotaKaynakIslem.TableClone.IndexFieldNames := 'OPERASYONNO;KAYNAKKOD;KULLANILAN';
    DataApp.UretimRotaKaynakIslem.TableClone.SetRange([TerminalParametre.OperasyonNo, TerminalParametre.KaynakKod, 1], [TerminalParametre.OperasyonNo, TerminalParametre.KaynakKod, 1]);
    DataApp.UretimRotaKaynakIslem.TableClone.Filter := Format('ISLEMNO <> %0:d  AND DURUM <> %d AND ISLEMNO > %0:d ', [TerminalParametre.OpIslemNo, Integer(udFinished)]);
    DataApp.UretimRotaKaynakIslem.TableClone.Filtered := true;
    Result  := DataApp.UretimRotaKaynakIslem.TableClone.RecordCount;
  end;
  { ----------------------------------------------------------------------------- }
  procedure Calculate(fStringList: TStringList);
  var i: Integer;
      FTableClone: TTableUretimRotaKaynakIslem;
      fArray: Array of Smallint;
      vAktifIslemDurum: Smallint;
      vOncekiIslemDurum, vEylemTip: Smallint;
  var
    fArray_Accept: Smallint;
  begin
    FTableClone := TTableUretimRotaKaynakIslem.Create(nil);
    FTableClone.Name := DataApp.UretimRotaKaynakIslem.Table.Name;
    FTableClone.ProviderName := DataApp.UretimRotaKaynakIslem.Table.ProviderName;
    FTableClone.Connection := DataApp.DataObject.Connection;
    DataApp.UretimRotaKaynakIslem.Table.AddClone(FTableClone);
    FTableClone.IndexFieldNames := 'OPERASYONNO;KAYNAKKOD;KULLANILAN;ISLEMNO';

    SetLength(fArray, fStringList.Count);

    vAktifIslemDurum := DataApp.UretimRotaKaynakIslem.TableClone.FieldValues['DURUM'];
    vOncekiIslemDurum := DataApp.UretimRotaKaynakIslem.TableClone.FieldValues['ONCEKIISLEMDURUM'];
    vEylemTip := DataApp.UretimRotaKaynakIslem.TableClone.FieldValues['EYLEMTIP'];

    for i := 0 to fStringList.Count -1 do
    begin
      FTableClone.SetRange([TerminalParametre.OperasyonNo, TerminalParametre.KaynakKod, 1, fStringList[i]], [TerminalParametre.OperasyonNo, TerminalParametre.KaynakKod, 1, fStringList[i]]);
      if fTableClone.Durum = vOncekiIslemDurum then fArray[i] := 1 else fArray[i] := 0;
    end;

    fArray_Accept := 0;
    for i := low(fArray) to high(fArray) do
    begin
      if fArray[i] = 1 then
        fArray_Accept := fArray_Accept + 1;
    end;

    if fStringList.Count = fArray_Accept then
    begin
      if vAktifIslemDurum = odNone then
      begin
        DataApp.UretimRotaKaynakIslem.TableClone.Edit;
        DataApp.UretimRotaKaynakIslem.TableClone.FieldValues['DURUM'] := vEylemTip;
        DataApp.UretimRotaKaynakIslem.TableClone.Post;
      end;
    end;
//    else
//      AppShowMessage(IntToStr(FTableClone.IslemNo) + ' : ' + IntToStr(FTableClone.RecordCount) + ' Þartı Kullanım Için Uygun Değil!')
  end;
  { ----------------------------------------------------------------------------- }
  procedure SplitFormul;
  var
    fError: Boolean;
    pOncekiIslemNo: String;
    fStringList: TStringList;
    fDelimiter: String;
    i: Integer;
    iValue, iCode: Integer;
  begin
    fError := false;
    pOncekiIslemNo := DataApp.UretimRotaKaynakIslem.TableClone.FieldValues['ONCEKIISLEMNO'];

    fDelimiter := '|'; // Ve

    fStringList := TStringList.Create;
    fStringList.Text := pOncekiIslemNo;
    fStringList.Text := StringReplace(fStringList.Text, fDelimiter, #13#10, [rfReplaceAll]);

    for i := 0 to fStringList.Count -1 do
    begin
      val(fStringList[i] , iValue, iCode);
      if iCode <> 0 then
      begin
        ShowMessage(fStringList[i] + ' Formülasyon Yapısı Geçersiz!');
        fError := true;
        Break;
      end;
    end;

    if (not fError) and (fStringList.Count >0) then { girilen formül sayısal bir değerse fError = false }
      Calculate(fStringList);

    fStringList.Free;
  end;
  { ----------------------------------------------------------------------------- }
begin
  if ListSonrakiIslem > 0 then
  begin
    DataApp.UretimRotaKaynakIslem.TableClone.First;
    while not DataApp.UretimRotaKaynakIslem.TableClone.Eof do
    begin
      if DataApp.UretimRotaKaynakIslem.TableClone.FieldValues['ONCEKIISLEMNO'] <> '' then
      begin
        SplitFormul;
      end;
      DataApp.UretimRotaKaynakIslem.TableClone.Next;
    end;
  end;
end;

{ TTerminalParametre }
constructor TTerminalParametre.Create(AOwner: TAppDOPUretimTerminalVeriGiris);
begin
  FDOP := AOwner;
  FDataApp := AOwner.DataApp;
  FKaynakIslem := TTerminalParametre_KaynakIslem.Create(AOwner);

  FClassKaliteKontrol := TClassKaliteKontrol.Create(AOwner);
  FReceteTuketim := TTerminalParametre_ReceteTuketim.Create(AOwner.DataApp);
  FDurusBilgileri := TTerminalParametre_DurusBilgileri.Create(AOwner.DataApp);

  with TIniFile.Create(ExtractFilePath(Application.ExeName) + '\CPMAppXPServer.ini') do
    FTerminalKod := ReadString('UretimTerminalSettings', 'UretimTerminalCode', '');

  if SameText(FTerminalKod, '') then
    AppShowMessage('Terminal Kodu Okunamadı!' + #13+ 'Lütfen Terminal Ayarlarını Kontrol Edin.');
end;

{ TAppRuleUretimRota }
constructor TAppRuleUretimRota.Create(AOwner: TAppDOPUretimTerminalVeriGiris);
begin
  inherited Create;
  FDocApp := AOwner;
  AddRule(FDocApp.DataApp.UretimRota.Table);
end;

procedure TTerminalParametre.ReadDateSettingsFromIniFile;
var
  vDateType: Smallint;
  vDate: TDate;
begin
  with TIniFile.Create(ExtractFilePath(Application.ExeName) + '\CPMAppXPServer.ini') do
  begin
    vDateType := ReadInteger('UretimTerminalDateSettings', 'DateType', DateSettings_DateType_Otomatik);
    vDate := ReadDate('UretimTerminalDateSettings', 'Date', Date);
  end;

  if vDateType = DateSettings_DateType_Otomatik then
  begin
    OpDateSettings_DateType := vDateType;
    OpDateSettings_Date := Date;
    OpDateSettings_Time := Now;
  end else
  if vDateType = DateSettings_DateType_SabitTarih then
  begin
    OpDateSettings_DateType := vDateType;
    OpDateSettings_Date := vDate;
    OpDateSettings_Time := Now;
  end else
  if vDateType = DateSettings_DateType_TarihSor then
  begin
    OpDateSettings_DateType := vDateType;
    OpDateSettings_Date := EncodeDate(1900, 01, 01);
    OpDateSettings_Time := EncodeTime(0, 0, 0, 0);
  end;
end;

function TTerminalParametre.GetEvrakUretimSaat: TDateTime;
var
  vTarihSaat: TDateTime;
  vDate: TDate;
  vTime: TTime;
  vYil, vAy, vGun, vSaat, vDakika, vSaniye, vSalise: Word;
begin
  ReadDateSettingsFromIniFile;

  vDate := OpDateSettings_Date;
  vTime := OpDateSettings_Time;

  vTarihSaat := vTime;

  if OpDateSettings_DateType = DateSettings_DateType_Otomatik then
  begin
    vTarihSaat := Now;
  end;

  if OpDateSettings_DateType = DateSettings_DateType_SabitTarih then
  begin
    DecodeDateTime(Now, vYil, vAy, vGun, vSaat, vDakika, vSaniye, vSalise);
    vTime := EncodeTime(vSaat, vDakika, vSaniye, vSalise);

    vTarihSaat := vDate + vTime;
  end;


  if OpDateSettings_DateType = DateSettings_DateType_TarihSor then
  begin
    DOP.DocFormSettings.PageControl.ActivePageIndex := 1;
    DOP.DocFormSettings.PanelTarihSaat_Saat.Visible := false;
    DOP.DocFormSettings.ShowModal;

    vDate := OpDateSettings_Date;
    vTime := OpDateSettings_Time;

    vTarihSaat := vDate + vTime;
  end;
  Result := vTarihSaat;
end;

function TTerminalParametre.GetEvrakUretimTarih: TDate;
var
  vTarih: TDate;
  vDate: TDate;
  vYil, vAy, vGun, vSaat, vDakika, vSaniye, vSalise: Word;
begin
  ReadDateSettingsFromIniFile;

  vDate := OpDateSettings_Date;
  vTarih := vDate;

  if OpDateSettings_DateType = DateSettings_DateType_Otomatik then
  begin
    vTarih := Date;
  end;

  if OpDateSettings_DateType = DateSettings_DateType_SabitTarih then
  begin
    DecodeDateTime(Now, vYil, vAy, vGun, vSaat, vDakika, vSaniye, vSalise);
    vTarih := vDate;
  end;


  if OpDateSettings_DateType = DateSettings_DateType_TarihSor then
  begin
    DOP.DocFormSettings.PageControl.ActivePageIndex := 1;
    DOP.DocFormSettings.PanelTarihSaat_Saat.Visible := false;
    DOP.DocFormSettings.ShowModal;

    vDate := OpDateSettings_Date;
    vTarih := vDate;
  end;
  Result := vTarih;
end;

procedure TAppRuleUretimRota.DoAfterScroll(Table: TAppCustomTable);
begin
  inherited;
end;


{ TAppDateEntryForm }

constructor TAppDateEntryForm.Create(Owner: TAppDOPUretimTerminalVeriGiris;
  const ShowDate: Boolean = true; const ShowTime: Boolean = true; const Caption: String = '');
begin
  FDOP := Owner;

  CreateForm;
  FDOP.DocFormSettings.PanelTarihSaat_Tarih.Visible := ShowDate;
  FDOP.DocFormSettings.PanelTarihSaat_Saat.Visible := ShowTime;

  if Caption = '' then
    FDOP.DocFormSettings.PanelTarihSaat_Caption.Caption := 'Işlem Tarih ve Saat Bilgisini Girin'
  else
    FDOP.DocFormSettings.PanelTarihSaat_Caption.Caption := Caption;
  FDOP.DocFormSettings.ShowModal;
end;

procedure TAppDateEntryForm.CreateForm;
begin
  FDOP.DocFormSettings.PageControl.ActivePageIndex := 1;
  FDOP.DocFormSettings.edtPanelTarihSaat_Tarih.Date := Date;
  FDOP.DocFormSettings.edtPanelTarihSaat_Saat.Time := Time;
end;

{ TTerminalBarcode }

constructor TTerminalBarcode.Create(AOwner: TAppDAPCustomUretimKart);
begin
  FDataApp := AOwner;
end;

{ TTerminalTableIndex }

constructor TTerminalTableIndex.Create(AOwner: TAppDAPCustomUretimKart);
begin
  FDataApp := AOwner;

  FNewIndeks_TableUretimRota := 'OPERASYONNO';
  FNewIndeks_TableUretimRotaKaynak := 'OPERASYONNO;KAYNAKKOD;KULLANILAN';

  FOldIndeks_TableUretimRota := AOwner.UretimRota.Table.IndexFieldNames;
  FOldIndeks_TableUretimRotaKaynak := AOwner.UretimRotaKaynak.Table.IndexFieldNames;
  FOldIndeks_TableUretimRotaKaynakIslem := AOwner.UretimRotaKaynakIslem.Table.IndexFieldNames;
  FOldIndeks_TableUretimRotaKaynakOperasyon := AOwner.UretimRotaKaynakOperasyon.Table.IndexFieldNames;
end;

{ TTerminalParametre_ReceteTuketim }

constructor TTerminalParametre_ReceteTuketim.Create(
  AOwner: TAppDAPCustomUretimKart);
begin
  FDataApp := AOwner;
end;

{ TTerminalParametre_DurusBilgileri }

constructor TTerminalParametre_DurusBilgileri.Create(
  AOwner: TAppDAPCustomUretimKart);
begin
  FDataApp := AOwner;
  IslemNo := 0;
  DurusCommand := 0;
end;

{ TTerminalParametre_KaynakIslem }

constructor TTerminalParametre_KaynakIslem.Create(AOwner: TAppDOPUretimTerminalVeriGiris);
begin
  FDop := AOwner;
  FDataApp := AOwner.DataApp;
  FirstIslemNo := 0;
  LastIslemNo := 0;
end;

procedure TTerminalParametre_KaynakIslem.GetFirstLastIslemNo;
var
  ASql: String;
begin
  FirstIslemNo := 0;
  LastIslemNo := 0;

  ASql := '';
  ASql := ASql + '  Select ';
  ASql := ASql + '    MIN(ISLEMNO) AS FIRSTISLEMNO, MAX(ISLEMNO) AS LASTISLEMNO ';
  ASql := ASql + '  From URTRKI ';
  ASql := ASql + '  Where SIRKETNO      = ' + QuotedStr(FDataApp.CompanyNo);
  ASql := ASql + '    And EVRAKNO       = ' + QuotedStr(FDataApp.UretimRota.Table.EvrakNo);
  ASql := ASql + '    And EVRAKTIP      = 54 ';
  ASql := ASql + '    And URETIMNO      = ' + QuotedStr(FDataApp.UretimRota.Table.UretimNo);
  ASql := ASql + '    And URETIMSIRANO  = ' + IntToStr(FDataApp.UretimRota.Table.UretimSiraNo);
  ASql := ASql + '    And OPERASYONNO   = ' + IntToStr(FDataApp.UretimRota.Table.OperasyonNo);
  ASql := ASql + '    AND KAYNAKKOD     = ' + QuotedStr(FDataApp.UretimRotaKaynakIslem.Table.KaynakKod);
  ASql := ASql + '    AND KULLANILAN    = 1';
  FDataApp.TableCommand.OpenCommandText(ASql);

  if not FDataApp.TableCommand.IsEmpty then
  begin
    FirstIslemNo := FDataApp.TableCommand.FieldValues['FIRSTISLEMNO'];
    LastIslemNo := FDataApp.TableCommand.FieldValues['LASTISLEMNO'];
  end
end;

{ TClassKaliteKontrol }

constructor TClassKaliteKontrol.Create(AOwner: TAppDOPUretimTerminalVeriGiris);
begin
  FDop := AOwner;
  FChildKaynakEvrakList := FDop.ChildUretimKaynakList;
  FChildKaliteEvrakList := FDop.ChildUretimTerminalKaliteEvrakList;
end;

procedure TClassKaliteKontrol.DoLoadParameters;
begin
end;

procedure TClassKaliteKontrol.DoOpenDocument;
begin
  FDop.TerminalParametre.SirketNo := FDop.DataApp.CompanyNo;
  FDop.TerminalParametre.EvrakNo := FDop.ChildUretimTerminalKaliteEvrakList.Table.FieldValues['EVRAKNO'];
  FDop.TerminalParametre.EvrakTip := FDop.ChildUretimTerminalKaliteEvrakList.Table.FieldValues['EVRAKTIP'];

  FDop.TerminalParametre.UretimNo := FDop.ChildUretimTerminalKaliteEvrakList.Table.FieldValues['URETIMNO'];
  FDop.TerminalParametre.UretimSiraNo := FDop.ChildUretimTerminalKaliteEvrakList.Table.FieldValues['URETIMSIRANO'];
  FDop.TerminalParametre.OperasyonNo := FDop.ChildUretimTerminalKaliteEvrakList.Table.FieldValues['OPERASYONNO'];
  FDop.TerminalParametre.KaynakKod := FDop.ChildUretimTerminalKaliteEvrakList.Table.FieldValues['KAYNAKKOD'];
  FDop.TerminalParametre.IslemNo := FDop.ChildUretimTerminalKaliteEvrakList.Table.FieldValues['ISLEMNO'];
  FDop.TerminalParametre.OpIslemNo := FDop.ChildUretimTerminalKaliteEvrakList.Table.FieldValues['ISLEMNO'];
  FDop.TerminalParametre.OpDurum := FDop.ChildUretimTerminalKaliteEvrakList.Table.FieldValues['DURUM'];

  FDop.DataApp.UretimRota.Table.IndexFieldNames := FDop.TerminalTableIndex.OldIndeks_TableUretimRota;
  FDop.DataApp.UretimRotaKaynak.Table.IndexFieldNames := FDop.TerminalTableIndex.OldIndeks_TableUretimRotaKaynak;
  FDop.DataApp.UretimRotaKaynakIslem.Table.IndexFieldNames := FDop.TerminalTableIndex.OldIndeks_TableUretimRotaKaynakIslem;

  FDop.DataApp.DataObject.OptionsKey.KeyValues['SIRKETNO'] := FDop.TerminalParametre.SirketNo;
  FDop.DataApp.DataObject.OptionsKey.KeyValues['EVRAKTIP'] := FDop.TerminalParametre.EvrakTip;
  FDop.DataApp.DataObject.OptionsKey.KeyValues['EVRAKNO'] := FDop.TerminalParametre.EvrakNo;
  FDop.DataApp.DataObject.Open;

  FDop.DataApp.UretimRota.Table.IndexFieldNames := FDop.TerminalTableIndex.NewIndeks_TableUretimRota;
  FDop.DataApp.UretimRota.Table.SetRange([FDop.TerminalParametre.OperasyonNo], [FDop.TerminalParametre.OperasyonNo]);


  FDop.DataApp.UretimRotaKaynak.Table.IndexFieldNames := FDop.TerminalTableIndex.NewIndeks_TableUretimRotaKaynak;
  FDop.DataApp.UretimRotaKaynak.Table.SetRange([FDop.TerminalParametre.OperasyonNo, FDop.TerminalParametre.KaynakKod, 1],
                                               [FDop.TerminalParametre.OperasyonNo, FDop.TerminalParametre.KaynakKod, 1]);

  FDop.DataApp.UretimRotaKaynakOperasyon.Table.Locate('ISLEMNO', FDop.TerminalParametre.IslemNo, []);
end;

initialization
  AppRegisterDOPClass(TAppDOPUretimTerminalVeriGiris);

end.

