unit CPMApp_DataChildMamulAgacKart;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_DocConsts, CPMApp_Rule_Increment;

type
  TAppDataChildCustomMamulAgacKart = class;
  TAppDataChildMamulAgacKart = class;

  TTableMamulAgac = class(TTableMamulKart)
  private
    Ff_ID: TField;
    Ff_ParentID: TField;
    Ff_YMCount: TField;
    function Get_ID: Integer;
    function Get_ParentID: Integer;
    function Get_YMCount: Integer;
    procedure Set_ID(const Value: Integer);
    procedure Set_ParentID(const Value: Integer);
    procedure Set_YMCount(const Value: Integer);
  published
    property _ID: Integer read Get_ID write Set_ID;
    property _ParentID: Integer read Get_ParentID write Set_ParentID;
    property _YMCount: Integer read Get_YMCount write Set_YMCount;
  end;
  
  TAppDataChildCustomMamulAgacKart = class(TAppDataChild)
  private
  protected
    function GetTable: TTableMamulAgac;
    procedure SetTable(Value: TTableMamulAgac);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableMamulAgac read GetTable write SetTable;
  end;

  TAppRuleMamulAgacKartCustom = class(TAppTableRule)
  private
    InUse: Boolean;
    FTableMamulAgacKart: TTableMamulAgac;
    FDataChildMamulAgacKart: TAppDataChildMamulAgacKart;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoAfterOpen(Table: TAppCustomTable); override;
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
  public
    constructor Create(AOwner: TTableMamulAgac); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildMamulAgacKart); reintroduce; overload;
  end;

  TAppDataChildMamulAgacKart = class(TAppDataChildCustomMamulAgacKart)
  private
    FRuleCustom: TAppRuleMamulAgacKartCustom;
    FTableCloned: TTableMamulAgac;
    FTableTree: TTableMamulAgac;
    FID: Integer;
    function NewID: Integer;
    procedure CheckTree;
  protected
    procedure CreateTable; override;
    procedure CreateRules; override;
  public
    destructor Destroy; override;
    procedure PrepareTree(AMalKod, AVersiyonNo: String);
    procedure AddTree(AParentID: Integer; AMalKod, AVersiyonNo: String; AMiktar: Double; const SiraNo: Integer = 0);
    procedure AppendTreeTable;
    procedure Open(ATable: TAppDBTable; AMalKod, AVersiyonNo: String);
    procedure SetTableDefinition(ATable: TAppDBTable);
  published
    property RuleCustom: TAppRuleMamulAgacKartCustom read FRuleCustom;
    property TableCloned: TTableMamulAgac read FTableCloned;
    property TableTree: TTableMamulAgac read FTableTree;
  end;

  TAppTreeData = class
    MamulKod: String;
    VersiyonNo: String;
    ParentID: Integer;
    Miktar: Double;
  end;

  TAppTreeDataList = class
  private
    FList: TList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    function Add(AMamulKod, AVersiyonNo: String; AParentID: Integer; AMiktar: Double): TAppTreeData;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_DAPCustomMamulKart, Variants;

{ TTableMamulAgac }

function TTableMamulAgac.Get_ID: Integer;
begin
  if Ff_ID = nil then
    Ff_ID := FindField('_ID');
  Result := Ff_ID.AsInteger;
end;

function TTableMamulAgac.Get_ParentID: Integer;
begin
  if Ff_ParentID = nil then
    Ff_ParentID := FindField('_ParentID');
  Result := Ff_ParentID.AsInteger;
end;

function TTableMamulAgac.Get_YMCount: Integer;
begin
  if Ff_YMCount = nil then
    Ff_YMCount := FindField('_YMCount');
  Result := Ff_YMCount.AsInteger;
end;

procedure TTableMamulAgac.Set_ID(const Value: Integer);
begin
  if Ff_ID = nil then
    Ff_ID := FindField('_ID');
  Ff_ID.AsInteger := Value;
end;

procedure TTableMamulAgac.Set_ParentID(const Value: Integer);
begin
  if Ff_ParentID = nil then
    Ff_ParentID := FindField('_PARENTID');
  Ff_ParentID.AsInteger := Value;
end;

procedure TTableMamulAgac.Set_YMCount(const Value: Integer);
begin
  if Ff_YMCount = nil then
    Ff_YMCount := FindField('_YMCOUNT');
  Ff_YMCount.AsInteger := Value;
end;

{ TAppDataChildCustomMamulAgacKart }

constructor TAppDataChildCustomMamulAgacKart.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomMamulAgacKart.CreateTable;
begin
  Table := TTableMamulAgac.Create(DataApp.DataObject);
  Table.Name := 'TableMamulAgacKart';
  Table.ProviderName := 'prMAMKRTTREE';
  Table.DataSet.TableName := 'MAMKRT';
  Table.TableItems.TableNames := 'MAMKRT';
end;

destructor TAppDataChildCustomMamulAgacKart.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomMamulAgacKart.GetTable: TTableMamulAgac;
begin
  Result := TTableMamulAgac(inherited GetTable);
end;

procedure TAppDataChildCustomMamulAgacKart.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
    Add('SIRKETNO', DataApp.CompanyNo);
  end;
end;

procedure TAppDataChildCustomMamulAgacKart.SetTable(Value: TTableMamulAgac);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomMamulAgacKart.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('MAMULKOD');
    AddNonBlank('HAMMADDEKOD');
  end;
end;

{ TAppRuleMamulAgacKartCustom }

constructor TAppRuleMamulAgacKartCustom.Create(AOwner: TTableMamulAgac);
begin
  inherited Create;
  FTableMamulAgacKart := AOwner;
  FTableMamulAgacKart.DataEvents.AddRule(Self);
end;

constructor TAppRuleMamulAgacKartCustom.Create(AOwner: TAppDataChildMamulAgacKart);
begin
  Create(AOwner.Table);
  FDataChildMamulAgacKart := AOwner;
end;

procedure TAppRuleMamulAgacKartCustom.DoOnNewRecord(Table: TAppCustomTable);
var
  DAP: TAppDAPCustomMamulKart;
begin
  inherited;
  DAP := TAppDAPCustomMamulKart(FDataChildMamulAgacKart.DataApp);
  if DAP.MamulBaslik.Table.GirisCikis = 0 then
    FTableMamulAgacKart.GirisCikis := 1
  else
    FTableMamulAgacKart.GirisCikis := 0;
end;

procedure TAppRuleMamulAgacKartCustom.DoOnFieldChanged(Table: TAppCustomTable;
  Field: TField);
var
  DAP: TAppDAPCustomMamulKart;
begin
  inherited;
  if InUse then
    exit;
  DAP := TAppDAPCustomMamulKart(FDataChildMamulAgacKart.DataApp);
  InUse := True;
  try
    if Field = FDataChildMamulAgacKart.Table.fHamMaddeKod then
      DAP.HammaddeStokKart.Add(Field.AsString);
  finally
    InUse := False;
  end;
end;

procedure TAppRuleMamulAgacKartCustom.DoAfterOpen(Table: TAppCustomTable);
var
  DAPMamulKart: TAppDAPCustomMamulKart;
begin
  inherited;
  if FDataChildMamulAgacKart.DataApp is TAppDAPCustomMamulKart then
  begin
    DAPMamulKart := TAppDAPCustomMamulKart(FDataChildMamulAgacKart.DataApp);
    if not Table.ControlsDisabled then
    begin
      if DAPMamulKart.MamulBaslik.Table.Active then
      begin
        FDataChildMamulAgacKart.PrepareTree(DAPMamulKart.MamulBaslik.Table.MamulKod, DAPMamulKart.MamulBaslik.Table.VersiyonNo);
      end;
    end;
  end;
end;

{ TAppDataChildMamulAgacKart }

procedure TAppDataChildMamulAgacKart.AddTree(AParentID: Integer;
  AMalKod, AVersiyonNo: String; AMiktar: Double; const SiraNo: Integer = 0);
var
  I: Integer;
  AMamulList: TAppTreeDataList;
  AData: TAppTreeData;
begin
  CheckTree;
  Open(FTableTree, AMalKod, AVersiyonNo);
  if FTableTree.IsEmpty then
    exit;
  AMamulList := TAppTreeDataList.Create;
  FTableTree.DisableControls;
  try
    FTableTree.First;
    while not FTableTree.Eof do
    begin
      FTableTree.Edit;
      FTableTree._ID := NewID;
      if FTableTree._YMCount > 0 then
        AMamulList.Add(FTableTree.HammaddeKod, FTableTree.HammaddeVersiyonNo, FTableTree._ID, FTableTree.Miktar);
      FTableTree._ParentID := AParentID;
      FTableTree.Miktar := FTableTree.Miktar * AMiktar;
      FTableTree.Post;
      FTableTree.Next;
    end;
    AppendTreeTable;
    for I := 0 to AMamulList.FList.Count - 1 do
    begin
      AData := TAppTreeData(AMamulList.FList[I]);
      AddTree(AData.ParentID, AData.MamulKod, AData.VersiyonNo, AData.Miktar);
    end;
  finally
    FTableTree.EnableControls;
    AMamulList.Free;
  end;
end;

procedure TAppDataChildMamulAgacKart.AppendTreeTable;
begin
  if Table.Active then
    Table.AppendTable(FTableTree)
  else
    Table.Data := FTableTree.Data;
end;

procedure TAppDataChildMamulAgacKart.CheckTree;
begin
  if FTableTree.FieldCount = 0 then
  begin
    FTableTree.FieldDefs.Clear;
    FTableTree.FieldDefs.Assign(Table.FieldDefs);
    FTableTree.CreateFields;
    FTableTree.ProviderName := DefaultProviderName;
    FTableTree.Connection := Table.Connection;
  end;
end;

procedure TAppDataChildMamulAgacKart.CreateRules;
begin
  inherited;
  FRuleCustom := TAppRuleMamulAgacKartCustom.Create(Self);
  Rules.AddRule(FRuleCustom);
end;

procedure TAppDataChildMamulAgacKart.CreateTable;
begin
  inherited;
  FTableCloned := TTableMamulAgac.Create(nil);
  FTableCloned.IndexFieldNames := '_ID';
  Table.AddClone(FTableCloned);
  FTableTree := TTableMamulAgac.Create(nil);
  FTableTree.EnableLogChanges := False;
end;

destructor TAppDataChildMamulAgacKart.Destroy;
begin
  if FTableCloned <> nil then
    FreeAndNil(FTableCloned);
  if FTableTree <> nil then
    FreeAndNil(FTableTree);
  inherited;
end;

function TAppDataChildMamulAgacKart.NewID: Integer;
begin
  FID := FID + 1;
  Result := FID;
end;

procedure TAppDataChildMamulAgacKart.Open(ATable: TAppDBTable;
  AMalKod, AVersiyonNo: String);
begin
  ATable.Close;
  SetTableDefinition(ATable);
  with ATable.TableItems[0].Where do
  begin
    Clear;
    Add('MAMULKOD', wcEqual, AMalKod);
    AddOperator(woAnd);
    Add('VERSIYONNO', wcEqual, AVersiyonNo);
  end;
  ATable.Open;
end;

procedure TAppDataChildMamulAgacKart.PrepareTree(AMalKod, AVersiyonNo: String);
begin
  FID := 0;
  Table.DisableControls;
  try
    Table.Close;
    AddTree(-1, AMalKod, AVersiyonNo, 1);
  finally
    Table.EnableControls;
  end;
end;


procedure TAppDataChildMamulAgacKart.SetTableDefinition(
  ATable: TAppDBTable);
begin
  ATable.TableItems.TableNames := VarArrayOf(['MAMKRT', 'STKKRT']);
  with ATable.TableItems[0].Fields do
  begin
    Clear;
    AddExpression('CAST(0 AS INT)', '_ID');
    AddExpression('CAST(0 AS INT)', '_PARENTID');
    AddExpression('(SELECT COUNT(*) FROM MAMBAS YAMBAS WHERE YAMBAS.MAMULKOD = MAMKRT.HAMMADDEKOD GROUP BY YAMBAS.MAMULKOD)', '_YMCOUNT');
    Add('*');
  end;
  with ATable.TableItems[1].Fields do
  begin
    Clear;
    Add('MALAD');
  end;
  with ATable.TableItems[1].Join do
  begin
    Clear;
    Add('MALKOD', 'HAMMADDEKOD');
  end;
end;

{ TAppTreeDataList }

function TAppTreeDataList.Add(AMamulKod, AVersiyonNo: String; AParentID: Integer;
  AMiktar: Double): TAppTreeData;
begin
  Result := TAppTreeData.Create;
  FList.Add(Result);
  Result.MamulKod := AMamulKod;
  Result.VersiyonNo := AVersiyonNo;
  Result.ParentID := AParentID;
  Result.Miktar := AMiktar;
end;

procedure TAppTreeDataList.Clear;
var
  I: Integer;
begin
  for I := FList.Count - 1 downto 0 do
    TAppTreeData(FList[I]).Free;
  FList.Clear;
end;

constructor TAppTreeDataList.Create;
begin
  inherited Create;
  FList := TList.Create;
end;

destructor TAppTreeDataList.Destroy;
begin
  Clear;
  FreeAndNil(FList);
  inherited;
end;

end.
