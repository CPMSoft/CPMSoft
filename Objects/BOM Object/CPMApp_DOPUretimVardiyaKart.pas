unit CPMApp_DOPUretimVardiyaKart;

interface

uses Windows, Classes, SysUtils, Controls, Variants, DB, DateUtils,
  CPMApp_DataObject, CPMApp_DataObjectDB,
  CPMApp_DocObjectModel, CPMApp_DocApp,
  CPMApp_DocChildVGrid,
  CPMApp_DocChildGrid,
  CPMApp_DocChildMasterDetail,
  CPMApp_DOPCustomUretimVardiyaKart;

type
  TAppDOPUretimVardiyaKart = class;

  TAppRuleUretimVardiyaKartAjanDetailOpen = class(TAppTableRule)
  private
    FDOPUretimVardiyaKart: TAppDOPUretimVardiyaKart;
  protected
    procedure DoBeforeOpen(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDOPUretimVardiyaKart);
  end;

  TAppDOPUretimVardiyaKart = class(TAppDOPCustomUretimVardiyaKart)
  private
    FOldChildUretimVardiyaKartAjanOnKeyDown: TKeyEvent;
  private
    FChildUretimVardiyaKart: TAppDocChildVGrid;
    FChildUretimVardiyaKaynak: TAppDocChildGrid;
    FChildUretimVardiyaSaat: TAppDocChildGrid;
    FChildUretimVardiyaKartAjan: TAppDocChildMasterDetail;
    // Rules
    FRuleUretimVardiyaKartAjanDetailOpen: TAppRuleUretimVardiyaKartAjanDetailOpen;
    // Click Events
    procedure ChildUretimVardiyaKartAjanOnDblClick(Sender: TObject);
    procedure ChildUretimVardiyaKartAjanOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CalcKaynakTakvimClick(Sender: TObject);
    // Click Events
    // Create Childs;
    procedure CreateChildUretimVardiyaKart;
    procedure CreateChildUretimVardiyaKaynak;
    procedure CreateChildUretimVardiyaSaat;
    procedure CreateChildUretimVardiyaKartAjan;
    // Create Rules
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
    property ChildUretimVardiyaKart: TAppDocChildVGrid read FChildUretimVardiyaKart;
    property ChildUretimVardiyaKaynak: TAppDocChildGrid read FChildUretimVardiyaKaynak;
    property ChildUretimVardiyaSaat: TAppDocChildGrid read FChildUretimVardiyaSaat;
    property ChildUretimVardiyaKartAjan: TAppDocChildMasterDetail read FChildUretimVardiyaKartAjan;
  end;

implementation

uses
  CPMApp_Images, CPMApp_Dialogs, CPMApp_Date, CPMApp_TableItems, 
  CPMApp_BOMConsts, CPMApp_BOMStrs, CPMApp_StrUtils, 
  CPMApp_TableBOMSystem;

{ TAppDOPUretimVardiyaKart }

procedure TAppDOPUretimVardiyaKart.ChildUretimVardiyaKartAjanOnDblClick(
  Sender: TObject);
begin
  with DataApp.DataObject.OptionsKey do
  begin
    KeyValues['SIRKETNO'] := ChildUretimVardiyaKartAjan.TableMaster.FieldValues['SIRKETNO'];
    KeyValues['VARDIYAKOD'] := ChildUretimVardiyaKartAjan.TableMaster.FieldValues['VARDIYAKOD'];
  end;
  DataApp.DataObject.Open;
  ChildUretimVardiyaKart.ShowChild;
end;

procedure TAppDOPUretimVardiyaKart.ChildUretimVardiyaKartAjanOnKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldChildUretimVardiyaKartAjanOnKeyDown) then
    FOldChildUretimVardiyaKartAjanOnKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
    ChildUretimVardiyaKartAjan.GridViewMaster.OnDblClick(Sender);
end;

procedure TAppDOPUretimVardiyaKart.CreateChildUretimVardiyaKart;
begin
  FChildUretimVardiyaKart := DocObject.CreateChild(TAppDocChildVGrid, 'ChildUretimVardiyaKart') as TAppDocChildVGrid;
  FChildUretimVardiyaKart.Caption := AppGetRS(@AppDOPUretimVardiyaKart_ChildUretimVardiyaKart);
  FChildUretimVardiyaKart.TableObject := DataApp.UretimVardiyaKart.Table;
  FChildUretimVardiyaKart.CreateButton('btUretimVardiyaKart', FChildUretimVardiyaKart.Caption, 'Sayfalar');
end;

procedure TAppDOPUretimVardiyaKart.CreateChildUretimVardiyaKaynak;
begin
  FChildUretimVardiyaKaynak := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimVardiyaKaynak') as TAppDocChildGrid;
  FChildUretimVardiyaKaynak.Caption := AppGetRS(@AppDOPUretimVardiyaKart_ChildUretimVardiyaKaynak);
  FChildUretimVardiyaKaynak.TableObject := DataApp.UretimVardiyaKaynak.Table;
  FChildUretimVardiyaKaynak.CreateButton('btUretimVardiyaKaynak', FChildUretimVardiyaKaynak.Caption, 'Sayfalar');
end;

procedure TAppDOPUretimVardiyaKart.CreateChildUretimVardiyaSaat;
begin
  FChildUretimVardiyaSaat := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimVardiyaSaat') as TAppDocChildGrid;
  FChildUretimVardiyaSaat.Caption := AppGetRS(@AppDOPUretimVardiyaKart_ChildUretimVardiyaSaat);
  FChildUretimVardiyaSaat.TableObject := DataApp.UretimVardiyaSaat.Table;
  FChildUretimVardiyaSaat.CreateButton('btUretimVardiyaSaat', FChildUretimVardiyaSaat.Caption, 'Sayfalar');
end;

procedure TAppDOPUretimVardiyaKart.CreateChildUretimVardiyaKartAjan;
begin
  FChildUretimVardiyaKartAjan := DocObject.CreateChild(TAppDocChildMasterDetail, 'ChildUretimVardiyaKartAjan') as TAppDocChildMasterDetail;
  FChildUretimVardiyaKartAjan.Caption := AppGetRS(@AppDOPUretimVardiyaKart_ChildUretimVardiyaKartAjan);
  FChildUretimVardiyaKartAjan.FormName := 'UretimVardiyaKartAjanForm';
  FChildUretimVardiyaKartAjan.AppName := Self.AppName +  '\UretimVardiyaKartAjan';
  FChildUretimVardiyaKartAjan.PipelineMasterName := 'ppVardiyaKartIzleyiciBaslik';
  FChildUretimVardiyaKartAjan.PipelineDetailName := 'ppVardiyaKartIzleyiciDetay';
  FChildUretimVardiyaKartAjan.CreateButton('btUretimVardiyaKartAjan', FChildUretimVardiyaKartAjan.Caption, 'Sayfalar', 'Ctrl+J');

  FChildUretimVardiyaKartAjan.TableMaster.TableItems.TableNames := 'URTVRB';
  FChildUretimVardiyaKartAjan.TableMaster.TableItems.TableCaptions := 'Vardiya Kartý';
  with FChildUretimVardiyaKartAjan.TableMaster.TableItems.OrderBy do
  begin
    Clear;
    Add('SIRKETNO');
    Add('VARDIYAKOD');
    Add('VARDIYAAD')
  end;

  FChildUretimVardiyaKartAjan.TableDetail.TableItems.TableNames := 'URTVRS';
  FChildUretimVardiyaKartAjan.TableDetail.TableItems.TableCaptions := 'Vardiya Saat';

  FChildUretimVardiyaKartAjan.GridViewMaster.OnDblClick := ChildUretimVardiyaKartAjanOnDblClick;
  FOldChildUretimVardiyaKartAjanOnKeyDown := FChildUretimVardiyaKartAjan.GridViewMaster.OnKeyDown;
  FChildUretimVardiyaKartAjan.GridViewMaster.OnKeyDown := ChildUretimVardiyaKartAjanOnKeyDown;
end;

procedure TAppDOPUretimVardiyaKart.CreateRules;
begin
  if ChildUretimVardiyaKartAjan <> nil then
    FRuleUretimVardiyaKartAjanDetailOpen := TAppRuleUretimVardiyaKartAjanDetailOpen.Create(Self);
end;

procedure TAppDOPUretimVardiyaKart.CreateDocChilds;
begin
  inherited;
  CreateChildUretimVardiyaKart;
  CreateChildUretimVardiyaKaynak;
  CreateChildUretimVardiyaSaat;
  CreateChildUretimVardiyaKartAjan;

  CreateRules;
end;

procedure TAppDOPUretimVardiyaKart.CreateMenuItems;
begin
  inherited;
  DocObject.CreateButton('btCalcKaynakTakvim', 'Kaynak Takvimini Oluþtur', 'Araçlar', '', CalcKaynakTakvimClick);
end;

procedure TAppDOPUretimVardiyaKart.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.UretimVardiyaKart.Table, 'URTVRB', 'Üretim Vardiya Kart');
  Security.AddTable(DataApp.UretimVardiyaKaynak.Table, 'URTVRK', 'Üretim Vardiya Kaynak');
  Security.AddTable(DataApp.UretimVardiyaSaat.Table, 'URTVRS', 'Üretim Vardiya Saat');
end;

procedure TAppDOPUretimVardiyaKart.SetReport;
begin
  inherited;
  DocObject.Report.MainTable := DataApp.UretimVardiyaKart.Table;
end;

procedure TAppDOPUretimVardiyaKart.TranslationChanged;
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

  if AppName = AppBOMConsts.AppName(odtUretimVardiyaKart) then
    Caption := AppBOMConsts.Caption(odtUretimVardiyaKart);

  SetChildCaption(ChildUretimVardiyaKart, AppGetRS(@AppDOPUretimVardiyaKart_ChildUretimVardiyaKart));
  SetChildCaption(ChildUretimVardiyaKaynak, AppGetRS(@AppDOPUretimVardiyaKart_ChildUretimVardiyaKaynak));
  SetChildCaption(ChildUretimVardiyaSaat, AppGetRS(@AppDOPUretimVardiyaKart_ChildUretimVardiyaSaat));
  SetChildCaption(ChildUretimVardiyaKartAjan, AppGetRS(@AppDOPUretimVardiyaKart_ChildUretimVardiyaKartAjan));
end;

procedure TAppDOPUretimVardiyaKart.CalcKaynakTakvimClick(Sender: TObject);
var
  TableVardiyaKart: TTableUretimVardiyaKart;
  TableVardiyaKaynak: TTableUretimVardiyaKaynak;
  TableVardiyaSaat: TTableUretimVardiyaSaat;
  TableYilTatil: TTableUretimYilTatil;
  TableKaynakTakvim: TTableUretimKaynakTakvim;
  TableKaynakDevamsizlik: TTableUretimKaynakDevamsizlik;

  ABasTarih, ABitTarih: TDateTime;
  AKapasite, AVerimlilik: Double;
  AKaynakKod, AVardiyaKod, STakvimYil: string;
  I, ATakvimYil: Integer;
  SifirZaman: TDateTime;

  TableVardiyaSaatOldIndex: string;

  procedure PrepareTables;
  begin
    TableVardiyaKart := DataApp.UretimVardiyaKart.Table;
    TableVardiyaKaynak := DataApp.UretimVardiyaKaynak.Table;
    TableVardiyaSaat := DataApp.UretimVardiyaSaat.Table;
    TableVardiyaSaatOldIndex := TableVardiyaSaat.IndexFieldNames;
    TableVardiyaSaat.IndexFieldNames := 'GUN;BASSAAT;BITSAAT';

    // Tatil Tarihleri Tablosu
    TableYilTatil := TTableUretimYilTatil.Create(nil);
    TableYilTatil.Name := 'TableUretimYilTatil';
    TableYilTatil.TableItems.TableNames := 'URTYRT';
    TableYilTatil.Connection := Connection;
    Connection.CPMAppServer.AddProvider(TableYilTatil.ProviderName);
    TableYilTatil.IndexFieldNames := 'TARIH;BASSAAT;BITSAAT';

    // Kaynak Devamsýzlýk Tablosu
    TableKaynakDevamsizlik := TTableUretimKaynakDevamsizlik.Create(nil);
    TableKaynakDevamsizlik.Name := 'TableUretimKaynakDevamsizlik';
    TableKaynakDevamsizlik.TableItems.TableNames := 'URTKYD';
    TableKaynakDevamsizlik.Connection := Connection;
    Connection.CPMAppServer.AddProvider(TableKaynakDevamsizlik.ProviderName);
    TableKaynakDevamsizlik.IndexFieldNames := 'KAYNAKKOD;TARIH;BASSAAT;BITSAAT';

    // Kaynak Takvimi Tablosu
    TableKaynakTakvim := TTableUretimKaynakTakvim.Create(nil);
    TableKaynakTakvim.Name := 'TableUretimKaynakTakvim';
    TableKaynakTakvim.TableItems.TableNames := 'URTKYT';
    TableKaynakTakvim.Connection := Connection;
    Connection.CPMAppServer.AddProvider(TableKaynakTakvim.ProviderName);
  end;

  procedure OpenYilTatil(pTakvimYil: Integer);
  begin
    with TableYilTatil.TableItems[0] do
    begin
      with Fields do
      begin
        Clear;
        Add('TARIH');
        Add('BASSAAT');
        Add('BITSAAT');
      end;
      with Where do
      begin
        Clear;
        Add('TAKVIMYIL', wcEqual, pTakvimYil);
      end;
    end;
    TableYilTatil.Open;
  end;

  procedure OpenKaynakTakvim(pTakvimYil: Integer; pVardiyaKod: string);
  begin
    with TableKaynakTakvim.TableItems[0] do
    begin
      with Fields do
      begin
        Add('*');
      end;
      with Where do
      begin
        Clear;
        Add('TAKVIMYIL', wcEqual, pTakvimYil);
        AddOperator(woAnd);
        Add('VARDIYAKOD', wcEqual, pVardiyaKod);
      end;
    end;
    TableKaynakTakvim.Open;
  end;

  procedure OpenKaynakDevamsizlik(pTakvimYil: Integer);
  begin
    with TableKaynakDevamsizlik.TableItems[0] do
    begin
      with Fields do
      begin
        Clear;
        Add('*');
      end;
      with Where do
      begin
        Clear;
        Add('TAKVIMYIL', wcEqual, pTakvimYil);
      end;
    end;
    TableKaynakDevamsizlik.Open;
  end;

  procedure DeleteKaynakTakvim;
  begin
    TableKaynakTakvim.First;
    while not TableKaynakTakvim.Eof do
      TableKaynakTakvim.Delete;
  end;

  procedure CalcKaynakTakvim;
  var
    ABasSaat, ABitSaat: TDateTime;
    BKapasite, AToplamKapasite, AEtkinKapasite: Double;
    ADakika: Integer;
    procedure InsertKaynakTakvim;
    begin
      TableKaynakTakvim.Insert;
      TableKaynakTakvim.SirketNo := DataApp.CompanyNo;
      TableKaynakTakvim.KayitTur := 1;
      TableKaynakTakvim.KayitDurum := 1;
      TableKaynakTakvim.TakvimYil := ATakvimYil;
      TableKaynakTakvim.KaynakKod := AKaynakKod;
      TableKaynakTakvim.VardiyaKod := AVardiyaKod;
      TableKaynakTakvim.Tarih := ABasTarih;
      TableKaynakTakvim.BasTarihSaat := Trunc(ABasTarih) + Frac(ABasSaat);
      TableKaynakTakvim.BasSaat := ABasSaat;
      TableKaynakTakvim.BitTarihSaat := Trunc(ABasTarih) + Frac(ABitSaat);
      TableKaynakTakvim.BitSaat := ABitSaat;
      TableKaynakTakvim.Kapasite := BKapasite;
      TableKaynakTakvim.Verimlilik := AVerimlilik;
      TableKaynakTakvim.ToplamKapasite := AToplamKapasite;
      TableKaynakTakvim.EtkinKapasite := AEtkinKapasite;
      TableKaynakTakvim.Post;
    end;
  begin
    I := DayOfTheWeek(ABasTarih);
    BKapasite := AKapasite;
    TableVardiyaSaat.SetRange([I], [I]);
    TableVardiyaSaat.First;
    while not TableVardiyaSaat.Eof do
    begin
      ABasSaat := TableVardiyaSaat.BasSaat;
      ABitSaat := TableVardiyaSaat.BitSaat;

      if TableYilTatil.FindKey([ABasTarih, SifirZaman, SifirZaman]) then
        BKapasite := 0
      else if TableYilTatil.FindKey([ABasTarih, ABasSaat, ABitSaat]) then
        BKapasite := 0;

      if TableKaynakDevamsizlik.FindKey([AKaynakKod, ABasTarih, SifirZaman, SifirZaman]) then
        BKapasite := BKapasite - TableKaynakDevamsizlik.Kapasite
      else if TableKaynakDevamsizlik.FindKey([AKaynakKod, ABasTarih, ABasSaat, ABitSaat]) then
        BKapasite := BKapasite - TableKaynakDevamsizlik.Kapasite;

      if BKapasite < 0 then
      begin
        raise Exception.Create(format('Kapasite sýfýrýn altýna düþtü, kaynak kartýný ve kaynak devamsýzlýk tablosunu kontrol ediniz. Kaynak Kodu: %s',[AKaynakKod]));
      end;

      ADakika := MinutesBetween(ABasSaat, ABitSaat);
      if MinuteSpan(ABasSaat, ABitSaat) > ADakika then
        ADakika := ADakika + 1;
      AToplamKapasite := ADakika * BKapasite;
      AEtkinKapasite := AToplamKapasite * AVerimlilik / 100;

      InsertKaynakTakvim;

      TableVardiyaSaat.Next;
    end;
  end;
begin
  if DataApp.DataObject.IsDataChanged then
    raise Exception.Create('Önce yaptýðýnýz deðiþiklikleri kaydetmelisiniz.');

  ATakvimYil := YearOf(Date);
  STakvimYil := IntToStr(ATakvimYil);
  if not AppInputQuery('Oluþturulacak Takvim Yýlýný Giriniz...', 'Takvim Yýlý', STakvimYil) then
    Exit;

  try
    ATakvimYil := StrToInt(STakvimYil);
  except on E:EConvertError do
    raise Exception.Create(format('%s geçerli bir yýl deðil. ' + E.Message, [STakvimYil]));
  end;

  if not AppConfirm(format('%s nolu vardiya da çalýþan kaynaklarýn %s yýlý takvimi oluþturulacak, devam etmek istediðinize eminmisiniz?', [DataApp.UretimVardiyaKart.Table.VardiyaKod, STakvimYil])) then
    Exit;

  SifirZaman := AppDateHelper.FirstDateZeroTime;
  try
    PrepareTables;

    OpenYilTatil(ATakvimYil);
    OpenKaynakDevamsizlik(ATakvimYil);
    OpenKaynakTakvim(ATakvimYil, AVardiyaKod);

    DeleteKaynakTakvim;

    AVardiyaKod := TableVardiyaKaynak.VardiyaKod;
    TableVardiyaKaynak.First;
    while not TableVardiyaKaynak.Eof do
    begin
      AKaynakKod := TableVardiyaKaynak.KaynakKod;
      AKapasite := TableVardiyaKaynak.Kapasite;
      AVerimlilik := TableVardiyaKaynak.Verimlilik;
      ABasTarih := EncodeDate(ATakvimYil, 1, 1);
      ABitTarih := EncodeDate(ATakvimYil, 12, 31);
      while ABasTarih <= ABitTarih do
      begin
        CalcKaynakTakvim;
        ABasTarih := IncDay(ABasTarih);
      end;
      TableVardiyaKaynak.Next;
    end;
    TableKaynakTakvim.Save;
//    ChildUretimKaynakTakvimAjan.ShowChild;
//    ChildUretimKaynakTakvimAjan.Run;
    AppShowMessage('Kaynak takvimi oluþturuldu');
  finally
    TableVardiyaSaat.CancelRange;
    TableVardiyaSaat.IndexFieldNames := TableVardiyaSaatOldIndex;
    FreeAndNil(TableYilTatil);
    FreeAndNil(TableKaynakDevamsizlik);
    FreeAndNil(TableKaynakTakvim);
  end;
end;

{ TAppRuleUretimVardiyaKartAjanDetailOpen }

constructor TAppRuleUretimVardiyaKartAjanDetailOpen.Create(
  AOwner: TAppDOPUretimVardiyaKart);
begin
  inherited Create;
  FDOPUretimVardiyaKart := AOwner;
  AddRule(FDOPUretimVardiyaKart.ChildUretimVardiyaKartAjan.TableDetail);
end;

procedure TAppRuleUretimVardiyaKartAjanDetailOpen.DoBeforeOpen(
  Table: TAppCustomTable);
begin
  inherited;
  with Table.TableItems[0].Where do
  begin
    Clear;
    AddAnd('VARDIYAKOD', wcEqual, FDOPUretimVardiyaKart.FChildUretimVardiyaKartAjan.TableMaster.FieldValues['VARDIYAKOD']).DataType := ftString;
  end;
  FDOPUretimVardiyaKart.FChildUretimVardiyaKartAjan.TableDetail.DataSet.CommandText := FDOPUretimVardiyaKart.FChildUretimVardiyaKartAjan.TableDetail.TableItems.Clause;
end;

initialization
  AppRegisterDOPClass(TAppDOPUretimVardiyaKart);

end.
