unit CPMApp_DataChildUretimRotaKaynak;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CpmApp_TableUretimSystem, CPMApp_BOMConsts;

type
  TAppDataChildCustomUretimRotaKaynak = class;
  TAppDataChildUretimRotaKaynak = class;

  TAppDataChildCustomUretimRotaKaynak = class(TAppDataChild)
  private
    FTableClone: TTableUretimRotaKaynak;
  protected
    function GetTable: TTableUretimRotaKaynak;
    procedure SetTable(Value: TTableUretimRotaKaynak);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimRotaKaynak read GetTable write SetTable;
    property TableClone: TTableUretimRotaKaynak read FTableClone write FTableClone;
  end;

  TAppRuleUretimRotaKaynakCustom = class(TAppTableRule)
  private
    FTableUretimRotaKaynak: TTableUretimRotaKaynak;
    FDataChildUretimRotaKaynak: TAppDataChildUretimRotaKaynak;
  protected
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
    procedure DoOnAllowEditing(Table: TAppCustomTable; Field: TField; var Allow: Boolean); override;
  public
    constructor Create(AOwner: TTableUretimRotaKaynak); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimRotaKaynak); reintroduce; overload;
  end;

  TAppDataChildUretimRotaKaynak = class(TAppDataChildCustomUretimRotaKaynak)
  private
    FRuleCustom: TAppRuleUretimRotaKaynakCustom;
  protected
    procedure CreateRules; override;
  published
    property RuleCustom: TAppRuleUretimRotaKaynakCustom read FRuleCustom;
  end;

implementation

uses
  CPMApp_Dialogs,
  CPMApp_TableItems,
  CPMApp_Rule_FieldValidate,
  CPMApp_DAPCustomMamulKart;

{ TAppDataChildCustomUretimRotaKaynak }

constructor TAppDataChildCustomUretimRotaKaynak.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimRotaKaynak.CreateTable;
begin
  Table := TTableUretimRotaKaynak.Create(DataApp.DataObject);
  Table.Name := 'TableUretimRotaKaynak';

  FTableClone := TTableUretimRotaKaynak.Create(nil);
  FTableClone.Name := Table.Name;
  FTableClone.ProviderName := Table.ProviderName;
  FTableClone.Connection := DataApp.DataObject.Connection;
  Table.AddClone(FTableClone);
end;

destructor TAppDataChildCustomUretimRotaKaynak.Destroy;
begin
  FreeAndNil(FTableClone);
  inherited;
end;

function TAppDataChildCustomUretimRotaKaynak.GetTable: TTableUretimRotaKaynak;
begin
  Result := TTableUretimRotaKaynak(inherited GetTable);
end;

procedure TAppDataChildCustomUretimRotaKaynak.SetDefaultValues;
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

procedure TAppDataChildCustomUretimRotaKaynak.SetTable(Value: TTableUretimRotaKaynak);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimRotaKaynak.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
  end;
end;

{ TAppRuleUretimRotaKaynakCustom }

constructor TAppRuleUretimRotaKaynakCustom.Create(AOwner: TTableUretimRotaKaynak);
begin
  inherited Create;
  FTableUretimRotaKaynak := AOwner;
  FTableUretimRotaKaynak.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimRotaKaynakCustom.Create(AOwner: TAppDataChildUretimRotaKaynak);
begin
  Create(AOwner.Table);
  FDataChildUretimRotaKaynak := AOwner;
end;

procedure TAppRuleUretimRotaKaynakCustom.DoOnAllowEditing(
  Table: TAppCustomTable; Field: TField; var Allow: Boolean);
begin
  inherited;
  with FTableUretimRotaKaynak do
  begin
    if Field = fKullanilan then
    begin
      Allow := OpDurum in [odNone, odCanceled];
      if not Allow then
        AppShowMessage('Operasyon baþlamýþ. Kullanýlan kaynak deðiþtirilemez!');
    end;
  end;
end;

procedure TAppRuleUretimRotaKaynakCustom.DoOnFieldChanged(
  Table: TAppCustomTable; Field: TField);
begin
  if (Field = FTableUretimRotaKaynak.fKurulumSure) or
    (Field = FTableUretimRotaKaynak.fMiktar) or
    (Field = FTableUretimRotaKaynak.fCalismaSure) or
    (Field = FTableUretimRotaKaynak.fSokumSure) then
    FTableUretimRotaKaynak.ToplamSure := FTableUretimRotaKaynak.KurulumSure + (FTableUretimRotaKaynak.Miktar * FTableUretimRotaKaynak.CalismaSure) + FTableUretimRotaKaynak.SokumSure;
  if Field = FTableUretimRotaKaynak.fKullanilan then
  begin
    if FTableUretimRotaKaynak.Kullanilan = 0 then
      FTableUretimRotaKaynak.OpDurum := odCanceled
    else
      FTableUretimRotaKaynak.OpDurum := odNone;
  end;
end;

{ TAppDataChildUretimRotaKaynak }

procedure TAppDataChildUretimRotaKaynak.CreateRules;
begin
  inherited;
  FRuleCustom := TAppRuleUretimRotaKaynakCustom.Create(Self);
  Rules.AddRule(FRuleCustom);
end;

end.
