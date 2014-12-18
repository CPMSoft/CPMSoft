unit CPMApp_BOMObject;

interface

uses
  SysUtils, Classes, Forms,
  dcScript,
  dxBar, dxCore, 
  CPMApp_DB, CPMApp_ModuleInterface,
  CPMApp_BOMConsts;

type
  TAppBOMObject = class(TComponent, IAppModuleInterface, IdxLocalizerListener)
  private
    IMainForm: OleVariant;
    MainForm: TForm;
    Connection: TAppConnection;
    BarManager: TdxBarManager;

    ctgItems: array [TAppBOMDocGroup] of String;
    subItems: array [TAppBOMDocGroup] of TdxBarSubItem;
    btnModules: array [TAppBOMDocType] of TdxBarButton;

    procedure ButtonOnClick(Sender: TObject);
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
  CPMApp_BarHelper,
  CPMApp_BOMCall,
  // Aþaðýdakiler Initialize larý çalýþmasý için eklendi.
  CPMApp_DOPIsMerkezKart,
  CPMApp_DOPMamulKart,
  CPMApp_DOPMamulKullanimKart,
  CPMApp_DOPMRPParametreKart,
  CPMApp_DOPStokKarsilamaPolitika,
  CPMApp_DOPUretimDurusKart,
  CPMApp_DOPUretimHataKart,
  CPMApp_DOPUretimKaynakKart,
  CPMApp_DOPUretimParametreKart,
  CPMApp_DOPUretimTakvimKart,
  CPMApp_DOPUretimVardiyaKart,
  CPMApp_DOPUretimYilKart;

{ TAppBOMObject }

constructor TAppBOMObject.Create(AOwner: TComponent);
begin
  inherited;
  dxResourceStringsRepository.AddListener(Self);
end;

destructor TAppBOMObject.Destroy;
begin
  dxResourceStringsRepository.RemoveListener(Self);
  inherited;
end;

procedure TAppBOMObject.SetMainForm(AMainForm: OleVariant);
begin
  IMainForm := AMainForm;
  MainForm := TForm(VarToObject(IMainForm));
  Connection := TAppConnection(VarToObject(IMainForm.AppConnection));
  BarManager := TdxBarManager(VarToObject(IMainForm.BarManager));
end;

procedure TAppBOMObject.BeforeExecute;
var
  aDocGroup: TAppBOMDocGroup;
  aDocType: TAppBOMDocType;
begin
  for aDocGroup := Low(TAppBOMDocGroup) to High(TAppBOMDocGroup) do
  begin
    AppBarHelper.ChangeCategory(BarManager, ctgItems[aDocGroup], AppBOMConsts.GroupCategory(aDocGroup));
    subItems[aDocGroup] := AppBarHelper.CreateSubItem
                            (
                              BarManager,
                              subItems[aDocGroup],
                              AppBOMConsts.GroupSubName(aDocGroup),
                              AppBOMConsts.GroupCaption(aDocGroup),
                              AppBOMConsts.GroupCategory(aDocGroup),
                              AppBOMConsts.GroupImage(aDocGroup)
                            );
  end;

  for aDocType := Low(TAppBOMDocType) to high(TAppBOMDocType) do
  begin
    if aDocType <> odtUndefined then
      btnModules[aDocType] := AppBarHelper.CreateButton
                            (
                              BarManager,
                              subItems[AppBOMConsts.DocGroup(aDocType)],
                              AppBOMConsts.BtnName(aDocType),
                              AppBOMConsts.Caption(aDocType),
                              AppBOMConsts.Category(aDocType),
                              Integer(aDocType),
                              AppBOMConsts.Image(aDocType),
                              ButtonOnClick,
                              AppBOMConsts.SecName(aDocType)
                            );
  end;
end;

procedure TAppBOMObject.AfterExecute;
begin

end;

procedure TAppBOMObject.BeforeLogOn;
begin

end;

procedure TAppBOMObject.AfterLogOn;
begin

end;

procedure TAppBOMObject.BeforeSecurityLogOn;
begin

end;

procedure TAppBOMObject.AfterSecurityLogOn;
begin

end;

procedure TAppBOMObject.TranslationChanged;
var
  aDocType: TAppBOMDocType;
  aDocGroup: TAppBOMDocGroup;
  aSubItem: TdxBarSubItem;
  aButton: TdxBarButton;
begin
  for aDocGroup := Low(TAppBOMDocGroup) to High(TAppBOMDocGroup) do
  begin
    AppBarHelper.ChangeCategory(BarManager, ctgItems[aDocGroup], AppBOMConsts.GroupCategory(aDocGroup));
    aSubItem := subItems[aDocGroup];
    if Assigned(aSubItem) then
      aSubItem.Caption := AppBOMConsts.GroupCaption(aDocGroup);
  end;

  for aDocType := Low(TAppBOMDocType) to High(TAppBOMDocType) do
  begin
    aButton := btnModules[aDocType];
    if Assigned(aButton) then
      aButton.Caption := AppBOMConsts.Caption(aDocType);
  end;
end;

procedure TAppBOMObject.ButtonOnClick(Sender: TObject);
begin
  AppBOMObjectCall.Open(TAppBOMDocType(TdxBarButton(Sender).Tag));
end;

initialization
  RegisterClass(TAppBOMObject);
  RegisterAppModule(TAppBOMObject);

finalization
  UnRegisterClass(TAppBOMObject);
end.
