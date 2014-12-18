unit CPMApp_DAPCustomUretimTakvimKart;

interface

uses
  CPMApp_DataApp,
  CPMApp_DataChildUretimTakvimKart,
  CPMApp_DataChildUretimTakvimVardiya;

type
  TAppDAPCustomUretimTakvimKart = class(TAppDataApp)
  private
    FUretimTakvimKart: TAppDataChildUretimTakvimKart;
    FUretimTakvimVardiya: TAppDataChildUretimTakvimVardiya;
  protected
    procedure SetKeyFieldNames; override;
    procedure SetApplyUpdateTableList; override;
    procedure CreateDataChilds; override;
  published
    property UretimTakvimKart: TAppDataChildUretimTakvimKart read FUretimTakvimKart;
    property UretimTakvimVardiya: TAppDataChildUretimTakvimVardiya read FUretimTakvimVardiya;
  end;

implementation

{ TAppDAPCustomUretimTakvimKart }

procedure TAppDAPCustomUretimTakvimKart.CreateDataChilds;

  procedure CreateTakvimKart;
  begin
    FUretimTakvimKart := TAppDataChildUretimTakvimKart.Create(Self);
  end;

  procedure CreateTakvimVardiya;
  begin
    FUretimTakvimVardiya := TAppDataChildUretimTakvimVardiya.Create(Self);

    FUretimTakvimVardiya.Table.MasterItems.Add(FUretimTakvimKart.Table, 'TAKVIMKOD');
    FUretimTakvimVardiya.Table.MasterItems[0].RangeRule.Enabled := False;
    FUretimTakvimVardiya.Table.IndexFieldNames := 'VARDIYAKOD';
  end;

begin
  inherited;
  CreateTakvimKart;
  CreateTakvimVardiya;
end;

procedure TAppDAPCustomUretimTakvimKart.SetApplyUpdateTableList;
begin
  inherited;
  DataObject.OptionsSave.UseDefaultList := false;
  with DataObject.OptionsSave.SaveTableList do
  begin
    Clear;
    Add(UretimTakvimKart.Table);
    Add(UretimTakvimVardiya.Table);
  end;
  with DataObject.OptionsSave.DeleteTableList do
  begin
    Clear;
    Add(UretimTakvimVardiya.Table);
    Add(UretimTakvimKart.Table);
  end;
end;

procedure TAppDAPCustomUretimTakvimKart.SetKeyFieldNames;
begin
  inherited;
  with DataObject.OptionsKey do
  begin
    Names := 'TAKVIMKOD';
  end;
  with DataObject.OptionsMove do
  begin
    FieldName := 'TAKVIMKOD';
    OrderByFieldNames := 'TAKVIMKOD';
  end;
end;

end.
