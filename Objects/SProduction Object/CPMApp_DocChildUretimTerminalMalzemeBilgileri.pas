unit CPMApp_DocChildUretimTerminalMalzemeBilgileri;

interface

uses
  SysUtils,
  Variants,
  Forms,
  dxDockControl,
  CPMApp_Storage,
  CPMApp_DocApp,
  CPMApp_DocObjectModel,
  CPMApp_DocChildVGrid,
  CPMApp_DataObject,
  CPMApp_DataObjectDB,
  CPMApp_DAPCustomUretimKart,
  CPMApp_TableUretimTempSystem;
type

  TAppDocChildUretimTerminalMalzemeBilgileri = class;

  TAppDocChildUretimTerminalMalzemeBilgileriGiris = class(TAppDocChildVGrid)
  private
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
    fTableMalzemeTuketimBilgileri: TTableUretimTerminalMalzemeTuketimBilgileri;
    FFormMalzemeTuketim: TForm;
  private
    procedure DoOnNewRecord(Table: TAppCustomTable);
  protected
    procedure CreateTables;
    procedure AfterCreate; override;
  public
  public
    procedure DoRun;
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
    property FormMalzemeTuketim: TForm read FFormMalzemeTuketim write FFormMalzemeTuketim;
    property TableMalzemeTuketimBilgileri: TTableUretimTerminalMalzemeTuketimBilgileri read fTableMalzemeTuketimBilgileri write fTableMalzemeTuketimBilgileri;
  end;

  TAppDocChildUretimTerminalMalzemeBilgileri = class(TAppDocChildVGrid)
  private
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
    fTableMalzemeTuketimBilgileri: TTableUretimTerminalMalzemeTuketimBilgileri;
    FFormMalzemeTuketim: TForm;
  private
    procedure OnClickSave(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
    procedure OnClickTitleExit(Sender: TObject);
    procedure DoSave;
    procedure DoOnNewRecord(Table: TAppCustomTable);
  protected
    procedure CreateTitle;
    procedure CreateObjects;
    procedure CreateTables;
    procedure AfterCreate; override;
  public
  public
    procedure DoRun;
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
    property FormMalzemeTuketim: TForm read FFormMalzemeTuketim write FFormMalzemeTuketim;
    property TableMalzemeTuketimBilgileri: TTableUretimTerminalMalzemeTuketimBilgileri read fTableMalzemeTuketimBilgileri write fTableMalzemeTuketimBilgileri;
  end;

implementation
uses
  CPMApp_Dialogs,
  CPMApp_Date,
  CPMApp_TableItems,
  CPMApp_DOPUretimTerminalVeriGiris,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_DocFormUretimTerminalNumPad;

{ TAppDocChildUretimTerminalMalzemeBilgileri }

procedure TAppDocChildUretimTerminalMalzemeBilgileri.AfterCreate;
begin
  inherited;
  CreateTables;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalMalzemeBilgileri.CreateObjects;
begin

end;

procedure TAppDocChildUretimTerminalMalzemeBilgileri.CreateTables;
  procedure CreateTable;
  begin
    fTableMalzemeTuketimBilgileri := TTableUretimTerminalMalzemeTuketimBilgileri.Create(nil);
    fTableMalzemeTuketimBilgileri.Name := 'TableUretimTerminalMalzemeTuketimBilgileri';
    fTableMalzemeTuketimBilgileri.TableItems.TableNames := 'STHURD';
    fTableMalzemeTuketimBilgileri.ProviderName := 'prTableUretimTerminalMalzemeTuketimBilgileri';
//    fTableMalzemeTuketimBilgileri.IndexFieldNames := 'HESAPKOD;EVRAKNO;URETIMNO;EVRAKTIP;MALKOD;SIRANO;SIRANO2';
    fTableMalzemeTuketimBilgileri.IndexFieldNames := 'EVRAKNO;MALKOD;SIRANO;SIRANO2';
    fTableMalzemeTuketimBilgileri.OnNewRecord := DoOnNewRecord;
  end;
begin
  CreateTable;
end;

procedure TAppDocChildUretimTerminalMalzemeBilgileri.CreateTitle;
//var
//  formTerminalMenu: TAppDocFormUretimTerminalMenu;
begin
  FFormMalzemeTuketim := TAppDocFormUretimTerminalMenu.Create(nil);
  TAppDocFormUretimTerminalMenu(FFormMalzemeTuketim).panelMalzemeBilgileri_Top.Parent := Self.Form;
  TAppDocFormUretimTerminalMenu(FFormMalzemeTuketim).panelMalzemeBilgileri_btnTitleKaydet .OnClick := OnClickSave;
  TAppDocFormUretimTerminalMenu(FFormMalzemeTuketim).panelMalzemeBilgileri_btnTitleBack.OnClick := OnClickTitleBack;
  TAppDocFormUretimTerminalMenu(FFormMalzemeTuketim).panelMalzemeBilgileri_btnTitleExit.OnClick := OnClickTitleExit;
//
//  formTerminalMenu := TAppDocFormUretimTerminalMenu.Create(nil);
//  formTerminalMenu.panelMalzemeBilgileri_Top.Parent := Self.Form;
//  formTerminalMenu.panelMalzemeBilgileri_btnTitleKaydet .OnClick := OnClickSave;
//  formTerminalMenu.panelMalzemeBilgileri_btnTitleBack.OnClick := OnClickTitleBack;
//  formTerminalMenu.panelMalzemeBilgileri_btnTitleExit.OnClick := OnClickTitleExit;
end;

procedure TAppDocChildUretimTerminalMalzemeBilgileri.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
end;

destructor TAppDocChildUretimTerminalMalzemeBilgileri.Destroy;
begin
  FreeAndNil(fTableMalzemeTuketimBilgileri);
  inherited;
end;

procedure TAppDocChildUretimTerminalMalzemeBilgileri.DoRun;
begin
  TableMalzemeTuketimBilgileri.DoInitializeRecord;
  TableMalzemeTuketimBilgileri.Open;
end;

procedure TAppDocChildUretimTerminalMalzemeBilgileri.Initialize(IniFile: TAppIniFile);
begin
  inherited;
  CreateTitle;
end;

procedure TAppDocChildUretimTerminalMalzemeBilgileri.OnClickSave(Sender: TObject);
begin
  DoSave;
end;

procedure TAppDocChildUretimTerminalMalzemeBilgileri.OnClickTitleBack(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalReceteTuketimList.DockPanel.Name);
//  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalReceteTuketim.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalMalzemeBilgileri.OnClickTitleExit(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalMalzemeBilgileri.DoSave;
begin
  TableMalzemeTuketimBilgileri.ApplyUpdates(0);
  TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Kayýt iþlemi tamamlandý!');
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalReceteTuketimList.DockPanel.Name);
  DoRun;
end;

procedure TAppDocChildUretimTerminalMalzemeBilgileri.DoOnNewRecord(
  Table: TAppCustomTable);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    with TTableUretimTerminalMalzemeTuketimBilgileri(TableMalzemeTuketimBilgileri) do
    begin
      SirketNo := DataApp.CompanyNo;
      HesapKod := ChildUretimTerminalReceteTuketimList.Table.FieldValues['HESAPKOD'];
      EvrakTip := ChildUretimTerminalReceteTuketimList.Table.FieldValues['EVRAKTIP'];
      EvrakNo := ChildUretimTerminalReceteTuketimList.Table.FieldValues['EVRAKNO'];
      UretimNo := ChildUretimTerminalReceteTuketimList.Table.FieldValues['SIPARISNO'];
      MalKod := ChildUretimTerminalReceteTuketimList.Table.FieldValues['MALKOD'];
//      SeriNo := ChildUretimTerminalReceteTuketimList.Table.FieldValues['SERINO']; // 3.0.10.0 Kaldýrýldý. Veysel
//      VersiyonNo := ChildUretimTerminalReceteTuketimList.Table.FieldValues['VERSIYONNO']; // 3.0.10.0 Kaldýrýldý. Veysel
      SiraNo := ChildUretimTerminalReceteTuketimList.Table.FieldValues['SIRANO'];
      SiraNo2 := ChildUretimTerminalReceteTuketimList.Table.FieldValues['SIRANO2'];
    end;
  end;
end;

{ TAppDocChildUretimTerminalMalzemeBilgileriGiris }

procedure TAppDocChildUretimTerminalMalzemeBilgileriGiris.AfterCreate;
begin
  inherited;
  CreateTables;
end;

procedure TAppDocChildUretimTerminalMalzemeBilgileriGiris.CreateTables;
  procedure CreateTable;
  begin
    fTableMalzemeTuketimBilgileri := TTableUretimTerminalMalzemeTuketimBilgileri.Create(nil);
    fTableMalzemeTuketimBilgileri.Name := 'TableUretimTerminalMalzemeTuketimBilgileri';
    fTableMalzemeTuketimBilgileri.TableItems.TableNames := 'STHURD';
    fTableMalzemeTuketimBilgileri.TableItems.TableReferans := 'STHURD';
    fTableMalzemeTuketimBilgileri.ProviderName := 'prTableUretimTerminalMalzemeTuketimBilgileri';
//    fTableMalzemeTuketimBilgileri.IndexFieldNames := 'HESAPKOD;EVRAKNO;URETIMNO;EVRAKTIP;MALKOD;SIRANO;SIRANO2';
    fTableMalzemeTuketimBilgileri.IndexFieldNames := 'EVRAKNO;MALKOD;SIRANO;SIRANO2';
    fTableMalzemeTuketimBilgileri.OnNewRecord := DoOnNewRecord;
  end;
begin
  CreateTable;
end;

procedure TAppDocChildUretimTerminalMalzemeBilgileriGiris.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;

end;

destructor TAppDocChildUretimTerminalMalzemeBilgileriGiris.Destroy;
begin
  FreeAndNil(fTableMalzemeTuketimBilgileri);
  inherited;
end;

procedure TAppDocChildUretimTerminalMalzemeBilgileriGiris.DoOnNewRecord(
  Table: TAppCustomTable);
begin

end;

procedure TAppDocChildUretimTerminalMalzemeBilgileriGiris.DoRun;
begin
  TableMalzemeTuketimBilgileri.DoInitializeRecord;
  TableMalzemeTuketimBilgileri.Open;
end;

procedure TAppDocChildUretimTerminalMalzemeBilgileriGiris.Initialize(
  IniFile: TAppIniFile);
begin
  inherited;

end;

end.
