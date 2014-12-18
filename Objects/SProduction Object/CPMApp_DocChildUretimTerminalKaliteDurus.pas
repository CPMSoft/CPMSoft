unit CPMApp_DocChildUretimTerminalKaliteDurus;

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
  TAppDocChildUretimTerminalKaliteDurusStepOne = class;
  TAppDocChildUretimTerminalKaliteDurusStepTwo = class;

  TAppDocChildUretimTerminalKaliteDurusStepOne = class(TAppDocChildSearchTable)
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

  TAppDocChildUretimTerminalKaliteDurusStepTwo = class(TAppDocChildSearchTable)
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
  protected
    procedure UpdateSonDurum(NewDurum, OldDurum: Integer);
    procedure CreateTitle;
    procedure CreateObjects;
    procedure AfterCreate; override;
  public
    procedure DoShowForm;
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
  CPMApp_DocFormUretimTerminalNumPad, Controls,
  CPMApp_DocChildUretimTerminalKaliteEvrakList;

{ TAppDocChildUretimTerminalKaliteDurusStepOne }

procedure TAppDocChildUretimTerminalKaliteDurusStepOne.AddDocument;
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalKaliteDurusStepTwo do
  begin
    with Table.TableItems[0].Where do
    begin
      Clear;
      Add('DURUSTIP', wcEqual, Self.Table.FieldValues['KOD']);
    end;
    Run;
  end;
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    ShowThisDockPanel(ChildUretimTerminalKaliteDurusStepTwo.DockPanel.Name);
  end;
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepOne.OnClickTitleBack(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalKaliteEvrakList.Run;
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalKaliteEvrakList.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepOne.OnClickTitleExit(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do ShowThisDockPanel(ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepOne.OnClickTitleRefresh(
  Sender: TObject);
begin
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepOne.OnGridButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  AddDocument;
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepOne.PrepareDefination;
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

procedure TAppDocChildUretimTerminalKaliteDurusStepOne.AfterCreate;
begin
  inherited;
  Self.Name := 'DocChildUretimTerminalKaliteDurusStepOne';
  Self.AppName := 'App' + Self.Name;
  Self.Caption := 'Kalite Kontrol Duruþu Seçimi Adým: 1';
  PrepareDefination;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepOne.CreateTitle;
begin
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.CreateTitlePanel(TAppDocFormUretimTerminalMenu(Self.Form), 'Adým 1: Duruþ Tipini Seçin', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepOne.CreateObjects;
begin
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepOne.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  CreateGridButtons;
  Self.ReadOnly := false;
  Self.ToolBar.Visible := false;
  Self.GridView.OptionsData.Editing := true;
end;

destructor TAppDocChildUretimTerminalKaliteDurusStepOne.Destroy;
begin

  inherited;
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepOne.DoRun;
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

procedure TAppDocChildUretimTerminalKaliteDurusStepOne.CreateGridButtons;
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

procedure TAppDocChildUretimTerminalKaliteDurusStepOne.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;

{ TAppDocChildUretimTerminalKaliteDurusStepTwo }

procedure TAppDocChildUretimTerminalKaliteDurusStepTwo.DurusBaslat;
var
  DurusKod: String;
  OpDurum: Smallint;
  IslemNo, IslemSiraNo: Smallint;
  aDurusAciklama: String;
  procedure AddRecord;
  begin
    OpDurum := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.OpDurum;
    IslemNo := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.OpIslemNo;
    IslemSiraNo := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.OpIslemSiraNo;
    //aDurusAciklama :=  AppInputBox('Açýklama', 'Duruþ Bilgisini Girin', '');

    DataApp.UretimRotaKaynakDurus.Table.Insert;
    DataApp.UretimRotaKaynakDurus.Table.DurusKod := DurusKod;
    DataApp.UretimRotaKaynakDurus.Table.Adet := 1;
    DataApp.UretimRotaKaynakDurus.Table.BasTarih := FDurusDate;
    DataApp.UretimRotaKaynakDurus.Table.BasTarihSaat := FDurusDate + FDurusTime;
    DataApp.UretimRotaKaynakDurus.Table.BitTarih := FDurusDate;
    DataApp.UretimRotaKaynakDurus.Table.BitTarihSaat := FDurusDate + FDurusTime;
    DataApp.UretimRotaKaynakDurus.Table.BirimSure := 0;
    DataApp.UretimRotaKaynakDurus.Table.Aciklama := FDurusAciklama;
    DataApp.UretimRotaKaynakDurus.Table.OperatorKod := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.SicilKod;
    DataApp.UretimRotaKaynakDurus.Table.FieldValues['ISLEMNO'] :=  IslemNo;
    DataApp.UretimRotaKaynakDurus.Table.FieldValues['ISLEMSIRANO'] := IslemSiraNo;
    DataApp.UretimRotaKaynakDurus.Table.Post;

    if OpDurum = odNone then
      UpdateSonDurum(odPaused, odNone)
    else if OpDurum = odReleased then
      UpdateSonDurum(odPaused, odReleased)
    else if OpDurum = odStarted then
      UpdateSonDurum(odPaused, odStarted);
  end;
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  DurusKod := ChildUretimTerminalKaliteDurusStepTwo.Table.FieldValues['DURUSKOD'];
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
      ChildUretimTerminalKaliteEvrakList.Run;
      ShowThisDockPanel(ChildUretimTerminalKaliteEvrakList.DockPanel.Name);
    end;
  end;
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepTwo.DurusSonlandir;
var
  SonOpDurum: Smallint;
  xOldIndex: String;
  DakikaFark: Integer;
begin
  xOldIndex := DataApp.UretimRotaKaynakDurus.TableClone.IndexFieldNames;
  DataApp.UretimRotaKaynakDurus.TableClone.IndexFieldNames := 'ISLEMNO;ISLEMSIRANO';

  with TAppDOPUretimTerminalVeriGiris(FDocApp) do
  begin
    DataApp.UretimRotaKaynakDurus.TableClone.SetRange([TerminalParametre.OpIslemNo, TerminalParametre.OpIslemSiraNo],
                                                      [TerminalParametre.OpIslemNo, TerminalParametre.OpIslemSiraNo]);

    if DataApp.UretimRotaKaynakDurus.TableClone.IsEmpty then
    begin
      AppShowMessage('Kayýtlý duruþ bilgisi bulunamadý. Kayýt Üretim Ýþ Emri Kartýndan elle deðiþtirilmiþ olabilir');
      Exit;
    end;
    DoShowForm;

    DataApp.UretimRotaKaynakDurus.TableClone.Edit;
    DataApp.UretimRotaKaynakDurus.TableClone.BitTarih := FDurusDate;
    DataApp.UretimRotaKaynakDurus.TableClone.BitTarihSaat := FDurusDate + FDurusTime;

    DakikaFark := MinutesBetween(Now(), DataApp.UretimRotaKaynakDurus.TableClone.BasTarihSaat);
    DataApp.UretimRotaKaynakDurus.TableClone.BirimSure := DakikaFark;
    DataApp.UretimRotaKaynakDurus.TableClone.Sure := DakikaFark;

//    DataApp.UretimRotaKaynakDurus.TableClone.Sure := DataApp.UretimRotaKaynakDurus.TableClone.BitTarihSaat - DataApp.UretimRotaKaynakDurus.TableClone.BasTarihSaat;
    DataApp.UretimRotaKaynakDurus.TableClone.Post;
    DataApp.UretimRotaKaynakDurus.TableClone.IndexFieldNames := xOldIndex;

    SonOpDurum := TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalKaliteEvrakList.Table.FieldValues['SONDURUM'];;

    if SonOpDurum = odNone then
      UpdateSonDurum(odNone, odPaused)
    else if SonOpDurum = odReleased then
      UpdateSonDurum(odReleased, odPaused)
    else if SonOpDurum = odStarted then
      UpdateSonDurum(odStarted, odPaused);

    if DoSaveDataObject then
    begin
      TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Duruþ Ýþlemi Sonlandýrýldý!');
      with TAppDOPUretimTerminalVeriGiris(DocApp) do
      begin
        ChildUretimTerminalKaliteEvrakList.Run;
        ShowThisDockPanel(ChildUretimTerminalKaliteEvrakList.DockPanel.Name);
      end;
    end;
  end;
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepTwo.OnClickTitleBack(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do begin
    ChildUretimTerminalKaliteDurusStepOne.Run;
    ShowThisDockPanel(ChildUretimTerminalKaliteDurusStepOne.DockPanel.Name)
  end;
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepTwo.OnClickTitleExit(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepTwo.OnClickTitleRefresh(
  Sender: TObject);
begin
  DataApp.DataObject.Cancel;
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepTwo.OnGridButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  DurusBaslat;
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepTwo.PrepareDefination;
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

procedure TAppDocChildUretimTerminalKaliteDurusStepTwo.UpdateSonDurum(
  NewDurum, OldDurum: Integer);
var
  SQLStr: String;
begin
  SQLStr := 'Update URTRKI Set DURUM = %s, SONDURUM = %s Where EVRAKNO = ''%s'' And URETIMNO = ''%s'' And URETIMSIRANO = %s And OPERASYONNO = %s AND KAYNAKKOD = ''%s'' And ISLEMNO = %s AND KULLANILAN = 1';
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    SQLStr := Format(SQLStr, [IntToStr(NewDurum), IntToStr(OldDurum), TerminalParametre.EvrakNo, TerminalParametre.UretimNo, IntToStr(TerminalParametre.UretimSiraNo), IntToStr(TerminalParametre.OperasyonNo), TerminalParametre.KaynakKod, IntToStr(TerminalParametre.IslemNo)]);
  end;
  DataApp.TableCommand.Execute(SQLStr);
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepTwo.AfterCreate;
begin
  inherited;
  Self.Name := 'DocChildUretimTerminalKaliteDurusStepTwo';
  Self.AppName := 'App' + Self.Name;
  Self.Caption := 'Kalite Kontrol Duruþ Seçimi Adým: 2';
  PrepareDefination;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepTwo.CreateTitle;
begin
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.CreateTitlePanel(TAppDocFormUretimTerminalMenu(Self.Form), 'Duruþ Kodunu Seçin', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

function TAppDocChildUretimTerminalKaliteDurusStepTwo.DoSaveDataObject: Boolean;
begin
  if DataApp.DataObject.Save then
  begin
    Result := true
  end
  else
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Hata oluþtu. Ýþlem iptal edilecek!');
    DataApp.DataObject.Cancel;
    Result := false;
  end;
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepTwo.DoShowForm;
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

procedure TAppDocChildUretimTerminalKaliteDurusStepTwo.CreateObjects;
begin
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepTwo.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  CreateGridButtons;
  Self.ToolBar.Visible := false;
  Self.GridView.OptionsData.Editing := true;
end;

destructor TAppDocChildUretimTerminalKaliteDurusStepTwo.Destroy;
begin

  inherited;
end;

procedure TAppDocChildUretimTerminalKaliteDurusStepTwo.CreateGridButtons;
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

procedure TAppDocChildUretimTerminalKaliteDurusStepTwo.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;



end.
