unit CPMApp_DataChildUretimKaynakDemirbas;

interface

uses
  DB,
  Classes,
  Dialogs,
  SysUtils,
  CPMApp_DataApp,
  CPMApp_DataObject,
  CPMApp_DataObjectDB,
  CPMApp_DataObjectModel,
  CPMApp_TableBOMCustomSystem;

type
  TAppDataChildUretimKaynakDemirbas = class;

  TAppDataChildUretimKaynakDemirbas = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimKaynakDemirbas;
    procedure SetTable(Value: TTableUretimKaynakDemirbas);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
    procedure CreateRules; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimKaynakDemirbas read GetTable write SetTable;
  end;

implementation

uses Variants, CPMApp_Rule_FieldValidate,
  CPMApp_Rule_FieldDefaultValue;

{ TAppDataChildUretimKaynakDemirbas }

constructor TAppDataChildUretimKaynakDemirbas.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildUretimKaynakDemirbas.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildUretimKaynakDemirbas.CreateTable;
begin
  Table := TTableUretimKaynakDemirbas.Create(DataApp.DataObject);
  Table.Name := 'TableUretimKaynakDemirbas';
  Table.TableItems.TableNames := 'URTKDT';
end;

destructor TAppDataChildUretimKaynakDemirbas.Destroy;
begin
  inherited;
end;

function TAppDataChildUretimKaynakDemirbas.GetTable: TTableUretimKaynakDemirbas;
begin
  Result := TTableUretimKaynakDemirbas(inherited GetTable);
end;

procedure TAppDataChildUretimKaynakDemirbas.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('KAYITTUR', 1);
  end;
end;

procedure TAppDataChildUretimKaynakDemirbas.SetTable(Value: TTableUretimKaynakDemirbas);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildUretimKaynakDemirbas.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('KAYNAKKOD');
    AddNonBlank('MALKOD');
    AddNonBlank('BASTARIH');
    AddNonBlank('BITTARIH');
    AddNonBlank('VERIMLILIK');
  end;
end;

end.
