unit CPMApp_DocFormKaynakKart;

interface

uses
  CPMApp_DocObjectModel,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxStyles, cxEdit,
  cxScheduler, cxSchedulerStorage, cxSchedulerCustomControls,
  cxSchedulerCustomResourceView, cxSchedulerDayView, cxSchedulerDateNavigator,
  cxSchedulerHolidays, cxSchedulerTimeGridView, cxSchedulerUtils,
  cxSchedulerWeekView, cxSchedulerYearView, cxSchedulerGanttView, cxContainer,
  dxSkinsdxBarPainter, ImgList, cxSchedulerDBStorage, dxBar, dxBarExtItems,
  cxClasses, DB, cxDropDownEdit, cxImageComboBox, cxLabel, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxTimeEdit, ExtCtrls, cxTrackBar;

type
  TAppDocFormKaynakKart = class(TForm, IAppDocChildForm)
    GanttMainTrackBar: TcxTrackBar;
    Panel1: TPanel;
    GanttMainStartTime: TcxTimeEdit;
    GanttMainFinishTime: TcxTimeEdit;
    ImageComboGanttCaption: TcxImageComboBox;
    DataSourceGantt: TDataSource;
    GanttBarManager: TdxBarManager;
    dxBarManager1Bar2: TdxBar;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    seResourceCount: TdxBarSpinEdit;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    btShowResources: TdxBarButton;
    btShowDateNavigator: TdxBarButton;
    dxBarButton1: TdxBarButton;
    btnResources: TdxBarButton;
    btGanttAylik: TdxBarButton;
    btViewWeeks: TdxBarButton;
    btViewDay: TdxBarButton;
    btViewGantt: TdxBarButton;
    dxBarControlContainerItem4: TdxBarControlContainerItem;
    GanttDBStorage: TcxSchedulerDBStorage;
    DataSourceResources: TDataSource;
    cxImageList1: TcxImageList;
    GanttMain: TcxScheduler;
    ImageComboGanttSource: TcxImageComboBox;
    dxBarControlContainerItem3: TdxBarControlContainerItem;
    procedure ImageComboGanttCaptionPropertiesChange(Sender: TObject);
  private
    function GetMainControl: TWinControl;
    procedure TranslationChanged;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetDocChild: TAppDocChild;
    procedure SetDocChild(Value: TAppDocChild);
  published
    property DocChild: TAppDocChild read GetDocChild write SetDocChild;
//    property DataApp: TAppDAPCustomCRPKart read FDataApp write FDataApp;
//    property DocBaslik: TAppDocChildGantt read FDocBaslik write FDocBaslik;
  end;


var
  AppDocFormKaynakKart: TAppDocFormKaynakKart;

implementation

{$R *.dfm}

procedure TAppDocFormKaynakKart.ImageComboGanttCaptionPropertiesChange(Sender: TObject);
begin
  GanttDBStorage.FieldNames.Caption := ImageComboGanttCaption.EditingValue;
  GanttMain.Refresh;
end;

constructor TAppDocFormKaynakKart.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TAppDocFormKaynakKart.Destroy;
begin

  inherited;
end;

function TAppDocFormKaynakKart.GetDocChild: TAppDocChild;
begin

end;

procedure TAppDocFormKaynakKart.SetDocChild(Value: TAppDocChild);
begin

end;

function TAppDocFormKaynakKart.GetMainControl: TWinControl;
begin
  Result := Self;
end;

procedure TAppDocFormKaynakKart.TranslationChanged;
begin
  inherited;

end;

end.
