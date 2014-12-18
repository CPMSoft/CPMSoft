unit CPMApp_DocFormUretimTerminalMenu;

interface

uses
  IniFiles, ShellApi, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, cxGridCustomTableView,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  StdCtrls, cxButtons, ImgList, Buttons, ExtCtrls, dxSkinscxPCPainter,
  cxControls, cxPC, cxContainer, cxEdit, cxLabel, cxTextEdit, dxGDIPlusClasses,
  CPMApp_DocObjectModel,
  CPMApp_DocApp,
  cxDBLabel, dxDockControl, dxDockPanel, cxMemo, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ComCtrls, ToolWin, cxSpinEdit, cxTimeEdit, dxsbar,
  ActnList, XPStyleActnCtrls, ActnMan, cxRadioGroup, ActnPopup, jpeg;

type
  TAppDocFormUretimTerminalMenu = class(TForm)
    ButtonImageList: TcxImageList;
    PageControlMain: TcxPageControl;
    LoginMenu: TcxTabSheet;
    pnlLoginMenu: TPanel;
    Panel3: TPanel;
    btLogin: TcxButton;
    Information: TcxTabSheet;
    edSicilNo: TcxTextEdit;
    Label1: TLabel;
    cxLabel15: TcxLabel;
    cxTabSheet11: TcxTabSheet;
    pnlLoginBottom: TPanel;
    cxTabSheet1: TcxTabSheet;
    Panel21: TPanel;
    Panel7: TPanel;
    PanelReceteTuketim: TPanel;
    ToolBar3: TToolBar;
    Panel29: TPanel;
    ToolButtonReceteTuketimTitlePlansizTuketim: TToolButton;
    ToolButton19: TToolButton;
    ToolButtonReceteTuketimTitleMalzemeBilgileri: TToolButton;
    ToolButton21: TToolButton;
    ToolButtonReceteTuketimTitleTuketimleriTamamla: TToolButton;
    ToolBar2: TToolBar;
    ToolButtonReceteTuketimTitleKeyboard: TToolButton;
    ToolButtonReceteTuketimTitleRefresh: TToolButton;
    ToolButtonReceteTuketimTitleBack: TToolButton;
    ToolButtonReceteTuketimTitleExit: TToolButton;
    ToolBar1: TToolBar;
    ToolButtonReceteTuketimBaslat: TToolButton;
    ToolButtonReceteTuketimBitir: TToolButton;
    ToolButton11: TToolButton;
    ToolButtonReceteTuketimDurus: TToolButton;
    ToolButtonReceteTuketimHata: TToolButton;
    ToolButton7: TToolButton;
    ToolButtonReceteTuketimLotDegistir: TToolButton;
    ToolButtonReceteTuketimKalemKapat: TToolButton;
    ToolButtonReceteTuketimKalemSifirla: TToolButton;
    PanelKaynakIslem_Top: TPanel;
    ToolBar4: TToolBar;
    Panel30: TPanel;
    btKaynakIslemUretimDurumMenu: TToolButton;
    ToolButton2: TToolButton;
    btPanelKaynakIslem_AmbalajBilgileri: TToolButton;
    ToolButton4: TToolButton;
    btPanelKaynakIslem_DolumBilgileri: TToolButton;
    ToolBar5: TToolBar;
    ToolButton6: TToolButton;
    btPanelKaynakIslem_Back: TToolButton;
    btPanelKaynakIslem_Exit: TToolButton;
    ToolButton3: TToolButton;
    btPanelKaynakIslem_Settings: TToolButton;
    ToolButtonReceteTuketimBarcodeMalKod: TToolButton;
    ToolButton9: TToolButton;
    PanelKaliteKontrol_ReworkBottom: TPanel;
    btPanelKaynakIslem_DurusList: TToolButton;
    btPanelKaynakIslem_TuketimListesi: TToolButton;
    ToolButton18: TToolButton;
    ToolButtonReceteTuketimTitleTuketimListesi: TToolButton;
    ToolButton20: TToolButton;
    Panel_KaliteKontrol_Top: TPanel;
    Panel40: TPanel;
    ToolBar25: TToolBar;
    Panel_KaliteKontrol_TopCaption: TPanel;
    ToolButtonKaliteKontrol_BekleyenIslemler: TToolButton;
    ToolButton24: TToolButton;
    ToolButtonKaliteKontrol_OnaylanmisIslemler: TToolButton;
    ToolBar26: TToolBar;
    ToolButtonKaliteKontrol_TitleDurusList: TToolButton;
    ToolButton33: TToolButton;
    ToolButtonKaliteKontrol_TitleVirtualKeyboard: TToolButton;
    ToolButtonKaliteKontrol_TitleRefresh: TToolButton;
    ToolButtonKaliteKontrol_TitleBack: TToolButton;
    ToolButtonKaliteKontrol_TitleExit: TToolButton;
    ToolBar27: TToolBar;
    ToolButtonKaliteKontrol_Baslat: TToolButton;
    ToolButtonKaliteKontrol_Bitir: TToolButton;
    ToolButton42: TToolButton;
    ToolButton44: TToolButton;
    ToolButtonKaliteKontrol_DurusBelirt: TToolButton;
    ToolButtonKaliteKontrol_Rework: TToolButton;
    ToolBar20: TToolBar;
    ToolButtonKaliteKontrol_SonrakiAdim: TToolButton;
    ToolButton14: TToolButton;
    ToolButtonKaliteKontrol_KaydetVeTamamla: TToolButton;
    ToolBar21: TToolBar;
    cxTabSheet6: TcxTabSheet;
    PanelMalzemeBilgileri_Top: TPanel;
    ToolBar33: TToolBar;
    PanelReceteTuketim_Title: TPanel;
    ToolBar34: TToolBar;
    Panel28: TPanel;
    ToolBar35: TToolBar;
    PanelMalzemeBilgileri_btnTitleKaydet: TToolButton;
    ToolButton25: TToolButton;
    PanelMalzemeBilgileri_btnTitleBack: TToolButton;
    PanelMalzemeBilgileri_btnTitleExit: TToolButton;
    PanelTuketimListesi_Top: TPanel;
    ToolBar30: TToolBar;
    Panel18: TPanel;
    ToolButton8: TToolButton;
    PanelTuketimListesi_btnTitleMalzemeBilgileri: TToolButton;
    ToolBar31: TToolBar;
    PanelTuketimListesi_btnTitleVirtualKeyboard: TToolButton;
    PanelTuketimListesi_btnTitleRefresh: TToolButton;
    PanelTuketimListesi_btnTitleBack: TToolButton;
    PanelTuketimListesi_btnTitleExit: TToolButton;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButtonKaliteKontrol_UretimiTamamla: TToolButton;
    ToolButton12: TToolButton;
    ToolButtonKaliteKontrol_KalemiSifirla: TToolButton;
    ToolButtonReceteTuketimDateSettings: TToolButton;
    Panel15: TPanel;
    cxLabel1: TcxLabel;
    Panel39: TPanel;
    cxLabel5: TcxLabel;
    lbMalKod: TcxLabel;
    Panel41: TPanel;
    cxLabel8: TcxLabel;
    lbMalAd: TcxLabel;
    Panel42: TPanel;
    cxLabel6: TcxLabel;
    lbMiktar: TcxLabel;
    Panel19: TPanel;
    cxLabel16: TcxLabel;
    lbSeriNo: TcxLabel;
    Panel43: TPanel;
    cxTabSheet2: TcxTabSheet;
    Panel_Durus: TPanel;
    ToolBar8: TToolBar;
    Panel17: TPanel;
    ToolButton5: TToolButton;
    ToolButtonDurus_DurusBelirt: TToolButton;
    ToolBar9: TToolBar;
    ToolButtonDurus_VirtualKeyboard: TToolButton;
    ToolButtonDurus_Refresh: TToolButton;
    ToolButtonDurus_Back: TToolButton;
    ToolButtonDurus_Exit: TToolButton;
    btKaynakIslemUretimDurumSifirla: TToolButton;
    edtUseNumericPad: TcxButton;
    edtUseBarcode: TcxButton;
    cxTabSheet3: TcxTabSheet;
    PanelGlobal_TopMenu: TPanel;
    ToolBar6: TToolBar;
    PanelGlobal_TopMenu_Description: TPanel;
    ToolBar7: TToolBar;
    btTitleVirtualKeyboard: TToolButton;
    btTitleRefresh: TToolButton;
    btTitleBack: TToolButton;
    btTitleExit: TToolButton;
    Information_Barcode: TPanel;
    Panel_Barcode2: TPanel;
    edtBarcode2: TcxTextEdit;
    cxLabel10: TcxLabel;
    Panel_Barcode1: TPanel;
    edtBarcode1: TcxTextEdit;
    cxLabel11: TcxLabel;
    Information_MainPanel: TPanel;
    Panel2: TPanel;
    Information_LabelKaynak: TcxLabel;
    Panel10: TPanel;
    cxLabel18: TcxLabel;
    Panel11: TPanel;
    cxLabel19: TcxLabel;
    Panel12: TPanel;
    cxLabel20: TcxLabel;
    Panel13: TPanel;
    cxLabel21: TcxLabel;
    Panel5: TPanel;
    cxLabel2: TcxLabel;
    Panel6: TPanel;
    cxLabel3: TcxLabel;
    Panel9: TPanel;
    ToolButtonKaliteKontrol_EkDurusBelirt: TToolButton;
    ToolButtonKaliteKontrol_TitleNot: TToolButton;
    PanelKaynakIslem_ButtonNot: TToolButton;
    PanelGlobal_TopMenu_ButtonSave: TToolButton;
    procedure btLoginClick(Sender: TObject);
    procedure btExit2Click(Sender: TObject);
    procedure pnlMessage_btCloseClick(Sender: TObject);
    procedure btManualOutput_ExitClick(Sender: TObject);
    procedure btManualBaglanti_YeniEkleClick(Sender: TObject);
    procedure btKaynakListClick(Sender: TObject);
    procedure btKaliteKontrol_BaslatClick(Sender: TObject);
    procedure btKaliteKontrol_KabulClick(Sender: TObject);
    procedure btKaliteKontrol_YeniIslemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
//    procedure cxButton2Click(Sender: TObject);
    procedure btTitleVirtualKeyboardClick(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButtonReceteTuketimTitleKeyboardClick(Sender: TObject);
    procedure btPanelTarihSaat_ExitClick(Sender: TObject);
    procedure edSicilNoKeyPress(Sender: TObject; var Key: Char);
    procedure edtUseBarcodeClick(Sender: TObject);
    procedure edSicilNoClick(Sender: TObject);
    procedure edtUseNumericPadClick(Sender: TObject);
    procedure ToolButtonKaliteKontrol_BaslatClick(Sender: TObject);
    procedure ToolButtonKaliteKontrol_BitirClick(Sender: TObject);
    procedure ToolButtonKaliteKontrol_ReworkClick(Sender: TObject);
  private
    FDeviceType: String;
    FDocApp: TAppDocApp;
    FDocChild: TAppDocChild;
    // Button Event
    function GetOperatorKod(ATerminalKod, ASicilKod: String): String;
    procedure OpenWindowsVirtualKeyboard;
    procedure DoLogin;
    procedure SetLoginDeviceType(DeviceType: String);
  public
    FormParam: String;
    DurusForm_DurusTip: Integer;
    constructor Create(AOwner: TComponent); override;
    function GetMainControl: TWinControl;
    function GetDocChild: TAppDocChild;
    procedure SetDocChild(Value: TAppDocChild);
  published
    property DocChild: TAppDocChild read GetDocChild write SetDocChild;
    property DOP: TAppDocApp read FDocApp write FDocApp;
  end;

var
  AppDocFormUretimTerminalMenu: TAppDocFormUretimTerminalMenu;

implementation

{$R *.dfm}

uses
    CPMApp_SProductionConsts,
    CPMApp_DOPUretimTerminalVeriGiris,
    CPMApp_DocMainForm, CPMApp_Dialogs,
    CPMApp_DataObject;


procedure TAppDocFormUretimTerminalMenu.btExit2Click(Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(FDocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocFormUretimTerminalMenu.btKaynakListClick(Sender: TObject);
begin
//  DOP.DoFilterUretimSiparisHareket;
end;

procedure TAppDocFormUretimTerminalMenu.pnlMessage_btCloseClick(Sender: TObject);
begin
  FormParam := 'Exit'
end;

procedure TAppDocFormUretimTerminalMenu.btManualOutput_ExitClick(
  Sender: TObject);
begin
  Close;
end;

procedure TAppDocFormUretimTerminalMenu.btKaliteKontrol_BaslatClick(
  Sender: TObject);
begin
  FormParam := 'StartKaliteKontrol';
end;

procedure TAppDocFormUretimTerminalMenu.btKaliteKontrol_KabulClick(
  Sender: TObject);
begin
  FormParam := 'FinishKaliteKontrol';
end;

procedure TAppDocFormUretimTerminalMenu.btKaliteKontrol_YeniIslemClick(
  Sender: TObject);
begin
  FormParam := 'KaliteKontrolYenidenIslem';
end;

function TAppDocFormUretimTerminalMenu.GetOperatorKod(ATerminalKod, ASicilKod: String): String;
var aSQLStr: String;
begin
  aSQLStr := 'Select OPERATORKOD, PLANSIZYUKLEME From URTTEP Where TERMINALKOD = ''%s'' And SICILKOD = ''%s''';
  aSQLStr := Format(aSQLStr, [ATerminalKod, ASicilKod]);

  TAppDOPUretimTerminalVeriGiris(FDocApp).DataApp.TableCommand.OpenCommandText(aSQLStr);
  TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.CurrentOperatorKod := TAppDOPUretimTerminalVeriGiris(FDocApp).DataApp.TableCommand.FieldValues['OPERATORKOD'];
//  TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OperatorKod := TAppDOPUretimTerminalVeriGiris(FDocApp).DataApp.TableCommand.FieldValues['OPERATORKOD'];
  TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.PlansizYukleme := TAppDOPUretimTerminalVeriGiris(FDocApp).DataApp.TableCommand.FieldValues['PLANSIZYUKLEME'];

  aSQLStr := 'Select BARKODMALKODAYAR, BARKODSERINOAYAR, OTOMATIKTUKET, DURUMGOSTERTIP, OPERATORGOSTERTIP From URTTEB Where TERMINALKOD = ''%s''';
  aSQLStr := Format(aSQLStr, [ATerminalKod]);

  TAppDOPUretimTerminalVeriGiris(FDocApp).DataApp.TableCommand.OpenCommandText(aSQLStr);
  TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalBarcode.BarcodeMalKodAyar := TAppDOPUretimTerminalVeriGiris(FDocApp).DataApp.TableCommand.FieldValues['BARKODMALKODAYAR'];
  TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalBarcode.BarcodeSeriNoAyar := TAppDOPUretimTerminalVeriGiris(FDocApp).DataApp.TableCommand.FieldValues['BARKODSERINOAYAR'];
  TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpOtomatikTuket := TAppDOPUretimTerminalVeriGiris(FDocApp).DataApp.TableCommand.FieldValues['OTOMATIKTUKET'];
  TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.ParamDurumGosterTip := TAppDOPUretimTerminalVeriGiris(FDocApp).DataApp.TableCommand.FieldValues['DURUMGOSTERTIP'];
  TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.ParamOperatorGosterTip := TAppDOPUretimTerminalVeriGiris(FDocApp).DataApp.TableCommand.FieldValues['OPERATORGOSTERTIP'];

  Result := TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.CurrentOperatorKod;
end;

procedure TAppDocFormUretimTerminalMenu.btLoginClick(Sender: TObject);
begin
  DoLogin;
end;

procedure TAppDocFormUretimTerminalMenu.SetLoginDeviceType(DeviceType: String);
begin
  FDeviceType := DeviceType;
  with TIniFile.Create(ExtractFilePath(Application.ExeName) + '\CPMAppXPServer.ini') do
  begin
    WriteString('UretimTerminalGlobalSettings', 'LoginDeviceType', FDeviceType);
  end;
end;

procedure TAppDocFormUretimTerminalMenu.DoLogin;
begin
 with TAppDOPUretimTerminalVeriGiris(FDocApp) do begin
    if TerminalParametre.TerminalKod = '' then
    begin
      AppShowMessage('Terminal Kodu Okunamadý!' + #13+ 'Lütfen Terminal Ayarlarýný Kontrol Edin.');
      Exit;
    end;

    TerminalParametre.SicilKod := edSicilNo.Text;
    if TerminalParametre.SicilKod = '' then begin
      DocCustomProperties.AppForms.AppFormMessageDialog('Sicil kodunuzu girmeden devam edemezsiniz!');
      Exit;
    end else
      DoLoadUserInfo(TerminalParametre.TerminalKod, TerminalParametre.SicilKod);

    if ChildUretimKaynakList.Table.IsEmpty then begin
      DocCustomProperties.AppForms.AppFormMessageDialog('Bu terminale kayýtlý deðilsiniz!');
      Exit;
    end
    else
      DoLoadKaynakList(TerminalParametre.TerminalKod, TerminalParametre.SicilKod);

    if ChildUretimKaynakList.Table.IsEmpty then begin
      DocCustomProperties.AppForms.AppFormMessageDialog('Bekleyen iþ emri bulunmuyor!');
      Exit;
    end;

    if GetOperatorKod(TerminalParametre.TerminalKod, TerminalParametre.SicilKod) = '' then begin
      DocCustomProperties.AppForms.AppFormMessageDialog('Operatör Kodu Tanýmlanmamýþ!');
      Exit;
    end;

    if TerminalParametre.CurrentOperatorKod = 'KAL' then
    begin
      ChildUretimTerminalKaliteEvrakList.Run;
//      ChildUretimTerminalKaliteEvrakList.DoRun;
//      if ChildUretimTerminalKaliteEvrakList.Table.IsEmpty then
//      begin
//        DocCustomProperties.AppForms.AppFormMessageDialog('Bekleyen kalite kontrol iþ emri bulunmuyor!');
//        exit;
//      end;
      ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalKaliteEvrakList.DockPanel.Name);
    end
    else
    begin
      if ChildUretimKaynakList.Table.RecordCount = 1 then
      begin
        ChildUretimKaynakList.Table.First;
        TerminalParametre.KaynakKod := ChildUretimKaynakList.Table.FieldValues['KAYNAKKOD'];

        if LoadManufactureOrderList(TerminalParametre.KaynakKod) then
          DoLoadKaynakEvrakList;
      end
      else begin
        ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimKaynakList.DockPanel.Name);
        ChildUretimKaynakList.ShowChild(True);
      end;
    end;
  end;
end;


procedure TAppDocFormUretimTerminalMenu.OpenWindowsVirtualKeyboard;
var
  FPath: PChar;
begin
  FPath := 'c:\program files\common files\microsoft shared\ink\tabtip.exe';
  if FileExists(FPath) then
    ShellExecute(0, 'OPEN', PChar(FPath), '', '', 1);
end;


//procedure TAppDocFormUretimTerminalMenu.cxButton2Click(Sender: TObject);
//begin
//  OpenWindowsVirtualKeyboard;
//end;

procedure TAppDocFormUretimTerminalMenu.btManualBaglanti_YeniEkleClick(Sender: TObject);
begin
  FormParam := 'OpenManualBaglantiStokKart';
end;

procedure TAppDocFormUretimTerminalMenu.edSicilNoClick(Sender: TObject);
begin
  if FDeviceType = 'Keyboard' then
    edSicilNo.Text := FloatToStr(TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormNumericPad('Sicil Numaranýzý Girin!', '', true, true));
end;

procedure TAppDocFormUretimTerminalMenu.edSicilNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    DoLogin;
end;

procedure TAppDocFormUretimTerminalMenu.edtUseBarcodeClick(Sender: TObject);
begin
  SetLoginDeviceType('Barcode');
end;

procedure TAppDocFormUretimTerminalMenu.edtUseNumericPadClick(Sender: TObject);
begin
  SetLoginDeviceType('Keyboard');
end;

procedure TAppDocFormUretimTerminalMenu.FormCreate(Sender: TObject);
var
  vCanReset: Boolean;
  vCanChangeDate: Boolean;
begin
  with TIniFile.Create(ExtractFilePath(Application.ExeName) + '\CPMAppXPServer.ini') do
  begin
    vCanChangeDate := ReadBool('UretimTerminalDateSettings', 'CanChangeDate', true);

    vCanReset := ReadBool('UretimTerminalGlobalSettings', 'CanReset', false);
    FDeviceType := ReadString('UretimTerminalGlobalSettings', 'LoginDeviceType', 'Keyboard');
  end;

  btKaynakIslemUretimDurumSifirla.Enabled := vCanReset;
  btPanelKaynakIslem_Settings.Enabled := vCanChangeDate;
  ToolButtonReceteTuketimDateSettings.Enabled := vCanChangeDate;
end;

constructor TAppDocFormUretimTerminalMenu.Create(AOwner: TComponent);
begin
  inherited;

end;

function TAppDocFormUretimTerminalMenu.GetDocChild: TAppDocChild;
begin
  Result := FDocChild;
end;

function TAppDocFormUretimTerminalMenu.GetMainControl: TWinControl;
begin
  Result := Self;
end;

procedure TAppDocFormUretimTerminalMenu.SetDocChild(Value: TAppDocChild);
begin
  FDocChild := Value;
end;

procedure TAppDocFormUretimTerminalMenu.btTitleVirtualKeyboardClick(Sender: TObject);
begin
  OpenWindowsVirtualKeyboard;
end;

procedure TAppDocFormUretimTerminalMenu.btPanelTarihSaat_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TAppDocFormUretimTerminalMenu.ToolButton6Click(Sender: TObject);
begin
  OpenWindowsVirtualKeyboard;
end;

procedure TAppDocFormUretimTerminalMenu.ToolButtonKaliteKontrol_BaslatClick(
  Sender: TObject);
begin
  FormParam := 'StartKaliteKontrol';
end;

procedure TAppDocFormUretimTerminalMenu.ToolButtonKaliteKontrol_BitirClick(
  Sender: TObject);
begin
  FormParam := 'FinishKaliteKontrol';
end;

procedure TAppDocFormUretimTerminalMenu.ToolButtonKaliteKontrol_ReworkClick(
  Sender: TObject);
begin
  FormParam := 'KaliteKontrolYenidenIslem';
end;

procedure TAppDocFormUretimTerminalMenu.ToolButtonReceteTuketimTitleKeyboardClick(
  Sender: TObject);
begin
  OpenWindowsVirtualKeyboard;
end;

end.
