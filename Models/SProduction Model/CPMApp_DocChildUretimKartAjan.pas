unit CPMApp_DocChildUretimKartAjan;

interface

uses Windows, Messages, SysUtils, Classes, Controls,
  DB, CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DocChildSearchTable,
  CPMApp_TableUretimSystem;

type

  TAppDocChildUretimKartAjan = class;

  TAppRuleTable = class(TAppTableRule)
  private
    FDocChild: TAppDocChildUretimKartAjan;
  protected
    procedure DoBeforeOpen(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDocChildUretimKartAjan);
  end;

  TAppDocChildUretimKartAjan = class(TAppDocChildSearchTable)
  private
    FOldViewKeyDown: TKeyEvent;
    FRuleTable: TAppRuleTable;
    FEvrakTip: Integer;
    FTableUretimKart: TTableUretimKart;
    procedure OnDblClick(Sender: TObject);
    procedure ViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  protected
    procedure AfterCreate; override;
  public
    destructor Destroy; override;
    procedure AddTableWhere;
  published
    property TableUretimKart: TTableUretimKart read FTableUretimKart write FTableUretimKart;
    property EvrakTip: Integer read FEvrakTip write FEvrakTip;
  end;

implementation

uses
  Variants,
  CPMApp_Dialogs,
  CPMApp_Images,
  CPMApp_TableItems,
  CPMApp_Security;

{ TAppRuleTable }

constructor TAppRuleTable.Create(AOwner: TAppDocChildUretimKartAjan);
begin
  inherited Create;
  FDocChild := AOwner;
  AddRule(FDocChild.Table);
end;

procedure TAppRuleTable.DoBeforeOpen(Table: TAppCustomTable);
begin
  if Table.MetaDataOnly then
    exit;
  FDocChild.AddTableWhere;
end;

{ TAppDocChildUretimKartAjan }

procedure TAppDocChildUretimKartAjan.AddTableWhere;
var
  ASecWhere: String;
begin
  with Table.TableItems[0].Where do
  begin
    Clear;
    Add('SIRKETNO', wcEqual, DocObject.Module.CompanyNo).DataType := ftString;
    AddOperator(woAnd);
    Add('EVRAKTIP', wcEqual, EvrakTip);
    ASecWhere := AppSecurity.GetFilters(Table.TableItems[0].Name, Table.TableItems[0].Alias);
    if ASecWhere <> '' then
    begin
      AddOperator(woAnd);
      AddText(ASecWhere);
    end;
  end;
  AddSearchFilter;
  AddFilter;
  AddFindFilter;
  Table.DataSet.CommandText := Table.TableItems.Clause;
end;

procedure TAppDocChildUretimKartAjan.AfterCreate;
begin
  inherited;
  // Create Rules
  FRuleTable := TAppRuleTable.Create(Self);
  // Set Settings
  Caption := 'Üretim Kart Ýzleyici';
  DockPanel.ImageIndex := Integer(aiHareketIzleyici);
  AppName := DocObject.Module.AppName +  '\UretimKartAjan';
  FormName := 'UretimKartAjanForm';
  with CreateButton('btUretimKartAjan', 'Üretim Kart Ýzleyici', 'Sayfalar', 'Ctrl+L') do
    ImageIndex := Integer(aiHareketIzleyici);

  Table.TableItems.TableNames := VarArrayOf(['URTKRT', 'URTBAS', 'STKKRT']);
  Table.TableItems.TableCaptions := VarArrayOf(['Üretim Kartý', 'Üretim Baþlýk', 'Stok Kart']);
  //URTKRT
  with Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('SIRKETNO');
      Add('URETIMNO');
      Add('URETIMTARIH');
      Add('EVRAKTIP');
      Add('HESAPKOD');
      Add('EVRAKNO');
      Add('EVRAKTARIH');
      Add('MAMULKOD');
      Add('MIKTAR');
    end;
    with Where do
    begin
      Add('SIRKETNO', wcEqual, DocObject.Module.CompanyNo);
      AddOperator(woAnd);
      Add('EVRAKTIP', wcEqual, FEvrakTip);
    end;
  end;
  // URTBAS
  with Table.TableItems[1] do
  begin
    with join do
    begin
      Add('SIRKETNO', 'SIRKETNO');
      Add('EVRAKTIP', 'EVRAKTIP');
      Add('URETIMNO', 'URETIMNO');
    end;
  end;
  // STKKRT
  with Table.TableItems[2] do
  begin
    Fields.FieldNames := VarArrayOf(['MALAD']);
    Join.Add('MALKOD', 'MAMULKOD');
  end;

  GridView.OnDblClick := OnDblClick;
  FOldViewKeyDown := GridView.OnKeyDown;
  GridView.OnKeyDown := ViewKeyDown;

  DocObject.Macros.AddObject(Self, 'ChildUretimKartAjanHareket');
end;

destructor TAppDocChildUretimKartAjan.Destroy;
begin
  FreeAndNil(FRuleTable);
  inherited;
end;

procedure TAppDocChildUretimKartAjan.OnDblClick(Sender: TObject);
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
  DocObject.DataObject.OptionsKey.KeyValues['EVRAKTIP'] := Table.FieldValues['EVRAKTIP'];
  DocObject.DataObject.OptionsKey.KeyValues['URETIMNO'] := Table.FieldValues['URETIMNO'];
  DocObject.DataObject.Open;
  DocObject.MainChild.ShowChild;
end;

procedure TAppDocChildUretimKartAjan.ViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldViewKeyDown) then
    FOldViewKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
    OnDblClick(nil);
end;

end.
