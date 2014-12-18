unit CPMApp_DOPCustomUretimVardiyaKart;

interface

uses Classes,
  CPMApp_DocApp, CPMApp_DataApp, CPMApp_DAPCustomUretimVardiyaKart;

type
  TAppDOPCustomUretimVardiyaKart = class(TAppDocApp)
  protected
    function GetDataApp: TAppDAPCustomUretimVardiyaKart;
    procedure SetDataApp(const Value: TAppDAPCustomUretimVardiyaKart);
    function CreateDataApp: TAppDataApp; override;
  published
    property DataApp: TAppDAPCustomUretimVardiyaKart read GetDataApp write SetDataApp;
  end;

implementation

{ TAppDOPCustomUretimVardiyaKart }

function TAppDOPCustomUretimVardiyaKart.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPCustomUretimVardiyaKart.Create(nil);
end;

function TAppDOPCustomUretimVardiyaKart.GetDataApp: TAppDAPCustomUretimVardiyaKart;
begin
  Result := TAppDAPCustomUretimVardiyaKart(inherited GetDataApp);
end;

procedure TAppDOPCustomUretimVardiyaKart.SetDataApp(
  const Value: TAppDAPCustomUretimVardiyaKart);
begin
  inherited SetDataApp(Value);
end;

end.
