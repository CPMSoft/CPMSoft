unit CPMApp_DocChildEvrakUretimBaglanti;

interface

uses Windows, Messages, SysUtils, Classes, Controls, ComCtrls, Menus,
  DB, CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DocObjectModel,
  CPMApp_Storage, CPMApp_DocChildMasterDetail,
  CPMApp_TableCariSystem,
  CPMApp_DAPCustomEvrakUretimIslem, CPMApp_DataControllerEvrakBaglanti, CPMApp_DataControllerUretimBaglanti;

type
  TAppDocChildEvrakUretimBaglanti = class;

  TAppRuleTableMaster = class(TAppTableRule)
  private
    FDocChild: TAppDocChildEvrakUretimBaglanti;
  protected
    procedure DoBeforeOpen(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDocChildEvrakUretimBaglanti);
  end;

  TAppRuleTableDetail = class(TAppTableRule)
  private
    FDocChild: TAppDocChildEvrakUretimBaglanti;
  protected
    procedure DoBeforeOpen(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDocChildEvrakUretimBaglanti);
  end;

  TAppDocChildEvrakUretimBaglanti = class(TAppDocChildMasterDetail)
  private
    FOldMasterViewKeyDown: TKeyEvent;
    FOldDetailViewKeyDown: TKeyEvent;
    FTableEvrakBaslik: TTableEvrakBaslik;
    FRuleTableMaster: TAppRuleTableMaster;
    FRuleTableDetail: TAppRuleTableDetail;
    FEvrakBaglanti: TAppDataControllerBaseBaglanti;
    FTableParam: TAppCustomTable;
    FEvrakTip: Integer;
    FDetailFilter: String;
    FMasterFilter: String;
    FEnabled: Boolean;
    FSearchEvrakNo: String;
    FOnAfterParam: TAppDocChildNotifyEvent;
    FUretimMiktar: Double;
    FmiShowParams: TMenuItem;
    FmiShowProgress: TMenuItem;

    // Events
    procedure MasterOnDblClick(Sender: TObject);
    procedure MasterViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DetailOnDblClick(Sender: TObject);
    procedure DetailViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OnProgress(Sender: TAppDataControllerCustomBaglanti; AMax, ACnt: Integer);

    // Menu Items Click
    procedure miShowParamsOnClick(Sender: TObject);
    procedure miShowProgressOnClick(Sender: TObject);
    procedure miBaslikAlanAktarimOnClick(Sender: TObject);
    procedure miHareketAlanAktarimOnClick(Sender: TObject);
    procedure miOzelMamulKartAlanAktarimOnClick(Sender: TObject);

    // Functions
    function GetEvrakTip: Integer;
    function GetBaglantiMiktar(var AMiktar: Double): Boolean;

    procedure CreateButtons;
    procedure AddTableMasterWhere;
    procedure AddTableDetailWhere;
    procedure SetEvrakBaglanti(const Value: TAppDataControllerBaseBaglanti);

    procedure UpdateGrid;
    procedure DoAfterParam;
    procedure AddMamul;
    procedure AddHammadde;
  protected
    procedure AfterCreate; override;
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure Finalize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    procedure DoOnRestore; override;
  public
    destructor Destroy; override;
    procedure SelectMasterItems; override;
    function OpenEvrak(AEvrakNo: String): Boolean;
  published
    property EvrakBaglanti: TAppDataControllerBaseBaglanti read FEvrakBaglanti write SetEvrakBaglanti;
    property TableEvrakBaslik: TTableEvrakBaslik read FTableEvrakBaslik write FTableEvrakBaslik;
    property EvrakTip: Integer read GetEvrakTip write FEvrakTip;
    property MasterFilter: String read FMasterFilter write FMasterFilter;
    property DetailFilter: String read FDetailFilter write FDetailFilter;
    property Enabled: Boolean read FEnabled write FEnabled default True;
    property UretimMiktar: Double read FUretimMiktar write FUretimMiktar;
    property OnAfterParam: TAppDocChildNotifyEvent read FOnAfterParam write FOnAfterParam;
  end;

implementation

uses
  Variants,
  cxGridCustomTableView,
  CPMApp_System,
  CPMApp_Dialogs,
  CPMApp_Images,
  CPMApp_TableItems,
  CPMApp_GridHelper,
  CPMApp_ToolBarHelper,
  CPMApp_Security,
  CPMApp_DocumentConsts,
  CPMApp_DocParamsWindow,
  CPMApp_DocFormMasterDetail;

{ TAppDocChildEvrakUretimBaglanti }

procedure TAppDocChildEvrakUretimBaglanti.AddHammadde;
var
  B: Boolean;
begin
  if not Enabled then
    raise exception.Create('Baðlantý hakkýnýz yok!');
  if TableDetail.IsEmpty then
    exit;
  if FEvrakBaglanti is TAppDataControllerEvrakUretimBaglanti then
    B := TAppDataControllerEvrakUretimBaglanti(FEvrakBaglanti).AddDocumentItem(TableMaster, TableDetail)
  else
    B := EvrakBaglanti.AddDocumentItem(TableDetail);
  if not B then
  begin
    DocObject.IMainForm.StatusMessage('Baðlantý kalemi eklenemedi!');
    EvrakBaglanti.ShowError;
  end
  else
    DocObject.IMainForm.StatusMessage('Baðlantý kalemi eklendi. ' + TableDetail['MALKOD']);
end;

procedure TAppDocChildEvrakUretimBaglanti.AddMamul;
var
  A: Cardinal;
  AMiktar: Double;
begin
  if not Enabled then
    raise exception.Create('Baðlantý hakkýnýz yok!');
  if TableMaster.IsEmpty then
    exit;
  A := GetTickCount;
  if (not (FEvrakBaglanti is TAppDataControllerUretimEvrakBaglanti)) and (not (FEvrakBaglanti is TAppDataControllerEvrakUretimBaglanti)) then
    raise exception.Create('Evrak Baðlantý üretim baðlantýsý deðil!');
  FEvrakBaglanti.OnProgress := OnProgress;
  AMiktar := TableMaster.FieldByName('_URETIMMIKTAR').AsFloat;
  if FmiShowParams.Checked then
    if not GetBaglantiMiktar(AMiktar) then
      Exit;
  Self.FUretimMiktar := AMiktar;
  DoAfterParam;
  DocObject.MainForm.Enabled := False;
  try
    if FEvrakBaglanti is TAppDataControllerUretimEvrakBaglanti then
      TAppDataControllerUretimEvrakBaglanti(FEvrakBaglanti).AddProductionDocument(TableMaster, TableDetail, Self.FUretimMiktar);
    if FEvrakBaglanti is TAppDataControllerEvrakUretimBaglanti then
      TAppDataControllerEvrakUretimBaglanti(FEvrakBaglanti).AddProductionDocument(TableMaster, TableDetail, Self.FUretimMiktar);
  finally
    DocObject.MainForm.Enabled := True;
  end;
  A := GetTickCount - A;
  DocObject.IMainForm.StatusMessage('Baðlantý yapýldý. ' + IntToStr(A));
  DocObject.IMainForm.ProgressMessage('', 0);
  DocObject.MainChild.ShowChild;
  AppShowMessage('Baðlantý yapýldý.');
end;

procedure TAppDocChildEvrakUretimBaglanti.AddTableDetailWhere;
var
  AEvrakTip, AKapatTip: Integer;
  AStr: String;
  ASecWhere: String;
begin
  with TableDetail.TableItems[0].Where do
  begin
    Clear;
    AddField('SIRKETNO', wcEqual, TableMaster.TableItems[0], 'SIRKETNO');
    AddOperator(woAnd);
    AddField('EVRAKTIP', wcEqual, TableMaster.TableItems[0], 'EVRAKTIP');
    AddOperator(woAnd);
    AddField('HESAPKOD', wcEqual, TableMaster.TableItems[0], 'HESAPKOD');
    AddOperator(woAnd);
    AddField('EVRAKNO', wcEqual, TableMaster.TableItems[0], 'EVRAKNO');
    if EvrakTip = aetUretim then
    begin
      AddOperator(woAnd);
      AddField('SIRANO2', wcEqual, TableMaster.TableItems[0], 'SIRANO');
    end;
    {
    AddOperator(woAnd);
    AddField('SONKAYNAKSIRANO', wcEqual, TableMaster.TableItems[0], 'SONKAYNAKSIRANO');
    AddOperator(woAnd);
    Add('SIRANO', wcLessEqual, TableMaster['SIRANO']);
    AddOperator(woAnd);
    Add('SONKAYNAKSIRANO', wcNotEqual, 0);}
  end;
  if not TableMaster.Active then
    exit;
  if TableMaster.IsEmpty then
    exit;
  AEvrakTip := TableMaster.FieldByName('EVRAKTIP').AsInteger;
  if AEvrakTip <> FTableParam.Fields[0].AsInteger then
  begin
    if not FTableParam.FindKey([AEvrakTip]) then
      exit;
  end;
  AKapatTip := FTableParam.Fields[1].AsInteger;

  if AKapatTip = bagKapatma then
    AStr := ''
  else if AKapatTip = bagMiktarKapat then
    AStr := 'STKHAR.EVRAKDURUM = 0 AND STKHAR.MIKTAR - STKHAR.KULLANILANMIKTAR + STKHAR.FAZLASEVK > 0'
  else if AKapatTip in [bagSevkMiktarKapat, bagSevkMiktarKapatma] then
    AStr := 'STKHAR.EVRAKDURUM = 0 AND STKHAR.SEVKMIKTAR > 0'
  else
    AStr := '';
  with TableDetail.TableItems[0].Where do
  begin
    if AStr <> '' then
    begin
      AddOperator(woAnd);
      AddText(AStr);
    end;
    ASecWhere := AppSecurity.GetFilters(TableDetail.TableItems[0].Name, TableDetail.TableItems[0].Alias);
    if ASecWhere <> '' then
    begin
      AddOperator(woAnd);
      AddText(ASecWhere);
    end;
    if FDetailFilter <> '' then
    begin
      AddOperator(woAnd);
      BeginGroup();
        AddText(FDetailFilter);
      EndGroup();
    end;
  end;
  TableDetail.DataSet.CommandText := TableDetail.TableItems.Clause;
end;

procedure TAppDocChildEvrakUretimBaglanti.AddTableMasterWhere;
var
  I: Integer;
  AUnionWhere: TAppDataWhereItems;
  AHesapKod: String;

  procedure AddToHareketWhere(AWhere: TAppDataWhereItems);
  var
    AKapatWhere, ASecWhere: String;
  begin
    case FEvrakBaglanti.TableBaglantiParam.Kapat of
      bagKapatma:
        AKapatWhere := '';
      bagMiktarKapat:
        AKapatWhere := '( STKHAR.EVRAKDURUM = 0 AND STKHAR.MIKTAR - STKHAR.KULLANILANMIKTAR + STKHAR.FAZLASEVK > 0 )';
      bagSevkMiktarKapat, bagSevkMiktarKapatma:
        AKapatWhere := '( STKHAR.EVRAKDURUM = 0 AND STKHAR.SEVKMIKTAR > 0 )';
      else
        AKapatWhere := '';
    end;

    with AWhere do
    begin
      Add('MALTIP', wcEqual, 5);
      if AKapatWhere <> '' then
        AddAndText(AKapatWhere);
      ASecWhere := AppSecurity.GetFilters(TableMaster.TableItems[0].Name, TableMaster.TableItems[0].Alias);
      if ASecWhere <> '' then
        AddAndText(ASecWhere);
      if Trim(FEvrakBaglanti.TableBaglantiParam.HareketKriter) <> '' then
        AddAndText(FEvrakBaglanti.TableBaglantiParam.HareketKriter);
    end;
    AddSearchFilter(AWhere);
    AddFilter(AWhere);
    AddFindFilter(AWhere);
  end;

  procedure AddToBaslikWhere(AWhere: TAppDataWhereItems);
  var
    ASecWhere: String;
  begin
    with AWhere do
    begin
      Add('SIRKETNO', wcEqual, AppSecurity.DBCompanyNo);
      AddOperator(woAnd);
      Add('EVRAKTIP', wcEqual, FEvrakBaglanti.TableBaglantiParam.KaynakEvrakTip);
      if FSearchEvrakNo <> '' then
      begin
        AddOperator(woAnd);
        Add('EVRAKNO', wcEqual, FSearchEvrakNo);
      end
      else begin
        if AHesapKod <> '' then
        begin
          AddOperator(woAnd);
          Add('HESAPKOD', wcEqual, AHesapKod);
        end;
      end;
      if FMasterFilter <> '' then
      begin
        AddOperator(woAnd);
        BeginGroup();
          AddText(FMasterFilter);
        EndGroup();
      end;
      AddOperator(woAnd);
      Add('_EVRAKDURUM', wcEqual, 0);
      AddOperator(woAnd);
      Add('_TOPLUSEVKDURUM', wcEqual, 0);
      case FEvrakBaglanti.TableBaglantiParam.Kapat of
        1:
        begin
          AddOperator(woAnd);
          Add('_MIKTARDURUM', wcEqual, 0);
          if FEvrakBaglanti.TableBaglantiParam.BaglantiKayitDurum = 1 then
          begin
            AddOperator(woAnd);
            Add('_MIKTARKAYITDURUM', wcEqual, 0)
          end;
        end;
        2:
        begin
          AddOperator(woAnd);
          Add('_SEVKDURUM', wcEqual, 0);
          if FEvrakBaglanti.TableBaglantiParam.BaglantiKayitDurum = 1 then
          begin
            AddOperator(woAnd);
            Add('_SEVKKAYITDURUM', wcEqual, 0)
          end;
        end;
      end; // case FEvrakBaglanti.TableBaglantiParam.Kapat of
      ASecWhere := AppSecurity.GetFilters(TableMaster.TableItems[1].Name, TableMaster.TableItems[1].Alias);
      if ASecWhere <> '' then
      begin
        AddOperator(woAnd);
        AddText(ASecWhere);
      end;
      if Trim(FEvrakBaglanti.TableBaglantiParam.BaslikKriter) <> '' then
      begin
        AddOperator(woAnd);
        AddText(FEvrakBaglanti.TableBaglantiParam.BaslikKriter);
      end;

    end; // with Where do
    //AddSearchFilter(AWhere);
    //AddFilter(AWhere);
    //AddFindFilter(AWhere);
  end;
begin
  FEvrakBaglanti.TableBaglantiParam.SetRange([EvrakTip], [EvrakTip]);
  if Assigned(TableEvrakBaslik) then
    AHesapKod := TableEvrakBaslik.HesapKod
  else
    AHesapKod := '';
  FTableParam.EmptyTable;
  if FEvrakBaglanti.TableBaglantiParam.IsEmpty then
  begin
    with TableMaster.TableItems[0].Where do
    begin
      Clear;
      AddText('0 = 1');
    end;
  end
  else begin
    FEvrakBaglanti.TableBaglantiParam.First;
    I := 0;
    while not FEvrakBaglanti.TableBaglantiParam.Eof do
    begin
      FTableParam.Append;
      FTableParam.Fields[0].AsInteger := FEvrakBaglanti.TableBaglantiParam.KaynakEvrakTip;
      FTableParam.Fields[1].AsInteger := FEvrakBaglanti.TableBaglantiParam.Kapat;
      FTableParam.Post;
      if I = 0 then
      begin
        with TableMaster.TableItems[0] do // STKHAR
        begin
          Where.Clear;
          Where.Unions.Clear;
          AddToHareketWhere(Where);
        end; // with Table.TableItems[0] do
        // EVRBAS
        with TableMaster.TableItems[1] do // EVRBAS
        begin
          Where.Clear;
          Where.Unions.Clear;
          AddToBaslikWhere(Where);
        end; // with Table.TableItems[1] do
      end // if I = 0 then
      else begin // Birden fazla baðlantý var.
        // STKHAR
        AUnionWhere := TableMaster.TableItems[0].Where.Unions.Add.Where; // STKHAR
        AUnionWhere.Clear;
        AddToHareketWhere(AUnionWhere);
        // EVRBAS
        AUnionWhere := TableMaster.TableItems[1].Where.Unions.Add.Where; // EVRBAs
        AUnionWhere.Clear;
        AddToBaslikWhere(AUnionWhere);
      end;
      I := I + 1;
      FEvrakBaglanti.TableBaglantiParam.Next;
    end; // while
  end;
  FEvrakBaglanti.TableBaglantiParam.CancelRange;
  TableMaster.DataSet.CommandText := TableMaster.TableItems.Clause;
end;

procedure TAppDocChildEvrakUretimBaglanti.CreateButtons;
var
  APopupSettings: TPopupMenu;
  AMenuItem: TMenuItem;
begin
{
  btn := TAppToolBarHelper.AddSeperator(ToolBar, 'btSep1', nil, TAppDocFormMasterDetail(Form).btRun);
  btn := TAppToolBarHelper.Add(ToolBar, 'btBaslikAlanSecim', 'Baþlýk Alan Aktarýmý', 'Baðlantý Baþlýk Alan Aktarýmý', Integer(aiSelectColumn), BaslikAlanSecimClick, nil, btn);
  btn := TAppToolBarHelper.Add(ToolBar, 'btHareketAlanSecim', ',Hareket Alan Aktarýmý', 'Baðlantý Hareket Alan Aktarýmý', Integer(aiSelectColumn), HareketAlanSecimClick, nil, btn);
  act := TAppActionListHelper.Add(ActionList, 'cmShowProgress', 'Ýlerleme Mesajýný Göster', 'Ýlerleme Mesajýný Göster', '', Integer(aiProgressBar), ShowProgressClick);
  cmProgressMessage := act;
  btProgressMessage := TAppToolBarHelper.Add(ToolBar, 'btShowProgress', cmProgressMessage, nil, btn);
  btProgressMessage.Grouped := True;
  btProgressMessage.Style := tbsCheck;
}

  // Setting Items For Params
  TAppDocFormMasterDetail(Form).sepSettings.Visible := True;
  TAppDocFormMasterDetail(Form).btnSettings.Visible := True;
  APopupSettings := TAppDocFormMasterDetail(Form).PopupSettings;

  FmiShowParams := TMenuItem.Create(Form);
  FmiShowParams.Caption := 'Baðlantý Miktarýný Sor';
  FmiShowParams.Name := 'miShowParams';
  FmiShowParams.OnClick := miShowParamsOnClick;
  APopupSettings.Items.Add(FmiShowParams);

  FmiShowProgress := TMenuItem.Create(Form);
  FmiShowProgress.Caption := 'Ýlerleme Mesajýný Göster';
  FmiShowProgress.Name := 'FmiShowProgress';
  FmiShowProgress.OnClick := miShowProgressOnClick;
  APopupSettings.Items.Add(FmiShowProgress);

  AMenuItem := TMenuItem.Create(Form);
  AMenuItem.Caption := '-';
  APopupSettings.Items.Add(AMenuItem);

  AMenuItem := TMenuItem.Create(Form);
  AMenuItem.Caption := 'Baþlýk Alan Aktarýmý';
  AMenuItem.OnClick := miBaslikAlanAktarimOnClick;
  AMenuItem.ImageIndex := Integer(aiSelectColumn);
  APopupSettings.Items.Add(AMenuItem);

  AMenuItem := TMenuItem.Create(Form);
  AMenuItem.Caption := 'Hareket Alan Aktarýmý';
  AMenuItem.OnClick := miHareketAlanAktarimOnClick;
  AMenuItem.ImageIndex := Integer(aiSelectColumn);
  APopupSettings.Items.Add(AMenuItem);

  AMenuItem := TMenuItem.Create(Form);
  AMenuItem.Caption := 'Özel Mamül Kart Alan Aktarýmý';
  AMenuItem.OnClick := miOzelMamulKartAlanAktarimOnClick;
  AMenuItem.ImageIndex := Integer(aiSelectColumn);
  APopupSettings.Items.Add(AMenuItem);
end;

procedure TAppDocChildEvrakUretimBaglanti.AfterCreate;
var
  ASecWhere: string;
begin
  inherited;
  ReadOnly := False;
  TableMaster.ReadOnly := False;
  FSearchEvrakNo := '';
  FEnabled := True;
  // Create Rules
  FRuleTableMaster := TAppRuleTableMaster.Create(Self);
  FRuleTableDetail := TAppRuleTableDetail.Create(Self);

  // Create Table Param
  FTableParam := TAppCustomTable.Create(nil);
  with FTableParam.FieldDefs do
  begin
    Clear;
    Add('KAYNAKEVRAKTIP', ftInteger);
    Add('KAPAT', ftInteger);
  end;
  FTableParam.CreateDataSet;
  FTableParam.IndexFieldNames := 'KAYNAKEVRAKTIP';
  FTableParam.EnableLogChanges := False;

  // Set Settings
  Caption := 'Evrak Üretim Baðlantý';
  DockPanel.ImageIndex := Integer(aiEvrakBaglanti);
  PipelineMasterName := 'ppEvrakUretimBaglantiBaslik';
  PipelineDetailName := 'ppEvrakUretimBaglantiDetay';
  AppName := DocObject.Module.AppName +  '\EvrakUretimBaglanti';
  FormName := 'EvrakUretimBaglantiForm';
  with CreateButton('btEvrakUretimBaglanti', 'Evrak Üretim Baðlantý', 'Sayfalar', 'Ctrl+B') do
    ImageIndex := Integer(aiEvrakBaglanti);
  TableMaster.TableItems.TableNames := VarArrayOf(['VW_STKHAR', 'EVRBAS', 'STKKRT', 'CARKRT', 'CARKRT']);
  TableMaster.TableItems.TableAlias := VarArrayOf(['STKHAR', 'EVRBAS', 'STKKRT', 'CARKRT', 'SVKKRT']);
  TableMaster.TableItems.TableReferans := VarArrayOf(['STKHAR', 'EVRBAS', 'STKKRT', 'CARKRT', 'CARKRT']);
  TableMaster.TableItems.TableCaptions := VarArrayOf(['Stok Hareket', 'Evrak Baþlýk', 'Stok Kart', 'Cari Kart', 'Sevk Kart']);
  // STKHAR
  with TableMaster.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('SIRKETNO');
      Add('EVRAKTIP');
      Add('EVRAKNO');
      Add('HESAPKOD');
      Add('EVRAKTARIH');
      Add('SIRANO');
      Add('MALKOD');
      Add('MIKTAR');
      Add('GIRISCIKIS');
      Add('ISLEMTIP');
      Add('FAZLASEVK');
      Add('KULLANILANMIKTAR');
      Add('SEVKMIKTAR');
      Add('_KALANMIKTAR');
      Add('SONKAYNAKSIRANO');
      Add('SIPARISNO');
      AddExpression('CONVERT(FLOAT, 0)', '_URETIMMIKTAR');
    end;
    with Where do
    begin
      Clear;
      AddText('0 = 1')
    end;
  end;
  // EVRBAS
  with TableMaster.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
    end;
    with Join do
    begin
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('EVRAKTIP', 'EVRAKTIP');
      Add('HESAPKOD', 'HESAPKOD');
      Add('EVRAKNO', 'EVRAKNO');
    end;
    with Where do
    begin
      Clear;
    end;
  end;
  // STKKRT
  with TableMaster.TableItems[2] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALAD');
    end;
    with Join do
    begin
      Clear;
      Add('MALKOD', 'MALKOD');
    end;
    with Where do
    begin
      Clear;
      ASecWhere := AppSecurity.GetFilters(Name, Alias);
      if ASecWhere <> '' then
        AddText(ASecWhere);
    end;
  end;
  // CARKRT
  with TableMaster.TableItems[3] do
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
      ASecWhere := AppSecurity.GetFilters(Name, Alias);
      if ASecWhere <> '' then
        AddText(ASecWhere);
    end;
  end;
  // SVKKRT
  with TableMaster.TableItems[4] do
  begin
    with Fields do
    begin
      Clear;
    end;
    with Join do
    begin
      Clear;
      Add('HESAPKOD', 'SEVKHESAPKOD');
    end;
    with Where do
    begin
      Clear;
      ASecWhere := AppSecurity.GetFilters(Name, Alias);
      if ASecWhere <> '' then
        AddText(ASecWhere);
    end;
  end;
  with TableMaster.TableItems.OrderBy do
  begin
    Clear;
    Add('EVRAKTARIH', otDesc);
  end;
  TableDetail.TableItems.TableNames := VarArrayOf(['VW_STKHAR', 'STKKRT', 'STHURT']);
  TableDetail.TableItems.TableAlias := VarArrayOf(['STKHAR', 'STKKRT', 'STHURT']);
  TableDetail.TableItems.TableCaptions := VarArrayOf(['Stok Hareket', 'Stok Kart', 'Stok Hareket Üretim']);
  with TableDetail.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('SIRKETNO');
      Add('EVRAKTIP');
      Add('HESAPKOD');
      Add('EVRAKNO');
      Add('SIRANO');
      Add('MALKOD');
      Add('MIKTAR');
      Add('GIRISCIKIS');
      Add('ISLEMTIP');
      Add('MALTIP');
      Add('FAZLASEVK');
      Add('KULLANILANMIKTAR');
      Add('SEVKMIKTAR');
      Add('_KALANMIKTAR');
      Add('FIYAT');
      Add('TUTAR');
    end;
    with Where do
    begin
      Clear;
      AddText('0 = 1');
    end;
  end;

  with TableDetail.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALAD');
    end;
    with Join do
    begin
      Clear;
      Add('MALKOD', 'MALKOD');
    end;
    with Where do
    begin
      Clear;
      ASecWhere := AppSecurity.GetFilters(Name, Alias);
      if ASecWhere <> '' then
        AddText(ASecWhere);
    end;
  end;

  with TableDetail.TableItems[2] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
    end;
    with Join do
    begin
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('EVRAKTIP', 'EVRAKTIP');
      Add('HESAPKOD', 'HESAPKOD');
      Add('EVRAKNO', 'EVRAKNO');
      Add('KONSOLIDESIRKETNO', 'KONSOLIDESIRKETNO');
      Add('SIRANO', 'SIRANO');
    end;
  end;

  with TableDetail.TableItems.OrderBy do
  begin
    Clear;
    Add('GIRISCIKIS', otDesc);
  end;

  GridViewMaster.OnDblClick := MasterOnDblClick;
  GridViewDetail.OnDblClick := DetailOnDblClick;
  FOldMasterViewKeyDown := GridViewMaster.OnKeyDown;
  FOldDetailViewKeyDown := GridViewDetail.OnKeyDown;
  GridViewMaster.OnKeyDown := MasterViewKeyDown;
  GridViewDetail.OnKeyDown := DetailViewKeyDown;
  CreateButtons;
  DocObject.Macros.AddObject(Self, 'ChildEvrakUretimBaglanti');
end;

procedure TAppDocChildEvrakUretimBaglanti.DoAfterParam;
begin
  if Assigned(FOnAfterParam) then
    FOnAfterParam(Self);
end;

procedure TAppDocChildEvrakUretimBaglanti.DoOnRestore;
begin
  inherited;
  GridViewMaster.OptionsData.Deleting := False;
  GridViewMaster.OptionsData.Inserting := False;
  GridViewMaster.OptionsData.Appending := False;
  GridViewMaster.OptionsData.Editing := True;

  UpdateGrid;
end;

procedure TAppDocChildEvrakUretimBaglanti.Finalize(IniFile: TAppIniFile);
begin
  inherited;
  IniFile.WriteBool(Section, 'ShowParams', FmiShowParams.Checked);
  IniFile.WriteBool(Section, 'ShowProgressMessage', FmiShowProgress.Checked);
end;

destructor TAppDocChildEvrakUretimBaglanti.Destroy;
begin
  FreeAndNil(FTableParam);
  FreeAndNil(FRuleTableMaster);
  FreeAndNil(FRuleTableDetail);
  inherited;
end;

procedure TAppDocChildEvrakUretimBaglanti.DetailOnDblClick(Sender: TObject);
begin
  AddHammadde;
end;

procedure TAppDocChildEvrakUretimBaglanti.DetailViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldDetailViewKeyDown) then
    FOldDetailViewKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
    GridViewDetail.OnDblClick(Sender); //DetailOnDblClick(nil);
end;

function TAppDocChildEvrakUretimBaglanti.GetBaglantiMiktar(var AMiktar: Double): Boolean;
begin
  Result := False;
  DocObject.Module.ParamsWindow.Items.Clear;
  with DocObject.Module.ParamsWindow.Items.Add do
  begin
    Name := 'MIKTAR';
    Caption := 'Miktar';
    ValueType := 'Float';
    Value := AMiktar;
  end;
  DocObject.Module.ParamsWindow.Caption := 'Baðlantý Miktarýný Giriniz';
  if DocObject.Module.ParamsWindow.Execute then
  begin
    try
      AMiktar := DocObject.Module.ParamsWindow['MIKTAR'];
      Result := True;
    except
      AppShowMessage('Uygun baðlantý miktarý giriniz!');
    end;
  end;
end;

function TAppDocChildEvrakUretimBaglanti.GetEvrakTip: Integer;
begin
  Result := FEvrakTip;
  if Result = 0 then
    Result := FEvrakBaglanti.AppEvrakTip;
end;

procedure TAppDocChildEvrakUretimBaglanti.Initialize(IniFile: TAppIniFile);
begin
  inherited;
  FmiShowParams.Checked := IniFile.ReadBool(Section, 'ShowParams', False);
  FmiShowProgress.Checked := IniFile.ReadBool(Section, 'ShowProgressMessage', True);
end;

procedure TAppDocChildEvrakUretimBaglanti.SelectMasterItems;
begin
  inherited;
  UpdateGrid;
end;

procedure TAppDocChildEvrakUretimBaglanti.DesktopAfterRestore(Desktop: TAppDocDesktop);
begin
  inherited;
  UpdateGrid;
end;

procedure TAppDocChildEvrakUretimBaglanti.MasterOnDblClick(Sender: TObject);
begin
  AddMamul;
end;

procedure TAppDocChildEvrakUretimBaglanti.MasterViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldMasterViewKeyDown) then
    FOldMasterViewKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
    GridViewMaster.OnDblClick(Sender); // MasterOnDblClick(nil);
end;

procedure TAppDocChildEvrakUretimBaglanti.miBaslikAlanAktarimOnClick(
  Sender: TObject);
begin
  EvrakBaglanti.MatchFieldsBaslik.Execute('Baðlantý Baþlýk Alan Aktarýmý');
end;

procedure TAppDocChildEvrakUretimBaglanti.miHareketAlanAktarimOnClick(
  Sender: TObject);
begin
  EvrakBaglanti.MatchFieldsHareket.Execute('Baðlantý Hareket Alan Aktarýmý');
end;

procedure TAppDocChildEvrakUretimBaglanti.miOzelMamulKartAlanAktarimOnClick(
  Sender: TObject);
begin
  EvrakBaglanti.MatchFieldsOzelMamulKart.Execute('Baðlantý Özel Mamül Kart Alan Aktarýmý');
end;

procedure TAppDocChildEvrakUretimBaglanti.miShowParamsOnClick(Sender: TObject);
begin
  FmiShowParams.Checked := not FmiShowParams.Checked;
end;

procedure TAppDocChildEvrakUretimBaglanti.miShowProgressOnClick(
  Sender: TObject);
begin
  FmiShowProgress.Checked := not FmiShowProgress.Checked;
  EvrakBaglanti.ProgressEnabled := FmiShowProgress.Checked;
end;

procedure TAppDocChildEvrakUretimBaglanti.OnProgress(
  Sender: TAppDataControllerCustomBaglanti; AMax, ACnt: Integer);
begin
  DocObject.IMainForm.ProgressMessage(IntToStr(ACnt) + '-' + TableDetail['MALKOD'], ACnt, AMax);
end;

function TAppDocChildEvrakUretimBaglanti.OpenEvrak(AEvrakNo: String): Boolean;
begin
  FSearchEvrakNo := AEvrakNo;
  try
    Run;
  finally
    FSearchEvrakNo := '';
  end;
  Result := not TableMaster.IsEmpty;
end;

procedure TAppDocChildEvrakUretimBaglanti.SetEvrakBaglanti(
  const Value: TAppDataControllerBaseBaglanti);
begin
  FEvrakBaglanti := Value;
end;

procedure TAppDocChildEvrakUretimBaglanti.UpdateGrid;
begin
  AppGridHelper.ReadOnlyColumns(GridViewMaster);
  AppGridHelper.EditableColumn(GridViewMaster, '_URETIMMIKTAR');
end;

{ TAppRuleTableMaster }

constructor TAppRuleTableMaster.Create(AOwner: TAppDocChildEvrakUretimBaglanti);
begin
  inherited Create;
  FDocChild := AOwner;
  AddRule(FDocChild.TableMaster);
end;

procedure TAppRuleTableMaster.DoBeforeOpen(Table: TAppCustomTable);
begin
  if Table.MetaDataOnly then
    exit;
  FDocChild.AddTableMasterWhere;
end;

{ TAppRuleTableDetail }

constructor TAppRuleTableDetail.Create(AOwner: TAppDocChildEvrakUretimBaglanti);
begin
  inherited Create;
  FDocChild := AOwner;
  AddRule(FDocChild.TableDetail);
end;

procedure TAppRuleTableDetail.DoBeforeOpen(Table: TAppCustomTable);
begin
  if Table.MetaDataOnly then
    exit;
  FDocChild.AddTableDetailWhere;
end;

end.
