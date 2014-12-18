unit CPMApp_DataChildUretimRotaKaynakNot;

interface

uses
  SysUtils,
  CPMApp_DataApp,
  CPMApp_Rule_ClientIncrement,
  CPMApp_TableUretimTempSystem;

type
  TAppDataChildCustomUretimRotaKaynakNot = class;
  TAppDataChildUretimRotaKaynakNot = class;

  TAppDataChildCustomUretimRotaKaynakNot = class(TAppDataChild)
  private
    FTableClone: TTableUretimRotaKaynakNot;
  protected
    function GetTable: TTableUretimRotaKaynakNot;
    procedure SetTable(Value: TTableUretimRotaKaynakNot);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimRotaKaynakNot read GetTable write SetTable;
    property TableClone: TTableUretimRotaKaynakNot read FTableClone;
  end;

  TAppDataChildUretimRotaKaynakNot = class(TAppDataChildCustomUretimRotaKaynakNot)
  private
    FRuleSiraNo: TAppRuleClientIncrement;
  protected
    procedure CreateRules; override;
  published
    property RuleSiraNo: TAppRuleClientIncrement read FRuleSiraNo;
  end;

implementation

uses
  CPMApp_Rule_FieldValidate;

{ TAppDataChildCustomUretimRotaKaynakNot }

constructor TAppDataChildCustomUretimRotaKaynakNot.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimRotaKaynakNot.CreateTable;
begin
  Table := TTableUretimRotaKaynakNot.Create(DataApp.DataObject);
  Table.Name := 'TableUretimRotaKaynakNot';
  Table.TableItems.TableCaptions := 'Üretim Not';

  FTableClone := TTableUretimRotaKaynakNot.Create(nil);
  FTableClone.Name := Table.Name;
  FTableClone.ProviderName := Table.ProviderName;
  FTableClone.Connection := DataApp.DataObject.Connection;
  Table.AddClone(FTableClone);
end;

destructor TAppDataChildCustomUretimRotaKaynakNot.Destroy;
begin
  FreeAndNil(FTableClone);
  inherited;
end;

function TAppDataChildCustomUretimRotaKaynakNot.GetTable: TTableUretimRotaKaynakNot;
begin
  Result := TTableUretimRotaKaynakNot(inherited GetTable);
end;

procedure TAppDataChildCustomUretimRotaKaynakNot.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
  end;
end;

procedure TAppDataChildCustomUretimRotaKaynakNot.SetTable(Value: TTableUretimRotaKaynakNot);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimRotaKaynakNot.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('EVRAKTIP');
    AddNonBlank('EVRAKNO');
    AddNonBlank('SIRANO');
    AddNonBlank('OPERASYONNO');
    AddNonBlank('ISMERKEZKOD');
    AddNonBlank('KAYNAKKOD');
  end;
end;


{ TAppDataChildUretimRotaKaynakNot }

procedure TAppDataChildUretimRotaKaynakNot.CreateRules;
begin
  inherited;
  FRuleSiraNo := TAppRuleClientIncrement.Create(Table);
  Rules.AddRule(FRuleSiraNo);
  FRuleSiraNo.FieldName := 'SIRANO';
end;

end.
