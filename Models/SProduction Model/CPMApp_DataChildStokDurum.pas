unit CPMApp_DataChildStokDurum;

interface

uses
  CPMApp_DataApp,
  CPMApp_DataControllerStokDurum,
  CPMApp_TableStokSystem;

type
  TAppDataChildStokDurum = class(TAppDataChild)
  private
  protected
    function GetTable: TTableStokKart;
    procedure SetTable(Value: TTableStokKart);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  public
    procedure Open(MamulKod: String);
  published
    property Table: TTableStokKart read GetTable write SetTable;
  end;

implementation

uses
  CPMApp_TableItems;

{ TAppDataChildStokDurum }

procedure TAppDataChildStokDurum.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildStokDurum.CreateTable;
begin
  Table := TTableStokKart.Create(DataApp.DataObject);
  Table.Name := 'TableStokDurum';
  Table.TableItems.TableNames := AppStokDurumHelper.StokDurumDef;
  Table.TableItems.TableAlias := 'STKDRM';
end;

function TAppDataChildStokDurum.GetTable: TTableStokKart;
begin
  Result := TTableStokKart(inherited GetTable);
end;

procedure TAppDataChildStokDurum.SetDefaultValues;
begin
  inherited;
end;

procedure TAppDataChildStokDurum.SetTable(Value: TTableStokKart);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildStokDurum.SetValidates;
begin
  inherited;
end;

procedure TAppDataChildStokDurum.Open(MamulKod: String);
begin
  Table.Close;
  if MamulKod = '' then
    exit;
  with Table.TableItems[0].Where do
  begin
    Clear;
    Add('MALKOD', wcEqual, MamulKod);
  end;
  Table.Open;
  Table.TableItems[0].Where.Clear;
end;

end.

