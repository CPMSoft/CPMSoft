unit CPMApp_DataChildMamulRotaSonrakiOperasyon;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomMamulRotaSonrakiOperasyon = class;
  TAppDataChildMamulRotaSonrakiOperasyon = class;

  TAppDataChildCustomMamulRotaSonrakiOperasyon = class(TAppDataChild)
  private
  protected
    function GetTable: TTableMamulRotaSonrakiOperasyon;
    procedure SetTable(Value: TTableMamulRotaSonrakiOperasyon);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableMamulRotaSonrakiOperasyon read GetTable write SetTable;
  end;

  TAppDataChildMamulRotaSonrakiOperasyon = class(TAppDataChildCustomMamulRotaSonrakiOperasyon)
  protected
    procedure CreateRules; override;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_DAPCustomMamulKart;

{ TAppDataChildCustomMamulRotaSonrakiOperasyon }

constructor TAppDataChildCustomMamulRotaSonrakiOperasyon.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomMamulRotaSonrakiOperasyon.CreateTable;
begin
  Table := TTableMamulRotaSonrakiOperasyon.Create(DataApp.DataObject);
  Table.Name := 'TableMamulRotaSonrakiOperasyon';
  Table.TableItems.TableNames := VarArrayOf(['MAMROP']);
  Table.TableItems.TableCaptions := VarArrayOf(['Mamül Rota Sonraki Operasyon']);
end;

destructor TAppDataChildCustomMamulRotaSonrakiOperasyon.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomMamulRotaSonrakiOperasyon.GetTable: TTableMamulRotaSonrakiOperasyon;
begin
  Result := TTableMamulRotaSonrakiOperasyon(inherited GetTable);
end;

procedure TAppDataChildCustomMamulRotaSonrakiOperasyon.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
  end;
end;

procedure TAppDataChildCustomMamulRotaSonrakiOperasyon.SetTable(Value: TTableMamulRotaSonrakiOperasyon);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomMamulRotaSonrakiOperasyon.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('SONRAKIOPERASYONNO');
  end;
end;

{ TAppDataChildMamulRotaSonrakiOperasyon }

procedure TAppDataChildMamulRotaSonrakiOperasyon.CreateRules;
begin
  inherited;

end;

end.
