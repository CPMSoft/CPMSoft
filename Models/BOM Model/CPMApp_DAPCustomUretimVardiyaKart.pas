unit CPMApp_DAPCustomUretimVardiyaKart;

interface

uses
  CPMApp_DataApp,
  CPMApp_DataChildUretimVardiyaKart,
  CPMApp_DataChildUretimVardiyaKaynak,
  CPMApp_DataChildUretimVardiyaSaat;

type
  TAppDAPCustomUretimVardiyaKart = class(TAppDataApp)
  private
    FUretimVardiyaKart: TAppDataChildUretimVardiyaKart;
    FUretimVardiyaKaynak: TAppDataChildUretimVardiyaKaynak;
    FUretimVardiyaSaat: TAppDataChildUretimVardiyaSaat;
  protected
    procedure SetKeyFieldNames; override;
    procedure SetApplyUpdateTableList; override;
    procedure CreateDataChilds; override;
  published
    property UretimVardiyaKart: TAppDataChildUretimVardiyaKart read FUretimVardiyaKart;
    property UretimVardiyaKaynak: TAppDataChildUretimVardiyaKaynak read FUretimVardiyaKaynak;
    property UretimVardiyaSaat: TAppDataChildUretimVardiyaSaat read FUretimVardiyaSaat;
  end;

implementation

uses
  Variants,
  DB,
  SysUtils;

{ TAppDAPCustomUretimVardiyaKart }

procedure TAppDAPCustomUretimVardiyaKart.CreateDataChilds;

  procedure CreateVardiyaKart;
  begin
    FUretimVardiyaKart := TAppDataChildUretimVardiyaKart.Create(Self);
  end;

  procedure CreateVardiyaKaynak;
  begin
    FUretimVardiyaKaynak := TAppDataChildUretimVardiyaKaynak.Create(Self);
    FUretimVardiyaKaynak.Table.TableItems.TableNames := VarArrayOf(['URTVRK', 'URTKYN']);

    with FUretimVardiyaKaynak.Table.TableItems[1] do
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

    FUretimVardiyaKaynak.Table.LookupTableItems.Add(FUretimVardiyaKaynak.Table.TableItems[1]);
    FUretimVardiyaKaynak.Table.MasterItems.Add(FUretimVardiyaKart.Table, 'SIRKETNO;VARDIYAKOD');
    FUretimVardiyaKaynak.Table.MasterItems[0].RangeRule.Enabled := False;
    FUretimVardiyaKaynak.Table.IndexFieldNames := 'SIRKETNO;KAYNAKKOD';
  end;

  procedure CreateVardiyaSaat;
  begin
    FUretimVardiyaSaat := TAppDataChildUretimVardiyaSaat.Create(Self);

    FUretimVardiyaSaat.Table.MasterItems.Add(FUretimVardiyaKart.Table, 'SIRKETNO;VARDIYAKOD');
    FUretimVardiyaSaat.Table.MasterItems[0].RangeRule.Enabled := False;
    FUretimVardiyaSaat.Table.IndexFieldNames := 'SIRKETNO;VARDIYAKOD;BASTARIH;BITTARIH;BASSAAT;BITSAAT';
  end;

begin
  inherited;
  CreateVardiyaKart;
  CreateVardiyaKaynak;
  CreateVardiyaSaat;
end;

procedure TAppDAPCustomUretimVardiyaKart.SetApplyUpdateTableList;
begin
  inherited;
  DataObject.OptionsSave.UseDefaultList := false;
  with DataObject.OptionsSave.SaveTableList do
  begin
    Clear;
    Add(UretimVardiyaKart.Table);
    Add(UretimVardiyaKaynak.Table);
    Add(UretimVardiyaSaat.Table);
  end;
  with DataObject.OptionsSave.DeleteTableList do
  begin
    Clear;
    Add(UretimVardiyaSaat.Table);
    Add(UretimVardiyaKaynak.Table);
    Add(UretimVardiyaKart.Table);
  end;
end;

procedure TAppDAPCustomUretimVardiyaKart.SetKeyFieldNames;
begin
  inherited;

  with DataObject.OptionsKey do
  begin
    Names := 'SIRKETNO;VARDIYAKOD';
    KeyByName('SIRKETNO').DataType := ftString;
    KeyByName('VARDIYAKOD').DataType := ftString;
  end;
  with DataObject.OptionsMove do
  begin
    FieldName := 'VARDIYAKOD';
    Where := Format('SIRKETNO = ''%s''', [CompanyNo]);
    OrderByFieldNames := 'VARDIYAKOD';
  end;
end;

end.
