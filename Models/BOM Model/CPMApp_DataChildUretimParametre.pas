unit CPMApp_DataChildUretimParametre;

interface

uses SysUtils, Variants,
  CPMApp_DataApp, CPMApp_DataObject,
  CPMApp_TableBOMSystem;

type
  TAppDataChildUretimParametre = class;

  TAppDataChildUretimParametre = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimParametre;
    procedure SetTable(Value: TTableUretimParametre);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
    property Table: TTableUretimParametre read GetTable write SetTable;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_Rule_FieldDefaultValue,
  CPMApp_Security;

{ TAppDataChildUretimParametre }

procedure TAppDataChildUretimParametre.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildUretimParametre.CreateTable;
begin
  Table := TTableUretimParametre.Create(DataApp.DataObject);
  Table.Name := 'TableUretimParametre';
  Table.TableItems.TableNames := VarArrayOf(['URTPRM']);
  Table.TableItems.TableCaptions := 'Üretim Parametreleri';
  LoadFields('TableUretimParametre');
end;

function TAppDataChildUretimParametre.GetTable: TTableUretimParametre;
begin
  Result := TTableUretimParametre(inherited GetTable);
end;

procedure TAppDataChildUretimParametre.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', AppSecurity.DBCompanyNo);
  end;
// Dikkat - sahtagil - 28.09.2007
// Default Values olarak KEY alaný verdiðim için otomatik edit moddan çýkacaktýr bulunur ise.
// bundan dolayý baþka bir default value veremem ve buna dikkat etmek zorundayým.
// bütün eventlerde sorun çýkarabilir.
end;

procedure TAppDataChildUretimParametre.SetTable(Value: TTableUretimParametre);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildUretimParametre.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, AppSecurity.DBCompanyNo);
  end;
end;

end.


