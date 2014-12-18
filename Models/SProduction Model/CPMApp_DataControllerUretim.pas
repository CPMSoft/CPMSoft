unit CPMApp_DataControllerUretim;

interface

uses Windows, Classes, SysUtils, DB, Dialogs,
  CPMApp_DB, CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_TableUretimSystem, CPMApp_TableStokSystem, CPMApp_TableCariSystem,
  CPMApp_DataControllerBOMObject, CPMApp_DataControllerStokDurum,
  CPMApp_BOMConsts;

type
  TAppMamulKullanimSekli = (mksStok, mksUret, mksStokUret, mksAlternatif, mksVariant);
  TAppUretimKullanimSekli = (uksDefault, uksStok, uksUret, uksStokUret);

  TAppUretimRota = class;
  TAppBaseMamulKart = class;
  TAppMamulKart = class;
  TAppAnaMamulKart = class;
  TAppUretimRotaKaynak = class;
  TAppDataControllerMaliyet = class;
  TAppDataControllerBaseUretim = class;
  TAppDataControllerUretim = class;

  TAppUretimParams = class
  private
    FMaliyetTip: TAppMaliyetTip;
    FSirketNo: String;
    FUretimNo: String;
    FEvrakNo: String;
    FAnaMamulKod: String;
    FHesapKod: String;
    FEvrakTarih: TDateTime;
    FKullanimSekli: TAppUretimKullanimSekli;
    FUretimSiraNo: Integer;
    FIslemTip: Integer;
    FEvrakTip: Integer;
    FUretimTip: Integer;
    FUseLot: Boolean;
    FAutoLot: Boolean;
  published
    property EvrakTip: Integer read FEvrakTip write FEvrakTip;
    property IslemTip: Integer read FIslemTip write FIslemTip;
    property UretimTip: Integer read FUretimTip write FUretimTip;
    property MaliyetTip: TAppMaliyetTip read FMaliyetTip write FMaliyetTip;
    property SirketNo: String read FSirketNo write FSirketNo;
    property UretimNo: String read FUretimNo write FUretimNo;
    property UretimSiraNo: Integer read FUretimSiraNo write FUretimSiraNo;
    property EvrakNo: String read FEvrakNo write FEvrakNo;
    property EvrakTarih: TDateTime read FEvrakTarih write FEvrakTarih;
    property HesapKod: String read FHesapKod write FHesapKod;
    property AnaMamulKod: String read FAnaMamulKod write FAnaMamulKod;
    property KullanimSekli: TAppUretimKullanimSekli read FKullanimSekli write FKullanimSekli;
    property UseLot: Boolean read FUseLot write FUseLot;
    property AutoLot: Boolean read FAutoLot write FAutoLot;
  end;

  TAppDataMaliyet = record
    Maliyet1: Double;
    Maliyet2: Double;
    Maliyet3: Double;
  end;

  TAppTreeData = class
    MalKod: String;
    VersiyonNo: String;
    MalAd: String;
    SiraNo: Integer;
    BirimMiktar: Double;
    Miktar: Double;
    KullanilanMiktar: Double;
    DovizCins: String;
    KullanimSekli: TAppMamulKullanimSekli;
    Bitti: Boolean;
    DepoKod: String;
    SeriNo: String;
    SeriNo2: String;
    Parent: TAppTreeData;
  end;

  TAppTreeDataList = class
  private
    FList: TList;
    FOwner: TAppBaseMamulKart;
  public
    constructor Create(AOwner: TAppBaseMamulKart);
    destructor Destroy; override;
    procedure Clear;
    function Add(ATable: TTableUretimHareket): TAppTreeData;
  end;

  // ************* BEGIN RULES ***********************
  TAppRuleStokHareket = class(TAppTableRule)
  private
    FTable: TTableStokHareket;
    FUretim: TAppDataControllerUretim;
  protected
    procedure DoAfterScroll(Table: TAppCustomTable); override;
    procedure DoAfterPost(Table: TAppCustomTable); override;
    procedure DoBeforeDelete(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDataControllerUretim);
  end;

  TAppRuleUretimKart = class(TAppTableRule)
  private
    FTableCommand: TAppDBTable;
    FTableUretimKart: TTableUretimKart;
    FUretim: TAppDataControllerUretim;
    InUse: Boolean;
    FOldMamulKod: String;
    FOldVersiyonNo: String;
    FOldHesapKod: String;
    FOldEvrakNo: String;
    FOldSiraNo: Integer;
    procedure SetDataController;
    function GetMamulDepoKod(MamulKod, VersiyonNo: String): String;
    procedure SetOldValues;
  protected
    procedure DoAfterDelete(Table: TAppCustomTable); override;
    procedure DoAfterPost(Table: TAppCustomTable); override;
    procedure DoAfterScroll(Table: TAppCustomTable); override;
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoBeforeEdit(Table: TAppCustomTable); override;
    procedure DoBeforeDelete(Table: TAppCustomTable); override;
    procedure DoBeforePost(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDataControllerUretim);
    destructor Destroy; override;
  end;

  TAppRuleUretimBaglanti = class(TAppTableRule)
  private
    FUretim: TAppDataControllerUretim;
    FTableUretimBaglanti: TTableUretimBaglanti;
    FTableEvrakKaynak: TTableEvrakKaynak;
    FTableStokHareket: TTableStokHareket;
    FTableUretimKart: TTableUretimKart;
    procedure AddEvrakKaynak;
  protected
    procedure DoAfterPost(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDataControllerUretim);
    destructor Destroy; override;
  end;

  TAppRuleUretimBaslik = class(TAppTableRule)
  private
    InUse: Boolean;
    FTableUretimBaslik: TTableUretimBaslik;
    FUretim: TAppDataControllerUretim;
  protected
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
  public
    constructor Create(AOwner: TAppDataControllerUretim);
  end;

  TAppRuleAnaMamulKart = class(TAppTableRule)
  private
    FTable: TTableMamulKart;
    FAnaMamulKart: TAppAnaMamulKart;
    FInUse: Boolean;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
    procedure DoAfterPost(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppAnaMamulKart);
  end;
  // ************* END OF RULES ***********************

  TAppUretimKaynakTahsisat = class
  private
    FUretim: TAppDataControllerBaseUretim;
    FTableUretimKaynakTahsisat: TTableUretimKaynakTahsisat;
    FTableCloneUretimKaynakTahsisat: TTableUretimKaynakTahsisat;
  public
    constructor Create(AOwner: TAppDataControllerBaseUretim); virtual;
    destructor Destroy; override;
    procedure Add(ATableUretimRotaKaynak: TTableUretimRotaKaynak); // disabled
  end;

  TAppUretimRotaKaynak = class
  private
    FUretim: TAppDataControllerBaseUretim;
    FUretimRota: TAppUretimRota;
    FTableUretimRotaKaynak: TTableUretimRotaKaynak; // URTROK
    FTableCloneUretimRotaKaynak: TTableUretimRotaKaynak; // URTROK
    function FindKaynakOncekiMamul(AKaynakKod: String; AUretimSiraNo: Integer): String;
    procedure FindKullanilan(AUretimSiraNo, AOperasyonNo: Integer);
    procedure Delete(AUretimSiraNo: Integer);
  public
    constructor Create(AOwner: TAppUretimRota); virtual;
    destructor Destroy; override;
    procedure Add(AMamulKod: String; AVersiyonNo: String; AOperasyonNo: Integer);
  end;

  TAppUretimRota = class
  private
    FMamulKart: TAppBaseMamulKart;
    FUretim: TAppDataControllerBaseUretim;
    FTableUretimRota: TTableUretimRota; // URTROT
    FTableUretimHareket: TTableUretimHareket;
    FUretimRotaKaynak: TAppUretimRotaKaynak; // URTHAR
    procedure Add;
    procedure Delete(AUretimSiraNo: Integer);
    procedure FetchToUretimHareket;
  public
    constructor Create(AOwner: TAppBaseMamulKart); virtual;
    destructor Destroy; override;
  published
    property TableUretimRota: TTableUretimRota read FTableUretimRota;
    property UretimRotaKaynak: TAppUretimRotaKaynak read FUretimRotaKaynak;
  end;

  TAppUretimKaynakSonDurum = class
  private
    FUretim: TAppDataControllerBaseUretim;
    FTableFindKaynakSonDurum: TTableUretimKaynakSonDurum; // URTKYS
    FTableKaynakSonDurum: TTableUretimKaynakSonDurum; // URTKYS
    procedure SetDefinition;
    function Add(AKaynakKod: String): Boolean;
  public
    constructor Create(AOwner: TAppDataControllerBaseUretim); virtual;
    destructor Destroy; override;
    function Find(AKaynakKod: String): Boolean;
  end;

  TAppBaseMamulKart = class
  private
    FTable: TTableMamulKart;
    FTableUretimHareket: TTableUretimHareket;
    FUretim: TAppDataControllerBaseUretim;
    FData: TAppTreeData;
    FTimeOpen: Cardinal;
    FTableClone: TTableMamulKart;
    FRota: TAppUretimRota;
    procedure SetData(const Value: TAppTreeData);
    procedure FetchToHareket;
    procedure FetchForTersHareket(ASiraNo: Integer);
  protected
    procedure InitData; virtual;
  public
    constructor Create(AOwner: TAppDataControllerBaseUretim); virtual;
    destructor Destroy; override;
    function GetKullanimSekli(AUretimKullanimSekli: TAppUretimKullanimSekli;
      AMamulKullanimSekli: TAppMamulKullanimSekli): TAppMamulKullanimSekli;
    procedure Open; virtual;
    procedure GetMamulKartKullanimSekli; virtual;
    function Add: TAppDataMaliyet; virtual;
    procedure GetData(AData: TAppTreeData);
  published
    property Table: TTableMamulKart read FTable;
    property TableClone: TTableMamulKart read FTableClone; // For User Interface
    property Data: TAppTreeData read FData write SetData;
  end;

  TAppMamulKart = class(TAppBaseMamulKart)
  private
    procedure SetTableDefinition;
    procedure AddWhere;
  protected
    procedure InitData; override;
  public
    procedure Open; override;
    procedure GetMamulKartKullanimSekli; override;
  published
  end;

  TAppAnaMamulKart = class(TAppBaseMamulKart)
  private
    FRule: TAppRuleAnaMamulKart;
    FTableBaslik: TTableMamulBaslik;
    procedure SetBaslikDefinition;
    procedure AddMalKod;
    procedure AddToHareket;
    procedure OpenBaslik;
  protected
    procedure InitData; override;
  public
    constructor Create(AOwner: TAppDataControllerBaseUretim); override;
    destructor Destroy; override;
    function Add: TAppDataMaliyet; override;
    procedure Open; override;
    procedure Delete(AMalKod: String; AVersiyonNo: String);
    procedure Range;
    procedure RangeClone;
    procedure Clear;
    procedure UpdateMiktar;
  published
    property TableBaslik: TTableMamulBaslik read FTableBaslik;
  end;

  TAppDataControllerMaliyet = class
  private
    FUretim: TAppDataControllerBaseUretim;
    FTable: TAppDBTable;
  public
    constructor Create(AOwner: TAppDataControllerBaseUretim);
    destructor Destroy; override;
    procedure Maliyet(AMalkod: String; AMiktar: Double);
  published
  end;

  TAppLotDurum = class
  private
    FUretim: TAppDataControllerUretim;
    FTableLotDurum: TAppDBTable;
    FTableUretimHareket: TTableUretimHareket;
    FTableStokHareket: TTableStokHareket;
    procedure SetDefinition;
    procedure Open(AMalKod, AVersiyonNo, ADepoKod: String);
    procedure AddStokHareketFromLot(AUretimSiraNo: Integer);
    procedure AddStokHareketByLot(AUretimSiraNo: Integer; const AMiktar: Double = -1;
      const ADepoKod: String = '');
  public
    constructor Create(AOwner: TAppDataControllerUretim);
    destructor Destroy; override;
    function Validate(AShowError, AConfirmError: Boolean): Boolean;
    procedure Add;
  published
    property TableLotDurum: TAppDBTable read FTableLotDurum;
  end;

  

  TAppDataControllerBaseUretim = class
  private
    FMaliyet: TAppDataControllerMaliyet;
    FMamulKart: TAppMamulKart;
    FParams: TAppUretimParams;
    FAnaMamulKart: TAppAnaMamulKart;
    FKaynakSonDurum: TAppUretimKaynakSonDurum;
    FUretimKaynakTahsisat: TAppUretimKaynakTahsisat;
    FTableUretimHareket: TTableUretimHareket;
    FTableCloneUretimHareket: TTableUretimHareket;
    FTableCloneUretimHareket2: TTableUretimHareket;
    FTableUretimRota: TTableUretimRota;
    FTableUretimRotaKaynak: TTableUretimRotaKaynak;
    FTableUretimKaynakTahsisat: TTableUretimKaynakTahsisat;
    FdcBOMObject: TAppDataControllerBOMObject;
    function AddMaliyet(ASiraNo: Integer; AMaliyet: TAppDataMaliyet): TAppDataMaliyet;
    function Find(ASiraNo: Integer): Boolean;
    function GetConnection: TAppConnection;
  protected
    procedure AddEvrakBaslik; virtual;
    procedure AddStokHareket(AUretimSiraNo: Integer; const AMiktar: Double = -1;
      const ADepoKod: String = ''; const ASeriNo: String = ''; ASeriNo2: String = ''); virtual;
    procedure AddStokHareketByLot(AUretimSiraNo: Integer; const AMiktar: Double = -1;
      const ADepoKod: String = ''); virtual;
    procedure UpdateMaliyetStokHareket(AUretimSiraNo: Integer); virtual;
  public
    constructor Create(ATableUretimHareket: TTableUretimHareket; ATableUretimRota: TTableUretimRota;
      ATableUretimRotaKaynak: TTableUretimRotaKaynak; ATableUretimKaynakTahsisat: TTableUretimKaynakTahsisat); virtual;
    destructor Destroy; override;
    procedure Add; virtual;
    property Connection: TAppConnection read GetConnection;
  published
    property dcBOMObject: TAppDataControllerBOMObject read FdcBOMObject;
    property AnaMamulKart: TAppAnaMamulKart read FAnaMamulKart;
    property MamulKart: TAppMamulKart read FMamulKart;
    property Maliyet: TAppDataControllerMaliyet read FMaliyet;
    property Params: TAppUretimParams read FParams;
    property TableUretimHareket: TTableUretimHareket read FTableUretimHareket;
    property TableUretimRota: TTableUretimRota read FTableUretimRota;
  end;

  TAppDataControllerUretim = class(TAppDataControllerBaseUretim)
  private
    FTableUretimKart: TTableUretimKart;
    FTableEvrakBaslik: TTableEvrakBaslik;
    FTableStokHareket: TTableStokHareket;
    FTableStokMaliyet: TTableStokMaliyet;
    FTableUretimBaslik: TTableUretimBaslik;
    FRuleUretimBaslik: TAppRuleUretimBaslik;
    FRuleUretimKart: TAppRuleUretimKart;
    FRuleUretimBaglanti: TAppRuleUretimBaglanti;
    FRuleStokHareket: TAppRuleStokHareket;
    FTableCloneStokHareket: TTableStokHareket;
    FLotDurum: TAppLotDurum;
    FTableEvrakKaynak: TTableEvrakKaynak;
    FTableUretimBaglanti: TTableUretimBaglanti;
    procedure AddStokMaliyet;
    procedure DeleteStokMaliyet;
    procedure DisableControls;
    procedure EnableControls;
    function FindCloneStokHareket(AUretimSiraNo: Integer): Boolean;
    procedure SetTableUretimBaslik(const Value: TTableUretimBaslik);
    procedure SetTableUretimKart(const Value: TTableUretimKart);
    procedure SetTableUretimBaglanti(const Value: TTableUretimBaglanti);
  protected
    procedure AddEvrakBaslik; override;
    procedure AddStokHareket(AUretimSiraNo: Integer; const AMiktar: Double = -1;
      const ADepoKod: String = ''; const ASeriNo: String = ''; ASeriNo2: String = ''); override;
    procedure AddStokHareketByLot(AUretimSiraNo: Integer; const AMiktar: Double = -1;
      const ADepoKod: String = ''); override;
    procedure UpdateMaliyetStokHareket(AUretimSiraNo: Integer); override;
    procedure DeleteStokHareket(AUretimSiraNo: Integer);
  public
    constructor Create(ATableUretimHareket: TTableUretimHareket; ATableUretimRota: TTableUretimRota;
      ATableUretimRotaKaynak: TTableUretimRotaKaynak; ATableUretimKaynakTahsisat: TTableUretimKaynakTahsisat;
      ATableStokHareket: TTableStokHareket); reintroduce;
    destructor Destroy; override;
    procedure DeleteUretimSiraNo(AUretimSiraNo: Integer);
    procedure DeleteEvrakBaslik(AHesapKod, AEvrakNo: String);
    procedure Add; override;
    procedure AddAll;
  published
    property LotDurum: TAppLotDurum read FLotDurum;
    property TableUretimBaslik: TTableUretimBaslik read FTableUretimBaslik write SetTableUretimBaslik;
    property TableUretimKart: TTableUretimKart read FTableUretimKart write SetTableUretimKart;
    property TableUretimBaglanti: TTableUretimBaglanti read FTableUretimBaglanti write SetTableUretimBaglanti;
    property TableEvrakBaslik: TTableEvrakBaslik read FTableEvrakBaslik write FTableEvrakBaslik;
    property TableStokHareket: TTableStokHareket read FTableStokHareket;
    property TableEvrakKaynak: TTableEvrakKaynak read FTableEvrakKaynak write FTableEvrakKaynak;
    property TableStokMaliyet: TTableStokMaliyet read FTableStokMaliyet write FTableStokMaliyet;
    property TableCloneStokHareket: TTableStokHareket read FTableCloneStokHareket;
  end;
const
  mksHammadde = -1;
implementation

uses Variants, DateUtils, CPMApp_DBLibrary, CPMApp_Math, CPMApp_Dialogs,
  CPMApp_DocumentConsts, CPMApp_TableItems;

{ TAppBaseMamulKart }

function TAppBaseMamulKart.Add: TAppDataMaliyet;
var
  AMamulList: TAppTreeDataList;
  I: Integer;
  AMaliyet: TAppDataMaliyet;
  AData: TAppTreeData;
  AChildData: TAppTreeData;
  AMasterData: TAppTreeData;
  procedure Clear;
  begin
    Result.Maliyet1 := 0;
    Result.Maliyet2 := 0;
    Result.Maliyet3 := 0;
  end;

  procedure AddResultFromHareket;
  begin
    Result.Maliyet2 := Result.Maliyet2 + FTableUretimHareket.Maliyet2;
    Result.Maliyet3 := Result.Maliyet3 + FTableUretimHareket.Maliyet3;
  end;

  procedure AddResultFromMaliyet;
  begin
    Result.Maliyet1 := Result.Maliyet1 + AMaliyet.Maliyet1;
    Result.Maliyet2 := Result.Maliyet2 + AMaliyet.Maliyet2;
    Result.Maliyet3 := Result.Maliyet3 + AMaliyet.Maliyet3;
  end;

  procedure AddChildRota(AMaliyetEkle: Boolean);
  begin
    FUretim.FdcBOMObject.MamulRotaKart.Open(FData.MalKod, 0, FData.VersiyonNo);
    FUretim.FdcBOMObject.MamulRotaKart.Table.First;
    while not FUretim.FdcBOMObject.MamulRotaKart.Table.Eof do
    begin
      FUretim.FdcBOMObject.IsMerkezKart.Find(FUretim.FdcBOMObject.MamulRotaKart.Table.IsMerkezKod);
      FTableUretimHareket.Append;
      FRota.FetchToUretimHareket;
      FTableUretimHareket.Post;
      if AMaliyetEkle then
      begin
        Result.Maliyet1 := Result.Maliyet1 + FTableUretimHareket.Maliyet1;
        AddResultFromHareket;
      end;
      if not Self.Data.Bitti then
        FRota.Add;
      FUretim.FdcBOMObject.MamulRotaKart.Table.Next;
    end;
  end;

  procedure AddChild;
  var
    AMaliyetEkle: Boolean;
    AStokOlustur: Boolean;
  begin
    AChildData := nil;
    (* ********** Notlar *************
    1. FTable.KullanýmSekli yerine FTableHareket.KullanýmSekli ne bakýlýyor. Orada Ana Parametrenin Kullaným þekline göre düzenleniyor.
    *)
    // Aðaç var mý?
    if FTable.FieldByName('HAMBAS_KULLANIMSEKLI').AsInteger <> mksHammadde then
    begin
      // Alternatif aðaç mý?
      if FTableUretimHareket.KullanimSekli = Integer(mksAlternatif) then
      begin
        // Alternatifini Kullan
        if FTable.Kullanilabilir <= 0 then
        begin
          AChildData := AMamulList.Add(FTableUretimHareket);
          AChildData.Parent := AMasterData;
          AMaliyetEkle := False;
          AStokOlustur := False;
        end
        else begin// kendisini kullan
          // eðer ihtiyacý tam karþýlamýyorsa
          if FTableUretimHareket.Miktar > FTable.Kullanilabilir then
          begin
            AChildData := AMamulList.Add(FTableUretimHareket);
            FTableUretimHareket.Edit;
            FTableUretimHareket.Miktar := FTable.Kullanilabilir;
            FTableUretimHareket.Post;
            AChildData.KullanilanMiktar := FTableUretimHareket.Kullanilabilir;
          end;
          AMaliyetEkle := True;
          AStokOlustur := True;
        end;
      end
      // Stok + Üret mi?
      else if FTableUretimHareket.KullanimSekli = Integer(mksStokUret) then
      begin
        // Kullanýlabiliri hiç yok
        if FTable.Kullanilabilir <= 0 then
        begin
          FTableUretimHareket.Edit;
          FTableUretimHareket.KullanimSekli := Integer(mksUret);
          FTableUretimHareket.Post;
          AChildData := AMamulList.Add(FTableUretimHareket); // Burayý sonradan yapmak lazým. Kullanýmþekli doðru gelmiyor yoksa.
          AMaliyetEkle := True;
          AStokOlustur := False;
        end
        else begin// kendisini kullan
          // eðer ihtiyacý tam karþýlamýyorsa
          if FTableUretimHareket.Miktar > FTable.Kullanilabilir then
          begin
            AChildData := AMamulList.Add(FTableUretimHareket);
            FTableUretimHareket.Edit;
            FTableUretimHareket.Miktar := FTable.Kullanilabilir;
            FTableUretimHareket.KullanimSekli := Integer(mksStok);
            FTableUretimHareket.Post;
            AChildData.KullanilanMiktar := FTableUretimHareket.Miktar;
            AChildData.Bitti := True;
          end;
          AMaliyetEkle := True;
          AStokOlustur := True;
        end;
      end
      else begin // Alternatifsiz ve Stok+Üret deðilse Mamul Agaçi var
        AChildData := AMamulList.Add(FTableUretimHareket);
        AMaliyetEkle := True;
        // Eðer stokdan ise
        if FTableUretimHareket.KullanimSekli = Integer(mksStok) then
        begin
        // Burada stok a hareket üretip, mamül aðacýný oluþtururken stok oluþmamamsý lazým
          AStokOlustur := True;
          AChildData.Bitti := True;
        end
        else
        // Burada stok a hareket üretme, mamül aðacýný oluþtururdan sonra stok giriþi ve çýkýþýnýn yapýlmasý lazým
          AStokOlustur := False;
      end;
    end
    else begin // En alt seviye ise (Son Hammadde)
      AMaliyetEkle := True;
      // Eðer Mamül üretilecekse
      if Self.Data.KullanimSekli in [mksUret, mksStokUret, mksAlternatif, mksVariant] then
        AStokOlustur := True
      else // Aðer Mamul üretilmeyecekse
        AStokOlustur := False;
    end;
    if FTableUretimHareket.Tip = Integer(matProduct) then
    begin
      FTableUretimHareket.Edit;
      FTableUretimHareket.KayitDurum := Integer(TAppMamulKullanimSekli(FTableUretimHareket.KullanimSekli) in [mksUret]);
      FTableUretimHareket.Post;
    end
    else begin
      FTableUretimHareket.Edit;
      FTableUretimHareket.KayitDurum := Integer(AStokOlustur);
      FTableUretimHareket.Post;
    end;
    if AMaliyetEkle then
    begin
      Result.Maliyet1 := Result.Maliyet1 + FTableUretimHareket.Maliyet1;
      AddResultFromHareket;
    end;
    if AStokOlustur and (not Self.Data.Bitti) then
    begin
      if not FUretim.Params.FUseLot then
        FUretim.AddStokHareket(FTableUretimHareket.SiraNo)
      else
        FUretim.AddStokHareketByLot(FTableUretimHareket.SiraNo);
    end;
  end;
begin
  Open;
  if FTable.IsEmpty then
    exit;
  Clear;
  AMamulList := TAppTreeDataList.Create(Self);
  AMasterData := TAppTreeData.Create;
  AMasterData.MalKod := FData.MalKod;
  AMasterData.VersiyonNo := FData.VersiyonNo;
  AMasterData.MalAd := FData.MalAd;
  AMasterData.SiraNo := FData.SiraNo;
  AMasterData.Miktar := FData.Miktar;
  AMasterData.KullanilanMiktar := FData.KullanilanMiktar;
  AMasterData.KullanimSekli := FData.KullanimSekli;
  AMasterData.Bitti := FData.Bitti;
  AMasterData.DepoKod := FData.DepoKod;
  AMasterData.Parent := FData.Parent;
  try
    FTable.First;
    while not FTable.Eof do
    begin
      FTableUretimHareket.Append;
      FetchToHareket;
      FTableUretimHareket.Post;
      AddChild;
      if FUretim.Params.KullanimSekli in [uksStokUret] then
      begin
        if AChildData <> nil then
        begin
          if AChildData.Miktar - AChildData.KullanilanMiktar > 0 then
          begin
            FTableUretimHareket.Append;
            FetchToHareket;
            FTableUretimHareket.KullanimSekli := Integer(mksUret);
            FTableUretimHareket.Miktar := AChildData.Miktar - AChildData.KullanilanMiktar;
            FTableUretimHareket.Post;
            AddChild;
          end;
        end;
      end;
      FTable.Next;
    end;
    AddChildRota(True);
    for I := 0 to AMamulList.FList.Count - 1 do
    begin
      AData := TAppTreeData(AMamulList.FList[I]);
      AData.Parent := AMasterData;
      if Self.Data.Bitti then
        AData.Bitti := True;
      FUretim.FMamulKart.Data := AData;
      // Burada Tekrardan döngüye giriyor.
      AMaliyet := FUretim.FMamulKart.Add;
      AddResultFromMaliyet;
      AMaliyet := FUretim.AddMaliyet(AData.SiraNo, AMaliyet);
      //AddGiris;
      if (not AData.Bitti) and (AData.KullanimSekli in [mksUret]) and (AData.KullanimSekli <> mksAlternatif) then
      begin
        FTableUretimHareket.Append;
        FetchForTersHareket(AData.SiraNo);
        if AData.KullanimSekli = mksStokUret then
          FTableUretimHareket.Miktar := AData.Miktar;
        FTableUretimHareket.Post;
        FUretim.AddStokHareket(FTableUretimHareket.SiraNo);
        FUretim.AddStokHareket(AData.SiraNo);
      end
      else // Maliyeti güncellemek lazým stok hareketin.
        FUretim.UpdateMaliyetStokHareket(AData.SiraNo);
    end;
  finally
    AMasterData.Free;
    AMamulList.Free;
  end;
end;

constructor TAppBaseMamulKart.Create(
  AOwner: TAppDataControllerBaseUretim);
begin
  inherited Create;
  FData := TAppTreeData.Create;
  FUretim := AOwner;
  FTableUretimHareket := FUretim.FTableUretimHareket;

  FTable := TTableMamulKart.Create(nil);
  FTable.Connection := FTableUretimHareket.Connection;
  FTable.ProviderName := 'prCommand';

  FTableClone := TTableMamulKart.Create(nil);
  FTable.AddClone(FTableClone);

  FRota := TAppUretimRota.Create(Self);
end;

destructor TAppBaseMamulKart.Destroy;
begin
  FreeAndNil(FData);
  FreeAndNil(FTable);
  FreeAndNil(FTableClone);
  FreeAndNil(FRota);
  inherited;
end;

procedure TAppBaseMamulKart.FetchForTersHareket(ASiraNo: Integer);
begin
  if not FUretim.FTableCloneUretimHareket.FindKey([FUretim.Params.UretimSiraNo, ASiraNo]) then
    exit;
  FTableUretimHareket.AnaSiraNo := ASiraNo;
  FTableUretimHareket.UretimSiraNo := FUretim.Params.UretimSiraNo;
  FTableUretimHareket.EvrakTip := FUretim.Params.UretimTip;
  FTableUretimHareket.UretimNo := FUretim.Params.UretimNo;
  FTableUretimHareket.EvrakTarih := FUretim.Params.EvrakTarih;
  FTableUretimHareket.EvrakNo := FUretim.Params.EvrakNo;
  FTableUretimHareket.HesapKod := FUretim.Params.HesapKod;
  FTableUretimHareket.AnaMamulKod := FUretim.AnaMamulKart.Data.MalKod;
  FTableUretimHareket.MamulKod := Data.MalKod;
  FTableUretimHareket.MalKod := FUretim.FTableCloneUretimHareket.MalKod;
  FTableUretimHareket.MalAd := FUretim.FTableCloneUretimHareket.MalAd;
  FTableUretimHareket.VersiyonNo := FUretim.FTableCloneUretimHareket.VersiyonNo;
  if FUretim.FTableCloneUretimHareket.GirisCikis = 0 then
    FTableUretimHareket.GirisCikis := 1
  else
    FTableUretimHareket.GirisCikis := 0;
  FTableUretimHareket.BirimMiktar := FUretim.FTableCloneUretimHareket.Miktar;
  FTableUretimHareket.MiktarTip := FUretim.FTableCloneUretimHareket.MiktarTip;
  FTableUretimHareket.Miktar := FUretim.FTableCloneUretimHareket.Miktar;
  FTableUretimHareket.BilesenFireOran := FUretim.FTableCloneUretimHareket.BilesenFireOran;
  FTableUretimHareket.OperasyonNo := FUretim.FTableCloneUretimHareket.OperasyonNo;
  FTableUretimHareket.OperasyonFireKullan := FUretim.FTableCloneUretimHareket.OperasyonFireKullan;
  FTableUretimHareket.OperasyonFireOran := FUretim.FTableCloneUretimHareket.OperasyonFireOran;
  FTableUretimHareket.OperasyonFireMiktar := FUretim.FTableCloneUretimHareket.OperasyonFireMiktar;
  FTableUretimHareket.DepoKod := FUretim.FTableCloneUretimHareket.DepoKod;
  FTableUretimHareket.SeriNo := FUretim.FTableCloneUretimHareket.SeriNo;
  FTableUretimHareket.SeriNo2 := FUretim.FTableCloneUretimHareket.SeriNo2;
  FTableUretimHareket.KullanimSekli := FUretim.FTableCloneUretimHareket.KullanimSekli;
  FTableUretimHareket.StokGiris := FUretim.FTableCloneUretimHareket.StokGiris;
  FTableUretimHareket.StokCikis := FUretim.FTableCloneUretimHareket.StokCikis;
  FTableUretimHareket.StokMiktar := FUretim.FTableCloneUretimHareket.StokMiktar;
  FTableUretimHareket.Kullanilabilir := FUretim.FTableCloneUretimHareket.Kullanilabilir;
  FTableUretimHareket.BirimMaliyet1 := FUretim.FTableCloneUretimHareket.BirimMaliyet1;
  FTableUretimHareket.BirimMaliyet2 := FUretim.FTableCloneUretimHareket.BirimMaliyet2;
  FTableUretimHareket.BirimMaliyet3 := FUretim.FTableCloneUretimHareket.BirimMaliyet3;
  FTableUretimHareket.Maliyet1 := FUretim.FTableCloneUretimHareket.Maliyet1;
  FTableUretimHareket.Maliyet2 := FUretim.FTableCloneUretimHareket.Maliyet2;
  FTableUretimHareket.Maliyet3 := FUretim.FTableCloneUretimHareket.Maliyet3;
  FTableUretimHareket.DovizCins := FUretim.FTableCloneUretimHareket.DovizCins;
end;

procedure TAppBaseMamulKart.FetchToHareket;
var
  MamulMiktar, HammaddeMiktar: Double;
begin
  FTableUretimHareket.AnaSiraNo := Data.SiraNo;
  FTableUretimHareket.UretimSiraNo := FUretim.Params.UretimSiraNo;
  FTableUretimHareket.EvrakTip := FUretim.Params.UretimTip;
  FTableUretimHareket.UretimNo := FUretim.Params.UretimNo;
  FTableUretimHareket.EvrakTarih := FUretim.Params.EvrakTarih;
  FTableUretimHareket.EvrakNo := FUretim.Params.EvrakNo;
  FTableUretimHareket.HesapKod := FUretim.Params.HesapKod;
  FTableUretimHareket.AnaMamulKod := FUretim.AnaMamulKart.Data.MalKod;
  FTableUretimHareket.MamulKod := Data.MalKod;
  FTableUretimHareket.MalKod := FTable.HamMaddeKod;
  FTableUretimHareket.MalAd := FTable.HammaddeAd;
  FTableUretimHareket.VersiyonNo := FTable.HamMaddeVersiyonNo;
  FTableUretimHareket.GirisCikis := 1;
  FTableUretimHareket.BirimMiktar := FTable.Miktar;
  FTableUretimHareket.MiktarTip := FTable.MiktarTip;
  if FTable.FieldByName('HAMBAS_KULLANIMSEKLI').AsInteger = mksHammadde then
  begin
    FTableUretimHareket.Tip := Integer(matRowMaterial);
    FTableUretimHareket.KullanimSekli := mksHammadde;
  end
  else begin
    FTableUretimHareket.Tip := Integer(matProduct);
    FTableUretimHareket.KullanimSekli := Integer(GetKullanimSekli(FUretim.Params.KullanimSekli, TAppMamulKullanimSekli(FTable.FieldByName('HAMBAS_KULLANIMSEKLI').AsInteger)));
  end;
  if FTable.UretimMiktar > 0 then // Elle üretim miktarý verilmiþ
  begin
    HammaddeMiktar := FTable.UretimMiktar;
  end
  else begin
    if Data.KullanimSekli = mksAlternatif then
      MamulMiktar := Data.Miktar - Data.KullanilanMiktar
    else
      MamulMiktar := Data.KullanilanMiktar;

    HammaddeMiktar := FTable.Miktar * MamulMiktar;
  end;

  // Yuvarla //
  HammaddeMiktar := AppRoundToUp(HammaddeMiktar, FTable.HammaddeStokKartYuvarlama);

  FTableUretimHareket.Miktar := HammaddeMiktar;

  FTableUretimHareket.BilesenFireOran := FTable.BilesenFireOran;
  FTableUretimHareket.OperasyonNo := FTable.OperasyonNo;
  FTableUretimHareket.OperasyonFireKullan := FTable.OperasyonFireKullan;
  FTableUretimHareket.OperasyonFireOran := FTable.OperasyonFireOran;
  FTableUretimHareket.OperasyonFireMiktar := FTable.OperasyonFireMiktar;
  FTableUretimHareket.DepoKod := FTable.DepoKod;
  FTableUretimHareket.StokGiris := FTable.StokGiris;
  FTableUretimHareket.StokCikis := FTable.StokCikis;
  FTableUretimHareket.StokMiktar := FTable.StokMiktar;
  FTableUretimHareket.Kullanilabilir := FTable.Kullanilabilir;
  case FUretim.Params.MaliyetTip of
    mtFIFO:
    begin
      FUretim.Maliyet.Maliyet(FTableUretimHareket.MalKod, FTableUretimHareket.Miktar);
      FTableUretimHareket.BirimMaliyet1 := FUretim.Maliyet.FTable.Fields[0].AsFloat;
    end
    else
      FTableUretimHareket.BirimMaliyet1 := FTable.Maliyet1;
  end;
  FTableUretimHareket.BirimMaliyet2 := FTable.Maliyet2;
  FTableUretimHareket.BirimMaliyet3 := FTable.Maliyet3;
  FTableUretimHareket.Maliyet1 := FTableUretimHareket.BirimMaliyet1 * FTableUretimHareket.Miktar;
  FTableUretimHareket.Maliyet2 := FTableUretimHareket.BirimMaliyet2 * FTableUretimHareket.Miktar;
  FTableUretimHareket.Maliyet3 := FTableUretimHareket.BirimMaliyet3 * FTableUretimHareket.Miktar;
  FTableUretimHareket.DovizCins := FTable.HammaddeStokKartDovizCins;
end;

procedure TAppBaseMamulKart.GetData(AData: TAppTreeData);
begin
  AData.MalKod := FData.MalKod;
  AData.VersiyonNo := FData.VersiyonNo;
  AData.MalAd := FData.MalAd;
  AData.SiraNo := FData.SiraNo;
  AData.Miktar := FData.Miktar;
  AData.KullanimSekli := FData.KullanimSekli;
  AData.Bitti := FData.Bitti;
end;

function TAppBaseMamulKart.GetKullanimSekli(
  AUretimKullanimSekli: TAppUretimKullanimSekli;
  AMamulKullanimSekli: TAppMamulKullanimSekli): TAppMamulKullanimSekli;
begin
  Result := AMamulKullanimSekli;
  if AUretimKullanimSekli = uksDefault then
    Result := AMamulKullanimSekli
  else begin
    if AMamulKullanimSekli in [mksAlternatif, mksVariant] then
      Result := AMamulKullanimSekli
    else begin
      case AUretimKullanimSekli of
        uksStok:
          Result := mksStok;
        uksUret:
          Result := mksUret;
        uksStokUret:
          Result := mksStokUret;
      end;
    end;
  end;
end;

procedure TAppBaseMamulKart.GetMamulKartKullanimSekli;
begin

end;

procedure TAppBaseMamulKart.InitData;
begin
end;

procedure TAppBaseMamulKart.Open;
begin

end;

procedure TAppBaseMamulKart.SetData(const Value: TAppTreeData);
begin
  FData.MalKod := Value.MalKod;
  FData.VersiyonNo := Value.VersiyonNo;
  FData.MalAd := Value.MalAd;
  FData.SiraNo := Value.SiraNo;
  FData.Miktar := Value.Miktar;
  FData.KullanilanMiktar := Value.KullanilanMiktar;
  FData.KullanimSekli := Value.KullanimSekli;
  FData.Bitti := Value.Bitti;
  FData.DepoKod := Value.DepoKod;
  FData.Parent := Value.Parent;
end;

{ TAppMamulKart }

procedure TAppMamulKart.AddWhere;
begin
  // MAMKRT --> Mamül Kart
  with FTable.TableItems[0].Where do
  begin
    Clear;
    Add('SIRKETNO', wcEqual, FUretim.Params.SirketNo);
    AddOperator(woAnd);
    Add('MAMULKOD', wcEqual, FData.MalKod);
    AddOperator(woAnd);
    Add('VERSIYONNO', wcEqual, FData.VersiyonNo);
  end;
  // STKDRM --> Hammadde Stok Durum
  with FTable.TableItems[7].Join do
  begin
    Clear;
    Add('SIRKETNO', 'SIRKETNO');
    Add('MALKOD', 'HAMMADDEKOD');
    Add('VERSIYONNO', 'HAMMADDEVERSIYONNO');
    Add('DEPOKOD', 'DEPOKOD');
  end;
end;

procedure TAppMamulKart.GetMamulKartKullanimSekli;
begin
  FData.KullanimSekli := TAppMamulKullanimSekli(FTable.FieldByName('HAMBAS_KULLANIMSEKLI').AsInteger);
end;

procedure TAppMamulKart.InitData;
begin
  inherited;
  FTable.Close;
  SetTableDefinition;
  AddWhere;
  FTable.DoInitializeRecord;
end;

procedure TAppMamulKart.Open;
var
  A: Cardinal;
begin
  A := GetTickCount;
  FTable.Close;
  SetTableDefinition;
  AddWhere;
  FTable.Open;
  FTimeOpen := FTimeOpen + (GetTickCount - A);
end;

procedure TAppMamulKart.SetTableDefinition;
begin
  FTable.TableItems.TableNames := VarArrayOf(['MAMKRT', 'MAMBAS', 'STKKRT', 'STKBRM', 'MAMBAS', 'STKKRT', 'STKBRM', AppStokDurumHelper.DepoDurumDef]);
  FTable.TableItems.TableAlias := VarArrayOf(['MAMKRT', 'MAMBAS', 'MAMSTK', 'MAMBRM', 'HAMBAS', 'STKKRT', 'STKBRM', 'STKDRM']);
  FTable.TableItems.TableReferans := VarArrayOf(['MAMKRT', 'MAMBAS', 'STKKRT', 'STKBRM', 'MAMBAS', 'STKKRT', 'STKBRM', 'STKDRM']);
  FTable.TableItems.TableCaptions := VarArrayOf(['Mamül Kart','Mamül Baþlýk','Mamül Stok Kart','Mamül Stok Birim','Hammadde Baþlýk','Hammadde Stok Kart','Hammadde Stok Birim','Hammadde Stok Durum']);

  // MAMKRT --> Mamül Kartý Tablosu
  with FTable.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      AddExpression('CAST(0 AS INT)', '_KEYID');
      AddExpression('CAST(0 AS INT)', '_KEYPARENTID');
      Add('MAMULKOD');
      Add('VERSIYONNO');
      Add('HAMMADDEKOD');
      Add('HAMMADDEVERSIYONNO');
      Add('MIKTARTIP');
      Add('MIKTAR');
      Add('BILESENFIREORAN');
      Add('OPERASYONNO');
      Add('OPERASYONFIREKULLAN');
      Add('OPERASYONFIREORAN');
      Add('OPERASYONFIREMIKTAR');
      Add('DEPOKOD');
      AddExpression('CAST(0 AS NUMERIC(25, 6))', '_URETIMMIKTAR');
    end;
  end;
  // MAMBAS --> Mamül Baþlýðý Tablosu
  with FTable.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('KULLANIMSEKLI');
      Add('BIRIM');
    end;
    with Join do
    begin
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('MAMULKOD', 'MAMULKOD');
      Add('VERSIYONNO', 'VERSIYONNO');
    end;
  end;
  // MAMSTK --> Mamül Stok Kartý Tablosu (STKKRT)
  with FTable.TableItems[2] do
  begin
    with Fields do
    begin
      Clear;
      Add('BIRIM');
      Add('YUVARLAMA');
      Add('MONTAJFIREORAN');
    end;
    with Join do
    begin
      Clear;
      Add('MALKOD', 'MAMULKOD');
    end;
  end;
  // MAMBRM --> Mamül Stok Birimleri Tablosu (STKBRM)
  with FTable.TableItems[3] do
  begin
    with Fields do
    begin
      Clear;
      AddExpression('ISNULL(MAMBRM.KATSAYI, 0)', 'MAMBRM_KATSAYI');
    end;
    with Join do
    begin
      Clear;
      Add('MALKOD', 'MAMULKOD');
      Add('BIRIM', 'BIRIM', FTable.TableItems[1]);
    end;
  end;
  // HAMBAS --> Hammadde Mamül Baþlýðý Tablosu (MAMBAS)
  with FTable.TableItems[4] do
  begin
    with Fields do
    begin
      Clear;
      AddExpression('CASE MAMKRT.HAMMADDEKULLANIMSEKLI WHEN -1 THEN ISNULL(HAMBAS.KULLANIMSEKLI, -1) ELSE MAMKRT.HAMMADDEKULLANIMSEKLI END', 'HAMBAS_KULLANIMSEKLI');
    end;
    with Join do
    begin
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('MAMULKOD', 'HAMMADDEKOD');
      Add('VERSIYONNO', 'HAMMADDEVERSIYONNO');
    end;
  end;
  // STKKRT --> Hammadde Stok Kartý Tablosu
  with FTable.TableItems[5] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALAD');
      Add('DOVIZCINS');
      Add('BIRIM');
      Add('BILESENFIREORAN');
      Add('YUVARLAMA');
      if FUretim.Params.MaliyetTip = mtStandart then
      begin
        AddExpression('STKKRT.MALIYET1', 'STKKRT_MALIYET1');
        AddExpression('STKKRT.MALIYET2', 'STKKRT_MALIYET2');
        AddExpression('STKKRT.MALIYET3', 'STKKRT_MALIYET3');
      end
      else begin
        AddExpression('CAST(0 AS NUMERIC(25, 6))', 'STKKRT_MALIYET1');
        AddExpression('CAST(0 AS NUMERIC(25, 6))', 'STKKRT_MALIYET2');
        AddExpression('CAST(0 AS NUMERIC(25, 6))', 'STKKRT_MALIYET3');
      end;
    end;
    with Join do
    begin
      Clear;
      Add('MALKOD', 'HAMMADDEKOD');
    end;
  end;
  // STKBRM --> Hammadde Stok Birim Tablosu
  with FTable.TableItems[6] do
  begin
    with Fields do
    begin
      Clear;
      AddExpression('ISNULL(STKBRM.KATSAYI, 0)', 'STKBRM_KATSAYI');
    end;
    with Join do
    begin
      Clear;
      Add('MALKOD', 'HAMMADDEKOD');
      Add('BIRIM', 'HAMMADDEBIRIM');
    end;
  end;
  // Stok Durum
  with FTable.TableItems[7] do
  begin
    with Fields do
    begin
      Clear;
      Add('STOKGIRIS');
      Add('STOKCIKIS');
      Add('STOKMIKTAR');
      Add('KULLANILABILIR');
    end;
    with Join do
    begin
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('MALKOD', 'HAMMADDEKOD');
      Add('VERSIYONNO', 'HAMMADDEVERSIYONNO');
      AddConst('DEPOKOD', '');
    end;
    WithNoLock := False;
  end;
end;

{ TAppAnaMamulKart }
procedure TAppAnaMamulKart.Open;
var
  A: Cardinal;
begin
  A := GetTickCount;
  FTable.CancelRange;
  if not FTable.FindKey([FData.MalKod, FData.VersiyonNo]) then
    AddMalKod;
  Range;
  FTimeOpen := FTimeOpen + (GetTickCount - A);
end;

procedure TAppAnaMamulKart.Range;
begin
  FTable.SetRange([FData.MalKod, FData.VersiyonNo], [FData.MalKod, FData.VersiyonNo]);
end;

function TAppAnaMamulKart.Add: TAppDataMaliyet;
begin
  FTable.DisableControls;
  FTableUretimHareket.DisableControls;
  FUretim.MamulKart.Table.DisableControls;
  try
    OpenBaslik;
    AddToHareket;
    Result := inherited Add;
    FUretim.AddMaliyet(FData.SiraNo, Result);
    FUretim.UpdateMaliyetStokHareket(FData.SiraNo);
    FUretim.AddStokHareket(FData.SiraNo);
  finally
    FTable.EnableControls;
    FTableUretimHareket.EnableControls;
    FUretim.MamulKart.Table.EnableControls;
  end;
end;

procedure TAppAnaMamulKart.InitData;
begin
  inherited;
  FUretim.MamulKart.InitData;
  FTable.FieldDefs.Assign(FUretim.MamulKart.FTable.FieldDefs);
  FTable.CreateFields;
  FTableClone.FieldDefs.Assign(FUretim.MamulKart.FTable.FieldDefs);
  FTableClone.CreateFields;
  FTable.CreateDataSet;
  FTable.IndexFieldNames := 'MAMULKOD;VERSIYONNO';
  FTableClone.IndexFieldNames := 'MAMULKOD;VERSIYONNO';
  FTableBaslik.Close;
  SetBaslikDefinition;
  FTableBaslik.DoInitializeRecord;
end;

procedure TAppAnaMamulKart.RangeClone;
begin
  if not FTableClone.Active then
    exit;
  FTableClone.SetRange([FData.MalKod, FData.VersiyonNo], [FData.MalKod, FData.VersiyonNo]);
  if FTableClone.IsEmpty and (trim(FData.MalKod) <> '') then
    AddMalKod;
end;

procedure TAppAnaMamulKart.Delete(AMalKod: String; AVersiyonNo: String);
begin
  FTable.SetRange([FData.MalKod, FData.VersiyonNo], [FData.MalKod, FData.VersiyonNo]);
  FTable.First;
  while not FTable.Eof do
  begin
    FTable.Delete;
    FTable.First;
  end;
end;

procedure TAppAnaMamulKart.Clear;
begin
  FTable.EmptyTable;
end;

procedure TAppAnaMamulKart.AddMalKod;
var
  I: Integer;
begin
  FUretim.FMamulKart.FData.MalKod := FData.MalKod;
  FUretim.FMamulKart.FData.VersiyonNo := FData.VersiyonNo;
  FUretim.FMamulKart.FData.DepoKod := FData.DepoKod;
  FUretim.FMamulKart.Open;
  FUretim.MamulKart.FTable.First;
  while not FUretim.MamulKart.FTable.Eof do
  begin
    FTable.Append;
    for I := 0 to FTable.FieldCount - 1 do
      FTable.Fields[I].Value := FUretim.MamulKart.FTable.Fields[I].Value;
    FTable.UretimMiktar := FTable.Miktar * FData.Miktar;
    FTable.Post;
    FUretim.MamulKart.FTable.Next;
  end;
end;

constructor TAppAnaMamulKart.Create(AOwner: TAppDataControllerBaseUretim);
begin
  inherited;
  FTableBaslik := TTableMamulBaslik.Create(nil);
  FTableBaslik.Connection := FTableUretimHareket.Connection;
  FTableBaslik.ReadOnly := True;
  FRule := TAppRuleAnaMamulKart.Create(Self);
end;

destructor TAppAnaMamulKart.Destroy;
begin
  FreeAndNil(FTableBaslik);
  FreeAndNil(FRule);
  inherited;
end;

procedure TAppAnaMamulKart.UpdateMiktar;
begin
  Open;
  FTable.First;
  while not FTable.Eof do
  begin
    FTable.Edit;
    FTable.UretimMiktar := FTable.Miktar * FData.Miktar;
    FTable.Post;
    FTable.Next;
  end;
end;

procedure TAppAnaMamulKart.AddToHareket;
var
  Src: TTableUretimKart;
  Des: TTableUretimHareket;
begin
  FTableUretimHareket.Append;
  FTableUretimHareket.UretimSiraNo := FUretim.Params.UretimSiraNo;
  FTableUretimHareket.EvrakTip := FUretim.Params.UretimTip;
  FTableUretimHareket.UretimNo := FUretim.Params.UretimNo;
  FTableUretimHareket.EvrakTarih := FUretim.Params.EvrakTarih;
  FTableUretimHareket.EvrakNo := FUretim.Params.EvrakNo;
  FTableUretimHareket.HesapKod := FUretim.Params.HesapKod;
  FTableUretimHareket.AnaMamulKod := Data.MalKod;
  FTableUretimHareket.MamulKod := Data.MalKod;
  FTableUretimHareket.Malkod := Data.MalKod;
  FTableUretimHareket.VersiyonNo := Data.VersiyonNo;
  FTableUretimHareket.MalAd := FTableBaslik.MalAd;
  FTableUretimHareket.BirimMiktar := Data.Miktar;
  FTableUretimHareket.Miktar := Data.Miktar;
  FTableUretimHareket.DepoKod := Data.DepoKod;
  FTableUretimHareket.SeriNo := Data.SeriNo;
  FTableUretimHareket.BirimMaliyet1 := 0;
  FTableUretimHareket.BirimMaliyet2 := FTableBaslik.Maliyet2;
  FTableUretimHareket.BirimMaliyet3 := FTableBaslik.Maliyet3;
  FTableUretimHareket.Maliyet1 := FTableUretimHareket.BirimMaliyet1 * FTableUretimHareket.Miktar;
  FTableUretimHareket.Maliyet2 := FTableUretimHareket.BirimMaliyet2 * FTableUretimHareket.Miktar;
  FTableUretimHareket.Maliyet3 := FTableUretimHareket.BirimMaliyet3 * FTableUretimHareket.Miktar;
  FTableUretimHareket.StokGiris := FTableBaslik.StokGiris;
  FTableUretimHareket.StokCikis := FTableBaslik.StokCikis;
  FTableUretimHareket.StokMiktar := FTableBaslik.StokMiktar;
  FTableUretimHareket.Kullanilabilir := FTableBaslik.Kullanilabilir;
  FTableUretimHareket.KullanimSekli := Integer(mksUret);
  FTableUretimHareket.DovizCins := FTableBaslik.DovizCins;

  if FUretim is TAppDataControllerUretim then
  begin
    Src := TAppDataControllerUretim(FUretim).FTableUretimKart;
    Des := FTableUretimHareket;
    Des.SKod1 := Src.SKod1;
    Des.SKod2 := Src.SKod2;
    Des.SKod3 := Src.SKod3;
    Des.SKod4 := Src.SKod4;
    Des.SKod5 := Src.SKod5;
    Des.MKod1 := Src.MKod1;
    Des.MKod2 := Src.MKod2;
    Des.MKod3 := Src.MKod3;
    Des.MKod4 := Src.MKod4;
    Des.MKod5 := Src.MKod5;
    Des.LKod1 := Src.LKod1;
    Des.LKod2 := Src.LKod2;
    Des.LKod3 := Src.LKod3;
    Des.LKod4 := Src.LKod4;
    Des.LKod5 := Src.LKod5;
    Des.BKod1 := Src.BKod1;
    Des.BKod2 := Src.BKod2;
    Des.BKod3 := Src.BKod3;
    Des.BKod4 := Src.BKod4;
    Des.BKod5 := Src.BKod5;
    Des.NKod1 := Src.NKod1;
    Des.NKod2 := Src.NKod2;
    Des.NKod3 := Src.NKod3;
    Des.NKod4 := Src.NKod4;
    Des.NKod5 := Src.NKod5;
    Des.Aciklama1 := Src.Aciklama1;
    Des.Aciklama2 := Src.Aciklama2;
    Des.Aciklama3 := Src.Aciklama3;
    Des.Aciklama4 := Src.Aciklama4;
    Des.Aciklama5 := Src.Aciklama5;
  end;
  FTableUretimHareket.Post;
  FData.SiraNo := FTableUretimHareket.SiraNo;
end;

procedure TAppAnaMamulKart.OpenBaslik;
begin
  FTableBaslik.Close;
  SetBaslikDefinition;
  FTableBaslik.Open;
end;

procedure TAppAnaMamulKart.SetBaslikDefinition;
begin
  FTableBaslik.TableItems.TableNames := VarArrayOf(['MAMBAS', 'STKKRT', AppStokDurumHelper.DepoDurumDef]);
  FTableBaslik.TableItems.TableAlias := VarArrayOf(['MAMBAS', 'STKKRT', 'STKDRM']);
  // MAMBAS
  with FTableBaslik.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('KULLANIMSEKLI');
    end;
    with Where do
    begin
      Clear;
      Add('SIRKETNO', wcEqual, FUretim.Params.SirketNo);
      AddOperator(woAnd);
      Add('MAMULKOD', wcEqual, FData.MalKod);
      AddOperator(woAnd);
      Add('VERSIYONNO', wcEqual, FData.VersiyonNo);
    end;
  end;

  // Stok Kart
  with FTableBaslik.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALAD');
      Add('DOVIZCINS');
      if FUretim.Params.MaliyetTip = mtStandart then
      begin
        AddExpression('STKKRT.MALIYET1', 'STKKRT_MALIYET1');
        AddExpression('STKKRT.MALIYET2', 'STKKRT_MALIYET2');
        AddExpression('STKKRT.MALIYET3', 'STKKRT_MALIYET3');
      end
      else begin
        AddExpression('CAST(0 AS NUMERIC(25, 6))', 'STKKRT_MALIYET1');
        AddExpression('CAST(0 AS NUMERIC(25, 6))', 'STKKRT_MALIYET2');
        AddExpression('CAST(0 AS NUMERIC(25, 6))', 'STKKRT_MALIYET3');
      end;
    end;
    with Join do
    begin
      Clear;
      Add('MALKOD', 'MAMULKOD');
    end;
  end;
  // Stok Durum
  with FTableBaslik.TableItems[2] do
  begin
    with Fields do
    begin
      Clear;
      Add('STOKGIRIS');
      Add('STOKCIKIS');
      Add('STOKMIKTAR');
      Add('KULLANILABILIR');
    end;
    with Join do
    begin
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('MALKOD', 'MAMULKOD');
      Add('VERSIYONNO', 'VERSIYONNO');
      AddConst('DEPOKOD', FData.DepoKod);
    end;
    WithNoLock := False;
  end;
end;

{ TAppDataControllerMaliyet }

constructor TAppDataControllerMaliyet.Create(
  AOwner: TAppDataControllerBaseUretim);
begin
  inherited Create;
  FUretim := AOwner;
  FTable := TAppDBTable.Create(nil);
  FTable.ReadOnly := True;
  FTable.Connection := FUretim.FTableUretimHareket.Connection;
end;

destructor TAppDataControllerMaliyet.Destroy;
begin
  FreeAndNil(FTable);
  inherited;
end;

procedure TAppDataControllerMaliyet.Maliyet(
  AMalkod: String; AMiktar: Double);
begin
  FTable.Close;
  case FUretim.Params.MaliyetTip of
    mtFIFO:
      FTable.TableItems.CommandText := Format('EXEC dbo.SPAPP_URT_FIFO ''%s'', ''%s'', %s, 0', [FUretim.FParams.SirketNo, AMalkod, AppVarToSqlStr(ftFloat, AMiktar)]);
  end;
  FTable.Open;
end;

{ TAppTreeDataList }

function TAppTreeDataList.Add(ATable: TTableUretimHareket): TAppTreeData;
begin
  Result := TAppTreeData.Create;
  FList.Add(Result);
  Result.MalKod := ATable.MalKod;
  Result.VersiyonNo := ATable.VersiyonNo;
  Result.MalAd := ATable.MalAd;
  Result.DovizCins := ATable.DovizCins;
  Result.SiraNo := ATable.SiraNo;
  Result.BirimMiktar := ATable.BirimMiktar;
  Result.Miktar := ATable.Miktar;
  Result.KullanilanMiktar := ATable.Miktar;
  Result.DepoKod := ATable.DepoKod;
  Result.KullanimSekli := TAppMamulKullanimSekli(ATable.KullanimSekli);
  Result.Parent := FOwner.FData;
end;

procedure TAppTreeDataList.Clear;
var
  I: Integer;
begin
  for I := FList.Count - 1 downto 0 do
    TAppTreeData(FList[I]).Free;
  FList.Clear;
end;

constructor TAppTreeDataList.Create(AOwner: TAppBaseMamulKart);
begin
  inherited Create;
  FList := TList.Create;
  FOwner := AOwner;
end;

destructor TAppTreeDataList.Destroy;
begin
  Clear;
  FreeAndNil(FList);
  inherited;
end;

{ TAppDataControllerBaseUretim }

procedure TAppDataControllerBaseUretim.Add;
begin

end;

procedure TAppDataControllerBaseUretim.AddEvrakBaslik;
begin

end;

function TAppDataControllerBaseUretim.AddMaliyet(ASiraNo: Integer;
  AMaliyet: TAppDataMaliyet): TAppDataMaliyet;
begin
  if not Find(ASiraNo) then
    exit;
  FTableUretimHareket.Edit;
  FTableUretimHareket.Maliyet1 := AMaliyet.Maliyet1;
  FTableUretimHareket.Maliyet2 := FTableUretimHareket.Maliyet2 + AMaliyet.Maliyet2;
  FTableUretimHareket.Maliyet3 := FTableUretimHareket.Maliyet3 + AMaliyet.Maliyet3;
  FTableUretimHareket.BirimMaliyet1 := AppDiv(FTableUretimHareket.Maliyet1, FTableUretimHareket.Miktar);
  FTableUretimHareket.BirimMaliyet2 := AppDiv(FTableUretimHareket.Maliyet2, FTableUretimHareket.Miktar);
  FTableUretimHareket.BirimMaliyet3 := AppDiv(FTableUretimHareket.Maliyet3, FTableUretimHareket.Miktar);
  FTableUretimHareket.Post;
  Result.Maliyet1 := FTableUretimHareket.Maliyet1;
  Result.Maliyet2 := FTableUretimHareket.Maliyet2;
  Result.Maliyet3 := FTableUretimHareket.Maliyet3;
end;

procedure TAppDataControllerBaseUretim.AddStokHareket(
  AUretimSiraNo: Integer; const AMiktar: Double; const ADepoKod,
  ASeriNo: String; ASeriNo2: String);
begin

end;

procedure TAppDataControllerBaseUretim.AddStokHareketByLot(
  AUretimSiraNo: Integer; const AMiktar: Double; const ADepoKod: String);
begin

end;

constructor TAppDataControllerBaseUretim.Create(ATableUretimHareket: TTableUretimHareket;
  ATableUretimRota: TTableUretimRota; ATableUretimRotaKaynak: TTableUretimRotaKaynak;
  ATableUretimKaynakTahsisat: TTableUretimKaynakTahsisat);
begin
  inherited Create;
  FParams := TAppUretimParams.Create;
  FParams.UseLot := True;
  FdcBOMObject := TAppDataControllerBOMObject.Create;

  FTableUretimHareket := ATableUretimHareket;
  FTableUretimRota := ATableUretimRota;
  FTableUretimRotaKaynak := ATableUretimRotaKaynak;
  FTableUretimKaynakTahsisat := ATableUretimKaynakTahsisat;

  if not SameText(FTableUretimHareket.IndexFieldNames, 'SIRANO') then
    FTableUretimHareket.IndexFieldNames := 'SIRANO';

  FTableCloneUretimHareket := TTableUretimHareket.Create(nil);
  FTableUretimHareket.AddClone(FTableCloneUretimHareket);
  FTableCloneUretimHareket.IndexFieldNames := 'URETIMSIRANO;SIRANO';

  FTableCloneUretimHareket2 := TTableUretimHareket.Create(nil);
  FTableUretimHareket.AddClone(FTableCloneUretimHareket2);
  FTableCloneUretimHareket2.IndexFieldNames := 'SIRANO;ANASIRANO';

  FMaliyet := TAppDataControllerMaliyet.Create(Self);
  FAnaMamulKart := TAppAnaMamulKart.Create(Self);
  FMamulKart := TAppMamulKart.Create(Self);
  FAnaMamulKart.InitData;

  FKaynakSonDurum := TAppUretimKaynakSonDurum.Create(Self);
  FUretimKaynakTahsisat := TAppUretimKaynakTahsisat.Create(Self);
end;

destructor TAppDataControllerBaseUretim.Destroy;
begin
  FreeAndNil(FdcBOMObject);
  FreeAndNil(FTableCloneUretimHareket);
  FreeAndNil(FTableCloneUretimHareket2);
  FreeAndNil(FMaliyet);
  FreeAndNil(FAnaMamulKart);
  FreeAndNil(FMamulKart);
  FreeAndNil(FParams);
  FreeAndNil(FKaynakSonDurum);
  FreeAndNil(FUretimKaynakTahsisat);
  inherited;
end;

function TAppDataControllerBaseUretim.Find(ASiraNo: Integer): Boolean;
begin
  Result := (FTableUretimHareket.SiraNo = ASiraNo) or FTableUretimHareket.FindKey([ASiraNo]);
end;

function TAppDataControllerBaseUretim.GetConnection: TAppConnection;
begin
  Result := FTableUretimHareket.Connection;
end;

procedure TAppDataControllerBaseUretim.UpdateMaliyetStokHareket(
  AUretimSiraNo: Integer);
begin

end;

{ TAppDataControllerUretim }

procedure TAppDataControllerUretim.AddEvrakBaslik;
begin
  if FTableEvrakBaslik.FindKey([FTableUretimKart.HesapKod, FTableUretimKart.EvrakNo]) then
  begin
    FTableEvrakBaslik.Edit;
  end
  else begin
    FTableEvrakBaslik.Append;
    FTableEvrakBaslik.SirketNo := FTableUretimKart.SirketNo;
    FTableEvrakBaslik.HesapKod := FTableUretimKart.HesapKod;
    FTableEvrakBaslik.EvrakNo := FTableUretimKart.EvrakNo;
    FTableEvrakBaslik.EvrakTip := FParams.EvrakTip;
    FTableEvrakBaslik.SevkHesapKod := FTableUretimKart.HesapKod;
  end;
  FTableEvrakBaslik.EvrakTarih := FTableUretimKart.EvrakTarih;
  FTableEvrakBaslik.Post;
end;

procedure TAppDataControllerUretim.Add;
  procedure SetParams;
  begin
    Params.SirketNo := FTableUretimBaslik.SirketNo;
    Params.MaliyetTip := TAppMaliyetTip(FTableUretimBaslik.MaliyetTip);
    Params.UretimNo := FTableUretimBaslik.UretimNo;
    Params.EvrakTarih := FTableUretimBaslik.EvrakTarih;
    Params.UretimSiraNo := FTableUretimKart.SiraNo;
    Params.EvrakNo := FTableUretimKart.EvrakNo;
    Params.HesapKod := FTableUretimKart.HesapKod;
    Params.KullanimSekli := TAppUretimKullanimSekli(FTableUretimBaslik.KullanimSekli);

    AnaMamulKart.FData.MalKod := FTableUretimKart.MamulKod;
    AnaMamulKart.FData.VersiyonNo := FTableUretimKart.VersiyonNo;
    AnaMamulKart.FData.Miktar := FTableUretimKart.Miktar;
    AnaMamulKart.FData.KullanimSekli := mksUret;
    AnaMamulKart.FData.DepoKod := FTableUretimKart.MamulDepokod;
    AnaMamulKart.FData.SeriNo := FTableUretimKart.MamulSeriNo;
    AnaMamulKart.FData.SeriNo2 := FTableUretimKart.MamulSeriNo2;
  end;
begin
  DisableControls;
  try
    FMamulKart.FTimeOpen := 0;
    FAnaMamulKart.FTimeOpen := 0;
    DeleteUretimSiraNo(FTableUretimKart.SiraNo);
    SetParams;
    AddEvrakBaslik;
    //if FTableUretimKart.MamulKod <> '' then
    //begin
      AnaMamulKart.Add;
    //end;
  finally
    EnableControls;
  end;
end;

procedure TAppDataControllerUretim.AddStokHareket(AUretimSiraNo: Integer; const AMiktar: Double = -1;
  const ADepoKod: String = ''; const ASeriNo: String = ''; ASeriNo2: String = '');
var
  Src: TTableUretimHareket;
  Des: TTableStokHareket;
  function FindMainSiraNo(ASiraNo: Integer): Integer;
    function A(AnaSiraNo: Integer): Integer;
    begin
      if FTableCloneUretimHareket2.FindKey([AnaSiraNo]) then
      begin
        if FTableCloneUretimHareket2.KayitDurum = 1 then
          Result := FTableCloneUretimHareket2.SiraNo
        else
          Result := A(FTableCloneUretimHareket2.AnaSiraNo);
      end;
    end;
  begin
    if FTableCloneUretimHareket2.FindKey([ASiraNo]) then
    begin
      if FTableCloneUretimHareket2.AnaSiraNo = 0 then
        Result := FTableCloneUretimHareket2.SiraNo
      else
        Result := A(FTableCloneUretimHareket2.AnaSiraNo);
    end;
  end;
begin
  if not Find(AUretimSiraNo) then
    exit;
  {
  Lot olmasý için sürekli eklemesi lazým yoksa findkey yapýyor malesef
  if not FindCloneStokHareket(AUretimSiraNo) then
    FTableStokHareket.Insert
  else begin
    if not FTableStokHareket.FindKey([FTableCloneStokHareket.SiraNo]) then
      exit;
    FTableStokHareket.Edit;
  end;
  }
  FTableStokHareket.Append;
  if FTableStokHareket.State = dsInsert then
  begin
    FTableStokHareket.SirketNo := FTableUretimHareket.SirketNo;
    FTableStokHareket.EvrakNo := FTableUretimHareket.EvrakNo;
    FTableStokHareket.HesapKod := FTableUretimHareket.HesapKod;
    FTableStokHareket.EvrakTip := FParams.EvrakTip;
    FTableStokHareket.IslemTip := FParams.IslemTip;
    FTableStokHareket.SiraNo2 := FTableUretimHareket.SiraNo;
  end;
  FTableStokHareket.MalKod := FTableUretimHareket.MalKod;
  FTableStokHareket.VersiyonNo := FTableUretimHareket.VersiyonNo;
  if AMiktar < 0 then
    FTableStokHareket.Miktar := FTableUretimHareket.Miktar
  else
    FTableStokHareket.Miktar := AMiktar;
  FTableStokHareket.EvrakTarih := FTableUretimHareket.EvrakTarih;
  FTableStokHareket.GirisCikis := FTableUretimHareket.GirisCikis;
  FTableStokHareket.Fiyat := FTableUretimHareket.BirimMaliyet1 + FTableUretimHareket.BirimMaliyet2 + FTableUretimHareket.BirimMaliyet3;
  if ADepoKod = '' then
    FTableStokHareket.DepoKod := FTableUretimHareket.DepoKod
  else
    FTableStokHareket.DepoKod := ADepoKod;
  if ASeriNo = '' then
    FTableStokHareket.SeriNo := FTableUretimHareket.SeriNo
  else
    FTableStokHareket.SeriNo := ASeriNo;
  if ASeriNo2 = '' then
    FTableStokHareket.SeriNo2 := FTableUretimHareket.SeriNo2
  else
    FTableStokHareket.SeriNo2 := ASeriNo2;
  Src := FTableUretimHareket;
  Des := FTableStokHareket;
  Des.SKod1 := Src.SKod1;
  Des.SKod2 := Src.SKod2;
  Des.SKod3 := Src.SKod3;
  Des.SKod4 := Src.SKod4;
  Des.SKod5 := Src.SKod5;
  Des.MKod1 := Src.MKod1;
  Des.MKod2 := Src.MKod2;
  Des.MKod3 := Src.MKod3;
  Des.MKod4 := Src.MKod4;
  Des.MKod5 := Src.MKod5;
  Des.LKod1 := Src.LKod1;
  Des.LKod2 := Src.LKod2;
  Des.LKod3 := Src.LKod3;
  Des.LKod4 := Src.LKod4;
  Des.LKod5 := Src.LKod5;
  Des.BKod1 := Src.BKod1;
  Des.BKod2 := Src.BKod2;
  Des.BKod3 := Src.BKod3;
  Des.BKod4 := Src.BKod4;
  Des.BKod5 := Src.BKod5;
  Des.NKod1 := Src.NKod1;
  Des.NKod2 := Src.NKod2;
  Des.NKod3 := Src.NKod3;
  Des.NKod4 := Src.NKod4;
  Des.NKod5 := Src.NKod5;
  Des.Aciklama1 := Src.Aciklama1;
  Des.Aciklama2 := Src.Aciklama2;
  Des.Aciklama3 := Src.Aciklama3;
  Des.Aciklama4 := Src.Aciklama4;
  Des.Aciklama5 := Src.Aciklama5;
{  if FTableStokHareket.DovizCins <> FTableUretimHareket.DovizCins then
    FTableStokHareket.DovizCins := FTableUretimHareket.DovizCins;}
//  FetchStokHareketDoviz;
  FTableStokHareket.SonKaynakSiraNo := FindMainSiraNo(FTableStokHareket.SiraNo2);
  FTableStokHareket.Post;
end;

procedure TAppDataControllerUretim.AddStokMaliyet;
begin
  if not Find(FTableStokHareket.SiraNo2) then
    exit;
  if FTableStokMaliyet.FindKey([FTableStokHareket.SiraNo]) then
    FTableStokMaliyet.Edit
  else begin
    FTableStokMaliyet.Append;
    FTableStokMaliyet.SirketNo := FTableUretimHareket.SirketNo;
    FTableStokMaliyet.EvrakNo := FTableUretimHareket.EvrakNo;
    FTableStokMaliyet.HesapKod := FTableUretimHareket.HesapKod;
    FTableStokMaliyet.EvrakTip := 51;
    FTableStokMaliyet.SiraNo := FTableStokHareket.SiraNo;
  end;
  FTableStokMaliyet.IlkMaliyet1 := AppRoundMoney(FTableUretimHareket.BirimMaliyet1 * FTableStokHareket.Miktar);
  FTableStokMaliyet.IlkMaliyet2 := AppRoundMoney(FTableUretimHareket.BirimMaliyet2 * FTableStokHareket.Miktar);
  FTableStokMaliyet.IlkMaliyet3 := AppRoundMoney(FTableUretimHareket.BirimMaliyet3 * FTableStokHareket.Miktar);

  FTableStokMaliyet.Maliyet1 := FTableStokMaliyet.IlkMaliyet1;
  FTableStokMaliyet.Maliyet2 := FTableStokMaliyet.IlkMaliyet2 + FTableStokMaliyet.EkMaliyet2;
  FTableStokMaliyet.Maliyet3 := FTableStokMaliyet.IlkMaliyet3 + FTableStokMaliyet.EkMaliyet3;
  FTableStokMaliyet.Maliyet := FTableStokMaliyet.Maliyet1 + FTableStokMaliyet.Maliyet2 + FTableStokMaliyet.Maliyet3;
  FTableStokMaliyet.Post;
end;

procedure TAppDataControllerUretim.DeleteEvrakBaslik(AHesapKod,
  AEvrakNo: String);
begin
  if TableEvrakBaslik.FindKey([AHesapKod, AEvrakNo]) then
    TableEvrakBaslik.Delete;
end;

procedure TAppDataControllerUretim.DeleteStokHareket(AUretimSiraNo: Integer);
begin
  if not Find(AUretimSiraNo) then
    exit;
  TableStokHareket.CancelRange;
  FTableCloneStokHareket.SetRange([AUretimSiraNo], [AUretimSiraNo]);
  FTableCloneStokHareket.First;
  while not FTableCloneStokHareket.Eof do
  begin
    if TableStokHareket.FindKey([FTableCloneStokHareket.EvrakNo, FTableCloneStokHareket.SiraNo]) then
      TableStokHareket.Delete;
    FTableCloneStokHareket.First;
  end;
  FTableCloneStokHareket.CancelRange;
end;

procedure TAppDataControllerUretim.DeleteUretimSiraNo(
  AUretimSiraNo: Integer);
begin
  FTableUretimHareket.DisableControls;
  FTableStokHareket.DisableControls;
  FTableUretimRota.DisableControls;
  try
    AnaMamulKart.FRota.Delete(AUretimSiraNo);
    FTableCloneUretimHareket.SetRange([AUretimSiraNo], [AUretimSiraNo]);
    FTableCloneUretimHareket.First;
    while not FTableCloneUretimHareket.Eof do
    begin
      DeleteStokHareket(FTableCloneUretimHareket.SiraNo);
      FTableCloneUretimHareket.Delete;
      FTableCloneUretimHareket.First;
    end;
    FTableCloneUretimHareket.CancelRange;
  finally
    FTableUretimHareket.EnableControls;
    FTableStokHareket.EnableControls;
    FTableUretimRota.EnableControls;
  end;
end;

procedure TAppDataControllerUretim.AddAll;
begin
  DisableControls;
  try
    FTableUretimKart.First;
    while not FTableUretimKart.Eof do
    begin
      Add;
      FTableUretimKart.Next;
    end;
  finally
    EnableControls;
  end;
end;

procedure TAppDataControllerUretim.DisableControls;
begin
  FTableUretimHareket.DisableControls;
  AnaMamulKart.Table.DisableControls;
  FTableStokHareket.DisableControls;
  FTableEvrakBaslik.DisableControls;
  FTableStokMaliyet.DisableControls;
  FLotDurum.FTableLotDurum.DisableControls;
end;

procedure TAppDataControllerUretim.EnableControls;
begin
  FTableUretimHareket.EnableControls;
  AnaMamulKart.Table.EnableControls;
  FTableStokHareket.EnableControls;
  FTableEvrakBaslik.EnableControls;
  FTableStokMaliyet.EnableControls;
  FLotDurum.FTableLotDurum.EnableControls;
  FTableStokHareket.First;
end;

procedure TAppDataControllerUretim.UpdateMaliyetStokHareket(
  AUretimSiraNo: Integer);
begin
  if not Find(AUretimSiraNo) then
    exit;
  if not FindCloneStokHareket(AUretimSiraNo) then
    exit;
  if not FTableStokHareket.FindKey([FTableCloneStokHareket.EvrakNo, FTableCloneStokHareket.SiraNo]) then
    exit;
  FTableStokHareket.Edit;
  FTableStokHareket.Fiyat := FTableUretimHareket.BirimMaliyet1 + FTableUretimHareket.BirimMaliyet2 + FTableUretimHareket.BirimMaliyet3;
  FTableStokHareket.Post;
end;

constructor TAppDataControllerUretim.Create(
  ATableUretimHareket: TTableUretimHareket;
  ATableUretimRota: TTableUretimRota;
  ATableUretimRotaKaynak: TTableUretimRotaKaynak;
  ATableUretimKaynakTahsisat: TTableUretimKaynakTahsisat;
  ATableStokHareket: TTableStokHareket);
begin
  inherited Create(ATableUretimHareket, ATableUretimRota, ATableUretimRotaKaynak, ATableUretimKaynakTahsisat);
  FTableStokHareket := ATableStokHareket;
  FLotDurum := TAppLotDurum.Create(Self);

  FRuleStokHareket := TAppRuleStokHareket.Create(Self);

  FTableCloneStokHareket := TTableStokHareket.Create(nil);
  FTableStokHareket.AddClone(FTableCloneStokHareket);
  FTableCloneStokHareket.IndexFieldNames := 'SIRANO2';
end;

destructor TAppDataControllerUretim.Destroy;
begin
  FreeAndNil(FLotDurum);
  FreeAndNil(FTableCloneStokHareket);
  if FRuleUretimBaslik <> nil then
    FreeAndNil(FRuleUretimBaslik);
  if FRuleUretimKart <> nil then
    FreeAndNil(FRuleUretimKart);
  if FRuleStokHareket <> nil then
    FreeAndNil(FRuleStokHareket);
  if FRuleUretimBaglanti <> nil then
    FreeAndNil(FRuleUretimBaglanti);
  inherited;
end;

function TAppDataControllerUretim.FindCloneStokHareket(
  AUretimSiraNo: Integer): Boolean;
begin
  Result := FTableCloneStokHareket.FindKey([AUretimSiraNo]);
end;

procedure TAppDataControllerUretim.DeleteStokMaliyet;
begin
  if FTableStokMaliyet.FindKey([FTableStokHareket.SiraNo]) then
    FTableStokMaliyet.Delete;
end;

procedure TAppDataControllerUretim.AddStokHareketByLot(
  AUretimSiraNo: Integer; const AMiktar: Double; const ADepoKod: String);
begin
  FLotDurum.AddStokHareketByLot(AUretimSiraNo, AMiktar, ADepoKod);
end;

procedure TAppDataControllerUretim.SetTableUretimBaglanti(
  const Value: TTableUretimBaglanti);
begin
  FTableUretimBaglanti := Value;
  if Value <> nil then
    FRuleUretimBaglanti := TAppRuleUretimBaglanti.Create(Self);
end;

procedure TAppDataControllerUretim.SetTableUretimBaslik(
  const Value: TTableUretimBaslik);
begin
  FTableUretimBaslik := Value;
  if Value <> nil then
    FRuleUretimBaslik := TAppRuleUretimBaslik.Create(Self);
end;

procedure TAppDataControllerUretim.SetTableUretimKart(
  const Value: TTableUretimKart);
begin
  FTableUretimKart := Value;
  if Value <> nil then
    FRuleUretimKart := TAppRuleUretimKart.Create(Self);
end;

{ TAppRuleAnaMamulKart }

constructor TAppRuleAnaMamulKart.Create(AOwner: TAppAnaMamulKart);
begin
  inherited Create;
  FAnaMamulKart := AOwner;
  FTable := FAnaMamulKart.FTableClone;
  FTable.DataEvents.AddRule(Self);
end;

procedure TAppRuleAnaMamulKart.DoAfterPost(Table: TAppCustomTable);
begin
  FAnaMamulKart.FUretim.Add;
end;

procedure TAppRuleAnaMamulKart.DoOnFieldChanged(Table: TAppCustomTable;
  Field: TField);
begin
  if FInUse then
    exit;
  FInUse := True;
  try
    if Field = FTable.fMiktar then
      FTable.UretimMiktar := FTable.Miktar * FAnaMamulKart.Data.Miktar;
  finally
    FInUse := False;
  end;
end;

procedure TAppRuleAnaMamulKart.DoOnNewRecord(Table: TAppCustomTable);
begin
  FTable.MamulKod := FAnaMamulKart.Data.MalKod;
end;

{ TAppRuleStokHareket }

constructor TAppRuleStokHareket.Create(AOwner: TAppDataControllerUretim);
begin
  inherited Create;
  FUretim := AOwner;
  FTable := FUretim.TableStokHareket;
  FTable.DataEvents.AddRule(Self);
end;

procedure TAppRuleStokHareket.DoAfterScroll(Table: TAppCustomTable);
begin
  if not Table.ControlsDisabled then
  begin
    if (not FUretim.FLotDurum.FTableLotDurum.ControlsDisabled) and (FUretim.Params.AutoLot) then
      FUretim.FLotDurum.Open(FTable.MalKod, FTable.VersiyonNo, '!');
  end;
end;

procedure TAppRuleStokHareket.DoBeforeDelete(Table: TAppCustomTable);
begin
  if FTable.EvrakTip = 51 then
    FUretim.DeleteStokMaliyet;
end;

procedure TAppRuleStokHareket.DoAfterPost(Table: TAppCustomTable);
begin
  if FTable.EvrakTip = 51 then
    FUretim.AddStokMaliyet;
end;

{ TAppUretimRota }

procedure TAppUretimRota.Add;
var
  I: Integer;
  AData: TAppTreeData;
begin
  FTableUretimRota.Append;
  FTableUretimRota.EvrakTip := FUretim.Params.UretimTip;
  FTableUretimRota.EvrakNo := FUretim.Params.EvrakNo;
  FTableUretimRota.UretimNo := FUretim.Params.UretimNo;
  FTableUretimRota.UretimSiraNo := FUretim.Params.UretimSiraNo;
  FTableUretimRota.IsMerkezKod := FUretim.FdcBOMObject.MamulRotaKart.Table.IsMerkezKod;
  FTableUretimRota.OperasyonNo := FUretim.FdcBOMObject.MamulRotaKart.Table.OperasyonNo;
  FTableUretimRota.Miktar := FMamulKart.FData.Miktar;
  FTableUretimRota.Aciklama := FUretim.FdcBOMObject.MamulRotaKart.Table.Aciklama;
  if FMamulKart.FData.KullanimSekli <> mksVariant then
  begin
    FTableUretimRota.MamulKod := FUretim.FdcBOMObject.MamulRotaKart.Table.MamulKod;
    FTableUretimRota.VersiyonNo := FUretim.FdcBOMObject.MamulRotaKart.Table.VersiyonNo;
  end
  else begin
    AData := FMamulKart.FData;
    for I := 0 to 100  do
    begin
      AData := AData.Parent;
      if AData <> nil then
      begin
        if AData.KullanimSekli <> mksVariant then
        begin
          FTableUretimRota.MamulKod := AData.Malkod;
          FTableUretimRota.VersiyonNo := AData.VersiyonNo;
          break;
        end;
      end
      else begin
        FTableUretimRota.MamulKod := FUretim.FdcBOMObject.MamulRotaKart.Table.MamulKod;
        FTableUretimRota.VersiyonNo := FUretim.FdcBOMObject.MamulRotaKart.Table.VersiyonNo;
        Break;
      end;
    end;
  end;
  FTableUretimRota.Post;

  FUretimRotaKaynak.Add(FUretim.FdcBOMObject.MamulRotaKart.Table.MamulKod, FUretim.FdcBOMObject.MamulRotaKart.Table.VersiyonNo, FTableUretimRota.OperasyonNo);
end;

constructor TAppUretimRota.Create(AOwner: TAppBaseMamulKart);
begin
  inherited Create;
  FMamulKart := AOwner;
  FUretim := FMamulKart.FUretim;

  FTableUretimRota := FUretim.FTableUretimRota;
  FTableUretimHareket := FMamulKart.FTableUretimHareket;

  FUretimRotaKaynak :=  TAppUretimRotaKaynak.Create(Self);
end;

procedure TAppUretimRota.Delete(AUretimSiraNo: Integer);
begin
  FTableUretimRota.SetRange([AUretimSiraNo], [AUretimSiraNo]);
  FTableUretimRota.First;
  while not FTableUretimRota.Eof do
  begin
    FTableUretimRota.Delete;
  end;
  FTableUretimRota.CancelRange;
  FUretimRotaKaynak.Delete(AUretimSiraNo);
end;

destructor TAppUretimRota.Destroy;
begin
  inherited;
end;

procedure TAppUretimRota.FetchToUretimHareket;
begin
  FTableUretimHareket.AnaSiraNo := FMamulKart.FData.SiraNo;
  FTableUretimHareket.UretimSiraNo := FUretim.Params.UretimSiraNo;
  FTableUretimHareket.EvrakTip := FUretim.Params.UretimTip;
  FTableUretimHareket.UretimNo := FUretim.Params.UretimNo;
  FTableUretimHareket.EvrakTarih := FUretim.Params.EvrakTarih;
  FTableUretimHareket.EvrakNo := FUretim.Params.EvrakNo;
  FTableUretimHareket.HesapKod := FUretim.Params.HesapKod;
  FTableUretimHareket.AnaMamulKod := FUretim.AnaMamulKart.Data.MalKod;
  FTableUretimHareket.MamulKod := FMamulKart.FData.MalKod;
  FTableUretimHareket.MalKod := FUretim.FdcBOMObject.MamulRotaKart.Table.IsMerkezKod;
  FTableUretimHareket.MalAd := FUretim.FdcBOMObject.IsMerkezKart.Table.IsMerkezAd;
  FTableUretimHareket.VersiyonNo := '';
  FTableUretimHareket.GirisCikis := 1;
  FTableUretimHareket.BirimMiktar := 0;
  FTableUretimHareket.KullanimSekli := 5;
  FTableUretimHareket.MiktarTip := 0;
  FTableUretimHareket.Miktar := 0;//(FTableMamulRota.CalismaSure * FMamulKart.FData.Miktar) + FTableMamulRota.KurulumSure;
  FTableUretimHareket.BilesenFireOran := 0;
  FTableUretimHareket.OperasyonNo := 0;
  FTableUretimHareket.OperasyonFireKullan := 0;
  FTableUretimHareket.OperasyonFireOran := 0;
  FTableUretimHareket.OperasyonFireMiktar := 0;
  FTableUretimHareket.DepoKod := FMamulKart.FData.DepoKod;
  FTableUretimHareket.StokGiris := 0;
  FTableUretimHareket.StokCikis := 0;
  FTableUretimHareket.StokMiktar := 0;
  FTableUretimHareket.Kullanilabilir := 0;
  FTableUretimHareket.BirimMaliyet1 := FUretim.FdcBOMObject.IsMerkezKart.Table.Maliyet1;
  FTableUretimHareket.BirimMaliyet2 := FUretim.FdcBOMObject.IsMerkezKart.Table.Maliyet2;
  FTableUretimHareket.BirimMaliyet3 := FUretim.FdcBOMObject.IsMerkezKart.Table.Maliyet3;
  FTableUretimHareket.Maliyet1 := FTableUretimHareket.BirimMaliyet1 * FTableUretimHareket.Miktar;
  FTableUretimHareket.Maliyet2 := FTableUretimHareket.BirimMaliyet2 * FTableUretimHareket.Miktar;
  FTableUretimHareket.Maliyet3 := FTableUretimHareket.BirimMaliyet3 * FTableUretimHareket.Miktar;
  FTableUretimHareket.DovizCins := '';
  FTableUretimHareket.Tip := Integer(matWorkCenter);
end;

{ TAppRuleUretimKart }

constructor TAppRuleUretimKart.Create(AOwner: TAppDataControllerUretim);
begin
  inherited Create;
  FUretim := AOwner;
  FTableUretimKart := FUretim.FTableUretimKart;
  FTableUretimKart.DataEvents.AddRule(Self);
  FTableCommand := TAppDBTable.Create(nil);
  FTableCommand.Connection := FTableUretimKart.Connection;
  FTableCommand.ReadOnly := True;  
end;

destructor TAppRuleUretimKart.Destroy;
begin
  FreeAndNil(FTableCommand);
  inherited;
end;

procedure TAppRuleUretimKart.DoAfterDelete(Table: TAppCustomTable);
begin
  FUretim.AnaMamulKart.Delete(FOldMamulKod, FOldVersiyonNo);
  FUretim.DeleteEvrakBaslik(FOldHesapKod, FOldEvrakNo);
  FUretim.DeleteUretimSiraNo(FOldSiraNo);
end;

procedure TAppRuleUretimKart.DoAfterPost(Table: TAppCustomTable);
begin
  if (FTableUretimKart.HesapKod <> FOldHesapKod) or (FTableUretimKart.EvrakNo <> FOldEvrakNo) then
    FUretim.DeleteEvrakBaslik(FOldHesapKod, FOldEvrakNo);
  FUretim.Add;
end;

procedure TAppRuleUretimKart.DoAfterScroll(Table: TAppCustomTable);
begin
  FUretim.AnaMamulKart.Data.MalKod := FTableUretimKart.MamulKod;
  FUretim.AnaMamulKart.Data.VersiyonNo := FTableUretimKart.VersiyonNo;
  FUretim.AnaMamulKart.RangeClone;
end;

procedure TAppRuleUretimKart.DoBeforeDelete(Table: TAppCustomTable);
begin
  SetOldValues;
end;

procedure TAppRuleUretimKart.DoBeforeEdit(Table: TAppCustomTable);
begin
  SetOldValues;
end;

procedure TAppRuleUretimKart.DoBeforePost(Table: TAppCustomTable);
begin
  if Table.State = dsInsert then
  begin
    FOldHesapKod := FTableUretimKart.HesapKod;
    FOldEvrakNo := FTableUretimKart.EvrakNo;
    FOldSiraNo := FTableUretimKart.SiraNo;
  end;
end;

procedure TAppRuleUretimKart.DoOnFieldChanged(Table: TAppCustomTable;
  Field: TField);
begin
  if InUse then
    exit;
  InUse := True;
  try
    if (Field = FTableUretimKart.fMamulKod) or (Field = FTableUretimKart.fVersiyonNo) then
    begin
      SetDataController;
      FUretim.AnaMamulKart.RangeClone;
      //DAP.MamulStokKart.Add(Field.AsString);
      FTableUretimKart.MamulDepoKod := GetMamulDepoKod(FTableUretimKart.MamulKod, FTableUretimKart.VersiyonNo);
    end
    else if Field = FTableUretimKart.fMiktar then
    begin
      SetDataController;
      FUretim.AnaMamulKart.UpdateMiktar;
    end;
  finally
    InUse := False;
  end;
end;

procedure TAppRuleUretimKart.DoOnNewRecord(Table: TAppCustomTable);
begin
  FOldHesapKod := '';
  FOldEvrakNo := '';
  FOldMamulKod := '';
  FOldVersiyonNo := '';
  FOldSiraNo := 0;
end;

function TAppRuleUretimKart.GetMamulDepoKod(MamulKod, VersiyonNo: String): String;
begin
  FTableCommand.TableItems.TableNames := 'MAMBAS';
  with FTableCommand.TableItems[0].Fields do
  begin
    Clear;
    Add('MAMULDEPOKOD');
  end;
  with FTableCommand.TableItems[0].Where do
  begin
    Clear;
    Add('MAMULKOD', wcEqual, MamulKod);
    AddOperator(woAnd);
    Add('VERSIYONNO', wcEqual, VersiyonNo);
  end;
  FTableCommand.Open;
  Result := FTableCommand.Fields[0].AsString;
  FTableCommand.Close;
end;

procedure TAppRuleUretimKart.SetDataController;
begin
  FUretim.AnaMamulKart.Data.MalKod := FTableUretimKart.MamulKod;
  FUretim.AnaMamulKart.Data.VersiyonNo := FTableUretimKart.VersiyonNo;
  FUretim.AnaMamulKart.Data.Miktar := FTableUretimKart.Miktar;
  FUretim.Params.MaliyetTip := TAppMaliyetTip(FUretim.TableUretimBaslik.MaliyetTip);
end;

procedure TAppRuleUretimKart.SetOldValues;
begin
  FOldHesapKod := FTableUretimKart.HesapKod;
  FOldEvrakNo := FTableUretimKart.EvrakNo;
  FOldMamulKod := FTableUretimKart.MamulKod;
  FOldVersiyonNo := FTableUretimKart.VersiyonNo;
  FOldSiraNo := FTableUretimKart.SiraNo;
end;

{ TAppRuleUretimBaslik }

constructor TAppRuleUretimBaslik.Create(AOwner: TAppDataControllerUretim);
begin
  inherited Create;
  FUretim := AOwner;
  FTableUretimBaslik := FUretim.FTableUretimBaslik;
  FTableUretimBaslik.DataEvents.AddRule(Self);
end;

procedure TAppRuleUretimBaslik.DoOnFieldChanged(Table: TAppCustomTable;
  Field: TField);
begin
  if InUse then
    exit;
  InUse := True;
  try
    if (Field = FTableUretimBaslik.fKullanimSekli) or (Field = FTableUretimBaslik.fMaliyetTip) then
    begin
      if not FUretim.FTableUretimHareket.IsEmpty then
      begin
        FUretim.AddAll;
        ShowMessage('Üretim tekrardan çalýþtýrýldý!');
      end;
    end
  finally
    InUse := False;
  end;
end;

{ TAppLotDurum }

procedure TAppLotDurum.Add;
var
  AUretimSiraNo: Integer;
begin
  AUretimSiraNo := FTableStokHareket.SiraNo2;
  AddStokHareketFromLot(AUretimSiraNo);
end;

procedure TAppLotDurum.AddStokHareketByLot(AUretimSiraNo: Integer;
  const AMiktar: Double; const ADepoKod: String);
var
  FSeriNo, FSeriNo2, FKullanilabilir: TField;
  MalKod, VersiyonNo, DepoKod: String;
  KullanilacakMiktar, KalanMiktar: Double;
begin
  if not FUretim.Find(AUretimSiraNo) then
    exit;
  MalKod := FTableUretimHareket.MalKod;
  DepoKod := FTableUretimHareket.DepoKod;
  VersiyonNo := FTableUretimHareket.VersiyonNo;
  Open(MalKod, VersiyonNo, DepoKod);
  KalanMiktar := FTableUretimHareket.Miktar;
  FKullanilabilir := FTableLotDurum.FindField('KULLANILABILIR');
  FSeriNo := FTableLotDurum.FindField('SERINO');
  FSeriNo2 := FTableLotDurum.FindField('SERINO2');
  if FTableLotDurum.RecordCount = 1 then // Eðer tek hareketse direk atsýn. yoksa boþ olduðunda seri no lar 2 kayýt üretebiliyor.
  begin
    if KalanMiktar > 0 then
      FUretim.AddStokHareket(AUretimSiraNo, KalanMiktar, DepoKod, FSeriNo.AsString, FSeriNo2.AsString);
  end
  else begin
    FTableLotDurum.First;
    while not FTableLotDurum.Eof do
    begin
      if KalanMiktar <= 0 then
        break;
      if FKullanilabilir.AsFloat > KalanMiktar then
        KullanilacakMiktar := KalanMiktar
      else
        KullanilacakMiktar := FKullanilabilir.AsFloat;
      KalanMiktar := KalanMiktar - KullanilacakMiktar;
      if KullanilacakMiktar > 0 then
        FUretim.AddStokHareket(AUretimSiraNo, KullanilacakMiktar, DepoKod, FSeriNo.AsString, FSeriNo2.AsString);
      FTableLotDurum.Next;
    end;
    if KalanMiktar > 0 then
      FUretim.AddStokHareket(AUretimSiraNo, KalanMiktar, DepoKod, '', '');
  end;
end;

procedure TAppLotDurum.AddStokHareketFromLot(AUretimSiraNo: Integer);
var
  FUretimMiktar, FDepoKod, FSeriNo, FSeriNo2: TField;
begin
  if not FUretim.Find(AUretimSiraNo) then
    exit;
  FUretimMiktar := FTableLotDurum.FindField('_URETIMMIKTAR');
  FDepoKod := FTableLotDurum.FindField('DEPOKOD');
  FSeriNo := FTableLotDurum.FindField('SERINO');
  FSeriNo2 := FTableLotDurum.FindField('SERINO2');
  FTableLotDurum.DisableControls;
  FTableStokHareket.DisableControls;
  FTableUretimHareket.DisableControls;
  try
    FUretim.DeleteStokHareket(AUretimSiraNo);
    FTableLotDurum.First;
    while not FTableLotDurum.Eof do
    begin
      if FUretimMiktar.AsFloat > 0 then
      begin
        FUretim.AddStokHareket(AUretimSiraNo, FUretimMiktar.AsFloat, FDepoKod.AsString, FSeriNo.AsString, FSeriNo2.AsString);
      end;
      FTableLotDurum.Next;
    end;
  finally
    FTableLotDurum.EnableControls;
    FTableStokHareket.EnableControls;
    FTableUretimHareket.EnableControls;
  end;
end;

constructor TAppLotDurum.Create(AOwner: TAppDataControllerUretim);
begin
  inherited Create;
  FUretim := AOwner;
  FTableUretimHareket := FUretim.FTableUretimHareket;
  FTableStokHareket := FUretim.FTableStokHareket;

  FTableLotDurum := TAppDBTable.Create(nil);
  FTableLotDurum.Connection := FUretim.FTableUretimHareket.Connection;
  FTableLotDurum.ProviderName := 'prCommand';

  SetDefinition;
  FTableLotDurum.Close;
  FTableLotDurum.DoInitializeRecord;
end;

destructor TAppLotDurum.Destroy;
begin
  FreeAndNil(FTableLotDurum);
  inherited;
end;

procedure TAppLotDurum.Open(AMalKod, AVersiyonNo, ADepoKod: String);
begin
  FTableLotDurum.Close;
  with FTableLotDurum.TableItems[0] do
  begin
    with Where do
    begin
      Clear;
      Add('SIRKETNO' , wcEqual, FUretim.Params.SirketNo);
      AddOperator(woAnd);
      Add('MALKOD', wcEqual, AMalKod);
      AddOperator(woAnd);
      Add('VERSIYONNO', wcEqual, AVersiyonNo);
      if ADepoKod <> '!' then
      begin
        AddOperator(woAnd);
        Add('DEPOKOD', wcEqual, ADepoKod);
      end;
    end;
  end;
  FTableLotDurum.Open;
  FTableLotDurum.IndexFieldNames := 'SERKRT_URETIMTARIH';
end;

procedure TAppLotDurum.SetDefinition;
begin
  FTableLotDurum.TableItems.TableNames := VarArrayOf([AppStokDurumHelper.StokDurumDef, 'SERKRT']);
  FTableLotDurum.TableItems.TableAlias := VarArrayOf(['STKDRM','SERKRT']);
  FTableLotDurum.TableItems.TableCaptions := VarArrayOf(['Lot Durum', 'Seri Kart']);

  with FTableLotDurum.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
      AddExpression('CAST(0 AS NUMERIC(25, 6))', '_URETIMMIKTAR');
    end;
  end;
  with FTableLotDurum.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('URETIMTARIH');
    end;
    with Join do
    begin
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('MALKOD', 'MALKOD');
      Add('SERINO', 'SERINO');
      Add('SERINO2', 'SERINO2');
    end;
  end;
end;

function TAppLotDurum.Validate(AShowError,
  AConfirmError: Boolean): Boolean;
var
  FUretimMiktar: TField;
  TU: Double;
begin
  Result := False;
  if FTableStokHareket.MalKod <> FTableLotDurum.FieldByName('MALKOD').AsString then
  begin
    ShowMessage('Lot Durumundaki Malkodu yanlýþ seçilmiþ!');
    exit;
  end;
  if not FUretim.Find(FTableStokHareket.SiraNo2) then
    exit;
  FUretimMiktar := FTableLotDurum.FindField('_URETIMMIKTAR');
  FTableLotDurum.First;
  TU := 0;
  while not FTableLotDurum.Eof do
  begin
    TU := TU + FUretimMiktar.AsFloat;
    FTableLotDurum.Next;
  end;
  Result := FTableUretimHareket.Miktar = TU;
  if not Result then
  begin
    if AConfirmError then
    begin
      Result := AppConfirm(Format('Üretim Mikarý: %f, Toplam Lot Miktarý: %f', [FTableUretimHareket.Miktar, TU]) +
        #10+#13 + 'Miktarlar tutmuyor, Ýþleme devam et?');
    end
    else
    if AShowError then
      ShowMessage(Format('Üretim Mikarý: %f, Toplam Lot Miktarý: %f', [FTableUretimHareket.Miktar, TU]));
  end;
end;

{ TAppUretimRotaKaynak }

procedure TAppUretimRotaKaynak.Add(AMamulKod: String; AVersiyonNo: String; AOperasyonNo: Integer);
  procedure AddFromMamulRotaKaynak;
  begin
    FUretim.FdcBOMObject.MamulRotaKaynakKart.Open(AMamulKod, 0, AVersiyonNo, AOperasyonNo);
    FUretim.FdcBOMObject.MamulRotaKaynakKart.Table.First;
    while not FUretim.FdcBOMObject.MamulRotaKaynakKart.Table.Eof do
    begin
      FTableUretimRotaKaynak.Append;
      FTableUretimRotaKaynak.SirketNo := FUretimRota.FTableUretimRota.SirketNo;
      FTableUretimRotaKaynak.EvrakTip := FUretimRota.FTableUretimRota.EvrakTip;
      FTableUretimRotaKaynak.EvrakNo := FUretimRota.FTableUretimRota.EvrakNo;
      FTableUretimRotaKaynak.UretimNo := FUretimRota.FTableUretimRota.UretimNo;
      FTableUretimRotaKaynak.UretimSiraNo := FUretimRota.FTableUretimRota.UretimSiraNo;
      FTableUretimRotaKaynak.OperasyonNo := AOperasyonNo;
      FTableUretimRotaKaynak.IsMerkezKod := FUretimRota.FTableUretimRota.IsMerkezKod;
      FTableUretimRotaKaynak.MamulKod := FUretimRota.FTableUretimRota.MamulKod;
      FTableUretimRotaKaynak.VersiyonNo := FUretimRota.FTableUretimRota.VersiyonNo;
      FTableUretimRotaKaynak.Miktar := FUretimRota.FTableUretimRota.Miktar;
      FTableUretimRotaKaynak.KaynakKod := FUretim.FdcBOMObject.MamulRotaKaynakKart.Table.KaynakKod;
      FTableUretimRotaKaynak.KullanimSiraNo := FUretim.FdcBOMObject.MamulRotaKaynakKart.Table.KullanimSiraNo;
      if FUretim.FdcBOMObject.MamulKurulum.Find(FTableUretimRotaKaynak.KaynakKod, FTableUretimRotaKaynak.MamulKod) then
        FTableUretimRotaKaynak.CalismaSure := FUretim.FdcBOMObject.MamulKurulum.Table.CalismaSure
      else if FUretim.FdcBOMObject.KaynakKart.Find(FTableUretimRotaKaynak.KaynakKod) then
        FTableUretimRotaKaynak.CalismaSure := FUretim.FdcBOMObject.KaynakKart.Table.CalismaSure;
      FTableUretimRotaKaynak.SokumMamulKod := FindKaynakOncekiMamul(FTableUretimRotaKaynak.KaynakKod, FTableUretimRotaKaynak.UretimSiraNo);
      if FUretim.FdcBOMObject.MamulDegisim.Find(FTableUretimRotaKaynak.KaynakKod, FTableUretimRotaKaynak.MamulKod, FTableUretimRotaKaynak.SokumMamulKod) then
      begin
        FTableUretimRotaKaynak.KurulumSure := FUretim.FdcBOMObject.MamulDegisim.Table.KurulumSure;
        FTableUretimRotaKaynak.SokumSure := FUretim.FdcBOMObject.MamulDegisim.Table.SokumSure;
      end
      else begin
        if FUretim.FdcBOMObject.KaynakKart.Find(FTableUretimRotaKaynak.KaynakKod) then
        begin
          FTableUretimRotaKaynak.KurulumSure := FUretim.FdcBOMObject.KaynakKart.Table.KurulumSure;
          FTableUretimRotaKaynak.SokumSure := FUretim.FdcBOMObject.KaynakKart.Table.SokumSure;
        end;
      end;
      FTableUretimRotaKaynak.ToplamSure := FTableUretimRotaKaynak.KurulumSure + (FTableUretimRotaKaynak.Miktar * FTableUretimRotaKaynak.CalismaSure) + FTableUretimRotaKaynak.SokumSure;
      FTableUretimRotaKaynak.Post;
      FUretim.FdcBOMObject.MamulRotaKaynakKart.Table.Next;
    end;
  end;
begin
  AddFromMamulRotaKaynak;
  FindKullanilan(FTableUretimRotaKaynak.UretimSiraNo, AOperasyonNo);
  if FTableUretimRotaKaynak.FindKey([FUretimRota.FTableUretimRota.UretimSiraNo, AOperasyonNo, 1]) then
    FUretim.FUretimKaynakTahsisat.Add(FTableUretimRotaKaynak);
end;

constructor TAppUretimRotaKaynak.Create(AOwner: TAppUretimRota);
begin
  inherited Create;
  FUretimRota := AOwner;
  FUretim := FUretimRota.FUretim;
  FTableUretimRotaKaynak := FUretim.FTableUretimRotaKaynak;
  FTableUretimRotaKaynak.IndexFieldNames := 'URETIMSIRANO;OPERASYONNO;KULLANILAN';

  FTableCloneUretimRotaKaynak := TTableUretimRotaKaynak.Create(nil);
  FTableCloneUretimRotaKaynak.IndexFieldNames := 'URETIMSIRANO;OPERASYONNO;KULLANIMSIRANO;KAYNAKKOD';
  FTableUretimRotaKaynak.AddClone(FTableCloneUretimRotaKaynak);
end;

procedure TAppUretimRotaKaynak.Delete;
begin
  FTableUretimRotaKaynak.SetRange([AUretimSiraNo], [AUretimSiraNo]);
  FTableUretimRotaKaynak.First;
  while not FTableUretimRotaKaynak.Eof do
  begin
    FTableUretimRotaKaynak.Delete;
  end;
  FTableUretimRotaKaynak.CancelRange;
end;

destructor TAppUretimRotaKaynak.Destroy;
begin
  FreeAndNil(FTableCloneUretimRotaKaynak);
  inherited;
end;

function TAppUretimRotaKaynak.FindKaynakOncekiMamul(
  AKaynakKod: String; AUretimSiraNo: Integer): String;
var
  ABasNo, ABitNo: Integer;
begin
  ABasNo := 0; ABitNo := AUretimSiraNo - 1;
  FUretim.FUretimKaynakTahsisat.FTableCloneUretimKaynakTahsisat.SetRange([AKaynakKod, ABasNo], [AKaynakKod, ABitNo]);
  if FUretim.FUretimKaynakTahsisat.FTableCloneUretimKaynakTahsisat.IsEmpty then
  begin
    if FUretim.FKaynakSonDurum.Find(AKaynakKod) then
      Result := FUretim.FKaynakSonDurum.FTableKaynakSonDurum.SonMamulKod
    else
      Result := '';
  end
  else begin
    FUretim.FUretimKaynakTahsisat.FTableUretimKaynakTahsisat.Last;
    Result := FUretim.FUretimKaynakTahsisat.FTableUretimKaynakTahsisat.MamulKod;
  end;
end;

procedure TAppUretimRotaKaynak.FindKullanilan(AUretimSiraNo,
  AOperasyonNo: Integer);
var
  AKaynakKod: String;
  AKullanimSiraNo: Integer;
  ASure: Double;
begin
  AKullanimSiraNo := -1;
  FTableCloneUretimRotaKaynak.SetRange([AUretimSiraNo, AOperasyonNo], [AUretimSiraNo, AOperasyonNo]);
  FTableCloneUretimRotaKaynak.First;
  ASure := -1;
  while not FTableCloneUretimRotaKaynak.Eof do
  begin
    if ASure = -1 then
    begin
      AKullanimSiraNo := FTableCloneUretimRotaKaynak.KullanimSiraNo;
      AKaynakKod := FTableCloneUretimRotaKaynak.KaynakKod;
      ASure := FTableCloneUretimRotaKaynak.ToplamSure;
    end
    else begin
      if FTableCloneUretimRotaKaynak.ToplamSure < ASure then
      begin
        AKullanimSiraNo := FTableCloneUretimRotaKaynak.KullanimSiraNo;
        AKaynakKod := FTableCloneUretimRotaKaynak.KaynakKod;
        ASure := FTableCloneUretimRotaKaynak.ToplamSure;
      end;
    end;
    FTableCloneUretimRotaKaynak.Next;
  end;
  if ASure <> -1 then
  begin
    if FTableCloneUretimRotaKaynak.FindKey([AUretimSiraNo, AOperasyonNo, AKullanimSiraNo, AKaynakKod]) then
    begin
      FTableCloneUretimRotaKaynak.Edit;
      FTableCloneUretimRotaKaynak.Kullanilan := 1;
      FTableCloneUretimRotaKaynak.Post;
    end;
  end;
  FTableCloneUretimRotaKaynak.CancelRange;
end;

{ TAppUretimKaynakTahsisat }

procedure TAppUretimKaynakTahsisat.Add(
  ATableUretimRotaKaynak: TTableUretimRotaKaynak);
begin
  exit; // Burada hata vardý, silemiyordu.
  FTableUretimKaynakTahsisat.Append;
  FTableUretimKaynakTahsisat.SirketNo := ATableUretimRotaKaynak.SirketNo;
  FTableUretimKaynakTahsisat.EvrakTip := ATableUretimRotaKaynak.EvrakTip;
  FTableUretimKaynakTahsisat.EvrakNo := ATableUretimRotaKaynak.EvrakNo;
  FTableUretimKaynakTahsisat.UretimNo := ATableUretimRotaKaynak.UretimNo;
  FTableUretimKaynakTahsisat.UretimSiraNo := ATableUretimRotaKaynak.UretimSiraNo;
  FTableUretimKaynakTahsisat.MamulKod := ATableUretimRotaKaynak.MamulKod;
  FTableUretimKaynakTahsisat.OperasyonNo := ATableUretimRotaKaynak.OperasyonNo;
  FTableUretimKaynakTahsisat.IsMerkezKod := ATableUretimRotaKaynak.IsMerkezKod;
  FTableUretimKaynakTahsisat.KaynakKod := ATableUretimRotaKaynak.KaynakKod;
  FTableUretimKaynakTahsisat.Sure := ATableUretimRotaKaynak.ToplamSure;
  FTableUretimKaynakTahsisat.Post;
end;

constructor TAppUretimKaynakTahsisat.Create(
  AOwner: TAppDataControllerBaseUretim);
begin
  inherited Create;
  FUretim := AOwner;
  FTableCloneUretimKaynakTahsisat := TTableUretimKaynakTahsisat.Create(nil);
  FTableCloneUretimKaynakTahsisat.IndexFieldNames := 'KAYNAKKOD;URETIMSIRANO';

  FTableUretimKaynakTahsisat := FUretim.FTableUretimKaynakTahsisat;
  FTableUretimKaynakTahsisat.AddClone(FTableCloneUretimKaynakTahsisat);
end;

destructor TAppUretimKaynakTahsisat.Destroy;
begin
  FreeAndNil(FTableCloneUretimKaynakTahsisat);
  inherited;
end;

{ TAppUretimKaynakSonDurum }

function TAppUretimKaynakSonDurum.Add(AKaynakKod: String): Boolean;
begin
  FTableFindKaynakSonDurum.Close;
  with FTableFindKaynakSonDurum.TableItems[0] do
  begin
    with Where do
    begin
      Clear;
      Add('KAYNAKKOD', wcEqual, AKaynakKod);
    end;
  end;
  if FTableFindKaynakSonDurum.FieldCount = 0 then
  begin
    FTableFindKaynakSonDurum.DoInitializeRecord;
    FTableFindKaynakSonDurum.Close;
  end;
  FTableFindKaynakSonDurum.Open;
  Result := not FTableFindKaynakSonDurum.IsEmpty;
  if not FTableKaynakSonDurum.Active then
    FTableKaynakSonDurum.Data := FTableFindKaynakSonDurum.Data
  else begin
    if Result then
      FTableKaynakSonDurum.AppendTable(FTableFindKaynakSonDurum);
  end;
end;

constructor TAppUretimKaynakSonDurum.Create(
  AOwner: TAppDataControllerBaseUretim);
begin
  inherited Create;
  FUretim := AOwner;
  FTableKaynakSonDurum := TTableUretimKaynakSonDurum.Create(nil);
  FTableKaynakSonDurum.IndexFieldNames := 'KAYNAKKOD';

  FTableFindKaynakSonDurum := TTableUretimKaynakSonDurum.Create(nil);
  FTableFindKaynakSonDurum.Connection :=  FUretim.Connection;
  FTableFindKaynakSonDurum.ReadOnly := True;
  SetDefinition;
end;

destructor TAppUretimKaynakSonDurum.Destroy;
begin
  FreeAndNil(FTableFindKaynakSonDurum);
  FreeAndNil(FTableKaynakSonDurum);
  inherited;
end;

function TAppUretimKaynakSonDurum.Find(AKaynakKod: String): Boolean;
begin
  if not FTableKaynakSonDurum.Active then
    Result := Add(AKaynakKod)
  else begin
    Result := FTableKaynakSonDurum.FindKey([AKaynakKod]);
    if not Result then
      Result := Add(AKaynakKod);
  end;
end;

procedure TAppUretimKaynakSonDurum.SetDefinition;
begin
  FTableFindKaynakSonDurum.TableItems.TableNames := 'URTKYS';
  with FTableFindKaynakSonDurum.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
    end;
  end;
end;

{ TAppRuleUretimBaglanti }

procedure TAppRuleUretimBaglanti.AddEvrakKaynak;
begin
  if FTableUretimBaglanti.IsEmpty then
    exit;
  FTableEvrakKaynak.Append;
  FTableEvrakKaynak.KaynakEvrakTip :=  FTableUretimBaglanti.KaynakEvrakTip;
  FTableEvrakKaynak.KaynakEvrakNo :=  FTableUretimBaglanti.KaynakEvrakNo;
  FTableEvrakKaynak.KaynakHesapKod :=  FTableUretimBaglanti.KaynakHesapKod;
  FTableEvrakKaynak.KaynakSiraNo :=  FTableUretimBaglanti.KaynakSiraNo;
  FTableEvrakKaynak.Miktar :=  FTableUretimBaglanti.Miktar;
  FTableEvrakKaynak.Kapat :=  FTableUretimBaglanti.Kapat;
  if FTableEvrakKaynak.Kapat = bagOzelKapat then
  begin
    FTableEvrakKaynak.BaglantiEvrakTip := FTableEvrakKaynak.EvrakTip;
    FTableEvrakKaynak.BaglantiHesapKod := FTableEvrakKaynak.HesapKod;
    FTableEvrakKaynak.BaglantiEvrakNo := FTableEvrakKaynak.EvrakNo;
    FTableEvrakKaynak.BaglantiSiraNo := FTableEvrakKaynak.SiraNo;
  end;
  FTableEvrakKaynak.Post;
end;

constructor TAppRuleUretimBaglanti.Create(AOwner: TAppDataControllerUretim);
begin
  inherited Create;
  FUretim := AOwner;
  FTableUretimBaglanti := FUretim.FTableUretimBaglanti;
  FTableUretimBaglanti.DataEvents.AddRule(Self);
  if FUretim.FTableEvrakKaynak = nil then
    raise exception.Create('TAppRuleUretimBaglanti.Create: FUretim.FTableEvrakKaynak = nil');
  FTableEvrakKaynak := FUretim.FTableEvrakKaynak;
  FTableStokHareket := FUretim.FTableStokHareket;
  FTableUretimKart := FUretim.FTableUretimKart;
end;

destructor TAppRuleUretimBaglanti.Destroy;
begin

  inherited;
end;

procedure TAppRuleUretimBaglanti.DoAfterPost(Table: TAppCustomTable);
begin
  if not FTableStokHareket.Locate('MALKOD;EVRAKNO', VarArrayOf([FTableUretimKart.MamulKod, FTableUretimKart.EvrakNo]), []) then
    exit;
  AddEvrakKaynak;
end;

end.
