unit CPMApp_DOPUretimParametreKart;

interface

uses Windows, Classes, SysUtils, Controls, Variants, DB,
  CPMApp_DataObjectDB, CPMApp_DataObject,
  CPMApp_DocObjectModel, CPMApp_DocApp,
  CPMApp_DocChildMultiVGrid,
  CPMApp_DOPCustomUretimParametreKart;

type
  TAppDOPUretimParametreKart = class(TAppDOPCustomUretimParametreKart)
  private
    // Childs;
    FChildUretimParametre: TAppDocChildMultiVGrid;
  private
    // Menu Items Click
    // Events
    // Procedures
  private
    // Create Childs;
    procedure CreateChildUretimParametre;
  protected
    procedure CreateDocChilds; override;
    procedure SetReport; override;
    procedure SetDAPSecurity; override;
  public
    procedure TranslationChanged; override;
  published
    property ChildUretimParametre: TAppDocChildMultiVGrid read FChildUretimParametre;
  end;

implementation

uses
  CPMApp_BOMConsts, CPMApp_BOMStrs, CPMApp_StrUtils;

{ TAppDOPUretimParametreKart }

procedure TAppDOPUretimParametreKart.CreateChildUretimParametre;
begin
  FChildUretimParametre := DocObject.CreateChild(TAppDocChildMultiVGrid, 'ChildUretimParametre') as TAppDocChildMultiVGrid;
  FChildUretimParametre.Caption := AppGetRS(@AppDOPUretimParametreKart_ChildUretimParametre);
  FChildUretimParametre.PipelineName := 'ppUretimParametre';
  FChildUretimParametre.TableObject := DataApp.UretimParametre.Table;
  FChildUretimParametre.CreateButton('btUretimParametre', FChildUretimParametre.Caption, 'Sayfalar');
end;

procedure TAppDOPUretimParametreKart.CreateDocChilds;
begin
  inherited;
  CreateChildUretimParametre;
end;

procedure TAppDOPUretimParametreKart.SetReport;
begin
  inherited;

  DocObject.Report.MainTable := DataApp.UretimParametre.Table;
end;

procedure TAppDOPUretimParametreKart.TranslationChanged;
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

  if AppName = AppBOMConsts.AppName(odtUretimParametreKart) then
    Caption := AppBOMConsts.Caption(odtUretimParametreKart);

  SetChildCaption(ChildUretimParametre, AppGetRS(@AppDOPUretimParametreKart_ChildUretimParametre));
end;

procedure TAppDOPUretimParametreKart.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.UretimParametre.Table, 'URTPRM', 'Üretim Parametre');
end;

initialization
  AppRegisterDOPClass(TAppDOPUretimParametreKart);
  
end.
