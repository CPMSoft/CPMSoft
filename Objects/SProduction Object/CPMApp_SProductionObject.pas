unit CPMApp_SProductionObject;

interface

uses
  SysUtils, Classes, Forms,
  dcScript,
  dxBar, dxCore,
  CPMApp_DB, CPMApp_ModuleInterface,
  CPMApp_SProductionConsts;

type
  TAppSProductionObject = class(TComponent, IAppModuleInterface, IdxLocalizerListener)
  private
    IMainForm: OleVariant;
    MainForm: TForm;
    Connection: TAppConnection;
    BarManager: TdxBarManager;

    ctgItems: array [TAppSProductionDocGroup] of String;
    subItems: array [TAppSProductionDocGroup] of TdxBarSubItem;
    btnModules: array [TAppSProductionDocType] of TdxBarButton;

    procedure ButtonOnClick(Sender: TObject);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure SetMainForm(AMainForm: OleVariant);
    procedure BeforeExecute;
    procedure AfterExecute;
    procedure BeforeLogOn;
    procedure AfterLogOn;
    procedure BeforeSecurityLogOn;
    procedure AfterSecurityLogOn;
    procedure TranslationChanged;
  end;

implementation

uses
  CPMApp_Dialogs,
  CPMApp_BarHelper,
  CPMApp_Security,
  CPMApp_SProductionCall,
  // Aþaðýdakiler Initialize larý çalýþmasý için eklendi.
  CPMApp_DOPUretim,
  CPMApp_DOPUretimKart,
  CPMApp_DOPEvrakUretimIslem,
  CPMApp_DOPUretimTerminalAyarlar,
  CPMApp_DOPUretimTerminalVeriGiris,
  CPMApp_YenidenMaliyetlendirme;

{ TAppSProductionObject }

constructor TAppSProductionObject.Create(AOwner: TComponent);
begin
  inherited;
  dxResourceStringsRepository.AddListener(Self);
end;

destructor TAppSProductionObject.Destroy;
begin
  dxResourceStringsRepository.RemoveListener(Self);
  inherited;
end;

procedure TAppSProductionObject.SetMainForm(AMainForm: OleVariant);
begin
  IMainForm := AMainForm;
  MainForm := TForm(VarToObject(IMainForm));
  Connection := TAppConnection(VarToObject(IMainForm.AppConnection));
  BarManager := TdxBarManager(VarToObject(IMainForm.BarManager));
end;

procedure TAppSProductionObject.BeforeExecute;
var
  aDocGroup: TAppSProductionDocGroup;
  aDocType: TAppSProductionDocType;
begin
//  DOP2 := TAppDOPUretimTerminal.Create(MainForm, 'DOPUretimTerminal');
//  DOP2.Active := true;
//  DOP2.ShowDockPanel(DOP2.ChildTerminalLogin.DockPanel.Name);

  { -------------------------------------------------------------- }
  for aDocGroup := Low(TAppSProductionDocGroup) to High(TAppSProductionDocGroup) do
  begin
    AppBarHelper.ChangeCategory(BarManager, ctgItems[aDocGroup], AppSProductionConsts.GroupCategory(aDocGroup));
    subItems[aDocGroup] := AppBarHelper.CreateSubItem
                            (
                              BarManager,
                              nil,
                              AppSProductionConsts.GroupSubName(aDocGroup),
                              AppSProductionConsts.GroupCaption(aDocGroup),
                              AppSProductionConsts.GroupCategory(aDocGroup),
                              AppSProductionConsts.GroupImage(aDocGroup)
                            );
  end;

  for aDocType := Low(TAppSProductionDocType) to High(TAppSProductionDocType) do
  begin
    if aDocType <> odtUndefined then
      btnModules[aDocType] := AppBarHelper.CreateButton
                            (
                              BarManager,
                              subItems[AppSProductionConsts.DocGroup(aDocType)],
                              AppSProductionConsts.BtnName(aDocType),
                              AppSProductionConsts.Caption(aDocType),
                              AppSProductionConsts.Category(aDocType),
                              Integer(aDocType),
                              AppSProductionConsts.Image(aDocType),
                              ButtonOnClick,
                              AppSProductionConsts.SecName(aDocType)
                            );
  end;
end;

procedure TAppSProductionObject.AfterExecute;
begin

end;

procedure TAppSProductionObject.BeforeLogOn;
begin

end;

procedure TAppSProductionObject.AfterLogOn;
begin

end;

procedure TAppSProductionObject.BeforeSecurityLogOn;
begin

end;

procedure TAppSProductionObject.AfterSecurityLogOn;
begin

end;

procedure TAppSProductionObject.TranslationChanged;
var
  aDocType: TAppSProductionDocType;
  aDocGroup: TAppSProductionDocGroup;
  aSubItem: TdxBarSubItem;
  aButton: TdxBarButton;
begin
  for aDocGroup := Low(TAppSProductionDocGroup) to High(TAppSProductionDocGroup) do
  begin
    AppBarHelper.ChangeCategory(BarManager, ctgItems[aDocGroup], AppSProductionConsts.GroupCategory(aDocGroup));
    aSubItem := subItems[aDocGroup];
    if Assigned(aSubItem) then
      aSubItem.Caption := AppSProductionConsts.GroupCaption(aDocGroup);
  end;

  for aDocType := Low(TAppSProductionDocType) to High(TAppSProductionDocType) do
  begin
    aButton := btnModules[aDocType];
    if Assigned(aButton) then
      aButton.Caption := AppSProductionConsts.Caption(aDocType);
  end;
end;

procedure TAppSProductionObject.ButtonOnClick(Sender: TObject);
var
  aDocType: TAppSProductionDocType;
  FormYenidenMaliyetlendirme: TFormYenidenMaliyetlendirme;
begin
  aDocType := TAppSProductionDocType(TdxBarButton(Sender).Tag);
  if aDocType = odtSYenidenMaliyetlendirme then
  begin
    if not AppSecurity.CheckMember(AppSProductionConsts.SecName(odtSYenidenMaliyetlendirme), 'Giris') then
    begin
      AppShowMessage('Giriþ hakkýnýz yok!');
      exit;
    end;
    FormYenidenMaliyetlendirme := TFormYenidenMaliyetlendirme.Create(Application);
    FormYenidenMaliyetlendirme.AppName := AppSProductionConsts.AppName(odtSYenidenMaliyetlendirme);
    FormYenidenMaliyetlendirme.Caption := AppSProductionConsts.Caption(odtSYenidenMaliyetlendirme);
    FormYenidenMaliyetlendirme.Show;
  end else
    AppSProductionObjectCall.Open(aDocType);
end;

initialization
  RegisterClass(TAppSProductionObject);
  RegisterAppModule(TAppSProductionObject);

finalization
  UnRegisterClass(TAppSProductionObject);

end.

