unit CPMApp_DOPCustomMamulKullanimKart;

interface

uses Classes, Dialogs, DB,
  CPMApp_DocApp, CPMApp_DataApp, CPMApp_DAPCustomMamulKullanimKart;

type
  TAppDOPCustomMamulKullanimKart = class(TAppDocApp)
  protected
    function GetDataApp: TAppDAPCustomMamulKullanimKart;
    procedure SetDataApp(const Value: TAppDAPCustomMamulKullanimKart);
    function CreateDataApp: TAppDataApp; override;
  public
    constructor Create(AOwner: TComponent; const aApplicationName: String); override;
  published
    property DataApp: TAppDAPCustomMamulKullanimKart read GetDataApp write SetDataApp;
  end;

implementation

{ TAppDOPCustomMamulKullanimKart }

constructor TAppDOPCustomMamulKullanimKart.Create(AOwner: TComponent;
  const aApplicationName: String);
begin
  inherited;
  DocObject.OptionsData.CanInsert := False;
  DocObject.OptionsData.CanDelete := False;
  DocObject.OptionsCustomize.AfterSaveCanInsert := False;
end;

function TAppDOPCustomMamulKullanimKart.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPCustomMamulKullanimKart.Create(nil);
end;

function TAppDOPCustomMamulKullanimKart.GetDataApp: TAppDAPCustomMamulKullanimKart;
begin
  Result := TAppDAPCustomMamulKullanimKart(inherited GetDataApp);
end;

procedure TAppDOPCustomMamulKullanimKart.SetDataApp(
  const Value: TAppDAPCustomMamulKullanimKart);
begin
  inherited SetDataApp(Value);
end;

end.
