unit CPMApp_DataChildUretimDepoTransfer;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_Rule_UpdateDovizKur,
  CPMApp_Rule_ClientIncrement,
  CPMApp_TableWarehouseSystem;

type

  TAppDataChildCustomUretimDepoTransfer = class;
  TAppDataChildUretimDepoTransfer = class;

  TAppRuleIncrementSiraNo = class(TAppRuleClientIncrement)
  private
    FTableDepoTransfer: TTableDepoTransfer;
  public
    constructor Create(AOwner: TTableDepoTransfer); reintroduce; overload;
  end;

  TAppDataChildCustomUretimDepoTransfer = class(TAppDataChild)
  private
  protected
    function GetTable: TTableDepoTransfer;
    procedure SetTable(Value: TTableDepoTransfer);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
    procedure CreateRules; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableDepoTransfer read GetTable write SetTable;
  end;

  TAppDataChildUretimDepoTransfer = class(TAppDataChildCustomUretimDepoTransfer)
  private
    FRuleIncrementSiraNo: TAppRuleIncrementSiraNo;
  protected
    procedure CreateRules; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property RuleIncrementSiraNo: TAppRuleIncrementSiraNo read FRuleIncrementSiraNo;
  end;
  
implementation

uses CPMApp_Rule_FieldValidate, CPMApp_Rule_FieldDefaultValue,
  CPMApp_DAPCustomUretim;

{ TAppDataChildCustomUretimDepoTransfer }

constructor TAppDataChildCustomUretimDepoTransfer.Create(
  AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimDepoTransfer.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildCustomUretimDepoTransfer.CreateTable;
begin
  inherited;
  Table := TTableDepoTransfer.Create(DataApp.DataObject);
  Table.Name := 'TableUretimDepoTransfer';
  Table.TableItems.TableNames := 'DEPTRN';
end;

destructor TAppDataChildCustomUretimDepoTransfer.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimDepoTransfer.GetTable: TTableDepoTransfer;
begin
  Result := TTableDepoTransfer(inherited GetTable);
end;

procedure TAppDataChildCustomUretimDepoTransfer.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
    Add('SIRKETNO', DataApp.CompanyNo);
  end;
end;

procedure TAppDataChildCustomUretimDepoTransfer.SetTable(
  Value: TTableDepoTransfer);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimDepoTransfer.SetValidates;
begin
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('EVRAKNO');
    AddNonBlank('HESAPKOD');
  end;
end;

{ TAppDataChildUretimDepoTransfer }

constructor TAppDataChildUretimDepoTransfer.Create(AOwner: TAppDataApp);
begin
  inherited Create(AOwner);
end;

procedure TAppDataChildUretimDepoTransfer.CreateRules;
begin
  inherited;
  FRuleIncrementSiraNo := TAppRuleIncrementSiraNo.Create(Table);
  Rules.AddRule(FRuleIncrementSiraNo);
end;

procedure TAppDataChildUretimDepoTransfer.CreateTable;
begin
  inherited;
 end;

destructor TAppDataChildUretimDepoTransfer.Destroy;
begin
  inherited;
end;

{ TAppRuleIncrementSiraNo }

constructor TAppRuleIncrementSiraNo.Create(AOwner: TTableDepoTransfer);
begin
  inherited Create(AOwner);
  FTableDepoTransfer := AOwner;
  FieldName := 'SIRANO';
end;

end.

