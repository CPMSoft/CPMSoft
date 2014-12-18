unit CPMApp_SProductionConsts;

interface

uses SysUtils, Variants,
  CPMApp_Images;

type
  TAppSProductionDocGroup =
  (
    odgSUretimIslem
  );

  TAppSProductionDocClass =
  (
    odcUndefined, // Yeniden Maliyetlendirme nin DOP u yok.
    odcDOPUretim, // Eski Üretim ve Eski Üretim Ýþ Emri
    odcDOPUretimKart, // Üretim Ýþ Emri Kartý
    odcDOPUretimTerminalAyarlar,
    odcDOPUretimTerminalVeriGiris
  );

  TAppSProductionDocType =
  (
    odtUndefined,
    odtSUretim,
    odtSUretimIsEmri,
    odtSUretimIsEmriKart,
    odtSYenidenMaliyetlendirme,
    odtUretimTerminalAyarlar,
    odtUretimTerminalVeriGiris
  );

  TAppSProductionConsts = class
  public
    // For Standart Use
    function DocType(EvrakTip: Integer): TAppSProductionDocType;
    function DocGroup(DocType: TAppSProductionDocType): TAppSProductionDocGroup;
    function DocClass(DocType: TAppSProductionDocType): TAppSProductionDocClass;

    function AppName(DocType: TAppSProductionDocType; const FormType: Smallint = 0): String;
    function SecName(DocType: TAppSProductionDocType; const FormType: Smallint = 0): String;
    function BtnName(DocType: TAppSProductionDocType; const FormType: Smallint = 0): String;
    function Caption(DocType: TAppSProductionDocType): String;
    function Category(DocType: TAppSProductionDocType): String;
    function Image(DocType: TAppSProductionDocType): TAppImage;
    function IncAppName(DocType: TAppSProductionDocType): String;
    function IncFieldName(DocType: TAppSProductionDocType): String;
    function IncFirstValue(DocType: TAppSProductionDocType): String;

    function GroupName(DocGroup: TAppSProductionDocGroup): String;
    function GroupSubName(DocGroup: TAppSProductionDocGroup): String;
    function GroupCaption(DocGroup: TAppSProductionDocGroup): String;
    function GroupCategory(DocGroup: TAppSProductionDocGroup): String;
    function GroupImage(DocGroup: TAppSProductionDocGroup): TAppImage;

    // For SProduction Object Special Use
    function EvrakTip(DocType: TAppSProductionDocType): Integer;
    function IslemTip(DocType: TAppSProductionDocType): Integer;
    function GirisCikis(DocType: TAppSProductionDocType): Integer;
    function DosyaTip(DocType: TAppSProductionDocType): Integer;
  end;

Const
  atReceteTuketimForHammaddeTuketim: Smallint = 10;
  atReceteTuketimForOperasyon: Smallint = 20;

  DateSettings_DateType_Otomatik: Smallint = 10;
  DateSettings_DateType_TarihSor: Smallint = 20;
  DateSettings_DateType_SabitTarih: Smallint = 30;

  KaynakIslem_TuketimTip_None: Smallint = 0;
  KaynakIslem_TuketimTip_Manual: Smallint = 1;
  KaynakIslem_TuketimTip_Otomatik: Smallint = 2;

function AppSProductionConsts: TAppSProductionConsts;

implementation

uses CPMApp_DocConsts, CPMApp_DocumentConsts,
  CPMApp_StrUtils, CPMApp_SProductionStrs;

var
  FAppSProductionConsts: TAppSProductionConsts;

function AppSProductionConsts: TAppSProductionConsts;
begin
  if not Assigned(FAppSProductionConsts) then
    FAppSProductionConsts := TAppSProductionConsts.Create;
  Result := FAppSProductionConsts;
end;

{ TAppSProductionConsts }

function TAppSProductionConsts.DocType(EvrakTip: Integer): TAppSProductionDocType;
var
  aDocType: TAppSProductionDocType;
begin
  Result := odtUndefined;
  for aDocType := Low(TAppSProductionDocType) to High(TAppSProductionDocType) do
  begin
    if Self.EvrakTip(aDocType) = EvrakTip then
    begin
      Result := aDocType;
      Exit;
    end;
  end;
end;

function TAppSProductionConsts.DocGroup(DocType: TAppSProductionDocType): TAppSProductionDocGroup;
begin
  Result := odgSUretimIslem;
end;

function TAppSProductionConsts.DocClass(DocType: TAppSProductionDocType): TAppSProductionDocClass;
begin
  case DocType of
    odtSUretim, odtSUretimIsEmri: Result := odcDOPUretim;
    odtSUretimIsEmriKart: Result := odcDOPUretimKart;
    odtUretimTerminalAyarlar: Result := odcDOPUretimTerminalAyarlar;
    odtUretimTerminalVeriGiris: Result := odcDOPUretimTerminalVeriGiris;
    else Result := odcUndefined;
  end;
end;

function TAppSProductionConsts.AppName(DocType: TAppSProductionDocType; const FormType: Smallint): String;
begin
  case DocType of
    odtSUretim: Result := 'DOPURETIM';
    odtSUretimIsEmri: Result := 'DOPURETIMISEMRI';
    odtSUretimIsEmriKart: Result := 'DOPURETIMISEMRIKART';
    odtSYenidenMaliyetlendirme: Result := 'YenidenMaliyetlendirme';
    odtUretimTerminalAyarlar: Result := 'DOPURETIMTERMINALKART';
    odtUretimTerminalVeriGiris: Result := 'DOPURETIMTERMINAL';
    else Result := '';
  end;
  if FormType > 0 then
    Result := Result + '_' + IntToStr(FormType);
end;

function TAppSProductionConsts.SecName(DocType: TAppSProductionDocType; const FormType: Smallint): String;
begin
  case DocType of
    odtSYenidenMaliyetlendirme: Result := 'UretimMaliyetUpdate';
//    odtUretimTerminalVeriGiris: Result := 'DOPURETIMISEMRIKART';
    else Result := AppName(DocType);
  end;
  if FormType > 0 then
    Result := Result + '_' + IntToStr(FormType);
end;

function TAppSProductionConsts.BtnName(DocType: TAppSProductionDocType; const FormType: Smallint): String;
begin
  case DocType of
    odtSUretim: Result := 'btUretim';
    odtSUretimIsEmri: Result := 'btUretimIsEmri';
    odtSUretimIsEmriKart: Result := 'btUretimIsEmriKart';
    odtSYenidenMaliyetlendirme: Result := 'btYenidenMaliyetlendirme';
    else Result := 'btn' + AppName(DocType);
  end;
  if FormType > 0 then
    Result := Result + '_' + IntToStr(FormType);
end;

function TAppSProductionConsts.Caption(DocType: TAppSProductionDocType): String;
begin
  case DocType of
    odtSUretim: Result := AppGetRS(@AppSUretim);
    odtSUretimIsEmri: Result := AppGetRS(@AppSUretimIsEmri);
    odtSUretimIsEmriKart: Result := AppGetRS(@AppSUretimIsEmriKart);
    odtSYenidenMaliyetlendirme: Result := AppGetRS(@AppSYenidenMaliyetlendirme);
    odtUretimTerminalAyarlar: Result := AppGetRS(@AppUretimTerminalAyarlar);
    odtUretimTerminalVeriGiris: Result := AppGetRS(@AppUretimTerminalVeriGiris);
    else Result := '';
  end;
end;

function TAppSProductionConsts.Category(DocType: TAppSProductionDocType): String;
begin
  Result := GroupCategory(DocGroup(DocType));
end;

function TAppSProductionConsts.Image(DocType: TAppSProductionDocType): TAppImage;
begin
  Result := aiNone;
end;

function TAppSProductionConsts.IncAppName(DocType: TAppSProductionDocType): String;
begin

end;

function TAppSProductionConsts.IncFieldName(DocType: TAppSProductionDocType): String;
begin

end;

function TAppSProductionConsts.IncFirstValue(DocType: TAppSProductionDocType): String;
begin

end;

function TAppSProductionConsts.EvrakTip(DocType: TAppSProductionDocType): Integer;
begin
  case DocType of
    odtSUretim: Result := aetUretim;
    odtSUretimIsEmri: Result := aetUretimSiparis;
    else Result := 0;
  end;
end;

function TAppSProductionConsts.IslemTip(DocType: TAppSProductionDocType): Integer;
begin
  case DocType of
    odtSUretim: Result := shitUretim;
    odtSUretimIsEmri: Result := shitSiparis;
    else Result := 0;
  end;
end;

function TAppSProductionConsts.GirisCikis(DocType: TAppSProductionDocType): Integer;
begin
  Result := gctGiris;
end;

function TAppSProductionConsts.DosyaTip(DocType: TAppSProductionDocType): Integer;
begin
  Result := tdtUretim;
end;

function TAppSProductionConsts.GroupName(DocGroup: TAppSProductionDocGroup): String;
begin
  Result := 'UretimIslem';
end;

function TAppSProductionConsts.GroupSubName(DocGroup: TAppSProductionDocGroup): String;
begin
  Result := 'su' + GroupName(DocGroup);
end;

function TAppSProductionConsts.GroupCaption(DocGroup: TAppSProductionDocGroup): String;
begin
  Result := AppGetRS(@AppGrupSUretimIslem);
end;

function TAppSProductionConsts.GroupCategory(DocGroup: TAppSProductionDocGroup): String;
begin
  Result := GroupCaption(DocGroup);
end;

function TAppSProductionConsts.GroupImage(DocGroup: TAppSProductionDocGroup): TAppImage;
begin
  Result := aiNone;
end;

initialization

finalization
  if Assigned(FAppSProductionConsts) then
    FreeAndNil(FAppSProductionConsts);

end.
