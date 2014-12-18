unit CPMApp_DOPCustomUretimYilKart;

interface

uses Classes,
  CPMApp_DocApp, CPMApp_DataApp, CPMApp_DAPCustomUretimYilKart;

type
  TAppDOPCustomUretimYilKart = class(TAppDocApp)
  protected
    function GetDataApp: TAppDAPCustomUretimYilKart;
    procedure SetDataApp(const Value: TAppDAPCustomUretimYilKart);
    function CreateDataApp: TAppDataApp; override;
  published
    property DataApp: TAppDAPCustomUretimYilKart read GetDataApp write SetDataApp;
  end;

implementation

{ TAppDOPCustomUretimYilKart }

function TAppDOPCustomUretimYilKart.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPCustomUretimYilKart.Create(nil);
end;

function TAppDOPCustomUretimYilKart.GetDataApp: TAppDAPCustomUretimYilKart;
begin
  Result := TAppDAPCustomUretimYilKart(inherited GetDataApp);
end;

procedure TAppDOPCustomUretimYilKart.SetDataApp(
  const Value: TAppDAPCustomUretimYilKart);
begin
  inherited SetDataApp(Value);
end;

end.
