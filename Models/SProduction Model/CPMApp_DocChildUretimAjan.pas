unit CPMApp_DocChildUretimAjan;

interface

uses Windows, Messages, SysUtils, Classes, Controls,
  DB, CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DocChildMasterDetail,
  CPMApp_TableUretimSystem;

type

  TAppDocChildUretimAjan = class;

  TAppRuleTableMaster = class(TAppTableRule)
  private
    FDocChild: TAppDocChildUretimAjan;
  protected
    procedure DoBeforeOpen(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDocChildUretimAjan);
  end;

  TAppDocChildUretimAjan = class(TAppDocChildMasterDetail)
  private
    FOldMasterViewKeyDown: TKeyEvent;
    FOldDetailViewKeyDown: TKeyEvent;
    FTableUretimBaslik: TTableUretimBaslik;
    FRuleTableMaster: TAppRuleTableMaster;
    FEvrakTip: Integer;
    FTableUretimKart: TTableUretimKart;
    procedure MasterOnDblClick(Sender: TObject);
    procedure MasterViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DetailOnDblClick(Sender: TObject);
    procedure DetailViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  protected
    procedure AfterCreate; override;
  public
    destructor Destroy; override;
    procedure AddTableMasterWhere;
  published
    property TableUretimBaslik: TTableUretimBaslik read FTableUretimBaslik write FTableUretimBaslik;
    property TableUretimKart: TTableUretimKart read FTableUretimKart write FTableUretimKart;
    property EvrakTip: Integer read FEvrakTip write FEvrakTip;
  end;

implementation

uses
  Variants,
  CPMApp_Dialogs,
  CPMApp_Images,
  CPMApp_TableItems,
  CPMApp_Security,
  CPMApp_DocObjectModel;

{ TAppRuleTable }

constructor TAppRuleTableMaster.Create(AOwner: TAppDocChildUretimAjan);
begin
  inherited Create;
  FDocChild := AOwner;
  AddRule(FDocChild.TableMaster);
end;

procedure TAppRuleTableMaster.DoBeforeOpen(Table: TAppCustomTable);
begin
  if Table.MetaDataOnly then
    exit;
  FDocChild.AddTableMasterWhere;
end;

{ TAppDocChildUretimAjan }

procedure TAppDocChildUretimAjan.AddTableMasterWhere;
var
  ASecWhere: string;
begin
  // EVRBAS
  with TableMaster.TableItems[0].Where do
  begin
    Clear;
    Add('SIRKETNO', wcEqual, AppSecurity.DBCompanyNo).DataType := ftString;
    AddOperator(woAnd);
    Add('EVRAKTIP', wcEqual, EvrakTip);
    ASecWhere := AppSecurity.GetFilters(TableMaster.TableItems[0].Name, TableMaster.TableItems[0].Alias);
    if ASecWhere <> '' then
      AddText(ASecWhere);
  end;
  AddSearchFilter;
  AddFilter;
  AddFindFilter;
  TableMaster.DataSet.CommandText := TableMaster.TableItems.Clause;
end;

procedure TAppDocChildUretimAjan.AfterCreate;
var
  ASecWhere: string;
begin
  inherited;
  // Create Rules
  FRuleTableMaster := TAppRuleTableMaster.Create(Self);

  // Set Settings
  Caption := 'Üretim Ýzleyici';
  DockPanel.ImageIndex := Integer(aiEvrakIzleyici);
  PipelineMasterName := 'ppUretimIzleyiciBaslik';
  PipelineDetailName := 'ppUretimIzleyiciDetay';
  FormName := 'UretimAjanForm';
  AppName := DocObject.Module.AppName +  '\UretimAjan';
  with CreateButton('btUretimAjan', 'Üretim Ýzleyici', 'Sayfalar', 'Ctrl+J') do
    ImageIndex := Integer(aiEvrakIzleyici);
  TableMaster.TableItems.TableNames := VarArrayOf(['URTBAS']);
  TableMaster.TableItems.TableCaptions := VarArrayOf(['Üretim Baþlýk']);
  // URTBAS
  with TableMaster.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('SIRKETNO');
      Add('EVRAKTIP');
      Add('URETIMNO');
      Add('EVRAKTARIH');
    end;
    with Where do
    begin
      Clear;
      AddText('0 = 1')
    end;
  end;
  // MASTER ORDER BY
  with TableMaster.TableItems.OrderBy do
  begin
    Clear;
    Add('EVRAKTARIH', otDesc);
  end;
  TableDetail.TableItems.TableNames := VarArrayOf(['URTKRT', 'STKKRT']);
  TableDetail.TableItems.TableCaptions := VarArrayOf(['Üretim Kartý', 'Stok Kartý']);
  // URTKRT
  with TableDetail.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('URETIMNO');
      Add('URETIMTARIH');
      Add('MAMULKOD');
      Add('MIKTAR');
      Add('HESAPKOD');
      Add('EVRAKNO');
    end;
    with Where do
    begin
      Clear;
      AddField('SIRKETNO', wcEqual, TableMaster.TableItems[0], 'SIRKETNO');
      AddOperator(woAnd);
      AddField('EVRAKTIP', wcEqual, TableMaster.TableItems[0], 'EVRAKTIP');
      AddOperator(woAnd);
      AddField('URETIMNO', wcEqual, TableMaster.TableItems[0], 'URETIMNO');
      ASecWhere := AppSecurity.GetFilters(Name, Alias);
      if ASecWhere <> '' then
      begin
        AddOperator(woAnd);
        AddText(ASecWhere);
      end;
    end;
  end;
  // STKKRT
  with TableDetail.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALAD');
    end;
    with Join do
    begin
      Clear;
      Add('MALKOD', 'MAMULKOD');
    end;
    with Where do
    begin
      Clear;
      ASecWhere := AppSecurity.GetFilters(Name, Alias);
      if ASecWhere <> '' then
        AddText(ASecWhere);
    end;
  end;
  GridViewMaster.OnDblClick := MasterOnDblClick;
  GridViewDetail.OnDblClick := DetailOnDblClick;
  FOldMasterViewKeyDown := GridViewMaster.OnKeyDown;
  FOldDetailViewKeyDown := GridViewDetail.OnKeyDown;
  GridViewMaster.OnKeyDown := MasterViewKeyDown;
  GridViewDetail.OnKeyDown := DetailViewKeyDown;
  DocObject.Macros.AddObject(Self, 'ChildUretimAjan');
end;

destructor TAppDocChildUretimAjan.Destroy;
begin
  FreeAndNil(FRuleTableMaster);
  inherited;
end;

procedure TAppDocChildUretimAjan.DetailOnDblClick(Sender: TObject);
begin

end;

procedure TAppDocChildUretimAjan.DetailViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldDetailViewKeyDown) then
    FOldDetailViewKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
    DetailOnDblClick(nil);
end;

procedure TAppDocChildUretimAjan.MasterOnDblClick(Sender: TObject);
begin
  if FTableUretimKart.RecordCount > 0 then
  begin
    if DocObject.DataObject.IsDataChanged then
    begin
      AppShowMessage('Belge açýk durumda, kaydetdikten yada iptal ettikden sonra belgeye ulaþabilirsiniz.!');
      exit;
    end;
  end;
  DocObject.DataObject.OptionsKey.KeyValues['SIRKETNO'] := AppSecurity.DBCompanyNo;
  DocObject.DataObject.OptionsKey.KeyValues['EVRAKTIP'] := TableMaster.FieldValues['EVRAKTIP'];
  DocObject.DataObject.OptionsKey.KeyValues['URETIMNO'] := TableMaster.FieldValues['URETIMNO'];
  DocObject.DataObject.Open;
  DocObject.MainChild.ShowChild;
end;

procedure TAppDocChildUretimAjan.MasterViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldMasterViewKeyDown) then
    FOldMasterViewKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
    MasterOnDblClick(nil);
end;

end.
