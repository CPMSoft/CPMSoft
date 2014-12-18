unit CPMApp_DataChildUretimKaynakAlternatifTanim;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMCustomSystem;

type
  TAppDataChildUretimKaynakAlternatifTanim = class;

  TAppDataChildUretimKaynakAlternatifTanim = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimKaynakAlternatifTanim;
    procedure SetTable(Value: TTableUretimKaynakAlternatifTanim);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
    procedure CreateRules; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimKaynakAlternatifTanim read GetTable write SetTable;
  end;

implementation

uses Variants, CPMApp_Rule_FieldValidate,
  CPMApp_Rule_FieldDefaultValue;

{ TAppDataChildUretimKaynakAlternatifTanim }

constructor TAppDataChildUretimKaynakAlternatifTanim.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildUretimKaynakAlternatifTanim.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildUretimKaynakAlternatifTanim.CreateTable;
begin
  Self.Table := TTableUretimKaynakAlternatifTanim.Create(DataApp.DataObject);
  Self.Table.Name := 'TableUretimKaynakAlternatifTanim';
  Self.Table.ProviderName := 'prURTKAT';
  Self.Table.TableItems.TableNames := VarArrayOf(['URTKAT', 'URTKYN']);
  Self.Table.TableItems.TableCaptions := VarArrayOf(['Kaynak Alternatif Tanim', 'Kaynak Kart']);
  with Self.Table.TableItems[0] do
  begin
    with Fields do begin
      Clear;
      Add('*');
    end;
  end;

  with Self.Table.TableItems[1] do
  begin
    with Fields do begin
      Clear;
      Add('KAYNAKAD');
    end;
    with Join do begin
      Clear;
      Add('KAYNAKKOD', 'ALTERNATIFKAYNAKKOD');
    end;
  end;


end;

destructor TAppDataChildUretimKaynakAlternatifTanim.Destroy;
begin
  inherited;
end;

function TAppDataChildUretimKaynakAlternatifTanim.GetTable: TTableUretimKaynakAlternatifTanim;
begin
  Result := TTableUretimKaynakAlternatifTanim(inherited GetTable);
end;

procedure TAppDataChildUretimKaynakAlternatifTanim.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
  end;
end;

procedure TAppDataChildUretimKaynakAlternatifTanim.SetTable(Value: TTableUretimKaynakAlternatifTanim);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildUretimKaynakAlternatifTanim.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('KAYNAKKOD');
    AddNonBlank('ALTERNATIFKAYNAK');
    AddNonBlank('ISLEMTIP');
    AddNonBlank('KULLANIMSIRANO');
  end;
end;

end.
