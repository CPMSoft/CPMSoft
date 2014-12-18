unit CPMApp_DataChildUretimKaynakTahsisat;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CpmApp_TableUretimSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimKaynakTahsisat = class;
  TAppDataChildUretimKaynakTahsisat = class;

  TAppDataChildCustomUretimKaynakTahsisat = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimKaynakTahsisat;
    procedure SetTable(Value: TTableUretimKaynakTahsisat);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
    procedure CreateRules; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimKaynakTahsisat read GetTable write SetTable;
  end;

  TAppDataChildUretimKaynakTahsisat = class(TAppDataChildCustomUretimKaynakTahsisat)
  end;

implementation

uses CPMApp_Rule_FieldValidate;

{ TAppDataChildCustomUretimKaynakTahsisat }

constructor TAppDataChildCustomUretimKaynakTahsisat.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimKaynakTahsisat.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildCustomUretimKaynakTahsisat.CreateTable;
begin
  Table := TTableUretimKaynakTahsisat.Create(DataApp.DataObject);
  Table.Name := 'TableUretimKaynakTahsisat';
  Table.TableItems.TableNames := 'URTKTH';
end;

destructor TAppDataChildCustomUretimKaynakTahsisat.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimKaynakTahsisat.GetTable: TTableUretimKaynakTahsisat;
begin
  Result := TTableUretimKaynakTahsisat(inherited GetTable);
end;

procedure TAppDataChildCustomUretimKaynakTahsisat.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
  end;
end;

procedure TAppDataChildCustomUretimKaynakTahsisat.SetTable(Value: TTableUretimKaynakTahsisat);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimKaynakTahsisat.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
  end;
end;

end.
