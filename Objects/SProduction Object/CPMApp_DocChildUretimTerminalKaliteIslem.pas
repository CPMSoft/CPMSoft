unit CPMApp_DocChildUretimTerminalKaliteIslem;

interface

uses
  Windows, SysUtils, ComCtrls,
  cxGridCustomTableView, cxGridDBTableView, cxGraphics,
  CPMApp_DataObject, CPMApp_DataObjectDB,
  CPMApp_DocApp,
  CPMApp_Storage,
  CPMApp_DocObjectModel,
  CPMApp_DocChildGrid,
  CPMApp_DocChildSearchTable,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_DocChildUretimTerminalProperties,
  CPMApp_DAPCustomUretimKart;

type
  TAppDocChildUretimTerminalKaliteYenidenIslemList = class;
  TAppDocChildUretimTerminalKaliteYenidenIslemSecim = class;

  TAppDocChildUretimTerminalKaliteYenidenIslemList = class(TAppDocChildSearchTable)
  private
    fDataApp: TAppDAPCustomUretimKart;
    fDocApp: TAppDocApp;
    AFormTerminalMenu: TAppDocFormUretimTerminalMenu;
  private
    procedure OnClickTitleExit(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
    procedure GridOnDblClick(Sender: TObject);
  private
    procedure CreateGridButtons;
    procedure PrepareDefination;
  private
  protected
    procedure CreateObjects;
    procedure CreateTitlePanel;
    procedure AfterCreate; override;
  public
    procedure DoStart(EvrakNo, UretimNo: String; UretimSiraNo, OperasyonNo: Integer; KaynakKod: String; IslemNo: Smallint);
  public
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DocApp: TAppDocApp read fDocApp write fDocApp;
    property DataApp: TAppDAPCustomUretimKart read fDataApp write fDataApp;
  published
  end;

  TAppDocChildUretimTerminalKaliteYenidenIslemSecim = class(TAppDocChildGrid)
  private
    CIslemTip: TcxGridDBColumn;
    FTableCustom: TAppDBTable;
    fDataApp: TAppDAPCustomUretimKart;
    fDocApp: TAppDocApp;
    AFormTerminalMenu: TAppDocFormUretimTerminalMenu;
  private
    procedure CreateTable;
    procedure PrepareDefination;
    procedure OnClickTitleNext(Sender: TObject);
  private
    procedure CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  protected
    procedure CreateTitlePanel;
    procedure CreateObjects;
    procedure AfterCreate; override;
  public
    procedure DoAddIslem;
  public
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DocApp: TAppDocApp read fDocApp write fDocApp;
    property DataApp: TAppDAPCustomUretimKart read fDataApp write fDataApp;
    property TableCustom: TAppDBTable read FTableCustom write FTableCustom;
  end;


  Const
  { Ýþlem Tipleri }
  itHammaddeTuketim: Smallint = 1;
  itKalite: Smallint = 2;

  { Ýþlem Kod }
  ikNormal: Smallint = 0;
  ikRework: Smallint = 1;

implementation

uses
  DB, Forms,
  Variants,
  CPMApp_Images,
  CPMApp_Dialogs,
  CPMApp_TableItems,
  CPMApp_BOMConsts,
  CPMApp_ToolBarHelper,
  CPMApp_DOPUretimTerminalVeriGiris,
  CPMApp_DocFormUretimTerminalNumPad, CPMApp_TableStokSystem;

{ TAppDocChildUretimTerminalKaliteYenidenIslemList }
procedure TAppDocChildUretimTerminalKaliteYenidenIslemList.GridOnDblClick(
  Sender: TObject);
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do begin
    if ChildUretimTerminalKaliteYenidenIslemSecim.TableCustom.Locate('ISLEMNO', Self.Table.FieldValues['ISLEMNO'], []) then
      exit;
    ChildUretimTerminalKaliteYenidenIslemSecim.TableCustom.Insert;
    ChildUretimTerminalKaliteYenidenIslemSecim.TableCustom.FieldValues['ID'] := (ChildUretimTerminalKaliteYenidenIslemSecim.TableCustom.RecordCount +1) *10;
    ChildUretimTerminalKaliteYenidenIslemSecim.TableCustom.FieldValues['EVRAKNO'] := Self.Table.FieldValues['EVRAKNO'];
    ChildUretimTerminalKaliteYenidenIslemSecim.TableCustom.FieldValues['URETIMNO'] := Self.Table.FieldValues['URETIMNO'];
    ChildUretimTerminalKaliteYenidenIslemSecim.TableCustom.FieldValues['OPERASYONNO'] := Self.Table.FieldValues['OPERASYONNO'];
    ChildUretimTerminalKaliteYenidenIslemSecim.TableCustom.FieldValues['ISLEMNO'] := Self.Table.FieldValues['ISLEMNO'];
    ChildUretimTerminalKaliteYenidenIslemSecim.TableCustom.FieldValues['OPERATORKOD'] := Self.Table.FieldValues['OPERATORKOD'];
    ChildUretimTerminalKaliteYenidenIslemSecim.TableCustom.FieldValues['ACIKLAMA'] := Self.Table.FieldValues['ACIKLAMA'];
    ChildUretimTerminalKaliteYenidenIslemSecim.TableCustom.FieldValues['ISLEMTIP'] := Self.Table.FieldValues['ISLEMTIP'];
    ChildUretimTerminalKaliteYenidenIslemSecim.TableCustom.FieldValues['DURUM'] := Self.Table.FieldValues['DURUM'];
    ChildUretimTerminalKaliteYenidenIslemSecim.TableCustom.Post;
  end;
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemList.AfterCreate;
begin
  PrepareDefination;
  CreateObjects;
  inherited;
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemList.CreateGridButtons;
begin
//  Self.Table.TableItems[0].Where.Clear;
//  Self.Table.TableItems[0].Where.AddText('0 = 1');
  Self.ReadOnly := false;
  Self.Run;
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemList.CreateObjects;
begin
  AFormTerminalMenu := TAppDocFormUretimTerminalMenu.Create(nil);
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemList.CreateTitlePanel;
begin
  AFormTerminalMenu.PanelGlobal_TopMenu.Parent := Self.Form;
  AFormTerminalMenu.PanelGlobal_TopMenu_Description.Caption := 'Ýþlem Listesi';
//  AFormTerminalMenu.PanelKaliteKontrol_ReworkBottom.Parent := Self.Form;

//  AFormTerminalMenu.ToolButtonKaliteKontrol_SonrakiAdim.Enabled := true;
//  AFormTerminalMenu.ToolButtonKaliteKontrol_KaydetVeTamamla.Enabled := false;

  AFormTerminalMenu.btTitleBack.OnClick := OnClickTitleBack;
  AFormTerminalMenu.btTitleExit.OnClick := OnClickTitleExit;
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemList.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateGridButtons;
  CreateTitlePanel;
//  Self.GridView.OnCustomDrawCell := CustomDrawCell;
  Self.GridView.OptionsData.Editing := true;
  Self.ToolBar.Visible := false;
end;

destructor TAppDocChildUretimTerminalKaliteYenidenIslemList.Destroy;
begin

  inherited;
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemList.DoStart(EvrakNo, UretimNo: String; UretimSiraNo, OperasyonNo: Integer; KaynakKod: String; IslemNo: Smallint);
begin
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
    Add('ISLEMNO', wcLess, IslemNo);
  end;
  Self.Run;
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemList.Initialize(
  IniFile: TAppIniFile);
begin
  inherited;
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemList.OnClickTitleBack(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalKaliteEvrakList.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemList.OnClickTitleExit(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemList.PrepareDefination;
begin
  Self.Name := 'ChildUretimTerminalKaliteYenidenIslem';
  Self.Caption := 'Kalite Kontrol Yeniden Ýþlem List';
  Self.PipelineName := 'ppKaliteYenidenIslem';
  Self.Table.TableItems.TableNames := VarArrayOf(['URTRKI']);
  Self.Table.TableItems.TableCaptions := VarArrayOf(['Üretim Kart Ýþlem']);
  Self.Table.TableItems.OrderBy.Add('ISLEMNO', otAsc);

  with Self.Table.TableItems[0] do begin
    with Fields do
    begin
      Clear;
      Add('*');
    end;
    with Where do begin
      Clear;
      Add('DURUM', wcInList, VarArrayOf([odFinished])).DataType := ftInteger;
    end;
  end;
  Self.GridView.OnDblClick := GridOnDblClick;
end;

{ TAppDocChildUretimTerminalKaliteYenidenIslemSecim }

procedure TAppDocChildUretimTerminalKaliteYenidenIslemSecim.AfterCreate;
begin
  PrepareDefination;
  CreateObjects;
  inherited;
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemSecim.CreateObjects;
begin
  AFormTerminalMenu := TAppDocFormUretimTerminalMenu.Create(nil);
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemSecim.CreateTable;
  procedure CreateDataSet;
  begin
    TableCustom.FieldDefs.Clear;
    with TableCustom.FieldDefs do
    begin
      Add('ID', ftInteger, 0);
      Add('ISLEMNO', ftSmallint, 0);
      Add('EVRAKNO', ftString, 30);
      Add('ISLEMTIP', ftString, 50);
      Add('URETIMNO', ftString, 30);
      Add('OPERASYONNO', ftSmallint, 0);
      Add('ACIKLAMA', ftString, 60);
      Add('DURUM', ftSmallint, 0);
      Add('OPERATORKOD', ftString, 30);
      Add('ACIKLAMA1', ftString, 60);
      Add('ACIKLAMA2', ftString, 60);
      Add('ACIKLAMA3', ftString, 60);
      Add('ACIKLAMA4', ftString, 60);
      Add('ACIKLAMA5', ftString, 60);
    end;
    TableCustom.CreateFields;
    TableCustom.CreateDataSet;
    TableCustom.IndexFieldNames := 'ID';
//    TableCustom.Open;
  end;
begin
  TableCustom := TAppDBTable.Create(nil);
  TableCustom.Name := 'TableUretimTerminalKaliteYenidenIslemSecim';
  TableCustom.ProviderName := 'pr' + TableCustom.Name;
  TableCustom.EnableLogChanges := False;
  TableCustom.TableItems.TableReferans := 'URTRKI';
//  TableCustom.TableItems.OrderBy.Add('ISLEMNO', otAsc);
//  TableCustom.DoInitializeRecord;
  CreateDataSet;
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemSecim.CreateTitlePanel;
begin
//  AFormTerminalMenu.PanelKaliteKontrol_GlobalTop.Parent := Self.Form;
  AFormTerminalMenu.PanelKaliteKontrol_ReworkBottom.Parent := Self.Form;

  AFormTerminalMenu.ToolButtonKaliteKontrol_SonrakiAdim.Enabled := true;
  AFormTerminalMenu.ToolButtonKaliteKontrol_SonrakiAdim.OnClick := OnClickTitleNext;

  AFormTerminalMenu.ToolButtonKaliteKontrol_KaydetVeTamamla.Enabled := false;

//  AFormTerminalMenu.ToolButtonKaliteKontrol_GlobalTitleBack.OnClick := OnClickTitleBack;
//  AFormTerminalMenu.ToolButtonKaliteKontrol_GlobalTitleExit.OnClick := OnClickTitleExit;

//  AFormTerminalMenu.ToolButtonKaliteKontrol_KaydetVeTamamla.OnClick :=




//  AFormTerminalMenu.PanelKaliteKontrol_YenidenIslemeGirecekler.Parent := Self.Form;
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemSecim.CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  CIslemTip := GridView.GetColumnByFieldName('ISLEMTIP');

  if (AViewInfo.GridRecord.Values[CIslemTip.Index] = itHammaddeTuketim) then
    ACanvas.Brush.Color := RGB(255, 172, 132);
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemSecim.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  Self.GridView.OnCustomDrawCell := CustomDrawCell;
  CreateTitlePanel;
end;

destructor TAppDocChildUretimTerminalKaliteYenidenIslemSecim.Destroy;
begin
  FreeAndNil(FTableCustom);
  inherited;
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemSecim.Initialize(
  IniFile: TAppIniFile);
begin
  inherited;
end;


procedure TAppDocChildUretimTerminalKaliteYenidenIslemSecim.OnClickTitleNext(
  Sender: TObject);
var
  HammaddeTuketimVarMi: Boolean;
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    if ChildUretimTerminalKaliteYenidenIslemSecim.TableCustom.IsEmpty then begin
      DocCustomProperties.AppForms.AppFormMessageDialog('Ýþlem seçmeden devam edemezsiniz!');
      Exit;
    end;
    
    HammaddeTuketimVarMi := false;
    with ChildUretimTerminalKaliteYenidenIslemSecim do
    begin
      TableCustom.First;
      while not TableCustom.Eof do
      begin
        if TableCustom.FieldValues['ISLEMTIP'] = itHammaddeTuketim then
          HammaddeTuketimVarMi := true;
      TableCustom.Next;
      end;
    end;
    if HammaddeTuketimVarMi then
    begin
      ChildUretimTerminalKaliteHMSecimHareket.TableCustom.EmptyTable;
      ChildUretimTerminalKaliteHMSecimStepOne.DoStart;
      ShowThisDockPanel(ChildUretimTerminalKaliteHMSecimStepOne.DockPanel.Name);
      ShowThisDockPanel(ChildUretimTerminalKaliteHMSecimHareket.DockPanel.Name, True);
    end
    else
      DoAddIslem;
  end;
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemSecim.DoAddIslem;
var
  I: Integer;
  IslemNo: Smallint;
  procedure AddIslem(Aciklama: String; IslemTip: Smallint; OperatorKod: String);
  begin
    DataApp.UretimRotaKaynakIslem.Table.Append;
    DataApp.UretimRotaKaynakIslem.Table.FieldValues['ISLEMKOD'] := ikRework;
    DataApp.UretimRotaKaynakIslem.Table.FieldValues['KULLANILAN'] := 1;
    DataApp.UretimRotaKaynakIslem.Table.IslemNo := IslemNo + I;
    DataApp.UretimRotaKaynakIslem.Table.Aciklama := Aciklama;
    DataApp.UretimRotaKaynakIslem.Table.IslemTip := IslemTip;
    DataApp.UretimRotaKaynakIslem.Table.KaynakKod := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.KaynakKod;
    DataApp.UretimRotaKaynakIslem.Table.OperatorKod := OperatorKod;
    DataApp.UretimRotaKaynakIslem.Table.Durum := odNone;
    DataApp.UretimRotaKaynakIslem.Table.Post;

    if IslemTip = itHammaddeTuketim then         // Veysel Kaldýrdý
    begin
      TAppDOPUretimTerminalVeriGiris(DocApp)
        .ChildUretimTerminalKaliteHMSecimHareket.AddStokHareket(IslemNo + I);
    end;
  end;

begin
  IslemNo := TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.OpIslemNo;

  I := 1;
  TableCustom.First;
  while not TableCustom.Eof do begin
    AddIslem(TableCustom.FieldValues['ACIKLAMA'],
             TableCustom.FieldValues['ISLEMTIP'],
             TableCustom.FieldValues['OPERATORKOD']);
    I := I + 1;
    TableCustom.Next;
  end;

  // Kalite Kontrol Ýþlemini tekrardan son iþlem olarak ekliyoruz.
  I := I + 1;
  with TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalKaliteEvrakList do
  begin
    AddIslem(Table.FieldValues['ACIKLAMA'], 2, 'KAL');
  end;

//  TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.ClassKaliteKontrol.DoOpenDocument;
  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    DataApp.DataObject.Save;
//    TerminalParametre.ClassKaliteKontrol.DoOpenDocument;
    TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.ClassKaliteKontrol.DoOpenDocument;
    DoFinishOperasyon;
    DataApp.DataObject.Save;
    DocCustomProperties.AppForms.AppFormMessageDialog('Ýþlem Tamamlandý!');
    ChildUretimTerminalKaliteEvrakList.Run;
    ShowThisDockPanel(ChildUretimTerminalKaliteEvrakList.DockPanel.Name);
  end;
end;

procedure TAppDocChildUretimTerminalKaliteYenidenIslemSecim.PrepareDefination;
begin
  CreateTable;

  Self.FormName := 'TableUretimTerminalKaliteYenidenIslemSecimForm';
  Self.GridName := 'grTableUretimTerminalKaliteYenidenIslemSecim';
  Self.Caption := 'Yeniden Ýþlem Seçim';
  Self.PipelineName := 'ppTableUretimTerminalKaliteYenidenIslemSecim';
  Self.TableObject := TableCustom;

end;

end.
