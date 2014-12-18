unit CPMApp_DataChildUretimHareket;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableUretimSystem, CPMApp_TableCariSystem, CPMApp_TableStokSystem,
  CPMApp_Rule_Increment, CPMApp_Rule_ClientIncrement;

type
  TAppDataChildCustomUretimHareket = class;
  TAppDataChildUretimHareket = class;

  TAppDataChildCustomUretimHareket = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimHareket;
    procedure SetTable(Value: TTableUretimHareket);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimHareket read GetTable write SetTable;
  end;

  TAppRuleIncrementSiraNo = class(TAppRuleClientIncrement)
  private
    FTableUretimHareket: TTableUretimHareket;
  public
    constructor Create(AOwner: TTableUretimHareket); reintroduce; overload;
  end;

  TAppDataChildUretimHareket = class(TAppDataChildCustomUretimHareket)
  private
    FRuleIncrementSiraNo: TAppRuleIncrementSiraNo;
//    procedure FetchStokHareketDoviz;
  protected
    procedure CreateTable; override;
    procedure CreateRules; override;
    procedure Initialize; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
//    procedure DoUpdateStokHareketDoviz;
    // Burasý direk maliyetleri topluyor altýndakinin.

  published
    property RuleIncrementSiraNo: TAppRuleIncrementSiraNo read FRuleIncrementSiraNo;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_DAPCustomUretim, Variants, CPMApp_Math;

{ TAppDataChildCustomUretimHareket }

constructor TAppDataChildCustomUretimHareket.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimHareket.CreateTable;
begin
  Table := TTableUretimHareket.Create(DataApp.DataObject);
  Table.Name := 'TableUretimHareket';
  Table.TableItems.TableNames := 'URTHAR';
end;

destructor TAppDataChildCustomUretimHareket.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimHareket.GetTable: TTableUretimHareket;
begin
  Result := TTableUretimHareket(inherited GetTable);
end;

procedure TAppDataChildCustomUretimHareket.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
    Add('SIRKETNO', DataApp.CompanyNo);
  end;
end;

procedure TAppDataChildCustomUretimHareket.SetTable(Value: TTableUretimHareket);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimHareket.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('MAMULKOD');
    AddNonBlank('HAMMADDEKOD');
    AddNonBlank('ANAMAMULKOD');
    AddNonBlank('DEPOKOD');
  end;
end;

{ TAppDataChildUretimHareket }

procedure TAppDataChildUretimHareket.CreateRules;
begin
  inherited;
  FRuleIncrementSiraNo := TAppRuleIncrementSiraNo.Create(Table);
  Rules.AddRule(FRuleIncrementSiraNo);
end;

procedure TAppDataChildUretimHareket.CreateTable;
begin
  inherited;
end;

destructor TAppDataChildUretimHareket.Destroy;
begin
  inherited;
end;

procedure TAppDataChildUretimHareket.Initialize;
begin
  inherited;
end;

{
procedure TAppDataChildUretimHareket.DoUpdateStokHareketDoviz;
begin
  if TableStokHareket.IsEmpty then
    exit;
  TableStokHareket.DisableControls;
  try
    TableStokHareket.First;
    while not TableStokHareket.Eof do
    begin
      TableStokHareket.Edit;
      FetchStokHareketDoviz;
      TableStokHareket.Post;
      TableStokHareket.Next;
    end;
  finally
    TableStokHareket.EnableControls;
  end;
end;
}

{
procedure TAppDataChildUretimHareket.FetchStokHareketDoviz;
begin
  if TableStokHareket.Banka <> TableUretimBaslik.Banka then
    TableStokHareket.Banka := TableUretimBaslik.Banka;
  if TableStokHareket.DovizTarih <> TableUretimBaslik.DovizTarih then
    TableStokHareket.DovizTarih := TableUretimBaslik.DovizTarih;
  if TableStokHareket.DovizTip <> TableUretimBaslik.DovizTip then
    TableStokHareket.DovizTip := TableUretimBaslik.DovizTip;
  if TableStokHareket.DovizKur > 0 then
    TableStokHareket.DovizTutar := AppRoundMoney(TableStokHareket.EvrakTutar / TableStokHareket.DovizKur);
end;
}

constructor TAppDataChildUretimHareket.Create(AOwner: TAppDataApp);
begin
  inherited;
end;

{ TAppRuleIncrementSiraNo }

constructor TAppRuleIncrementSiraNo.Create(AOwner: TTableUretimHareket);
begin
  inherited Create(AOwner);
  FTableUretimHareket := AOwner;
  FieldName := 'SIRANO';
end;

end.
