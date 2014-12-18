unit CPMApp_DocChildUretimTerminalKaliteEvrakList;

interface

uses
  Windows, SysUtils, ComCtrls, ComObj, Controls, Classes,
  dxDockControl,
  cxGridCustomTableView, cxGridDBTableView, cxGraphics,
  CPMApp_DataObject, CPMApp_DataObjectDB,
  CPMApp_DocApp,
  CPMApp_Storage,
  CPMApp_DocObjectModel,
  CPMApp_DocChildGrid,
  CPMApp_DocChildSearchTable,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_DocChildUretimTerminalProperties,
  CPMApp_DAPCustomUretimKart;

type
  TAppDocChildUretimTerminalKaliteEvrakList = class;

  TParamSelf = class
  private
    fAppName: Smallint;
    fOpDurum: Smallint;
  public
    property OpDurum: Smallint read fOpDurum write fOpDurum;
    property AppName: Smallint read fAppName write fAppName;
  end;

  TAppDocChildUretimTerminalKaliteEvrakList = class(TAppDocChildSearchTable)
  private
    FDataApp: TAppDAPCustomUretimKart;
    FDocApp: TAppDocApp;
    CIslemDurum: TcxGridDBColumn;
  private
    FParamSelf: TParamSelf;
    FormTerminalMenu: TAppDocFormUretimTerminalMenu;
    procedure OnClickTitleExit(Sender: TObject);
    procedure GridButtonOnClick(Sender: TObject; AButtonIndex: Integer);
    procedure OnClickShowBekleyenler(Sender: TObject);
    procedure OnClickShowBitenler(Sender: TObject);
    procedure OnClickUretimiTamamla(Sender: TObject);
    procedure OnClickNot(Sender: TObject);
  private
    procedure OnClickBaslat(Sender: TObject);
    procedure OnClickBitir(Sender: TObject);
    procedure OnClickKalemSifirla(Sender: TObject);
    procedure OnClickRework(Sender: TObject);
    procedure OnClickDurus(Sender: TObject);
    procedure OnClickEkDurus(Sender: TObject);
  private
    procedure DoBaslat;
    procedure DoBitir;
    procedure DoKalemSifirla;
    procedure DoRework;
  private
    procedure CreateGridButtons;
    procedure PrepareDefination;
    procedure CreatePanels;
  private
    procedure DoAfterScroll(Table: TAppCustomTable);
    procedure AfterScroll;
  private
    procedure CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure DisableAllButtons;
    procedure DockPanelOnActivate(Sender: TdxCustomDockControl;
      Active: Boolean);
    procedure OnGridCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure DoShowBitenler;
    procedure DoUretimiTamamla;
    procedure OnClickEkDurusBelirt(Sender: TObject);
  protected
    procedure CreateObjects;
    procedure AfterCreate; override;
  public
    procedure DoRun;
  public
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  public
  published
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
    property ParamSelf: TParamSelf read FParamSelf write FParamSelf;

  end;

Const
  { Ýþlem Tipleri }
  itHammaddeTuketim: Smallint = 1;
  itKalite: Smallint = 2;

implementation

uses
  DateUtils,
  DB, Forms,
  Variants, Graphics,
  CPMApp_Images,
  CPMApp_Dialogs,
  CPMApp_TableItems,
  CPMApp_BOMConsts,
  CPMApp_SProductionConsts,
  CPMApp_ToolBarHelper,
  CPMApp_DOPUretimTerminalVeriGiris,

  CPMApp_DocFormUretimTerminalNumPad, CPMApp_TableStokSystem;

{ TAppDocChildUretimTerminalKaliteEvrakList }

procedure TAppDocChildUretimTerminalKaliteEvrakList.DoKalemSifirla;
begin
  DataApp.UretimRotaKaynakOperasyon.Table.Delete;
  DataApp.UretimRotaKaynakIslem.Table.Edit;
  DataApp.UretimRotaKaynakIslem.Table.Durum := odReleased;
  DataApp.UretimRotaKaynakIslem.Table.Post;
  DataApp.DataObject.Save;
  TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Sýfýrlanma iþlemi tamamlandý');
  Self.Run;
End;

procedure TAppDocChildUretimTerminalKaliteEvrakList.GridButtonOnClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.EvrakNo := Self.Table.FieldValues['EVRAKNO'];
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.UretimNo := Self.Table.FieldValues['URETIMNO'];
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.UretimSiraNo := Self.Table.FieldValues['URETIMSIRANO'];
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.OperasyonNo := Self.Table.FieldValues['OPERASYONNO'];
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.KaynakKod := Self.Table.FieldValues['KAYNAKKOD'];

  if Self.Table.FieldValues['DURUM'] = odFinished then
    Exit;
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.ClassKaliteKontrol.DoOpenDocument;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.AfterCreate;
begin
  inherited;
  PrepareDefination;
  CreateObjects;
  Self.DockPanel.OnActivate := DockPanelOnActivate;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.CreateObjects;
begin
  FParamSelf := TParamSelf.Create;
  FormTerminalMenu := TAppDocFormUretimTerminalMenu.Create(Self.Form);
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.CreatePanels;
begin

  TAppDocFormUretimTerminalMenu(FormTerminalMenu).Panel_KaliteKontrol_Top.Parent := Self.Form;
  TAppDocFormUretimTerminalMenu(FormTerminalMenu).Panel_KaliteKontrol_TopCaption.Caption := 'Bekleyen Kalite Kontrol Evrak Listesi';

  TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_Baslat.OnClick := OnClickBaslat;
  TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_Bitir.OnClick := OnClickBitir;
  TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_KalemiSifirla.OnClick := OnClickKalemSifirla;
  TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_Rework.OnClick := OnClickRework;
  TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_DurusBelirt.OnClick := OnClickDurus;

  TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_EkDurusBelirt.OnClick := OnClickEkDurus;

  TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_TitleExit.OnClick := OnClickTitleExit;
  TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_TitleBack.OnClick := OnClickTitleExit;

  TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_BekleyenIslemler.OnClick := OnClickShowBekleyenler;
  TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_OnaylanmisIslemler.OnClick := OnClickShowBitenler;
  TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_UretimiTamamla.OnClick := OnClickUretimiTamamla;
  TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_TitleNot.OnClick := OnClickNot;

//  TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_TitleDurusList.OnClick := OnClickEkDurusBelirt;


end;
procedure TAppDocChildUretimTerminalKaliteEvrakList.OnClickEkDurusBelirt(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    ChildUretimTerminalReportDurusList.DoRun;
    ShowThisDockPanel(ChildUretimTerminalReportDurusList.DockPanel.Name);
  end;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.AfterScroll;
var
  FToolButton: TToolButton;
begin
  DisableAllButtons;

  if Self.Table.IsEmpty then
    Exit;

  ParamSelf.OpDurum := Self.Table.FieldByName('DURUM').AsInteger;

  if ParamSelf.OpDurum In [odNone, odReleased] then
  begin
    FToolButton := TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_Baslat;
    if FToolButton <> nil then
      TToolButton(FToolButton).Enabled := true;
  end;

  if ParamSelf.OpDurum = odStarted then
  begin
    FToolButton := TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_Bitir;
    if FToolButton <> nil then
      TToolButton(FToolButton).Enabled := true;

    FToolButton := TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_Rework;
    if FToolButton <> nil then
      TToolButton(FToolButton).Enabled := true;
  end;

  if ParamSelf.OpDurum In [odNone, odStarted, odReleased] then
  begin
    FToolButton := TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_DurusBelirt;
    if FToolButton <> nil then
    begin
      TToolButton(FToolButton).Caption := 'Duruþ Bildir';
      TToolButton(FToolButton).Enabled := true;
    end;
  end;

  if ParamSelf.OpDurum In [odPaused] then
  begin
    FToolButton := TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_DurusBelirt;
    if FToolButton <> nil then
    begin
      TToolButton(FToolButton).Caption := 'Duruþ Sonlandýr';
      TToolButton(FToolButton).Enabled := true;
    end;
  end;

  if ParamSelf.OpDurum In [odFinished] then
  begin
    FToolButton := TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_DurusBelirt;
    if FToolButton <> nil then
      TToolButton(FToolButton).Enabled := false;

    FToolButton := TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_Baslat;
    if FToolButton <> nil then
      TToolButton(FToolButton).Enabled := false;

    FToolButton := TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_Bitir;
    if FToolButton <> nil then
      TToolButton(FToolButton).Enabled := false;

    FToolButton := TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_KalemiSifirla;
    if FToolButton <> nil then
      TToolButton(FToolButton).Enabled := true;

    FToolButton := TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_Rework;
    if FToolButton <> nil then
      TToolButton(FToolButton).Enabled := false;
  end;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.DisableAllButtons;
var
  FToolButton: TToolButton;
begin
  FToolButton := TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_Baslat;
  if FToolButton <> nil then
    TToolButton(FToolButton).Enabled := false;

  FToolButton := TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_Bitir;
  if FToolButton <> nil then
    TToolButton(FToolButton).Enabled := false;

  FToolButton := TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_DurusBelirt;
  if FToolButton <> nil then
  begin
    TToolButton(FToolButton).Enabled := false;
    TToolButton(FToolButton).Caption := 'Duruþ Bildir';
  end;

  FToolButton := TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_KalemiSifirla;
  if FToolButton <> nil then
    TToolButton(FToolButton).Enabled := false;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.DoRun;
begin
  with Self.Table.TableItems[0] do begin
    with Where do begin
      Clear;
      Add('DURUM', wcInList, VarArrayOf([odReleased, odStarted, odPaused])).DataType := ftInteger;
      AddOperator(woAnd);
      Add('ISLEMTIP', wcEqual, itKalite).DataType := ftInteger;
    end;
  end;
  Self.Run;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.DoShowBitenler;
begin
  with Self.Table.TableItems[0] do begin
    with Where do begin
      Clear;
      Add('DURUM', wcInList, odFinished).DataType := ftInteger;
      AddOperator(woAnd);
      Add('ISLEMTIP', wcEqual, itKalite).DataType := ftInteger;
    end;
  end;
  Self.Run;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.DoAfterScroll(
  Table: TAppCustomTable);
begin
  AfterScroll;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.DockPanelOnActivate(
  Sender: TdxCustomDockControl; Active: Boolean);
begin
  if Active then
  begin
    Self.Table.AfterScroll := DoAfterScroll;
    Self.GridView.OnCellClick := OnGridCellClick;
  end
  else
  begin
    Self.Table.AfterScroll := nil;
    Self.GridView.OnCellClick := nil;
  end;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.OnGridCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  AfterScroll;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.DoBaslat;
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.ActiveChildName := '';
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.ClassKaliteKontrol.DoOpenDocument;

  TAppDOPUretimTerminalVeriGiris(DocApp).DoStartOperasyon;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.DoBitir;

  procedure SendKaliteKontrolFormEmail;
  var
    email_TO, email_CC: String;
    MailBody: String;
    AMalKod, AMalAd, ASeriNo: String;
    Outlook: OleVariant;
    vMailItem: variant;
  begin
    AMalKod := DataApp.UretimKart.Table.MamulKod;
    AMalAd := DataApp.UretimKart.Table.MamulAd;
    ASeriNo := DataApp.UretimKart.Table.MamulSeriNo;

	  email_TO := 'KaliteKontrolGrubu@kimteks.com.tr;SevkiyatGrubu@kimteks.com.tr;';
	  email_CC := 'merve.parlar@kimteks.com.tr;';
//	  email_TO := 'senay.gurbuz@kimteks.com.tr;nail.arslan@kimteks.com.tr;ferit.topal@kimteks.com.tr;';
//	  email_CC := 'eyup.tunc@kimteks.com.tr;merve.parlar@kimteks.com.tr;melike.bilir@kimteks.com.tr;seckin.cehiz@kimteks.com.tr;erdinc.yandik@kimteks.com.tr;';

    MailBody := '<html>';
    MailBody := MailBody + '<b><span style=''font-size:14.0pt''>Analiz Sertifikasý sistemde tanýmlý olmadýðý için Evrak Üretim sayfasýna giriþ yapýlamýyor.</span></b><br><br>';
    MailBody := MailBody + '<b><span style=''font-size:16.0pt''>Mal Kodu : ' + AMalKod + '<br>Mal Adý : ' + AMalAd + '<br>Seri No : ' + ASeriNo + '</span></b><br><br>';
    MailBody := MailBody + '</html>';

    Outlook := CreateOleObject('Outlook.Application');
    vMailItem := Outlook.CreateItem(0);

    vMailItem.Subject := 'Analiz Sertifikasý - Seri No : ' + ASeriNo;

    vMailItem.To := email_TO;
    vMailItem.Cc := email_CC;

    vMailItem.htmlbody := MailBody;
    vMailItem.Display();
  end;

  function DoCheckKaliteKontrolAnaliz: Boolean; // Geçici olarak eklendi. Kalite Kontrol modülü yazýldýðýnda kaldýrýlacak.
  var SQLStr: String;
      AMalKod, ASeriNo: String;
  begin
    AMalKod := DataApp.UretimKart.Table.MamulKod;
    ASeriNo := DataApp.UretimKart.Table.MamulSeriNo;

    SQLStr := 'SELECT dbo.FN_KALITEANALIZDURUM(''%s'', ''%s'') AS SONUC';
    SQLStr := Format(SQLStr, [AMalKod, ASeriNo]);

    DataApp.TableCommand.OpenCommandText(SQLStr);
    if DataApp.TableCommand.FieldValues['SONUC'] = 1 then
      Result := true
    else
      Result := false;
  end;
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.ClassKaliteKontrol.DoOpenDocument;
  if DoCheckKaliteKontrolAnaliz then
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DoFinishOperasyon;
  end else
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Kalite Kontrol Sonuçlarý Girilmemiþtir!');
    if TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.Firma = 'Kimteks' then
      SendKaliteKontrolFormEmail;
  end;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.DoRework;
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.ClassKaliteKontrol.DoOpenDocument;

  with TAppDOPUretimTerminalVeriGiris(DocApp) do begin
    ChildUretimTerminalKaliteYenidenIslemList.DoStart(
      TerminalParametre.EvrakNo, TerminalParametre.UretimNo, TerminalParametre.UretimSiraNo, TerminalParametre.OperasyonNo, TerminalParametre.KaynakKod, TerminalParametre.IslemNo);
    if ChildUretimTerminalKaliteYenidenIslemList.Table.IsEmpty then
      DocCustomProperties.AppForms.AppFormMessageDialog('Ýþlem Listesi bulunamadý!')
    else
    begin
      ChildUretimTerminalKaliteYenidenIslemSecim.TableCustom.EmptyTable;
      ShowThisDockPanel(ChildUretimTerminalKaliteYenidenIslemSecim.DockPanel.Name);
      ShowThisDockPanel(ChildUretimTerminalKaliteYenidenIslemList.DockPanel.Name, true);
    end;
  end;
end;
procedure TAppDocChildUretimTerminalKaliteEvrakList.CreateGridButtons;
  procedure CreateButtons;
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppChild.CreateGridButton(Self.GridView, GridButtonOnClick);
  end;
begin
//  Self.Table.TableItems[0].Where.Clear;
//  Self.Table.TableItems[0].Where.AddText('0 = 1');
//  Self.ReadOnly := false;
  Self.Run;
//  CreateButtons;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateGridButtons;
  CreatePanels;
  Self.GridView.OnCustomDrawCell := CustomDrawCell;
  Self.GridView.OptionsData.Editing := true;
  Self.ToolBar.Visible := false;
end;

destructor TAppDocChildUretimTerminalKaliteEvrakList.Destroy;
begin
  inherited;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.OnClickBaslat(
  Sender: TObject);
begin
  DoBaslat;
  Self.Run;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.OnClickBitir(
  Sender: TObject);
begin
  DoBitir;
  Self.Run;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.OnClickDurus(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.ClassKaliteKontrol.DoOpenDocument;
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.IslemNo :=
    DataApp.UretimRotaKaynakOperasyon.Table.IslemNo;
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.DurusCommand := 1;

  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.ReturnForm := 'KaliteKontrol';
  if TAppDocFormUretimTerminalMenu(FormTerminalMenu).ToolButtonKaliteKontrol_DurusBelirt.Caption = 'Duruþ Bildir' then
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalKaliteDurusStepOne.DoRun;
    TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalKaliteDurusStepOne.DockPanel.Name)
  end
  else
    TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalKaliteDurusStepTwo.DurusSonlandir;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.OnClickEkDurus(
  Sender: TObject);
begin
  if (Self.Table.FieldValues['DURUM'] = odReleased) then
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp)
        .DocCustomProperties.AppForms.AppFormMessageDialog('Baþlamamýþ bir iþlem üzerinde ek duruþ belirtemezsiniz!');
    Exit;
  end;

  if (Self.Table.FieldValues['DURUM'] = odPaused) then
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp)
        .DocCustomProperties.AppForms.AppFormMessageDialog('Zaten durdurulmuþ bir iþlem üzerinde ek duruþ belirtemezsiniz!');
    Exit;
  end;

  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.ClassKaliteKontrol.DoOpenDocument;

  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.IslemNo :=
      Self.Table.FieldValues['ISLEMNO'];
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.DurusCommand := 3; // Start And Finish;
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.DurusBilgileri.ReturnForm := 'KaliteKontrol';

  TAppDOPUretimTerminalVeriGiris(DocApp)
      .ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalDurusStepOne.DockPanel.Name);
end;
procedure TAppDocChildUretimTerminalKaliteEvrakList.OnClickKalemSifirla(
  Sender: TObject);
begin
  DoKalemSifirla;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.OnClickRework(
  Sender: TObject);
begin
  DoRework;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.OnClickShowBekleyenler(
  Sender: TObject);
begin
  TAppDocFormUretimTerminalMenu(FormTerminalMenu).Panel_KaliteKontrol_TopCaption.Caption := 'Bekleyen Kalite Kontrol Evrak Listesi';
  DoRun;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.OnClickShowBitenler(
  Sender: TObject);
begin
  TAppDocFormUretimTerminalMenu(FormTerminalMenu).Panel_KaliteKontrol_TopCaption.Caption := 'Onaylanan Kalite Kontrol Evrak Listesi';
  DoShowBitenler;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.OnClickTitleExit(Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.DoUretimiTamamla;
var
  FUretimDurumDegistir_UretimDurum: Integer;
  FUretimDurumDegistir_Miktar: Double;
  FUretimDurumDegistir_FireMiktar: Double;
  FUretimDurumDegistir_Tarih: TDate;
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.ClassKaliteKontrol.DoOpenDocument;

  if Self.Table.IsEmpty then
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Herhangi bir kayýt bulunamadý. Lütfen ''Onaylanmýþ Ýþlemler'' bölümünü kontrol edin!');
    Exit;
  end;

  if Self.Table.FieldValues['DURUM'] <> odFinished then
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Tamamlanmamýþ iþ emrinde üretimi tamamlayamazsýnýz!');
    Exit;
  end;

  FUretimDurumDegistir_UretimDurum := Integer(udFinished);
  FUretimDurumDegistir_Miktar := DataApp.UretimKart.Table.OpMiktar;
  FUretimDurumDegistir_FireMiktar := 0;
  FUretimDurumDegistir_Tarih := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.EvrakUretimTarih;

  with TAppDOPUretimTerminalVeriGiris(FDocApp) do
  begin
    if DataApp.DataControllerUretimKart.UretimDurumDegistir(TAppUretimDurum(FUretimDurumDegistir_UretimDurum), FUretimDurumDegistir_Tarih, FUretimDurumDegistir_Miktar, FUretimDurumDegistir_FireMiktar) then
    begin
      if DataApp.DataObject.Save then
        DocCustomProperties.AppForms.AppFormMessageDialog('Üretim Tamamlandý!')
      else
      begin
        DataApp.DataObject.Cancel;
        DocCustomProperties.AppForms.AppFormMessageDialog('Üretim Durumu deðiþtirilirken hata oluþtu. Lütfen tekrar deneyiniz!');
      end;
      DoShowBitenler;
    end;
  end;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.OnClickUretimiTamamla(
  Sender: TObject);
begin
  DoUretimiTamamla;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.OnClickNot(Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    TerminalParametre.NotSecim := 'Kalite';
    ShowThisDockPanel(ChildUretimRotaKaynakNot.DockPanel.Name);
  end;
end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.PrepareDefination;
begin
  Self.Name := 'ChildUretimTerminalKaliteIslem';
  Self.Caption := 'Kalite Evrak List';
  Self.PipelineName := 'ppKaliteIslem';
  Self.Table.TableItems.TableNames := VarArrayOf(['URTRKI', 'URTKRT', 'STKKRT', 'URTKYN', 'URTROK']);
  Self.Table.TableItems.TableCaptions := VarArrayOf(['Üretim Kart Ýþlem', 'Üretim Kart', 'Stok Kart', 'Üretim Kart Kaynak', 'Üretim Kart Rota Kaynak']);
  Self.Table.IndexFieldNames := 'KAYNAKKOD';
  Self.Table.TableItems.OrderBy.Add('URETIMSN', otAsc, Self.Table.TableItems[1]);

  with Self.Table.TableItems[0] do begin
    with Fields do
    begin
      Clear;
      Add('*');
      AddExpression('CONVERT(VARCHAR(30), DATEADD(MINUTE,(dbo.FNAPP_URT_KAYNAKISLEMSURE(URTRKI.KAYNAKKOD, URTRKI.MAMULKOD, URTRKI.ISLEMNO, URTROK.MIKTAR)), ''1900-01-01''), 108)', '__STANDARTSURE');
      AddExpression('CONVERT(VARCHAR(30), DATEADD(MINUTE, (DATEDIFF(minute, URTRKI.BASTARIHSAAT, URTRKI.BITTARIHSAAT)), ''1900-01-01''), 108)', '__GERCEKLESENSURE');
    end;
    with Where do begin
      Clear;
      Add('DURUM', wcInList, VarArrayOf([odReleased, odStarted])).DataType := ftInteger;
      AddOperator(woAnd);
      Add('ISLEMTIP', wcEqual, itKalite).DataType := ftInteger;
    end;
  end;

  with Self.Table.TableItems[1] do begin
    with Fields do begin
      Clear;
      Add('URETIMSN');
      Add('URETIMDURUM');
      Add('VERSIYONNO');
      Add('MAMULSERINO');
      Add('MAMULSERINO2');
    end;
    with Where do begin
      Clear;
      Add('URETIMDURUM', wcInList, VarArrayOf([udReleased])).DataType := ftInteger;
    end;
    with Join do begin
      Add('SIRKETNO', 'SIRKETNO');
      Add('EVRAKNO', 'EVRAKNO');
      Add('EVRAKTIP', 'EVRAKTIP');
    end;
  end;

  with Self.Table.TableItems[2] do begin
    with Fields do begin
      Clear;
      Add('MALAD')
    end;
    with Join do begin
      Add('SIRKETNO', 'SIRKETNO');
      Add('MALKOD', 'MAMULKOD');
    end;
  end;

  with Self.Table.TableItems[3] do begin
    with Fields do begin
      Clear;
      Add('KAYNAKAD')
    end;
    with Join do begin
      Add('KAYNAKKOD', 'KAYNAKKOD');
    end;
  end;

  with Self.Table.TableItems[4] do begin
    with Where do begin
      Clear;
//      Add('OPDURUM', wcInList, VarArrayOf([odReleased, odStarted, odPaused])).DataType := ftInteger;
//      AddOperator(woAnd);
      Add('KULLANILAN', wcEqual, 1).DataType := ftInteger;
    end;
    with Join do begin
      Clear;
      Add('EVRAKNO', 'EVRAKNO');
      Add('URETIMNO', 'URETIMNO');
      Add('URETIMSIRANO', 'URETIMSIRANO');
      Add('OPERASYONNO', 'OPERASYONNO');
      Add('KAYNAKKOD', 'KAYNAKKOD');
    end;
  end;

end;

procedure TAppDocChildUretimTerminalKaliteEvrakList.CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  CIslemDurum := GridView.GetColumnByFieldName('DURUM');

  if (AViewInfo.GridRecord.Values[CIslemDurum.Index] = odReleased) then
    ACanvas.Brush.Color := RGB(255, 255, 198);

  if (AViewInfo.GridRecord.Values[CIslemDurum.Index] = odStarted) then
    ACanvas.Brush.Color := RGB(255, 172, 132);

  if (AViewInfo.GridRecord.Values[CIslemDurum.Index] = odFinished) then
    ACanvas.Brush.Color := RGB(223, 254, 222);

  if (AViewInfo.GridRecord.Values[CIslemDurum.Index] = odPaused) then
    ACanvas.Brush.Color := clRed;

end;


end.
