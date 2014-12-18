unit CPMApp_DocChildUretimTerminalAmbalajBilgileri;

interface

uses
  Windows,
  cxGridTableView, cxGridDBTableView,
  cxGraphics, cxGridCustomTableView,
  CPMApp_DocApp,
  CPMApp_Storage,
  CPMApp_DocObjectModel,
  CPMApp_DocChildSearchTable,
  CPMApp_DocChildUretimTerminalProperties,
  CPMApp_DAPCustomUretimKart;

type
  TAppDocChildUretimTerminalAmbalajBilgileri = class;

  TAppDocChildUretimTerminalAmbalajBilgileri = class(TAppDocChildSearchTable)
  private
    FDataApp: TAppDAPCustomUretimKart;
    FDocApp: TAppDocApp;
    COpDurum: TcxGridDBColumn;
    procedure OnClickTitleRefresh(Sender: TObject);
    procedure OnClickTitleExit(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
    procedure AddDocumentOnClick(Sender: TObject; AButtonIndex: Integer);
    procedure CreateGridButtons;
  protected
    procedure CreateObjects;
    procedure CreatePanels;
    procedure AfterCreate; override;
  protected
    procedure CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  public
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  public
    procedure DoRun(EvrakNo: String; EvrakSiraNo, EvrakTip: Integer);
  published
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
    property DocApp: TAppDocApp read FDocApp write FDocApp;
  end;

  implementation

uses
  DB, Forms,
  Variants,
  Controls,
  SysUtils,
  CPMApp_Dialogs,
  CPMApp_TableItems,
  CPMApp_BOMConsts,
  CPMApp_SProductionConsts,
  CPMApp_DOPUretimTerminalVeriGiris,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_DocFormUretimTerminalNumPad, CPMApp_DOPCustomUretimTerminalVeriGiris,
  CPMApp_TableStokSystem, CPMApp_DataObject;
{ TAppDocChildUretimTerminalAmbalajBilgileri }

procedure TAppDocChildUretimTerminalAmbalajBilgileri.AddDocumentOnClick(Sender: TObject;
  AButtonIndex: Integer);
var
  aMiktar: Double;
  vIslemNo: Integer;
  vAmbalajKod: String;
  vBirim: String;
  vSeriNo2: String;
  vSiparisNo: String;
  vOperasyonNo: Integer;

  vTarih: TDate;
  vDate: TDate;
  function StokDovizCins(MalKod: String): String;
  begin
    DataApp.TableCommand.OpenCommandText(Format('SELECT DOVIZCINS FROM STKKRT WHERE MALKOD = ''%s''', [MalKod]));
    Result := DataApp.TableCommand.FieldValues['DOVIZCINS'];
  end;
  procedure GetValues;
  begin
    vIslemNo := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.OpIslemNo + Self.Table.FieldValues['ID'];
    vAmbalajKod := Self.Table.FieldValues['AMBALAJKOD'];
    vBirim := Self.Table.FieldValues['STKKRT_BIRIM'];
    vSeriNo2 := Self.Table.FieldValues['SERINO2'];
    vSiparisNo := DataApp.UretimSiparisHareket.Table.SiparisNo;
    vOperasyonNo := DataApp.UretimSiparisHareket.Table.OperasyonNo;
  end;
begin
  if Self.Table.FieldValues['OPDURUM'] = odFinished then
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Tamamlanmýþ tüketimde iþlem yapamazsýnýz!');
    Exit;
  end;


  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
  aMiktar := DocCustomProperties.AppForms.AppFormNumericPad('Üretilen Miktarý Girin!', FloatToStr(Self.Table.FieldValues['AMBALAJMIKTAR']));
  if aMiktar > 0 then
    begin
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
        TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PanelTarihSaat_Saat.Visible := true;
        TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.ShowModal;
        vTarih := TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDateSettings_Date;
      end;

      GetValues;
      DataApp.UretimStokHareket.Table.Insert;
      DataApp.UretimStokHareket.Table.GirisCikis := gcGiris;
      DataApp.UretimStokHareket.Table.MalKod := vAmbalajKod;
      DataApp.UretimStokHareket.Table.EvrakDovizCins := StokDovizCins(vAmbalajKod);
      DataApp.UretimStokHareket.Table.MalTip := 6; // YanÜrün
      DataApp.UretimStokHareket.Table.EvrakTarih := vTarih;
      DataApp.UretimStokHareket.Table.IrsaliyeTarih := vTarih;
      DataApp.UretimStokHareket.Table.EvrakBirim := vBirim;
      DataApp.UretimStokHareket.Table.Miktar := aMiktar;
      DataApp.UretimStokHareket.Table.IrsaliyeNo := vSiparisNo;
      DataApp.UretimStokHareket.Table.OperasyonNo := vOperasyonNo;
      DataApp.UretimStokHareket.Table.YanUrunMaliyetOran := -1;
      DataApp.UretimStokHareket.Table.DepoKod := 'A1';

      Self.Table.Edit;
      Self.Table.FieldValues['OPDURUM'] := 20;
      Self.Table.FieldValues['KULLANILANMIKTAR'] := aMiktar;
      Self.Table.ApplyUpdates(0);

      TAppDOPUretimTerminalVeriGiris(DocApp).DoSaveNew(false);
      Self.Run;
    end;
  end;
end;

procedure TAppDocChildUretimTerminalAmbalajBilgileri.AfterCreate;
begin
  inherited;
  Self.Name := 'ChildUretimTerminalAmbalajBilgileri';
  Self.Caption := 'Yan Ürün List';
  Self.PipelineName := 'ppAmbalajBilgileri';
  Self.Table.TableItems.TableNames := VarArrayOf(['TERM01', 'STKKRT']);
  Self.Table.TableItems.TableReferans := VarArrayOf(['TERM01', 'STKKRT']);
  Self.Table.TableItems.TableCaptions := VarArrayOf(['Temp Terminal', 'Stok Kart']);

  with Self.Table.TableItems[0] do begin
    with Fields do begin
      Clear;
      Add('*')
    end;
  end;

  with Self.Table.TableItems[1] do begin
    with Fields do begin
      Clear;
      Add('MALAD');
      Add('BIRIM');
    end;
    with Join do
    begin
      Add('MALKOD', 'AMBALAJKOD');
    end;
  end;

  Self.GridView.OnCustomDrawCell := CustomDrawCell;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalAmbalajBilgileri.CreateObjects;
begin
end;

procedure TAppDocChildUretimTerminalAmbalajBilgileri.CreatePanels;
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.CreateTitlePanel(TForm(Self.Form), 'Çýkma Ambalajlarý Ekle', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

procedure TAppDocChildUretimTerminalAmbalajBilgileri.CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  COpDurum := GridView.GetColumnByFieldName('OPDURUM');
  if (AViewInfo.GridRecord.Values[COpDurum.Index] = odFinished) then
    ACanvas.Brush.Color := RGB(223, 254, 222);
end;

procedure TAppDocChildUretimTerminalAmbalajBilgileri.CreateGridButtons;
  procedure CreateButtons;
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppChild.CreateGridButton(Self.GridView, AddDocumentOnClick);
  end;
begin
//  Self.Table.TableItems[0].Where.Clear;
//  Self.Table.TableItems[0].Where.AddText('0 = 1');
  Self.Run;
  CreateButtons;
end;

procedure TAppDocChildUretimTerminalAmbalajBilgileri.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateGridButtons;
  CreatePanels;
  Self.GridView.OptionsData.Editing := true;
  Self.ReadOnly := false;
  Self.ToolBar.Visible := false;
  Self.ToolBar.ShowCaptions := true;
end;

destructor TAppDocChildUretimTerminalAmbalajBilgileri.Destroy;
begin
  inherited;
end;

procedure TAppDocChildUretimTerminalAmbalajBilgileri.DoRun(EvrakNo: String;
  EvrakSiraNo, EvrakTip: Integer);
begin
  with Self.Table.TableItems[0].Where do
  begin
    Clear;
    Add('SIRKETNO', wcEqual, DataApp.CompanyNo).DataType := ftString;
    AddOperator(woAnd);
    Add('EVRAKNO', wcEqual, EvrakNo).DataType := ftString;
    AddOperator(woAnd);
    Add('EVRAKSIRANO', wcEqual, EvrakSiraNo).DataType := ftInteger;
    AddOperator(woAnd);
    Add('EVRAKTIP', wcEqual, EvrakTip).DataType := ftInteger;
  end;
  Self.Run;
end;

procedure TAppDocChildUretimTerminalAmbalajBilgileri.Initialize(IniFile: TAppIniFile);
begin
  Self.ReadOnly := false;
  inherited;
  Self.ReadOnly := false;
end;

procedure TAppDocChildUretimTerminalAmbalajBilgileri.OnClickTitleBack(Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
    ShowThisDockPanel(ChildUretimKaynakIslem.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalAmbalajBilgileri.OnClickTitleExit(Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
    ShowThisDockPanel(ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalAmbalajBilgileri.OnClickTitleRefresh(
  Sender: TObject);
begin
  DataApp.DataObject.Cancel;
end;

end.
