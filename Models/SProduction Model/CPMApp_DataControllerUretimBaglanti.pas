unit CPMApp_DataControllerUretimBaglanti;

interface

uses Windows, Classes, SysUtils, DB,
  CPMApp_DataObjectDB,
  CPMApp_DataControllerCommon, CPMApp_DataControllerEvrakIslem, CPMApp_DataControllerEvrakBaglanti,
  CPMApp_DataControllerBOMTree, CPMApp_DataControllerEvrakUretim,
  CPMApp_TableBOMSystem, CPMApp_TableStokSystem, CPMApp_TableUretimSystem,
  CPMApp_DocumentConsts;

type

  TAppDataControllerBaseUretimBaglanti = class(TAppDataControllerCustomBaglanti) // Eski Üretim Ýçindir
  private
    FTableUretimKart: TTableUretimKart;
    FTableUretimBaglanti: TTableUretimBaglanti;
    FTableCloneUretimKart: TTableUretimKart;
    FTableCloneUretimBaglanti: TTableUretimBaglanti;
    FdcBOMTree: TAppDataControllerBOMTree;
    procedure SetTableUretimKart(const Value: TTableUretimKart);
    procedure SetTableUretimBaglanti(const Value: TTableUretimBaglanti);

    procedure DoFetchKaynak;
    procedure AddProjeUretim(AMamulKod, AVersiyonNo: String; AMiktar: Double);
  protected
    function GetKullanilanMiktar: Double; override;

    procedure FetchHeader; override;
    procedure FetchDetail(AMalKod, AVersiyonNo: String; ASurumNo: Integer; AMiktar: Double); override;

    procedure FetchKaynak; virtual;

    procedure AddDetail(AMiktar: Double); override;
    procedure AppendDetail; override;
    procedure PostDetail; override;

    procedure DisableControls; override;
    procedure EnableControls; override;
  public
    constructor Create(AOwner: TAppDataControllerCustomCommon; AEvrakTip: Integer); override;
    destructor Destroy; override;
  published
    property dcBOMTree: TAppDataControllerBOMTree read FdcBOMTree;
    property TableUretimKart: TTableUretimKart read FTableUretimKart write SetTableUretimKart;
    property TableUretimBaglanti: TTableUretimBaglanti read FTableUretimBaglanti write SetTableUretimBaglanti;
  end;

  TAppDataControllerUretimOzelBaglanti = class(TAppDataControllerBaseUretimBaglanti) // Eski Üretim Ýçindir
  protected
    function GetKullanilanMiktar: Double; override;
    function GetBaglantiMiktar: Double; override;
    procedure OpenBaglantiParam; override;

    procedure FetchKaynak; override;

    procedure FetchHeader; override;
    procedure FetchDetail(AMalKod, AVersiyonNo: String; ASurumNo: Integer; AMiktar: Double); override;
  end;

  TAppDataControllerUretimEvrakBaglanti = class(TAppDataControllerEvrakBaglanti) // Eski Üretim Evrak Ýþlem Ýçindir
  protected
    procedure FetchDetail(AMalKod, AVersiyonNo: String; ASurumNo: Integer; AMiktar: Double); override;
  public
    procedure AddProductionDocument(ATableBaslik: TAppDBTable; ATableHareket: TAppDBTable; const AUretimMiktar: Double = 0);
  end;

  TAppDataControllerEvrakUretimBaglanti = class(TAppDataControllerBaseBaglanti) // Yeni Üretim Ýçindir
  private
    FdcEvrakUretim: TAppDataControllerEvrakUretim;
    FTableMamulEvrakKaynak: TTableEvrakKaynak;
    FTableMamulStokHareket: TTableStokHareket;
    FTableHammaddeEvrakKaynak: TTableEvrakKaynak;
    FTableHammaddeStokHareket: TTableStokHareket;
    FTableUretimKart: TTableUretimKart;
    FTableUretimRota: TTableUretimRota;
    FTableUretimRotaKaynak: TTableUretimRotaKaynak;
    FTableBaglantiUretimKart: TTableUretimKart;
    FTableBaglantiUretimRota: TTableUretimRota;
    FTableBaglantiUretimRotaKaynak: TTableUretimRotaKaynak;
    procedure OpenBaglantiUretim(ASirketNo: String; AEvrakTip: Integer; AHesapKod: String; AEvrakNo: String; ASiraNo: Integer);
    procedure AddUretim;
  protected
    procedure FetchDetail(AMalKod, AVersiyonNo: String; ASurumNo: Integer; AMiktar: Double); override;
    procedure DisableControls; override;
    procedure EnableControls; override;
    procedure AddDetail(AMiktar: Double); override;
  public
    constructor Create(AOwner: TAppDataControllerEvrakIslem; AEvrakTip: Integer); override;
    destructor Destroy; override;
    function AddDocumentItem(ATableBaslik, ATableHareket: TAppDBTable): Boolean; overload;
    procedure AddProductionDocument(ATableBaslik: TAppDBTable; ATableHareket: TAppDBTable; const AUretimMiktar: Double = 0);
  published
    property dcEvrakUretim: TAppDataControllerEvrakUretim read FdcEvrakUretim write FdcEvrakUretim;

    property TableMamulStokHareket: TTableStokHareket read FTableMamulStokHareket write FTableMamulStokHareket;
    property TableMamulEvrakKaynak: TTableEvrakKaynak read FTableMamulEvrakKaynak write FTableMamulEvrakKaynak;
    property TableHammaddeStokHareket: TTableStokHareket read FTableHammaddeStokHareket write FTableHammaddeStokHareket;
    property TableHammaddeEvrakKaynak: TTableEvrakKaynak read FTableHammaddeEvrakKaynak write FTableHammaddeEvrakKaynak;
    property TableUretimKart: TTableUretimKart read FTableUretimKart write FTableUretimKart;
    property TableUretimRota: TTableUretimRota read FTableUretimRota write FTableUretimRota;
    property TableUretimRotaKaynak: TTableUretimRotaKaynak read FTableUretimRotaKaynak write FTableUretimRotaKaynak;
  end;

  TAppDataControllerEvrakUretimOzelBaglanti = class(TAppDataControllerEvrakOzelBaglanti) // Yeni Üretim Ýçindir
  private
    procedure BOMTreeOnReturn(Hammadde: TAppBOMData);
  private
    FdcBOMTree: TAppDataControllerBOMTree;
    FdcEvrakUretim: TAppDataControllerEvrakUretim;
    procedure AddProjeUretim(AMamulKod, AVersiyonNo: String; ASurumNo: Integer; AMiktar: Double);
    procedure AddUretim(AMiktar: Double);
  protected
    procedure AddDetail(AMiktar: Double); override;
  public
    constructor Create(AOwner: TAppDataControllerEvrakIslem; AEvrakTip: Integer); override;
    destructor Destroy; override;
  published
    property dcBOMTree: TAppDataControllerBOMTree read FdcBOMTree;
    property dcEvrakUretim: TAppDataControllerEvrakUretim read FdcEvrakUretim write FdcEvrakUretim;
  end;

implementation

uses
  CPMApp_Security,
  CPMApp_Date,
  CPMApp_TableItems,
  CPMApp_BOMConsts;

{ TAppDataControllerBaseUretimBaglanti }

procedure TAppDataControllerBaseUretimBaglanti.AddDetail(
  AMiktar: Double);
begin
  case TAppAlimTipType(TableBaglantiHareket.AlimTip) of
    atBirebirUretim, atKalanUretim: // Normal üretim
    begin
      DoFetchDetail('', '', 0, AMiktar);
      DoFetchKaynak;
    end;
    atProjeUretim:
    begin
      AddProjeUretim(TableBaglantiHareket.MalKod, TableBaglantiHareket.VersiyonNo, AMiktar);
      DoFetchKaynak;
    end;
  end;
end;

procedure TAppDataControllerBaseUretimBaglanti.AddProjeUretim(AMamulKod, AVersiyonNo: String; AMiktar: Double);
var
  ATableMamulKart: TTableMamulKart;
  AReceteNo, ARevizyonNo: String;
begin
  dcBOMTree.MamulKart.Open(0, AMamulKod, AVersiyonNo, '', 0, AppDate, AReceteNo, ARevizyonNo);
  if dcBOMTree.MamulKart.TableKart.IsEmpty then
    exit;
  ATableMamulKart := TTableMamulKart.Create(nil);
  try
    ATableMamulKart.Data := dcBOMTree.MamulKart.TableKart.Data;
    ATableMamulKart.First;
    while not ATableMamulKart.Eof do
    begin
      AddProjeUretim(ATableMamulKart.HammaddeKod, ATableMamulKart.HammaddeVersiyonNo, ATableMamulKart.Miktar * AMiktar);
      ATableMamulKart.Next;
    end;
    TableUretimKart.Append;
    FetchDetail(AMamulKod, AVersiyonNo, 0, AMiktar);
    //TableUretimKart.MamulKod := AMamulKod;
    //TableUretimKart.Miktar := AMiktar;
    TableUretimKart.Post;
  finally
    ATableMamulKart.Free;
  end;
end;

procedure TAppDataControllerBaseUretimBaglanti.AppendDetail;
begin
  FTableUretimKart.Append;
end;

constructor TAppDataControllerBaseUretimBaglanti.Create(
  AOwner: TAppDataControllerCustomCommon; AEvrakTip: Integer);
begin
  inherited;
  FTableCloneUretimBaglanti := TTableUretimBaglanti.Create(nil);
  FTableCloneUretimKart := TTableUretimKart.Create(nil);
  FdcBOMTree := TAppDataControllerBOMTree.Create;
end;

destructor TAppDataControllerBaseUretimBaglanti.Destroy;
begin
  FreeAndNil(FdcBOMTree);
  FreeAndNil(FTableCloneUretimBaglanti);
  FreeAndNil(FTableCloneUretimKart);
  inherited;
end;

procedure TAppDataControllerBaseUretimBaglanti.DisableControls;
begin
  inherited;

end;

procedure TAppDataControllerBaseUretimBaglanti.DoFetchKaynak;
begin
  if FTableUretimBaglanti <> nil then
  begin
    FTableUretimBaglanti.Append;
    FetchKaynak;
    FTableUretimBaglanti.Post;
  end;
end;

procedure TAppDataControllerBaseUretimBaglanti.EnableControls;
begin
  inherited;

end;

procedure TAppDataControllerBaseUretimBaglanti.FetchDetail(AMalKod, AVersiyonNo: String; ASurumNo: Integer; AMiktar: Double);
var
  Src: TTableStokHareket;
  Des: TTableUretimKart;
begin
  inherited;
  if AMalKod <> '' then
  begin
    FTableUretimKart.MamulKod := AMalKod;
    FTableUretimKart.VersiyonNo := AVersiyonNo;
//    FTableUretimKart.SurumNo := ASurumNo;
  end
  else begin
    FTableUretimKart.MamulKod := TableBaglantiHareket.MalKod;
    FTableUretimKart.VersiyonNo := TableBaglantiHareket.VersiyonNo;
//    FTableUretimKart.SurumNo := TableBaglantiHareket.SurumNo;
  end;
  FTableUretimKart.Miktar := AMiktar;
  Des := FTableUretimKart;
  Src := TableBaglantiHareket;

  if Src.TahminTeslimTarih > 2 then
    Des.UretimTarih := Src.TahminTeslimTarih - 2;
  Des.SKod1 := Src.SKod1;
  Des.SKod2 := Src.SKod2;
  Des.SKod3 := Src.SKod3;
  Des.SKod4 := Src.SKod4;
  Des.SKod5 := Src.SKod5;
  Des.MKod1 := Src.MKod1;
  Des.MKod2 := Src.MKod2;
  Des.MKod3 := Src.MKod3;
  Des.MKod4 := Src.MKod4;
  Des.MKod5 := Src.MKod5;
  Des.LKod1 := Src.LKod1;
  Des.LKod2 := Src.LKod2;
  Des.LKod3 := Src.LKod3;
  Des.LKod4 := Src.LKod4;
  Des.LKod5 := Src.LKod5;
  Des.BKod1 := Src.BKod1;
  Des.BKod2 := Src.BKod2;
  Des.BKod3 := Src.BKod3;
  Des.BKod4 := Src.BKod4;
  Des.BKod5 := Src.BKod5;
  Des.NKod1 := Src.NKod1;
  Des.NKod2 := Src.NKod2;
  Des.NKod3 := Src.NKod3;
  Des.NKod4 := Src.NKod4;
  Des.NKod5 := Src.NKod5;
  Des.Aciklama1 := Src.Aciklama1;
  Des.Aciklama2 := Src.Aciklama2;
  Des.Aciklama3 := Src.Aciklama3;
  Des.Aciklama4 := Src.Aciklama4;
  Des.Aciklama5 := Src.Aciklama5;
end;

procedure TAppDataControllerBaseUretimBaglanti.FetchHeader;
begin
  inherited;

end;

procedure TAppDataControllerBaseUretimBaglanti.FetchKaynak;
begin
  FTableUretimBaglanti.Miktar := FTableUretimKart.Miktar;
  FTableUretimBaglanti.KaynakEvrakTip := TableBaglantiHareket.EvrakTip;
  FTableUretimBaglanti.KaynakHesapKod := TableBaglantiHareket.HesapKod;
  FTableUretimBaglanti.KaynakEvrakNo := TableBaglantiHareket.EvrakNo;
  FTableUretimBaglanti.KaynakSiraNo := TableBaglantiHareket.SiraNo;
  FTableUretimBaglanti.Kapat := TableBaglantiParam.Kapat;
end;

function TAppDataControllerBaseUretimBaglanti.GetKullanilanMiktar: Double;
begin
  Result := 0;
  FTableCloneUretimBaglanti.SetRange(
    [TableBaglantiHareket.EvrakTip, TableBaglantiHareket.HesapKod, TableBaglantiHareket.EvrakNo, TableBaglantiHareket.SiraNo],
    [TableBaglantiHareket.EvrakTip, TableBaglantiHareket.HesapKod, TableBaglantiHareket.EvrakNo, TableBaglantiHareket.SiraNo]
    );
  FTableCloneUretimBaglanti.First;
  while not FTableCloneUretimBaglanti.Eof do
  begin
    if FTableCloneUretimKart.FindKey([FTableCloneUretimBaglanti.SiraNo]) then
    begin
      if FTableCloneUretimKart.UpdateStatus <> usUnModified then
      begin
        if FTableCloneUretimKart.UpdateStatus = usModified then
          Result := Result + FTableCloneUretimKart.Miktar - FTableCloneUretimKart.fMiktar.OldValue
        else
          Result := Result + FTableCloneUretimKart.Miktar;
      end;
    end;
    FTableCloneUretimBaglanti.Next;
  end;
end;

procedure TAppDataControllerBaseUretimBaglanti.PostDetail;
begin
  FTableUretimKart.Post;
end;

procedure TAppDataControllerBaseUretimBaglanti.SetTableUretimBaglanti(
  const Value: TTableUretimBaglanti);
begin
  FTableUretimBaglanti := Value;
  FTableUretimBaglanti.AddClone(FTableCloneUretimBaglanti);
  FTableCloneUretimBaglanti.IndexFieldNames := 'KAYNAKEVRAKTIP;KAYNAKHESAPKOD;KAYNAKEVRAKNO;KAYNAKSIRANO';
end;

procedure TAppDataControllerBaseUretimBaglanti.SetTableUretimKart(
  const Value: TTableUretimKart);
begin
  FTableUretimKart := Value;
  FTableUretimKart.AddClone(FTableCloneUretimKart);
  FTableCloneUretimKart.IndexFieldNames := 'SIRANO';
end;

{ TAppDataControllerUretimOzelBaglanti }

procedure TAppDataControllerUretimOzelBaglanti.FetchDetail(AMalKod, AVersiyonNo: String; ASurumNo: Integer; AMiktar: Double);
begin
  inherited;
end;

procedure TAppDataControllerUretimOzelBaglanti.FetchHeader;
begin
  inherited;
end;

procedure TAppDataControllerUretimOzelBaglanti.FetchKaynak;
begin
  inherited FetchKaynak;
end;

function TAppDataControllerUretimOzelBaglanti.GetBaglantiMiktar: Double;
begin
  case TAppAlimTipType(TableBaglantiHareket.AlimTip) of
    atBirebirUretim:
      Result := TableBaglantiHareket.Miktar - TableBaglantiHareket.AlimMiktar;
    atProjeUretim, atKalanUretim:
      Result := TableBaglantiHareket.Miktar - TableBaglantiHareket.KullanilanMiktar + TableBaglantiHareket.FazlaSevk - TableBaglantiHareket.AlimMiktar - TableBaglantiHareket.SevkMiktar;
    else
      raise exception.Create('Gerekli Alým Tipi bulunamadý!');
  end;
end;

function TAppDataControllerUretimOzelBaglanti.GetKullanilanMiktar: Double;
begin
  Result := inherited GetKullanilanMiktar;
end;

procedure TAppDataControllerUretimOzelBaglanti.OpenBaglantiParam;
begin
  Tip := 1;
  inherited;
end;


{ TAppDataControllerUretimEvrakBaglanti }

procedure TAppDataControllerUretimEvrakBaglanti.AddProductionDocument(
  ATableBaslik, ATableHareket: TAppDBTable; const AUretimMiktar: Double = 0);
var
  ErrCnt: Integer;
  AMax, ACnt: Integer;
  ABaslikMiktar, AMiktar: Double;
begin
  ErrCnt := 0;
  ErrorText := '';

  if TableBaglantiBaslik.Active then
    TableBaglantiBaslik.Close;

  OpenBaglantiEvrak(ATableBaslik);

  if not CheckKaynakParam then
  begin
    ShowError;
    Exit;
  end;

  AMax := ATableHareket.RecordCount; // + 1;
  ACnt := 0;
  ATableHareket.DisableControls;
  DisableControls;

  DataControllerCommon.EvrakBaglanti.Tip := Tip;
  DataControllerCommon.EvrakBaglanti.Enabled := True;
  try
    ATableHareket.First;
    if not CheckMultiBaglanti then
    begin
      ShowError;
      Exit;
    end;
    try
      ABaslikMiktar := ATableBaslik.FieldByName('MIKTAR').AsFloat;
      AddHeader;
      if not ATableHareket.IsEmpty then
      begin
        while not ATableHareket.Eof do
        begin
          ACnt := ACnt + 1;
          if AUretimMiktar > 0 then
          begin
            AMiktar := ATableHareket.FieldByName('MIKTAR').AsFloat / ABaslikMiktar * AUretimMiktar;
          end
          else
            AMiktar := -99;
          if not AddInDocumentItem(ATableHareket['SIRKETNO'], ATableHareket['EVRAKTIP'], ATableHareket['HESAPKOD'], ATableHareket['EVRAKNO'], ATableHareket['SIRANO'], AMiktar) then
            ErrCnt := ErrCnt + 1;
          DoOnProgress(1, AMax, ACnt);
          ATableHareket.Next;
        end;
        if ErrCnt > 0 then
        begin
          ShowError('Baðlantýsý yapýlamayan ' + IntToStr(ErrCnt) + ' adet kayýt var.' +
            #10+#13 + 'Son Hata Mesajý: ' + LastError);
        end;
      end;
    except on E:Exception do
        ShowError('Evrak baðlantýda sorun oluþtu, Hata: ' + E.Message);
    end;
  finally
    ATableHareket.EnableControls;
    EnableControls;
    DataControllerCommon.EvrakBaglanti.Enabled := False;
  end;
end;

procedure TAppDataControllerUretimEvrakBaglanti.FetchDetail(AMalKod, AVersiyonNo: String; ASurumNo: Integer; AMiktar: Double);
var
  Src, Des: TTableStokHareket;
begin
  inherited;
  Des := TableEvrakHareket;
  Src := TableBaglantiHareket;
  Des.FiyatSekli := DefaultFiyatStr;
  Des.Fiyat := Src.Fiyat;
  Des.FiyatDovizCins := Src.FiyatDovizCins;
  Des.FiyatDovizKur := Src.FiyatDovizKur;
  Des.GirisCikis := Src.GirisCikis;
end;


{ TAppDataControllerEvrakUretimOzelBaglanti }

procedure TAppDataControllerEvrakUretimOzelBaglanti.AddProjeUretim(
  AMamulKod, AVersiyonNo: String; ASurumNo: Integer; AMiktar: Double);
var
  ATableMamulKart: TTableMamulKart;
  AReceteNo, ARevizyonNo: String;
begin
  dcBOMTree.MamulKart.Open(dcBOMTree.Params.KullanimGrupNo, AMamulKod, AVersiyonNo, '', ASurumNo, AppDate, AReceteNo, ARevizyonNo);
  if dcBOMTree.MamulKart.TableKart.IsEmpty then
    Exit;
  ATableMamulKart := TTableMamulKart.Create(nil);
  try
    ATableMamulKart.Data := dcBOMTree.MamulKart.TableKart.Data;
    ATableMamulKart.First;
    while not ATableMamulKart.Eof do
    begin
      AddProjeUretim(ATableMamulKart.HammaddeKod, ATableMamulKart.HammaddeVersiyonNo, ATableMamulKart.HammaddeSurumNo, ATableMamulKart.Miktar * AMiktar);
      ATableMamulKart.Next;
    end;
    DoFetchDetail(AMamulKod, AVersiyonNo, ASurumNo, AMiktar);
    DoFetchOzelMamulKart(AMamulKod, AVersiyonNo, ASurumNo);
  finally
    ATableMamulKart.Free;
  end;
end;

procedure TAppDataControllerEvrakUretimOzelBaglanti.BOMTreeOnReturn(
  Hammadde: TAppBOMData);
begin
  if not Hammadde.SonSeviye then // Sadece Mamülleri Ekle
  begin
    DoFetchDetail(Hammadde.MalKod, Hammadde.VersiyonNo, Hammadde.SurumNo, Hammadde.Miktar);
    DoFetchOzelMamulKart(Hammadde.MalKod, Hammadde.VersiyonNo, Hammadde.SurumNo);
    dcEvrakUretim.ExecBOMExplosion(TableEvrakHareket.SiraNo);
  end;
end;

procedure TAppDataControllerEvrakUretimOzelBaglanti.AddUretim(AMiktar: Double);
begin
  dcEvrakUretim.AutoBOMExplosion := False;
  try
    FdcBOMTree.Expand(TableBaglantiHareket.MalKod, TableBaglantiHareket.VersiyonNo, '', TableBaglantiHareket.SurumNo, AppDate, AMiktar, '', '', '', TableBaglantiHareket.OzelReceteTip, TableBaglantiHareket.EvrakTip, TableBaglantiHareket.HesapKod, TableBaglantiHareket.EvrakNo, TableBaglantiHareket.SiraNo);
  finally
    dcEvrakUretim.AutoBOMExplosion := True;
  end;
end;

procedure TAppDataControllerEvrakUretimOzelBaglanti.AddDetail(AMiktar: Double);
begin
  case TAppAlimTipType(TableBaglantiHareket.AlimTip) of
    atBirebirUretim, atKalanUretim:
        AddUretim(AMiktar);

    atProjeUretim:
        AddProjeUretim(TableBaglantiHareket.MalKod, TableBaglantiHareket.VersiyonNo, TableBaglantiHareket.SurumNo, AMiktar);
  end;
  DoFetchKaynak;
end;

constructor TAppDataControllerEvrakUretimOzelBaglanti.Create(
  AOwner: TAppDataControllerEvrakIslem; AEvrakTip: Integer);
begin
  inherited;
  FdcBOMTree := TAppDataControllerBOMTree.Create;
  FdcBOMTree.OnReturn := BOMTreeOnReturn;
  FdcBOMTree.Params.SingleLevel := False;
  FdcBOMTree.Params.SipariseUretim := True;
  FdcBOMTree.Params.ReturnPhantom := False;
  FdcBOMTree.Params.LotKapat := False;
  FdcBOMTree.TableOzelMamulKart := TableBaglantiOzelMamulKart;
end;

destructor TAppDataControllerEvrakUretimOzelBaglanti.Destroy;
begin
  FreeAndNil(FdcBOMTree);
  inherited;
end;

{ TAppDataControllerEvrakUretimBaglanti }

procedure TAppDataControllerEvrakUretimBaglanti.AddDetail(AMiktar: Double);
begin
  inherited AddDetail(AMiktar);
  if TableEvrakHareket = TableMamulStokHareket then
  begin
    if TableBaglantiHareket.EvrakTip <> aetUretimSiparis then
      raise exception.Create('Üretim Baðlantýsýnda Üretim Emrinin Dýþýnda olamaz!');
    OpenBaglantiUretim(TableBaglantiHareket.SirketNo, TableBaglantiHareket.EvrakTip,
      TableBaglantiHareket.HesapKod, TableBaglantiHareket.SiparisNo, TableBaglantiHareket.SiraNo);
    AddUretim;
  end;
end;

function TAppDataControllerEvrakUretimBaglanti.AddDocumentItem(
  ATableBaslik, ATableHareket: TAppDBTable): Boolean;
var
  ASirketNo, AHesapKod, AEvrakNo: String;
  AEvrakTip, ASiraNo: Integer;
begin
  TableEvrakHareket := TableMamulStokHareket;
  TableEvrakKaynak := TableMamulEvrakKaynak;
  ASirketNo := ATableBaslik.FieldByName('SIRKETNO').AsString;
  AEvrakTip := ATableBaslik.FieldByName('EVRAKTIP').AsInteger;
  AHesapKod := ATableBaslik.FieldByName('HESAPKOD').AsString;
  AEvrakNo := ATableBaslik.FieldByName('EVRAKNO').AsString;
  ASiraNo := ATableBaslik.FieldByName('SIRANO').AsInteger;
  DoOpenBaglantiEvrak(ASirketNo, AEvrakTip, AHesapKod, AEvrakNo, ASiraNo);
  if not FindTableEvrakHareket(AEvrakTip, AHesapKod, AEvrakNo, ASiraNo) then
  begin
    ShowError('Önce Mamülü eklemeniz gerekmektedir.');
    Result := False;
    Exit;
  end;

  ASirketNo := ATableHareket.FieldByName('SIRKETNO').AsString;
  AEvrakTip := ATableHareket.FieldByName('EVRAKTIP').AsInteger;
  AHesapKod := ATableHareket.FieldByName('HESAPKOD').AsString;
  AEvrakNo := ATableHareket.FieldByName('EVRAKNO').AsString;
  ASiraNo := ATableHareket.FieldByName('SIRANO').AsInteger;
  DoOpenBaglantiEvrak(ASirketNo, AEvrakTip, AHesapKod, AEvrakNo, ASiraNo);
  if FindHareket(ASiraNo) then
  begin
    if TableBaglantiHareket.GirisCikis = 0 then
    begin
      TableEvrakHareket := TableMamulStokHareket;
      TableEvrakKaynak := TableMamulEvrakKaynak;
    end
    else begin
      TableEvrakHareket := TableHammaddeStokHareket;
      TableEvrakKaynak := TableHammaddeEvrakKaynak;
    end;
  end;
  Result := AddInDocumentItem(ASirketNo, AEvrakTip, AHesapKod, AEvrakNo, ASiraNo, -99);
end;

procedure TAppDataControllerEvrakUretimBaglanti.AddProductionDocument(
  ATableBaslik, ATableHareket: TAppDBTable; const AUretimMiktar: Double);
var
  ErrCnt: Integer;
  AMax, ACnt: Integer;
  ABaslikMiktar, AMiktar: Double;
begin
  ErrCnt := 0;
  ErrorText := '';

  if TableBaglantiBaslik.Active then
    TableBaglantiBaslik.Close;

  OpenBaglantiEvrak(ATableBaslik);

  if not CheckKaynakParam then
  begin
    ShowError;
    Exit;
  end;

  ATableBaslik.DisableControls;
  AMax := ATableHareket.RecordCount; // + 1;
  ATableHareket.DisableControls;
  DisableControls;
  DataControllerCommon.EvrakBaglanti.Tip := Tip;
  DataControllerCommon.EvrakBaglanti.Enabled := True;
  try
    ATableHareket.First;
    if not CheckMultiBaglanti then
    begin
      ShowError;
      Exit;
    end;
    dcEvrakUretim.AutoBOMExplosion := False;
    try
      ABaslikMiktar := ATableBaslik.FieldByName('MIKTAR').AsFloat;
      AddHeader;
      // Önce Ürünü Ekle
      TableEvrakHareket := TableMamulStokHareket;
      TableEvrakKaynak := TableMamulEvrakKaynak;
      if AUretimMiktar > 0 then
        AMiktar := AUretimMiktar
      else
        AMiktar := -99;
      if not AddInDocumentItem(ATableBaslik['SIRKETNO'], ATableBaslik['EVRAKTIP'], ATableBaslik['HESAPKOD'], ATableBaslik['EVRAKNO'], ATableBaslik['SIRANO'], AMiktar) then
        ErrCnt := ErrCnt + 1;
      // Önce Ürünü Ekle
      
      TableEvrakHareket := TableHammaddeStokHareket;
      TableEvrakKaynak := TableHammaddeEvrakKaynak;
      ACnt := 1;
      if not ATableHareket.IsEmpty then
      begin
        while not ATableHareket.Eof do
        begin
          ACnt := ACnt + 1;
          if AUretimMiktar > 0 then
            AMiktar := ATableHareket.FieldByName('MIKTAR').AsFloat / ABaslikMiktar * AUretimMiktar
          else
            AMiktar := -99;
          if ATableHareket.FieldByName('MALTIP').AsInteger <> 5 then // Yan Ürün, Hammadde ve Hammadde Fireleri
          begin
            if not AddInDocumentItem(ATableHareket['SIRKETNO'], ATableHareket['EVRAKTIP'], ATableHareket['HESAPKOD'], ATableHareket['EVRAKNO'], ATableHareket['SIRANO'], AMiktar) then
              ErrCnt := ErrCnt + 1;
          end;
          DoOnProgress(1, AMax, ACnt);
          ATableHareket.Next;
        end;
        if ErrCnt > 0 then
        begin
          ShowError('Baðlantýsý yapýlamayan ' + IntToStr(ErrCnt) + ' adet kayýt var.' +
            #10+#13 + 'Son Hata Mesajý: ' + LastError);
        end;
      end;
    except on E:Exception do
        ShowError('Evrak baðlantýda sorun oluþtu, Hata: ' + E.Message);
    end;
  finally
    ATableHareket.EnableControls;
    ATableBaslik.EnableControls;
    EnableControls;
    DataControllerCommon.EvrakBaglanti.Enabled := False;
    dcEvrakUretim.AutoBOMExplosion := True;
  end;
end;

procedure TAppDataControllerEvrakUretimBaglanti.AddUretim;

  procedure AddUretimKart;
  begin
    if FTableBaglantiUretimKart.IsEmpty then
      Exit;
    if FTableUretimKart.IsEmpty then
      FTableUretimKart.Append
    else
      FTableUretimKart.Edit;

    FTableUretimKart.MamulKod := FTableMamulStokHareket.MalKod;
    FTableUretimKart.VersiyonNo := FTableMamulStokHareket.VersiyonNo;
    FTableUretimKart.Miktar := FTableMamulStokHareket.Miktar;

    FTableUretimKart.Post;
  end;

  procedure AddUretimRotaKaynak;
  begin
    FTableBaglantiUretimRotaKaynak.SetRange([FTableUretimRota.OperasyonNo], [FTableUretimRota.OperasyonNo]);
    FTableBaglantiUretimRotaKaynak.First;
    while not FTableBaglantiUretimRotaKaynak.Eof do
    begin
      FTableUretimRotaKaynak.Append;

      FTableUretimRotaKaynak.KaynakKod := FTableBaglantiUretimRotaKaynak.KaynakKod;
      FTableUretimRotaKaynak.KullanimSiraNo := FTableBaglantiUretimRotaKaynak.KullanimSiraNo;
      FTableUretimRotaKaynak.CalismaSure := FTableBaglantiUretimRotaKaynak.CalismaSure;
      FTableUretimRotaKaynak.KurulumSure := FTableBaglantiUretimRotaKaynak.KurulumSure;
      FTableUretimRotaKaynak.SokumSure := FTableBaglantiUretimRotaKaynak.SokumSure;
      FTableUretimRotaKaynak.Kullanilan := FTableBaglantiUretimRotaKaynak.Kullanilan;
      FTableUretimRotaKaynak.Post;

      FTableBaglantiUretimRotaKaynak.Next;
    end;
  end;

  procedure AddUretimRota;
  begin
    FTableBaglantiUretimRota.First;
    while not FTableBaglantiUretimRota.Eof do
    begin
      FTableUretimRota.Append;

      FTableUretimRota.MamulKod := FTableBaglantiUretimRota.MamulKod;
      FTableUretimRota.VersiyonNo := FTableBaglantiUretimRota.VersiyonNo;
      FTableUretimRota.Miktar := FTableBaglantiUretimRota.Miktar;
      FTableUretimRota.IsMerkezKod := FTableBaglantiUretimRota.IsMerkezKod;
      FTableUretimRota.OperasyonNo := FTableBaglantiUretimRota.OperasyonNo;
      FTableUretimRota.Aciklama := FTableBaglantiUretimRota.Aciklama;

      FTableUretimRota.Post;

      AddUretimRotaKaynak;

      FTableBaglantiUretimRota.Next;
    end;
  end;

begin
  AddUretimKart;
  AddUretimRota;
end;

constructor TAppDataControllerEvrakUretimBaglanti.Create(
  AOwner: TAppDataControllerEvrakIslem; AEvrakTip: Integer);
begin
  inherited;

  FTableBaglantiUretimKart := TTableUretimKart.Create(nil);
  FTableBaglantiUretimKart.Connection := AppSecurity.ConnectionApp;
  FTableBaglantiUretimKart.ReadOnly := True;

  FTableBaglantiUretimRota := TTableUretimRota.Create(nil);
  FTableBaglantiUretimRota.Connection := AppSecurity.ConnectionApp;
  FTableBaglantiUretimRota.ReadOnly := True;

  FTableBaglantiUretimRotaKaynak := TTableUretimRotaKaynak.Create(nil);
  FTableBaglantiUretimRotaKaynak.Connection := AppSecurity.ConnectionApp;
  FTableBaglantiUretimRotaKaynak.ReadOnly := True;
end;

destructor TAppDataControllerEvrakUretimBaglanti.Destroy;
begin
  FreeAndNil(FTableBaglantiUretimKart);
  FreeAndNil(FTableBaglantiUretimRota);
  FreeAndNil(FTableBaglantiUretimRotaKaynak);
  inherited;
end;

procedure TAppDataControllerEvrakUretimBaglanti.DisableControls;
begin
  // inherited; çalýþtýrma, dataset deðiþtiðinden dolayý sorun çýkýyor.
  FTableMamulStokHareket.DisableControls;
  FTableMamulEvrakKaynak.DisableControls;
  FTableHammaddeStokHareket.DisableControls;
  FTableHammaddeEvrakKaynak.DisableControls;
  FTableUretimKart.DisableControls;
  FTableUretimRota.DisableControls;
  FTableUretimRotaKaynak.DisableControls;
end;

procedure TAppDataControllerEvrakUretimBaglanti.EnableControls;
begin
  //inherited; açýklama yukarýda
  FTableMamulStokHareket.EnableControls;
  FTableMamulEvrakKaynak.EnableControls;
  FTableHammaddeStokHareket.EnableControls;
  FTableHammaddeEvrakKaynak.EnableControls;
  FTableUretimKart.EnableControls;
  FTableUretimRota.EnableControls;
  FTableUretimRotaKaynak.EnableControls;
end;

procedure TAppDataControllerEvrakUretimBaglanti.FetchDetail(AMalKod, AVersiyonNo: String; ASurumNo: Integer; AMiktar: Double);
var
  Src, Des: TTableStokHareket;
begin
  inherited;
  Des := TableEvrakHareket;
  Src := TableBaglantiHareket;
  Des.FiyatSekli := Src.FiyatSekli;
  Des.GirisCikis := Src.GirisCikis;
end;

procedure TAppDataControllerEvrakUretimBaglanti.OpenBaglantiUretim(ASirketNo: String;
  AEvrakTip: Integer; AHesapKod: String; AEvrakNo: String; ASiraNo: Integer);
  procedure OpenUretimKart;
  begin
    FTableBaglantiUretimKart.Close;
    FTableBaglantiUretimKart.TableItems.TableNames := 'URTKRT';
    with FTableBaglantiUretimKart.TableItems[0] do
    begin
      with Fields do
      begin
        Clear;
        Add('*');
      end;
      with Where do
      begin
        Clear;
        Add('SIRKETNO', wcEqual, ASirketNo);
        AddOperator(woAnd);
        Add('EVRAKTIP', wcEqual, AEvrakTip);
        AddOperator(woAnd);
        Add('HESAPKOD', wcEqual, AHesapKod);
        AddOperator(woAnd);
        Add('EVRAKNO', wcEqual, AEvrakNo);
        AddOperator(woAnd);
        Add('SIRANO', wcEqual, ASiraNo);
      end;
    end;
    if FTableBaglantiUretimKart.FieldCount = 0 then
      FTableBaglantiUretimKart.DoInitializeRecord;
    FTableBaglantiUretimKart.Open;
  end;

  procedure OpenUretimRota;
  begin
    FTableBaglantiUretimRota.Close;
    FTableBaglantiUretimRota.TableItems.TableNames := 'URTROT';
    with FTableBaglantiUretimRota.TableItems[0] do
    begin
      with Fields do
      begin
        Clear;
        Add('*');
      end;
      with Where do
      begin
        Clear;
        Add('SIRKETNO', wcEqual, ASirketNo);
        AddOperator(woAnd);
        Add('EVRAKTIP', wcEqual, AEvrakTip);
        AddOperator(woAnd);
        Add('EVRAKNO', wcEqual, AEvrakNo);
        AddOperator(woAnd);
        Add('URETIMSIRANO', wcEqual, ASiraNo);
      end;
    end;
    if FTableBaglantiUretimRota.FieldCount = 0 then
      FTableBaglantiUretimRota.DoInitializeRecord;
    FTableBaglantiUretimRota.Open;
  end;

  procedure OpenUretimRotaKaynak;
  begin
    FTableBaglantiUretimRotaKaynak.Close;
    FTableBaglantiUretimRotaKaynak.TableItems.TableNames := 'URTROK';
    with FTableBaglantiUretimRotaKaynak.TableItems[0] do
    begin
      with Fields do
      begin
        Clear;
        Add('*');
      end;
      with Where do
      begin
        Clear;
        Add('SIRKETNO', wcEqual, ASirketNo);
        AddOperator(woAnd);
        Add('EVRAKTIP', wcEqual, AEvrakTip);
        AddOperator(woAnd);
        Add('EVRAKNO', wcEqual, AEvrakNo);
        AddOperator(woAnd);
        Add('URETIMSIRANO', wcEqual, ASiraNo);
      end;
    end;
    if FTableBaglantiUretimRotaKaynak.FieldCount = 0 then
    begin
      FTableBaglantiUretimRotaKaynak.DoInitializeRecord;
      FTableBaglantiUretimRotaKaynak.IndexFieldNames := 'OPERASYONNO';
    end;
    FTableBaglantiUretimRotaKaynak.Open;
  end;
begin
  OpenUretimKart;
  OpenUretimRota;
  OpenUretimRotaKaynak;
end;

end.

