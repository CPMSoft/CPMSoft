unit CPMApp_DAPCustomMRPParametreKart;

interface

uses
  CPMApp_DataApp,
  CPMApp_DataChildMRPParametre;

type
  TAppDAPCustomMRPParametreKart = class(TAppDataApp)
  private
    FMRPParametre: TAppDataChildMRPParametre;
    // Rules
  protected
    procedure SetKeyFieldNames; override;
    procedure CreateDataChilds; override;
    procedure SetApplyUpdateTableList; override;
  published
    property MRPParametre: TAppDataChildMRPParametre read FMRPParametre;
  end;

implementation

{ TAppDAPCustomMRPParametreKart }

procedure TAppDAPCustomMRPParametreKart.CreateDataChilds;
  procedure CreateMRPParametre;
  begin
    FMRPParametre := TAppDataChildMRPParametre.Create(Self);
  end;
begin
  inherited;
  CreateMRPParametre;
end;

procedure TAppDAPCustomMRPParametreKart.SetApplyUpdateTableList;
begin
  inherited;
  DataObject.OptionsSave.UseDefaultList := false;

  with DataObject.OptionsSave.SaveTableList do
  begin
    Clear;
    Add(MRPParametre.Table);
  end;

  with DataObject.OptionsSave.DeleteTableList do
  begin
    Clear;
    Add(MRPParametre.Table);
  end;
end;

procedure TAppDAPCustomMRPParametreKart.SetKeyFieldNames;
begin
  with DataObject.OptionsKey do
  begin
    Names := 'SIRKETNO';
  end;
end;

end.
