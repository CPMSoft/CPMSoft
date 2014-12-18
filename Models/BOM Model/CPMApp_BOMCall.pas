unit CPMApp_BOMCall;

interface

uses
  SysUtils, Dialogs, Classes, DB,
  CPMApp_DocApp,
  CPMApp_DOPCustomIsMerkezKart,
  CPMApp_DOPCustomMamulKart,
  CPMApp_DOPCustomMamulKullanimKart,
  CPMApp_DOPCustomMRPParametreKart,
  CPMApp_DOPCustomStokKarsilamaPolitika,
  CPMApp_DOPCustomUretimDurusKart,
  CPMApp_DOPCustomUretimHataKart,
  CPMApp_DOPCustomUretimKaynakKart,
  CPMApp_DOPCustomUretimParametreKart,
  CPMApp_DOPCustomUretimTakvimKart,
  CPMApp_DOPCustomUretimVardiyaKart,
  CPMApp_DOPCustomUretimYilKart,
  CPMApp_BOMConsts;

type
  TAppBOMCall = class(TPersistent)
  public
    function Open(DocType: TAppBOMDocType;
      const FormType: Smallint = 0;
      const FormCaption: String = '';
      const CallOptionType: TDOPCallOptionType = cotAsk;
      const CallFirst: Boolean = True;
      const CallAuto: Boolean = True;
      const ApplicationName: String = ''): TAppDocApp;

    // For Backward Support
    function OpenMamulKart(const CallOptionType: TDOPCallOptionType = cotAsk; const CallFirst: Boolean = True; const CallAuto: Boolean = True; const ApplicationName: String = ''): TAppDOPCustomMamulKart;
    function OpenUretimKaynakKart(const CallOptionType: TDOPCallOptionType = cotAsk; const CallFirst: Boolean = True; const CallAuto: Boolean = True; const ApplicationName: String = ''): TAppDOPCustomUretimKaynakKart;
  end;

  function AppBOMObjectCall: TAppBOMCall;

implementation

uses CPMApp_Security, CPMApp_Dialogs, CPMApp_Images;

var
  FAppBOMCall: TAppBOMCall;

function AppBOMObjectCall: TAppBOMCall;
begin
  if FAppBOMCall = nil then
    FAppBOMCall := TAppBOMCall.Create;
  Result := FAppBOMCall;
end;

{ TAppBOMCall }

function TAppBOMCall.Open(DocType: TAppBOMDocType;
  const FormType: Smallint;
  const FormCaption: String;
  const CallOptionType: TDOPCallOptionType;
  const CallFirst, CallAuto: Boolean;
  const ApplicationName: String): TAppDocApp;

var
  AppName, Caption: String;

  function CreateDOPMRPParametreKart: TAppDOPCustomMRPParametreKart;
  begin
    Result := TAppDOPCustomMRPParametreKart(CreateDOPInstance(TAppDOPCustomMRPParametreKart, False, AppName));

    Result.Caption := Caption;
    Result.Active := True;

    Result.DataApp.DataObject.OptionsKey.KeyValues['SIRKETNO'] := AppSecurity.DBCompanyNo;
    Result.DataApp.DataObject.Open;

    if Result.DataApp.MRPParametre.Table.IsEmpty then
    begin
      if not (Result.DataApp.MRPParametre.Table.State in dsEditModes) then
        Result.DataApp.MRPParametre.Table.Edit;
      Result.DataApp.MRPParametre.Table.SirketNo := AppSecurity.DBCompanyNo;
      Result.DataApp.MRPParametre.Table.Post;
      Result.DataApp.DataObject.Save;
    end;
  end;

  function CreateDOPUretimParametreKart: TAppDOPCustomUretimParametreKart;
  begin
    Result := TAppDOPCustomUretimParametreKart(CreateDOPInstance(TAppDOPCustomUretimParametreKart, False, AppName));

    Result.Caption := Caption;
    Result.Active := True;

    Result.DataApp.DataObject.OptionsKey.KeyValues['SIRKETNO'] := AppSecurity.DBCompanyNo;
    Result.DataApp.DataObject.Open;

    if Result.DataApp.UretimParametre.Table.IsEmpty then
    begin
      if not (Result.DataApp.UretimParametre.Table.State in dsEditModes) then
        Result.DataApp.UretimParametre.Table.Edit;
      Result.DataApp.UretimParametre.Table.SirketNo := AppSecurity.DBCompanyNo;
      Result.DataApp.UretimParametre.Table.Post;
      Result.DataApp.DataObject.Save;
    end;
  end;

begin
  Result := nil;

  if ApplicationName <> '' then
    AppName := ApplicationName
  else
    AppName := AppBOMConsts.AppName(DocType, FormType);
  if FormCaption <> '' then
    Caption := FormCaption
  else
    Caption := AppBOMConsts.Caption(DocType);

  if not AppSecurity.CheckMember(AppName, 'Giris') then
  begin
    ShowMessage('Giriþ hakkýnýz yok!');
    exit;
  end;

  if CallOptionType in [cotAsk, cotCallAndCreate, cotCall] then
    Result := CallDOPInstance(TAppDocApp, AppName, CallFirst);

  if Assigned(Result) and (CallOptionType = cotAsk) then
    if AppConfirm(format('Yeni %s modülü aç?', [Caption])) then
      Result := nil;

  if (Result = nil) and (CallOptionType in [cotAsk, cotCallAndCreate, cotCreate]) then
  begin
    case DocType of
      odtIsMerkezKart: Result := CreateDOPInstance(TAppDOPCustomIsMerkezKart, False, AppName);
      odtMamulKart: Result := CreateDOPInstance(TAppDOPCustomMamulKart, False, AppName);
      odtMamulKullanimKart: Result := CreateDOPInstance(TAppDOPCustomMamulKullanimKart, False, AppName);
      odtMRPParametreKart: Result := CreateDOPMRPParametreKart;
      odtStokKarsilamaPolitika: Result := CreateDOPInstance(TAppDOPCustomStokKarsilamaPolitika, False, AppName);
      odtUretimDurusKart: Result := CreateDOPInstance(TAppDOPCustomUretimDurusKart, False, AppName);
      odtUretimHataKart: Result := CreateDOPInstance(TAppDOPCustomUretimHataKart, False, AppName);
      odtUretimKaynakKart: Result := CreateDOPInstance(TAppDOPCustomUretimKaynakKart, False, AppName);
      odtUretimParametreKart: Result := CreateDOPUretimParametreKart;
      odtUretimTakvimKart: Result := CreateDOPInstance(TAppDOPCustomUretimTakvimKart, False, AppName);
      odtUretimVardiyaKart: Result := CreateDOPInstance(TAppDOPCustomUretimVardiyaKart, False, AppName);
      odtUretimYilKart: Result := CreateDOPInstance(TAppDOPCustomUretimYilKart, False, AppName);
    end;
  end;

  if Assigned(Result) then
  begin
    if not Result.Active then
    begin
      Result.Caption := Caption;
      Result.ObjectType := Integer(DocType);
      Result.DocumentType := 0;
      Result.FormType := FormType;
      Result.SystemType := 0;
      Result.TradeType := 0;
      if AppBOMConsts.Image(DocType) <> aiNone then
        AppImageList.GetIcon(Integer(AppBOMConsts.Image(DocType)), Result.DocObject.MainForm.Icon);
    end;
    if CallAuto then
      Result.Active := True;
  end;
end;

function TAppBOMCall.OpenMamulKart(const CallOptionType: TDOPCallOptionType; const CallFirst, CallAuto: Boolean; const ApplicationName: String): TAppDOPCustomMamulKart;
begin
  Result := TAppDOPCustomMamulKart(Open(odtMamulKart, 0, '', CallOptionType, CallFirst, CallAuto, ApplicationName));
end;

function TAppBOMCall.OpenUretimKaynakKart(const CallOptionType: TDOPCallOptionType; const CallFirst, CallAuto: Boolean; const ApplicationName: String): TAppDOPCustomUretimKaynakKart;
begin
  Result := TAppDOPCustomUretimKaynakKart(Open(odtUretimKaynakKart, 0, '', CallOptionType, CallFirst, CallAuto, ApplicationName));
end;

initialization

finalization
  if Assigned(FAppBOMCall) then
    FreeAndNil(FAppBOMCall);

end.
