unit CPMApp_DocChildUretimTerminalKaynakDurus;

interface

uses
  CPMApp_DocCostumUretimTerminalSendKey, Dialogs,   DateUtils,

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
  CPMApp_TableUretimSystem,
  CPMApp_DocChildSearchTable,
  CPMApp_DocChildUretimTerminalProperties,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_DocFormUretimTerminalSettings,
  CPMApp_DAPCustomUretimKart;

type
  TAppDocChildUretimTerminalHataKart = class;
  TAppDocChildUretimTerminalDurusStepOne = class;
  TAppDocChildUretimTerminalDurusStepTwo = class;
  TAppDocChildTerminalDurusIslemSecim = class;

  TAppDocChildUretimTerminalDurusStepOne = class(TAppDocChildSearchTable)
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
    procedure DoStart;
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
  end;

  TAppDocChildUretimTerminalDurusStepTwo = class(TAppDocChildSearchTable)
  private
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
  private
    FDurusDate: TDateTime;
    FDurusTime: TDateTime;
    FDurusMinute: Smallint;
    FDurusAciklama: String;
    procedure OnGridButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure OnClickTitleRefresh(Sender: TObject);
    procedure OnClickTitleExit(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
  private
    procedure DoShowForm;
    procedure AddDocument;
    procedure CreateGridButtons;
    procedure PrepareDefination;
    function DoSaveDataObject: Boolean;
  protected
    procedure CreateTitle;
    procedure CreateObjects;
    procedure AfterCreate; override;
  public
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
    procedure DoFinish;
  published
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
  end;

  TAppDocChildUretimTerminalHataKart = class(TAppDocChildSearchTable)
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
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
  end;

  TAppDocChildTerminalDurusIslemSecim = class(TAppDocChildSearchTable)
  private
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
  private
    FFormSelf: TForm;
    FormTerminalSettings: TAppDocFormUretimTerminalSettings;
  private
    procedure OnGridButtonClick(Sender: TObject; AButtonIndex: Integer);
  private
    procedure CreateGridButtons;
    procedure PrepareDefination;
  protected
    procedure CreatTitle;
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
  published
    property FormSelf: TForm read FFormSelf write FFormSelf;
  end;
implementation

uses
  cxGrid,
  ActnList,
  Graphics,
  cxTextEdit, cxButtons, cxMaskEdit,
  CPMApp_Dialogs,
  CPMApp_Date,
  CPMApp_TableItems,
  CPMApp_DOPUretimTerminalVeriGiris,

  CPMApp_DocFormUretimTerminalNumPad, Controls, cxCalendar;

{ TAppDocChildUretimTerminalDurusStepOne }

procedure TAppDocChildUretimTerminalDurusStepOne.AddDocument;
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalDurusStepTwo do
  begin
    with Table.TableItems[0].Where do
    begin
      Clear;
      Add('DURUSTIP', wcEqual, Self.Table.FieldValues['KOD']);
    end;
    Run;
  end;
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
    ShowThisDockPanel(ChildUretimTerminalDurusStepTwo.DockPanel.Name)
end;

procedure TAppDocChildUretimTerminalDurusStepOne.OnClickTitleBack(
  Sender: TObject);
begin
//  TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.Run;
//  TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.DoRun;
  TAppDOPUretimTerminalVeriGiris(DocApp)
      .ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalDurusStepOne.OnClickTitleExit(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
    ShowThisDockPanel(ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalDurusStepOne.OnClickTitleRefresh(
  Sender: TObject);
begin
  DataApp.DataObject.Cancel;
end;

procedure TAppDocChildUretimTerminalDurusStepOne.OnGridButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  AddDocument;
end;

procedure TAppDocChildUretimTerminalDurusStepOne.PrepareDefination;
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

procedure TAppDocChildUretimTerminalDurusStepOne.AfterCreate;
begin
  inherited;
  Self.Name := 'DocChildUretimTerminalDurusStepOne';
  Self.AppName := 'App' + Self.Name;
  Self.Caption := 'Duruþ Seçimi Adým: 1';
  PrepareDefination;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalDurusStepOne.CreateTitle;
begin
  TAppDOPUretimTerminalVeriGiris(FDocApp)
    .DocCustomProperties.AppForms.CreateTitlePanel(TAppDocFormUretimTerminalMenu(Self.Form),
        'Adým 1: Duruþ Tipini Seçin', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

procedure TAppDocChildUretimTerminalDurusStepOne.CreateObjects;
begin
end;

procedure TAppDocChildUretimTerminalDurusStepOne.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  CreateGridButtons;
  Self.ToolBar.Visible := false;
  Self.GridView.OptionsData.Editing := true;
end;

destructor TAppDocChildUretimTerminalDurusStepOne.Destroy;
begin

  inherited;
end;

procedure TAppDocChildUretimTerminalDurusStepOne.DoStart;
begin
  Self.Run;
end;

procedure TAppDocChildUretimTerminalDurusStepOne.CreateGridButtons;
  procedure CreateButtons;
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp)
        .DocCustomProperties.AppChild.CreateGridButton(Self.GridView, OnGridButtonClick);
  end;
begin
//  Self.Table.TableItems[0].Where.Clear;
//  Self.Table.TableItems[0].Where.AddText('0 = 1');
  Self.Run;
  CreateButtons;
end;

procedure TAppDocChildUretimTerminalDurusStepOne.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;

{ TAppDocChildUretimTerminalDurusStepTwo }

procedure TAppDocChildUretimTerminalDurusStepTwo.AddDocument;
var
  DurusKod: String;
  procedure AddRecord;
  var IslemNo: Integer;
      DakikaFark: Integer;
  begin
    IslemNo := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.OpIslemNo;

    DataApp.UretimRotaKaynakDurus.Table.Insert;
    DataApp.UretimRotaKaynakDurus.Table.DurusKod := DurusKod;
    DataApp.UretimRotaKaynakDurus.Table.Adet := 1;
    DataApp.UretimRotaKaynakDurus.Table.Aciklama := FDurusAciklama;
    DataApp.UretimRotaKaynakDurus.Table.BasTarih := FDurusDate;
    DataApp.UretimRotaKaynakDurus.Table.BasTarihSaat := FDurusDate + FDurusTime;
    DataApp.UretimRotaKaynakDurus.Table.FieldValues['ISLEMNO'] := IslemNo;

//    AppShowMessage(IntToStr(IslemNo));

    if TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.DurusCommand = 3 then
    begin
      DataApp.UretimRotaKaynakDurus.Table.BitTarih := FDurusDate;
      DataApp.UretimRotaKaynakDurus.Table.BitTarihSaat := IncMinute(FDurusDate, FDurusMinute);
      DataApp.UretimRotaKaynakDurus.Table.BirimSure := FDurusMinute;
      DataApp.UretimRotaKaynakDurus.Table.Sure := FDurusMinute;
    end else
    begin
      DataApp.UretimRotaKaynakDurus.Table.BitTarih := FDurusDate;
      DataApp.UretimRotaKaynakDurus.Table.BitTarihSaat := FDurusDate + FDurusTime;
      DakikaFark := MinutesBetween(Now(), DataApp.UretimRotaKaynakDurus.Table.BasTarihSaat);
      DataApp.UretimRotaKaynakDurus.Table.BirimSure := DakikaFark;
      DataApp.UretimRotaKaynakDurus.Table.Sure := DakikaFark;
//      DataApp.UretimRotaKaynakDurus.Table.Sure := 0;
    end;

    DataApp.UretimRotaKaynakDurus.Table.OperatorKod := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.SicilKod;
    DataApp.UretimRotaKaynakDurus.Table.Post;

    with TAppDOPUretimTerminalVeriGiris(DocApp) do begin
      if TerminalParametre.DurusBilgileri.DurusCommand <> 3 then
      begin
        if DataApp.UretimRota.Table.Locate('OPERASYONNO', TerminalParametre.OperasyonNo, []) then
          if DataApp.UretimRotaKaynak.Table.Locate('KAYNAKKOD', TerminalParametre.KaynakKod, []) then
            if DataApp.UretimRotaKaynakIslem.Table.Locate('ISLEMNO', TerminalParametre.OpIslemNo, []) then
          begin
            DataApp.UretimRotaKaynakIslem.Table.Edit;
            DataApp.UretimRotaKaynakIslem.Table.Durum := odPaused;
            DataApp.UretimRotaKaynakIslem.Table.Post;
          end;
      end;
    end;

  end;
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.PressedOKButton := '';
  DurusKod := TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalDurusStepTwo.Table.FieldValues['DURUSKOD'];

  if not DataApp.UretimRotaKaynakOperasyon.Table.Locate('ISLEMNO', TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.IslemNo, []) then
    DataApp.UretimRotaKaynakOperasyon.Table.Last;

  DoShowForm;
  if TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.PressedOKButton = '' then
    Exit;
  AddRecord;
  if DoSaveDataObject then
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Duruþ bilgisi kayýt edildi.');
    with TAppDOPUretimTerminalVeriGiris(DocApp) do
    begin
      if (TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.ReturnForm = 'KaliteKontrol') then
        ShowThisDockPanel(ChildUretimTerminalKaliteEvrakList.DockPanel.Name)
      else
        ShowThisDockPanel(ChildUretimKaynakIslem.DockPanel.Name);
    end;
    TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.ReturnForm := '';
  end;
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.ReturnForm := '';
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.PressedOKButton := '';
end;

procedure TAppDocChildUretimTerminalDurusStepTwo.OnClickTitleBack(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do begin
    ChildUretimTerminalDurusStepOne.Run;
    ShowThisDockPanel(ChildUretimTerminalDurusStepOne.DockPanel.Name)
  end;
end;

procedure TAppDocChildUretimTerminalDurusStepTwo.OnClickTitleExit(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalDurusStepTwo.OnClickTitleRefresh(
  Sender: TObject);
begin
  DataApp.DataObject.Cancel;
end;

procedure TAppDocChildUretimTerminalDurusStepTwo.OnGridButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  AddDocument;
end;

procedure TAppDocChildUretimTerminalDurusStepTwo.PrepareDefination;
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

procedure TAppDocChildUretimTerminalDurusStepTwo.AfterCreate;
begin
  inherited;
  Self.Name := 'DocChildUretimTerminalDurusStepTwo';
  Self.AppName := 'App' + Self.Name;
  Self.Caption := 'Duruþ Seçimi Adým: 2';
  PrepareDefination;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalDurusStepTwo.CreateTitle;
begin
  TAppDOPUretimTerminalVeriGiris(FDocApp)
      .DocCustomProperties.AppForms.CreateTitlePanel(TAppDocFormUretimTerminalMenu(Self.Form),
          'Adým 2: Duruþ Kodunu Seçin', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

procedure TAppDocChildUretimTerminalDurusStepTwo.DoFinish;
var
  DakikaFark: Integer;
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.PressedOKButton := '';
  if DataApp.UretimRota.Table.Locate('OPERASYONNO', TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.OperasyonNo, []) then
    if DataApp.UretimRotaKaynak.Table.Locate('KAYNAKKOD', TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.KaynakKod, []) then
      if DataApp.UretimRotaKaynakIslem.Table.Locate('ISLEMNO', TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.OpIslemNo, []) then
      begin
        DataApp.UretimRotaKaynakIslem.Table.Edit;
        DataApp.UretimRotaKaynakIslem.Table.Durum := odStarted;
        DataApp.UretimRotaKaynakIslem.Table.Post;
      end;
      if DataApp.UretimRotaKaynakDurus.Table.Locate('ISLEMNO', TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.OpIslemNo, [])then begin
        DataApp.UretimRotaKaynakDurus.Table.Last;
        DoShowForm;
        if TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.PressedOKButton = '' then
          Exit;
        DataApp.UretimRotaKaynakDurus.TableClone.Edit;
        DataApp.UretimRotaKaynakDurus.TableClone.BitTarih := FDurusDate;
        DataApp.UretimRotaKaynakDurus.TableClone.BitTarihSaat := FDurusDate + FDurusTime;
        DataApp.UretimRotaKaynakDurus.TableClone.FieldValues['ACIKLAMA1'] := FDurusAciklama;

        DakikaFark := MinutesBetween(Now(), DataApp.UretimRotaKaynakDurus.TableClone.BasTarihSaat);
        DataApp.UretimRotaKaynakDurus.TableClone.BirimSure := DakikaFark;
        DataApp.UretimRotaKaynakDurus.TableClone.Sure := DakikaFark;

//        DataApp.UretimRotaKaynakDurus.TableClone.BirimSure := (FDurusDate + FDurusTime) - DataApp.UretimRotaKaynakDurus.TableClone.BasTarihSaat;
        DataApp.UretimRotaKaynakDurus.TableClone.Post;
      end;
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.PressedOKButton := '';

  if DataApp.DataObject.Save then
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp)
        .DocCustomProperties.AppForms.AppFormMessageDialog('Duruþ iþlemi sonlandýrýldý!');
    TAppDOPUretimTerminalVeriGiris(DocApp).DoOpenDocument;
    TAppDOPUretimTerminalVeriGiris(DocApp)
        .ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.DockPanel.Name);
  end;
end;

function TAppDocChildUretimTerminalDurusStepTwo.DoSaveDataObject: Boolean;
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
    TAppDOPUretimTerminalVeriGiris(FDocApp)
        .DocCustomProperties.AppForms.AppFormMessageDialog('Hata oluþtu. Ýþlem iptal edilecek!');
    DataApp.DataObject.Cancel;
    Result := false;
  end;
end;

procedure TAppDocChildUretimTerminalDurusStepTwo.DoShowForm;
begin
  FDurusDate := Date;
  FDurusTime := Now;
  FDurusMinute := 0;
  FDurusAciklama := '';

  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PageControl.ActivePageIndex := 5;
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusTarih.Date := Date;
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusSaat.Time := Time;
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusAciklama.Text := '';
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusDakika.Value := 0;

  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusTarih.Enabled :=
            TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.DurusBilgileri.DurusCommand = 3;
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusSaat.Enabled :=
            TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.DurusBilgileri.DurusCommand = 3;
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_gbDurusDakika.Visible :=
            TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.DurusBilgileri.DurusCommand = 3;
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusDakika.Enabled :=
            TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.DurusBilgileri.DurusCommand = 3;

  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.ShowModal;

  FDurusDate := TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusTarih.Date;
  FDurusTime := TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusSaat.Time;
  FDurusMinute := TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusDakika.Value;
  FDurusAciklama := TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelDurus_edDurusAciklama.Text;
end;

procedure TAppDocChildUretimTerminalDurusStepTwo.CreateObjects;
begin
end;

procedure TAppDocChildUretimTerminalDurusStepTwo.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  CreateGridButtons;
  Self.ToolBar.Visible := false;
  Self.GridView.OptionsData.Editing := true;
end;

destructor TAppDocChildUretimTerminalDurusStepTwo.Destroy;
begin

  inherited;
end;

procedure TAppDocChildUretimTerminalDurusStepTwo.CreateGridButtons;
  procedure CreateButtons;
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp)
        .DocCustomProperties.AppChild.CreateGridButton(Self.GridView, OnGridButtonClick);
  end;
begin
//  Self.Table.TableItems[0].Where.Clear;
//  Self.Table.TableItems[0].Where.AddText('0 = 1');
  Self.Run;
  CreateButtons;
end;

procedure TAppDocChildUretimTerminalDurusStepTwo.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;

{ TAppDocChildUretimTerminalHataKart }

procedure TAppDocChildUretimTerminalHataKart.AddDocument;
var AMiktar: Double;
    AHataKod: String;
begin
  if Self.Table.IsEmpty then
    Exit;

  AMiktar :=  TAppDOPUretimTerminalVeriGiris(FDocApp)
      .DocCustomProperties.AppForms.AppFormNumericPad('Hata Miktarýný Girin!');
  AHataKod := Self.Table.FieldValues['HATAKOD'];

  if SameText(AHataKod, '') then
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp)
        .DocCustomProperties.AppForms.AppFormMessageDialog('Hata nedeni seçmeden devam edemezsiniz!');

    Exit;
  end;

  if AMiktar >0 then
  begin
    try
      DataApp.UretimRotaKaynakHata.Table.Insert;
      DataApp.UretimRotaKaynakHata.Table.HataKod := AHataKod;
      DataApp.UretimRotaKaynakHata.Table.Miktar := AMiktar;
      DataApp.UretimRotaKaynakHata.Table.OperatorKod := TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.SicilKod;
      DataApp.UretimRotaKaynakHata.Table.Post;
    finally
      if DoSaveDataObject then
        TAppDOPUretimTerminalVeriGiris(FDocApp)
            .DocCustomProperties.AppForms.AppFormMessageDialog('Hata bilgisi kayýt edildi!');
    end;
  end;
end;

procedure TAppDocChildUretimTerminalHataKart.AfterCreate;
begin
  inherited;
  Self.Name := 'AppDocChildUretimTerminalHataKart';
  Self.AppName := 'App' + Self.Name;
  Self.Caption := 'Hata Seçimi';
  PrepareDefination;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalHataKart.CreateGridButtons;
  procedure CreateButtons;
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp)
      .DocCustomProperties.AppChild.CreateGridButton(Self.GridView, OnGridButtonClick);
  end;
begin
//  Self.Table.TableItems[0].Where.Clear;
//  Self.Table.TableItems[0].Where.AddText('0 = 1');
  Self.Run;
  CreateButtons;
end;

procedure TAppDocChildUretimTerminalHataKart.CreateObjects;
begin

end;

procedure TAppDocChildUretimTerminalHataKart.CreateTitle;
begin
  TAppDOPUretimTerminalVeriGiris(FDocApp)
      .DocCustomProperties.AppForms.CreateTitlePanel(TAppDocFormUretimTerminalMenu(Self.Form),
          'Duruþ Kodunu Seçin!', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

procedure TAppDocChildUretimTerminalHataKart.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  CreateGridButtons;
  Self.ToolBar.Visible := false;
  Self.GridView.OptionsData.Editing := true;
end;

destructor TAppDocChildUretimTerminalHataKart.Destroy;
begin

  inherited;
end;

function TAppDocChildUretimTerminalHataKart.DoSaveDataObject: Boolean;
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
    TAppDOPUretimTerminalVeriGiris(FDocApp)
        .DocCustomProperties.AppForms.AppFormMessageDialog('Hata oluþtu. Ýþlem iptal edilecek!');
    DataApp.DataObject.Cancel;
    Result := false;
  end;
end;

procedure TAppDocChildUretimTerminalHataKart.Initialize(IniFile: TAppIniFile);
begin
  inherited;

end;

procedure TAppDocChildUretimTerminalHataKart.OnClickTitleBack(Sender: TObject);
begin
//  TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.DoRun;
//  TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.Run;
  TAppDOPUretimTerminalVeriGiris(DocApp)
      .ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.DockPanel.Name)
end;

procedure TAppDocChildUretimTerminalHataKart.OnClickTitleExit(Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp)
      .ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalHataKart.OnClickTitleRefresh(
  Sender: TObject);
begin
  DataApp.DataObject.Cancel;
end;

procedure TAppDocChildUretimTerminalHataKart.OnGridButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  AddDocument;
end;

procedure TAppDocChildUretimTerminalHataKart.PrepareDefination;
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

{ TAppDocChildTerminalDurusIslemSecim }

procedure TAppDocChildTerminalDurusIslemSecim.AfterCreate;
begin
  inherited;
  Self.Name := 'DocChildDurusIslemSecim';
  Self.AppName := 'App' + Self.Name;
  Self.Caption := 'Terminal Duruþ Ýþlem Seçim';

  PrepareDefination;
  CreateObjects;
end;

procedure TAppDocChildTerminalDurusIslemSecim.CreateGridButtons;
  procedure CreateButtons;
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp)
      .DocCustomProperties.AppChild.CreateGridButton(Self.GridView, OnGridButtonClick);
  end;
begin
  Self.Table.TableItems[0].Where.Clear;
  Self.Table.TableItems[0].Where.AddText('0 = 1');
  Self.Run;
  CreateButtons;
end;

procedure TAppDocChildTerminalDurusIslemSecim.CreateObjects;
begin
  FormTerminalSettings := TAppDocFormUretimTerminalSettings.Create(DocApp);
  FormTerminalSettings.Width := 550; FormTerminalSettings.Height := 350;
  Self.DockPanel.Parent := FormTerminalSettings.Panel_Durus;
end;

procedure TAppDocChildTerminalDurusIslemSecim.CreatTitle;
begin
end;

procedure TAppDocChildTerminalDurusIslemSecim.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateGridButtons;
  Self.ToolBar.Visible := false;
  Self.ReadOnly := true;
end;

destructor TAppDocChildTerminalDurusIslemSecim.Destroy;
begin

  inherited;
end;

procedure TAppDocChildTerminalDurusIslemSecim.DoRun;
var
  I: Integer;
begin
  with Self.Table.TableItems[0] do
  begin
    with Where do
    begin
      Clear;
      Add('EVRAKNO', wcEqual, TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.EvrakNo);
      AddOperator(woAnd);
      Add('OPERASYONNO', wcEqual, TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.OperasyonNo);
      AddOperator(woAnd);
      Add('KAYNAKKOD', wcEqual, TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.KaynakKod);
      AddOperator(woAnd);
      Add('DURUM', wcEqual, odFinished);
    end;
  end;
  Self.Run;

  if Self.Table.IsEmpty then
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp)
      .DocCustomProperties.AppForms.AppFormMessageDialog('Tamamlanmýþ herhangi bir iþlem bulunamadý!');
    Exit;
  end;

  for I:= 0 to Self.Form.ComponentCount - 1 do
  begin
    if Self.Form.Components[I].ClassType = TcxGrid then
      TcxGrid(Self.Form.Components[I]).Parent := FormTerminalSettings.Panel_Durus;
  end;
  FormTerminalSettings.PageControl.ActivePageIndex := 6;
  FormTerminalSettings.ShowModal;
end;

procedure TAppDocChildTerminalDurusIslemSecim.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;

procedure TAppDocChildTerminalDurusIslemSecim.OnGridButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.IslemNo :=
      Self.Table.FieldValues['ISLEMNO'];
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.DurusCommand := 3; // Start And Finish;

  TAppDOPUretimTerminalVeriGiris(DocApp)
      .ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalDurusStepOne.DockPanel.Name);
  FormTerminalSettings.Close;
end;

procedure TAppDocChildTerminalDurusIslemSecim.PrepareDefination;
begin
  Self.Table.TableItems.TableNames := VarArrayOf(['URTRKI']);
//  Self.Table.IndexFieldNames := 'EVRAKNO;ISMERKEZKOD;OPERASYONNO;KAYNAKKOD';
  with Self.Table.TableItems[0] do
  begin
    with Fields do begin
      Clear;
      Add('*');
    end;
    with Where do
    begin
      Clear;
      AddText('0 = 1');
    end;
  end;
  Self.Run;
//  Self.Table.DoInitializeRecord;
end;

end.
