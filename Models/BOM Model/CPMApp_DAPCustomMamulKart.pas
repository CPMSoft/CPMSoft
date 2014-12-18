unit CPMApp_DAPCustomMamulKart;

interface

uses
  Classes, SysUtils, DB, Variants,
  CPMApp_DataObjectModel, CPMApp_DataApp, CPMApp_DataObject, CPMApp_TableItems,
  CPMApp_DataChildMamulBaslik, CPMApp_DataChildMamulRevizyon,
  CPMApp_DataChildMamulKart, CPMApp_DataChildMamulYanUrun,
  CPMApp_DataChildMamulNot,
  CPMApp_DataChildMamulRota,
  CPMApp_DataChildMamulRotaSonrakiOperasyon,
  CPMApp_DataChildMamulRotaKaynak,
  CPMApp_DataChildFMEAFormBaslik,
  CPMApp_DataChildFMEAFormRevizyon,
  CPMApp_DataChildFMEAFormDetay,
  CPMApp_DataChildMamulStokKart,
  CPMApp_DataChildHammaddeStokKart,
  CPMApp_DataChildMamulAgac,
  CPMApp_TableBOMSystem;

type
  TAppDAPCustomMamulKart = class;

  TAppMamulKartParams = class(TPersistent)
  private
    FAddKaynakFromKaynakKurulum: Boolean;
  published
    property AddKaynakFromKaynakKurulum: Boolean read FAddKaynakFromKaynakKurulum write FAddKaynakFromKaynakKurulum;
  end;

  TAppRuleMamulKartAutoRevizyon = class(TAppTableRule)
  private
    FTableRevizyon: TTableMamulRevizyon;
  protected
    procedure DoBeforeInsert(Table: TAppCustomTable); override;
  public
    constructor Create(ATable: TAppTable; ATableRevizyon: TTableMamulRevizyon); reintroduce; overload;
  end;

  TAppDAPCustomMamulKart = class(TAppDataApp)
  private
    FMamulParams: TAppMamulKartParams;
    FMamulBaslik: TAppDataChildMamulBaslik;
    FMamulRevizyon: TAppDataChildMamulRevizyon;
    FMamulKart: TAppDataChildMamulKart;
    FMamulYanUrun: TAppDataChildMamulYanUrun;
    FMamulRota: TAppDataChildMamulRota;
    FMamulRotaSonrakiOperasyon: TAppDataChildMamulRotaSonrakiOperasyon;
    FMamulRotaKaynak: TAppDataChildMamulRotaKaynak;
    FMamulNot: TAppDataChildMamulNot;
    FFMEAFormBaslik: TAppDataChildFMEAFormBaslik;
    FFMEAFormRevizyon: TAppDataChildFMEAFormRevizyon;
    FFMEAFormDetay: TAppDataChildFMEAFormDetay;
    FMamulStokKart: TAppDataChildMamulStokKart;
    FHammaddeStokKart: TAppDataChildHammaddeStokKart;
    FMamulAgac: TAppDataChildMamulAgac;
    FKullanimAgac: TAppDataChildMamulAgac;
    FMaliyetList: TAppDataChildMamulAgac;
    // Rules
    FRuleMamulKart: TAppRuleMamulKartAutoRevizyon;
    FRuleMamulRota: TAppRuleMamulKartAutoRevizyon;
  protected
    procedure SetKeyFieldNames; override;
    procedure SetApplyUpdateTableList; override;
    procedure CreateDataChilds; override;
    procedure AfterInitialize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property MamulParams: TAppMamulKartParams read FMamulParams write FMamulParams;

    property MamulBaslik: TAppDataChildMamulBaslik read FMamulBaslik;
    property MamulRevizyon: TAppDataChildMamulRevizyon read FMamulRevizyon;
    property MamulKart: TAppDataChildMamulKart read FMamulKart;
    property MamulYanUrun: TAppDataChildMamulYanUrun read FMamulYanUrun;
    property MamulRota: TAppDataChildMamulRota read FMamulRota;
    property MamulRotaSonrakiOperasyon: TAppDataChildMamulRotaSonrakiOperasyon read FMamulRotaSonrakiOperasyon;
    property MamulRotaKaynak: TAppDataChildMamulRotaKaynak read FMamulRotaKaynak;
    property MamulAgac: TAppDataChildMamulAgac read FMamulAgac;
    property KullanimAgac: TAppDataChildMamulAgac read FKullanimAgac;
    property MaliyetList: TAppDataChildMamulAgac read FMaliyetList;
    property MamulStokKart: TAppDataChildMamulStokKart read FMamulStokKart;
    property HammaddeStokKart: TAppDataChildHammaddeStokKart read FHammaddeStokKart;
    property MamulNot: TAppDataChildMamulNot read FMamulNot;
    property FMEAFormBaslik: TAppDataChildFMEAFormBaslik read FFMEAFormBaslik;
    property FMEAFormRevizyon: TAppDataChildFMEAFormRevizyon read FFMEAFormRevizyon;
    property FMEAFormDetay: TAppDataChildFMEAFormDetay read FFMEAFormDetay;
  end;

implementation

uses CPMApp_Date, CPMApp_DataOptionsKey;

{ TAppDAPCustomMamulKart }

procedure TAppDAPCustomMamulKart.AfterInitialize;
begin
  inherited;
  MamulAgac.Table.Connection := Connection;
  MamulAgac.Table.DoInitializeRecord;
  KullanimAgac.Table.Connection := Connection;
  KullanimAgac.Table.DoInitializeRecord;
  MaliyetList.Table.Connection := Connection;
  MaliyetList.Table.DoInitializeRecord;
end;

constructor TAppDAPCustomMamulKart.Create(AOwner: TComponent);
begin
  inherited;
  MamulParams := TAppMamulKartParams.Create;
end;

procedure TAppDAPCustomMamulKart.CreateDataChilds;

  procedure CreateMamulBaslik;
  begin
    FMamulBaslik := TAppDataChildMamulBaslik.Create(Self);

    // Alan Seçimi Ýçin
    FMamulBaslik.LoadFields(FMamulBaslik.Table.Name);

    // Alan Aktarýmý Ýçin
    FMamulBaslik.FetchFields.Section := 'TableMamulBaslik';
    with FMamulBaslik.FetchFields.AddTableName('STKKRT', 'STKKRT', 'Mamül Stok Kartý') do
    begin
      with TableCommand.TableItems[0].Where do
      begin
        Clear;
        AddField('MALKOD', wcEqual, FMamulBaslik.Table.TableItems[0], 'MAMULKOD');
      end;
      FieldJoinList.Add('MAMULKOD');
    end;
  end;

  procedure CreateMamulRevizyon;
  begin
    FMamulRevizyon := TAppDataChildMamulRevizyon.Create(Self);
    FMamulRevizyon.Table.MasterItems.Add(FMamulBaslik.Table, 'SIRKETNO;RECETENO');
    FMamulRevizyon.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'MAMULKOD;VERSIYONNO;SURUMNO';
    FMamulRevizyon.Table.MasterItems[0].RangeRule.Enabled := False;
    FMamulRevizyon.Table.IndexFieldNames := 'REVIZYONNO';
  end;

  procedure CreateMamulKart;
  begin
    FMamulKart := TAppDataChildMamulKart.Create(Self);
    FMamulKart.Table.MasterItems.Add(FMamulRevizyon.Table, 'REVIZYONNO');
    FMamulKart.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;RECETENO;MAMULKOD;VERSIYONNO;SURUMNO';

    // Alan Seçimi Ýçin
    FMamulKart.LoadFields(FMamulKart.Table.Name);

    // Alan Aktarýmý Ýçin
    FMamulKart.FetchFields.Section := 'TableMamulKart';
    FMamulKart.FetchFields.AddTable(FMamulBaslik.Table, 'TableMamulBaslik', 'Mamül Baþlýk');
    FMamulKart.FetchFields.AddTable(FMamulRevizyon.Table, 'TableMamulRevizyon', 'Mamül Revizyon');
    with FMamulKart.FetchFields.AddTableName('STKKRT', 'STKKRT', 'Hammadde Stok Kartý') do
    begin
      with TableCommand.TableItems[0].Where do
      begin
        Clear;
        AddField('MALKOD', wcEqual, FMamulKart.Table.TableItems[0], 'HAMMADDEKOD');
      end;
      FieldJoinList.Add('HAMMADDEKOD');
    end;
    FMamulKart.Table.IndexFieldNames := 'REVIZYONNO;SIRANO';
  end;

  procedure CreateMamulYanUrun;
  begin
    FMamulYanUrun := TAppDataChildMamulYanUrun.Create(Self);
    FMamulYanUrun.Table.MasterItems.Add(FMamulRevizyon.Table, 'REVIZYONNO');
    FMamulYanUrun.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;RECETENO';
    FMamulYanUrun.Table.IndexFieldNames := 'REVIZYONNO;YANURUNNO';
  end;

  procedure CreateMamulRota;
  begin
    FMamulRota := TAppDataChildMamulRota.Create(Self);
    FMamulRota.Table.MasterItems.Add(FMamulRevizyon.Table, 'REVIZYONNO');
    FMamulRota.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;RECETENO;MAMULKOD;VERSIYONNO;SURUMNO';
    FMamulRota.Table.IndexFieldNames := 'REVIZYONNO;OPERASYONNO';
  end;

  procedure CreateMamulRotaSonrakiOperasyon;
  begin
    FMamulRotaSonrakiOperasyon := TAppDataChildMamulRotaSonrakiOperasyon.Create(Self);
    FMamulRotaSonrakiOperasyon.Table.MasterItems.Add(FMamulRota.Table, 'REVIZYONNO;OPERASYONNO');
    FMamulRotaSonrakiOperasyon.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;RECETENO;MAMULKOD;VERSIYONNO;SURUMNO';
    FMamulRotaSonrakiOperasyon.Table.IndexFieldNames := 'REVIZYONNO;OPERASYONNO;SONRAKIOPERASYONNO';
  end;

  procedure CreateMamulRotaKaynak;
  begin
    FMamulRotaKaynak := TAppDataChildMamulRotaKaynak.Create(Self);
    FMamulRotaKaynak.Table.MasterItems.Add(FMamulRota.Table, 'REVIZYONNO;OPERASYONNO');
    FMamulRotaKaynak.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;RECETENO;MAMULKOD;VERSIYONNO;SURUMNO;ISMERKEZKOD';
    FMamulRotaKaynak.Table.IndexFieldNames := 'REVIZYONNO;OPERASYONNO;KAYNAKKOD';
  end;

  procedure CreateMamulNot;
  begin
    FMamulNot := TAppDataChildMamulNot.Create(Self);
    FMamulNot.Table.MasterItems.Add(FMamulBaslik.Table, 'SIRKETNO;RECETENO');
    FMamulNot.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'MAMULKOD;VERSIYONNO;SURUMNO';
    FMamulNot.Table.MasterItems[0].RangeRule.Enabled := False;
    FMamulNot.Table.IndexFieldNames := 'SIRANO';
  end;

  procedure CreateFMEAFormBaslik;
  begin
    FFMEAFormBaslik := TAppDataChildFMEAFormBaslik.Create(Self);
    FFMEAFormBaslik.Table.MasterItems.Add(FMamulBaslik.Table, 'SIRKETNO;RECETENO');
    FFMEAFormBaslik.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'MAMULKOD;VERSIYONNO;SURUMNO';
    FFMEAFormBaslik.Table.MasterItems[0].RangeRule.Enabled := False;
    FFMEAFormBaslik.Table.IndexFieldNames := 'OPERASYONNO';
  end;

  procedure CreateFMEAFormRevizyon;
  begin
    FFMEAFormRevizyon := TAppDataChildFMEAFormRevizyon.Create(Self);
    FFMEAFormRevizyon.Table.MasterItems.Add(FFMEAFormBaslik.Table, 'OPERASYONNO');
    FFMEAFormRevizyon.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;RECETENO;MAMULKOD;VERSIYONNO;SURUMNO';
    FFMEAFormRevizyon.Table.IndexFieldNames := 'OPERASYONNO;REVIZYONNO';
  end;

  procedure CreateFMEAFormDetay;
  begin
    FFMEAFormDetay := TAppDataChildFMEAFormDetay.Create(Self);
    FFMEAFormDetay.Table.MasterItems.Add(FFMEAFormRevizyon.Table, 'OPERASYONNO;REVIZYONNO');
    FFMEAFormDetay.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;RECETENO;MAMULKOD;VERSIYONNO;SURUMNO';
    FFMEAFormDetay.Table.IndexFieldNames := 'OPERASYONNO;REVIZYONNO;SIRANO';
  end;

  procedure CreateMamulStokKart;
  begin
    FMamulStokKart := TAppDataChildMamulStokKart.Create(Self);
    FMamulStokKart.Table.TableItems.TableNames := VarArrayOf(['STKKRT','MAMBAS']);
    FMamulStokKart.Table.TableItems[0].KeyFieldNames := '';
    FMamulStokKart.Table.TableItems[1].KeyFieldNames := 'SIRKETNO;RECETENO';
    with FMamulStokKart.Table.TableItems[1].Join do
    begin
      Clear;
      Add('MAMULKOD', 'MALKOD');
    end;
  end;

  procedure CreateHammaddeStokKart;
  begin
    FHammaddeStokKart := TAppDataChildHammaddeStokKart.Create(Self);
    FHammaddeStokKart.Table.TableItems.TableNames := VarArrayOf(['STKKRT','MAMKRT']);
    FHammaddeStokKart.Table.TableItems[0].KeyFieldNames := '';
    FHammaddeStokKart.Table.TableItems[1].KeyFieldNames := 'SIRKETNO;RECETENO';
    with FHammaddeStokKart.Table.TableItems[1].Join do
    begin
      Clear;
      Add('HAMMADDEKOD', 'MALKOD');
    end;
    FHammaddeStokKart.Table.IndexFieldNames := 'MALKOD';
    FHammaddeStokKart.Table.MasterItems.Add(FMamulKart.Table, 'MALKOD', 'HAMMADDEKOD');
    FHammaddeStokKart.Table.MasterItems[0].FetchFieldsRule.Enabled := False;
  end;

  procedure CreateMamulAgac;
  begin
    FMamulAgac := TAppDataChildMamulAgac.Create(Self);
    FMamulAgac.Table.Name := 'TableMamulAgac';
    FMamulAgac.LoadFields(FMamulAgac.Table.Name);
  end;

  procedure CreateKullanimAgac;
  begin
    FKullanimAgac := TAppDataChildMamulAgac.Create(Self);
    FKullanimAgac.Table.Name := 'TableKullanimAgac';
    FKullanimAgac.LoadFields(FKullanimAgac.Table.Name);
  end;

  procedure CreateMaliyetList;
  begin
    FMaliyetList := TAppDataChildMamulAgac.Create(Self);
    FMaliyetList.Table.Name := 'TableMaliyetList';
    FMaliyetList.LoadFields(FMaliyetList.Table.Name);
  end;
  
begin
  inherited;
  CreateMamulBaslik;
  CreateMamulRevizyon;
  CreateMamulKart;
  CreateMamulYanUrun;
  CreateMamulRota;
  CreateMamulRotaSonrakiOperasyon;
  CreateMamulRotaKaynak;
  CreateMamulNot;
  CreateFMEAFormBaslik;
  CreateFMEAFormRevizyon;
  CreateFMEAFormDetay;
  CreateMamulAgac;
  CreateKullanimAgac;
  CreateMaliyetList;
  CreateMamulStokKart;
  CreateHammaddeStokKart;

  FRuleMamulKart := TAppRuleMamulKartAutoRevizyon.Create(MamulKart.Table, MamulRevizyon.Table);
  FRuleMamulRota := TAppRuleMamulKartAutoRevizyon.Create(MamulRota.Table, MamulRevizyon.Table);
end;

destructor TAppDAPCustomMamulKart.Destroy;
begin
  FreeAndNil(FMamulParams);
  FreeAndNil(FRuleMamulKart);
  FreeAndNil(FRuleMamulRota);
  inherited;
end;

procedure TAppDAPCustomMamulKart.SetApplyUpdateTableList;
begin
  inherited;
  DataObject.OptionsSave.UseDefaultList := false;

  FMamulKart.Table.OptionsData.CanDeleteOnServer := False;
  FMamulKart.Table.Clone.OptionsData.CanInsertOnServer := False;
  FMamulKart.Table.Clone.OptionsData.CanUpdateOnServer := False;

  FMamulYanUrun.Table.OptionsData.CanDeleteOnServer := False;
  FMamulYanUrun.Table.Clone.OptionsData.CanInsertOnServer := False;
  FMamulYanUrun.Table.Clone.OptionsData.CanUpdateOnServer := False;

  FMamulRota.Table.OptionsData.CanDeleteOnServer := False;
  FMamulRota.Table.Clone.OptionsData.CanInsertOnServer := False;
  FMamulRota.Table.Clone.OptionsData.CanUpdateOnServer := False;

  FMamulRotaKaynak.Table.OptionsData.CanDeleteOnServer := False;
  FMamulRotaKaynak.Table.Clone.OptionsData.CanInsertOnServer := False;
  FMamulRotaKaynak.Table.Clone.OptionsData.CanUpdateOnServer := False;

  FMamulRotaSonrakiOperasyon.Table.OptionsData.CanDeleteOnServer := False;
  FMamulRotaSonrakiOperasyon.Table.Clone.OptionsData.CanInsertOnServer := False;
  FMamulRotaSonrakiOperasyon.Table.Clone.OptionsData.CanUpdateOnServer := False;

  with DataObject.OptionsSave.SaveTableList do
  begin
    Clear;
    Add(FMamulBaslik.Table);

    Add(FMamulRotaSonrakiOperasyon.Table.Clone);
    Add(FMamulRotaKaynak.Table.Clone);
    Add(FMamulRota.Table.Clone);
    Add(FMamulYanUrun.Table.Clone);
    Add(FMamulKart.Table.Clone);

    Add(FMamulRevizyon.Table);

    Add(FMamulKart.Table);
    Add(FMamulYanUrun.Table);
    Add(FMamulRota.Table);
    Add(FMamulRotaSonrakiOperasyon.Table);
    Add(FMamulRotaKaynak.Table);

    Add(FMamulNot.Table);

    Add(FFMEAFormBaslik.Table);
    Add(FFMEAFormRevizyon.Table);
    Add(FFMEAFormDetay.Table);
  end;
  with DataObject.OptionsSave.DeleteTableList do
  begin
    Clear;
    Add(FFMEAFormDetay.Table);
    Add(FFMEAFormRevizyon.Table);
    Add(FFMEAFormBaslik.Table);

    Add(FMamulNot.Table);

    Add(FMamulRotaKaynak.Table.Clone);
    Add(FMamulRotaSonrakiOperasyon.Table.Clone);
    Add(FMamulRota.Table.Clone);
    Add(FMamulYanUrun.Table.Clone);
    Add(FMamulKart.Table.Clone);
    Add(FMamulRevizyon.Table);
    Add(FMamulBaslik.Table);
  end;
end;

procedure TAppDAPCustomMamulKart.SetKeyFieldNames;
begin
  inherited;
  with DataObject.OptionsKey do
  begin
    Names := 'SIRKETNO;RECETENO';
    KeyType := ktOnlyModuleKey;
    UniqueKeys.Add('SIRKETNO;RECETENO').MainKeyFieldName := 'RECETENO';
    UniqueKeys.Add('SIRKETNO;MAMULKOD;VERSIYONNO;KULLANIMKOD;SURUMNO').MainKeyFieldName := 'MAMULKOD';
  end;
  with DataObject.OptionsMove do
  begin
    FieldName := 'SURUMNO';
    FieldNames := 'MAMULKOD;VERSIYONNO;KULLANIMKOD';
    Where := Format('SIRKETNO = ''%s''', [CompanyNo]);
    OrderByFieldNames := 'SIRKETNO;MAMULKOD;VERSIYONNO;KULLANIMKOD;SURUMNO';
  end;
end;

{ TAppRuleMamulKartAutoRevizyon }

constructor TAppRuleMamulKartAutoRevizyon.Create(ATable: TAppTable;
  ATableRevizyon: TTableMamulRevizyon);
begin
  inherited Create;
  ATable.DataEvents.AddRule(Self);
  FTableRevizyon := ATableRevizyon;
end;

procedure TAppRuleMamulKartAutoRevizyon.DoBeforeInsert(Table: TAppCustomTable);
begin
  inherited;
  if FTableRevizyon.IsEmpty then
  begin
    FTableRevizyon.Insert;
    FTableRevizyon.Post;
  end;
end;

end.
