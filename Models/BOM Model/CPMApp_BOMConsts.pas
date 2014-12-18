unit CPMApp_BOMConsts;

interface

uses SysUtils,
  CPMApp_Images, CPMApp_Date;

type
  // Manufacturing Types
  TAppMaliyetTip = (mtNone, mtFiyat, mtStandart, mtFIFO, mtLIFO, mtBasitOrtalama, mtNone1, mtNone2, mtNone3, mtYABO);
  TAppMamulAgacTip = (matProduct, matWorkCenter, matRowMaterial, matCoProduct, matPhantomAssembly, matMachineCenter, matMachineProcess);
  TAppBOMType = (botProduct, botRowMaterial, botCoProduct, botPhantomAssembly);
  TAppROMType = (rotWorkCenter, rotMachineCenter, rotMachineProcess);

  // MRP Types
  TAppMRPType = (
                mrptNone, mrptMaterialRequirementsPlanning, mrptReorderPointPlanning,
                mrptForecastBasedPlanning, mrptGrossRequirementsPlanning
                );

  TAppTeminType = (ttNone, ttOrder, ttLotForLot, ttFixedLotSize, ttFixedLotSizeWithSplit, ttRepUpToMaxStock);
  TAppTeminYontem = (tyExternal, tyInternal, tyBoth, tyUnkown, tyPhantom);
  TAppTeminOzelYontem = (toyNone, toyFason, toyKonsinye, toyTransfer);
  TAppMRPReqType = (mrprtNone, mrprtStok, mrprtSiparis, mrprtMinStok, mrprtTahmini, mrprtBagimli, mrprtFason, mrprtKonsinye, mrprtTransfer);
  TAppEylemPlanType = (eptNone, eptYeni, eptMiktarDegistir, eptTarihDegistir, eptMiktarTarihDegistir, eptIptal);

  // Genel Types
  TAppMRPAreaType = (mrpatNone, mrpatFabrika, mrpatDepo, mrpatFason);
  TAppCariHesapTip = (chtGenel, chtMusteri, chtTedarikci, chtKasa, chtBanka, chtGiderYer, chtSevkYer, chtBankaKrediKart, chtZimmetYer, chtUretimHat);
  TAppDayType = (dtCalendarDays, dtWorkDays, dtStandartDays);

  TAppReceteKaynakTip = (rktKullanici, rktRecete, rktBaglanti, rktAutoBaglantiIleri, rktAutoBaglantiGeri);
  TAppReceteGuncellemeTip = (rgtRefreshAll, rgtOnlyUpdated);
  TAppOzelReceteTip = (ortNone, ortOzelRecete, ortParcaDegisim);

  TAppUretimDurum = (udPlanned, udFirmPlanned, udReleased, udFinished);
  TAppUretimDurumUpdateType = (udutNone, udutForward, udutBackward);
  TAppSarfYontem = (syManual, syForward, syBackward, syPickAndForward, syPickAndBackward);
  TAppMekanikSarfYontem = (msyManual, msyForward, msyBackward);
  TAppOpType = (otNone, otBackward, otForward);
  TAppOpUpdateStatus = (ousNone, ousUpdate, ousInsert, ousDelete);

  TAppBOMDocGroup = (odgUretimKurulum);

  TAppBOMDocClass =
  (
    odcUndefined,
    odcDOPIsMerkezKart,
    odcDOPMamulKart,
    odcDOPMamulKullanimKart,
    odcDOPMRPParametreKart,
    odcDOPStokKarsilamaPolitika,
    odcDOPUretimDurusKart,
    odcDOPUretimHataKart,
    odcDOPUretimKaynakKart,
    odcDOPUretimParametreKart,
    odcDOPUretimTakvimKart,
    odcDOPUretimVardiyaKart,
    odcDOPUretimYilKart
  );

  TAppBOMDocType =
  (
    odtUndefined,
    odtIsMerkezKart,
    odtMamulKart,
    odtMamulKullanimKart,
    odtMRPParametreKart,
    odtStokKarsilamaPolitika,
    odtUretimDurusKart,
    odtUretimHataKart,
    odtUretimKaynakKart,
    odtUretimParametreKart,
    odtUretimTakvimKart,
    odtUretimVardiyaKart,
    odtUretimYilKart
  );

  TAppBOMConsts = class
  public
    // For Standart Use
    function DocClass(DocType: TAppBOMDocType): TAppBOMDocClass;
    function DocGroup(DocType: TAppBOMDocType): TAppBOMDocGroup;

    function AppName(DocType: TAppBOMDocType; const FormType: Smallint = 0): String;
    function SecName(DocType: TAppBOMDocType; const FormType: Smallint = 0): String;
    function BtnName(DocType: TAppBOMDocType; const FormType: Smallint = 0): String;
    function Caption(DocType: TAppBOMDocType): String;
    function Category(DocType: TAppBOMDocType): String;
    function Image(DocType: TAppBOMDocType): TAppImage;

    function GroupName(DocGroup: TAppBOMDocGroup): String;
    function GroupSubName(DocGroup: TAppBOMDocGroup): String;
    function GroupCaption(DocGroup: TAppBOMDocGroup): String;
    function GroupCategory(DocGroup: TAppBOMDocGroup): String;
    function GroupImage(DocGroup: TAppBOMDocGroup): TAppImage;
  end;

const
  mksHammadde: Integer = -1;

  // Operasyon Durumlarý
  odNone: Smallint = 0;
  odReleased: Smallint = 1;
  odStarted: Smallint = 10;
  odFinished: Smallint = 20;
  odCanceled: Smallint = 30;
  odPaused: Smallint = 40;

  // Üretim Veri Giriþ Malzeme Durumlarý
//  odStartToPause: Smallint = 100;
//  odNoneToPause: Smallint = 110;
//  odPauseToNone: Smallint = 0;
//  odPauseToStart: SmallInt = 10;

  otKurulum: SmallInt = 1;
  otCalisma: SmallInt = 2;
  otSokum: SmallInt = 3;

  // Giriþ - Çýkýþ
  gcGiris: SmallInt = 0;
  gcCikis: SmallInt = 1;

  // Ýþ Emri Seçim Parametresi - Üretim Terminal Kart
  iesManual: SmallInt = 0;
  iesOtomatik: SmallInt = 1;

function AppBOMConsts: TAppBOMConsts;
function GetMRPSchedulingType(MRPType: TAppMRPType): TAppSchedulingType;
function GetMamulAgacTip(AMalTip: TAppBOMType): TAppMamulAgacTip; overload;
function GetMamulAgacTip(ARotaTip: TAppROMType): TAppMamulAgacTip; overload;
function AppUretimDurumUpdateType(OldUretimDurum, NewUretimDurum: TAppUretimDurum): TAppUretimDurumUpdateType;

implementation

uses CPMApp_StrUtils, CPMApp_BOMStrs;

var
  FAppBOMConsts: TAppBOMConsts;

function AppBOMConsts: TAppBOMConsts;
begin
  if not Assigned(FAppBOMConsts) then
    FAppBOMConsts := TAppBOMConsts.Create;
  Result := FAppBOMConsts;
end;

function GetMRPSchedulingType(MRPType: TAppMRPType): TAppSchedulingType;
begin
  if MRPType in [mrptMaterialRequirementsPlanning, mrptForecastBasedPlanning] then
    Result := schBackward
  else if MRPType in [mrptReorderPointPlanning] then
    Result := schForward
  else
    Result := schNone;
end;

function GetMamulAgacTip(AMalTip: TAppBOMType): TAppMamulAgacTip; overload;
begin
  case AMalTip of
    botProduct: Result := matProduct;
    botRowMaterial: Result := matRowMaterial;
    botCoProduct: Result := matCoProduct;
    botPhantomAssembly: Result := matPhantomAssembly;
    else Result := matRowMaterial;
  end;
end;

function GetMamulAgacTip(ARotaTip: TAppROMType): TAppMamulAgacTip; overload;
begin
  case ARotaTip of
    rotWorkCenter: Result := matWorkCenter;
    rotMachineCenter: Result := matMachineCenter;
    else Result := matMachineProcess;
  end;
end;

function AppUretimDurumUpdateType(OldUretimDurum, NewUretimDurum: TAppUretimDurum): TAppUretimDurumUpdateType;
begin
  if OldUretimDurum = udPlanned then
  begin
    if NewUretimDurum in [udFirmPlanned, udReleased] then
      Result := udutForward
    else
      Result := udutNone;
  end
  else if OldUretimDurum = udFirmPlanned then
  begin
    if NewUretimDurum = udPlanned then
      Result := udutBackward
    else if NewUretimDurum = udReleased then
      Result := udutForward
    else
      Result := udutNone;
  end
  else if OldUretimDurum = udReleased then
  begin
    if NewUretimDurum in [udPlanned, udFirmPlanned] then
      Result := udutBackward
    else if NewUretimDurum = udFinished then
      Result := udutForward
    else
      Result := udutNone;
  end
  else if OldUretimDurum = udFinished then
  begin
    if NewUretimDurum in [udReleased] then
      Result := udutBackward
    else
      Result := udutNone;
  end else
    Result := udutNone;
end;

{ TAppBOMConsts }

function TAppBOMConsts.DocClass(DocType: TAppBOMDocType): TAppBOMDocClass;
begin
  case DocType of
    odtIsMerkezKart: Result := odcDOPIsMerkezKart;
    odtMamulKart: Result := odcDOPMamulKart;
    odtMamulKullanimKart: Result := odcDOPMamulKullanimKart;
    odtMRPParametreKart: Result := odcDOPMRPParametreKart;
    odtStokKarsilamaPolitika: Result := odcDOPStokKarsilamaPolitika;
    odtUretimDurusKart: Result := odcDOPUretimDurusKart;
    odtUretimHataKart: Result := odcDOPUretimHataKart;
    odtUretimKaynakKart: Result := odcDOPUretimKaynakKart;
    odtUretimParametreKart: Result := odcDOPUretimParametreKart;
    odtUretimTakvimKart: Result := odcDOPUretimTakvimKart;
    odtUretimVardiyaKart: Result := odcDOPUretimVardiyaKart;
    odtUretimYilKart: Result := odcDOPUretimYilKart;
    else Result := odcUndefined;
  end;
end;

function TAppBOMConsts.DocGroup(DocType: TAppBOMDocType): TAppBOMDocGroup;
begin
  Result := odgUretimKurulum;
end;

function TAppBOMConsts.AppName(DocType: TAppBOMDocType; const FormType: Smallint): String;
begin
  case DocType of
    odtIsMerkezKart: Result := 'DOPURETIMISMERKEZKART';
    odtMamulKart: Result := 'DOPMAMULKART';
    odtMamulKullanimKart: Result := 'DOPMAMULKULLANIMKART';
    odtMRPParametreKart: Result := 'DOPMRPPARAMETREKART';
    odtStokKarsilamaPolitika: Result := 'DOPSTOKKARSILAMAPOLITIKA';
    odtUretimDurusKart: Result := 'DOPURETIMDURUSKART';
    odtUretimHataKart: Result := 'DOPURETIMHATAKART';
    odtUretimKaynakKart: Result := 'DOPURETIMKAYNAKKART';
    odtUretimParametreKart: Result := 'DOPURETIMPARAMETREKART';
    odtUretimTakvimKart: Result := 'DOPURETIMTAKVIMKART';
    odtUretimVardiyaKart: Result := 'DOPURETIMVARDIYAKART';
    odtUretimYilKart: Result := 'DOPURETIMYILKART';
    else Result := '';
  end;
  if FormType > 0 then
    Result := Result + '_' + IntToStr(FormType);
end;

function TAppBOMConsts.SecName(DocType: TAppBOMDocType; const FormType: Smallint = 0): String;
begin
  Result := AppName(DocType, FormType);
end;

function TAppBOMConsts.BtnName(DocType: TAppBOMDocType; const FormType: Smallint = 0): String;
begin
  case DocType of
    odtIsMerkezKart: Result := 'btIsMerkezKart';
    odtMamulKart: Result := 'btMamulKart';
    odtMamulKullanimKart: Result := 'btMamulKullanimKart';
    odtMRPParametreKart: Result := 'btMRPParametreKart';
    odtStokKarsilamaPolitika: Result := 'btStokKarsilamaPolitika';
    odtUretimDurusKart: Result := 'btUretimDurusKart';
    odtUretimHataKart: Result := 'btUretimHataKart';
    odtUretimKaynakKart: Result := 'btUretimKaynakKart';
    odtUretimParametreKart: Result := 'btUretimParametreKart';
    odtUretimTakvimKart: Result := 'btUretimTakvimKart';
    odtUretimVardiyaKart: Result := 'btUretimVardiyaKart';
    odtUretimYilKart: Result := 'btUretimYilKart';
    else Result := '';
  end;
  if FormType > 0 then
    Result := Result + '_' + IntToStr(FormType);
end;

function TAppBOMConsts.Caption(DocType: TAppBOMDocType): String;
begin
  case DocType of
    odtIsMerkezKart: Result := AppGetRS(@AppIsMerkezKart);
    odtMamulKart: Result := AppGetRS(@AppMamulKart);
    odtMamulKullanimKart: Result := AppGetRS(@AppMamulKullanimKart);
    odtMRPParametreKart: Result := AppGetRS(@AppMRPParametreKart);
    odtStokKarsilamaPolitika: Result := AppGetRS(@AppStokKarsilamaPolitika);
    odtUretimDurusKart: Result := AppGetRS(@AppUretimDurusKart);
    odtUretimHataKart: Result := AppGetRS(@AppUretimHataKart);
    odtUretimKaynakKart: Result := AppGetRS(@AppUretimKaynakKart);
    odtUretimParametreKart: Result := AppGetRS(@AppUretimParametreKart);
    odtUretimTakvimKart: Result := AppGetRS(@AppUretimTakvimKart);
    odtUretimVardiyaKart: Result := AppGetRS(@AppUretimVardiyaKart);
    odtUretimYilKart: Result := AppGetRS(@AppUretimYilKart);
    else Result := '';
  end;
end;

function TAppBOMConsts.Category(DocType: TAppBOMDocType): String;
begin
  Result := GroupCategory(DocGroup(DocType));
end;

function TAppBOMConsts.Image(DocType: TAppBOMDocType): TAppImage;
begin
  Result := aiNone;
end;

function TAppBOMConsts.GroupName(DocGroup: TAppBOMDocGroup): String;
begin
  Result := 'UretimKurulum';
end;

function TAppBOMConsts.GroupSubName(DocGroup: TAppBOMDocGroup): String;
begin
  Result := 'su' + GroupName(DocGroup);
end;

function TAppBOMConsts.GroupCaption(DocGroup: TAppBOMDocGroup): String;
begin
  Result := AppGetRS(@AppGrupUretimKurulum);
end;

function TAppBOMConsts.GroupCategory(DocGroup: TAppBOMDocGroup): String;
begin
  Result := AppGetRS(@AppGrupUretimKurulum_Category);
end;

function TAppBOMConsts.GroupImage(DocGroup: TAppBOMDocGroup): TAppImage;
begin
  Result := aiNone;
end;

end.
