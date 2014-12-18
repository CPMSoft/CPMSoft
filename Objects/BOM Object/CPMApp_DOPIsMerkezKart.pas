unit CPMApp_DOPIsMerkezKart;

interface

uses Windows, Classes, SysUtils, Controls, Variants, DB,
  CPMApp_DataObject, CPMApp_DataObjectDB,
  CPMApp_DocObjectModel, CPMApp_DocApp,
  CPMApp_DocChildMultiVGrid,
  CPMApp_DocChildGrid,
  CPMApp_DocChildMasterDetail,
  CPMApp_DOPCustomIsMerkezKart;

type
  TAppDOPIsMerkezKart = class;

  TAppRuleIsMerkezKartAjanDetailOpen = class(TAppTableRule)
  private
    FDOPIsMerkezKart: TAppDOPIsMerkezKart;
  protected
    procedure DoBeforeOpen(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDOPIsMerkezKart);
  end;

  TAppDOPIsMerkezKart = class(TAppDOPCustomIsMerkezKart)
  private
    FOldChildIsMerkezKartAjanOnKeyDown: TKeyEvent;
  private
    FChildIsMerkezKart: TAppDocChildMultiVGrid;
    FChildIsMerkezKartAjan: TAppDocChildMasterDetail;
    FChildIsMerkezKaynak: TAppDocChildGrid;
    // Rules
    FRuleIsMerkezKartAjanDetailOpen: TAppRuleIsMerkezKartAjanDetailOpen;
    // Click Events
    procedure ChildIsMerkezKartAjanOnDblClick(Sender: TObject);
    procedure ChildIsMerkezKartAjanOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    // Click Events
    // Create Childs;
    procedure CreateChildIsMerkezKart;
    procedure CreateChildIsMerkezKaynak;
    procedure CreateChildIsMerkezKartAjan;
    procedure CreateRules;
    // Procededure
  protected
    procedure CreateDocChilds; override;
    procedure SetReport; override;
    procedure SetDAPSecurity; override;
  public
    procedure TranslationChanged; override;
  published
    property ChildIsMerkezKart: TAppDocChildMultiVGrid read FChildIsMerkezKart;
    property ChildIsMerkezKaynak: TAppDocChildGrid read FChildIsMerkezKaynak;
    property ChildIsMerkezKartAjan: TAppDocChildMasterDetail read FChildIsMerkezKartAjan;
  end;

implementation

uses
  CPMApp_BOMConsts, CPMApp_BOMStrs, CPMApp_StrUtils, CPMApp_TableItems;

{ TAppDOPIsMerkezKart }

procedure TAppDOPIsMerkezKart.ChildIsMerkezKartAjanOnDblClick(
  Sender: TObject);
begin
  with DataApp.DataObject.OptionsKey do
  begin
    KeyValues['ISMERKEZKOD'] := ChildIsMerkezKartAjan.TableMaster.FieldValues['ISMERKEZKOD'];
  end;
  DataApp.DataObject.Open;
  ChildIsMerkezKart.ShowChild;
end;

procedure TAppDOPIsMerkezKart.ChildIsMerkezKartAjanOnKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldChildIsMerkezKartAjanOnKeyDown) then
    FOldChildIsMerkezKartAjanOnKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
    ChildIsMerkezKartAjan.GridViewMaster.OnDblClick(Sender);
end;

procedure TAppDOPIsMerkezKart.CreateChildIsMerkezKart;
begin
  FChildIsMerkezKart := DocObject.CreateChild(TAppDocChildMultiVGrid, 'ChildIsMerkezKart') as TAppDocChildMultiVGrid;
  FChildIsMerkezKart.Caption := AppGetRS(@AppDOPIsMerkezKart_ChildIsMerkezKart);
  FChildIsMerkezKart.TableObject := DataApp.IsMerkezKart.Table;
  FChildIsMerkezKart.CreateButton('btIsMerkezKart', FChildIsMerkezKart.Caption, 'Sayfalar');
end;

procedure TAppDOPIsMerkezKart.CreateChildIsMerkezKaynak;
begin
  FChildIsMerkezKaynak := DocObject.CreateChild(TAppDocChildGrid, 'ChildIsMerkezKaynak') as TAppDocChildGrid;
  FChildIsMerkezKaynak.Caption := AppGetRS(@AppDOPIsMerkezKart_ChildIsMerkezKaynak);
  FChildIsMerkezKaynak.TableObject := DataApp.IsMerkezKaynak.Table;
  FChildIsMerkezKaynak.CreateButton('btIsMerkezKaynak', FChildIsMerkezKaynak.Caption, 'Sayfalar');
end;

procedure TAppDOPIsMerkezKart.CreateChildIsMerkezKartAjan;
begin
  FChildIsMerkezKartAjan := DocObject.CreateChild(TAppDocChildMasterDetail, 'ChildIsMerkezKartAjan') as TAppDocChildMasterDetail;
  FChildIsMerkezKartAjan.Caption := AppGetRS(@AppDOPIsMerkezKart_ChildIsMerkezKartAjan);
  FChildIsMerkezKartAjan.FormName := 'UretimIsMerkezKartAjanForm';
  FChildIsMerkezKartAjan.AppName := Self.AppName +  '\UretimIsMerkezKartAjan';
  FChildIsMerkezKartAjan.PipelineMasterName := 'UretimIsMerkezKartIzleyiciBaslik';
  FChildIsMerkezKartAjan.PipelineDetailName := 'UretimIsMerkezKartIzleyiciDetay';
  FChildIsMerkezKartAjan.CreateButton('btUretimIsMerkezKartAjan', FChildIsMerkezKartAjan.Caption, 'Sayfalar', 'Ctrl+J');

  FChildIsMerkezKartAjan.TableMaster.TableItems.TableNames := 'URTISM';
  FChildIsMerkezKartAjan.TableMaster.TableItems.TableCaptions := 'Ýþ Merkezi Kartý';
  with FChildIsMerkezKartAjan.TableMaster.TableItems.OrderBy do
  begin
    Clear;
    Add('ISMERKEZKOD');
  end;
  with FChildIsMerkezKartAjan.TableMaster.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('ISMERKEZKOD');
      Add('ISMERKEZAD');
    end;
  end;

  FChildIsMerkezKartAjan.TableDetail.TableItems.TableNames := VarArrayOf(['URTISK', 'URTKYN']);
  FChildIsMerkezKartAjan.TableDetail.TableItems.TableCaptions := VarArrayOf(['Ýþ Merkezi Kaynak', 'Üretim Kaynak']);
  with FChildIsMerkezKartAjan.TableDetail.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
    end;
  end;
  with FChildIsMerkezKartAjan.TableDetail.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('KAYNAKAD');
    end;
    with Join do
    begin
      Clear;
      Add('KAYNAKKOD', 'KAYNAKKOD');
    end;
  end;

  FChildIsMerkezKartAjan.GridViewMaster.OnDblClick := ChildIsMerkezKartAjanOnDblClick;
  FOldChildIsMerkezKartAjanOnKeyDown := FChildIsMerkezKartAjan.GridViewMaster.OnKeyDown;
  FChildIsMerkezKartAjan.GridViewMaster.OnKeyDown := ChildIsMerkezKartAjanOnKeyDown;
end;

procedure TAppDOPIsMerkezKart.CreateRules;
begin
  if ChildIsMerkezKartAjan <> nil then
    FRuleIsMerkezKartAjanDetailOpen := TAppRuleIsMerkezKartAjanDetailOpen.Create(Self);
end;

procedure TAppDOPIsMerkezKart.CreateDocChilds;
begin
  inherited;
  CreateChildIsMerkezKart;
  CreateChildIsMerkezKaynak;
  CreateChildIsMerkezKartAjan;

  CreateRules;
end;

procedure TAppDOPIsMerkezKart.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.IsMerkezKart.Table, 'URTISM', 'Ýþ Merkez Kart');
end;

procedure TAppDOPIsMerkezKart.SetReport;
begin
  inherited;
  DocObject.Report.MainTable := DataApp.IsMerkezKart.Table;
end;

procedure TAppDOPIsMerkezKart.TranslationChanged;
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

  if AppName = AppBOMConsts.AppName(odtIsMerkezKart) then
    Caption := AppBOMConsts.Caption(odtIsMerkezKart);

  SetChildCaption(ChildIsMerkezKart, AppGetRS(@AppDOPIsMerkezKart_ChildIsMerkezKart));
  SetChildCaption(ChildIsMerkezKaynak, AppGetRS(@AppDOPIsMerkezKart_ChildIsMerkezKaynak));
  SetChildCaption(ChildIsMerkezKartAjan, AppGetRS(@AppDOPIsMerkezKart_ChildIsMerkezKartAjan));
end;

{ TAppRuleIsMerkezKartAjanDetailOpen }

constructor TAppRuleIsMerkezKartAjanDetailOpen.Create(
  AOwner: TAppDOPIsMerkezKart);
begin
  inherited Create;
  FDOPIsMerkezKart := AOwner;
  AddRule(FDOPIsMerkezKart.ChildIsMerkezKartAjan.TableDetail);
end;

procedure TAppRuleIsMerkezKartAjanDetailOpen.DoBeforeOpen(
  Table: TAppCustomTable);
begin
  inherited;
  with Table.TableItems[0].Where do
  begin
    Clear;
    Add('ISMERKEZKOD', wcEqual, FDOPIsMerkezKart.FChildIsMerkezKartAjan.TableMaster.FieldValues['ISMERKEZKOD']).DataType := ftString;
  end;
  FDOPIsMerkezKart.FChildIsMerkezKartAjan.TableDetail.DataSet.CommandText := FDOPIsMerkezKart.FChildIsMerkezKartAjan.TableDetail.TableItems.Clause;
end;

initialization
  AppRegisterDOPClass(TAppDOPIsMerkezKart);

end.
