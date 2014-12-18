unit CPMApp_DataChildIsMerkezKaynak;

interface

uses
  CPMApp_DataApp,
  CPMApp_TableBOMSystem;

type
  TAppDataChildIsMerkezKaynak = class(TAppDataChild)
  protected
    function GetTable: TTableIsMerkezKaynak;
    procedure SetTable(Value: TTableIsMerkezKaynak);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
    property Table: TTableIsMerkezKaynak read GetTable write SetTable;
  end;

implementation

uses CPMApp_Rule_FieldValidate;

{ TAppDataChildIsMerkezKaynak }

procedure TAppDataChildIsMerkezKaynak.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildIsMerkezKaynak.CreateTable;
begin
  Table := TTableIsMerkezKaynak.Create(DataApp.DataObject);
  Table.Name := 'TableIsMerkezKaynak';
end;

function TAppDataChildIsMerkezKaynak.GetTable: TTableIsMerkezKaynak;
begin
  Result := TTableIsMerkezKaynak(inherited GetTable);
end;

procedure TAppDataChildIsMerkezKaynak.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
  end;
end;

procedure TAppDataChildIsMerkezKaynak.SetTable(Value: TTableIsMerkezKaynak);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildIsMerkezKaynak.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('ISMERKEZKOD');
    AddNonBlank('KAYNAKKOD');
  end;
end;

end.
