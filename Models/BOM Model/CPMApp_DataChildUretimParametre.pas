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
  Table.TableItems.TableCaptions := '�retim Parametreleri';
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
// Default Values olarak KEY alan� verdi�im i�in otomatik edit moddan ��kacakt�r bulunur ise.
// bundan dolay� ba�ka bir default value veremem ve buna dikkat etmek zorunday�m.
// b�t�n eventlerde sorun ��karabilir.
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


