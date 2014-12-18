unit CPMApp_DataChildMamulRota;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_TableItems, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomMamulRota = class;
  TAppDataChildMamulRota = class;

  TAppDataChildCustomMamulRota = class(TAppDataChild)
  private
  protected
    function GetTable: TTableMamulRota;
    procedure SetTable(Value: TTableMamulRota);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableMamulRota read GetTable write SetTable;
  end;

  TAppRuleMamulRotaCustom = class(TAppTableRule)
  private
    InUse: Boolean;
    FTableMamulRota: TTableMamulRota;
    FTableFindIsMerkezKart: TTableIsMerkezKart;
    FTableFindIsMerkezKaynak: TTableUretimKaynakKart;
    FTableFindKaynakMamulKurulum: TTableUretimKaynakMamulKurulum;
    FDataChildMamulRota: TAppDataChildMamulRota;
    function FindIsMerkez(pIsMerkezKod: string): Boolean;
    function FindUretimKaynak(pIsMerkezKod: string): Boolean;
    function FindKaynakMamulKurulum(pMamulKod, pIsMerkezKod: string): Boolean;
    procedure UpdateMamulKaynak;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
  public
    constructor Create(AOwner: TTableMamulRota); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildMamulRota); reintroduce; overload;
    destructor Destroy; override;
  end;

  TAppDataChildMamulRota = class(TAppDataChildCustomMamulRota)
  private
    FRuleCustom: TAppRuleMamulRotaCustom;
  protected
    procedure CreateTable; override;
    procedure CreateRules; override;
  published
    property RuleCustom: TAppRuleMamulRotaCustom read FRuleCustom;
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_DAPCustomMamulKart, CPMApp_Dialogs;

{ TAppDataChildCustomMamulRota }

constructor TAppDataChildCustomMamulRota.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomMamulRota.CreateTable;
begin
  Table := TTableMamulRota.Create(DataApp.DataObject);
  Table.Name := 'TableMamulRota';
  Table.TableItems.TableNames := 'MAMROT';
end;

destructor TAppDataChildCustomMamulRota.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomMamulRota.GetTable: TTableMamulRota;
begin
  Result := TTableMamulRota(inherited GetTable);
end;

procedure TAppDataChildCustomMamulRota.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
  end;
end;

procedure TAppDataChildCustomMamulRota.SetTable(Value: TTableMamulRota);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomMamulRota.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('OPERASYONNO');
    AddNonBlank('ISMERKEZKOD');
  end;
end;

{ TAppRuleMamulRotaCustom }

constructor TAppRuleMamulRotaCustom.Create(AOwner: TTableMamulRota);
begin
  inherited Create;
  FTableMamulRota := AOwner;
  FTableMamulRota.DataEvents.AddRule(Self);

  FTableFindIsMerkezKart := TTableIsMerkezKart.Create(nil);
  FTableFindIsMerkezKart.Name := 'TableFindIsMerkezKartForMamulRota';
  FTableFindIsMerkezKart.ProviderName := 'pr' + FTableFindIsMerkezKart.Name;
  FTableFindIsMerkezKart.Connection := FTableMamulRota.Connection;

  FTableFindIsMerkezKaynak := TTableUretimKaynakKart.Create(nil);
  FTableFindIsMerkezKaynak.Name := 'TableFindIsMerkezKaynakForMamulRota';
  FTableFindIsMerkezKaynak.ProviderName := 'pr' + FTableFindIsMerkezKaynak.Name;
  FTableFindIsMerkezKaynak.Connection := FTableMamulRota.Connection;

  FTableFindKaynakMamulKurulum := TTableUretimKaynakMamulKurulum.Create(nil);
  FTableFindKaynakMamulKurulum.Name := 'TableFindKaynakMamulKurulumForMamulRota';
  FTableFindKaynakMamulKurulum.ProviderName := 'pr' + FTableFindKaynakMamulKurulum.Name;
  FTableFindKaynakMamulKurulum.Connection := FTableMamulRota.Connection;
end;

constructor TAppRuleMamulRotaCustom.Create(AOwner: TAppDataChildMamulRota);
begin
  Create(AOwner.Table);
  FDataChildMamulRota := AOwner;
end;

destructor TAppRuleMamulRotaCustom.Destroy;
begin
  FreeAndNil(FTableFindIsMerkezKart);
  FreeAndNil(FTableFindIsMerkezKaynak);
  FreeAndNil(FTableFindKaynakMamulKurulum);
  inherited;
end;

procedure TAppRuleMamulRotaCustom.DoOnFieldChanged(Table: TAppCustomTable;
  Field: TField);
var
  DataApp: TAppDAPCustomMamulKart;
begin
  inherited;
  if InUse then
    Exit;
  InUse := True;
  try
    DataApp := TAppDAPCustomMamulKart(FDataChildMamulRota.DataApp);
    if Field = FTableMamulRota.fIsMerkezKod then
    begin
      if Field.AsString <> '' then
      begin
        if FindIsMerkez(FTableMamulRota.IsMerkezKod) then
        begin
          FTableMamulRota.Aciklama := FTableFindIsMerkezKart.IsMerkezAd;
          //FTableMamulRota.KurulumSure := TableFindIsMerkezKart.KurulumSure;
          //FTableMamulRota.CalismaSure := TableFindIsMerkezKart.CalismaSure;
          UpdateMamulKaynak;
        end
        else
        begin
          AppShowMessage('Ýþ merkezi bulunamadý');
          Field.AsString := '';
        end;
      end;
    end // if FTableMamulRota.fIsMerkezKod then
    else if Field = FTableMamulRota.fOperasyonNo then
    begin
      if not (Table.UpdateStatus = usInserted) then // Önceden kaydedilmiþ rota çaðýrýlýp deðiþtirilmek isteniyor ise.
        if not DataApp.MamulRotaKaynak.Table.IsEmpty then
        begin
          AppShowMessage('Rota kaynaklarý tanýmlý. Operasyon no alanýný deðiþtiremezsiniz. Satýrý silebilirsiniz.');
          Field.Value := Field.OldValue;
        end;
    end;
  finally
    InUse := False;
  end;
end;

procedure TAppRuleMamulRotaCustom.DoOnNewRecord(Table: TAppCustomTable);
begin
  inherited;

end;

function TAppRuleMamulRotaCustom.FindIsMerkez(pIsMerkezKod: string): Boolean;
begin
  FTableFindIsMerkezKart.Close;
  FTableFindIsMerkezKart.TableItems.TableNames := 'URTISM';
  with FTableFindIsMerkezKart.TableItems[0].Fields do
  begin
    Clear;
    Add('*');
  end;
  with FTableFindIsMerkezKart.TableItems[0].Where do
  begin
    Clear;
    Add('ISMERKEZKOD', wcEqual, pIsMerkezKod).DataType := ftString;
  end;
  FTableFindIsMerkezKart.Open;
  Result := FTableFindIsMerkezKart.RecordCount > 0;
end;

function TAppRuleMamulRotaCustom.FindUretimKaynak(pIsMerkezKod: string): Boolean;
begin
  FTableFindIsMerkezKaynak.Close;
  FTableFindIsMerkezKaynak.TableItems.TableNames := 'URTISK';
  with FTableFindIsMerkezKaynak.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('KAYNAKKOD');
    end;
    with Where do
    begin
      Clear;
      Add('ISMERKEZKOD', wcEqual, pIsMerkezKod).DataType := ftString;
    end;
  end;

  FTableFindIsMerkezKaynak.Open;
  Result := FTableFindIsMerkezKaynak.RecordCount > 0;
end;

function TAppRuleMamulRotaCustom.FindKaynakMamulKurulum(pMamulKod, pIsMerkezKod: string): Boolean;
begin
  FTableFindKaynakMamulKurulum.Close;
  FTableFindKaynakMamulKurulum.TableItems.TableNames := 'URTKMK,URTISK';
  with FTableFindKaynakMamulKurulum.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('KAYNAKKOD');
    end;
    with Where do
    begin
      Clear;
      Add('MAMULKOD', wcEqual, pMamulKod).DataType := ftString;
    end;
  end;
  with FTableFindKaynakMamulKurulum.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
    end;
    with Join do
    begin
      Clear;
      Add('KAYNAKKOD', 'KAYNAKKOD');
    end;
    with Where do
    begin
      Clear;
      Add('ISMERKEZKOD', wcEqual, pIsMerkezKod).DataType := ftString;
    end;
  end;

  FTableFindKaynakMamulKurulum.Open;
  Result := FTableFindKaynakMamulKurulum.RecordCount > 0;
end;

procedure TAppRuleMamulRotaCustom.UpdateMamulKaynak;
var
  TableMamulRotaKaynak: TTableMamulRotaKaynak;
begin
  if FDataChildMamulRota.DataApp = nil then
    Exit;
  TableMamulRotaKaynak := TAppDAPCustomMamulKart(FDataChildMamulRota.DataApp).MamulRotaKaynak.Table;
  if not TableMamulRotaKaynak.IsEmpty then
  begin
    if not AppConfirm('Rota kaynaðýný güncelle?') then
      Exit;
  end;
  TableMamulRotaKaynak.DisableControls;
  try
    if not TableMamulRotaKaynak.IsEmpty then
    begin
      TableMamulRotaKaynak.First;
      while not TableMamulRotaKaynak.Eof do
        TableMamulRotaKaynak.Delete;
    end;

    if TAppDAPCustomMamulKart(FDataChildMamulRota.DataApp).MamulParams.AddKaynakFromKaynakKurulum then // Kaynak Mamül Kurulum tablosundan ekle
    begin
      if FindKaynakMamulKurulum(FTableMamulRota.MamulKod, FTableMamulRota.IsMerkezKod) then
      begin
        FTableFindKaynakMamulKurulum.First;
        while not FTableFindKaynakMamulKurulum.Eof do
        begin
          TableMamulRotaKaynak.Insert;
          TableMamulRotaKaynak.KaynakKod := FTableFindKaynakMamulKurulum.KaynakKod;
          TableMamulRotaKaynak.Post;
          FTableFindKaynakMamulKurulum.Next;
        end;
      end;
    end
    else
    begin
      if FindUretimKaynak(FTableMamulRota.IsMerkezKod) then
      begin
        FTableFindIsMerkezKaynak.First;
        while not FTableFindIsMerkezKaynak.Eof do
        begin
          TableMamulRotaKaynak.Insert;
          TableMamulRotaKaynak.KaynakKod := FTableFindIsMerkezKaynak.KaynakKod;
          TableMamulRotaKaynak.Post;
          FTableFindIsMerkezKaynak.Next;
        end;
      end;
    end;
  finally
    TableMamulRotaKaynak.Enablecontrols;
  end;
end;

{ TAppDataChildMamulRota }

procedure TAppDataChildMamulRota.CreateRules;
begin
  inherited;
  FRuleCustom := TAppRuleMamulRotaCustom.Create(Self);
  Rules.AddRule(FRuleCustom);
end;


procedure TAppDataChildMamulRota.CreateTable;
begin
  inherited;
  Table.TableItems.TableNames := VarArrayOf(['MAMROT', 'URTISM']);
  Table.TableItems.TableCaptions := VarArrayOf(['Mamül Rotasý', 'Ýþ Merkezi']);
  Table.TableItems.TableItemCaptions := VarArrayOf(['Mamül Rotasý', '!']);
  with Table.TableItems[0] do
  begin
    with Fields do
    begin
      Clear;
      Add('*');
    end;
  end;
  with Table.TableItems[1] do
  begin
    with Fields do
    begin
      Clear;
      Add('ISMERKEZAD');
    end;
    with Join do
    begin
      Clear;
      Add('ISMERKEZKOD', 'ISMERKEZKOD');
    end;
  end;
  Table.LookupTableItems.Add(Table.TableItems[1]);
end;

end.
