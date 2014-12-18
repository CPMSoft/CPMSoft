unit CPMApp_DataChildSiparisHareketUretim;

interface

uses
  Classes,
  CPMApp_DataObject,
  CPMApp_DataApp,
  CPMApp_TableUretimTempSystem;

type
  TAppDataChildSiparisHareketUretim = class;

  TAppDataChildSiparisHareketUretim = class(TAppDataChild)
  protected
    function GetTable: TTableSiparisHareketUretim;
    procedure SetTable(Value: TTableSiparisHareketUretim);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
    procedure CreateRules; override;
  published
    property Table: TTableSiparisHareketUretim read GetTable write SetTable;
  end;

implementation

{ TAppDataChildSiparisHareketUretim }

procedure TAppDataChildSiparisHareketUretim.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildSiparisHareketUretim.CreateTable;
begin
  Table := TTableSiparisHareketUretim.Create(DataApp.DataObject);
  Table.Name := 'TableSiparisHareketUretim';
  Table.TableItems.TableCaptions := 'Sipariþ Hareket Üretim';
end;

function TAppDataChildSiparisHareketUretim.GetTable: TTableSiparisHareketUretim;
begin
  Result := TTableSiparisHareketUretim(inherited GetTable);
end;

procedure TAppDataChildSiparisHareketUretim.SetDefaultValues;
begin
  inherited;
end;

procedure TAppDataChildSiparisHareketUretim.SetTable(Value: TTableSiparisHareketUretim);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildSiparisHareketUretim.SetValidates;
begin
  inherited;
end;

end.
