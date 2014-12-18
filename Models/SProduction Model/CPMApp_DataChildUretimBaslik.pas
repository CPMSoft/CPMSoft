unit CPMApp_DataChildUretimBaslik;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CpmApp_TableUretimSystem, CPMApp_Rule_Increment;

type

  TAppDataChildCustomUretimBaslik = class;
  TAppDataChildUretimBaslik = class;

  TAppDataChildCustomUretimBaslik = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimBaslik;
    procedure SetTable(Value: TTableUretimBaslik);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimBaslik read GetTable write SetTable;
  end;

  TAppRuleUretimNoIncrement = class(TAppRuleIncrement)
  private
    FTableUretimBaslik: TTableUretimBaslik;
    FDataChildUretimBaslik: TAppDataChildUretimBaslik;
  public
    constructor Create(AOwner: TTableUretimBaslik); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimBaslik); reintroduce; overload;
  end;

  TAppRuleUretimBaslikDoviz = class(TAppTableRule)
  private
    FTableUretimBaslik: TTableUretimBaslik;
    FDataChildUretimBaslik: TAppDataChildUretimBaslik;
    InUse: Boolean;
  protected
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
  public
    constructor Create(AOwner: TTableUretimBaslik); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimBaslik); reintroduce; overload;
  end;

  TAppRuleUretimBaslikCustom = class(TAppTableRule)
  private
    FTableUretimBaslik: TTableUretimBaslik;
    FDataChildUretimBaslik: TAppDataChildUretimBaslik;
    InUse: Boolean;
  protected
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TTableUretimBaslik); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimBaslik); reintroduce; overload;
  end;

  TAppDataChildUretimBaslik = class(TAppDataChildCustomUretimBaslik)
  private
    FRuleIncrementUretimNo: TAppRuleUretimNoIncrement;
    FRuleCustom: TAppRuleUretimBaslikCustom;
    FRuleDoviz: TAppRuleUretimBaslikDoviz;
  protected
    procedure CreateRules; override;
  published
    property RuleIncrementUretimNo: TAppRuleUretimNoIncrement read FRuleIncrementUretimNo;
    property RuleCustom: TAppRuleUretimBaslikCustom read FRuleCustom;
    property RuleDoviz: TAppRuleUretimBaslikDoviz read FRuleDoviz;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_Rule_FieldDefaultValue,
  CPMApp_DAPCustomUretim;

{ TAppDataChildCustomUretimBaslik }

constructor TAppDataChildCustomUretimBaslik.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimBaslik.CreateTable;
begin
  Table := TTableUretimBaslik.Create(DataApp.DataObject);
  Table.Name := 'TableUretimBaslik';
end;

destructor TAppDataChildCustomUretimBaslik.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimBaslik.GetTable: TTableUretimBaslik;
begin
  Result := TTableUretimBaslik(inherited GetTable);
end;

procedure TAppDataChildCustomUretimBaslik.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    InitFieldOnNewRecord := True;
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('EVRAKTARIH', Date);
  end;
end;

procedure TAppDataChildCustomUretimBaslik.SetTable(Value: TTableUretimBaslik);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimBaslik.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('URETIMNO');
    AddNonBlank('EVRAKTARIH');
  end;
end;

{ TAppRuleUretimNoIncrement }

constructor TAppRuleUretimNoIncrement.Create(AOwner: TTableUretimBaslik);
begin
  inherited Create(AOwner);
  FTableUretimBaslik := AOwner;
  FieldName := 'URETIMNO';
end;

constructor TAppRuleUretimNoIncrement.Create(
  AOwner: TAppDataChildUretimBaslik);
begin
  Create(AOwner.Table);
  FDataChildUretimBaslik := AOwner;
  AppName := FDataChildUretimBaslik.DataApp.AppName;
end;

{ TAppDataChildUretimBaslik }

procedure TAppDataChildUretimBaslik.CreateRules;
begin
  inherited;
  FRuleIncrementUretimNo := TAppRuleUretimNoIncrement.Create(Self);
  Rules.AddRule(FRuleIncrementUretimNo);
  FRuleCustom := TAppRuleUretimBaslikCustom.Create(Self);
  Rules.AddRule(FRuleCustom);
  FRuleDoviz := TAppRuleUretimBaslikDoviz.Create(Self);
  Rules.AddRule(FRuleDoviz);
end;

{ TAppRuleUretimBaslikCustom }

constructor TAppRuleUretimBaslikCustom.Create(AOwner: TTableUretimBaslik);
begin
  inherited Create;
  FTableUretimBaslik := AOwner;
  FTableUretimBaslik.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimBaslikCustom.Create(AOwner: TAppDataChildUretimBaslik);
begin
  Create(AOwner.Table);
  FDataChildUretimBaslik := AOwner;
end;

procedure TAppRuleUretimBaslikCustom.DoOnFieldChanged(Table: TAppCustomTable;
  Field: TField);
begin
  if InUse then
    exit;
  InUse := True;
  try
    if Field = FTableUretimBaslik.fEvrakTarih then
      FTableUretimBaslik.DovizTarih := FTableUretimBaslik.EvrakTarih;
  finally
    InUse := False;
  end;
end;

procedure TAppRuleUretimBaslikCustom.DoOnNewRecord(Table: TAppCustomTable);
var
  DAP: TAppDAPCustomUretim;
begin
  DAP := TAppDAPCustomUretim(FDataChildUretimBaslik.DataApp);
  FTableUretimBaslik.EvrakTip := DAP.ParamsUretim.UretimTip;
end;

{ TAppRuleUretimBaslikDoviz }

constructor TAppRuleUretimBaslikDoviz.Create(AOwner: TTableUretimBaslik);
begin
  inherited Create;
  FTableUretimBaslik := AOwner;
  FTableUretimBaslik.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimBaslikDoviz.Create(
  AOwner: TAppDataChildUretimBaslik);
begin
  Create(AOwner.Table);
  FDataChildUretimBaslik := AOwner;
end;

procedure TAppRuleUretimBaslikDoviz.DoOnFieldChanged(
  Table: TAppCustomTable; Field: TField);
begin
  inherited;
  if InUse then
    exit;
  InUse := True;
  try
    if (Field = FTableUretimBaslik.fDovizTarih)
      or (Field = FTableUretimBaslik.fDovizTip)
      or (Field = FTableUretimBaslik.fBanka) then
        //TAppDAPCustomUretim(FDataChildUretimBaslik.DataApp).UretimHareket.DoUpdateStokHareketDoviz;
  finally
    InUse := False;
  end;
end;

end.

