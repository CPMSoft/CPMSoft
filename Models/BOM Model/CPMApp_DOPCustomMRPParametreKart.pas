unit CPMApp_DOPCustomMRPParametreKart;

interface

uses Classes, Dialogs, DB,
  CPMApp_DocApp, CPMApp_DataApp, CPMApp_DAPCustomMRPParametreKart;

type
  TAppDOPCustomMRPParametreKart = class(TAppDocApp)
  protected
    function GetDataApp: TAppDAPCustomMRPParametreKart;
    procedure SetDataApp(const Value: TAppDAPCustomMRPParametreKart);
    function CreateDataApp: TAppDataApp; override;
  published
    property DataApp: TAppDAPCustomMRPParametreKart read GetDataApp write SetDataApp;
  end;

implementation

{ TAppDOPCustomMRPParametreKart }

function TAppDOPCustomMRPParametreKart.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPCustomMRPParametreKart.Create(nil);
end;

function TAppDOPCustomMRPParametreKart.GetDataApp: TAppDAPCustomMRPParametreKart;
begin
  Result := TAppDAPCustomMRPParametreKart(inherited GetDataApp);
end;

procedure TAppDOPCustomMRPParametreKart.SetDataApp(
  const Value: TAppDAPCustomMRPParametreKart);
begin
  inherited SetDataApp(Value);
end;

end.
