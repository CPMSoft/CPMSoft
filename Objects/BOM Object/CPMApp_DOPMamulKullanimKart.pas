unit CPMApp_DOPMamulKullanimKart;

interface

uses Windows, Classes, SysUtils, Controls, Variants, DB,
  CPMApp_DataObject, CPMApp_DataObjectDB,
  CPMApp_DocObjectModel, CPMApp_DocApp,
  CPMApp_DocChildGrid,
  CPMApp_DOPCustomMamulKullanimKart;

type
  TAppDOPMamulKullanimKart = class(TAppDOPCustomMamulKullanimKart)
  private
    // Childs;
    FChildMamulKullanimKart: TAppDocChildGrid;
    FChildMamulKullanimGrup: TAppDocChildGrid;
  private
    // Menu Items Click
    // Events
    // Procedures
  private
    // Create Childs;
    procedure CreateChildMamulKullanimKart;
    procedure CreateChildMamulKullanimGrup;
  protected
    procedure CreateDocChilds; override;
    procedure SetReport; override;
    procedure SetDAPSecurity; override;
  public
    procedure TranslationChanged; override;
  published
    property ChildMamulKullanimKart: TAppDocChildGrid read FChildMamulKullanimKart;
    property ChildMamulKullanimGrup: TAppDocChildGrid read FChildMamulKullanimGrup;
  end;

implementation

uses
  CPMApp_BOMConsts, CPMApp_BOMStrs, CPMApp_StrUtils;

{ TAppDOPMamulKullanimKart }

procedure TAppDOPMamulKullanimKart.CreateChildMamulKullanimKart;
begin
  FChildMamulKullanimKart := DocObject.CreateChild(TAppDocChildGrid, 'ChildMamulKullanimKart') as TAppDocChildGrid;
  FChildMamulKullanimKart.Caption := AppGetRS(@AppDOPMamulKullanimKart_ChildMamulKullanimKart);
  FChildMamulKullanimKart.PipelineName := 'ppMamulKullanimKart';
  FChildMamulKullanimKart.TableObject := DataApp.MamulKullanimKart.Table;
  FChildMamulKullanimKart.CreateButton('btMamulKullanimKart', FChildMamulKullanimKart.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKullanimKart.CreateChildMamulKullanimGrup;
begin
  FChildMamulKullanimGrup := DocObject.CreateChild(TAppDocChildGrid, 'ChildMamulKullanimGrup') as TAppDocChildGrid;
  FChildMamulKullanimGrup.Caption := AppGetRS(@AppDOPMamulKullanimKart_ChildMamulKullanimGrup);
  FChildMamulKullanimGrup.PipelineName := 'ppMamulKullanimGrup';
  FChildMamulKullanimGrup.TableObject := DataApp.MamulKullanimGrup.Table;
  FChildMamulKullanimGrup.CreateButton('btMamulKullanimGrup', FChildMamulKullanimGrup.Caption, 'Sayfalar');
end;

procedure TAppDOPMamulKullanimKart.CreateDocChilds;
begin
  inherited;
  CreateChildMamulKullanimKart;
  CreateChildMamulKullanimGrup;
end;

procedure TAppDOPMamulKullanimKart.SetReport;
begin
  inherited;

  DocObject.Report.MainTable := DataApp.MamulKullanimKart.Table;
end;

procedure TAppDOPMamulKullanimKart.TranslationChanged;
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

  if AppName = AppBOMConsts.AppName(odtMamulKullanimKart) then
    Caption := AppBOMConsts.Caption(odtMamulKullanimKart);

  SetChildCaption(ChildMamulKullanimKart, AppGetRS(@AppDOPMamulKullanimKart_ChildMamulKullanimKart));
  SetChildCaption(ChildMamulKullanimGrup, AppGetRS(@AppDOPMamulKullanimKart_ChildMamulKullanimGrup));
end;

procedure TAppDOPMamulKullanimKart.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.MamulKullanimKart.Table, 'MAMKUK', 'Mamül Kullaným Kart');
  Security.AddTable(DataApp.MamulKullanimGrup.Table, 'MAMKUG', 'Mamül Kullaným Grup');
end;

initialization
  AppRegisterDOPClass(TAppDOPMamulKullanimKart);
  
end.
