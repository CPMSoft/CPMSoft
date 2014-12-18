unit CPMApp_DOPCustomStokKarsilamaPolitika;

interface

uses Classes,
  CPMApp_DocApp, CPMApp_DataApp, CPMApp_DAPCustomStokKarsilamaPolitika;

type
  TAppDOPCustomStokKarsilamaPolitika = class(TAppDocApp)
  protected
    function GetDataApp: TAppDAPCustomStokKarsilamaPolitika;
    procedure SetDataApp(const Value: TAppDAPCustomStokKarsilamaPolitika);
    function CreateDataApp: TAppDataApp; override;
  published
    property DataApp: TAppDAPCustomStokKarsilamaPolitika read GetDataApp write SetDataApp;
  end;

implementation

{ TAppDOPCustomStokKarsilamaPolitika }

function TAppDOPCustomStokKarsilamaPolitika.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPCustomStokKarsilamaPolitika.Create(nil);
end;

function TAppDOPCustomStokKarsilamaPolitika.GetDataApp: TAppDAPCustomStokKarsilamaPolitika;
begin
  Result := TAppDAPCustomStokKarsilamaPolitika(inherited GetDataApp);
end;

procedure TAppDOPCustomStokKarsilamaPolitika.SetDataApp(
  const Value: TAppDAPCustomStokKarsilamaPolitika);
begin
  inherited SetDataApp(Value);
end;

end.
