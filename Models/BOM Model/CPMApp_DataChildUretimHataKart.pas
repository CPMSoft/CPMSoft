unit CPMApp_DataChildUretimHataKart;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimHataKart = class;
  TAppDataChildUretimHataKart = class;

  TAppDataChildCustomUretimHataKart = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimHataKart;
    procedure SetTable(Value: TTableUretimHataKart);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimHataKart read GetTable write SetTable;
  end;

  TAppDataChildUretimHataKart = class(TAppDataChildCustomUretimHataKart)
  private
  protected
    procedure CreateRules; override;
  published
  end;

implementation

uses CPMApp_Rule_FieldValidate;

{ TAppDataChildCustomUretimHataKart }

constructor TAppDataChildCustomUretimHataKart.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimHataKart.CreateTable;
begin
  Table := TTableUretimHataKart.Create(DataApp.DataObject);
  Table.Name := 'TableUretimHataKart';
  Table.TableItems.TableNames := VarArrayOf(['URTOHK']);
  Table.TableItems.TableCaptions := VarArrayOf(['Hata Kartý']);
end;

destructor TAppDataChildCustomUretimHataKart.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimHataKart.GetTable: TTableUretimHataKart;
begin
  Result := TTableUretimHataKart(inherited GetTable);
end;

procedure TAppDataChildCustomUretimHataKart.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
  end;
end;

procedure TAppDataChildCustomUretimHataKart.SetTable(Value: TTableUretimHataKart);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimHataKart.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('HATAKOD');
    AddNonBlank('ACIKLAMA');
  end;
end;

{ TAppDataChildUretimHataKart }

procedure TAppDataChildUretimHataKart.CreateRules;
begin
  inherited;

end;

end.
