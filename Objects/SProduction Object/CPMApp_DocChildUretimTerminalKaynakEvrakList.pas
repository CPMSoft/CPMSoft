unit CPMApp_DocChildUretimTerminalKaynakEvrakList;

interface

uses
  Forms,
  dxDockControl,
  CPMApp_DocApp,
  CPMApp_Security,
  CPMApp_Storage,
  CPMApp_DocObjectModel,
  CPMApp_DataObjectModel,
  CPMApp_DocChildSearchTable,
  CPMApp_DocChildUretimTerminalProperties,
  CPMApp_DAPCustomUretimKart;

type
  TAppDocChildUretimTerminalKaynakEvrakList = class;

  TAppDocChildUretimTerminalKaynakEvrakList = class(TAppDocChildSearchTable)
  private
    FDataApp: TAppDAPCustomUretimKart;
    FDocApp: TAppDocApp;
  private
    procedure OnClickTitleRefresh(Sender: TObject);
    procedure OnClickTitleExit(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
    procedure AddDocumentOnClick(Sender: TObject; AButtonIndex: Integer);
    procedure CreateGridButtons;
  protected
    procedure CreateObjects;
    procedure CreatePanels;
    procedure AfterCreate; override;
  public
    procedure OnKeyPressBarcodeText;
    procedure DoRun;
    procedure AddDocument;
  public
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
    property DocApp: TAppDocApp read FDocApp write FDocApp;
  end;

  implementation

uses
  DB,
  Variants,
  SysUtils,
  CPMApp_Dialogs,
  CPMApp_TableItems,
  CPMApp_BOMConsts,
  CPMApp_DOPUretimTerminalVeriGiris,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_DocFormUretimTerminalNumPad, CPMApp_DataObject;

{ TAppDocChildUretimTerminalKaynakEvrakList }

procedure TAppDocChildUretimTerminalKaynakEvrakList.AddDocument;
begin


  with TAppDOPUretimTerminalVeriGiris(DocApp) do
  begin
    DoOpenDocument;
    DataApp.UretimRota.Table.IndexFieldNames := TerminalTableIndex.NewIndeks_TableUretimRota;
    DataApp.UretimRota.Table.SetRange([TerminalParametre.OperasyonNo], [TerminalParametre.OperasyonNo]);

    DataApp.UretimRotaKaynak.Table.IndexFieldNames := TerminalTableIndex.NewIndeks_TableUretimRotaKaynak;
    DataApp.UretimRotaKaynak.Table.SetRange([TerminalParametre.OperasyonNo, TerminalParametre.KaynakKod, 1], [TerminalParametre.OperasyonNo, TerminalParametre.KaynakKod, 1]);
  end;

  TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.DoRun;

  if TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.Table.RecordCount = 0 then
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Bu iþemrinde herhangi bir Ýþlem Tanýmý bulunmuyor!');
    Exit;
  end;

  if (TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.Table.RecordCount = 1) And (TAppDOPUretimTerminalVeriGiris(DocApp).TerminalParametre.Firma = 'Noya') then
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).TerminalBarcode.BarcodeCode := TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.Table.FieldValues['ISLEMNO'];
    TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.OnKeyPressBarcodeText;
  end
  else
    TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakIslem.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalKaynakEvrakList.AddDocumentOnClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  AddDocument;
end;

procedure TAppDocChildUretimTerminalKaynakEvrakList.AfterCreate;
begin
  inherited;
  Self.Name := 'ChildUretimTerminalKaynakEvrakList';
  Self.Caption := 'Kaynak Evrak List';
  Self.PipelineName := 'ppKaynakEvrakList';
//  Self.Table.TableItems.TableNames := VarArrayOf(['URTROK', 'URTKRT', 'STKKRT', 'URTKYN', 'MAMBAS']);
  Self.Table.TableItems.TableNames := VarArrayOf(['URTROK', 'URTKRT', 'STKKRT', 'URTKYN']);
  Self.Table.TableItems.TableCaptions := VarArrayOf(['Üretim Kart Rota Kaynak', 'Üretim Kart', 'Stok Kart', 'Üretim Kart Kaynak']);
  Self.Table.IndexFieldNames := 'KAYNAKKOD';
  Self.Table.TableItems.OrderBy.Add('URETIMSN', otAsc, Self.Table.TableItems[1]);

  with Self.Table.TableItems[0] do begin
    with Fields do begin
      Clear;
      Add('*')
    end;

    with Where do begin
      Clear;
      Add('OPDURUM', wcInList, VarArrayOf([odReleased, odStarted])).DataType := ftInteger;
      AddOperator(woAnd);
      Add('KULLANILAN', wcEqual, 1).DataType := ftInteger;
    end;
  end;

  with Self.Table.TableItems[1] do begin
    with Fields do begin
      Clear;
      Add('URETIMSN');
      Add('URETIMDURUM');
      Add('MAMULKOD');
      Add('VERSIYONNO');
      Add('MAMULSERINO');
      Add('MAMULSERINO2');
    end;
    with Where do begin
      Clear;
      Add('URETIMDURUM', wcInList, VarArrayOf([udReleased])).DataType := ftInteger;
    end;
    with Join do begin
      Add('SIRKETNO', 'SIRKETNO');
      Add('EVRAKNO', 'EVRAKNO');
      Add('EVRAKTIP', 'EVRAKTIP');
    end;
  end;

  with Self.Table.TableItems[2] do begin
    with Fields do begin
      Clear;
      Add('MALAD')
    end;
    with Join do begin
      Add('SIRKETNO', 'SIRKETNO');
      Add('MALKOD', 'MAMULKOD');
    end;
  end;

  with Self.Table.TableItems[3] do begin
    with Fields do begin
      Clear;
      Add('KAYNAKAD');
    end;
    with Join do begin
      Add('KAYNAKKOD', 'KAYNAKKOD');
    end;
  end;

//  with Self.Table.TableItems[4] do begin
//    with Fields do begin
//      Clear;
//      GetFieldList('MAMBAS');
//      while not FCommandTable.Eof do begin
//        Add(FCommandTable.FieldValues['COLUMN_NAME']);
//        FCommandTable.Next;
//      end;
//      FCommandTable.Free;
//    end;
//    with Join do begin
//      Add('MAMULKOD', 'MAMULKOD');
//      Add('VERSIYONNO', 'VERSIYONNO');
//      Add('SURUMNO', 'SURUM', TableItem[3]);
//    end;
//  end;

  CreateObjects;
end;

procedure TAppDocChildUretimTerminalKaynakEvrakList.CreateObjects;
begin
end;

procedure TAppDocChildUretimTerminalKaynakEvrakList.CreatePanels;
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.CreateTitlePanel(TForm(Self.Form), 'Ýþ Emirleri', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

procedure TAppDocChildUretimTerminalKaynakEvrakList.CreateGridButtons;
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

procedure TAppDocChildUretimTerminalKaynakEvrakList.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateGridButtons;
  CreatePanels;
  Self.GridView.OptionsData.Editing := true;
  Self.ToolBar.Visible := false;

//  TAppDocFormUretimTerminalMenu(fFormTerminalMenu).edtBarcode.Clear;
//  TAppDocFormUretimTerminalMenu(fFormTerminalMenu).edtBarcode.SetFocus;
end;

destructor TAppDocChildUretimTerminalKaynakEvrakList.Destroy;
begin
  inherited;
end;

procedure TAppDocChildUretimTerminalKaynakEvrakList.DoRun;
begin
  Self.Run;
end;

procedure TAppDocChildUretimTerminalKaynakEvrakList.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;

procedure TAppDocChildUretimTerminalKaynakEvrakList.OnKeyPressBarcodeText;
var
  vBarcodeCode: String;
begin
  vBarcodeCode := TAppDOPUretimTerminalVeriGiris(FDocApp).TerminalBarcode.BarcodeCode;
  if vBarcodeCode = '' then
    Exit;

  if Self.Table.Locate('EVRAKNO', vBarcodeCode, []) then
    AddDocument
  else
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Belirtilen Evrak Numarasý bulunamadý!');
    TAppDOPUretimTerminalVeriGiris(FDocApp).OnSetFocusBarcodeText(Self);
  end;
end;

procedure TAppDocChildUretimTerminalKaynakEvrakList.OnClickTitleBack(Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimKaynakList.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalKaynakEvrakList.OnClickTitleExit(Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;


procedure TAppDocChildUretimTerminalKaynakEvrakList.OnClickTitleRefresh(
  Sender: TObject);
begin
  DataApp.DataObject.Cancel;
end;

end.
