unit CPMApp_DOPMRPParametreKart;

interface

uses Windows, Classes, SysUtils, Controls, Variants, DB,
  CPMApp_DataObjectDB, CPMApp_DataObject,
  CPMApp_DocObjectModel, CPMApp_DocApp,
  CPMApp_DocChildMultiVGrid,
  CPMApp_DOPCustomMRPParametreKart;

type
  TAppDOPMRPParametreKart = class(TAppDOPCustomMRPParametreKart)
  private
    // Childs;
    FChildMRPParametre: TAppDocChildMultiVGrid;
  private
    // Menu Items Click
    // Events
    // Procedures
  private
    // Create Childs;
    procedure CreateChildMRPParametre;
  protected
    procedure CreateDocChilds; override;
    procedure SetReport; override;
    procedure SetDAPSecurity; override;
  public
    procedure TranslationChanged; override;
  published
    property ChildMRPParametre: TAppDocChildMultiVGrid read FChildMRPParametre;
  end;

implementation

uses
  CPMApp_BOMConsts, CPMApp_BOMStrs, CPMApp_StrUtils;

{ TAppDOPMRPParametreKart }

procedure TAppDOPMRPParametreKart.CreateChildMRPParametre;
begin
  FChildMRPParametre := DocObject.CreateChild(TAppDocChildMultiVGrid, 'ChildMRPParametre') as TAppDocChildMultiVGrid;
  FChildMRPParametre.Caption := AppGetRS(@AppDOPMRPParametreKart_ChildMRPParametre);
  FChildMRPParametre.PipelineName := 'ppMRPParametre';
  FChildMRPParametre.TableObject := DataApp.MRPParametre.Table;
  FChildMRPParametre.CreateButton('btMRPParametre', FChildMRPParametre.Caption, 'Sayfalar');
end;

procedure TAppDOPMRPParametreKart.CreateDocChilds;
begin
  inherited;
  CreateChildMRPParametre;
end;

procedure TAppDOPMRPParametreKart.SetReport;
begin
  inherited;
  DocObject.Report.MainTable := DataApp.MRPParametre.Table;
end;

procedure TAppDOPMRPParametreKart.TranslationChanged;
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

  if AppName = AppBOMConsts.AppName(odtMRPParametreKart) then
    Caption := AppBOMConsts.Caption(odtMRPParametreKart);

  SetChildCaption(ChildMRPParametre, AppGetRS(@AppDOPMRPParametreKart_ChildMRPParametre));
end;

procedure TAppDOPMRPParametreKart.SetDAPSecurity;
begin
  inherited;
  Security.AddTable(DataApp.MRPParametre.Table, 'MRPPRM', 'MRP Parametre');
end;

initialization
  AppRegisterDOPClass(TAppDOPMRPParametreKart);
  
end.
