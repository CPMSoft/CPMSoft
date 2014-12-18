unit CPMApp_DataChildUretimYilTatil;

interface

uses Classes, SysUtils, DB, Dialogs, Variants,
  CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_TableUretimSystem;

type
  TAppDataChildCustomUretimYilTatil = class;
  TAppDataChildUretimYilTatil = class;

  TAppDataChildCustomUretimYilTatil = class(TAppDataChild)
  private
  protected
    function GetTable: TAppTable;
    procedure SetTable(Value: TAppTable);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
  public
    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
  published
    property Table: TAppTable read GetTable write SetTable;
  end;

  TAppDataChildUretimYilTatil = class(TAppDataChildCustomUretimYilTatil)
  private
  protected
    procedure CreateRules; override;
  published
  end;

implementation

uses CPMApp_Rule_FieldValidate, CPMApp_Date;

{ TAppDataChildCustomUretimYilTatil }

constructor TAppDataChildCustomUretimYilTatil.Create(AOwner: TAppDataApp);
begin
  inherited;

end;

procedure TAppDataChildCustomUretimYilTatil.CreateTable;
begin
  Table := TAppTable.Create(DataApp.DataObject);
  Table.Name := 'TableUretimYilTatil';
  Table.TableItems.TableNames := VarArrayOf(['URTYRT']);
  Table.TableItems.TableCaptions := VarArrayOf(['Yýl Tatil']);
end;

destructor TAppDataChildCustomUretimYilTatil.Destroy;
begin

  inherited;
end;

function TAppDataChildCustomUretimYilTatil.GetTable: TAppTable;
begin
  Result := TAppTable(inherited GetTable);
end;

procedure TAppDataChildCustomUretimYilTatil.SetDefaultValues;
begin
  inherited;

  with Table.DefaultValue do
  begin
    Add('BASSAAT', AppDateHelper.FirstDateZeroTime);
    Add('BITSAAT', AppDateHelper.FirstDateZeroTime);
  end;
end;

procedure TAppDataChildCustomUretimYilTatil.SetTable(Value: TAppTable);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildCustomUretimYilTatil.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('TAKVIMYIL');
    AddNonBlank('TARIH');
  end;
end;

{ TAppDataChildUretimYilTatil }

procedure TAppDataChildUretimYilTatil.CreateRules;
begin
  inherited;

end;

end.
