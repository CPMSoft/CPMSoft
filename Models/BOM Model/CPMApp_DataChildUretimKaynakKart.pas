unit CPMApp_DataChildUretimKaynakKart;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimKaynakKart = class;
  TAppDataChildUretimKaynakKart = class;

  TAppDataChildCustomUretimKaynakKart = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimKaynakKart;
    procedure SetTable(Value: TTableUretimKaynakKart);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimKaynakKart read GetTable write SetTable;
  end;

  TAppRuleIncrementKaynakKod = class(TAppRuleIncrement)
  private
    FTableUretimKaynakKart: TTableUretimKaynakKart;
    FDataChildUretimKaynakKart: TAppDataChildUretimKaynakKart;
  public
    constructor Create(AOwner: TTableUretimKaynakKart); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimKaynakKart); reintroduce; overload;
  end;

  TAppDataChildUretimKaynakKart = class(TAppDataChildCustomUretimKaynakKart)
  private
    FRuleIncrementKaynakKod: TAppRuleIncrementKaynakKod;
  protected
    procedure CreateRules; override;
  published
    property RuleIncrementKaynakKod: TAppRuleIncrementKaynakKod read FRuleIncrementKaynakKod;
  end;

implementation

uses CPMApp_Rule_FieldValidate;

{ TAppDataChildCustomUretimKaynakKart }

constructor TAppDataChildCustomUretimKaynakKart.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimKaynakKart.CreateTable;
begin
  Table := TTableUretimKaynakKart.Create(DataApp.DataObject);
  Table.Name := 'TableUretimKaynakKart';
  Table.TableItems.TableNames := VarArrayOf(['URTKYN']);
  Table.TableItems.TableCaptions := VarArrayOf(['Kaynak Kartý']);
end;

destructor TAppDataChildCustomUretimKaynakKart.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimKaynakKart.GetTable: TTableUretimKaynakKart;
begin
  Result := TTableUretimKaynakKart(inherited GetTable);
end;

procedure TAppDataChildCustomUretimKaynakKart.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
    Add('KAPASITE', 1);
    Add('VERIMLILIK', 100);
  end;
end;

procedure TAppDataChildCustomUretimKaynakKart.SetTable(Value: TTableUretimKaynakKart);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimKaynakKart.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('KAYNAKKOD');
    AddNonBlank('KAYNAKAD');
    AddNonBlank('ISMERKEZKOD');
    AddNonBlank('KAPASITE');
    Add('VERIMLILIK', vcGreaterEqual, 0);
    Add('VERIMLILIK', vcLessEqual, 100);
  end;
end;

{ TAppDataChildUretimKaynakKart }

procedure TAppDataChildUretimKaynakKart.CreateRules;
begin
  inherited;
  FRuleIncrementKaynakKod := TAppRuleIncrementKaynakKod.Create(Self);
  Rules.AddRule(FRuleIncrementKaynakKod);
end;

{ TAppRuleKaynakKodIncrement }

constructor TAppRuleIncrementKaynakKod.Create(
  AOwner: TTableUretimKaynakKart);
begin
  inherited Create(AOwner);
  FTableUretimKaynakKart := AOwner;
  FieldName := 'KAYNAKKOD';
end;

constructor TAppRuleIncrementKaynakKod.Create(
  AOwner: TAppDataChildUretimKaynakKart);
begin
  Create(AOwner.Table);
  FDataChildUretimKaynakKart := AOwner;
end;

end.
