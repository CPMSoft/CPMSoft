unit CPMApp_DocChildUretimTerminalManualTuketim;

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
  CPMApp_DataObjectModel,
  CPMApp_DocObjectModel,
  CPMApp_DocChildGrid,
  CPMApp_DocChildSearchTable,
  CPMApp_DocChildUretimTerminalProperties,
  CPMApp_DAPCustomUretimKart,
  CPMApp_TableStokSystem;

type
  TAppDocChildUretimTerminalManualTuketimStepOne = class;
  TAppDocChildUretimTerminalManualTuketimStepTwo = class;

  TAppDocChildUretimTerminalManualTuketimStepOne = class(TAppDocChildSearchTable)
  private
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
    FFormTerminalTemp: TForm;
    procedure OnGridButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure OnClickTitleRefresh(Sender: TObject);
    procedure OnClickTitleExit(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
    procedure DoAddDocument(Sender: TObject);
    procedure AddDocument;
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

  TAppDocChildUretimTerminalManualTuketimStepTwo = class(TAppDocChildSearchTable)
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

implementation

uses
  Dialogs,
  ActnList,
  Graphics,
  DateUtils,
  cxTextEdit, cxButtons, cxMaskEdit,
  CPMApp_Dialogs,
  CPMApp_Date,
  CPMApp_TableItems,
  CPMApp_SProductionConsts,
  CPMApp_DOPUretimTerminalVeriGiris,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_DocFormUretimTerminalNumPad, Controls, CPMApp_TableUretimSystem,
  CPMApp_DataChildUretimKart, CPMApp_DataApp;

{ TAppDocChildUretimTerminalManualTuketimStepOne }

procedure TAppDocChildUretimTerminalManualTuketimStepOne.AddDocument;
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalManualTuketimStepTwo do
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
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalManualTuketimStepTwo.DockPanel.Name)
end;

procedure TAppDocChildUretimTerminalManualTuketimStepOne.OnClickTitleBack(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalReceteTuketim.DockPanel.Name);
//  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslemInfo.DockPanel.Name, True)
end;

procedure TAppDocChildUretimTerminalManualTuketimStepOne.OnClickTitleExit(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalManualTuketimStepOne.OnClickTitleRefresh(
  Sender: TObject);
begin
  DataApp.DataObject.Cancel;
end;

procedure TAppDocChildUretimTerminalManualTuketimStepOne.OnGridButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  AddDocument;
end;

procedure TAppDocChildUretimTerminalManualTuketimStepOne.PrepareDefination;
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
      Add('MALKOD2');
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
      Add('MALKOD2');
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

procedure TAppDocChildUretimTerminalManualTuketimStepOne.AfterCreate;
begin
  inherited;
  Self.AppName := 'DocChildUretimTerminalManualTuketimStepOne';
  Self.Caption := 'Terminal Manual Tuketim Step One';
  PrepareDefination;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalManualTuketimStepOne.CreateTitle;
//var
//  AFormTerminalMenu: TAppDocFormUretimTerminalMenu;
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.CreateTitlePanel(TAppDocFormUretimTerminalMenu(Self.Form), 'Hm. Stoktan Yükleme. Adým 1: Malzeme Seçimi', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
//  AFormTerminalMenu := TAppDocFormUretimTerminalMenu.Create(Self.Form);

//  if TAction(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalStokBaglantiListe.Form.FindComponent('cmdNewRecordAfterSave')).Checked = true then
//    TAction(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalStokBaglantiListe.Form.FindComponent('cmdNewRecordAfterSave')).Checked := false;

//  TcxMaskEdit(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalStokBaglantiListe.Form.FindComponent('edFindFilter2')).Parent := AFormTerminalMenu.PanelManualBaglanti_Search;
//  TcxMaskEdit(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalStokBaglantiListe.Form.FindComponent('edFindFilter2')).Left := 42;
//  TcxMaskEdit(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalStokBaglantiListe.Form.FindComponent('edFindFilter2')).Top := 5;
//  TcxMaskEdit(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalStokBaglantiListe.Form.FindComponent('edFindFilter2')).Height := 35;
//  TcxMaskEdit(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalStokBaglantiListe.Form.FindComponent('edFindFilter2')).AutoSize := false;
//  TcxMaskEdit(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalStokBaglantiListe.Form.FindComponent('edFindFilter2')).Width := 640;
//  TcxMaskEdit(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalStokBaglantiListe.Form.FindComponent('edFindFilter2')).Style.Font.Size := 16;
//  TcxMaskEdit(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalStokBaglantiListe.Form.FindComponent('edFindFilter2')).Anchors := [akLeft, akTop, akRight];

//  AFormTerminalMenu.PanelManualBaglanti_Search.Parent := Self.Form;
//  AFormTerminalMenu.btManualBaglanti_Ara.OnClick := DoFindOnClick;
//  AFormTerminalMenu.btManualBaglanti_YeniArama.OnClick := DoFindNewOnClick;
//  AFormTerminalMenu.btManualBaglanti_HepsiniGoster.OnClick := DoFindShowAllOnClick;
end;

procedure TAppDocChildUretimTerminalManualTuketimStepOne.CreateObjects;
begin
  FFormTerminalTemp := TForm.Create(Self.Form);
end;

procedure TAppDocChildUretimTerminalManualTuketimStepOne.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  CreateGridButtons; // Veysel, Kaldýralabilir
//  Self.ToolBar.Visible := false;
  Self.GridView.OnDblClick := DoAddDocument;
  Self.GridView.OptionsData.Editing := true;
end;

destructor TAppDocChildUretimTerminalManualTuketimStepOne.Destroy;
begin

  inherited;
end;

procedure TAppDocChildUretimTerminalManualTuketimStepOne.DoAddDocument(
  Sender: TObject);
begin
  AddDocument;
end;

procedure TAppDocChildUretimTerminalManualTuketimStepOne.DoFind(ASearchText: String);
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
//  Self.Run;
//  DBColumn := TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalStokBaglantiListe.GridView.GetColumnByFieldName('ID');
//  DBColumn.Free;
//   := false;

//  fComponent := TcxMaskEdit(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalStokBaglantiListe.Form.FindComponent('edFindFilter2'));
//  if fComponent <> nil then
//  begin
//    edFindFilterText := TcxMaskEdit(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalStokBaglantiListe.Form.FindComponent('edFindFilter2')).Text;
//    TcxMaskEdit(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalStokBaglantiListe.Form.FindComponent('edFindFilter2')).SetFocus;
//    SendKeys('{ENTER}', true);
//    TcxMaskEdit(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalStokBaglantiListe.Form.FindComponent('edFindFilter2')).Text := edFindFilterText;
//  end;
//  CreateButtons;
//  DBColumn.Visible := true;

//  fComponent := TcxGridDBColumn(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalStokBaglantiListe.Form.FindComponent('GridChildTerminalStokBaglantiListebtTerminalStokBaglanti'));
//  if fComponent <> nil then
//    TcxGridDBColumn(fComponent).Visible := true;

end;

procedure TAppDocChildUretimTerminalManualTuketimStepOne.DoFindNewOnClick(
  Sender: TObject);
var
  fComponent: TComponent;
begin
  fComponent := TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalManualTuketimStepOne.Form.FindComponent('AppDocFormUretimTerminalMenu_10').FindComponent('edtManualBaglanti_Search');
  TcxTextEdit(fComponent).Clear;
  TcxTextEdit(fComponent).SetFocus;
  DoFind('');
end;

procedure TAppDocChildUretimTerminalManualTuketimStepOne.DoFindOnClick(Sender: TObject);
var
  fComponent: TComponent;
begin
  fComponent := TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalManualTuketimStepOne.Form.FindComponent('AppDocFormUretimTerminalMenu_10').FindComponent('edtManualBaglanti_Search');
  DoFind(TcxTextEdit(fComponent).Text);
end;

procedure TAppDocChildUretimTerminalManualTuketimStepOne.DoFindShowAllOnClick(
  Sender: TObject);
var
  fComponent: TComponent;
begin
  fComponent := TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalManualTuketimStepOne.Form.FindComponent('AppDocFormUretimTerminalMenu_10').FindComponent('edtManualBaglanti_Search');
  TcxTextEdit(fComponent).Clear;
  DoFind('');
end;

procedure TAppDocChildUretimTerminalManualTuketimStepOne.DoStart;
begin
  Table.Close;
  with Table.TableItems[0].Where do
  begin
    Clear;
    Add('KULLANILABILIR', wcGreater, 0);
  end;
  Run;
end;

procedure TAppDocChildUretimTerminalManualTuketimStepOne.CreateGridButtons;
  procedure CreateButtons;
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppChild.CreateGridButton(Self.GridView, OnGridButtonClick);
  end;
begin
//  Self.Table.TableItems[0].Where.Clear;
//  Self.Table.TableItems[0].Where.AddText('0 = 1');
//  Self.Run;
//  CreateButtons;
end;

procedure TAppDocChildUretimTerminalManualTuketimStepOne.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;

{ TAppDocChildUretimTerminalManualTuketimStepTwo }

procedure TAppDocChildUretimTerminalManualTuketimStepTwo.AddDocument;
var
  aMiktar: Double;
  function AddUretimStokHareket: Boolean;
  var
    vTarih: TDate;
    vDate: TDate;
  begin
//    if DataApp.UretimStokHareket.Table.Locate('MALKOD;SERINO;VERSIYONNO;DEPOKOD;MIKTAR',
//      VarArrayOf([Self.Table.FieldValues['MALKOD'], Self.Table.FieldValues['SERINO'], Self.Table.FieldValues['VERSIYONNO'], Self.Table.FieldValues['DEPOKOD'], aMiktar]), []) then
//    begin
//      TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Bu Malzeme Zaten Tüketilmiþ!');
//      Result := false;
//    end else
//    begin
      vDate := TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDateSettings_Date;
      vTarih := vDate;

      if TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDateSettings_DateType = DateSettings_DateType_Otomatik then
      begin
        vTarih := Date;
      end;

      if TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDateSettings_DateType = DateSettings_DateType_SabitTarih then
      begin
        vTarih := vDate;
      end;

      if TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDateSettings_DateType = DateSettings_DateType_TarihSor then
      begin
        TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PageControl.ActivePageIndex := 1;
        TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelTarihSaat_Saat.Visible := false;
        TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.ShowModal;

//        TAppDOPUretimTerminalVeriGiris(FDocApp).CreateDateEntryForm(true, false, 'Tüketim Tarihini Girin');
        vTarih := TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDateSettings_Date;
      end;

      DataApp.UretimStokHareket.Table.Insert;
      DataApp.UretimStokHareket.Table.SonKaynakEvrakNo := DataApp.UretimKart.Table.UretimNo;
      DataApp.UretimStokHareket.Table.SonKaynakEvrakTip := 54;
      DataApp.UretimStokHareket.Table.SonKaynakHesapKod := 'GENEL';

      DataApp.UretimStokHareket.Table.SiparisNo := DataApp.UretimKart.Table.EvrakNo;
      DataApp.UretimStokHareket.Table.EvrakTarih := vTarih;
      DataApp.UretimStokHareket.Table.IrsaliyeTarih := vTarih;
      DataApp.UretimStokHareket.Table.IrsaliyeNo := DataApp.UretimKart.Table.EvrakNo;

      DataApp.UretimStokHareket.Table.DovizCins := DataApp.UretimKart.Table.DovizCins;
      DataApp.UretimStokHareket.Table.MalTip := 7;
      DataApp.UretimStokHareket.Table.MalKod := Self.Table.FieldValues['MALKOD'];
      DataApp.UretimStokHareket.Table.EvrakMiktar := aMiktar;
      DataApp.UretimStokHareket.Table.SeriNo := Self.Table.FieldValues['SERINO'];
      DataApp.UretimStokHareket.Table.SeriNo2 := Self.Table.FieldValues['SERINO2'];
      DataApp.UretimStokHareket.Table.VersiyonNo := Self.Table.FieldValues['VERSIYONNO'];
      DataApp.UretimStokHareket.Table.EvrakBirim := Self.Table.FieldValues['STKKRT_BIRIM'];
      DataApp.UretimStokHareket.Table.DepoKod := Self.Table.FieldValues['DEPOKOD'];
      DataApp.UretimStokHareket.Table.Girenkaynak := 'TERMINAL';
      DataApp.UretimStokHareket.Table.Post;
      TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalReceteTuketimList.Run;
      Result := true;
//    end;
  end;
begin
//  aMiktar := TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormNumericPad('Tüketilen Miktarý Girin:');

  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
//    TerminalParametre.ReceteTuketim.HesapKod := DataApp.UretimKart.Table.HesapKod;
//    TerminalParametre.ReceteTuketim.EvrakNo := DataApp.UretimKart.Table.EvrakNo;
//    TerminalParametre.ReceteTuketim.SiparisNo := DataApp.UretimKart.Table.EvrakNo;
//    TerminalParametre.ReceteTuketim.EvrakTip := DataApp.UretimKart.Table.EvrakTip;
    TerminalParametre.ReceteTuketim.MalKod := Self.Table.FieldByName('MALKOD').AsString;
    TerminalParametre.ReceteTuketim.VersiyonNo := Self.Table.FieldByName('VERSIYONNO').AsString;
    TerminalParametre.ReceteTuketim.SeriNo := Self.Table.FieldByName('SERINO').AsString;
  end;

  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    AMiktar := DocCustomProperties.AppForms.AppFormNumericPadInformation(ChildUretimTerminalMalzemeBilgileriGiris, Self.DockPanel.Name);
  end;

  if aMiktar = 0 then
    exit;

  if aMiktar > Self.Table.FieldValues['KULLANILABILIR'] then
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Depo miktarýndan fazla yükleme yapamazsýnýz.');
    Exit;
  end;

  if DataApp.UretimEvrakBaslik.Table.IsEmpty then
  begin
    AppShowMessage('Evrak Baþlýk bilgileri bulunmuyor. Devam etmeden önce Üretim Ýþ Emri kartýndan Evrak Baþlýk bilgilerini girin ya da Ürün Aðacýndan tüketim yapýn!');
    Exit;
  end;

//  if DataApp.UretimEvrakBaslik.Table.IsEmpty then
//  begin
//    DataApp.UretimEvrakBaslik.Table.Insert;
//    DataApp.UretimEvrakBaslik.Table.KayitTur := 1;
//    DataApp.UretimEvrakBaslik.Table.KayitDurum := 1;
//    DataApp.UretimEvrakBaslik.Table.SirketNo := DataApp.CompanyNo;
//    DataApp.UretimEvrakBaslik.Table.EvrakTip := 51;
//    DataApp.UretimEvrakBaslik.Table.HesapKod := 'GENEL';
//    DataApp.UretimEvrakBaslik.Table.EvrakNo := DataApp.UretimKart.Table.EvrakNo;
//    DataApp.UretimEvrakBaslik.Table.EvrakTarih := DataApp.UretimKart.Table.EvrakTarih;
//    DataApp.UretimEvrakBaslik.Table.Post;
//  end;
//
  if AddUretimStokHareket then
  begin
    if DataApp.DataObject.Save then
      TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Ýþlem tamamlandý');
  end;
  Self.Run;
end;

procedure TAppDocChildUretimTerminalManualTuketimStepTwo.OnClickTitleBack(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalManualTuketimStepOne.Run;
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalManualTuketimStepOne.DockPanel.Name);
//  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalManualTuketimInfo.DockPanel.Name, true);
end;

procedure TAppDocChildUretimTerminalManualTuketimStepTwo.OnClickTitleExit(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalManualTuketimStepTwo.OnClickTitleRefresh(
  Sender: TObject);
begin
  DataApp.DataObject.Cancel;
end;

procedure TAppDocChildUretimTerminalManualTuketimStepTwo.OnGridButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  AddDocument;
end;

procedure TAppDocChildUretimTerminalManualTuketimStepTwo.PrepareDefination;
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

procedure TAppDocChildUretimTerminalManualTuketimStepTwo.AfterCreate;
begin
  inherited;
  Self.AppName := 'DocChildUretimTerminalManualTuketimStepTwo';
  Self.Caption := 'Terminal Manual Tüketim Step Two';
  PrepareDefination;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalManualTuketimStepTwo.CreateTitle;
//var
//  AFormTerminalMenu: TAppDocFormUretimTerminalMenu;
begin
//  AFormTerminalMenu := TAppDocFormUretimTerminalMenu.Create(nil);
//  AFormTerminalMenu.PanelHMManualTuketimStepTwo.Parent := Self.Form;
//  AFormTerminalMenu.PanelHMManualTuketimStepTwo_btnBack.OnClick := OnClickTitleBack;
//  AFormTerminalMenu.PanelHMManualTuketimStepTwo_btnExit.Onclick := OnClickTitleExit;
  TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.CreateTitlePanel(TAppDocFormUretimTerminalMenu(Self.Form), 'Hm. Stoktan Yükleme. Adým 2: Depo/Versiyon Seçimi', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

procedure TAppDocChildUretimTerminalManualTuketimStepTwo.CreateObjects;
begin

end;

procedure TAppDocChildUretimTerminalManualTuketimStepTwo.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  CreateGridButtons;
//  Self.ToolBar.Visible := false;
  Self.GridView.OptionsData.Editing := true;
end;

destructor TAppDocChildUretimTerminalManualTuketimStepTwo.Destroy;
begin

  inherited;
end;

procedure TAppDocChildUretimTerminalManualTuketimStepTwo.CreateGridButtons;
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

procedure TAppDocChildUretimTerminalManualTuketimStepTwo.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;

end.
