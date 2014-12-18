unit CPMApp_DOPUretimTerminalAyarlar;

interface

uses Windows, Classes, SysUtils, Controls, Variants, DB, DateUtils,
  CPMApp_DataObject, CPMApp_DataObjectDB,
  CPMApp_DocObjectModel, CPMApp_DocApp,
  CPMApp_DocChildVGrid,
  CPMApp_DocChildGrid,
  CPMApp_DocChildMasterDetail,
  CPMApp_DOPCustomUretimTerminalAyarlar;

type
  TAppDOPUretimTerminalAyarlar = class;

  TAppRuleUretimTerminalKartAjanDetailOpen = class(TAppTableRule)
  private
    FDOPUretimTerminalAyarlar: TAppDOPUretimTerminalAyarlar;
  protected
    procedure DoBeforeOpen(Table: TAppCustomTable); override;
  public
    constructor Create(AOwner: TAppDOPUretimTerminalAyarlar);
  end;

  TAppDOPUretimTerminalAyarlar = class(TAppDOPCustomUretimTerminalAyarlar)
  private
    FOldChildUretimTerminalBaslikAjanOnKeyDown: TKeyEvent;
  private
    FChildUretimTerminalBaslik: TAppDocChildVGrid;
    FChildUretimTerminalPersonel: TAppDocChildGrid;
    FChildUretimTerminalKaynak: TAppDocChildGrid;
    FChildUretimTerminalKaynakIslemTanim: TAppDocChildGrid;
    FChildUretimTerminalBaslikAjan: TAppDocChildMasterDetail;
    // Rules
    FRuleUretimTerminalKartAjanDetailOpen: TAppRuleUretimTerminalKartAjanDetailOpen;
    // Click Events
    procedure ChildUretimTerminalBaslikAjanOnDblClick(Sender: TObject);
    procedure ChildUretimTerminalBaslikAjanOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    // Click Events
    // Create Childs;
    procedure CreateChildUretimTerminalBaslik;
    procedure CreateChildUretimTerminalPersonel;
    procedure CreateChildUretimTerminalKaynak;
    procedure CreateChildUretimTerminalKaynakIslemTanim;
    procedure CreateChildUretimTerminalBaslikAjan;
    // Create Rules
    procedure CreateRules;
    // Procededure
  protected
    procedure CreateDocChilds; override;
    procedure CreateMenuItems; override;
    procedure SetReport; override;
    procedure SetDAPSecurity; override;
  public
    procedure TranslationChanged; override;
  published
    property ChildUretimTerminalBaslik: TAppDocChildVGrid read FChildUretimTerminalBaslik;
    property ChildUretimTerminalPersonel: TAppDocChildGrid read FChildUretimTerminalPersonel;
    property ChildUretimTerminalKaynak: TAppDocChildGrid read FChildUretimTerminalKaynak;
    property ChildUretimTerminalKaynakIslemTanim: TAppDocChildGrid read FChildUretimTerminalKaynakIslemTanim;
    property ChildUretimTerminalBaslikAjan: TAppDocChildMasterDetail read FChildUretimTerminalBaslikAjan;
  end;

implementation

uses
  CPMApp_Images, CPMApp_Dialogs, CPMApp_Date, CPMApp_TableItems,
  CPMApp_SProductionConsts, CPMApp_SProductionStrs, CPMApp_StrUtils,
  CPMApp_TableBOMSystem;

{ TAppDOPUretimTerminalAyarlar }

procedure TAppDOPUretimTerminalAyarlar.ChildUretimTerminalBaslikAjanOnDblClick(
  Sender: TObject);
begin
  with DataApp.DataObject.OptionsKey do
  begin
    KeyValues['SIRKETNO'] := ChildUretimTerminalBaslikAjan.TableMaster.FieldValues['SIRKETNO'];
    KeyValues['TERMINALKOD'] := ChildUretimTerminalBaslikAjan.TableMaster.FieldValues['TERMINALKOD'];
  end;
  DataApp.DataObject.Open;
  ChildUretimTerminalBaslik.ShowChild;
end;

procedure TAppDOPUretimTerminalAyarlar.ChildUretimTerminalBaslikAjanOnKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOldChildUretimTerminalBaslikAjanOnKeyDown) then
    FOldChildUretimTerminalBaslikAjanOnKeyDown(Sender, Key, Shift);
  if Key = VK_RETURN then
    ChildUretimTerminalBaslikAjan.GridViewMaster.OnDblClick(Sender);
end;

procedure TAppDOPUretimTerminalAyarlar.CreateChildUretimTerminalBaslik;
begin
  FChildUretimTerminalBaslik := DocObject.CreateChild(TAppDocChildVGrid, 'ChildUretimTerminalBaslik') as TAppDocChildVGrid;
  FChildUretimTerminalBaslik.Caption := AppGetRS(@AppDOPUretimTerminalAyarlar_ChildUretimTerminalBaslik);
  FChildUretimTerminalBaslik.TableObject := DataApp.UretimTerminalBaslik.Table;
  FChildUretimTerminalBaslik.CreateButton('btUretimTerminalKart', FChildUretimTerminalBaslik.Caption, 'Sayfalar');
end;

procedure TAppDOPUretimTerminalAyarlar.CreateChildUretimTerminalPersonel;
begin
  FChildUretimTerminalPersonel := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimTerminalPersonel') as TAppDocChildGrid;
  FChildUretimTerminalPersonel.Caption := AppGetRS(@AppDOPUretimTerminalAyarlar_ChildUretimTerminalPersonel);
  FChildUretimTerminalPersonel.TableObject := DataApp.UretimTerminalPersonel.Table;
  FChildUretimTerminalPersonel.CreateButton('btUretimTerminalPersonel', FChildUretimTerminalPersonel.Caption, 'Sayfalar');
end;

procedure TAppDOPUretimTerminalAyarlar.CreateChildUretimTerminalKaynak;
begin
  FChildUretimTerminalKaynak := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimTerminalKaynak') as TAppDocChildGrid;
  FChildUretimTerminalKaynak.Caption := AppGetRS(@AppDOPUretimTerminalAyarlar_ChildUretimTerminalKaynak);
  FChildUretimTerminalKaynak.TableObject := DataApp.UretimTerminalKaynak.Table;
  FChildUretimTerminalKaynak.CreateButton('btUretimTerminalKaynak', FChildUretimTerminalKaynak.Caption, 'Sayfalar');
end;

procedure TAppDOPUretimTerminalAyarlar.CreateChildUretimTerminalKaynakIslemTanim;
begin
  FChildUretimTerminalKaynakIslemTanim := DocObject.CreateChild(TAppDocChildGrid, 'ChildUretimTerminalKaynakIslemTanim') as TAppDocChildGrid;
  FChildUretimTerminalKaynakIslemTanim.Caption := AppGetRS(@AppDOPUretimTerminalAyarlar_ChildUretimTerminalKaynakIslemTanim);
  FChildUretimTerminalKaynakIslemTanim.TableObject := DataApp.UretimTerminalKaynakIslemTanim.Table;
  FChildUretimTerminalKaynakIslemTanim.CreateButton('btUretimTerminalKaynakIslemTanim', FChildUretimTerminalKaynakIslemTanim.Caption, 'Sayfalar');
end;

procedure TAppDOPUretimTerminalAyarlar.CreateChildUretimTerminalBaslikAjan;
begin
  FChildUretimTerminalBaslikAjan := DocObject.CreateChild(TAppDocChildMasterDetail, 'ChildUretimTerminalBaslikAjan') as TAppDocChildMasterDetail;
  FChildUretimTerminalBaslikAjan.Caption := AppGetRS(@AppDOPUretimTerminalAyarlar_ChildUretimTerminalBaslikAjan);
  FChildUretimTerminalBaslikAjan.FormName := 'UretimTerminalKartAjanForm';
  FChildUretimTerminalBaslikAjan.AppName := Self.AppName +  '\UretimTerminalKartAjan';
  FChildUretimTerminalBaslikAjan.PipelineMasterName := 'ppTerminalKartIzleyiciBaslik';
  FChildUretimTerminalBaslikAjan.PipelineDetailName := 'ppTerminalKartIzleyiciDetay';
  FChildUretimTerminalBaslikAjan.CreateButton('btUretimTerminalKartAjan', FChildUretimTerminalBaslikAjan.Caption, 'Sayfalar', 'Ctrl+J');

  FChildUretimTerminalBaslikAjan.TableMaster.TableItems.TableNames := VarArrayOf(['URTTEB']);
  FChildUretimTerminalBaslikAjan.TableMaster.TableItems.TableCaptions := 'Terminal Kartý';
  with FChildUretimTerminalBaslikAjan.TableMaster.TableItems[0] do begin
    Fields.Clear;
    Fields.Add('*');
  end;

  with FChildUretimTerminalBaslikAjan.TableMaster.TableItems.OrderBy do
  begin
    Clear;
    Add('SIRKETNO');
    Add('TERMINALKOD');
  end;

  FChildUretimTerminalBaslikAjan.TableDetail.TableItems.TableNames := VarArrayOf(['URTTEP', 'PERKRT']);
  FChildUretimTerminalBaslikAjan.TableDetail.TableItems.TableCaptions := 'Terminal Personel';

  with FChildUretimTerminalBaslikAjan.TableDetail.TableItems[0] do begin
    Fields.Clear;
    Fields.Add('*');
  end;

  with FChildUretimTerminalBaslikAjan.TableDetail.TableItems[1] do begin
    with Fields do begin
      Clear;
      Add('AD');
      Add('SOYAD');
    end;
    with Join do begin
      Add('SICILKOD', 'SICILKOD');
    end;
  end;

  with FChildUretimTerminalBaslikAjan.TableDetail.TableItems.OrderBy do
  begin
    Clear;
    Add('SIRKETNO');
    Add('TERMINALKOD');
  end;

  FChildUretimTerminalBaslikAjan.TableDetail.LookupTableItems.Add(FChildUretimTerminalBaslikAjan.TableDetail.TableItems[1]);

  FChildUretimTerminalBaslikAjan.GridViewMaster.OnDblClick := ChildUretimTerminalBaslikAjanOnDblClick;
  FOldChildUretimTerminalBaslikAjanOnKeyDown := FChildUretimTerminalBaslikAjan.GridViewMaster.OnKeyDown;
  FChildUretimTerminalBaslikAjan.GridViewMaster.OnKeyDown := ChildUretimTerminalBaslikAjanOnKeyDown;
end;

procedure TAppDOPUretimTerminalAyarlar.CreateRules;
begin
  if ChildUretimTerminalBaslikAjan <> nil then
    FRuleUretimTerminalKartAjanDetailOpen := TAppRuleUretimTerminalKartAjanDetailOpen.Create(Self);
end;

procedure TAppDOPUretimTerminalAyarlar.CreateDocChilds;
begin
  inherited;
  CreateChildUretimTerminalBaslik;
  CreateChildUretimTerminalPersonel;
  CreateChildUretimTerminalKaynak;
  CreateChildUretimTerminalKaynakIslemTanim;
  CreateChildUretimTerminalBaslikAjan;
  CreateRules;
end;

procedure TAppDOPUretimTerminalAyarlar.CreateMenuItems;
begin
  inherited;
end;

procedure TAppDOPUretimTerminalAyarlar.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.UretimTerminalBaslik.Table, 'URTTEB', 'Üretim Terminal Baþlýk');
  Security.AddTable(DataApp.UretimTerminalPersonel.Table, 'URTTEP', 'Üretim Terminal Personel');
  Security.AddTable(DataApp.UretimTerminalKaynak.Table, 'URTTEK', 'Üretim Terminal Kaynak');
  Security.AddTable(DataApp.UretimTerminalKaynakIslemTanim.Table, 'URTTIT', 'Üretim Terminal Kaynak Ýþlem Taným');
end;

procedure TAppDOPUretimTerminalAyarlar.SetReport;
begin
  inherited;
  DocObject.Report.MainTable := DataApp.UretimTerminalBaslik.Table;
end;

procedure TAppDOPUretimTerminalAyarlar.TranslationChanged;
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

  if AppName = AppSProductionConsts.AppName(odtUretimTerminalAyarlar) then
    Caption := AppSProductionConsts.Caption(odtUretimTerminalAyarlar);

  SetChildCaption(ChildUretimTerminalBaslik, AppGetRS(@AppDOPUretimTerminalAyarlar_ChildUretimTerminalBaslik));
  SetChildCaption(ChildUretimTerminalPersonel, AppGetRS(@AppDOPUretimTerminalAyarlar_ChildUretimTerminalPersonel));
  SetChildCaption(ChildUretimTerminalKaynak, AppGetRS(@AppDOPUretimTerminalAyarlar_ChildUretimTerminalKaynak));
  SetChildCaption(ChildUretimTerminalKaynakIslemTanim, AppGetRS(@AppDOPUretimTerminalAyarlar_ChildUretimTerminalKaynakIslemTanim));
  SetChildCaption(ChildUretimTerminalBaslikAjan, AppGetRS(@AppDOPUretimTerminalAyarlar_ChildUretimTerminalBaslikAjan));
end;

{ TAppRuleUretimTerminalKartAjanDetailOpen }

constructor TAppRuleUretimTerminalKartAjanDetailOpen.Create(
  AOwner: TAppDOPUretimTerminalAyarlar);
begin
  inherited Create;
  FDOPUretimTerminalAyarlar := AOwner;
  AddRule(FDOPUretimTerminalAyarlar.ChildUretimTerminalBaslikAjan.TableDetail);
end;

procedure TAppRuleUretimTerminalKartAjanDetailOpen.DoBeforeOpen(
  Table: TAppCustomTable);
begin
  inherited;
  with Table.TableItems[0].Where do
  begin
    Clear;
    AddAnd('TERMINALKOD', wcEqual, FDOPUretimTerminalAyarlar.FChildUretimTerminalBaslikAjan.TableMaster.FieldValues['TERMINALKOD']).DataType := ftString;
  end;
  FDOPUretimTerminalAyarlar.FChildUretimTerminalBaslikAjan.TableDetail.DataSet.CommandText := FDOPUretimTerminalAyarlar.FChildUretimTerminalBaslikAjan.TableDetail.TableItems.Clause;
end;

initialization
  AppRegisterDOPClass(TAppDOPUretimTerminalAyarlar);

end.
