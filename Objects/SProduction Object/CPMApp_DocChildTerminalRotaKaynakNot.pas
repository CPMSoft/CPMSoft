unit CPMApp_DocChildTerminalRotaKaynakNot;

interface

uses
  SysUtils,
  Classes,

  DB,
  CPMApp_DataObject,
  CPMApp_DocObjectModel,
  CPMApp_DataObjectDB,
  CPMApp_DocChildGrid,
  CPMApp_DocChildVGrid,

  CPMApp_TableUretimTempSystem,
  CPMApp_Storage,
  CPMApp_DocApp,
  CPMApp_DAPCustomUretimKart,
  CPMApp_DocFormUretimTerminalMenu;

type
  TAppDocChildTerminalRotaKaynakNot = class;

  TAppRuleSelf = class(TAppTableRule)
  private
    FDocChild: TAppDocChildTerminalRotaKaynakNot;
    FTableEvrakBaslik: TTableUretimRotaKaynakNot;
  protected
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
    procedure DoAfterClose(Table: TAppCustomTable); override;
    procedure DoAfterOpen(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDocChildTerminalRotaKaynakNot);
  end;

  TAppDocChildTerminalRotaKaynakNot = class(TAppDocChildVGrid)
  private
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
    FTableRisk: TAppDBTable;
    FTableEvrakBaslik: TTableUretimRotaKaynakNot;
    vChildForm: TAppDocFormUretimTerminalMenu;
  private
    procedure CreateFormTitle;
    procedure OnClickTitleSave(Sender: TObject);
    procedure OnClickTitleExit(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
    function DoSave: Boolean;
    procedure ShowMessageDlg(aMessage: String);
  protected
    procedure CreateMenuItems; override;
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure Finalize(IniFile: TAppIniFile); override;
    procedure AfterCreate; override;
  public
    destructor Destroy; override;
  published
    property TableRisk: TAppDBTable read FTableRisk;
    property TableEvrakBaslik: TTableUretimRotaKaynakNot read FTableEvrakBaslik write FTableEvrakBaslik;
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
  end;

implementation

uses CPMApp_StrUtils, CPMApp_FieldProp, CPMApp_Images, CPMApp_DOPUretimTerminalVeriGiris;

{ TAppDocChildTerminalRotaKaynakNot }

procedure TAppDocChildTerminalRotaKaynakNot.AfterCreate;
begin
  inherited;
  Self.FormName := 'TerminalUretimRotaKaynakNotForm';
//  Self.Name := 'grTerminalUretimRotaKaynakNot';
  Self.Caption := 'Terminal Uretim Rota Kaynak Not';
  Self.DockPanel.ImageIndex := Integer(aiRisk);
  Self.PipelineName := 'ppTerminalUretimRotaKaynakNot';

//  TableEvrakBaslik := TTableUretimRotaKaynakNot.Create(Self);
//  TableEvrakBaslik.Connection := DocObject.DataObject.Connection;

  Self.TableObject := TableEvrakBaslik;

  with Self.CreateButton('btUretimRotaKaynakNot', Self.Caption, 'Sayfalar') do
    ImageIndex := Integer(aiStokDurum);

  CreateFormTitle;
end;

procedure TAppDocChildTerminalRotaKaynakNot.CreateFormTitle;
begin
  vChildForm := TAppDocFormUretimTerminalMenu.Create(nil);
  vChildForm.PanelGlobal_TopMenu_Description.Caption := 'Not';
  vChildForm.PanelGlobal_TopMenu_ButtonSave.Enabled := true;
  vChildForm.PanelGlobal_TopMenu_ButtonSave.OnClick := OnClickTitleSave;
  vChildForm.PanelGlobal_TopMenu.Parent := Self.Form;

  vChildForm.btTitleBack.OnClick := OnClickTitleBack;
  vChildForm.btTitleExit.OnClick := OnClickTitleExit;

end;

procedure TAppDocChildTerminalRotaKaynakNot.CreateMenuItems;
begin
  inherited;
end;

destructor TAppDocChildTerminalRotaKaynakNot.Destroy;
begin
  vChildForm.Free;
//  FreeAndNil(FRule);
  inherited;
end;

procedure TAppDocChildTerminalRotaKaynakNot.Finalize(IniFile: TAppIniFile);
begin
  inherited;

end;

procedure TAppDocChildTerminalRotaKaynakNot.Initialize(
  IniFile: TAppIniFile);
begin
//  FTableRisk.Connection := TableEvrakBaslik.Connection;
//  FTableRisk.ReadOnly := True;
//  FTableRisk.TableItems.TableNames := 'URTRKN';
//  FTableRisk.Close;
//  FTableRisk.CreateFields;
  inherited;
//  FRule := TAppRuleSelf.Create(Self);
end;

procedure TAppDocChildTerminalRotaKaynakNot.ShowMessageDlg(aMessage: String);
begin
  TAppDOPUretimTerminalVeriGiris(FDocApp)
      .DocCustomProperties.AppForms.AppFormMessageDialog('Kayýt edildi!');
end;

procedure TAppDocChildTerminalRotaKaynakNot.OnClickTitleBack(Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    if TerminalParametre.NotSecim = 'Islem' then
      ShowThisDockPanel(ChildUretimKaynakIslem.DockPanel.Name);
    if TerminalParametre.NotSecim = 'Kalite' then
      ShowThisDockPanel(ChildUretimTerminalKaliteEvrakList.DockPanel.Name)
  end;
end;

procedure TAppDocChildTerminalRotaKaynakNot.OnClickTitleExit(Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildTerminalRotaKaynakNot.OnClickTitleSave(Sender: TObject);
begin
  DoSave;
end;

function TAppDocChildTerminalRotaKaynakNot.DoSave: Boolean;
begin
  if DataApp.DataObject.Save then
  begin
    ShowMessageDlg('Kayýt edildi!');
    TAppDOPUretimTerminalVeriGiris(DocApp).DoOpenDocument;
  end
  else
  begin
    ShowMessageDlg('Hata oluþtu. Ýþlem iptal edilecek!');
    DataApp.DataObject.Cancel;
    Result := false;
  end;
end;


{ TAppRuleSelf }
constructor TAppRuleSelf.Create(AOwner: TAppDocChildTerminalRotaKaynakNot);
begin
  inherited Create;
  FDocChild := AOwner;
  FTableEvrakBaslik := FDocChild.TableEvrakBaslik;
  AddRule(FTableEvrakBaslik);
end;

procedure TAppRuleSelf.DoAfterClose(Table: TAppCustomTable);
begin
end;

procedure TAppRuleSelf.DoAfterOpen(Table: TAppCustomTable);
begin
end;

procedure TAppRuleSelf.DoOnFieldChanged(Table: TAppCustomTable; Field: TField);
begin
//  if not FTableEvrakBaslik.ControlsDisabled then
//  begin
//    if Field = FTableEvrakBaslik.fHesapKod then
//    begin
//    end
//  end;
end;

end.
