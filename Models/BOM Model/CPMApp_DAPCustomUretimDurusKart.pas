unit CPMApp_DAPCustomUretimDurusKart;

interface

uses
  CPMApp_DataApp,
  CPMApp_DataChildUretimDurusKart;

type
  TAppDAPCustomUretimDurusKart = class(TAppDataApp)
  private
    FUretimDurusKart: TAppDataChildUretimDurusKart;
  protected
    procedure SetKeyFieldNames; override;
    procedure SetApplyUpdateTableList; override;
    procedure CreateDataChilds; override;
  published
    property UretimDurusKart: TAppDataChildUretimDurusKart read FUretimDurusKart;
  end;

implementation

{ TAppDAPCustomUretimDurusKart }

procedure TAppDAPCustomUretimDurusKart.CreateDataChilds;

  procedure CreateDurusKart;
  begin
    FUretimDurusKart := TAppDataChildUretimDurusKart.Create(Self);
  end;

begin
  inherited;
  CreateDurusKart;
end;

procedure TAppDAPCustomUretimDurusKart.SetApplyUpdateTableList;
begin
  inherited;
  DataObject.OptionsSave.UseDefaultList := false;
  with DataObject.OptionsSave.SaveTableList do
  begin
    Clear;
    Add(UretimDurusKart.Table);
  end;
  with DataObject.OptionsSave.DeleteTableList do
  begin
    Clear;
    Add(UretimDurusKart.Table);
  end;
end;

procedure TAppDAPCustomUretimDurusKart.SetKeyFieldNames;
begin
  inherited;
  with DataObject.OptionsKey do
  begin
    Names := 'DURUSKOD';
  end;
  with DataObject.OptionsMove do
  begin
    FieldName := 'DURUSKOD';
    OrderByFieldNames := 'DURUSKOD';
  end;
end;

end.
