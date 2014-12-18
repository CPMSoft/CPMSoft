unit CPMApp_DataControllerEvrakUretim;

interface

uses Windows, Classes, SysUtils, DB, CPMApp_DataObject, CPMApp_DataObjectDB,
  CPMApp_Rule_ClientIncrement, CPMApp_DocObjectModel,
  CPMApp_TableStokSystem, CPMApp_TableBOMSystem, CPMApp_TableUretimSystem, CPMApp_TableMRPSystem,
  CPMApp_DataControllerCommon,
  CPMApp_DataControllerBOMTree, CPMApp_DataControllerStokHareketMulti,
  CPMApp_BOMConsts;

type
  TAppDataControllerEvrakUretim = class;

  TAppDataControllerEvrakUretimMessageEvent = procedure (Msg: String) of object;

  TAppRuleUretimNoSrcHareket = class(TAppTableRule)
  private
    FTable: TTableStokHareket;
    FDataController: TAppDataControllerEvrakUretim;
    procedure SetUretimNo;
    function CheckUretimNo(ASiraNo: Integer; AUretimNo, AMalKod, AVersiyonNo: String): Boolean;
    function GetUretimEvrakNo: String;
    procedure SetUretimEvrakNo(const Value: String);
    property UretimEvrakNo: String read GetUretimEvrakNo write SetUretimEvrakNo;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoBeforePost(Table: TAppCustomTable); override;
    procedure DoBeforeInsert(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDataControllerEvrakUretim);
  end;

  TAppRuleUretimSrcHareket = class(TAppTableRule)
  private
    FTableSrcStokHareket: TTableStokHareket;
    FTableDesStokHareket: TTableStokHareket;
    FTableSrcEvrakKaynak: TTableEvrakKaynak;
    FTableDesEvrakKaynak: TTableEvrakKaynak;
    FDataController: TAppDataControllerEvrakUretim;
    FTableCommand: TAppDBTable;
    FOldMalKod, FOldVersiyonNo, FOldDepoKod2: String;
    FOldSurumNo: Integer;
    FOldMiktar: Double;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
    procedure DoBeforeEdit(Table: TAppCustomTable); override;
    procedure DoBeforePost(Table: TAppCustomTable); override;
    procedure DoAfterPost(Table: TAppCustomTable); override;
    procedure DoAfterClose(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDataControllerEvrakUretim);
    destructor Destroy; override;
  end;

  TAppRuleUretimDesHareket = class(TAppTableRule)
  private
    FTableSrcStokHareket: TTableStokHareket;
    FTableDesStokHareket: TTableStokHareket;
    FDataController: TAppDataControllerEvrakUretim;
    FOldTutar: Double;
    FOldDovizTutar: Double;
    procedure UpdateSource;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoAfterPost(Table: TAppCustomTable); override;
    procedure DoBeforeEdit(Table: TAppCustomTable); override;
    procedure DoBeforePost(Table: TAppCustomTable); override;
    procedure DoBeforeDelete(Table: TAppCustomTable); override;
    procedure DoOnControlsEnable(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDataControllerEvrakUretim);
  end;

  TAppUretimParams = class
  private
    FDataController: TAppDataControllerEvrakUretim;
    FTableParams: TAppCustomTable;
    FTableUretimParams: TAppDBTable;
    FEvrakTip: Integer;
    FMultipleInstance: Integer;
    FKullaniciReceteKoru: Boolean;
    FAskedKullaniciReceteKoru: Boolean;
    function GetBaglantiIzin: Boolean;
    function GetReceteGuncellemeTip: Boolean;
    function GetKullaniciReceteKoru: Boolean;
    function GetIsUretim: Boolean;
    function GetIsUretimEmri: Boolean;

    procedure OpenUretimParams;
    procedure SetParams;
  public
    constructor Create(AOwner: TAppDataControllerEvrakUretim);
    destructor Destroy; override;
  published
    property TableParams: TAppCustomTable read FTableParams write FTableParams; // Üretim içinde kullanýlan sanal tablo
    property TableUretimParams: TAppDBTable read FTableUretimParams; // URTPRM Üretim Parametreleri Tablosu
    property BaglantiIzin: Boolean read GetBaglantiIzin;
    property ReceteGuncellemeTip: Boolean read GetReceteGuncellemeTip;
    property KullaniciReceteKoru: Boolean read GetKullaniciReceteKoru;
    property IsUretim: Boolean read GetIsUretim;
    property IsUretimEmri: Boolean read GetIsUretimEmri;
  end;

  TAppUretimKart = class
  private
    FDataController: TAppDataControllerEvrakUretim;
    FTable: TTableUretimKart;
    FTableStokHareket: TTableStokHareket;
    procedure DisableControls;
    procedure EnableControls;
    procedure Add;
    procedure Delete;
  public
    constructor Create(AOwner: TAppDataControllerEvrakUretim);
    destructor Destroy; override;
  end;

  TAppDataControllerEvrakUretim = class(TAppDataControllerCustomStokHareketMulti)
  private
    FIsAdding: Boolean;
    FSrcNeedTutarUpdate: Boolean;
    FNeedBOMExplosion: Boolean;
    FDataControllerCommon: TAppDataControllerCustomCommon;
    FBOMTree: TAppDataControllerBOMTree;
    FTableSrcStokHareket: TTableStokHareket;
    FTableDesStokHareket: TTableStokHareket;
    FTableSrcEvrakKaynak: TTableEvrakKaynak;
    FTableDesEvrakKaynak: TTableEvrakKaynak;
    FTableUretimKart: TTableUretimKart;
    FTableUretimRota: TTableUretimRota;
    FTableUretimRotaKaynak: TTableUretimRotaKaynak;
    FTableUretimRotaKaynakIslem: TTableUretimRotaKaynakIslem;
    FTableCloneDesStokHareket: TTableStokHareket;
    FTableUretimError: TTableMRPError;
    FRuleUretimSrc: TAppRuleUretimSrcHareket;
    FRuleUretimDes: TAppRuleUretimDesHareket;
    FRuleUretimNoSrc: TAppRuleUretimNoSrcHareket;
    FOnMessage: TAppDataControllerEvrakUretimMessageEvent;
    FIsUpdatingTutar: Boolean;
    FParams: TAppUretimParams;
    FUretimKart: TAppUretimKart;
    FChildError: TAppDocChild;
    FAutoBOMExplosion: Boolean;
    FLastOpNo: Smallint;
    FTableParam: TAppCustomTable;
    procedure BOMTreeOnReturn(BOMData: TAppBOMData);
    procedure BOMTreeOnReturnRoute(ROMData: TAppROMData);
    procedure BOMTreeOnReturnError(ErrClassName, ErrCode, ErrMessage: string; BOMData: TAppBOMData);
    procedure UpdateSourceTutar;
    procedure AddError(ErrCode, ErrMessage, AMalKod: String);
    procedure AddSatinAlmaError(AType: Smallint);
    procedure CheckDesBeforeAdd;
    procedure CheckDesAfterAdd;
    procedure DeleteError(SrcSiraNo: Integer);
    procedure SetTableParam(const Value: TAppCustomTable);
  protected
    procedure AllUpdateSourceTutar;
    function FindDes(SrcSiraNo: Integer): Boolean; override;
    procedure AddDes(SrcSiraNo: Integer); override;
    procedure DeleteDes(SrcSiraNo: Integer); override;
  public
    constructor Create(ADataControllerCommon: TAppDataControllerCustomCommon;
      AEvrakTip: Integer; ATableSrcStokHareket, ATableDesStokHareket: TTableStokHareket;
      ATableSrcEvrakKaynak, ATableDesEvrakKaynak: TTableEvrakKaynak;
      ATableUretimKart: TTableUretimKart; ATableUretimRota: TTableUretimRota;
      ATableUretimRotaKaynak: TTableUretimRotaKaynak; ATableUretimRotaKaynakIslem: TTableUretimRotaKaynakIslem;
      ATableUretimError: TTableMRPError; ATableOzelMamulKart: TTableOzelMamulKart); reintroduce;
    destructor Destroy; override;
    procedure DoMessage(Msg: String);
    procedure ExecBOMExplosion(SrcSiraNo: Integer);
    procedure RefreshBOMExplosion;
  published
    property BOMTree: TAppDataControllerBOMTree read FBOMTree;
    property Params: TAppUretimParams read FParams;
    property OnMessage: TAppDataControllerEvrakUretimMessageEvent read FOnMessage write FOnMessage;
    property ChildError: TAppDocChild read FChildError write FChildError;
    property AutoBOMExplosion: Boolean read FAutoBOMExplosion write FAutoBOMExplosion;
    property TableParam: TAppCustomTable read FTableParam write SetTableParam;
  end;

implementation

uses CPMApp_DocConsts, CPMApp_DocumentConsts,
  CPMApp_Math, CPMApp_Dialogs, CPMApp_TableItems;

{ TAppDataControllerEvrakUretim }

procedure TAppDataControllerEvrakUretim.ExecBOMExplosion(SrcSiraNo: Integer);
var
  A: Cardinal;
  I: Integer;
  OldIndex: String;
begin
  if FIsAdding then
    exit;
  A := GetTickCount;
  FIsAdding := True;
  try
    DeleteError(SrcSiraNo);
    FUretimKart.Delete;
    FUretimKart.Add;

    OldIndex := FTableDesStokHareket.IndexFieldNames;
    CheckDesBeforeAdd;
    for I := 0 to FTableUretimRota.MasterItems.Count - 1 do
    begin
      FTableUretimRota.MasterItems[I].RangeRule.Enabled := False;
      FTableUretimRota.MasterItems[I].FetchFieldsRule.Enabled := False;
    end;
    for I := 0 to FTableUretimRotaKaynak.MasterItems.Count - 1 do
    begin
      FTableUretimRotaKaynak.MasterItems[I].RangeRule.Enabled := False;
      FTableUretimRotaKaynak.MasterItems[I].FetchFieldsRule.Enabled := False;
    end;
    for I := 0 to FTableUretimRotaKaynakIslem.MasterItems.Count - 1 do
    begin
      FTableUretimRotaKaynakIslem.MasterItems[I].RangeRule.Enabled := False;
      FTableUretimRotaKaynakIslem.MasterItems[I].FetchFieldsRule.Enabled := False;
    end;
    try
      if Params.ReceteGuncellemeTip then
        FTableDesStokHareket.IndexFieldNames := 'SIRANO2;MALTIP;MALKOD;VERSIYONNO;STHURT_POZNO;STHURT_OPERASYONNO';
      FLastOpNo := 0;
      FBOMTree.Expand(FTableSrcStokHareket.MalKod, FTableSrcStokHareket.VersiyonNo, '', FTableSrcStokHareket.SurumNo, FTableSrcStokHareket.EvrakTarih, FTableSrcStokHareket.EvrakMiktar, FTableSrcStokHareket.EvrakBirim, FTableSrcStokHareket.DepoKod, FTableSrcStokHareket.DepoKod2, FTableSrcStokHareket.OzelReceteTip, FTableSrcStokHareket.SonKaynakEvrakTip, FTableSrcStokHareket.SonKaynakHesapKod, FTableSrcStokHareket.SonKaynakEvrakNo, FTableSrcStokHareket.SonKaynakSiraNo);
      if FTableSrcStokHareket.OperasyonNo <> FLastOpNo then
      begin
        FTableSrcStokHareket.Edit;
        FTableSrcStokHareket.OperasyonNo := FLastOpNo;
        FTableSrcStokHareket.Post;
      end;
    finally
      for I := 0 to FTableUretimRota.MasterItems.Count - 1 do
      begin
        FTableUretimRota.MasterItems[I].RangeRule.Enabled := True;
        FTableUretimRota.MasterItems[I].FetchFieldsRule.Enabled := True;
      end;
      for I := 0 to FTableUretimRotaKaynak.MasterItems.Count - 1 do
      begin
        FTableUretimRotaKaynak.MasterItems[I].RangeRule.Enabled := True;
        FTableUretimRotaKaynak.MasterItems[I].FetchFieldsRule.Enabled := True;
      end;
      for I := 0 to FTableUretimRotaKaynakIslem.MasterItems.Count - 1 do
      begin
        FTableUretimRotaKaynakIslem.MasterItems[I].RangeRule.Enabled := True;
        FTableUretimRotaKaynakIslem.MasterItems[I].FetchFieldsRule.Enabled := True;
      end;
      if FTableDesStokHareket.IndexFieldNames <> OldIndex then
        FTableDesStokHareket.IndexFieldNames := OldIndex;
      for I := 0 to FTableDesStokHareket.MasterItems.Count - 1 do
        FTableDesStokHareket.MasterItems[I].Range; // Master Items var ise Ýndex deðiþtirdiðim için Range bozuluyor, bununla geri düzeltiyorum.
      CheckDesAfterAdd;
    end;

    FTableDesStokHareket.First;
    UpdateSourceTutar;

    DoMessage('Üretim Eklendi.' + IntToStr(GetTickCount - A));
  finally
    FIsAdding := False;
  end;
end;

procedure TAppDataControllerEvrakUretim.AllUpdateSourceTutar;
var
  BI: Integer;
begin
  BI := FTableSrcStokHareket.CopyBookmark;
  try
    FTableSrcStokHareket.First;
    while not FTableSrcStokHareket.Eof do
    begin
      UpdateSourceTutar;
      FTableSrcStokHareket.Next;
    end;
  finally
    FTableSrcStokHareket.PasteBookmark(BI);
  end;
end;

procedure TAppDataControllerEvrakUretim.BOMTreeOnReturn(BOMData: TAppBOMData);
  procedure AddToStokHareket(AMalTip, AGirisCikis: Smallint; AMiktar: Double);
  var
    FdoAppend: Boolean;
    I: Integer;
  begin
    FdoAppend := True;
    if Params.ReceteGuncellemeTip then
      if FTableDesStokHareket.FindKey([FTableSrcStokHareket.SiraNo, AMalTip, BOMData.MalKod, BOMData.VersiyonNo, BOMData.PozNo, BOMData.OperasyonNo]) then
        FdoAppend := False;
    if FdoAppend then
    begin
      FTableDesStokHareket.Append;
      FTableDesStokHareket.SiraNo2 := FTableSrcStokHareket.SiraNo;

      FTableDesStokHareket.MalKod := BOMData.MalKod;
      FTableDesStokHareket.VersiyonNo := BOMData.VersiyonNo;
      FTableDesStokHareket.MalTip := AMalTip;
      if Params.FEvrakTip = aetTersUretim then
        FTableDesStokHareket.GirisCikis := Integer(not Boolean(AGirisCikis))
      else
        FTableDesStokHareket.GirisCikis := AGirisCikis;
      FTableDesStokHareket.ReceteNo := BOMData.ReceteNo;
      FTableDesStokHareket.RevizyonNo := BOMData.RevizyonNo;
      FTableDesStokHareket.ReceteSiraNo := BOMData.ReceteSiraNo;
      FTableDesStokHareket.PozNo := BOMData.PozNo;
      FTableDesStokHareket.YanUrunNo := BOMData.YanUrunNo;
      FTableDesStokHareket.YanUrunMaliyetOran := BOMData.YanUrunMaliyetOran;
      FTableDesStokHareket.OperasyonNo := BOMData.OperasyonNo;
      FTableDesStokHareket.KaynakIslemNo := BOMData.KaynakIslemNo;
      FTableDesStokHareket.SeriNo := BOMData.SeriNo; // Lot Kapat
      FTableDesStokHareket.SeriNo2 := BOMData.SeriNo2;
    end else
    begin
      FTableDesStokHareket.Edit;
      FTableDesStokHareket.KayitTur := 1;
    end;
    if FTableDesStokHareket.DepoKod <> BOMData.DepoKod then
      FTableDesStokHareket.DepoKod := BOMData.DepoKod;
    if FTableDesStokHareket.ReceteKaynakTip <> Integer(rktRecete) then
      FTableDesStokHareket.ReceteKaynakTip := Integer(rktRecete);
    if FTableDesStokHareket.Miktar <> AMiktar then
      FTableDesStokHareket.Miktar := AMiktar;

    for I := 0 to FBOMTree.MatchFields.FieldSrcList.Count - 1 do
      if Assigned(FBOMTree.MatchFields.FieldDesList.Objects[I]) then
        TField(FBOMTree.MatchFields.FieldDesList.Objects[I]).Value := BOMData.MatchValues[I];

    FTableDesStokHareket.Post;
  end;
begin
  if BOMData.SeviyeKod = 0 then
    Exit;
  if BOMData.KodUretim = 0 then
    Exit;
  if BOMData.MalTip = botCoProduct then // Yan Ürün
    AddToStokHareket(shmtYanUrun, gctGiris, BOMData.Miktar)
  else if (FBOMTree.Params.CalcScrap = 2) and (BOMData.FireMiktar > 0) then // Fire ayrý iþlem tipi ise
  begin
    AddToStokHareket(shmtHammadde, gctCikis, BOMData.Miktar - BOMData.FireMiktar); // Hammadde
    AddToStokHareket(shmtFire, gctCikis, BOMData.FireMiktar); // Fire
  end else
  begin
    AddToStokHareket(shmtHammadde, gctCikis, BOMData.Miktar); // Hammadde
  end;
end;

procedure TAppDataControllerEvrakUretim.BOMTreeOnReturnError(ErrClassName,
  ErrCode, ErrMessage: string; BOMData: TAppBOMData);
begin
  AddError(ErrCode, ErrMessage, BOMData.MalKod);
end;

procedure TAppDataControllerEvrakUretim.BOMTreeOnReturnRoute(
  ROMData: TAppROMData);
begin
  if ROMData.RotaTip = rotWorkCenter then // Rota, Operasyon, Ýþ Merkezi
  begin
    FTableUretimRota.Append;
    FTableUretimRota.SirketNo := FTableUretimKart.SirketNo;
    FTableUretimRota.EvrakTip := FTableUretimKart.EvrakTip;
    FTableUretimRota.UretimNo := FTableUretimKart.UretimNo;
    FTableUretimRota.EvrakNo := FTableUretimKart.EvrakNo;
    FTableUretimRota.UretimSiraNo := FTableUretimKart.SiraNo;
    FTableUretimRota.MamulKod := FTableUretimKart.MamulKod;
    FTableUretimRota.VersiyonNo := FTableUretimKart.VersiyonNo;
    FTableUretimRota.Miktar := FTableUretimKart.Miktar;
    FTableUretimRota.OperasyonNo := ROMData.OperasyonNo;
    FTableUretimRota.SonrakiOperasyonNo := ROMData.SonrakiOperasyonNo;
    FTableUretimRota.IsMerkezKod := ROMData.IsMerkezKod;
    FTableUretimRota.Aciklama := ROMData.Aciklama;
    FTableUretimRota.Post;
    if ROMData.SonrakiOperasyonNo = '' then
      FLastOpNo := ROMData.OperasyonNo;
  end
  else if ROMData.RotaTip = rotMachineCenter then // Kaynak
  begin
    FTableUretimRotaKaynak.Append;
    FTableUretimRotaKaynak.SirketNo := FTableUretimKart.SirketNo;
    FTableUretimRotaKaynak.EvrakTip := FTableUretimKart.EvrakTip;
    FTableUretimRotaKaynak.UretimNo := FTableUretimKart.UretimNo;
    FTableUretimRotaKaynak.EvrakNo := FTableUretimKart.EvrakNo;
    FTableUretimRotaKaynak.UretimSiraNo := FTableUretimKart.SiraNo;
    FTableUretimRotaKaynak.MamulKod := FTableUretimKart.MamulKod;
    FTableUretimRotaKaynak.VersiyonNo := FTableUretimKart.VersiyonNo;
    FTableUretimRotaKaynak.Miktar := FTableUretimKart.Miktar;
    FTableUretimRotaKaynak.OperasyonNo := ROMData.OperasyonNo;
    FTableUretimRotaKaynak.IsMerkezKod := ROMData.IsMerkezKod;
    FTableUretimRotaKaynak.KaynakKod := ROMData.KaynakKod;
    FTableUretimRotaKaynak.KullanimSiraNo := ROMData.SiraNo;
    FTableUretimRotaKaynak.CalismaSure := ROMData.CalismaSure;
    FTableUretimRotaKaynak.KurulumSure := ROMData.KurulumSure;
    FTableUretimRotaKaynak.SokumSure := ROMData.SokumSure;
    if ROMData.Kullanilan then
    begin
      FTableUretimRotaKaynak.Kullanilan := 1;
      FTableUretimRotaKaynak.OpDurum := odNone;
    end else
    begin
      FTableUretimRotaKaynak.Kullanilan := 0;
      FTableUretimRotaKaynak.OpDurum := odCanceled;
    end;
    FTableUretimRotaKaynak.Post;
  end
  else // if ROMData.RotaTip = rotMachineProcess then // Kaynak Ýþlem
  begin
    FTableUretimRotaKaynakIslem.Append;
    FTableUretimRotaKaynakIslem.SirketNo := FTableUretimKart.SirketNo;
    FTableUretimRotaKaynakIslem.EvrakTip := FTableUretimKart.EvrakTip;
    FTableUretimRotaKaynakIslem.UretimNo := FTableUretimKart.UretimNo;
    FTableUretimRotaKaynakIslem.EvrakNo := FTableUretimKart.EvrakNo;
    FTableUretimRotaKaynakIslem.UretimSiraNo := FTableUretimKart.SiraNo;
    FTableUretimRotaKaynakIslem.MamulKod := FTableUretimKart.MamulKod;
    FTableUretimRotaKaynakIslem.VersiyonNo := FTableUretimKart.VersiyonNo;

    FTableUretimRotaKaynakIslem.OperasyonNo := ROMData.OperasyonNo;
    FTableUretimRotaKaynakIslem.IsMerkezKod := ROMData.IsMerkezKod;
    FTableUretimRotaKaynakIslem.KaynakKod := ROMData.KaynakKod;
    FTableUretimRotaKaynakIslem.IslemNo := ROMData.SiraNo;
    FTableUretimRotaKaynakIslem.Aciklama := ROMData.Aciklama;
    FTableUretimRotaKaynakIslem.IslemTip := ROMData.IslemTip;
    FTableUretimRotaKaynakIslem.OperatorKod := ROMData.OperatorKod;

    FTableUretimRotaKaynakIslem.FieldByName('ONCEKIISLEMNO').AsString := ROMData.OncekiIslemNo;
    FTableUretimRotaKaynakIslem.FieldByName('ONCEKIISLEMDURUM').AsInteger := ROMData.OncekiIslemDurum;
    FTableUretimRotaKaynakIslem.FieldByName('EYLEMTIP').AsInteger := ROMData.EylemTip;

    FTableUretimRotaKaynakIslem.Post;
  end;
end;

constructor TAppDataControllerEvrakUretim.Create(
  ADataControllerCommon: TAppDataControllerCustomCommon; AEvrakTip: Integer;
  ATableSrcStokHareket, ATableDesStokHareket: TTableStokHareket;
  ATableSrcEvrakKaynak, ATableDesEvrakKaynak: TTableEvrakKaynak;
  ATableUretimKart: TTableUretimKart; ATableUretimRota: TTableUretimRota;
  ATableUretimRotaKaynak: TTableUretimRotaKaynak; ATableUretimRotaKaynakIslem: TTableUretimRotaKaynakIslem;
  ATableUretimError: TTableMRPError; ATableOzelMamulKart: TTableOzelMamulKart);
begin
  inherited Create(ADataControllerCommon, ATableSrcStokHareket, ATableDesStokHareket);
  FSrcNeedTutarUpdate := False;
  FAutoBOMExplosion := True;
  FNeedBOMExplosion := False;
  FDataControllerCommon := ADataControllerCommon;
  FTableSrcStokHareket := ATableSrcStokHareket;
  FTableDesStokHareket := ATableDesStokHareket;
  FTableSrcEvrakKaynak := ATableSrcEvrakKaynak;
  FTableDesEvrakKaynak := ATableDesEvrakKaynak;
  FTableUretimKart := ATableUretimKart;
  FTableUretimRota := ATableUretimRota;
  FTableUretimRotaKaynak := ATableUretimRotaKaynak;
  FTableUretimRotaKaynakIslem := ATableUretimRotaKaynakIslem;
  FTableUretimError := ATableUretimError;

  FBOMTree := TAppDataControllerBOMTree.Create;
  FBOMTree.dcLotKapat.TableStokHareket := FTableDesStokHareket;
  FBOMTree.OnReturn := BOMTreeOnReturn;
  FBOMTree.OnReturnRoute := BOMTreeOnReturnRoute;
  FBOMTree.OnReturnError := BOMTreeOnReturnError;
  FBOMTree.Params.SingleLevel := True;
  FBOMTree.Params.ReturnPhantom := False;
  FBOMTree.Params.ReturnRoute := True;
  FBOMTree.Params.ReturnProcess := True;
  FBOMTree.Params.LotKapat := True;
  FBOMTree.TableOzelMamulKart := ATableOzelMamulKart;
  FBOMTree.MatchFields.TableDes := ATableDesStokHareket;

  FRuleUretimSrc := TAppRuleUretimSrcHareket.Create(Self);
  FRuleUretimDes := TAppRuleUretimDesHareket.Create(Self);
  FRuleUretimNoSrc := TAppRuleUretimNoSrcHareket.Create(Self);

  FTableCloneDesStokHareket := TTableStokHareket.Create(nil);
  FTableDesStokHareket.AddClone(FTableCloneDesStokHareket);
  FTableCloneDesStokHareket.IndexFieldNames := 'SIRANO2';

  FParams := TAppUretimParams.Create(Self);
  FParams.FEvrakTip := AEvrakTip;
  FParams.SetParams;

  FUretimKart := TAppUretimKart.Create(Self);
end;

procedure TAppDataControllerEvrakUretim.DeleteDes(SrcSiraNo: Integer);
begin
  inherited;
  DeleteError(SrcSiraNo);
end;

procedure TAppDataControllerEvrakUretim.DeleteError(SrcSiraNo: Integer);
begin
  FTableUretimError.SetRange([SrcSiraNo],[SrcSiraNo]);
  FTableUretimError.First;
  while not FTableUretimError.Eof do
    FTableUretimError.Delete;
  FTableUretimError.CancelRange;
end;

procedure TAppDataControllerEvrakUretim.CheckDesBeforeAdd;
begin
  FParams.FAskedKullaniciReceteKoru := False;
  FTableDesStokHareket.First;
  while not FTableDesStokHareket.Eof do
  begin
    if (FTableDesStokHareket.ReceteKaynakTip = Integer(rktKullanici)) and FParams.KullaniciReceteKoru then
    begin
      FTableDesStokHareket.Next
    end
    else if FParams.ReceteGuncellemeTip then
    begin
      FTableDesStokHareket.Edit;
      FTableDesStokHareket.KayitTur := 0;
      FTableDesStokHareket.Post;
      FTableDesStokHareket.Next;
    end else
      FTableDesStokHareket.Delete
  end;
end;

procedure TAppDataControllerEvrakUretim.CheckDesAfterAdd;
begin
  if not Params.ReceteGuncellemeTip then
    Exit;
  FTableDesStokHareket.First;
  while not FTableDesStokHareket.Eof do
  begin
    if FTableDesStokHareket.KayitTur = 0 then
      FTableDesStokHareket.Delete
    else
      FTableDesStokHareket.Next;
  end;
end;

procedure TAppDataControllerEvrakUretim.AddDes(SrcSiraNo: Integer);
begin
  inherited;
  if not AutoBOMExplosion then
    Exit;
  if not FNeedBOMExplosion then
    Exit;
  ExecBOMExplosion(SrcSiraNo);
end;

procedure TAppDatacontrollerEvrakUretim.AddError(ErrCode, ErrMessage, AMalKod: String);
begin
  FTableUretimError.Insert;
  FTableUretimError.Kod := ErrCode;
  FTableUretimError.Aciklama := ErrMessage;
  FTableUretimError.MalKod := AMalKod;
  FTableUretimError.SiraNo2 := FTableSrcStokHareket.SiraNo;
  FTableUretimError.Post;
end;

procedure TAppDataControllerEvrakUretim.AddSatinAlmaError(AType: Smallint);
var
  Msg: String;
  OldMiktar: Double;
begin
  try
    OldMiktar := FTableDesStokHareket.fMiktar.OldValue;
  except on EConvertError do
    OldMiktar := -1;
  end;
  if AType = 0 then
    Msg := format('Birebir özel alýmý olan kayýt iptal edildi. Mamül Kodu: %s, Hammadde Kodu: %s, Alým No: %s, Miktar: %f',[FTableSrcStokHareket.MalKod, FTableDesStokHareket.MalKod, FTableDesStokHareket.AlimNo, OldMiktar])
  else begin
    Msg := format('Birebir özel alýmý olan kaydýn miktarý deðiþtirildi. Mamül Kodu: %s, Hammadde Kodu: %s, Alým No: %s, Eski Miktar: %f, Yeni Miktar: %f',[FTableSrcStokHareket.MalKod, FTableDesStokHareket.MalKod, FTableDesStokHareket.AlimNo, OldMiktar, FTableDesStokHareket.Miktar]);
  end;
  AddError('Satýnalma', Msg, FTableDesStokHareket.MalKod);
end;

destructor TAppDataControllerEvrakUretim.Destroy;
begin
  FreeAndNil(FBOMTree);
  FreeAndNil(FRuleUretimSrc);
  FreeAndNil(FRuleUretimDes);
  FreeAndNil(FRuleUretimNoSrc);
  FreeAndNil(FTableCloneDesStokHareket);
  FreeAndNil(FParams);
  FreeAndNil(FUretimKart);
  inherited;
end;

procedure TAppDataControllerEvrakUretim.DoMessage(Msg: String);
begin
  if Assigned(FOnMessage) then
    FOnMessage(Msg);
end;

function TAppDataControllerEvrakUretim.FindDes(SrcSiraNo: Integer): Boolean;
begin
  Result := FTableDesStokHareket.FindKey([SrcSiraNo]);
end;

procedure TAppDataControllerEvrakUretim.RefreshBOMExplosion;
var
  BI: Integer;
begin
  if FTableSrcStokHareket.IsEditMode then
    FTableSrcStokHareket.Post;
  if FTableSrcStokHareket.IsEmpty then
    exit;
  BI := FTableSrcStokHareket.CopyBookmark;
  FTableSrcStokHareket.DisableControls;
  FTableUretimError.DisableControls;
  try
    FParams.FAskedKullaniciReceteKoru := False;
    FTableSrcStokHareket.First;
    while not FTableSrcStokHareket.Eof do
    begin
      ExecBOMExplosion(FTableSrcStokHareket.SiraNo);
      FTableSrcStokHareket.Next;
    end;
    if not FTableUretimError.IsEmpty then
      if Assigned(ChildError) then
        ChildError.ShowChild;
  finally
    FTableUretimError.EnableControls;
    FTableSrcStokHareket.PasteBookmark(BI);
    FTableSrcStokHareket.EnableControls;
  end;
end;

procedure TAppDataControllerEvrakUretim.SetTableParam(
  const Value: TAppCustomTable);
begin
  FTableParam := Value;
  FBOMTree.MatchFields.TableParam := Value;
end;

procedure TAppDataControllerEvrakUretim.UpdateSourceTutar;
var
  vTutar, vDovizTutar, vToplam, vDovizToplam: Double;
  A: Cardinal;
  IsEdit: Boolean;
begin
  FIsUpdatingTutar := True;
  try
    A := GetTickCount;
    vToplam := 0; vDovizToplam := 0;
    FTableCloneDesStokHareket.SetRange([FTableSrcStokHareket.SiraNo], [FTableSrcStokHareket.SiraNo]);
    FTableCloneDesStokHareket.First;
    while not FTableCloneDesStokHareket.Eof do
    begin
      vTutar := FTableCloneDesStokHareket.Tutar;
      vDovizTutar := FDataControllerCommon.DovizKur.Convert(FTableSrcStokHareket.DovizCins, FTableSrcStokHareket.DovizTarih, FTableSrcStokHareket.Banka, FTableSrcStokHareket.DovizTip, FTableCloneDesStokHareket.DovizCins, FTableCloneDesStokHareket.DovizTutar);
      // Hammaddeleri topla, yan ürünleri çýkar
      if FTableCloneDesStokHareket.GirisCikis = 1 then
      begin
        vToplam := vToplam + vTutar;
        vDovizToplam := vDovizToplam + vDovizTutar;
      end else
      begin
        vToplam := vToplam - vTutar;
        vDovizToplam := vDovizToplam - vDovizTutar;
      end;
      FTableCloneDesStokHareket.Next;
    end;
    FSrcNeedTutarUpdate := False;
    vToplam := AppRoundMoney(vToplam);
    vDovizToplam := AppRoundMoney(vDovizToplam);
    if (FTableSrcStokHareket.Tutar <> vToplam) or (FTableSrcStokHareket.DovizTutar <> vDovizToplam) then
    begin
      IsEdit := FTableSrcStokHareket.IsEditMode;
      if not IsEdit then
        FTableSrcStokHareket.Edit;
      if FTableSrcStokHareket.Tutar <> vToplam then
        FTableSrcStokHareket.Tutar := vToplam;
      if FTableSrcStokHareket.DovizTutar <> vDovizToplam then
        FTableSrcStokHareket.DovizTutar := vDovizToplam;
      if vDovizToplam <> 0 then
        FTableSrcStokHareket.DovizKur := vToplam / vDovizToplam
      else
        FTableSrcStokHareket.DovizKur := 0;
      if not IsEdit then
        FTableSrcStokHareket.Post;
      DoMessage('Üretim Tutarý Güncellendi.' + IntToStr(GetTickCount - A));
    end;
  finally
    FIsUpdatingTutar := False;
  end;
end;

{ TAppRuleUretimDesHareket }

constructor TAppRuleUretimDesHareket.Create(
  AOwner: TAppDataControllerEvrakUretim);
begin
  inherited Create;
  FDataController := AOwner;
  FTableDesStokHareket := FDataController.FTableDesStokHareket;
  FTableDesStokHareket.DataEvents.AddRule(Self);
  FTableSrcStokHareket := FDataController.FTableSrcStokHareket;
end;

procedure TAppRuleUretimDesHareket.DoAfterPost(Table: TAppCustomTable);
begin
  if FDataController.FIsAdding then
    exit;
  if FTableDesStokHareket.ControlsDisabled then
    exit;
  if (not FTableSrcStokHareket.IsEditMode) and (FDataController.FSrcNeedTutarUpdate) then
    UpdateSource;
end;

procedure TAppRuleUretimDesHareket.DoBeforeDelete(Table: TAppCustomTable);
begin
  inherited;
  if (FTableDesStokHareket.AlimNo <> '') and (Table.UpdateStatus <> usInserted) then
    FDataController.AddSatinAlmaError(0);
end;

procedure TAppRuleUretimDesHareket.DoBeforeEdit(Table: TAppCustomTable);
begin
  FOldTutar := FTableDesStokHareket.Tutar;
  FOldDovizTutar := FTableDesStokHareket.DovizTutar;
end;

procedure TAppRuleUretimDesHareket.DoBeforePost(Table: TAppCustomTable);
var
  Err: Boolean;
begin
  if not (FTableDesStokHareket.MalTip in [6,7,8]) then // Yan Ürün, Hammadde veya Fire Seçilmemiþse
    FTableDesStokHareket.MalTip := 7; // Hammadde yap
  if Table.State = dsInsert then
    FDataController.FSrcNeedTutarUpdate := True
  else if Table.State = dsEdit then
    FDataController.FSrcNeedTutarUpdate := FDataController.FSrcNeedTutarUpdate or (FOldTutar <> FTableDesStokHareket.Tutar) or (FOldDovizTutar <> FTableDesStokHareket.DovizTutar);

  if (FTableDesStokHareket.AlimNo <> '') and (Table.UpdateStatus = usModified) then
  begin
    Err := (FTableDesStokHareket.fMiktar.Value <> FTableDesStokHareket.fMiktar.OldValue);
    if Err then
      FDataController.AddSatinAlmaError(1);
  end;
end;

procedure TAppRuleUretimDesHareket.DoOnControlsEnable(Table: TAppCustomTable);
begin
  if (not FTableSrcStokHareket.IsEditMode) and FDataController.FSrcNeedTutarUpdate then
    UpdateSource;
end;

procedure TAppRuleUretimDesHareket.DoOnNewRecord(Table: TAppCustomTable);
begin
  FTableDesStokHareket.DepoKod := FTableSrcStokHareket.DepoKod2;
end;

procedure TAppRuleUretimDesHareket.UpdateSource;
begin
  try
    FDataController.UpdateSourceTutar;
  finally
  end;
end;

{ TAppRuleUretimSrcHareket }

constructor TAppRuleUretimSrcHareket.Create(
  AOwner: TAppDataControllerEvrakUretim);
begin
  inherited Create;
  FDataController := AOwner;
  FTableSrcStokHareket := FDataController.FTableSrcStokHareket;
  FTableSrcStokHareket.DataEvents.AddRule(Self);
  FTableDesStokHareket := FDataController.FTableDesStokHareket;
  FTableSrcEvrakKaynak := FDataController.FTableSrcEvrakKaynak;
  FTableDesEvrakKaynak := FDataController.FTableDesEvrakKaynak;

  FTableCommand := TAppDBTable.Create(nil);
  FTableCommand.ReadOnly := True;
  FTableCommand.Connection := FDataController.FTableSrcStokHareket.Connection;
end;

destructor TAppRuleUretimSrcHareket.Destroy;
begin
  FreeAndNil(FTableCommand);
  inherited;
end;

procedure TAppRuleUretimSrcHareket.DoAfterClose(Table: TAppCustomTable);
begin
  inherited;
  if FDataController.FTableUretimError.Active then
    FDataController.FTableUretimError.EmptyTable;
end;

procedure TAppRuleUretimSrcHareket.DoAfterPost(Table: TAppCustomTable);
begin
  if (not FDataController.FIsUpdatingTutar) and FDataController.FSrcNeedTutarUpdate then
    FDataController.UpdateSourceTutar;
end;

procedure TAppRuleUretimSrcHareket.DoBeforeEdit(Table: TAppCustomTable);
begin
  FOldMalKod := FTableSrcStokHareket.MalKod;
  FOldVersiyonNo := FTableSrcStokHareket.VersiyonNo;
  FOldSurumNo := FTableSrcStokHareket.SurumNo;
  FOldDepoKod2 := FTableSrcStokHareket.DepoKod2;
  FOldMiktar := FTableSrcStokHareket.Miktar;
  FDataController.DoMessage('');
end;

procedure TAppRuleUretimSrcHareket.DoBeforePost(Table: TAppCustomTable);
begin
  if FTableSrcStokHareket.MalTip <> 5 then
    FTableSrcStokHareket.MalTip := 5; // Ürün

  if FDataController.FIsAdding then
    Exit;

  if Table.State = dsInsert then
    FDataController.FNeedBOMExplosion := True
  else if Table.State = dsEdit then
  begin
    FDataController.FNeedBOMExplosion := (FOldMalKod <> FTableSrcStokHareket.MalKod) or (FOldVersiyonNo <> FTableSrcStokHareket.VersiyonNo) or (FOldSurumNo <> FTableSrcStokHareket.SurumNo) or (FOldMiktar <> FTableSrcStokHareket.Miktar) or (FOldDepoKod2 <> FTableSrcStokHareket.DepoKod2);
    if FDataController.FNeedBOMExplosion then // Üretimi etkileyen alan deðiþti.
    begin
      if FTableSrcStokHareket.SonKaynakEvrakTip = aetUretimSiparis then // Baðlantýlý üretim ise
      begin
        FDataController.FNeedBOMExplosion := False;
        if not FDataController.FParams.BaglantiIzin then
          raise Exception.Create('Baðlantýlý üretim var. Üretimi etkileyen alan deðiþti.' + #10 + #13 + 'Deðiþiklik yapmak için silip tekrardan baðlantý yapýnýz!');
      end;
    end;
  end;
end;

procedure TAppRuleUretimSrcHareket.DoOnFieldChanged(Table: TAppCustomTable; Field: TField);

  function FindDepo(AHesapKod, AMamulKod: String; ASurumNo: Integer; AVersiyonNo: String;
    var AMamulDepoKod, AHammaddeDepoKod: String): Boolean;
  begin
    Result := False;
    if not (SameText(AHesapKod, 'GENEL') or SameText(AHesapKod, '')) then
    begin
      FTableCommand.Close;
      FTableCommand.TableItems.TableNames := 'STKHMK';
      with FTableCommand.TableItems[0].Fields do
      begin
        Clear;
        Add('DEPOKOD');
        Add('HAMMADDEDEPOKOD');
      end;
      with FTableCommand.TableItems[0].Where do
      begin
        Clear;
        Add('HESAPKOD', wcEqual, AHesapKod);
        AddOperator(woAnd);
        Add('MALKOD', wcEqual, AMamulKod);
        AddOperator(woAnd);
        Add('VERSIYONNO', wcEqual, AVersiyonNo);
        AddOperator(woAnd);
        Add('DEPOKOD', wcNotEqual, '');
      end;
      FTableCommand.Open;
      Result := not FTableCommand.IsEmpty;
      if Result then
      begin
        AMamulDepoKod := FTableCommand.Fields[0].AsString;
        AHammaddeDepoKod := FTableCommand.Fields[1].AsString;
      end;
    end;
    if not Result then
    begin
      FTableCommand.Close;
      FTableCommand.TableItems.TableNames := 'MAMBAS';
      with FTableCommand.TableItems[0].Fields do
      begin
        Clear;
        Add('MAMULDEPOKOD');
        Add('HAMMADDEDEPOKOD');
      end;
      with FTableCommand.TableItems[0].Where do
      begin
        Clear;
        Add('MAMULKOD', wcEqual, AMamulKod);
        AddOperator(woAnd);
        Add('VERSIYONNO', wcEqual, AVersiyonNo);
        AddOperator(woAnd);
        Add('SURUMNO', wcEqual, ASurumNo);
      end;
      FTableCommand.Open;
      Result := not FTableCommand.IsEmpty;
      if Result then
      begin
        AMamulDepoKod := FTableCommand.Fields[0].AsString;
        AHammaddeDepoKod := FTableCommand.Fields[1].AsString;
      end;
    end;
  end;

var
  AMamulDepoKod, AHammaddeDepoKod: String;
begin
  if (Field = FTableSrcStokHareket.fHesapKod) or (Field = FTableSrcStokHareket.fMalKod) or (Field = FTableSrcStokHareket.fVersiyonNo) or (Field = FTableSrcStokHareket.fSurumNo) then
  begin
    if FTableSrcStokHareket.MalKod <> '' then
    begin
      if FindDepo(FTableSrcStokHareket.HesapKod, FTableSrcStokHareket.MalKod, FTableSrcStokHareket.SurumNo, FTableSrcStokHareket.VersiyonNo, AMamulDepoKod, AHammaddeDepoKod) then
      begin
        FTableSrcStokHareket.DepoKod := AMamulDepoKod;
        FTableSrcStokHareket.DepoKod2 := AHammaddeDepoKod;
      end;
    end;
  end;
end;

procedure TAppRuleUretimSrcHareket.DoOnNewRecord(Table: TAppCustomTable);
begin
  FDataController.DoMessage('');
end;

{ TAppRuleUretimNoSrcHareket }

function TAppRuleUretimNoSrcHareket.CheckUretimNo(ASiraNo: Integer;
  AUretimNo, AMalKod, AVersiyonNo: String): Boolean;
var
  ATable: TTableStokHareket;
begin
  ATable := TTableStokHareket(FTable.Clone);
  ATable.First;
  Result := False;
  while not ATable.Eof do
  begin
    if ASiraNo <> ATable.SiraNo then
    begin
      if FDataController.FParams.IsUretim then
      begin
{
        Üretim Kart da Seri Kart mantýðýnda yapýlmadýðýndan çoklu giriþ için yapý uygun deðil
        if FDataController.FParams.FMultipleInstance = 1 then
        begin
          if AUretimNo = ATable.IrsaliyeNo then
            exit
        end
        else if FDataController.FParams.FMultipleInstance = 2 then
        begin
          if (AUretimNo = ATable.IrsaliyeNo) and ((AMalKod <> ATable.MalKod) or (AVersiyonNo <> ATable.VersiyonNo)) then
            exit
        end;
}
        if AUretimNo = ATable.IrsaliyeNo then
          exit
      end
      else if FDataController.FParams.IsUretimEmri then
      begin
{
        Üretim Kart da Seri Kart mantýðýnda yapýlmadýðýndan çoklu giriþ için yapý uygun deðil
        if FDataController.FParams.FMultipleInstance = 1 then
        begin
          if AUretimNo = ATable.SiparisNo then
            exit
        end
        else if FDataController.FParams.FMultipleInstance = 2 then
        begin
          if (AUretimNo = ATable.SiparisNo) and ((AMalKod <> ATable.MalKod) or (AVersiyonNo <> ATable.VersiyonNo)) then
            exit
        end;
}
        if AUretimNo = ATable.SiparisNo then
          exit
      end;
    end;
    ATable.Next;
  end;
  Result := True;
end;

constructor TAppRuleUretimNoSrcHareket.Create(
  AOwner: TAppDataControllerEvrakUretim);
begin
  inherited Create;
  FDataController := AOwner;
  FTable := FDataController.FTableSrcStokHareket;
  FTable.DataEvents.AddFirstRule(Self);
end;

procedure TAppRuleUretimNoSrcHareket.DoBeforeInsert(Table: TAppCustomTable);
begin
  if (FTable.RecordCount >= 1) and (FDataController.FParams.FMultipleInstance = 0) then
    raise Exception.Create('Üretim Parametreleri Ayarlarýndan dolayý Birden fazla giriþ yapamazsýnýz!');
end;

procedure TAppRuleUretimNoSrcHareket.DoBeforePost(Table: TAppCustomTable);
begin
  if FDataController.Params.IsUretimEmri then
    FTable.SiparisTarih := FTable.EvrakTarih
  else
    FTable.IrsaliyeTarih := FTable.EvrakTarih;
  SetUretimNo;
  if not CheckUretimNo(FTable.SiraNo, UretimEvrakNo, FTable.MalKod, FTable.VersiyonNo) then
    AppShowMessage('Birden fazla ayný üretim serisi ile giriþ yapamazsýnýz!');
end;

procedure TAppRuleUretimNoSrcHareket.DoOnNewRecord(Table: TAppCustomTable);
begin
  SetUretimNo;
end;

function TAppRuleUretimNoSrcHareket.GetUretimEvrakNo: String;
begin
  if FDataController.FParams.IsUretim then
    Result := FTable.IrsaliyeNo
  else if FDataController.FParams.IsUretimEmri then
    Result := FTable.SiparisNo
  else
    raise exception.Create('Üretim Tipi Bulunamadý!');
end;

procedure TAppRuleUretimNoSrcHareket.SetUretimEvrakNo(const Value: String);
begin
  if FDataController.FParams.IsUretim then
    FTable.IrsaliyeNo := Value
  else if FDataController.FParams.IsUretimEmri then
    FTable.SiparisNo := Value
  else
    raise exception.Create('Üretim Tipi Bulunamadý!');
end;

procedure TAppRuleUretimNoSrcHareket.SetUretimNo;
begin
  if FDataController.FParams.FMultipleInstance = 0 then
  begin
    if UretimEvrakNo <> FTable.EvrakNo then
      UretimEvrakNo := FTable.EvrakNo;
  end;
end;

{ TAppUretimParams }

constructor TAppUretimParams.Create(AOwner: TAppDataControllerEvrakUretim);
begin
  inherited Create;
  FDataController := AOwner;
  FTableUretimParams := TAppDBTable.Create(nil);
  FTableUretimParams.ReadOnly := True;
  FTableUretimParams.Connection := FDataController.FTableSrcStokHareket.Connection;
end;

destructor TAppUretimParams.Destroy;
begin
  FreeAndNil(FTableUretimParams);
  inherited;
end;

function TAppUretimParams.GetIsUretim: Boolean;
begin
  Result := (FEvrakTip = aetUretim) or (FEvrakTip = aetTersUretim)
end;

function TAppUretimParams.GetIsUretimEmri: Boolean;
begin
  Result := FEvrakTip = aetUretimSiparis;
end;

function TAppUretimParams.GetBaglantiIzin: Boolean;
begin
  Result := Boolean(FTableParams.Fields[0].AsInteger);
end;

function TAppUretimParams.GetReceteGuncellemeTip: Boolean;
begin
  Result := Boolean(FTableParams.Fields[1].AsInteger);
  if Result then
    if FDataController.FBOMTree.Params.LotKapat then // Lot Kapatda Kontrollü Güncelleme Yapamýyorum, stok deðiþebileceði için farklý lotlar gelebilir
    begin
      AppShowMessage('Lot Kapat seçili iken "sadece deðiþenleri güncelle" yapýlamaz!. Reçete tamamen yenilenecek.');
      Result := False;
    end
  else
end;

function TAppUretimParams.GetKullaniciReceteKoru: Boolean;
begin
  Result := False;
  if FTableParams.Fields[2].AsInteger = 1 then
    Result := True
  else if FTableParams.Fields[2].AsInteger = 2 then
  begin
    if not FAskedKullaniciReceteKoru then
    begin
      FKullaniciReceteKoru := AppConfirm('Kullanýcý Reçetelerini Koru?');
      FAskedKullaniciReceteKoru := True;
    end;
    Result := FKullaniciReceteKoru;
  end;
end;

procedure TAppUretimParams.OpenUretimParams;
begin
  if FTableUretimParams.Active then
    exit;
  FTableUretimParams.Close;
  FTableUretimParams.TableItems.TableNames := 'URTPRM';
  FTableUretimParams.TableItems[0].Fields.FieldNames := '*';
  FTableUretimParams.Open;
end;

procedure TAppUretimParams.SetParams;
begin
  OpenUretimParams;
  if IsUretimEmri then
  begin
    FDataController.FBOMTree.Params.LotKapat := FTableUretimParams.FieldByName('SIPARISSERINOKAPAT').AsInteger = 1;
    FMultipleInstance := FTableUretimParams.FieldByName('SIPARISTIP').AsInteger;
  end
  else if IsUretim then
  begin
    FDataController.FBOMTree.Params.LotKapat := FTableUretimParams.FieldByName('URETIMSERINOKAPAT').AsInteger = 1;
    FMultipleInstance := FTableUretimParams.FieldByName('URETIMTIP').AsInteger;
  end;

  FDataController.FBOMTree.Params.CalcScrap := FTableUretimParams.FieldByName('FIREHESAPLA').AsInteger;
  FDataController.FBOMTree.Params.Round := FTableUretimParams.FieldByName('YUVARLA').AsInteger = 1;
  FDataController.FBOMTree.Params.KullanimGrupNo := FTableUretimParams.FieldByName('KULLANIMGRUPNO').AsInteger;
end;

{ TAppUretimKart }

procedure TAppUretimKart.Add;
begin
  DisableControls;
  try
    if FTable.IsEditMode then
      FTable.Post;
    if not FTable.IsEmpty then
      raise exception.Create('Üretim Kartý zaten var birden fazla açýlamaz! Hataya neden olabilir, üretici firmaya haber verin!');
    FTable.Append;
    FTable.MamulKod := FTableStokHareket.MalKod;
    FTable.VersiyonNo := FTableStokHareket.VersiyonNo;
    FTable.SurumNo := FTableStokHareket.SurumNo;
    FTable.Miktar := FTableStokHareket.Miktar;
    FTable.Post;
  finally
    EnableControls;
  end;
end;

constructor TAppUretimKart.Create(AOwner: TAppDataControllerEvrakUretim);
begin
  inherited Create;
  FDataController := AOwner;
  FTable := FDataController.FTableUretimKart;
  FTableStokHareket := FDataController.FTableSrcStokHareket;
end;

procedure TAppUretimKart.Delete;
begin
  FTable.First;
  if not FTable.IsEmpty then
    FTable.Delete;
end;

destructor TAppUretimKart.Destroy;
begin

  inherited;
end;

procedure TAppUretimKart.DisableControls;
begin
  FTable.DisableControls;
end;

procedure TAppUretimKart.EnableControls;
begin
  FTable.EnableControls;
end;

end.
