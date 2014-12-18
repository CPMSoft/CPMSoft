unit CPMApp_DOPCustomIsMerkezKart;

interface

uses Classes,
  CPMApp_DocApp, CPMApp_DataApp, CPMApp_DAPCustomIsMerkezKart;

type
  TAppDOPCustomIsMerkezKart = class(TAppDocApp)
  protected
    function GetDataApp: TAppDAPCustomIsMerkezKart;
    procedure SetDataApp(const Value: TAppDAPCustomIsMerkezKart);
    function CreateDataApp: TAppDataApp; override;
  published
    property DataApp: TAppDAPCustomIsMerkezKart read GetDataApp write SetDataApp;
  end;

implementation

{ TAppDOPCustomIsMerkezKart }

function TAppDOPCustomIsMerkezKart.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPCustomIsMerkezKart.Create(nil);
end;

function TAppDOPCustomIsMerkezKart.GetDataApp: TAppDAPCustomIsMerkezKart;
begin
  Result := TAppDAPCustomIsMerkezKart(inherited GetDataApp);
end;

procedure TAppDOPCustomIsMerkezKart.SetDataApp(
  const Value: TAppDAPCustomIsMerkezKart);
begin
  inherited SetDataApp(Value);
end;

end.
