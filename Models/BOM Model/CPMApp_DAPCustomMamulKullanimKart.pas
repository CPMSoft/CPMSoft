unit CPMApp_DAPCustomMamulKullanimKart;

interface

uses
  CPMApp_DataApp,
  CPMApp_DataChildMamulKullanimKart,
  CPMApp_DataChildMamulKullanimGrup;

type
  TAppDAPCustomMamulKullanimKart = class(TAppDataApp)
  private
    FMamulKullanimKart: TAppDataChildMamulKullanimKart;
    FMamulKullanimGrup: TAppDataChildMamulKullanimGrup;
    // Rules
  protected
    procedure SetKeyFieldNames; override;
    procedure CreateDataChilds; override;
    procedure SetApplyUpdateTableList; override;
  published
    property MamulKullanimKart: TAppDataChildMamulKullanimKart read FMamulKullanimKart;
    property MamulKullanimGrup: TAppDataChildMamulKullanimGrup read FMamulKullanimGrup;
  end;

implementation

{ TAppDAPCustomMamulKullanimKart }

procedure TAppDAPCustomMamulKullanimKart.CreateDataChilds;
begin
  inherited;
  FMamulKullanimKart := TAppDataChildMamulKullanimKart.Create(Self);
  FMamulKullanimGrup := TAppDataChildMamulKullanimGrup.Create(Self);
end;

procedure TAppDAPCustomMamulKullanimKart.SetApplyUpdateTableList;
begin
  inherited;
  DataObject.OptionsSave.UseDefaultList := false;

  with DataObject.OptionsSave.SaveTableList do
  begin
    Clear;
    Add(MamulKullanimKart.Table);
    Add(MamulKullanimGrup.Table);
  end;

  with DataObject.OptionsSave.DeleteTableList do
  begin
    Clear;
    Add(MamulKullanimGrup.Table);
    Add(MamulKullanimKart.Table);
  end;
end;

procedure TAppDAPCustomMamulKullanimKart.SetKeyFieldNames;
begin

end;

end.
