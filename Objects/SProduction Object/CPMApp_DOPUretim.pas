unit CPMApp_DOPUretim;

interface

uses Classes, SysUtils, DB,
  CPMApp_DataObject, CPMApp_DataApp,  CPMApp_DocApp, CPMApp_DocObjectModel,
  CPMApp_Rule_FieldValidate,
  CPMApp_DOPCustomUretim, CPMApp_DAPCustomUretim, CPMApp_Storage,
  CPMApp_DocChildGrid, CPMApp_DocChildVGrid, CPMApp_DocChildMultiVGrid, CPMApp_DocChildSearchTable,
  CPMApp_DocChildMasterDetail, CPMApp_DocChildTreeList, CPMApp_DocChildDefaultValue,
  CPMApp_TableUretimSystem, CPMApp_TableStokSystem, CPMApp_TableCariSystem,
  dxBar, dxBarExtItems, cxDBTL, cxGraphics, cxTL, cxTLData, Graphics, CPMApp_DataControllerEvrakIslem,
  CPMApp_DocChildUretimAjan, CPMApp_DocChildUretimKartAjan, CPMApp_DocChildEvrakOzelBaglanti;

type
  TAppDOPUretim = class(TAppDOPCustomUretim)
  private
    FChildUretimBaslik: TAppDocChildMultiVGrid;
    FChildUretimKart: TAppDocChildGrid;
    FChildMamulStokKart: TAppDocChildVGrid;
    FChildUretimHareket: TAppDocChildTreeList;
    FChildMamulKart: TAppDocChildGrid;
    FGirisCikisListColumn: TcxDBTreeListColumn;
    FTipListColumn: TcxDBTreeListColumn;
    FChildEvrakBaslik: TAppDocChildGrid;
    FChildStokHareket: TAppDocChildGrid;
    FChildStokDurum: TAppDocChildGrid;
    FChildDefaultValue: TAppDocChildDefaultValue;
    FChildMamulIhtiyac: TAppDocChildSearchTable;
    FChildHammaddeIhtiyac: TAppDocChildSearchTable;
    FChildStokLotDurum: TAppDocChildGrid;
    FChildUretimRota: TAppDocChildGrid;
    FChildUretimRotaKaynak: TAppDocChildGrid;
    FChildUretimKaynakTahsisat: TAppDocChildGrid;
    FChildEvrakKaynak: TAppDocChildGrid;
    FChildUretimBaglanti: TAppDocChildGrid;
    FChildUretimKartAjan: TAppDocChildUretimKartAjan;
    FChildUretimAjan: TAppDocChildUretimAjan;
    FChildUretimOzelBaglanti: TAppDocChildEvrakOzelBaglanti;
    FChildDepoBaslik: TAppDocChildGrid;
    FChildDepoTransfer: TAppDocChildGrid;
    btUseLot: TdxBarButton;
    btAutoLot: TdxBarButton;
    // Rules
    procedure TreeListCustomDrawDataCell(
      Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    // Click Events
    procedure UretimNoIncClick(Sender: TObject);
    procedure EvrakNoIncClick(Sender: TObject);
    procedure MamulAgacKartClick(Sender: TObject);
    procedure ChildMamulIhtiyacOnDblClick(Sender: TObject);
    procedure HammaddeIhtiyacOlusturClick(Sender: TObject);
    procedure HammaddeIhtiyacTeklifOlusturClick(Sender: TObject);
    procedure AddLotsClick(Sender: TObject);
    procedure TransferEmriOlusturClick(Sender: TObject);
    // Click Events
    procedure TransferEmriOlustur;
    procedure UseLotOnClick(Sender: TObject);
    procedure AutoLotOnClick(Sender: TObject);
    procedure UretimKartSecimClick(Sender: TObject);
    procedure StokHareketAlanSecimClick(Sender: TObject);
    // Create Childs;
    procedure CreateChildUretimBaslik;
    procedure CreateChildUretimKart;
    procedure CreateChildUretimHareket;
    procedure CreateChildUretimBaglanti;
    procedure CreateChildMamulKart;
    procedure CreateChildMamulStokKart;
    procedure CreateChildEvrakBaslik;
    procedure CreateChildStokHareket;
    procedure CreateChildStokDurum;
    procedure CreateChildEvrakKaynak;
    procedure CreteChildDefaultValue;
    procedure CreateChildMamulIhtiyac;
    procedure CreateChildHammaddeIhtiyac;
    procedure CreateChildStokLotDurum;
    procedure CreateChildUretimRota;
    procedure CreateChildUretimRotaKaynak;
    procedure CreateChildUretimKaynakTahsisat;
    procedure CreateChildUretimAjan;
    procedure CreateChildUretimKartAjan;
    procedure CreateChildUretimOzelBaglanti;
    procedure CreateChildDepoBaslik;
    procedure CreateChildDepoTransfer;
    // Procededure
  protected
    procedure DoAfterActive; override;
    procedure CreateDocChilds; override;
    procedure CreateMenuItems; override;
    procedure SetDAPSecurity; override;
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure Finalize(IniFile: TAppIniFile); override;
    procedure SetReport; override;
  public
    constructor Create(AOwner: TComponent; const aApplicationName: String); override;
    destructor Destroy; override;
  published
    property ChildUretimBaslik: TAppDocChildMultiVGrid read FChildUretimBaslik;
    property ChildUretimKart: TAppDocChildGrid read FChildUretimKart;
    property ChildUretimHareket: TAppDocChildTreeList read FChildUretimHareket;
    property ChildUretimBaglanti: TAppDocChildGrid read FChildUretimBaglanti;
    property ChildMamulKart: TAppDocChildGrid read FChildMamulKart;
    property ChildMamulStokKart: TAppDocChildVGrid read FChildMamulStokKart;
    property ChildEvrakBaslik: TAppDocChildGrid read FChildEvrakBaslik;
    property ChildStokHareket: TAppDocChildGrid read FChildStokHareket;
    property ChildEvrakKaynak: TAppDocChildGrid read FChildEvrakKaynak;
    property ChildStokDurum: TAppDocChildGrid read FChildStokDurum;
    property ChildStokLotDurum: TAppDocChildGrid read FChildStokLotDurum;
    property ChildDefaultValue: TAppDocChildDefaultValue read FChildDefaultValue;
    property ChildMamulIhtiyac: TAppDocChildSearchTable read FChildMamulIhtiyac;
    property ChildHammaddeIhtiyac: TAppDocChildSearchTable read FChildHammaddeIhtiyac;
    property ChildUretimRota: TAppDocChildGrid read FChildUretimRota ;
    property ChildUretimRotaKaynak: TAppDocChildGrid read FChildUretimRotaKaynak;
    property ChildUretimKaynakTahsisat: TAppDocChildGrid read FChildUretimKaynakTahsisat;
    property ChildUretimAjan: TAppDocChildUretimAjan read FChildUretimAjan;
    property ChildUretimKartAjan: TAppDocChildUretimKartAjan read FChildUretimKartAjan;
    property ChildUretimOzelBaglanti: TAppDocChildEvrakOzelBaglanti read FChildUretimOzelBaglanti;
    property ChildDepoBaslik: TAppDocChildGrid read FChildDepoBaslik;
    property ChildDepoTransfer: TAppDocChildGrid read FChildDepoTransfer;
  end;

implementation

uses Variants, CPMApp_DataObjectDB, CPMApp_Dialogs, CPMApp_TableItems, Dialogs,
  CPMApp_DataControllerFiyat, CPMApp_BOMConsts, CPMApp_DataControllerUretim,
  CPMApp_Security, CPMApp_TreeHelper;

{ TAppDOPUretim }

procedure TAppDOPUretim.CreateChildUretimKart;
begin
  FChildUretimKart := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimKart') as TAppDocChildGrid;
  FChildUretimKart.Caption := 'Üretim Emirleri';
  FChildUretimKart.TableObject := DataApp.UretimKart.Table;

  FChildUretimKart.CreateButton('btUretimKart', 'Üretim Emirleri', 'Sayfalar');

  DocObject.Macros.AddObject(FChildUretimKart, 'ChildUretimKart');
  DocObject.Macros.AddObject(DataApp.UretimKart, 'UretimKart');
end;

procedure TAppDOPUretim.CreateChildUretimAjan;
begin
  FChildUretimAjan := DocObject.CreateChild(TAppDocChildUretimAjan, 'ChildUretimAjan') as TAppDocChildUretimAjan;

  FChildUretimAjan.EvrakTip := DataApp.ParamsUretim.EvrakTip;
  FChildUretimAjan.TableUretimBaslik := DataApp.UretimBaslik.Table;
  FChildUretimAjan.TableUretimKart := DataApp.UretimKart.Table;

  DocObject.Macros.AddObject(FChildUretimAjan, 'ChildUretimAjan');
end;

procedure TAppDOPUretim.CreateChildUretimKartAjan;
begin
  FChildUretimKartAjan := DocObject.CreateChild(TAppDocChildUretimKartAjan, 'ChildUretimKartAjan') as TAppDocChildUretimKartAjan;

  FChildUretimKartAjan.EvrakTip := DataApp.ParamsUretim.EvrakTip;
  FChildUretimKartAjan.TableUretimKart := DataApp.UretimKart.Table;

  DocObject.Macros.AddObject(FChildUretimKartAjan, 'ChildUretimKartAjan');
end;

procedure TAppDOPUretim.CreateChildUretimBaglanti;
begin
  FChildUretimBaglanti := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimBaglanti') as TAppDocChildGrid;
  FChildUretimBaglanti.FormName := 'UretimBaglantiForm';
  FChildUretimBaglanti.GridName := 'grUretimBaglanti';
  FChildUretimBaglanti.Caption := 'Üretim Baðlantý';
  FChildUretimBaglanti.PipelineName := 'ppUretimBaglanti';
  FChildUretimBaglanti.TableObject := DataApp.UretimBaglanti.Table;

  FChildUretimBaglanti.CreateButton('btUretimBaglanti', 'Üretim Baðlantý', 'Sayfalar');

  DocObject.Macros.AddObject(ChildUretimBaglanti, 'ChildUretimBaglanti');
  DocObject.Macros.AddObject(DataApp.UretimBaglanti, 'UretimBaglanti');
end;

procedure TAppDOPUretim.CreateChildUretimBaslik;
begin
  FChildUretimBaslik := DocObject.CreateChild(TAppDocChildMultiVGrid, 'ChildUretimBaslik') as TAppDocChildMultiVGrid;
  FChildUretimBaslik.Caption := 'Üretim Baþlýk';
  FChildUretimBaslik.TableObject := DataApp.UretimBaslik.Table;

  FChildUretimBaslik.CreateButton('btUretimBaslik', 'Üretim Baþlýk', 'Sayfalar');

  DocObject.Macros.AddObject(FChildUretimBaslik, 'ChildUretimBaslik');
  DocObject.Macros.AddObject(DataApp.UretimBaslik, 'UretimBaslik');
end;

procedure TAppDOPUretim.CreateDocChilds;
begin
  inherited;
  CreateChildUretimBaslik;
  CreateChildUretimKart;
  CreateChildMamulKart;
  CreateChildUretimBaglanti;
  CreateChildUretimHareket;
  CreateChildMamulStokKart;
  CreateChildEvrakBaslik;
  CreateChildStokHareket;
  CreateChildStokDurum;
  CreateChildEvrakKaynak;
  CreteChildDefaultValue;
  CreateChildMamulIhtiyac;
  CreateChildHammaddeIhtiyac;
  CreateChildStokLotDurum;
  CreateChildUretimRota;
  CreateChildUretimRotaKaynak;
  CreateChildUretimKaynakTahsisat;
  CreateChildUretimAjan;
  CreateChildUretimKartAjan;
  CreateChildUretimOzelBaglanti;
  CreateChildDepoBaslik;
  CreateChildDepoTransfer;
end;

procedure TAppDOPUretim.CreateMenuItems;
var
  suAyarlar, suAraclar: TdxBarSubItem;
begin
  inherited;
  suAyarlar := TdxBarSubItem(DocObject.DocBar.BarManager.GetItemByName('suAyarlar'));
  suAraclar := TdxBarSubItem(DocObject.DocBar.BarManager.GetItemByName('suAraclar'));

  DocObject.DocBar.CreateButton('btIncUretimNo', 'Üretim No Seri Ayarlarý', 'Ayarlar', suAyarlar, '', UretimNoIncClick);
  DocObject.DocBar.CreateButton('btIncEvrakNo', 'Evrak No Seri Ayarlarý', 'Ayarlar', suAyarlar, '', EvrakNoIncClick);
  DocObject.DocBar.CreateButton('btPrepareUretimHareket', 'Üretim Hareketlerini Oluþtur', 'Araçlar', suAraclar, 'F5', MamulAgacKartClick);
  DocObject.DocBar.CreateButton('btHammaddeIhtiyacOlustur', 'Hammadde Ýhtiyaçlarýný Oluþtur', 'Araçlar', suAraclar, '', HammaddeIhtiyacOlusturClick);
  DocObject.DocBar.CreateButton('btHammaddeIhtiyacTeklifOlustur', 'Hammadde Ýhtiyaçlarýný Teklif Oluþtur', 'Araçlar', suAraclar, '', HammaddeIhtiyacTeklifOlusturClick);
  DocObject.DocBar.CreateButton('btAddLots', 'Lotlarý düzenle', 'Araçlar', suAraclar, '', AddLotsClick);
  DocObject.DocBar.CreateButton('btTransferEmriOlustur', 'Transfer Emri Oluþtur', 'Araçlar', suAraclar, '', TransferEmriOlusturClick);

  DocObject.DocBar.CreateButton('btUretimKartAlanSecim', 'Üretim Kart Alan Seçimi', 'Ayarlar', suAyarlar, '', UretimKartSecimClick);
  DocObject.DocBar.CreateButton('btStokHareketAlanSecim', 'Stok Hareket Alan Seçimi', 'Ayarlar', suAyarlar, '', StokHareketAlanSecimClick);

  btUseLot := DocObject.DocBar.CreateButton('btUseLot', 'Lot Kullan', 'Ayarlar', suAyarlar, '', UseLotOnClick);
  btUseLot.ButtonStyle := bsChecked;
  btAutoLot := DocObject.DocBar.CreateButton('btAutoLot', 'Otomatik Lot Durumu', 'Ayarlar', suAyarlar, '', AutoLotOnClick);
  btAutoLot.ButtonStyle := bsChecked;
end;

procedure TAppDOPUretim.Initialize(IniFile: TAppIniFile);
begin
  inherited;
  btUseLot.Down := IniFile.ReadBool('PARAMS', 'USELOT', False);
  DataApp.DataControllerUretim.Params.UseLot := btUseLot.Down;
  btAutoLot.Down := IniFile.ReadBool('PARAMS', 'AUTOLOT', False);
  DataApp.DataControllerUretim.Params.AutoLot := btAutoLot.Down;
end;

procedure TAppDOPUretim.Finalize(IniFile: TAppIniFile);
begin
  inherited;
  IniFile.WriteBool('PARAMS', 'USELOT', btUseLot.Down);
  IniFile.WriteBool('PARAMS', 'AUTOLOT', btAutoLot.Down);
end;

procedure TAppDOPUretim.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.UretimKart.Table, 'URTKRT', 'Üretim Kart');
  Security.AddTable(DataApp.StokHareket.Table, 'STKHAR', 'Stok Hareket');
  Security.AddTable(DataApp.EvrakBaslik.Table, 'EVRBAS', 'Evrak Baþlýk');
end;

procedure TAppDOPUretim.SetReport;
begin
  inherited;
  DocObject.Report.MainTable := DataApp.UretimKart.Table;
end;

procedure TAppDOPUretim.StokHareketAlanSecimClick(Sender: TObject);
begin
  DataApp.StokHareket.ShowFieldSettings('Stok Hareket Alan Seçimi...', 'TableStokHareket');
end;

destructor TAppDOPUretim.Destroy;
begin
  inherited;
end;

procedure TAppDOPUretim.CreateChildMamulStokKart;
begin
  FChildMamulStokKart := DocObject.CreateChild(TAppDocChildVGrid, 'ChildMamulStokKart') as TAppDocChildVGrid;
  FChildMamulStokKart.Caption := 'Mamül Stok Kart';
  FChildMamulStokKart.TableObject := DataApp.MamulStokKart.Table;
  FChildMamulStokKart.ReadOnly := True;

  FChildMamulStokKart.CreateButton('btMamulStokKart', 'Mamül Stok Kartý', 'Sayfalar');

  DocObject.Macros.AddObject(FChildMamulStokKart, 'ChildMamulStokKart');
end;

procedure TAppDOPUretim.UretimKartSecimClick(Sender: TObject);
begin
  DataApp.UretimKart.ShowFieldSettings('Üretim Kart Alan Seçimi...', 'TableUretimKart');
end;

procedure TAppDOPUretim.UretimNoIncClick(Sender: TObject);
begin
  IncNoWindow.Execute(DataApp.UretimBaslik.RuleIncrementUretimNo);
end;

procedure TAppDOPUretim.UseLotOnClick(Sender: TObject);
begin
  DataApp.DataControllerUretim.Params.UseLot := btUseLot.Down;
end;

procedure TAppDOPUretim.CreateChildUretimHareket;
begin
  FChildUretimHareket := DocObject.CreateChild(TAppDocChildTreeList, 'ChildUretimHareket') as TAppDocChildTreeList;
  FChildUretimHareket.Caption := 'Üretim Ýþ Akýþý';
  FChildUretimHareket.TableObject := DataApp.UretimHareket.Table;

  FChildUretimHareket.CreateButton('btUretimHareket', 'Üretim Ýþ Akýþý', 'Sayfalar');

  FChildUretimHareket.TreeList.DataController.KeyField := 'SIRANO';
  FChildUretimHareket.TreeList.DataController.ParentField := 'ANASIRANO';

  DocObject.Macros.AddObject(FChildUretimHareket, 'ChildUretimHareket');
  DocObject.Macros.AddObject(DataApp.UretimHareket, 'UretimHareket');
end;

procedure TAppDOPUretim.MamulAgacKartClick(Sender: TObject);
begin
  DataApp.DataControllerUretim.AddAll;
end;

procedure TAppDOPUretim.CreateChildMamulKart;
begin
  FChildMamulKart := DocObject.CreateChild(TAppDocChildGrid, 'ChildMamulKart') as TAppDocChildGrid;
  FChildMamulKart.Caption := 'Mamül Kartý';
  FChildMamulKart.TableObject := DataApp.DataControllerUretim.AnaMamulKart.TableClone; //DataApp.MamulKart.Table;
  FChildMamulKart.ReadOnly := False;

  FChildMamulKart.CreateButton('btMamulKart', 'Mamül Kartý', 'Sayfalar');

  DocObject.Macros.AddObject(FChildMamulKart, 'ChildMamulKart');
end;

procedure TAppDOPUretim.DoAfterActive;
begin
  inherited;
  FGirisCikisListColumn := AppTreeHelper.FindColumn(ChildUretimHareket.TreeList, 'GIRISCIKIS');
  FTipListColumn := AppTreeHelper.FindColumn(ChildUretimHareket.TreeList, 'TIP');
  if FGirisCikisListColumn <> nil then
    ChildUretimHareket.TreeList.OnCustomDrawDataCell := TreeListCustomDrawDataCell;
end;

procedure TAppDOPUretim.TransferEmriOlustur;
begin

end;

procedure TAppDOPUretim.TransferEmriOlusturClick(Sender: TObject);
begin
  TransferEmriOlustur;
end;

procedure TAppDOPUretim.TreeListCustomDrawDataCell(Sender: TcxCustomTreeList;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Node.Values[FTipListColumn.ItemIndex] = 1 then
  begin
    ACanvas.Font.Style :=  ACanvas.Font.Style + [fsBold];
    ACanvas.Font.Color := clBlue;
  end
  else begin
    if AViewInfo.Node.Values[FGirisCikisListColumn.ItemIndex] = 0 then
      ACanvas.Font.Style :=  ACanvas.Font.Style + [fsBold]
    else
      ACanvas.Font.Style := ACanvas.Font.Style - [fsBold];
  end;
end;

procedure TAppDOPUretim.CreateChildEvrakBaslik;
begin
  FChildEvrakBaslik := DocObject.CreateChild(TAppDocChildGrid, 'ChildEvrakBaslik') as TAppDocChildGrid;
  FChildEvrakBaslik.Caption := 'Evrak Baþlýk';
  FChildEvrakBaslik.TableObject := DataApp.EvrakBaslik.Table;

  FChildEvrakBaslik.CreateButton('btEvrakBaslik', 'Evrak Baþlýk', 'Sayfalar');

  DocObject.Macros.AddObject(FChildEvrakBaslik, 'ChildEvrakBaslik');
  DocObject.Macros.AddObject(DataApp.EvrakKaynak, 'EvrakBaslik');
end;

procedure TAppDOPUretim.CreateChildEvrakKaynak;
begin
  FChildEvrakKaynak := DocObject.CreateChild(TAppDocChildGrid, 'ChildKaynak') as TAppDocChildGrid;
  FChildEvrakKaynak.FormName := 'EvrakKaynakForm';
  FChildEvrakKaynak.GridName := 'grEvrakKaynak';
  FChildEvrakKaynak.Caption := 'Evrak Kaynak';
  FChildEvrakKaynak.PipelineName := 'ppEvrakKaynak';
  FChildEvrakKaynak.TableObject := DataApp.EvrakKaynak.Table;

  FChildEvrakKaynak.CreateButton('btEvrakKaynak', 'Evrak Kaynak', 'Sayfalar');

  DocObject.Macros.AddObject(ChildEvrakKaynak, 'ChildEvrakKaynak');
  DocObject.Macros.AddObject(DataApp.EvrakKaynak, 'EvrakKaynak');
end;

procedure TAppDOPUretim.CreateChildStokHareket;
begin
  FChildStokHareket := DocObject.CreateChild(TAppDocChildGrid, 'ChildStokHareket') as TAppDocChildGrid;
  FChildStokHareket.Caption := 'Üretim Hareketleri';
  FChildStokHareket.TableObject := DataApp.StokHareket.Table;
  FChildStokHareket.ReadOnly := False;

  FChildStokHareket.CreateButton('btStokHareket', 'Üretim Hareketleri', 'Sayfalar');

  DocObject.Macros.AddObject(FChildStokHareket, 'ChildStokHareket');
  DocObject.Macros.AddObject(DataApp.StokHareket, 'StokHareket');
end;

procedure TAppDOPUretim.CreateChildDepoBaslik;
begin
  FChildDepoBaslik := DocObject.CreateChild(TAppDocChildGrid, 'ChildDepoBaslik') as TAppDocChildGrid;
  FChildDepoBaslik.Caption := 'Depo Baþlýk';
  FChildDepoBaslik.TableObject := DataApp.DepoBaslik.Table;

  FChildDepoBaslik.CreateButton('btDepoBaslik', 'Depo Baþlýk', 'Sayfalar');

  DocObject.Macros.AddObject(FChildDepoBaslik, 'ChildDepoBaslik');
  DocObject.Macros.AddObject(DataApp.DepoBaslik, 'DepoBaslik');
end;

procedure TAppDOPUretim.CreateChildDepoTransfer;
begin
  FChildDepoTransfer := DocObject.CreateChild(TAppDocChildGrid, 'ChildDepoTransfer') as TAppDocChildGrid;
  FChildDepoTransfer.Caption := 'Depo Transfer';
  FChildDepoTransfer.TableObject := DataApp.DepoTransfer.Table;
  FChildDepoTransfer.ReadOnly := False;

  FChildDepoTransfer.CreateButton('btDepoTransfer', 'Depo Transfer', 'Sayfalar');

  DocObject.Macros.AddObject(FChildDepoTransfer, 'ChildDepoTransfer');
  DocObject.Macros.AddObject(DataApp.DepoTransfer, 'DepoTransfer');
end;

procedure TAppDOPUretim.EvrakNoIncClick(Sender: TObject);
begin
  IncNoWindow.Execute(DataApp.UretimKart.RuleEvrakNo);
end;

procedure TAppDOPUretim.CreateChildStokDurum;
begin
  FChildStokDurum := DocObject.CreateChild(TAppDocChildGrid, 'ChildStokDurum') as TAppDocChildGrid;
  FChildStokDurum.Caption := 'Stok Durum';
  FChildStokDurum.TableObject := DataApp.StokDurum.Table;

  FChildStokDurum.CreateButton('btStokDurum', 'Stok Durum', 'Sayfalar');

  DocObject.Macros.AddObject(FChildStokDurum, 'ChildStokDurum');
end;

procedure TAppDOPUretim.CreteChildDefaultValue;
begin
  FChildDefaultValue := DocObject.CreateChild(TAppDocChildDefaultValue, 'FChildDefaultValue') as TAppDocChildDefaultValue;
  FChildDefaultValue.Caption := 'Öndeðer';

  FChildDefaultValue.CreateButton('btDefaultValue', 'Öndeðer Sayfasý', 'Sayfalar');

  FChildDefaultValue.MasterTable := DataApp.UretimBaslik.Table;

  DocObject.Macros.AddObject(FChildDefaultValue, 'ChildDefaultValue');
end;

constructor TAppDOPUretim.Create(AOwner: TComponent;
  const aApplicationName: String);
begin
  inherited;
end;

procedure TAppDOPUretim.CreateChildMamulIhtiyac;
begin
  FChildMamulIhtiyac := DocObject.CreateChild(TAppDocChildSearchTable, 'ChildMamulIhtiyac') as TAppDocChildSearchTable;
  FChildMamulIhtiyac.AppName := Self.AppName +  '\EvrakMamulIhtiyac';
  FChildMamulIhtiyac.FormName := 'EvrakMamulIhtiyacForm';
  FChildMamulIhtiyac.Caption := 'Mamül Ýhtiyacý';

  FChildMamulIhtiyac.CreateButton('btEvrakMamulIhtiyac', 'Mamül Ýhtiyaçý', 'Sayfalar', 'Ctrl+I');

  FChildMamulIhtiyac.Table.TableItems.TableNames := VarArrayOf(['VW_STOKIHTIYAC','STKKRT']);
  FChildMamulIhtiyac.Table.TableItems.TableAlias := VarArrayOf(['STKIHT','STKKRT']);
  FChildMamulIhtiyac.Table.TableItems.TableReferans := VarArrayOf(['STKIHT','STKKRT']);
  FChildMamulIhtiyac.Table.TableItems.TableCaptions := VarArrayOf(['Stok Ihtiyaç','Stok Kart']);

  //STKHAR
  with FChildMamulIhtiyac.Table.TableItems[0] do
  begin
    Fields.FieldNames := VarArrayOf(['*']);
    with Where do
    begin
      Add('SIRKETNO', wcEqual, DataApp.CompanyNo);
      AddOperator(woAnd);
      //AddText('STKIHT.IHTIYACSTOK >= STKIHT.MINSTOKMIKTAR');
      AddText('STKIHT.IHTIYACGENEL > 0');
      AddOperator(woAnd);
      AddText('STKIHT.MALKOD IN (SELECT MAMBAS.MAMULKOD FROM MAMBAS)');
    end;
  end;
  // STKKRT
  with FChildMamulIhtiyac.Table.TableItems[1] do
  begin
    Fields.FieldNames := VarArrayOf(['MALAD']);
    Join.Add('MALKOD', 'MALKOD');
  end;
  FChildMamulIhtiyac.GridView.OnDblClick := ChildMamulIhtiyacOnDblClick;
  DocObject.Macros.AddObject(FChildMamulIhtiyac, 'ChildMamulIhtiyac');
end;

procedure TAppDOPUretim.AutoLotOnClick(Sender: TObject);
begin
  DataApp.DataControllerUretim.Params.AutoLot := btAutoLot.Down;
end;

procedure TAppDOPUretim.ChildMamulIhtiyacOnDblClick(Sender: TObject);
begin

end;

procedure TAppDOPUretim.CreateChildHammaddeIhtiyac;
begin
  FChildHammaddeIhtiyac := DocObject.CreateChild(TAppDocChildSearchTable, 'ChildHammaddeIhtiyac') as TAppDocChildSearchTable;
  FChildHammaddeIhtiyac.AppName := Self.AppName +  '\EvrakHammaddeIhtiyac';
  FChildHammaddeIhtiyac.FormName := 'EvrakHammaddeIhtiyacForm';
  FChildHammaddeIhtiyac.Caption := 'Hammadde Ýhtiyaçý';

  FChildHammaddeIhtiyac.CreateButton('btEvrakHammaddeIhtiyac', 'Hammadde Ýhtiyaçý', 'Sayfalar', '');

  FChildHammaddeIhtiyac.Table.TableItems.TableNames := VarArrayOf(['VW_STOKIHTIYAC','STKKRT']);
  FChildHammaddeIhtiyac.Table.TableItems.TableAlias := VarArrayOf(['STKIHT','STKKRT']);
  FChildHammaddeIhtiyac.Table.TableItems.TableReferans := VarArrayOf(['STKIHT','STKKRT']);
  FChildHammaddeIhtiyac.Table.TableItems.TableCaptions := VarArrayOf(['Stok Ihtiyac','Stok Kart']);

  //STKHAR
  with FChildHammaddeIhtiyac.Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
      AddExpression('CAST(0 AS NUMERIC(25, 6))', 'URETIMKULLANILAN');
      AddExpression('CAST(0 AS NUMERIC(25, 6))', 'URETIMIHTIYAC');
    end;
    with Where do
    begin
      Add('SIRKETNO', wcEqual, DataApp.CompanyNo);
      {AddOperator(woAnd);
      AddText('STKIHT.IHTIYACSTOK >= STKIHT.MINSTOKMIKTAR');]}
      AddOperator(woAnd);
      // KULLANIMSEKLI <> 3 Kullaným þekli farklýdýr Alternatif
      AddText('(STKIHT.MALKOD IN (SELECT MAMKRT.HAMMADDEKOD FROM MAMKRT) AND STKIHT.MALKOD NOT IN (SELECT MAMBAS.MAMULKOD FROM MAMBAS WHERE MAMBAS.KULLANIMSEKLI <> 3))');
    end;
  end;
  // STKKRT
  with FChildHammaddeIhtiyac.Table.TableItems[1] do
  begin
    Fields.FieldNames := VarArrayOf(['MALAD','TEMINYER']);
    Join.Add('MALKOD', 'MALKOD');
  end;
  DocObject.Macros.AddObject(FChildHammaddeIhtiyac, 'ChildHammaddeIhtiyac');
//  FChildHammaddeIhtiyac.GridView.OnDblClick := ChildHammaddeIhtiyacOnDblClick;
end;

procedure TAppDOPUretim.HammaddeIhtiyacOlusturClick(Sender: TObject);
var
  TableHareket: TTableStokHareket;
  TableMamulIhtiyac, TableHammaddeIhtiyac: TAppDBTable;
  AFieldUretimKullanilan, AFieldMaxStokMiktar, AFieldMinAlimMiktar, AFieldMinStokMiktar, AFieldIhtiyacStok, AFieldUretimIhtiyac: TField;
begin
  {
  if not DataApp.UretimKart.Table.IsEmpty then
    DataApp.UretimKart.Table.EmptyTable;
  }
  if not DataApp.UretimBaslik.Table.IsEditMode then
    DataApp.UretimBaslik.Table.Edit;
  if DataApp.UretimKart.Table.IsEmpty then
    if DataApp.UretimBaslik.Table.KullanimSekli <> Integer(uksStokUret) then
      DataApp.UretimBaslik.Table.KullanimSekli := Integer(uksStokUret);
  if DataApp.UretimBaslik.Table.KullanimSekli <> Integer(uksStokUret) then
  begin
    ShowMessage('Kullaným Þeklini Stok + Üret seçiniz!');
    exit;
  end;

  if DataApp.UretimKart.Table.IsEmpty then
  begin
    FChildMamulIhtiyac.Run;
    TableMamulIhtiyac := FChildMamulIhtiyac.Table;
    TableMamulIhtiyac.First;
    while not TableMamulIhtiyac.Eof do
    begin
      if TableMamulIhtiyac['IHTIYACGENEL'] > 0 then
      begin
        DataApp.UretimKart.Table.Append;
        DataApp.UretimKart.Table.MamulKod := TableMamulIhtiyac['MALKOD'];
        DataApp.UretimKart.Table.Miktar := TableMamulIhtiyac['IHTIYACGENEL'];
        DataApp.UretimKart.Table.Post;
      end;
      FChildMamulIhtiyac.Table.Next;
    end;
  end;
  FChildHammaddeIhtiyac.Run;
  TableHammaddeIhtiyac := FChildHammaddeIhtiyac.Table;
  TableHareket := DataApp.StokHareket.Table;

  TableHammaddeIhtiyac.ReadOnly := False;
  TableHammaddeIhtiyac.IndexFieldNames := 'MALKOD';
  TableHammaddeIhtiyac.DisableControls;
  TableHareket.DisableControls;
  AFieldUretimKullanilan := TableHammaddeIhtiyac.FindField('URETIMKULLANILAN');
  AFieldMaxStokMiktar := TableHammaddeIhtiyac.FindField('MAXSTOKMIKTAR');
  AFieldMinAlimMiktar := TableHammaddeIhtiyac.FindField('MINALIMMIKTAR');
  AFieldMinStokMiktar := TableHammaddeIhtiyac.FindField('MINSTOKMIKTAR');
  AFieldIhtiyacStok := TableHammaddeIhtiyac.FindField('IHTIYACSTOK');
  AFieldUretimIhtiyac := TableHammaddeIhtiyac.FindField('URETIMIHTIYAC');
  try
    TableHareket.First;
    while not TableHareket.Eof do
    begin
      if TableHareket.GirisCikis = 1 then
      begin
        if TableHammaddeIhtiyac.FindKey([TableHareket.MalKod]) then
        begin
          TableHammaddeIhtiyac.Edit;
          AFieldUretimKullanilan.AsFloat := AFieldUretimKullanilan.AsFloat + TableHareket.Miktar;
          if AFieldMaxStokMiktar.AsFloat = 0 then
          begin
            if AFieldMinAlimMiktar.AsFloat > AFieldMinStokMiktar.AsFloat + AFieldIhtiyacStok.AsFloat + AFieldUretimKullanilan.AsFloat then
              AFieldUretimIhtiyac.AsFloat := AFieldMinAlimMiktar.AsFloat
            else
              AFieldUretimIhtiyac.AsFloat := AFieldMinStokMiktar.AsFloat + AFieldIhtiyacStok.AsFloat + AFieldUretimKullanilan.AsFloat;
          end
          else
            AFieldUretimIhtiyac.AsFloat := AFieldMaxStokMiktar.AsFloat + AFieldIhtiyacStok.AsFloat + AFieldUretimKullanilan.AsFloat;
          TableHammaddeIhtiyac.Post;
        end;
      end;
      TableHareket.Next;
    end;
    TableHammaddeIhtiyac.First;
    while not TableHammaddeIhtiyac.Eof do
    begin
      if AFieldUretimIhtiyac.AsFloat <= 0 then
        TableHammaddeIhtiyac.Delete
      else
        TableHammaddeIhtiyac.Next;
    end;
  finally
    TableHareket.EnableControls;
    TableHammaddeIhtiyac.EnableControls;
    TableHammaddeIhtiyac.ReadOnly := True;
  end;
  FChildHammaddeIhtiyac.ShowChild;
end;

procedure TAppDOPUretim.HammaddeIhtiyacTeklifOlusturClick(Sender: TObject);
var
  TableBaslik: TTableEvrakBaslik;
  TableHareket: TTableStokHareket;
  FDataControllerCommon: TAppDataControllerEvrakIslem;
  //FDataControllerFiyat: TAppDataControllerBaseFiyat;
  TableHammaddeIhtiyac: TAppDBTable;
  AFieldMalKod, AFieldTeminYer, AFieldUretimIhtiyac: TField;
  ASirketNo, ATeminYer, AEvrakNo, ADepoKod, AFiyatSekli, AEvrakHazirlayan: string;
  AEvrakTip, AIslemTip, AGirisCikis, ASiraNo: Integer;
  AEvrakTarih: TDateTime;
begin
  TableHammaddeIhtiyac := FChildHammaddeIhtiyac.Table;
  if TableHammaddeIhtiyac.IsEmpty then
  begin
    AppShowMessage('Hammadde ihtiyacý yok');
    Exit;
  end;
  if not AppConfirm('Hammadde ihtiyaçlarýný teklif oluþtur?') then
    exit;
  ASirketNo := AppSecurity.DBCompanyNo;
  AEvrakTip := 5;
  AEvrakNo := DataApp.UretimBaslik.Table.UretimNo;
  AEvrakTarih := DataApp.UretimBaslik.Table.EvrakTarih;
  AEvrakHazirlayan := AppSecurity.UserName;
  AIslemTip := 53;
  AGirisCikis := 0;
  ADepoKod := '';
  AFiyatSekli := 'AFiyat1';
  ASiraNo := 0;
  ATeminYer := '';

  TableBaslik := TTableEvrakBaslik.Create(nil);
  TableBaslik.Name := 'TableSatinalmaEvrakBaslik';
  TableBaslik.ProviderName := 'prSatinalmaEvrakBaslik';
  TableBaslik.TableItems.TableNames := 'EVRBAS';
  TableBaslik.Connection := Connection;
  Connection.CPMAppServer.AddProvider('prSatinalmaEvrakBaslik');

  with TableBaslik.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
    end;
    with Where do
    begin
      Clear;
      Add('SIRKETNO', wcEqual, ASirketNo);
      AddOperator(woAnd);
      Add('EVRAKTIP', wcEqual, AEvrakTip);
      AddOperator(woAnd);
      Add('EVRAKNO', wcEqual, AEvrakNo);
    end;
  end;

  TableBaslik.Open;

  TableHareket := TTableStokHareket.Create(nil);
  TableHareket.Name := 'TableSatinalmaStokHareket';
  TableHareket.ProviderName := 'prSatinalmaStokHareket';
  TableHareket.TableItems.TableNames := 'STKHAR';
  TableHareket.Connection := Connection;
  Connection.CPMAppServer.AddProvider('prSatinalmaStokHareket');

  FDataControllerCommon := TAppDataControllerEvrakIslem.Create;
  FDataControllerCommon.Controllers.CreateStokHareket(TableHareket, nil, 'STKHAR');
  
  FDataControllerCommon.Controllers.CreateDepoIslem(TableHareket);

  //FDataControllerFiyat := TAppDataControllerBaseFiyat.Create(FDataControllerCommon, TableHareket);

  with TableHareket.TableItems[0] do
  begin
    with Where do
    begin
      Clear;
      Add('SIRKETNO', wcEqual, ASirketNo);
      AddOperator(woAnd);
      Add('EVRAKTIP', wcEqual, AEvrakTip);
      AddOperator(woAnd);
      Add('EVRAKNO', wcEqual, AEvrakNo);
    end;
  end;

  TableHareket.Open;
  if not TableHareket.IsEmpty then
  begin
    AppShowMessage(format('%s nolu üretim no ile sistemde kayýtlý teklifler var', [AEvrakNo]));
    Exit;
  end;

  TableBaslik.DisableControls;
  TableHareket.DisableControls;
  TableHammaddeIhtiyac.DisableControls;
  try
    TableBaslik.IndexFieldNames := 'HESAPKOD';
    TableHammaddeIhtiyac.IndexFieldNames := 'STKKRT_TEMINYER';

    AFieldMalKod := TableHammaddeIhtiyac.FindField('MALKOD');
    AFieldTeminYer := TableHammaddeIhtiyac.FindField('STKKRT_TEMINYER');
    AFieldUretimIhtiyac := TableHammaddeIhtiyac.FindField('URETIMIHTIYAC');
    TableHammaddeIhtiyac.First;
    while not TableHammaddeIhtiyac.Eof do
    begin
      if AFieldTeminYer.AsString = '' then
      begin
        AppShowMessage(format('%s nolu malýn temin yeri boþ', [AFieldMalKod.AsString]));
        Exit;
      end;
      if ATeminYer <> AFieldTeminYer.AsString then
      begin
        ATeminYer := AFieldTeminYer.AsString;
        ASiraNo := 0;
        TableBaslik.Append;
        TableBaslik.SirketNo := ASirketNo;
        TableBaslik.KayitTur := 1;
        TableBaslik.KayitDurum := 1;
        TableBaslik.EvrakTip := AEvrakTip;
        TableBaslik.HesapKod := AFieldTeminYer.AsString;
        TableBaslik.EvrakNo := AEvrakNo;
        TableBaslik.EvrakTarih := AEvrakTarih;
        TableBaslik.VadeTarih := AEvrakTarih;
        TableBaslik.EvrakHazirlayan := AEvrakHazirlayan;
        TableBaslik.Post;
      end;

      Inc(ASiraNo);
      TableHareket.Append;
      TableHareket.SirketNo := ASirketNo;
      TableHareket.KayitTur := 1;
      TableHareket.KayitDurum := 1;
      TableHareket.EvrakTip := AEvrakTip;
      TableHareket.HesapKod := ATeminYer;
      TableHareket.EvrakNo := AEvrakNo;
      TableHareket.EvrakTarih := AEvrakTarih;
      TableHareket.EvrakHazirlayan := AEvrakHazirlayan;

      TableHareket.MalKod := AFieldMalKod.AsString;
      TableHareket.BirimAgirlik := 1;
      TableHareket.Miktar := AFieldUretimIhtiyac.AsFloat;
      TableHareket.IslemTip := AIslemTip;
      TableHareket.GirisCikis := AGirisCikis;
      TableHareket.SiraNo := ASiraNo;

//      TableHareket.DepoKod := ADepoKod;
      TableHareket.FiyatSekli := AFiyatSekli;

      TableHareket.Post;
      TableHammaddeIhtiyac.Next;
    end;
    TableBaslik.Save;
    TableHareket.Save;
    TableBaslik.Close;
    TableHareket.Close;
  finally
    TableBaslik.IndexFieldNames := '';
    TableBaslik.EnableControls;

    TableHareket.IndexFieldNames := '';
    TableHareket.EnableControls;

    TableHammaddeIhtiyac.IndexFieldNames := '';
    TableHammaddeIhtiyac.EnableControls;
  end;
end;

procedure TAppDOPUretim.CreateChildStokLotDurum;
begin
  FChildStokLotDurum := DocObject.CreateChild(TAppDocChildGrid, 'ChildStokLotDurum') as TAppDocChildGrid;
  FChildStokLotDurum.Caption := 'Lot Durumu';
  FChildStokLotDurum.TableObject := DataApp.DataControllerUretim.LotDurum.TableLotDurum;

  FChildStokLotDurum.CreateButton('btStokLotDurum', 'Lot Durumu', 'Sayfalar');

  DocObject.Macros.AddObject(FChildStokLotDurum, 'ChildStokLotDurum');
end;

procedure TAppDOPUretim.AddLotsClick(Sender: TObject);
begin
  if DataApp.DataControllerUretim.LotDurum.Validate(True, True) then
    DataApp.DataControllerUretim.LotDurum.Add;
end;

procedure TAppDOPUretim.CreateChildUretimRota;
begin
  FChildUretimRota := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRota') as TAppDocChildGrid;
  FChildUretimRota.Caption := 'Üretim Rota Hareketleri';
  FChildUretimRota.TableObject := DataApp.UretimRota.Table;
  FChildUretimRota.ReadOnly := False;

  FChildUretimRota.CreateButton('btUretimRota', 'Üretim Rota Hareketleri', 'Sayfalar');

  DocObject.Macros.AddObject(FChildUretimRota, 'ChildUretimRota');
  DocObject.Macros.AddObject(DataApp.UretimRota, 'UretimRota');
end;

procedure TAppDOPUretim.CreateChildUretimRotaKaynak;
begin
  FChildUretimRotaKaynak := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRotaKaynak') as TAppDocChildGrid;
  FChildUretimRotaKaynak.Caption := 'Rota Kaynak Hareketleri';
  FChildUretimRotaKaynak.TableObject := DataApp.UretimRotaKaynak.Table;
  FChildUretimRotaKaynak.ReadOnly := False;

  FChildUretimRotaKaynak.CreateButton('btUretimRotaKaynak', 'Rota Kaynak Hareketleri', 'Sayfalar');

  DocObject.Macros.AddObject(FChildUretimRotaKaynak, 'ChildUretimRotaKaynak');
  DocObject.Macros.AddObject(DataApp.UretimRotaKaynak, 'UretimRotaKaynak');
end;

procedure TAppDOPUretim.CreateChildUretimKaynakTahsisat;
begin
  FChildUretimKaynakTahsisat := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimKaynakTahsisat') as TAppDocChildGrid;
  FChildUretimKaynakTahsisat.Caption := 'Kaynak Tahsisat';
  FChildUretimKaynakTahsisat.TableObject := DataApp.UretimKaynakTahsisat.Table;
  FChildUretimKaynakTahsisat.ReadOnly := False;

  FChildUretimKaynakTahsisat.CreateButton('btUretimKaynakTahsisat', 'Kaynak Tahsisat', 'Sayfalar');

  DocObject.Macros.AddObject(FChildUretimKaynakTahsisat, 'ChildUretimKaynakTahsisat');
  DocObject.Macros.AddObject(DataApp.UretimKaynakTahsisat, 'UretimKaynakTahsisat');
end;

procedure TAppDOPUretim.CreateChildUretimOzelBaglanti;
begin
  FChildUretimOzelBaglanti := DocObject.CreateChild(TAppDocChildEvrakOzelBaglanti, 'ChildUretimOzelBaglanti') as TAppDocChildEvrakOzelBaglanti;
  FChildUretimOzelBaglanti.Caption := 'Üretim Özel Baðlantý';
  FChildUretimOzelBaglanti.PipelineName := 'ppUretimOzelBaglanti';

  FChildUretimOzelBaglanti.OzelBaglantiTip := tobUretim;
  FChildUretimOzelBaglanti.EvrakTip := DataApp.ParamsUretim.EvrakTip;
  FChildUretimOzelBaglanti.EvrakBaglanti := DataApp.UretimOzelBaglanti;

  DocObject.Macros.AddObject(FChildUretimOzelBaglanti, 'ChildUretimOzelBaglanti');
end;

initialization
  AppRegisterDOPClass(TAppDOPUretim);
  
end.
