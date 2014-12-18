unit CPMApp_DOPUretimKart;

interface

uses Windows, Classes, SysUtils, Controls, Variants, Dialogs, DB,
  dxBar,
  cxImageComboBox, cxCalendar, cxEdit,
  CPMApp_DocObjectModel, CPMApp_DocApp, CPMApp_Storage,
  CPMApp_DocChildMultiVGrid,
  CPMApp_DocChildVGrid,
  CPMApp_DocChildGrid,
  CPMApp_DocChildGridNote,
  CPMApp_DocChildSearchTable,
  CPMApp_TableStokSystem,
  CPMApp_DocChildUretimKartReport,
  CPMApp_DocChildUretimKartIslemSira,
  CPMApp_DOPCustomUretimKart;

type
  TAppDOPBaseUretimKart = class(TAppDOPCustomUretimKart)
    procedure DoOnUretimDurumDegistirUretimDurumChanged(Sender: TObject);
  private
    // Params
    FOldChildUretimKartAjanOnKeyDown: TKeyEvent;
    FUretimDurumDegistir_UretimDurum: Integer;
    FUretimDurumDegistir_Tarih: TDateTime;
    FUretimDurumDegistir_Miktar: Double;
    FUretimDurumDegistir_FireMiktar: Double;
    FAddManualBaglanti_Miktar: Double;
    FAddManualBaglanti_Tarih: TDateTime;
    FAddManualBaglanti_No: String;
    FAddManualBaglanti_Tip: Smallint;
    FStokDurumBirimList: TStringList;
    FStokDurumVersiyonGosterimTipList: TStringList;
    FStokDurumDepoGosterimTipList: TStringList;
    FStokDurumSeriGosterimTipList: TStringList;
    // Menu Items
    btAutoStokDurum: TdxBarButton;
    btOnlyKullanilabilirStokDurum: TdxBarButton;
    cbStokDurumBirim: TdxBarCombo;
    cbStokDurumVersiyonGosterimTip: TdxBarCombo;
    cbStokDurumDepoGosterimTip: TdxBarCombo;
    cbStokDurumSeriGosterimTip: TdxBarCombo;
    // Childs
    FChildUretimKart: TAppDocChildMultiVGrid;
    FChildUretimRota: TAppDocChildGrid;
    FChildUretimRotaKaynak: TAppDocChildGrid;
    FChildUretimRotaKaynakNot: TAppDocChildVGrid;
    FChildUretimRotaKaynakIslem: TAppDocChildGrid;
    FChildUretimRotaKaynakOperasyon: TAppDocChildGrid;
    FChildUretimRotaKaynakDurus: TAppDocChildGrid;
    FChildUretimRotaKaynakHata: TAppDocChildGrid;
    FChildUretimSiparisHareket: TAppDocChildGrid;
    FChildUretimEvrakBaslik: TAppDocChildVGrid;
    FChildUretimStokHareket: TAppDocChildGrid;
    FChildUretimEvrakKaynak: TAppDocChildGrid;
    FChildUretimSeriKart: TAppDocChildVGrid;
    FChildUretimKartAjan: TAppDocChildSearchTable;
    FChildStokDurum: TAppDocChildGrid;
    FChildUretimKartIslemSira: TAppDocChildUretimKartIslemSira;
    FChildUretimKartReport: TAppDocChildUretimKartReport;
    // End Childs
    // Rules
    // End Rules
  private
    // Menü Items Click
    procedure IncEvrakNoClick(Sender: TObject);
    procedure UretimDurumDegistirClick(Sender: TObject);
    procedure ChildUretimKartAjanOnDblClick(Sender: TObject);
    procedure ChildUretimKartAjanOnKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure ChildUretimSiparisHareketOnDblClick(Sender: TObject);
    procedure UretimKartAlanSecimOnClick(Sender: TObject);
    procedure UretimSiparisHareketAlanSecimOnClick(Sender: TObject);
    procedure UretimEvrakBaslikAlanSecimOnClick(Sender: TObject);
    procedure UretimStokHareketAlanSecimOnClick(Sender: TObject);
    procedure StokDurumAlanSecimOnClick(Sender: TObject);
    procedure cbStokDurumBirimOnChange(Sender: TObject);
    procedure cbStokDurumVersiyonGosterimTipOnChange(Sender: TObject);
    procedure cbStokDurumDepoGosterimTipOnChange(Sender: TObject);
    procedure cbStokDurumSeriGosterimTipOnChange(Sender: TObject);
    // Procedures
    procedure UretimDurumDegistir;
    procedure AddManualBaglanti;
    procedure ChildStokDurumOnClick(Sender: TObject);
    procedure AutoStokDurumOnClick(Sender: TObject);
    procedure OnlyKullanilabilirStokDurumOnClick(Sender: TObject);
  private
    procedure CreateChildUretimKart;
    procedure CreateChildUretimRota;
    procedure CreateChildUretimRotaKaynak;
    procedure CreateChildUretimRotaKaynakNot;
    procedure CreateChildUretimRotaKaynakIslem;
    procedure CreateChildUretimRotaKaynakOperasyon;
    procedure CreateChildUretimRotaKaynakDurus;
    procedure CreateChildUretimRotaKaynakHata;
    procedure CreateChildUretimSiparisHareket;
    procedure CreateChildUretimEvrakBaslik;
    procedure CreateChildUretimStokHareket;
    procedure CreateChildUretimEvrakKaynak;
    procedure CreateChildUretimSeriKart;
    procedure CreateChildUretimKartAjan;
    procedure CreateChildStokDurum;
    procedure CreateChildUretimKartIslemSira;
    procedure CreateChildUretimKartReport;
    function GetTableActiveStokHareket: TTableStokHareket;
  protected
    function CreateDocObject: TAppDocObject; override;
    procedure SetDAPSecurity; override;
    procedure SetReport; override;
    procedure CreateDocChilds; override;
    procedure CreateMenuItems; override;
    procedure CreateRules;
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure Finalize(IniFile: TAppIniFile); override;
  public
    constructor Create(AOwner: TComponent; const aApplicationName: String); override;
    destructor Destroy; override;
    procedure TranslationChanged; override;
    property TableActiveStokHareket: TTableStokHareket read GetTableActiveStokHareket;
  published
    // Childs
    property ChildUretimKart: TAppDocChildMultiVGrid read FChildUretimKart;
    property ChildUretimRota: TAppDocChildGrid read FChildUretimRota;
    property ChildUretimRotaKaynak: TAppDocChildGrid read FChildUretimRotaKaynak;
    property ChildUretimRotaKaynakNot: TAppDocChildVGrid read FChildUretimRotaKaynakNot;
    property ChildUretimRotaKaynakIslem: TAppDocChildGrid read FChildUretimRotaKaynakIslem;
    property ChildUretimRotaKaynakOperasyon: TAppDocChildGrid read FChildUretimRotaKaynakOperasyon;
    property ChildUretimRotaKaynakDurus: TAppDocChildGrid read FChildUretimRotaKaynakDurus;
    property ChildUretimRotaKaynakHata: TAppDocChildGrid read FChildUretimRotaKaynakHata;
    property ChildUretimSiparisHareket: TAppDocChildGrid read FChildUretimSiparisHareket;
    property ChildUretimEvrakBaslik: TAppDocChildVGrid read FChildUretimEvrakBaslik;
    property ChildUretimStokHareket: TAppDocChildGrid read FChildUretimStokHareket;
    property ChildUretimEvrakKaynak: TAppDocChildGrid read FChildUretimEvrakKaynak;
    property ChildUretimSeriKart: TAppDocChildVGrid read FChildUretimSeriKart;
    property ChildUretimKartAjan: TAppDocChildSearchTable read FChildUretimKartAjan;
    property ChildStokDurum: TAppDocChildGrid read FChildStokDurum;
    property ChildUretimKartIslemSira: TAppDocChildUretimKartIslemSira read FChildUretimKartIslemSira;
    property ChildUretimKartReport: TAppDocChildUretimKartReport read FChildUretimKartReport;

  end;

  TAppDOPUretimKart = class(TAppDOPBaseUretimKart)
  end;

implementation

uses
  CPMApp_StrUtils, CPMApp_Images, CPMApp_Date, CPMApp_Dialogs, CPMApp_FieldProp,
  CPMApp_SProductionConsts, CPMApp_SProductionStrs,
  CPMApp_BOMConsts, CPMApp_DocMainForm, CPMApp_TableUretimSystem,
  CPMApp_DocParamsWindow;

{ TAppDOPBaseUretimKart }

procedure TAppDOPBaseUretimKart.ChildUretimKartAjanOnDblClick(Sender: TObject);
begin
  if DataApp.DataObject.IsDataChanged then
  begin
    if AppConfirm('Belgede deðiþiklik yapýlmýþ, Kaydet?') then
      DataApp.DataObject.Save;
  end;
  DataApp.DataObject.OptionsKey.KeyValues['SIRKETNO'] := FChildUretimKartAjan.Table.FieldValues['SIRKETNO'];
  DataApp.DataObject.OptionsKey.KeyValues['EVRAKTIP'] := FChildUretimKartAjan.Table.FieldValues['EVRAKTIP'];
  DataApp.DataObject.OptionsKey.KeyValues['EVRAKNO'] := FChildUretimKartAjan.Table.FieldValues['EVRAKNO'];
  DataApp.DataObject.Open;
  ChildUretimKart.ShowChild;
end;

procedure TAppDOPBaseUretimKart.ChildUretimKartAjanOnKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldChildUretimKartAjanOnKeyDown) then
    FOldChildUretimKartAjanOnKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
  begin
    ChildUretimKartAjan.GridView.OnDblClick(Sender);
  end;
end;

procedure TAppDOPBaseUretimKart.ChildUretimSiparisHareketOnDblClick(
  Sender: TObject);
begin
  AddManualBaglanti;
end;

constructor TAppDOPBaseUretimKart.Create(AOwner: TComponent;
  const aApplicationName: String);
begin
  inherited;
  FStokDurumBirimList := TStringList.Create;
  FStokDurumVersiyonGosterimTipList := TStringList.Create;
  FStokDurumDepoGosterimTipList := TStringList.Create;
  FStokDurumSeriGosterimTipList := TStringList.Create;
end;

procedure TAppDOPBaseUretimKart.CreateChildUretimKart;
begin
  FChildUretimKart := DocObject.CreateChild(TAppDocChildMultiVGrid, 'ChildUretimKart') as TAppDocChildMultiVGrid;
  FChildUretimKart.Caption := AppGetRS(@AppDOPBaseUretimKart_ChildUretimKart);
  FChildUretimKart.PipelineName := 'ppUretimKart';
  FChildUretimKart.TableObject := DataApp.UretimKart.Table;
  //FChildUretimKart.ReadOnly := True; // 07.01.2011 isa kod alaný kullanacakmýþ onun için kaldýrýldý.

  with FChildUretimKart.CreateButton('btUretimKart', FChildUretimKart.Caption, 'Sayfalar') do
    ImageIndex := Integer(aiStokDurum);

  FChildUretimKart.DockPanel.ImageIndex := Integer(aiStokDurum);

  DocObject.Macros.AddObject(ChildUretimKart, 'ChildUretimKart');
  DocObject.Macros.AddObject(DataApp.UretimKart, 'UretimKart');
end;

procedure TAppDOPBaseUretimKart.CreateChildUretimRota;
begin
  FChildUretimRota := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRota') as TAppDocChildGrid;
  FChildUretimRota.Caption := AppGetRS(@AppDOPBaseUretimKart_ChildUretimRota);
  FChildUretimRota.PipelineName := 'ppUretimRota';
  FChildUretimRota.TableObject := DataApp.UretimRota.Table;

  FChildUretimRota.CreateButton('btUretimRota', FChildUretimRota.Caption, 'Sayfalar');

  DocObject.Macros.AddObject(ChildUretimRota, 'ChildUretimRota');
  DocObject.Macros.AddObject(DataApp.UretimRota, 'UretimRota');
end;

procedure TAppDOPBaseUretimKart.CreateChildUretimRotaKaynak;
begin
  FChildUretimRotaKaynak := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRotaKaynak') as TAppDocChildGrid;
  FChildUretimRotaKaynak.Caption := AppGetRS(@AppDOPBaseUretimKart_ChildUretimRotaKaynak);
  FChildUretimRotaKaynak.PipelineName := 'ppUretimRotaKaynak';
  FChildUretimRotaKaynak.TableObject := DataApp.UretimRotaKaynak.Table;

  FChildUretimRotaKaynak.CreateButton('btUretimRotaKaynak', FChildUretimRotaKaynak.Caption, 'Sayfalar');

  DocObject.Macros.AddObject(ChildUretimRotaKaynak, 'ChildUretimRotaKaynak');
  DocObject.Macros.AddObject(DataApp.UretimRotaKaynak, 'UretimRotaKaynak');
end;

procedure TAppDOPBaseUretimKart.CreateChildUretimRotaKaynakNot;
begin
  FChildUretimRotaKaynakNot := DocObject.CreateChild(TAppDocChildVGrid, 'ChildUretimRotaKaynakNot') as TAppDocChildVGrid;
  FChildUretimRotaKaynakNot.Caption := AppGetRS(@AppDOPBaseUretimKart_ChildUretimRotaKaynakNot);
  FChildUretimRotaKaynakNot.PipelineName := 'ppUretimRotaKaynakNot';
  FChildUretimRotaKaynakNot.TableObject := DataApp.UretimRotaKaynakNot.Table;

  FChildUretimRotaKaynakNot.CreateButton('btUretimRotaKaynakNot', FChildUretimRotaKaynakNot.Caption, 'Sayfalar');

  DocObject.Macros.AddObject(ChildUretimRotaKaynakNot, 'ChildUretimRotaKaynakNot');
  DocObject.Macros.AddObject(DataApp.UretimRotaKaynakNot, 'UretimRotaKaynakNot');
end;

procedure TAppDOPBaseUretimKart.CreateChildUretimRotaKaynakIslem;
begin
  FChildUretimRotaKaynakIslem := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRotaKaynakIslem') as TAppDocChildGrid;
  FChildUretimRotaKaynakIslem.Caption := AppGetRS(@AppDOPBaseUretimKart_ChildUretimRotaKaynakIslem);
  FChildUretimRotaKaynakIslem.PipelineName := 'ppUretimRotaKaynakIslem';
  FChildUretimRotaKaynakIslem.TableObject := DataApp.UretimRotaKaynakIslem.Table;

  FChildUretimRotaKaynakIslem.CreateButton('btUretimRotaKaynakIslem', FChildUretimRotaKaynakIslem.Caption, 'Sayfalar');

  DocObject.Macros.AddObject(ChildUretimRotaKaynakIslem, 'ChildUretimRotaKaynakIslem');
  DocObject.Macros.AddObject(DataApp.UretimRotaKaynakIslem, 'UretimRotaKaynakIslem');
end;

procedure TAppDOPBaseUretimKart.CreateChildUretimRotaKaynakOperasyon;
begin
  FChildUretimRotaKaynakOperasyon := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRotaKaynakOperasyon') as TAppDocChildGrid;
  FChildUretimRotaKaynakOperasyon.Caption := AppGetRS(@AppDOPBaseUretimKart_ChildUretimRotaKaynakOperasyon);
  FChildUretimRotaKaynakOperasyon.PipelineName := 'ppUretimRotaKaynakOperasyon';
  FChildUretimRotaKaynakOperasyon.TableObject := DataApp.UretimRotaKaynakOperasyon.Table;

  FChildUretimRotaKaynakOperasyon.CreateButton('btUretimRotaKaynakOperasyon', FChildUretimRotaKaynakOperasyon.Caption, 'Sayfalar');

  DocObject.Macros.AddObject(ChildUretimRotaKaynakOperasyon, 'ChildUretimRotaKaynakOperasyon');
  DocObject.Macros.AddObject(DataApp.UretimRotaKaynakOperasyon, 'UretimRotaKaynakOperasyon');
end;

procedure TAppDOPBaseUretimKart.CreateChildUretimRotaKaynakDurus;
begin
  FChildUretimRotaKaynakDurus := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRotaKaynakDurus') as TAppDocChildGrid;
  FChildUretimRotaKaynakDurus.Caption := AppGetRS(@AppDOPBaseUretimKart_ChildUretimRotaKaynakDurus);
  FChildUretimRotaKaynakDurus.PipelineName := 'ppUretimRotaKaynakDurus';
  FChildUretimRotaKaynakDurus.TableObject := DataApp.UretimRotaKaynakDurus.Table;

  FChildUretimRotaKaynakDurus.CreateButton('btUretimRotaKaynakDurus', FChildUretimRotaKaynakDurus.Caption, 'Sayfalar');

  DocObject.Macros.AddObject(ChildUretimRotaKaynakDurus, 'ChildUretimRotaKaynakDurus');
  DocObject.Macros.AddObject(DataApp.UretimRotaKaynakDurus, 'UretimRotaKaynakDurus');
end;

procedure TAppDOPBaseUretimKart.CreateChildUretimRotaKaynakHata;
begin
  FChildUretimRotaKaynakHata := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRotaKaynakHata') as TAppDocChildGrid;
  FChildUretimRotaKaynakHata.Caption := AppGetRS(@AppDOPBaseUretimKart_ChildUretimRotaKaynakHata);
  FChildUretimRotaKaynakHata.PipelineName := 'ppUretimRotaKaynakHata';
  FChildUretimRotaKaynakHata.TableObject := DataApp.UretimRotaKaynakHata.Table;

  FChildUretimRotaKaynakHata.CreateButton('btUretimRotaKaynakHata', FChildUretimRotaKaynakHata.Caption, 'Sayfalar');

  DocObject.Macros.AddObject(ChildUretimRotaKaynakHata, 'ChildUretimRotaKaynakHata');
  DocObject.Macros.AddObject(DataApp.UretimRotaKaynakHata, 'UretimRotaKaynakHata');
end;

procedure TAppDOPBaseUretimKart.CreateChildUretimSeriKart;
begin
  FChildUretimSeriKart := DocObject.CreateChild(TAppDocChildVGrid, 'ChildUretimSeriKart') as TAppDocChildVGrid;
  FChildUretimSeriKart.Caption := AppGetRS(@AppDOPBaseUretimKart_ChildUretimSeriKart);
  FChildUretimSeriKart.PipelineName := 'ppUretimSeriKart';
  FChildUretimSeriKart.TableObject := DataApp.UretimSeriKart.Table;

  with FChildUretimSeriKart.CreateButton('btUretimSeriKart', FChildUretimSeriKart.Caption, 'Sayfalar') do
    ImageIndex := Integer(aiSeriNo);

  FChildUretimSeriKart.DockPanel.ImageIndex := Integer(aiSeriNo);

  DocObject.Macros.AddObject(ChildUretimSeriKart, 'ChildUretimSeriKart');
  DocObject.Macros.AddObject(DataApp.UretimSeriKart, 'UretimSeriKart');
end;

procedure TAppDOPBaseUretimKart.CreateChildUretimSiparisHareket;
begin
  FChildUretimSiparisHareket := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimSiparisHareket') as TAppDocChildGrid;
  FChildUretimSiparisHareket.Caption := AppGetRS(@AppDOPBaseUretimKart_ChildUretimSiparisHareket);
  FChildUretimSiparisHareket.PipelineName := 'ppUretimSiparisHareket';
  FChildUretimSiparisHareket.TableObject := DataApp.UretimSiparisHareket.Table;

  FChildUretimSiparisHareket.CreateButton('btUretimSiparisHareket', FChildUretimSiparisHareket.Caption, 'Sayfalar');

  FChildUretimSiparisHareket.GridView.OnDblClick := ChildUretimSiparisHareketOnDblClick;

  DocObject.Macros.AddObject(ChildUretimSiparisHareket, 'ChildUretimSiparisHareket');
  DocObject.Macros.AddObject(DataApp.UretimSiparisHareket, 'UretimSiparisHareket');
end;

procedure TAppDOPBaseUretimKart.CreateChildUretimEvrakBaslik;
begin
  FChildUretimEvrakBaslik := DocObject.CreateChild(TAppDocChildVGrid, 'ChildUretimEvrakBaslik') as TAppDocChildVGrid;
  FChildUretimEvrakBaslik.Caption := AppGetRS(@AppDOPBaseUretimKart_ChildUretimEvrakBaslik);
  FChildUretimEvrakBaslik.PipelineName := 'ppUretimEvrakBaslik';
  FChildUretimEvrakBaslik.TableObject := DataApp.UretimEvrakBaslik.Table;

  with FChildUretimEvrakBaslik.CreateButton('btUretimEvrakBaslik', FChildUretimEvrakBaslik.Caption, 'Sayfalar') do
    ImageIndex := Integer(aiHeader);

  FChildUretimEvrakBaslik.DockPanel.ImageIndex := Integer(aiHeader);

  DocObject.Macros.AddObject(FChildUretimEvrakBaslik, 'ChildUretimEvrakBaslik');
  DocObject.Macros.AddObject(DataApp.UretimEvrakBaslik, 'UretimEvrakBaslik');
end;

procedure TAppDOPBaseUretimKart.CreateChildUretimStokHareket;
begin
  FChildUretimStokHareket := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimStokHareket') as TAppDocChildGrid;
  FChildUretimStokHareket.Caption := AppGetRS(@AppDOPBaseUretimKart_ChildUretimStokHareket);
  FChildUretimStokHareket.PipelineName := 'ppUretimStokHareket';
  FChildUretimStokHareket.TableObject := DataApp.UretimStokHareket.Table;

  FChildUretimStokHareket.CreateButton('btUretimStokHareket', FChildUretimStokHareket.Caption, 'Sayfalar');

  DocObject.Macros.AddObject(ChildUretimStokHareket, 'ChildUretimStokHareket');
  DocObject.Macros.AddObject(DataApp.UretimStokHareket, 'UretimStokHareket');
end;

procedure TAppDOPBaseUretimKart.CreateChildUretimEvrakKaynak;
begin
  FChildUretimEvrakKaynak := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimEvrakKaynak') as TAppDocChildGrid;
  FChildUretimEvrakKaynak.Caption := AppGetRS(@AppDOPBaseUretimKart_ChildUretimEvrakKaynak);
  FChildUretimEvrakKaynak.PipelineName := 'ppUretimEvrakKaynak';
  FChildUretimEvrakKaynak.TableObject := DataApp.UretimEvrakKaynak.Table;

  FChildUretimEvrakKaynak.CreateButton('btUretimEvrakKaynak', FChildUretimEvrakKaynak.Caption, 'Sayfalar');

  DocObject.Macros.AddObject(ChildUretimEvrakKaynak, 'ChildUretimEvrakKaynak');
  DocObject.Macros.AddObject(DataApp.UretimEvrakKaynak, 'UretimEvrakKaynak');
end;

procedure TAppDOPBaseUretimKart.CreateChildUretimKartAjan;
begin
  FChildUretimKartAjan := DocObject.CreateChild(TAppDocChildSearchTable, 'ChildUretimKartAjan') as TAppDocChildSearchTable;
  FChildUretimKartAjan.AppName := AppName + '\' + FChildUretimKartAjan.Name;
  FChildUretimKartAjan.Caption := AppGetRS(@AppDOPBaseUretimKart_ChildUretimKartAjan);
  FChildUretimKartAjan.PipelineName := 'ppUretimKartIzleyici';

  FChildUretimKartAjan.Table.TableItems.TableNames := VarArrayOf(['URTKRT', 'STKKRT', 'CARKRT']);
  FChildUretimKartAjan.Table.TableItems.TableCaptions := VarArrayOf(['Üretim Kart', 'Stok Kart', 'Cari Kart']);

  with FChildUretimKartAjan.Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('SIRKETNO');
      Add('EVRAKTIP');
      Add('EVRAKNO');
      Add('HESAPKOD');
      Add('MAMULKOD');
      Add('VERSIYONNO');
      Add('MAMULSERINO');
      Add('MIKTAR');
    end;
    with Where do
    begin
      Clear;
    end;
  end;

  with FChildUretimKartAjan.Table.TableItems[1] do
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
    with Where do
    begin
      Clear;
    end;
  end;

  with FChildUretimKartAjan.Table.TableItems[2] do
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
    with Where do
    begin
      Clear;
    end;
  end;

  FChildUretimKartAjan.GridView.OnDblClick := ChildUretimKartAjanOnDblClick;

  FOldChildUretimKartAjanOnKeyDown := FChildUretimKartAjan.GridView.OnKeyDown;
  FChildUretimKartAjan.GridView.OnKeyDown := ChildUretimKartAjanOnKeyDown;

  FChildUretimKartAjan.DockPanel.ImageIndex := Integer(aiEvrakIzleyici);
  with FChildUretimKartAjan.CreateButton('btUretimKartAjan', FChildUretimKartAjan.Caption, 'Sayfalar', 'Ctrl+J') do
    ImageIndex := Integer(aiEvrakIzleyici);
end;

procedure TAppDOPBaseUretimKart.CreateChildStokDurum;
begin
  FChildStokDurum := DocObject.CreateChild(TAppDocChildGrid, 'ChildStokDurum') as TAppDocChildGrid;
  FChildStokDurum.Caption := AppGetRS(@AppDOPBaseUretimKart_ChildStokDurum);
  FChildStokDurum.PipelineName := 'ppStokDurum';
  FChildStokDurum.TableObject := DataApp.StokDurum.Table;

  with FChildStokDurum.CreateButton('btStokDurum', FChildStokDurum.Caption, 'Sayfalar', 'Ctrl+F11', ChildStokDurumOnClick) do
    ImageIndex := Integer(aiStokDurum);

  FChildStokDurum.DockPanel.ImageIndex := Integer(aiStokDurum);

  DocObject.Macros.AddObject(ChildStokDurum, 'ChildStokDurum');
  DocObject.Macros.AddObject(DataApp.StokDurum, 'StokDurum');
end;

procedure TAppDOPBaseUretimKart.CreateChildUretimKartIslemSira;
begin
  FChildUretimKartIslemSira := DocObject.CreateChild(TAppDocChildUretimKartIslemSira, 'ChildUretimKartIslemSira') as TAppDocChildUretimKartIslemSira;
  with FChildUretimKartIslemSira.CreateButton('btUretimIslemSira', FChildUretimKartIslemSira.Caption, 'Sayfalar', '', nil) do
    ImageIndex := Integer(aiStokIzleyici);

  DocObject.Macros.AddObject(ChildUretimKartIslemSira, 'ChildUretimKartIslemSira');
  DocObject.Macros.AddObject(ChildUretimKartIslemSira.Table, 'UretimIslemSira');
end;

procedure TAppDOPBaseUretimKart.CreateChildUretimKartReport;
begin
  FChildUretimKartReport := DocObject.CreateChild(TAppDocChildUretimKartReport, 'ChildUretimKartReport') as TAppDocChildUretimKartReport;
//  with FChildUretimKartReport.CreateButton('btDocChildUretimKartReport', 'Raporlar', 'Sayfalar', 'Ctrl+F9', nil) do
//    ImageIndex := Integer(aiCustomerReport);
//  DocObject.Macros.AddObject(FChildUretimKartReport, 'DocChildUretimKartReport');
end;

procedure TAppDOPBaseUretimKart.CreateDocChilds;
begin
  inherited;
  CreateChildUretimKart;
  CreateChildUretimRota;
  CreateChildUretimRotaKaynak;
  CreateChildUretimRotaKaynakNot;
  CreateChildUretimRotaKaynakIslem;
  CreateChildUretimRotaKaynakOperasyon;
  CreateChildUretimRotaKaynakDurus;
  CreateChildUretimRotaKaynakHata;
  CreateChildUretimSiparisHareket;
  CreateChildUretimEvrakBaslik;
  CreateChildUretimStokHareket;
  CreateChildUretimEvrakKaynak;
  CreateChildUretimSeriKart;
  CreateChildUretimKartAjan;
  CreateChildStokDurum;
  CreateChildUretimKartIslemSira;
  CreateChildUretimKartReport;
  CreateRules;
end;

function TAppDOPBaseUretimKart.CreateDocObject: TAppDocObject;
begin
  Result := inherited CreateDocObject;
  Result.OptionsData.CanDelete := False;
end;

procedure TAppDOPBaseUretimKart.CreateMenuItems;

  procedure FillStokdurumBirim;
  begin
    AppFieldProp.Load('STKKRT');
    AppFieldProp.FieldRef.Range('STKKRT', 'BIRIM');
    AppFieldProp.FieldRef.First;
    cbStokDurumBirim.Items.Clear;
    FStokDurumBirimList.Clear;

    cbStokDurumBirim.Items.Add('Stok Birimi');
    FStokDurumBirimList.Add('Stok Birimi=Stok');

    cbStokDurumBirim.Items.Add('Evrak Birimi');
    FStokDurumBirimList.Add('Evrak Birimi=Evrak');

    cbStokDurumBirim.Items.Add('Hepsi');
    FStokDurumBirimList.Add('Hepsi=Hepsi');

    while not AppFieldProp.FieldRef.Eof do
    begin
      if AppFieldProp.FieldRef.Aciklama <> '' then
      begin
        FStokDurumBirimList.Add(AppFieldProp.FieldRef.Aciklama + '=' + AppFieldProp.FieldRef.Kod );
        cbStokDurumBirim.Items.Add(AppFieldProp.FieldRef.Aciklama);
      end;
      AppFieldProp.FieldRef.Next;
    end;
  end;

  procedure FillStokDurumVersiyonGosterimTip;
  begin
    cbStokDurumVersiyonGosterimTip.Items.Clear;
    FStokDurumVersiyonGosterimTipList.Clear;

    cbStokDurumVersiyonGosterimTip.Items.Add('Göster');
    FStokDurumVersiyonGosterimTipList.Add('Göster=0');

    cbStokDurumVersiyonGosterimTip.Items.Add('Gösterme');
    FStokDurumVersiyonGosterimTipList.Add('Gösterme=1');

    cbStokDurumVersiyonGosterimTip.Items.Add('Kýsýtlý Göster');
    FStokDurumVersiyonGosterimTipList.Add('Kýsýtlý Göster=2');

    cbStokDurumVersiyonGosterimTip.Items.Add('Girilmiþse Kýsýtlý Göster');
    FStokDurumVersiyonGosterimTipList.Add('Girilmiþse Kýsýtlý Göster=3');
  end;

  procedure FillStokDurumDepoGosterimTip;
  begin
    cbStokDurumDepoGosterimTip.Items.Clear;
    FStokDurumDepoGosterimTipList.Clear;

    cbStokDurumDepoGosterimTip.Items.Add('Göster');
    FStokDurumDepoGosterimTipList.Add('Göster=0');

    cbStokDurumDepoGosterimTip.Items.Add('Gösterme');
    FStokDurumDepoGosterimTipList.Add('Gösterme=1');

    cbStokDurumDepoGosterimTip.Items.Add('Kýsýtlý Göster');
    FStokDurumDepoGosterimTipList.Add('Kýsýtlý Göster=2');

    cbStokDurumDepoGosterimTip.Items.Add('Girilmiþse Kýsýtlý Göster');
    FStokDurumDepoGosterimTipList.Add('Girilmiþse Kýsýtlý Göster=3');
  end;

  procedure FillStokDurumSeriGosterimTip;
  begin
    cbStokDurumSeriGosterimTip.Items.Clear;
    FStokDurumSeriGosterimTipList.Clear;

    cbStokDurumSeriGosterimTip.Items.Add('Göster');
    FStokDurumSeriGosterimTipList.Add('Göster=0');

    cbStokDurumSeriGosterimTip.Items.Add('Gösterme');
    FStokDurumSeriGosterimTipList.Add('Gösterme=1');

    cbStokDurumSeriGosterimTip.Items.Add('Kýsýtlý Göster');
    FStokDurumSeriGosterimTipList.Add('Kýsýtlý Göster=2');

    cbStokDurumSeriGosterimTip.Items.Add('Girilmiþse Kýsýtlý Göster');
    FStokDurumSeriGosterimTipList.Add('Girilmiþse Kýsýtlý Göster=3');
  end;

var
  suAyarlar, suVeriIslem: TdxBarSubItem;
begin
  inherited;
  suAyarlar := TdxBarSubItem(DocObject.DocBar.BarManager.GetItemByName('suAyarlar'));
  suVeriIslem := TdxBarSubItem(DocObject.DocBar.BarManager.GetItemByName('suVeriIslem'));

  DocObject.DocBar.CreateButton('btIncEvrakNo', 'Evrak No Ayarlarý', 'Ayarlar', suAyarlar, '', IncEvrakNoClick);
  DocObject.DocBar.CreateButton('btUretimDurumDegistir', 'Üretim Emri Durumunu Deðiþtir', 'Veri Ýþlemleri', suVeriIslem, '', UretimDurumDegistirClick);

  DocObject.DocBar.CreateButton('btUretimKartAlanSecim', 'Üretim Kartý Alan Seçimi', 'Ayarlar', suAyarlar, '', UretimKartAlanSecimOnClick);
  DocObject.DocBar.CreateButton('btUretimSiparisHareketAlanSecim', 'Üretim Sipariþ Hareket Alan Seçimi', 'Ayarlar', suAyarlar, '', UretimSiparisHareketAlanSecimOnClick);
  DocObject.DocBar.CreateButton('btUretimStokHareketAlanSecim', 'Üretim Stok Hareket Alan Seçimi', 'Ayarlar', suAyarlar, '', UretimStokHareketAlanSecimOnClick);
  DocObject.DocBar.CreateButton('btUretimEvrakBaslikAlanSecim', 'Üretim Evrak Baþlýk Alan Seçimi', 'Ayarlar', suAyarlar, '', UretimEvrakBaslikAlanSecimOnClick);
  DocObject.DocBar.CreateButton('btStokDurumAlanSecim', 'Stok Durum Alan Seçimi', 'Ayarlar', suAyarlar, '', StokDurumAlanSecimOnClick);

  btAutoStokDurum := DocObject.DocBar.CreateButton('btAutoStokDurum', 'Otomatik Stok Durum', 'Ayarlar', suAyarlar, '', AutoStokDurumOnClick);
  btAutoStokDurum.ButtonStyle := bsChecked;

  btOnlyKullanilabilirStokDurum := DocObject.DocBar.CreateButton('btOnlyKullanilabilirStokDurum', 'Sadece Kullanýlabilir Stoklarý Göster', 'Ayarlar', suAyarlar, '', OnlyKullanilabilirStokDurumOnClick);
  btOnlyKullanilabilirStokDurum.ButtonStyle := bsChecked;

  cbStokDurumBirim := DocObject.DocBar.CreateCombo('cbStokDurumBirim', 'Stok Durumu Birimi', 'Ayarlar', suAyarlar);
  cbStokDurumBirim.OnChange := cbStokDurumBirimOnChange;
  FillStokDurumBirim;

  cbStokDurumVersiyonGosterimTip := DocObject.DocBar.CreateCombo('cbStokDurumVersiyonGosterimTip', 'Stok Durumu Versiyon Gösterimi', 'Ayarlar', suAyarlar);
  cbStokDurumVersiyonGosterimTip.OnChange := cbStokDurumVersiyonGosterimTipOnChange;
  FillStokDurumVersiyonGosterimTip;

  cbStokDurumDepoGosterimTip := DocObject.DocBar.CreateCombo('cbStokDurumDepoGosterimTip', 'Stok Durumu Depo Gösterimi', 'Ayarlar', suAyarlar);
  cbStokDurumDepoGosterimTip.OnChange := cbStokDurumDepoGosterimTipOnChange;
  FillStokDurumDepoGosterimTip;

  cbStokDurumSeriGosterimTip := DocObject.DocBar.CreateCombo('cbStokDurumSeriGosterimTip', 'Stok Durumu Seri Gösterimi', 'Ayarlar', suAyarlar);
  cbStokDurumSeriGosterimTip.OnChange := cbStokDurumSeriGosterimTipOnChange;
  FillStokDurumSeriGosterimTip;
end;

procedure TAppDOPBaseUretimKart.CreateRules;
begin

end;

destructor TAppDOPBaseUretimKart.Destroy;
begin
  FreeAndNil(FStokDurumBirimList);
  FreeAndNil(FStokDurumVersiyonGosterimTipList);
  FreeAndNil(FStokDurumDepoGosterimTipList);
  FreeAndNil(FStokDurumSeriGosterimTipList);
  inherited;
end;

procedure TAppDOPBaseUretimKart.DoOnUretimDurumDegistirUretimDurumChanged(Sender: TObject);
var
  AValue: Integer;
  AOldUretimDurum, ANewUretimDurum: TAppUretimDurum;
begin
  AValue := TcxCustomEdit(Sender).EditValue;
  AOldUretimDurum := TAppUretimDurum(DataApp.UretimKart.Table.UretimDurum);
  ANewUretimDurum := TAppUretimDurum(AValue);

  if ParamsWindow.ItemByName('TARIH') <> nil then
  begin
    if AppUretimDurumUpdateType(AOldUretimDurum, ANewUretimDurum) = udutForward then
    begin
      ParamsWindow.ItemByName('TARIH').ReadOnly := False;
      ParamsWindow.ItemByName('TARIH').Value := AppDate;
    end else
    begin
      ParamsWindow.ItemByName('TARIH').ReadOnly := True;
      if ANewUretimDurum = udPlanned then
        ParamsWindow.ItemByName('TARIH').Value := DataApp.UretimKart.Table.EvrakTarih
      else if ANewUretimDurum = udFirmPlanned then
        ParamsWindow.ItemByName('TARIH').Value := DataApp.UretimKart.Table.UretimPlanTarih
      else if ANewUretimDurum = udReleased then
        ParamsWindow.ItemByName('TARIH').Value := DataApp.UretimKart.Table.UretimBasTarih
      else if ANewUretimDurum = udFinished then
        ParamsWindow.ItemByName('TARIH').Value := DataApp.UretimKart.Table.UretimBitTarih;
    end;
  end;
  if ParamsWindow.ItemByName('MIKTAR') <> nil then
  begin
    ParamsWindow.ItemByName('MIKTAR').ReadOnly := (ANewUretimDurum <> udFinished) or (DataApp.UretimKart.Table.OpDurum in [odStarted, odFinished]);
    ParamsWindow.ItemByName('MIKTAR').Value := FUretimDurumDegistir_Miktar;
  end;
  if ParamsWindow.ItemByName('FIREMIKTAR') <> nil then
  begin
    ParamsWindow.ItemByName('FIREMIKTAR').ReadOnly := (ANewUretimDurum <> udFinished) or (DataApp.UretimKart.Table.OpDurum in [odStarted, odFinished]);
    ParamsWindow.ItemByName('FIREMIKTAR').Value := FUretimDurumDegistir_FireMiktar;
  end;

  // Tarihi, Miktarý v.s. burada deðiþtirmem bi iþe yaramýyo. Ýleride refresh komutuna biþey düþün.
  ParamsWindow.Refresh;
end;

function TAppDOPBaseUretimKart.GetTableActiveStokHareket: TTableStokHareket;
begin
  Result := DataApp.UretimStokHareket.Table;
end;

procedure TAppDOPBaseUretimKart.IncEvrakNoClick(Sender: TObject);
begin
  IncNoWindow.Execute(DataApp.UretimKart.RuleEvrakNo);
end;

procedure TAppDOPBaseUretimKart.Initialize(IniFile: TAppIniFile);
var
  AVersiyonGosterimTip, ADepoGosterimTip, ASeriGosterimTip: Smallint;
begin
  inherited;
  btAutoStokDurum.Down := IniFile.ReadBool('PARAMS', 'AUTOSTOKDURUM', False);
  DataApp.StokDurum.IsAuto := btAutoStokDurum.Down;
  btOnlyKullanilabilirStokDurum.Down := IniFile.ReadBool('PARAMS', 'ONLYKULLANILABILIRSTOKDURUM', False);
  DataApp.StokDurum.dcStokDurum.OnlyExist := btOnlyKullanilabilirStokDurum.Down;

  cbStokDurumBirim.Text := IniFile.ReadString('PARAMS', 'STOKDURUMBIRIM', 'Stok Birimi');

  AVersiyonGosterimTip := IniFile.ReadInteger('PARAMS', 'STOKDURUMVERSIYONGOSTERIMTIP', DataApp.StokDurum.dcStokDurum.VersiyonGosterimTip);
  cbStokDurumVersiyonGosterimTip.Text := FStokDurumVersiyonGosterimTipList.Names[AVersiyonGosterimTip];

  ADepoGosterimTip := IniFile.ReadInteger('PARAMS', 'STOKDURUMDEPOGOSTERIMTIP', DataApp.StokDurum.dcStokDurum.DepoGosterimTip);
  cbStokDurumDepoGosterimTip.Text := FStokDurumDepoGosterimTipList.Names[ADepoGosterimTip];

  ASeriGosterimTip := IniFile.ReadInteger('PARAMS', 'STOKDURUMSERIGOSTERIMTIP', DataApp.StokDurum.dcStokDurum.SeriGosterimTip);
  cbStokDurumSeriGosterimTip.Text := FStokDurumSeriGosterimTipList.Names[ASeriGosterimTip];
end;

procedure TAppDOPBaseUretimKart.Finalize(IniFile: TAppIniFile);
begin
  inherited;
  IniFile.WriteBool('PARAMS', 'AUTOSTOKDURUM', btAutoStokDurum.Down);
  IniFile.WriteBool('PARAMS', 'ONLYKULLANILABILIRSTOKDURUM', btOnlyKullanilabilirStokDurum.Down);
  IniFile.WriteString('PARAMS', 'STOKDURUMBIRIM', cbStokDurumBirim.Text);
  IniFile.WriteInteger('PARAMS', 'STOKDURUMVERSIYONGOSTERIMTIP', DataApp.StokDurum.dcStokDurum.VersiyonGosterimTip);
  IniFile.WriteInteger('PARAMS', 'STOKDURUMDEPOGOSTERIMTIP', DataApp.StokDurum.dcStokDurum.DepoGosterimTip);
  IniFile.WriteInteger('PARAMS', 'STOKDURUMSERIGOSTERIMTIP', DataApp.StokDurum.dcStokDurum.SeriGosterimTip);
end;

procedure TAppDOPBaseUretimKart.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.UretimKart.Table, 'URTKRT', 'Üretim Kart');
  Security.AddTable(DataApp.UretimRota.Table, 'URTROT', 'Rota');
  Security.AddTable(DataApp.UretimRotaKaynak.Table, 'URTROK', 'Rota Kaynak');
  Security.AddTable(DataApp.UretimRotaKaynakNot.Table, 'URTRKN', 'Rota Kaynak Not');
  Security.AddTable(DataApp.UretimRotaKaynakIslem.Table, 'URTRKI', 'Rota Kaynak Ýþlemleri');
  Security.AddTable(DataApp.UretimRotaKaynakOperasyon.Table, 'URTRKO', 'Rota Kaynak Operasyon');
  Security.AddTable(DataApp.UretimRotaKaynakDurus.Table, 'URTRKD', 'Rota Kaynak Duruþ');
  Security.AddTable(DataApp.UretimRotaKaynakHata.Table, 'URTRKH', 'Rota Kaynak Hata');
  Security.AddTable(DataApp.UretimEvrakBaslik.Table, 'EVRBAS', 'Evrak Baþlýk');
  Security.AddTable(DataApp.UretimStokHareket.Table, 'STKHAR', 'Stok Hareket');
end;

procedure TAppDOPBaseUretimKart.SetReport;
begin
  inherited;
  DocObject.Report.MainTable := DataApp.UretimRota.Table;
end;

procedure TAppDOPBaseUretimKart.UretimDurumDegistir;
  procedure PrepareParams;
  begin
    if TAppUretimDurum(DataApp.UretimKart.Table.UretimDurum) = udPlanned then
      FUretimDurumDegistir_UretimDurum := Integer(udFirmPlanned)
    else if TAppUretimDurum(DataApp.UretimKart.Table.UretimDurum) = udFirmPlanned then
      FUretimDurumDegistir_UretimDurum := Integer(udReleased)
    else if TAppUretimDurum(DataApp.UretimKart.Table.UretimDurum) = udReleased then
      FUretimDurumDegistir_UretimDurum := Integer(udFinished)
    else if TAppUretimDurum(DataApp.UretimKart.Table.UretimDurum) = udFinished then
      FUretimDurumDegistir_UretimDurum := Integer(udReleased);

    FUretimDurumDegistir_Tarih := AppDate;

    if DataApp.UretimKart.Table.OpDurum in [odReleased] then // Operasyon giriþi yok ise
    begin
      FUretimDurumDegistir_Miktar := DataApp.UretimKart.Table.Miktar;
      FUretimDurumDegistir_FireMiktar := 0;
    end else // Operasyon giriþi var ise
    begin
      FUretimDurumDegistir_Miktar := DataApp.UretimKart.Table.OpMiktar;
      FUretimDurumDegistir_FireMiktar := DataApp.UretimKart.Table.OpFireMiktar;
    end;
  end;
  function GetParams: Boolean;
  begin
    ParamsWindow.Items.Clear;
    with ParamsWindow.Items.Add do
    begin
      Name := 'URETIMDURUM';
      Caption := 'Üretim Durumu';
      Value := FUretimDurumDegistir_UretimDurum;
      EditPropertiesClass := TcxImageComboBoxProperties;
      AppFieldProp.FieldRef.Range('URTKRT', 'URETIMDURUM');
      AppFieldProp.FieldRef.First;
      while not AppFieldProp.FieldRef.Eof do
      begin
        if AppUretimDurumUpdateType(TAppUretimDurum(DataApp.UretimKart.Table.UretimDurum), TAppUretimDurum(StrToInt(AppFieldProp.FieldRef.Kod))) <> udutNone then
        begin
          with Values.Add do
          begin
            Value := AppFieldProp.FieldRef.Kod;
            Description := AppFieldProp.FieldRef.Aciklama;
          end;
        end;
        AppFieldProp.FieldRef.Next;
      end;
      EditValueChanged := DoOnUretimDurumDegistirUretimDurumChanged;
    end;
    if TAppUretimDurum(DataApp.UretimKart.Table.UretimDurum) <> udFinished then
    begin
      with ParamsWindow.Items.Add do
      begin
        Name := 'TARIH';
        Caption := 'Tarih';
        Value := FUretimDurumDegistir_Tarih;
        EditPropertiesClass := TcxDateEditProperties;
      end;
    end;
    if TAppUretimDurum(DataApp.UretimKart.Table.UretimDurum) = udReleased then
    begin
      with ParamsWindow.Items.Add do
      begin
        Name := 'MIKTAR';
        Caption := 'Çýktý Miktarý';
        Value := FUretimDurumDegistir_Miktar;
        ReadOnly := DataApp.UretimKart.Table.OpDurum in [odStarted, odFinished];
      end;
      with ParamsWindow.Items.Add do
      begin
        Name := 'FIREMIKTAR';
        Caption := 'Fire Miktarý';
        Value := FUretimDurumDegistir_FireMiktar;
        ReadOnly := DataApp.UretimKart.Table.OpDurum in [odStarted, odFinished];
      end;
    end;
    ParamsWindow.Caption := 'Üretim Emri Durumunu Deðiþtir';
    Result := ParamsWindow.Execute;
    if Result then
    begin
      FUretimDurumDegistir_UretimDurum := Integer(ParamsWindow['URETIMDURUM']);
      if ParamsWindow.ItemByName('TARIH') <> nil then
        FUretimDurumDegistir_Tarih := VarToDateTime(ParamsWindow['TARIH']);
      if (DataApp.UretimKart.Table.OpDurum in [odReleased]) and (TAppUretimDurum(FUretimDurumDegistir_UretimDurum) = udFinished) then // Operasyon giriþi yok ise ve tamamlandý yapýlmak isteniyorsa
      begin
        if ParamsWindow.ItemByName('MIKTAR') <> nil then
          FUretimDurumDegistir_Miktar := ParamsWindow['MIKTAR'];
        if ParamsWindow.ItemByName('FIREMIKTAR') <> nil then
          FUretimDurumDegistir_FireMiktar := ParamsWindow['FIREMIKTAR'];
      end;
      if TAppUretimDurum(FUretimDurumDegistir_UretimDurum) = udFinished then
        if FUretimDurumDegistir_Miktar <> DataApp.UretimKart.Table.Miktar then
          if FUretimDurumDegistir_Miktar + FUretimDurumDegistir_FireMiktar <> DataApp.UretimKart.Table.Miktar then
            Result := AppConfirm('Sipariþ miktarý ile gerçekleþen miktar farklý! Devam et?');
    end;
  end;
begin
  if DataApp.UretimRotaKaynakOperasyon.Table.State in dsEditModes then
    DataApp.UretimRotaKaynakOperasyon.Table.Post;
  PrepareParams;
  if not GetParams then
    Exit;
  if DataApp.DataControllerUretimKart.UretimDurumDegistir(TAppUretimDurum(FUretimDurumDegistir_UretimDurum), FUretimDurumDegistir_Tarih, FUretimDurumDegistir_Miktar, FUretimDurumDegistir_FireMiktar) then
    TAppDocMainForm(DocObject.MainForm).cmdSave.Execute; // Ana Formun Kaydet Butonuna Bas.
end;

procedure TAppDOPBaseUretimKart.UretimDurumDegistirClick(Sender: TObject);
begin
  UretimDurumDegistir;
end;

procedure TAppDOPBaseUretimKart.UretimKartAlanSecimOnClick(
  Sender: TObject);
begin
  DataApp.UretimKart.ShowFieldSettings('Üretim Kart Alan Seçimi...', 'TableUretimKart');
end;

procedure TAppDOPBaseUretimKart.UretimSiparisHareketAlanSecimOnClick(
  Sender: TObject);
begin
  DataApp.UretimSiparisHareket.ShowFieldSettings('Üretim Sipariþ Hareket Alan Seçimi...', 'TableUretimSiparisHareket');
end;

procedure TAppDOPBaseUretimKart.UretimStokHareketAlanSecimOnClick(
  Sender: TObject);
begin
  DataApp.UretimStokHareket.ShowFieldSettings('Üretim Stok Hareket Alan Seçimi...', 'TableUretimStokHareket');
end;

procedure TAppDOPBaseUretimKart.UretimEvrakBaslikAlanSecimOnClick(
  Sender: TObject);
begin
  DataApp.UretimEvrakBaslik.ShowFieldSettings('Üretim Evrak Baþlýk Alan Seçimi...', 'TableUretimEvrakBaslik');
end;

procedure TAppDOPBaseUretimKart.StokDurumAlanSecimOnClick(Sender: TObject);
begin
  DataApp.StokDurum.ShowFieldSettings('Stok Durum Alan Seçimi...', 'TableEvrakStokDurum');
end;

procedure TAppDOPBaseUretimKart.TranslationChanged;
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

  if AppName = AppSProductionConsts.AppName(odtSUretimIsEmriKart) then
    Caption := AppSProductionConsts.Caption(odtSUretimIsEmriKart);

  SetChildCaption(ChildUretimKart, AppGetRS(@AppDOPBaseUretimKart_ChildUretimKart));
  SetChildCaption(ChildUretimRota, AppGetRS(@AppDOPBaseUretimKart_ChildUretimRota));
  SetChildCaption(ChildUretimRotaKaynak, AppGetRS(@AppDOPBaseUretimKart_ChildUretimRotaKaynak));
  SetChildCaption(ChildUretimRotaKaynakNot, AppGetRS(@AppDOPBaseUretimKart_ChildUretimRotaKaynakNot));
  SetChildCaption(ChildUretimRotaKaynakIslem, AppGetRS(@AppDOPBaseUretimKart_ChildUretimRotaKaynakIslem));
  SetChildCaption(ChildUretimRotaKaynakOperasyon, AppGetRS(@AppDOPBaseUretimKart_ChildUretimRotaKaynakOperasyon));
  SetChildCaption(ChildUretimRotaKaynakDurus, AppGetRS(@AppDOPBaseUretimKart_ChildUretimRotaKaynakDurus));
  SetChildCaption(ChildUretimRotaKaynakHata, AppGetRS(@AppDOPBaseUretimKart_ChildUretimRotaKaynakHata));
  SetChildCaption(ChildUretimSiparisHareket, AppGetRS(@AppDOPBaseUretimKart_ChildUretimSiparisHareket));
  SetChildCaption(ChildUretimEvrakBaslik, AppGetRS(@AppDOPBaseUretimKart_ChildUretimEvrakBaslik));
  SetChildCaption(ChildUretimStokHareket, AppGetRS(@AppDOPBaseUretimKart_ChildUretimStokHareket));
  SetChildCaption(ChildUretimEvrakKaynak, AppGetRS(@AppDOPBaseUretimKart_ChildUretimEvrakKaynak));
  SetChildCaption(ChildUretimSeriKart, AppGetRS(@AppDOPBaseUretimKart_ChildUretimSeriKart));
  SetChildCaption(ChildUretimKartAjan, AppGetRS(@AppDOPBaseUretimKart_ChildUretimKartAjan));
  SetChildCaption(ChildStokDurum, AppGetRS(@AppDOPBaseUretimKart_ChildStokDurum));
end;

procedure TAppDOPBaseUretimKart.AddManualBaglanti;
  procedure PrepareParams;
  begin
    FAddManualBaglanti_Miktar := DataApp.UretimSiparisHareket.Table.Miktar - DataApp.UretimSiparisHareket.Table.KullanilanMiktar + DataApp.UretimSiparisHareket.Table.FazlaSevk;
    FAddManualBaglanti_Tarih := Date;
    FAddManualBaglanti_No := '';
    if FAddManualBaglanti_Miktar > 0 then
      FAddManualBaglanti_Tip := 2 // Ekle
    else
      FAddManualBaglanti_Tip := 3; // Sil
  end;
  function GetParams: Boolean;
  begin
    ParamsWindow.Items.Clear;
    with ParamsWindow.Items.Add do
    begin
      Name := 'MIKTAR';
      Caption := 'Miktar';
      Value := FAddManualBaglanti_Miktar;
      ReadOnly := FAddManualBaglanti_Miktar = 0;
    end;
    with ParamsWindow.Items.Add do
    begin
      Name := 'TARIH';
      Caption := 'Tarih';
      Value := FAddManualBaglanti_Tarih;
      EditPropertiesClass := TcxDateEditProperties;
    end;
    with ParamsWindow.Items.Add do
    begin
      Name := 'NO';
      Caption := 'Ýrsaliye No';
      Value := FAddManualBaglanti_No;
    end;
    with ParamsWindow.Items.Add do
    begin
      Name := 'TIP';
      Caption := 'Baðlantý';
      Value := FAddManualBaglanti_Tip;
      EditPropertiesClass := TcxImageComboBoxProperties;
      with Values.Add do
      begin
        Value := 2;
        Description := 'Ekle'
      end;
      with Values.Add do
      begin
        Value := 3;
        Description := 'Sil'
      end;
      ReadOnly := FAddManualBaglanti_Miktar = DataApp.UretimSiparisHareket.Table.Miktar;
    end;

    if FAddManualBaglanti_Miktar > 0 then
      ParamsWindow.Caption := 'Baðlantý Ekle'
    else
      ParamsWindow.Caption := 'Baðlantý Sil';
    Result := ParamsWindow.Execute;
    if Result then
    begin
      FAddManualBaglanti_Miktar := ParamsWindow['MIKTAR'];
      FAddManualBaglanti_Tarih := VarToDateTime(ParamsWindow['TARIH']);
      FAddManualBaglanti_No := ParamsWindow['NO'];
      FAddManualBaglanti_Tip := ParamsWindow['TIP'];
    end;
  end;
var
  pSarfYontem: Smallint;
begin
  if DataApp.UretimKart.Table.UretimDurum <> Integer(udReleased) then
    raise Exception.Create('Sadece serbest býrakýlmýþ üretim emirlerinde tüketim yapýlabilir!');
  if DataApp.UretimSiparisHareket.Table.GirisCikis = 0 then
    raise Exception.Create('Mamül giriþi buradan yapýlamaz!');
  try
    pSarfYontem := StrToInt(DataApp.DataController.FindStokKart.Find(DataApp.UretimSiparisHareket.Table.MalKod, 'SARFYONTEM'));
  except
    pSarfYontem := 0;
  end;
  if pSarfYontem > 0 then
    raise Exception.Create('Sarf yöntemi uygun deðil');

  PrepareParams;
  if not GetParams then
    Exit;
  DataApp.DataControllerUretimKart.AddManualBaglanti(TAppOpUpdateStatus(FAddManualBaglanti_Tip), FAddManualBaglanti_No, FAddManualBaglanti_Tarih, FAddManualBaglanti_Miktar);
end;

procedure TAppDOPBaseUretimKart.cbStokDurumBirimOnChange(Sender: TObject);
var
  ABirim: String;
begin
  ABirim := cbStokDurumBirim.Text;
  ABirim := FStokDurumBirimList.Values[ABirim];
  DataApp.StokDurum.dcStokDurum.GosterimBirim := ABirim;
  DataApp.StokDurum.Open(DataApp.UretimStokHareket.Table);
end;

procedure TAppDOPBaseUretimKart.cbStokDurumVersiyonGosterimTipOnChange(Sender: TObject);
var
  AStokDurumVersiyonGosterimTip: String;
begin
  AStokDurumVersiyonGosterimTip := cbStokDurumVersiyonGosterimTip.Text;
  AStokDurumVersiyonGosterimTip := FStokDurumVersiyonGosterimTipList.Values[AStokDurumVersiyonGosterimTip];
  try
    DataApp.StokDurum.dcStokDurum.VersiyonGosterimTip := StrToInt(AStokDurumVersiyonGosterimTip);
  except on EConvertError do
  end;
  DataApp.StokDurum.Open(DataApp.UretimStokHareket.Table);
end;

procedure TAppDOPBaseUretimKart.cbStokDurumDepoGosterimTipOnChange(Sender: TObject);
var
  AStokDurumDepoGosterimTip: String;
begin
  AStokDurumDepoGosterimTip := cbStokDurumDepoGosterimTip.Text;
  AStokDurumDepoGosterimTip := FStokDurumDepoGosterimTipList.Values[AStokDurumDepoGosterimTip];
  try
    DataApp.StokDurum.dcStokDurum.DepoGosterimTip := StrToInt(AStokDurumDepoGosterimTip);
  except on EConvertError do
  end;
  DataApp.StokDurum.Open(DataApp.UretimStokHareket.Table);
end;

procedure TAppDOPBaseUretimKart.cbStokDurumSeriGosterimTipOnChange(Sender: TObject);
var
  AStokDurumSeriGosterimTip: String;
begin
  AStokDurumSeriGosterimTip := cbStokDurumSeriGosterimTip.Text;
  AStokDurumSeriGosterimTip := FStokDurumSeriGosterimTipList.Values[AStokDurumSeriGosterimTip];
  try
    DataApp.StokDurum.dcStokDurum.SeriGosterimTip := StrToInt(AStokDurumSeriGosterimTip);
  except on EConvertError do
  end;
  DataApp.StokDurum.Open(DataApp.UretimStokHareket.Table);
end;

procedure TAppDOPBaseUretimKart.AutoStokDurumOnClick(Sender: TObject);
begin
  DataApp.StokDurum.IsAuto := btAutoStokDurum.Down;
  if btAutoStokDurum.Down then
    DataApp.StokDurum.Open(DataApp.UretimStokHareket.Table)
  else
    DataApp.StokDurum.Close;
end;

procedure TAppDOPBaseUretimKart.OnlyKullanilabilirStokDurumOnClick(
  Sender: TObject);
begin
  DataApp.StokDurum.dcStokDurum.OnlyExist := btOnlyKullanilabilirStokDurum.Down;
  DataApp.StokDurum.Open(DataApp.UretimStokHareket.Table);
end;

procedure TAppDOPBaseUretimKart.ChildStokDurumOnClick(Sender: TObject);
begin
  DataApp.StokDurum.Open(TableActiveStokHareket);
  FChildStokDurum.ShowChild;
end;

initialization
  AppRegisterDOPClass(TAppDOPUretimKart);

end.
