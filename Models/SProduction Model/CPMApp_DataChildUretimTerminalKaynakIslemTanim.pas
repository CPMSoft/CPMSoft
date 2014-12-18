unit CPMApp_DataChildUretimTerminalKaynakIslemTanim;

interface

uses
  CPMApp_DataApp,
  CPMApp_TableUretimTempSystem;

type
  TAppDataChildUretimTerminalKaynakIslemTanim = class;

  TAppDataChildUretimTerminalKaynakIslemTanim = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimTerminalKaynakIslemTanim;
    procedure SetTable(Value: TTableUretimTerminalKaynakIslemTanim);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
    procedure CreateRules; override;
  public
  published
    property Table: TTableUretimTerminalKaynakIslemTanim read GetTable write SetTable;
  end;

implementation

uses Variants;

{ TAppDataChildUretimTerminalKaynakIslemTanim }

procedure TAppDataChildUretimTerminalKaynakIslemTanim.CreateTable;
begin
  Table := TTableUretimTerminalKaynakIslemTanim.Create(DataApp.DataObject);
  Table.TableItems.TableNames := VarArrayOf(['URTTIT', 'URTKIT']);
  Table.TableItems.TableCaptions := VarArrayOf(['Terminal Ýþlem Taným', '!']);

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
      Add('ACIKLAMA');
      Add('ISLEMTIP');
    end;
    with Join do
    begin
      Add('KAYNAKKOD', 'KAYNAKKOD');
      Add('ISLEMNO', 'ISLEMNO');
    end;
  end;
  Table.LookupTableItems.Add(Table.TableItems[1]);
end;

function TAppDataChildUretimTerminalKaynakIslemTanim.GetTable: TTableUretimTerminalKaynakIslemTanim;
begin
  Result := TTableUretimTerminalKaynakIslemTanim(inherited GetTable);
end;

procedure TAppDataChildUretimTerminalKaynakIslemTanim.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KULLANILAN', 1);
  end;
end;

procedure TAppDataChildUretimTerminalKaynakIslemTanim.SetTable(Value: TTableUretimTerminalKaynakIslemTanim);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildUretimTerminalKaynakIslemTanim.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('SIRKETNO');
    AddNonBlank('TERMINALKOD');
    AddNonBlank('KAYNAKKOD');
    AddNonBlank('ISLEMNO');
  end;
end;

procedure TAppDataChildUretimTerminalKaynakIslemTanim.CreateRules;
begin
  inherited;

end;

end.
