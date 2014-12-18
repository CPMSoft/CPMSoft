unit CPMApp_DataControllerMaliyet;

interface

uses Windows, Classes, SysUtils, DB, Dialogs,
  CPMApp_DB, CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel,
  CPMApp_TableItems, CPMApp_BOMConsts,
  CPMApp_DataControllerCommon, CPMApp_DataControllerFiyat,
  CPMApp_TableStokSystem, CPMApp_TableFIPSystem;

type
  TAppDataControllerMaliyet = class;

  TAppMaliyetData = record
    BirimMaliyet1: Double;
    BirimMaliyet1DovizCins: String;
    BirimMaliyet1DovizKur: Double;
    BirimMaliyet2: Double;
    BirimMaliyet3: Double;
    BirimMaliyet: Double;
    Maliyet: Double;
    MaliyetGrup1: Double;
    MaliyetGrup2: Double;
    MaliyetGrup3: Double;
    MaliyetGrup4: Double;
    MaliyetGrupDiger: Double;
    YerelBirimMaliyet1: Double;
    YerelBirimMaliyet2: Double;
    YerelBirimMaliyet3: Double;
    YerelBirimMaliyet: Double;
    YerelMaliyet1: Double;
    YerelMaliyet2: Double;
    YerelMaliyet3: Double;
    YerelMaliyet: Double;
    YerelMaliyetGrup1: Double;
    YerelMaliyetGrup2: Double;
    YerelMaliyetGrup3: Double;
    YerelMaliyetGrup4: Double;
    YerelMaliyetGrupDiger: Double;
  end;

  TAppMaliyetParams = class
  private
    FTarih: TDateTime;
    FDefterTip: Smallint;
    FMaliyetTip: TAppMaliyetTip;
    FKirilimVersiyonNo: Smallint;
    FMYBasTarih: TDateTime;
    FFiyatSablonNo: Integer;
    FFiyatSekli: String;
    FBanka: Smallint;
    FDovizTip: Smallint;
    FDovizTarih: TDateTime;
    FYeniFiyatKaydet: Boolean;
    FYeniFiyatSablonNo: Smallint;
    FYeniFiyatSekli: String;
  published
    property Tarih: TDateTime read FTarih write FTarih;
    property DefterTip: Smallint read FDefterTip write FDefterTip;
    property MaliyetTip: TAppMaliyetTip read FMaliyetTip write FMaliyetTip;
    property KirilimVersiyonNo: Smallint read FKirilimVersiyonNo write FKirilimVersiyonNo;
    property MYBasTarih: TDateTime read FMYBasTarih write FMYBasTarih;
    property FiyatSablonNo: Integer read FFiyatSablonNo write FFiyatSablonNo;
    property FiyatSekli: String read FFiyatSekli write FFiyatSekli;
    property Banka: Smallint read FBanka write FBanka;
    property DovizTip: Smallint read FDovizTip write FDovizTip;
    property DovizTarih: TDateTime read FDovizTarih write FDovizTarih;
    property YeniFiyatKaydet: Boolean read FYeniFiyatKaydet write FYeniFiyatKaydet;
    property YeniFiyatSablonNo: Smallint read FYeniFiyatSablonNo write FYeniFiyatSablonNo;
    property YeniFiyatSekli: String read FYeniFiyatSekli write FYeniFiyatSekli;
  end;

  TAppMaliyetFiyatKart = class(TAppFiyatKart)
  private
    FMalKod: String;
    FFiyatTarih: TDateTime;
    FFiyatSekli: String;
    FTip: Integer;
    FHesapKod: String;
    FSablonNo: Integer;
  protected
    procedure Init; override;
    function GetTip: Integer; override;
    function GetSablonNo: Integer; override;
    function GetFiyatSekli: String; override;
    function GetHesapKod: String; override;
    function GetMalKod: String; override;
    function GetFiyatTarih: TDateTime; override;
    function GetHareketKod(AHareketAlan: String): String; override;
  public
    constructor Create(AOwner: TAppDataControllerCustomCommon); virtual;
    destructor Destroy; override;
    function FindMaliyet(var MaliyetData: TAppMaliyetData): Boolean;
  published
    property Tip: Integer read FTip write FTip;
    property SablonNo: Integer read FSablonNo write FSablonNo;
    property FiyatSekli: String read FFiyatSekli write FFiyatSekli;
    property HesapKod: String read FHesapKod write FHesapKod;
    property MalKod: String read FMalKod write FMalKod;
    property FiyatTarih: TDateTime read FFiyatTarih write FFiyatTarih;
  end;

  TAppMaliyetDoviz = class
  private
    FDataSetDoviz: TAppDataSet;
    FTableCommand: TAppDBTable;
    procedure CreateDovizDataSet;
  public
    constructor Create(AOwner: TAppDataControllerCustomCommon); virtual;
    destructor Destroy; override;
    function DovizKur(Banka, DovizTip: Smallint; DovizTarih: TDateTime; DovizCins: String): Double;
  end;

  TAppDataControllerMaliyet = class
  private
    FDataControllerCommon: TAppDataControllerCustomCommon;
    FDataSetMaliyet: TAppDataSet;
    FTableCommand: TAppDBTable;
    FTableStokKart: TAppDBTable;
    FTableYeniFiyatKart: TTableFiyatKart;
    FParams: TAppMaliyetParams;
    FFiyat: TAppMaliyetFiyatKart;
    FFiyatStokKart: TAppStokKartFiyat;
    FDoviz: TAppMaliyetDoviz;
    procedure ExecFiyat(MalKod, VersiyonNo, DepoKod, TeminYer, FirmaTip: string; var MaliyetData: TAppMaliyetData);
    procedure ExecStandartMaliyet(MalKod, VersiyonNo: string; var MaliyetData: TAppMaliyetData);
    procedure ExecFIFO(MalKod, VersiyonNo: string; Miktar: Double; var MaliyetData: TAppMaliyetData);
    procedure ExecYABO(MalKod, VersiyonNo: string; Miktar: Double; var MaliyetData: TAppMaliyetData);
    function GetConnection: TAppConnection;
    procedure CreateMaliyetDataSet;
    procedure CreateTableStokKart;
    procedure CreateTableYeniFiyatKart;
    procedure OpenYeniFiyatKart;
  public
    constructor Create(AOwner: TAppDataControllerCustomCommon);
    destructor Destroy; override;
    procedure Start; virtual;
    procedure Finish; virtual;
    procedure Execute(MalKod, VersiyonNo, DepoKod, TeminYer, FirmaTip: String; Miktar: Double; var MaliyetData: TAppMaliyetData);
    procedure Save(MalKod, VersiyonNo: String; MaliyetData: TAppMaliyetData);
  published
    property Connection: TAppConnection read GetConnection;
    property Params: TAppMaliyetParams read FParams;
    property Fiyat: TAppMaliyetFiyatKart read FFiyat;
    property FiyatStokKart: TAppStokKartFiyat read FFiyatStokKart;
    property Doviz: TAppMaliyetDoviz read FDoviz;
  end;

implementation

uses Variants, CPMApp_Security, CPMApp_Math, CPMApp_DBLibrary, CPMApp_Date;

{ TAppFiyatKartForMaliyet }

constructor TAppMaliyetFiyatKart.Create(
  AOwner: TAppDataControllerCustomCommon);
begin
  inherited Create(AOwner);
end;

destructor TAppMaliyetFiyatKart.Destroy;
begin

  inherited;
end;

function TAppMaliyetFiyatKart.FindMaliyet(var MaliyetData: TAppMaliyetData): Boolean;
begin
  Result := Find;
  if Result then
  begin
    MaliyetData.BirimMaliyet1 := Table.Fiyat;
    MaliyetData.BirimMaliyet1DovizCins := Table.DovizCins;
  end;
end;

function TAppMaliyetFiyatKart.GetFiyatSekli: String;
begin
  Result := FiyatSekli;
end;

function TAppMaliyetFiyatKart.GetFiyatTarih: TDateTime;
begin
  Result := FiyatTarih;
end;

function TAppMaliyetFiyatKart.GetHareketKod(AHareketAlan: String): String;
begin
  Result := '';
end;

function TAppMaliyetFiyatKart.GetHesapKod: String;
begin
  Result := HesapKod;
end;

function TAppMaliyetFiyatKart.GetMalKod: String;
begin
  Result := MalKod;
end;

function TAppMaliyetFiyatKart.GetSablonNo: Integer;
begin
  Result := SablonNo;
end;

function TAppMaliyetFiyatKart.GetTip: Integer;
begin
  Result := Tip;
end;

procedure TAppMaliyetFiyatKart.Init;
begin
  inherited;

end;

{ TAppMaliyetDoviz }

constructor TAppMaliyetDoviz.Create(AOwner: TAppDataControllerCustomCommon);
begin
  inherited Create;
  FTableCommand := AOwner.TableCommand;
  CreateDovizDataSet;
end;

procedure TAppMaliyetDoviz.CreateDovizDataSet;
begin
  FDataSetDoviz := TAppDataSet.Create(nil);
  FDataSetDoviz.FieldDefs.Add('BANKA', ftInteger, 0, false);
  FDataSetDoviz.FieldDefs.Add('TARIH', ftDate, 0, false);
  FDataSetDoviz.FieldDefs.Add('DOVIZCINS', ftString, 3, false);
  FDataSetDoviz.FieldDefs.Add('DOVIZTIP', ftInteger, 0, false);
  FDataSetDoviz.FieldDefs.Add('DOVIZKUR', ftFloat, 0, false);
  FDataSetDoviz.CreateDataSet;
  FDataSetDoviz.LogChanges := false;
  FDataSetDoviz.IndexFieldNames := 'BANKA;TARIH;DOVIZCINS;DOVIZTIP';
end;

destructor TAppMaliyetDoviz.Destroy;
begin
  FreeAndNil(FDataSetDoviz);
  inherited;
end;

function TAppMaliyetDoviz.DovizKur(Banka, DovizTip: Smallint; DovizTarih: TDateTime; DovizCins: String): Double;
var
  SQL: String;
begin
  // Bu prosedür toplu iþlem yaptýðý için evrak iþlemdekinden farklý olarak döviz kuru sýfýr bulunsa bile tekrar prosedürü execute etmiyor.
  if FDataSetDoviz.FindKey([Banka, DovizTarih, DovizCins, DovizTip]) then
  begin
    Result := FDataSetDoviz.FieldByName('DOVIZKUR').AsFloat;
    Exit;
  end;
  SQL := 'EXEC dbo.SPAPP_FINDDOVIZKUR %d, %d, ''%s'', %d, %d';
  SQL := Format(SQL, [Banka, Trunc(DovizTarih), DovizCins, DovizTip, 0]);
  FTableCommand.OpenCommandText(SQL);
  Result := FTableCommand.Fields[0].AsFloat;
  
  FDataSetDoviz.Insert;
  FDataSetDoviz.FieldByName('BANKA').AsInteger := Banka;
  FDataSetDoviz.FieldByName('TARIH').AsFloat := DovizTarih;
  FDataSetDoviz.FieldByName('DOVIZCINS').Value := DovizCins;
  FDataSetDoviz.FieldByName('DOVIZTIP').AsInteger := DovizTip;
  FDataSetDoviz.FieldByName('DOVIZKUR').AsFloat := Result;
  FDataSetDoviz.Post;

  FTableCommand.Close;
end;

{ TAppDataControllerMaliyet }

constructor TAppDataControllerMaliyet.Create(AOwner: TAppDataControllerCustomCommon);
begin
  inherited Create;
  FDataControllerCommon := AOwner;
  FParams := TAppMaliyetParams.Create;
  FFiyat := TAppMaliyetFiyatKart.Create(AOwner);
  FFiyatStokKart := TAppStokKartFiyat.Create(AOwner);
  FDoviz := TAppMaliyetDoviz.Create(AOwner);
  FTableCommand := AOwner.TableCommand;
  CreateMaliyetDataSet;
  CreateTableStokKart;
  CreateTableYeniFiyatKart;
end;

procedure TAppDataControllerMaliyet.CreateTableYeniFiyatKart;
begin
  FTableYeniFiyatKart := TTableFiyatKart.Create(nil);
  FTableYeniFiyatKart.Connection := FDataControllerCommon.Connection;
  FTableYeniFiyatKart.TableItems.TableNames := 'FYTKRT';
end;

procedure TAppDataControllerMaliyet.OpenYeniFiyatKart;
begin
  FTableYeniFiyatKart.Close;
  with FTableYeniFiyatKart.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
    end;
    with Where do
    begin
      Clear;
      Add('TIP', wcInList, VarArrayOf([1, 3])).DataType := ftSmallint;
      AddOperator(woAnd);
      Add('SABLONNO', wcEqual, Params.YeniFiyatSablonNo);
      AddOperator(woAnd);
      Add('FIYATSEKLI', wcEqual, Params.YeniFiyatSekli);
      AddOperator(woAnd);
      Add('CARIALAN', wcEqual, 'HESAPKOD');
      AddOperator(woAnd);
      Add('STOKALAN', wcEqual, 'MALKOD');
      AddOperator(woAnd);
      Add('HAREKETALAN', wcEqual, '');
      AddOperator(woAnd);
      Add('CARIKOD', wcEqual, 'GENEL');
      AddOperator(woAnd);
      Add('HAREKETKOD', wcEqual, '');
    end;
  end;
  FTableYeniFiyatKart.IndexFieldNames := 'TIP;STOKKOD';
  FTableYeniFiyatKart.Open;
end;

procedure TAppDataControllerMaliyet.CreateTableStokKart;
begin
  FTableStokKart := TAppDBTable.Create(nil);
  FTableStokKart.Connection := FDataControllerCommon.Connection;
  FTableStokKart.ReadOnly := True;
  FTableStokKart.TableItems.TableNames := 'STKKRT';
end;

procedure TAppDataControllerMaliyet.CreateMaliyetDataSet;
begin
  FDataSetMaliyet := TAppDataSet.Create(nil);
  with FDataSetMaliyet.FieldDefs do
  begin
    Add('MALKOD', ftString, 30);
    Add('VERSIYONNO', ftString, 30);
    Add('BIRIMMALIYET1', ftFloat);
    Add('BIRIMMALIYET1DOVIZCINS', ftString, 3);
    Add('BIRIMMALIYET1DOVIZKUR', ftFloat);
    Add('BIRIMMALIYET2', ftFloat);
    Add('BIRIMMALIYET3', ftFloat);
    Add('BIRIMMALIYET', ftFloat);
    Add('YERELBIRIMMALIYET1', ftFloat);
    Add('YERELBIRIMMALIYET2', ftFloat);
    Add('YERELBIRIMMALIYET3', ftFloat);
    Add('YERELBIRIMMALIYET', ftFloat);
  end;
  FDataSetMaliyet.CreateDataSet;
  FDataSetMaliyet.LogChanges := false;
  FDataSetMaliyet.IndexFieldNames := 'MALKOD;VERSIYONNO';
end;

destructor TAppDataControllerMaliyet.Destroy;
begin
  FreeAndNil(FParams);
  FreeAndNil(FFiyat);
  FreeAndNil(FFiyatStokKart);
  FreeAndNil(FDoviz);
  FreeAndNil(FDataSetMaliyet);
  FreeAndNil(FTableStokKart);
  FreeAndNil(FTableYeniFiyatKart);
  inherited;
end;

function TAppDataControllerMaliyet.GetConnection: TAppConnection;
begin
  Result := AppSecurity.ConnectionApp;
end;

procedure TAppDataControllerMaliyet.ExecFiyat(MalKod, VersiyonNo, DepoKod, TeminYer, FirmaTip: string; var MaliyetData: TAppMaliyetData);
begin
  MaliyetData.BirimMaliyet1 := 0;
  MaliyetData.BirimMaliyet1DovizCins := '';
  if not SameText(Params.FiyatSekli, '') then
  begin
    if FiyatStokKart.FindOzelFiyat(MalKod, VersiyonNo, DepoKod, '', '', Params.FiyatSekli, Params.Tarih, 1) then
    begin
      MaliyetData.BirimMaliyet1 := FiyatStokKart.Fiyat;
    end
    else if FiyatStokKart.FindFiyat(MalKod, Params.FiyatSekli) then
    begin
      MaliyetData.BirimMaliyet1 := FiyatStokKart.Fiyat;
      MaliyetData.BirimMaliyet1DovizCins := FiyatStokKart.FiyatDovizCins;
    end else
    begin
      if TeminYer = '' then
      begin
        TeminYer := FDataControllerCommon.FindStokKart.Find(MalKod, 'TEMINYER');
        if TeminYer = '' then
          TeminYer := 'GENEL';
        FirmaTip := FDataControllerCommon.FindCariKart.Find(TeminYer, 'FIRMATIP');
      end;

      if FirmaTip = '1' then
        Fiyat.Tip := 3 // Ýthalat
      else
        Fiyat.Tip := 1; // Yurtiçi Alým
      Fiyat.SablonNo := Params.FiyatSablonNo;
      Fiyat.FiyatSekli := Params.FiyatSekli;
      Fiyat.FiyatTarih := Params.Tarih;
      Fiyat.MalKod := MalKod;
      Fiyat.HesapKod := TeminYer;

      Fiyat.FindMaliyet(MaliyetData);
    end;
  end;
end;

procedure TAppDataControllerMaliyet.ExecStandartMaliyet(MalKod, VersiyonNo: string; var MaliyetData: TAppMaliyetData);
begin
  FTableStokKart.Close;
  with FTableStokKart.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALKOD');
      Add('MALIYET1');
      Add('MALIYET2');
      Add('MALIYET3');
    end;
    with Where do
    begin
      Clear;
      Add('MALKOD', wcEqual, MalKod);
    end;
  end;
  try
    FTableStokKart.Open;
  except
    Exit;
  end;
  try
    MaliyetData.BirimMaliyet1 := FTableStokKart.Fields[1].AsFloat;
    MaliyetData.BirimMaliyet1DovizCins := '';
    MaliyetData.BirimMaliyet2 := FTableStokKart.Fields[2].AsFloat;
    MaliyetData.BirimMaliyet3 := FTableStokKart.Fields[3].AsFloat;
  except
    MaliyetData.BirimMaliyet1 := 0;
    MaliyetData.BirimMaliyet1DovizCins := '';
    MaliyetData.BirimMaliyet2 := 0;
    MaliyetData.BirimMaliyet3 := 0;
  end;
end;

procedure TAppDataControllerMaliyet.ExecFIFO(MalKod, VersiyonNo: string; Miktar: Double; var MaliyetData: TAppMaliyetData);
var
  SQL: String;
  AMiktar, AMaliyet: Double;
  vWhereClause: String;
begin
  if Params.KirilimVersiyonNo = 0 then
    vWhereClause := format('STKHAR.MALKOD=''''%s''''', [MalKod])
  else
    vWhereClause := format('STKHAR.MALKOD=''''%s'''' AND STKHAR.VERSIYONNO=''''%s''''', [MalKod, VersiyonNo]);

  SQL := 'EXEC dbo.SPAPP_SMM_FIFO ';
  SQL := SQL + '@SIRKETNO = %s,';
  SQL := SQL + '@DEFTERTIP = %d,';
  SQL := SQL + '@KIRILIMVERSIYONNO = %d,';
  SQL := SQL + '@MYBASTARIH = %s,';
  SQL := SQL + '@BASTARIH = %s,';
  SQL := SQL + '@BITTARIH = %s,';
  SQL := SQL + '@STKWHERECLAUSE = %s,';
  SQL := SQL + '@RAPORTIP = 2,';
  SQL := SQL + '@SANALMIKTAR = %s';
  SQL := Format(SQL,
        [
          AppVarToSqlStr(ftString, AppSecurity.DBCompanyNo),
          Params.DefterTip,
          Params.KirilimVersiyonNo,
          AppVarToSqlStr(ftDate, Params.MYBasTarih),
          AppVarToSqlStr(ftDate, Params.MYBasTarih),
          AppVarToSqlStr(ftDate, AppLastDate),
          AppVarToSqlStr(ftString, vWhereClause),
          AppVarToSqlStr(ftFloat, Miktar)
        ]);
  FTableCommand.OpenCommandText(SQL);

  AMiktar := FTableCommand.Fields[5].AsFloat;
  AMaliyet := FTableCommand.Fields[6].AsFloat;
  MaliyetData.BirimMaliyet1 := AppDiv(AMaliyet, AMiktar);
  MaliyetData.BirimMaliyet1DovizCins := '';
end;

procedure TAppDataControllerMaliyet.ExecYABO(MalKod, VersiyonNo: string; Miktar: Double; var MaliyetData: TAppMaliyetData);
var
  SQL: String;
  AMiktar, AMaliyet: Double;
  vWhereClause: String;
begin
  if Params.KirilimVersiyonNo = 0 then
    vWhereClause := format('STKHAR.MALKOD=''''%s''''', [MalKod])
  else
    vWhereClause := format('STKHAR.MALKOD=''''%s'''' AND STKHAR.VERSIYONNO=''''%s''''', [MalKod, VersiyonNo]);

  SQL := 'EXEC dbo.SPAPP_SMM_YABO ';
  SQL := SQL + '@SIRKETNO = %s,';
  SQL := SQL + '@DEFTERTIP = %d,';
  SQL := SQL + '@KIRILIMVERSIYONNO = %d,';
  SQL := SQL + '@MYBASTARIH = %s,';
  SQL := SQL + '@BASTARIH = %s,';
  SQL := SQL + '@BITTARIH = %s,';
  SQL := SQL + '@STKWHERECLAUSE = %s,';
  SQL := SQL + '@RAPORTIP = 2,';
  SQL := SQL + '@SANALMIKTAR = %s';

  SQL := Format(SQL,
        [
          AppVarToSqlStr(ftString, AppSecurity.DBCompanyNo),
          Params.DefterTip,
          Params.KirilimVersiyonNo,
          AppVarToSqlStr(ftDate, Params.MYBasTarih),
          AppVarToSqlStr(ftDate, Params.MYBasTarih),
          AppVarToSqlStr(ftDate, AppLastDate),
          AppVarToSqlStr(ftString, vWhereClause),
          AppVarToSqlStr(ftFloat, Miktar)
        ]);
  FTableCommand.OpenCommandText(SQL);

  AMiktar := FTableCommand.Fields[5].AsFloat;
  AMaliyet := FTableCommand.Fields[6].AsFloat;
  MaliyetData.BirimMaliyet1 := AppDiv(AMaliyet, AMiktar);
  MaliyetData.BirimMaliyet1DovizCins := '';
end;

procedure TAppDataControllerMaliyet.Execute(MalKod, VersiyonNo, DepoKod, TeminYer, FirmaTip: String; Miktar: Double; var MaliyetData: TAppMaliyetData);
begin
  if FDataSetMaliyet.FindKey([MalKod, VersiyonNo]) then
  begin
    MaliyetData.BirimMaliyet1 := FDataSetMaliyet.FieldByName('BIRIMMALIYET1').AsFloat;
    MaliyetData.BirimMaliyet1DovizCins := FDataSetMaliyet.FieldByName('BIRIMMALIYET1DOVIZCINS').AsString;
    MaliyetData.BirimMaliyet1DovizKur := FDataSetMaliyet.FieldByName('BIRIMMALIYET1DOVIZKUR').AsFloat;
    MaliyetData.BirimMaliyet2 := FDataSetMaliyet.FieldByName('BIRIMMALIYET2').AsFloat;
    MaliyetData.BirimMaliyet3 := FDataSetMaliyet.FieldByName('BIRIMMALIYET3').AsFloat;
    MaliyetData.BirimMaliyet := FDataSetMaliyet.FieldByName('BIRIMMALIYET').AsFloat;
    MaliyetData.YerelBirimMaliyet1 := FDataSetMaliyet.FieldByName('YERELBIRIMMALIYET1').AsFloat;
    MaliyetData.YerelBirimMaliyet2 := FDataSetMaliyet.FieldByName('YERELBIRIMMALIYET2').AsFloat;
    MaliyetData.YerelBirimMaliyet3 := FDataSetMaliyet.FieldByName('YERELBIRIMMALIYET3').AsFloat;
    MaliyetData.YerelBirimMaliyet := FDataSetMaliyet.FieldByName('YERELBIRIMMALIYET').AsFloat;
  end else
  begin
    MaliyetData.BirimMaliyet1 := 0;
    MaliyetData.BirimMaliyet1DovizCins := '';
    MaliyetData.BirimMaliyet1DovizKur := 0;
    MaliyetData.BirimMaliyet2 := 0;
    MaliyetData.BirimMaliyet3 := 0;

    case Params.MaliyetTip of
      mtFiyat             : ExecFiyat(MalKod, VersiyonNo, DepoKod, TeminYer, FirmaTip, MaliyetData);
      mtStandart          : ExecStandartMaliyet(MalKod, VersiyonNo, MaliyetData);
      mtFIFO              : ExecFIFO(MalKod, VersiyonNo, Miktar, MaliyetData);
      mtYABO              : ExecYABO(MalKod, VersiyonNo, Miktar, MaliyetData);
    end;

    if MaliyetData.BirimMaliyet1DovizCins <> '' then
    begin
      MaliyetData.BirimMaliyet1DovizKur := Doviz.DovizKur(Params.Banka, Params.DovizTip, Params.DovizTarih, MaliyetData.BirimMaliyet1DovizCins);
      MaliyetData.YerelBirimMaliyet1 := MaliyetData.BirimMaliyet1 * MaliyetData.BirimMaliyet1DovizKur;
    end else
    begin
      MaliyetData.BirimMaliyet1DovizKur := 0;
      MaliyetData.YerelBirimMaliyet1 := MaliyetData.BirimMaliyet1;
    end;

    MaliyetData.BirimMaliyet := MaliyetData.BirimMaliyet1; // Diðerlerini þimdilik toplamýyorum, baymak için acildi, elma ile armut toplanmaýþ olmasýn

    MaliyetData.YerelBirimMaliyet2 := MaliyetData.BirimMaliyet2;
    MaliyetData.YerelBirimMaliyet3 := MaliyetData.BirimMaliyet3;

    MaliyetData.YerelBirimMaliyet := MaliyetData.YerelBirimMaliyet1 + MaliyetData.YerelBirimMaliyet2 + MaliyetData.YerelBirimMaliyet3;

    FDataSetMaliyet.Insert;
    FDataSetMaliyet.FieldByName('MALKOD').AsString := MalKod;
    FDataSetMaliyet.FieldByName('VERSIYONNO').AsString := VersiyonNo;
    FDataSetMaliyet.FieldByName('BIRIMMALIYET1').AsFloat := MaliyetData.BirimMaliyet1;
    FDataSetMaliyet.FieldByName('BIRIMMALIYET1DOVIZCINS').AsString := MaliyetData.BirimMaliyet1DovizCins;
    FDataSetMaliyet.FieldByName('BIRIMMALIYET1DOVIZKUR').AsFloat := MaliyetData.BirimMaliyet1DovizKur;
    FDataSetMaliyet.FieldByName('BIRIMMALIYET2').AsFloat := MaliyetData.BirimMaliyet2;
    FDataSetMaliyet.FieldByName('BIRIMMALIYET3').AsFloat := MaliyetData.BirimMaliyet3;
    FDataSetMaliyet.FieldByName('BIRIMMALIYET').AsFloat := MaliyetData.BirimMaliyet;
    FDataSetMaliyet.FieldByName('YERELBIRIMMALIYET1').AsFloat := MaliyetData.YerelBirimMaliyet1;
    FDataSetMaliyet.FieldByName('YERELBIRIMMALIYET2').AsFloat := MaliyetData.YerelBirimMaliyet2;
    FDataSetMaliyet.FieldByName('YERELBIRIMMALIYET3').AsFloat := MaliyetData.YerelBirimMaliyet3;
    FDataSetMaliyet.FieldByName('YERELBIRIMMALIYET').AsFloat := MaliyetData.YerelBirimMaliyet;
    FDataSetMaliyet.Post;
  end;

  MaliyetData.Maliyet := MaliyetData.BirimMaliyet * Miktar;

  MaliyetData.YerelMaliyet1 := MaliyetData.YerelBirimMaliyet1 * Miktar;
  MaliyetData.YerelMaliyet2 := MaliyetData.YerelBirimMaliyet2 * Miktar;
  MaliyetData.YerelMaliyet3 := MaliyetData.YerelBirimMaliyet3 * Miktar;
  MaliyetData.YerelMaliyet := MaliyetData.YerelBirimMaliyet * Miktar;
end;

procedure TAppDataControllerMaliyet.Save(MalKod, VersiyonNo: String; MaliyetData: TAppMaliyetData);
var
  TeminYer: String;
  FirmaTip: String;
  FiyatTip: Smallint;
begin
  if not Params.YeniFiyatKaydet then
    Exit;
  TeminYer := FDataControllerCommon.FindStokKart.Find(MalKod, 'TEMINYER');
  if TeminYer = '' then
    TeminYer := 'GENEL';
  FirmaTip := FDataControllerCommon.FindCariKart.Find(TeminYer, 'FIRMATIP');
  if FirmaTip = '1' then
    FiyatTip := 3 // Ýthalat
  else
    FiyatTip := 1; // Yurtiçi Alým
  if FTableYeniFiyatKart.FindKey([FiyatTip, MalKod]) then
  begin
    FTableYeniFiyatKart.Edit;
    FTableYeniFiyatKart.Fiyat := MaliyetData.BirimMaliyet1;
    FTableYeniFiyatKart.DovizCins := MaliyetData.BirimMaliyet1DovizCins;
    FTableYeniFiyatKart.Post;
  end else
  begin
    FTableYeniFiyatKart.Insert;
    FTableYeniFiyatKart.KayitTur := 1;
    FTableYeniFiyatKart.KayitDurum := 1;
    FTableYeniFiyatKart.Tip := FiyatTip;
    FTableYeniFiyatKart.SablonNo := Params.YeniFiyatSablonNo;
    FTableYeniFiyatKart.FiyatSekli := Params.YeniFiyatSekli;
    FTableYeniFiyatKart.CariAlan := 'HESAPKOD';
    FTableYeniFiyatKart.StokAlan := 'MALKOD';
    FTableYeniFiyatKart.HareketAlan := '';
    FTableYeniFiyatKart.CariKod := 'GENEL';
    FTableYeniFiyatKart.StokKod := MalKod;
    FTableYeniFiyatKart.HareketKod := '';
    FTableYeniFiyatKart.Fiyat := MaliyetData.BirimMaliyet1;
    FTableYeniFiyatKart.DovizCins := MaliyetData.BirimMaliyet1DovizCins;
    FTableYeniFiyatKart.Post;
  end;
end;

procedure TAppDataControllerMaliyet.Start;
begin
  FDataSetMaliyet.EmptyDataSet;
  if Params.YeniFiyatKaydet then
    OpenYeniFiyatKart;
end;

procedure TAppDataControllerMaliyet.Finish;
begin
  if Params.YeniFiyatKaydet then
  begin
    FTableYeniFiyatKart.Save;
    FTableYeniFiyatKart.Close;
  end;
end;

end.
