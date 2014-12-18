unit CPMApp_DataChildUretimDurusKart;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimDurusKart = class;
  TAppDataChildUretimDurusKart = class;

  TAppDataChildCustomUretimDurusKart = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimDurusKart;
    procedure SetTable(Value: TTableUretimDurusKart);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimDurusKart read GetTable write SetTable;
  end;

  TAppDataChildUretimDurusKart = class(TAppDataChildCustomUretimDurusKart)
  private
  protected
    procedure CreateRules; override;
  published
  end;

implementation

uses CPMApp_Rule_FieldValidate;

{ TAppDataChildCustomUretimDurusKart }

constructor TAppDataChildCustomUretimDurusKart.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimDurusKart.CreateTable;
begin
  Table := TTableUretimDurusKart.Create(DataApp.DataObject);
  Table.Name := 'TableUretimDurusKart';
  Table.TableItems.TableNames := VarArrayOf(['URTODK']);
  Table.TableItems.TableCaptions := VarArrayOf(['Duruþ Kartý']);
end;

destructor TAppDataChildCustomUretimDurusKart.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimDurusKart.GetTable: TTableUretimDurusKart;
begin
  Result := TTableUretimDurusKart(inherited GetTable);
end;

procedure TAppDataChildCustomUretimDurusKart.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
  end;
end;

procedure TAppDataChildCustomUretimDurusKart.SetTable(Value: TTableUretimDurusKart);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimDurusKart.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('DURUSKOD');
    AddNonBlank('ACIKLAMA');
  end;
end;

{ TAppDataChildUretimDurusKart }

procedure TAppDataChildUretimDurusKart.CreateRules;
begin
  inherited;

end;

end.
