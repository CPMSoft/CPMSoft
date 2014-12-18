unit CPMApp_DataChildUretimKaynakDevamsizlik;

interface
                                                 
uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimKaynakDevamsizlik = class;
  TAppDataChildUretimKaynakDevamsizlik = class;

  TAppDataChildCustomUretimKaynakDevamsizlik = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimKaynakDevamsizlik;
    procedure SetTable(Value: TTableUretimKaynakDevamsizlik);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimKaynakDevamsizlik read GetTable write SetTable;
  end;

  TAppRuleUretimKaynakDevamsizlikCustom = class(TAppTableRule)
  private
    FTableUretimKaynakDevamsizlik: TTableUretimKaynakDevamsizlik;
    FDataChildUretimKaynakDevamsizlik: TAppDataChildCustomUretimKaynakDevamsizlik;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoBeforePost(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TTableUretimKaynakDevamsizlik); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildCustomUretimKaynakDevamsizlik); reintroduce; overload;
  end;

  TAppDataChildUretimKaynakDevamsizlik = class(TAppDataChildCustomUretimKaynakDevamsizlik)
  private
    FRuleUretimKaynakDevamsizlikCustom: TAppRuleUretimKaynakDevamsizlikCustom;
  protected
    procedure CreateRules; override;
  published
    property RuleUretimKaynakDevamsizlikCustom: TAppRuleUretimKaynakDevamsizlikCustom read FRuleUretimKaynakDevamsizlikCustom;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_DAPCustomUretimKaynakKart,
  DateUtils, CPMApp_Date;

{ TAppDataChildCustomUretimKaynakDevamsizlik }

constructor TAppDataChildCustomUretimKaynakDevamsizlik.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimKaynakDevamsizlik.CreateTable;
begin
  Table := TTableUretimKaynakDevamsizlik.Create(DataApp.DataObject);
  Table.Name := 'TableUretimKaynakDevamsizlik';
  Table.TableItems.TableNames := VarArrayOf(['URTKYD']);
  Table.TableItems.TableCaptions := VarArrayOf(['Kaynak Devamsýzlýk']);
end;

destructor TAppDataChildCustomUretimKaynakDevamsizlik.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimKaynakDevamsizlik.GetTable: TTableUretimKaynakDevamsizlik;
begin
  Result := TTableUretimKaynakDevamsizlik(inherited GetTable);
end;

procedure TAppDataChildCustomUretimKaynakDevamsizlik.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
    Add('BASSAAT', AppFirstDate);
    Add('BITSAAT', AppFirstDate);
  end;
end;

procedure TAppDataChildCustomUretimKaynakDevamsizlik.SetTable(Value: TTableUretimKaynakDevamsizlik);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimKaynakDevamsizlik.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('TAKVIMYIL');
    AddNonBlank('KAYNAKKOD');
    AddNonBlank('TARIH');
    AddNonBlank('BASSAAT');
    AddNonBlank('BITSAAT');
    AddNonBlank('KAPASITE');
  end;
end;

{ TAppDataChildUretimKaynakDevamsizlik }

procedure TAppDataChildUretimKaynakDevamsizlik.CreateRules;
begin
  inherited;

  FRuleUretimKaynakDevamsizlikCustom := TAppRuleUretimKaynakDevamsizlikCustom.Create(Self);
  Rules.AddRule(FRuleUretimKaynakDevamsizlikCustom);
end;

{ TAppRuleUretimKaynakDevamsizlikCustom }

constructor TAppRuleUretimKaynakDevamsizlikCustom.Create(
  AOwner: TTableUretimKaynakDevamsizlik);
begin
  inherited Create;
  FTableUretimKaynakDevamsizlik := AOwner;
  FTableUretimKaynakDevamsizlik.DataEvents.AddRule(Self);
end;

constructor TAppRuleUretimKaynakDevamsizlikCustom.Create(
  AOwner: TAppDataChildCustomUretimKaynakDevamsizlik);
begin
  Create(AOwner.Table);
  FDataChildUretimKaynakDevamsizlik := AOwner;
end;

procedure TAppRuleUretimKaynakDevamsizlikCustom.DoBeforePost(
  Table: TAppCustomTable);
begin
  inherited;

  if FTableUretimKaynakDevamsizlik.Kapasite > TAppDAPCustomUretimKaynakKart(FDataChildUretimKaynakDevamsizlik.DataApp).UretimKaynakKart.Table.Kapasite then
    raise Exception.Create('Devamsýzlýk kapasitesi kaynaðýn kapasitesinden büyük olamaz.');

  FTableUretimKaynakDevamsizlik.TakvimYil := YearOf(FTableUretimKaynakDevamsizlik.Tarih);
end;

procedure TAppRuleUretimKaynakDevamsizlikCustom.DoOnNewRecord(
  Table: TAppCustomTable);
begin
  inherited;

  FTableUretimKaynakDevamsizlik.Kapasite := TAppDAPCustomUretimKaynakKart(FDataChildUretimKaynakDevamsizlik.DataApp).UretimKaynakKart.Table.Kapasite;
end;

end.
