unit CPMApp_DataChildUretimTerminalPersonel;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableUretimTempSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimTerminalPersonel = class;
  TAppDataChildUretimTerminalPersonel = class;

  TAppDataChildCustomUretimTerminalPersonel = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimTerminalPersonel;
    procedure SetTable(Value: TTableUretimTerminalPersonel);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimTerminalPersonel read GetTable write SetTable;
  end;

  TAppDataChildUretimTerminalPersonel = class(TAppDataChildCustomUretimTerminalPersonel)
  private
  protected
    procedure CreateRules; override;
  published
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_TableItems;

{ TAppDataChildCustomUretimTerminalPersonel }

constructor TAppDataChildCustomUretimTerminalPersonel.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimTerminalPersonel.CreateTable;
begin
  Table := TTableUretimTerminalPersonel.Create(DataApp.DataObject);
  Table.Name := 'TableUretimTerminalPersonel';
  Table.TableItems.TableNames := VarArrayOf(['URTTEP', 'PERKRT']);
  Table.TableItems.TableCaptions := VarArrayOf(['Terminal Personeli', '!']);
  Table.IndexFieldNames := 'SIRKETNO;TERMINALKOD;SICILKOD';

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
      Add('AD');
      Add('SOYAD');
    end;
    with Join do
    begin
      Add('SICILKOD', 'SICILKOD');
    end;
  end;
  Table.LookupTableItems.Add(Table.TableItems[1]);
end;

destructor TAppDataChildCustomUretimTerminalPersonel.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimTerminalPersonel.GetTable: TTableUretimTerminalPersonel;
begin
  Result := TTableUretimTerminalPersonel(inherited GetTable);
end;

procedure TAppDataChildCustomUretimTerminalPersonel.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
  end;
end;

procedure TAppDataChildCustomUretimTerminalPersonel.SetTable(Value: TTableUretimTerminalPersonel);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimTerminalPersonel.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('SIRKETNO');
    AddNonBlank('TERMINALKOD');
    AddNonBlank('SICILKOD');
    AddNonBlank('BASTARIH');
    AddNonBlank('BITTARIH');
  end;
end;

{ TAppDataChildUretimTerminalPersonel }
procedure TAppDataChildUretimTerminalPersonel.CreateRules;
begin
  inherited;

end;

end.
