unit CPMApp_DataChildUretimKaynakMamulDegisim;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimKaynakMamulDegisim = class;
  TAppDataChildUretimKaynakMamulDegisim = class;

  TAppDataChildCustomUretimKaynakMamulDegisim = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimKaynakMamulDegisim;
    procedure SetTable(Value: TTableUretimKaynakMamulDegisim);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimKaynakMamulDegisim read GetTable write SetTable;
  end;

  TAppRuleUretimKaynakMamulDegisimCustom = class(TAppTableRule)
  private
    FTableUretimKaynakMamulDegisim: TTableUretimKaynakMamulDegisim;
    FDataChildUretimKaynakMamulDegisim: TAppDataChildCustomUretimKaynakMamulDegisim;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoBeforePost(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TTableUretimKaynakMamulDegisim); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildCustomUretimKaynakMamulDegisim); reintroduce; overload;
  end;

  TAppDataChildUretimKaynakMamulDegisim = class(TAppDataChildCustomUretimKaynakMamulDegisim)
  private
    FRuleUretimKaynakMamulDegisimCustom: TAppRuleUretimKaynakMamulDegisimCustom;
  protected
    procedure CreateTable; override;
    procedure CreateRules; override;
  published
    property RuleUretimKaynakMamulDegisimCustom: TAppRuleUretimKaynakMamulDegisimCustom read FRuleUretimKaynakMamulDegisimCustom;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_DAPCustomUretimKaynakKart,
  DateUtils;

{ TAppDataChildCustomUretimKaynakMamulDegisim }

constructor TAppDataChildCustomUretimKaynakMamulDegisim.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimKaynakMamulDegisim.CreateTable;
begin
  Table := TTableUretimKaynakMamulDegisim.Create(DataApp.DataObject);
  Table.Name := 'TableUretimKaynakMamulDegisim';
  Table.TableItems.TableNames := 'URTKMD';
end;

destructor TAppDataChildCustomUretimKaynakMamulDegisim.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimKaynakMamulDegisim.GetTable: TTableUretimKaynakMamulDegisim;
begin
  Result := TTableUretimKaynakMamulDegisim(inherited GetTable);
end;

procedure TAppDataChildCustomUretimKaynakMamulDegisim.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
  end;
end;

procedure TAppDataChildCustomUretimKaynakMamulDegisim.SetTable(Value: TTableUretimKaynakMamulDegisim);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimKaynakMamulDegisim.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('KAYNAKKOD');
    AddNonBlank('KURULUMMAMULKOD');
    AddNonBlank('SOKUMMAMULKOD');
  end;
end;

{ TAppDataChildUretimKaynakMamulDegisim }

procedure TAppDataChildUretimKaynakMamulDegisim.CreateRules;
begin
  inherited;

  FRuleUretimKaynakMamulDegisimCustom := TAppRuleUretimKaynakMamulDegisimCustom.Create(Self);
  Rules.AddRule(FRuleUretimKaynakMamulDegisimCustom);
end;

procedure TAppDataChildUretimKaynakMamulDegisim.CreateTable;
begin
  inherited;
  Table.TableItems.TableNames := VarArrayOf(['URTKMD', 'STKKRL', 'STKSKM']);
  Table.TableItems.TableCaptions := VarArrayOf(['Kaynak Mamül Degisim', 'Kurulum Stok Kart', 'Söküm Stok Kart']);
end;

{ TAppRuleUretimKaynakMamulDegisimCustom }

constructor TAppRuleUretimKaynakMamulDegisimCustom.Create(
  AOwner: TTableUretimKaynakMamulDegisim);
begin
  inherited Create;
  FTableUretimKaynakMamulDegisim := AOwner;
  FTableUretimKaynakMamulDegisim.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimKaynakMamulDegisimCustom.Create(
  AOwner: TAppDataChildCustomUretimKaynakMamulDegisim);
begin
  Create(AOwner.Table);
  FDataChildUretimKaynakMamulDegisim := AOwner;
end;

procedure TAppRuleUretimKaynakMamulDegisimCustom.DoBeforePost(
  Table: TAppCustomTable);
begin
  inherited;

end;

procedure TAppRuleUretimKaynakMamulDegisimCustom.DoOnNewRecord(
  Table: TAppCustomTable);
begin
  inherited;

end;

end.
