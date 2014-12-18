unit CPMApp_DocFormUretimTerminalSettings;

interface

uses
  CPMApp_DocApp,

  Windows, Messages, IniFiles, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxRadioGroup, ExtCtrls, cxPC, cxSpinEdit,
  cxTimeEdit, cxLabel, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxGDIPlusClasses, ImgList, ComCtrls,
  ToolWin, cxGroupBox;

type
  TAppDocFormUretimTerminalSettings = class(TForm)
    PageControl: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    PanelSettings_TarihSaat: TPanel;
    Shape9: TShape;
    Shape14: TShape;
    PanelSettings_CheckManual: TcxRadioButton;
    PanelSettings_CheckManualTarih: TcxDateEdit;
    PanelSettings_CheckSor: TcxRadioButton;
    PanelSettings_CheckOtomatik: TcxRadioButton;
    Panel33: TPanel;
    Panel34: TPanel;
    btDateSettingOK: TcxButton;
    cxTabSheet2: TcxTabSheet;
    Panel24: TPanel;
    PanelTarihSaat_Saat: TPanel;
    Shape8: TShape;
    cxLabel14: TcxLabel;
    edtPanelTarihSaat_Saat: TcxTimeEdit;
    PanelTarihSaat_Tarih: TPanel;
    Shape7: TShape;
    cxLabel13: TcxLabel;
    edtPanelTarihSaat_Tarih: TcxDateEdit;
    PanelTarihSaat_Caption: TPanel;
    Panel1: TPanel;
    btDateEntryOK: TcxButton;
    cxTabSheet3: TcxTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    btnOK_Barkod: TcxButton;
    Panel4: TPanel;
    edtBarcodeCode_MalKod: TcxTextEdit;
    edtBarcodeCode_SeriNo: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    cxTabSheet4: TcxTabSheet;
    PanelUyariMain: TPanel;
    Panel37: TPanel;
    ToolBar22: TToolBar;
    Panel38: TPanel;
    ToolBar24: TToolBar;
    ToolButton17: TToolButton;
    btnTitleReminder_ShowMeAgain: TToolButton;
    btnTitleReminder_OK: TToolButton;
    ButtonImageList: TcxImageList;
    TabSheet_KismiTamamla: TcxTabSheet;
    Panel7: TPanel;
    cxTabSheet6: TcxTabSheet;
    Panel8: TPanel;
    Panel9: TPanel;
    PanelDurus_btOK: TcxButton;
    PanelDurus_edDurusTarih: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    PanelDurus_edDurusSaat: TcxTimeEdit;
    cxGroupBox1: TcxGroupBox;
    PanelDurus_edDurusAciklama: TcxTextEdit;
    cxTabSheet7: TcxTabSheet;
    Panel10: TPanel;
    Panel11: TPanel;
    cxButton1: TcxButton;
    Panel_Durus: TPanel;
    PanelDurus_gbDurusDakika: TcxGroupBox;
    PanelDurus_edDurusDakika: TcxSpinEdit;
    cxTabSheet8: TcxTabSheet;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    cxButton2: TcxButton;
    edUretimDurumDegistir_Tarih: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    edUretimDurumDegistir_FireMiktar: TcxTextEdit;
    cxButton3: TcxButton;
    edUretimDurumDegistir_Miktar: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    Image2: TImage;
    cxLabel10: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel12: TcxLabel;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    PanelGlobal_TopMenu_Description: TPanel;
    cxLabel11: TcxLabel;
    lbTuketimMiktar_TuketilecekMiktarCaption: TcxLabel;
    lbTuketimMiktar_TuketilenMiktarCaption: TcxLabel;
    lbTuketimMiktar_TuketilenMiktar: TcxLabel;
    lbTuketimMiktar_TuketilecekMiktar: TcxLabel;
    Shape1: TShape;
    Image1: TImage;
    procedure btDateSettingOKClick(Sender: TObject);
    procedure PanelSettings_CheckManualClick(Sender: TObject);
    procedure PanelSettings_CheckSorClick(Sender: TObject);
    procedure PanelSettings_CheckOtomatikClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure btDateEntryOKClick(Sender: TObject);
    procedure btnOK_BarkodClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtBarcodeCode_MalKodKeyPress(Sender: TObject; var Key: Char);
    procedure edtBarcodeCode_SeriNoKeyPress(Sender: TObject; var Key: Char);
    procedure cxButton3Click(Sender: TObject);
    procedure PanelDurus_btOKClick(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private
    FDop: TAppDocApp;
    FMalzemeTuketimDurum: Integer;
  private
    FUretimDurumDegistir_UretimDurum: Integer;
    FUretimDurumDegistir_Miktar: Double;
    FUretimDurumDegistir_Tarih: TDateTime;
    FUretimDurumDegistir_FireMiktar: Double;
  private
    procedure LoadSettings;
    procedure LoadDefaultValues;
    procedure SaveSettings;
    procedure BarkodClick;
    { Private declarations }
  public
    procedure LoadUretimDurumDegistir;
  public
    Constructor Create(AOwner: TAppDocApp); reintroduce;
    { Public declarations }
  published
    property DOP: TAppDocApp read FDop write FDop;
    property MalzemeTuketimDurum: Integer read FMalzemeTuketimDurum write FMalzemeTuketimDurum;
  end;

var
  AppDocFormUretimTerminalSettings: TAppDocFormUretimTerminalSettings;

implementation

{$R *.dfm}

uses
  DateUtils,
  CPMApp_Dialogs,
  CPMApp_BOMConsts, CPMApp_SProductionConsts,
  CPMApp_DOPUretimTerminalVeriGiris, CPMApp_DOPCustomUretimTerminalVeriGiris,
  CPMApp_TableUretimSystem;

procedure TAppDocFormUretimTerminalSettings.SaveSettings;
var
  vDateType: Smallint;
  vDate: TDate;
begin
  if PanelSettings_CheckOtomatik.Checked then
  begin
    vDateType := DateSettings_DateType_Otomatik;
    vDate := EncodeDate(1900, 01, 01);
  end
  else if PanelSettings_CheckSor.Checked then
  begin
    vDateType := DateSettings_DateType_TarihSor;
    vDate := EncodeDate(1900, 01, 01);
  end
  else if PanelSettings_CheckManual.Checked then
  begin
    vDateType := DateSettings_DateType_SabitTarih;
    vDate := PanelSettings_CheckManualTarih.Date;
    PanelSettings_CheckManualTarih.Enabled := true;
  end
  else
  begin
    vDateType := DateSettings_DateType_Otomatik;
    vDate := Date;//EncodeDate(1900, 01, 01);
  end;

  with TIniFile.Create(ExtractFilePath(Application.ExeName) + '\CPMAppXPServer.ini') do
  begin
    WriteInteger('UretimTerminalDateSettings', 'DateType', vDateType);
    WriteDate('UretimTerminalDateSettings', 'Date', vDate);
  end;
end;

procedure TAppDocFormUretimTerminalSettings.btDateSettingOKClick(Sender: TObject);
begin
  if PanelSettings_CheckManual.Checked then
    if (PanelSettings_CheckManualTarih.Text = '') or (PanelSettings_CheckManualTarih.Date = EncodeDate(1900, 01, 01)) then
    begin
      AppShowMessage('Geçersiz Tarih!');
      ModalResult := mrNone;
    end;
  SaveSettings;
end;

procedure TAppDocFormUretimTerminalSettings.BarkodClick;
var
  vBarcodeCode, vBarcodeSeriNo: String;
begin
  vBarcodeCode := edtBarcodeCode_MalKod.Text;
  vBarcodeSeriNo := edtBarcodeCode_SeriNo.Text;

  TAppDOPUretimTerminalVeriGiris(FDop).TerminalBarcode.BarcodeCode := vBarcodeCode;
  TAppDOPUretimTerminalVeriGiris(FDop).TerminalBarcode.BarcodeSeriNo := vBarcodeSeriNo;

  if TAppDOPUretimTerminalVeriGiris(FDop).TerminalBarcode.BarcodeMenu = 'MALKOD' then
  begin
    TAppDOPUretimTerminalVeriGiris(FDop).ChildUretimTerminalReceteTuketim.LocateBarcodeRecord;
  end;
end;

procedure TAppDocFormUretimTerminalSettings.btnOK_BarkodClick(Sender: TObject);
begin
  BarkodClick;
  ModalResult := mrOk;
end;

constructor TAppDocFormUretimTerminalSettings.Create(AOwner: TAppDocApp);
begin
  Inherited Create(Application);
  FDop := AOwner;
  LoadSettings;
  LoadDefaultValues;
  PageControl.HideTabs := true;
  Caption := '';
end;

procedure TAppDocFormUretimTerminalSettings.cxButton3Click(Sender: TObject);
begin
  FUretimDurumDegistir_UretimDurum := Integer(udFinished);
  FUretimDurumDegistir_Miktar := TAppDOPUretimTerminalVeriGiris(FDop).DataApp.UretimKart.Table.OpMiktar;
  FUretimDurumDegistir_FireMiktar := StrToFloat(edUretimDurumDegistir_FireMiktar.Text);
  FUretimDurumDegistir_Tarih := edUretimDurumDegistir_Tarih.Date;

  with TAppDOPUretimTerminalVeriGiris(FDop) do
  begin
    if FUretimDurumDegistir_Tarih = EncodeDate(1900, 01, 01) then
    begin
      DocCustomProperties.AppForms.AppFormMessageDialog('Üretim Bitiþ Tarihi Geçersiz!');
      Exit;
    end;

    if DataApp.DataControllerUretimKart.UretimDurumDegistir(TAppUretimDurum(FUretimDurumDegistir_UretimDurum), FUretimDurumDegistir_Tarih, FUretimDurumDegistir_Miktar, FUretimDurumDegistir_FireMiktar) then
    begin
      if DataApp.DataObject.Save then
        DocCustomProperties.AppForms.AppFormMessageDialog('Üretim Durumu Deðiþtirildi')
      else
        DocCustomProperties.AppForms.AppFormMessageDialog('Üretim Durumu deðiþtirilirken hata oluþtu. Lütfen tekrar deneyiniz!');
      ChildUretimKaynakEvrakList.DoRun;
      ShowThisDockPanel(ChildUretimKaynakEvrakList.DockPanel.Name);
    end;
  end;
end;

procedure TAppDocFormUretimTerminalSettings.cxButton4Click(Sender: TObject);
begin
  MalzemeTuketimDurum := 20;
end;

procedure TAppDocFormUretimTerminalSettings.cxButton5Click(Sender: TObject);
begin
  MalzemeTuketimDurum := 10; // Devam
end;

procedure TAppDocFormUretimTerminalSettings.edtBarcodeCode_MalKodKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
    edtBarcodeCode_SeriNo.SetFocus;
end;

procedure TAppDocFormUretimTerminalSettings.edtBarcodeCode_SeriNoKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    BarkodClick;
    if TAppDOPUretimTerminalVeriGiris(FDop).TerminalBarcode.BarCodeCalismaAyar = 0 then
    begin
      ModalResult := mrOk;
    end
    else
    begin
      edtBarcodeCode_MalKod.Clear;
      edtBarcodeCode_SeriNo.Clear;
      edtBarcodeCode_MalKod.SetFocus;
      ModalResult := mrNone;
    end;
  end;
end;

procedure TAppDocFormUretimTerminalSettings.FormActivate(Sender: TObject);
begin
  if PageControl.ActivePageIndex = 2 then
    edtBarcodeCode_MalKod.SetFocus;
end;

procedure TAppDocFormUretimTerminalSettings.FormShow(Sender: TObject);
begin
  if PageControl.ActivePageIndex = 2 then
  begin
    edtBarcodeCode_MalKod.SetFocus;
    edtBarcodeCode_MalKod.Clear;
    edtBarcodeCode_SeriNo.Clear;
  end;
end;

procedure TAppDocFormUretimTerminalSettings.btDateEntryOKClick(Sender: TObject);
var
  vYear, vMonth, vDay: Word;
  vHour, vMin, vSec, vMSec: Word;
begin
  DecodeDate(edtPanelTarihSaat_Tarih.Date, vYear, vMonth, vDay);
  DecodeTime(edtPanelTarihSaat_Saat.Time, vHour, vMin, vSec, vMSec);
  
  TAppDOPUretimTerminalVeriGiris(FDop).TerminalParametre.OpDateSettings_Date := EncodeDate(vYear, vMonth, vDay);
  TAppDOPUretimTerminalVeriGiris(FDop).TerminalParametre.OpDateSettings_Time := EncodeTime(vHour, vMin, vSec, vMSec);
end;

procedure TAppDocFormUretimTerminalSettings.PageControlChange(
  Sender: TObject);
begin
  if PageControl.ActivePageIndex = 0 then
    LoadSettings;
  if PageControl.ActivePageIndex = 7 then
  begin
    LoadUretimDurumDegistir;
  end;
end;

procedure TAppDocFormUretimTerminalSettings.LoadDefaultValues;
begin
  edtPanelTarihSaat_Tarih.Date := Date;
  edtPanelTarihSaat_Saat.Time := Time;
end;

procedure TAppDocFormUretimTerminalSettings.LoadSettings;
var
  vDateType: Smallint;
  vDate: TDate;
  vYear, vMonth, vDay: Word;
begin
  with TIniFile.Create(ExtractFilePath(Application.ExeName) + '\CPMAppXPServer.ini') do
  begin
    vDateType := ReadInteger('UretimTerminalDateSettings', 'DateType', DateSettings_DateType_Otomatik);
    vDate := ReadDate('UretimTerminalDateSettings', 'Date', Date);
  end;

  if vDateType = DateSettings_DateType_Otomatik then
    PanelSettings_CheckOtomatik.Checked := true;

  if vDateType = DateSettings_DateType_TarihSor then
    PanelSettings_CheckSor.Checked := true;

  if vDateType = DateSettings_DateType_SabitTarih then
  begin
    DecodeDate(vDate, vYear, vMonth, vDay);
    if vYear = 1900 then
      DecodeDate(Date, vYear, vMonth, vDay);
    PanelSettings_CheckManual.Checked := true;
    PanelSettings_CheckManualTarih.Date := EncodeDate(vYear, vMonth, vDay);
  end;

//  FComponent := TcxLabel(TAppDOPUretimTerminalVeriGiris(DOP).DocObject.MainForm.FindComponent('Information_LabelKaynak'));
//  if FComponent <> nil then
//    TcxLabel(TAppDOPUretimTerminalVeriGiris(DOP).DocObject.MainForm.FindComponent('Information_LabelKaynak')).Caption := IntToStr(vDateType);
//  TcxButton(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalReceteTuketim.Form.FindComponent('AppDocFormUretimTerminalMenu').FindComponent('ToolButtonReceteTuketimTitlePlansizTuketim')).Enabled := true
end;

procedure TAppDocFormUretimTerminalSettings.LoadUretimDurumDegistir;
begin
    FUretimDurumDegistir_UretimDurum := Integer(udFinished);
    FUretimDurumDegistir_Miktar := TAppDOPUretimTerminalVeriGiris(FDop).DataApp.UretimKart.Table.OpMiktar;
    FUretimDurumDegistir_Tarih := Date;
    FUretimDurumDegistir_FireMiktar := 0;

    edUretimDurumDegistir_Miktar.Text := FloatToStr(FUretimDurumDegistir_Miktar);
    edUretimDurumDegistir_FireMiktar.Text := FloatToStr(FUretimDurumDegistir_FireMiktar);
    edUretimDurumDegistir_Tarih.Date := FUretimDurumDegistir_Tarih;
end;

procedure TAppDocFormUretimTerminalSettings.PanelDurus_btOKClick(
  Sender: TObject);
begin
  if PageControl.ActivePageIndex = 5 then
    TAppDOPUretimTerminalVeriGiris(FDop).TerminalParametre.DurusBilgileri.PressedOKButton := 'OK';
end;

procedure TAppDocFormUretimTerminalSettings.PanelSettings_CheckManualClick(
  Sender: TObject);
var
  vYear, vMonth, vDay: Word;
begin

  PanelSettings_CheckManualTarih.Enabled := PanelSettings_CheckManual.Checked;
  DecodeDate(PanelSettings_CheckManualTarih.Date, vYear, vMonth, vDay);
  if (vYear = 1900) Or (PanelSettings_CheckManualTarih.Text = '') then
    PanelSettings_CheckManualTarih.Date := Date;
end;

procedure TAppDocFormUretimTerminalSettings.PanelSettings_CheckOtomatikClick(
  Sender: TObject);
begin
  PanelSettings_CheckManualTarih.Enabled := false;
end;

procedure TAppDocFormUretimTerminalSettings.PanelSettings_CheckSorClick(
  Sender: TObject);
begin
  PanelSettings_CheckManualTarih.Enabled := false;
end;

end.
