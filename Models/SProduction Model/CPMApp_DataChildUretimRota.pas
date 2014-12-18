unit CPMApp_DataChildUretimRota;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CpmApp_TableUretimSystem;

type
  TAppDataChildCustomUretimRota = class;
  TAppDataChildUretimRota = class;

  TAppDataChildCustomUretimRota = class(TAppDataChild)
  private
    FTableClone: TTableUretimRota;
  protected
    function GetTable: TTableUretimRota;
    procedure SetTable(Value: TTableUretimRota);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimRota read GetTable write SetTable;
    property TableClone: TTableUretimRota read FTableClone write FTableClone;
  end;

  TAppRuleUretimRotaCustom = class(TAppTableRule)
  private
    FTableUretimRota: TTableUretimRota;
    FDataChildUretimRota: TAppDataChildUretimRota;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TTableUretimRota); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimRota); reintroduce; overload;
  end;

  TAppDataChildUretimRota = class(TAppDataChildCustomUretimRota)
  private
    FRuleCustom: TAppRuleUretimRotaCustom;
  protected
    procedure CreateRules; override;
  published
    property RuleCustom: TAppRuleUretimRotaCustom read FRuleCustom;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_DAPCustomMamulKart;

{ TAppDataChildCustomUretimRota }

constructor TAppDataChildCustomUretimRota.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimRota.CreateTable;
begin
  Table := TTableUretimRota.Create(DataApp.DataObject);
  Table.Name := 'TableUretimRota';
  Table.TableItems.TableCaptions := 'Üretim Rotasý';

  FTableClone := TTableUretimRota.Create(nil);
  FTableClone.Name := Table.Name;
  FTableClone.ProviderName := Table.ProviderName;
  FTableClone.Connection := DataApp.DataObject.Connection;
  Table.AddClone(FTableClone);
end;

destructor TAppDataChildCustomUretimRota.Destroy;
begin
  FreeAndNil(FTableClone);
  inherited;
end;

function TAppDataChildCustomUretimRota.GetTable: TTableUretimRota;
begin
  Result := TTableUretimRota(inherited GetTable);
end;

procedure TAppDataChildCustomUretimRota.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    InitFieldOnNewRecord := True;
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
  end;
end;

procedure TAppDataChildCustomUretimRota.SetTable(Value: TTableUretimRota);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimRota.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
  end;
end;

{ TAppRuleUretimRotaCustom }

constructor TAppRuleUretimRotaCustom.Create(AOwner: TTableUretimRota);
begin
  inherited Create;
  FTableUretimRota := AOwner;
  FTableUretimRota.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimRotaCustom.Create(AOwner: TAppDataChildUretimRota);
begin
  Create(AOwner.Table);
  FDataChildUretimRota := AOwner;
end;

procedure TAppRuleUretimRotaCustom.DoOnNewRecord(Table: TAppCustomTable);
begin
  inherited;

end;

{ TAppDataChildUretimRota }

procedure TAppDataChildUretimRota.CreateRules;
begin
  inherited;
  FRuleCustom := TAppRuleUretimRotaCustom.Create(Self);
  Rules.AddRule(FRuleCustom);
end;

end.
