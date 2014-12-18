unit CPMApp_DocChildUretimTerminalDolumBilgileri;

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
  TAppDocChildUretimTerminalDolumBilgileri = class;

  TAppDocChildUretimTerminalDolumBilgileri = class(TAppDocChildSearchTable)
  private
    FDataApp: TAppDAPCustomUretimKart;
    FDocApp: TAppDocApp;
    COpDurum: TcxGridDBColumn;
    procedure OnClickTitleRefresh(Sender: TObject);
    procedure OnClickTitleExit(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
    procedure AddDocumentOnClick(Sender: TObject; AButtonIndex: Integer);
    procedure CreateGridButtons;
    procedure UpdateMamulVersiyon(OperasyonSiraNo: Integer; ASeriNo: String; AMiktar: Double);
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
  SysUtils,
  CPMApp_Dialogs,
  CPMApp_TableItems,
  CPMApp_BOMConsts,
  CPMApp_DOPUretimTerminalVeriGiris,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_DocFormUretimTerminalNumPad, CPMApp_TableStokSystem, CPMApp_DataObject;
{ TAppDocChildUretimTerminalDolumBilgileri }

procedure TAppDocChildUretimTerminalDolumBilgileri.AddDocumentOnClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AMiktar: Double;
  AIslemNo: Integer;
  AOperasyonSiraNo: Integer;
  function CheckAllOperationFinished: Boolean;
  var
    noneFinished: Boolean;
  begin
    noneFinished := false;
    with TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem do
    begin
      Table.First;
      while not Table.Eof do
      begin
        if Table.FieldValues['DURUM'] <> odFinished then
        begin
          noneFinished := true;
          Break;
        end;
        Table.Next;
      end;
    end;
    Result := noneFinished;
end;
begin
  if CheckAllOperationFinished then
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Tüm operasyonlar tamamlanmadan dolum bilgilerinde iþlem yapamazsýnýz!');
    exit;
  end;

  if Self.Table.FieldValues['OPDURUM'] = odFinished then
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Tamamlanmýþ tüketimde iþlem yapamazsýnýz!');
    Exit;
  end;

  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    AMiktar := DocCustomProperties.AppForms.AppFormNumericPad('Üretilen Miktarý Girin!', FloatToStr(Self.Table.FieldValues['MIKTAR']));
  if AMiktar > 0 then
    begin
      AIslemNo := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.OpIslemNo + Self.Table.FieldValues['SIRANO'];
      DoStartOperasyon(AIslemNo, false);

      DoFinishOperasyon2(AMiktar, AIslemNo, false);
      DoSaveNew(false);

      DataApp.UretimRotaKaynakOperasyon.Table.Last;
      AOperasyonSiraNo := DataApp.UretimRotaKaynakOperasyon.Table.SiraNo;
//      AppShowMessage('Operasyon Sýra No: '+ IntToStr(AOperasyonSiraNo));
      UpdateMamulVersiyon(AOperasyonSiraNo, Self.Table.FieldValues['SERINO2'], AMiktar);
      ShowThisDockPanel(Self.DockPanel.Name);
    end;
  end;
//  TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimDolumBilgileriOnDblClick(Sender);
end;

procedure TAppDocChildUretimTerminalDolumBilgileri.AfterCreate;
begin
  inherited;
  Self.Name := 'ChildUretimTerminalDolumBilgileri';
  Self.Caption := 'Terminal Dolum Bilgileri';
  Self.PipelineName := 'ppTerminalDolumBilgileri';
  Self.Table.TableItems.TableNames := VarArrayOf(['KMTST2', 'STKHAR', 'REFKRT']);
  Self.Table.TableItems.TableCaptions := VarArrayOf(['Üretim Ambalaj Taným', 'Stok Hareket', 'Referans Kart']);

  with Self.Table.TableItems[0] do begin
    with Fields do begin
      Clear;
      Add('*')
    end;
  end;

  with Self.Table.TableItems[1] do begin
    with Join do begin
      Add('SIRKETNO', 'SIRKETNO');
      Add('EVRAKNO', 'EVRAKNO');
      Add('EVRAKTIP', 'EVRAKTIP');
      Add('SIRANO2', 'SIRANO');
      AddConst('GIRISCIKIS', gcGiris);
      AddConst('MALTIP', 5);
    end;
  end;

  with Self.Table.TableItems[2] do begin
    with Join do begin
      Add('KOD', 'SERINO2');
      AddConst('TABLOAD', 'STKHAR');
      AddConst('ALANAD', 'SERINO2');
    end;
  end;
  Self.GridView.OnCustomDrawCell := CustomDrawCell;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalDolumBilgileri.CreateObjects;
begin
end;

procedure TAppDocChildUretimTerminalDolumBilgileri.CreatePanels;
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.CreateTitlePanel(TForm(Self.Form), 'Dolum Bilgileri', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

procedure TAppDocChildUretimTerminalDolumBilgileri.CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  COpDurum := GridView.GetColumnByFieldName('OPDURUM');
  if (AViewInfo.GridRecord.Values[COpDurum.Index] = odFinished) then
    ACanvas.Brush.Color := RGB(223, 254, 222);
end;

procedure TAppDocChildUretimTerminalDolumBilgileri.CreateGridButtons;
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

procedure TAppDocChildUretimTerminalDolumBilgileri.DesktopAfterRestore(
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

destructor TAppDocChildUretimTerminalDolumBilgileri.Destroy;
begin
  inherited;
end;

procedure TAppDocChildUretimTerminalDolumBilgileri.DoRun(EvrakNo: String;
  EvrakSiraNo, EvrakTip: Integer);
  function GetLastOperasyonNo: Integer;
  var SQLStr: String;
  begin
    SQLStr := 'Select MAX(OPERASYONNO) AS OPERASYONNO FROM URTROT WHERE SIRKETNO = ''%s'' AND URETIMNO = ''%s'' AND EVRAKNO = ''%s'' AND KAYITTUR = 1 AND KAYITDURUM = 1';
    SQLStr := Format(SQLStr, [DataApp.CompanyNo, DataApp.UretimRota.Table.UretimNo, DataApp.UretimRota.Table.EvrakNo]);
    DataApp.TableCommand.OpenCommandText(SQLStr);
    Result := DataApp.TableCommand.FieldValues['OPERASYONNO'];
  end;

  function CheckLastOperationNo: Boolean;
  begin
    if DataApp.UretimRota.Table.OperasyonNo = GetLastOperasyonNo then
      Result := true
    else
      Result := false;

  end;
begin
  if CheckLastOperationNo then
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
  end else
  begin
    with Self.Table.TableItems[0].Where do
    begin
      Clear;
      AddText('0 = 1');
    end;
  end;
  Self.Run;
end;

procedure TAppDocChildUretimTerminalDolumBilgileri.Initialize(IniFile: TAppIniFile);
begin
  Self.ReadOnly := false;
  inherited;
  Self.ReadOnly := false;
end;

procedure TAppDocChildUretimTerminalDolumBilgileri.OnClickTitleBack(Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
    ShowThisDockPanel(ChildUretimKaynakIslem.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalDolumBilgileri.OnClickTitleExit(Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
    ShowThisDockPanel(ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalDolumBilgileri.OnClickTitleRefresh(
  Sender: TObject);
begin
  DataApp.DataObject.Cancel;
end;

procedure TAppDocChildUretimTerminalDolumBilgileri.UpdateMamulVersiyon(OperasyonSiraNo: Integer; ASeriNo: String; AMiktar: Double);
begin
  if DataApp.UretimStokHareket.Table.Locate('STHURT_OPERASYONSIRANO;', VarArrayOf([OperasyonSiraNo]), []) then
  begin
    DataApp.UretimStokHareket.Table.Edit;
    DataApp.UretimStokHareket.Table.SeriNo2 := ASeriNo;
    DataApp.UretimStokHareket.Table.VersiyonNo := DataApp.UretimStokHareket.Table.SeriNo;
  end;

  Self.Table.Edit;
  Self.Table.FieldValues['OPDURUM'] := 20;
  Self.Table.FieldValues['KULLANILANMIKTAR'] := aMiktar;
  Self.Table.ApplyUpdates(0);

  TAppDOPUretimTerminalVeriGiris(DocApp).DoSaveNew(false);
end;

end.
