unit CPMApp_DOPCustomUretimDurusKart;

interface

uses Classes,
  CPMApp_DocApp, CPMApp_DataApp, CPMApp_DAPCustomUretimDurusKart;

type
  TAppDOPCustomUretimDurusKart = class(TAppDocApp)
  protected
    function GetDataApp: TAppDAPCustomUretimDurusKart;
    procedure SetDataApp(const Value: TAppDAPCustomUretimDurusKart);
    function CreateDataApp: TAppDataApp; override;
  published
    property DataApp: TAppDAPCustomUretimDurusKart read GetDataApp write SetDataApp;
  end;

implementation

{ TAppDOPCustomUretimDurusKart }

function TAppDOPCustomUretimDurusKart.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPCustomUretimDurusKart.Create(nil);
end;

function TAppDOPCustomUretimDurusKart.GetDataApp: TAppDAPCustomUretimDurusKart;
begin
  Result := TAppDAPCustomUretimDurusKart(inherited GetDataApp);
end;

procedure TAppDOPCustomUretimDurusKart.SetDataApp(
  const Value: TAppDAPCustomUretimDurusKart);
begin
  inherited SetDataApp(Value);
end;

end.
