unit CPMApp_DOPUretimHataKart;

interface

uses Windows, Classes, SysUtils, Controls, Variants, DB,
  CPMApp_DataObject, CPMApp_DataObjectDB,
  CPMApp_DocObjectModel, CPMApp_DocApp,
  CPMApp_DocChildVGrid,
  CPMApp_DocChildSearchTable,
  CPMApp_DOPCustomUretimHataKart;

type
  TAppDOPUretimHataKart = class(TAppDOPCustomUretimHataKart)
  private
    FOldChildUretimHataKartAjanOnKeyDown: TKeyEvent;
  private
    FChildUretimHataKart: TAppDocChildVGrid;
    FChildUretimHataKartAjan: TAppDocChildSearchTable;
    // Rules
    // Click Events
    procedure ChildUretimHataKartAjanOnDblClick(Sender: TObject);
    procedure ChildUretimHataKartAjanOnKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    // Click Events
    // Create Childs;
    procedure CreateChildUretimHataKart;
    procedure CreateChildUretimHataKartAjan;
    // Procededure
  protected
    procedure CreateDocChilds; override;
    procedure SetDAPSecurity; override;
    procedure SetReport; override;
  public
    procedure TranslationChanged; override;
  published
    property ChildUretimHataKart: TAppDocChildVGrid read FChildUretimHataKart;
    property ChildUretimHataKartAjan: TAppDocChildSearchTable read FChildUretimHataKartAjan;
  end;

implementation

uses
  CPMApp_StrUtils,
  CPMApp_Dialogs,
  CPMApp_Images,
  CPMApp_BOMStrs,
  CPMApp_BOMConsts;

{ TAppDOPUretimHataKart }

procedure TAppDOPUretimHataKart.ChildUretimHataKartAjanOnDblClick(
  Sender: TObject);
begin
  if DataApp.DataObject.IsDataChanged then
  begin
    if AppConfirm('Belgede deðiþiklik yapýlmýþ, Kaydet?') then
      DataApp.DataObject.Save;
  end;
  DataApp.DataObject.OptionsKey.KeyValues['HATAKOD'] := FChildUretimHataKartAjan.Table.FieldValues['HATAKOD'];
  DataApp.DataObject.Open;
  ChildUretimHataKart.ShowChild;
end;

procedure TAppDOPUretimHataKart.ChildUretimHataKartAjanOnKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldChildUretimHataKartAjanOnKeyDown) then
    FOldChildUretimHataKartAjanOnKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
    ChildUretimHataKartAjan.GridView.OnDblClick(Sender);
end;

procedure TAppDOPUretimHataKart.CreateChildUretimHataKart;
begin
  FChildUretimHataKart := DocObject.CreateChild(TAppDocChildVGrid, 'ChildUretimHataKart') as TAppDocChildVGrid;
  FChildUretimHataKart.Caption := AppGetRS(@AppDOPUretimHataKart_ChildUretimHataKart);
  FChildUretimHataKart.PipelineName := 'ppUretimHataKart';
  FChildUretimHataKart.TableObject := DataApp.UretimHataKart.Table;
  FChildUretimHataKart.CreateButton('btUretimHataKart', FChildUretimHataKart.Caption, 'Sayfalar');
end;

procedure TAppDOPUretimHataKart.CreateChildUretimHataKartAjan;
begin
  FChildUretimHataKartAjan := DocObject.CreateChild(TAppDocChildSearchTable, 'ChildUretimHataKartAjan') as TAppDocChildSearchTable;
  FChildUretimHataKartAjan.AppName := AppName + '\' + FChildUretimHataKartAjan.Name;
  FChildUretimHataKartAjan.Caption := AppGetRS(@AppDOPUretimHataKart_ChildUretimHataKartAjan);
  FChildUretimHataKartAjan.PipelineName := 'ppUretimHataKartIzleyici';
  FChildUretimHataKartAjan.DockPanel.ImageIndex := Integer(aiEvrakIzleyici);

  with FChildUretimHataKartAjan.CreateButton('btUretimHataKartAjan', FChildUretimHataKartAjan.Caption, 'Sayfalar', 'Ctrl+J') do
    ImageIndex := Integer(aiEvrakIzleyici);

  FChildUretimHataKartAjan.Table.TableItems.TableNames := VarArrayOf(['URTOHK']);
  FChildUretimHataKartAjan.Table.TableItems.TableCaptions := VarArrayOf(['Hata Kart']);

  with FChildUretimHataKartAjan.Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('HATAKOD');
      Add('ACIKLAMA');
    end;
  end;

  FChildUretimHataKartAjan.GridView.OnDblClick := ChildUretimHataKartAjanOnDblClick;

  FOldChildUretimHataKartAjanOnKeyDown := FChildUretimHataKartAjan.GridView.OnKeyDown;
  FChildUretimHataKartAjan.GridView.OnKeyDown := ChildUretimHataKartAjanOnKeyDown;
end;

procedure TAppDOPUretimHataKart.CreateDocChilds;
begin
  inherited;
  CreateChildUretimHataKart;
  CreateChildUretimHataKartAjan;
end;

procedure TAppDOPUretimHataKart.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.UretimHataKart.Table, 'URTOHK', 'Üretim Hata Kart');
end;

procedure TAppDOPUretimHataKart.SetReport;
begin
  inherited;
  DocObject.Report.MainTable := DataApp.UretimHataKart.Table;
end;

procedure TAppDOPUretimHataKart.TranslationChanged;
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

  if AppName = AppBOMConsts.AppName(odtUretimHataKart) then
    Caption := AppBOMConsts.Caption(odtUretimHataKart);

  SetChildCaption(ChildUretimHataKart, AppGetRS(@AppDOPUretimHataKart_ChildUretimHataKart));
  SetChildCaption(ChildUretimHataKartAjan, AppGetRS(@AppDOPUretimHataKart_ChildUretimHataKartAjan));
end;

initialization
  AppRegisterDOPClass(TAppDOPUretimHataKart);

end.

