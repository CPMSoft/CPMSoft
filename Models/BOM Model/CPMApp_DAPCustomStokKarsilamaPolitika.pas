unit CPMApp_DAPCustomStokKarsilamaPolitika;

interface

uses
  CPMApp_DataApp,
  CPMApp_DataChildStokKarsilamaPolitika;

type
  TAppDAPCustomStokKarsilamaPolitika = class(TAppDataApp)
  private
    FStokKarsilamaPolitika: TAppDataChildStokKarsilamaPolitika;
  protected
    procedure SetKeyFieldNames; override;
    procedure SetApplyUpdateTableList; override;
    procedure CreateDataChilds; override;
  published
    property StokKarsilamaPolitika: TAppDataChildStokKarsilamaPolitika read FStokKarsilamaPolitika;
  end;

implementation

{ TAppDAPCustomStokKarsilamaPolitika }

procedure TAppDAPCustomStokKarsilamaPolitika.CreateDataChilds;

  procedure CreateStokKarsilamaPolitika;
  begin
    FStokKarsilamaPolitika := TAppDataChildStokKarsilamaPolitika.Create(Self);
  end;

begin
  inherited;
  CreateStokKarsilamaPolitika;
end;

procedure TAppDAPCustomStokKarsilamaPolitika.SetApplyUpdateTableList;
begin
  inherited;
  DataObject.OptionsSave.UseDefaultList := false;
  with DataObject.OptionsSave.SaveTableList do
  begin
    Clear;
    Add(StokKarsilamaPolitika.Table);
  end;
  with DataObject.OptionsSave.DeleteTableList do
  begin
    Clear;
    Add(StokKarsilamaPolitika.Table);
  end;
end;

procedure TAppDAPCustomStokKarsilamaPolitika.SetKeyFieldNames;
begin
  inherited;
  with DataObject.OptionsKey do
  begin
    Names := 'STOKKARSILAMAKOD';
  end;
  with DataObject.OptionsMove do
  begin
    FieldName := 'STOKKARSILAMAKOD';
    OrderByFieldNames := 'STOKKARSILAMAKOD';
  end;
end;

end.
