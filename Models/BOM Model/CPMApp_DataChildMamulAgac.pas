unit CPMApp_DataChildMamulAgac;

interface

uses
  Classes,
  CPMApp_DocStatusWindow,
  CPMApp_DataApp,
  CPMApp_DataControllerBOMTree,
  CPMApp_TableUretimSystem,
  CPMApp_TableStokSystem;

type
  TAppDataChildCustomMamulAgac = class(TAppDataChild)
  protected
    function GetTable: TTableUretimHareket;
    procedure SetTable(Value: TTableUretimHareket);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
    procedure CreateRules; override;
  published
    property Table: TTableUretimHareket read GetTable write SetTable;
  end;

  TAppDataChildMamulAgac = class;

  TAppDataControllerMamulAgac = class(TAppDataControllerBOMTree)
  private
    FOwner: TAppDataChildMamulAgac;
    FTable: TTableUretimHareket;
    FGosterimTip: Smallint;
    FTableStokKart: TTableStokKart;
    FTableStokVersiyon: TTableStokVersiyon;
    FStokKartFieldList: TStrings;
  protected
    procedure DoOnReturn(BOMData: TAppBOMData); override;
    procedure DoOnReturnRoute(ROMData: TAppROMData); override;
  public
    constructor Create(AOwner: TAppDataChildMamulAgac); reintroduce;
    destructor Destroy; override;

    procedure Start; override;
    procedure Finish; override;
    procedure ExpandList(StokKartFilterText: string; Tarih: TDateTime);
  published
    property GosterimTip: Smallint read FGosterimTip write FGosterimTip;
  end;

  TAppDataChildMamulAgac = class(TAppDataChildCustomMamulAgac)
  private
    FdcMamulAgac: TAppDataControllerMamulAgac;
  protected
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property dcMamulAgac: TAppDataControllerMamulAgac read FdcMamulAgac;
  end;

implementation

uses
  SysUtils,
  Variants,
  DB,
  CPMApp_Dialogs,
  CPMApp_BOMConsts, CPMApp_TableItems, CPMApp_DataObject;

{ TAppDataControllerMamulAgac }

procedure TAppDataControllerMamulAgac.Finish;
begin
  inherited;
  FTable.EnableControls;
end;

constructor TAppDataControllerMamulAgac.Create(AOwner: TAppDataChildMamulAgac);
begin
  inherited Create;
  FOwner := AOwner;
  FTable := AOwner.Table;
  MatchFields.TableDes := AOwner.Table;
  MatchFields.TableParam := AOwner.DataApp.Params.Table;
  MatchFields.Section := 'TableMamulTree';
end;

destructor TAppDataControllerMamulAgac.Destroy;
begin
  if Assigned(FTableStokKart) then
    FreeAndNil(FTableStokKart);
  if Assigned(FTableStokVersiyon) then
    FreeAndNil(FTableStokVersiyon);
  if Assigned(FStokKartFieldList) then
    FreeAndNil(FStokKartFieldList);
  inherited;
end;

procedure TAppDataControllerMamulAgac.DoOnReturn(BOMData: TAppBOMData);
var
  I: Integer;
begin
  if not FTable.Active then
    FTable.Open;

  if GosterimTip = 1 then // Maliyet Listesi
  begin
    if BOMData.SeviyeKod > 0 then // Sadece sýfýrýncý seviyedeki yani kullanýcýnýn kriter aralýðý verdiði mallar gösterilecek.
      Exit;
  end
  else if GosterimTip = 2 then // Maliyet Listesi (Sýfýr Maliyet Hesaplananlar)
  begin
    if BOMData.Maliyet.YerelMaliyet1 > 0 then
      Exit;
  end;

  FTable.Append;
  FTable.SiraNo := BOMData.ID;
  FTable.ReceteNo := BOMData.ReceteNo;
  FTable.RevizyonNo := BOMData.RevizyonNo;
  FTable.ReceteSiraNo := BOMData.ReceteSiraNo;

  FTable.Tip := Integer(GetMamulAgacTip(BOMData.MalTip));

  FTable.MalKod := BOMData.MalKod;

  if GosterimTip = 1 then // Diðer Gösterim Tiplerinde Lookup kullanýlýyor.
  begin
    FTable.MalAd := FTableStokKart.MalAd;
    if FStokKartFieldList.Count > 0 then
    begin
      for I := 0 to FStokKartFieldList.Count - 1 do
        if FStokKartFieldList[I] <> 'MALAD' then
          FTable.FieldByName('STKKRT_' + FStokKartFieldList[I]).Value := FTableStokKart.FieldByName(FStokKartFieldList[I]).Value;
    end;
  end;
  FTable.VersiyonNo := BOMData.VersiyonNo;
  FTable.SurumNo := BOMData.SurumNo;
  FTable.DepoKod := BOMData.DepoKod;
  FTable.SeriNo := BOMData.SeriNo;
  FTable.SeriNo2 := BOMData.SeriNo2;

  FTable.Miktar := BOMData.Miktar;
  FTable.Birim := BOMData.Birim;

  FTable.PozNo := BOMData.PozNo;
  FTable.OperasyonNo := BOMData.OperasyonNo;
  FTable.SeviyeKod := BOMData.SeviyeKod;

  FTable.BirimMaliyet1 := BOMData.Maliyet.BirimMaliyet1;
  FTable.BirimMaliyet1DovizCins := BOMData.Maliyet.BirimMaliyet1DovizCins;
  FTable.BirimMaliyet1DovizKur := BOMData.Maliyet.BirimMaliyet1DovizKur;
  FTable.BirimMaliyet2 := BOMData.Maliyet.BirimMaliyet2;
  FTable.BirimMaliyet3 := BOMData.Maliyet.BirimMaliyet3;

  FTable.FiyatMaliyet := BOMData.Maliyet.Maliyet;
  FTable.FiyatMaliyetGrup1 := BOMData.Maliyet.MaliyetGrup1;
  FTable.FiyatMaliyetGrup2 := BOMData.Maliyet.MaliyetGrup2;
  FTable.FiyatMaliyetGrup3 := BOMData.Maliyet.MaliyetGrup3;
  FTable.FiyatMaliyetGrup4 := BOMData.Maliyet.MaliyetGrup4;
  FTable.FiyatMaliyetGrupDiger := BOMData.Maliyet.MaliyetGrupDiger;

  FTable.BirimMaliyet := BOMData.Maliyet.YerelBirimMaliyet;

  FTable.Maliyet1 := BOMData.Maliyet.YerelMaliyet1;
  FTable.Maliyet2 := BOMData.Maliyet.YerelMaliyet2;
  FTable.Maliyet3 := BOMData.Maliyet.YerelMaliyet3;
  FTable.Maliyet := BOMData.Maliyet.YerelMaliyet;
  FTable.MaliyetGrup1 := BOMData.Maliyet.YerelMaliyetGrup1;
  FTable.MaliyetGrup2 := BOMData.Maliyet.YerelMaliyetGrup2;
  FTable.MaliyetGrup3 := BOMData.Maliyet.YerelMaliyetGrup3;
  FTable.MaliyetGrup4 := BOMData.Maliyet.YerelMaliyetGrup4;
  FTable.MaliyetGrupDiger := BOMData.Maliyet.YerelMaliyetGrupDiger;

  if Assigned(BOMData.Parent) then
  begin
    FTable.AnaSiraNo := BOMData.Parent.ID;
    FTable.MamulKod := BOMData.Parent.MalKod;
  end else
  begin
    FTable.AnaSiraNo := 0;
    FTable.MamulKod := BOMData.MalKod;
  end;

  for I := 0 to MatchFields.FieldSrcList.Count - 1 do
    if Assigned(MatchFields.FieldDesList.Objects[I]) and Assigned(BOMData.MatchValues) then
      TField(MatchFields.FieldDesList.Objects[I]).Value := BOMData.MatchValues[I];

  FTable.Post;
end;

procedure TAppDataControllerMamulAgac.DoOnReturnRoute(ROMData: TAppROMData);
begin
  if not FTable.Active then
    FTable.Open;

  if GosterimTip in [1,2] then // Maliyet Listesi
    Exit;

  FTable.Append;
  FTable.SiraNo := ROMData.ID;
  FTable.ReceteNo := ROMData.ReceteNo;
  FTable.RevizyonNo := ROMData.RevizyonNo;
  FTable.OperasyonNo := ROMData.OperasyonNo;

  FTable.Tip := Integer(GetMamulAgacTip(ROMData.RotaTip));
  if ROMData.RotaTip = rotWorkCenter then
    FTable.MalKod := ROMData.IsMerkezKod
  else if ROMData.RotaTip = rotMachineCenter then
    FTable.MalKod := ROMData.KaynakKod
  else
    FTable.MalKod := IntToStr(ROMData.SiraNo);
  FTable.MalAd := ROMData.Aciklama;
  FTable.Miktar := ROMData.ToplamSure;

  FTable.SeviyeKod := ROMData.SeviyeKod;
  
  FTable.AnaSiraNo := ROMData.ParentID;
  FTable.Post;
end;

procedure TAppDataControllerMamulAgac.ExpandList(StokKartFilterText: string; Tarih: TDateTime);
var
  vStatus: TAppDocStatusWindow;

  procedure PrepStatus;
  begin
    vStatus.MainForm := nil;
    vStatus.Items.Clear;
    with vStatus.Items.Add do
    begin
      Name := 'MALKOD';
      Caption := 'Mal Kodu';
    end;
    with vStatus.Items.Add do
    begin
      Name := 'MALAD';
      Caption := 'Mal Adý';
    end;
    with vStatus.Items.Add do
    begin
      Name := 'VERSIYONNO';
      Caption := 'Versiyon';
    end;
  end;

var
  vFieldVersiyon: TField;
  I: Integer;
begin
  vStatus := TAppDocStatusWindow.Create;
  if not Assigned(FTableStokKart) then
  begin
    FTableStokKart := TTableStokKart.Create(nil);
    FTableStokKart.Connection := FOwner.DataApp.Connection;
    FTableStokVersiyon := TTableStokVersiyon.Create(nil);
    FTableStokVersiyon.Connection := FOwner.DataApp.Connection;
    FStokKartFieldList := TStringList.Create;
  end;
  try
    if GosterimTip = 1 then
    begin
      // Maliyet Listesi Hýzlý çalýþmasý için lookup kullanmýyor.
      FOwner.DataApp.Params.Table.SetRange([FTable.Name, 'STKKRT', 'FIELDS'], [FTable.Name, 'STKKRT', 'FIELDS']);
      FOwner.DataApp.Params.Table.First;
      FStokKartFieldList.Clear;
      while not FOwner.DataApp.Params.Table.Eof do
      begin
        FStokKartFieldList.Add(FOwner.DataApp.Params.Table.AValue);
        FOwner.DataApp.Params.Table.Next;
      end;
    end;

    PrepStatus;

    FTableStokKart.Close;
    FTableStokKart.TableItems.TableNames := VarArrayOf(['STKKRT','STKVER']);
    with FTableStokKart.TableItems[0] do
    begin
      with Fields do
      begin
        Clear;
        Add('MALKOD');
        Add('MALAD');
        Add('BIRIM');
        if FStokKartFieldList.Count > 0 then
        begin
          for I := 0 to FStokKartFieldList.Count - 1 do
          begin
            if (FStokKartFieldList[I] <> 'MALKOD') and (FStokKartFieldList[I] <> 'MALAD') and (FStokKartFieldList[I] <> 'BIRIM') then
              Add(FStokKartFieldList[I]);
          end;
        end;
      end;
      with Where do
      begin
        Clear;
        if StokKartFilterText <> '' then
          AddText(StokKartFilterText);
      end;
    end;
    with FTableStokKart.TableItems[1] do
    begin
      with Fields do
      begin
        Clear;
        Add('VERSIYONNO');
      end;
      with Join do
      begin
        Clear;
        Add('MALKOD', 'MALKOD');
      end;
    end;
    if FTableStokKart.FieldCount = 0 then
    begin
      FTableStokKart.DoInitializeRecord;
      FTableStokKart.Close;
    end;
    FTableStokKart.Open;
    vFieldVersiyon := FTableStokKart.FindField('STKVER_VERSIYONNO');

    if not AppConfirm(format('%d adet mal patlatýlacak. Devam et?', [FTableStokKart.RecordCount])) then
      raise Exception.Create('Ýþlem iptal edildi.');

    if Params.TopluIslem then
    begin
      vStatus.Start(0);
      vStatus.Add('Ürün aðacý açýlýyor, lütfen bekleyiniz...');
      MamulKart.OpenAll;
      vStatus.Reset(FTableStokKart.RecordCount);
    end else
      vStatus.Start(FTableStokKart.RecordCount);

    Start;
    try
      FTableStokKart.First;
      while not FTableStokKart.Eof do
      begin
        vStatus['MALKOD'] := FTableStokKart.MalKod;
        vStatus['MALAD'] := FTableStokKart.MalAd;
        vStatus['VERSIYONNO'] := vFieldVersiyon.AsString;
        vStatus.Add('Ürün aðacý patlatýlýyor...');
        Expand(FTableStokKart.MalKod, vFieldVersiyon.AsString, '', 0, Tarih, 1, FTableStokKart.Birim, '', '');
        FTableStokKart.Next;
      end;
      FTableStokKart.Close;
    finally
      vStatus.Finish;
      Finish;
    end;
  finally
    FreeAndNil(vStatus);
  end;
end;

procedure TAppDataControllerMamulAgac.Start;
begin
  inherited;
  if not FTable.Active then
    FTable.Open;
  FTable.EmptyTable;
  FTable.DisableControls;
end;

{ TAppDataChildCustomMamulAgac }

procedure TAppDataChildCustomMamulAgac.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildCustomMamulAgac.CreateTable;
begin
  Table := TTableUretimHareket.Create(nil);
  Table.Name := 'TableMamulTree';
  Table.ProviderName := 'pr' + Table.Name;
end;

function TAppDataChildCustomMamulAgac.GetTable: TTableUretimHareket;
begin
  Result := TTableUretimHareket(inherited GetTable);
end;

procedure TAppDataChildCustomMamulAgac.SetDefaultValues;
begin
  inherited;

end;

procedure TAppDataChildCustomMamulAgac.SetTable(Value: TTableUretimHareket);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomMamulAgac.SetValidates;
begin
  inherited;

end;

{ TAppDataChildMamulAgac }

constructor TAppDataChildMamulAgac.Create(AOwner: TAppDataApp);
begin
  inherited;
  FdcMamulAgac := TAppDataControllerMamulAgac.Create(Self);
end;

procedure TAppDataChildMamulAgac.CreateTable;
begin
  inherited;
  Table.IndexFieldNames := 'SIRANO';

  Table.TableItems.TableNames := VarArrayOf(['URTHAR', 'STKKRT']);
  Table.TableItems.TableCaptions := VarArrayOf(['Mamül Aðacý', 'Stok Kart']);
  Table.TableItems.TableItemCaptions := VarArrayOf(['Mamül Aðacý', '!']);

  with Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
      AddExpression('CAST(0 AS NUMERIC(25,6))', '_FIYATMALIYET');
      AddExpression('CAST(0 AS NUMERIC(25,6))', '_FIYATMALIYETGRUP1');
      AddExpression('CAST(0 AS NUMERIC(25,6))', '_FIYATMALIYETGRUP2');
      AddExpression('CAST(0 AS NUMERIC(25,6))', '_FIYATMALIYETGRUP3');
      AddExpression('CAST(0 AS NUMERIC(25,6))', '_FIYATMALIYETGRUP4');
      AddExpression('CAST(0 AS NUMERIC(25,6))', '_FIYATMALIYETGRUPDIGER');
      AddExpression('CAST(0 AS NUMERIC(25,6))', '_MALIYETGRUP1');
      AddExpression('CAST(0 AS NUMERIC(25,6))', '_MALIYETGRUP2');
      AddExpression('CAST(0 AS NUMERIC(25,6))', '_MALIYETGRUP3');
      AddExpression('CAST(0 AS NUMERIC(25,6))', '_MALIYETGRUP4');
      AddExpression('CAST(0 AS NUMERIC(25,6))', '_MALIYETGRUPDIGER');
      AddExpression('CAST(0 AS NUMERIC(25,6))', '_HTUTAR1');
      AddExpression('CAST(0 AS NUMERIC(25,6))', '_HTUTAR2');
      AddExpression('CAST(0 AS NUMERIC(25,6))', '_HTUTAR3');
      AddExpression('CAST(0 AS NUMERIC(25,6))', '_HTUTAR4');
      AddExpression('CAST(0 AS NUMERIC(25,6))', '_HTUTAR5');
    end;
    with Where do
    begin
      Clear;
      AddText('0 = 1');
    end;
  end;
  with Table.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('MALAD');
    end;
    with Join do
    begin
      Clear;
      Add('MALKOD', 'MALKOD');
    end;
  end;
  with Table.LookupTableItems.Add(Table.TableItems[1]) do // Maliyet Listesinde Disable Ediyorum, Diðer Görünümlerde kullanýlýyor.
    EmptyWhenNoRecord := False;
end;

destructor TAppDataChildMamulAgac.Destroy;
begin
  FreeAndNil(FdcMamulAgac);
  inherited;
end;

end.
