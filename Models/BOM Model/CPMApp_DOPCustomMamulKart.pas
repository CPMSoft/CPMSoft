unit CPMApp_DOPCustomMamulKart;

interface

uses Classes,
  CPMApp_DocApp, CPMApp_DataApp, CPMApp_DAPCustomMamulKart;

type
  TAppDOPCustomMamulKart = class(TAppDocApp)
  protected
    function GetDataApp: TAppDAPCustomMamulKart;
    procedure SetDataApp(const Value: TAppDAPCustomMamulKart);
    function CreateDataApp: TAppDataApp; override;
  published
    property DataApp: TAppDAPCustomMamulKart read GetDataApp write SetDataApp;
  end;

implementation

{ TAppDOPCustomMamulKart }

function TAppDOPCustomMamulKart.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPCustomMamulKart.Create(nil);
end;

function TAppDOPCustomMamulKart.GetDataApp: TAppDAPCustomMamulKart;
begin
  Result := TAppDAPCustomMamulKart(inherited GetDataApp);
end;

procedure TAppDOPCustomMamulKart.SetDataApp(
  const Value: TAppDAPCustomMamulKart);
begin
  inherited SetDataApp(Value);
end;

end.
