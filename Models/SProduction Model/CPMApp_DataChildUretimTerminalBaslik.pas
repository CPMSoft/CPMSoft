unit CPMApp_DataChildUretimTerminalBaslik;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableUretimTempSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimTerminalBaslik = class;
  TAppDataChildUretimTerminalBaslik = class;

  TAppDataChildCustomUretimTerminalBaslik = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimTerminalBaslik;
    procedure SetTable(Value: TTableUretimTerminalBaslik);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimTerminalBaslik read GetTable write SetTable;
  end;

  TAppDataChildUretimTerminalBaslik = class(TAppDataChildCustomUretimTerminalBaslik)
  private
  protected
    procedure CreateRules; override;
  published
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_TableItems;

{ TAppDataChildCustomUretimTerminalBaslik }

constructor TAppDataChildCustomUretimTerminalBaslik.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimTerminalBaslik.CreateTable;
begin
  Table := TTableUretimTerminalBaslik.Create(DataApp.DataObject);
  Table.Name := 'TableUretimTerminalBaslik';
  Table.IndexFieldNames := 'SIRKETNO;TERMINALKOD';
end;

destructor TAppDataChildCustomUretimTerminalBaslik.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimTerminalBaslik.GetTable: TTableUretimTerminalBaslik;
begin
  Result := TTableUretimTerminalBaslik(inherited GetTable);
end;

procedure TAppDataChildCustomUretimTerminalBaslik.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
  end;
end;

procedure TAppDataChildCustomUretimTerminalBaslik.SetTable(Value: TTableUretimTerminalBaslik);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimTerminalBaslik.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('SIRKETNO');
    AddNonBlank('TERMINALKOD');
    AddNonBlank('TERMINALAD');
  end;
end;

{ TAppDataChildUretimTerminalBaslik }
procedure TAppDataChildUretimTerminalBaslik.CreateRules;
begin
  inherited;

end;

end.
