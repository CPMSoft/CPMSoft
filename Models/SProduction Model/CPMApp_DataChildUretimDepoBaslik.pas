unit CPMApp_DataChildUretimDepoBaslik;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableWarehouseSystem;

type

  TAppDataChildCustomUretimDepoBaslik = class(TAppDataChild)
  private
    FTableClone: TTableDepoBaslik;
  protected
    function GetTable: TTableDepoBaslik;
    procedure SetTable(Value: TTableDepoBaslik);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
    procedure CreateRules; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableDepoBaslik read GetTable write SetTable;
    property TableClone: TTableDepoBaslik read FTableClone;
  end;

  TAppDataChildUretimDepoBaslik = class(TAppDataChildCustomUretimDepoBaslik)
  end;
  
implementation

uses CPMApp_Rule_FieldValidate, CPMApp_Rule_FieldDefaultValue,
  CPMApp_DAPCustomUretim;

{ TAppDataChildCustomUretimDepoBaslik }

constructor TAppDataChildCustomUretimDepoBaslik.Create(
  AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimDepoBaslik.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildCustomUretimDepoBaslik.CreateTable;
begin
  inherited;
  Table := TTableDepoBaslik.Create(DataApp.DataObject);
  Table.Name := 'TableUretimDepoBaslik';
  Table.TableItems.TableNames := 'DEPBAS';
  FTableClone := TTableDepoBaslik.Create(nil);
  FTableClone.Name := 'TableUretimDepoBaslik';
  FTableClone.ProviderName := Table.ProviderName;
  FTableClone.Connection := DataApp.DataObject.Connection;
  Table.AddClone(FTableClone);
end;

destructor TAppDataChildCustomUretimDepoBaslik.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimDepoBaslik.GetTable: TTableDepoBaslik;
begin
  Result := TTableDepoBaslik(inherited GetTable);
end;

procedure TAppDataChildCustomUretimDepoBaslik.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
  end;
end;

procedure TAppDataChildCustomUretimDepoBaslik.SetTable(
  Value: TTableDepoBaslik);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimDepoBaslik.SetValidates;
begin
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('EVRAKNO');
    AddNonBlank('HESAPKOD');
  end;
end;

end.
