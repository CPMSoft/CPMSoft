unit CPMApp_DOPCustomUretim;

interface

uses Classes,
  CPMApp_DocApp, CPMApp_DataApp, CPMApp_DAPCustomUretim;

type
  TAppDOPCustomUretim = class(TAppDocApp)
  protected
    function GetDataApp: TAppDAPCustomUretim;
    procedure SetDataApp(const Value: TAppDAPCustomUretim);
    function CreateDataApp: TAppDataApp; override;
  published
    property DataApp: TAppDAPCustomUretim read GetDataApp write SetDataApp;
  end;

implementation

{ TAppDOPCustomUretim }

function TAppDOPCustomUretim.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPCustomUretim.Create(nil);
end;

function TAppDOPCustomUretim.GetDataApp: TAppDAPCustomUretim;
begin
  Result := TAppDAPCustomUretim(inherited GetDataApp);
end;

procedure TAppDOPCustomUretim.SetDataApp(
  const Value: TAppDAPCustomUretim);
begin
  inherited SetDataApp(Value);
end;

end.
