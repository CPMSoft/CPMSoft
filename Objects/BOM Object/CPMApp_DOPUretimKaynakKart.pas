unit CPMApp_DOPUretimKaynakKart;

interface

uses Windows, Classes, SysUtils, Controls, Variants, DB, DateUtils,
  dxBar, 
  CPMApp_DataObject, CPMApp_DataObjectDB,
  CPMApp_DocObjectModel, CPMApp_DocApp,
  CPMApp_DocChildMultiVGrid,
  CPMApp_DocChildVGrid,
  CPMApp_DocChildGrid,
  CPMApp_DocChildGridNote,
  CPMApp_DocChildSearchTable,
  CPMApp_DOPCustomUretimKaynakKart;

type
  TAppDOPUretimKaynakKart = class;

  TAppRuleUretimKaynakTakvimAjanOpen = class(TAppTableRule)
  private
    FDOPUretimKaynakKart: TAppDOPUretimKaynakKart;
  protected
    procedure DoBeforeOpen(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDOPUretimKaynakKart);
  end;

  TAppRuleUretimKaynakUretimDurumAjanOpen = class(TAppTableRule)
  private
    FDOPUretimKaynakKart: TAppDOPUretimKaynakKart;
  protected
    procedure DoBeforeOpen(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDOPUretimKaynakKart);
  end;

  TAppDOPUretimKaynakKart = class(TAppDOPCustomUretimKaynakKart)
  private
    FOldChildUretimKaynakKartAjanOnKeyDown: TKeyEvent;
  private
    FChildUretimKaynakKart: TAppDocChildMultiVGrid;
    FChildUretimKaynakDevamsizlik: TAppDocChildGrid;
    FChildUretimKaynakNot: TAppDocChildGridNote;
    FChildUretimKaynakMamulKurulum: TAppDocChildGrid;
    FChildUretimKaynakMamulDegisim: TAppDocChildGrid;
    FChildUretimKaynakKartAjan: TAppDocChildSearchTable;
    FChildUretimKaynakTakvimAjan: TAppDocChildSearchTable;
    FChildUretimKaynakUretimDurumAjan: TAppDocChildSearchTable;
    FChildUretimKaynakIslemTanim: TAppDocChildGrid;
    FChildUretimKaynakDemirbas: TAppDocChildGrid;
    FChildUretimKaynakAlternatifTanim: TAppDocChildGrid;

    // Rules
    FRuleUretimKaynakTakvimAjanOpen: TAppRuleUretimKaynakTakvimAjanOpen;
    FRuleUretimKaynakUretimDurumAjanOpen: TAppRuleUretimKaynakUretimDurumAjanOpen;
    // Click Events
    procedure ChildUretimKaynakKartAjanOnDblClick(Sender: TObject);
    procedure ChildUretimKaynakKartAjanOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CalcKaynakTakvimClick(Sender: TObject);
    procedure CalcKaynakMamulDegisimSure(pKaynakKod: string);
    procedure CalcKaynakMamulDegisimSureClick(Sender: TObject);
    procedure ShowAlanSecimForKaynakMamulKurulumClick(Sender: TObject);
    // Click Events
    // Create Childs;
    procedure CreateChildUretimKaynakKart;
    procedure CreateChildUretimKaynakDevamsizlik;
    procedure CreateChildUretimKaynakNot;
    procedure CreateChildUretimKaynakMamulKurulum;
    procedure CreateChildUretimKaynakMamulDegisim;
    procedure CreateChildUretimKaynakKartAjan;
    procedure CreateChildUretimKaynakTakvimAjan;
    procedure CreateChildUretimKaynakUretimDurumAjan;
    procedure CreateChildUretimKaynakIslemTanim;
    procedure CreateChildUretimKaynakDemirbas;
    procedure CreateChildUretimKaynakAlternatifTanim;
    procedure CreateRules;
    // Procededure
  protected
    procedure CreateDocChilds; override;
    procedure CreateMenuItems; override;
    procedure SetReport; override;
    procedure SetDAPSecurity; override;
  public
    procedure TranslationChanged; override;
  published
    property ChildUretimKaynakKart: TAppDocChildMultiVGrid read FChildUretimKaynakKart;
    property ChildUretimKaynakDevamsizlik: TAppDocChildGrid read FChildUretimKaynakDevamsizlik;
    property ChildUretimKaynakNot: TAppDocChildGridNote read FChildUretimKaynakNot;
    property ChildUretimKaynakMamulKurulum: TAppDocChildGrid read FChildUretimKaynakMamulKurulum;
    property ChildUretimKaynakMamulDegisim: TAppDocChildGrid read FChildUretimKaynakMamulDegisim;
    property ChildUretimKaynakIslemTanim: TAppDocChildGrid read FChildUretimKaynakIslemTanim;
    property ChildUretimKaynakDemirbas: TAppDocChildGrid read FChildUretimKaynakDemirbas;
    property ChildUretimKaynakAlternatifTanim: TAppDocChildGrid read FChildUretimKaynakAlternatifTanim;
    property ChildUretimKaynakKartAjan: TAppDocChildSearchTable read FChildUretimKaynakKartAjan;
    property ChildUretimKaynakTakvimAjan: TAppDocChildSearchTable read FChildUretimKaynakTakvimAjan;
    property ChildUretimKaynakUretimDurumAjan: TAppDocChildSearchTable read FChildUretimKaynakUretimDurumAjan;
  end;

implementation

uses
  CPMApp_Images, CPMApp_Dialogs, CPMApp_Date, 
  CPMApp_BOMConsts, CPMApp_BOMStrs, CPMApp_StrUtils, 
  CPMApp_TableBOMSystem, CPMApp_TableItems;

{ TAppDOPUretimKaynakKart }

procedure TAppDOPUretimKaynakKart.ChildUretimKaynakKartAjanOnDblClick(
  Sender: TObject);
begin
  with DataApp.DataObject.OptionsKey do
  begin
    KeyValues['KAYNAKKOD'] := ChildUretimKaynakKartAjan.Table.FieldValues['KAYNAKKOD'];
  end;
  DataApp.DataObject.Open;
  ChildUretimKaynakKart.ShowChild;
end;

procedure TAppDOPUretimKaynakKart.ChildUretimKaynakKartAjanOnKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldChildUretimKaynakKartAjanOnKeyDown) then
    FOldChildUretimKaynakKartAjanOnKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
  begin
    ChildUretimKaynakKartAjan.GridView.OnDblClick(Sender);
  end;
end;

procedure TAppDOPUretimKaynakKart.CreateChildUretimKaynakKart;
begin
  FChildUretimKaynakKart := DocObject.CreateChild(TAppDocChildMultiVGrid, 'ChildUretimKaynakKart') as TAppDocChildMultiVGrid;
  FChildUretimKaynakKart.Caption := AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakKart);
  FChildUretimKaynakKart.PipelineName := 'ppKaynakKart';
  FChildUretimKaynakKart.TableObject := DataApp.UretimKaynakKart.Table;
  FChildUretimKaynakKart.CreateButton('btUretimKaynakKart', 'Kaynak Kartý', 'Sayfalar');
end;

procedure TAppDOPUretimKaynakKart.CreateChildUretimKaynakDevamsizlik;
begin
  FChildUretimKaynakDevamsizlik := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimKaynakDevamsizlik') as TAppDocChildGrid;
  FChildUretimKaynakDevamsizlik.Caption := AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakDevamsizlik);
  FChildUretimKaynakDevamsizlik.PipelineName := 'ppKaynakDevamsizlik';
  FChildUretimKaynakDevamsizlik.TableObject := DataApp.UretimKaynakDevamsizlik.Table;
  FChildUretimKaynakDevamsizlik.CreateButton('btUretimKaynakDevamsizlik', 'Kaynak Devamsýzlýk', 'Sayfalar');
end;

procedure TAppDOPUretimKaynakKart.CreateChildUretimKaynakNot;
begin
  FChildUretimKaynakNot := DocObject.CreateChild(TAppDocChildGridNote, 'ChildUretimKaynakNot') as TAppDocChildGridNote;
  FChildUretimKaynakNot.Caption := AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakNot);
  FChildUretimKaynakNot.PipelineName := 'ppKaynakNot';
  FChildUretimKaynakNot.TableObject := DataApp.UretimKaynakNot.Table;
  FChildUretimKaynakNot.CreateButton('btUretimKaynakNot', 'Kaynak Not', 'Sayfalar');
end;

procedure TAppDOPUretimKaynakKart.CreateChildUretimKaynakMamulKurulum;
begin
  FChildUretimKaynakMamulKurulum := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimKaynakMamulKurulum') as TAppDocChildGrid;
  FChildUretimKaynakMamulKurulum.Caption := AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakMamulKurulum);
  FChildUretimKaynakMamulKurulum.PipelineName := 'ppKaynakMamulKurulum';
  FChildUretimKaynakMamulKurulum.TableObject := DataApp.UretimKaynakMamulKurulum.Table;
  FChildUretimKaynakMamulKurulum.CreateButton('btUretimKaynakMamulKurulum', 'Kaynak Mamül Kurulum', 'Sayfalar');
end;

procedure TAppDOPUretimKaynakKart.CreateChildUretimKaynakMamulDegisim;
begin
  FChildUretimKaynakMamulDegisim := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimKaynakMamulDegisim') as TAppDocChildGrid;
  FChildUretimKaynakMamulDegisim.Caption := AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakMamulDegisim);
  FChildUretimKaynakMamulDegisim.PipelineName := 'ppKaynakMamulDegisim';
  FChildUretimKaynakMamulDegisim.TableObject := DataApp.UretimKaynakMamulDegisim.Table;
  FChildUretimKaynakMamulDegisim.CreateButton('btUretimKaynakMamulDegisim', 'Kaynak Mamül Degisim', 'Sayfalar');
end;

procedure TAppDOPUretimKaynakKart.CreateChildUretimKaynakIslemTanim;
begin
  FChildUretimKaynakIslemTanim := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimKaynakIslemTanim') as TAppDocChildGrid;
  ChildUretimKaynakIslemTanim.Caption := AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakIslemTanim);
  ChildUretimKaynakIslemTanim.TableObject := DataApp.UretimKaynakIslemTanim.Table;
  ChildUretimKaynakIslemTanim.CreateButton('btUretimKaynakIslemTanim', ChildUretimKaynakIslemTanim.Caption, 'Sayfalar');

  DocObject.Macros.AddObject(Self, 'ChildUretimKaynakIslemTanim');
end;

procedure TAppDOPUretimKaynakKart.CreateChildUretimKaynakDemirbas;
begin
  FChildUretimKaynakDemirbas := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimKaynakDemirbas') as TAppDocChildGrid;
  ChildUretimKaynakDemirbas.Caption := AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakDemirbas);
  ChildUretimKaynakDemirbas.TableObject := DataApp.UretimKaynakDemirbas.Table;
  ChildUretimKaynakDemirbas.CreateButton('btUretimKaynakDemirbas', ChildUretimKaynakDemirbas.Caption, 'Sayfalar');

  DocObject.Macros.AddObject(Self, 'ChildUretimKaynakDemirbas');
end;

procedure TAppDOPUretimKaynakKart.CreateChildUretimKaynakAlternatifTanim;
begin
  FChildUretimKaynakAlternatifTanim := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimKaynakAlternatifTanim') as TAppDocChildGrid;
  ChildUretimKaynakAlternatifTanim.Caption := AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakAlternatifTanim);
  ChildUretimKaynakAlternatifTanim.TableObject := DataApp.UretimKaynakAlternatifTanim.Table;
  ChildUretimKaynakAlternatifTanim.CreateButton('btUretimKaynakAlternatifTanim', ChildUretimKaynakAlternatifTanim.Caption, 'Sayfalar');

  DocObject.Macros.AddObject(Self, 'ChildUretimKaynakAlternatifTanim');
end;

procedure TAppDOPUretimKaynakKart.CreateChildUretimKaynakKartAjan;
begin
  FChildUretimKaynakKartAjan := DocObject.CreateChild(TAppDocChildSearchTable, 'ChildUretimKaynakKartAjan') as TAppDocChildSearchTable;
  ChildUretimKaynakKartAjan.Caption := AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakKartAjan);
  ChildUretimKaynakKartAjan.AppName := 'UretimKaynakKartAjan';
  ChildUretimKaynakKartAjan.PipelineName := 'UretimKaynakKartIzleyici';
  ChildUretimKaynakKartAjan.CreateButton('btUretimKaynakKartAjan', 'Kaynak Kart Ýzleyici', 'Sayfalar', 'Ctrl+J');

  ChildUretimKaynakKartAjan.Table.TableItems.TableNames := VarArrayOf(['URTKYN']);
  ChildUretimKaynakKartAjan.Table.TableItems.TableCaptions := 'Kaynak Kartý';
  with ChildUretimKaynakKartAjan.Table.TableItems.OrderBy do
  begin
    Clear;
  end;
  with ChildUretimKaynakKartAjan.Table.TableItems[0].Fields do
  begin
    Clear;
    Add('*');
  end;

  ChildUretimKaynakKartAjan.GridView.OnDblClick := ChildUretimKaynakKartAjanOnDblClick;

  FOldChildUretimKaynakKartAjanOnKeyDown := FChildUretimKaynakKartAjan.GridView.OnKeyDown;
  FChildUretimKaynakKartAjan.GridView.OnKeyDown := ChildUretimKaynakKartAjanOnKeyDown;
end;

procedure TAppDOPUretimKaynakKart.CreateChildUretimKaynakTakvimAjan;
begin
  FChildUretimKaynakTakvimAjan := DocObject.CreateChild(TAppDocChildSearchTable, 'ChildUretimKaynakTakvimAjan') as TAppDocChildSearchTable;
  FChildUretimKaynakTakvimAjan.Caption := AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakTakvimAjan);
  FChildUretimKaynakTakvimAjan.AppName := 'UretimKaynakTakvimAjan';
  FChildUretimKaynakTakvimAjan.PipelineName := 'UretimKaynakTakvimIzleyici';
  FChildUretimKaynakTakvimAjan.CreateButton('btUretimKaynakTakvimAjan', 'Kaynak Takvim Ýzleyici', 'Sayfalar', '');

  FChildUretimKaynakTakvimAjan.Table.TableItems.TableNames := VarArrayOf(['URTKYT']);
  FChildUretimKaynakTakvimAjan.Table.TableItems.TableCaptions := 'Kaynak Takvim';
  with FChildUretimKaynakTakvimAjan.Table.TableItems[0].Fields do
  begin
    Clear;
    Add('*');
  end;
end;

procedure TAppDOPUretimKaynakKart.CreateChildUretimKaynakUretimDurumAjan;
begin
  FChildUretimKaynakUretimDurumAjan := DocObject.CreateChild(TAppDocChildSearchTable, 'ChildUretimKaynakUretimDurumAjan') as TAppDocChildSearchTable;
  FChildUretimKaynakUretimDurumAjan.Caption := AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakUretimDurumAjan);
  FChildUretimKaynakUretimDurumAjan.AppName := 'UretimKaynakUretimDurumAjan';
  FChildUretimKaynakUretimDurumAjan.PipelineName := 'UretimKaynakUretimDurumIzleyici';
  FChildUretimKaynakUretimDurumAjan.CreateButton('btUretimKaynakUretimDurumAjan', 'Kaynak Uretim Durum Ýzleyici', 'Sayfalar', '');

  FChildUretimKaynakUretimDurumAjan.Table.TableItems.TableNames := VarArrayOf(['VW_URETIM_KAYNAKDURUM', 'STKKRT', 'URTKRT']);
  FChildUretimKaynakUretimDurumAjan.Table.TableItems.TableReferans := VarArrayOf(['URTROK', 'STKKRT', 'URTKRT']);
  FChildUretimKaynakUretimDurumAjan.Table.TableItems.TableCaptions := VarArrayOf(['Kaynak Uretim Durum', 'Stok Kart', 'Üretim Kart']);
  with FChildUretimKaynakUretimDurumAjan.Table.TableItems[0].Fields do
  begin
    Clear;
    Add('*');
  end;
  with FChildUretimKaynakUretimDurumAjan.Table.TableItems[1].Fields do
  begin
    Clear;
    Add('MALAD');
  end;
  with FChildUretimKaynakUretimDurumAjan.Table.TableItems[1].Join do
  begin
    Clear;
    Add('MALKOD', 'MAMULKOD');
  end;
  with FChildUretimKaynakUretimDurumAjan.Table.TableItems[2].Fields do
  begin
    Clear;
    Add('EVRAKTARIH');
    Add('URETIMDURUM');
    Add('MAMULSERINO');
  end;
  with FChildUretimKaynakUretimDurumAjan.Table.TableItems[2].Join do
  begin
    Clear;
    Add('URETIMNO', 'URETIMNO');
    Add('EVRAKNO', 'EVRAKNO');
  end;
end;

procedure TAppDOPUretimKaynakKart.CreateRules;
begin
  if ChildUretimKaynakTakvimAjan <> nil then
    FRuleUretimKaynakTakvimAjanOpen := TAppRuleUretimKaynakTakvimAjanOpen.Create(Self);

  if ChildUretimKaynakUretimDurumAjan <> nil then
    FRuleUretimKaynakUretimDurumAjanOpen := TAppRuleUretimKaynakUretimDurumAjanOpen.Create(Self);
end;

procedure TAppDOPUretimKaynakKart.CreateDocChilds;
begin
  inherited;
  CreateChildUretimKaynakKart;
  CreateChildUretimKaynakDevamsizlik;
  CreateChildUretimKaynakNot;
  CreateChildUretimKaynakMamulKurulum;
  CreateChildUretimKaynakMamulDegisim;
  CreateChildUretimKaynakIslemTanim;
  CreateChildUretimKaynakDemirbas;
  CreateChildUretimKaynakAlternatifTanim;
  CreateChildUretimKaynakKartAjan;
  CreateChildUretimKaynakTakvimAjan;
  CreateChildUretimKaynakUretimDurumAjan;

  CreateRules;
end;

procedure TAppDOPUretimKaynakKart.CreateMenuItems;
var
  suAyarlar, suAraclar: TdxBarSubItem;
begin
  inherited;
  // Ayarlar
  suAyarlar := TdxBarSubItem(DocObject.DocBar.BarManager.GetItemByName('suAyarlar'));
  DocObject.DocBar.CreateButton('btShowAlanSecimForKaynakMamulKurulum', 'Kaynak Mamül Kurulum Alan Seçimi', 'Ayarlar', suAyarlar, '', ShowAlanSecimForKaynakMamulKurulumClick);

  // Araçlar
  suAraclar := TdxBarSubItem(DocObject.DocBar.BarManager.GetItemByName('suAraclar'));
  DocObject.DocBar.CreateButton('btCalcKaynakTakvim', 'Kaynak Takvimini Hesapla', 'Araçlar', suAraclar, '', CalcKaynakTakvimClick);
  DocObject.DocBar.CreateButton('btCalcKaynakMamulDegisimSure', 'Kaynak Mamül Deðiþim Sürelerini Hesapla', 'Araçlar', suAraclar, '', CalcKaynakMamulDegisimSureClick);
end;

procedure TAppDOPUretimKaynakKart.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.UretimKaynakKart.Table, 'URTKYN', 'Üretim Kaynak Kart');
end;

procedure TAppDOPUretimKaynakKart.SetReport;
begin
  inherited;
  DocObject.Report.MainTable := DataApp.UretimKaynakKart.Table;
end;

procedure TAppDOPUretimKaynakKart.ShowAlanSecimForKaynakMamulKurulumClick(
  Sender: TObject);
begin
  DataApp.UretimKaynakMamulKurulum.ShowFieldSettings('Kaynak Mamül Kurulum Alan Seçimi...', DataApp.UretimKaynakMamulKurulum.Table.Name);
end;

procedure TAppDOPUretimKaynakKart.TranslationChanged;
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

  if AppName = AppBOMConsts.AppName(odtUretimKaynakKart) then
    Caption := AppBOMConsts.Caption(odtUretimKaynakKart);

  SetChildCaption(ChildUretimKaynakKart, AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakKart));
  SetChildCaption(ChildUretimKaynakDevamsizlik, AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakDevamsizlik));
  SetChildCaption(ChildUretimKaynakNot, AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakNot));
  SetChildCaption(ChildUretimKaynakMamulKurulum, AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakMamulKurulum));
  SetChildCaption(ChildUretimKaynakMamulDegisim, AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakMamulDegisim));
  SetChildCaption(ChildUretimKaynakIslemTanim, AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakIslemTanim));
  SetChildCaption(ChildUretimKaynakDemirbas, AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakDemirbas));
  SetChildCaption(ChildUretimKaynakAlternatifTanim, AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakAlternatifTanim));
  SetChildCaption(ChildUretimKaynakKartAjan, AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakKartAjan));
  SetChildCaption(ChildUretimKaynakTakvimAjan, AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakTakvimAjan));
  SetChildCaption(ChildUretimKaynakUretimDurumAjan, AppGetRS(@AppDOPUretimKaynakKart_ChildUretimKaynakUretimDurumajan));
end;

procedure TAppDOPUretimKaynakKart.CalcKaynakTakvimClick(Sender: TObject);
var
  TableKaynakKart: TTableUretimKaynakKart;
  TableKaynakDevamsizlik: TTableUretimKaynakDevamsizlik;
  TableKaynakTakvim: TTableUretimKaynakTakvim;

  TableVardiyaKaynak: TTableUretimVardiyaKaynak;
  TableVardiyaSaat: TTableUretimVardiyaSaat;

  TableYilTatil: TTableUretimYilTatil;

  AKapasite, AVerimlilik: Double;
  AKaynakKod, STakvimYil: string;
  ATakvimYil: Integer;
  SifirZaman: TDateTime;

  procedure PrepareTables;
  begin
    TableKaynakKart := DataApp.UretimKaynakKart.Table;

    TableKaynakDevamsizlik := DataApp.UretimKaynakDevamsizlik.Table;
    TableKaynakDevamsizlik.IndexFieldNames := 'TARIH;BASSAAT;BITSAAT';

    TableKaynakTakvim := TTableUretimKaynakTakvim.Create(nil);
    TableKaynakTakvim.Name := 'TableUretimKaynakTakvim';
    TableKaynakTakvim.TableItems.TableNames := 'URTKYT';
    TableKaynakTakvim.Connection := Connection;
    Connection.CPMAppServer.AddProvider(TableKaynakTakvim.ProviderName);

    TableVardiyaKaynak := TTableUretimVardiyaKaynak.Create(nil);
    TableVardiyaKaynak.Name := 'TableUretimVardiyaKaynakCalcTakvim';
    TableVardiyaKaynak.TableItems.TableNames := VarArrayOf(['URTVRK']);
    TableVardiyaKaynak.Connection := Connection;
    Connection.CPMAppServer.AddProvider(TableVardiyaKaynak.ProviderName);
    TableVardiyaKaynak.IndexFieldNames := 'VARDIYAKOD';

    TableVardiyaSaat := TTableUretimVardiyaSaat.Create(nil);
    TableVardiyaSaat.Name := 'TableUretimVardiyaSaatCalcTakvim';
    TableVardiyaSaat.TableItems.TableNames := VarArrayOf(['URTVRS']);
    TableVardiyaSaat.Connection := Connection;
    Connection.CPMAppServer.AddProvider(TableVardiyaSaat.ProviderName);
    TableVardiyaSaat.IndexFieldNames := 'VARDIYAKOD;GUN';

    TableYilTatil := TTableUretimYilTatil.Create(nil);
    TableYilTatil.Name := 'TableUretimYilTatilCalcTakvim';
    TableYilTatil.TableItems.TableNames := VarArrayOf(['URTYRT']);
    TableYilTatil.Connection := Connection;
    Connection.CPMAppServer.AddProvider(TableYilTatil.ProviderName);
    TableYilTatil.IndexFieldNames := 'TARIH;BASSAAT;BITSAAT';
  end;

  procedure OpenTableVardiyaKaynak(pKaynakKod: string);
  begin
    with TableVardiyaKaynak.TableItems[0].Where do
    begin
      Clear;
      Add('KAYNAKKOD', wcEqual, pKaynakKod);
    end;
    TableVardiyaKaynak.Open;
  end;

  procedure OpenTableKaynakTakvim(pKaynakKod: string; pTakvimYil: Integer);
  begin
    with TableKaynakTakvim.TableItems[0].Where do
    begin
      Clear;
      Add('KAYNAKKOD', wcEqual, pKaynakKod);
      AddOperator(woAnd);
      Add('TAKVIMYIL', wcEqual, pTakvimYil);
    end;
    TableKaynakTakvim.Open;
  end;

  procedure OpenTableVardiyaSaat;
  begin
    with TableVardiyaSaat.TableItems[0].Where do
    begin
      Clear;
    end;
    TableVardiyaSaat.Open;
  end;

  procedure OpenTableYilTatil(pTakvimYil: Integer);
  begin
    with TableYilTatil.TableItems[0].Where do
    begin
      Clear;
      Add('TAKVIMYIL', wcEqual, ATakvimYil);
    end;
    TableYilTatil.Open;
  end;

  procedure CalcKaynakTakvim;
  var
    ABasTarih, ABasSaat, ABitSaat: TDateTime;
    BKapasite, AToplamKapasite, AEtkinKapasite: Double;
    AVardiyaKod: string;
    I, ADakika: Integer;
  begin
    AVardiyaKod := TableKaynakTakvim.VardiyaKod;
    ABasTarih := TableKaynakTakvim.Tarih;
    BKapasite := AKapasite;
    I := DayOfTheWeek(ABasTarih);
    if TableVardiyaSaat.FindKey([AVardiyaKod, I]) then
    begin
      ABasSaat := TableVardiyaSaat.BasSaat;
      ABitSaat := TableVardiyaSaat.BitSaat;

      if TableYilTatil.FindKey([ABasTarih, SifirZaman, SifirZaman]) then
        BKapasite := 0
      else if TableYilTatil.FindKey([ABasTarih, ABasSaat, ABitSaat]) then
        BKapasite := 0;

      if TableKaynakDevamsizlik.FindKey([ABasTarih, SifirZaman, SifirZaman]) then
        BKapasite := BKapasite - TableKaynakDevamsizlik.Kapasite
      else if TableKaynakDevamsizlik.FindKey([ABasTarih, ABasSaat, ABitSaat]) then
        BKapasite := BKapasite - TableKaynakDevamsizlik.Kapasite;

      if BKapasite < 0 then
        raise Exception.Create(format('Kapasite sýfýrýn altýna düþtü, kaynak kartýný ve kaynak devamsýzlýk tablosunu kontrol ediniz. Kaynak Kodu: %s',[AKaynakKod]));

      ADakika := MinutesBetween(ABasSaat, ABitSaat);
      if MinuteSpan(ABasSaat, ABitSaat) > ADakika then
        ADakika := ADakika + 1; 
      AToplamKapasite := ADakika * BKapasite;
      AEtkinKapasite := AToplamKapasite * AVerimlilik / 100;

      if (TableKaynakTakvim.BasSaat <> ABasSaat) or (TableKaynakTakvim.BitSaat <> ABitSaat) or (TableKaynakTakvim.Kapasite <> BKapasite) or (TableKaynakTakvim.Verimlilik <> AVerimlilik) then
      begin
        TableKaynakTakvim.Edit;
        TableKaynakTakvim.BasTarihSaat := ABasTarih + ABasSaat;
        TableKaynakTakvim.BasSaat := ABasSaat;
        TableKaynakTakvim.BitTarihSaat := ABasTarih + ABitSaat;
        TableKaynakTakvim.BitSaat := ABitSaat;
        TableKaynakTakvim.Kapasite := BKapasite;
        TableKaynakTakvim.Verimlilik := AVerimlilik;
        TableKaynakTakvim.ToplamKapasite := AToplamKapasite;
        TableKaynakTakvim.EtkinKapasite := AEtkinKapasite;
        TableKaynakTakvim.Post;
      end;
    end;
  end;
begin
  if DataApp.DataObject.IsDataChanged then
    raise Exception.Create('Önce yaptýðýnýz deðiþiklikleri kaydetmelisiniz.');

  ATakvimYil := YearOf(Date);
  STakvimYil := IntToStr(ATakvimYil);
  if not AppInputQuery('Güncelleþtirilecek Takvim Yýlýný Giriniz...', 'Takvim Yýlý', STakvimYil) then
    Exit;

  try
    ATakvimYil := StrToInt(STakvimYil);
  except on E:EConvertError do
    raise Exception.Create(format('%s geçerli bir yýl deðil. ' + E.Message, [STakvimYil]));
  end;

  if not AppConfirm(format('%s nolu kaynaðýn %s yýlý takvimi güncellenecek, devam etmek istediðinize eminmisiniz?', [DataApp.UretimKaynakKart.Table.KaynakKod, STakvimYil])) then
    Exit;

  SifirZaman := AppDateHelper.FirstDateZeroTime;

  try
    PrepareTables;

    AKaynakKod := TableKaynakKart.KaynakKod;
    AKapasite := TableKaynakKart.Kapasite;
    AVerimlilik := TableKaynakKart.Verimlilik;

    OpenTableVardiyaKaynak(AKaynakKod);
    OpenTableKaynakTakvim(AKaynakKod, ATakvimYil);
    OpenTableVardiyaSaat;
    OpenTableYilTatil(ATakvimYil);

    TableKaynakTakvim.First;
    while not TableKaynakTakvim.Eof do
    begin
      CalcKaynakTakvim;
      TableKaynakTakvim.Next;
    end;
    TableKaynakTakvim.Save;
    ChildUretimKaynakTakvimAjan.ShowChild;
    ChildUretimKaynakTakvimAjan.Run;
    AppShowMessage('Kaynak takvimi güncellendi');
  finally
    if TableKaynakTakvim <> nil then
      FreeAndNil(TableKaynakTakvim);
    if TableVardiyaKaynak <> nil then
      FreeAndNil(TableVardiyaKaynak);
    if TableVardiyaSaat <> nil then
      FreeAndNil(TableVardiyaSaat);
    if TableYilTatil <> nil then
      FreeAndNil(TableYilTatil);
  end;
end;

procedure TAppDOPUretimKaynakKart.CalcKaynakMamulDegisimSure(pKaynakKod: string);
var
  TableKaynakKart: TTableUretimKaynakKart;
  TableMamulRotaKaynak, TableMamulRotaKaynakClone: TTableMamulRotaKaynak;
  TableKaynakMamulKurulum: TTableUretimKaynakMamulKurulum;
  TableKaynakMamulDegisim: TTableUretimKaynakMamulDegisim;
  procedure PrepareTables;
  begin
    TableKaynakKart := TTableUretimKaynakKart.Create(nil);
    TableKaynakKart.Name := 'TableUretimKaynakKartCalcMamulDegisim';
    TableKaynakKart.ProviderName := 'prTableUretimKaynakKartCalcMamulDegisim';
    TableKaynakKart.TableItems.TableNames := VarArrayOf(['URTKYN']);
    TableKaynakKart.Connection := Connection;
    Connection.CPMAppServer.AddProvider(TableKaynakKart.ProviderName);
    TableKaynakKart.IndexFieldNames := '';

    TableKaynakMamulKurulum := TTableUretimKaynakMamulKurulum.Create(nil);
    TableKaynakMamulKurulum.Name := 'TableUretimKaynakMamulKurulumCalcMamulDegisim';
    TableKaynakMamulKurulum.ProviderName := 'prTableUretimKaynakMamulKurulumCalcMamulDegisim';
    TableKaynakMamulKurulum.TableItems.TableNames := VarArrayOf(['URTKMK']);
    TableKaynakMamulKurulum.Connection := Connection;
    Connection.CPMAppServer.AddProvider(TableKaynakMamulKurulum.ProviderName);
    TableKaynakMamulKurulum.IndexFieldNames := 'MAMULKOD';

    TableKaynakMamulDegisim := TTableUretimKaynakMamulDegisim.Create(nil);
    TableKaynakMamulDegisim.Name := 'TableUretimKaynakMamulDegisimCalcMamulDegisim';
    TableKaynakMamulDegisim.ProviderName := 'prTableUretimKaynakMamulDegisimCalcMamulDegisim';
    TableKaynakMamulDegisim.TableItems.TableNames := VarArrayOf(['URTKMD']);
    TableKaynakMamulDegisim.Connection := Connection;
    Connection.CPMAppServer.AddProvider(TableKaynakMamulDegisim.ProviderName);
    TableKaynakMamulDegisim.IndexFieldNames := 'KURULUMMAMULKOD;SOKUMMAMULKOD';

    TableMamulRotaKaynak := TTableMamulRotaKaynak.Create(nil);
    TableMamulRotaKaynak.Name := 'TableMamulRotaKaynakCalcMamulDegisim';
    TableMamulRotaKaynak.ProviderName := 'prTableMamulRotaKaynakCalcMamulDegisim';
    TableMamulRotaKaynak.TableItems.TableNames := VarArrayOf(['MAMKYN','MAMBAS']);
    TableMamulRotaKaynak.Connection := Connection;
    Connection.CPMAppServer.AddProvider(TableMamulRotaKaynak.ProviderName);
    TableMamulRotaKaynak.IndexFieldNames := 'MAMULKOD';
    with TableMamulRotaKaynak.TableItems[1] do
    begin
      with Fields do
      begin
        Clear;
        Add('KURULUMKOD1');
        Add('KURULUMKOD2');
        Add('KURULUMKOD3');
        Add('KURULUMKOD4');
        Add('KURULUMKOD5');
        Add('SOKUMKOD1');
        Add('SOKUMKOD2');
      end;
      with Join do
      begin
        Clear;
        Add('SIRKETNO', 'SIRKETNO');
        Add('MAMULKOD', 'MAMULKOD');
        Add('VERSIYONNO', 'VERSIYONNO');
      end;
    end;

    TableMamulRotaKaynakClone := TTableMamulRotaKaynak.Create(nil);
    TableMamulRotaKaynakClone.Name := TableMamulRotaKaynak.Name;
    TableMamulRotaKaynakClone.ProviderName := TableMamulRotaKaynak.ProviderName;
    TableMamulRotaKaynakClone.Connection := Connection;
    TableMamulRotaKaynak.AddClone(TableMamulRotaKaynakClone);
    TableMamulRotaKaynakClone.IndexFieldNames := 'MAMULKOD';
  end;
  procedure OpenTableKaynakKart(pKaynakKod: string);
  begin
    with TableKaynakKart.TableItems[0].Where do
    begin
      Clear;
      Add('KAYNAKKOD', wcEqual, pKaynakKod);
    end;
    TableKaynakKart.Open;
  end;
  procedure OpenTableKaynakMamulKurulum(pKaynakKod: string);
  begin
    with TableKaynakMamulKurulum.TableItems[0].Where do
    begin
      Clear;
      Add('KAYNAKKOD', wcEqual, pKaynakKod);
    end;
    TableKaynakMamulKurulum.Open;
  end;
  procedure OpenTableKaynakMamulDegisim(pKaynakKod: string);
  begin
    with TableKaynakMamulDegisim.TableItems[0].Where do
    begin
      Clear;
      Add('KAYNAKKOD', wcEqual, pKaynakKod);
    end;
    TableKaynakMamulDegisim.Open;
  end;
  procedure OpenTableMamulRotaKaynak(pKaynakKod: string);
  begin
    with TableMamulRotaKaynak.TableItems[0].Where do
    begin
      Clear;
      Add('KAYNAKKOD', wcEqual, pKaynakKod);
    end;
    TableMamulRotaKaynak.Open;
  end;
  procedure GotoMamulRotaKaynak;
    function GetKurulumSure: Double;
    begin
      Result := 0;
      if TableKaynakMamulKurulum.FindKey([TableMamulRotaKaynak.MamulKod]) then
      begin
        if TableMamulRotaKaynak.KurulumKod1 <> TableMamulRotaKaynakClone.KurulumKod1 then
          Result := TableKaynakMamulKurulum.KurulumSure1;
        if TableMamulRotaKaynak.KurulumKod2 <> TableMamulRotaKaynakClone.KurulumKod2 then
          if Result < TableKaynakMamulKurulum.KurulumSure2 then
            Result := TableKaynakMamulKurulum.KurulumSure2;
        if TableMamulRotaKaynak.KurulumKod3 <> TableMamulRotaKaynakClone.KurulumKod3 then
          if Result < TableKaynakMamulKurulum.KurulumSure3 then
            Result := TableKaynakMamulKurulum.KurulumSure3;
        if TableMamulRotaKaynak.KurulumKod4 <> TableMamulRotaKaynakClone.KurulumKod4 then
          if Result < TableKaynakMamulKurulum.KurulumSure4 then
            Result := TableKaynakMamulKurulum.KurulumSure4;
        if TableMamulRotaKaynak.KurulumKod5 <> TableMamulRotaKaynakClone.KurulumKod5 then
          if Result < TableKaynakMamulKurulum.KurulumSure5 then
            Result := TableKaynakMamulKurulum.KurulumSure5;
      end else
        Result := TableKaynakKart.KurulumSure;
    end;
    function GetSokumSure: Double;
    begin
      Result := 0;
      if TableKaynakMamulKurulum.FindKey([TableMamulRotaKaynakClone.MamulKod]) then
      begin
        if TableMamulRotaKaynak.SokumKod1 <> TableMamulRotaKaynakClone.SokumKod1 then
          Result := TableKaynakMamulKurulum.SokumSure1;
        if TableMamulRotaKaynak.SokumKod2 <> TableMamulRotaKaynakClone.SokumKod2 then
          if Result < TableKaynakMamulKurulum.SokumSure2 then
            Result := TableKaynakMamulKurulum.SokumSure2;
      end else
        Result := TableKaynakKart.SokumSure;
    end;
    procedure InsertMamulDegisim;
    begin
      if TableKaynakMamulDegisim.FindKey([TableMamulRotaKaynak.MamulKod, TableMamulRotaKaynakClone.MamulKod]) then
        TableKaynakMamulDegisim.Edit
      else
        TableKaynakMamulDegisim.Insert;
      TableKaynakMamulDegisim.KaynakKod := pKaynakKod;
      TableKaynakMamulDegisim.KurulumMamulKod := TableMamulRotaKaynak.MamulKod;
      TableKaynakMamulDegisim.KurulumSure := GetKurulumSure;
      TableKaynakMamulDegisim.SokumMamulKod := TableMamulRotaKaynakClone.MamulKod;
      TableKaynakMamulDegisim.SokumSure := GetSokumSure;
      TableKaynakMamulDegisim.ToplamSure := TableKaynakMamulDegisim.KurulumSure + TableKaynakMamulDegisim.SokumSure;
      TableKaynakMamulDegisim.Post;
    end;
  begin
    TableMamulRotaKaynak.First;
    while not TableMamulRotaKaynak.Eof do
    begin
      TableMamulRotaKaynakClone.First;
      while not TableMamulRotaKaynakClone.Eof do
      begin
        InsertMamulDegisim;
        TableMamulRotaKaynakClone.Next;
      end;
      TableMamulRotaKaynak.Next;
    end;
  end;
begin
  PrepareTables;
  OpenTableKaynakKart(pKaynakKod);
  OpenTableKaynakMamulKurulum(pKaynakKod);
  OpenTableKaynakMamulDegisim(pKaynakKod);
  OpenTableMamulRotaKaynak(pKaynakKod);
  try
    GotoMamulRotaKaynak;
    TableKaynakMamulDegisim.Save;
    AppShowMessage('Kaynak mamül deðiþim süreleri güncellendi');
  finally
    FreeAndNil(TableKaynakKart);
    FreeAndNil(TableKaynakMamulKurulum);
    FreeAndNil(TableKaynakMamulDegisim);
    FreeAndNil(TableMamulRotaKaynak);
  end;
end;

procedure TAppDOPUretimKaynakKart.CalcKaynakMamulDegisimSureClick(Sender: TObject);
begin
  CalcKaynakMamulDegisimSure(DataApp.UretimKaynakKart.Table.KaynakKod);
end;

{ TAppRuleUretimKaynakTakvimAjanOpen }

constructor TAppRuleUretimKaynakTakvimAjanOpen.Create(
  AOwner: TAppDOPUretimKaynakKart);
begin
  inherited Create;
  FDOPUretimKaynakKart := AOwner;
  AddRule(FDOPUretimKaynakKart.ChildUretimKaynakTakvimAjan.Table);
end;

procedure TAppRuleUretimKaynakTakvimAjanOpen.DoBeforeOpen(
  Table: TAppCustomTable);
begin
  inherited;
  with Table.TableItems[0].Where do
  begin
    Clear;
    Add('KAYNAKKOD', wcEqual, FDOPUretimKaynakKart.DataApp.UretimKaynakKart.Table.KaynakKod).DataType := ftString;
  end;
  FDOPUretimKaynakKart.FChildUretimKaynakTakvimAjan.Table.DataSet.CommandText := FDOPUretimKaynakKart.FChildUretimKaynakTakvimAjan.Table.TableItems.Clause;
end;

{ TAppRuleUretimKaynakUretimDurumAjanOpen }

constructor TAppRuleUretimKaynakUretimDurumAjanOpen.Create(
  AOwner: TAppDOPUretimKaynakKart);
begin
  inherited Create;
  FDOPUretimKaynakKart := AOwner;
  AddRule(FDOPUretimKaynakKart.ChildUretimKaynakUretimDurumAjan.Table);
end;

procedure TAppRuleUretimKaynakUretimDurumAjanOpen.DoBeforeOpen(
  Table: TAppCustomTable);
begin
  inherited;
  with Table.TableItems[0].Where do
  begin
    Clear;
    Add('KAYNAKKOD', wcEqual, FDOPUretimKaynakKart.DataApp.UretimKaynakKart.Table.KaynakKod).DataType := ftString;
  end;
  FDOPUretimKaynakKart.FChildUretimKaynakUretimDurumAjan.Table.DataSet.CommandText := FDOPUretimKaynakKart.FChildUretimKaynakUretimDurumAjan.Table.TableItems.Clause;
end;

initialization
  AppRegisterDOPClass(TAppDOPUretimKaynakKart);

end.
