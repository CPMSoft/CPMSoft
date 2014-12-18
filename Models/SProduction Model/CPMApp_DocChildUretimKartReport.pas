unit CPMApp_DocChildUretimKartReport;

interface

uses Windows, Messages, SysUtils, Classes, Controls, DB,
  CPMApp_DataObject, CPMApp_DocObjectModel, CPMApp_DataObjectDB, CPMApp_DocChildDataView,
  dxBar, CPMApp_DBView;

type

  TAppDocChildUretimKartReport = class(TAppDocChildDataView)
  private
    procedure ReportExecute(Sender: TObject);
    procedure ReportDBViewBeforeOpen(DBView: TAppDBView);
  protected
    procedure AfterCreate; override;
    procedure CreateMenuItems; override;
  public
    destructor Destroy; override;
  published
  end;

implementation

uses Variants, CPMApp_Images, CPMApp_TableItems, CPMApp_DocObjectHelper;

{ TAppDocChildUretimKartReport }
procedure TAppDocChildUretimKartReport.ReportDBViewBeforeOpen(
  DBView: TAppDBView);
begin
//  DBView.Sql.Where := DocObject.Security.GetFilters('STKHAR;EVRBAS;STKKRT;CARKRT');
//  if DBView.Sql.Where <> '' then
//    DBView.Sql.Where := DBView.Sql.Where + ' AND ';
  DBView.Sql.Where := 'URTROK.KULLANILAN = 1';
//
//  DBView.DataOptions.ParamNames := VarArrayOf(['SIRKETNO']);
//  DBView.DataOptions.ParamValues := VarArrayOf([DocObject.CompanyNo, AMalKod, AHesapKod]);
end;

procedure TAppDocChildUretimKartReport.ReportExecute(
  Sender: TObject);
begin
  Self.DBView.DataController.Run;
  Self.ShowChild;
end;

procedure TAppDocChildUretimKartReport.CreateMenuItems;
begin
  inherited;
end;

destructor TAppDocChildUretimKartReport.Destroy;
begin

  inherited;
end;

procedure TAppDocChildUretimKartReport.AfterCreate;
begin
  inherited;
  Self.AppName := 'UretimKartReport';
  Self.FormName := 'UretimKartReportForm';
  Self.Caption := 'Üretim Raporlarý';
  Self.PipelineName := 'ppUretimKartRaporlar';
  Self.DockPanel.ImageIndex := Integer(aiStockReport);//Integer(aiStokIzleyici);

  Self.DBView.DataOptions.TableItems.TableNames := VarArrayOf(['URTROK', 'URTKRT', 'STKKRT', 'URTKYN', 'URTRKI']);
  Self.DBView.DataOptions.TableItems.TableAlias := VarArrayOf(['URTROK', 'URTKRT', 'STKKRT', 'URTKYN', 'URTRKI']);
  Self.DBView.DataOptions.TableItems.TableReferans := VarArrayOf(['URTROK', 'URTKRT', 'STKKRT', 'URTKYN', 'URTRKI']);
  Self.DBView.DataOptions.TableItems.TableCaptions := VarArrayOf(['Üretim Kart Rota Kaynak', 'Üretim Kart', 'Stok Kart', 'Üretim Kart Kaynak', 'Üretim Kart Ýþlem']);

  Self.DBView.DataOptions.JoinItems[1].Value := 'URTKRT.SIRKETNO = URTROK.SIRKETNO AND URTKRT.EVRAKNO = URTROK.EVRAKNO AND URTKRT.EVRAKTIP = URTROK.EVRAKTIP'; // Evrak Baþlýk
  Self.DBView.DataOptions.JoinItems[2].Value := 'STKKRT.SIRKETNO = URTROK.SIRKETNO AND STKKRT.MALKOD = URTROK.MAMULKOD'; // Stok Kart
  Self.DBView.DataOptions.JoinItems[3].Value := 'URTKYN.KAYNAKKOD = URTROK.KAYNAKKOD'; // Cari Kart
  Self.DBView.DataOptions.JoinItems[4].Value := 'URTRKI.EVRAKNO = URTROK.EVRAKNO AND URTRKI.URETIMNO = URTROK.URETIMNO AND URTRKI.OPERASYONNO = URTROK.OPERASYONNO AND URTRKI.URETIMSIRANO = URTROK.URETIMSIRANO'; // Sevk Kart

  Self.DBView.Sql.Where := ''; // ReportDBViewBeforeOpen eventinde eþitlendi.

  with Self.CreateButton('btChildUretimKartReport', 'Üretim Raporlarý', 'Sayfalar', 'Ctrl+F10', ReportExecute) do
    ImageIndex := Integer(aiStokIzleyici);
  Self.DBView.BeforeOpen := ReportDBViewBeforeOpen;
  DocObject.Macros.AddObject(Self, 'ChildUretimKartReport');
end;

end.
