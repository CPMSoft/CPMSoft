unit CPMApp_DOPStokKarsilamaPolitika;

interface

uses Windows, Classes, SysUtils, Controls, Variants, DB,
  CPMApp_DataObject, CPMApp_DataObjectDB,
  CPMApp_DocObjectModel, CPMApp_DocApp,
  CPMApp_DocChildVGrid,
  CPMApp_DocChildSearchTable,
  CPMApp_DOPCustomStokKarsilamaPolitika;

type
  TAppDOPStokKarsilamaPolitika = class(TAppDOPCustomStokKarsilamaPolitika)
  private
    FChildStokKarsilamaPolitika: TAppDocChildVGrid;
    FChildStokKarsilamaPolitikaAjan: TAppDocChildSearchTable;
    //
    FOldChildStokKarsilamaPolitikaAjanOnKeyDown: TKeyEvent;
    // Rules
    // Click Events
    procedure ChildStokKarsilamaPolitikaAjanOnDblClick(Sender: TObject);
    procedure ChildStokKarsilamaPolitikaAjanOnKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    // Click Events
    // Create Childs;
    procedure CreateChildStokKarsilamaPolitika;
    procedure CreateChildStokKarsilamaPolitikaAjan;
    // Procededure
  protected
    procedure CreateDocChilds; override;
    procedure SetDAPSecurity; override;
    procedure SetReport; override;
  public
    procedure TranslationChanged; override;
  published
    property ChildStokKarsilamaPolitika: TAppDocChildVGrid read FChildStokKarsilamaPolitika;
    property ChildStokKarsilamaPolitikaAjan: TAppDocChildSearchTable read FChildStokKarsilamaPolitikaAjan;
  end;

implementation

uses
  CPMApp_StrUtils,
  CPMApp_Dialogs,
  CPMApp_Images,
  CPMApp_BOMStrs,
  CPMApp_BOMConsts;

{ TAppDOPStokKarsilamaPolitika }

procedure TAppDOPStokKarsilamaPolitika.ChildStokKarsilamaPolitikaAjanOnDblClick(
  Sender: TObject);
begin
  if DataApp.DataObject.IsDataChanged then
  begin
    if AppConfirm('Belgede deðiþiklik yapýlmýþ, Kaydet?') then
      DataApp.DataObject.Save;
  end;
  DataApp.DataObject.OptionsKey.KeyValues['STOKKARSILAMAKOD'] := FChildStokKarsilamaPolitikaAjan.Table.FieldValues['STOKKARSILAMAKOD'];
  DataApp.DataObject.Open;
  ChildStokKarsilamaPolitika.ShowChild;
end;

procedure TAppDOPStokKarsilamaPolitika.ChildStokKarsilamaPolitikaAjanOnKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldChildStokKarsilamaPolitikaAjanOnKeyDown) then
    FOldChildStokKarsilamaPolitikaAjanOnKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
    ChildStokKarsilamaPolitikaAjan.GridView.OnDblClick(Sender);
end;

procedure TAppDOPStokKarsilamaPolitika.CreateChildStokKarsilamaPolitika;
begin
  FChildStokKarsilamaPolitika := DocObject.CreateChild(TAppDocChildVGrid, 'ChildStokKarsilamaPolitika') as TAppDocChildVGrid;
  FChildStokKarsilamaPolitika.Caption := AppGetRS(@AppDOPStokKarsilamaPolitika_ChildStokKarsilamaPolitika);
  FChildStokKarsilamaPolitika.TableObject := DataApp.StokKarsilamaPolitika.Table;
  FChildStokKarsilamaPolitika.CreateButton('btStokKarsilamaPolitika', FChildStokKarsilamaPolitika.Caption, 'Sayfalar');
end;

procedure TAppDOPStokKarsilamaPolitika.CreateChildStokKarsilamaPolitikaAjan;
begin
  FChildStokKarsilamaPolitikaAjan := DocObject.CreateChild(TAppDocChildSearchTable, 'ChildStokKarsilamaPolitikaAjan') as TAppDocChildSearchTable;
  FChildStokKarsilamaPolitikaAjan.AppName := AppName + '\' + FChildStokKarsilamaPolitikaAjan.Name;
  FChildStokKarsilamaPolitikaAjan.Caption := AppGetRS(@AppDOPStokKarsilamaPolitika_ChildStokKarsilamaPolitikaAjan);
  FChildStokKarsilamaPolitikaAjan.PipelineName := 'ppStokKarsilamaPolitikaIzleyici';
  FChildStokKarsilamaPolitikaAjan.DockPanel.ImageIndex := Integer(aiEvrakIzleyici);

  FChildStokKarsilamaPolitikaAjan.Table.TableItems.TableNames := VarArrayOf(['MRPSKP']);
  FChildStokKarsilamaPolitikaAjan.Table.TableItems.TableCaptions := VarArrayOf(['Stok Karþýlama Politika']);

  FChildStokKarsilamaPolitikaAjan.GridView.OnDblClick := ChildStokKarsilamaPolitikaAjanOnDblClick;
  FOldChildStokKarsilamaPolitikaAjanOnKeyDown := FChildStokKarsilamaPolitikaAjan.GridView.OnKeyDown;
  FChildStokKarsilamaPolitikaAjan.GridView.OnKeyDown := ChildStokKarsilamaPolitikaAjanOnKeyDown;

  with FChildStokKarsilamaPolitikaAjan.CreateButton('btStokKarsilamaPolitikaAjan', FChildStokKarsilamaPolitikaAjan.Caption, 'Sayfalar', 'Ctrl+J') do
    ImageIndex := Integer(aiEvrakIzleyici);
end;

procedure TAppDOPStokKarsilamaPolitika.CreateDocChilds;
begin
  inherited;
  CreateChildStokKarsilamaPolitika;
  CreateChildStokKarsilamaPolitikaAjan;
end;

procedure TAppDOPStokKarsilamaPolitika.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.StokKarsilamaPolitika.Table, 'MRPSKP', 'Stok Karþýlama Politika');
end;

procedure TAppDOPStokKarsilamaPolitika.SetReport;
begin
  inherited;
  DocObject.Report.MainTable := DataApp.StokKarsilamaPolitika.Table;
end;

procedure TAppDOPStokKarsilamaPolitika.TranslationChanged;
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

  if AppName = AppBOMConsts.AppName(odtIsMerkezKart) then
    Caption := AppBOMConsts.Caption(odtIsMerkezKart);

  SetChildCaption(ChildStokKarsilamaPolitika, AppGetRS(@AppDOPStokKarsilamaPolitika_ChildStokKarsilamaPolitika));
  SetChildCaption(ChildStokKarsilamaPolitikaAjan, AppGetRS(@AppDOPStokKarsilamaPolitika_ChildStokKarsilamaPolitikaAjan));
end;

initialization
  AppRegisterDOPClass(TAppDOPStokKarsilamaPolitika);

end.

