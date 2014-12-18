unit CPMApp_DOPCustomUretimKart;

interface
uses Classes,
  CPMApp_DocApp, CPMApp_DataApp, CPMApp_DAPCustomUretimKart;

type
  TAppDOPCustomUretimKart = class(TAppDocApp)
  protected
    function GetDataApp: TAppDAPCustomUretimKart;
    procedure SetDataApp(const Value: TAppDAPCustomUretimKart);
    function CreateDataApp: TAppDataApp; override;
  published
    property DataApp: TAppDAPCustomUretimKart read GetDataApp write SetDataApp;
  end;

implementation

{ TAppDOPCustomUretimKart }

function TAppDOPCustomUretimKart.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPCustomUretimKart.Create(nil);
end;

function TAppDOPCustomUretimKart.GetDataApp: TAppDAPCustomUretimKart;
begin
  Result := TAppDAPCustomUretimKart(inherited GetDataApp);
end;

procedure TAppDOPCustomUretimKart.SetDataApp(
  const Value: TAppDAPCustomUretimKart);
begin
  inherited SetDataApp(Value);
end;

end.
