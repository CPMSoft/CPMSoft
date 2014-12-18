unit CPMApp_DOPEvrakUretimIslem;

interface

uses
  Variants,
  CPMApp_DocObjectModel, CPMApp_DocApp, CPMApp_DataApp,
  CPMApp_DocChildVGrid,
  CPMApp_DocChildGrid,
  CPMApp_DocChildEvrakOzelBaglanti,
  CPMApp_DocChildEvrakUretimParametre,
  CPMApp_DocChildEvrakUretimBaglanti,
  CPMApp_DOPEvrakIslem,
  CPMApp_DAPCustomEvrakUretimIslem;

type
  TAppDOPEvrakUretimIslem = class(TAppDOPMultiEvrakIslem)
  private
    procedure Hareket2MamulKartAlanAktarimClick(Sender: TObject);
  private
    FChildUretimParametre: TAppDocChildEvrakUretimParametre;
    FChildUretimKart: TAppDocChildVGrid;
    FChildUretimRota: TAppDocChildGrid;
    FChildUretimRotaKaynak: TAppDocChildGrid;
    FChildUretimRotaKaynakIslem: TAppDocChildGrid;
    FChildUretimRotaKaynakOperasyon: TAppDocChildGrid;
    FChildUretimRotaKaynakDurus: TAppDocChildGrid;
    FChildUretimRotaKaynakHata: TAppDocChildGrid;
    FChildUretimError: TAppDocChildGrid;
    FChildEvrakUretimBaglanti: TAppDocChildEvrakUretimBaglanti;
    procedure CreateChildUretimParametre;
    procedure CreateChildUretimKart;
    procedure CreateChildUretimRota;
    procedure CreateChildUretimRotaKaynak;
    procedure CreateChildUretimRotaKaynakIslem;
    procedure CreateChildUretimRotaKaynakOperasyon;
    procedure CreateChildUretimRotaKaynakDurus;
    procedure CreateChildUretimRotaKaynakHata;
    procedure CreateChildUretimError;
    procedure CreateChildEvrakUretimBaglanti;
    procedure DoUretimMessage(Msg: String);
  protected
    procedure SetDAPSecurity; override;
    function GetDataApp: TAppDAPEvrakUretimIslem;
    procedure SetDataApp(const Value: TAppDAPEvrakUretimIslem);
    function CreateDataApp: TAppDataApp; override;
    procedure CreateMenuItems; override;
    procedure CreateDocChilds; override;
  public
    procedure CreateChildEvrakOzelBaglanti; override;
    procedure TranslationChanged; override;
  published
    property DataApp: TAppDAPEvrakUretimIslem read GetDataApp write SetDataApp;
    property ChildUretimParametre: TAppDocChildEvrakUretimParametre read FChildUretimParametre;
    property ChildUretimKart: TAppDocChildVGrid read FChildUretimKart;
    property ChildUretimRota: TAppDocChildGrid read FChildUretimRota;
    property ChildUretimRotaKaynak: TAppDocChildGrid read FChildUretimRotaKaynak;
    property ChildUretimRotaKaynakIslem: TAppDocChildGrid read FChildUretimRotaKaynakIslem;
    property ChildUretimRotaKaynakOperasyon: TAppDocChildGrid read FChildUretimRotaKaynakOperasyon;
    property ChildUretimRotaKaynakDurus: TAppDocChildGrid read FChildUretimRotaKaynakDurus;
    property ChildUretimRotaKaynakHata: TAppDocChildGrid read FChildUretimRotaKaynakHata;
    property ChildUretimError: TAppDocChildGrid read FChildUretimError;
    property ChildEvrakUretimBaglanti: TAppDocChildEvrakUretimBaglanti read FChildEvrakUretimBaglanti;
  end;

  TAppDOPEvrakUretimSonuclandirma = class(TAppDOPBaseEvrakIslem)
  private
    FChildEvrakUretimBaglanti: TAppDocChildEvrakUretimBaglanti;
    procedure CreateChildEvrakUretimBaglanti;
  protected
    function GetDataApp: TAppDAPEvrakUretimSonuclandirma;
    procedure SetDataApp(const Value: TAppDAPEvrakUretimSonuclandirma);
    function CreateDataApp: TAppDataApp; override;
    procedure CreateDocChilds; override;
  public
  published
    property DataApp: TAppDAPEvrakUretimSonuclandirma read GetDataApp write SetDataApp;
    property ChildEvrakUretimBaglanti: TAppDocChildEvrakUretimBaglanti read FChildEvrakUretimBaglanti;
  end;

implementation

uses
  CPMApp_StrUtils, CPMApp_Images, 
  CPMApp_SProductionConsts, CPMApp_SProductionStrs,
  CPMApp_DocumentConsts;

{ TAppDOPEvrakUretimSonuclandirma }

procedure TAppDOPEvrakUretimSonuclandirma.CreateChildEvrakUretimBaglanti;
begin
  FChildEvrakUretimBaglanti := DocObject.CreateChild(TAppDocChildEvrakUretimBaglanti, 'ChildEvrakUretimBaglanti') as TAppDocChildEvrakUretimBaglanti;
  FChildEvrakUretimBaglanti.Enabled := Security.CheckMember('EvrakUretimBaglantiAddEvrak');
  if DocObject.Desktop.IsWinCE then
    FChildEvrakUretimBaglanti.Caption := ''
  else
    FChildEvrakUretimBaglanti.Caption := AppGetRS(@AppDOPEvrakUretimIslem_ChildEvrakUretimBaglanti);

  FChildEvrakUretimBaglanti.EvrakBaglanti := DataApp.EvrakBaglanti;
  FChildEvrakUretimBaglanti.TableEvrakBaslik := DataApp.EvrakBaslik.Table;
end;

function TAppDOPEvrakUretimSonuclandirma.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPEvrakUretimSonuclandirma.Create(nil);
end;

procedure TAppDOPEvrakUretimSonuclandirma.CreateDocChilds;
begin
  ChildsOfSet := ChildsOfSet - [eicOdemeBaslik];
  inherited;
  if Security.CheckMember('EvrakUretimBaglantiForm') then
  begin
    if DataApp.ParamsEvrak.EvrakTip <> aetTersUretim then // Destek No: 1303 deðiþtirilmiþ yukarýda zaten yapýlýyor.
      CreateChildEvrakUretimBaglanti;
  end;
  if Security.CheckMember('GozDurumForm') then
    CreateChildGozDurum;
end;

function TAppDOPEvrakUretimSonuclandirma.GetDataApp: TAppDAPEvrakUretimSonuclandirma;
begin
  Result := TAppDAPEvrakUretimSonuclandirma(inherited GetDataApp);
end;

procedure TAppDOPEvrakUretimSonuclandirma.SetDataApp(
  const Value: TAppDAPEvrakUretimSonuclandirma);
begin
  inherited SetDataApp(Value);
end;

{ TAppDOPEvrakUretimIslem }

procedure TAppDOPEvrakUretimIslem.CreateChildEvrakOzelBaglanti;
begin
  inherited;
  ChildEvrakOzelBaglanti.OzelBaglantiTip := tobUretim;
end;

procedure TAppDOPEvrakUretimIslem.CreateChildUretimKart;
begin
  FChildUretimKart := DocObject.CreateChild(TAppDocChildVGrid, 'ChildUretimKart') as TAppDocChildVGrid;
  FChildUretimKart.Caption := AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimKart);
  FChildUretimKart.PipelineName := 'ppUretimKart';
  FChildUretimKart.TableObject := DataApp.UretimKart.Table;

  FChildUretimKart.CreateButton('btUretimKart', FChildUretimKart.Caption, 'Sayfalar');

  FChildUretimKart.DockPanel.ImageIndex := Integer(aiProduction);

  DocObject.Macros.AddObject(ChildUretimKart, 'ChildUretimKart');
  DocObject.Macros.AddObject(DataApp.UretimKart, 'UretimKart');
end;

procedure TAppDOPEvrakUretimIslem.CreateChildUretimParametre;
begin
  FChildUretimParametre := DocObject.CreateChild(TAppDocChildEvrakUretimParametre, 'ChildUretimParametre') as TAppDocChildEvrakUretimParametre;
  FChildUretimParametre.Caption := AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimParametre);
  FChildUretimParametre.PipelineName := 'ppUretimParametre';

  FChildUretimParametre.CreateButton('btUretimParametre', FChildUretimParametre.Caption, 'Sayfalar');

  FChildUretimParametre.ControllerUretim := DataApp.dcEvrakUretim;
end;

procedure TAppDOPEvrakUretimIslem.CreateChildUretimRota;
begin
  FChildUretimRota := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRota') as TAppDocChildGrid;
  FChildUretimRota.Caption := AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimRota);
  FChildUretimRota.PipelineName := 'ppUretimRota';
  FChildUretimRota.TableObject := DataApp.UretimRota.Table;

  FChildUretimRota.CreateButton('btUretimRota', FChildUretimRota.Caption, 'Sayfalar');

  FChildUretimRota.DockPanel.ImageIndex := Integer(aiProduction);

  DocObject.Macros.AddObject(ChildUretimRota, 'ChildUretimRota');
  DocObject.Macros.AddObject(DataApp.UretimRota, 'UretimRota');
end;

procedure TAppDOPEvrakUretimIslem.CreateChildUretimRotaKaynak;
begin
  FChildUretimRotaKaynak := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRotaKaynak') as TAppDocChildGrid;
  FChildUretimRotaKaynak.Caption := AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimRotaKaynak);
  FChildUretimRotaKaynak.PipelineName := 'ppUretimRotaKaynak';
  FChildUretimRotaKaynak.TableObject := DataApp.UretimRotaKaynak.Table;

  FChildUretimRotaKaynak.CreateButton('btUretimRotaKaynak', FChildUretimRotaKaynak.Caption, 'Sayfalar');

  FChildUretimRotaKaynak.DockPanel.ImageIndex := Integer(aiProduction);

  DocObject.Macros.AddObject(ChildUretimRotaKaynak, 'ChildUretimRotaKaynak');
  DocObject.Macros.AddObject(DataApp.UretimRotaKaynak, 'UretimRotaKaynak');
end;

procedure TAppDOPEvrakUretimIslem.CreateChildUretimRotaKaynakDurus;
begin
  FChildUretimRotaKaynakDurus := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRotaKaynakDurus') as TAppDocChildGrid;
  FChildUretimRotaKaynakDurus.Caption := AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimRotaKaynakDurus);
  FChildUretimRotaKaynakDurus.PipelineName := 'ppUretimRotaKaynakDurus';
  FChildUretimRotaKaynakDurus.TableObject := DataApp.UretimRotaKaynakDurus.Table;

  FChildUretimRotaKaynakDurus.CreateButton('btUretimRotaKaynakDurus', FChildUretimRotaKaynakDurus.Caption, 'Sayfalar');

  FChildUretimRotaKaynakDurus.DockPanel.ImageIndex := Integer(aiProduction);

  DocObject.Macros.AddObject(ChildUretimRotaKaynakDurus, 'ChildUretimRotaKaynakDurus');
  DocObject.Macros.AddObject(DataApp.UretimRotaKaynakDurus, 'UretimRotaKaynakDurus');
end;

procedure TAppDOPEvrakUretimIslem.CreateChildUretimRotaKaynakHata;
begin
  FChildUretimRotaKaynakHata := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRotaKaynakHata') as TAppDocChildGrid;
  FChildUretimRotaKaynakHata.Caption := AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimRotaKaynakHata);
  FChildUretimRotaKaynakHata.PipelineName := 'ppUretimRotaKaynakHata';
  FChildUretimRotaKaynakHata.TableObject := DataApp.UretimRotaKaynakHata.Table;

  FChildUretimRotaKaynakHata.CreateButton('btUretimRotaKaynakHata', FChildUretimRotaKaynakHata.Caption, 'Sayfalar');

  FChildUretimRotaKaynakHata.DockPanel.ImageIndex := Integer(aiProduction);

  DocObject.Macros.AddObject(ChildUretimRotaKaynakHata, 'ChildUretimRotaKaynakHata');
  DocObject.Macros.AddObject(DataApp.UretimRotaKaynakHata, 'UretimRotaKaynakHata');
end;

procedure TAppDOPEvrakUretimIslem.CreateChildUretimRotaKaynakIslem;
begin
  FChildUretimRotaKaynakIslem := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRotaKaynakIslem') as TAppDocChildGrid;
  FChildUretimRotaKaynakIslem.Caption := AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimRotaKaynakIslem);
  FChildUretimRotaKaynakIslem.PipelineName := 'ppUretimRotaKaynakIslem';
  FChildUretimRotaKaynakIslem.TableObject := DataApp.UretimRotaKaynakIslem.Table;

  FChildUretimRotaKaynakIslem.CreateButton('btUretimRotaKaynakIslem', FChildUretimRotaKaynakIslem.Caption, 'Sayfalar');

  FChildUretimRotaKaynakIslem.DockPanel.ImageIndex := Integer(aiProduction);

  DocObject.Macros.AddObject(ChildUretimRotaKaynakIslem, 'ChildUretimRotaKaynakIslem');
  DocObject.Macros.AddObject(DataApp.UretimRotaKaynakIslem, 'UretimRotaKaynakIslem');
end;

procedure TAppDOPEvrakUretimIslem.CreateChildUretimRotaKaynakOperasyon;
begin
  FChildUretimRotaKaynakOperasyon := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimRotaKaynakOperasyon') as TAppDocChildGrid;
  FChildUretimRotaKaynakOperasyon.Caption := AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimRotaKaynakOperasyon);
  FChildUretimRotaKaynakOperasyon.PipelineName := 'ppUretimRotaKaynakOperasyon';
  FChildUretimRotaKaynakOperasyon.TableObject := DataApp.UretimRotaKaynakOperasyon.Table;

  FChildUretimRotaKaynakOperasyon.CreateButton('btUretimRotaKaynakOperasyon', FChildUretimRotaKaynakOperasyon.Caption, 'Sayfalar');

  FChildUretimRotaKaynakOperasyon.DockPanel.ImageIndex := Integer(aiProduction);

  DocObject.Macros.AddObject(ChildUretimRotaKaynakOperasyon, 'ChildUretimRotaKaynakOperasyon');
  DocObject.Macros.AddObject(DataApp.UretimRotaKaynakOperasyon, 'UretimRotaKaynakOperasyon');
end;

procedure TAppDOPEvrakUretimIslem.CreateChildUretimError;
begin
  FChildUretimError := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimError') as TAppDocChildGrid;
  FChildUretimError.Caption := AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimError);
  FChildUretimError.PipelineName := 'ppUretimError';
  FChildUretimError.TableObject := DataApp.UretimError.Table;

  FChildUretimError.CreateButton('btUretimError', FChildUretimError.Caption, 'Sayfalar');

  FChildUretimError.DockPanel.ImageIndex := Integer(aiProduction);

  DocObject.Macros.AddObject(ChildUretimError, 'ChildUretimError');
  DocObject.Macros.AddObject(DataApp.UretimError, 'UretimError');
end;

procedure TAppDOPEvrakUretimIslem.CreateChildEvrakUretimBaglanti;
begin
  FChildEvrakUretimBaglanti := DocObject.CreateChild(TAppDocChildEvrakUretimBaglanti, 'ChildEvrakUretimBaglanti') as TAppDocChildEvrakUretimBaglanti;
  FChildEvrakUretimBaglanti.Enabled := Security.CheckMember('EvrakUretimBaglantiAddEvrak');
  if DocObject.Desktop.IsWinCE then
    FChildEvrakUretimBaglanti.Caption := ''
  else
    FChildEvrakUretimBaglanti.Caption := AppGetRS(@AppDOPEvrakUretimIslem_ChildEvrakUretimBaglanti);

  FChildEvrakUretimBaglanti.EvrakBaglanti := DataApp.EvrakBaglanti;
  FChildEvrakUretimBaglanti.TableEvrakBaslik := DataApp.EvrakBaslik.Table;
end;

function TAppDOPEvrakUretimIslem.CreateDataApp: TAppDataApp;
begin
  Result := TAppDAPEvrakUretimIslem.Create(nil);
end;

procedure TAppDOPEvrakUretimIslem.CreateDocChilds;
begin
  if (DataApp.ParamsEvrak.EvrakTip = aetUretim) or (DataApp.ParamsEvrak.EvrakTip = aetTersUretim) then
    ChildsOfSet := ChildsOfSet - [eicTopluHareket];
  inherited;
  if Security.CheckMember('GozDurumForm') then
    CreateChildGozDurum;
  CreateChildUretimParametre;
  CreateChildUretimKart;
  CreateChildUretimRota;
  CreateChildUretimRotaKaynak;
  CreateChildUretimRotaKaynakIslem;
  if (DataApp.ParamsEvrak.EvrakTip = aetUretim) or (DataApp.ParamsEvrak.EvrakTip = aetTersUretim) then
  begin
    CreateChildUretimRotaKaynakOperasyon;
    CreateChildUretimRotaKaynakDurus;
    CreateChildUretimRotaKaynakHata;
    CreateChildEvrakUretimBaglanti;
  end;
  CreateChildUretimError;
  if Assigned(ChildEvrakStokAlternatif) then
    ChildEvrakStokAlternatif.TableEvrakHareket := DataApp.EvrakHareket2.Table;
  DataApp.dcEvrakUretim.OnMessage := DoUretimMessage;
end;

procedure TAppDOPEvrakUretimIslem.CreateMenuItems;
begin
  inherited;
//  DocObject.DocBar.BarManager.GetItemByName('btUpdateSevkMiktar').OnClick := UpdateSevkMiktarClick;
  if DataApp.ParamsEvrak.EvrakTip = aetUretimSiparis then
    DocObject.DocBar.CreateButton('btIncHareketSiparisNo', 'Üretim Emri Seri No Ayarlarý', 'Ayarlar', suAyarlar, '', HareketSiparisNoIncClick)
  else if (DataApp.ParamsEvrak.EvrakTip = aetUretim) or (DataApp.ParamsEvrak.EvrakTip = aetTersUretim) then
    DocObject.DocBar.CreateButton('btIncHareketIrsaliyeNo', 'Üretim Seri No Ayarlarý', 'Ayarlar', suAyarlar, '', HareketIrsaliyeNoIncClick);

  DocObject.DocBar.CreateButton('btBOMTreeMatchFields', 'Evrak Hareket 2 Mamül Kart Alan Aktarýmý', 'Ayarlar', suAyarlar, '', Hareket2MamulKartAlanAktarimClick);
end;

procedure TAppDOPEvrakUretimIslem.DoUretimMessage(Msg: String);
begin
  DocObject.IMainForm.StatusMessage(Msg);
end;

function TAppDOPEvrakUretimIslem.GetDataApp: TAppDAPEvrakUretimIslem;
begin
  Result := TAppDAPEvrakUretimIslem(inherited GetDataApp);
end;

procedure TAppDOPEvrakUretimIslem.Hareket2MamulKartAlanAktarimClick(
  Sender: TObject);
begin
  DataApp.dcEvrakUretim.BOMTree.MatchFields.Execute('Evrak Hareket 2 Mamül Kart Alan Aktarýmý');
end;

procedure TAppDOPEvrakUretimIslem.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.UretimKart.Table, 'URTKRT', 'Üretim Kart');
  Security.AddTable(DataApp.UretimRota.Table, 'URTROT', 'Üretim Rota');
  Security.AddTable(DataApp.UretimRotaKaynak.Table, 'URTROK', 'Üretim Kaynak');
  Security.AddTable(DataApp.UretimRotaKaynakIslem.Table, 'URTRKI', 'Üretim Kaynak Ýþlem');
  Security.AddTable(DataApp.UretimRotaKaynakOperasyon.Table, 'URTRKO', 'Üretim Kaynak Operasyon');
  Security.AddTable(DataApp.UretimRotaKaynakDurus.Table, 'URTRKD', 'Üretim Kaynak Duruþ');
  Security.AddTable(DataApp.UretimRotaKaynakHata.Table, 'URTRKH', 'Üretim Kaynak Hata');
end;

procedure TAppDOPEvrakUretimIslem.SetDataApp(
  const Value: TAppDAPEvrakUretimIslem);
begin
  inherited SetDataApp(Value);
end;

procedure TAppDOPEvrakUretimIslem.TranslationChanged;
  procedure SetChildCaption(aChild: TAppDocChild; aCaption: String; const aButtonCaption: String = '');
  begin
    if aChild <> nil then
    begin
      aChild.Caption := aCaption;
      if aButtonCaption <> '' then
        aChild.ButtonCaption := aButtonCaption;
    end;
  end;
begin
  inherited;

  SetChildCaption(ChildUretimParametre, AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimParametre));
  SetChildCaption(ChildUretimKart, AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimKart));
  SetChildCaption(ChildUretimRota, AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimRota));
  SetChildCaption(ChildUretimRotaKaynak, AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimRotaKaynak));
  SetChildCaption(ChildUretimRotaKaynakIslem, AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimRotaKaynakIslem));
  SetChildCaption(ChildUretimRotaKaynakOperasyon, AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimRotaKaynakOperasyon));
  SetChildCaption(ChildUretimRotaKaynakDurus, AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimRotaKaynakDurus));
  SetChildCaption(ChildUretimRotaKaynakHata, AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimRotaKaynakHata));
  SetChildCaption(ChildUretimError, AppGetRS(@AppDOPEvrakUretimIslem_ChildUretimError));
  SetChildCaption(ChildEvrakUretimBaglanti, AppGetRS(@AppDOPEvrakUretimIslem_ChildEvrakUretimBaglanti));

  if DocObject.Desktop.IsWinCE then
    SetChildCaption(ChildEvrakUretimBaglanti, AppGetRS(@AppDOPEvrakUretimIslem_ChildEvrakUretimBaglanti_WinCE), AppGetRS(@AppDOPEvrakUretimIslem_ChildEvrakUretimBaglanti));
end;

initialization
  AppRegisterDOPClass(TAppDOPEvrakUretimIslem, 'TAppDOPEvrakUretimIslem'); // Yeni Evrak Üretim ve Yeni Evrak Üretim Emri için
  AppRegisterDOPClass(TAppDOPEvrakUretimSonuclandirma, 'TAppDOPEvrakUretimSonuclandirma'); // Eski Üretim Sonuçlandýrma ve Eski Ters Üretim için

end.
