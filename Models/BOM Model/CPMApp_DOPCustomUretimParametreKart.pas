unit CPMApp_DOPCustomUretimParametreKart;

interface

uses Classes, Dialogs, DB,
  CPMApp_DocApp, CPMApp_DataApp, CPMApp_DAPCustomUretimParametreKart;

type
  TAppDOPCustomUretimParametreKart = class(TAppDocApp)
  protected
    function GetDataApp: TAppDAPCustomUretimParametreKart;
    procedure SetDataApp(const Value: TAppDAPCustomUretimParametreKart);
    function CreateDataApp: TAppDataApp; override;
  published
    property DataApp: TAppDAPCustomUretimParametreKart read GetDataApp write SetDataApp;
  end;

implementation

{ TAppDOPCustomUretimParametreKart }

function TAppDOPCustomUretimParametreKart.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPCustomUretimParametreKart.Create(nil);
end;

function TAppDOPCustomUretimParametreKart.GetDataApp: TAppDAPCustomUretimParametreKart;
begin
  Result := TAppDAPCustomUretimParametreKart(inherited GetDataApp);
end;

procedure TAppDOPCustomUretimParametreKart.SetDataApp(
  const Value: TAppDAPCustomUretimParametreKart);
begin
  inherited SetDataApp(Value);
end;

end.
