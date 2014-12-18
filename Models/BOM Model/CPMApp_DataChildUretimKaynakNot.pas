unit CPMApp_DataChildUretimKaynakNot;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CpmApp_TableUretimSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimKaynakNot = class;
  TAppDataChildUretimKaynakNot = class;

  TAppDataChildCustomUretimKaynakNot = class(TAppDataChild)
  private
  protected
    function GetTable: TAppTable;
    procedure SetTable(Value: TAppTable);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TAppTable read GetTable write SetTable;
  end;

  TAppDataChildUretimKaynakNot = class(TAppDataChildCustomUretimKaynakNot)
  private
  protected
    procedure CreateRules; override;
  published
  end;

implementation

uses CPMApp_Rule_FieldValidate;

{ TAppDataChildCustomUretimKaynakNot }

constructor TAppDataChildCustomUretimKaynakNot.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimKaynakNot.CreateTable;
begin
  Table := TAppTable.Create(DataApp.DataObject);
  Table.Name := 'TableUretimKaynakNot';
  Table.TableItems.TableNames := VarArrayOf(['URTKYY']);
  Table.TableItems.TableCaptions := VarArrayOf(['Kaynak Not']);
end;

destructor TAppDataChildCustomUretimKaynakNot.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimKaynakNot.GetTable: TAppTable;
begin
  Result := TAppTable(inherited GetTable);
end;

procedure TAppDataChildCustomUretimKaynakNot.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
  end;
end;

procedure TAppDataChildCustomUretimKaynakNot.SetTable(Value: TAppTable);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimKaynakNot.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('AD');
  end;
end;

{ TAppDataChildUretimKaynakNot }

procedure TAppDataChildUretimKaynakNot.CreateRules;
begin
  inherited;
end;

end.
