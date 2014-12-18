unit CPMApp_DOPUretimYilKart;

interface

uses Windows, Classes, SysUtils, Controls, Variants, DB,
  CPMApp_DataObject, CPMApp_DataObjectDB,
  CPMApp_DocObjectModel, CPMApp_DocApp,
  CPMApp_DocChildVGrid,
  CPMApp_DocChildGrid,
  CPMApp_DocChildMasterDetail,
  CPMApp_DOPCustomUretimYilKart;

type
  TAppDOPUretimYilKart = class;

  TAppRuleUretimYilKartAjanDetailOpen = class(TAppTableRule)
  private
    FDOPUretimYilKart: TAppDOPUretimYilKart;
  protected
    procedure DoBeforeOpen(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDOPUretimYilKart);
  end;

  TAppDOPUretimYilKart = class(TAppDOPCustomUretimYilKart)
  private
    FOldChildUretimYilKartAjanOnKeyDown: TKeyEvent;
  private
    FChildUretimYilKart: TAppDocChildVGrid;
    FChildUretimYilTatil: TAppDocChildGrid;
    FChildUretimYilKartAjan: TAppDocChildMasterDetail;
    // Rules
    FRuleUretimYilKartAjanDetailOpen: TAppRuleUretimYilKartAjanDetailOpen;
    // Click Events
    procedure ChildUretimYilKartAjanOnDblClick(Sender: TObject);
    procedure ChildUretimYilKartAjanOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    // Click Events
    // Create Childs;
    procedure CreateChildUretimYilKart;
    procedure CreateChildUretimYilTatil;
    procedure CreateChildUretimYilKartAjan;
    procedure CreateRules;
    // Procededure
  protected
    procedure CreateDocChilds; override;
    procedure SetReport; override;
    procedure SetDAPSecurity; override;
  public
    procedure TranslationChanged; override;
  published
    property ChildUretimYilKart: TAppDocChildVGrid read FChildUretimYilKart;
    property ChildUretimYilTatil: TAppDocChildGrid read FChildUretimYilTatil;
    property ChildUretimYilKartAjan: TAppDocChildMasterDetail read FChildUretimYilKartAjan;
  end;

implementation

uses
  CPMApp_Images, CPMApp_TableItems, 
  CPMApp_BOMConsts, CPMApp_BOMStrs, CPMApp_StrUtils;

{ TAppDOPUretimYilKart }

procedure TAppDOPUretimYilKart.ChildUretimYilKartAjanOnDblClick(
  Sender: TObject);
begin
  with DataApp.DataObject.OptionsKey do
  begin
    KeyValues['TAKVIMYIL'] := ChildUretimYilKartAjan.TableMaster.FieldValues['TAKVIMYIL'];
  end;
  DataApp.DataObject.Open;
  ChildUretimYilKart.ShowChild;
end;

procedure TAppDOPUretimYilKart.ChildUretimYilKartAjanOnKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldChildUretimYilKartAjanOnKeyDown) then
    FOldChildUretimYilKartAjanOnKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
    ChildUretimYilKartAjan.GridViewMaster.OnDblClick(Sender);
end;

procedure TAppDOPUretimYilKart.CreateChildUretimYilKart;
begin
  FChildUretimYilKart := DocObject.CreateChild(TAppDocChildVGrid, 'ChildUretimYilKart') as TAppDocChildVGrid;
  FChildUretimYilKart.Caption := AppGetRS(@AppDOPUretimYilKart_ChildUretimYilKart);
  FChildUretimYilKart.TableObject := DataApp.UretimYilKart.Table;
  FChildUretimYilKart.CreateButton('btUretimYilKart', FChildUretimYilKart.Caption, 'Sayfalar');
end;

procedure TAppDOPUretimYilKart.CreateChildUretimYilTatil;
begin
  FChildUretimYilTatil := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimYilTatil') as TAppDocChildGrid;
  FChildUretimYilTatil.Caption := AppGetRS(@AppDOPUretimYilKart_ChildUretimYilTatil);
  FChildUretimYilTatil.TableObject := DataApp.UretimYilTatil.Table;
  FChildUretimYilTatil.CreateButton('btUretimYilTatil', FChildUretimYilTatil.Caption, 'Sayfalar');
end;

procedure TAppDOPUretimYilKart.CreateChildUretimYilKartAjan;
begin
  FChildUretimYilKartAjan := DocObject.CreateChild(TAppDocChildMasterDetail, 'ChildUretimYilKartAjan') as TAppDocChildMasterDetail;
  FChildUretimYilKartAjan.Caption := AppGetRS(@AppDOPUretimYilKart_ChildUretimYilKartAjan);
  FChildUretimYilKartAjan.FormName := 'UretimYilKartAjanForm';
  FChildUretimYilKartAjan.AppName := Self.AppName +  '\UretimYilKartAjan';
  FChildUretimYilKartAjan.PipelineMasterName := 'ppYilKartIzleyiciBaslik';
  FChildUretimYilKartAjan.PipelineDetailName := 'ppYilKartIzleyiciDetay';
  FChildUretimYilKartAjan.CreateButton('btUretimYilKartAjan', FChildUretimYilKartAjan.Caption, 'Sayfalar', 'Ctrl+J');

  FChildUretimYilKartAjan.TableMaster.TableItems.TableNames := 'URTYIL';
  FChildUretimYilKartAjan.TableMaster.TableItems.TableCaptions := 'Yil Kartý';
  with FChildUretimYilKartAjan.TableMaster.TableItems.OrderBy do
  begin
    Clear;
    Add('TAKVIMYIL');
  end;

  FChildUretimYilKartAjan.TableDetail.TableItems.TableNames := 'URTYRT';
  FChildUretimYilKartAjan.TableDetail.TableItems.TableCaptions := 'Tatil Tarihleri';

  FChildUretimYilKartAjan.GridViewMaster.OnDblClick := ChildUretimYilKartAjanOnDblClick;
  FOldChildUretimYilKartAjanOnKeyDown := FChildUretimYilKartAjan.GridViewMaster.OnKeyDown;
  FChildUretimYilKartAjan.GridViewMaster.OnKeyDown := ChildUretimYilKartAjanOnKeyDown;
end;

procedure TAppDOPUretimYilKart.CreateRules;
begin
  if ChildUretimYilKartAjan <> nil then
    FRuleUretimYilKartAjanDetailOpen := TAppRuleUretimYilKartAjanDetailOpen.Create(Self);
end;

procedure TAppDOPUretimYilKart.CreateDocChilds;
begin
  inherited;
  CreateChildUretimYilKart;
  CreateChildUretimYilTatil;
  CreateChildUretimYilKartAjan;

  CreateRules;
end;

procedure TAppDOPUretimYilKart.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.UretimYilKart.Table, 'URTYIL', 'Üretim Yýl Kart');
  Security.AddTable(DataApp.UretimYilTatil.Table, 'URTYRT', 'Üretim Yýl Tatil');
end;

procedure TAppDOPUretimYilKart.SetReport;
begin
  inherited;
  DocObject.Report.MainTable := DataApp.UretimYilKart.Table;
end;

procedure TAppDOPUretimYilKart.TranslationChanged;
  procedure SetChildCaption(aChild: TAppDocChild; aCaption: String; const aButtonCaption: String = '');
  begin
    if aChild <> nil then
    begin
      aChild.Caption := aCaption;
      if aButtonCaption <> '' then
        aChild.ButtonCaption := aButtonCaption;
    end;
  end;
begin
  inherited;

  if AppName = AppBOMConsts.AppName(odtUretimYilKart) then
    Caption := AppBOMConsts.Caption(odtUretimYilKart);

  SetChildCaption(ChildUretimYilKart, AppGetRS(@AppDOPUretimYilKart_ChildUretimYilKart));
  SetChildCaption(ChildUretimYilTatil, AppGetRS(@AppDOPUretimYilKart_ChildUretimYilTatil));
  SetChildCaption(ChildUretimYilKartAjan, AppGetRS(@AppDOPUretimYilKart_ChildUretimYilKartAjan));
end;

{ TAppRuleUretimYilKartAjanDetailOpen }

constructor TAppRuleUretimYilKartAjanDetailOpen.Create(
  AOwner: TAppDOPUretimYilKart);
begin
  inherited Create;
  FDOPUretimYilKart := AOwner;
  AddRule(FDOPUretimYilKart.ChildUretimYilKartAjan.TableDetail);
end;

procedure TAppRuleUretimYilKartAjanDetailOpen.DoBeforeOpen(
  Table: TAppCustomTable);
begin
  inherited;
  with Table.TableItems[0].Where do
  begin
    Clear;
    Add('TAKVIMYIL', wcEqual, FDOPUretimYilKart.FChildUretimYilKartAjan.TableMaster.FieldValues['TAKVIMYIL']).DataType := ftSmallint;
  end;
  FDOPUretimYilKart.FChildUretimYilKartAjan.TableDetail.DataSet.CommandText := FDOPUretimYilKart.FChildUretimYilKartAjan.TableDetail.TableItems.Clause;
end;

initialization
  AppRegisterDOPClass(TAppDOPUretimYilKart);

end.

