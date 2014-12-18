unit CPMApp_DAPCustomUretimParametreKart;

interface

uses
  CPMApp_DataApp,
  CPMApp_DataChildUretimParametre;

type
  TAppDAPCustomUretimParametreKart = class(TAppDataApp)
  private
    FUretimParametre: TAppDataChildUretimParametre;
    // Rules
  protected
    procedure SetKeyFieldNames; override;
    procedure CreateDataChilds; override;
    procedure SetApplyUpdateTableList; override;
  published
    property UretimParametre: TAppDataChildUretimParametre read FUretimParametre;
  end;

implementation

{ TAppDAPCustomUretimParametreKart }

procedure TAppDAPCustomUretimParametreKart.CreateDataChilds;
  procedure CreateUretimParametre;
  begin
    FUretimParametre := TAppDataChildUretimParametre.Create(Self);
  end;
begin
  inherited;
  CreateUretimParametre;
end;

procedure TAppDAPCustomUretimParametreKart.SetApplyUpdateTableList;
begin
  inherited;
  DataObject.OptionsSave.UseDefaultList := false;

  with DataObject.OptionsSave.SaveTableList do
  begin
    Clear;
    Add(UretimParametre.Table);
  end;

  with DataObject.OptionsSave.DeleteTableList do
  begin
    Clear;
    Add(UretimParametre.Table);
  end;
end;

procedure TAppDAPCustomUretimParametreKart.SetKeyFieldNames;
begin
  with DataObject.OptionsKey do
  begin
    Names := 'SIRKETNO';
  end;
end;

end.
