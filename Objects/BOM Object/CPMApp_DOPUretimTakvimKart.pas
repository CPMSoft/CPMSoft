unit CPMApp_DOPUretimTakvimKart;

interface

uses Windows, Classes, SysUtils, Controls, Variants, DB,
  CPMApp_DataObject, CPMApp_DataObjectDB,
  CPMApp_DocObjectModel, CPMApp_DocApp,
  CPMApp_DocChildVGrid,
  CPMApp_DocChildGrid,
  CPMApp_DocChildMasterDetail,
  CPMApp_DOPCustomUretimTakvimKart;

type
  TAppDOPUretimTakvimKart = class;

  TAppRuleUretimTakvimKartAjanDetailOpen = class(TAppTableRule)
  private
    FDOPUretimTakvimKart: TAppDOPUretimTakvimKart;
  protected
    procedure DoBeforeOpen(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDOPUretimTakvimKart);
  end;

  TAppDOPUretimTakvimKart = class(TAppDOPCustomUretimTakvimKart)
  private
    FOldChildUretimTakvimKartAjanOnKeyDown: TKeyEvent;
  private
    FChildUretimTakvimKart: TAppDocChildVGrid;
    FChildUretimTakvimVardiya: TAppDocChildGrid;
    FChildUretimTakvimKartAjan: TAppDocChildMasterDetail;
    // Rules
    FRuleUretimTakvimKartAjanDetailOpen: TAppRuleUretimTakvimKartAjanDetailOpen;
    // Click Events
    procedure ChildUretimTakvimKartAjanOnDblClick(Sender: TObject);
    procedure ChildUretimTakvimKartAjanOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    // Click Events
    // Create Childs;
    procedure CreateChildUretimTakvimKart;
    procedure CreateChildUretimTakvimVardiya;
    procedure CreateChildUretimTakvimKartAjan;
    procedure CreateRules;
    // Procededure
  protected
    procedure CreateDocChilds; override;
    procedure SetReport; override;
    procedure SetDAPSecurity; override;
  public
    procedure TranslationChanged; override;
  published
    property ChildUretimTakvimKart: TAppDocChildVGrid read FChildUretimTakvimKart;
    property ChildUretimTakvimVardiya: TAppDocChildGrid read FChildUretimTakvimVardiya;
    property ChildUretimTakvimKartAjan: TAppDocChildMasterDetail read FChildUretimTakvimKartAjan;
  end;

implementation

uses
  CPMApp_Images, CPMApp_TableItems, 
  CPMApp_BOMConsts, CPMApp_BOMStrs, CPMApp_StrUtils;

{ TAppDOPUretimTakvimKart }

procedure TAppDOPUretimTakvimKart.ChildUretimTakvimKartAjanOnDblClick(
  Sender: TObject);
begin
  with DataApp.DataObject.OptionsKey do
  begin
    KeyValues['TAKVIMKOD'] := ChildUretimTakvimKartAjan.TableMaster.FieldValues['TAKVIMKOD'];
  end;
  DataApp.DataObject.Open;
  ChildUretimTakvimKart.ShowChild;
end;

procedure TAppDOPUretimTakvimKart.ChildUretimTakvimKartAjanOnKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldChildUretimTakvimKartAjanOnKeyDown) then
    FOldChildUretimTakvimKartAjanOnKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
    ChildUretimTakvimKartAjan.GridViewMaster.OnDblClick(Sender);
end;

procedure TAppDOPUretimTakvimKart.CreateChildUretimTakvimKart;
begin
  FChildUretimTakvimKart := DocObject.CreateChild(TAppDocChildVGrid, 'ChildUretimTakvimKart') as TAppDocChildVGrid;
  FChildUretimTakvimKart.Caption := AppGetRS(@AppDOPUretimTakvimKart_ChildUretimTakvimKart);
  FChildUretimTakvimKart.PipelineName := 'ppTakvimKart';
  FChildUretimTakvimKart.TableObject := DataApp.UretimTakvimKart.Table;
  FChildUretimTakvimKart.CreateButton('btUretimTakvimKart', FChildUretimTakvimKart.Caption, 'Sayfalar');
end;

procedure TAppDOPUretimTakvimKart.CreateChildUretimTakvimVardiya;
begin
  FChildUretimTakvimVardiya := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimTakvimVardiya') as TAppDocChildGrid;
  FChildUretimTakvimVardiya.Caption := AppGetRS(@AppDOPUretimTakvimKart_ChildUretimTakvimVardiya);
  FChildUretimTakvimVardiya.PipelineName := 'ppTakvimVardiya';
  FChildUretimTakvimVardiya.TableObject := DataApp.UretimTakvimVardiya.Table;
  FChildUretimTakvimVardiya.CreateButton('btUretimTakvimVardiya', FChildUretimTakvimVardiya.Caption, 'Sayfalar');
end;

procedure TAppDOPUretimTakvimKart.CreateChildUretimTakvimKartAjan;
begin
  FChildUretimTakvimKartAjan := DocObject.CreateChild(TAppDocChildMasterDetail, 'ChildUretimTakvimKartAjan') as TAppDocChildMasterDetail;
  FChildUretimTakvimKartAjan.Caption := AppGetRS(@AppDOPUretimTakvimKart_ChildUretimTakvimKartAjan);
  FChildUretimTakvimKartAjan.FormName := 'UretimTakvimKartAjanForm';
  FChildUretimTakvimKartAjan.AppName := Self.AppName +  '\UretimTakvimKartAjan';
  FChildUretimTakvimKartAjan.PipelineMasterName := 'ppUretimTakvimKartIzleyiciBaslik';
  FChildUretimTakvimKartAjan.PipelineDetailName := 'ppUretimTakvimKartIzleyiciDetay';
  FChildUretimTakvimKartAjan.CreateButton('btUretimTakvimKartAjan', FChildUretimTakvimKartAjan.Caption, 'Sayfalar', 'Ctrl+J');

  FChildUretimTakvimKartAjan.TableMaster.TableItems.TableNames := 'URTTKB';
  FChildUretimTakvimKartAjan.TableMaster.TableItems.TableCaptions := 'Takvim Kartý';
  with FChildUretimTakvimKartAjan.TableMaster.TableItems.OrderBy do
  begin
    Clear;
    Add('TAKVIMKOD');
  end;

  FChildUretimTakvimKartAjan.TableDetail.TableItems.TableNames := 'URTTKV';
  FChildUretimTakvimKartAjan.TableDetail.TableItems.TableCaptions := 'Takvim Vardiya';

  FChildUretimTakvimKartAjan.GridViewMaster.OnDblClick := ChildUretimTakvimKartAjanOnDblClick;
  FOldChildUretimTakvimKartAjanOnKeyDown := FChildUretimTakvimKartAjan.GridViewMaster.OnKeyDown;
  FChildUretimTakvimKartAjan.GridViewMaster.OnKeyDown := ChildUretimTakvimKartAjanOnKeyDown;
end;

procedure TAppDOPUretimTakvimKart.CreateRules;
begin
  if ChildUretimTakvimKartAjan <> nil then
    FRuleUretimTakvimKartAjanDetailOpen := TAppRuleUretimTakvimKartAjanDetailOpen.Create(Self);
end;

procedure TAppDOPUretimTakvimKart.CreateDocChilds;
begin
  inherited;
  CreateChildUretimTakvimKart;
  CreateChildUretimTakvimVardiya;
  CreateChildUretimTakvimKartAjan;

  CreateRules;
end;

procedure TAppDOPUretimTakvimKart.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.UretimTakvimKart.Table, 'URTTKB', 'Üretim Takvim Kart');
  Security.AddTable(DataApp.UretimTakvimVardiya.Table, 'URTTKV', 'Üretim Takvim Vardiya');
end;

procedure TAppDOPUretimTakvimKart.SetReport;
begin
  inherited;
  DocObject.Report.MainTable := DataApp.UretimTakvimKart.Table;
end;

procedure TAppDOPUretimTakvimKart.TranslationChanged;
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

  if AppName = AppBOMConsts.AppName(odtUretimTakvimKart) then
    Caption := AppBOMConsts.Caption(odtUretimTakvimKart);

  SetChildCaption(ChildUretimTakvimKart, AppGetRS(@AppDOPUretimTakvimKart_ChildUretimTakvimKart));
  SetChildCaption(ChildUretimTakvimVardiya, AppGetRS(@AppDOPUretimTakvimKart_ChildUretimTakvimVardiya));
  SetChildCaption(ChildUretimTakvimKartAjan, AppGetRS(@AppDOPUretimTakvimKart_ChildUretimTakvimKartAjan));
end;

{ TAppRuleUretimTakvimKartAjanDetailOpen }

constructor TAppRuleUretimTakvimKartAjanDetailOpen.Create(
  AOwner: TAppDOPUretimTakvimKart);
begin
  inherited Create;
  FDOPUretimTakvimKart := AOwner;
  AddRule(FDOPUretimTakvimKart.ChildUretimTakvimKartAjan.TableDetail);
end;

procedure TAppRuleUretimTakvimKartAjanDetailOpen.DoBeforeOpen(
  Table: TAppCustomTable);
begin
  inherited;
  with Table.TableItems[0].Where do
  begin
    Clear;
    Add('TAKVIMKOD', wcEqual, FDOPUretimTakvimKart.FChildUretimTakvimKartAjan.TableMaster.FieldValues['TAKVIMKOD']).DataType := ftString;
  end;
  FDOPUretimTakvimKart.FChildUretimTakvimKartAjan.TableDetail.DataSet.CommandText := FDOPUretimTakvimKart.FChildUretimTakvimKartAjan.TableDetail.TableItems.Clause;
end;

initialization
  AppRegisterDOPClass(TAppDOPUretimTakvimKart);

end.

