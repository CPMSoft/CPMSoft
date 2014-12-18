unit CPMApp_YenidenMaliyetlendirme;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CPMApp_DB, CPMApp_SqlView, CPMApp_Form, CPMApp_Storage,
  Menus, cxLookAndFeelPainters, cxGraphics, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit,
  cxImageComboBox, StdCtrls, cxButtons, cxContainer, cxLabel,
  dxNavBarCollns, dxNavBarBase, dxNavBar, cxFilterControl,
  cxDBFilterControl, ActnList, CPMApp_TableItems, 
  CPMApp_GridBar, CPMApp_Desktop, cxLookAndFeels, dxSkinsCore,
  dxSkinsdxNavBar2Painter, dxSkinscxPCPainter;

type
  TFormYenidenMaliyetlendirme = class(TAppForm)
    NavBar: TdxNavBar;
    NavBarGroupDevir: TdxNavBarGroup;
    NavBarGroupDevirControl: TdxNavBarGroupControl;
    btStart: TcxButton;
    lblMaliyetTip: TcxLabel;
    edMaliyetTip: TcxImageComboBox;
    lblBasTarih: TcxLabel;
    edBasTarih: TcxDateEdit;
    lblBitTarih: TcxLabel;
    edBitTarih: TcxDateEdit;
    edKirilimTip: TcxImageComboBox;
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    GridViewResult: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    DataSource1: TDataSource;
    DBFilterControl: TcxDBFilterControl;
    Panel3: TPanel;
    cxLabel2: TcxLabel;
    ActionList1: TActionList;
    cmSearch: TAction;
    PopupMenu1: TPopupMenu;
    AramaYap1: TMenuItem;
    edSQLString: TcxTextEdit;
    lblSQLString: TcxLabel;
    lblGuncellemeTip: TcxLabel;
    edGuncellemeTip: TcxImageComboBox;
    PanelGridBar: TPanel;
    edKirilimSeriNo: TcxImageComboBox;
    lblKirilimTip: TcxLabel;
    edKirilimVersiyonNo: TcxImageComboBox;
    lblMYBasTarih: TcxLabel;
    edMYBasTarih: TcxDateEdit;
    lblDefterTip: TcxLabel;
    edDefterTip: TcxImageComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btStartClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmSearchExecute(Sender: TObject);
    procedure edGuncellemeTipPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FDataSet: TAppDataSet;
    FDataSetFilter: TAppMemDataSet;
    FTableItems: TAppCustomTableItems;
    FIniFile: TAppIniFile;
    FDesktopIniFile: TAppIniFile;
    FAppStorage: TAppStorage;
    FGridBar: TAppGridBar;
    FDesktop: TAppDesktop;
    FAppName: String;
    procedure DoSearchFilter;
    procedure LoadParams;
    procedure SaveParams;
    procedure PrepareGrid;
    procedure SetAppName(const Value: String);
  public
    { Public declarations }
    property GridBar: TAppGridBar read FGridBar;
    property AppStorage: TAppStorage read FAppStorage;
    property Desktop: TAppDesktop read FDesktop;
    property AppName: String read FAppName write SetAppName;
  end;

{var
  FormYenidenMaliyetlendirme: TFormYenidenMaliyetlendirme;}

implementation

uses CPMApp_Security, CPMApp_StrUtils, CPMApp_DevExpressUtils, CPMApp_Dialogs,
  CPMApp_SkinHelper, CPMApp_FieldProp, CPMApp_GridHelper, CPMApp_GridDialog,
  CPMApp_DBLibrary, CPMApp_File;

{$R *.dfm}

procedure FilterControlDisableSpace(FilterControl: TcxDBFilterControl);
var
  I: Integer;
begin
  for I := 0 to FilterControl.ControlCount - 1 do
  begin
    if FilterControl.Controls[I] is TcxComboBox then // unit cxDropDownEdit
    begin
      TcxComboBox(FilterControl.Controls[I]).OnKeyDown := nil;
      TcxComboBox(FilterControl.Controls[I]).OnKeyPress := nil;
    end;
  end;
end;

procedure TFormYenidenMaliyetlendirme.FormCreate(Sender: TObject);
begin
  AppSkinHelper.SetNavBar(NavBar, False);

  FDataSet := TAppDataSet.Create(Self);
  FDataSet.AppConnection := AppSecurity.ConnectionApp;
  FDataSet.ProviderName := 'prCommand';
  DataSource1.DataSet := FDataSet;

  FDataSetFilter := TAppMemDataSet.Create(Self);
  DBFilterControl.DataSet := FDataSetFilter;

  FTableItems := TAppCustomTableItems.Create(nil);
  FTableItems.TableNames := 'STKKRT';
  FTableItems.TableCaptions := 'Stok Kart';
  AppFieldProp.CreateItems(DBFilterControl, FTableItems);

  FAppStorage := TAppStorage.Create(Self);
  FAppStorage.Connection := AppSecurity.ConnectionApp;
  FAppStorage.CompanyNo := AppSecurity.DBCompanyNo;

  FDesktop := TAppDesktop.Create(Self);

  FIniFile := TAppIniFile.Create;
  FDesktopIniFile := TAppIniFile.Create;

  FGridBar := TAppGridBar.Create(Self);
end;

procedure TFormYenidenMaliyetlendirme.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FDataSet);
  FreeAndNil(FDataSetFilter);
  FreeAndNil(FTableItems);
  FreeAndNil(FDesktop);
  FreeAndNil(FIniFile);
  FreeAndNil(FDesktopIniFile);
  FreeAndNil(FGridBar);
  FreeAndNil(FAppStorage);
end;

procedure TFormYenidenMaliyetlendirme.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveParams;
  Action := caFree;
end;

procedure TFormYenidenMaliyetlendirme.btStartClick(Sender: TObject);
var
  vSirketNo, vWhereClause, vSQLStr: String;
  vDefterTip: Integer;
  vMaliyetTip, vKirilimTip, vKirilimVersiyonNo, vKirilimSeriNo, vGuncellemeTip: Integer;
  vMYBasTarih, vBasTarih, vBitTarih: Integer;
begin
  vSirketNo := AppSecurity.DBCompanyNo;
  vDefterTip := edDefterTip.EditValue;
  // vFaizEtkiTip, vOTVEtkiTip ve VKDVEtkiTip'ini bilerek göndermiyorum, Procedürden default deðeri çekmesi daha iyi bir yapý kurana kadar.
  vMaliyetTip := edMaliyetTip.EditValue;
  vKirilimTip := edKirilimTip.EditValue;
  vKirilimVersiyonNo := edKirilimVersiyonNo.EditValue;
  vKirilimSeriNo := edKirilimSeriNo.EditValue;
  vMYBasTarih := Trunc(edMYBasTarih.EditValue);
  vBasTarih := Trunc(edBasTarih.EditValue);
  vBitTarih := Trunc(edBitTarih.EditValue);
  vWhereClause := AppReplaceStr(DBFilterControl.FilterText, '''', '''''');
  vGuncellemeTip := edGuncellemeTip.EditValue;

  vSQLStr := 'EXEC dbo.SPAPP_SMMUPDATE @SIRKETNO = ''%s''';
  vSQLStr := vSQLStr + ', @DEFTERTIP = %d';
  vSQLStr := vSQLStr + ', @MALIYETTIP = %d';
  vSQLStr := vSQLStr + ', @KIRILIMTIP = %d';
  vSQLStr := vSQLStr + ', @KIRILIMVERSIYONNO = %d';
  vSQLStr := vSQLStr + ', @KIRILIMSERINO = %d';
  vSQLStr := vSQLStr + ', @MYBASTARIH = %s';
  vSQLStr := vSQLStr + ', @BASTARIH = %s';
  vSQLStr := vSQLStr + ', @BITTARIH = %s';
  vSQLStr := vSQLStr + ', @WHERECLAUSE = ''%s''';
  vSQLStr := vSQLStr + ', @GUNCELLEMETIP = %d';
  vSQLStr := Format(vSQLStr,
        [
          vSirketNo,
          vDefterTip,
          vMaliyetTip,
          vKirilimTip,
          vKirilimVersiyonNo,
          vKirilimSeriNo,
          AppVarToSqlStr(ftDate, vMYBasTarih),
          AppVarToSqlStr(ftDate, vBasTarih),
          AppVarToSqlStr(ftDate, vBitTarih),
          vWhereClause,
          vGuncellemeTip
        ]);
  vSQLStr := AppReplaceStr(vSQLStr, '"', '''');
  edSQLString.EditValue := vSQLStr;
  if not AppConfirm('Yeniden maliyetlendirme çalýþtýr?') then
    exit;
  if not AppConfirm('Yeniden maliyetlendirme baþlatýlacaktýr emin misiniz?') then
    exit;
  FDataSet.Close;
  FDataSet.CommandText := vSQLStr;
  FDataSet.Open;
  if GridViewResult.ColumnCount = 0 then
    GridViewResult.DataController.CreateAllItems;
end;

procedure TFormYenidenMaliyetlendirme.FormShow(Sender: TObject);
begin
  FilterControlDisableSpace(DBFilterControl);
  LoadParams;
end;

procedure TFormYenidenMaliyetlendirme.DoSearchFilter;
begin
  if Screen.ActiveControl is TcxCustomInnerTextEdit then
  begin
    if Screen.ActiveControl.Parent.Parent is TcxDBFilterControl then
      SearchFilter(FDataSet.AppConnection, (Screen.ActiveControl as TcxCustomInnerTextEdit), FTableItems, (Screen.ActiveControl.Parent.Parent as TcxDBFilterControl));
  end;
end;

procedure TFormYenidenMaliyetlendirme.edGuncellemeTipPropertiesChange(
  Sender: TObject);
begin
  if edGuncellemeTip.EditValue = 1 then
  begin
    edMaliyetTip.EditValue := 3;
    edMaliyetTip.Enabled := False;
  end else
  begin
    edMaliyetTip.Enabled := True;
  end;
end;

procedure TFormYenidenMaliyetlendirme.cmSearchExecute(Sender: TObject);
begin
  DoSearchFilter;
end;

procedure TFormYenidenMaliyetlendirme.PrepareGrid;
  procedure CreateDataSet;
  begin
    FDataSet.TableItems.TableNames := VarArrayOf(['SMMEXC', 'STKHAR']);
    FDataSet.TableItems.TableAlias := VarArrayOf(['SMMEXC', 'STHKRS']);
    FDataSet.TableItems.TableReferans := VarArrayOf(['SMMEXC_STKHAR', 'STKHAR']);
    FDataSet.TableItems.TableCaptions := VarArrayOf(['SMM Ýstisnalarý', 'Karþý']);
    FDataSet.FieldDefs.Clear;
    with FDataSet.FieldDefs do
    begin
      Add('ID', ftInteger);
      Add('UYARITIP', ftInteger);
      Add('HAREKETID', ftInteger);
      Add('SIRKETNO', ftString, 3);
      Add('EVRAKTIP', ftInteger);
      Add('HESAPKOD', ftString, 30);
      Add('EVRAKNO', ftString, 30);
      Add('SIRANO', ftInteger);
      Add('MALKOD', ftString, 30);
      Add('VERSIYONNO', ftString, 30);
      Add('ISLEMTIP', ftInteger);
      Add('GIRISCIKIS', ftInteger);
      Add('MIKTAR', ftFloat);
      Add('TUTAR', ftFloat);
      Add('DOVIZTUTAR', ftFloat);
      Add('ESKITUTAR', ftFloat);
      Add('ESKIDOVIZTUTAR', ftFloat);
      Add('MALIYET', ftFloat);
      Add('DOVIZMALIYET', ftFloat);
      Add('STOKMIKTAR', ftFloat);
      Add('STOKMALIYET', ftFloat);
      Add('STOKDOVIZMALIYET', ftFloat);
      Add('KARSIHAREKETID', ftInteger);
      Add('STHKRS_MALKOD', ftString, 30);
      Add('STHKRS_VERSIYONNO', ftString, 30);
    end;
    FDataSet.CreateFields;
    FDataSet.CreateDataSet;
  end;

begin
  CreateDataSet;

  AppGridHelper.Default(GridViewResult);
  AppGridHelper.ReadOnly(GridViewResult);
  AppFieldProp.CreateItems(GridViewResult);

  FAppStorage.LoadIniFile(FDesktopIniFile, AppPreparePath(['Yeniden Maliyetlendirme', 'GridProps']), '');
  FDesktop.LoadComponentFromMemIniFile(GridViewResult, FDesktopIniFile);

  GridBar.Parent  := PanelGridBar;
  GridBar.GridView := GridViewResult;
  GridBar.Initialize;
end;

procedure TFormYenidenMaliyetlendirme.LoadParams;
const
  ASection = 'Ayarlar';
begin
  PrepareGrid;

  FAppStorage.LoadIniFile(FIniFile, 'Yeniden Maliyetlendirme', 'Params');
  LoadFormFromMemIniFile(FIniFile);
  edGuncellemeTip.EditValue := FIniFile.ReadInteger(ASection, 'GuncellemeTip', 0);
  edDefterTip.EditValue := FIniFile.ReadInteger(ASection, 'DefterTip', 0);
  edMaliyetTip.EditValue := FIniFile.ReadInteger(ASection, 'MaliyetTip', 3);
  edKirilimTip.EditValue := FIniFile.ReadInteger(ASection, 'KirilimTip', 0);
  edKirilimVersiyonNo.EditValue := FIniFile.ReadInteger(ASection, 'KirilimVersiyonNo', 0);
  edKirilimSeriNo.EditValue := FIniFile.ReadInteger(ASection, 'KirilimSeriNo', 0);
  edMYBasTarih.EditValue := FIniFile.ReadInteger(ASection, 'MYBasTarih', 0);
  edBasTarih.EditValue := FIniFile.ReadInteger(ASection, 'BasTarih', 0);
  edBitTarih.EditValue := FIniFile.ReadInteger(ASection, 'BitTarih', Trunc(Date));
end;

procedure TFormYenidenMaliyetlendirme.SaveParams;
const
  ASection = 'Ayarlar';
begin
  FIniFile.WriteInteger(ASection, 'GuncellemeTip', edGuncellemeTip.EditValue);
  FIniFile.WriteInteger(ASection, 'DefterTip', edDefterTip.EditValue);
  FIniFile.WriteInteger(ASection, 'MaliyetTip', edMaliyetTip.EditValue);
  FIniFile.WriteInteger(ASection, 'KirilimTip', edKirilimTip.EditValue);
  FIniFile.WriteInteger(ASection, 'KirilimVersiyonNo', edKirilimVersiyonNo.EditValue);
  FIniFile.WriteInteger(ASection, 'KirilimSeriNo', edKirilimSeriNo.EditValue);
  FIniFile.WriteInteger(ASection, 'MYBasTarih', Trunc(edMYBasTarih.EditValue));
  FIniFile.WriteInteger(ASection, 'BasTarih', Trunc(edBasTarih.EditValue));
  FIniFile.WriteInteger(ASection, 'BitTarih', Trunc(edBitTarih.EditValue));
  SaveFormToMemIniFile(FIniFile);
  FAppStorage.SaveIniFile(FIniFile, 'Yeniden Maliyetlendirme', 'Params');

  FDesktop.SaveComponentToMemIniFile(GridViewResult, FDesktopIniFile);
  FAppStorage.SaveIniFile(FDesktopIniFile, AppPreparePath(['Yeniden Maliyetlendirme', 'GridProps']), '');
end;

procedure TFormYenidenMaliyetlendirme.SetAppName(const Value: String);
begin
  FAppName := Value;
  FAppStorage.AppName := Value;
end;

end.
