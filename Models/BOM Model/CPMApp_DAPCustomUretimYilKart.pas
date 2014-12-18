unit CPMApp_DAPCustomUretimYilKart;

interface

uses
  CPMApp_DataApp,
  CPMApp_DataChildUretimYilKart,
  CPMApp_DataChildUretimYilTatil;

type
  TAppDAPCustomUretimYilKart = class(TAppDataApp)
  private
    FUretimYilKart: TAppDataChildUretimYilKart;
    FUretimYilTatil: TAppDataChildUretimYilTatil;
  protected
    procedure SetKeyFieldNames; override;
    procedure SetApplyUpdateTableList; override;
    procedure CreateDataChilds; override;
  published
    property UretimYilKart: TAppDataChildUretimYilKart read FUretimYilKart;
    property UretimYilTatil: TAppDataChildUretimYilTatil read FUretimYilTatil;
  end;

implementation

{ TAppDAPCustomUretimYilKart }

procedure TAppDAPCustomUretimYilKart.CreateDataChilds;

  procedure CreateYilKart;
  begin
    FUretimYilKart := TAppDataChildUretimYilKart.Create(Self);
  end;

  procedure CreateYilTatil;
  begin
    FUretimYilTatil := TAppDataChildUretimYilTatil.Create(Self);

    FUretimYilTatil.Table.MasterItems.Add(FUretimYilKart.Table, 'TAKVIMYIL');
    FUretimYilTatil.Table.MasterItems[0].RangeRule.Enabled := False;
    FUretimYilTatil.Table.IndexFieldNames := 'TARIH';
  end;

begin
  inherited;
  CreateYilKart;
  CreateYilTatil;
end;

procedure TAppDAPCustomUretimYilKart.SetApplyUpdateTableList;
begin
  inherited;
  DataObject.OptionsSave.UseDefaultList := false;
  with DataObject.OptionsSave.SaveTableList do
  begin
    Clear;
    Add(UretimYilKart.Table);
    Add(UretimYilTatil.Table);
  end;
  with DataObject.OptionsSave.DeleteTableList do
  begin
    Clear;
    Add(UretimYilTatil.Table);
    Add(UretimYilKart.Table);
  end;
end;

procedure TAppDAPCustomUretimYilKart.SetKeyFieldNames;
begin
  inherited;
  with DataObject.OptionsKey do
  begin
    Names := 'TAKVIMYIL';
  end;
  with DataObject.OptionsMove do
  begin
    FieldName := 'TAKVIMYIL';
    OrderByFieldNames := 'TAKVIMYIL';
  end;
end;

end.
