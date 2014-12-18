unit CPMApp_DAPCustomUretimKart;

interface

uses Classes, SysUtils, DB,
  CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_DataChildUretimKart, CPMApp_DataChildUretimRota,
  CPMApp_DataChildUretimRotaKaynak, CPMApp_DataChildUretimRotaKaynakIslem,
  CPMApp_DataChildUretimRotaKaynakOperasyon, CPMApp_DataChildUretimRotaKaynakDurus, CPMApp_DataChildUretimRotaKaynakHata,
  CPMApp_DataChildEvrakBaslik, CPMApp_DataChildEvrakKaynak, CPMApp_DataChildEvrakStokDurum,
  CPMApp_DataChildStokHareket, CPMApp_DataChildTeknikHareket, CPMApp_DataChildEvrakUretimHareket,
  CPMApp_DataChildEvrakSeriKart, CPMApp_DataChildUretimRotaKaynakNot,
  CPMApp_DataControllerUretimKart, CPMApp_DataControllerEvrakIslem;

type
  TAppDAPCustomUretimKart = class;

  TAppParamsUretimKart = class(TPersistent)
  private
    FEvrakTip: Integer;
    FDataApp: TAppDAPCustomUretimKart;
    FSeriNo2InKey: Boolean;
  public
    constructor Create(AOwner: TAppDAPCustomUretimKart);
  published
    property EvrakTip: Integer read FEvrakTip write FEvrakTip;
    property SeriNo2InKey: Boolean read FSeriNo2InKey write FSeriNo2InKey default True;
  end;

  TAppDataObjectKart = class(TAppDataObject)
  private
    FDataApp: TAppDAPCustomUretimKart;
  protected
    procedure DoOnCanSave(var CanSave: Boolean; var ErrorText: String); override;
  published
    property DataApp: TAppDAPCustomUretimKart read FDataApp;
  end;

  TAppDAPCustomUretimKart = class(TAppDataApp)
  private
    FParamsUretimKart: TAppParamsUretimKart;
    // Data Controllers
    FDataController2: TAppDataControllerEvrakIslem;
    FDataControllerUretimKart: TAppDataControllerUretimKart;
    // Data Childs
    FUretimKart: TAppDataChildUretimKart;
    FUretimRota: TAppDataChildUretimRota;
    FUretimRotaKaynak: TAppDataChildUretimRotaKaynak;
    FUretimRotaKaynakNot: TAppDataChildUretimRotaKaynakNot;
    FUretimRotaKaynakIslem: TAppDataChildUretimRotaKaynakIslem;
    FUretimRotaKaynakOperasyon: TAppDataChildUretimRotaKaynakOperasyon;
    FUretimRotaKaynakDurus: TAppDataChildUretimRotaKaynakDurus;
    FUretimRotaKaynakHata: TAppDataChildUretimRotaKaynakHata;
    FUretimSiparisHareket: TAppDataChildStokHareket;
    FUretimEvrakBaslik: TAppDataChildEvrakBaslik;
    FUretimStokHareket: TAppDataChildStokHareket;
    FUretimStokHareketTeknik: TAppDataChildTeknikHareket;
    FUretimStokHareketUretim: TAppDataChildEvrakUretimHareket;
    FUretimEvrakKaynak: TAppDataChildEvrakKaynak;
    FUretimSeriKart: TAppDataChildEvrakSeriKart;
    FStokDurum: TAppDataChildEvrakStokDurum;
    // Create Child Procedures
    procedure CreateDataControllerUretimKart;
    procedure CreateUretimKart;
    procedure CreateUretimRota;
    procedure CreateUretimRotaKaynak;
    procedure CreateUretimRotaKaynakNot;
    procedure CreateUretimRotaKaynakIslem;
    procedure CreateUretimRotaKaynakOperasyon;
    procedure CreateUretimRotaKaynakDurus;
    procedure CreateUretimRotaKaynakHata;
    procedure CreateUretimSiparisHareket;
    procedure CreateUretimEvrakBaslik;
    procedure CreateUretimStokHareket;
    procedure CreateUretimStokHareketTeknik;
    procedure CreateUretimStokHareketUretim;
    procedure CreateUretimEvrakKaynak;
    procedure CreateUretimSeriKart;
    procedure CreateStokDurum; virtual;
    // Procedures
    // Functions
  protected
    // Procedures
    procedure SetKeyFieldNames; override;
    procedure CreateDataChilds; override;
    procedure SetApplyUpdateTableList; override;
    procedure CreateDataControllerCommon; override;
    procedure SetDataController(Value: TAppDataControllerEvrakIslem);
    // Functions
    function GetDataController: TAppDataControllerEvrakIslem;
    function CreateDataObject: TAppDataObject; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ParamsUretimKart: TAppParamsUretimKart read FParamsUretimKart;

    // Data Controllers
    property DataController: TAppDataControllerEvrakIslem read GetDataController write SetDataController;
    property DataController2: TAppDataControllerEvrakIslem read FDataController2 write FDataController2;
    property DataControllerUretimKart: TAppDataControllerUretimKart read FDataControllerUretimKart;

    // Data Childs
    property UretimKart: TAppDataChildUretimKart read FUretimKart;
    property UretimRota: TAppDataChildUretimRota read FUretimRota;
    property UretimRotaKaynak: TAppDataChildUretimRotaKaynak read FUretimRotaKaynak;
    property UretimRotaKaynakNot: TAppDataChildUretimRotaKaynakNot read FUretimRotaKaynakNot;
    property UretimRotaKaynakIslem: TAppDataChildUretimRotaKaynakIslem read FUretimRotaKaynakIslem;
    property UretimRotaKaynakOperasyon: TAppDataChildUretimRotaKaynakOperasyon read FUretimRotaKaynakOperasyon;
    property UretimRotaKaynakDurus: TAppDataChildUretimRotaKaynakDurus read FUretimRotaKaynakDurus;
    property UretimRotaKaynakHata: TAppDataChildUretimRotaKaynakHata read FUretimRotaKaynakHata;

    property UretimSiparisHareket: TAppDataChildStokHareket read FUretimSiparisHareket;
    property UretimEvrakBaslik: TAppDataChildEvrakBaslik read FUretimEvrakBaslik;
    property UretimStokHareket: TAppDataChildStokHareket read FUretimStokHareket;
    property UretimStokHareketTeknik: TAppDataChildTeknikHareket read FUretimStokHareketTeknik;
    property UretimStokHareketUretim: TAppDataChildEvrakUretimHareket read FUretimStokHareketUretim;
    property UretimEvrakKaynak: TAppDataChildEvrakKaynak read FUretimEvrakKaynak;
    property UretimSeriKart: TAppDataChildEvrakSeriKart read FUretimSeriKart;

    property StokDurum: TAppDataChildEvrakStokDurum read FStokDurum;
  end;

implementation

uses Variants,
  CPMApp_Rule_FieldDefaultValue, CPMApp_Rule_FieldValidate,
  CPMApp_DocumentConsts, CPMApp_DocConsts, CPMApp_TableItems,
  CPMApp_DataOptionsKey;

{ TAppDataObjectKart }

procedure TAppDataObjectKart.DoOnCanSave(var CanSave: Boolean;
  var ErrorText: String);
begin
  inherited;
end;

{ TAppDAPCustomUretimKart }

constructor TAppDAPCustomUretimKart.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FParamsUretimKart := TAppParamsUretimKart.Create(Self);
end;

procedure TAppDAPCustomUretimKart.CreateUretimKart;
begin
  FUretimKart := TAppDataChildUretimKart.Create(Self);
  FUretimKart.Table.Name := 'TableUretimKart';
  
  FUretimKart.Table.TableItems.TableNames := VarArrayOf(['URTKRT', 'STKKRT', 'CARKRT']);
  FUretimKart.Table.TableItems.TableCaptions := VarArrayOf(['Üretim Kart', 'Stok Kart', 'Cari Kart']);

  with FUretimKart.Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
    end;
  end;
  // STKKRT
  with FUretimKart.Table.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALAD');
      Add('DOVIZCINS');
      Add('MALIYET1');
      Add('MALIYET2');
      Add('MALIYET3');
    end;
    with Join do
    begin
      Clear;
      Add('MALKOD', 'MAMULKOD');
    end;
  end;
  with FUretimKart.Table.TableItems[2] do
  begin
    with Fields do
    begin
      Clear;
      Add('UNVAN');
    end;
    with Join do
    begin
      Clear;
      Add('HESAPKOD', 'HESAPKOD');
    end;
  end;
  FUretimKart.Table.LookupTableItems.Add(FUretimKart.Table.TableItems[1]);
  FUretimKart.Table.LookupTableItems.Add(FUretimKart.Table.TableItems[2]);
  FUretimKart.EvrakTip := ParamsUretimKart.EvrakTip;

  FUretimKart.LoadFields('TableUretimKart');
end;

procedure TAppDAPCustomUretimKart.CreateUretimRota;
begin
  FUretimRota := TAppDataChildUretimRota.Create(Self);

  FUretimRota.Table.MasterItems.Add(FUretimKart.Table, 'SIRKETNO;EVRAKTIP;EVRAKNO');
  FUretimRota.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'URETIMNO;URETIMSIRANO;MAMULKOD;VERSIYONNO;MIKTAR';
  FUretimRota.Table.MasterItems[0].FetchFieldsRule.MasterFieldNames := 'URETIMNO;SIRANO;MAMULKOD;VERSIYONNO;MIKTAR';
  FUretimRota.Table.MasterItems[0].RangeRule.Enabled := False;
  FUretimRota.Table.IndexFieldNames := 'OPERASYONNO';
end;

procedure TAppDAPCustomUretimKart.CreateUretimRotaKaynak;
begin
  FUretimRotaKaynak := TAppDataChildUretimRotaKaynak.Create(Self);

  FUretimRotaKaynak.Table.MasterItems.Add(FUretimRota.Table, 'OPERASYONNO');
  FUretimRotaKaynak.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO;URETIMNO;URETIMSIRANO;MAMULKOD;VERSIYONNO';
  FUretimRotaKaynak.Table.IndexFieldNames := 'OPERASYONNO;KULLANIMSIRANO';
end;

procedure TAppDAPCustomUretimKart.CreateUretimRotaKaynakIslem;
begin
  FUretimRotaKaynakIslem := TAppDataChildUretimRotaKaynakIslem.Create(Self);

  FUretimRotaKaynakIslem.Table.MasterItems.Add(FUretimRotaKaynak.Table, 'OPERASYONNO;KAYNAKKOD');
  FUretimRotaKaynakIslem.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO;URETIMNO;URETIMSIRANO;MAMULKOD;VERSIYONNO;ISMERKEZKOD';
  FUretimRotaKaynakIslem.Table.IndexFieldNames := 'OPERASYONNO;KAYNAKKOD;ISLEMNO';
end;

procedure TAppDAPCustomUretimKart.CreateUretimRotaKaynakNot;
var
  xIslemNo: Integer;
begin
//  xIslemNo := FUretimRotaKaynakIslem.Table.IslemNo;
//  if (xIslemNo != 0)
  FUretimRotaKaynakNot := TAppDataChildUretimRotaKaynakNot.Create(Self);
  FUretimRotaKaynakNot.Table.MasterItems.Add(FUretimRotaKaynak.Table, 'OPERASYONNO;KAYNAKKOD');
  FUretimRotaKaynakNot.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO;URETIMNO;URETIMSIRANO;ISMERKEZKOD;MAMULKOD;VERSIYONNO';
  FUretimRotaKaynakNot.Table.IndexFieldNames := 'OPERASYONNO;KAYNAKKOD;SIRANO';
end;

procedure TAppDAPCustomUretimKart.CreateUretimRotaKaynakOperasyon;
begin
  FUretimRotaKaynakOperasyon := TAppDataChildUretimRotaKaynakOperasyon.Create(Self);

//  FUretimRotaKaynakOperasyon.Table.MasterItems.Add(FUretimRotaKaynakIslem.Table, 'ISLEMNO;KAYNAKKOD');
//  FUretimRotaKaynakOperasyon.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO;URETIMNO;URETIMSIRANO;MAMULKOD;VERSIYONNO;ISMERKEZKOD';
//  FUretimRotaKaynakOperasyon.Table.IndexFieldNames := 'OPERASYONNO;KAYNAKKOD;SIRANO';

  FUretimRotaKaynakOperasyon.Table.MasterItems.Add(FUretimRotaKaynak.Table, 'OPERASYONNO;KAYNAKKOD');
  FUretimRotaKaynakOperasyon.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO;URETIMNO;URETIMSIRANO;MAMULKOD;VERSIYONNO;ISMERKEZKOD';
  FUretimRotaKaynakOperasyon.Table.IndexFieldNames := 'OPERASYONNO;KAYNAKKOD;SIRANO';
end;


procedure TAppDAPCustomUretimKart.CreateUretimRotaKaynakDurus;
begin
  FUretimRotaKaynakDurus := TAppDataChildUretimRotaKaynakDurus.Create(Self);

  FUretimRotaKaynakDurus.Table.MasterItems.Add(FUretimRotaKaynakOperasyon.Table, 'OPERASYONNO;KAYNAKKOD;OPERASYONSIRANO', 'OPERASYONNO;KAYNAKKOD;SIRANO');
  FUretimRotaKaynakDurus.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO;URETIMNO;URETIMSIRANO;MAMULKOD;VERSIYONNO;ISMERKEZKOD;VARDIYAKOD';
  FUretimRotaKaynakDurus.Table.MasterItems[0].CopyFieldsRule.Add('OPERATORKOD', 'OPERATORKOD');
  FUretimRotaKaynakDurus.Table.IndexFieldNames := 'OPERASYONNO;KAYNAKKOD;OPERASYONSIRANO;SIRANO';
end;

procedure TAppDAPCustomUretimKart.CreateUretimRotaKaynakHata;
begin
  FUretimRotaKaynakHata := TAppDataChildUretimRotaKaynakHata.Create(Self);

  FUretimRotaKaynakHata.Table.MasterItems.Add(FUretimRotaKaynakOperasyon.Table, 'OPERASYONNO;KAYNAKKOD;OPERASYONSIRANO', 'OPERASYONNO;KAYNAKKOD;SIRANO');
  FUretimRotaKaynakHata.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO;URETIMNO;URETIMSIRANO;MAMULKOD;VERSIYONNO;ISMERKEZKOD;VARDIYAKOD';
  FUretimRotaKaynakHata.Table.MasterItems[0].CopyFieldsRule.Add('OPERATORKOD', 'OPERATORKOD');
  FUretimRotaKaynakHata.Table.IndexFieldNames := 'OPERASYONNO;KAYNAKKOD;OPERASYONSIRANO;SIRANO';
end;

procedure TAppDAPCustomUretimKart.CreateUretimSeriKart;
begin
  FUretimSeriKart := TAppDataChildEvrakSeriKart.Create(Self);
  FUretimSeriKart.ObjectName := 'UretimSeriKart';
  FUretimSeriKart.SeriNo2InKey := ParamsUretimKart.SeriNo2InKey;

  FUretimSeriKart.Table.OptionsKey.Enabled := False;
  FUretimSeriKart.Table.IndexFieldNames := 'MALKOD;SERINO;SERINO2';
end;

procedure TAppDAPCustomUretimKart.CreateUretimSiparisHareket;
begin
  FUretimSiparisHareket := TAppDataChildStokHareket.Create(Self);

  FUretimSiparisHareket.Params.IslemTip := shitSiparis;
  FUretimSiparisHareket.Params.GirisCikis := gctCikis;
  FUretimSiparisHareket.Params.TicaretDosyaTip := tdtUretim;

  FUretimSiparisHareket.Table.OptionsKey.Enabled := False;
  FUretimSiparisHareket.Table.IndexFieldNames := 'SIRANO';
end;

procedure TAppDAPCustomUretimKart.CreateUretimEvrakBaslik;
begin
  FUretimEvrakBaslik := TAppDataChildEvrakBaslik.Create(Self);

  FUretimEvrakBaslik.Params.EvrakTip := aetUretim;
  FUretimEvrakBaslik.Params.TicaretDosyaTip := tdtUretim;

  FUretimEvrakBaslik.Table.OptionsKey.Enabled := False;

  FUretimEvrakBaslik.LoadFields('TableUretimEvrakBaslik');

  // Alan Aktarýmý
  FUretimEvrakBaslik.FetchFields.Section := 'TableUretimEvrakBaslik';
  with FUretimEvrakBaslik.FetchFields.AddTableName('CARKRT', 'CARKRT', 'Cari Kart') do
  begin
    with TableCommand.TableItems[0].Where do
    begin
      Clear;
      AddField('HESAPKOD', wcEqual, FUretimEvrakBaslik.Table.TableItems[0], 'HESAPKOD');
    end;
    FieldJoinList.Add('HESAPKOD');
  end;
  with FUretimEvrakBaslik.FetchFields.AddTableName('TCRKRT', 'TCRKRT', 'Ticaret Kart') do
  begin
    with TableCommand.TableItems[0].Where do
    begin
      Clear;
      AddField('DOSYANO', wcEqual, FUretimEvrakBaslik.Table.TableItems[0], 'TICARETDOSYANO');
    end;
    FieldJoinList.Add('TICARETDOSYANO');
  end;
  with FUretimEvrakBaslik.FetchFields.AddTableName('PRJKRT', 'PRJKRT', 'Proje Kart') do
  begin
    with TableCommand.TableItems[0].Where do
    begin
      Clear;
      AddField('PROJEKOD', wcEqual, FUretimEvrakBaslik.Table.TableItems[0], 'PROJEKOD');
    end;
    FieldJoinList.Add('PROJEKOD');
  end;
  with FUretimEvrakBaslik.FetchFields.AddTableName('CARKRT', 'SVKKRT', 'Sevk Cari Kart') do
  begin
    with TableCommand.TableItems[0].Where do
    begin
      Clear;
      AddField('HESAPKOD', wcEqual, FUretimEvrakBaslik.Table.TableItems[0], 'SEVKHESAPKOD');
    end;
    FieldJoinList.Add('SEVKHESAPKOD');
  end;
  with FUretimEvrakBaslik.FetchFields.AddTableName('CARKRT', 'CRKKRS', 'Karþý Hesap Kart') do
  begin
    with TableCommand.TableItems[0].Where do
    begin
      Clear;
      AddField('HESAPKOD', wcEqual, FUretimEvrakBaslik.Table.TableItems[0], 'KARSIHESAPKOD');
    end;
    FieldJoinList.Add('KARSIHESAPKOD');
  end;
end;

procedure TAppDAPCustomUretimKart.CreateUretimStokHareket;
begin
  FUretimStokHareket := TAppDataChildStokHareket.Create(Self);

  FUretimStokHareket.Params.IslemTip := shitUretim;
  FUretimStokHareket.Params.GirisCikis := gctCikis;
  FUretimStokHareket.Params.TicaretDosyaTip := tdtUretim;

  FUretimStokHareket.Table.OptionsKey.Enabled := False;
  FUretimStokHareket.Table.MasterItems.Add(FUretimEvrakBaslik.Table, 'SIRKETNO;EVRAKTIP;EVRAKNO;HESAPKOD');
  FUretimStokHareket.Table.IndexFieldNames := 'SIRANO';
  FUretimStokHareket.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'KONSOLIDESIRKETNO;EVRAKNO2;EVRAKSEKLI;TESLIMSEKLI;ODEMESEKLI;EVRAKHAZIRLAYAN;TICARETDOSYATIP;TICARETDOSYANO;ODEMEPLAN';
  FUretimStokHareket.Table.MasterItems[0].FetchFieldsRule.MasterFieldNames := 'KONSOLIDESIRKETNO;EVRAKNO2;EVRAKSEKLI;TESLIMSEKLI;ODEMESEKLI;EVRAKHAZIRLAYAN;TICARETDOSYATIP;TICARETDOSYANO;ODEMEPLAN';
  FUretimStokHareket.Table.MasterItems[0].CopyFieldsRule.Add('PROJEKOD', 'PROJEKOD');
  FUretimStokHareket.Table.MasterItems[0].CopyFieldsRule.Add('SEVKHESAPKOD', 'SEVKHESAPKOD');
  FUretimStokHareket.Table.MasterItems[0].RangeRule.Enabled := False;

  FUretimStokHareket.FetchFields.Section := 'TableUretimStokHareket';
  FUretimStokHareket.FetchFields.AddTable(FUretimEvrakBaslik.Table, 'TableUretimEvrakBaslik', 'Üretim Evrak Baþlýk');

  with FUretimStokHareket.FetchFields.AddTableName('STKKRT', 'STKKRT', 'Stok Kart') do
  begin
    with TableCommand.TableItems[0].Where do
    begin
      Clear;
      AddField('MALKOD', wcEqual, FUretimStokHareket.Table.TableItems[0], 'MALKOD');
    end;
    FieldJoinList.Add('MALKOD');
  end;
  with FUretimStokHareket.FetchFields.AddTableName('CARKRT', 'CARKRT', 'Cari Kart') do
  begin
    with TableCommand.TableItems[0].Where do
    begin
      Clear;
      AddField('HESAPKOD', wcEqual, FUretimStokHareket.Table.TableItems[0], 'HESAPKOD');
    end;
    FieldJoinList.Add('HESAPKOD');
  end;
  with FUretimStokHareket.FetchFields.AddTableName('CARKRT', 'SVKKRT', 'Sevk Cari Kart') do
  begin
    with TableCommand.TableItems[0].Where do
    begin
      Clear;
      AddField('HESAPKOD', wcEqual, FUretimStokHareket.Table.TableItems[0], 'SEVKHESAPKOD');
    end;
    FieldJoinList.Add('SEVKHESAPKOD');
  end;
  with FUretimStokHareket.FetchFields.AddTableName('CARKRT', 'CRKKRS', 'Karþý Hesap Kart') do
  begin
    with TableCommand.TableItems[0].Where do
    begin
      Clear;
      AddField('HESAPKOD', wcEqual, FUretimStokHareket.Table.TableItems[0], 'KARSIHESAPKOD');
    end;
    FieldJoinList.Add('KARSIHESAPKOD');
  end;
end;

procedure TAppDAPCustomUretimKart.CreateUretimStokHareketTeknik;
begin
  FUretimStokHareketTeknik := TAppDataChildTeknikHareket.Create(Self);
  FUretimStokHareketTeknik.Table.OptionsKey.Enabled := False;
  FUretimStokHareketTeknik.Table.IndexFieldNames := 'SIRANO';
  FUretimStokHareketTeknik.TableStokHareket := UretimStokHareket.Table;
end;

procedure TAppDAPCustomUretimKart.CreateUretimStokHareketUretim;
begin
  FUretimStokHareketUretim := TAppDataChildEvrakUretimHareket.Create(Self);
  FUretimStokHareketUretim.Table.OptionsKey.Enabled := False;
  FUretimStokHareketUretim.Table.IndexFieldNames := 'SIRANO';
  FUretimStokHareketUretim.TableStokHareket := UretimStokHareket.Table;
end;

procedure TAppDAPCustomUretimKart.CreateUretimEvrakKaynak;
begin
  FUretimEvrakKaynak := TAppDataChildEvrakKaynak.Create(Self);

  FUretimEvrakKaynak.Table.OptionsKey.Enabled := False;
  FUretimEvrakKaynak.Table.MasterItems.Add(FUretimStokHareket.Table, 'SIRANO');
  FUretimEvrakKaynak.Table.IndexFieldNames := 'SIRANO';
  FUretimEvrakKaynak.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO;HESAPKOD';
  FUretimEvrakKaynak.TableStokHareket := UretimStokHareket.Table;
end;

procedure TAppDAPCustomUretimKart.CreateStokDurum;
begin
  FStokDurum := TAppDataChildEvrakStokDurum.Create(Self, FUretimStokHareket.Table);
  FStokDurum.dcStokDurum.SeriNo2InKey := ParamsUretimKart.SeriNo2InKey;
end;

procedure TAppDAPCustomUretimKart.CreateDataControllerCommon;
begin
  inherited;
  DataController := TAppDataControllerEvrakIslem.Create;
  DataController2 := TAppDataControllerEvrakIslem.Create;
end;

procedure TAppDAPCustomUretimKart.CreateDataControllerUretimKart;
begin
  FDataControllerUretimKart := TAppDataControllerUretimKart.Create(
    DataController,
    FUretimKart.Table, FUretimRota.Table, FUretimRotaKaynak.Table,
    FUretimRotaKaynakIslem.Table, FUretimRotaKaynakOperasyon.Table,
    FUretimSiparisHareket.Table,
    FUretimEvrakBaslik.Table,
    FUretimStokHareket.Table, FUretimStokHareketTeknik.Table, FUretimStokHareketUretim.Table,
    FUretimEvrakKaynak.Table, FUretimSeriKart.Table);
end;

procedure TAppDAPCustomUretimKart.CreateDataChilds;
var
  AStr: String;
begin
  inherited;
  // Begin Uygulama Params
  AStr := 'SELECT DEGER FROM PRMAPP WHERE KAYITDURUM = 1 AND UYGULAMA=%s AND GRUP=%s AND BOLUM=%s AND PARAMETRE=%s AND SIRANO = 0';
  AStr := Format(AStr, [QuotedStr('SERIKART'), QuotedStr(''), QuotedStr('KEY'), QuotedStr('SERINO2')]);
  TableCommand.OpenCommandText(AStr);
  if not TableCommand.IsEmpty then
    ParamsUretimKart.SeriNo2InKey := TableCommand.FieldByName('DEGER').AsString <> '0';
  // End Uygulama Params

  // Create Data Childs
  CreateUretimKart;
  CreateUretimRota;
  CreateUretimRotaKaynak;
  CreateUretimRotaKaynakIslem;
  CreateUretimRotaKaynakNot;
  CreateUretimRotaKaynakOperasyon;
  CreateUretimRotaKaynakDurus;
  CreateUretimRotaKaynakHata;
  CreateUretimSiparisHareket;
  CreateUretimEvrakBaslik;
  CreateUretimStokHareket;
  CreateUretimStokHareketTeknik;
  CreateUretimStokHareketUretim;
  CreateUretimEvrakKaynak;
  CreateUretimSeriKart;
  CreateStokDurum;

  // Create Data Controllers
  CreateDataControllerUretimKart;

  DataController.Controllers.CreateStokHareket(FUretimSiparisHareket.Table, nil, 'STKHAR');
  DataController.Controllers.StokHareket.Definition.AddStokKart;
  with FUretimSiparisHareket.Table.TableItems.Name['STKKRT'].Fields do
  begin
    Add('SARFYONTEM');
    Add('MEKANIKSARFYONTEM');
    Add('ALIMPARTIBUYUKLUK');
  end;

  with FUretimSiparisHareket.Table.TableItems.Name['STHURT'].Fields do
  begin
    Add('OPDURUM');
    Add('SONOPDURUM');
  end;
  FUretimSiparisHareket.LoadFields('TableUretimSiparisHareket');

  DataController2.Controllers.CreateStokHareket(FUretimStokHareket.Table, FUretimEvrakBaslik.Table, 'STKHAR');
  DataController2.Controllers.StokHareket.Definition.AddStokKart;
  DataController2.Controllers.CreateSeriNo(FUretimStokHareket.Table, FUretimSeriKart.Table, FUretimSeriKart.TableUpdate);
  DataController2.Controllers.SeriNo.SeriNo2InKey := ParamsUretimKart.SeriNo2InKey;
  FUretimStokHareket.LoadFields('TableUretimStokHareket');
end;

function TAppDAPCustomUretimKart.CreateDataObject: TAppDataObject;
begin
  Result := TAppDataObjectKart.Create(Self);
  TAppDataObjectKart(Result).FDataApp := Self;
end;

destructor TAppDAPCustomUretimKart.Destroy;
begin
  FreeAndNil(FParamsUretimKart);
  FreeAndNil(FDataController2);
  FreeAndNil(FDataControllerUretimKart);
  inherited;
end;

function TAppDAPCustomUretimKart.GetDataController: TAppDataControllerEvrakIslem;
begin
  Result := TAppDataControllerEvrakIslem(inherited GetDataController);
end;

procedure TAppDAPCustomUretimKart.SetApplyUpdateTableList;
begin
  inherited;
  DataObject.OptionsSave.UseDefaultList := false;

  with DataObject.OptionsSave.SaveTableList do
  begin
    Clear;
    Add(FUretimRotaKaynakHata.Table, False, False, True);
    Add(FUretimRotaKaynakDurus.Table, False, False, True);
    Add(FUretimRotaKaynakOperasyon.Table, False, False, True);
    Add(FUretimRotaKaynakIslem.Table, False, False, True);
    Add(FUretimRotaKaynakNot.Table, False, False, True);
    Add(FUretimRotaKaynak.Table, False, False, True);
    Add(FUretimRota.Table, False, False, True);

    //Add(FUretimSiparisHareket.Table, False, True, True); // 09.09.2014

    Add(FUretimKart.Table);
    Add(FUretimRota.Table, True, True, False);
    Add(FUretimRotaKaynak.Table, True, True, False);
    Add(FUretimRotaKaynakNot.Table, True, True, False);
    Add(FUretimRotaKaynakIslem.Table, True, True, False);
    Add(FUretimRotaKaynakOperasyon.Table, True, True, False);
    Add(FUretimRotaKaynakHata.Table, True, True, False);
    Add(FUretimRotaKaynakDurus.Table, True, True, False);

    Add(UretimEvrakBaslik.Table);
    Add(UretimStokHareket.Table, False, False, True); // STKHAR ve trigger vasýtasý ile SHRKYN ve SERKRT otomatik silinir
    Add(UretimEvrakKaynak.Table, True, True, False); // Delete göndermeye gerek yok STKHAR triggerý otomatik siliyor
    Add(UretimSeriKart.TableUpdate, True, True, False); // Delete göndermeye gerek yok STKHAR triggerý otomatik siliyor
    Add(UretimStokHareket.Table, True, True, False);
    Add(UretimStokHareketTeknik.Table);
    Add(UretimStokHareketUretim.Table);
  end;

  with DataObject.OptionsSave.DeleteTableList do
  begin
    Clear;
    Add(UretimStokHareketTeknik.Table);
    Add(UretimStokHareketUretim.Table);
    Add(UretimStokHareket.Table);
    // Add(UretimEvrakKaynak.Table); STKHAR Triggerý otomatik siliyor
    // Add(UretimSeriKart.TableUpdate); STKHAR Triggerý otomatik siliyor
    Add(UretimEvrakBaslik.Table);

    Add(FUretimRotaKaynakHata.Table);
    Add(FUretimRotaKaynakDurus.Table);
    Add(FUretimRotaKaynakOperasyon.Table);
    Add(FUretimRotaKaynakIslem.Table);
    Add(FUretimRotaKaynakNot.Table);
    Add(FUretimRotaKaynak.Table);
    Add(FUretimRota.Table);
    Add(FUretimKart.Table);
  end;
end;

procedure TAppDAPCustomUretimKart.SetDataController(
  Value: TAppDataControllerEvrakIslem);
begin
  inherited SetDataController(Value);
end;

procedure TAppDAPCustomUretimKart.SetKeyFieldNames;
begin
  inherited;
  with DataObject.OptionsKey do
  begin
    Names := 'SIRKETNO;EVRAKTIP;EVRAKNO';
    KeyType := ktOnlyModuleKey;
    UniqueKeys.Add('SIRKETNO;EVRAKTIP;EVRAKNO').MainKeyFieldName := 'EVRAKNO';
  end;
  with DataObject.OptionsMove do
  begin
    FieldNames := 'EVRAKNO';
    Where := Format('SIRKETNO = ''%s'' AND EVRAKTIP = %d', [CompanyNo, 54]);
    OrderByFieldNames := 'EVRAKNO';
  end;
end;

{ TAppParamsUretimKart }

constructor TAppParamsUretimKart.Create(AOwner: TAppDAPCustomUretimKart);
begin
  inherited Create;
  FDataApp := AOwner;
  FSeriNo2InKey := True;
end;

end.
