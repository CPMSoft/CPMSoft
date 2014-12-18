unit CPMApp_DOPUretimDurusKart;

interface

uses Windows, Classes, SysUtils, Controls, Variants, DB,
  CPMApp_DataObject, CPMApp_DataObjectDB,
  CPMApp_DocObjectModel, CPMApp_DocApp,
  CPMApp_DocChildVGrid,
  CPMApp_DocChildSearchTable,
  CPMApp_DOPCustomUretimDurusKart;

type
  TAppDOPUretimDurusKart = class(TAppDOPCustomUretimDurusKart)
  private
    FOldChildUretimDurusKartAjanOnKeyDown: TKeyEvent;
  private
    FChildUretimDurusKart: TAppDocChildVGrid;
    FChildUretimDurusKartAjan: TAppDocChildSearchTable;
    // Rules
    // Click Events
    procedure ChildUretimDurusKartAjanOnDblClick(Sender: TObject);
    procedure ChildUretimDurusKartAjanOnKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    // Click Events
    // Create Childs;
    procedure CreateChildUretimDurusKart;
    procedure CreateChildUretimDurusKartAjan;
    // Procededure
  protected
    procedure CreateDocChilds; override;
    procedure SetDAPSecurity; override;
    procedure SetReport; override;
  public
    procedure TranslationChanged; override;
  published
    property ChildUretimDurusKart: TAppDocChildVGrid read FChildUretimDurusKart;
    property ChildUretimDurusKartAjan: TAppDocChildSearchTable read FChildUretimDurusKartAjan;
  end;

implementation

uses
  CPMApp_StrUtils,
  CPMApp_Dialogs,
  CPMApp_Images,
  CPMApp_BOMStrs,
  CPMApp_BOMConsts;

{ TAppDOPUretimDurusKart }

procedure TAppDOPUretimDurusKart.ChildUretimDurusKartAjanOnDblClick(
  Sender: TObject);
begin
  if DataApp.DataObject.IsDataChanged then
  begin
    if AppConfirm('Belgede deðiþiklik yapýlmýþ, Kaydet?') then
      DataApp.DataObject.Save;
  end;
  DataApp.DataObject.OptionsKey.KeyValues['DURUSKOD'] := FChildUretimDurusKartAjan.Table.FieldValues['DURUSKOD'];
  DataApp.DataObject.Open;
  ChildUretimDurusKart.ShowChild;
end;

procedure TAppDOPUretimDurusKart.ChildUretimDurusKartAjanOnKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldChildUretimDurusKartAjanOnKeyDown) then
    FOldChildUretimDurusKartAjanOnKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
    ChildUretimDurusKartAjan.GridView.OnDblClick(Sender);
end;

procedure TAppDOPUretimDurusKart.CreateChildUretimDurusKart;
begin
  FChildUretimDurusKart := DocObject.CreateChild(TAppDocChildVGrid, 'ChildUretimDurusKart') as TAppDocChildVGrid;
  FChildUretimDurusKart.Caption := AppGetRS(@AppDOPUretimDurusKart_ChildUretimDurusKart);
  FChildUretimDurusKart.TableObject := DataApp.UretimDurusKart.Table;
  FChildUretimDurusKart.CreateButton('btUretimDurusKart', FChildUretimDurusKart.Caption, 'Sayfalar');
end;

procedure TAppDOPUretimDurusKart.CreateChildUretimDurusKartAjan;
begin
  FChildUretimDurusKartAjan := DocObject.CreateChild(TAppDocChildSearchTable, 'ChildUretimDurusKartAjan') as TAppDocChildSearchTable;
  FChildUretimDurusKartAjan.AppName := AppName + '\' + FChildUretimDurusKartAjan.Name;
  FChildUretimDurusKartAjan.Caption := AppGetRS(@AppDOPUretimDurusKart_ChildUretimDurusKartAjan);
  FChildUretimDurusKartAjan.PipelineName := 'ppUretimDurusKartIzleyici';
  FChildUretimDurusKartAjan.DockPanel.ImageIndex := Integer(aiEvrakIzleyici);

  with FChildUretimDurusKartAjan.CreateButton('btUretimDurusKartAjan', FChildUretimDurusKartAjan.Caption, 'Sayfalar', 'Ctrl+J') do
    ImageIndex := Integer(aiEvrakIzleyici);

  FChildUretimDurusKartAjan.Table.TableItems.TableNames := VarArrayOf(['URTODK']);
  FChildUretimDurusKartAjan.Table.TableItems.TableCaptions := VarArrayOf(['Duruþ Kart']);

  with FChildUretimDurusKartAjan.Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('DURUSKOD');
      Add('ACIKLAMA');
    end;
  end;

  FChildUretimDurusKartAjan.GridView.OnDblClick := ChildUretimDurusKartAjanOnDblClick;

  FOldChildUretimDurusKartAjanOnKeyDown := FChildUretimDurusKartAjan.GridView.OnKeyDown;
  FChildUretimDurusKartAjan.GridView.OnKeyDown := ChildUretimDurusKartAjanOnKeyDown;
end;

procedure TAppDOPUretimDurusKart.CreateDocChilds;
begin
  inherited;
  CreateChildUretimDurusKart;
  CreateChildUretimDurusKartAjan;
end;

procedure TAppDOPUretimDurusKart.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.UretimDurusKart.Table, 'URTODK', 'Üretim Duruþ Kart');
end;

procedure TAppDOPUretimDurusKart.SetReport;
begin
  inherited;
  DocObject.Report.MainTable := DataApp.UretimDurusKart.Table;
end;

procedure TAppDOPUretimDurusKart.TranslationChanged;
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

  if AppName = AppBOMConsts.AppName(odtUretimDurusKart) then
    Caption := AppBOMConsts.Caption(odtUretimDurusKart);

  SetChildCaption(ChildUretimDurusKart, AppGetRS(@AppDOPUretimDurusKart_ChildUretimDurusKart));
  SetChildCaption(ChildUretimDurusKartAjan, AppGetRS(@AppDOPUretimDurusKart_ChildUretimDurusKartAjan));
end;

initialization
  AppRegisterDOPClass(TAppDOPUretimDurusKart);

end.

