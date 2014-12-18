unit CPMApp_DataChildUretimVardiyaSaat;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem;

type
  TAppDataChildCustomUretimVardiyaSaat = class;
  TAppDataChildUretimVardiyaSaat = class;

  TAppDataChildCustomUretimVardiyaSaat = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimVardiyaSaat;
    procedure SetTable(Value: TTableUretimVardiyaSaat);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimVardiyaSaat read GetTable write SetTable;
  end;

  TAppDataChildUretimVardiyaSaat = class(TAppDataChildCustomUretimVardiyaSaat)
  private
  protected
    procedure CreateRules; override;
  published
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_Date;

{ TAppDataChildCustomUretimVardiyaSaat }

constructor TAppDataChildCustomUretimVardiyaSaat.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimVardiyaSaat.CreateTable;
begin
  Table := TTableUretimVardiyaSaat.Create(DataApp.DataObject);
  Table.Name := 'TableUretimVardiyaSaat';
  Table.TableItems.TableNames := VarArrayOf(['URTVRS']);
  Table.TableItems.TableCaptions := VarArrayOf(['Vardiya Saat']);
end;

destructor TAppDataChildCustomUretimVardiyaSaat.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimVardiyaSaat.GetTable: TTableUretimVardiyaSaat;
begin
  Result := TTableUretimVardiyaSaat(inherited GetTable);
end;

procedure TAppDataChildCustomUretimVardiyaSaat.SetDefaultValues;
begin
  inherited;

  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
    Add('BASSAAT', AppDateHelper.FirstDateZeroTime);
    Add('BITSAAT', AppDateHelper.FirstDateZeroTime);
  end;
end;

procedure TAppDataChildCustomUretimVardiyaSaat.SetTable(Value: TTableUretimVardiyaSaat);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimVardiyaSaat.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
//    AddNonBlank('SIRKETNO');
    AddNonBlank('VARDIYAKOD');
    AddNonBlank('TARIH');
    AddNonBlank('BASSAAT');
    AddNonBlank('BITSAAT');
  end;
end;

{ TAppDataChildUretimVardiyaSaat }

procedure TAppDataChildUretimVardiyaSaat.CreateRules;
begin
  inherited;

end;

end.
