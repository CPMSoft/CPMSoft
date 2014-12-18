unit CPMApp_DataChildUretimKaynakIslemTanim;

interface

uses
  CPMApp_DataApp,
  CPMApp_TableBOMSystem;

type
  TAppDataChildUretimKaynakIslemTanim = class(TAppDataChild)
  protected
    function GetTable: TTableUretimKaynakIslemTanim;
    procedure SetTable(Value: TTableUretimKaynakIslemTanim);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateTable; override;
    procedure CreateRules; override;
  published
    property Table: TTableUretimKaynakIslemTanim read GetTable write SetTable;
  end;

implementation

{ TAppDataChildUretimKaynakIslemTanim }

procedure TAppDataChildUretimKaynakIslemTanim.CreateRules;
begin
  inherited;

end;

procedure TAppDataChildUretimKaynakIslemTanim.CreateTable;
begin
  Table := TTableUretimKaynakIslemTanim.Create(DataApp.DataObject);
  Table.Name := 'TableUretimKaynakIslemTanim';
end;

function TAppDataChildUretimKaynakIslemTanim.GetTable: TTableUretimKaynakIslemTanim;
begin
  Result := TTableUretimKaynakIslemTanim(inherited GetTable);
end;

procedure TAppDataChildUretimKaynakIslemTanim.SetDefaultValues;
begin
  inherited;
  with Table.DefaultValue do
  begin
  end;
end;

procedure TAppDataChildUretimKaynakIslemTanim.SetTable(Value: TTableUretimKaynakIslemTanim);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildUretimKaynakIslemTanim.SetValidates;
begin
  inherited;
  with Table.Validate do
  begin
    AddNonBlank('ISLEMNO');
    AddNonBlank('ACIKLAMA');
  end;
end;

end.
