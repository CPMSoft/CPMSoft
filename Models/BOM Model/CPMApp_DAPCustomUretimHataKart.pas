unit CPMApp_DAPCustomUretimHataKart;

interface

uses
  CPMApp_DataApp,
  CPMApp_DataChildUretimHataKart;

type
  TAppDAPCustomUretimHataKart = class(TAppDataApp)
  private
    FUretimHataKart: TAppDataChildUretimHataKart;
  protected
    procedure SetKeyFieldNames; override;
    procedure SetApplyUpdateTableList; override;
    procedure CreateDataChilds; override;
  published
    property UretimHataKart: TAppDataChildUretimHataKart read FUretimHataKart;
  end;

implementation

{ TAppDAPCustomUretimHataKart }

procedure TAppDAPCustomUretimHataKart.CreateDataChilds;

  procedure CreateHataKart;
  begin
    FUretimHataKart := TAppDataChildUretimHataKart.Create(Self);
  end;

begin
  inherited;
  CreateHataKart;
end;

procedure TAppDAPCustomUretimHataKart.SetApplyUpdateTableList;
begin
  inherited;
  DataObject.OptionsSave.UseDefaultList := false;
  with DataObject.OptionsSave.SaveTableList do
  begin
    Clear;
    Add(UretimHataKart.Table);
  end;
  with DataObject.OptionsSave.DeleteTableList do
  begin
    Clear;
    Add(UretimHataKart.Table);
  end;
end;

procedure TAppDAPCustomUretimHataKart.SetKeyFieldNames;
begin
  inherited;
  with DataObject.OptionsKey do
  begin
    Names := 'HATAKOD';
  end;
  with DataObject.OptionsMove do
  begin
    FieldName := 'HATAKOD';
    OrderByFieldNames := 'HATAKOD';
  end;
end;

end.
