unit CPMApp_DOPCustomUretimTakvimKart;

interface

uses Classes,
  CPMApp_DocApp, CPMApp_DataApp, CPMApp_DAPCustomUretimTakvimKart;

type
  TAppDOPCustomUretimTakvimKart = class(TAppDocApp)
  protected
    function GetDataApp: TAppDAPCustomUretimTakvimKart;
    procedure SetDataApp(const Value: TAppDAPCustomUretimTakvimKart);
    function CreateDataApp: TAppDataApp; override;
  published
    property DataApp: TAppDAPCustomUretimTakvimKart read GetDataApp write SetDataApp;
  end;

implementation

{ TAppDOPCustomUretimTakvimKart }

function TAppDOPCustomUretimTakvimKart.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPCustomUretimTakvimKart.Create(nil);
end;

function TAppDOPCustomUretimTakvimKart.GetDataApp: TAppDAPCustomUretimTakvimKart;
begin
  Result := TAppDAPCustomUretimTakvimKart(inherited GetDataApp);
end;

procedure TAppDOPCustomUretimTakvimKart.SetDataApp(
  const Value: TAppDAPCustomUretimTakvimKart);
begin
  inherited SetDataApp(Value);
end;

end.
