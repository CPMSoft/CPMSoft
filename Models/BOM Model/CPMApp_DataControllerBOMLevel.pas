unit CPMApp_DataControllerBOMLevel;

interface

uses Windows, Classes, SysUtils, Dialogs, Variants,
  CPMApp_DB, CPMApp_DataObject, CPMApp_TableItems,
  CPMApp_DataControllerBOMObject,
  CPMApp_DocStatusWindow,
  CPMApp_TableBOMSystem, CPMApp_TableMRPSystem, CPMApp_TableStokSystem;

type

  TAppDataControllerBOMLevel = class;

  TAppSeviyeData = class
    MalKod: String;
    SeviyeKod: Smallint;
  end;

  TAppSeviyeDataList = class
  private
    FList: TList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure Add(MalKod: String; SeviyeKod: Smallint);
  published
    property List: TList read FList;
  end;

  TAppDataControllerBOMLevel = class
  private
    // Childs
    FStatus: TAppDocStatusWindow;
    FTableMamulYanUrun: TTableMamulYanUrun;
    FTableMRPParametre: TTableMRPParametre;
    FTableMamulKart: TTableMamulKart;
    FTableStokKart: TTableStokKart;
    FTableStokKartAlternatif: TTableStokKartAlternatif;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Execute;
  published
    property TableMRPParametre: TTableMRPParametre read FTableMRPParametre;
    property TableStokKart: TTableStokKart read FTableStokKart;
    property TableMamulKart: TTableMamulKart read FTableMamulKart;
    property TableMamulYanUrun: TTableMamulYanUrun read FTableMamulYanUrun;
  end;

implementation

uses CPMApp_Security;

{ TAppSeviyeDataList }

procedure TAppSeviyeDataList.Add(MalKod: String; SeviyeKod: Smallint);
var
  AData: TAppSeviyeData;
begin
  AData := TAppSeviyeData.Create;

  AData.MalKod := MalKod;
  AData.SeviyeKod := SeviyeKod;

  FList.Add(AData);
end;

procedure TAppSeviyeDataList.Clear;
var
  I: Integer;
begin
  for I := FList.Count - 1 downto 0 do
    TAppSeviyeData(FList[I]).Free;
  FList.Clear;
end;

constructor TAppSeviyeDataList.Create;
begin
  inherited Create;
  FList := TList.Create;
end;

destructor TAppSeviyeDataList.Destroy;
begin
  Clear;
  FreeAndNil(FList);
  inherited;
end;

{ TAppDataControllerBOMLevel }

constructor TAppDataControllerBOMLevel.Create;
  procedure CreateTableMRPParametre;
  begin
    FTableMRPParametre := TTableMRPParametre.Create(nil);
    FTableMRPParametre.Connection := AppSecurity.ConnectionApp;
    FTableMRPParametre.TableItems.TableNames := 'MRPPRM';
    with FTableMRPParametre.TableItems[0].Where do
    begin
      Clear;
      Add('SIRKETNO', wcEqual, AppSecurity.DBCompanyNo);
    end;
  end;
  procedure CreateTableStokKart;
  begin
    FTableStokKart := TTableStokKart.Create(nil);
    FTableStokKart.Connection := AppSecurity.ConnectionApp;
    FTableStokKart.TableItems.TableNames := 'STKKRT';
    with FTableStokKart.TableItems[0] do
    begin
      with Fields do
      begin
        Clear;
        Add('ID');
        Add('MALKOD');
        Add('ALTSEVIYEKOD');
      end;
    end;
    FTableStokKart.IndexFieldNames := 'MALKOD';
  end;
  procedure CreateTableStokKartAlternatif;
  begin
    FTableStokKartAlternatif := TTableStokKartAlternatif.Create(nil);
    FTableStokKartAlternatif.Connection := AppSecurity.ConnectionApp;
    FTableStokKartAlternatif.TableItems.TableNames := 'STKALT';
    with FTableStokKartAlternatif.TableItems[0] do
    begin
      with Fields do
      begin
        Clear;
        Add('MALKOD');
        Add('ALTERNATIFMALKOD');
      end;
    end;
    FTableStokKartAlternatif.IndexFieldNames := 'MALKOD';
  end;
  procedure CreateTableMamulKart;
  begin
    FTableMamulKart := TTableMamulKart.Create(nil);
    FTableMamulKart.Connection := AppSecurity.ConnectionApp;
    FTableMamulKart.TableItems.TableNames := VarArrayOf(['MAMKRT','MAMBAS']);
    with FTableMamulKart.TableItems[0] do
    begin
      with Fields do
      begin
        Clear;
        Add('HAMMADDEKOD');
      end;
    end;
    with FTableMamulKart.TableItems[1] do
    begin
      with Fields do
      begin
        Clear;
        Add('MAMULKOD');
      end;
      with Join do
      begin
        Clear;
        Add('SIRKETNO', 'SIRKETNO');
        Add('RECETENO', 'RECETENO');
      end;
      // Sürüm No alaný ileride MAMKRT den kaldýrýlacaðý için direk plana göre MAMBAS'a kriter verdim.
      with Where do
      begin
        Clear;
        Add('SURUMNO', wcEqual, 0);
      end;
    end;
    FTableMamulKart.IndexFieldNames := 'HAMMADDEKOD';
  end;
  procedure CreateTableMamulYanUrun;
  begin
    FTableMamulYanUrun := TTableMamulYanUrun.Create(nil);
    FTableMamulYanUrun.Connection := AppSecurity.ConnectionApp;
    FTableMamulYanUrun.TableItems.TableNames := VarArrayOf(['MAMYAN','MAMBAS']);
    with FTableMamulYanUrun.TableItems[0] do
    begin
      with Fields do
      begin
        Clear;
        Add('MALKOD');
      end;
    end;
    with FTableMamulYanUrun.TableItems[1] do
    begin
      with Fields do
      begin
        Clear;
        Add('MAMULKOD');
      end;
      with Join do
      begin
        Clear;
        Add('SIRKETNO', 'SIRKETNO');
        Add('RECETENO', 'RECETENO');
      end;
      with Where do
      begin
        Clear;
        Add('SURUMNO', wcEqual, 0);
      end;
    end;
    FTableMamulYanUrun.IndexFieldNames := 'MALKOD';
  end;
begin
  // Childs
  FStatus := TAppDocStatusWindow.Create;

  CreateTableMRPParametre;
  CreateTableStokKart;
  CreateTableStokKartAlternatif;
  CreateTableMamulKart;
  CreateTableMamulYanUrun;
end;

destructor TAppDataControllerBOMLevel.Destroy;
begin
  // Childs
  FreeAndNil(FStatus);
  FreeAndNil(FTableMRPParametre);
  FreeAndNil(FTableStokKart);
  FreeAndNil(FTableStokKartAlternatif);
  FreeAndNil(FTableMamulKart);
  FreeAndNil(FTableMamulYanUrun);

  inherited;
end;

procedure TAppDataControllerBOMLevel.Execute;

  procedure PrepStatus;
  begin
    FStatus.MainForm := nil;
    FStatus.Items.Clear;
    with FStatus.Items.Add do
    begin
      Name := 'MALKOD';
      Caption := 'Mal Kodu';
    end;
  end;

  procedure OpenMRPParametre;
  begin
    FTableMRPParametre.Close;
    if FTableMRPParametre.FieldCount = 0 then
    begin
      FTableMRPParametre.DoInitializeRecord;
      FTableMRPParametre.Close;
    end;
    FTableMRPParametre.Open;
  end;
  procedure OpenStokKart;
  begin
    FTableStokKart.Close;
    if FTableStokKart.FieldCount = 0 then
    begin
      FTableStokKart.DoInitializeRecord;
      FTableStokKart.Close;
    end;
    FTableStokKart.Open;
  end;
  procedure OpenStokKartAlternatif;
  begin
    FTableStokKartAlternatif.Close;
    if FTableStokKartAlternatif.FieldCount = 0 then
    begin
      FTableStokKartAlternatif.DoInitializeRecord;
      FTableStokKartAlternatif.Close;
    end;
    FTableStokKartAlternatif.Open;
  end;
  procedure OpenMamulKart;
  begin
    FTableMamulKart.Close;
    if FTableMamulKart.FieldCount = 0 then
    begin
      FTableMamulKart.DoInitializeRecord;
      FTableMamulKart.Close;
    end;
    FTableMamulKart.Open;
  end;
  procedure OpenMamulYanUrun;
  begin
    FTableMamulYanUrun.Close;
    if FTableMamulYanUrun.FieldCount = 0 then
    begin
      FTableMamulYanUrun.DoInitializeRecord;
      FTableMamulYanUrun.Close;
    end;
    FTableMamulYanUrun.Open;
  end;

  function CalcChildSeviyeKod(AMalKod: String; ASeviyeKod: Smallint): Smallint;
  var
    ChildMamulList: TAppSeviyeDataList;
    MamulData: TAppSeviyeData;
    I: Integer;
    AltSevkiyeKod: Smallint;
  begin
    Result := ASeviyeKod;

    if ASeviyeKod > 30 then
    begin
      ShowMessage(format('Ýçiçe döngü limiti aþýldý! %s nolu malýn ve iliþkili olduðu diðer mallarýn ürün aðaçlarýný kontrol ediniz!', [AMalKod]));
      Exit;
    end;

    ChildMamulList := TAppSeviyeDataList.Create;
    try
      // Hammadde olarak baðlandýðý yerler
      FTableMamulKart.SetRange([AMalKod], [AMalKod]);
      FTableMamulKart.First;
      while not FTableMamulKart.Eof do
      begin
        if FTableMamulKart.MamulMalKod <> AMalKod then // Ayný malýn farklý versiyonu baðlanmýþ olabilir
          ChildMamulList.Add(FTableMamulKart.MamulMalKod, ASeviyeKod);
        FTableMamulKart.Next;
      end;

      // Yan ürün olarak baðlandýðý yerler
      FTableMamulYanUrun.SetRange([AMalKod], [AMalKod]);
      FTableMamulYanUrun.First;
      while not FTableMamulYanUrun.Eof do
      begin
        if FTableMamulYanUrun.MamulMalKod <> AMalKod then // Ayný malýn farklý versiyonu baðlanmýþ olabilir
          ChildMamulList.Add(FTableMamulYanUrun.MamulMalKod, ASeviyeKod);
        FTableMamulYanUrun.Next;
      end;

      // Alternatifler MRP de daha öncelikli
      // MRP Önce alternatiflerin stoðuna bakýyor. sonra kendi stoðuna bakýyor. 
      FTableStokKartAlternatif.SetRange([AMalKod], [AMalKod]);
      FTableStokKartAlternatif.First;
      while not FTableStokKartAlternatif.Eof do
      begin
        if FTableStokKartAlternatif.AlternatifMalKod <> AMalKod then // Ayný malýn farklý versiyonu baðlanmýþ olabilir
          ChildMamulList.Add(FTableStokKartAlternatif.AlternatifMalKod, ASeviyeKod);
        FTableStokKartAlternatif.Next;
      end;

      // Burda Recursion Yapýyorum.
      for I := 0 to ChildMamulList.FList.Count - 1 do
      begin
        MamulData := TAppSeviyeData(ChildMamulList.FList[I]);
        AltSevkiyeKod := CalcChildSeviyeKod(MamulData.MalKod, MamulData.SeviyeKod + 1);
        if Result < AltSevkiyeKod then
          Result := AltSevkiyeKod;
      end;
    finally
      FreeAndNil(ChildMamulList);
    end;
  end;

var
  AltSeviyeKod: Smallint;
  RecordCount, Parti, Count: Integer;
begin
  PrepStatus;
  FStatus.Start(0);

  OpenMRPParametre;
  FStatus.Add('Stok kart tablosu açýlýyor...');
  OpenStokKart;
  OpenStokKartAlternatif;
  FStatus.Add('Mamül aðacý açýlýyor...');
  OpenMamulKart;
  OpenMamulYanUrun;

  RecordCount := FTableStokKart.RecordCount;
  Parti := 100;
  Count := 0;
  if Trunc(RecordCount/Parti) <> RecordCount/Parti then
    RecordCount := (Trunc(RecordCount/Parti) + 1) * Parti;
  RecordCount := Trunc(RecordCount / Parti);

  FStatus.Reset(RecordCount);
  try
    FTableStokKart.First;
    while not FTableStokKart.Eof do
    begin
      if Count = Parti then
      begin
        FStatus['MALKOD'] := FTableStokKart.MalKod;
        FStatus.Add('Alt seviye kodu hesaplanýyor...');
        Count := 0;
      end else
        Inc(Count);

      AltSeviyeKod := 0;
      try
        AltSeviyeKod := CalcChildSeviyeKod(FTableStokKart.MalKod, 0);
      except on Exception do
        ShowMessage(format('%s nolu malýn seviye kodu hesaplanamadý! Ürün aðacýný kontrol ediniz!', [FTableStokKart.MalKod]));
      end;

      if FTableStokKart.AltSeviyeKod <> AltSeviyeKod then
      begin
        FTableStokKart.Edit;
        FTableStokKart.AltSeviyeKod := AltSeviyeKod;
        FTableStokKart.Post;
      end;

      FTableStokKart.Next;
    end;

    FStatus['MALKOD'] := '';
    FStatus.Add('Alt seviye kodu kaydediliyor...');
    FTableStokKart.Save;

    if FTableMRPParametre.IsEmpty then
    begin
      FTableMRPParametre.Insert;
      FTableMRPParametre.SirketNo := AppSecurity.DBCompanyNo;
    end else
    begin
      FTableMRPParametre.Edit;
    end;
    FTableMRPParametre.AltSeviyeKodHesapDurum := 1; // Güncellendi
    FTableMRPParametre.Post;
    FTableMRPParametre.Save;
  finally
    FStatus.Finish;
  end;
end;

end.
