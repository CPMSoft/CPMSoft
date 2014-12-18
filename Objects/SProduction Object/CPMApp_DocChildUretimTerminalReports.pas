unit CPMApp_DocChildUretimTerminalReports;

interface

uses
  CPMApp_DocCostumUretimTerminalSendKey, Controls,
  Windows, DB, Variants, SysUtils, ExtCtrls, Classes, Forms,
  dxDockControl, cxGraphics, cxGridDBTableView, cxGridCustomTableView,
  CPMApp_DB,
  CPMApp_DocApp,
  CPMApp_Storage,
  CPMApp_BOMConsts,
  CPMApp_DataObject,
  CPMApp_DataObjectModel,
  CPMApp_DocObjectModel,
  CPMApp_DocChildGrid,
  CPMApp_DocChildSearchTable,
  CPMApp_DocChildUretimTerminalProperties,
  CPMApp_TableUretimSystem,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_DocFormUretimTerminalSettings,
  CPMApp_DAPCustomUretimKart;

type
  TAppDocChildUretimTerminalReportDurusList = class;
  TAppDocChildUretimTerminalReceteTuketimList = class;
  TAppDocSearchChildMamulTalimat = class;
//  TAppDocChildUretimTerminalReportHataList = class;

  TAppDocChildUretimTerminalReportDurusList = class(TAppDocChildSearchTable)
  private
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
    FormTerminalMenu: TAppDocFormUretimTerminalMenu;
    procedure PrepareDefination;
  private
    procedure OnClickAddManualDurus(Sender: TObject);
    procedure OnClickTitleExit(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
    procedure OnClickTitleRefresh(Sender: TObject);
  protected
    procedure CreateTitle;
    procedure CreateObjects;
    procedure AfterCreate; override;
  public
    procedure DoRun;
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
  end;


  TAppDocChildUretimTerminalReceteTuketimList = class(TAppDocChildSearchTable)
  private
    FSourceDockPanelName: String;
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
  private
    procedure OnClickTitleRefresh(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
    procedure OnClickTitleExit(Sender: TObject);
    procedure OnClickMalzemeBilgileri(Sender: TObject);
  private
    procedure PrepareDefination;
    procedure AfterScroll;
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
    property SourceDockPanelName: String read FSourceDockPanelName write FSourceDockPanelName;
  end;


  TAppDocSearchChildMamulTalimat = class(TAppDocChildSearchTable)
  private
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
    FormTerminalMenu: TAppDocFormUretimTerminalMenu;
    procedure PrepareDefination;
  protected
    procedure CreateTitle;
    procedure AfterCreate; override;
  public
    procedure DoRun;
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
  end;
  implementation

uses
  ActnList,
  Graphics,
  DateUtils,
  cxTextEdit, cxButtons, cxMaskEdit,
  CPMApp_Dialogs,
  CPMApp_Date,
  CPMApp_TableItems,
  CPMApp_DOPUretimTerminalVeriGiris,
  CPMApp_DocFormUretimTerminalNumPad ,
  CPMApp_DocChildUretimTerminalMalzemeBilgileri;

{ TAppDocChildUretimTerminalReportDurusList }

procedure TAppDocChildUretimTerminalReportDurusList.PrepareDefination;
begin
  Table.TableItems.TableNames := VarArrayOf(['URTRKD', 'URTKIT']);
  with Table.TableItems[0] do
  begin
    with Fields do begin
      Clear;
      Add('*');
    end;
  end;
  with Table.TableItems[1] do
  begin
    with Fields do begin
      Clear;
      Add('ACIKLAMA');
    end;
    with Join do begin
      Clear;
      Add('ISLEMNO', 'ISLEMNO');
      Add('KAYNAKKOD', 'KAYNAKKOD');
    end;
  end;
end;

procedure TAppDocChildUretimTerminalReportDurusList.AfterCreate;
begin
  inherited;
  Self.Name := 'DocChildTerminalReportDurusList';
  Self.AppName := 'App' + Self.Name;
  Self.Caption := 'Duruþ Listesi';
  PrepareDefination;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalReportDurusList.CreateTitle;
begin
  FormTerminalMenu.Panel_Durus.Parent := Self.Form;
  FormTerminalMenu.ToolButtonDurus_DurusBelirt.OnClick := OnClickAddManualDurus;
  FormTerminalMenu.ToolButtonDurus_Refresh.OnClick := OnClickTitleRefresh;
  FormTerminalMenu.ToolButtonDurus_Back.OnClick := OnClickTitleBack;
  FormTerminalMenu.ToolButtonDurus_Exit.OnClick := OnClickTitleExit;
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.CreateTitlePanel(TAppDocFormUretimTerminalMenu(Self.Form), 'Duruþ Listesi', nil, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

procedure TAppDocChildUretimTerminalReportDurusList.CreateObjects;
begin
  FormTerminalMenu := TAppDocFormUretimTerminalMenu.Create(Self.Form);
end;

procedure TAppDocChildUretimTerminalReportDurusList.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  Self.ToolBar.Visible := false;
end;

destructor TAppDocChildUretimTerminalReportDurusList.Destroy;
begin

  inherited;
end;

procedure TAppDocChildUretimTerminalReportDurusList.DoRun;
begin

//SIRKETNO (ASC), EVRAKTIP (ASC), EVRAKNO (ASC), OPERASYONNO (ASC), KAYNAKKOD (ASC), OPERASYONSIRANO (ASC), SIRANO (ASC)

  with Self.Table.TableItems[0].Where do begin
    Clear;
    Add('SIRKETNO', wcEqual, DataApp.CompanyNo);
    AddOperator(woAnd);
    Add('EVRAKTIP', wcEqual, DataApp.UretimRotaKaynak.Table.EvrakTip);
    AddOperator(woAnd);
    Add('EVRAKNO', wcEqual, DataApp.UretimRotaKaynak.Table.EvrakNo);
    AddOperator(woAnd);
    Add('OPERASYONNO', wcEqual, DataApp.UretimRotaKaynak.Table.OperasyonNo);
    AddOperator(woAnd);
    Add('KAYNAKKOD', wcEqual, DataApp.UretimRotaKaynak.Table.KaynakKod);
    AddOperator(woAnd);
    Add('URETIMNO', wcEqual, DataApp.UretimRotaKaynak.Table.UretimNo);
  end;
  Self.Run;
end;

procedure TAppDocChildUretimTerminalReportDurusList.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;


procedure TAppDocChildUretimTerminalReportDurusList.OnClickAddManualDurus(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalDurusIslemSecim.DoRun;
//  TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalDurusIslemSecim.DoRun;
//  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalDurusIslemSecim.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalReportDurusList.OnClickTitleBack(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalReportDurusList.OnClickTitleExit(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalReportDurusList.OnClickTitleRefresh(
  Sender: TObject);
begin

end;

{ TAppDocChildUretimTerminalReceteTuketimList }

procedure TAppDocChildUretimTerminalReceteTuketimList.AfterCreate;
begin
  inherited;
  Self.AppName := 'ChildUretimTerminalReceteTuketimList';
  Self.Caption := 'Terminal Reçete Tüketim List';
  PrepareDefination;
end;

procedure TAppDocChildUretimTerminalReceteTuketimList.AfterScroll;
var
  vEvrakNo: String;
  vMalKod: String;
  vSeriNo: String;
  vVersiyonNo: String;
  vSiraNo: Integer;
begin
  if Self.Table.IsEmpty then
    Exit;

  vEvrakNo := Self.Table.FieldValues['EVRAKNO'];
  vMalKod := Self.Table.FieldValues['MALKOD'];
  vSeriNo := Self.Table.FieldValues['SERINO'];
  vVersiyonNo := Self.Table.FieldValues['VERSIYONNO'];
  vSiraNo := Self.Table.FieldValues['SONKAYNAKSIRANO'];

  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    ChildUretimTerminalMalzemeBilgileri.TableMalzemeTuketimBilgileri.TableItems[0].Where.Clear;
    ChildUretimTerminalMalzemeBilgileri.TableMalzemeTuketimBilgileri.TableItems[0].Where.Add('EVRAKNO', wcEqual, vEvrakNo);
    ChildUretimTerminalMalzemeBilgileri.TableMalzemeTuketimBilgileri.TableItems[0].Where.AddOperator(woAnd);
    ChildUretimTerminalMalzemeBilgileri.TableMalzemeTuketimBilgileri.TableItems[0].Where.Add('MALKOD', wcEqual, vMalKod);
    ChildUretimTerminalMalzemeBilgileri.TableMalzemeTuketimBilgileri.TableItems[0].Where.AddOperator(woAnd);
    ChildUretimTerminalMalzemeBilgileri.TableMalzemeTuketimBilgileri.TableItems[0].Where.Add('SERINO', wcEqual, vSeriNo);
    ChildUretimTerminalMalzemeBilgileri.TableMalzemeTuketimBilgileri.TableItems[0].Where.AddOperator(woAnd);
    ChildUretimTerminalMalzemeBilgileri.TableMalzemeTuketimBilgileri.TableItems[0].Where.Add('VERSIYONNO', wcEqual, vVersiyonNo);
    ChildUretimTerminalMalzemeBilgileri.TableMalzemeTuketimBilgileri.TableItems[0].Where.AddOperator(woAnd);
    ChildUretimTerminalMalzemeBilgileri.TableMalzemeTuketimBilgileri.TableItems[0].Where.Add('SIRANO', wcEqual, vSiraNo);
    ChildUretimTerminalMalzemeBilgileri.TableMalzemeTuketimBilgileri.Open;
  end;
end;

procedure TAppDocChildUretimTerminalReceteTuketimList.CreateObjects;
begin

end;

procedure TAppDocChildUretimTerminalReceteTuketimList.CreateTitle;
var
  AFormTerminalMenu: TAppDocFormUretimTerminalMenu;
begin
  AFormTerminalMenu := TAppDocFormUretimTerminalMenu.Create(nil);
  AFormTerminalMenu.PanelTuketimListesi_Top.Parent := Self.Form;
  AFormTerminalMenu.PanelTuketimListesi_btnTitleMalzemeBilgileri.OnClick := OnClickMalzemeBilgileri;

  AFormTerminalMenu.PanelTuketimListesi_btnTitleRefresh.OnClick := OnClickTitleRefresh;
//  AFormTerminalMenu.PanelTuketimListesi_btnTitleRefresh.Visible := false;
  AFormTerminalMenu.PanelTuketimListesi_btnTitleBack.OnClick := OnClickTitleBack;
//  AFormTerminalMenu.PanelTuketimListesi_btnTitleBack.Visible := false;
  AFormTerminalMenu.PanelTuketimListesi_btnTitleExit.OnClick := OnClickTitleExit;
//  AFormTerminalMenu.PanelTuketimListesi_btnTitleExit.Visible := false;
//  TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.CreateTitlePanel(TForm(Self.Form), 'Tüketim Listesi', nil, nil, nil, nil, nil);
end;

procedure TAppDocChildUretimTerminalReceteTuketimList.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  Self.ToolBar.Visible := false;
  Self.ReadOnly := true;
end;

destructor TAppDocChildUretimTerminalReceteTuketimList.Destroy;
begin

  inherited;
end;

procedure TAppDocChildUretimTerminalReceteTuketimList.Initialize(
  IniFile: TAppIniFile);
begin
  inherited;
end;

procedure TAppDocChildUretimTerminalReceteTuketimList.OnClickTitleBack(
  Sender: TObject);
begin
  if SourceDockPanelName = TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalReceteTuketim.DockPanel.Name then
    TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalReceteTuketim.DockPanel.Name);
  if SourceDockPanelName = TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.DockPanel.Name then
    TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.DockPanel.Name);

//  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalReceteTuketimList.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalReceteTuketimList.OnClickTitleExit(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalReceteTuketimList.OnClickTitleRefresh(
  Sender: TObject);
begin
  Self.Run;
end;

procedure TAppDocChildUretimTerminalReceteTuketimList.OnClickMalzemeBilgileri(
  Sender: TObject);
begin
  AfterScroll;
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    ShowThisDockPanel(ChildUretimTerminalMalzemeBilgileri.DockPanel.Name);
    TAppDocFormUretimTerminalMenu(ChildUretimTerminalMalzemeBilgileri.FormMalzemeTuketim).lbMalKod.Caption := Self.Table.FieldValues['MALKOD'];
    TAppDocFormUretimTerminalMenu(ChildUretimTerminalMalzemeBilgileri.FormMalzemeTuketim).lbMalAd.Caption := Self.Table.FieldValues['STKKRT_MALAD'];
    TAppDocFormUretimTerminalMenu(ChildUretimTerminalMalzemeBilgileri.FormMalzemeTuketim).lbSeriNo.Caption := Self.Table.FieldValues['SERINO'];
    TAppDocFormUretimTerminalMenu(ChildUretimTerminalMalzemeBilgileri.FormMalzemeTuketim).lbMiktar.Caption := Self.Table.FieldByName('MIKTAR').AsString;
  end;

//    ChildUretimTerminalMalzemeBilgileri.ShowChild(true);
end;

procedure TAppDocChildUretimTerminalReceteTuketimList.PrepareDefination;
begin
  Self.Table.TableItems.TableNames := VarArrayOf(['STKHAR', 'STHURT', 'STKKRT']);
  Self.Table.TableItems.TableReferans := VarArrayOf(['STKHAR', 'STHURT', 'STKKRT']);
  Self.Table.TableItems.TableCaptions := VarArrayOf(['Stok Hareket', 'STHURT', 'STKKRT']);
  Self.Table.IndexFieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO;HESAPKOD;KONSOLIDESIRKETNO;SIRANO';

  with Self.Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
      AddExpression('STKHAR.MIKTAR - STKHAR.KULLANILANMIKTAR', '_KALANMIKTAR');
    end;
    with Where do
    begin
      AddText('0 = 1');
    end;
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
    end;
    with Join do
    begin
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
    end;
    with Join do
    begin
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('MALKOD', 'MALKOD');
    end;
  end;
end;
{ TAppDocSearchChildMamulTalimat }

procedure TAppDocSearchChildMamulTalimat.AfterCreate;
begin
  inherited;
  Self.AppName := 'ChildMamulTalimat';
  Self.Caption := 'Mamul Kart Talimat';
  PrepareDefination;

end;

procedure TAppDocSearchChildMamulTalimat.CreateTitle;
begin
  FormTerminalMenu := TAppDocFormUretimTerminalMenu.Create(nil);
  FormTerminalMenu.PanelGlobal_TopMenu.Parent := Self.Form;
  FormTerminalMenu.PanelGlobal_TopMenu_Description.Caption := 'Mamul Talimatlarý';
  FormTerminalMenu.btTitleVirtualKeyboard.Visible := false;
  FormTerminalMenu.btTitleBack.Visible := false;
  FormTerminalMenu.btTitleExit.Visible := false;
  FormTerminalMenu.btTitleRefresh.Visible := false;
end;

procedure TAppDocSearchChildMamulTalimat.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  Self.ToolBar.Visible := false;
  Self.ReadOnly := true;
end;

destructor TAppDocSearchChildMamulTalimat.Destroy;
begin

  inherited;
end;

procedure TAppDocSearchChildMamulTalimat.DoRun;
begin
  with Self.Table.TableItems[0].Where do begin
    Clear;
    Add('MALKOD', wcEqual, DataApp.UretimKart.Table.MamulKod);
  end;
  Self.Run;
end;

procedure TAppDocSearchChildMamulTalimat.Initialize(IniFile: TAppIniFile);
begin
  inherited;
//  CreateTitle;

end;

procedure TAppDocSearchChildMamulTalimat.PrepareDefination;
begin
  Self.Table.TableItems.TableNames := VarArrayOf(['URTTAL']);
  Self.Table.TableItems.TableReferans := Self.Table.TableItems.TableNames;
  Self.Table.TableItems.TableCaptions := VarArrayOf(['Mamul Kart Talimat']);
  Self.Table.IndexFieldNames := 'MALKOD';

  with Self.Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
    end;
    with Where do
    begin
      AddText('0 = 1');
    end;
  end;

end;

end.
