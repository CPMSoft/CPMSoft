unit CPMApp_DocChildUretimTerminalMalzemeDurus;

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
  CPMApp_TableUretimSystem,
  CPMApp_DAPCustomUretimKart;

type
  TAppDocChildUretimTerminalMalzemeHataKart = class;
  TAppDocChildUretimTerminalMalzemeDurusStepOne = class;
  TAppDocChildUretimTerminalMalzemeDurusStepTwo = class;

  {
  TAppGlobalClass = class
  private
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
  public
    procedure ShowMainPanel;
  published
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
  end;
  }

  TAppDocChildUretimTerminalMalzemeDurusStepOne = class(TAppDocChildSearchTable)
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
    procedure DoRun;
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
  end;

  TAppDocChildUretimTerminalMalzemeDurusStepTwo = class(TAppDocChildSearchTable)
  private
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
  private
    FDurusDate: TDateTime;
    FDurusTime: TDateTime;
    FDurusAciklama: String;
  private
    procedure OnGridButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure OnClickTitleRefresh(Sender: TObject);
    procedure OnClickTitleExit(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
    procedure CreateGridButtons;
    procedure PrepareDefination;
    function DoSaveDataObject: Boolean;
    function UpdateTableSTHURTDurum(AStatus: Integer; const IsThisPause: Boolean = false): Boolean;
  protected
    procedure CreateTitle;
    procedure CreateObjects;
    procedure AfterCreate; override;
  public
    procedure ShowForm;
    procedure DurusBaslat;
    procedure DurusSonlandir;
  public
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
  end;

  TAppDocChildUretimTerminalMalzemeHataKart = class(TAppDocChildSearchTable)
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
    function DoSaveDataObject: Boolean;
  protected
    procedure CreateTitle;
    procedure CreateObjects;
    procedure AfterCreate; override;
  public
    procedure DoRun;
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
  ActnList,
  Graphics,
  DateUtils,
  cxTextEdit, cxButtons, cxMaskEdit,
  CPMApp_Dialogs,
  CPMApp_Date,
  CPMApp_TableItems,
  CPMApp_DOPUretimTerminalVeriGiris,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_DocFormUretimTerminalNumPad, Controls;

{ TAppDocChildUretimTerminalMalzemeDurusStepOne }

procedure TAppDocChildUretimTerminalMalzemeDurusStepOne.AddDocument;
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalMalzemeDurusStepTwo do
  begin
    with Table.TableItems[0].Where do
    begin
      Clear;
      Add('DURUSTIP', wcEqual, Self.Table.FieldValues['KOD']);
    end;
    Run;
  end;
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
    ShowThisDockPanel(ChildUretimTerminalMalzemeDurusStepTwo.DockPanel.Name)
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepOne.OnClickTitleBack(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalReceteTuketim.Run;
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalReceteTuketim.DockPanel.Name);
//  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslemInfo.DockPanel.Name, true);
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepOne.OnClickTitleExit(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
    ShowThisDockPanel(ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepOne.OnClickTitleRefresh(
  Sender: TObject);
begin
  DataApp.DataObject.Cancel;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepOne.OnGridButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  AddDocument;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepOne.PrepareDefination;
begin
  Table.TableItems.TableNames := VarArrayOf(['REFKRT']);
  with Table.TableItems[0] do
  begin
    with Fields do begin
      Clear;
      Add('*');
    end;

    with Where do begin
      Clear;
      Add('KAYITTUR', wcEqual, 1);
      AddOperator(woAnd);
      Add('KAYITDURUM', wcEqual, 1);
      AddOperator(woAnd);
      Add('TABLOAD', wcEqual, 'URTODK');
      AddOperator(woAnd);
      Add('ALANAD', wcEqual, 'DURUSTIP');
    end;
  end;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepOne.AfterCreate;
begin
  inherited;
  Self.Name := 'DocChildUretimTerminalMalzemeDurusStepOne';
  Self.AppName := 'App' + Self.Name;
  Self.Caption := 'Malzeme Duruþu Seçimi Adým: 1';
  PrepareDefination;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepOne.CreateTitle;
begin
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.CreateTitlePanel(TAppDocFormUretimTerminalMenu(Self.Form), 'Adým 1: Malzeme Duruþ Tipini Seçin', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepOne.CreateObjects;
begin
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepOne.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  CreateGridButtons;
  Self.ToolBar.Visible := false;
  Self.GridView.OptionsData.Editing := true;
end;

destructor TAppDocChildUretimTerminalMalzemeDurusStepOne.Destroy;
begin

  inherited;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepOne.DoRun;
begin
  with Self.Table.TableItems[0].Where do begin
    Clear;
    Add('KAYITTUR', wcEqual, 1);
    AddOperator(woAnd);
    Add('KAYITDURUM', wcEqual, 1);
    AddOperator(woAnd);
    Add('TABLOAD', wcEqual, 'URTODK');
    AddOperator(woAnd);
    Add('ALANAD', wcEqual, 'DURUSTIP');
  end;
  Self.Run;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepOne.CreateGridButtons;
  procedure CreateButtons;
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppChild.CreateGridButton(Self.GridView, OnGridButtonClick);
  end;
begin
//  Self.Table.TableItems[0].Where.Clear;
//  Self.Table.TableItems[0].Where.AddText('0 = 1');
  Self.Run;
  CreateButtons;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepOne.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;

{ TAppDocChildUretimTerminalMalzemeDurusStepTwo }

procedure TAppDocChildUretimTerminalMalzemeDurusStepTwo.DurusBaslat;
var
  DurusKod: String;
  OpDurum: Smallint;
  IslemNo, IslemSiraNo: Smallint;
  procedure AddDurus;
  begin
    OpDurum := TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDurum;
    IslemNo := TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpIslemNo;
    IslemSiraNo := TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpIslemSiraNo;

//    TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.DurusBaslat(DurusKod, IslemNo, IslemSiraNo);

    DataApp.UretimRotaKaynakDurus.Table.Insert;
    DataApp.UretimRotaKaynakDurus.Table.DurusKod := DurusKod;
    DataApp.UretimRotaKaynakDurus.Table.Adet := 1;
    DataApp.UretimRotaKaynakDurus.Table.BasTarih := FDurusDate;
    DataApp.UretimRotaKaynakDurus.Table.BasTarihSaat := FDurusDate + FDurusTime;
    DataApp.UretimRotaKaynakDurus.Table.BitTarih := FDurusDate;
    DataApp.UretimRotaKaynakDurus.Table.BitTarihSaat := FDurusDate + FDurusTime;
    DataApp.UretimRotaKaynakDurus.Table.Sure := 0;
    DataApp.UretimRotaKaynakDurus.Table.Aciklama := FDurusAciklama;
    DataApp.UretimRotaKaynakDurus.Table.OperatorKod := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.SicilKod;
    DataApp.UretimRotaKaynakDurus.Table.FieldValues['ISLEMNO'] := IslemNo;
    DataApp.UretimRotaKaynakDurus.Table.FieldValues['ISLEMSIRANO'] := IslemSiraNo;
    DataApp.UretimRotaKaynakDurus.Table.Post;

    if OpDurum = odNone then
      UpdateTableSTHURTDurum(odNone, true);

    if OpDurum = odStarted then
      UpdateTableSTHURTDurum(odStarted, true);

  end;
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.PressedOKButton := '';

  with TAppDOPUretimTerminalVeriGiris(DocApp) do
    DurusKod := ChildUretimTerminalMalzemeDurusStepTwo.Table.FieldValues['DURUSKOD'];

  if DataApp.UretimRotaKaynakOperasyon.Table.IsEmpty then // Eðer hiç operasyon girilmemiþse operasyon ekliyoruz.
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DoStartOperasyon(TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.OpIslemNo);
  end;
  DataApp.UretimRotaKaynakOperasyon.Table.Last;
  ShowForm;
  if TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.PressedOKButton = '' then
    Exit;
  AddDurus;

  if DoSaveDataObject then
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Duruþ bilgisi kayýt edildi.');
    with TAppDOPUretimTerminalVeriGiris(DocApp) do
    begin
      ChildUretimTerminalReceteTuketim.Run;
      ShowThisDockPanel(ChildUretimTerminalReceteTuketim.DockPanel.Name);
    end;
  end;
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.PressedOKButton := '';
end;

function TAppDocChildUretimTerminalMalzemeDurusStepTwo.UpdateTableSTHURTDurum(AStatus: Integer; const IsThisPause: Boolean = false): Boolean;
var aSQLStr: String;
begin
  if (AStatus = odNone) And (IsThisPause)  then
    aSQLStr := 'Update STHURT Set OPDURUM = ' + IntToStr(odPaused) + ', SONOPDURUM = %d ';

  if (AStatus = odStarted) And (IsThisPause)  then
    aSQLStr := 'Update STHURT Set OPDURUM = ' + IntToStr(odPaused) + ', SONOPDURUM = %d ';

  if (AStatus In [odNone]) And Not (IsThisPause) then
    aSQLStr := 'Update STHURT Set OPDURUM = %d ';

  if (AStatus In [odStarted]) And Not (IsThisPause) then
    aSQLStr := 'Update STHURT Set OPDURUM = %d ';

  with TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalReceteTuketim do
  begin
    aSQLStr := aSQLStr + 'Where HESAPKOD = ''%s'' And EVRAKNO = ''%s'' And EVRAKTIP = %d And SIRANO = %d And OPERASYONNO = %d And KAYNAKISLEMNO = %d ';
    aSQLStr := Format(aSQLStr, [AStatus, ParamsSelf.HesapKod, ParamsSelf.EvrakNo, ParamsSelf.EvrakTip, ParamsSelf.SiraNo, ParamsSelf.OperasyonNo, ParamsSelf.KaynakIslemNo]);
  end;
  try
    DataApp.TableCommand.Execute(aSQLStr);
    Result := true;
  Except
    Result := false;
  end;
end;


procedure TAppDocChildUretimTerminalMalzemeDurusStepTwo.DurusSonlandir;
var
  SonOpDurum: Smallint;
  xOldIndex: String;
  DakikaFark: Integer;
begin
  xOldIndex := DataApp.UretimRotaKaynakDurus.TableClone.IndexFieldNames;
  DataApp.UretimRotaKaynakDurus.TableClone.IndexFieldNames := 'ISLEMNO;ISLEMSIRANO';

  with TAppDOPUretimTerminalVeriGiris(FDocApp) do
  begin
    DataApp.UretimRotaKaynakDurus.TableClone.SetRange([TerminalParametre.OpIslemNo, TerminalParametre.OpIslemSiraNo], [TerminalParametre.OpIslemNo, TerminalParametre.OpIslemSiraNo]);
    if DataApp.UretimRotaKaynakDurus.TableClone.IsEmpty then
    begin
      AppShowMessage('Kayýtlý duruþ bilgisi bulunamadý. Kayýt Üretim Ýþ Emri Kartýndan elle deðiþtirilmiþ olabilir');
      Exit;
    end;

    ShowForm;

    if TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.PressedOKButton = '' then
      Exit;

    DakikaFark := MinutesBetween(Now(), DataApp.UretimRotaKaynakDurus.TableClone.BasTarihSaat);
    DataApp.UretimRotaKaynakDurus.TableClone.Edit;
    DataApp.UretimRotaKaynakDurus.TableClone.BitTarih := FDurusDate;
    DataApp.UretimRotaKaynakDurus.TableClone.BitTarihSaat := Now();
    DataApp.UretimRotaKaynakDurus.TableClone.FieldValues['ACIKLAMA1'] := FDurusAciklama;
    DataApp.UretimRotaKaynakDurus.TableClone.BirimSure := DakikaFark;//DataApp.UretimRotaKaynakDurus.TableClone.BitTarihSaat - DataApp.UretimRotaKaynakDurus.TableClone.BasTarihSaat;
    DataApp.UretimRotaKaynakDurus.TableClone.Sure := DakikaFark;//DataApp.UretimRotaKaynakDurus.TableClone.BitTarihSaat - DataApp.UretimRotaKaynakDurus.TableClone.BasTarihSaat;
    DataApp.UretimRotaKaynakDurus.TableClone.Post;

    DataApp.UretimRotaKaynakDurus.TableClone.IndexFieldNames := xOldIndex;

    SonOpDurum := TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalReceteTuketim.Table.FieldValues['STHURT_SONOPDURUM'];;

    if SonOpDurum = odNone then
      UpdateTableSTHURTDurum(odNone, false);

    if SonOpDurum = odStarted then
      UpdateTableSTHURTDurum(odStarted, false);

    if DoSaveDataObject then
    begin
      TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Duruþ Ýþlemi Sonlandýrýldý!');
      with TAppDOPUretimTerminalVeriGiris(DocApp) do
      begin
        ChildUretimTerminalReceteTuketim.Run;
        ShowThisDockPanel(ChildUretimTerminalReceteTuketim.DockPanel.Name);
      end;
    end;
  end;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepTwo.OnClickTitleBack(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do begin
    ChildUretimTerminalMalzemeDurusStepOne.Run;
    ShowThisDockPanel(ChildUretimTerminalMalzemeDurusStepOne.DockPanel.Name)
  end;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepTwo.OnClickTitleExit(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepTwo.OnClickTitleRefresh(
  Sender: TObject);
begin
  DataApp.DataObject.Cancel;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepTwo.OnGridButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  DurusBaslat;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepTwo.PrepareDefination;
begin
  Table.TableItems.TableNames := VarArrayOf(['URTODK']);
  Table.IndexFieldNames := 'DURUSKOD';
  with Table.TableItems[0] do
  begin
    with Fields do begin
      Clear;
      Add('*');
    end;

    with Where do begin
      Clear;
      Add('KAYITTUR', wcEqual, 1);
      AddOperator(woAnd);
      Add('KAYITDURUM', wcEqual, 1);
    end;
  end;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepTwo.ShowForm;
begin
  FDurusDate := Date;
  FDurusTime := Now;
  FDurusAciklama := '';

  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PageControl.ActivePageIndex := 5;
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusTarih.Date := Date;
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusSaat.Time := Time;
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusAciklama.Text := '';
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusDakika.Value := 0;
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.ShowModal;

  FDurusDate := TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusTarih.Date;
  FDurusTime := TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusSaat.Time;
  FDurusAciklama := TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusAciklama.Text;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepTwo.AfterCreate;
begin
  inherited;
  Self.Name := 'DocChildUretimTerminalMalzemeDurusStepTwo';
  Self.AppName := 'App' + Self.Name;
  Self.Caption := 'Malzeme Duruþ Seçimi Adým: 2';
  PrepareDefination;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepTwo.CreateTitle;
begin
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.CreateTitlePanel(TAppDocFormUretimTerminalMenu(Self.Form), 'Adým 2: Malzeme Duruþ Kodunu Seçin', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

function TAppDocChildUretimTerminalMalzemeDurusStepTwo.DoSaveDataObject: Boolean;
begin
  if DataApp.DataObject.Save then
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DoOpenDocument;
//    TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.DoRun;
    Result := true
  end
  else
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Hata oluþtu. Ýþlem iptal edilecek!');
    DataApp.DataObject.Cancel;
    Result := false;
  end;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepTwo.CreateObjects;
begin
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepTwo.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  CreateGridButtons;
  Self.ToolBar.Visible := false;
  Self.GridView.OptionsData.Editing := true;
end;

destructor TAppDocChildUretimTerminalMalzemeDurusStepTwo.Destroy;
begin

  inherited;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepTwo.CreateGridButtons;
  procedure CreateButtons;
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppChild.CreateGridButton(Self.GridView, OnGridButtonClick);
  end;
begin
//  Self.Table.TableItems[0].Where.Clear;
//  Self.Table.TableItems[0].Where.AddText('0 = 1');
  Self.Run;
  CreateButtons;
end;

procedure TAppDocChildUretimTerminalMalzemeDurusStepTwo.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;



{ TAppDocChildUretimTerminalMalzemeHataKart }

procedure TAppDocChildUretimTerminalMalzemeHataKart.AddDocument;
var AMiktar: Double;
    AHataKod: String;
begin
  if Self.Table.IsEmpty then
    Exit;

  AMiktar :=  TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormNumericPad('Hata Miktarýný Girin!');
  AHataKod := Self.Table.FieldValues['HATAKOD'];

  if SameText(AHataKod, '') then
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Hata nedeni seçmeden devam edemezsiniz!');
    Exit;
  end;

  if AMiktar >0 then
  begin
    try
      DataApp.UretimRotaKaynakHata.Table.Insert;
      DataApp.UretimRotaKaynakHata.Table.HataKod := AHataKod;
      DataApp.UretimRotaKaynakHata.Table.Miktar := AMiktar;
      DataApp.UretimRotaKaynakHata.Table.FieldValues['ISLEMNO'] := TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpIslemNo;
      DataApp.UretimRotaKaynakHata.Table.FieldValues['ISLEMSIRANO'] := TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpIslemSiraNo;
      DataApp.UretimRotaKaynakHata.Table.OperatorKod := TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.SicilKod;
      DataApp.UretimRotaKaynakHata.Table.Post;
    finally
      if DoSaveDataObject then begin
        with TAppDOPUretimTerminalVeriGiris(DocApp) do begin
          DocCustomProperties.AppForms.AppFormMessageDialog('Hata bilgisi kayýt edildi!');
          ChildUretimTerminalReceteTuketim.Run;
          ShowThisDockPanel(ChildUretimTerminalReceteTuketim.DockPanel.Name);
//          ShowThisDockPanel(ChildUretimKaynakIslemInfo.DockPanel.Name, true);
        end;
      end;
    end;
  end;
end;

procedure TAppDocChildUretimTerminalMalzemeHataKart.AfterCreate;
begin
  inherited;
  Self.Name := 'AppDocChildUretimTerminalMalzemeHataKart';
  Self.AppName := 'App' + Self.Name;
  Self.Caption := 'Malzeme Hata Seçimi';
  PrepareDefination;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalMalzemeHataKart.CreateGridButtons;
  procedure CreateButtons;
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppChild.CreateGridButton(Self.GridView, OnGridButtonClick);
  end;
begin
//  Self.Table.TableItems[0].Where.Clear;
//  Self.Table.TableItems[0].Where.AddText('0 = 1');
  Self.Run;
  CreateButtons;
end;

procedure TAppDocChildUretimTerminalMalzemeHataKart.CreateObjects;
begin

end;

procedure TAppDocChildUretimTerminalMalzemeHataKart.CreateTitle;
begin
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.CreateTitlePanel(TAppDocFormUretimTerminalMenu(Self.Form), 'Hata Kodunu Seçin!', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

procedure TAppDocChildUretimTerminalMalzemeHataKart.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  CreateGridButtons;
  Self.ToolBar.Visible := false;
  Self.GridView.OptionsData.Editing := true;
end;

destructor TAppDocChildUretimTerminalMalzemeHataKart.Destroy;
begin

  inherited;
end;

function TAppDocChildUretimTerminalMalzemeHataKart.DoSaveDataObject: Boolean;
begin
  if DataApp.DataObject.Save then
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DoOpenDocument;
//    TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.DoRun;
    TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(Self.DockPanel.Name);
    Result := true
  end
  else
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Hata oluþtu. Ýþlem iptal edilecek!');
    DataApp.DataObject.Cancel;
    Result := false;
  end;
end;

procedure TAppDocChildUretimTerminalMalzemeHataKart.Initialize(IniFile: TAppIniFile);
begin
  inherited;

end;

procedure TAppDocChildUretimTerminalMalzemeHataKart.OnClickTitleBack(Sender: TObject);
begin
//  TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.DoRun;
//  TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.Run;
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalReceteTuketim.DockPanel.Name)
end;

procedure TAppDocChildUretimTerminalMalzemeHataKart.OnClickTitleExit(Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalMalzemeHataKart.OnClickTitleRefresh(
  Sender: TObject);
begin
  DataApp.DataObject.Cancel;
end;

procedure TAppDocChildUretimTerminalMalzemeHataKart.OnGridButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  AddDocument;
end;

procedure TAppDocChildUretimTerminalMalzemeHataKart.PrepareDefination;
begin
  Table.TableItems.TableNames := VarArrayOf(['URTOHK']);
  Table.IndexFieldNames := 'HATAKOD';
  with Table.TableItems[0] do
  begin
    with Fields do begin
      Clear;
      Add('*');
    end;

    with Where do begin
      Clear;
      Add('KAYITTUR', wcEqual, 1);
      AddOperator(woAnd);
      Add('KAYITDURUM', wcEqual, 1);
    end;
  end;
end;

procedure TAppDocChildUretimTerminalMalzemeHataKart.DoRun;
begin
//  Self.Table.TableItems[0].Where.Clear;
  Self.Run;
end;

end.
