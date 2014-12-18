unit CPMApp_DataChildMamulNot;

interface

uses
  CPMApp_DataObjectModel,
  CPMApp_DataApp;

type
  TTableMamulNot = class(TAppTable);

  TAppDataChildMamulNot = class(TAppDataChild)
  protected
    function GetTable: TTableMamulNot;
    procedure SetTable(Value: TTableMamulNot);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
    property Table: TTableMamulNot read GetTable write SetTable;
  end;

implementation

uses
  Variants;

{ TAppDataChildMamulNot }

procedure TAppDataChildMamulNot.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildMamulNot.CreateTable;
begin
  Table := TTableMamulNot.Create(DataApp.DataObject);
  Table.Name := 'TableMamulNot';
  Table.TableItems.TableNames := VarArrayOf(['MAMNOT']);
  Table.TableItems.TableCaptions := VarArrayOf(['Mamül Notlarý']);
end;

function TAppDataChildMamulNot.GetTable: TTableMamulNot;
begin
  Result := TTableMamulNot(inherited GetTable);
end;

procedure TAppDataChildMamulNot.SetDefaultValues;
begin
  inherited;

end;

procedure TAppDataChildMamulNot.SetTable(Value: TTableMamulNot);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildMamulNot.SetValidates;
begin
  inherited;

end;

end.
