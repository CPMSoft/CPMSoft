unit CPMApp_DataControllerUretimTransferEmri;

interface

uses Windows, Classes, SysUtils, DB, Dialogs, Forms,
  CPMApp_DB, CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_Rule_ClientIncrement,
  CPMApp_DataControllerUretim,
  CPMApp_TableStokSystem, 
  CPMApp_TableUretimSystem, 
  CPMApp_TableWarehouseSystem, 
  CPMApp_DocStatusWindow;

type
  TAppDataControllerUretimTransferEmri = class;

  TAppUretimEmri = class;
  TAppTransferEmri = class;

  TAppParams = class
  private
    FUretimEmri_EvrakTip: Smallint;
    FUretimEmri_HesapKod: string;
    FUretimEmri_EvrakNo: string;
  public
    constructor Create;
  published
    property UretimEmri_EvrakTip: Smallint read FUretimEmri_EvrakTip;
    property UretimEmri_HesapKod: string read FUretimEmri_HesapKod write FUretimEmri_HesapKod;
    property UretimEmri_EvrakNo: string read FUretimEmri_EvrakNo write FUretimEmri_EvrakNo;
  end;

  TAppUretimEmri = class
  private
    FOwner: TAppDataControllerUretimTransferEmri;
    FTable: TTableStokHareket; // MRPEYP
  public
    constructor Create(AOwner: TAppDataControllerUretimTransferEmri);
    destructor Destroy; override;
    procedure CreateTable;
    procedure Open(EvrakTip: Smallint; EvrakNo: String);
  published
    property Table: TTableStokHareket read FTable;
  end;

  TAppTransferEmri = class
  private
    FOwner: TAppDataControllerUretimTransferEmri;
    FTableDepoTransfer: TTableDepoTransfer;
    FTableDepoBaslik: TTableDepoBaslik;
    procedure CreateTableDepoBaslik;
    procedure CreateTableDepoTransfer;
    procedure OpenDepoBaslik(EvrakTip: Smallint; HesapKod: String; EvrakNo: String);
    procedure OpenDepoTransfer(KaynakEvrakTip: Smallint; KaynakHesapKod, KaynakEvrakNo: String);
  public
    constructor Create(AOwner: TAppDataControllerUretimTransferEmri);
    destructor Destroy; override;
    procedure Open(EvrakTip: Smallint; EvrakNo: String);
    procedure Delete;
    procedure Save;
    procedure DisableControls;
    procedure EnableControls;
  published
    property TableDepoBaslik: TTableDepoBaslik read FTableDepoBaslik;
    property TableDepoTransfer: TTableDepoTransfer read FTableDepoTransfer;
  end;

  TAppDataControllerUretimTransferEmri = class
  private
    FParams: TAppParams;
    FConnection: TAppConnection;
    FUretimEmri: TAppUretimEmri;
    FTransferEmri: TAppTransferEmri;
    FStatus: TAppDocStatusWindow;
    FMainForm: TForm;
    function GetConnection: TAppConnection;
    function GetCompanyNo: String;
    procedure DisableControls;
    procedure EnableControls;
  protected
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure OpenTables;
    procedure Execute;
  published
    property Connection: TAppConnection read GetConnection write FConnection;
    property CompanyNo: String read GetCompanyNo;
    property Params: TAppParams read FParams;
    property UretimEmri: TAppUretimEmri read FUretimEmri;
    property TransferEmri: TAppTransferEmri read FTransferEmri;
    property MainForm: TForm read FMainForm write FMainForm;
  end;

implementation

uses Variants, CPMApp_Security, CPMApp_Dialogs, CPMApp_DocConsts;

{ TAppUretimEmri }

constructor TAppUretimEmri.Create(AOwner: TAppDataControllerUretimTransferEmri);
begin
  inherited Create;
  FOwner := AOwner;
  CreateTable;
end;

procedure TAppUretimEmri.CreateTable;
begin
  FTable := TTableStokHareket.Create(nil);
  FTable.Connection := FOwner.Connection;
  FTable.ReadOnly := True;

  // Set Table Definitions
  FTable.TableItems.TableNames := VarArrayOf(['STKHAR']);
  FTable.TableItems.TableAlias := VarArrayOf(['STKHAR']);
  FTable.TableItems.TableCaptions := VarArrayOf(['Stok Hareket']);
  FTable.TableItems.TableReferans := VarArrayOf(['STKHAR']);
  with FTable.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
    end;
    with Where do
    begin
      Clear;      
    end;
  end;
  FTable.DoInitializeRecord;
  FTable.Close;
end;

destructor TAppUretimEmri.Destroy;
begin
  FreeAndNil(FTable);
  inherited;
end;

procedure TAppUretimEmri.Open(EvrakTip: Smallint; EvrakNo: String);
begin
  FTable.Close;
  with FTable.TableItems[0].Where do
  begin
    Clear;
    Add('SIRKETNO', wcEqual, FOwner.CompanyNo);
    AddOperator(woAnd);
    Add('EVRAKTIP', wcEqual, EvrakTip);
    AddOperator(woAnd);
    Add('EVRAKNO', wcEqual, EvrakNo);
  end;
  FTable.Open;
end;

{ TAppTransferEmri }

constructor TAppTransferEmri.Create(AOwner: TAppDataControllerUretimTransferEmri);
begin
  inherited Create;
  FOwner := AOwner;
  CreateTableDepoBaslik;
  CreateTableDepoTransfer;
end;

procedure TAppTransferEmri.CreateTableDepoBaslik;
begin
  FTableDepoBaslik := TTableDepoBaslik.Create(nil);
  FTableDepoBaslik.Connection := FOwner.Connection;
  FTableDepoBaslik.IndexFieldNames := 'SIRKETNO;EVRAKTIP;HESAPKOD;EVRAKNO';

  // Set Table Definitions
  FTableDepoBaslik.TableItems.TableNames := 'DEPBAS';
  FTableDepoBaslik.TableItems.TableAlias := 'DEPBAS';
  FTableDepoBaslik.TableItems.TableCaptions := 'DEPBAS';
  FTableDepoBaslik.TableItems.TableReferans := 'DEPBAS';
  with FTableDepoBaslik.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
    end;
    with Where do
    begin
      Clear;
    end;
  end;
  FTableDepoBaslik.DoInitializeRecord;
  FTableDepoBaslik.Close;
end;

procedure TAppTransferEmri.CreateTableDepoTransfer;
begin
  FTableDepoTransfer := TTableDepoTransfer.Create(nil);
  FTableDepoTransfer.Connection := FOwner.Connection;
  FTableDepoTransfer.IndexFieldNames := 'SIRKETNO;EVRAKTIP;HESAPKOD;EVRAKNO;MALKOD;VERSIYONNO;TAHMINTESLIMTARIH';

  // Set Table Definitions
  FTableDepoTransfer.TableItems.TableNames := 'DEPTRN';
  FTableDepoTransfer.TableItems.TableAlias := 'DEPTRN';
  FTableDepoTransfer.TableItems.TableCaptions := 'DEPTRN';
  FTableDepoTransfer.TableItems.TableReferans := 'DEPTRN';
  with FTableDepoTransfer.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
    end;
    with Where do
    begin
      Clear;
    end;
  end;
  FTableDepoTransfer.DoInitializeRecord;
  FTableDepoTransfer.Close;
end;

procedure TAppTransferEmri.Delete;
begin
  TableDepoTransfer.First;
  while not TableDepoTransfer.Eof do
    TableDepoTransfer.Delete;
    
  TableDepoBaslik.First;
  while not TableDepoBaslik.Eof do
    TableDepoBaslik.Delete;

  TableDepoTransfer.Save;
  TableDepoBaslik.Save;
end;

destructor TAppTransferEmri.Destroy;
begin
  FreeAndNil(FTableDepoBaslik);
  FreeAndNil(FTableDepoTransfer);
  inherited;
end;

procedure TAppTransferEmri.DisableControls;
begin
  TableDepoBaslik.DisableControls;
  TableDepoTransfer.DisableControls;
end;

procedure TAppTransferEmri.EnableControls;
begin
  TableDepoBaslik.EnableControls;
  TableDepoTransfer.EnableControls;
end;

procedure TAppTransferEmri.OpenDepoBaslik(EvrakTip: Smallint; EvrakNo: String);
begin
  TableDepoBaslik.Close;
  with TableDepoBaslik.TableItems[0].Where do
  begin
    Clear;
    Add('SIRKETNO', wcEqual, FOwner.CompanyNo);
    AddOperator(woAnd);
    Add('EVRAKTIP', wcEqual, EvrakTip);
    AddOperator(woAnd);
    Add('EVRAKNO', wcEqual, EvrakNo);
  end;
  TableDepoBaslik.Open;
end;

procedure TAppTransferEmri.OpenDepoTransfer(KaynakEvrakTip: Smallint; KaynakHesapKod, KaynakEvrakNo: String);
begin
  TableDepoTransfer.Close;
  with TableDepoTransfer.TableItems[0].Where do
  begin
    Clear;
    Add('SIRKETNO', wcEqual, FOwner.CompanyNo);
    AddOperator(woAnd);
    Add('KONSOLIDESIRKETNO', wcEqual, '');
    AddOperator(woAnd);
    Add('KAYNAKEVRAKTIP', wcEqual, EvrakTip);
    AddOperator(woAnd);
    Add('KAYNAKHESAPKOD', wcEqual, HesapKod);
    AddOperator(woAnd);
    Add('KAYNAKEVRAKNO', wcEqual, EvrakNo);
  end;
  TableDepoTransfer.Open;
end;

procedure TAppTransferEmri.Open(EvrakTip: Smallint; EvrakNo: String);
begin
  OpenDepoBaslik(EvrakTip, EvrakNo);
  OpenDepoTransfer(EvrakTip, EvrakNo);
end;

procedure TAppTransferEmri.Save;
begin
  TableDepoBaslik.Save;
  TableDepoTransfer.Save;
end;

{ TAppDataControllerUretimTransferEmri }

constructor TAppDataControllerUretimTransferEmri.Create;
begin
  FParams := TAppParams.Create;
  FStatus := TAppDocStatusWindow.Create;
  FUretimEmri := TAppUretimEmri.Create(Self);
  FTransferEmri := TAppTransferEmri.Create(Self);
end;

destructor TAppDataControllerUretimTransferEmri.Destroy;
begin
  FreeAndNil(FParams);
  FreeAndNil(FStatus);
  FreeAndNil(FUretimEmri);
  FreeAndNil(FTransferEmri);
  inherited;
end;

procedure TAppDataControllerUretimTransferEmri.DisableControls;
begin
  UretimEmri.Table.DisableControls;
end;

procedure TAppDataControllerUretimTransferEmri.EnableControls;
begin
  UretimEmri.Table.EnableControls;
end;

procedure TAppDataControllerUretimTransferEmri.OpenTables;
begin
  UretimEmri.Open(Params.UretimEmri_EvrakTip, Params.UretimEmri_EvrakNo);
end;

procedure TAppDataControllerUretimTransferEmri.Execute;
var
  TransferEmri_EvrakTip: Smallint;
  TransferEmri_HesapKod: String;
  TransferEmri_EvrakNo: String;

  procedure PrepStatus;
  begin
    FStatus.MainForm := MainForm;
    FStatus.Items.Clear;
    with FStatus.Items.Add do
    begin
      Name := 'EVRAKNO';
      Caption := 'Ýþ Emri No';
    end;
    with FStatus.Items.Add do
    begin
      Name := 'MALKOD';
      Caption := 'Mal Kodu';
    end;
    with FStatus.Items.Add do
    begin
      Name := 'MALAD';
      Caption := 'Mal Adý';
    end;
  end;

  procedure AddDepoBaslik;
  begin
    if not TransferEmri.TableDepoBaslik.FindKey([CompanyNo, Params.UretimEmri_EvrakTip, Params.UretimEmri_HesapKod, Params.UretimEmri_EvrakNo]) then
    begin
      TransferEmri.TableDepoBaslik.Append;
      TransferEmri.TableDepoBaslik.SirketNo := CompanyNo;
      TransferEmri.TableDepoBaslik.EvrakTip := Params.UretimEmri_EvrakTip;
      TransferEmri.TableDepoBaslik.HesapKod := UretimEmri.Table.EylemHesapKod;
      TransferEmri.TableDepoBaslik.EvrakNo := Params.Teklif_EvrakNo;
      TransferEmri.TableDepoBaslik.EvrakTarih := Params.Teklif_EvrakTarih;
      TransferEmri.TableDepoBaslik.EvrakHazirlayan := AppSecurity.UserName;
      TransferEmri.TableDepoBaslik.Post;
    end;
  end;

  procedure AddDepoTransfer;
  begin
    if TransferEmri.TableDepoTransfer.FindKey([CompanyNo, EvrakTip, UretimEmri.Table.EylemHesapKod, Params.Teklif_EvrakNo, UretimEmri.Table.MalKod, UretimEmri.Table.VersiyonNo, UretimEmri.Table.EylemTarih]) then
    begin
      TransferEmri.TableDepoTransfer.Edit;
      TransferEmri.TableDepoTransfer.Miktar := TransferEmri.TableDepoTransfer.Miktar + UretimEmri.Table.EylemMiktar;
    end else
    begin
      TransferEmri.TableDepoTransfer.Append;
      TransferEmri.TableDepoTransfer.SirketNo := CompanyNo;
      TransferEmri.TableDepoTransfer.EvrakTip := EvrakTip;
      TransferEmri.TableDepoTransfer.HesapKod := UretimEmri.Table.EylemHesapKod;
      TransferEmri.TableDepoTransfer.EvrakNo := Params.Teklif_EvrakNo;
      TransferEmri.TableDepoTransfer.SiraNo := UretimEmri.Table.SiraNo;
      TransferEmri.TableDepoTransfer.EvrakHazirlayan := AppSecurity.UserName;
      TransferEmri.TableDepoTransfer.EvrakTarih := Params.Teklif_EvrakTarih;
      TransferEmri.TableDepoTransfer.IslemTip := IslemTip;
      TransferEmri.TableDepoTransfer.GirisCikis := 0;

      TransferEmri.TableDepoTransfer.MalKod := UretimEmri.Table.MalKod;
      TransferEmri.TableDepoTransfer.VersiyonNo := UretimEmri.Table.VersiyonNo;
      TransferEmri.TableDepoTransfer.DepoKod := DepoKod;
      TransferEmri.TableDepoTransfer.Miktar := UretimEmri.Table.EylemMiktar;
      TransferEmri.TableDepoTransfer.TahminTeslimTarih := UretimEmri.Table.EylemTarih;
      TransferEmri.TableDepoTransfer.SiparisTarih := UretimEmri.Table.EylemSiparisTarih;
    end;

    TransferEmri.TableDepoTransfer.Post;
  end;

begin
  TransferEmri.DisableControls;
  TransferEmri.Open;
  if not TransferEmri.TableDepoBaslik.IsEmpty then
    if AppConfirm('Bu tahmin numarasý ile stok hareketde teklif/teklifler mevcut! Devam etmek için mevcut kayýtlarý sil?') then
    begin
      if AppConfirm(format('%s nolu teklifleri silmek istediðinize eminmisiniz?', [Params.Teklif_EvrakNo])) then
        TransferEmri.Delete
      else
        Exit;
    end else
      Exit;
  PrepStatus;
  DisableControls;
  try
    OpenTables;
    FStatus.Start(UretimEmri.Table.RecordCount);
    UretimEmri.Table.IndexFieldNames := 'MALKOD;VERSIYONNO;EYLEMTARIH';
    UretimEmri.Table.First;
    while not UretimEmri.Table.Eof do
    begin
      if UretimEmri.Table.EylemMiktar > 0 then
      begin
        FStatus['MALKOD'] := UretimEmri.Table.MalKod;
        FStatus['MALAD'] := UretimEmri.Table.StokKart_MalAd;
        FStatus.Add('Teklifler oluþturuluyor...');

        if FindEvrakTip(UretimEmri.Table.StokKart_TeminYontem, UretimEmri.Table.CariKart_FirmaTip) then
        begin
          AddDepoBaslik;
          AddDepoTransfer;
        end;
      end;
      UretimEmri.Table.Next;
    end;
    TransferEmri.Save;
  finally
    TransferEmri.EnableControls;
    EnableControls;
    FStatus.Finish;
  end;
end;

function TAppDataControllerUretimTransferEmri.GetCompanyNo: String;
begin
  Result := AppSecurity.DBCompanyNo;
end;

function TAppDataControllerUretimTransferEmri.GetConnection: TAppConnection;
begin
  Result := FConnection;
  if Result = nil then
    Result := AppSecurity.ConnectionApp;
end;

{ TAppParams }

constructor TAppParams.Create;
begin
  FUretimEmri_EvrakTip := 54;
end;

end.
