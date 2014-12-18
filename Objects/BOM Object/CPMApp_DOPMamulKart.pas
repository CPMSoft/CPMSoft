unit CPMApp_DOPMamulKart;

interface

uses Windows, Classes, SysUtils, Controls, Variants, Graphics, Dialogs, DB,
  cxEdit, cxMaskEdit, cxCheckBox, cxCalc, cxCurrencyEdit,
  cxImageComboBox, cxCalendar, cxImage, cxMRUEdit, cxDBExtLookupComboBox,
  dxBar, dxBarExtItems, cxDBTL, cxTL, cxTLData, cxGraphics,
  CPMApp_TableItems,
  CPMApp_Storage,
  CPMApp_Filter,
  CPMApp_DataObject,
  CPMApp_DataObjectDB,
  CPMApp_DataObjectModel,
  CPMApp_DocObjectModel,
  CPMApp_DocApp,
  CPMApp_DocChildGrid,
  CPMApp_DocChildVGrid,
  CPMApp_DocChildMultiVGrid,
  CPMApp_DocChildSearchTable,
  CPMApp_DocChildMasterDetail,
  CPMApp_DocChildTreeList,
  CPMApp_DocChildGridNote,
  CPMApp_DOPCustomMamulKart;

type
  TAppDOPMamulKart = class(TAppDOPCustomMamulKart)
  private
    // Params
    FOpenMamulAgac_Tarih: TDateTime;
    FOpenMamulAgac_Miktar: Double;
    FOpenMamulAgac_SingleLevel: Smallint;
    FOpenMamulAgac_ReturnPhantom: Smallint;
    FOpenMamulAgac_ReturnRoute: Smallint;
    FOpenMamulAgac_ReturnProcess: Smallint;
    FOpenMamulAgac_CalcScrap: Smallint;
    FOpenMamulAgac_Round: Smallint;
    FOpenMamulAgac_KullanimGrupNo: Smallint;
    FOpenMamulAgac_MaliyetTip: Smallint;
    FOpenMamulAgac_DefterTip: Smallint;
    FOpenMamulAgac_MaliyetKirilimVersiyonNo: Smallint;
    FOpenMamulAgac_MYBasTarih: TDateTime;
    FOpenMamulAgac_FiyatSablonNo: Smallint;
    FOpenMamulAgac_FiyatSekli: String;
    FOpenMamulAgac_Banka: Smallint;
    FOpenMamulAgac_DovizTip: Smallint;
    FOpenMamulAgac_DovizTarih: TDateTime;
    FOpenMamulAgac_YeniFiyatKaydet: Smallint;
    FOpenMamulAgac_YeniFiyatSablonNo: Smallint;
    FOpenMamulAgac_YeniFiyatSekli: String;
    FOpenMamulAgac_TopluIslem: Smallint;
    FOpenMamulAgac_StokKart_LastFilterName: string;
    FOpenMamulAgac_StokKart_LastFilterUserName: string;
    FOpenMamulAgac_StokKart_FilterText: string;
    FCopyMamulKart_MamulKart: Smallint;
    FCopyMamulKart_MamulRota: Smallint;
    FCopyMamulKart_MamulNot: Smallint;
    // Objects
    AppFilter: TAppFilter;
    TableItems: TAppCustomTableItems;
    btAddKaynakFromKaynakKurulum: TdxBarButton;
    // Childs
    FChildMamulBaslik: TAppDocChildMultiVGrid;
    FChildMamulRevizyon: TAppDocChildGrid;
    FChildMamulKart: TAppDocChildGrid;
    FChildMamulKartDetay: TAppDocChildMultiVGrid;
    FChildMamulYanUrun: TAppDocChildGrid;
    FChildMamulRota: TAppDocChildGrid;
    FChildMamulRotaSonrakiOperasyon: TAppDocChildGrid;
    FChildMamulRotaKaynak: TAppDocChildGrid;
    FChildFMEAFormBaslik: TAppDocChildGrid;
    FChildFMEAFormRevizyon: TAppDocChildGrid;
    FChildFMEAFormDetay: TAppDocChildGrid;
    FChildMamulKartAjan: TAppDocChildMasterDetail;
    FChildMamulRotaAjan: TAppDocChildMasterDetail;
    FChildMamulStokKart: TAppDocChildVGrid;
    FChildHammaddeAjan: TAppDocChildSearchTable;
    FChildHammaddeStokKart: TAppDocChildVGrid;
    FChildMamulAgac: TAppDocChildTreeList;
    FChildKullanimAgac: TAppDocChildTreeList;
    FChildMaliyetList: TAppDocChildGrid;
    FChildMamulNot: TAppDocChildGridNote;
    // Advanced
    FKaynakDOPMamulKart: TAppDOPCustomMamulKart;
    // Click Events
    FOldChildMamulKartAjanOnKeyDown: TKeyEvent;
    FOldChildMamulRotaAjanOnKeyDown: TKeyEvent;
    FOldChildHammaddeAjanOnKeyDown: TKeyEvent;
    FOldChildMaliyetListOnKeyDown: TKeyEvent;
    FChildMamulKartData: TAppDocChildSearchTable;
    FColumnTip: TcxDBTreeListColumn;
    procedure ChildMamulKartAjanOnDblClick(Sender: TObject);
    procedure ChildMamulKartAjanOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ChildMamulRotaAjanOnDblClick(Sender: TObject);
    procedure ChildMamulRotaAjanOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ChildHammaddeAjanOnDblClick(Sender: TObject);
    procedure ChildHammaddeAjanOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ChildMaliyetListOnDblClick(Sender: TObject);
    procedure ChildMaliyetListOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ChildMamulAgacOnCustomDrawDataCell(Sender: TcxCustomTreeList; ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure ChildMamulKartDataOnDblClick(Sender: TObject);
    procedure IncReceteNoOnClick(Sender: TObject);
    // Menu Items Click
    procedure OpenMamulAgacClick(Sender: TObject);
    procedure OpenMamulAgacAllClick(Sender: TObject);
    procedure OpenKullanimAgacClick(Sender: TObject);
    procedure OpenMaliyetListForUretClick(Sender: TObject);
    procedure OpenMaliyetListForZeroClick(Sender: TObject);
    procedure CopyMamulKartClick(Sender: TObject);
    procedure AddKaynakFromKaynakKurulumClick(Sender: TObject);
    procedure DefineFilterStokKartOnClick(Sender: TObject);
    procedure ShowAlanSecimForMamulBaslikClick(Sender: TObject);
    procedure ShowAlanSecimForMamulKartClick(Sender: TObject);
    procedure ShowAlanSecimForMamulAgacClick(Sender: TObject);
    procedure ShowAlanSecimForKullanimAgacClick(Sender: TObject);
    procedure ShowAlanSecimForMaliyetListClick(Sender: TObject);
    procedure ShowAlanAktarimForMamulBaslikClick(Sender: TObject);
    procedure ShowAlanAktarimForMamulKartClick(Sender: TObject);
    procedure BOMTreeMamulKartAlanAktarimClick(Sender: TObject);
    // Advanced
    procedure CopyMamulKart;
    procedure CopyMamulRota;
    procedure CopyMamulNot;
    procedure CallCopyMamulKartClick(Sender: TObject);
    procedure CallCopyMamulRotaClick(Sender: TObject);
    procedure CallCopyMamulAllClick(Sender: TObject);
    // Create Childs;
    procedure CreateChildMamulBaslik;
    procedure CreateChildMamulRevizyon;
    procedure CreateChildMamulKart;
    procedure CreateChildMamulKartDetay;
    procedure CreateChildMamulYanUrun;
    procedure CreateChildMamulRota;
    procedure CreateChildMamulRotaSonrakiOperasyon;
    procedure CreateChildMamulRotaKaynak;
    procedure CreateChildFMEAFormBaslik;
    procedure CreateChildFMEAFormRevizyon;
    procedure CreateChildFMEAFormDetay;
    procedure CreateChildMamulNot;
    procedure CreateChildMamulStokKart;
    procedure CreateChildHammaddeStokKart;
    procedure CreateChildMamulAgac;
    procedure CreateChildKullanimAgac;
    procedure CreateChildMaliyetList;
    procedure CreateChildMamulKartAjan;
    procedure CreateChildMamulRotaAjan;
    procedure CreateChildHammaddeAjan;
    procedure CreateChildMamulKartData;
    procedure Kaynak_OnCanSave(var CanSave: Boolean;
      var ErrorText: String);
    function OpenDataObject(SirketNo, ReceteNo: String; const MamulKod: String = ''; const VersiyonNo: String = ''; const SurumNo: Integer = 0): Boolean;
    function OpenMamulAgac_GetParams(Gosterim: String): Boolean;
    procedure OpenMamulAgac;
    procedure Show_StokKart_AdvKriter(EnableSave: Boolean);
    procedure CreateObjects;
    procedure FreeObjects;
    // Procededure
  protected
    procedure CreateDocChilds; override;
    procedure CreateMenuItems; override;
    procedure SetDAPSecurity; override;
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure Finalize(IniFile: TAppIniFile); override;
    procedure SetReport; override;
    procedure DoAfterActive; override;
  public
    constructor Create(AOwner: TComponent; const aApplicationName: String); override;
    destructor Destroy; override;
    procedure TranslationChanged; override;
  published
    property ChildMamulBaslik: TAppDocChildMultiVGrid read FChildMamulBaslik;
    property ChildMamulRevizyon: TAppDocChildGrid read FChildMamulRevizyon;
    property ChildMamulKart: TAppDocChildGrid read FChildMamulKart;
    property ChildMamulKartDetay: TAppDocChildMultiVGrid read FChildMamulKartDetay;
    property ChildMamulYanUrun: TAppDocChildGrid read FChildMamulYanUrun;
    property ChildMamulRota: TAppDocChildGrid read FChildMamulRota;
    property ChildMamulRotaSonrakiOperasyon: TAppDocChildGrid read FChildMamulRotaSonrakiOperasyon;
    property ChildMamulRotaKaynak: TAppDocChildGrid read FChildMamulRotaKaynak;
    property ChildFMEAFormBaslik: TAppDocChildGrid read FChildFMEAFormBaslik;
    property ChildFMEAFormRevizyon: TAppDocChildGrid read FChildFMEAFormRevizyon;
    property ChildFMEAFormDetay: TAppDocChildGrid read FChildFMEAFormDetay;
    property ChildMamulNot: TAppDocChildGridNote read FChildMamulNot;
    property ChildMamulStokKart: TAppDocChildVGrid read FChildMamulStokKart;
    property ChildHammaddeStokKart: TAppDocChildVGrid read FChildHammaddeStokKart;
    property ChildMamulAgac: TAppDocChildTreeList read FChildMamulAgac;
    property ChildKullanimAgac: TAppDocChildTreeList read FChildKullanimAgac;
    property ChildMaliyetList: TAppDocChildGrid read FChildMaliyetList;
    property ChildMamulKartAjan: TAppDocChildMasterDetail read FChildMamulKartAjan;
    property ChildMamulRotaAjan: TAppDocChildMasterDetail read FChildMamulRotaAjan;
    property ChildHammaddeAjan: TAppDocChildSearchTable read FChildHammaddeAjan;
    property ChildMamulKartData: TAppDocChildSearchTable read FChildMamulKartData;
  end;

implementation

uses
  CPMApp_Dialogs, CPMApp_BarHelper,
  CPMApp_FieldProp, CPMApp_TreeHelper,
  CPMApp_BOMConsts, CPMApp_BOMStrs, CPMApp_BOMCall,
  CPMApp_StrUtils,
  CPMApp_TableBOMSystem, CPMApp_DataControllerBOMTree,
  CPMApp_DAPCustomMamulKart, CPMApp_DataChildMamulAgac;

{ TAppDOPMamulKart }

constructor TAppDOPMamulKart.Create(AOwner: TComponent;
  const aApplicationName: String);
begin
  inherited;
  CreateObjects;
end;

destructor TAppDOPMamulKart.Destroy;
begin
  FreeObjects;
  inherited;
end;

procedure TAppDOPMamulKart.DoAfterActive;
begin
  inherited;
  FColumnTip := AppTreeHelper.FindColumn(ChildMamulAgac.TreeList, 'TIP');
  if FColumnTip <> nil then
    ChildMamulAgac.TreeList.OnCustomDrawDataCell := ChildMamulAgacOnCustomDrawDataCell;
end;

procedure TAppDOPMamulKart.CreateObjects;
begin
  TableItems := TAppCustomTableItems.Create;

  AppFilter := TAppFilter.Create;
  AppFilter.Connection := Connection;
  AppFilter.AppName := AppName;
  AppFilter.UserName := UserName;
  AppFilter.TableItems := TableItems;
end;

procedure TAppDOPMamulKart.FreeObjects;
begin
  FreeAndNil(AppFilter);
  FreeAndNil(TableItems);
end;

procedure TAppDOPMamulKart.CreateMenuItems;
var
  suAyarlar, suVeriIslem, suAraclar: TdxBarSubItem;
begin
  inherited;
  // Ayarlar
  suAyarlar := TdxBarSubItem(DocObject.DocBar.BarManager.GetItemByName('suAyarlar'));
  btAddKaynakFromKaynakKurulum := DocObject.CreateButton('btAddKaynakFromKaynakKurulum', 'Kaynaklarý Kaynak Kurulum Tablosundan Al', 'Ayarlar', '', AddKaynakFromKaynakKurulumClick);
  btAddKaynakFromKaynakKurulum.ButtonStyle := bsChecked;
  DocObject.DocBar.CreateButton('btDefineFilterStokKart', 'Stok Kart Kriter Tanýmlarý', 'Ayarlar', suAyarlar, '', DefineFilterStokKartOnClick);
  DocObject.DocBar.CreateButton('btShowAlanSecimForMamulBaslik', 'Mamül Baþlýk Alan Seçimi', 'Ayarlar', suAyarlar, '', ShowAlanSecimForMamulBaslikClick);
  DocObject.DocBar.CreateButton('btShowAlanSecimForMamulKart', 'Mamül Kart Alan Seçimi', 'Ayarlar', suAyarlar, '', ShowAlanSecimForMamulKartClick);
  DocObject.DocBar.CreateButton('btShowAlanSecimForMamulAgac', 'Mamül Aðacý Alan Seçimi', 'Ayarlar', suAyarlar, '', ShowAlanSecimForMamulAgacClick);
  DocObject.DocBar.CreateButton('btShowAlanSecimForKullanimAgac', 'Kullaným Aðacý Alan Seçimi', 'Ayarlar', suAyarlar, '', ShowAlanSecimForKullanimAgacClick);
  DocObject.DocBar.CreateButton('btShowAlanSecimForMaliyetList', 'Maliyet Listesi Alan Seçimi', 'Ayarlar', suAyarlar, '', ShowAlanSecimForMaliyetListClick);
  DocObject.DocBar.CreateButton('btShowAlanAktarimForMamulBaslik', 'Mamül Baþlýk Alan Aktarýmý', 'Ayarlar', suAyarlar, '', ShowAlanAktarimForMamulBaslikClick);
  DocObject.DocBar.CreateButton('btShowAlanAktarimForMamulKart', 'Mamül Kart Alan Aktarýmý', 'Ayarlar', suAyarlar, '', ShowAlanAktarimForMamulKartClick);
  DocObject.DocBar.CreateButton('btIncReceteNo', 'Reçete No Ayarlarý', 'Ayarlar', suAyarlar, '', IncReceteNoOnClick);
  DocObject.DocBar.CreateButton('btBOMTreeMatchFields', 'Mamül Aðacý Mamül Kart Alan Aktarýmý', 'Ayarlar', suAyarlar, '', BOMTreeMamulKartAlanAktarimClick);

  // Veri Ýþlemleri
  suVeriIslem := TdxBarSubItem(DocObject.DocBar.BarManager.GetItemByName('suVeriIslem'));
  DocObject.DocBar.CreateButton('btOpenMamulAgac', 'Mamül Aðacýný Göster', 'Veri Ýþlemleri', suVeriIslem, 'Alt+M', OpenMamulAgacClick);
  DocObject.DocBar.CreateButton('btOpenMamulAgacAll', 'Mamül Aðaçlarýný Göster', 'Veri Ýþlemleri', suVeriIslem, '', OpenMamulAgacAllClick);
  DocObject.DocBar.CreateButton('btOpenKullanimAgac', 'Kullaným Aðacýný Göster', 'Veri Ýþlemleri', suVeriIslem, 'Alt+K', OpenKullanimAgacClick);
  DocObject.DocBar.CreateButton('btOpenMaliyetListForUret', 'Maliyet Listesi', 'Veri Ýþlemleri', suVeriIslem, '', OpenMaliyetListForUretClick);
  DocObject.DocBar.CreateButton('btOpenMaliyetListForZero', 'Maliyet Listesi (Sýfýr Maliyet Hesaplananlar)', 'Veri Ýþlemleri', suVeriIslem, '', OpenMaliyetListForZeroClick);

  // Araçlar
  suAraclar := TdxBarSubItem(DocObject.DocBar.BarManager.GetItemByName('suAraclar'));
  DocObject.DocBar.CreateButton('btCopyMamulKart', 'Mamül Kopyala', 'Araçlar', suAraclar, '', CopyMamulKartClick);
end;

procedure TAppDOPMamulKart.Initialize(IniFile: TAppIniFile);
begin
  inherited;
  btAddKaynakFromKaynakKurulum.Down := IniFile.ReadBool('DocumentOptions', 'AddKaynakFromKaynakKurulum', false);
  DataApp.MamulParams.AddKaynakFromKaynakKurulum := btAddKaynakFromKaynakKurulum.Down;

  FOpenMamulAgac_Tarih := Date;
  FOpenMamulAgac_Miktar := 1;
  FOpenMamulAgac_SingleLevel := IniFile.ReadInteger('OpenMamulAgac', 'SingleLevel', 0);
  FOpenMamulAgac_ReturnPhantom := IniFile.ReadInteger('OpenMamulAgac', 'ReturnPhantom', 0);
  FOpenMamulAgac_ReturnRoute := IniFile.ReadInteger('OpenMamulAgac', 'ReturnRoute', 0);
  FOpenMamulAgac_ReturnProcess := IniFile.ReadInteger('OpenMamulAgac', 'ReturnProcess', 0);
  FOpenMamulAgac_CalcScrap := IniFile.ReadInteger('OpenMamulAgac', 'CalcScrap', 0);
  FOpenMamulAgac_Round := IniFile.ReadInteger('OpenMamulAgac', 'Round', 0);
  FOpenMamulAgac_KullanimGrupNo := IniFile.ReadInteger('OpenMamulAgac', 'KullanimGrupNo', 1);
  FOpenMamulAgac_MaliyetTip := IniFile.ReadInteger('OpenMamulAgac', 'MaliyetTip', 0);
  FOpenMamulAgac_DefterTip := IniFile.ReadInteger('OpenMamulAgac', 'DefterTip', 0);
  FOpenMamulAgac_MaliyetKirilimVersiyonNo := IniFile.ReadInteger('OpenMamulAgac', 'MaliyetKirilimVersiyonNo', 1);
  FOpenMamulAgac_MYBasTarih := IniFile.ReadInteger('OpenMamulAgac', 'MYBasTarih', 2);
  FOpenMamulAgac_FiyatSablonNo := IniFile.ReadInteger('OpenMamulAgac', 'FiyatSablonNo', 0);
  FOpenMamulAgac_FiyatSekli := IniFile.ReadString('OpenMamulAgac', 'FiyatSekli', '');
  FOpenMamulAgac_Banka := IniFile.ReadInteger('OpenMamulAgac', 'Banka', 0);
  FOpenMamulAgac_DovizTip := IniFile.ReadInteger('OpenMamulAgac', 'DovizTip', 0);
  FOpenMamulAgac_DovizTarih := Date;
  FOpenMamulAgac_YeniFiyatKaydet := IniFile.ReadInteger('OpenMamulAgac', 'YeniFiyatKaydet', 0);
  FOpenMamulAgac_YeniFiyatSablonNo := IniFile.ReadInteger('OpenMamulAgac', 'YeniFiyatSablonNo', 0);
  FOpenMamulAgac_YeniFiyatSekli := IniFile.ReadString('OpenMamulAgac', 'YeniFiyatSekli', '');
  FOpenMamulAgac_TopluIslem := IniFile.ReadInteger('OpenMamulAgac', 'TopluIslem', 0);
  FOpenMamulAgac_StokKart_LastFilterName := IniFile.ReadString('OpenMamulAgac', 'StokKart_LastFilterName', '');
  FOpenMamulAgac_StokKart_LastFilterUserName := IniFile.ReadString('OpenMamulAgac', 'StokKart_LastFilterUserName', '');

  FCopyMamulKart_MamulKart := IniFile.ReadInteger('CopyMamulKart', 'MamulKart', 1);
  FCopyMamulKart_MamulRota := IniFile.ReadInteger('CopyMamulKart', 'MamulRota', 1);
  FCopyMamulKart_MamulNot := IniFile.ReadInteger('CopyMamulKart', 'MamulNot', 1);
end;

procedure TAppDOPMamulKart.Finalize(IniFile: TAppIniFile);
begin
  inherited;
  IniFile.WriteBool('DocumentOptions', 'AddKaynakFromKaynakKurulum', btAddKaynakFromKaynakKurulum.Down);

  IniFile.WriteInteger('OpenMamulAgac', 'SingleLevel', FOpenMamulAgac_SingleLevel);
  IniFile.WriteInteger('OpenMamulAgac', 'ReturnPhantom', FOpenMamulAgac_ReturnPhantom);
  IniFile.WriteInteger('OpenMamulAgac', 'ReturnRoute', FOpenMamulAgac_ReturnRoute);
  IniFile.WriteInteger('OpenMamulAgac', 'ReturnProcess', FOpenMamulAgac_ReturnProcess);
  IniFile.WriteInteger('OpenMamulAgac', 'CalcScrap', FOpenMamulAgac_CalcScrap);
  IniFile.WriteInteger('OpenMamulAgac', 'Round', FOpenMamulAgac_Round);
  IniFile.WriteInteger('OpenMamulAgac', 'KullanimGrupNo', FOpenMamulAgac_KullanimGrupNo);
  IniFile.WriteInteger('OpenMamulAgac', 'MaliyetTip', FOpenMamulAgac_MaliyetTip);
  IniFile.WriteInteger('OpenMamulAgac', 'DefterTip', FOpenMamulAgac_DefterTip);
  IniFile.WriteInteger('OpenMamulAgac', 'MaliyetKirilimVersiyonNo', FOpenMamulAgac_MaliyetKirilimVersiyonNo);
  IniFile.WriteInteger('OpenMamulAgac', 'MYBasTarih', Trunc(FOpenMamulAgac_MYBasTarih));
  IniFile.WriteInteger('OpenMamulAgac', 'FiyatSablonNo', FOpenMamulAgac_FiyatSablonNo);
  IniFile.WriteString('OpenMamulAgac', 'FiyatSekli', FOpenMamulAgac_FiyatSekli);
  IniFile.WriteInteger('OpenMamulAgac', 'Banka', FOpenMamulAgac_Banka);
  IniFile.WriteInteger('OpenMamulAgac', 'DovizTip', FOpenMamulAgac_DovizTip);
  IniFile.WriteInteger('OpenMamulAgac', 'YeniFiyatKaydet', FOpenMamulAgac_YeniFiyatKaydet);
  IniFile.WriteInteger('OpenMamulAgac', 'YeniFiyatSablonNo', FOpenMamulAgac_YeniFiyatSablonNo);
  IniFile.WriteString('OpenMamulAgac', 'YeniFiyatSekli', FOpenMamulAgac_YeniFiyatSekli);
  IniFile.WriteInteger('OpenMamulAgac', 'TopluIslem', FOpenMamulAgac_TopluIslem);
  IniFile.WriteString('OpenMamulAgac', 'StokKart_LastFilterName', FOpenMamulAgac_StokKart_LastFilterName);
  IniFile.WriteString('OpenMamulAgac', 'StokKart_LastFilterUserName', FOpenMamulAgac_StokKart_LastFilterUserName);

  IniFile.WriteInteger('CopyMamulKart', 'MamulKart', FCopyMamulKart_MamulKart);
  IniFile.WriteInteger('CopyMamulKart', 'MamulRota', FCopyMamulKart_MamulRota);
  IniFile.WriteInteger('CopyMamulKart', 'MamulNot', FCopyMamulKart_MamulNot);
end;

procedure TAppDOPMamulKart.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.MamulBaslik.Table, 'MAMBAS', 'Mamül Baþlýk');
  Security.AddTable(DataApp.MamulRevizyon.Table, 'MAMREV', 'Mamül Revizyon');
  Security.AddTable(DataApp.MamulKart.Table, 'MAMKRT', 'Mamül Kart');
  Security.AddTable(DataApp.MamulYanUrun.Table, 'MAMYAN', 'Mamül Yan Ürün');
  Security.AddTable(DataApp.MamulRota.Table, 'MAMROT', 'Mamül Rota');
  Security.AddTable(DataApp.MamulRotaSonrakiOperasyon.Table, 'MAMROP', 'Rota Sonraki Operasyon');
  Security.AddTable(DataApp.MamulRotaKaynak.Table, 'MAMKYN', 'Rota Kaynak');
  Security.AddTable(DataApp.FMEAFormBaslik.Table, 'FMEAHD', 'FMEA Form Baþlýk');
  Security.AddTable(DataApp.FMEAFormRevizyon.Table, 'FMEARV', 'FMEA Form Revizyon');
  Security.AddTable(DataApp.FMEAFormDetay.Table, 'FMEADT', 'FMEA Form Detay');
  if Assigned(FChildMamulKartData) then
    Security.AddTable(FChildMamulKartData.Table, 'MAMKRT', 'Hýzlý Mamül Kart');
end;

procedure TAppDOPMamulKart.SetReport;
begin
  inherited;
  DocObject.Report.MainTable := DataApp.MamulKart.Table;
end;

procedure TAppDOPMamulKart.CreateDocChilds;
begin
  inherited;
  CreateChildMamulBaslik;
  CreateChildMamulRevizyon;
  CreateChildMamulKart;
  CreateChildMamulKartDetay;
  CreateChildMamulYanUrun;
  CreateChildMamulRota;
  CreateChildMamulRotaSonrakiOperasyon;
  CreateChildMamulRotaKaynak;
  CreateChildFMEAFormBaslik;
  CreateChildFMEAFormRevizyon;
  CreateChildFMEAFormDetay;
  CreateChildMamulNot;
  CreateChildMamulStokKart;
  CreateChildHammaddeStokKart;
  CreateChildMamulAgac;
  CreateChildKullanimAgac;
  CreateChildMaliyetList;
  CreateChildMamulKartAjan;
  CreateChildMamulRotaAjan;
  CreateChildHammaddeAjan;
  CreateChildMamulKartData;
end;

procedure TAppDOPMamulKart.CreateChildMamulRevizyon;
begin
  FChildMamulRevizyon := DocObject.CreateChild(TAppDocChildGrid, 'ChildMamulRevizyon') as TAppDocChildGrid;
  FChildMamulRevizyon.Caption := AppGetRS(@AppDOPMamulKart_ChildMamulRevizyon);
  FChildMamulRevizyon.PipelineName := 'ppMamulRevizyon';
  FChildMamulRevizyon.TableObject := DataApp.MamulRevizyon.Table;
  FChildMamulRevizyon.CreateButton('btMamulRevizyon', FChildMamulRevizyon.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKart.CreateChildMamulKart;
begin
  FChildMamulKart := DocObject.CreateChild(TAppDocChildGrid, 'ChildMamulKart') as TAppDocChildGrid;
  FChildMamulKart.Caption := AppGetRS(@AppDOPMamulKart_ChildMamulKart);
  FChildMamulKart.PipelineName := 'ppMamulKart';
  FChildMamulKart.TableObject := DataApp.MamulKart.Table;
  FChildMamulKart.CreateButton('btMamulKart', FChildMamulKart.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKart.CreateChildMamulKartDetay;
begin
  FChildMamulKartDetay := DocObject.CreateChild(TAppDocChildMultiVGrid, 'ChildMamulKartDetay') as TAppDocChildMultiVGrid;
  FChildMamulKartDetay.Caption := AppGetRS(@AppDOPMamulKart_ChildMamulKartDetay);
  FChildMamulKartDetay.PipelineName := 'ppMamulKartDetay';
  FChildMamulKartDetay.TableObject := DataApp.MamulKart.Table;
  FChildMamulKartDetay.CreateButton('btMamulKartDetay', FChildMamulKartDetay.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKart.CreateChildMamulYanUrun;
begin
  FChildMamulYanUrun := DocObject.CreateChild(TAppDocChildGrid, 'ChildMamulYanUrun') as TAppDocChildGrid;
  FChildMamulYanUrun.Caption := AppGetRS(@AppDOPMamulKart_ChildMamulYanUrun);
  FChildMamulYanUrun.PipelineName := 'ppMamulYanUrun';
  FChildMamulYanUrun.TableObject := DataApp.MamulYanUrun.Table;
  FChildMamulYanUrun.CreateButton('btMamulYanUrun', FChildMamulYanUrun.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKart.CreateChildMamulRota;
begin
  FChildMamulRota := DocObject.CreateChild(TAppDocChildGrid, 'ChildMamulRota') as TAppDocChildGrid;
  FChildMamulRota.Caption := AppGetRS(@AppDOPMamulKart_ChildMamulRota);
  FChildMamulRota.PipelineName := 'ppMamulRota';
  FChildMamulRota.TableObject := DataApp.MamulRota.Table;
  FChildMamulRota.CreateButton('btMamulRota', FChildMamulRota.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKart.CreateChildMamulRotaSonrakiOperasyon;
begin
  FChildMamulRotaSonrakiOperasyon := DocObject.CreateChild(TAppDocChildGrid, 'ChildMamulRotaSonrakiOperasyon') as TAppDocChildGrid;
  FChildMamulRotaSonrakiOperasyon.Caption := AppGetRS(@AppDOPMamulKart_ChildMamulrotaSonrakiOperasyon);
  FChildMamulRotaSonrakiOperasyon.PipelineName := 'ppMamulRotaSonrakiOperasyon';
  FChildMamulRotaSonrakiOperasyon.TableObject := DataApp.MamulRotaSonrakiOperasyon.Table;
  FChildMamulRotaSonrakiOperasyon.CreateButton('btMamulRotaSonrakiOperasyon', FChildMamulRotaSonrakiOperasyon.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKart.CreateChildMamulRotaKaynak;
begin
  FChildMamulRotaKaynak := DocObject.CreateChild(TAppDocChildGrid, 'ChildMamulRotaKaynak') as TAppDocChildGrid;
  FChildMamulRotaKaynak.Caption := AppGetRS(@AppDOPMamulKart_ChildMamulRotaKaynak);
  FChildMamulRotaKaynak.PipelineName := 'ppMamulRotaKaynak';
  FChildMamulRotaKaynak.TableObject := DataApp.MamulRotaKaynak.Table;
  FChildMamulRotaKaynak.CreateButton('btMamulRotaKaynak', FChildMamulRotaKaynak.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKart.CreateChildFMEAFormBaslik;
begin
  FChildFMEAFormBaslik := DocObject.CreateChild(TAppDocChildGrid, 'ChildFMEAFormBaslik') as TAppDocChildGrid;
  FChildFMEAFormBaslik.Caption := AppGetRS(@AppDOPMamulKart_ChildFMEAFormBaslik);
  FChildFMEAFormBaslik.PipelineName := 'ppFMEAFormBaslik';
  FChildFMEAFormBaslik.TableObject := DataApp.FMEAFormBaslik.Table;
  FChildFMEAFormBaslik.CreateButton('btFMEAFormBaslik', FChildFMEAFormBaslik.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKart.CreateChildFMEAFormRevizyon;
begin
  FChildFMEAFormRevizyon := DocObject.CreateChild(TAppDocChildGrid, 'ChildFMEAFormRevizyon') as TAppDocChildGrid;
  FChildFMEAFormRevizyon.Caption := AppGetRS(@AppDOPMamulKart_ChildFMEAFormRevizyon);
  FChildFMEAFormRevizyon.PipelineName := 'ppFMEAFormRevizyon';
  FChildFMEAFormRevizyon.TableObject := DataApp.FMEAFormRevizyon.Table;
  FChildFMEAFormRevizyon.CreateButton('btFMEAFormRevizyon', FChildFMEAFormRevizyon.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKart.CreateChildFMEAFormDetay;
begin
  FChildFMEAFormDetay := DocObject.CreateChild(TAppDocChildGrid, 'ChildFMEAFormDetay') as TAppDocChildGrid;
  FChildFMEAFormDetay.Caption := AppGetRS(@AppDOPMamulKart_ChildFMEAFormDetay);
  FChildFMEAFormDetay.PipelineName := 'ppFMEAFormDetay';
  FChildFMEAFormDetay.TableObject := DataApp.FMEAFormDetay.Table;
  FChildFMEAFormDetay.CreateButton('btFMEAFormDetay', FChildFMEAFormDetay.Caption, 'Sayfalar');
end;

function TAppDOPMamulKart.OpenDataObject(SirketNo, ReceteNo: String; const MamulKod: String = ''; const VersiyonNo: String = ''; const SurumNo: Integer = 0): Boolean;
begin
  Result := False;
  if not AppConfirm('Mamül kartýný aç?') then
    Exit;
  if ReceteNo <> '' then
  begin
    with DataApp.DataObject.OptionsKey do
    begin
      KeyValues['SIRKETNO'] := SirketNo;
      KeyValues['RECETENO'] := ReceteNo;
    end;
    DataApp.DataObject.Open;
  end else
  begin
    DataApp.DataObject.New;
    DataApp.MamulBaslik.Table.Edit;
    DataApp.MamulBaslik.Table.MamulKod := MamulKod;
    DataApp.MamulBaslik.Table.VersiyonNo := VersiyonNo;
    DataApp.MamulBaslik.Table.KullanimKod := '';
    DataApp.MamulBaslik.Table.SurumNo := SurumNo;
  end;
  ChildMamulBaslik.ShowChild;
  Result := True;
end;

procedure TAppDOPMamulKart.ChildMamulKartAjanOnDblClick(
  Sender: TObject);
begin
  OpenDataObject(ChildMamulKartAjan.TableMaster.FieldValues['SIRKETNO'], ChildMamulKartAjan.TableMaster.FieldValues['RECETENO']);
end;

procedure TAppDOPMamulKart.ChildMamulKartAjanOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldChildMamulKartAjanOnKeyDown) then
    FOldChildMamulKartAjanOnKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
  begin
    ChildMamulKartAjan.GridViewMaster.OnDblClick(Sender);
  end;
end;

procedure TAppDOPMamulKart.ChildMamulKartDataOnDblClick(Sender: TObject);
begin
  OpenDataObject(ChildMamulKartData.Table.FieldValues['SIRKETNO'], ChildMamulKartData.Table.FieldValues['RECETENO']);
end;

procedure TAppDOPMamulKart.CreateChildMamulKartAjan;
begin
  FChildMamulKartAjan := DocObject.CreateChild(TAppDocChildMasterDetail, 'ChildMamulKartAjan') as TAppDocChildMasterDetail;
  ChildMamulKartAjan.AppName := 'MamulKartAjan';
  ChildMamulKartAjan.Caption := AppGetRS(@AppDOPMamulKart_ChildMamulKartAjan);
  ChildMamulKartAjan.PipelineMasterName := 'MamulBaslikIzleyici';
  ChildMamulKartAjan.PipelineDetailName := 'MamulKartIzleyici';
  ChildMamulKartAjan.CreateButton('btMamulKartAjan', ChildMamulKartAjan.Caption, 'Sayfalar', 'Ctrl+J');

  ChildMamulKartAjan.TableMaster.TableItems.TableNames := VarArrayOf(['MAMBAS', 'STKKRT']);
  ChildMamulKartAjan.TableMaster.TableItems.TableCaptions := VarArrayOf(['Mamül Baþlýk', 'Stok Kart']);
  with ChildMamulKartAjan.TableMaster.TableItems.OrderBy do
  begin
    Clear;
  end;
  with ChildMamulKartAjan.TableMaster.TableItems[0].Fields do
  begin
    Clear;
    Add('SIRKETNO');
    Add('RECETENO');
    Add('MAMULKOD');
    Add('VERSIYONNO');
    Add('KULLANIMKOD');
    Add('SURUMNO');
  end;
  with ChildMamulKartAjan.TableMaster.TableItems[1].Fields do
  begin
    Clear;
    Add('MALAD');
  end;
  with ChildMamulKartAjan.TableMaster.TableItems[1].Join do
    Add('MALKOD', 'MAMULKOD');

  ChildMamulKartAjan.TableDetail.TableItems.TableNames := VarArrayOf(['MAMKRT', 'STKKRT']);
  ChildMamulKartAjan.TableDetail.TableItems.TableCaptions := VarArrayOf(['Mamül Kartý', 'Stok Kartý']);
  with ChildMamulKartAjan.TableDetail.TableItems[0].Fields do
  begin
    Clear;
    Add('HAMMADDEKOD');
    Add('HAMMADDEVERSIYONNO');
    Add('HAMMADDEBIRIM');
    Add('MIKTAR');
  end;
  with ChildMamulKartAjan.TableDetail.TableItems[1].Fields do
  begin
    Clear;
    Add('MALAD');
  end;
  with ChildMamulKartAjan.TableDetail.TableItems[1].Join do
    Add('MALKOD', 'HAMMADDEKOD');
  with ChildMamulKartAjan.TableDetail.TableItems[0].Where do
  begin
    AddField('SIRKETNO', wcEqual, ChildMamulKartAjan.TableMaster.TableItems[0], 'SIRKETNO');
    AddOperator(woAnd);
    AddField('RECETENO', wcEqual, ChildMamulKartAjan.TableMaster.TableItems[0], 'RECETENO');
  end;
  ChildMamulKartAjan.GridViewMaster.OnDblClick := ChildMamulKartAjanOnDblClick;

  FOldChildMamulKartAjanOnKeyDown := FChildMamulKartAjan.GridViewMaster.OnKeyDown;
  FChildMamulKartAjan.GridViewMaster.OnKeyDown := ChildMamulKartAjanOnKeyDown;
end;

procedure TAppDOPMamulKart.CreateChildMamulKartData;
begin
  FChildMamulKartData := DocObject.CreateChild(TAppDocChildSearchTable, 'ChildMamulKartData') as TAppDocChildSearchTable;
  FChildMamulKartData.AppName := AppName + '\' + FChildMamulKartData.Name;
  FChildMamulKartData.Caption := AppGetRS(@AppDOPMamulKart_ChildMamulKartData);
  FChildMamulKartData.PipelineName := 'ppHizliMamulKart';
  FChildMamulKartData.Table.TableItems.TableNames := VarArrayOf(['MAMKRT', 'STKKRT', 'STKKRT']);
  FChildMamulKartData.Table.TableItems.TableAlias := VarArrayOf(['MAMKRT', 'MAMSTK', 'STKKRT']);
  FChildMamulKartData.Table.TableItems.TableReferans := VarArrayOf(['MAMKRT', 'STKKRT', 'STKKRT']);
  FChildMamulKartData.Table.TableItems.TableCaptions := VarArrayOf(['Mamül Kart', 'Mamül', 'Hammadde']);
  // MAMSTK
  with FChildMamulKartData.Table.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALAD');
    end;
    with Join do
    begin
      Clear;
      Add('MALKOD', 'MAMULKOD');
    end;
  end;
  // STKKRT
  with FChildMamulKartData.Table.TableItems[2] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALAD');
    end;
    with Join do
    begin
      Clear;
      Add('MALKOD', 'HAMMADDEKOD');
    end;
  end;
  FChildMamulKartData.Table.LookupTableItems.Add(FChildMamulKartData.Table.TableItems[1]); // MAMSTK
  FChildMamulKartData.Table.LookupTableItems.Add(FChildMamulKartData.Table.TableItems[2]); // STKKRT

  FChildMamulKartData.CreateButton('btChildMamulKartData', FChildMamulKartData.Caption, 'Sayfalar', '', nil);
  FChildMamulKartData.GridView.OnDblClick := ChildMamulKartDataOnDblClick;
  FChildMamulKartData.ReadOnly := False;
  FChildMamulKartData.Table.ProviderName := 'prMAMKRT';
  FChildMamulKartData.Table.Validate.Assign(DataApp.MamulKart.Table.Validate);
  FChildMamulKartData.Table.DefaultValue.Assign(DataApp.MamulKart.Table.DefaultValue);
  DocObject.Macros.AddObject(FChildMamulKartData, 'ChildMamulKartData');
end;

procedure TAppDOPMamulKart.ChildMaliyetListOnDblClick(
  Sender: TObject);
begin
  if OpenDataObject(DataApp.CompanyNo, '', ChildMaliyetList.TableObject.FieldValues['MAMULKOD'], ChildMaliyetList.TableObject.FieldValues['VERSIYONNO'], ChildMaliyetList.TableObject.FieldValues['SURUMNO']) then
    OpenMamulAgac;
end;

procedure TAppDOPMamulKart.ChildMaliyetListOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldChildMaliyetListOnKeyDown) then
    FOldChildMaliyetListOnKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
  begin
    ChildMaliyetList.GridView.OnDblClick(Sender);
  end;
end;

procedure TAppDOPMamulKart.CreateChildMaliyetList;
begin
  FChildMaliyetList := DocObject.CreateChild(TAppDocChildGrid, 'ChildMaliyetList') as TAppDocChildGrid;
  FChildMaliyetList.Caption := AppGetRS(@AppDOPMamulKart_ChildMaliyetList);
  FChildMaliyetList.PipelineName := 'ppMaliyetListesi';
  FChildMaliyetList.TableObject := DataApp.MaliyetList.Table;
  FChildMaliyetList.CreateButton('btMaliyetList', FChildMaliyetList.Caption, 'Sayfalar');

  FChildMaliyetList.GridView.OnDblClick := ChildMaliyetListOnDblClick;

  FOldChildMaliyetListOnKeyDown := FChildMaliyetList.GridView.OnKeyDown;
  FChildMaliyetList.GridView.OnKeyDown := ChildMaliyetListOnKeyDown;
end;

procedure TAppDOPMamulKart.ChildMamulRotaAjanOnDblClick(
  Sender: TObject);
begin
  OpenDataObject(ChildMamulRotaAjan.TableMaster.FieldValues['SIRKETNO'], ChildMamulRotaAjan.TableMaster.FieldValues['RECETENO']);
end;

procedure TAppDOPMamulKart.ChildMamulRotaAjanOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldChildMamulRotaAjanOnKeyDown) then
    FOldChildMamulRotaAjanOnKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
  begin
    ChildMamulRotaAjan.GridViewMaster.OnDblClick(Sender);
  end;
end;

procedure TAppDOPMamulKart.CreateChildMamulRotaAjan;
begin
  FChildMamulRotaAjan := DocObject.CreateChild(TAppDocChildMasterDetail, 'ChildMamulRotaAjan') as TAppDocChildMasterDetail;
  ChildMamulRotaAjan.AppName := 'MamulRotaAjan';
  ChildMamulRotaAjan.Caption := AppGetRS(@AppDOPMamulKart_ChildMamulRotaAjan);
  ChildMamulRotaAjan.PipelineMasterName := 'MamulRotaBaslikIzleyici';
  ChildMamulRotaAjan.PipelineDetailName := 'MamulRotaIzleyici';
  ChildMamulRotaAjan.CreateButton('btMamulRotaAjan', ChildMamulRotaAjan.Caption, 'Sayfalar', 'Ctrl+R');

  ChildMamulRotaAjan.TableMaster.TableItems.TableNames := VarArrayOf(['MAMBAS', 'STKKRT']);
  ChildMamulRotaAjan.TableMaster.TableItems.TableCaptions := VarArrayOf(['Mamül Baþlýk', 'Stok Kart']);
  with ChildMamulRotaAjan.TableMaster.TableItems.OrderBy do
  begin
    Clear;
  end;
  with ChildMamulRotaAjan.TableMaster.TableItems[0].Fields do
  begin
    Clear;
    Add('SIRKETNO');
    Add('RECETENO');
    Add('MAMULKOD');
    Add('VERSIYONNO');
    Add('KULLANIMKOD');
    Add('SURUMNO');
  end;
  with ChildMamulRotaAjan.TableMaster.TableItems[1].Fields do
  begin
    Clear;
    Add('MALAD');
  end;
  with ChildMamulRotaAjan.TableMaster.TableItems[1].Join do
    Add('MALKOD', 'MAMULKOD');

  ChildMamulRotaAjan.TableDetail.TableItems.TableNames := VarArrayOf(['MAMKYN', 'URTKYN']);
  ChildMamulRotaAjan.TableDetail.TableItems.TableCaptions := VarArrayOf(['Mamül Kaynak','Üretim Kaynak']);
  with ChildMamulRotaAjan.TableDetail.TableItems[0].Fields do
  begin
    Clear;
    Add('ISMERKEZKOD');
    Add('KAYNAKKOD');
    Add('KULLANIMSIRANO');
  end;
  with ChildMamulRotaAjan.TableDetail.TableItems[1].Fields do
  begin
    Clear;
    Add('KAYNAKAD');
  end;
  with ChildMamulRotaAjan.TableDetail.TableItems[1].Join do
    Add('KAYNAKKOD', 'KAYNAKKOD');
  with ChildMamulRotaAjan.TableDetail.TableItems[0].Where do
  begin
    AddField('SIRKETNO', wcEqual, ChildMamulRotaAjan.TableMaster.TableItems[0], 'SIRKETNO');
    AddOperator(woAnd);
    AddField('RECETENO', wcEqual, ChildMamulRotaAjan.TableMaster.TableItems[0], 'RECETENO');
  end;

  ChildMamulRotaAjan.GridViewMaster.OnDblClick := ChildMamulRotaAjanOnDblClick;

  FOldChildMamulRotaAjanOnKeyDown := FChildMamulRotaAjan.GridViewMaster.OnKeyDown;
  FChildMamulRotaAjan.GridViewMaster.OnKeyDown := ChildMamulRotaAjanOnKeyDown;
end;

procedure TAppDOPMamulKart.CreateChildMamulBaslik;
begin
  FChildMamulBaslik := DocObject.CreateChild(TAppDocChildMultiVGrid, 'ChildMamulBaslik') as TAppDocChildMultiVGrid;
  FChildMamulBaslik.Caption := AppGetRS(@AppDOPMamulKart_ChildMamulBaslik);
  FChildMamulBaslik.PipelineName := 'ppMamulBaslik';
  FChildMamulBaslik.TableObject := DataApp.MamulBaslik.Table;
  FChildMamulBaslik.CreateButton('btMamulBaslik', FChildMamulBaslik.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKart.CreateChildMamulNot;
begin
  FChildMamulNot := DocObject.CreateChild(TAppDocChildGridNote, 'ChildMamulNot') as TAppDocChildGridNote;
  FChildMamulNot.Caption := AppGetRS(@AppDOPMamulKart_ChildMamulNot);
  FChildMamulNot.PipelineName := 'ppMamulNot';
  FChildMamulNot.TableObject := DataApp.MamulNot.Table;
  FChildMamulNot.CreateButton('btMamulNot', FChildMamulNot.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKart.CreateChildMamulStokKart;
begin
  FChildMamulStokKart := DocObject.CreateChild(TAppDocChildVGrid, 'ChildMamulStokKart') as TAppDocChildVGrid;
  FChildMamulStokKart.Caption := AppGetRS(@AppDOPMamulKart_ChildMamulStokKart);
  FChildMamulStokKart.PipelineName := 'ppMamulStokKart';
  FChildMamulStokKart.TableObject := DataApp.MamulStokKart.Table;
  FChildMamulStokKart.ReadOnly := True;
  FChildMamulStokKart.CreateButton('btMamulStokKart', FChildMamulStokKart.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKart.ChildHammaddeAjanOnDblClick(Sender: TObject);
begin
  OpenDataObject(ChildHammaddeAjan.Table.FieldValues['SIRKETNO'], ChildHammaddeAjan.Table.FieldValues['RECETENO']);
end;

procedure TAppDOPMamulKart.ChildHammaddeAjanOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldChildHammaddeAjanOnKeyDown) then
    FOldChildHammaddeAjanOnKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
  begin
    ChildHammaddeAjan.GridView.OnDblClick(Sender);
  end;
end;

procedure TAppDOPMamulKart.CreateChildHammaddeAjan;
begin
  FChildHammaddeAjan := DocObject.CreateChild(TAppDocChildSearchTable, 'ChildHammaddeAjan') as TAppDocChildSearchTable;
  ChildHammaddeAjan.AppName := 'HammaddeAjan';
  ChildHammaddeAjan.Caption := AppGetRS(@AppDOPMamulKart_ChildHammaddeAjan);
  ChildHammaddeAjan.PipelineName := 'HammaddeIzleyici';
  ChildHammaddeAjan.CreateButton('btHammaddeAjan', ChildHammaddeAjan.Caption, 'Sayfalar', 'Ctrl+L');

  ChildHammaddeAjan.Table.TableItems.TableNames := VarArrayOf(['MAMKRT', 'STKKRT', 'STKKRT']);
  ChildHammaddeAjan.Table.TableItems.TableAlias := VarArrayOf(['MAMKRT', 'MAMSTK', 'STKKRT']);
  ChildHammaddeAjan.Table.TableItems.TableReferans := VarArrayOf(['MAMKRT', 'STKKRT', 'STKKRT']);
  ChildHammaddeAjan.Table.TableItems.TableCaptions := 'Mamül Kart,Mamül,Hammadde';
  with ChildHammaddeAjan.Table.TableItems.OrderBy do
  begin
    Clear;
  end;
  with ChildHammaddeAjan.Table.TableItems[0].Fields do
  begin
    Clear;
    Add('SIRKETNO');
    Add('RECETENO');
    Add('MAMULKOD');
    Add('VERSIYONNO');
    Add('SURUMNO');
    Add('HAMMADDEKOD');
    Add('MIKTAR');
  end;
  with ChildHammaddeAjan.Table.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALAD');
    end;
    with Join do
    begin
      Add('MALKOD', 'MAMULKOD');
    end;
  end;
  with ChildHammaddeAjan.Table.TableItems[2] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALAD');
    end;
    with Join do
    begin
      Add('MALKOD', 'HAMMADDEKOD');
    end;
  end;

  ChildHammaddeAjan.GridView.OnDblClick := ChildHammaddeAjanOnDblClick;

  FOldChildHammaddeAjanOnKeyDown := FChildHammaddeAjan.GridView.OnKeyDown;
  FChildHammaddeAjan.GridView.OnKeyDown := ChildHammaddeAjanOnKeyDown;
end;

procedure TAppDOPMamulKart.CreateChildHammaddeStokKart;
begin
  FChildHammaddeStokKart := DocObject.CreateChild(TAppDocChildVGrid, 'ChildHammaddeStokKart') as TAppDocChildVGrid;
  FChildHammaddeStokKart.Caption := AppGetRS(@AppDOPMamulKart_ChildHammaddeStokKart);
  FChildHammaddeStokKart.PipelineName := 'ppHammaddeStokKart';
  FChildHammaddeStokKart.TableObject := DataApp.HammaddeStokKart.Table;
  FChildHammaddeStokKart.ReadOnly := True;
  FChildHammaddeStokKart.CreateButton('btHammaddeStokKart', FChildHammaddeStokKart.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKart.ChildMamulAgacOnCustomDrawDataCell(Sender: TcxCustomTreeList;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
var
  vTip: Variant;
begin
  vTip := AViewInfo.Node.Values[FColumnTip.ItemIndex];
  if vTip = Integer(matWorkCenter) then
  begin
    //ACanvas.Font.Style :=  ACanvas.Font.Style + [fsBold];
    ACanvas.Font.Color := clBlue;
  end
  else if vTip = Integer(matCoProduct) then
  begin
    //ACanvas.Font.Style :=  ACanvas.Font.Style + [fsBold];
    ACanvas.Font.Color := clRed;
  end;
end;

procedure TAppDOPMamulKart.CreateChildMamulAgac;
begin
  FChildMamulAgac := DocObject.CreateChild(TAppDocChildTreeList, 'ChildMamulAgac') as TAppDocChildTreeList;
  FChildMamulAgac.Caption := AppGetRS(@AppDOPMamulKart_ChildMamulAgac);
  FChildMamulAgac.PipelineName := 'ppMamulAgac';
  FChildMamulAgac.TableObject := DataApp.MamulAgac.Table;
  FChildMamulAgac.ReadOnly := True;
  FChildMamulAgac.TreeList.DataController.KeyField := 'SIRANO';
  FChildMamulAgac.TreeList.DataController.ParentField := 'ANASIRANO';
  FChildMamulAgac.CreateButton('btMamulAgac', FChildMamulAgac.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKart.CreateChildKullanimAgac;
begin
  FChildKullanimAgac := DocObject.CreateChild(TAppDocChildTreeList, 'ChildKullanimAgac') as TAppDocChildTreeList;
  FChildKullanimAgac.Caption := AppGetRS(@AppDOPMamulKart_ChildKullanimAgac);
  FChildKullanimAgac.PipelineName := 'ppKullanimAgac';
  FChildKullanimAgac.TableObject := DataApp.KullanimAgac.Table;
  FChildKullanimAgac.ReadOnly := True;
  FChildKullanimAgac.TreeList.DataController.KeyField := 'SIRANO';
  FChildKullanimAgac.TreeList.DataController.ParentField := 'ANASIRANO';
  FChildKullanimAgac.CreateButton('btKullanimAgac', FChildKullanimAgac.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKart.Kaynak_OnCanSave(var CanSave: Boolean; var ErrorText: String);
begin
  CanSave := false;
  ErrorText := 'Kopyalama amaçlý açýlan pencerede deðiþikliklerinizi kaydedemezsiniz.';
end;

procedure TAppDOPMamulKart.CopyMamulKartClick(Sender: TObject);
var
  BarManager: TdxBarManager;
  Bar: TdxBar;
  BarItem: TdxBarItem;
begin
  FKaynakDOPMamulKart := TAppDOPCustomMamulKart(AppBOMObjectCall.Open(odtMamulKart, 0, '', cotAsk, True, False, 'DOPMAMULKARTCOPY'));
  FKaynakDOPMamulKart.Caption := 'Kopyalanacak Mamül Kartý';
  FKaynakDOPMamulKart.DataApp.DataObject.OnCanSave := Kaynak_OnCanSave;
  FKaynakDOPMamulKart.Active := True;

  BarManager := FKaynakDOPMamulKart.DocObject.IMainForm.BarManager;
  Bar := AppBarHelper.BarByName(BarManager, '__HedefMamulKart');

  if Bar = nil then
  begin
    Bar := FKaynakDOPMamulKart.DocObject.CreateBar('Hedef Mamül Kart',  dsTop, 2, 2, True, True);
    Bar.Name := '__HedefMamulKart';
  end;
  Bar.LockUpdate := True;
  if not Bar.Visible then
    Bar.Visible := True;

  BarItem := BarManager.GetItemByName('__btCopyMamulKart');
  if BarItem = nil then
    BarItem := FKaynakDOPMamulKart.DocObject.CreateButton('__btCopyMamulKart', 'Kart Kopyala', 'Araçlar', '', CallCopyMamulKartClick);
  if not Bar.ItemLinks.HasItem(BarItem) then
    Bar.ItemLinks.Add.Item := BarItem;

  BarItem := BarManager.GetItemByName('__btCopyMamulRota');
  if BarItem = nil then
    BarItem := FKaynakDOPMamulKart.DocObject.CreateButton('__btCopyMamulRota', 'Rota Kopyala', 'Araçlar', '', CallCopyMamulRotaClick);
  if not Bar.ItemLinks.HasItem(BarItem) then
    Bar.ItemLinks.Add.Item := BarItem;

  BarItem := BarManager.GetItemByName('__btCopyMamulAll');
  if BarItem = nil then
    BarItem := FKaynakDOPMamulKart.DocObject.CreateButton('__btCopyMamulAll', 'Mamül Kopyala', 'Araçlar', '', CallCopyMamulAllClick);
  if not Bar.ItemLinks.HasItem(BarItem) then
    Bar.ItemLinks.Add.Item := BarItem;

  Bar.LockUpdate := False;
end;

procedure TAppDOPMamulKart.CopyMamulNot;
var
  TableKaynakMamulNot, TableHedefMamulNot: TAppTable;
begin
  // Copy Mamül Kart;
  TableKaynakMamulNot := FKaynakDOPMamulKart.DataApp.MamulNot.Table;
  TableHedefMamulNot := DataApp.MamulNot.Table;

  TableKaynakMamulNot.DisableControls;
  TableHedefMamulNot.DisableControls;
  try
    TableKaynakMamulNot.First;
    while not TableKaynakMamulNot.Eof do
    begin
      TableHedefMamulNot.Append;
      TableHedefMamulNot.FetchRecord(TableKaynakMamulNot);
      TableHedefMamulNot.Post;
      TableKaynakMamulNot.Next;
    end;
  finally
    TableKaynakMamulNot.EnableControls;
    TableHedefMamulNot.EnableControls;
  end;
end;

procedure TAppDOPMamulKart.CopyMamulKart;
var
  TableKaynakMamulKart, TableHedefMamulKart: TTableMamulKart;
begin
  // Copy Mamül Kart;
  TableKaynakMamulKart := FKaynakDOPMamulKart.DataApp.MamulKart.Table;
  TableHedefMamulKart := DataApp.MamulKart.Table;

  TableKaynakMamulKart.DisableControls;
  TableHedefMamulKart.DisableControls;
  try
    TableKaynakMamulKart.First;
    while not TableKaynakMamulKart.Eof do
    begin
      TableHedefMamulKart.Append;
      TableHedefMamulKart.FetchRecord(TableKaynakMamulKart);
      TableHedefMamulKart.GirenKaynak := 'RECETE KOPYALAMA';
      TableHedefMamulKart.Post;
      TableKaynakMamulKart.Next;
    end;
  finally
    TableKaynakMamulKart.EnableControls;
    TableHedefMamulKart.EnableControls;
  end;
end;

procedure TAppDOPMamulKart.CallCopyMamulKartClick(Sender: TObject);
begin
  CopyMamulKart;
  FKaynakDOPMamulKart.DocObject.MainForm.Close;
end;

procedure TAppDOPMamulKart.CopyMamulRota;
var
  TableKaynakMamulRota, TableHedefMamulRota: TTableMamulRota;
  TableKaynakMamulRotaKaynak, TableHedefMamulRotaKaynak: TTableMamulRotaKaynak;
  TableKaynakMamulRotaSonrakiOperasyon, TableHedefMamulRotaSonrakiOperasyon: TTableMamulRotaSonrakiOperasyon;
  AHedefRevizyonNo: String;
begin
  // Copy Mamül Rota;
  TableKaynakMamulRota := FKaynakDOPMamulKart.DataApp.MamulRota.Table;
  TableKaynakMamulRota.DisableControls;

  TableKaynakMamulRotaKaynak := FKaynakDOPMamulKart.DataApp.MamulRotaKaynak.Table;
  TableKaynakMamulRotaKaynak.DisableControls;

  TableKaynakMamulRotaSonrakiOperasyon := FKaynakDOPMamulKart.DataApp.MamulRotaSonrakiOperasyon.Table;
  TableKaynakMamulRotaSonrakiOperasyon.DisableControls;

  TableHedefMamulRota := DataApp.MamulRota.Table;
  TableHedefMamulRota.DisableControls;

  AHedefRevizyonNo := DataApp.MamulRevizyon.Table.RevizyonNo;

  TableHedefMamulRotaKaynak := DataApp.MamulRotaKaynak.Table;
  TableHedefMamulRotaKaynak.DisableControls;

  TableHedefMamulRotaSonrakiOperasyon := DataApp.MamulRotaSonrakiOperasyon.Table;
  TableHedefMamulRotaSonrakiOperasyon.DisableControls;
  try
    TableKaynakMamulRota.First;
    while not TableKaynakMamulRota.Eof do
    begin
      if not TableHedefMamulRota.FindKey([AHedefRevizyonNo, TableKaynakMamulRota.OperasyonNo]) then
      begin
        TableHedefMamulRota.Append;
        TableHedefMamulRota.OperasyonNo := TableKaynakMamulRota.OperasyonNo;
        TableHedefMamulRota.IsMerkezKod := TableKaynakMamulRota.IsMerkezKod;
        TableHedefMamulRota.Aciklama := TableKaynakMamulRota.Aciklama;
        TableHedefMamulRota.KaynakKullanimTip := TableKaynakMamulRota.KaynakKullanimTip;
        TableHedefMamulRota.GirenKaynak := 'RECETE KOPYALAMA';
        TableHedefMamulRota.Post;

        TableKaynakMamulRotaSonrakiOperasyon.First;
        while not TableKaynakMamulRotaSonrakiOperasyon.Eof do
        begin
          TableHedefMamulRotaSonrakiOperasyon.Append;
          TableHedefMamulRotaSonrakiOperasyon.OperasyonNo := TableKaynakMamulRotaSonrakiOperasyon.OperasyonNo;
          TableHedefMamulRotaSonrakiOperasyon.SonrakiOperasyonNo := TableKaynakMamulRotaSonrakiOperasyon.SonrakiOperasyonNo;
//          TableHedefMamulRotaSonrakiOperasyon.GirenKaynak := 'RECETE KOPYALAMA';
          TableHedefMamulRotaSonrakiOperasyon.Post;

          TableKaynakMamulRotaSonrakiOperasyon.Next;
        end;

        // Hedefdeki Kaynaklarý Sil: Operasyon giriþinde iþ merkezinden otomatik eklenenleri.
        TableHedefMamulRotaKaynak.First;
        while not TableHedefMamulRotaKaynak.Eof do
          TableHedefMamulRotaKaynak.Delete;

        // Kaynak Mamüldeki Kaynaklarý Kopyala
        TableKaynakMamulRotaKaynak.First;
        while not TableKaynakMamulRotaKaynak.Eof do
        begin
          TableHedefMamulRotaKaynak.Append;
          TableHedefMamulRotaKaynak.OperasyonNo := TableKaynakMamulRotaKaynak.OperasyonNo;
          TableHedefMamulRotaKaynak.KaynakKod := TableKaynakMamulRotaKaynak.KaynakKod;
          TableHedefMamulRotaKaynak.IsMerkezKod := TableKaynakMamulRotaKaynak.IsMerkezKod;
          TableHedefMamulRotaKaynak.KullanimTip := TableKaynakMamulRotaKaynak.KullanimTip;
          TableHedefMamulRotaKaynak.KullanimSiraNo := TableKaynakMamulRotaKaynak.KullanimSiraNo;
          TableHedefMamulRotaKaynak.GirenKaynak := 'RECETE KOPYALAMA';
          TableHedefMamulRotaKaynak.Post;

          TableKaynakMamulRotaKaynak.Next;
        end;
      end;

      TableKaynakMamulRota.Next;
    end;
  finally
    TableKaynakMamulRota.EnableControls;
    TableKaynakMamulRotaKaynak.EnableControls;
    TableKaynakMamulRotaSonrakiOperasyon.EnableControls;

    TableHedefMamulRota.EnableControls;
    TableHedefMamulRotaKaynak.EnableControls;
    TableHedefMamulRotaSonrakiOperasyon.EnableControls;
  end;
end;

procedure TAppDOPMamulKart.CallCopyMamulRotaClick(Sender: TObject);
begin
  CopyMamulRota;
  FKaynakDOPMamulKart.DocObject.MainForm.Close;
end;

procedure TAppDOPMamulKart.BOMTreeMamulKartAlanAktarimClick(Sender: TObject);
begin
  DataApp.MamulAgac.dcMamulAgac.MatchFields.Execute('Mamül Aðacý Mamül Kart Alan Aktarýmý');
end;

procedure TAppDOPMamulKart.CallCopyMamulAllClick(Sender: TObject);

  function GetParams: Boolean;
  begin
    ParamsWindow.Items.Clear;
    with ParamsWindow.Items.Add do
    begin
      Name := 'MAMULKART';
      Caption := 'Mamül Kart';
      Value := FCopyMamulKart_MamulKart;
      EditPropertiesClass := TcxCheckBoxProperties;
    end;
    with ParamsWindow.Items.Add do
    begin
      Name := 'MAMULROTA';
      Caption := 'Mamül Rotasý';
      Value := FCopyMamulKart_MamulRota;
      EditPropertiesClass := TcxCheckBoxProperties;
    end;
    with ParamsWindow.Items.Add do
    begin
      Name := 'MAMULNOT';
      Caption := 'Mamül Notlarý';
      Value := FCopyMamulKart_MamulNot;
      EditPropertiesClass := TcxCheckBoxProperties;
    end;
    ParamsWindow.Caption := 'Mamül Kopyalama Parametreleri';
    Result := ParamsWindow.Execute;
    if Result then
    begin
      FCopyMamulKart_MamulKart := ParamsWindow['MAMULKART'];
      FCopyMamulKart_MamulRota := ParamsWindow['MAMULROTA'];
      FCopyMamulKart_MamulNot := ParamsWindow['MAMULNOT'];
    end;
  end;

begin
  if not GetParams then
    Exit;

  if FCopyMamulKart_MamulKart = 1 then
    CopyMamulKart;
  if FCopyMamulKart_MamulRota = 1 then
    CopyMamulRota;
  if FCopyMamulKart_MamulNot = 1 then
    CopyMamulNot;

  FKaynakDOPMamulKart.DocObject.MainForm.Close;
end;

procedure TAppDOPMamulKart.AddKaynakFromKaynakKurulumClick(Sender: TObject);
begin
  DataApp.MamulParams.AddKaynakFromKaynakKurulum := btAddKaynakFromKaynakKurulum.Down;
end;

procedure TAppDOPMamulKart.ShowAlanSecimForMamulBaslikClick(Sender: TObject);
begin
  DataApp.MamulBaslik.ShowFieldSettings('Mamül Baþlýk Alan Seçimi...', DataApp.MamulBaslik.Table.Name);
end;

procedure TAppDOPMamulKart.ShowAlanSecimForMamulKartClick(Sender: TObject);
begin
  DataApp.MamulKart.ShowFieldSettings('Mamül Baþlýk Alan Seçimi...', DataApp.MamulKart.Table.Name);
end;

procedure TAppDOPMamulKart.ShowAlanSecimForMamulAgacClick(Sender: TObject);
begin
  DataApp.MamulAgac.ShowFieldSettings('Mamül Aðacý Alan Seçimi...', DataApp.MamulAgac.Table.Name);
end;

procedure TAppDOPMamulKart.ShowAlanSecimForKullanimAgacClick(Sender: TObject);
begin
  DataApp.KullanimAgac.ShowFieldSettings('Kullaným Aðacý Alan Seçimi...', DataApp.KullanimAgac.Table.Name);
end;

procedure TAppDOPMamulKart.ShowAlanSecimForMaliyetListClick(Sender: TObject);
begin
  DataApp.MaliyetList.ShowFieldSettings('Maliyet Listesi Alan Seçimi...', DataApp.MaliyetList.Table.Name);
end;

procedure TAppDOPMamulKart.ShowAlanAktarimForMamulBaslikClick(Sender: TObject);
begin
  DataApp.MamulBaslik.FetchFields.Execute('Mamül Baþlýk Alan Aktarýmý');
end;

procedure TAppDOPMamulKart.ShowAlanAktarimForMamulKartClick(Sender: TObject);
begin
  DataApp.MamulKart.FetchFields.Execute('Mamül Kart Alan Aktarýmý');
end;

procedure TAppDOPMamulKart.Show_StokKart_AdvKriter(EnableSave: Boolean);
begin
  TableItems.TableNames := 'STKKRT';
  TableItems.TableCaptions := 'Stok Kart';

  AppFilter.Caption := 'Stok Kart Kriteri';
  AppFilter.Execute('StokKartFilter', FOpenMamulAgac_StokKart_LastFilterUserName, FOpenMamulAgac_StokKart_LastFilterName, EnableSave);

  FOpenMamulAgac_StokKart_LastFilterName := AppFilter.LastFilterName;
  FOpenMamulAgac_StokKart_LastFilterUserName := AppFilter.LastFilterUserName;
  FOpenMamulAgac_StokKart_FilterText := AppFilter.FilterText;
  if AppFilter.TempFilterText <> '' then
  begin
    if FOpenMamulAgac_StokKart_FilterText <> '' then
      FOpenMamulAgac_StokKart_FilterText := FOpenMamulAgac_StokKart_FilterText + ' AND ';
    FOpenMamulAgac_StokKart_FilterText := FOpenMamulAgac_StokKart_FilterText + AppFilter.TempFilterText;
  end;
end;

procedure TAppDOPMamulKart.TranslationChanged;
  procedure SetChildCaption(aChild: TAppDocChild; aCaption: String; const aButtonCaption: String = '');
  begin
    if aChild <> nil then
    begin
      aChild.Caption := aCaption;
      if aButtonCaption <> '' then
        aChild.ButtonCaption := aButtonCaption;
    end;
  end;
begin
  inherited;

  if AppName = AppBOMConsts.AppName(odtMamulKart) then
    Caption := AppBOMConsts.Caption(odtMamulKart);

  SetChildCaption(ChildMamulBaslik, AppGetRS(@AppDOPMamulKart_ChildMamulBaslik));
  SetChildCaption(ChildMamulRevizyon, AppGetRS(@AppDOPMamulKart_ChildMamulRevizyon));
  SetChildCaption(ChildMamulKart, AppGetRS(@AppDOPMamulKart_ChildMamulKart));
  SetChildCaption(ChildMamulKartDetay, AppGetRS(@AppDOPMamulKart_ChildMamulKartDetay));
  SetChildCaption(ChildMamulYanUrun, AppGetRS(@AppDOPMamulKart_ChildMamulYanUrun));
  SetChildCaption(ChildMamulRota, AppGetRS(@AppDOPMamulKart_ChildMamulRota));
  SetChildCaption(ChildMamulRotaSonrakiOperasyon, AppGetRS(@AppDOPMamulKart_ChildMamulrotaSonrakiOperasyon));
  SetChildCaption(ChildMamulRotaKaynak, AppGetRS(@AppDOPMamulKart_ChildMamulRotaKaynak));
  SetChildCaption(ChildFMEAFormBaslik, AppGetRS(@AppDOPMamulKart_ChildFMEAFormBaslik));
  SetChildCaption(ChildFMEAFormRevizyon, AppGetRS(@AppDOPMamulKart_ChildFMEAFormRevizyon));
  SetChildCaption(ChildFMEAFormDetay, AppGetRS(@AppDOPMamulKart_ChildFMEAFormDetay));
  SetChildCaption(ChildMamulNot, AppGetRS(@AppDOPMamulKart_ChildMamulNot));
  SetChildCaption(ChildMamulStokKart, AppGetRS(@AppDOPMamulKart_ChildMamulStokKart));
  SetChildCaption(ChildHammaddeStokKart, AppGetRS(@AppDOPMamulKart_ChildHammaddeStokKart));
  SetChildCaption(ChildMamulAgac, AppGetRS(@AppDOPMamulKart_ChildMamulAgac));
  SetChildCaption(ChildKullanimAgac, AppGetRS(@AppDOPMamulKart_ChildKullanimAgac));
  SetChildCaption(ChildMaliyetList, AppGetRS(@AppDOPMamulKart_ChildMaliyetList));
  SetChildCaption(ChildMamulKartAjan, AppGetRS(@AppDOPMamulKart_ChildMamulKartAjan));
  SetChildCaption(ChildMamulRotaAjan, AppGetRS(@AppDOPMamulKart_ChildMamulRotaAjan));
  SetChildCaption(ChildHammaddeAjan, AppGetRS(@AppDOPMamulKart_ChildHammaddeAjan));
  SetChildCaption(ChildMamulKartData, AppGetRS(@AppDOPMamulKart_ChildMamulKartData));
end;

procedure TAppDOPMamulKart.DefineFilterStokKartOnClick(Sender: TObject);
begin
  Show_StokKart_AdvKriter(True);
end;

function TAppDOPMamulKart.OpenMamulAgac_GetParams(Gosterim: String): Boolean;
begin
  ParamsWindow.Items.Clear;
  if Gosterim = 'AGAC' then
  begin
    with ParamsWindow.Items.Add do
    begin
      Name := 'MIKTAR';
      Caption := 'Miktar';
      Value := FOpenMamulAgac_Miktar;
    end;
  end;
  with ParamsWindow.Items.Add do
  begin
    Name := 'TARIH';
    Caption := 'Tarih';
    Value := FOpenMamulAgac_Tarih;
    EditPropertiesClass := TcxDateEditProperties;
  end;
  with ParamsWindow.Items.Add do
  begin
    Name := 'SINGLELEVEL';
    Caption := 'Seviye Limit';
    Value := FOpenMamulAgac_SingleLevel;
    EditPropertiesClass := TcxCheckBoxProperties;
  end;
  with ParamsWindow.Items.Add do
  begin
    Name := 'CALCSCRAP';
    Caption := 'Fireyi Ekle';
    Value := FOpenMamulAgac_CalcScrap;
    EditPropertiesClass := TcxCheckBoxProperties;
  end;
  with ParamsWindow.Items.Add do
  begin
    Name := 'ROUND';
    Caption := 'Yuvarla';
    Value := FOpenMamulAgac_Round;
    EditPropertiesClass := TcxCheckBoxProperties;
  end;
  if Gosterim = 'AGAC' then
  begin
    with ParamsWindow.Items.Add do
    begin
      Name := 'RETURNPHANTOM';
      Caption := 'Hayalet Montajlarý Göster';
      Value := FOpenMamulAgac_ReturnPhantom;
      EditPropertiesClass := TcxCheckBoxProperties;
    end;
    with ParamsWindow.Items.Add do
    begin
      Name := 'RETURNROUTE';
      Caption := 'Rotayý Göster';
      Value := FOpenMamulAgac_ReturnRoute;
      EditPropertiesClass := TcxCheckBoxProperties;
    end;
    with ParamsWindow.Items.Add do
    begin
      Name := 'RETURNPROCESS';
      Caption := 'Prosesleri Göster';
      Value := FOpenMamulAgac_ReturnProcess;
      EditPropertiesClass := TcxCheckBoxProperties;
    end;
  end;
  with ParamsWindow.Items.Add do
  begin
    Name := 'KULLANIMGRUPNO';
    Caption := 'Kullaným Grup No';
    Value := FOpenMamulAgac_KullanimGrupNo;
    EditPropertiesClass := TcxImageComboBoxProperties;

    AppFieldProp.FieldRef.Range('MAMKUG', 'KULLANIMGRUPNO');
    AppFieldProp.FieldRef.First;
    while not AppFieldProp.FieldRef.Eof do
    begin
      with Values.Add do
      begin
        Value := AppFieldProp.FieldRef.Kod;
        Description := AppFieldProp.FieldRef.Aciklama;
      end;
      AppFieldProp.FieldRef.Next;
    end;
  end;
  with ParamsWindow.Items.Add do
  begin
    Name := 'MALIYETTIP';
    Caption := 'Maliyet Tipi';
    Value := FOpenMamulAgac_MaliyetTip;
    EditPropertiesClass := TcxImageComboBoxProperties;

    AppFieldProp.FieldRef.Range('URTBAS', 'MALIYETTIP');
    AppFieldProp.FieldRef.First;
    while not AppFieldProp.FieldRef.Eof do
    begin
      with Values.Add do
      begin
        Value := AppFieldProp.FieldRef.Kod;
        Description := AppFieldProp.FieldRef.Aciklama;
      end;
      AppFieldProp.FieldRef.Next;
    end;
  end;
  with ParamsWindow.Items.Add do
  begin
    Name := 'DEFTERTIP';
    Caption := 'Defter Tipi';
    Value := FOpenMamulAgac_DefterTip;
    EditPropertiesClass := TcxImageComboBoxProperties;

    AppFieldProp.FieldRef.Range('MHSBAS', 'DEFTERTIP');
    AppFieldProp.FieldRef.First;
    while not AppFieldProp.FieldRef.Eof do
    begin
      with Values.Add do
      begin
        Value := AppFieldProp.FieldRef.Kod;
        Description := AppFieldProp.FieldRef.Aciklama;
      end;
      AppFieldProp.FieldRef.Next;
    end;
  end;
  with ParamsWindow.Items.Add do
  begin
    Name := 'MALIYETKIRILIMVERSIYONNO';
    Caption := 'Maliyet Versiyon Bazýnda';
    Value := FOpenMamulAgac_MaliyetKirilimVersiyonNo;
    EditPropertiesClass := TcxCheckBoxProperties;
  end;
  with ParamsWindow.Items.Add do
  begin
    Name := 'MYBASTARIH';
    Caption := 'Mali Yýl Baþ. Tarihi';
    Value := FOpenMamulAgac_MYBasTarih;
    EditPropertiesClass := TcxDateEditProperties;
  end;
  with ParamsWindow.Items.Add do
  begin
    Name := 'FIYATSABLONNO';
    Caption := 'Fiyat Þablon No';
    Value := FOpenMamulAgac_FiyatSablonNo;
    EditPropertiesClass := TcxImageComboBoxProperties;

    AppFieldProp.FieldRef.Range('FYTSBL', 'SABLONNO');
    AppFieldProp.FieldRef.First;
    while not AppFieldProp.FieldRef.Eof do
    begin
      with Values.Add do
      begin
        Value := AppFieldProp.FieldRef.Kod;
        Description := AppFieldProp.FieldRef.Aciklama;
      end;
      AppFieldProp.FieldRef.Next;
    end;
  end;
  with ParamsWindow.Items.Add do
  begin
    Name := 'FIYATSEKLI';
    Caption := 'Fiyat Þekli';
    Value := FOpenMamulAgac_FiyatSekli;
    EditPropertiesClass := TcxImageComboBoxProperties;

    AppFieldProp.FieldRef.Range('FYTKRT', 'FIYATSEKLI');
    AppFieldProp.FieldRef.First;
    while not AppFieldProp.FieldRef.Eof do
    begin
      with Values.Add do
      begin
        Value := AppFieldProp.FieldRef.Kod;
        Description := AppFieldProp.FieldRef.Aciklama;
      end;
      AppFieldProp.FieldRef.Next;
    end;
  end;
  with ParamsWindow.Items.Add do
  begin
    Name := 'BANKA';
    Caption := 'Banka';
    Value := FOpenMamulAgac_Banka;
    EditPropertiesClass := TcxImageComboBoxProperties;

    AppFieldProp.FieldRef.Range('DVZHAR', 'BANKA');
    AppFieldProp.FieldRef.First;
    while not AppFieldProp.FieldRef.Eof do
    begin
      with Values.Add do
      begin
        Value := AppFieldProp.FieldRef.Kod;
        Description := AppFieldProp.FieldRef.Aciklama;
      end;
      AppFieldProp.FieldRef.Next;
    end;
  end;
  with ParamsWindow.Items.Add do
  begin
    Name := 'DOVIZTIP';
    Caption := 'Doviz Tipi';
    Value := FOpenMamulAgac_DovizTip;
    EditPropertiesClass := TcxImageComboBoxProperties;

    AppFieldProp.FieldRef.Range('DVZHAR', 'DOVIZTIP');
    AppFieldProp.FieldRef.First;
    while not AppFieldProp.FieldRef.Eof do
    begin
      with Values.Add do
      begin
        Value := AppFieldProp.FieldRef.Kod;
        Description := AppFieldProp.FieldRef.Aciklama;
      end;
      AppFieldProp.FieldRef.Next;
    end;
  end;
  with ParamsWindow.Items.Add do
  begin
    Name := 'DOVIZTARIH';
    Caption := 'Doviz Tarihi';
    Value := FOpenMamulAgac_DovizTarih;
    EditPropertiesClass := TcxDateEditProperties;
  end;
  if Gosterim = 'MALIYET' then
  begin
    with ParamsWindow.Items.Add do
    begin
      Name := 'YENIFIYATKAYDET';
      Caption := 'Yeni Fiyat Kaydet';
      Value := FOpenMamulAgac_YeniFiyatKaydet;
      EditPropertiesClass := TcxCheckBoxProperties;
    end;
    with ParamsWindow.Items.Add do
    begin
      Name := 'YENIFIYATSABLONNO';
      Caption := 'Yeni Fiyat Þablon No';
      Value := FOpenMamulAgac_YeniFiyatSablonNo;
      EditPropertiesClass := TcxImageComboBoxProperties;

      AppFieldProp.FieldRef.Range('FYTSBL', 'SABLONNO');
      AppFieldProp.FieldRef.First;
      while not AppFieldProp.FieldRef.Eof do
      begin
        with Values.Add do
        begin
          Value := AppFieldProp.FieldRef.Kod;
          Description := AppFieldProp.FieldRef.Aciklama;
        end;
        AppFieldProp.FieldRef.Next;
      end;
    end;
    with ParamsWindow.Items.Add do
    begin
      Name := 'YENIFIYATSEKLI';
      Caption := 'Yeni Fiyat Þekli';
      Value := FOpenMamulAgac_YeniFiyatSekli;
      EditPropertiesClass := TcxImageComboBoxProperties;

      AppFieldProp.FieldRef.Range('FYTKRT', 'FIYATSEKLI');
      AppFieldProp.FieldRef.First;
      while not AppFieldProp.FieldRef.Eof do
      begin
        with Values.Add do
        begin
          Value := AppFieldProp.FieldRef.Kod;
          Description := AppFieldProp.FieldRef.Aciklama;
        end;
        AppFieldProp.FieldRef.Next;
      end;
    end;
    with ParamsWindow.Items.Add do
    begin
      Name := 'TOPLUISLEM';
      Caption := 'Toplu Ýþlem';
      Value := FOpenMamulAgac_TopluIslem;
      EditPropertiesClass := TcxCheckBoxProperties;
    end;
  end;

  ParamsWindow.Caption := 'Mamül Aðacý Parametreleri';
  Result := ParamsWindow.Execute;
  if Result then
  begin
    FOpenMamulAgac_Tarih := VarToDateTime(ParamsWindow['TARIH']);
    FOpenMamulAgac_SingleLevel := ParamsWindow['SINGLELEVEL'];
    if Gosterim = 'AGAC' then
    begin
      FOpenMamulAgac_Miktar := ParamsWindow['MIKTAR'];
      FOpenMamulAgac_ReturnPhantom := ParamsWindow['RETURNPHANTOM'];
      FOpenMamulAgac_ReturnRoute := ParamsWindow['RETURNROUTE'];
      FOpenMamulAgac_ReturnProcess := ParamsWindow['RETURNPROCESS'];
    end;
    FOpenMamulAgac_CalcScrap := ParamsWindow['CALCSCRAP'];
    FOpenMamulAgac_Round := ParamsWindow['ROUND'];
    FOpenMamulAgac_KullanimGrupNo := ParamsWindow['KULLANIMGRUPNO'];
    FOpenMamulAgac_MaliyetTip := ParamsWindow['MALIYETTIP'];
    FOpenMamulAgac_DefterTip := ParamsWindow['DEFTERTIP'];
    FOpenMamulAgac_MaliyetKirilimVersiyonNo := ParamsWindow['MALIYETKIRILIMVERSIYONNO'];
    FOpenMamulAgac_MYBasTarih := VarToDateTime(ParamsWindow['MYBASTARIH']);
    FOpenMamulAgac_FiyatSablonNo := ParamsWindow['FIYATSABLONNO'];
    FOpenMamulAgac_FiyatSekli := ParamsWindow['FIYATSEKLI'];
    FOpenMamulAgac_Banka := ParamsWindow['BANKA'];
    FOpenMamulAgac_DovizTip := ParamsWindow['DOVIZTIP'];
    FOpenMamulAgac_DovizTarih := VarToDateTime(ParamsWindow['DOVIZTARIH']);
    if Gosterim = 'MALIYET' then
    begin
      FOpenMamulAgac_YeniFiyatKaydet := ParamsWindow['YENIFIYATKAYDET'];
      FOpenMamulAgac_YeniFiyatSablonNo := ParamsWindow['YENIFIYATSABLONNO'];
      FOpenMamulAgac_YeniFiyatSekli := ParamsWindow['YENIFIYATSEKLI'];
      FOpenMamulAgac_TopluIslem := ParamsWindow['TOPLUISLEM'];
    end;
  end;
end;

procedure TAppDOPMamulKart.OpenMamulAgac;
begin
  with DataApp.MamulAgac.dcMamulAgac do
  begin
    Params.SingleLevel := Boolean(FOpenMamulAgac_SingleLevel);
    Params.ReturnPhantom := Boolean(FOpenMamulAgac_ReturnPhantom);
    Params.ReturnRoute := Boolean(FOpenMamulAgac_ReturnRoute);
    Params.ReturnProcess := Boolean(FOpenMamulAgac_ReturnProcess);
    Params.CalcScrap := FOpenMamulAgac_CalcScrap;
    Params.Round := Boolean(FOpenMamulAgac_Round);
    Params.KullanimGrupNo := FOpenMamulAgac_KullanimGrupNo;
    dcMaliyet.Params.Tarih := FOpenMamulAgac_Tarih;
    dcMaliyet.Params.MaliyetTip := TAppMaliyetTip(FOpenMamulAgac_MaliyetTip);
    dcMaliyet.Params.DefterTip := FOpenMamulAgac_DefterTip;
    dcMaliyet.Params.KirilimVersiyonNo := FOpenMamulAgac_MaliyetKirilimVersiyonNo;
    dcMaliyet.Params.MYBasTarih := FOpenMamulAgac_MYBasTarih;
    dcMaliyet.Params.FiyatSablonNo := FOpenMamulAgac_FiyatSablonNo;
    dcMaliyet.Params.FiyatSekli := FOpenMamulAgac_FiyatSekli;
    dcMaliyet.Params.Banka := FOpenMamulAgac_Banka;
    dcMaliyet.Params.DovizTip := FOpenMamulAgac_DovizTip;
    dcMaliyet.Params.DovizTarih := FOpenMamulAgac_DovizTarih;
    Start;
    try
      Expand(DataApp.MamulBaslik.Table.MamulKod, DataApp.MamulBaslik.Table.VersiyonNo, DataApp.MamulBaslik.Table.KullanimKod, DataApp.MamulBaslik.Table.SurumNo, FOpenMamulAgac_Tarih, FOpenMamulAgac_Miktar, DataApp.MamulBaslik.Table.Birim, DataApp.MamulBaslik.Table.MamulDepoKod, DataApp.MamulBaslik.Table.HammaddeDepoKod);
    finally
      Finish;
    end;
  end;
  ChildMamulAgac.ShowChild;
end;

procedure TAppDOPMamulKart.OpenMamulAgacClick(Sender: TObject);
begin
  if not OpenMamulAgac_GetParams('AGAC') then
    Exit;
  OpenMamulAgac;
end;

procedure TAppDOPMamulKart.OpenMamulAgacAllClick(Sender: TObject);
begin
  if not OpenMamulAgac_GetParams('AGAC') then
    Exit;
  Show_StokKart_AdvKriter(False);

  with DataApp.MamulAgac.dcMamulAgac do
  begin
    Params.SingleLevel := Boolean(FOpenMamulAgac_SingleLevel);
    Params.ReturnPhantom := Boolean(FOpenMamulAgac_ReturnPhantom);
    Params.ReturnRoute := Boolean(FOpenMamulAgac_ReturnRoute);
    Params.ReturnProcess := Boolean(FOpenMamulAgac_ReturnProcess);
    Params.CalcScrap := FOpenMamulAgac_CalcScrap;
    Params.Round := Boolean(FOpenMamulAgac_Round);
    Params.KullanimGrupNo := FOpenMamulAgac_KullanimGrupNo;
    Params.TopluIslem := Boolean(FOpenMamulAgac_TopluIslem);
    dcMaliyet.Params.Tarih := FOpenMamulAgac_Tarih;
    dcMaliyet.Params.MaliyetTip := TAppMaliyetTip(FOpenMamulAgac_MaliyetTip);
    dcMaliyet.Params.DefterTip := FOpenMamulAgac_DefterTip;
    dcMaliyet.Params.KirilimVersiyonNo := FOpenMamulAgac_MaliyetKirilimVersiyonNo;
    dcMaliyet.Params.MYBasTarih := FOpenMamulAgac_MYBasTarih;
    dcMaliyet.Params.FiyatSablonNo := FOpenMamulAgac_FiyatSablonNo;
    dcMaliyet.Params.FiyatSekli := FOpenMamulAgac_FiyatSekli;
    dcMaliyet.Params.Banka := FOpenMamulAgac_Banka;
    dcMaliyet.Params.DovizTip := FOpenMamulAgac_DovizTip;
    dcMaliyet.Params.DovizTarih := FOpenMamulAgac_DovizTarih;
    Start;
    try
      ExpandList(FOpenMamulAgac_StokKart_FilterText, FOpenMamulAgac_Tarih);
    finally
      Finish;
    end;
  end;
  ChildMamulAgac.ShowChild;
end;

procedure TAppDOPMamulKart.OpenKullanimAgacClick(Sender: TObject);
  function GetParams: Boolean;
  begin
    ParamsWindow.Items.Clear;
    with ParamsWindow.Items.Add do
    begin
      Name := 'CALCSCRAP';
      Caption := 'Fireyi Ekle';
      Value := FOpenMamulAgac_CalcScrap;
      EditPropertiesClass := TcxCheckBoxProperties;
    end;
    with ParamsWindow.Items.Add do
    begin
      Name := 'ROUND';
      Caption := 'Yuvarla';
      Value := FOpenMamulAgac_Round;
      EditPropertiesClass := TcxCheckBoxProperties;
    end;
    ParamsWindow.Caption := 'Kullaným Yeri Parametreleri';
    Result := ParamsWindow.Execute;
    if Result then
    begin
      FOpenMamulAgac_CalcScrap := ParamsWindow['CALCSCRAP'];
      FOpenMamulAgac_Round := ParamsWindow['ROUND'];
    end;
  end;
var
  AMalKod, AVersiyonNo, AKullanimKod, ABirim: String;
  ASurumNo: Integer;
begin
  if not GetParams then
    Exit;
  with DataApp.KullanimAgac.dcMamulAgac do
  begin
    Params.CalcScrap := FOpenMamulAgac_CalcScrap;
    Params.Round := Boolean(FOpenMamulAgac_Round);
    Params.KullanimGrupNo := 0;

    AKullanimKod := DataApp.MamulBaslik.Table.KullanimKod;
    if DocObject.ActiveChild = ChildMamulKart then
    begin
      AMalKod := DataApp.MamulKart.Table.HammaddeKod;
      AVersiyonNo := DataApp.MamulKart.Table.HammaddeVersiyonNo;
      ASurumNo := DataApp.MamulKart.Table.HammaddeSurumNo;
      ABirim := DataApp.MamulKart.Table.HammaddeBirim;
    end else
    begin
      AMalKod := DataApp.MamulBaslik.Table.MamulKod;
      AVersiyonNo := DataApp.MamulBaslik.Table.VersiyonNo;
      ASurumNo := DataApp.MamulBaslik.Table.SurumNo;
      ABirim := DataApp.MamulBaslik.Table.Birim;
    end;
    
    Start;
    try
      WhereUsed(AMalKod, AVersiyonNo, AKullanimKod, ASurumNo, Date, 1, ABirim);
    finally
      Finish;
    end;
  end;
  ChildKullanimAgac.ShowChild;
end;

procedure TAppDOPMamulKart.IncReceteNoOnClick(Sender: TObject);
begin
  IncNoWindow.Execute(DataApp.MamulBaslik.RuleIncReceteNo);
end;

procedure TAppDOPMamulKart.OpenMaliyetListForUretClick(Sender: TObject);
begin
  if not OpenMamulAgac_GetParams('MALIYET') then
    Exit;
  Show_StokKart_AdvKriter(False);
  with DataApp.MaliyetList.dcMamulAgac do
  begin
    GosterimTip := 1;
    Params.SingleLevel := Boolean(FOpenMamulAgac_SingleLevel);
    Params.ReturnPhantom := false;
    Params.ReturnRoute := false;
    Params.ReturnProcess := false;
    Params.CalcScrap := FOpenMamulAgac_CalcScrap;
    Params.Round := Boolean(FOpenMamulAgac_Round);
    Params.KullanimGrupNo := FOpenMamulAgac_KullanimGrupNo;
    Params.TopluIslem := Boolean(FOpenMamulAgac_TopluIslem);

    dcMaliyet.Params.Tarih := FOpenMamulAgac_Tarih;
    dcMaliyet.Params.MaliyetTip := TAppMaliyetTip(FOpenMamulAgac_MaliyetTip);
    dcMaliyet.Params.DefterTip := FOpenMamulAgac_DefterTip;
    dcMaliyet.Params.KirilimVersiyonNo := FOpenMamulAgac_MaliyetKirilimVersiyonNo;
    dcMaliyet.Params.MYBasTarih := FOpenMamulAgac_MYBasTarih;
    dcMaliyet.Params.FiyatSablonNo := FOpenMamulAgac_FiyatSablonNo;
    dcMaliyet.Params.FiyatSekli := FOpenMamulAgac_FiyatSekli;
    dcMaliyet.Params.Banka := FOpenMamulAgac_Banka;
    dcMaliyet.Params.DovizTip := FOpenMamulAgac_DovizTip;
    dcMaliyet.Params.DovizTarih := FOpenMamulAgac_DovizTarih;
    dcMaliyet.Params.YeniFiyatKaydet := Boolean(FOpenMamulAgac_YeniFiyatKaydet);
    dcMaliyet.Params.YeniFiyatSablonNo := FOpenMamulAgac_YeniFiyatSablonNo;
    dcMaliyet.Params.YeniFiyatSekli := FOpenMamulAgac_YeniFiyatSekli;

    DataApp.MaliyetList.Table.DisableControls;
    if DataApp.MaliyetList.Table.LookupTableItems[0] <> nil then
      DataApp.MaliyetList.Table.LookupTableItems[0].Rule.Enabled := False;
    try
      ExpandList(FOpenMamulAgac_StokKart_FilterText, FOpenMamulAgac_Tarih);
    finally
      DataApp.MaliyetList.Table.EnableControls;
    end;

  end;
  ChildMaliyetList.ShowChild;
end;

procedure TAppDOPMamulKart.OpenMaliyetListForZeroClick(Sender: TObject);
begin
  if not OpenMamulAgac_GetParams('MALIYET') then
    Exit;
  Show_StokKart_AdvKriter(False);
  with DataApp.MaliyetList.dcMamulAgac do
  begin
    GosterimTip := 2;
    Params.SingleLevel := Boolean(FOpenMamulAgac_SingleLevel);
    Params.ReturnPhantom := false;
    Params.ReturnRoute := false;
    Params.ReturnProcess := false;
    Params.CalcScrap := FOpenMamulAgac_CalcScrap;
    Params.Round := Boolean(FOpenMamulAgac_Round);
    Params.KullanimGrupNo := FOpenMamulAgac_KullanimGrupNo;
    Params.TopluIslem := Boolean(FOpenMamulAgac_TopluIslem);
    dcMaliyet.Params.Tarih := FOpenMamulAgac_Tarih;
    dcMaliyet.Params.MaliyetTip := TAppMaliyetTip(FOpenMamulAgac_MaliyetTip);
    dcMaliyet.Params.DefterTip := FOpenMamulAgac_DefterTip;
    dcMaliyet.Params.KirilimVersiyonNo := FOpenMamulAgac_MaliyetKirilimVersiyonNo;
    dcMaliyet.Params.MYBasTarih := FOpenMamulAgac_MYBasTarih;
    dcMaliyet.Params.FiyatSablonNo := FOpenMamulAgac_FiyatSablonNo;
    dcMaliyet.Params.FiyatSekli := FOpenMamulAgac_FiyatSekli;
    dcMaliyet.Params.Banka := FOpenMamulAgac_Banka;
    dcMaliyet.Params.DovizTip := FOpenMamulAgac_DovizTip;
    dcMaliyet.Params.DovizTarih := FOpenMamulAgac_DovizTarih;
    dcMaliyet.Params.YeniFiyatKaydet := Boolean(FOpenMamulAgac_YeniFiyatKaydet);
    dcMaliyet.Params.YeniFiyatSablonNo := FOpenMamulAgac_YeniFiyatSablonNo;
    dcMaliyet.Params.YeniFiyatSekli := FOpenMamulAgac_YeniFiyatSekli;
    DataApp.MaliyetList.Table.DisableControls;
    if DataApp.MaliyetList.Table.LookupTableItems[0] <> nil then
      DataApp.MaliyetList.Table.LookupTableItems[0].Rule.Enabled := True;
    try
      ExpandList(FOpenMamulAgac_StokKart_FilterText, FOpenMamulAgac_Tarih);
    finally
      DataApp.MaliyetList.Table.EnableControls;
    end;
  end;
  ChildMaliyetList.ShowChild;
end;

initialization
  AppRegisterDOPClass(TAppDOPMamulKart);

end.
