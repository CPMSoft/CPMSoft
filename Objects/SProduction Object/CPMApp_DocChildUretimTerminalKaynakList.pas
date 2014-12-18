unit CPMApp_DocChildUretimTerminalKaynakList;

interface

uses
  CPMApp_DocApp,
  CPMApp_Storage,
  CPMApp_DocObjectModel,
  CPMApp_DocChildSearchTable,
  CPMApp_DocChildUretimTerminalProperties,
  CPMApp_DAPCustomUretimKart;

type
  TAppDocChildUretimTerminalKaynakList = class;

  TAppDocChildUretimTerminalKaynakList = class(TAppDocChildSearchTable)
  private
    fDataApp: TAppDAPCustomUretimKart;
    fDocApp: TAppDocApp;
    procedure OnClickTitleRefresh(Sender: TObject);
    procedure OnClickTitleExit(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
    procedure AddDocumentOnClick(Sender: TObject; AButtonIndex: Integer);
    procedure CreateGridButtons;
  protected
    procedure CreateObjects;
    procedure CreateTitlePanel;
    procedure AfterCreate; override;
  public
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;

    destructor Destroy; override;
  published
    property DataApp: TAppDAPCustomUretimKart read fDataApp write fDataApp;
    property DocApp: TAppDocApp read fDocApp write fDocApp;
  end;

  implementation

uses
  Forms,
  Variants,
  CPMApp_BOMConsts,
  CPMApp_DOPUretimTerminalVeriGiris,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_DocFormUretimTerminalNumPad;

{ TAppDocChildUretimTerminalKaynakList }

procedure TAppDocChildUretimTerminalKaynakList.AddDocumentOnClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakListOnDblClick(Sender);
end;

procedure TAppDocChildUretimTerminalKaynakList.AfterCreate;
begin
  inherited;
  Self.Caption := 'Kaynak Listesi';
  Self.PipelineName := 'ppUretimTerminalKaynakIzleyici';
  Self.Table.TableItems.TableNames := VarArrayOf(['URTTEK', 'URTKYN', 'PERKRT']);
  Self.Table.IndexFieldNames := 'TERMINALKOD;PERKRT_SICILKOD';
  with Self.Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
    //  AddExpression('(Select COUNT(OPDURUM) From URTROK Where URTROK.KAYNAKKOD = URTTEK.KAYNAKKOD And URTROK.OPDURUM In (0, 1, 10, 40))', '__EVRAKMIKTAR');
    end;
  end;

  with Self.Table.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('KAYNAKAD');
//      Add('KURULUMSURE');
//      Add('CALISMASURE');
//      Add('SOKUMSURE');
    end;
    with Join do
    begin
      Add('KAYNAKKOD', 'KAYNAKKOD');
    end;
  end;

  with Self.Table.TableItems[2] do
  begin
    with Fields do
    begin
      Clear;
      Add('SICILKOD');
      Add('AD');
      Add('SOYAD');
    end;
    with Join do
    begin
      Add('SICILKOD', 'SICILKOD');
    end;
  end;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalKaynakList.CreateObjects;
begin
end;

procedure TAppDocChildUretimTerminalKaynakList.CreateTitlePanel;
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.CreateTitlePanel(TForm(Self.Form), 'Kaynaklar', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

procedure TAppDocChildUretimTerminalKaynakList.CreateGridButtons;
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

procedure TAppDocChildUretimTerminalKaynakList.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitlePanel;
  CreateGridButtons;
  Self.GridView.OptionsData.Editing := true;
  Self.ToolBar.Visible := false;
end;

destructor TAppDocChildUretimTerminalKaynakList.Destroy;
begin
  inherited;
end;

procedure TAppDocChildUretimTerminalKaynakList.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;


procedure TAppDocChildUretimTerminalKaynakList.OnClickTitleBack(Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalKaynakList.OnClickTitleExit(Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalKaynakList.OnClickTitleRefresh(
  Sender: TObject);
begin
  DataApp.DataObject.Cancel;
end;

end.
