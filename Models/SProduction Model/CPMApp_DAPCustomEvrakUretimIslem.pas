unit CPMApp_DAPCustomEvrakUretimIslem;

interface

uses Classes, SysUtils, DB, Variants,
  CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_DataChildUretimKart, CPMApp_DataChildUretimRota, CPMApp_DataChildUretimRotaKaynak,
  CPMApp_DataChildUretimRotaKaynakIslem, CPMApp_DataChildUretimRotaKaynakOperasyon,
  CPMApp_DataChildUretimRotaKaynakDurus, CPMApp_DataChildUretimRotaKaynakHata,
  CPMApp_DataChildEvrakStokDurum,
  CPMApp_DataChildEvrakUretimError,
  CPMApp_DataControllerEvrakUretim, CPMApp_DataControllerBOMTree, CPMApp_DataControllerCommon, CPMApp_DataControllerEvrakIslem,
  CPMApp_DataControllerEvrakBaglanti, CPMApp_DataControllerUretimBaglanti, CPMApp_DAPCustomEvrakIslem,
  CPMApp_TableStokSystem, CPMApp_TableUretimSystem, CPMApp_TableBOMSystem, CPMApp_TableMRPSystem,
  CPMApp_DocumentLib, CPMApp_DocumentConsts, CPMApp_BOMConsts;

type

  TAppDAPEvrakUretimIslem = class(TAppDAPCustomMultiEvrakIslem)
  private
    FUretimKart: TAppDataChildUretimKart;
    FUretimRota: TAppDataChildUretimRota;
    FUretimRotaKaynak: TAppDataChildUretimRotaKaynak;
    FUretimRotaKaynakIslem: TAppDataChildUretimRotaKaynakIslem;
    FUretimRotaKaynakOperasyon: TAppDataChildUretimRotaKaynakOperasyon;
    FUretimRotaKaynakDurus: TAppDataChildUretimRotaKaynakDurus;
    FUretimRotaKaynakHata: TAppDataChildUretimRotaKaynakHata;
    FUretimError: TAppDataChildEvrakUretimError;
    FdcEvrakUretim: TAppDataControllerEvrakUretim;
    procedure CreateUretimKart;
    procedure CreateUretimRota;
    procedure CreateUretimRotaKaynak;
    procedure CreateUretimRotaKaynakIslem;
    procedure CreateUretimRotaKaynakOperasyon;
    procedure CreateUretimRotaKaynakDurus;
    procedure CreateUretimRotaKaynakHata;
    procedure CreateUretimError;
  protected
    procedure CreateDataChilds; override;
    procedure DoAfterCreateRules; override;
    procedure SetApplyUpdateTableList; override;
    function CreateEvrakBaglanti: TAppDataControllerBaseBaglanti; override;
    function CreateOzelBaglanti: TAppDataControllerEvrakOzelBaglanti; override;
  published
    property dcEvrakUretim: TAppDataControllerEvrakUretim read FdcEvrakUretim write FdcEvrakUretim;
    property UretimKart: TAppDataChildUretimKart read FUretimKart;
    property UretimRota: TAppDataChildUretimRota read FUretimRota;
    property UretimRotaKaynak: TAppDataChildUretimRotaKaynak read FUretimRotaKaynak;
    property UretimRotaKaynakIslem: TAppDataChildUretimRotaKaynakIslem read FUretimRotaKaynakIslem;
    property UretimRotaKaynakOperasyon: TAppDataChildUretimRotaKaynakOperasyon read FUretimRotaKaynakOperasyon;
    property UretimRotaKaynakDurus: TAppDataChildUretimRotaKaynakDurus read FUretimRotaKaynakDurus;
    property UretimRotaKaynakHata: TAppDataChildUretimRotaKaynakHata read FUretimRotaKaynakHata;
    property UretimError: TAppDataChildEvrakUretimError read FUretimError;
  end;

  TAppDAPEvrakUretimSonuclandirma = class(TAppDAPCustomEvrakIslem) // // Eski Üretim Evrak Ýþlem
  protected
    procedure CreateDataChilds; override;
    function CreateEvrakBaglanti: TAppDataControllerBaseBaglanti; override;
  end;

implementation

uses CPMApp_Security, CPMApp_Date, CPMApp_TableItems;

{ TAppDAPEvrakUretimIslem }

procedure TAppDAPEvrakUretimIslem.CreateDataChilds;
begin
  inherited;
  with EvrakHareket.Table.TableItems[0].Where do
  begin
    AddAnd('MALTIP', wcNotInList, VarArrayof([shmtYanUrun, shmtHammadde, shmtFire]));
  end;
  with EvrakHareket2.Table.TableItems[0].Where do
  begin
    AddAnd('MALTIP', wcInList, VarArrayof([shmtYanUrun, shmtHammadde, shmtFire]));
  end;
  with EvrakUretim.Table.TableItems[1].Where do
  begin
    AddAnd('MALTIP', wcNotInList, VarArrayof([shmtYanUrun, shmtHammadde, shmtFire]));
  end;
  with EvrakUretim2.Table.TableItems[1].Where do
  begin
    AddAnd('MALTIP', wcInList, VarArrayof([shmtYanUrun, shmtHammadde, shmtFire]));
  end;

  CreateUretimKart;
  CreateUretimRota;
  CreateUretimRotaKaynak;
  CreateUretimRotaKaynakIslem;
  CreateUretimRotaKaynakOperasyon;
  CreateUretimRotaKaynakDurus;
  CreateUretimRotaKaynakHata;
  CreateUretimError;

  FdcEvrakUretim := TAppDataControllerEvrakUretim.Create(DataController, ParamsEvrak.EvrakTip, EvrakHareket.Table, EvrakHareket2.Table, EvrakKaynak.Table, EvrakKaynak2.Table, UretimKart.Table, UretimRota.Table, UretimRotaKaynak.Table, UretimRotaKaynakIslem.Table, UretimError.Table, OzelMamulKart.Table);
  FdcEvrakUretim.TableParam := Params.Table;

  TAppDataControllerEvrakUretimOzelBaglanti(EvrakOzelBaglanti).dcEvrakUretim := dcEvrakUretim;
  TAppDataControllerEvrakUretimOzelBaglanti(EvrakOzelBaglanti).dcBOMTree.Params.KullanimGrupNo := ParamsEvrak.KullanimGrupNo;

  DataController.Controllers.Fiyat.Enabled := False;
  DataController.Controllers.StokHareket.RuleHareketDovizKur.Enabled := False;
  DataController2.Controllers.StokHareket.RuleHareketDovizKur.Enabled := False;

  TAppDataControllerEvrakUretimBaglanti(EvrakBaglanti).dcEvrakUretim := dcEvrakUretim;
  TAppDataControllerEvrakUretimBaglanti(EvrakBaglanti).TableMamulStokHareket := EvrakHareket.Table;
  TAppDataControllerEvrakUretimBaglanti(EvrakBaglanti).TableMamulEvrakKaynak := EvrakKaynak.Table;
  TAppDataControllerEvrakUretimBaglanti(EvrakBaglanti).TableHammaddeStokHareket := EvrakHareket2.Table;
  TAppDataControllerEvrakUretimBaglanti(EvrakBaglanti).TableHammaddeEvrakKaynak := EvrakKaynak2.Table;
  TAppDataControllerEvrakUretimBaglanti(EvrakBaglanti).TableUretimKart := UretimKart.Table;
  TAppDataControllerEvrakUretimBaglanti(EvrakBaglanti).TableUretimRota := UretimRota.Table;
  TAppDataControllerEvrakUretimBaglanti(EvrakBaglanti).TableUretimRotaKaynak := UretimRotaKaynak.Table;
end;

function TAppDAPEvrakUretimIslem.CreateEvrakBaglanti: TAppDataControllerBaseBaglanti;
begin
  Result := TAppDataControllerEvrakUretimBaglanti.Create(DataController, ParamsEvrak.EvrakTip);
end;

function TAppDAPEvrakUretimIslem.CreateOzelBaglanti: TAppDataControllerEvrakOzelBaglanti;
begin
  Result := TAppDataControllerEvrakUretimOzelBaglanti.Create(DataController, ParamsEvrak.EvrakTip);
end;

procedure TAppDAPEvrakUretimIslem.CreateUretimError;
begin
  FUretimError := TAppDataChildEvrakUretimError.Create(Self);
  FUretimError.ObjectName := 'UretimError';
  FUretimError.Table.IndexFieldNames := 'SIRANO2;SIRANO';
end;

procedure TAppDAPEvrakUretimIslem.CreateUretimKart;
begin
  FUretimKart := TAppDataChildUretimKart.Create(Self);

  // URETIMSN alaný bu tablonun primarykey alaný deðil, ikincil bir key alandýr.
  // bu tabloya primarykey SN alan eklendiðinde onun verilmesi gerekecek.
  // o zaman geldiðinde KeyFieldNAme özelliðine birden fazla fieldname verilebilir yapmam gerekiyor.
  FUretimKart.Table.KeyFieldName := 'URETIMSN';

  FUretimKart.Table.TableItems[0].KeyFieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO;HESAPKOD';
  FUretimKart.Table.TableItems[0].MasterKeyFieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO;HESAPKOD';
  FUretimKart.Table.MasterItems.Add(EvrakHareket.Table, 'SIRANO');
  if ParamsEvrak.EvrakTip = aetUretimSiparis then
  begin
     // Burada Üretim No, Evrak Nosuna denk geliyor, Evrak No da Üretim No ya tam tersi yapmýþýz baþta.
    FUretimKart.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO;URETIMTARIH;EVRAKNO;EVRAKTARIH;HESAPKOD;MAMULSERINO';
    FUretimKart.Table.MasterItems[0].FetchFieldsRule.MasterFieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO;EVRAKTARIH;SIPARISNO;SIPARISTARIH;HESAPKOD;SERINO';
  end
  else if (ParamsEvrak.EvrakTip = aetUretim) or (ParamsEvrak.EvrakTip = aetTersUretim) then
  begin
    FUretimKart.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO;URETIMTARIH;EVRAKNO;EVRAKTARIH;HESAPKOD;MAMULSERINO';
    FUretimKart.Table.MasterItems[0].FetchFieldsRule.MasterFieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO;EVRAKTARIH;IRSALIYENO;IRSALIYETARIH;HESAPKOD;SERINO';
  end;
  if ParamsEvrak.SeriNo2InKey then
  begin
    with FUretimKart.Table.MasterItems[0].FetchFieldsRule do
    begin
      FieldNames := FieldNames + ';MAMULSERINO2';
      MasterFieldNames := MasterFieldNames + ';SERINO2';
    end;
  end;
  FUretimKart.Table.IndexFieldNames := 'SIRANO';
end;

procedure TAppDAPEvrakUretimIslem.CreateUretimRota;
begin
  FUretimRota := TAppDataChildUretimRota.Create(Self);
  FUretimRota.Table.TableItems[0].KeyFieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO';
  FUretimRota.Table.TableItems[0].MasterKeyFieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO';
  FUretimRota.Table.MasterItems.Add(FUretimKart.Table, 'URETIMSIRANO', 'SIRANO');
  FUretimRota.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO;EVRAKNO;MAMULKOD;VERSIYONNO';
  FUretimRota.Table.IndexFieldNames := 'URETIMSIRANO;OPERASYONNO';
end;

procedure TAppDAPEvrakUretimIslem.CreateUretimRotaKaynak;
begin
  FUretimRotaKaynak := TAppDataChildUretimRotaKaynak.Create(Self);
  FUretimRotaKaynak.Table.TableItems[0].KeyFieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO';
  FUretimRotaKaynak.Table.TableItems[0].MasterKeyFieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO';
  FUretimRotaKaynak.Table.MasterItems.Add(FUretimRota.Table, 'URETIMSIRANO;OPERASYONNO');
  FUretimRotaKaynak.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO;EVRAKNO;MAMULKOD;VERSIYONNO;ISMERKEZKOD';
  FUretimRotaKaynak.Table.MasterItems[0].CopyFieldsRule.Add('MIKTAR', 'MIKTAR');
  FUretimRotaKaynak.Table.IndexFieldNames := 'URETIMSIRANO;OPERASYONNO;KULLANIMSIRANO;KAYNAKKOD';
  FUretimRotaKaynak.Table.Clone.IndexFieldNames := 'URETIMSIRANO;OPERASYONNO;KULLANIMSIRANO;KAYNAKKOD';
end;

procedure TAppDAPEvrakUretimIslem.CreateUretimRotaKaynakIslem;
begin
  FUretimRotaKaynakIslem := TAppDataChildUretimRotaKaynakIslem.Create(Self);
  FUretimRotaKaynakIslem.Table.TableItems[0].KeyFieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO';
  FUretimRotaKaynakIslem.Table.TableItems[0].MasterKeyFieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO';

  FUretimRotaKaynakIslem.Table.MasterItems.Add(FUretimRotaKaynak.Table, 'URETIMSIRANO;OPERASYONNO;KAYNAKKOD');
  FUretimRotaKaynakIslem.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO;EVRAKNO;MAMULKOD;VERSIYONNO;ISMERKEZKOD';
  FUretimRotaKaynakIslem.Table.IndexFieldNames := 'URETIMSIRANO;OPERASYONNO;KAYNAKKOD;ISLEMNO';
end;

procedure TAppDAPEvrakUretimIslem.CreateUretimRotaKaynakOperasyon;
begin
  FUretimRotaKaynakOperasyon := TAppDataChildUretimRotaKaynakOperasyon.Create(Self);
  FUretimRotaKaynakOperasyon.Table.TableItems[0].KeyFieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO';
  FUretimRotaKaynakOperasyon.Table.TableItems[0].MasterKeyFieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO';

  FUretimRotaKaynakOperasyon.Table.MasterItems.Add(FUretimRotaKaynak.Table, 'URETIMSIRANO;OPERASYONNO;KAYNAKKOD');
  FUretimRotaKaynakOperasyon.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO;EVRAKNO;MAMULKOD;VERSIYONNO;ISMERKEZKOD';
  FUretimRotaKaynakOperasyon.Table.IndexFieldNames := 'URETIMSIRANO;OPERASYONNO;KAYNAKKOD;SIRANO';
end;

procedure TAppDAPEvrakUretimIslem.CreateUretimRotaKaynakDurus;
begin
  FUretimRotaKaynakDurus := TAppDataChildUretimRotaKaynakDurus.Create(Self);
  FUretimRotaKaynakDurus.Table.TableItems[0].KeyFieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO';
  FUretimRotaKaynakDurus.Table.TableItems[0].MasterKeyFieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO';

  FUretimRotaKaynakDurus.Table.MasterItems.Add(FUretimRotaKaynakOperasyon.Table, 'URETIMSIRANO;OPERASYONNO;KAYNAKKOD;OPERASYONSIRANO', 'URETIMSIRANO;OPERASYONNO;KAYNAKKOD;SIRANO');
  FUretimRotaKaynakDurus.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;KAYITTUR;KAYITDURUM;EVRAKTIP;URETIMNO;EVRAKNO;MAMULKOD;VERSIYONNO;ISMERKEZKOD;VARDIYAKOD';
  FUretimRotaKaynakDurus.Table.MasterItems[0].CopyFieldsRule.Add('OPERATORKOD', 'OPERATORKOD');
  FUretimRotaKaynakDurus.Table.IndexFieldNames := 'URETIMSIRANO;OPERASYONNO;KAYNAKKOD;OPERASYONSIRANO';
end;

procedure TAppDAPEvrakUretimIslem.CreateUretimRotaKaynakHata;
begin
  FUretimRotaKaynakHata := TAppDataChildUretimRotaKaynakHata.Create(Self);
  FUretimRotaKaynakHata.Table.TableItems[0].KeyFieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO';
  FUretimRotaKaynakHata.Table.TableItems[0].MasterKeyFieldNames := 'SIRKETNO;EVRAKTIP;EVRAKNO';

  FUretimRotaKaynakHata.Table.MasterItems.Add(FUretimRotaKaynakOperasyon.Table, 'URETIMSIRANO;OPERASYONNO;KAYNAKKOD;OPERASYONSIRANO', 'URETIMSIRANO;OPERASYONNO;KAYNAKKOD;SIRANO');
  FUretimRotaKaynakHata.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;KAYITTUR;KAYITDURUM;EVRAKTIP;URETIMNO;EVRAKNO;MAMULKOD;VERSIYONNO;ISMERKEZKOD;VARDIYAKOD';
  FUretimRotaKaynakHata.Table.MasterItems[0].CopyFieldsRule.Add('OPERATORKOD', 'OPERATORKOD');
  FUretimRotaKaynakHata.Table.IndexFieldNames := 'URETIMSIRANO;OPERASYONNO;KAYNAKKOD;OPERASYONSIRANO';
end;

procedure TAppDAPEvrakUretimIslem.DoAfterCreateRules;
begin
  inherited;
  EvrakHareket.RuleInc.Active := False;
  EvrakHareket2.RuleInc.Active := False;
  dcEvrakUretim.RuleIncSrc := EvrakHareket.RuleInc;
  dcEvrakUretim.RuleIncDes := EvrakHareket2.RuleInc;

  // Bu üç rule eski üretim için
  FUretimKart.RuleEvrakNo.Enabled := False;
  FUretimKart.RuleSiraNo.Enabled := False;
  FUretimKart.RuleCustom.Enabled := False;
end;

procedure TAppDAPEvrakUretimIslem.SetApplyUpdateTableList;
begin
  inherited;
  with DataObject.OptionsSave.SaveTableList do
  begin
    Add(FUretimRotaKaynakHata.Table, False, False, True);
    Add(FUretimRotaKaynakDurus.Table, False, False, True);
    Add(FUretimRotaKaynakOperasyon.Table, False, False, True);
    Add(FUretimRotaKaynakIslem.Table, False, False, True);
    Add(FUretimRotaKaynak.Table, False, False, True);

    Add(FUretimRota.Table, False, False, True);

    Add(FUretimKart.Table);

    Add(FUretimRota.Table, True, True, False);

    Add(FUretimRotaKaynak.Table, True, True, False);
    Add(FUretimRotaKaynakIslem.Table, True, True, False);
    Add(FUretimRotaKaynakOperasyon.Table, True, True, False);
    Add(FUretimRotaKaynakDurus.Table, True, True, False);
    Add(FUretimRotaKaynakHata.Table, True, True, False);
  end;
  with DataObject.OptionsSave.DeleteTableList do
  begin
    Add(FUretimRotaKaynakHata.Table);
    Add(FUretimRotaKaynakDurus.Table);
    Add(FUretimRotaKaynakOperasyon.Table);
    Add(FUretimRotaKaynakIslem.Table);
    Add(FUretimRotaKaynak.Table);
    Add(FUretimRota.Table);
    Add(FUretimKart.Table);
  end;
end;

{ TAppDAPEvrakUretimSonuclandirma }

procedure TAppDAPEvrakUretimSonuclandirma.CreateDataChilds;
begin
  inherited;
  DataController.Controllers.CreateUretimUpdate(EvrakHareket.Table);
end;

function TAppDAPEvrakUretimSonuclandirma.CreateEvrakBaglanti: TAppDataControllerBaseBaglanti;
begin
  Result := TAppDataControllerUretimEvrakBaglanti.Create(DataController, ParamsEvrak.EvrakTip);
end;

end.
