unit CPMApp_DocChildUretimTerminalHMDegisim;

interface

uses
  CPMApp_DocCostumUretimTerminalSendKey,
  Windows, DB, Variants, SysUtils, ExtCtrls, Classes, Forms,
  dxDockControl, cxGraphics, cxGridDBTableView, cxGridCustomTableView,
  CPMApp_DB,
  CPMApp_DocApp,
  CPMApp_Storage,
  CPMApp_BOMConsts,
  CPMApp_DataObject,
  CPMApp_DataObjectModel,
  CPMApp_DocObjectModel,
  CPMApp_DocChildGrid,
  CPMApp_DocChildSearchTable,
  CPMApp_DocChildUretimTerminalProperties,
  CPMApp_DAPCustomUretimKart,
  CPMApp_TableStokSystem;

type
  TAppDocChildUretimTerminalHMDegisimStepOne = class;

  TAppDocChildUretimTerminalHMDegisimStepOne = class(TAppDocChildSearchTable)
  private
    FDocApp: TAppDocApp;
    FDataApp: TAppDAPCustomUretimKart;
    procedure OnGridButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure OnClickTitleRefresh(Sender: TObject);
    procedure OnClickTitleExit(Sender: TObject);
    procedure OnClickTitleBack(Sender: TObject);
    procedure AddDocument;
    procedure CreateGridButtons;
    procedure PrepareDefination;
  protected
    procedure CreateTitle;
    procedure CreateObjects;
    procedure AfterCreate; override;
  public
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
    property DocApp: TAppDocApp read FDocApp write FDocApp;
    property DataApp: TAppDAPCustomUretimKart read FDataApp write FDataApp;
  end;

implementation

uses
  ActnList,
  Graphics,
  DateUtils,
  cxTextEdit, cxButtons, cxMaskEdit,
  CPMApp_Dialogs,
  CPMApp_Date,
  CPMApp_TableItems,
  CPMApp_DOPUretimTerminalVeriGiris,
  CPMApp_DocFormUretimTerminalMenu,
  CPMApp_DocFormUretimTerminalNumPad, Controls;


{ TAppDocChildUretimTerminalHMDegisimStepOne }

procedure TAppDocChildUretimTerminalHMDegisimStepOne.AddDocument;
var
  ANewIndexes, AOldIndexes: String;
begin
  AOldIndexes := DataApp.UretimSiparisHareket.Table.IndexFieldNames;
  ANewIndexes := 'SIPARISNO;SIRANO;GIRISCIKIS;STHURT_OPERASYONNO;STHURT_KAYNAKISLEMNO;STKKRT_SARFYONTEM';

  DataApp.UretimSiparisHareket.Table.IndexFieldNames := ANewIndexes;

  if DataApp.UretimSiparisHareket.Table.Locate(ANewIndexes, VarArrayOf([
                                                               TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalReceteTuketim.Table.FieldByName('SIPARISNO').AsString,
                                                               TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalReceteTuketim.Table.FieldByName('SIRANO').AsInteger,
                                                               TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalReceteTuketim.Table.FieldByName('GIRISCIKIS').AsInteger,
                                                               TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalReceteTuketim.Table.FieldByName('STHURT_OPERASYONNO').AsInteger,
                                                               TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalReceteTuketim.Table.FieldByName('STHURT_KAYNAKISLEMNO').AsInteger,
                                                               TAppDOPUretimTerminalVeriGiris(FDocApp).ChildUretimTerminalReceteTuketim.Table.FieldByName('STKKRT_SARFYONTEM').AsInteger]), []) then


  DataApp.UretimSiparisHareket.Table.Edit;
  DataApp.UretimSiparisHareket.Table.SeriNo := Self.Table.FieldValues['SERINO'];
  DataApp.UretimSiparisHareket.Table.SeriNo2 := Self.Table.FieldValues['SERINO2'];
  DataApp.UretimSiparisHareket.Table.DepoKod := Self.Table.FieldValues['DEPOKOD'];
  DataApp.UretimSiparisHareket.Table.VersiyonNo := Self.Table.FieldValues['VERSIYONNO'];
  DataApp.UretimSiparisHareket.Table.ApplyUpdates(0);

//  DataApp.DataObject.Save;
  TAppDOPUretimTerminalVeriGiris(DocApp).DoOpenDocument;

  DataApp.UretimSiparisHareket.Table.IndexFieldNames := AOldIndexes;

  with TAppDOPUretimTerminalVeriGiris(FDocApp) do
  begin
//    DocCustomProperties.AppForms.AppFormMessageDialog('Yeni Veriler Ýþlendi!');
    ChildUretimTerminalReceteTuketim.Run;
    ShowThisDockPanel(ChildUretimTerminalReceteTuketim.DockPanel.Name);
  end;
end;

procedure TAppDocChildUretimTerminalHMDegisimStepOne.OnClickTitleBack(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalReceteTuketim.Run;
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalReceteTuketim.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalHMDegisimStepOne.OnClickTitleExit(
  Sender: TObject);
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).ShowThisDockPanel(TAppDOPUretimTerminalVeriGiris(DocApp).ChildTerminalLogin.DockPanel.Name);
end;

procedure TAppDocChildUretimTerminalHMDegisimStepOne.OnClickTitleRefresh(
  Sender: TObject);
begin
  DataApp.DataObject.Cancel;
end;

procedure TAppDocChildUretimTerminalHMDegisimStepOne.OnGridButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  AddDocument;
end;

procedure TAppDocChildUretimTerminalHMDegisimStepOne.PrepareDefination;
var
  ATableName: String;
begin
  ATableName := 'VW_STOKDURUM';
  Table.TableItems.TableNames := VarArrayOf([ATableName, 'STKKRT']);
  Table.TableItems.TableAlias := VarArrayOf(['STKDRM', 'STKKRT']);
  Table.TableItems.TableReferans := VarArrayOf(['STKDRM', 'STKKRT']);
  with Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALKOD');
      Add('VERSIYONNO');
      Add('SERINO');
      Add('SERINO2');
      Add('DEPOKOD');
      Add('STOKMIKTAR');
      Add('KULLANILABILIR');
    end;
    with Where do
    begin
      Clear;
      AddText('0 = 1');
    end;
  end;

  with Table.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALAD');
      Add('BIRIM');
    end;
    with Where do
    begin
      Clear;
      Add('SARFYONTEM', wcEqual, syManual);
    end;
    with Join do
    begin
      Clear;
      Add('MALKOD', 'MALKOD');
    end;
  end;
end;

procedure TAppDocChildUretimTerminalHMDegisimStepOne.AfterCreate;
begin
  inherited;
  Self.AppName := 'DocChildUretimTerminalHMDegisimStepOne';
  Self.Caption := 'Hammadde Deðiþim';
  PrepareDefination;
  CreateObjects;
end;

procedure TAppDocChildUretimTerminalHMDegisimStepOne.CreateTitle;
begin
  TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.CreateTitlePanel(TAppDocFormUretimTerminalMenu(Self.Form), 'Hm. Deðiþim: Depo/Versiyon Deðiþimi', OnClickTitleRefresh, OnClickTitleBack, OnClickTitleExit, nil, nil);
end;

procedure TAppDocChildUretimTerminalHMDegisimStepOne.CreateObjects;
begin
end;

procedure TAppDocChildUretimTerminalHMDegisimStepOne.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  CreateTitle;
  CreateGridButtons;
  Self.ToolBar.Visible := false;
  Self.GridView.OptionsData.Editing := true;
end;

destructor TAppDocChildUretimTerminalHMDegisimStepOne.Destroy;
begin

  inherited;
end;

procedure TAppDocChildUretimTerminalHMDegisimStepOne.CreateGridButtons;
  procedure CreateButtons;
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppChild.CreateGridButton(Self.GridView, OnGridButtonClick);
  end;
begin
//  Self.Table.TableItems[0].Where.Clear;
//  Self.Table.TableItems[0].Where.AddText('0 = 1');
  Self.Run;
  CreateButtons;
end;

procedure TAppDocChildUretimTerminalHMDegisimStepOne.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;

end.
