unit CPMApp_SProductionCall;

interface

uses
  SysUtils, Classes, Dialogs, Variants, Graphics, Controls, Forms, DB,
  CPMApp_DocApp,
  CPMApp_DOPCustomUretim,
  CPMApp_DOPCustomUretimKart,
  CPMApp_DOPCustomUretimTerminalAyarlar,
  CPMApp_DOPCustomUretimTerminalVeriGiris,
  CPMApp_SProductionConsts;

type
  TAppSProductionCall = class(TPersistent)
  public
    function Open(DocType: TAppSProductionDocType;
      const FormType: Smallint = 0;
      const FormCaption: String = '';
      const CallOptionType: TDOPCallOptionType = cotAsk;
      const CallFirst: Boolean = True;
      const CallAuto: Boolean = True;
      const ApplicationName: String = ''): TAppDocApp;
  end;

  function AppSProductionObjectCall: TAppSProductionCall;

implementation

uses CPMApp_Security, CPMApp_Dialogs, CPMApp_Images,
  CPMApp_DocConsts, CPMApp_DocumentConsts;

var
  FAppSProductionCall: TAppSProductionCall;

function AppSProductionObjectCall: TAppSProductionCall;
begin
  if FAppSProductionCall = nil then
    FAppSProductionCall := TAppSProductionCall.Create;
  Result := FAppSProductionCall;
end;

{ TAppSProductionCall }

function TAppSProductionCall.Open(DocType: TAppSProductionDocType;
  const FormType: Smallint;
  const FormCaption: String;
  const CallOptionType: TDOPCallOptionType;
  const CallFirst, CallAuto: Boolean;
  const ApplicationName: String): TAppDocApp;
var
  vAppName, vCaption: String;

  function CreateDOPCustomUretim: TAppDOPCustomUretim;
  begin
    Result := TAppDOPCustomUretim(CreateDOPInstance(TAppDOPCustomUretim, False, vAppName));

    Result.DataApp.ParamsUretim.UretimTip := AppSProductionConsts.EvrakTip(DocType);
    Result.DataApp.ParamsUretim.EvrakTip := AppSProductionConsts.EvrakTip(DocType);
    Result.DataApp.ParamsUretim.IslemTip := AppSProductionConsts.IslemTip(DocType);
  end;

  function CreateDOPCustomUretimKart: TAppDOPCustomUretimKart;
  begin
    Result := TAppDOPCustomUretimKart(CreateDOPInstance(TAppDOPCustomUretimKart, False, vAppName));

    Result.DataApp.ParamsUretimKart.EvrakTip := AppSProductionConsts.EvrakTip(DocType);
  end;

begin
  Result := nil;
  if ApplicationName <> '' then
    vAppName := ApplicationName
  else
    vAppName := AppSProductionConsts.AppName(DocType, FormType);
  if FormCaption <> '' then
    vCaption := FormCaption
  else
    vCaption := AppSProductionConsts.Caption(DocType);

  if not AppSecurity.CheckMember(vAppName, 'Giris') then
  begin
    ShowMessage('Giriþ hakkýnýz yok!');
    exit;
  end;

  if CallOptionType in [cotAsk, cotCallAndCreate, cotCall] then
    Result := CallDOPInstance(TAppDocApp, vAppName, CallFirst);

  if Assigned(Result) and (CallOptionType = cotAsk) then
    if AppConfirm(format('Yeni %s modülü aç?', [vCaption])) then
      Result := nil;

  if (Result = nil) and (CallOptionType in [cotAsk, cotCallAndCreate, cotCreate]) then
  begin
    case AppSProductionConsts.DocClass(DocType) of
      odcDOPUretim: Result := CreateDOPCustomUretim;
      odcDOPUretimKart: Result := CreateDOPCustomUretimKart;
      odcDOPUretimTerminalAyarlar: Result := CreateDOPInstance(TAppDOPCustomUretimTerminalAyarlar, False, vAppName);
      odcDOPUretimTerminalVeriGiris: Result := CreateDOPInstance(TAppDOPCustomUretimTerminalVeriGiris, False, vAppName);
      else Result := nil;
    end;
  end;

  if Assigned(Result) then
  begin
    if not Result.Active then
    begin
      Result.Caption := vCaption;
      Result.ObjectType := Integer(DocType);
      Result.DocumentType := AppSProductionConsts.EvrakTip(DocType);
      Result.FormType := FormType;
      Result.SystemType := 0;
      Result.TradeType := 0;
      
      if AppSProductionConsts.Image(DocType) <> aiNone then
        AppImageList.GetIcon(Integer(AppSProductionConsts.Image(DocType)), Result.DocObject.MainForm.Icon);
    end;
    if CallAuto then
      Result.Active := True;
  end;
end;

initialization

finalization
  if Assigned(FAppSProductionCall) then
    FreeAndNil(FAppSProductionCall);

end.
