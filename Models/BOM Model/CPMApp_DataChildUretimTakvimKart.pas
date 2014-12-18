unit CPMApp_DataChildUretimTakvimKart;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimTakvimKart = class;
  TAppDataChildUretimTakvimKart = class;

  TAppDataChildCustomUretimTakvimKart = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimTakvimKart;
    procedure SetTable(Value: TTableUretimTakvimKart);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimTakvimKart read GetTable write SetTable;
  end;

  TAppRuleUretimTakvimKartCustom = class(TAppTableRule)
  private
    FTableUretimTakvimKart: TTableUretimTakvimKart;
    FDataChildUretimTakvimKart: TAppDataChildCustomUretimTakvimKart;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TTableUretimTakvimKart); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildCustomUretimTakvimKart); reintroduce; overload;
  end;

  TAppDataChildUretimTakvimKart = class(TAppDataChildCustomUretimTakvimKart)
  private
    FRuleUretimTakvimKartCustom: TAppRuleUretimTakvimKartCustom;
  protected
    procedure CreateRules; override;
  published
    property RuleUretimTakvimKartCustom: TAppRuleUretimTakvimKartCustom read FRuleUretimTakvimKartCustom;
  end;

implementation

uses CPMApp_Rule_FieldValidate, DateUtils;

{ TAppDataChildCustomUretimTakvimKart }

constructor TAppDataChildCustomUretimTakvimKart.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimTakvimKart.CreateTable;
begin
  Table := TTableUretimTakvimKart.Create(DataApp.DataObject);
  Table.Name := 'TableUretimTakvimKart';
  Table.TableItems.TableNames := VarArrayOf(['URTTKB']);
  Table.TableItems.TableCaptions := VarArrayOf(['Takvim Kartý']);
end;

destructor TAppDataChildCustomUretimTakvimKart.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimTakvimKart.GetTable: TTableUretimTakvimKart;
begin
  Result := TTableUretimTakvimKart(inherited GetTable);
end;

procedure TAppDataChildCustomUretimTakvimKart.SetDefaultValues;
begin
  inherited;

end;

procedure TAppDataChildCustomUretimTakvimKart.SetTable(Value: TTableUretimTakvimKart);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimTakvimKart.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('TAKVIMKOD');
    AddNonBlank('TAKVIMYIL');
  end;
end;

{ TAppDataChildUretimTakvimKart }

procedure TAppDataChildUretimTakvimKart.CreateRules;
begin
  inherited;

  FRuleUretimTakvimKartCustom := TAppRuleUretimTakvimKartCustom.Create(Self);
  Rules.AddRule(FRuleUretimTakvimKartCustom);
end;

{ TAppRuleUretimTakvimKartCustom }

constructor TAppRuleUretimTakvimKartCustom.Create(
  AOwner: TTableUretimTakvimKart);
begin
  inherited Create;
  FTableUretimTakvimKart := AOwner;
  FTableUretimTakvimKart.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimTakvimKartCustom.Create(
  AOwner: TAppDataChildCustomUretimTakvimKart);
begin
  Create(AOwner.Table);
  FDataChildUretimTakvimKart := AOwner;
end;

procedure TAppRuleUretimTakvimKartCustom.DoOnNewRecord(
  Table: TAppCustomTable);
begin
  inherited;

end;

end.
