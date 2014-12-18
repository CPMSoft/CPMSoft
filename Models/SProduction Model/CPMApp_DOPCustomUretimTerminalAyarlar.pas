unit CPMApp_DOPCustomUretimTerminalAyarlar;

interface

uses Classes,
  CPMApp_DocApp, CPMApp_DataApp, CPMApp_DAPCustomUretimTerminalAyarlar;

type
  TAppDOPCustomUretimTerminalAyarlar = class(TAppDocApp)
  protected
    function GetDataApp: TAppDAPCustomUretimTerminalAyarlar;
    procedure SetDataApp(const Value: TAppDAPCustomUretimTerminalAyarlar);
    function CreateDataApp: TAppDataApp; override;
  published
    property DataApp: TAppDAPCustomUretimTerminalAyarlar read GetDataApp write SetDataApp;
  end;

implementation

{ TAppDOPCustomUretimTerminalAyarlar }

function TAppDOPCustomUretimTerminalAyarlar.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPCustomUretimTerminalAyarlar.Create(nil);
end;

function TAppDOPCustomUretimTerminalAyarlar.GetDataApp: TAppDAPCustomUretimTerminalAyarlar;
begin
  Result := TAppDAPCustomUretimTerminalAyarlar(inherited GetDataApp);
end;

procedure TAppDOPCustomUretimTerminalAyarlar.SetDataApp(
  const Value: TAppDAPCustomUretimTerminalAyarlar);
begin
  inherited SetDataApp(Value);
end;

end.
