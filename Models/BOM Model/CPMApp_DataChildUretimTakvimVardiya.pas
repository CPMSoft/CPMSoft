unit CPMApp_DataChildUretimTakvimVardiya;

interface

uses
  CPMApp_DataApp,
  CPMApp_TableBOMSystem;

type
  TAppDataChildUretimTakvimVardiya = class(TAppDataChild)
  protected
    function GetTable: TTableUretimTakvimVardiya;
    procedure SetTable(Value: TTableUretimTakvimVardiya);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
    property Table: TTableUretimTakvimVardiya read GetTable write SetTable;
  end;

implementation

{ TAppDataChildUretimTakvimVardiya }

procedure TAppDataChildUretimTakvimVardiya.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildUretimTakvimVardiya.CreateTable;
begin
  Table := TTableUretimTakvimVardiya.Create(DataApp.DataObject);
  Table.Name := 'TableUretimTakvimVardiya';
end;

function TAppDataChildUretimTakvimVardiya.GetTable: TTableUretimTakvimVardiya;
begin
  Result := TTableUretimTakvimVardiya(inherited GetTable);
end;

procedure TAppDataChildUretimTakvimVardiya.SetDefaultValues;
begin
  inherited;

  with Table.DefaultValue do
  begin
  end;
end;

procedure TAppDataChildUretimTakvimVardiya.SetTable(Value: TTableUretimTakvimVardiya);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildUretimTakvimVardiya.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('TAKVIMKOD');
    AddNonBlank('VARDIYAKOD');
  end;
end;

end.
