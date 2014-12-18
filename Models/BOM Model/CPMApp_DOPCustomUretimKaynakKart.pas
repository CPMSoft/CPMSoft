unit CPMApp_DOPCustomUretimKaynakKart;

interface

uses Classes,
  CPMApp_DocApp, CPMApp_DataApp, CPMApp_DAPCustomUretimKaynakKart;

type
  TAppDOPCustomUretimKaynakKart = class(TAppDocApp)
  protected
    function GetDataApp: TAppDAPCustomUretimKaynakKart;
    procedure SetDataApp(const Value: TAppDAPCustomUretimKaynakKart);
    function CreateDataApp: TAppDataApp; override;
  published
    property DataApp: TAppDAPCustomUretimKaynakKart read GetDataApp write SetDataApp;
  end;

implementation

{ TAppDOPCustomUretimKaynakKart }

function TAppDOPCustomUretimKaynakKart.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPCustomUretimKaynakKart.Create(nil);
end;

function TAppDOPCustomUretimKaynakKart.GetDataApp: TAppDAPCustomUretimKaynakKart;
begin
  Result := TAppDAPCustomUretimKaynakKart(inherited GetDataApp);
end;

procedure TAppDOPCustomUretimKaynakKart.SetDataApp(
  const Value: TAppDAPCustomUretimKaynakKart);
begin
  inherited SetDataApp(Value);
end;

end.
