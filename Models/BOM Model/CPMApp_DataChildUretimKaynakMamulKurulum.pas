unit CPMApp_DataChildUretimKaynakMamulKurulum;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimKaynakMamulKurulum = class;
  TAppDataChildUretimKaynakMamulKurulum = class;

  TAppDataChildCustomUretimKaynakMamulKurulum = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimKaynakMamulKurulum;
    procedure SetTable(Value: TTableUretimKaynakMamulKurulum);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimKaynakMamulKurulum read GetTable write SetTable;
  end;

  TAppRuleUretimKaynakMamulKurulumCustom = class(TAppTableRule)
  private
    FTableUretimKaynakMamulKurulum: TTableUretimKaynakMamulKurulum;
    FDataChildUretimKaynakMamulKurulum: TAppDataChildCustomUretimKaynakMamulKurulum;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoBeforePost(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TTableUretimKaynakMamulKurulum); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildCustomUretimKaynakMamulKurulum); reintroduce; overload;
  end;

  TAppDataChildUretimKaynakMamulKurulum = class(TAppDataChildCustomUretimKaynakMamulKurulum)
  private
    FRuleUretimKaynakMamulKurulumCustom: TAppRuleUretimKaynakMamulKurulumCustom;
  protected
    procedure CreateTable; override;
    procedure CreateRules; override;
  published
    property RuleUretimKaynakMamulKurulumCustom: TAppRuleUretimKaynakMamulKurulumCustom read FRuleUretimKaynakMamulKurulumCustom;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_DAPCustomUretimKaynakKart,
  DateUtils;

{ TAppDataChildCustomUretimKaynakMamulKurulum }

constructor TAppDataChildCustomUretimKaynakMamulKurulum.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimKaynakMamulKurulum.CreateTable;
begin
  Table := TTableUretimKaynakMamulKurulum.Create(DataApp.DataObject);
  Table.Name := 'TableUretimKaynakMamulKurulum';
  Table.TableItems.TableNames := 'URTKMK';
end;

destructor TAppDataChildCustomUretimKaynakMamulKurulum.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimKaynakMamulKurulum.GetTable: TTableUretimKaynakMamulKurulum;
begin
  Result := TTableUretimKaynakMamulKurulum(inherited GetTable);
end;

procedure TAppDataChildCustomUretimKaynakMamulKurulum.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
  end;
end;

procedure TAppDataChildCustomUretimKaynakMamulKurulum.SetTable(Value: TTableUretimKaynakMamulKurulum);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimKaynakMamulKurulum.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('KAYNAKKOD');
    AddNonBlank('MAMULKOD');
  end;
end;

{ TAppDataChildUretimKaynakMamulKurulum }

procedure TAppDataChildUretimKaynakMamulKurulum.CreateRules;
begin
  inherited;

  FRuleUretimKaynakMamulKurulumCustom := TAppRuleUretimKaynakMamulKurulumCustom.Create(Self);
  Rules.AddRule(FRuleUretimKaynakMamulKurulumCustom);
end;

procedure TAppDataChildUretimKaynakMamulKurulum.CreateTable;
begin
  inherited;
  Table.TableItems.TableNames := VarArrayOf(['URTKMK', 'STKKRT']);
  Table.TableItems.TableCaptions := VarArrayOf(['Kaynak Mamül Kurulum', 'Stok Kart']);
end;

{ TAppRuleUretimKaynakMamulKurulumCustom }

constructor TAppRuleUretimKaynakMamulKurulumCustom.Create(
  AOwner: TTableUretimKaynakMamulKurulum);
begin
  inherited Create;
  FTableUretimKaynakMamulKurulum := AOwner;
  FTableUretimKaynakMamulKurulum.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimKaynakMamulKurulumCustom.Create(
  AOwner: TAppDataChildCustomUretimKaynakMamulKurulum);
begin
  Create(AOwner.Table);
  FDataChildUretimKaynakMamulKurulum := AOwner;
end;

procedure TAppRuleUretimKaynakMamulKurulumCustom.DoBeforePost(
  Table: TAppCustomTable);
begin
  inherited;

end;

procedure TAppRuleUretimKaynakMamulKurulumCustom.DoOnNewRecord(
  Table: TAppCustomTable);
begin
  inherited;

end;

end.
