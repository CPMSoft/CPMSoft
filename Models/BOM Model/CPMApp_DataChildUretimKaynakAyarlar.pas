unit CPMApp_DataChildUretimKaynakAyarlar;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimKaynakAyarlar = class;
  TAppDataChildUretimKaynakAyarlar = class;

  TAppDataChildCustomUretimKaynakAyarlar = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimKaynakAyarlar;
    procedure SetTable(Value: TTableUretimKaynakAyarlar);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimKaynakAyarlar read GetTable write SetTable;
  end;

  TAppRuleUretimKaynakAyarlarCustom = class(TAppTableRule)
  private
    FTableUretimKaynakAyarlar: TTableUretimKaynakAyarlar;
    FDataChildUretimKaynakAyarlar: TAppDataChildCustomUretimKaynakAyarlar;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoBeforePost(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TTableUretimKaynakAyarlar); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildCustomUretimKaynakAyarlar); reintroduce; overload;
  end;

  TAppDataChildUretimKaynakAyarlar = class(TAppDataChildCustomUretimKaynakAyarlar)
  private
    FRuleUretimKaynakAyarlarCustom: TAppRuleUretimKaynakAyarlarCustom;
  protected
    procedure CreateRules; override;
  published
    property RuleUretimKaynakAyarlarCustom: TAppRuleUretimKaynakAyarlarCustom read FRuleUretimKaynakAyarlarCustom;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_DAPCustomUretimKaynakKart,
  DateUtils, CPMApp_Rule_FieldDefaultValue;

{ TAppDataChildCustomUretimKaynakAyarlar }

constructor TAppDataChildCustomUretimKaynakAyarlar.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimKaynakAyarlar.CreateTable;
begin
  Table := TTableUretimKaynakAyarlar.Create(DataApp.DataObject);
  Table.Name := 'TableUretimKaynakAyarlar';
  Table.ProviderName := 'prURTKYA';
  Table.TableItems.TableNames := 'URTKYA';
end;

destructor TAppDataChildCustomUretimKaynakAyarlar.Destroy;
begin
  inherited;
end;

function TAppDataChildCustomUretimKaynakAyarlar.GetTable: TTableUretimKaynakAyarlar;
begin
  Result := TTableUretimKaynakAyarlar(inherited GetTable);
end;

procedure TAppDataChildCustomUretimKaynakAyarlar.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
  end;
end;

procedure TAppDataChildCustomUretimKaynakAyarlar.SetTable(Value: TTableUretimKaynakAyarlar);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimKaynakAyarlar.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('SIRKETNO');
  end;
end;

{ TAppDataChildUretimKaynakAyarlar }

procedure TAppDataChildUretimKaynakAyarlar.CreateRules;
begin
  inherited;

  FRuleUretimKaynakAyarlarCustom := TAppRuleUretimKaynakAyarlarCustom.Create(Self);
  Rules.AddRule(FRuleUretimKaynakAyarlarCustom);
end;

{ TAppRuleUretimKaynakAyarlarCustom }

constructor TAppRuleUretimKaynakAyarlarCustom.Create(
  AOwner: TTableUretimKaynakAyarlar);
begin
  inherited Create;
  FTableUretimKaynakAyarlar := AOwner;
  FTableUretimKaynakAyarlar.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimKaynakAyarlarCustom.Create(
  AOwner: TAppDataChildCustomUretimKaynakAyarlar);
begin
  Create(AOwner.Table);
  FDataChildUretimKaynakAyarlar := AOwner;
end;

procedure TAppRuleUretimKaynakAyarlarCustom.DoBeforePost(
  Table: TAppCustomTable);
begin
  inherited;

end;

procedure TAppRuleUretimKaynakAyarlarCustom.DoOnNewRecord(
  Table: TAppCustomTable);
begin
  inherited;

end;

end.
