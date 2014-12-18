unit CPMApp_DocChildUretimTerminalReceteTuketim;

interface

uses
  CPMApp_DocCostumUretimTerminalSendKey,
  Controls,
  Windows, DB, Variants, SysUtils, ExtCtrls, Classes, Forms,
  dxDockControl, cxGraphics, cxGridDBTableView, cxGridCustomTableView,
  CPMApp_DB,
  CPMApp_DocApp,
  CPMApp_DataObjectDB,
  CPMApp_Storage,
  CPMApp_BOMConsts,
  CPMApp_DataObject,
  CPMApp_DataObjectModel,
  CPMApp_DocObjectModel,
  CPMApp_DocChildGrid,
  CPMApp_DocChildSearchTable,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_DocChildUretimTerminalProperties,
  CPMApp_DAPCustomUretimKart,
  CPMApp_TableStokSystem;

type
  TAppDocChildUretimTerminalReceteTuketim = class;

  TParamsSelf = class
  private
    fHesapKod: String;
    fEvrakNo: String;
    fEvrakTip: Smallint;
    fSiraNo: Smallint;
    fOpDurum: Smallint;
    fOperasyonNo: Smallint;
    fKaynakIslemNo: Smallint;
    fAppName: Smallint;
  public
    property HesapKod: String read fHesapKod write fHesapKod;
    property EvrakNo: String read fEvrakNo write fEvrakNo;
    property EvrakTip: Smallint read fEvrakTip write fEvrakTip;
    property SiraNo: Smallint read fSiraNo write fSiraNo;
    property OpDurum: Smallint read fOpDurum write fOpDurum;
    property OperasyonNo: Smallint read fOperasyonNo write fOperasyonNo;
    property KaynakIslemNo: Smallint read fKaynakIslemNo write fKaynakIslemNo;
    property AppName: Smallint read fAppName write fAppName;
  end;

  TAppDocChildUretimTerminalReceteTuketim = class(TAppDocChildSearchTable)
  private
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
  private
    AMiktar: Double;
    DontAskMiktar: Boolean;
    UretimSiparisHareketOldIndexes: String;
    GridColumn_OpDurum: TcxGridDBColumn;
    FHammaddeMekanikSarfYontem: TAppMekanikSarfYontem;
  private
    FParamsSelf: TParamsSelf;
    FormSelf: TForm;
    FormTerminalMenu: TAppDocFormUretimTerminalMenu;
    procedure CreateGridButtons;
    function CheckMalzemeStokDurum: Boolean;
  private
    procedure OnClickTitleRefresh(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
    procedure OnClickTitleExit(Sender: TObject);
    procedure OnClickTuketimListesi(Sender: TObject);
  private
    procedure MSY_StartOrFinish;
    procedure MSY_CompleteAllManual(TuketimYap: Boolean);
  private
    procedure btYuklemeyiTamamla(Sender: TObject);
    procedure btMSY_StartOrFinish(Sender: TObject);
    procedure OnClickTuketimleriTamamla(Sender: TObject);
    procedure OnClickPlansizTuketim(Sender: TObject);
//    procedure OnClickMalzemeBilgileri(Sender: TObject);
    procedure OnClickKalemSifirla(Sender: TObject);
    procedure OnClickKalemKapat(Sender: TObject);
    procedure OnClickDurus(Sender: TObject);
    procedure OnClickHata(Sender: TObject);
    procedure OnClickDateSettings(Sender: TObject);
    procedure OnClickBarcodeMalKod(Sender: TObject);
  private
    function LocateUretimSiparisHareket: Boolean;
    procedure DoControlOpDurum;
    procedure SetParameters;
    procedure PrepareDefination;
    procedure CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure DockPanelOnActivate(Sender: TdxCustomDockControl;
      Active: Boolean);
  private
    procedure DoAfterScroll(Table: TAppCustomTable);
    procedure AfterScroll;
  private
    procedure OnGridCellClick(
      Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure DoBarcodeMalKod(ABarcodeMalKodAyar: Smallint);
    function AskMalzemeTuketimDurum: Integer;
  protected
    procedure CreateTitle;
    procedure CreateObjects;
    procedure AfterCreate; override;
  public
    function DoSaveDataObject: Boolean;
    function UpdateTableSTHURTDurum(AStatus: Integer): Boolean;
    procedure LocateBarcodeRecord;
  public
    procedure OnClickLotDegistir(Sender: TObject);
    procedure DisableAllButtons;
  public
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
  published
    property ParamsSelf: TParamsSelf read FParamsSelf write FParamsSelf;
    property HammaddeMekanikSarfYontem: TAppMekanikSarfYontem read FHammaddeMekanikSarfYontem write FHammaddeMekanikSarfYontem;
  end;

  implementation

uses
  ComCtrls,
  ActnList,
  Graphics,
  DateUtils,
  cxTextEdit, cxButtons, cxMaskEdit,
  CPMApp_StrUtils, 
  CPMApp_Dialogs,
  CPMApp_Date,
  CPMApp_TableItems,
  CPMApp_SProductionConsts,
  CPMApp_DOPUretimTerminalVeriGiris,

  CPMApp_DocFormUretimTerminalNumPad, CPMApp_DOPCustomUretimTerminalVeriGiris,
  CPMApp_TableUretimSystem;


{ TAppDocChildUretimTerminalReceteTuketim }

procedure TAppDocChildUretimTerminalReceteTuketim.DockPanelOnActivate(
  Sender: TdxCustomDockControl; Active: Boolean);
begin
  if Active then
  begin
    Self.Table.AfterScroll := DoAfterScroll;
    Self.GridView.OnCellClick := OnGridCellClick;
  end else
  begin
    Self.Table.AfterScroll := nil;
    Self.GridView.OnCellClick := nil;
  end;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.PrepareDefination;
begin
  Self.Table.TableItems.TableNames := VarArrayOf(['STKHAR', 'STHURT', 'STKKRT', 'VW_STOKDURUM']);
  Self.Table.TableItems.TableAlias := VarArrayOf(['STKHAR', 'STHURT', 'STKKRT', 'STKDRM']);
  Self.Table.TableItems.TableReferans := VarArrayOf(['STKHAR', 'STHURT', 'STKKRT', 'STH001']);
  Self.Table.TableItems.TableCaptions := VarArrayOf(['Stok Hareket', '!', '!', 'Stok Durum']);
  Self.Table.IndexFieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO;HESAPKOD;KONSOLIDESIRKETNO;SIRANO';

  with Self.Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
      AddExpression('STKHAR.MIKTAR - STKHAR.KULLANILANMIKTAR', '_KALANMIKTAR');
    end;
//    with Where do
//    begin
//      AddText('0 = 1');
//    end;
  end;

  with Self.Table.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('OPERASYONNO');
      Add('RECETEKAYNAKTIP');
      Add('KAYNAKISLEMNO');
      Add('OPBASTARIH');
      Add('OPBASTARIHSAAT');
      Add('OPBITTARIH');
      Add('OPBITTARIHSAAT');
      Add('OPDURUM');
      Add('SONOPDURUM');
      Add('SIRANO');
    end;
    with Join do
    begin
      JoinType := jtInner;
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('HESAPKOD', 'HESAPKOD');
      Add('EVRAKTIP', 'EVRAKTIP');
      Add('EVRAKNO', 'EVRAKNO');
      Add('SIRANO', 'SIRANO');
    end;
  end;

  with Self.Table.TableItems[2] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALAD');
      Add('SARFYONTEM');
      Add('MEKANIKSARFYONTEM');
      Add('BARKOD1');
      Add('MALKOD2');
    end;
    with Join do
    begin
      JoinType := jtInner;
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('MALKOD', 'MALKOD');
    end;
  end;

  with Self.Table.TableItems[3] do
  begin
    with Fields do
    begin
      Clear;
      Add('KULLANILABILIR');
    end;
    with Join do
    begin
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('MALKOD', 'MALKOD');
      Add('DEPOKOD', 'DEPOKOD');
      Add('VERSIYONNO', 'VERSIYONNO');
      Add('SERINO', 'SERINO');
      Add('SERINO2', 'SERINO2');
    end;
  end;

//  Self.GridView.OptionsSelection.CellSelect := false;
//  Self.GridView.OptionsSelection.HideFocusRectOnExit := false;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.DoControlOpDurum;
var
  ABookMark: TAppBookmark;
  function DoControlSiparisHareketOpDurum: Integer;
  var
    fResult: Integer;
    fodReleased, fodStarted, fodFinished: Integer;
    vOpIslemNo: Integer;
  begin
    fResult := 0;
    fodReleased := 0;
    fodStarted := 0;
    fodFinished := 0;

    Self.Run;
    ABookMark := Self.Table.GetBookmark;
    Self.Table.DisableControls;

    Self.Table.First;
    while not Self.Table.Eof do
    begin
      if Self.Table.FieldValues['STHURT_OPDURUM'] = odNone then
        fodReleased := fodReleased + 1;
      if Self.Table.FieldValues['STHURT_OPDURUM'] = odStarted then
        fodStarted := fodStarted + 1;
      if Self.Table.FieldValues['STHURT_OPDURUM'] = odFinished then
        fodFinished := fodFinished + 1;
      Self.Table.Next;
    end;

    Self.Table.GotoBookmark(ABookMark);
    Self.Table.FreeBookmark(ABookMark);
    Self.Table.EnableControls;

    If (fodReleased > 0) And (fodStarted = 0) and (fodFinished = 0) then
      fResult := odReleased else
    if (fodReleased > 0) And (fodStarted > 0) and (fodFinished = 0) then
      fResult := odStarted else
    if (fodReleased > 0) And (fodStarted > 0) and (fodFinished > 0) then
      fResult := odStarted else
    if (fodReleased = 0) And (fodStarted > 0) and (fodFinished = 0) then
      fResult := odStarted else
    if (fodReleased = 0) And (fodStarted > 0) and (fodFinished > 0) then
      fResult := odStarted else
    if (fodReleased = 0) And (fodStarted = 0) and (fodFinished = 0) then
      fResult := odReleased else
    if (fodReleased > 0) And (fodStarted = 0) and (fodFinished > 0) then
      fResult := odStarted else
    if (fodReleased = 0) And (fodStarted = 0) and (fodFinished > 0) then
      fResult := odFinished;


    vOpIslemNo := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.OpIslemNo;
    if fResult = odStarted then
    begin
      if not (DataApp.UretimRotaKaynakOperasyon.Table.Locate('ISLEMNO', vOpIslemNo, [])) then
        TAppDOPUretimTerminalVeriGiris(DocApp).DoStartOperasyon(vOpIslemNo);
    end
    else
    if fResult = odFinished then
      TAppDOPUretimTerminalVeriGiris(DocApp).DoFinishOperasyon;

    Result := fResult;
  end;
begin
//  DoSaveDataObject; // Test için ekledim.
  DoControlSiparisHareketOpDurum;
end;


function TAppDocChildUretimTerminalReceteTuketim.CheckMalzemeStokDurum: Boolean;
var
  ErrorMessage: String;
  fResult: Boolean;
  function MalzemeZatenTuketilmis: Boolean;
  var
    xOldIndex: String;
    fResult: Boolean;
  begin
    xOldIndex := DataApp.UretimStokHareket.Table.Clone.IndexFieldNames;
    DataApp.UretimStokHareket.Table.Clone.IndexFieldNames := 'IRSALIYENO;MALKOD;SERINO;VERSIYONNO;DEPOKOD;MIKTAR;GIRISCIKIS';
    DataApp.UretimStokHareket.Table.Clone.SetRange([Self.Table.FieldValues['SIPARISNO'], Self.Table.FieldValues['MALKOD'], Self.Table.FieldValues['SERINO'], Self.Table.FieldValues['VERSIYONNO'], Self.Table.FieldValues['DEPOKOD'], AMiktar, gcCikis],
                                                   [Self.Table.FieldValues['SIPARISNO'], Self.Table.FieldValues['MALKOD'], Self.Table.FieldValues['SERINO'], Self.Table.FieldValues['VERSIYONNO'], Self.Table.FieldValues['DEPOKOD'], AMiktar, gcCikis]);

    fResult := not DataApp.UretimStokHareket.Table.Clone.IsEmpty;
    DataApp.UretimStokHareket.Table.Clone.IndexFieldNames := xOldIndex;
    Result := fResult;
//    Result := not FTableUretimSiparisHareketClone.Table.Clone.IsEmpty;
  end;
begin
  fResult := false;

  if LocateUretimSiparisHareket then
  begin
    if (Self.Table.FieldValues['STKDRM_KULLANILABILIR'] < AMiktar) then
    begin
      ErrorMessage := 'Stok miktarý eksiye düþemez! Depoda yeterli mevcut bulunamadý!';// + #13 + #13;
      TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog(ErrorMessage);
      fResult := false;
    end
    else
      fResult := true;
  end;
  Result := fResult;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.DisableAllButtons;
var
  FToolButton: TToolButton;
  vIslemTuketimTip: Smallint;
begin
  vIslemTuketimTip := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.KaynakIslem.TuketimTip;
  FToolButton := FormTerminalMenu.ToolButtonReceteTuketimTitleTuketimleriTamamla;
  FToolButton.Enabled :=  vIslemTuketimTip = KaynakIslem_TuketimTip_Otomatik;

  Self.GridView.OptionsData.Editing := vIslemTuketimTip = KaynakIslem_TuketimTip_Otomatik;
  Self.ReadOnly := false;

  Self.GridView.OptionsSelection.CellSelect := vIslemTuketimTip = KaynakIslem_TuketimTip_Otomatik;
  Self.GridView.OptionsSelection.HideFocusRectOnExit := vIslemTuketimTip = KaynakIslem_TuketimTip_Otomatik;

  FToolButton := FormTerminalMenu.ToolButtonReceteTuketimBaslat;
  if FToolButton <> nil then
    TToolButton(FToolButton).Enabled := false;

  FToolButton := FormTerminalMenu.ToolButtonReceteTuketimBitir;
  if FToolButton <> nil then
    TToolButton(FToolButton).Enabled := false;

  FToolButton := FormTerminalMenu.ToolButtonReceteTuketimDurus;
  if FToolButton <> nil then
  begin
    TToolButton(FToolButton).Enabled := false;
    TToolButton(FToolButton).Caption := 'Duruþ Bildir';
  end;

  FToolButton := FormTerminalMenu.ToolButtonReceteTuketimHata;
  if FToolButton <> nil then
    TToolButton(FToolButton).Enabled := false;

  FToolButton := FormTerminalMenu.ToolButtonReceteTuketimLotDegistir;
  if FToolButton <> nil then
    TToolButton(FToolButton).Enabled := false;

  FToolButton := FormTerminalMenu.ToolButtonReceteTuketimKalemKapat;
  if FToolButton <> nil then
    TToolButton(FToolButton).Enabled := false;

  FToolButton := FormTerminalMenu.ToolButtonReceteTuketimKalemSifirla;
  if FToolButton <> nil then
    TToolButton(FToolButton).Enabled := false;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.DoAfterScroll(
  Table: TAppCustomTable);
begin
  AfterScroll;
end;

function TAppDocChildUretimTerminalReceteTuketim.DoSaveDataObject: Boolean;
begin
  if DataApp.DataObject.Save then
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DoOpenDocument;
    Result := true
  end else
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Hata oluþtu. Ýþlem iptal edilecek!');
    DataApp.DataObject.Cancel;
    Result := false;
  end;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.OnGridCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  AfterScroll;

  if TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.Firma = 'Noya' then
  begin
    TAppDocFormUretimTerminalMenu(TAppDOPUretimTerminalVeriGiris(DocApp).FormGlobal).edtBarcode1.Text := Self.Table.FieldValues['STKKRT_BARKOD1'];
    TAppDocFormUretimTerminalMenu(TAppDOPUretimTerminalVeriGiris(DocApp).FormGlobal).edtBarcode2.Clear;
    TAppDocFormUretimTerminalMenu(TAppDOPUretimTerminalVeriGiris(DocApp).FormGlobal).edtBarcode2.SetFocus;
  end;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.MSY_CompleteAllManual(
  TuketimYap: Boolean);
var
  ABookMark: TAppBookmark;
  procedure DoInsert;
  begin
    if LocateUretimSiparisHareket then
    begin
      if DataApp.UretimSiparisHareket.Table.Miktar >0 then
        if CheckMalzemeStokDurum then
          DataApp.DataControllerUretimKart.AddManualBaglanti(TAppOpUpdateStatus(2), '', TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.EvrakUretimTarih, DataApp.UretimSiparisHareket.Table.Miktar)
        else
          exit;
    end;
  end;

  function DoControlSiparisHareketOpDurum: Integer;
  begin
    Result := 0;
    Self.Run;
    ABookMark := Self.Table.GetBookmark;

    Self.Table.DisableControls;
    Self.Table.First;
    while not Self.Table.Eof do
    begin
      if Self.Table.FieldValues['STHURT_OPDURUM'] = odNone then
      begin
        SetParameters;
        if TuketimYap then
          DoInsert;
        UpdateTableSTHURTDurum(odStarted);
        UpdateTableSTHURTDurum(odFinished);
      end;
      if Self.Table.FieldValues['STHURT_OPDURUM'] = odReleased then
      begin
        SetParameters;
        if TuketimYap then
          DoInsert;
        UpdateTableSTHURTDurum(odFinished);
      end;

      Self.Table.Next;
    end;
    Self.Table.GotoBookmark(ABookMark);
    Self.Table.FreeBookmark(ABookMark);
    Self.Table.EnableControls;
  end;
begin
  DoControlSiparisHareketOpDurum;
  Self.Run;
  DoSaveDataObject;
end;

function TAppDocChildUretimTerminalReceteTuketim.LocateUretimSiparisHareket: Boolean;
var
  ANewIndexes: String;
  vSiparisNo: String;
  vSiraNo: Integer;
  vGirisCikis: Integer;
  vOperasyonNo: Integer;
  vKaynakIslemNo: Integer;
begin
  UretimSiparisHareketOldIndexes := DataApp.UretimSiparisHareket.Table.IndexFieldNames;
  ANewIndexes := 'SIPARISNO;SIRANO;GIRISCIKIS;STHURT_OPERASYONNO;STHURT_KAYNAKISLEMNO';
  DataApp.UretimSiparisHareket.Table.IndexFieldNames := ANewIndexes;

  vSiparisNo := Self.Table.FieldByName('SIPARISNO').AsString;
  vSiraNo := Self.Table.FieldByName('SIRANO').AsInteger;
  vGirisCikis := Self.Table.FieldByName('GIRISCIKIS').AsInteger;
  vOperasyonNo := Self.Table.FieldByName('STHURT_OPERASYONNO').AsInteger;
  vKaynakIslemNo := Self.Table.FieldByName('STHURT_KAYNAKISLEMNO').AsInteger;

  DataApp.UretimSiparisHareket.Table.SetRange([vSiparisNo, vSiraNo, vGirisCikis, vOperasyonNo, vKaynakIslemNo], [vSiparisNo, vSiraNo, vGirisCikis, vOperasyonNo, vKaynakIslemNo]);
  if DataApp.UretimSiparisHareket.Table.IsEmpty then
    Result := false
  else
    Result := true;
end;

function TAppDocChildUretimTerminalReceteTuketim.UpdateTableSTHURTDurum(AStatus: Integer): Boolean;
var aSQLStr: String;
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    TerminalParametre.ReceteTuketim.Id := Self.Table.FieldByName('ID').AsInteger;
    TerminalParametre.ReceteTuketim.HesapKod := Self.Table.FieldByName('HESAPKOD').AsString;
    TerminalParametre.ReceteTuketim.EvrakNo := Self.Table.FieldByName('EVRAKNO').AsString;
    TerminalParametre.ReceteTuketim.SiparisNo := Self.Table.FieldByName('SIPARISNO').AsString;
    TerminalParametre.ReceteTuketim.MalKod := Self.Table.FieldByName('MALKOD').AsString;
    TerminalParametre.ReceteTuketim.VersiyonNo := Self.Table.FieldByName('VERSIYONNO').AsString;
    TerminalParametre.ReceteTuketim.SeriNo := Self.Table.FieldByName('SERINO').AsString;
    TerminalParametre.ReceteTuketim.SeriNo2 := Self.Table.FieldByName('SERINO2').AsString;
    TerminalParametre.ReceteTuketim.Birim := Self.Table.FieldByName('EVRAKBIRIM').AsString;
    TerminalParametre.ReceteTuketim.DepoKod := Self.Table.FieldByName('DEPOKOD').AsString;
  end;

  if (AStatus In [odNone]) then
    aSQLStr := 'Update STHURT Set OPDURUM = %d ';
  if (AStatus = odStarted) then
    aSQLStr := 'Update STHURT Set OPBASTARIH = GetDate(), OPBASTARIHSAAT = DateAdd(MINUTE, 1, GetDate()), OPDURUM = %d ';
  if (AStatus = odFinished) then
    aSQLStr := 'Update STHURT Set OPBITTARIH = GetDate(), OPBITTARIHSAAT = DateAdd(MINUTE, 1, GetDate()), OPDURUM = %d ';

  if (AStatus = odFinished) and (AMiktar < Self.Table.FieldValues['_KALANMIKTAR']) then
  begin
    if (AskMalzemeTuketimDurum = 10) then
    begin
      AStatus := odStarted;
      aSQLStr := 'Update STHURT Set OPDURUM = %d '
    end;
  end;

  if (AStatus = 200) then
  begin
    AStatus := odFinished;
    aSQLStr := 'Update STHURT Set OPBASTARIH = GetDate(), OPBASTARIHSAAT = DateAdd(MINUTE, 1, GetDate()), OPBITTARIH = GetDate(), OPBITTARIHSAAT = DateAdd(MINUTE, 1, GetDate()), OPDURUM = %d ';
  end;


  aSQLStr := aSQLStr + 'Where HESAPKOD = ''%s'' And EVRAKNO = ''%s'' And EVRAKTIP = %d And SIRANO = %d And OPERASYONNO = %d And KAYNAKISLEMNO = %d ';
  aSQLStr := Format(aSQLStr, [AStatus, ParamsSelf.HesapKod, ParamsSelf.EvrakNo, ParamsSelf.EvrakTip, ParamsSelf.SiraNo, ParamsSelf.OperasyonNo, ParamsSelf.KaynakIslemNo]);
  try
    DataApp.TableCommand.Execute(aSQLStr);
    Result := true;
  Except
    Result := false;
  end;

  if Result = true then
  begin
    Self.Run;
    if ParamsSelf.AppName = atReceteTuketimForHammaddeTuketim then
      if AStatus <> odNone then
        DoControlOpDurum;
  end;
  Self.Run;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.OnClickTuketimleriTamamla(
  Sender: TObject);
var
  TableTemp: TAppTable;
  procedure CreateTempTable;
  begin
    TableTemp := TAppTable.Create(nil);

    TableTemp.FieldDefs.Clear;
    with TableTemp.FieldDefs do
    begin
      Add('ID', ftInteger);
      Add('MIKTAR', ftFloat);
    end;
    TableTemp.CreateFields;
    TableTemp.CreateDataSet;
    TableTemp.Open;
  end;
begin
  CreateTempTable;
  DontAskMiktar := true;
  Self.Table.First;
  while not Self.Table.Eof do
  begin
    if Self.Table.FieldValues['STHURT_OPDURUM'] = odNone then
    begin
      TableTemp.Insert;
      TableTemp.FieldValues['ID'] := Self.Table.FieldValues['ID'];
      TableTemp.FieldValues['MIKTAR'] := Self.Table.FieldValues['MIKTAR'];
      TableTemp.Post;
    end;
    Self.Table.Next;
  end;

  TableTemp.First;
  while not TableTemp.Eof do
  begin
    if Self.Table.Locate('ID', TableTemp.FieldValues['ID'], []) then
    begin
      Self.Table.Edit;
      Self.Table.FieldValues['MIKTAR'] := TableTemp.FieldValues['MIKTAR'];
      if FormTerminalMenu.ToolButtonReceteTuketimBaslat.Enabled then
        MSY_StartOrFinish;
    end;

    if Self.Table.Locate('ID', TableTemp.FieldValues['ID'], []) then
    begin
      Self.Table.Edit;
      Self.Table.FieldValues['MIKTAR'] := TableTemp.FieldValues['MIKTAR'];
      if FormTerminalMenu.ToolButtonReceteTuketimBitir.Enabled then
        MSY_StartOrFinish;
    end;
    TableTemp.Next;
  end;
  TableTemp.Close;
  FreeAndNil(TableTemp);
  DontAskMiktar := false;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.OnClickTuketimListesi(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalReceteTuketimList.Table.TableItems[0].Where do
  begin
    Clear;
    Add('KAYITTUR', wcEqual, 1);
    AddOperator(woAnd);
    Add('EVRAKTIP', wcEqual, 51);
    AddOperator(woAnd);
    Add('SIRKETNO', wcEqual, DataApp.CompanyNo);
    AddOperator(woAnd);
    Add('EVRAKNO', wcEqual, DataApp.UretimKart.Table.EvrakNo);
    AddOperator(woAnd);
    Add('GIRISCIKIS', wcEqual, gcCikis);
  end;

  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    ChildUretimTerminalReceteTuketimList.Run;
    ChildUretimTerminalReceteTuketimList.SourceDockPanelName := ChildUretimTerminalReceteTuketim.DockPanel.Name;
//    ChildUretimTerminalReceteTuketimList.ShowChild(true);
    ShowThisDockPanel(ChildUretimTerminalReceteTuketimList.DockPanel.Name);
  end;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.OnClickPlansizTuketim(
  Sender: TObject);
begin
  if (DataApp.UretimEvrakBaslik.Table.IsEmpty) or (DataApp.UretimEvrakBaslik.Table.EvrakNo = '') then
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Evrak Baþlýk bilgileri bulunmuyor. ' + #13 +
    'Devam etmeden önce Evrak Üretim Ýþ Emri kartýndan Evrak Baþlýk bilgilerini girin ya da Ürün aðacýndan tüketim yapýn!');
    Exit;
  end;

  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    TerminalParametre.ReceteTuketim.HesapKod := DataApp.UretimKart.Table.HesapKod;
    TerminalParametre.ReceteTuketim.EvrakNo := DataApp.UretimKart.Table.EvrakNo;
    TerminalParametre.ReceteTuketim.SiparisNo := DataApp.UretimKart.Table.EvrakNo;
//    TerminalParametre.ReceteTuketim.MalKod := Self.Table.FieldByName('MALKOD').AsString;
//    TerminalParametre.ReceteTuketim.VersiyonNo := Self.Table.FieldByName('VERSIYONNO').AsString;
//    TerminalParametre.ReceteTuketim.SeriNo := Self.Table.FieldByName('SERINO').AsString;
    TerminalParametre.ReceteTuketim.SiraNo := 0;
  end;



  TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalManualTuketimStepOne.DoStart;
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalManualTuketimStepOne.DockPanel.Name);
//  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalManualTuketimInfo.DockPanel.Name, true);
end;

procedure TAppDocChildUretimTerminalReceteTuketim.MSY_StartOrFinish;
var
  ErrorMessage: String;
  function DoInsert: Boolean;
  var
    fResult: Boolean;
  begin
    fResult := false;
    if AMiktar >0 then
    begin
      if CheckMalzemeStokDurum then
      begin
//        TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.ReceteTuketim.EvrakMiktar := Self.Table.FieldValues['MIKTAR'];
//        TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.ReceteTuketim.KullanilanMiktar := AMiktar;
//        TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.ReceteTuketim.KalanMiktar := Self.Table.FieldValues['_KALANMIKTAR'];

        DataApp.DataControllerUretimKart.AddManualBaglanti(TAppOpUpdateStatus(2), '', TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.EvrakUretimTarih, AMiktar);
        fResult := true;
      end
      else
      begin
        fResult := false;
      end;
    end;

     Result := fResult;
  end;

begin
  if HammaddeMekanikSarfYontem = msyBackward then
  begin
    if ParamsSelf.fOpDurum = odNone then
      UpdateTableSTHURTDurum(odStarted)
    else if ParamsSelf.fOpDurum = odStarted then
    begin
      if DontAskMiktar then
        AMiktar := Self.Table.FieldValues['_KALANMIKTAR']
      else
      with TAppDOPUretimTerminalVeriGiris(DocApp) do
        AMiktar := DocCustomProperties.AppForms.AppFormNumericPadInformation(ChildUretimTerminalMalzemeBilgileriGiris, Self.DockPanel.Name, FloatToStr(Self.Table.FieldValues['_KALANMIKTAR']));

      if AMiktar > 0 then
      begin
        if Self.Table.FieldValues['EVRAKDURUM'] = 1 then
        begin
          ErrorMessage := 'Bu malzemenin Evrak Durumu = Kapalý. Malzeme üzerinde iþlem yapabilmeniz için Evrak Durumu = Açýk olmak zorunda! ' + #13 + 'Bu malzeme üzerinde iþlem yapamazsýnýz. ' + #13 + #13 + 'Lütfen yöneticinize baþvurun!';// + #13 + #13;
          TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog(ErrorMessage);
          exit;
        end;

        if DoInsert then
        begin
          UpdateTableSTHURTDurum(odFinished);
        end;

      end;
    end;
  end;

  if HammaddeMekanikSarfYontem = msyForward then
  begin
    if ParamsSelf.fOpDurum = odNone then
    begin
      if DontAskMiktar then
        AMiktar := Self.Table.FieldValues['_KALANMIKTAR']
      else
      with TAppDOPUretimTerminalVeriGiris(DocApp) do
        AMiktar := DocCustomProperties.AppForms.AppFormNumericPadInformation(ChildUretimTerminalMalzemeBilgileriGiris, Self.DockPanel.Name, FloatToStr(Self.Table.FieldValues['_KALANMIKTAR']));

      if AMiktar > 0 then
      begin
        if Self.Table.FieldValues['EVRAKDURUM'] = 1 then
        begin
          ErrorMessage := 'Bu malzemenin Evrak Durumu = Kapalý. Malzeme üzerinde iþlem yapabilmeniz için Evrak Durumu = Açýk olmak zorunda! ' + #13 + 'Bu malzeme üzerinde iþlem yapamazsýnýz. ' + #13 + #13 + 'Lütfen yöneticinize baþvurun!';// + #13 + #13;
          TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog(ErrorMessage);
          exit;
        end;

        if DoInsert then
          UpdateTableSTHURTDurum(odStarted);
      end;
    end else if ParamsSelf.fOpDurum = odStarted then
      UpdateTableSTHURTDurum(odFinished);
  end;
  DoSaveDataObject;
  Self.Run;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.btMSY_StartOrFinish(
  Sender: TObject);
begin
  DontAskMiktar := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.OpOtomatikTuket;
  MSY_StartOrFinish;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.OnClickKalemSifirla(
  Sender: TObject);
var
  ANewIndexes, AOldIndexes: String;
begin
  AOldIndexes := DataApp.UretimSiparisHareket.Table.IndexFieldNames;
  ANewIndexes := 'SIPARISNO;SIRANO;GIRISCIKIS;STHURT_OPERASYONNO;STHURT_KAYNAKISLEMNO;STKKRT_SARFYONTEM';

  DataApp.UretimSiparisHareket.Table.IndexFieldNames := ANewIndexes;

  if DataApp.UretimSiparisHareket.Table.Locate(ANewIndexes, VarArrayOf([
                                                               Self.Table.FieldByName('SIPARISNO').AsString,
                                                               Self.Table.FieldByName('SIRANO').AsInteger,
                                                               Self.Table.FieldByName('GIRISCIKIS').AsInteger,
                                                               Self.Table.FieldByName('STHURT_OPERASYONNO').AsInteger,
                                                               Self.Table.FieldByName('STHURT_KAYNAKISLEMNO').AsInteger,
                                                               Self.Table.FieldByName('STKKRT_SARFYONTEM').AsInteger]), []) then

  DataApp.DataControllerUretimKart.AddManualBaglanti(TAppOpUpdateStatus(3), '', TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.EvrakUretimTarih, Self.Table.FieldValues['MIKTAR']);

    DoSaveDataObject;
//  DataApp.DataObject.Save;
  DataApp.UretimSiparisHareket.Table.IndexFieldNames := AOldIndexes;
  SetParameters;
  UpdateTableSTHURTDurum(odNone);
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Geri alma iþlemi tamamlandý!');
  Self.Run;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.DoBarcodeMalKod(ABarcodeMalKodAyar: Smallint);
begin
  AfterScroll;
  case ABarcodeMalKodAyar of
    1: begin
      if FormTerminalMenu.ToolButtonReceteTuketimBaslat.Enabled = true then
        FormTerminalMenu.ToolButtonReceteTuketimBaslat.Click;
    end;
    2: begin
      if FormTerminalMenu.ToolButtonReceteTuketimBitir.Enabled = true then
        FormTerminalMenu.ToolButtonReceteTuketimBitir.Click;
    end;
    3: begin
      if FormTerminalMenu.ToolButtonReceteTuketimBaslat.Enabled = true then
        FormTerminalMenu.ToolButtonReceteTuketimBaslat.Click
      else if FormTerminalMenu.ToolButtonReceteTuketimBitir.Enabled = true then
        FormTerminalMenu.ToolButtonReceteTuketimBitir.Click;
    end;
  end; // end of Case
end;

procedure TAppDocChildUretimTerminalReceteTuketim.LocateBarcodeRecord;
var
  vBarcodeMalKodAyar: Smallint;
  vBarcodeCode, vBarcodeSeriNo, vBarcodeMalKod, vBarcodeDepoKod: String;

  procedure GetBarcodeFieldValues;
  begin
    vBarcodeSeriNo := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalBarcode.BarcodeSeriNo;
    vBarcodeMalKod := Self.Table.FieldValues['MALKOD'];
    vBarcodeDepoKod := Self.Table.FieldValues['DEPOKOD'];
  end;

  function GetBarcodeSeriNo: Boolean;
  var SQLStr: String;
  begin
    SQLStr := 'Select MALKOD, DEPOKOD, SERINO, KULLANILABILIR From dbo.VW_STOKDURUM Where KULLANILABILIR > 0 And MALKOD = ''%s'' And SERINO = ''%s'' And DEPOKOD = ''%s''';
    SQLStr := Format(SQLStr, [vBarcodeMalKod, vBarcodeSeriNo, vBarcodeDepoKod]);
    DataApp.TableCommand.OpenCommandText(SQLStr);

    Result := not DataApp.TableCommand.IsEmpty;
  end;

  procedure SetBarcodeSeriNo;
  var
    SQLStr: String;
    vEvrakNo: String;
    vUretimSiraNo, vOperasyonNo, vKaynakIslemNo: Integer;
  begin

    vEvrakNo := DataApp.UretimRotaKaynak.Table.UretimNo;
    vUretimSiraNo := DataApp.UretimRotaKaynak.Table.UretimSiraNo;
    vOperasyonNo := TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OperasyonNo;
    vKaynakIslemNo := TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpIslemNo;

    SQLStr := '';
    SQLStr := SQLStr + ' Update STKHAR';
    SQLStr := SQLStr + ' Set STKHAR.SERINO = ''%s''';
    SQLStr := SQLStr + ' From STKHAR STKHAR';
    SQLStr := SQLStr + ' Inner Join dbo.STHURT STHURT WITH (NoLock) On';
    SQLStr := SQLStr + '   (STHURT.SIRKETNO = STKHAR.SIRKETNO And STHURT.HESAPKOD = STKHAR.HESAPKOD And STHURT.EVRAKTIP = STKHAR.EVRAKTIP';
    SQLStr := SQLStr + '   And STHURT.EVRAKNO = STKHAR.EVRAKNO And STHURT.SIRANO = STKHAR.SIRANO)';
    SQLStr := SQLStr + ' Where STKHAR.KAYITTUR = 1';
    SQLStr := SQLStr + ' And STKHAR.EVRAKTIP = 54';
    SQLStr := SQLStr + ' And STKHAR.SIRKETNO = ''%s''';
    SQLStr := SQLStr + ' And STKHAR.EVRAKNO = ''%s''';
    SQLStr := SQLStr + ' And STKHAR.GIRISCIKIS = 1';
    SQLStr := SQLStr + ' And STKHAR.SIRANO2 = %s';
    SQLStr := SQLStr + ' And STHURT.OPERASYONNO = %s';
    SQLStr := SQLStr + ' And STHURT.KAYNAKISLEMNO = %s';
    SQLStr := SQLStr + ' And STKHAR.MALKOD = ''%s''';

    SQLStr := Format(SQLStr, [vBarcodeSeriNo, DataApp.CompanyNo, vEvrakNo, IntToStr(vUretimSiraNo), IntToStr(vOperasyonNo), IntToStr(vKaynakIslemNo), vBarcodeMalKod]);
    DataApp.TableCommand.Execute(SQLStr);
    TAppDOPUretimTerminalVeriGiris(FDocApp).DoOpenDocument;
    TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimKaynakIslem.Table.Locate('ISLEMNO', TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpIslemNo, []);
    Self.Run;
  end;

begin
  vBarcodeMalKodAyar := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalBarcode.BarcodeMalKodAyar;
  vBarcodeCode := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalBarcode.BarcodeCode;
  vBarcodeSeriNo := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalBarcode.BarcodeSeriNo;
                                                                                                                          
  if TAppDOPUretimTerminalVeriGiris(DocApp).TerminalBarcode.BarcodeMenu = 'MALKOD' then
  begin
    if not Self.Table.Locate('STKKRT_BARKOD1', vBarcodeCode, []) then
    begin
      TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Barkod Bilgisi Bulunamadý!');
    end else
    if Self.Table.Locate('STKKRT_BARKOD1;SERINO', VarArrayOf([vBarcodeCode, vBarcodeSeriNo]), []) then
    begin
      DoBarcodeMalKod(vBarcodeMalKodAyar)
    end else
    if Self.Table.Locate('STKKRT_BARKOD1', VarArrayOf([vBarcodeCode]), []) then
    begin
      { Barkod bilgisi bulundu ise}
      GetBarcodeFieldValues;
      if GetBarcodeSeriNo then begin
        SetBarcodeSeriNo;
        if Self.Table.Locate('STKKRT_BARKOD1;SERINO', VarArrayOf([vBarcodeCode, vBarcodeSeriNo]), []) then
          DoBarcodeMalKod(vBarcodeMalKodAyar)
        else
      end else
        TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Belirtilen Barkod ve Seri No bilgisi depo kayýtlarýnda bulunmuyor.!')
    end;
  end;
  TAppDOPUretimTerminalVeriGiris(DocApp).OnSetFocusBarcodeText(Self);
end;

procedure TAppDocChildUretimTerminalReceteTuketim.OnClickBarcodeMalKod(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PageControl.ActivePageIndex := 2;
  TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalBarcode.BarcodeMenu := 'MALKOD';
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.ShowModal;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.OnClickDateSettings(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PageControl.ActivePageIndex := 0;
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.ShowModal;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.OnClickDurus(Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.IslemNo := DataApp.UretimRotaKaynakOperasyon.Table.IslemNo;
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.DurusCommand := 1;

  if ParamsSelf.OpDurum In [odNone, odStarted] then
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalMalzemeDurusStepOne.DoRun;
    TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalMalzemeDurusStepOne.DockPanel.Name);
  end;

  if ParamsSelf.OpDurum In [odPaused] then
    TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalMalzemeDurusStepTwo.DurusSonlandir;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.OnClickHata(Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalMalzemeHataKart.DoRun;
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalMalzemeHataKart.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalReceteTuketim.OnClickKalemKapat(
  Sender: TObject);
begin
  UpdateTableSTHURTDurum(odFinished);
  DoSaveDataObject;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.OnClickLotDegistir(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(FDocApp) do
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
end;

procedure TAppDocChildUretimTerminalReceteTuketim.btYuklemeyiTamamla(Sender: TObject);
var
  ErrorMessage: String;
  function DoInsert: Boolean;
  var
    fResult: Boolean;
  begin
    fResult := false;
    if AMiktar >0 then
     if CheckMalzemeStokDurum then
     begin
      DataApp.DataControllerUretimKart.AddManualBaglanti(TAppOpUpdateStatus(2), '', TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.EvrakUretimTarih, AMiktar);
      fResult := true;
     end
     else
      fResult := false;
     Result := fResult;
  end;
begin
//  FormTerminalMenu.btKaynakIslemBaslat.Enabled := false;

  if Self.Table.FieldValues['EVRAKDURUM'] = 1 then
  begin
    ErrorMessage := 'Bu Malzemein Evrak Durumu = Kapalý. Bu malzeme üzerinde iþlem yapamazsýnýz. Lütfen yöneticinize baþvurun!';// + #13 + #13;
    TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog(ErrorMessage);
    exit;
  end;

  if TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.OpOtomatikTuket then
    AMiktar := Self.Table.FieldValues['_KALANMIKTAR']// DataApp.UretimSiparisHareket.Table.Miktar
  else

  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    AMiktar := DocCustomProperties.AppForms.AppFormNumericPadInformation(ChildUretimTerminalMalzemeBilgileriGiris, Self.DockPanel.Name, FloatToStr(Self.Table.FieldValues['_KALANMIKTAR']));
  end;

  if AMiktar > 0 then
  begin
    if CheckMalzemeStokDurum then
      DataApp.DataControllerUretimKart.AddManualBaglanti(TAppOpUpdateStatus(2), '', TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.EvrakUretimTarih, AMiktar)
    else
      Exit;

    DoSaveDataObject;
    UpdateTableSTHURTDurum(200);
    DoSaveDataObject;
  end;
end;

function TAppDocChildUretimTerminalReceteTuketim.AskMalzemeTuketimDurum: Integer;
begin

  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    DocFormSettings.PageControl.ActivePageIndex := 4;
    DocFormSettings.lbTuketimMiktar_TuketilecekMiktar.Caption := FloatToStr(Self.Table.FieldValues['_KALANMIKTAR']);
    DocFormSettings.lbTuketimMiktar_TuketilenMiktar.Caption := FloatToStr(AMiktar);
    DocFormSettings.ShowModal;
    Result := DocFormSettings.MalzemeTuketimDurum;
  end;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.SetParameters;
begin
  if Self.Table.IsEmpty then
    Exit;

//  with TAppDOPUretimTerminalVeriGiris(DocApp) do
//  begin
//    TerminalParametre.ReceteTuketim.HesapKod := Self.Table.FieldByName('HESAPKOD').AsString;
//    TerminalParametre.ReceteTuketim.EvrakNo := Self.Table.FieldByName('EVRAKNO').AsString;
//    TerminalParametre.ReceteTuketim.SiparisNo := Self.Table.FieldByName('SIPARISNO').AsString;
//    TerminalParametre.ReceteTuketim.MalKod := Self.Table.FieldByName('MALKOD').AsString;
//    TerminalParametre.ReceteTuketim.VersiyonNo := Self.Table.FieldByName('VERSIYONNO').AsString;
//    TerminalParametre.ReceteTuketim.SeriNo := Self.Table.FieldByName('SERINO').AsString;
//    TerminalParametre.ReceteTuketim.SeriNo2 := Self.Table.FieldByName('SERINO2').AsString;
//    TerminalParametre.ReceteTuketim.SiraNo := Self.Table.FieldByName('SIRANO').AsInteger;
//  end;
//
  ParamsSelf.HesapKod := Self.Table.FieldByName('HESAPKOD').AsString;
  ParamsSelf.EvrakNo := Self.Table.FieldByName('EVRAKNO').AsString;
  ParamsSelf.EvrakTip := Self.Table.FieldByName('EVRAKTIP').AsInteger;
  ParamsSelf.SiraNo := Self.Table.FieldByName('SIRANO').AsInteger;
  ParamsSelf.OpDurum := Self.Table.FieldByName('STHURT_OPDURUM').AsInteger;
  ParamsSelf.OperasyonNo := Self.Table.FieldByName('STHURT_OPERASYONNO').AsInteger;
  ParamsSelf.KaynakIslemNo := Self.Table.FieldByName('STHURT_KAYNAKISLEMNO').AsInteger;
end;

//function TAppDocChildUretimTerminalReceteTuketim.IslemDurum: Smallint;
//var
//  aSQLStr: String;
//begin
//  aSQLStr := 'Select TOP 1 DURUM From URTRKO Where EVRAKNO = ''%s'' And URETIMNO = ''%s'' And URETIMSIRANO = %d And OPERASYONNO = %d And ISLEMNO = %d Order By SIRANO Desc';
//  aSQLStr := Format(aSQLStr, [DataApp.UretimRotaKaynak.Table.EvrakNo, DataApp.UretimRotaKaynak.Table.UretimNo, DataApp.UretimRotaKaynak.Table.UretimSiraNo, DataApp.UretimRotaKaynak.Table.OperasyonNo, TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimKaynakIslem.Table.FieldByName('ISLEMNO').AsInteger]);
//  DataApp.TableCommand.OpenCommandText(aSQLStr);
//
//  if not DataApp.TableCommand.IsEmpty then
//    Result := DataApp.TableCommand.FieldByName('DURUM').AsInteger
//  else
//    Result := 1;
//end;

procedure TAppDocChildUretimTerminalReceteTuketim.AfterCreate;
begin
  inherited;
  Self.AppName := 'ChildUretimTerminalReceteTuketim';
  Self.Caption := 'Terminal Reçete Tüketim';
  Self.DockPanel.OnActivate := DockPanelOnActivate;
  Self.GridView.OnCustomDrawCell := CustomDrawCell;
  PrepareDefination;
  Self.Table.TableItems[0].Where.AddText('0 = 1');
  DontAskMiktar := false;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.AfterScroll;
var
  FToolButton: TToolButton;
begin
  HammaddeMekanikSarfYontem := TAppMekanikSarfYontem(Self.Table.FieldByName('STKKRT_MEKANIKSARFYONTEM').AsInteger);

  TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDurum := Self.Table.FieldByName('STHURT_OPDURUM').AsInteger;
  TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpIslemSiraNo:= Self.Table.FieldByName('STHURT_SIRANO').AsInteger;

  DisableAllButtons;
  SetParameters;

  if ParamsSelf.OpDurum = odNone then
  begin
    FToolButton := FormTerminalMenu.ToolButtonReceteTuketimBaslat;
    if FToolButton <> nil then
    begin
      TToolButton(FToolButton).Enabled := true;
      if HammaddeMekanikSarfYontem = msyManual then
      begin
        TToolButton(FToolButton).Caption := 'Bitir';
        TToolButton(FToolButton).OnClick := btYuklemeyiTamamla;
      end
      else
      begin
        TToolButton(FToolButton).Caption := 'Baþlat';
        TToolButton(FToolButton).OnClick := btMSY_StartOrFinish;
      end;
    end;

    FToolButton := FormTerminalMenu.ToolButtonReceteTuketimDurus;
    if FToolButton <> nil then TToolButton(FToolButton).Enabled := true;

    FToolButton := FormTerminalMenu.ToolButtonReceteTuketimHata;
    if FToolButton <> nil then TToolButton(FToolButton).Enabled := true;

    FToolButton := FormTerminalMenu.ToolButtonReceteTuketimLotDegistir;
    if FToolButton <> nil then TToolButton(FToolButton).Enabled := true;

    FToolButton := FormTerminalMenu.ToolButtonReceteTuketimKalemKapat;
    if FToolButton <> nil then TToolButton(FToolButton).Enabled := true;
  end;

  if ParamsSelf.OpDurum = odStarted then
  begin
    FToolButton := FormTerminalMenu.ToolButtonReceteTuketimBitir;
    if FToolButton <> nil then
      TToolButton(FToolButton).Enabled := true;

    FToolButton := FormTerminalMenu.ToolButtonReceteTuketimDurus;
    if FToolButton <> nil then
      TToolButton(FToolButton).Enabled := true;

    FToolButton := FormTerminalMenu.ToolButtonReceteTuketimHata;
    if FToolButton <> nil then
      TToolButton(FToolButton).Enabled := true;

    FToolButton := FormTerminalMenu.ToolButtonReceteTuketimLotDegistir;
    if FToolButton <> nil then
    begin
      if HammaddeMekanikSarfYontem = msyForward then
        TToolButton(FToolButton).Enabled := false
      else if HammaddeMekanikSarfYontem = msyBackward then
        TToolButton(FToolButton).Enabled := true
    end;

    FToolButton := FormTerminalMenu.ToolButtonReceteTuketimKalemSifirla;
    if FToolButton <> nil then
      TToolButton(FToolButton).Enabled := true;
  end;

  if ParamsSelf.OpDurum = odFinished then
  begin
    FToolButton := FormTerminalMenu.ToolButtonReceteTuketimKalemSifirla;
    if FToolButton <> nil then
      TToolButton(FToolButton).Enabled := true;
  end;

  if ParamsSelf.OpDurum In [odPaused] then
  begin
    FToolButton := FormTerminalMenu.ToolButtonReceteTuketimDurus;
    if FToolButton <> nil then
    begin
      TToolButton(FToolButton).Enabled := true;
      TToolButton(FToolButton).Caption := 'Duruþ Sonlandýr';
    end;
  end;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  GridColumn_OpDurum := GridView.GetColumnByFieldName('STHURT_OPDURUM');

  if (AViewInfo.GridRecord.Values[GridColumn_OpDurum.Index] = odStarted) then
  begin
    ACanvas.Brush.Color := RGB(255, 172, 132);
    ACanvas.Font.Color := clBlack;
  end;

  if (AViewInfo.GridRecord.Values[GridColumn_OpDurum.Index] = odPaused) then
    begin
      ACanvas.Brush.Color := clRed;
      ACanvas.Font.Color := clBlack;
    end;

  if (AViewInfo.GridRecord.Values[GridColumn_OpDurum.Index] = odFinished) then
 begin
    ACanvas.Brush.Color := RGB(223, 254, 222);
    ACanvas.Font.Color := clBlack;
  end;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.CreateGridButtons;
begin
  Self.Table.TableItems[0].Where.Clear;
  Self.Table.TableItems[0].Where.AddText('0 = 1');
  Self.Run;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.CreateTitle;
begin
  FormTerminalMenu.PanelReceteTuketim.Parent := Self.Form;
  FormTerminalMenu.ToolBar1.Parent := Self.Form;

  FormTerminalMenu.ToolButtonReceteTuketimTitleRefresh.OnClick := OnClickTitleRefresh;
  FormTerminalMenu.ToolButtonReceteTuketimTitleBack.OnClick := OnClickTitleBack;
  FormTerminalMenu.ToolButtonReceteTuketimTitleExit.Onclick := OnClickTitleExit;
  FormTerminalMenu.ToolButtonReceteTuketimTitlePlansizTuketim.OnClick := OnClickPlansizTuketim;
//  FormTerminalMenu.ToolButtonReceteTuketimTitleMalzemeBilgileri.OnClick := OnClickMalzemeBilgileri;
  FormTerminalMenu.ToolButtonReceteTuketimTitleTuketimListesi.OnClick := OnClickTuketimListesi;
  FormTerminalMenu.ToolButtonReceteTuketimBarcodeMalKod.OnClick := OnClickBarcodeMalKod;

  FormTerminalMenu.ToolButtonReceteTuketimBaslat.OnClick := btMSY_StartOrFinish;
  FormTerminalMenu.ToolButtonReceteTuketimBitir.OnClick := btMSY_StartOrFinish;
  FormTerminalMenu.ToolButtonReceteTuketimLotDegistir.OnClick := OnClickLotDegistir;
  FormTerminalMenu.ToolButtonReceteTuketimKalemKapat.OnClick := OnClickKalemKapat;
  FormTerminalMenu.ToolButtonReceteTuketimKalemSifirla.OnClick := OnClickKalemSifirla;
  FormTerminalMenu.ToolButtonReceteTuketimDurus.OnClick := OnClickDurus;
  FormTerminalMenu.ToolButtonReceteTuketimHata.OnClick := OnClickHata;
  FormTerminalMenu.ToolButtonReceteTuketimDateSettings.OnClick := OnClickDateSettings;

  FormTerminalMenu.ToolButtonReceteTuketimTitleTuketimleriTamamla.OnClick := OnClickTuketimleriTamamla;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.CreateObjects;
begin
  FParamsSelf := TParamsSelf.Create;
  FormTerminalMenu := TAppDocFormUretimTerminalMenu.Create(Self.Form);

  FormSelf := TForm.Create(Self.Form);
  FormSelf.BorderStyle := bsNone;
  FormSelf.Height := 141; FormSelf.Width := 626;
  FormSelf.Position := poScreenCenter;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  CreateGridButtons;
  Self.ToolBar.Visible := false;
end;

destructor TAppDocChildUretimTerminalReceteTuketim.Destroy;
begin
  inherited;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.Initialize(IniFile: TAppIniFile);
begin
 Self.ReadOnly := false;
 inherited;
 Self.ReadOnly := false;
end;

procedure TAppDocChildUretimTerminalReceteTuketim.OnClickTitleBack(Sender: TObject);
begin
//  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslemInfo.DockPanel.Name);
//  TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.DoRun;
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalReceteTuketim.OnClickTitleExit(Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalReceteTuketim.OnClickTitleRefresh(
  Sender: TObject);
begin
  Self.Run;
end;





end.
