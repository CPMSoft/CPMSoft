unit CPMApp_DataChildUretimTerminalKaynak;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableUretimTempSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimTerminalKaynak = class;
  TAppDataChildUretimTerminalKaynak = class;

  TAppRuleSelf = class(TAppTableRule)
  private
    FTableSelf: TTableUretimTerminalKaynak;
    FChildSelf: TAppDataChildUretimTerminalKaynak;
    procedure AddIslemTanim;
  protected
    procedure DoOnNewRecord(Table: TAppCustomTable); override;
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
  public
    constructor Create(AOwner: TTableUretimTerminalKaynak); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimTerminalKaynak); reintroduce; overload;
  end;

  TAppDataChildCustomUretimTerminalKaynak = class(TAppDataChild)
  protected
    function GetTable: TTableUretimTerminalKaynak;
    procedure SetTable(Value: TTableUretimTerminalKaynak);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimTerminalKaynak read GetTable write SetTable;
  end;

  TAppDataChildUretimTerminalKaynak = class(TAppDataChildCustomUretimTerminalKaynak)
  private
    FRuleSelf: TAppRuleSelf;
  protected
    procedure CreateRules; override;
  published
  end;

implementation

uses
  CPMApp_Dialogs,
  CPMApp_Rule_FieldValidate, CPMApp_TableItems,
  CPMApp_DAPCustomUretimTerminalAyarlar;

{ TAppDataChildCustomUretimTerminalKaynak }

constructor TAppDataChildCustomUretimTerminalKaynak.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimTerminalKaynak.CreateTable;
begin
  Table := TTableUretimTerminalKaynak.Create(DataApp.DataObject);
  Table.Name := 'TableUretimTerminalKaynak';
  Table.TableItems.TableNames := VarArrayOf(['URTTEK', 'URTKYN']);
  Table.TableItems.TableCaptions := VarArrayOf(['Terminal Kaynaký', '!']);
  Table.IndexFieldNames := 'SIRKETNO;TERMINALKOD';

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
      Add('KAYNAKAD');
    end;
    with Join do
    begin
      Add('KAYNAKKOD', 'KAYNAKKOD');
    end;
  end;
  Table.LookupTableItems.Add(Table.TableItems[1]);
end;

destructor TAppDataChildCustomUretimTerminalKaynak.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimTerminalKaynak.GetTable: TTableUretimTerminalKaynak;
begin
  Result := TTableUretimTerminalKaynak(inherited GetTable);
end;

procedure TAppDataChildCustomUretimTerminalKaynak.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
  end;
end;

procedure TAppDataChildCustomUretimTerminalKaynak.SetTable(Value: TTableUretimTerminalKaynak);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimTerminalKaynak.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('SIRKETNO');
    AddNonBlank('TERMINALKOD');
    AddNonBlank('BASTARIH');
    AddNonBlank('BITTARIH');
    AddNonBlank('KAYNAKKOD');
  end;
end;

{ TAppDataChildUretimTerminalKaynak }
procedure TAppDataChildUretimTerminalKaynak.CreateRules;
begin
  inherited;
  FRuleSelf := TAppRuleSelf.Create(Self);
  Rules.AddRule(FRuleSelf);
end;

{ TAppRuleSelf }

constructor TAppRuleSelf.Create(AOwner: TTableUretimTerminalKaynak);
begin
  inherited Create;
  FTableSelf := AOwner;
  FTableSelf.DataEvents.AddRule(Self);
end;

constructor TAppRuleSelf.Create(AOwner: TAppDataChildUretimTerminalKaynak);
begin
  Create(AOwner.Table);
  FChildSelf := AOwner;
end;

procedure TAppRuleSelf.AddIslemTanim;
var
  SQLStr: String;
begin
  SQLStr := Format('Select ISLEMNO From dbo.URTKIT Where KAYNAKKOD = ''%s''', [FTableSelf.KaynakKod]);
  FChildSelf.DataApp.TableCommand.OpenCommandText(SQLStr);

  TAppDAPCustomUretimTerminalAyarlar(FChildSelf.DataApp).UretimTerminalKaynakIslemTanim.Table.First;
  while not TAppDAPCustomUretimTerminalAyarlar(FChildSelf.DataApp).UretimTerminalKaynakIslemTanim.Table.Eof do
    TAppDAPCustomUretimTerminalAyarlar(FChildSelf.DataApp).UretimTerminalKaynakIslemTanim.Table.Delete;

  if not FChildSelf.DataApp.TableCommand.IsEmpty then
  begin
    FChildSelf.DataApp.TableCommand.First;
    while not FChildSelf.DataApp.TableCommand.Eof do
    begin
      TAppDAPCustomUretimTerminalAyarlar(FChildSelf.DataApp).UretimTerminalKaynakIslemTanim.Table.Insert;
      TAppDAPCustomUretimTerminalAyarlar(FChildSelf.DataApp).UretimTerminalKaynakIslemTanim.Table.IslemNo := FChildSelf.DataApp.TableCommand.FieldValues['ISLEMNO'];
      TAppDAPCustomUretimTerminalAyarlar(FChildSelf.DataApp).UretimTerminalKaynakIslemTanim.Table.Post;
    FChildSelf.DataApp.TableCommand.Next;
    end;
  end;
end;

procedure TAppRuleSelf.DoOnFieldChanged(Table: TAppCustomTable; Field: TField);
var
  xOldValue, xNewValue: String;
begin
  inherited;
  if Field = FTableSelf.fKaynakKod then
  begin
    xOldValue := FTableSelf.fKaynakKod.OldValue;
    xNewValue := FTableSelf.fKaynakKod.NewValue;
    if xOldValue <> xNewValue then
    begin
      AddIslemTanim;
//      AppShowMessage(TAppDAPCustomUretimTerminalAyarlar(FChildSelf.DataApp).UretimTerminalKaynakIslemTanim.Table.KaynakKod);
//      AppShowMessage(xOldValue + ' / ' + xNewValue);
    end;
  end;
end;

procedure TAppRuleSelf.DoOnNewRecord(Table: TAppCustomTable);
begin
  inherited;

end;

end.
