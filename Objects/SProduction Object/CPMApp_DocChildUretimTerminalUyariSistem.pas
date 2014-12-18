unit CPMApp_DocChildUretimTerminalUyariSistem;

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
  CPMApp_DocChildVGrid,
  CPMApp_DocChildSearchTable,
  CPMApp_DocChildUretimTerminalProperties,
  CPMApp_DAPCustomUretimKart,
  CPMApp_DocFormUretimTerminalSettings,
  CPMApp_TableUretimTempSystem,
  CPMApp_TableStokSystem;

type
  TAppDocChildUretimTerminalUyariSistem = class;

  TAppDocChildUretimTerminalUyariSistem = class(TAppDocChildSearchTable)
  private
    FTimer: TTimer;
    FTimerInUse: Boolean;
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
    COkundu: TcxGridDBColumn;
    FPanelUyari: TPanel;
    FFormTerminalUyari: TAppDocFormUretimTerminalSettings;
    procedure OnGridButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure OnShowMe(Sender: TObject);
    procedure AddDocument;
    procedure CreateGridButtons;
    procedure PrepareDefination(const OperatorKod: String = ''; const TerminalKod: String = ''; const SicilKod: String = '');
  private
    procedure DockPanelOnActivate(Sender: TdxCustomDockControl; Active: Boolean);
    procedure CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure CreatePanel;
  protected
    procedure CreateTitle;
    procedure CreateObjects;
    procedure AfterCreate; override;
  public
    procedure DoRunTimer(Sender: TObject);
    procedure DoRun;
  public
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property Timer: TTimer read FTimer write FTimer;
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
    property PanelUyari: TPanel read FPanelUyari write FPanelUyari;
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


{ TAppDocChildUretimTerminalUyariSistem }

procedure TAppDocChildUretimTerminalUyariSistem.AddDocument;
begin
  Self.Table.Edit;
  Self.Table.FieldValues['OKUNDU'] := 0;
  Self.Table.ApplyUpdates(0);
  Self.Run;
end;

procedure TAppDocChildUretimTerminalUyariSistem.OnGridButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  AddDocument;
end;

procedure TAppDocChildUretimTerminalUyariSistem.OnShowMe(Sender: TObject);
begin
  Self.ShowChild(true);
//  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(Self.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalUyariSistem.PrepareDefination(const OperatorKod: String = ''; const TerminalKod: String = ''; const SicilKod: String = '');
begin
  with Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
    end;
    with Where do
    begin
      Clear;
      Add('OKUNDU', wcEqual, 1);
      AddOperator(woAnd);
      Add('HEDEFOPERATORKOD', wcEqual, OperatorKod);
    end;
  end;
  with Table.TableItems[1] do
  begin
    with Join do
    begin
      JoinType := jtInner;
      Clear;
      Add('KAYNAKKOD', 'KAYNAKKOD');
    end;
    with Where do
    begin
      Clear;
      Add('TERMINALKOD', wcEqual, TerminalKod);
      AddOperator(woAnd);
      Add('SICILKOD', wcEqual, SicilKod);
    end;
  end;
  Self.GridView.OnCustomDrawCell := CustomDrawCell;
end;

procedure TAppDocChildUretimTerminalUyariSistem.CreatePanel;
begin
  FPanelUyari := TPanel.Create(nil);
  with FPanelUyari do
  begin
    Name := 'DocChildUretimTerminalUyariSistem_PanelUyari';
    Visible := False;
    Parent := DocObject.MainForm;
    Align := alBottom;
    BevelKind := bkTile;
    Anchors := [akTop];
    Height := 41;
    Color := $000000B7;
    Font.Color := clWhite;
    Font.Size := 13;
    DragCursor := crHandPoint;
    OnClick := OnShowMe;
  end;
end;

procedure TAppDocChildUretimTerminalUyariSistem.AfterCreate;
begin
  inherited;
  Self.Caption := 'Uyarý Sistemi';
  Self.ReadOnly := false;
  Self.DockPanel.OnActivate := DockPanelOnActivate;

  Table.TableItems.TableNames := VarArrayOf(['URTTMS', 'URTTEK']);
  Table.IndexFieldNames := 'ID;EVRAKNO;URETIMNO;URETIMSIRANO;OPERASYONNO;KAYNAKKOD;MAMULKOD;SERINO;KAYNAKISLEMNO;HEDEFISLEMNO';
  PrepareDefination;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalUyariSistem.CreateTitle;
begin
//  TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.CreateTitlePanel(TAppDocFormUretimTerminalMenu(Self.Form), 'Uyarý Sistemi', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

procedure TAppDocChildUretimTerminalUyariSistem.CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  COkundu := GridView.GetColumnByFieldName('OKUNDU');

  if (AViewInfo.GridRecord.Values[COkundu.Index] = 1) then
  begin
    ACanvas.Brush.Color := RGB(255, 172, 132);
//    ACanvas.Font.Color := RGB(195, 195, 195);
    ACanvas.Font.Color := clBlack;
    ACanvas.Font.Style := [fsBold];
  end;
end;

procedure TAppDocChildUretimTerminalUyariSistem.CreateObjects;
begin
  FFormTerminalUyari := TAppDocFormUretimTerminalSettings.Create(nil);
  FFormTerminalUyari.Position := poScreenCenter;

  CreatePanel;

  FTimer := TTimer.Create(nil);
  FTimer.Interval := 5000; // 5sn.
  FTimer.OnTimer := DoRunTimer;
  
  FTimerInUse := True;
end;

procedure TAppDocChildUretimTerminalUyariSistem.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  CreateGridButtons;
  Self.ToolBar.Visible := false;
end;

destructor TAppDocChildUretimTerminalUyariSistem.Destroy;
begin

  inherited;
end;

procedure TAppDocChildUretimTerminalUyariSistem.DockPanelOnActivate(
  Sender: TdxCustomDockControl; Active: Boolean);
begin
  if Active then
  begin
    FTimer.Enabled := false;
  end
  else
  begin
    FTimer.Enabled := True;
  end;
end;

procedure TAppDocChildUretimTerminalUyariSistem.DoRun;
begin
  Self.Run;
end;

procedure TAppDocChildUretimTerminalUyariSistem.DoRunTimer(Sender: TObject);
var
  vOperatorKod, vTerminalKod, vSicilKod: String;
begin
  vOperatorKod := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.CurrentOperatorKod;
  vTerminalKod := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.TerminalKod;
  vSicilKod := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.SicilKod;

  if (vTerminalKod <> '') And (vSicilKod <> '')then begin
    PrepareDefination(vOperatorKod, vTerminalKod, vSicilKod);
    DoRun;
  end
  else Exit;

  if Self.Table.RecordCount > 0 then
  begin
    if (FTimerInUse) then
    begin
      FTimerInUse := False;
      PanelUyari.Visible := true;
      PanelUyari.Caption := Format('%d Adet Bekleyen Bildiriminiz Var!', [Self.Table.RecordCount]);
      FTimerInUse := True;
    end;
  end
  else PanelUyari.Visible := false;
end;

procedure TAppDocChildUretimTerminalUyariSistem.CreateGridButtons;
  procedure CreateButtons;
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppChild.CreateGridButton(Self.GridView, OnGridButtonClick);
  end;
begin
  Self.Run;
  CreateButtons;
end;

procedure TAppDocChildUretimTerminalUyariSistem.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;

{ TAppDocChildUretimTerminalUyariSistemForm }


end.
