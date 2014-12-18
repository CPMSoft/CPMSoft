unit CPMApp_DocChildUretimTerminalProperties;

interface

uses
  // Standart Libraries
  Controls, Classes, DB, Variants, Forms, ExtCtrls,
  // DevX Libraries
  cxEdit, cxTextEdit, cxButtonEdit, cxGridTableView, cxGridDBTableView,
  // CPM Libraries
  CPMApp_DAPCustomUretimKart, CPMApp_DocChildVGrid, CPMApp_DocApp
  ;

type
  TMsgDlgType = (mtOK, mtWarning, mtError, mtInformation, mtConfirmation, mtCustom);
  TMsgDlgBtn = (mbYes, mbNo, mbOK, mbCancel, mbAbort, mbRetry, mbIgnore, mbAll, mbNoToAll, mbYesToAll, mbHelp);
  TMsgDlgButtons = set of TMsgDlgBtn;

  TAppForms = class;
  TAppChilds = class;

  TAppDocChildUretimTerminalProperties = class
  private
    FAppForms: TAppForms;
    FAppChild: TAppChilds;
  private
    fDocApp: TAppDocApp;
    fDataApp: TAppDAPCustomUretimKart;
  public
    function DocObjectSave(DocApp: TAppDocApp;const SaveMsgText: String = ''; const ErrMsgText: String = ''): Boolean;
    constructor Create;
  published
    property AppForms: TAppForms read FAppForms;
    property AppChild: TAppChilds read FAppChild;
  published
    property DataApp: TAppDAPCustomUretimKart read fDataApp write fDataApp;
    property DocApp: TAppDocApp read fDocApp write fDocApp;
  end;

  TAppChilds = class
  public
    function  CreateGridButton(AGridView: TcxGridDBTableView): TcxGridDBColumn; overload;
    procedure CreateGridButton(AGridView: TcxGridDBTableView; AButtonEvent: TcxEditButtonClickEvent); overload;
  end;

  TAppForms = class
  private
    fDocApp: TAppDocApp;
    fDataApp: TAppDAPCustomUretimKart;
  public
    function  AppFormNumericPadInformation(DocChildVGrid: TAppDocChildVGrid; const OwnerChildName: String = ''; const Value: String = ''): Double;
    function  AppFormNumericPad(const Title: String = ''; const Value: String = ''; const PasswordChar: Boolean = false; const ShowEditPanel: Boolean = true): Double;
    procedure AppFormMessageDialog(AMessage: String; const MessageType: TMsgDlgType = mtOK; const ShowOKButton: Boolean = true; const ShowCloseButton: Boolean = false);
    procedure CreateTitlePanel(AParentForm: TForm; ACaption: String; const AButtonRefreshEvent: TNotifyEvent = nil; const AButtonBackEvent: TNotifyEvent = nil; const AButtonExitEvent: TNotifyEvent = nil;
          const AButtonScrollUpEvent: TNotifyEvent = nil; const AButtonScrollDownEvent: TNotifyEvent = nil; const ShowPanelIslemMenu: Boolean = false; const IslemMenuText1: String = ''; const IslemMenuText2: String = ''; const IslemMenuText3: String = ''; const IslemVersiyonNo: String = ''; const IslemSeriNo1: String = ''; const IslemSeriNo2: String = '');
  published
    property DataApp: TAppDAPCustomUretimKart read fDataApp write fDataApp;
    property DocApp: TAppDocApp read fDocApp write fDocApp;
  end;

implementation

uses
  SysUtils,
  cxGraphics,
  CPMApp_Dialogs,
  CPMApp_DataObject,
  CPMApp_TableItems,
  cxGridCustomTableView,
  CPMApp_DOPUretimTerminalVeriGiris,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_DocFormMessageDlg,
  CPMApp_DocFormUretimTerminalNumPad,
  CPMApp_DocFormUretimTerminalNumPadCaption,
  CPMApp_DOPCustomUretimTerminalVeriGiris;

{ TAppForms }

procedure TAppForms.AppFormMessageDialog(AMessage: String; const MessageType: TMsgDlgType;
  const ShowOKButton, ShowCloseButton: Boolean);
var
  FormMessageDlg: TAppDocFormMessaegeDlg;
  procedure CreateForm;
  begin
    FormMessageDlg := TAppDocFormMessaegeDlg.Create(nil);
    FormMessageDlg.pnlMessage_Label.Caption := AMessage;
    FormMessageDlg.pnlMessage_btOK.Visible := ShowOKButton;
    FormMessageDlg.pnlMessage_btClose.Visible := ShowCloseButton;

    case MessageType of
      mtOK: begin
        FormMessageDlg.pnlMessage_Title.Color := $00C6FFFF;
      end;
      mtError: begin
        FormMessageDlg.pnlMessage_Title.Color := $000000B7;
      end;
    end;
  end;
begin
  try
    CreateForm;
    FormMessageDlg.ShowModal;
  finally
  end;
end;


function TAppForms.AppFormNumericPad(const Title, Value: String; const PasswordChar: Boolean;
  const ShowEditPanel: Boolean): Double;
var
  formNumPad: TAppDocFormUretimTerminalNumPad;
begin
  formNumPad := TAppDocFormUretimTerminalNumPad.Create(nil);
  with formNumPad do
  begin
    GlobalTextBox := formNumPad.edtMiktar;
    GlobalTextBox.Text := Value;
    ShowEditPanel := ShowEditPanel;
    pnCaption.Caption := Title;
    Position := poScreenCenter;

    if PasswordChar then
      GlobalTextBox.Properties.EchoMode := eemPassword
    else
      GlobalTextBox.Properties.EchoMode := eemNormal;
    ShowModal;
  end;
  if formNumPad.edtMiktar.Text <> '' then
    Result :=  StrToFloat(formNumPad.edtMiktar.Text)
  else
    Result := 0;

  formNumPad.Free;
end;

function TAppForms.AppFormNumericPadInformation(DocChildVGrid: TAppDocChildVGrid; const OwnerChildName: String; const Value: String): Double;
var
  FormNumPadInformation: TAppDocFormUretimTerminalNumPadCaption;
  GridOldParent: TWinControl;

  procedure FilterRecord;
  begin
    with TAppDOPUretimTerminalVeriGiris(DocApp) do
    begin
      ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.TableItems[0].Where.Clear;
      ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.TableItems[0].Where.Add('EVRAKNO', wcEqual, TerminalParametre.ReceteTuketim.EvrakNo);
      ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.TableItems[0].Where.AddOperator(woAnd);
      ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.TableItems[0].Where.Add('MALKOD', wcEqual, TerminalParametre.ReceteTuketim.MalKod);
      ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.TableItems[0].Where.AddOperator(woAnd);
      ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.TableItems[0].Where.Add('SERINO', wcEqual, TerminalParametre.ReceteTuketim.SeriNo);
      ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.TableItems[0].Where.AddOperator(woAnd);
      ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.TableItems[0].Where.Add('VERSIYONNO', wcEqual, TerminalParametre.ReceteTuketim.VersiyonNo);
      ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.TableItems[0].Where.AddOperator(woAnd);
      ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.TableItems[0].Where.Add('SIRANO', wcEqual, TerminalParametre.ReceteTuketim.SiraNo);
      ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.Open;
    end;
  end;

  procedure AddRecord;
  begin
    with TAppDOPUretimTerminalVeriGiris(DocApp) do
    begin
      if ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.IsEmpty then
      begin
        ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.Insert;
        ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.SirketNo := DataApp.CompanyNo;
        ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.HesapKod := TerminalParametre.ReceteTuketim.HesapKod;
        ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.UretimNo := TerminalParametre.ReceteTuketim.SiparisNo;
        ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.EvrakNo := TerminalParametre.ReceteTuketim.SiparisNo;
        ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.MalKod := TerminalParametre.ReceteTuketim.MalKod;
        ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.SeriNo := TerminalParametre.ReceteTuketim.SeriNo;
        ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.VersiyonNo := TerminalParametre.ReceteTuketim.VersiyonNo;
        ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.SiraNo := TerminalParametre.ReceteTuketim.SiraNo;
      end;
    end;
  end;

begin
  FormNumPadInformation := TAppDocFormUretimTerminalNumPadCaption.Create(fDocApp);
  with FormNumPadInformation do
  begin
    FormNumPadInformation.edtMiktar.Text := Value;
    GlobalTextBox := FormNumPadInformation.edtMiktar;
    GlobalTextBox.Text := Value;
    GlobalTextBox.Properties.EchoMode := eemNormal;

    Position := poScreenCenter;
    GridOldParent := DocChildVGrid.VGrid.Parent;
    DocChildVGrid.VGrid.Parent := Panel_MalzemeTuketim;

    with TAppDOPUretimTerminalVeriGiris(DocApp) do
    begin
//      if OwnerChildName = ChildUretimTerminalReceteTuketim.DockPanel.Name then
//      begin
        FilterRecord;
        AddRecord;
//      end;
    end;
    ShowModal;
  end;
  if FormNumPadInformation.edtMiktar.Text <> '' then
    Result :=  StrToFloat(FormNumPadInformation.edtMiktar.Text)
  else
    Result := 0;

  DocChildVGrid.VGrid.Parent := GridOldParent;
  FormNumPadInformation.Free;
end;

procedure TAppForms.CreateTitlePanel(AParentForm: TForm; ACaption: String;
  const AButtonRefreshEvent, AButtonBackEvent, AButtonExitEvent, AButtonScrollUpEvent,
  AButtonScrollDownEvent: TNotifyEvent; const ShowPanelIslemMenu: Boolean;
  const IslemMenuText1, IslemMenuText2, IslemMenuText3, IslemVersiyonNo, IslemSeriNo1, IslemSeriNo2: String);
var
  formTerminalMenu: TAppDocFormUretimTerminalMenu;
begin
  formTerminalMenu := TAppDocFormUretimTerminalMenu.Create(nil);
  formTerminalMenu.PanelGlobal_TopMenu.Parent := AParentForm;
  formTerminalMenu.PanelGlobal_TopMenu_Description.Caption := ACaption;
  formTerminalMenu.btTitleRefresh.OnClick := AButtonRefreshEvent;
  formTerminalMenu.btTitleBack.OnClick := AButtonBackEvent;
  formTerminalMenu.btTitleExit.OnClick := AButtonExitEvent;
end;

{ TAppChilds }

function TAppChilds.CreateGridButton(AGridView: TcxGridDBTableView): TcxGridDBColumn;
var
  gridColumn: TcxGridDBColumn;
begin
  gridColumn := AGridView.CreateColumn;
  with gridColumn do
  begin
    DataBinding.FieldName := '_ID';
    Name := AGridView.Name + 'ButtonID';
    Caption := ' ';
    Width := 70;
    Index := AGridView.ColumnCount +1;
    PropertiesClass := TcxButtonEditProperties;
    Options.ShowEditButtons := isebAlways;
//    Options.HorzSizing := false;
  end;
  Result := gridColumn;
end;

procedure TAppChilds.CreateGridButton(AGridView: TcxGridDBTableView; AButtonEvent: TcxEditButtonClickEvent);
var
  formTerminalMenu: TAppDocFormUretimTerminalMenu;
begin
  formTerminalMenu := TAppDocFormUretimTerminalMenu.Create(Nil);
  with TcxButtonEditProperties(CreateGridButton(AGridView).Properties) do
  begin
    ViewStyle := vsButtonsOnly;
    with Buttons.Items[0] do
    begin
      Caption := '';
      Kind := bkGlyph;
      OnButtonClick := AButtonEvent;
      formTerminalMenu.ButtonImageList.GetImage (9, Glyph);
    end;
  end;
end;

{ TAppDocChildUretimTerminalProperties }
constructor TAppDocChildUretimTerminalProperties.Create;
begin
  FAppChild := TAppChilds.Create;
  FAppForms := TAppForms.Create;
end;

function TAppDocChildUretimTerminalProperties.DocObjectSave(DocApp: TAppDocApp; const SaveMsgText,
  ErrMsgText: String): Boolean;
  procedure DoFocusDocumentCurrentRecord;
  begin
    with TAppDOPUretimTerminalVeriGiris(DocApp) do begin
      if DataApp.UretimRota.Table.Locate('OPERASYONNO', TerminalParametre.OperasyonNo, []) then
        if DataApp.UretimRotaKaynak.Table.Locate('KAYNAKKOD', TerminalParametre.KaynakKod, []) then
          DataApp.UretimRotaKaynakOperasyon.Table.Last;
    end;
  end;
begin
  with TAppDOPUretimTerminalVeriGiris(DocApp) do begin
    if DataApp.DataObject.Save then begin
      if SaveMsgText <> '' then
        AppForms.AppFormMessageDialog(SaveMsgText, mtOK);
      Result := true;
    end
    else begin
      DataApp.DataObject.Cancel;
      if ErrMsgText <> '' then
        AppForms.AppFormMessageDialog(ErrMsgText, mtError);
      Result := false;
    end;
  end;
  DoFocusDocumentCurrentRecord;
end;

end.
