unit CPMApp_DOPCustomUretimHataKart;

interface

uses Classes,
  CPMApp_DocApp, CPMApp_DataApp, CPMApp_DAPCustomUretimHataKart;

type
  TAppDOPCustomUretimHataKart = class(TAppDocApp)
  protected
    function GetDataApp: TAppDAPCustomUretimHataKart;
    procedure SetDataApp(const Value: TAppDAPCustomUretimHataKart);
    function CreateDataApp: TAppDataApp; override;
  published
    property DataApp: TAppDAPCustomUretimHataKart read GetDataApp write SetDataApp;
  end;

implementation

{ TAppDOPCustomUretimHataKart }

function TAppDOPCustomUretimHataKart.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPCustomUretimHataKart.Create(nil);
end;

function TAppDOPCustomUretimHataKart.GetDataApp: TAppDAPCustomUretimHataKart;
begin
  Result := TAppDAPCustomUretimHataKart(inherited GetDataApp);
end;

procedure TAppDOPCustomUretimHataKart.SetDataApp(
  const Value: TAppDAPCustomUretimHataKart);
begin
  inherited SetDataApp(Value);
end;

end.
