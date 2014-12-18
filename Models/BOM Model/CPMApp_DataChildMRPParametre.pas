unit CPMApp_DataChildMRPParametre;

interface

uses SysUtils, Variants,
  CPMApp_DataApp, CPMApp_DataObject,
  CPMApp_TableMRPSystem;

type
  TAppDataChildMRPParametre = class;

  TAppDataChildMRPParametre = class(TAppDataChild)
  private
  protected
    function GetTable: TTableMRPParametre;
    procedure SetTable(Value: TTableMRPParametre);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
    property Table: TTableMRPParametre read GetTable write SetTable;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_Rule_FieldDefaultValue,
  CPMApp_Security;

{ TAppDataChildMRPParametre }

procedure TAppDataChildMRPParametre.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildMRPParametre.CreateTable;
begin
  Table := TTableMRPParametre.Create(DataApp.DataObject);
  Table.Name := 'TableMRPParametre';
  Table.TableItems.TableNames := VarArrayOf(['MRPPRM']);
  Table.TableItems.TableCaptions := 'MRP Parametreleri';
  LoadFields('TableMRPParametre');
end;

function TAppDataChildMRPParametre.GetTable: TTableMRPParametre;
begin
  Result := TTableMRPParametre(inherited GetTable);
end;

procedure TAppDataChildMRPParametre.SetDefaultValues;
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

procedure TAppDataChildMRPParametre.SetTable(Value: TTableMRPParametre);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildMRPParametre.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, AppSecurity.DBCompanyNo);
  end;
end;

end.


