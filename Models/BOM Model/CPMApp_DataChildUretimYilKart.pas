unit CPMApp_DataChildUretimYilKart;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimYilKart = class;
  TAppDataChildUretimYilKart = class;

  TAppDataChildCustomUretimYilKart = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimYilKart;
    procedure SetTable(Value: TTableUretimYilKart);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimYilKart read GetTable write SetTable;
  end;

  TAppRuleUretimYilKartCustom = class(TAppTableRule)
  private
    FTableUretimYilKart: TTableUretimYilKart;
    FDataChildUretimYilKart: TAppDataChildCustomUretimYilKart;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TTableUretimYilKart); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildCustomUretimYilKart); reintroduce; overload;
  end;

  TAppDataChildUretimYilKart = class(TAppDataChildCustomUretimYilKart)
  private
    FRuleUretimYilKartCustom: TAppRuleUretimYilKartCustom;
  protected
    procedure CreateRules; override;
  published
    property RuleUretimYilKartCustom: TAppRuleUretimYilKartCustom read FRuleUretimYilKartCustom;
  end;

implementation

uses CPMApp_Rule_FieldValidate, DateUtils;

{ TAppDataChildCustomUretimYilKart }

constructor TAppDataChildCustomUretimYilKart.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimYilKart.CreateTable;
begin
  Table := TTableUretimYilKart.Create(DataApp.DataObject);
  Table.Name := 'TableUretimYilKart';
  Table.TableItems.TableNames := VarArrayOf(['URTYIL']);
  Table.TableItems.TableCaptions := VarArrayOf(['Yýl Kartý']);
end;

destructor TAppDataChildCustomUretimYilKart.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimYilKart.GetTable: TTableUretimYilKart;
begin
  Result := TTableUretimYilKart(inherited GetTable);
end;

procedure TAppDataChildCustomUretimYilKart.SetDefaultValues;
begin
  inherited;

end;

procedure TAppDataChildCustomUretimYilKart.SetTable(Value: TTableUretimYilKart);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimYilKart.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('TAKVIMYIL');
  end;
end;

{ TAppDataChildUretimYilKart }

procedure TAppDataChildUretimYilKart.CreateRules;
begin
  inherited;

  FRuleUretimYilKartCustom := TAppRuleUretimYilKartCustom.Create(Self);
  Rules.AddRule(FRuleUretimYilKartCustom);
end;

{ TAppRuleUretimYilKartCustom }

constructor TAppRuleUretimYilKartCustom.Create(
  AOwner: TTableUretimYilKart);
begin
  inherited Create;
  FTableUretimYilKart := AOwner;
  FTableUretimYilKart.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimYilKartCustom.Create(
  AOwner: TAppDataChildCustomUretimYilKart);
begin
  Create(AOwner.Table);
  FDataChildUretimYilKart := AOwner;
end;

procedure TAppRuleUretimYilKartCustom.DoOnNewRecord(
  Table: TAppCustomTable);
begin
  inherited;

end;

end.
