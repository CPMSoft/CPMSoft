unit CPMApp_DataChildUretimMamulKart;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimMamulKart = class;
  TAppDataChildUretimMamulKart = class;

  TAppDataChildCustomUretimMamulKart = class(TAppDataChild)
  private
    FTableClone: TTableMamulKart;
  protected
    function GetTable: TTableMamulKart;
    procedure SetTable(Value: TTableMamulKart);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableMamulKart read GetTable write SetTable;
    property TableClone: TTableMamulKart read FTableClone;
  end;

  TAppRuleUretimMamulKartCustom = class(TAppTableRule)
  private
    FTableUretimMamulKart: TTableMamulKart;
    FDataChildUretimMamulKart: TAppDataChildUretimMamulKart;
  protected
  public
    constructor Create(AOwner: TTableMamulKart); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimMamulKart); reintroduce; overload;
  end;

  TAppDataChildUretimMamulKart = class(TAppDataChildCustomUretimMamulKart)
  private
    FRuleCustom: TAppRuleUretimMamulKartCustom;
  protected
    procedure CreateRules; override;
  public
    procedure Add(AMamulKod: String);
  published
    property RuleCustom: TAppRuleUretimMamulKartCustom read FRuleCustom;
  end;

implementation

uses Variants, CPMApp_Rule_FieldValidate, CPMApp_DAPCustomUretim, CPMApp_TableItems;

{ TAppDataChildCustomUretimMamulKart }

constructor TAppDataChildCustomUretimMamulKart.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimMamulKart.CreateTable;
begin
  Table := TTableMamulKart.Create(DataApp.DataObject);
  Table.Name := 'TableUretimMamulKart';
  Table.ProviderName := 'prURTMAMKRT';
  Table.TableItems.TableNames := 'MAMKRT';
  FTableClone := TTableMamulKart.Create(nil);
  FTableClone.Name := 'TableCloneUretimMamulKart';
  FTableClone.IndexFieldNames := 'MAMULKOD';
  Table.AddClone(FTableClone);
end;

destructor TAppDataChildCustomUretimMamulKart.Destroy;
begin
  FreeAndNil(FTableClone);
  inherited;
end;

function TAppDataChildCustomUretimMamulKart.GetTable: TTableMamulKart;
begin
  Result := TTableMamulKart(inherited GetTable);
end;

procedure TAppDataChildCustomUretimMamulKart.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
    Add('SIRKETNO', DataApp.CompanyNo);
  end;
end;

procedure TAppDataChildCustomUretimMamulKart.SetTable(Value: TTableMamulKart);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimMamulKart.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('MAMULKOD');
    AddNonBlank('HAMMADDEKOD');
  end;
end;

{ TAppRuleUretimMamulKartCustom }

constructor TAppRuleUretimMamulKartCustom.Create(AOwner: TTableMamulKart);
begin
  inherited Create;
  FTableUretimMamulKart := AOwner;
  FTableUretimMamulKart.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimMamulKartCustom.Create(AOwner: TAppDataChildUretimMamulKart);
begin
  Create(AOwner.Table);
  FDataChildUretimMamulKart := AOwner;
end;

{ TAppDataChildUretimMamulKart }

procedure TAppDataChildUretimMamulKart.Add(AMamulKod: String);
var
  TableCommand: TAppDBTable;
begin
  if trim(AMamulKod) = '' then
    exit;
  if TableClone.FindKey([AMamulKod]) then
    exit;
  TableCommand := DataApp.TableCommand;
  TableCommand.Close;
  TableCommand.TableItems.TableNames := VarArrayOf(['MAMKRT', 'STKKRT']);
  with TableCommand.TableItems[0].Fields do
  begin
    Clear;
    Add('*');
  end;
  with TableCommand.TableItems[1].Fields do
  begin
    Clear;
    Add('MALAD');
  end;

  with TableCommand.TableItems[1].Join do
  begin
    Clear;
    Add('MALKOD', 'MAMULKOD');
  end;

  with TableCommand.TableItems[0].Where do
  begin
    Clear;
    Add('MAMULKOD', wcEqual, AMamulKod);
  end;
  TableCommand.Open;
  Table.AppendTable(TableCommand);
end;

procedure TAppDataChildUretimMamulKart.CreateRules;
begin
  inherited;
  FRuleCustom := TAppRuleUretimMamulKartCustom.Create(Self);
  Rules.AddRule(FRuleCustom);
end;
end.
