unit CPMApp_DAPCustomUretimKaynakKart;

interface

uses
  CPMApp_DataApp,
  CPMApp_DataChildUretimKaynakKart,
  CPMApp_DataChildUretimKaynakDevamsizlik,
  CPMApp_DataChildUretimKaynakNot,
  CPMApp_DataChildUretimKaynakMamulKurulum,
  CPMApp_DataChildUretimKaynakIslemTanim,
  CPMApp_DataChildUretimKaynakDemirbas,
  CPMApp_DataChildUretimKaynakAlternatifTanim,
  CPMApp_DataChildUretimKaynakMamulDegisim;

type
  TAppDAPCustomUretimKaynakKart = class(TAppDataApp)
  private
    FUretimKaynakKart: TAppDataChildUretimKaynakKart;
    FUretimKaynakDevamsizlik: TAppDataChildUretimKaynakDevamsizlik;
    FUretimKaynakNot: TAppDataChildUretimKaynakNot;
    FUretimKaynakMamulKurulum: TAppDataChildUretimKaynakMamulKurulum;
    FUretimKaynakMamulDegisim: TAppDataChildUretimKaynakMamulDegisim;
    FUretimKaynakIslemTanim: TAppDataChildUretimKaynakIslemTanim;
    FUretimKaynakDemirbas: TAppDataChildUretimKaynakDemirbas;
    FUretimKaynakAlternatifTanim: TAppDataChildUretimKaynakAlternatifTanim;
  protected
    procedure SetKeyFieldNames; override;
    procedure SetApplyUpdateTableList; override;
    procedure CreateDataChilds; override;
  published
    property UretimKaynakKart: TAppDataChildUretimKaynakKart read FUretimKaynakKart;
    property UretimKaynakDevamsizlik: TAppDataChildUretimKaynakDevamsizlik read FUretimKaynakDevamsizlik;
    property UretimKaynakNot: TAppDataChildUretimKaynakNot read FUretimKaynakNot;
    property UretimKaynakMamulKurulum: TAppDataChildUretimKaynakMamulKurulum read FUretimKaynakMamulKurulum;
    property UretimKaynakMamulDegisim: TAppDataChildUretimKaynakMamulDegisim read FUretimKaynakMamulDegisim;
    property UretimKaynakIslemTanim: TAppDataChildUretimKaynakIslemTanim read FUretimKaynakIslemTanim;
    property UretimKaynakDemirbas: TAppDataChildUretimKaynakDemirbas read FUretimKaynakDemirbas;
    property UretimKaynakAlternatifTanim: TAppDataChildUretimKaynakAlternatifTanim read FUretimKaynakAlternatifTanim;
  end;

implementation

uses
  Variants;

{ TAppDAPCustomUretimKaynakKart }

procedure TAppDAPCustomUretimKaynakKart.CreateDataChilds;

  procedure CreateChildUretimKaynakKart;
  begin
    FUretimKaynakKart := TAppDataChildUretimKaynakKart.Create(Self);
  end;

  procedure CreateChildUretimKaynakDevamsizlik;
  begin
    FUretimKaynakDevamsizlik := TAppDataChildUretimKaynakDevamsizlik.Create(Self);

    FUretimKaynakDevamsizlik.Table.MasterItems.Add(FUretimKaynakKart.Table, 'KAYNAKKOD');
    FUretimKaynakDevamsizlik.Table.IndexFieldNames := 'KAYNAKKOD';
    FUretimKaynakDevamsizlik.Table.MasterItems[0].RangeRule.Enabled := False;
  end;

  procedure CreateChildUretimKaynakNot;
  begin
    FUretimKaynakNot := TAppDataChildUretimKaynakNot.Create(Self);

    FUretimKaynakNot.Table.MasterItems.Add(FUretimKaynakKart.Table, 'KAYNAKKOD');
    FUretimKaynakNot.Table.IndexFieldNames := 'KAYNAKKOD';
    FUretimKaynakNot.Table.MasterItems[0].RangeRule.Enabled := False;
  end;

  procedure CreateChildUretimKaynakIslemTanim;
  begin
    FUretimKaynakIslemTanim := TAppDataChildUretimKaynakIslemTanim.Create(Self);

    FUretimKaynakIslemTanim.Table.MasterItems.Add(FUretimKaynakKart.Table, 'KAYNAKKOD');
    FUretimKaynakIslemTanim.Table.IndexFieldNames := 'KAYNAKKOD;ISLEMNO';
    FUretimKaynakIslemTanim.Table.MasterItems[0].RangeRule.Enabled := False;
  end;

  procedure CreateChildUretimKaynakDemirbas;
  begin
    FUretimKaynakDemirbas := TAppDataChildUretimKaynakDemirbas.Create(Self);

    FUretimKaynakDemirbas.Table.TableItems.TableNames := VarArrayOf(['URTKDT', 'STKKRT']);
    FUretimKaynakDemirbas.Table.TableItems.TableCaptions := VarArrayOf(['Kaynak Demirbaþ Tanim', 'Stok Kart']);
    with FUretimKaynakDemirbas.Table.TableItems[0] do
    begin
      with Fields do begin
        Clear;
        Add('*');
      end;
    end;

    with FUretimKaynakDemirbas.Table.TableItems[1] do
    begin
      with Fields do begin
        Clear;
        Add('MALAD');
      end;
      with Join do begin
        Clear;
        Add('MALKOD', 'MALKOD');
      end;
    end;
    FUretimKaynakDemirbas.Table.LookupTableItems.Add(FUretimKaynakDemirbas.Table.TableItems[1]);
    FUretimKaynakDemirbas.Table.MasterItems.Add(FUretimKaynakKart.Table, 'KAYNAKKOD');
    FUretimKaynakDemirbas.Table.IndexFieldNames := 'KAYNAKKOD;MALKOD';
    FUretimKaynakDemirbas.Table.MasterItems[0].RangeRule.Enabled := False;
  end;

  procedure CreateChildUretimKaynakAlternatifTanim;
  begin
    FUretimKaynakAlternatifTanim := TAppDataChildUretimKaynakAlternatifTanim.Create(Self);
    FUretimKaynakAlternatifTanim.Table.MasterItems.Add(FUretimKaynakKart.Table, 'KAYNAKKOD');
    FUretimKaynakAlternatifTanim.Table.IndexFieldNames := 'KAYNAKKOD;ALTERNATIFKAYNAKKOD';
    FUretimKaynakAlternatifTanim.Table.MasterItems[0].RangeRule.Enabled := False;
  end;

  procedure CreateChildUretimKaynakMamulKurulum;
  begin
    FUretimKaynakMamulKurulum := TAppDataChildUretimKaynakMamulKurulum.Create(Self);

    FUretimKaynakMamulKurulum.Table.TableItems.TableNames := VarArrayOf(['URTKMK', 'STKKRT']);
    FUretimKaynakMamulKurulum.Table.TableItems.TableCaptions := VarArrayOf(['Kaynak Mamül Kurulum', 'Stok Kart']);

    with FUretimKaynakMamulKurulum.Table.TableItems[1] do
    begin
      with Fields do
      begin
        Clear;
        Add('MALAD');
      end;
      with Join do
      begin
        Clear;
        Add('MALKOD', 'MAMULKOD');
      end;
    end;

    FUretimKaynakMamulKurulum.Table.LookupTableItems.Add(FUretimKaynakMamulKurulum.Table.TableItems[1]);

    FUretimKaynakMamulKurulum.Table.MasterItems.Add(FUretimKaynakKart.Table, 'KAYNAKKOD');
    FUretimKaynakMamulKurulum.Table.MasterItems[0].RangeRule.Enabled := false;
    FUretimKaynakMamulKurulum.Table.IndexFieldNames := 'KAYNAKKOD';
//    FUretimKaynakMamulKurulum.Table.MasterItems.Add(FUretimKaynakIslemTanim.Table, 'KAYNAKKOD;ISLEMNO');
//    FUretimKaynakMamulKurulum.Table.MasterItems[0].RangeRule.Enabled := True;
//    FUretimKaynakMamulKurulum.Table.IndexFieldNames := 'KAYNAKKOD;ISLEMNO';

    // Alan Seçimi Ýçin
    FUretimKaynakMamulKurulum.LoadFields(FUretimKaynakMamulKurulum.Table.Name);
  end;

  procedure CreateChildUretimKaynakMamulDegisim;
  begin
    FUretimKaynakMamulDegisim := TAppDataChildUretimKaynakMamulDegisim.Create(Self);

    FUretimKaynakMamulDegisim.Table.TableItems.TableNames := VarArrayOf(['URTKMD', 'STKKRT', 'STKKRT']);
    FUretimKaynakMamulDegisim.Table.TableItems.TableAlias := VarArrayOf(['URTKMD', 'STKKRL', 'STKSKM']);
    FUretimKaynakMamulDegisim.Table.TableItems.TableReferans := VarArrayOf(['URTKMD', 'STKKRT', 'STKKRT']);

    with FUretimKaynakMamulDegisim.Table.TableItems[1] do
    begin
      with Fields do
      begin
        Clear;
        Add('MALAD');
      end;
      with Join do
      begin
        Clear;
        Add('MALKOD', 'KURULUMMAMULKOD');
      end;
    end;
    FUretimKaynakMamulDegisim.Table.LookupTableItems.Add(FUretimKaynakMamulDegisim.Table.TableItems[1]);

    with FUretimKaynakMamulDegisim.Table.TableItems[2] do
    begin
      with Fields do
      begin
        Clear;
        Add('MALAD');
      end;
      with Join do
      begin
        Clear;
        Add('MALKOD', 'SOKUMMAMULKOD');
      end;
    end;
    FUretimKaynakMamulDegisim.Table.LookupTableItems.Add(FUretimKaynakMamulDegisim.Table.TableItems[2]);

    FUretimKaynakMamulDegisim.Table.MasterItems.Add(FUretimKaynakKart.Table, 'KAYNAKKOD');
    FUretimKaynakMamulDegisim.Table.MasterItems[0].RangeRule.Enabled := False;
    FUretimKaynakMamulDegisim.Table.IndexFieldNames := 'KAYNAKKOD';
  end;

begin
  inherited;
  CreateChildUretimKaynakKart;
  CreateChildUretimKaynakDevamsizlik;
  CreateChildUretimKaynakNot;
  CreateChildUretimKaynakIslemTanim;
  CreateChildUretimKaynakDemirbas;
  CreateChildUretimKaynakAlternatifTanim;
  CreateChildUretimKaynakMamulKurulum;
  CreateChildUretimKaynakMamulDegisim;
end;

procedure TAppDAPCustomUretimKaynakKart.SetApplyUpdateTableList;
begin
  inherited;
  DataObject.OptionsSave.UseDefaultList := false;
  with DataObject.OptionsSave.SaveTableList do
  begin
    Clear;
    Add(UretimKaynakKart.Table);
    Add(UretimKaynakDevamsizlik.Table);
    Add(UretimKaynakNot.Table);
    Add(UretimKaynakMamulKurulum.Table);
    Add(UretimKaynakMamulDegisim.Table);
    Add(UretimKaynakIslemTanim.Table);
    Add(UretimKaynakDemirbas.Table);
    Add(UretimKaynakAlternatifTanim.Table);
  end;
  with DataObject.OptionsSave.DeleteTableList do
  begin
    Clear;
    Add(UretimKaynakAlternatifTanim.Table);
    Add(UretimKaynakDemirbas.Table);
    Add(UretimKaynakIslemTanim.Table);
    Add(UretimKaynakMamulDegisim.Table);
    Add(UretimKaynakMamulKurulum.Table);
    Add(UretimKaynakNot.Table);
    Add(UretimKaynakDevamsizlik.Table);
    Add(UretimKaynakKart.Table);
  end;
end;

procedure TAppDAPCustomUretimKaynakKart.SetKeyFieldNames;
begin
  inherited;
  with DataObject.OptionsKey do
  begin
    Names := 'KAYNAKKOD';
  end;
  with DataObject.OptionsMove do
  begin
    FieldName := 'KAYNAKKOD';
    OrderByFieldNames := 'KAYNAKKOD';
  end;
end;

end.
