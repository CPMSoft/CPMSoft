unit CPMApp_DataChildUretimKart;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CpmApp_TableUretimSystem, 
  CPMApp_Rule_Increment, CPMApp_Rule_ClientIncrement;

type

  TAppDataChildCustomUretimKart = class;
  TAppDataChildUretimKart = class;

  TAppDataChildCustomUretimKart = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimKart;
    procedure SetTable(Value: TTableUretimKart);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimKart read GetTable write SetTable;
  end;

  TAppRuleUretimKartCustom = class(TAppTableRule)
  private
    FDataChild: TAppDataChildUretimKart;
    FTable: TTableUretimKart;
    FTableCommand: TAppDBTable;
    InUse: Boolean;
    function GetMamulDepoKod(MamulKod: String): String;
  protected
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDataChildUretimKart); reintroduce; overload;
    destructor Destroy; override;
  end;

  TAppDataChildUretimKart = class(TAppDataChildCustomUretimKart)
  private
    FRuleEvrakNo: TAppRuleIncrement;
    FRuleSiraNo: TAppRuleClientIncrement;
    FRuleCustom: TAppRuleUretimKartCustom;
    FEvrakTip: Integer;
  protected
    procedure CreateRules; override;
  public
    property EvrakTip: Integer read FEvrakTip write FEvrakTip;
  published
    property RuleEvrakNo: TAppRuleIncrement read FRuleEvrakNo;
    property RuleSiraNo: TAppRuleClientIncrement read FRuleSiraNo;
    property RuleCustom: TAppRuleUretimKartCustom read FRuleCustom;
  end;

implementation

uses CPMApp_TableItems, CPMApp_Rule_FieldValidate, CPMApp_Rule_FieldDefaultValue;

{ TAppDataChildCustomUretimKart }

constructor TAppDataChildCustomUretimKart.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimKart.CreateTable;
begin
  Table := TTableUretimKart.Create(DataApp.DataObject);
  Table.Name := 'TableUretimKart';
  Table.TableItems.TableCaptions := 'Üretim Kart';
end;

destructor TAppDataChildCustomUretimKart.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimKart.GetTable: TTableUretimKart;
begin
  Result := TTableUretimKart(inherited GetTable);
end;

procedure TAppDataChildCustomUretimKart.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    InitFieldOnNewRecord := True;
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('HESAPKOD', 'GENEL');
  end;
end;

procedure TAppDataChildCustomUretimKart.SetTable(Value: TTableUretimKart);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimKart.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('URETIMNO');
    AddNonBlank('EVRAKTARIH');
    AddNonBlank('HESAPKOD');
    AddNonBlank('EVRAKNO');
    AddNonBlank('MIKTAR');
  end;
end;

{ TAppDataChildUretimKart }

procedure TAppDataChildUretimKart.CreateRules;
begin
  inherited;
  FRuleEvrakNo := TAppRuleIncrement.Create(Table);
  FRuleEvrakNo.FieldName := 'EVRAKNO';
  FRuleEvrakNo.AppName := DataApp.AppName;
  Rules.AddRule(FRuleEvrakNo);

  FRuleSiraNo := TAppRuleClientIncrement.Create(Table);
  FRuleSiraNo.FieldName := 'SIRANO';
  Rules.AddRule(FRuleSiraNo);

  FRuleCustom := TAppRuleUretimKartCustom.Create(Self);
  Rules.AddRule(FRuleCustom);
end;

{ TAppRuleUretimKartCustom }

constructor TAppRuleUretimKartCustom.Create(AOwner: TAppDataChildUretimKart);
begin
  inherited Create;

  FDataChild := AOwner;

  FTable := FDataChild.Table;
  FTable.DataEvents.AddRule(Self);

  FTableCommand := TAppDBTable.Create(nil);
  FTableCommand.Connection := FTable.Connection;
  FTableCommand.ReadOnly := True;
end;

destructor TAppRuleUretimKartCustom.Destroy;
begin
  FreeAndNil(FTableCommand);
  inherited;
end;

procedure TAppRuleUretimKartCustom.DoOnFieldChanged(Table: TAppCustomTable;
  Field: TField);
begin
  inherited;
  if InUse then
    exit;
  InUse := True;
  try
    if (Field = FTable.fMamulKod) or (Field = FTable.fVersiyonNo) then
      FTable.MamulDepoKod := GetMamulDepoKod(FTable.MamulKod);
  finally
    InUse := False;
  end;
end;

procedure TAppRuleUretimKartCustom.DoOnNewRecord(Table: TAppCustomTable);
begin
  inherited;
  FTable.EvrakTip := FDataChild.EvrakTip;
end;

function TAppRuleUretimKartCustom.GetMamulDepoKod(MamulKod: String): String;
begin
  FTableCommand.TableItems.TableNames := 'MAMBAS';
  with FTableCommand.TableItems[0].Fields do
  begin
    Clear;
    Add('MAMULDEPOKOD');
  end;
  with FTableCommand.TableItems[0].Where do
  begin
    Clear;
    Add('MAMULKOD', wcEqual, MamulKod);
  end;
  FTableCommand.Open;
  Result := FTableCommand.Fields[0].AsString;
  FTableCommand.Close;
end;

end.

