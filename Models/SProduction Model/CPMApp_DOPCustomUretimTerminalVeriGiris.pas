unit CPMApp_DOPCustomUretimTerminalVeriGiris;

interface

uses Classes,
  CPMApp_DocApp, CPMApp_DataApp, CPMApp_DAPCustomUretimKart;

type
  TAppDOPCustomUretimTerminalVeriGiris = class(TAppDocApp)
  protected
    function GetDataApp: TAppDAPCustomUretimKart;
    procedure SetDataApp(const Value: TAppDAPCustomUretimKart);
    function CreateDataApp: TAppDataApp; override;
  published
    property DataApp: TAppDAPCustomUretimKart read GetDataApp write SetDataApp;
  end;

implementation

{ TAppDOPCustomUretimTerminalVeriGiris }

function TAppDOPCustomUretimTerminalVeriGiris.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPCustomUretimKart.Create(nil);
end;

function TAppDOPCustomUretimTerminalVeriGiris.GetDataApp: TAppDAPCustomUretimKart;
begin
  Result := TAppDAPCustomUretimKart(inherited GetDataApp);
end;

procedure TAppDOPCustomUretimTerminalVeriGiris.SetDataApp(
  const Value: TAppDAPCustomUretimKart);
begin
  inherited SetDataApp(Value);
end;

end.
