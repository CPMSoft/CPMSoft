unit CPMApp_DataChildUretimKaynakTakvim;

interface

uses Classes, SysUtils, DB, Dialogs,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableBOMSystem, CPMApp_Rule_Increment;

type
  TAppDataChildCustomUretimKaynakTakvim = class;
  TAppDataChildUretimKaynakTakvim = class;

  TAppDataChildCustomUretimKaynakTakvim = class(TAppDataChild)
  private
  protected
    function GetTable: TTableUretimKaynakTakvim;
    procedure SetTable(Value: TTableUretimKaynakTakvim);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TTableUretimKaynakTakvim read GetTable write SetTable;
  end;

  TAppDataChildUretimKaynakTakvim = class(TAppDataChildCustomUretimKaynakTakvim)
  private
  protected
    procedure CreateRules; override;
  published
  end;

implementation

uses CPMApp_Rule_FieldValidate;

{ TAppDataChildCustomUretimKaynakTakvim }

constructor TAppDataChildCustomUretimKaynakTakvim.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimKaynakTakvim.CreateTable;
begin
  Table := TTableUretimKaynakTakvim.Create(DataApp.DataObject);
  Table.Name := 'TableUretimKaynakTakvim';
  Table.TableItems.TableNames := 'URTKYT';
end;

destructor TAppDataChildCustomUretimKaynakTakvim.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimKaynakTakvim.GetTable: TTableUretimKaynakTakvim;
begin
  Result := TTableUretimKaynakTakvim(inherited GetTable);
end;

procedure TAppDataChildCustomUretimKaynakTakvim.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
    Add('SIRKETNO', DataApp.CompanyNo);
    Add('KAYITTUR', 1);
    Add('KAYITDURUM', 1);
  end;
end;

procedure TAppDataChildCustomUretimKaynakTakvim.SetTable(Value: TTableUretimKaynakTakvim);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimKaynakTakvim.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    Add('SIRKETNO', vcEqual, DataApp.CompanyNo);
    AddNonBlank('TAKVIMYIL');
    AddNonBlank('KAYNAKKOD');
    AddNonBlank('VARDIYAKOD');
    AddNonBlank('TARIH');
    AddNonBlank('BASTARIHSAAT');
    AddNonBlank('BASSAAT');
    AddNonBlank('BITTARIHSAAT');
    AddNonBlank('BITSAAT');
    AddNonBlank('VERIMLILIK');
    AddNonBlank('KAPASITE');
    AddNonBlank('TOPLAMKAPASITE');
    AddNonBlank('ETKINKAPASITE');
  end;
end;

{ TAppDataChildUretimKaynakTakvim }

procedure TAppDataChildUretimKaynakTakvim.CreateRules;
begin
  inherited;
end;

end.
