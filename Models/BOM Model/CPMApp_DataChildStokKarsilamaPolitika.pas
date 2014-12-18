unit CPMApp_DataChildStokKarsilamaPolitika;

interface

uses SysUtils, Variants,
  CPMApp_DataApp, CPMApp_DataObject,
  CPMApp_TableMRPSystem;

type
  TAppDataChildStokKarsilamaPolitika = class;

  TAppDataChildStokKarsilamaPolitika = class(TAppDataChild)
  private
  protected
    function GetTable: TTableStokKarsilamaPolitika;
    procedure SetTable(Value: TTableStokKarsilamaPolitika);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
    property Table: TTableStokKarsilamaPolitika read GetTable write SetTable;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_Rule_FieldDefaultValue,
  CPMApp_Security;

{ TAppDataChildStokKarsilamaPolitika }

procedure TAppDataChildStokKarsilamaPolitika.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildStokKarsilamaPolitika.CreateTable;
begin
  Table := TTableStokKarsilamaPolitika.Create(DataApp.DataObject);
  Table.Name := 'TableStokKarsilamaPolitika';
  Table.TableItems.TableNames := VarArrayOf(['MRPSKP']);
  Table.TableItems.TableCaptions := 'Stok Karþýlama Politikasý';
  LoadFields('TableStokKarsilamaPolitika');
end;

function TAppDataChildStokKarsilamaPolitika.GetTable: TTableStokKarsilamaPolitika;
begin
  Result := TTableStokKarsilamaPolitika(inherited GetTable);
end;

procedure TAppDataChildStokKarsilamaPolitika.SetDefaultValues;
begin
  inherited;
end;

procedure TAppDataChildStokKarsilamaPolitika.SetTable(Value: TTableStokKarsilamaPolitika);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildStokKarsilamaPolitika.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('STOKKARSILAMAKOD');
    AddNonBlank('ACIKLAMA');
  end;
end;

end.


