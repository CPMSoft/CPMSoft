unit CPMApp_DataChildUretimVardiyaKart;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimVardiyaKart = class;
  TAppDataChildUretimVardiyaKart = class;

  TAppDataChildCustomUretimVardiyaKart = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimVardiyaKart;
    procedure SetTable(Value: TTableUretimVardiyaKart);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimVardiyaKart read GetTable write SetTable;
  end;

  TAppDataChildUretimVardiyaKart = class(TAppDataChildCustomUretimVardiyaKart)
  private
  protected
    procedure CreateRules; override;
  published
  end;

implementation

uses CPMApp_Rule_FieldValidate;

{ TAppDataChildCustomUretimVardiyaKart }

constructor TAppDataChildCustomUretimVardiyaKart.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimVardiyaKart.CreateTable;
begin
  Table := TTableUretimVardiyaKart.Create(DataApp.DataObject);
  Table.Name := 'TableUretimVardiyaKart';
  Table.TableItems.TableNames := VarArrayOf(['URTVRB']);
  Table.TableItems.TableCaptions := VarArrayOf(['Vardiya Kartý']);
  Table.IndexFieldNames := 'VARDIYAKOD';
end;

destructor TAppDataChildCustomUretimVardiyaKart.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimVardiyaKart.GetTable: TTableUretimVardiyaKart;
begin
  Result := TTableUretimVardiyaKart(inherited GetTable);
end;

procedure TAppDataChildCustomUretimVardiyaKart.SetDefaultValues;
begin
  inherited;
//  with Table.DefaultValue do
//  begin
//    Add('SIRKETNO', DataApp.CompanyNo);
//  end;
end;

procedure TAppDataChildCustomUretimVardiyaKart.SetTable(Value: TTableUretimVardiyaKart);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimVardiyaKart.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
//    AddNonBlank('SIRKETNO');
    AddNonBlank('VARDIYAKOD');
    AddNonBlank('VARDIYAAD');
  end;
end;

{ TAppDataChildUretimVardiyaKart }
procedure TAppDataChildUretimVardiyaKart.CreateRules;
begin
  inherited;

end;

end.
