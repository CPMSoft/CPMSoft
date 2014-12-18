unit CPMApp_DataChildUretimKaynakPersonel;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimKaynakPersonel = class;
  TAppDataChildUretimKaynakPersonel = class;

  TAppDataChildCustomUretimKaynakPersonel = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimKaynakPersonel;
    procedure SetTable(Value: TTableUretimKaynakPersonel);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimKaynakPersonel read GetTable write SetTable;
  end;

  TAppRuleUretimKaynakPersonelCustom = class(TAppTableRule)
  private
    FTableUretimKaynakPersonel: TTableUretimKaynakPersonel;
    FDataChildUretimKaynakPersonel: TAppDataChildCustomUretimKaynakPersonel;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoBeforePost(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TTableUretimKaynakPersonel); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildCustomUretimKaynakPersonel); reintroduce; overload;
  end;

  TAppDataChildUretimKaynakPersonel = class(TAppDataChildCustomUretimKaynakPersonel)
  private
    FRuleUretimKaynakPersonelCustom: TAppRuleUretimKaynakPersonelCustom;
  protected
    procedure CreateRules; override;
  published
    property RuleUretimKaynakPersonelCustom: TAppRuleUretimKaynakPersonelCustom read FRuleUretimKaynakPersonelCustom;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_DAPCustomUretimKaynakKart,
  DateUtils, CPMApp_Rule_FieldDefaultValue;

{ TAppDataChildCustomUretimKaynakPersonel }

constructor TAppDataChildCustomUretimKaynakPersonel.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimKaynakPersonel.CreateTable;
begin
  Table := TTableUretimKaynakPersonel.Create(DataApp.DataObject);
  Table.Name := 'TableUretimKaynakPersonel';
  Table.ProviderName := 'prURTKPS';
  Table.TableItems.TableNames := 'URTKPS';
end;

destructor TAppDataChildCustomUretimKaynakPersonel.Destroy;
begin
  inherited;
end;

function TAppDataChildCustomUretimKaynakPersonel.GetTable: TTableUretimKaynakPersonel;
begin
  Result := TTableUretimKaynakPersonel(inherited GetTable);
end;

procedure TAppDataChildCustomUretimKaynakPersonel.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('VERIMLILIK', 100);
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
  end;
end;

procedure TAppDataChildCustomUretimKaynakPersonel.SetTable(Value: TTableUretimKaynakPersonel);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimKaynakPersonel.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('SIRKETNO');
    AddNonBlank('KAYNAKKOD');
    AddNonBlank('SICILKOD');
  end;
end;

{ TAppDataChildUretimKaynakPersonel }

procedure TAppDataChildUretimKaynakPersonel.CreateRules;
begin
  inherited;

  FRuleUretimKaynakPersonelCustom := TAppRuleUretimKaynakPersonelCustom.Create(Self);
  Rules.AddRule(FRuleUretimKaynakPersonelCustom);
end;

{ TAppRuleUretimKaynakPersonelCustom }

constructor TAppRuleUretimKaynakPersonelCustom.Create(
  AOwner: TTableUretimKaynakPersonel);
begin
  inherited Create;
  FTableUretimKaynakPersonel := AOwner;
  FTableUretimKaynakPersonel.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimKaynakPersonelCustom.Create(
  AOwner: TAppDataChildCustomUretimKaynakPersonel);
begin
  Create(AOwner.Table);
  FDataChildUretimKaynakPersonel := AOwner;
end;

procedure TAppRuleUretimKaynakPersonelCustom.DoBeforePost(
  Table: TAppCustomTable);
begin
  inherited;

end;

procedure TAppRuleUretimKaynakPersonelCustom.DoOnNewRecord(
  Table: TAppCustomTable);
begin
  inherited;

end;

end.
