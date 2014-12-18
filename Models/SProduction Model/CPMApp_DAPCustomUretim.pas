unit CPMApp_DAPCustomUretim;

interface

uses Classes, SysUtils, DB, CPMApp_DataApp,
  CPMApp_DataChildUretimMamulKart, CPMApp_DataChildMamulStokKart,
  CPMApp_DataChildUretimHareket,
  CPMApp_DataChildUretimBaslik, CPMApp_DataChildUretimKart, CPMApp_DataChildUretimEvrakBaslik,
  CPMApp_DataChildUretimStokHareket, CPMApp_DataChildUretimStokMaliyet, CPMApp_DataChildStokDurum,
  CPMApp_DataChildUretimRota, CPMApp_DataChildUretimRotaKaynak, CPMApp_DataChildUretimKaynakTahsisat,
  CPMApp_DataChildUretimEvrakKaynak, CPMApp_DataChildUretimBaglanti,
  CPMApp_DataChildUretimDepoBaslik, CPMApp_DataChildUretimDepoTransfer,
  CPMApp_DataControllerUretimBaglanti, CPMApp_DataControllerUretim,
  CPMApp_DataControllerEvrakIslem, CPMApp_DataControllerStokDurum;

type
  TAppParamsUretimIslem = class(TPersistent)
  private
    FIslemTip: Integer;
    FGirisCikis: Integer;
    FEvrakTip: Integer;
    FUretimTip: Integer;
  published
    property UretimTip: Integer read FUretimTip write FUretimTip;
    property EvrakTip: Integer read FEvrakTip write FEvrakTip;
    property IslemTip: Integer read FIslemTip write FIslemTip;
    property GirisCikis: Integer read FGirisCikis write FGirisCikis;
  end;

  TAppDAPCustomUretim = class(TAppDataApp)
  private
    FMamulKart: TAppDataChildUretimMamulKart;
    FMamulStokKart: TAppDataChildMamulMultiStokKart;
    FUretimBaslik: TAppDataChildUretimBaslik;
    FUretimKart: TAppDataChildUretimKart;
    FUretimHareket: TAppDataChildUretimHareket;
    FEvrakBaslik: TAppDataChildUretimEvrakBaslik;
    FStokHareket: TAppDataChildUretimStokHareket;
    FStokDurum: TAppDataChildStokDurum;
    FStokMaliyet: TAppDataChildUretimStokMaliyet;
    FUretimOzelBaglanti: TAppDataControllerUretimOzelBaglanti;
    FParamsUretim: TAppParamsUretimIslem;
    FUretimRota: TAppDataChildUretimRota;
    FDataControllerUretim: TAppDataControllerUretim;
    FUretimRotaKaynak: TAppDataChildUretimRotaKaynak;
    FUretimKaynakTahsisat: TAppDataChildUretimKaynakTahsisat;
    FEvrakKaynak: TAppDataChildUretimEvrakKaynak;
    FUretimBaglanti: TAppDataChildUretimBaglanti;
    FDepoBaslik: TAppDataChildUretimDepoBaslik;
    FDepoTransfer: TAppDataChildUretimDepoTransfer;
    procedure CreateUretimBaslik;
    procedure CreateUretimKart;
    procedure CreateMamulKart;
    procedure CreateUretimHareket;
    procedure CreateUretimBaglanti;
    procedure CreateMamulStokKart;
    procedure CreateEvrakBaslik;
    procedure CreateStokHareket;
    procedure CreateStokMaliyet;
    procedure CreateEvrakKaynak;
    procedure CreateStokDurum;
    procedure CreateUretimRota;
    procedure CreateUretimRotaKaynak;
    procedure CreateUretimKaynakTahsisat;
    procedure CreateDepoBaslik;
    procedure CreateDepoTransfer;
  protected
    procedure SetKeyFieldNames; override;
    procedure SetApplyUpdateTableList; override;
    procedure CreateDataChilds; override;

    procedure CreateDataControllerCommon; override;
    function GetDataController: TAppDataControllerEvrakIslem;
    procedure SetDataController(Value: TAppDataControllerEvrakIslem);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ParamsUretim: TAppParamsUretimIslem read FParamsUretim;

    property UretimBaslik: TAppDataChildUretimBaslik read FUretimBaslik;
    property UretimKart: TAppDataChildUretimKart read FUretimKart;
    property UretimHareket: TAppDataChildUretimHareket read FUretimHareket;
    property UretimBaglanti: TAppDataChildUretimBaglanti read FUretimBaglanti;
    property MamulKart: TAppDataChildUretimMamulKart read FMamulKart;
    property MamulStokKart: TAppDataChildMamulMultiStokKart read FMamulStokKart;
    property EvrakBaslik: TAppDataChildUretimEvrakBaslik read FEvrakBaslik;
    property StokHareket: TAppDataChildUretimStokHareket read FStokHareket;
    property StokMaliyet: TAppDataChildUretimStokMaliyet read FStokMaliyet;
    property EvrakKaynak: TAppDataChildUretimEvrakKaynak read FEvrakKaynak;
    property UretimRota: TAppDataChildUretimRota read FUretimRota;
    property UretimRotaKaynak: TAppDataChildUretimRotaKaynak read FUretimRotaKaynak;
    property UretimKaynakTahsisat: TAppDataChildUretimKaynakTahsisat read FUretimKaynakTahsisat;
    property StokDurum: TAppDataChildStokDurum read FStokDurum;
    property DepoBaslik: TAppDataChildUretimDepoBaslik read FDepoBaslik;
    property DepoTransfer: TAppDataChildUretimDepoTransfer read FDepoTransfer;

    property DataController: TAppDataControllerEvrakIslem read GetDataController write SetDataController;
    property DataControllerUretim: TAppDataControllerUretim read FDataControllerUretim;
    property UretimOzelBaglanti: TAppDataControllerUretimOzelBaglanti read FUretimOzelBaglanti;
  end;

implementation

uses Variants, CPMApp_TableItems, CPMApp_DataOptionsKey;

{ TAppDAPCustomUretim }

constructor TAppDAPCustomUretim.Create(AOwner: TComponent);
begin
  inherited;
  FParamsUretim := TAppParamsUretimIslem.Create;
end;

procedure TAppDAPCustomUretim.CreateDataChilds;
begin
  inherited;
  CreateUretimBaslik;
  CreateUretimKart;
  CreateMamulKart;
  CreateUretimHareket;
  CreateUretimBaglanti;
  CreateMamulStokKart;
  CreateEvrakBaslik;
  CreateStokHareket;
  CreateStokMaliyet;
  CreateEvrakKaynak;
  CreateUretimRota;
  CreateUretimRotaKaynak;
  CreateUretimKaynakTahsisat;
  CreateStokDurum;
  CreateDepoBaslik;
  CreateDepoTransfer;

  FDataControllerUretim := TAppDataControllerUretim.Create(UretimHareket.Table, FUretimRota.Table,
    FUretimRotaKaynak.Table, FUretimKaynakTahsisat.Table, FStokHareket.Table);
  FDataControllerUretim.Params.EvrakTip := ParamsUretim.EvrakTip;
  FDataControllerUretim.Params.IslemTip := ParamsUretim.IslemTip;
  FDataControllerUretim.Params.UretimTip := ParamsUretim.UretimTip;
  FDataControllerUretim.TableUretimBaslik := FUretimBaslik.Table;
  FDataControllerUretim.TableUretimKart := FUretimKart.Table;
  FDataControllerUretim.TableEvrakBaslik := FEvrakBaslik.Table;
  FDataControllerUretim.TableStokMaliyet := FStokMaliyet.Table;
  FDataControllerUretim.TableEvrakKaynak := FEvrakKaynak.Table;
  FDataControllerUretim.TableUretimBaglanti := FUretimBaglanti.Table; // Evrak Kaynakdan sonra eþitle, rule a evrak kaynak veriliyor.

  FUretimOzelBaglanti := TAppDataControllerUretimOzelBaglanti.Create(DataController, FParamsUretim.EvrakTip);
  FUretimOzelBaglanti.TableUretimKart := UretimKart.Table;
  FUretimOzelBaglanti.TableUretimBaglanti := UretimBaglanti.Table;
end;

procedure TAppDAPCustomUretim.CreateDataControllerCommon;
begin
  DataController := TAppDataControllerEvrakIslem.Create;
end;

procedure TAppDAPCustomUretim.CreateEvrakBaslik;
begin
  FEvrakBaslik := TAppDataChildUretimEvrakBaslik.Create(Self);
  FEvrakBaslik.Table.TableItems.TableNames := VarArrayOf(['EVRBAS', 'URTKRT']);
  FEvrakBaslik.Table.TableItems[0].KeyFieldNames := '';
  FEvrakBaslik.Table.TableItems[1].KeyFieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO';
  FEvrakBaslik.Table.IndexFieldNames := 'HESAPKOD;EVRAKNO';
  with FEvrakBaslik.Table.TableItems[1].Join do
  begin
    Clear;
    Add('HESAPKOD', 'HESAPKOD');
    Add('EVRAKNO', 'EVRAKNO');
  end;
end;

procedure TAppDAPCustomUretim.CreateEvrakKaynak;
begin
  FEvrakKaynak := TAppDataChildUretimEvrakKaynak.Create(Self);
  FEvrakKaynak.Table.TableItems.Add('URTKRT', 'URTKRT', 'URTKRT', 'Üretim Kartý');
  FEvrakKaynak.Table.TableItems.Name['SHRKYN'].KeyFieldNames := '';
  FEvrakKaynak.Table.IndexFieldNames := 'SIRKETNO;EVRAKTIP;HESAPKOD;EVRAKNO;SIRANO';
  FEvrakKaynak.Table.MasterItems.Add(FStokHareket.Table, 'SIRKETNO;EVRAKTIP;HESAPKOD;EVRAKNO;SIRANO');
  with FEvrakKaynak.Table.TableItems.Name['URTKRT'] do
  begin
    KeyFieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO';
    with Join do
    begin
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('HESAPKOD', 'HESAPKOD');
      Add('EVRAKNO', 'EVRAKNO');
      Add('EVRAKTIP', 'EVRAKTIP');
    end;
  end;
end;

procedure TAppDAPCustomUretim.CreateMamulKart;
begin
  FMamulKart := TAppDataChildUretimMamulKart.Create(Self);
  MamulKart.Table.TableItems.TableNames := VarArrayOf(['MAMKRT', 'STKKRT', 'URTKRT']);
  with FMamulKart.Table.TableItems[0].Fields do
  begin
    Clear;
    Add('*');
  end;
  with FMamulKart.Table.TableItems[1].Fields do
  begin
    Clear;
    Add('MALAD');
  end;

  with FMamulKart.Table.TableItems[2].Fields do
  begin
    Clear;
  end;

  with FMamulKart.Table.TableItems[1].Join do
  begin
    Clear;
    Add('MALKOD', 'MAMULKOD');
  end;

  with FMamulKart.Table.TableItems[2].Join do
  begin
    Clear;
    Add('MAMULKOD', 'MAMULKOD');
  end;

  MamulKart.Table.TableItems[0].KeyFieldNames := '';
  MamulKart.Table.TableItems[1].KeyFieldNames := '';
  MamulKart.Table.TableItems[2].KeyFieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO';

  MamulKart.Table.MasterItems.Add(UretimKart.Table, 'MAMULKOD', 'MAMULKOD');
  MamulKart.Table.IndexFieldNames := 'MAMULKOD';
  MamulKart.TableClone.IndexFieldNames := 'MAMULKOD';
end;

procedure TAppDAPCustomUretim.CreateMamulStokKart;
begin
  FMamulStokKart := TAppDataChildMamulMultiStokKart.Create(Self);

  FMamulStokKart.Table.TableItems.TableNames := VarArrayOf(['STKKRT', 'URTKRT']);

  FMamulStokKart.Table.TableItems[0].KeyFieldNames := '';
  FMamulStokKart.Table.TableItems[1].KeyFieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO';

  with FMamulStokKart.Table.TableItems[1].Join do
  begin
    Clear;
    Add('MAMULKOD', 'MALKOD');
  end;

  FMamulStokKart.Table.IndexFieldNames := 'MALKOD';
  FMamulStokKart.Table.MasterItems.Add(UretimKart.Table, 'MALKOD', 'MAMULKOD');
  FMamulStokKart.Table.MasterItems[0].FetchFieldsRule.Enabled := False;
end;

procedure TAppDAPCustomUretim.CreateStokDurum;
begin
  FStokDurum := TAppDataChildStokDurum.Create(Self);

  FStokDurum.Table.TableItems.TableNames := VarArrayOf([AppStokDurumHelper.StokDurumDef]);
  FStokDurum.Table.TableItems.TableAlias := VarArrayOf(['STKDRM']);
  FStokDurum.Table.TableItems.TableCaptions := VarArrayOf(['Stok Durum']);

  FStokDurum.Table.OptionsKey.Enabled := False;
end;

procedure TAppDAPCustomUretim.CreateStokHareket;
begin
  FStokHareket := TAppDataChildUretimStokHareket.Create(Self);
  DataController.Controllers.CreateStokHareket(FStokHareket.Table, nil, 'STKHAR');
  DataController.Controllers.StokHareket.Definition.AddStokKart;

  FStokHareket.Table.TableItems.Add('URTKRT', 'URTKRT', 'URTKRT', 'Üretim Kartý');
  FStokHareket.Table.TableItems.Name['STKHAR'].KeyFieldNames := '';
//  FStokHareket.Table.IndexFieldNames := 'SIRANO';
  FStokHareket.Table.IndexFieldNames := 'EVRAKNO;SIRANO';
  FStokHareket.Table.MasterItems.Add(FUretimKart.Table, 'EVRAKNO', 'EVRAKNO');
  FStokHareket.Table.MasterItems[0].FetchFieldsRule.Enabled := False;
  FStokHareket.Table.MasterItems[0].RangeRule.EnabledOnFieldChanged := False;
  with FStokHareket.Table.TableItems.Name['URTKRT'] do
  begin
    KeyFieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO';
    with Join do
    begin
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('HESAPKOD', 'HESAPKOD');
      Add('EVRAKNO', 'EVRAKNO');
      Add('EVRAKTIP', 'EVRAKTIP');
    end;
  end;
  FStokHareket.LoadFields('TableStokHareket');
end;

procedure TAppDAPCustomUretim.CreateStokMaliyet;
begin
  FStokMaliyet := TAppDataChildUretimStokMaliyet.Create(Self);
  FStokMaliyet.Table.TableItems.TableNames := VarArrayOf(['STHMLY', 'URTKRT']);
  FStokMaliyet.Table.TableItems[0].KeyFieldNames := '';
  FStokMaliyet.Table.TableItems[1].KeyFieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO';
  FStokMaliyet.Table.IndexFieldNames := 'SIRANO';
  with FStokMaliyet.Table.TableItems[1].Join do
  begin
    Clear;
    Add('HESAPKOD', 'HESAPKOD');
    Add('EVRAKNO', 'EVRAKNO');
  end;
end;

procedure TAppDAPCustomUretim.CreateUretimBaglanti;
begin
  FUretimBaglanti := TAppDataChildUretimBaglanti.Create(Self);
  FUretimBaglanti.Table.IndexFieldNames := 'SIRANO';
  FUretimBaglanti.Table.MasterItems.Add(FUretimKart.Table, 'SIRANO');
  FUretimBaglanti.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'SIRKETNO;EVRAKTIP;HESAPKOD;URETIMNO';
end;

procedure TAppDAPCustomUretim.CreateUretimBaslik;
begin
  FUretimBaslik := TAppDataChildUretimBaslik.Create(Self);
  FUretimBaslik.Table.DefaultValue.InitFieldOnNewRecord := True;
end;

procedure TAppDAPCustomUretim.CreateUretimHareket;
begin
  FUretimHareket := TAppDataChildUretimHareket.Create(Self);

  FUretimHareket.Table.TableItems.TableNames := VarArrayOf(['URTHAR', 'STKKRT', AppStokDurumHelper.StokDurumDef, 'URTISM']);
  FUretimHareket.Table.TableItems.TableAlias := VarArrayOf(['URTHAR', 'STKKRT', 'STKDRM', 'URTISM']);
  FUretimHareket.Table.TableItems.TableCaptions := VarArrayOf(['Üretim Ýþ Akýþý', 'Stok Kart', 'Stok Durum', 'Ýþ Merkezi']);
  FUretimHareket.Table.TableItems.TableItemCaptions := VarArrayOf(['Üretim Ýþ Akýþý', '!', 'Stok Durum', 'Ýþ Merkezi']);

  with FUretimHareket.Table.TableItems[0].Fields do
  begin
    Clear;
    Add('*');
    AddExpression('CASE TIP WHEN 1 THEN URTISM.ISMERKEZAD ELSE STKKRT.MALAD END', 'STKKRT_MALAD')
  end;
  // STKKRT
  with FUretimHareket.Table.TableItems[1] do
  begin
    with Join do
    begin
      Clear;
      Add('MALKOD', 'MALKOD');
    end;
  end;
  // STOKDURUM
  with FUretimHareket.Table.TableItems[2] do
  begin
    with Fields do
    begin
      Clear;
      Add('STOKGIRIS');
      Add('STOKCIKIS');
      Add('STOKMIKTAR');
      Add('KULLANILABILIR');
    end;
    with Join do
    begin
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('MALKOD', 'MALKOD');
      Add('VERSIYONNO', 'VERSIYONNO');
      Add('DEPOKOD', 'DEPOKOD');
      Add('SERINO', 'SERINO');
      Add('SERINO2', 'SERINO2');
    end;
  end;
  // URTISM
  with FUretimHareket.Table.TableItems[3] do
  begin
    with Join do
    begin
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('ISMERKEZKOD', 'MALKOD');
    end;
  end;
end;

procedure TAppDAPCustomUretim.CreateUretimKart;
begin
  FUretimKart := TAppDataChildUretimKart.Create(Self);

  FUretimKart.Table.TableItems.TableNames := VarArrayOf(['URTKRT', 'STKKRT', AppStokDurumHelper.StokDurumDef, 'CARKRT']);
  FUretimKart.Table.TableItems.TableAlias := VarArrayOf(['URTKRT', 'STKKRT', 'STKDRM', 'CARKRT']);
  FUretimKart.Table.TableItems.TableCaptions := VarArrayOf(['Üretim Emirleri', 'Stok Kart', 'Stok Durum', 'Cari Kart']);
  FUretimKart.Table.TableItems.TableItemCaptions := VarArrayOf(['Üretim Emirleri', '!', '!', '!']);

  with FUretimKart.Table.TableItems[0].Fields do
  begin
    Clear;
    Add('*');
  end;
  // STKKRT
  with FUretimKart.Table.TableItems[1].Fields do
  begin
    Clear;
    Add('MALAD');
    Add('DOVIZCINS');
    Add('MALIYET1');
    Add('MALIYET2');
    Add('MALIYET3');
  end;
  with FUretimKart.Table.TableItems[1].Join do
  begin
    Clear;
    Add('MALKOD', 'MAMULKOD');
  end;
  with FUretimKart.Table.TableItems[2].Fields do
  begin
    Clear;
    Add('STOKGIRIS');
    Add('STOKCIKIS');
    Add('STOKMIKTAR');
    Add('KULLANILABILIR');
  end;

  with FUretimKart.Table.TableItems[2].Join do
  begin
    Clear;
    Add('SIRKETNO', 'SIRKETNO');
    Add('MALKOD', 'MAMULKOD');
    Add('VERSIYONNO', 'VERSIYONNO');
    Add('DEPOKOD', 'MAMULDEPOKOD');
    Add('SERINO', 'MAMULSERINO');
    Add('SERINO2', 'MAMULSERINO2');
  end;
  with FUretimKart.Table.TableItems[3].Fields do
  begin
    Clear;
    Add('UNVAN');
  end;
  with FUretimKart.Table.TableItems[3].Join do
  begin
    Clear;
    Add('HESAPKOD', 'HESAPKOD');
  end;
  FUretimKart.Table.LookupTableItems.Add(FUretimKart.Table.TableItems[1]);
  FUretimKart.Table.LookupTableItems.Add(FUretimKart.Table.TableItems[3]);

  FUretimKart.Table.MasterItems.Add(FUretimBaslik.Table, 'SIRKETNO;EVRAKTIP;URETIMNO');
  FUretimKart.Table.MasterItems[0].FetchFieldsRule.FieldNames := 'EVRAKTARIH';
  FUretimKart.Table.MasterItems[0].FetchFieldsRule.MasterFieldNames := 'EVRAKTARIH';
  FUretimKart.Table.MasterItems[0].RangeRule.Enabled := False;
  FUretimKart.Table.IndexFieldNames := 'SIRANO';
  FUretimKart.LoadFields('TableUretimKart'); 
end;

procedure TAppDAPCustomUretim.CreateUretimRota;
begin
  FUretimRota := TAppDataChildUretimRota.Create(Self);

  FUretimRota.Table.TableItems.TableNames := VarArrayOf(['URTROT']);
  FUretimRota.Table.TableItems.TableCaptions := VarArrayOf(['Üretim Rota Hareketleri']);

  FUretimRota.Table.IndexFieldNames := 'URETIMSIRANO;OPERASYONNO';
  FUretimRota.Table.MasterItems.Add(FUretimKart.Table, 'URETIMSIRANO', 'SIRANO');
  FUretimRota.Table.MasterItems[0].FetchFieldsRule.Enabled := False;
  FUretimRota.Table.MasterItems[0].RangeRule.EnabledOnFieldChanged := False;
end;

procedure TAppDAPCustomUretim.CreateUretimRotaKaynak;
begin
  FUretimRotaKaynak := TAppDataChildUretimRotaKaynak.Create(Self);

  FUretimRotaKaynak.Table.TableItems.TableNames := VarArrayOf(['URTROK']);
  FUretimRotaKaynak.Table.TableItems.TableCaptions := VarArrayOf(['Rota Kaynak Hareketleri']);

  FUretimRotaKaynak.Table.IndexFieldNames := 'URETIMSIRANO;OPERASYONNO;KULLANIMSIRANO';
  FUretimRotaKaynak.Table.MasterItems.Add(FUretimKart.Table, 'URETIMSIRANO', 'SIRANO');
  FUretimRotaKaynak.Table.MasterItems[0].FetchFieldsRule.Enabled := False;
  FUretimRotaKaynak.Table.MasterItems[0].RangeRule.EnabledOnFieldChanged := False;
end;

procedure TAppDAPCustomUretim.CreateUretimKaynakTahsisat;
begin
  FUretimKaynakTahsisat := TAppDataChildUretimKaynakTahsisat.Create(Self);

  FUretimKaynakTahsisat.Table.TableItems.TableNames := VarArrayof(['URTKTH']);
  FUretimKaynakTahsisat.Table.TableItems.TableCaptions := VarArrayOf(['Kaynak Tahsisat']);

  FUretimKaynakTahsisat.Table.IndexFieldNames := 'URETIMSIRANO;OPERASYONNO;KAYNAKKOD;SIRANO';
end;

procedure TAppDAPCustomUretim.CreateDepoBaslik;
begin
  FDepoBaslik := TAppDataChildUretimDepoBaslik.Create(Self);

  FDepoBaslik.Table.TableItems.TableNames := VarArrayOf(['DEPBAS', 'URTKRT']);
  FDepoBaslik.Table.TableItems.TableCaptions := VarArrayOf(['Depo Baþlýk', 'Üretim Kart']);

  FDepoBaslik.Table.TableItems[0].KeyFieldNames := '';
  FDepoBaslik.Table.TableItems[1].KeyFieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO';
  FDepoBaslik.Table.IndexFieldNames := 'HESAPKOD;EVRAKNO';
  with FDepoBaslik.Table.TableItems[0] do
  begin
    with Where do
    begin
      Clear;
      Add('EVRAKTIP', wcEqual, 3);
    end;
  end;
  with FDepoBaslik.Table.TableItems[1] do
  begin
    with Join do
    begin
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('HESAPKOD', 'HESAPKOD');
      Add('EVRAKNO', 'EVRAKNO');
    end;
  end;
end;

procedure TAppDAPCustomUretim.CreateDepoTransfer;
begin
  FDepoTransfer := TAppDataChildUretimDepoTransfer.Create(Self);

  FDepoTransfer.Table.TableItems.TableNames := VarArrayOf(['DEPTRN', 'URTKRT']);
  FDepoTransfer.Table.TableItems.TableCaptions := VarArrayOf(['Depo Transfer', 'Üretim Kart']);

  FDepoTransfer.Table.TableItems[0].KeyFieldNames := '';
  FDepoTransfer.Table.TableItems[1].KeyFieldNames := 'SIRKETNO;EVRAKTIP;URETIMNO';

  FDepoTransfer.Table.IndexFieldNames := 'HESAPKOD;EVRAKNO';

  with FDepoBaslik.Table.TableItems[0] do
  begin
    with Where do
    begin
      Clear;
      Add('EVRAKTIP', wcEqual, 3);
    end;
  end;
  with FDepoTransfer.Table.TableItems[1] do
  begin
    with Join do
    begin
      Clear;
      Add('SIRKETNO', 'SIRKETNO');
      Add('HESAPKOD', 'HESAPKOD');
      Add('EVRAKNO', 'EVRAKNO');
    end;
  end;
end;

destructor TAppDAPCustomUretim.Destroy;
begin
  FreeAndNil(FParamsUretim);
  FreeAndNil(FUretimOzelBaglanti);
  FreeAndNil(FDataControllerUretim);
  inherited;
end;

function TAppDAPCustomUretim.GetDataController: TAppDataControllerEvrakIslem;
begin
  Result := TAppDataControllerEvrakIslem(inherited GetDataController);
end;

procedure TAppDAPCustomUretim.SetApplyUpdateTableList;
begin
  inherited;
  DataObject.OptionsSave.UseDefaultList := false;
  {
  EvrakBaslik.Table.OptionsData.CanDeleteOnServer := False;
  EvrakBaslik.TableClone.OptionsData.CanInsertOnServer := False;
  EvrakBaslik.TableClone.OptionsData.CanUpdateOnServer := False;
  }

  with DataObject.OptionsSave.SaveTableList do
  begin
    Clear;
    // Güvenliðe ApplyUpdates lerin gitmesi için gerekli.
    Add(UretimKaynakTahsisat.Table, False, False, True);
    Add(UretimRotaKaynak.Table, False, False, True);
    Add(UretimRota.Table, False, False, True);
    Add(StokMaliyet.Table, False, False, True);
    Add(StokHareket.Table, False, False, True);
    //Add(EvrakKaynak.Table); // Otomatik siliniyor.
    //Add(EvrakBaslik.Table, False, False, True); bunu kaldýrdýk önce silme iþlemini asla yapma
    Add(UretimHareket.Table, False, False, True);
    Add(UretimKart.Table, False, False, True);
    Add(UretimBaslik.Table, False, False, True);
    // For Update
    Add(UretimBaslik.Table, True, True, False);
    Add(UretimKart.Table, True, True, False);
    Add(UretimHareket.Table, True, True, False);
    Add(EvrakBaslik.Table, True, True, False);
    Add(EvrakKaynak.Table, True, True, False);
    Add(StokHareket.Table, True, True, False);
    Add(StokMaliyet.Table, True, True, False);
    Add(EvrakBaslik.Table, False, False, True); 
    Add(UretimRota.Table, True, True, False);
    Add(UretimRotaKaynak.Table, True, True, False);
    Add(UretimKaynakTahsisat.Table, True, True, False);
  end;

  with DataObject.OptionsSave.DeleteTableList do
  begin
    Clear;
    Add(UretimKaynakTahsisat.Table); // Bütün parametreler true
    Add(UretimRotaKaynak.Table);
    Add(UretimRota.Table);
    Add(StokMaliyet.Table);
    Add(StokHareket.Table);
//    Add(EvrakKaynak.Table); Otomatik siliniyor.
    Add(EvrakBaslik.Table);
    Add(UretimHareket.Table);
    Add(UretimKart.Table);
    Add(UretimBaslik.Table);
  end;
end;

procedure TAppDAPCustomUretim.SetDataController(
  Value: TAppDataControllerEvrakIslem);
begin
  inherited SetDataController(Value);
end;

procedure TAppDAPCustomUretim.SetKeyFieldNames;
begin
  inherited;
  with DataObject.OptionsKey do
  begin
    Names := 'SIRKETNO;EVRAKTIP;URETIMNO';
    KeyType := ktOnlyModuleKey;
    UniqueKeys.Add('SIRKETNO;EVRAKTIP;URETIMNO').MainKeyFieldName := 'URETIMNO';
  end;
  with DataObject.OptionsMove do
  begin
    FieldNames := 'URETIMNO';
    Where := Format('SIRKETNO = ''%s'' AND EVRAKTIP = %d', [CompanyNo, ParamsUretim.EvrakTip]);
    OrderByFieldNames := 'URETIMNO';
  end;
end;

end.
