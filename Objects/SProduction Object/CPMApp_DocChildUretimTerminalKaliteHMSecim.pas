unit CPMApp_DocChildUretimTerminalKaliteHMSecim;

interface

uses
  CPMApp_DocCostumUretimTerminalSendKey,
  Windows, DB, Variants, SysUtils, ExtCtrls, Classes, Forms,
  dxDockControl, cxGraphics, cxGridDBTableView, cxGridCustomTableView,
  CPMApp_DB,
  CPMApp_DocApp,
  CPMApp_Storage,
  CPMApp_BOMConsts,
  CPMApp_DataObject,
  CPMApp_DataObjectDB,
  CPMApp_DataObjectModel,
  CPMApp_DocObjectModel,
  CPMApp_DocChildGrid,
  CPMApp_DocChildSearchTable,
  CPMApp_DocChildUretimTerminalProperties,
  CPMApp_DAPCustomUretimKart,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_TableStokSystem;

type
  TAppDocChildUretimTerminalKaliteHMSecimStepOne = class;
  TAppDocChildUretimTerminalKaliteHMSecimStepTwo = class;
  TAppDocChildUretimTerminalKaliteHMSecimHareket = class;

  TAppDocChildUretimTerminalKaliteHMSecimStepOne = class(TAppDocChildSearchTable)
  private
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
    FFormTerminalTemp: TForm;
    procedure OnClickTitleRefresh(Sender: TObject);
    procedure OnClickTitleExit(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
    procedure AddDocument;
    procedure OnClickAddDocument(Sender: TObject);
    procedure CreateGridButtons;
    procedure PrepareDefination;
  protected
    procedure CreateTitle;
    procedure CreateObjects;
    procedure AfterCreate; override;
  public
    procedure DoStart;
    procedure DoFindOnClick(Sender: TObject);
    procedure DoFindNewOnClick(Sender: TObject);
    procedure DoFindShowAllOnClick(Sender: TObject);
    procedure DoFind(ASearchText: String);
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
  end;

  TAppDocChildUretimTerminalKaliteHMSecimStepTwo = class(TAppDocChildSearchTable)
  private
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
    procedure OnGridButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure OnClickTitleRefresh(Sender: TObject);
    procedure OnClickTitleExit(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
    procedure AddDocument;
    procedure CreateGridButtons;
    procedure PrepareDefination;
  protected
    procedure CreateTitle;
    procedure CreateObjects;
    procedure AfterCreate; override;
  public
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
  end;

  TAppDocChildUretimTerminalKaliteHMSecimHareket = class(TAppDocChildGrid)
  private
    fDataApp: TAppDAPCustomUretimKart;
    fDocApp: TAppDocApp;
    fTableCustom: TAppDBTable;
    AFormTerminalMenu: TAppDocFormUretimTerminalMenu;
  private
    procedure CreateTable;
  private
    procedure OnClickTitleNext(Sender: TObject);
    procedure CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  protected
    procedure CreateTitlePanel;
    procedure AfterCreate; override;
  public
    procedure AddStokHareket(fIslemNo: Smallint);
  public
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DataApp: TAppDAPCustomUretimKart read fDataApp write fDataApp;
    property DocApp: TAppDocApp read fDocApp write fDocApp;
    property TableCustom: TAppDBTable read fTableCustom write fTableCustom;
  end;

  Const
    itHammaddeTuketim: Smallint = 1;
    itKalite: Smallint = 2;
implementation

uses
  ActnList,
  Graphics,
  DateUtils,
  cxTextEdit, cxButtons, cxMaskEdit,
  CPMApp_Dialogs,
  CPMApp_Date,
  CPMApp_DBLibrary,
  CPMApp_TableItems,
  CPMApp_DOPUretimTerminalVeriGiris,
  CPMApp_DocFormUretimTerminalNumPad, Controls;

{ TAppDocChildUretimTerminalKaliteHMSecimStepOne }

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.AddDocument;
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalKaliteHMSecimStepTwo do
  begin
    with Table.TableItems[0].Where do
    begin
      Clear;
      Add('KULLANILABILIR', wcGreater, 0);
      AddOperator(woAnd);
      Add('MALKOD', wcEqual, Self.Table.FieldValues['MALKOD']);
    end;
    Run;
  end;

  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    ShowThisDockPanel(ChildUretimTerminalKaliteHMSecimStepTwo.DockPanel.Name);
    ShowThisDockPanel(ChildUretimTerminalKaliteHMSecimHareket.DockPanel.Name, True);
  end;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.OnClickAddDocument(
  Sender: TObject);
begin
  AddDocument;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.OnClickTitleBack(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    ShowThisDockPanel(ChildUretimTerminalKaliteYenidenIslemList.DockPanel.Name);
    ShowThisDockPanel(ChildUretimTerminalKaliteYenidenIslemSecim.DockPanel.Name, True);
  end;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.OnClickTitleExit(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    ShowThisDockPanel(ChildTerminalLogin.DockPanel.Name);
  end;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.OnClickTitleRefresh(
  Sender: TObject);
begin
  DataApp.DataObject.Cancel;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.PrepareDefination;
var
  ATableName: String;
begin
  ATableName := 'VW_STOKDURUM';
  Table.TableItems.TableNames := VarArrayOf([ATableName, 'STKKRT']);
  Table.TableItems.TableAlias := VarArrayOf(['STKDRM', 'STKKRT']);
  Table.TableItems.TableReferans := VarArrayOf(['STKDRM', 'STKKRT']);
  with Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALKOD');
      AddExpression('SUM(STKDRM.STOKMIKTAR)', 'STOKMIKTAR');
      AddExpression('SUM(STKDRM.KULLANILABILIR)', 'KULLANILABILIR');
    end;
    with Where do
    begin
      Clear;
      AddText('STOKMIKTAR > 0');
      AddAndText('0 = 1');
    end;
    with GroupBy do
    begin
      Clear;
      Add('MALKOD');
    end;
  end;

  with Table.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALAD');
      Add('BIRIM');
      Add('SARFYONTEM');
    end;
    with Where do
    begin
      Clear;
      Add('SARFYONTEM', wcEqual, syManual);
    end;
    with GroupBy do
    begin
      Clear;
      Add('MALAD');
      Add('BIRIM');
      Add('SARFYONTEM');
    end;
    with Join do
    begin
      Clear;
      Add('MALKOD', 'MALKOD');
    end;
  end;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.AfterCreate;
begin
  inherited;
  Self.AppName := 'DocChildUretimTerminalKaliteHMSecimStepOne';
  Self.Caption := 'Terminal Manual Tuketim Step One';
  PrepareDefination;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.CreateTitle;
//var
//  AFormTerminalMenu: TAppDocFormUretimTerminalMenu;
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.CreateTitlePanel(TAppDocFormUretimTerminalMenu(Self.Form), 'Hm. Stoktan Yükleme. Adým 1: Malzeme Seçimi', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
//  AFormTerminalMenu := TAppDocFormUretimTerminalMenu.Create(Self.Form);
//  AFormTerminalMenu.btManualBaglanti_Ara.OnClick := DoFindOnClick;
//  AFormTerminalMenu.btManualBaglanti_YeniArama.OnClick := DoFindNewOnClick;
//  AFormTerminalMenu.btManualBaglanti_HepsiniGoster.OnClick := DoFindShowAllOnClick;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.CreateObjects;
begin
  FFormTerminalTemp := TForm.Create(Self.Form);
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  CreateGridButtons;
//  Self.ToolBar.Visible := false;
  Self.GridView.OptionsData.Editing := true;
  Self.GridView.OnDblClick := OnClickAddDocument;
end;

destructor TAppDocChildUretimTerminalKaliteHMSecimStepOne.Destroy;
begin

  inherited;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.DoFind(ASearchText: String);
var
  AWhereStr: String;
begin
  AWhereStr := ' And (STKDRM.MALKOD Like ''%' + ASearchText + '%''';
  AWhereStr := AWhereStr + ' Or STKKRT.MALAD Like ''%' + ASearchText + '%''';
  AWhereStr := AWhereStr + ' Or STKKRT.BIRIM Like ''%' + ASearchText + '%'')';
  Self.Table.Close;
  with Self.Table.TableItems[0].Where do
  begin
    DeleteWhere('wcFilter');
    AddText(AWhereStr, 'wcFilter');
  end;
  Self.Table.Open;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.DoFindNewOnClick(
  Sender: TObject);
var
  fComponent: TComponent;
begin
  fComponent := TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalKaliteHMSecimStepOne.Form.FindComponent('AppDocFormUretimTerminalMenu_10').FindComponent('edtManualBaglanti_Search');
  TcxTextEdit(fComponent).Clear;
  TcxTextEdit(fComponent).SetFocus;
  DoFind('');
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.DoFindOnClick(Sender: TObject);
var
  fComponent: TComponent;
begin
  fComponent := TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalKaliteHMSecimStepOne.Form.FindComponent('AppDocFormUretimTerminalMenu_10').FindComponent('edtManualBaglanti_Search');
  DoFind(TcxTextEdit(fComponent).Text);
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.DoFindShowAllOnClick(
  Sender: TObject);
var
  fComponent: TComponent;
begin
  fComponent := TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalKaliteHMSecimStepOne.Form.FindComponent('AppDocFormUretimTerminalMenu_10').FindComponent('edtManualBaglanti_Search');
  TcxTextEdit(fComponent).Clear;
  DoFind('');
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.DoStart;
begin
  Table.Close;
  with Table.TableItems[0].Where do
  begin
    Clear;
    Add('KULLANILABILIR', wcGreater, 0);
  end;
  Run;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.CreateGridButtons;
  procedure CreateButtons;
  begin
//    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppChild.CreateGridButton(Self.GridView, OnGridButtonClick);
  end;
begin
//  Self.Table.TableItems[0].Where.Clear;
//  Self.Table.TableItems[0].Where.AddText('0 = 1');
  Self.Run;
  CreateButtons;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepOne.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;

{ TAppDocChildUretimTerminalKaliteHMSecimStepTwo }

procedure TAppDocChildUretimTerminalKaliteHMSecimStepTwo.AddDocument;
var
  NewMiktar: Double;
  procedure AddRecord;
  begin
    DataApp.UretimSiparisHareket.Table.Insert;
    DataApp.UretimSiparisHareket.Table.SirketNo := DataApp.CompanyNo;
    DataApp.UretimSiparisHareket.Table.EvrakTip := 54;
    DataApp.UretimSiparisHareket.Table.EvrakMiktar := NewMiktar;
    DataApp.UretimSiparisHareket.Table.SiparisNo := DataApp.UretimKart.Table.EvrakNo;
    DataApp.UretimSiparisHareket.Table.HesapKod := DataApp.UretimKart.Table.HesapKod;
    DataApp.UretimSiparisHareket.Table.EvrakNo := DataApp.UretimKart.Table.UretimNo;
    DataApp.UretimSiparisHareket.Table.MalKod := Self.Table.FieldValues['MALKOD'];
    DataApp.UretimSiparisHareket.Table.SeriNo := Self.Table.FieldValues['SERINO'];
    DataApp.UretimSiparisHareket.Table.SeriNo2 := Self.Table.FieldValues['SERINO2'];
    DataApp.UretimSiparisHareket.Table.VersiyonNo := Self.Table.FieldValues['VERSIYONNO'];
    DataApp.UretimSiparisHareket.Table.EvrakBirim := Self.Table.FieldValues['STKKRT_BIRIM'];
    DataApp.UretimSiparisHareket.Table.DepoKod := Self.Table.FieldValues['DEPOKOD'];
  end;
begin
  NewMiktar := TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormNumericPad('Tüketilen Miktarý Girin:');
  if NewMiktar = 0 then
    exit;

  if NewMiktar > Self.Table.FieldValues['KULLANILABILIR'] then
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Depo miktarýndan fazla yükleme yapamazsýnýz.');
    Exit;
  end;

  with TAppDOPUretimTerminalVeriGiris(DocApp) do begin
    ChildUretimTerminalKaliteHMSecimHareket.TableCustom.Insert;
    ChildUretimTerminalKaliteHMSecimHareket.TableCustom.FieldValues['_DEFAULT'] := 1;
    ChildUretimTerminalKaliteHMSecimHareket.TableCustom.FieldValues['MALKOD'] := Self.Table.FieldValues['MALKOD'];
    ChildUretimTerminalKaliteHMSecimHareket.TableCustom.FieldValues['STKKRT_MALAD'] := Self.Table.FieldValues['STKKRT_MALAD'];
    ChildUretimTerminalKaliteHMSecimHareket.TableCustom.FieldValues['EVRAKBIRIM'] := Self.Table.FieldValues['STKKRT_BIRIM'];
    ChildUretimTerminalKaliteHMSecimHareket.TableCustom.FieldValues['MIKTAR'] := NewMiktar;//Self.Table.FieldValues['KULLANILABILIR'];
    ChildUretimTerminalKaliteHMSecimHareket.TableCustom.FieldValues['VERSIYONNO'] := Self.Table.FieldValues['VERSIYONNO'];
    ChildUretimTerminalKaliteHMSecimHareket.TableCustom.FieldValues['SERINO'] := Self.Table.FieldValues['SERINO'];
    ChildUretimTerminalKaliteHMSecimHareket.TableCustom.FieldValues['SERINO2'] := Self.Table.FieldValues['SERINO2'];
    ChildUretimTerminalKaliteHMSecimHareket.TableCustom.FieldValues['DEPOKOD'] := Self.Table.FieldValues['DEPOKOD'];
    ChildUretimTerminalKaliteHMSecimHareket.TableCustom.Post;
  end;

  AddRecord;
//  DataApp.DataControllerUretimKart.AddManualBaglanti(TAppOpUpdateStatus(2), '', Date, NewMiktar);
//  DataApp.DataControllerUretimKart.AddManualBaglanti(TAppOpUpdateStatus(2), '', DataApp.UretimKart.Table.UretimBasTarih, NewMiktar);
  DataApp.UretimSiparisHareket.Table.Cancel;
  if DataApp.DataObject.Save then
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Ýþlem tamamlandý');
  end;
  Self.Run;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepTwo.OnClickTitleBack(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    ChildUretimTerminalKaliteHMSecimStepOne.Run;
    ShowThisDockPanel(ChildUretimTerminalKaliteHMSecimStepOne.DockPanel.Name);
    ShowThisDockPanel(ChildUretimTerminalKaliteHMSecimHareket.DockPanel.Name, True);
  end;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepTwo.OnClickTitleExit(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepTwo.OnClickTitleRefresh(
  Sender: TObject);
begin
  DataApp.DataObject.Cancel;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepTwo.OnGridButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  AddDocument;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepTwo.PrepareDefination;
var
  ATableName: String;
begin
  ATableName := 'VW_STOKDURUM';
  Table.TableItems.TableNames := VarArrayOf([ATableName, 'STKKRT']);
  Table.TableItems.TableAlias := VarArrayOf(['STKDRM', 'STKKRT']);
  Table.TableItems.TableReferans := VarArrayOf(['STKDRM', 'STKKRT']);
  with Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALKOD');
      Add('VERSIYONNO');
      Add('SERINO');
      Add('SERINO2');
      Add('DEPOKOD');
      Add('STOKMIKTAR');
      Add('KULLANILABILIR');
    end;
    with Where do
    begin
      Clear;
      AddText('0 = 1');
    end;
  end;

  with Table.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALAD');
      Add('BIRIM');
    end;
    with Where do
    begin
      Clear;
      Add('SARFYONTEM', wcEqual, syManual);
    end;
    with Join do
    begin
      Clear;
      Add('MALKOD', 'MALKOD');
    end;
  end;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepTwo.AfterCreate;
begin
  inherited;
  Self.AppName := 'DocChildUretimTerminalKaliteHMSecimStepTwo';
  Self.Caption := 'Terminal Manual Tüketim Step Two';
  PrepareDefination;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepTwo.CreateTitle;
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.CreateTitlePanel(TAppDocFormUretimTerminalMenu(Self.Form), 'Hm. Stoktan Yükleme. Adým 2: Depo/Versiyon Seçimi', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepTwo.CreateObjects;
begin
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepTwo.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  CreateGridButtons;
//  Self.ToolBar.Visible := false;
  Self.GridView.OptionsData.Editing := true;
end;

destructor TAppDocChildUretimTerminalKaliteHMSecimStepTwo.Destroy;
begin

  inherited;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepTwo.CreateGridButtons;
  procedure CreateButtons;
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppChild.CreateGridButton(Self.GridView, OnGridButtonClick);
  end;
begin
//  Self.Table.TableItems[0].Where.Clear;
//  Self.Table.TableItems[0].Where.AddText('0 = 1');
  Self.Run;
  CreateButtons;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimStepTwo.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;

{ TAppDocChildUretimTerminalKaliteHMSecimHareket }

procedure TAppDocChildUretimTerminalKaliteHMSecimHareket.AfterCreate;
begin
  inherited;
  TableCustom := TAppDBTable.Create(nil);
  TableCustom.Name := 'TableUretimTerminalKaliteHammadeTuketim';
  TableCustom.EnableLogChanges := False;
  TableCustom.TableItems.TableReferans := VarArrayof(['STH001']);

  Self.FormName := 'TableUretimTerminalKaliteHammadeTuketimForm';
  Self.GridName := 'grTableUretimTerminalKaliteHammadeTuketim';
  Self.Caption := 'Yeniden Ýþlem Hammade Tüketim';
  Self.PipelineName := 'ppTableUretimTerminalKaliteHammadeTuketim';
  Self.TableObject := TableCustom;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimHareket.CreateTable;
  procedure CreateDataSet;
  begin
    TableCustom.FieldDefs.Clear;
    with TableCustom.FieldDefs do
    begin
      Add('ID', ftAutoInc, 0);
      Add('_DEFAULT', ftInteger, 0);
      Add('MALKOD', ftString, 30);
      Add('STKKRT_MALAD', ftString, 60);
      Add('MIKTAR', ftFloat, 0);
      Add('EVRAKBIRIM', ftString, 30);
      Add('VERSIYONNO', ftString, 30);
      Add('SERINO', ftString, 30);
      Add('SERINO2', ftString, 30);
      Add('DEPOKOD', ftString, 30);
      Add('ACIKLAMA1', ftString, 60);
      Add('ACIKLAMA2', ftString, 60);
      Add('ACIKLAMA3', ftString, 60);
      Add('ACIKLAMA4', ftString, 60);
      Add('ACIKLAMA5', ftString, 60);
    end;
    TableCustom.CreateFields;
    TableCustom.CreateDataSet;
    TableCustom.TableItems.OrderBy.Add('ID', otAsc);
  end;
begin
  CreateDataSet;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimHareket.CreateTitlePanel;
begin
  AFormTerminalMenu := TAppDocFormUretimTerminalMenu.Create(nil);

  AFormTerminalMenu.PanelKaliteKontrol_ReworkBottom.Parent := Self.Form;

  AFormTerminalMenu.ToolButtonKaliteKontrol_SonrakiAdim.Enabled := false;
  AFormTerminalMenu.ToolButtonKaliteKontrol_KaydetVeTamamla.Enabled := true;
  AFormTerminalMenu.ToolButtonKaliteKontrol_KaydetVeTamamla.OnClick := OnClickTitleNext;
//
//
//
//
//
//  AFormTerminalMenu.PanelKaliteKontrol_ManualTuketim.Parent := Self.Form;
//  AFormTerminalMenu.PanelKaliteKontrol_ManualTuketim_btNext.OnClick := OnClickTitleNext;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimHareket.CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
//  CMamulTip := GridView.GetColumnByFieldName('_DEFAULT');
//
//  if (AViewInfo.GridRecord.Values[CMamulTip.Index] = 1) then
//    ACanvas.Brush.Color := RGB(128, 255, 255);
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimHareket.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  Self.GridView.OnCustomDrawCell := CustomDrawCell;
end;

destructor TAppDocChildUretimTerminalKaliteHMSecimHareket.Destroy;
begin
  FreeAndNil(fTableCustom);
  inherited;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimHareket.Initialize(
  IniFile: TAppIniFile);
begin
  CreateTable;
  CreateTitlePanel;
  inherited;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimHareket.OnClickTitleNext(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do begin
    ChildUretimTerminalKaliteYenidenIslemSecim.DoAddIslem;
  end;
end;

procedure TAppDocChildUretimTerminalKaliteHMSecimHareket.AddStokHareket(fIslemNo: Smallint);
var
  fUretimNo: String;
  fSiraNo: Smallint;
  fSiraNo2: Smallint;
  fReceteSiraNo: Smallint;
  ATableStokHareket: TAppCustomTable;
  function GetSTKHARMaxSiraNo: Integer;
  var SQLStr: String;
  begin
    SQLStr := Format('Select MAX(SIRANO) AS SIRANO From STKHAR Where EVRAKNO = ''%s'' And EVRAKTIP = 54 And SIRKETNO = ''%s'' And HESAPKOD = ''%s''', [fUretimNo, DataApp.CompanyNo, 'GENEL']);
    DataApp.TableCommand.OpenCommandText(SQLStr);
    Result := DataApp.TableCommand.FieldValues['SIRANO'];
  end;

  procedure AddTableStokHareketUretim;
  var SQLStr: String;
  begin
    SQLStr := '';
    SQLStr := SQLStr + ' Insert Into STHURT (SIRKETNO, EVRAKTIP, EVRAKNO, HESAPKOD, SIRANO, RECETENO, RECETESIRANO, OPERASYONNO, RECETEKAYNAKTIP, KAYNAKISLEMNO, OPDURUM) ';
    SQLStr := SQLStr + 'Values(''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'')';
    SQLStr := Format(SQLStr, [DataApp.CompanyNo,
                             IntToStr(54),
                             TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalKaliteYenidenIslemList.Table.FieldByName('URETIMNO').AsString,
                             'GENEL',
                             IntToStr(fSiraNo),
                             IntToStr(fSiraNo2),
                             IntToStr(fReceteSiraNo),
                             TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalKaliteYenidenIslemList.Table.FieldByName('OPERASYONNO').AsString,
                             IntToStr(0),
                             IntToStr(fIslemNo),
                             IntToStr(0)]);
    DataApp.TableCommand.Execute(SQLStr);
  end;
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do begin
    if TableCustom.IsEmpty then begin
      DocCustomProperties.AppForms.AppFormMessageDialog('Hammadde seçmeden devam edemezsiniz!');
      exit;
    end;
  end;

  fUretimNo := TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalKaliteYenidenIslemList.Table.FieldValues['URETIMNO'];
  fSiraNo := GetSTKHARMaxSiraNo;
  fSiraNo2 := DataApp.UretimSiparisHareket.Table.SiraNo2;
  fReceteSiraNo := DataApp.UretimSiparisHareket.Table.RecordCount;

  ATableStokHareket := TAppCustomTable.Create(nil);
  ATableStokHareket.Connection := DataApp.Connection;
  ATableStokHareket.TableItems.TableNames := 'STKHAR';
  ATableStokHareket.IndexFieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO;HESAPKOD;KONSOLIDESIRKETNO;SIRANO';

  with ATableStokHareket.TableItems[0] do
  begin
    with Where do
    begin
      Clear;
      Add('SIRKETNO', wcEqual, DataApp.CompanyNo);
      AddOperator(woAnd);
      Add('KAYITTUR', wcEqual, 1);
      AddOperator(woAnd);
      Add('KAYITDURUM', wcEqual, 1);
      AddOperator(woAnd);
      Add('ISLEMTIP', wcEqual, 52);
      AddOperator(woAnd);
      Add('EVRAKTIP', wcEqual, TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalKaliteYenidenIslemList.Table.FieldValues['EVRAKTIP']);
      AddOperator(woAnd);
      Add('EVRAKNO', wcEqual, TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalKaliteYenidenIslemList.Table.FieldValues['URETIMNO']);
    end;
  end;
  ATableStokHareket.Open;

  TableCustom.First;

  while not TableCustom.Eof do begin
    with TAppDOPUretimTerminalVeriGiris(DocApp) do begin
      fSiraNo := fSiraNo + 2;
      fReceteSiraNo := fReceteSiraNo + 1;
      ATableStokHareket.Insert;
      ATableStokHareket.FieldValues['SIRKETNO'] := DataApp.CompanyNo;
      ATableStokHareket.FieldValues['KAYITTUR'] := 1;
      ATableStokHareket.FieldValues['KAYITDURUM'] := 1;
      ATableStokHareket.FieldValues['EVRAKDURUM'] := 1;
      ATableStokHareket.FieldValues['ISLEMTIP'] := 52;
      ATableStokHareket.FieldValues['HESAPKOD'] := 'GENEL';
      ATableStokHareket.FieldValues['SEVKHESAPKOD'] := 'GENEL';
      ATableStokHareket.FieldValues['MALTIP'] := 7;
      ATableStokHareket.FieldValues['SIRANO'] := fSiraNo;
      ATableStokHareket.FieldValues['SIRANO2'] := fSiraNo2;
      ATableStokHareket.FieldValues['KDVORAN'] := 18;
      ATableStokHareket.FieldValues['MALKOD'] := TableCustom.FieldValues['MALKOD'];
      ATableStokHareket.FieldValues['SERINO'] := TableCustom.FieldValues['SERINO'];
      ATableStokHareket.FieldValues['SERINO2'] := TableCustom.FieldValues['SERINO2'];
      ATableStokHareket.FieldValues['VERSIYONNO'] := TableCustom.FieldValues['VERSIYONNO'];
      ATableStokHareket.FieldValues['MIKTAR'] := 0;//TableCustom.FieldValues['MIKTAR'];
      ATableStokHareket.FieldValues['DEPOKOD'] := TableCustom.FieldValues['DEPOKOD'];
      ATableStokHareket.FieldValues['EVRAKBIRIM'] := TableCustom.FieldValues['EVRAKBIRIM'];
      ATableStokHareket.FieldValues['SIPARISNO'] := ChildUretimTerminalKaliteYenidenIslemList.Table.FieldValues['EVRAKNO'];
      ATableStokHareket.FieldValues['EVRAKNO'] := ChildUretimTerminalKaliteYenidenIslemList.Table.FieldValues['URETIMNO'];
      ATableStokHareket.FieldValues['EVRAKTIP'] := ChildUretimTerminalKaliteYenidenIslemList.Table.FieldValues['EVRAKTIP'];
      ATableStokHareket.FieldValues['EVRAKTARIH'] := DataApp.UretimKart.Table.UretimBasTarih;
      ATableStokHareket.FieldValues['IRSALIYETARIH'] := DataApp.UretimKart.Table.UretimBasTarih;
      ATableStokHareket.FieldValues['TICARETDOSYATIP'] := 11;
      ATableStokHareket.FieldValues['GIRISCIKIS'] := gcCikis;
      ATableStokHareket.ApplyUpdates(0);
      AddTableStokHareketUretim;
    end;
    TableCustom.Next;
  end;
  ATableStokHareket.Close;
end;
end.
