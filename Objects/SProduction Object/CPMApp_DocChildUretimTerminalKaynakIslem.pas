unit CPMApp_DocChildUretimTerminalKaynakIslem;

interface

uses
  Controls, Forms, IniFiles,
  DB, Variants,
  cxEdit,
  cxTextEdit, cxButtonEdit,

  cxGridTableView, cxGridDBTableView,
  cxGraphics, cxGridCustomTableView,
  CPMApp_DocApp,
  CPMApp_Storage,
  CPMApp_DocObjectModel,
  CPMApp_DocChildGrid,
  CPMApp_DocChildSearchTable,
  CPMApp_DocChildUretimTerminalProperties,
  CPMApp_DocFormOperasyonMenu,
  CPMApp_DAPCustomUretimKart,
  CPMApp_TableUretimSystem;
type

  TAppDocChildUretimTerminalKaynakIslem = class;

  TAppDocChildUretimTerminalKaynakIslem = class(TAppDocChildSearchTable)
  private
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
    CKaynakOperatorKod: TcxGridDBColumn;
    CKaynakDurum: TcxGridDBColumn;
    AFormOperasyonMenu: TAppDocFormOperasyonMenu;
    procedure OnClickTitleDolumBilgileri(Sender: TObject);
    procedure OnClickTitleAmbalajBilgileri(Sender: TObject);
    procedure OnClickTitleExit(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
    procedure AddDocumentOnClick(Sender: TObject; AButtonIndex: Integer);
    procedure AddDocument;
    procedure CreateGridButtons;
    procedure SetMainControllerButtonState;
    procedure SetControlPanelFormButtons;
    function GetIslemDurum: Smallint;
  private
    procedure OnClickDateSettings(Sender: TObject);
    procedure btUretimDurumDegistir(Sender: TObject);
    procedure btUretimDurumSifirla(Sender: TObject);
    procedure OnClickTuketimListesi(Sender: TObject);
    procedure OnClickRaporDurusList(Sender: TObject);
    procedure OnClickNot(Sender: TObject);
  protected
    procedure ReadDateSettingsFromIniFile;
    procedure CreateTitle;
    procedure CreateObjects;
    procedure CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure AfterCreate; override;
    procedure PrepareDefination;
  public
    procedure OnKeyPressBarcodeText;
  public
    procedure DoStop;
    procedure DoRun;
//    procedure DoRun(EvrakNo, UretimNo: String; UretimSiraNo, OperasyonNo: Integer; KaynakKod: String);
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
    property IslemDurum: Smallint read GetIslemDurum;
  end;

implementation
uses
  Windows, Graphics, ShellApi,
  SysUtils, StrUtils,
  Dialogs,
  cxButtons,
  CPMApp_Dialogs,
  CPMApp_Date,
  CPMApp_TableItems,
  CPMApp_BOMConsts,
  CPMApp_SProductionConsts,
  CPMApp_DOPUretimTerminalVeriGiris,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_DocFormUretimTerminalNumPad, Classes, CPMApp_DataObject;

{ TAppDocChildUretimTerminalKaynakIslem }

procedure TAppDocChildUretimTerminalKaynakIslem.AddDocumentOnClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  AddDocument;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.SetControlPanelFormButtons;
var
  SQLStr: String;
begin
  SQLStr := '';
  SQLStr := SQLStr + '  Select TOP 1 SIRANO, DURUM ';
  SQLStr := SQLStr + '  From URTRKO WITH (NOLOCK) ';
  SQLStr := SQLStr + '  Where EVRAKNO = '+ QuotedStr(DataApp.UretimRotaKaynak.Table.EvrakNo);
  SQLStr := SQLStr + '    And URETIMNO = ' + QuotedStr(DataApp.UretimRotaKaynak.Table.UretimNo);
  SQLStr := SQLStr + '    And URETIMSIRANO = ' + IntToStr(DataApp.UretimRotaKaynak.Table.UretimSiraNo);
  SQLStr := SQLStr + '    And OPERASYONNO = ' + IntToStr(DataApp.UretimRotaKaynak.Table.OperasyonNo);
  SQLStr := SQLStr + '    And ISLEMNO = ' + IntToStr(Self.Table.FieldByName('ISLEMNO').AsInteger);
  SQLStr := SQLStr + '  Order By SIRANO Desc';
  DataApp.TableCommand.OpenCommandText(SQLStr);

  with TAppDOPUretimTerminalVeriGiris(FDocApp) do
  begin
    TerminalParametre.OpIslemTip              := Self.Table.FieldByName('ISLEMTIP').AsInteger;
    TerminalParametre.OpIslemNo               := Self.Table.FieldByName('ISLEMNO').AsInteger;
    TerminalParametre.OperasyonNo             := Self.Table.FieldByName('OPERASYONNO').AsInteger;
    TerminalParametre.CurrentIslemNo          := Self.Table.FieldValues['ISLEMNO'];
    TerminalParametre.CurrentIslemAciklama    := Self.Table.FieldValues['ACIKLAMA'];
    TerminalParametre.KaynakIslem.TuketimTip  := Self.Table.FieldByName('URTKIT_TUKETIMTIP').AsInteger;
    TerminalParametre.OpSiraNo                := DataApp.TableCommand.FieldByName('SIRANO').AsInteger;
    TerminalParametre.OpDurum                 := DataApp.TableCommand.FieldByName('DURUM').AsInteger;
  end;
end;

function TAppDocChildUretimTerminalKaynakIslem.GetIslemDurum: Smallint;
var
  SQLStr: String;
begin
  SQLStr := '';
  SQLStr := SQLStr + '  Select TOP 1 DURUM ';
  SQLStr := SQLStr + '  From URTRKO WITH (NOLOCK) ';
  SQLStr := SQLStr + '  Where EVRAKNO = '+ QuotedStr(DataApp.UretimRotaKaynak.Table.EvrakNo);
  SQLStr := SQLStr + '    And URETIMNO = ' + QuotedStr(DataApp.UretimRotaKaynak.Table.UretimNo);
  SQLStr := SQLStr + '    And URETIMSIRANO = ' + IntToStr(DataApp.UretimRotaKaynak.Table.UretimSiraNo);
  SQLStr := SQLStr + '    And OPERASYONNO = ' + IntToStr(DataApp.UretimRotaKaynak.Table.OperasyonNo);
  SQLStr := SQLStr + '    And ISLEMNO = ' + IntToStr(Self.Table.FieldByName('ISLEMNO').AsInteger);
  SQLStr := SQLStr + '  Order By SIRANO Desc';
  DataApp.TableCommand.OpenCommandText(SQLStr);

  if not DataApp.TableCommand.IsEmpty then
    Result := DataApp.TableCommand.FieldByName('DURUM').AsInteger
  else
    Result := 1;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.SetMainControllerButtonState;
begin
  if (Self.Table.FieldValues['DURUM'] = odPaused) then
  begin
    AFormOperasyonMenu.btKaynakIslemBaslat.Enabled := false;
    AFormOperasyonMenu.btKaynakIslemBitir.Enabled := false;
    AFormOperasyonMenu.btKaynakIslemMalzemeTuketim.Enabled := false;
    AFormOperasyonMenu.btKaynakIslemDurus.Caption := 'Duruþu Sonlandýr';
    AFormOperasyonMenu.btKaynakIslemDurus.Enabled := true;
    AFormOperasyonMenu.btKaynakIslemDurus.Tag := 1;
    AFormOperasyonMenu.btKaynakIslemHata.Enabled := false
  end else if (Self.Table.FieldValues['DURUM'] = odReleased) then
  begin
    AFormOperasyonMenu.btKaynakIslemBaslat.Enabled := true;
    AFormOperasyonMenu.btKaynakIslemBitir.Enabled := false;
    AFormOperasyonMenu.btKaynakIslemMalzemeTuketim.Enabled := false;
    AFormOperasyonMenu.btKaynakIslemDurus.Enabled := false;
    AFormOperasyonMenu.btKaynakIslemHata.Enabled := false;
    AFormOperasyonMenu.btKaynakIslemDurus.Tag := 0;
  end else if (Self.Table.FieldValues['DURUM'] = odStarted) then
  begin
    AFormOperasyonMenu.btKaynakIslemBaslat.Enabled := false;
    AFormOperasyonMenu.btKaynakIslemBitir.Enabled := true;
    AFormOperasyonMenu.btKaynakIslemMalzemeTuketim.Enabled := true;
    AFormOperasyonMenu.btKaynakIslemDurus.Enabled := true;
    AFormOperasyonMenu.btKaynakIslemHata.Enabled := true;
    AFormOperasyonMenu.btKaynakIslemDurus.Tag := 0;
  end else if (Self.Table.FieldValues['DURUM'] = odFinished) then
  begin
    AFormOperasyonMenu.btKaynakIslemBaslat.Enabled := false;
    AFormOperasyonMenu.btKaynakIslemMalzemeTuketim.Enabled := false;
    AFormOperasyonMenu.btKaynakIslemBitir.Enabled := false;
    AFormOperasyonMenu.btKaynakIslemDurus.Enabled := false;
    AFormOperasyonMenu.btKaynakIslemHata.Enabled := false;
  end;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.AddDocument;
var
  CanLoginThisIslem: Boolean;
  JIslem: Smallint;

  procedure CreateFormTuketimMenu;
  begin
    try
      SetMainControllerButtonState;
      AFormOperasyonMenu.ShowModal;
    finally
      TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.FormParam := AFormOperasyonMenu.Param;
    end;
  end;

  procedure CheckIslemYetkisi;
  var
    SQLStr: String;
    vRecNo, vIslemNo: Integer;
  begin
    with TAppDOPUretimTerminalVeriGiris(FDocApp) do begin
      SQLStr := '';
      SQLStr := SQLStr + '  Select ISLEMNO ';
      SQLStr := SQLStr + '  From dbo.URTTIT WITH (NOLOCK) ';
      SQLStr := SQLStr + '  Where TERMINALKOD = ' + QuotedStr(TerminalParametre.TerminalKod);
      SQLStr := SQLStr + '    And SICILKOD = ' + QuotedStr(TerminalParametre.SicilKod);
      SQLStr := SQLStr + '    And KAYNAKKOD = ' + QuotedStr(Self.Table.FieldValues['KAYNAKKOD']);
      SQLStr := SQLStr + '    And KULLANILAN = 1';
      DataApp.TableCommand.OpenCommandText(SQLStr);

      if DataApp.TableCommand.IsEmpty then begin
        DocCustomProperties.AppForms.AppFormMessageDialog('Sicil numaranýza ait herhangi bir iþlem tanýmý/yetiklendirmesi bulunmuyor!');
        Exit;
      end else
      begin
        DataApp.TableCommand.First;
        while not DataApp.TableCommand.Eof do begin
          SetLength(TerminalParametre.FOpIslemList, DataApp.TableCommand.RecordCount);
          vRecNo := DataApp.TableCommand.RecNo;
          vIslemNo := DataApp.TableCommand.FieldValues['ISLEMNO'];
          TerminalParametre.FOpIslemList[vRecNo -1] := vIslemNo;
        DataApp.TableCommand.Next;
        end;
      end;
    end;
  end;
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).LoadDocumentInformations;

  with TAppDOPUretimTerminalVeriGiris(FDocApp) do
  begin
    if Self.Table.FieldValues['OPERATORKOD'] <> TerminalParametre.CurrentOperatorKod then
    begin
      DocCustomProperties.AppForms.AppFormMessageDialog('Bu operasyonda yetkili deðilsiniz!');
      Exit;
    end;

    CanLoginThisIslem := false;
    CheckIslemYetkisi;

    for JIslem := Low(TerminalParametre.FOpIslemList) to High(TerminalParametre.FOpIslemList) do
    begin
      if (CanLoginThisIslem = false) And (Self.Table.FieldValues['ISLEMNO'] = TerminalParametre.FOpIslemList[JIslem]) then
        CanLoginThisIslem := true
    end;

    if (CanLoginThisIslem = false) and (Self.Table.FieldValues['ISLEMKOD'] = 0) then
    begin
      DocCustomProperties.AppForms.AppFormMessageDialog(Format('%s iþleminde çalýþmaya yetkili deðilsiniz!', [Self.Table.FieldValues['ACIKLAMA']]));
      Exit;
    end;
  end;

  with TAppDOPUretimTerminalVeriGiris(FDocApp) do
  begin
    if (Self.Table.FieldValues['DURUM'] = odFinished) then
    begin
      DocCustomProperties.AppForms.AppFormMessageDialog('Tamamlanmýþ iþlem üzerinde iþlem yapamazsýnýz!');
      Exit;
    end;
  end;

  with TAppDOPUretimTerminalVeriGiris(FDocApp) do
  begin
    if (Self.Table.FieldValues['DURUM'] = odNone) then
    begin
      DocCustomProperties.AppForms.AppFormMessageDialog('Sadece Serbest býrakýlmýþ iþlemler üzerinde iþlem yapabilirsiniz!');
      Exit;
    end;
  end;

  SetControlPanelFormButtons;

  // Begin - Plansýz Üretim Yetkisini Kontrol et
//  if TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.PlansizYukleme = 1 then
//    TcxButton(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalReceteTuketim.Form.FindComponent('AppDocFormUretimTerminalMenu').FindComponent('ToolButtonReceteTuketimTitlePlansizTuketim')).Enabled := true
//  else
//    TcxButton(TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalReceteTuketim.Form.FindComponent('AppDocFormUretimTerminalMenu').FindComponent('ToolButtonReceteTuketimTitlePlansizTuketim')).Enabled := false;
  // End - Plansýz Üretim Yetkisini Kontrol et

  if TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpIslemTip = 1 then // Hammadde Tüketim
      TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.FormParam := 'DoStartHammaddeTuketim'
  else
    CreateFormTuketimMenu;

  TAppDOPUretimTerminalVeriGiris(DocApp).DoCommand(TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.FormParam);
end;

procedure TAppDocChildUretimTerminalKaynakIslem.AfterCreate;
begin
  inherited;
  PrepareDefination;
  CreateObjects;
end;


procedure TAppDocChildUretimTerminalKaynakIslem.btUretimDurumDegistir(
  Sender: TObject);
var
  FUretimDurumDegistir_UretimDurum: Integer;
  FUretimDurumDegistir_Miktar: Double;
  FUretimDurumDegistir_Tarih: TDateTime;
  FUretimDurumDegistir_FireMiktar: Double;
begin
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.PageControl.ActivePageIndex := 7;
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.LoadUretimDurumDegistir;
  TAppDOPUretimTerminalVeriGiris(FDocApp).DocFormSettings.ShowModal;
  Exit;

  FUretimDurumDegistir_UretimDurum := Integer(udFinished);
  FUretimDurumDegistir_Tarih := Date;
  FUretimDurumDegistir_Miktar := DataApp.UretimKart.Table.OpMiktar;
  FUretimDurumDegistir_FireMiktar := 0;

  with TAppDOPUretimTerminalVeriGiris(FDocApp) do
  begin
    if DataApp.DataControllerUretimKart.UretimDurumDegistir(TAppUretimDurum(FUretimDurumDegistir_UretimDurum), FUretimDurumDegistir_Tarih, FUretimDurumDegistir_Miktar, FUretimDurumDegistir_FireMiktar) then
    begin
      if DataApp.DataObject.Save then
        DocCustomProperties.AppForms.AppFormMessageDialog('Üretim Durumu Deðiþtirildi')
      else
        DocCustomProperties.AppForms.AppFormMessageDialog('Üretim Durumu deðiþtirilirken hata oluþtu. Lütfen tekrar deneyiniz!');
      ChildUretimKaynakEvrakList.DoRun;
      ShowThisDockPanel(ChildUretimKaynakEvrakList.DockPanel.Name);
    end;
  end;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.ReadDateSettingsFromIniFile;
var
  vDateType: Smallint;
  vDate: TDate;
begin
  with TIniFile.Create(ExtractFilePath(Application.ExeName) + '\CPMAppXPServer.ini') do
  begin
    vDateType := ReadInteger('UretimTerminalDateSettings', 'DateType', DateSettings_DateType_Otomatik);
    vDate := ReadDate('UretimTerminalDateSettings', 'Date', Date);
  end;

  if vDateType = DateSettings_DateType_Otomatik then
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDateSettings_DateType := vDateType;
    TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDateSettings_Date := Date;
    TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDateSettings_Time := Now;
  end else
  if vDateType = DateSettings_DateType_SabitTarih then
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDateSettings_DateType := vDateType;
    TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDateSettings_Date := vDate;
    TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDateSettings_Time := Now;
  end else
  if vDateType = DateSettings_DateType_TarihSor then
  begin
    TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDateSettings_DateType := vDateType;
    TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDateSettings_Date := EncodeDate(1900, 01, 01);
    TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.OpDateSettings_Time := EncodeTime(0, 0, 0, 0);
  end;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.btUretimDurumSifirla(
  Sender: TObject);
var
  J: Integer;
  aSQLStr: String;
begin
  if MessageDlg('Ýþlemi Onaylýyormusunuz?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  with TAppDOPUretimTerminalVeriGiris(FDocApp) do
  begin
    if DataApp.UretimRotaKaynak.Table.IsEmpty then begin
      DocCustomProperties.AppForms.AppFormMessageDialog('Açýk evrak bulunamadý!');
      Exit;
    end;

    aSQLStr := '';
    aSQLStr := aSQLStr + 'Update STHURT Set OPBASTARIH = '''', OPBASTARIHSAAT = '''', OPBITTARIH = '''', OPBITTARIHSAAT = '''', OPDURUM = 0 ';
    aSQLStr := aSQLStr + 'Where EVRAKNO = ''%s''';
    aSQLStr := Format(aSQLStr, [DataApp.UretimRotaKaynak.Table.UretimNo]);
    DataApp.TableCommand.Execute(aSQLStr);

    aSQLStr := '';
    aSQLStr := aSQLStr + 'If Exists (Select * From sys.Objects Where name = ''TERM01''' + ') ';
    aSQLStr := aSQLStr + 'Update TERM01 Set OPDURUM = 0, KULLANILANMIKTAR = 0 ';
    aSQLStr := aSQLStr + 'Where EVRAKNO = ''%s''';
    aSQLStr := Format(aSQLStr, [DataApp.UretimRotaKaynak.Table.UretimNo]);
    DataApp.TableCommand.Execute(aSQLStr);


    aSQLStr := '';
    aSQLStr := aSQLStr + 'If Exists (Select * From sys.Objects Where name = ''KMTST2''' + ') ';
    aSQLStr := aSQLStr + 'Update KMTST2 Set OPDURUM = 0, KULLANILANMIKTAR = 0 ';
    aSQLStr := aSQLStr + 'Where EVRAKNO = ''%s''';
    aSQLStr := Format(aSQLStr, [DataApp.UretimRotaKaynak.Table.UretimNo]);
    DataApp.TableCommand.Execute(aSQLStr);

    for J := 0 to DataApp.UretimRotaKaynakOperasyon.Table.RecordCount -1 do begin
      DataApp.UretimRotaKaynakOperasyon.Table.Last;
      DataApp.UretimRotaKaynakOperasyon.Table.Delete;
    end;

    DataApp.UretimRotaKaynakIslem.Table.First;
    while not DataApp.UretimRotaKaynakIslem.Table.Eof do begin
      DataApp.UretimRotaKaynakIslem.Table.Edit;
      if DataApp.UretimRotaKaynakIslem.Table.RecNo = 1 then begin
        DataApp.UretimRotaKaynakIslem.Table.Durum := odReleased;
        DataApp.UretimRotaKaynakIslem.Table.FieldValues['SERBESTTARIHSAAT'] := Now();
      end
      else begin
        DataApp.UretimRotaKaynakIslem.Table.Durum := odNone;
        DataApp.UretimRotaKaynakIslem.Table.FieldValues['SERBESTTARIHSAAT'] := EncodeDate(1900, 01, 01);;
      end;
      DataApp.UretimRotaKaynakIslem.Table.BasTarih := EncodeDate(1900, 01, 01);
      DataApp.UretimRotaKaynakIslem.Table.BasTarihSaat := EncodeDate(1900, 01, 01);
      DataApp.UretimRotaKaynakIslem.Table.BitTarih := EncodeDate(1900, 01, 01);
      DataApp.UretimRotaKaynakIslem.Table.BitTarihSaat := EncodeDate(1900, 01, 01);
      DataApp.UretimRotaKaynakIslem.Table.Post;
      DataApp.UretimRotaKaynakIslem.Table.Next;
    end;

    DataApp.UretimStokHareket.Table.First;
    while not DataApp.UretimStokHareket.Table.Eof do
      DataApp.UretimStokHareket.Table.Delete;

    DataApp.DataObject.Save;
    DocCustomProperties.AppForms.AppFormMessageDialog('Üretim Durumu Sýfýrlandý');
    ShowThisDockPanel(ChildUretimKaynakEvrakList.DockPanel.Name);
  end;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.CreateObjects;
begin
  AFormOperasyonMenu := TAppDocFormOperasyonMenu.Create(nil);
end;

procedure TAppDocChildUretimTerminalKaynakIslem.CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  CKaynakDurum := GridView.GetColumnByFieldName('DURUM');
  CKaynakOperatorKod := GridView.GetColumnByFieldName('OPERATORKOD');

  if (AViewInfo.GridRecord.Values[CKaynakOperatorKod.Index] <> TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.CurrentOperatorKod) then
  begin
    ACanvas.Font.Color := RGB(195, 195, 195);
    ACanvas.Font.Color := clBlack;
  end;

  if (AViewInfo.GridRecord.Values[CKaynakDurum.Index] = odReleased) And (AViewInfo.GridRecord.Values[CKaynakOperatorKod.Index] = TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.CurrentOperatorKod) then
  begin
    ACanvas.Brush.Color := RGB(255, 255, 198);
    ACanvas.Font.Color := clBlack;
  end;

  if (AViewInfo.GridRecord.Values[CKaynakDurum.Index] = odStarted) And (AViewInfo.GridRecord.Values[CKaynakOperatorKod.Index] = TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.CurrentOperatorKod) then
  begin
    ACanvas.Brush.Color := RGB(255, 172, 132);
    ACanvas.Font.Color := clBlack;
  end;

  if (AViewInfo.GridRecord.Values[CKaynakDurum.Index] = odFinished) then
  begin
    ACanvas.Brush.Color := RGB(223, 254, 222);
    ACanvas.Font.Color := clBlack;
  end;

  if (AViewInfo.GridRecord.Values[CKaynakDurum.Index] = odPaused) then
  begin
    ACanvas.Brush.Color := clRed;//RGB(223, 254, 222);
    ACanvas.Font.Color := clBlack;
  end;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.CreateGridButtons;
  procedure CreateButtons;
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppChild.CreateGridButton(Self.GridView, AddDocumentOnClick);
  end;
begin
//  Self.Table.TableItems[0].Where.Clear;
//  Self.Table.TableItems[0].Where.AddText('0 = 1');
  Self.Run;
  CreateButtons;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.CreateTitle;
var
  AFormTerminalMenu: TAppDocFormUretimTerminalMenu;
begin
  AFormTerminalMenu := TAppDocFormUretimTerminalMenu.Create(nil);
  AFormTerminalMenu.PanelKaynakIslem_Top.Parent := Self.Form;
  AFormTerminalMenu.btPanelKaynakIslem_Back.OnClick := OnClickTitleBack;
  AFormTerminalMenu.btPanelKaynakIslem_Exit.Onclick := OnClickTitleExit;
  AFormTerminalMenu.btKaynakIslemUretimDurumSifirla.OnClick := btUretimDurumSifirla;


  if TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.Firma = 'Kimteks' then
  begin
    AFormTerminalMenu.btPanelKaynakIslem_DolumBilgileri.Visible := true;
    AFormTerminalMenu.btPanelKaynakIslem_DolumBilgileri.OnClick := OnClickTitleDolumBilgileri;

    AFormTerminalMenu.btPanelKaynakIslem_AmbalajBilgileri.Visible := true;
    AFormTerminalMenu.btPanelKaynakIslem_AmbalajBilgileri.OnClick := OnClickTitleAmbalajBilgileri;
  end else
//  begin
//    AFormTerminalMenu.btPanelKaynakIslem_DolumBilgileri.Visible := false;
//    AFormTerminalMenu.btPanelKaynakIslem_AmbalajBilgileri.Visible := false;
//  end;

  AFormTerminalMenu.btKaynakIslemUretimDurumMenu.OnClick := btUretimDurumDegistir;
  AFormTerminalMenu.btPanelKaynakIslem_Settings.OnClick := OnClickDateSettings;
  AFormTerminalMenu.btPanelKaynakIslem_TuketimListesi.OnClick := OnClickTuketimListesi;
  AFormTerminalMenu.btPanelKaynakIslem_DurusList.OnClick := OnClickRaporDurusList;
  AFormTerminalMenu.PanelKaynakIslem_ButtonNot.OnClick := OnClickNot;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  Self.GridView.OptionsData.Editing := true;
  Self.ToolBar.Visible := false;
  Self.ReadOnly := true;
end;

destructor TAppDocChildUretimTerminalKaynakIslem.Destroy;
begin
  inherited;
  AFormOperasyonMenu.Free;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.DoRun;
var
  EvrakNo, UretimNo, KaynakKod: String;
  UretimSiraNo, OperasyonNo: Integer;
begin
  EvrakNo := DataApp.UretimRota.Table.EvrakNo;
  UretimNo := DataApp.UretimRota.Table.UretimNo;
  UretimSiraNo := DataApp.UretimRota.Table.UretimSiraNo;
  OperasyonNo := DataApp.UretimRota.Table.OperasyonNo;
  KaynakKod := TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimKaynakList.Table.FieldValues['KAYNAKKOD'];

  with Self.Table.TableItems[0].Where do
  begin
    Clear;
    Add('EVRAKNO', wcEqual, EvrakNo);
    AddOperator(woAnd);
    Add('URETIMNO', wcEqual, UretimNo);
    AddOperator(woAnd);
    Add('URETIMSIRANO', wcEqual, UretimSiraNo);
    AddOperator(woAnd);
    Add('OPERASYONNO', wcEqual, OperasyonNo);
    AddOperator(woAnd);
    Add('KAYNAKKOD', wcEqual, KaynakKod);
    AddOperator(woAnd);
    Add('KULLANILAN', wcEqual, 1);

    if TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.ParamDurumGosterTip = 2 then
    begin
      AddOperator(woAnd);
      Add('DURUM', wcInList, VarArrayOf([odReleased, odStarted]));
    end;

    if TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.ParamOperatorGosterTip = 2 then
    begin
      AddOperator(woAnd);
      Add('OPERATORKOD', wcEqual, TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalParametre.CurrentOperatorKod);
    end;
  end;
  Self.Run;
  ReadDateSettingsFromIniFile;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.DoStop;
begin

end;

procedure TAppDocChildUretimTerminalKaynakIslem.Initialize(IniFile: TAppIniFile);
begin
//  Self.GridView.OptionsData.Editing := true;
  Self.ReadOnly := true;
  inherited;
  Self.ToolBar.Visible := false;
  CreateTitle;
  CreateGridButtons;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.OnClickTitleDolumBilgileri(
  Sender: TObject);
var
  EvrakNo: String;
  EvrakSiraNo: Integer;
  EvrakTip: Integer;
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    EvrakNo := ChildUretimKaynakEvrakList.Table.FieldValues['URETIMNO'];
    EvrakSiraNo := ChildUretimKaynakEvrakList.Table.FieldValues['URETIMSIRANO'];
    EvrakTip := ChildUretimKaynakEvrakList.Table.FieldValues['EVRAKTIP'];

    ChildUretimDolumBilgileri.DoRun(EvrakNo, EvrakSiraNo, EvrakTip);
    ShowThisDockPanel(ChildUretimDolumBilgileri.DockPanel.Name);
  end;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.OnClickTitleBack(Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    if TerminalParametre.IsEmriSecim = iesManual then
      ShowThisDockPanel(ChildUretimKaynakEvrakList.DockPanel.Name)
    else
      ShowThisDockPanel(ChildUretimKaynakList.DockPanel.Name)
  end;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.OnClickTitleExit(Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalKaynakIslem.OnClickDateSettings(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    DocFormSettings.PageControl.ActivePageIndex := 0;
    DocFormSettings.ShowModal;
  end;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.OnClickRaporDurusList(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    ChildUretimTerminalReportDurusList.DoRun;
    ShowThisDockPanel(ChildUretimTerminalReportDurusList.DockPanel.Name);
  end;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.OnClickNot(Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    TerminalParametre.NotSecim := 'Islem';
    ShowThisDockPanel(ChildUretimRotaKaynakNot.DockPanel.Name);
  end;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.OnClickTuketimListesi(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    with ChildUretimTerminalReceteTuketimList do
    begin
      with Table.TableItems[0].Where do
      begin
        Clear;
        Add('KAYITTUR', wcEqual, 1);
        AddOperator(woAnd);
        Add('EVRAKTIP', wcEqual, 51);
        AddOperator(woAnd);
        Add('SIRKETNO', wcEqual, DataApp.CompanyNo);
        AddOperator(woAnd);
        Add('EVRAKNO', wcEqual, DataApp.UretimKart.Table.EvrakNo);
        AddOperator(woAnd);
        Add('GIRISCIKIS', wcEqual, gcCikis);
      end;
    end;
  end;

  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    ChildUretimTerminalReceteTuketimList.Run;
    ChildUretimTerminalReceteTuketimList.SourceDockPanelName := ChildUretimKaynakIslem.DockPanel.Name;
//    ChildUretimTerminalReceteTuketimList.ShowChild(true);
    ShowThisDockPanel(ChildUretimTerminalReceteTuketimList.DockPanel.Name);
  end;

end;

procedure TAppDocChildUretimTerminalKaynakIslem.OnClickTitleAmbalajBilgileri(
  Sender: TObject);
var
  EvrakNo, SiparisNo: String;
  EvrakSiraNo: Integer;
  EvrakTip: Integer;
  SQLStr: String;
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    EvrakNo := ChildUretimKaynakEvrakList.Table.FieldValues['URETIMNO'];
    EvrakSiraNo := ChildUretimKaynakEvrakList.Table.FieldValues['URETIMSIRANO'];
    EvrakTip := ChildUretimKaynakEvrakList.Table.FieldValues['EVRAKTIP'];
    SiparisNo := ChildUretimKaynakEvrakList.Table.FieldValues['EVRAKNO'];

    SQLStr := 'Exec KIMTEKS_TERMINAL_YANURUN ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';
    SQLStr := Format(SQLStr, [DataApp.CompanyNo, EvrakNo, SiparisNo, IntToStr(EvrakTip), IntToStr(EvrakSiraNo)]);
    DataApp.TableCommand.Execute(SQLStr);

    ChildUretimAmbalajBilgileri.DoRun(EvrakNo, EvrakSiraNo, EvrakTip);
    ShowThisDockPanel(ChildUretimAmbalajBilgileri.DockPanel.Name);
  end;
end;

procedure TAppDocChildUretimTerminalKaynakIslem.OnKeyPressBarcodeText;
var
  vBarcodeCode: String;
begin
  vBarcodeCode := TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalBarcode.BarcodeCode;
  if vBarcodeCode = '' then
    Exit;

  if Self.Table.Locate('ISLEMNO', vBarcodeCode, []) then
    AddDocument
  else
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Belirtilen Evrak Numarasý bulunamadý!');
    TAppDOPUretimTerminalVeriGiris(FDocApp).OnSetFocusBarcodeText(Self);
  end;
end;


procedure TAppDocChildUretimTerminalKaynakIslem.PrepareDefination;
begin
  Self.AppName := 'FChildTerminalKaynakIslem';
  Self.Caption := 'Terminal Kaynak Ýþlem';
  Self.Table.TableItems.TableNames := VarArrayOf(['URTRKI', 'URTROK', 'URTKIT']);
  Self.Table.TableItems.OrderBy.Add('ISLEMNO', otAsc);
  with Self.Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
      AddExpression('CONVERT(VARCHAR(30), DATEADD(MINUTE,(dbo.FNAPP_URT_KAYNAKISLEMSURE(URTRKI.KAYNAKKOD, URTRKI.MAMULKOD, URTRKI.ISLEMNO, URTROK.MIKTAR)), ''1900-01-01''), 108)', '__STANDARTSURE');
      AddExpression('CONVERT(VARCHAR(30), DATEADD(MINUTE, (DATEDIFF(minute, URTRKI.BASTARIHSAAT, URTRKI.BITTARIHSAAT)), ''1900-01-01''), 108)', '__GERCEKLESENSURE');
    end;
    with Where do
    begin
      Clear;
      AddText('0 = 1');
    end;
  end;

  with Self.Table.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('MIKTAR');
    end;
    with Join do
    begin
      Clear;
      Add('EVRAKNO', 'EVRAKNO');
      Add('URETIMNO', 'URETIMNO');
      Add('URETIMSIRANO', 'URETIMSIRANO');
      Add('OPERASYONNO', 'OPERASYONNO');
      Add('KAYNAKKOD', 'KAYNAKKOD');
    end;
  end;

  with Self.Table.TableItems[2] do
  begin
    with Fields do
    begin
      Clear;
      Add('TUKETIMTIP');
//      Add('ONCEKIISLEMNO');
//      Add('ONCEKIISLEMDURUM');
//      Add('EYLEMTIP');
    end;
    with Join do
    begin
      Clear;
      Add('KAYNAKKOD', 'KAYNAKKOD');
      Add('ISLEMNO', 'ISLEMNO');
    end;
  end;

  Self.GridView.OnCustomDrawCell := CustomDrawCell;
end;

end.
