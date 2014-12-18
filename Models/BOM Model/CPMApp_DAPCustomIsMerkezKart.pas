unit CPMApp_DAPCustomIsMerkezKart;

interface

uses
  CPMApp_DataApp,
  CPMApp_DataChildIsMerkezKart,
  CPMApp_DataChildIsMerkezKaynak;

type
  TAppDAPCustomIsMerkezKart = class(TAppDataApp)
  private
    FIsMerkezKart: TAppDataChildIsMerkezKart;
    FIsMerkezKaynak: TAppDataChildIsMerkezKaynak;
  protected
    procedure SetKeyFieldNames; override;
    procedure SetApplyUpdateTableList; override;
    procedure CreateDataChilds; override;
  published
    property IsMerkezKart: TAppDataChildIsMerkezKart read FIsMerkezKart;
    property IsMerkezKaynak: TAppDataChildIsMerkezKaynak read FIsMerkezKaynak;
  end;

implementation

uses
  Variants;

{ TAppDAPCustomIsMerkezKart }

procedure TAppDAPCustomIsMerkezKart.CreateDataChilds;

  procedure CreateIsMerkezKart;
  begin
    FIsMerkezKart := TAppDataChildIsMerkezKart.Create(Self);
  end;

  procedure CreateIsMerkezKaynak;
  begin
    FIsMerkezKaynak := TAppDataChildIsMerkezKaynak.Create(Self);

    FIsMerkezKaynak.Table.TableItems.TableNames := VarArrayOf(['URTISK', 'URTKYN']);
    FIsMerkezKaynak.Table.TableItems.TableCaptions := VarArrayOf(['Ýþ Merkezi Kaynak', 'Üretim Kaynak']);

    with FIsMerkezKaynak.Table.TableItems[1] do
    begin
      with Fields do
      begin
        Clear;
        Add('KAYNAKAD');
        Add('KAPASITE');
        Add('VERIMLILIK');
      end;
      with Join do
      begin
        Clear;
        Add('KAYNAKKOD', 'KAYNAKKOD');
      end;
    end;

    FIsMerkezKaynak.Table.LookupTableItems.Add(FIsMerkezKaynak.Table.TableItems[1]);

    FIsMerkezKaynak.Table.MasterItems.Add(FIsMerkezKart.Table, 'ISMERKEZKOD');
    FIsMerkezKaynak.Table.MasterItems[0].RangeRule.Enabled := False;
    FIsMerkezKaynak.Table.IndexFieldNames := 'KAYNAKKOD';
  end;
  
begin
  inherited;
  CreateIsMerkezKart;
  CreateIsMerkezKaynak;
end;

procedure TAppDAPCustomIsMerkezKart.SetApplyUpdateTableList;
begin
  inherited;
  DataObject.OptionsSave.UseDefaultList := false;
  with DataObject.OptionsSave.SaveTableList do
  begin
    Clear;
    Add(IsMerkezKart.Table);
    Add(IsMerkezKaynak.Table);
  end;
  with DataObject.OptionsSave.DeleteTableList do
  begin
    Clear;
    Add(IsMerkezKaynak.Table);
    Add(IsMerkezKart.Table);
  end;
end;

procedure TAppDAPCustomIsMerkezKart.SetKeyFieldNames;
begin
  inherited;
  with DataObject.OptionsKey do
  begin
    Names := 'ISMERKEZKOD';
  end;

  with DataObject.OptionsMove do
  begin
    FieldName := 'ISMERKEZKOD';
    OrderByFieldNames := 'ISMERKEZKOD';
  end;
end;

end.
