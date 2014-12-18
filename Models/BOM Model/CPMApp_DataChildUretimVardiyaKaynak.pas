unit CPMApp_DataChildUretimVardiyaKaynak;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem;

type
  TAppDataChildCustomUretimVardiyaKaynak = class;
  TAppDataChildUretimVardiyaKaynak = class;

  TAppDataChildCustomUretimVardiyaKaynak = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimVardiyaKaynak;
    procedure SetTable(Value: TTableUretimVardiyaKaynak);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimVardiyaKaynak read GetTable write SetTable;
  end;

  TAppDataChildUretimVardiyaKaynak = class(TAppDataChildCustomUretimVardiyaKaynak)
  private
  protected
    procedure CreateTable; override;
    procedure CreateRules; override;
  published
  end;

implementation

uses CPMApp_Rule_FieldValidate;

{ TAppDataChildCustomUretimVardiyaKaynak }

constructor TAppDataChildCustomUretimVardiyaKaynak.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimVardiyaKaynak.CreateTable;
begin
  Table := TTableUretimVardiyaKaynak.Create(DataApp.DataObject);
  Table.Name := 'TableUretimVardiyaKaynak';
  Table.TableItems.TableNames := 'URTVRK';
end;

destructor TAppDataChildCustomUretimVardiyaKaynak.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimVardiyaKaynak.GetTable: TTableUretimVardiyaKaynak;
begin
  Result := TTableUretimVardiyaKaynak(inherited GetTable);
end;

procedure TAppDataChildCustomUretimVardiyaKaynak.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
  end;
end;

procedure TAppDataChildCustomUretimVardiyaKaynak.SetTable(Value: TTableUretimVardiyaKaynak);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimVardiyaKaynak.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('VARDIYAKOD');
    AddNonBlank('KAYNAKKOD');
  end;
end;

{ TAppDataChildUretimVardiyaKaynak }

procedure TAppDataChildUretimVardiyaKaynak.CreateRules;
begin
  inherited;
end;

procedure TAppDataChildUretimVardiyaKaynak.CreateTable;
begin
  inherited;
  Table.TableItems.TableNames := VarArrayOf(['URTVRK', 'URTKYN']);
  Table.TableItems.TableCaptions := VarArrayOf(['Vardiya Kaynak', 'Kaynak Kartý']);
end;

end.
