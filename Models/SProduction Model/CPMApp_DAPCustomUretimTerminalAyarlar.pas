unit CPMApp_DAPCustomUretimTerminalAyarlar;

interface

uses Classes, SysUtils, DB, CPMApp_DataObjectModel, CPMApp_DataApp,
  CPMApp_DataChildUretimTerminalBaslik,
  CPMApp_DataChildUretimTerminalPersonel,
  CPMApp_DataChildUretimTerminalKaynak,
  CPMApp_DataChildUretimTerminalKaynakIslemTanim;

type

  TAppDAPCustomUretimTerminalAyarlar = class;

  TAppDataObjectCustomUretimTerminalAyarlar = class(TAppDataObject)
  private
    FDataApp: TAppDAPCustomUretimTerminalAyarlar;
  protected
    procedure DoOnCanSave(var CanSave: Boolean; var ErrorText: String); override;
  published
    property DataApp: TAppDAPCustomUretimTerminalAyarlar read FDataApp;
  end;

  TAppDAPCustomUretimTerminalAyarlar = class(TAppDataApp)
  private
    FUretimTerminalBaslik: TAppDataChildUretimTerminalBaslik;
    FUretimTerminalPersonel: TAppDataChildUretimTerminalPersonel;
    FUretimTerminalKaynak: TAppDataChildUretimTerminalKaynak;
    FUretimTerminalKaynakIslemTanim: TAppDataChildUretimTerminalKaynakIslemTanim;
  protected
    procedure SetKeyFieldNames; override;
    procedure SetApplyUpdateTableList; override;
    procedure CreateDataChilds; override;
    function CreateDataObject: TAppDataObject; override;
    procedure AfterInitialize; override;

    function GetDataObject: TAppDataObjectCustomUretimTerminalAyarlar;

    function GetUretimTerminalBaslik: TAppDataChildUretimTerminalBaslik;
    procedure SetUretimTerminalBaslik(const Value: TAppDataChildUretimTerminalBaslik);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DataObject: TAppDataObjectCustomUretimTerminalAyarlar read GetDataObject;
    property UretimTerminalBaslik: TAppDataChildUretimTerminalBaslik read GetUretimTerminalBaslik write SetUretimTerminalBaslik;
    property UretimTerminalPersonel: TAppDataChildUretimTerminalPersonel read FUretimTerminalPersonel;
    property UretimTerminalKaynak: TAppDataChildUretimTerminalKaynak read FUretimTerminalKaynak;
    property UretimTerminalKaynakIslemTanim: TAppDataChildUretimTerminalKaynakIslemTanim read FUretimTerminalKaynakIslemTanim;
  end;

implementation

uses CPMApp_DataObjectDB, Variants;

{ TAppDAPCustomUretimTerminalAyarlar }

procedure TAppDAPCustomUretimTerminalAyarlar.AfterInitialize;
begin
  inherited;
end;

constructor TAppDAPCustomUretimTerminalAyarlar.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TAppDAPCustomUretimTerminalAyarlar.CreateDataChilds;
  procedure CreateTerminalBaslik;
  begin
    FUretimTerminalBaslik := TAppDataChildUretimTerminalBaslik.Create(Self);
  end;
  procedure CreateTerminalPersonel;
  begin
    FUretimTerminalPersonel := TAppDataChildUretimTerminalPersonel.Create(Self);
    FUretimTerminalPersonel.Table.IndexFieldNames := 'TERMINALKOD';
    FUretimTerminalPersonel.Table.MasterItems.Add(FUretimTerminalBaslik.Table, 'TERMINALKOD');
    FUretimTerminalPersonel.Table.MasterItems[0].RangeRule.Enabled := True;
  end;
  procedure CreateTerminalKaynak;
  begin
    FUretimTerminalKaynak := TAppDataChildUretimTerminalKaynak.Create(Self);
    FUretimTerminalKaynak.Table.IndexFieldNames := 'TERMINALKOD;SICILKOD';
    FUretimTerminalKaynak.Table.MasterItems.Add(FUretimTerminalPersonel.Table, 'TERMINALKOD;SICILKOD');
    FUretimTerminalKaynak.Table.MasterItems[0].RangeRule.Enabled := True;
  end;
  procedure CreateTerminalKaynakIslemTanim;
  begin
    FUretimTerminalKaynakIslemTanim := TAppDataChildUretimTerminalKaynakIslemTanim.Create(Self);
    FUretimTerminalKaynakIslemTanim.Table.IndexFieldNames := 'TERMINALKOD;SICILKOD;KAYNAKKOD';
    FUretimTerminalKaynakIslemTanim.Table.MasterItems.Add(FUretimTerminalKaynak.Table, 'TERMINALKOD;SICILKOD;KAYNAKKOD');
    FUretimTerminalKaynakIslemTanim.Table.MasterItems[0].RangeRule.Enabled := True;
  end;
begin
  inherited;
  CreateTerminalBaslik;
  CreateTerminalPersonel;
  CreateTerminalKaynak;
  CreateTerminalKaynakIslemTanim;
end;

function TAppDAPCustomUretimTerminalAyarlar.CreateDataObject: TAppDataObject;
begin
  Result := TAppDataObjectCustomUretimTerminalAyarlar.Create(Self);
  TAppDataObjectCustomUretimTerminalAyarlar(Result).FDataApp := Self;
end;

destructor TAppDAPCustomUretimTerminalAyarlar.Destroy;
begin
  inherited;
end;

function TAppDAPCustomUretimTerminalAyarlar.GetDataObject: TAppDataObjectCustomUretimTerminalAyarlar;
begin
  Result := TAppDataObjectCustomUretimTerminalAyarlar(inherited GetDataObject);
end;

function TAppDAPCustomUretimTerminalAyarlar.GetUretimTerminalBaslik: TAppDataChildUretimTerminalBaslik;
begin
  Result := FUretimTerminalBaslik;
end;

procedure TAppDAPCustomUretimTerminalAyarlar.SetApplyUpdateTableList;
begin
  inherited;
  DataObject.OptionsSave.UseDefaultList := false;
  with DataObject.OptionsSave.SaveTableList do
  begin
    Clear;
    Add(UretimTerminalBaslik.Table);
    Add(UretimTerminalPersonel.Table);
    Add(UretimTerminalKaynak.Table);
    Add(UretimTerminalKaynakIslemTanim.Table);
  end;
  with DataObject.OptionsSave.DeleteTableList do
  begin
    Clear;
    Add(UretimTerminalKaynakIslemTanim.Table);
    Add(UretimTerminalKaynak.Table);
    Add(UretimTerminalPersonel.Table);
    Add(UretimTerminalBaslik.Table);
  end;
end;

procedure TAppDAPCustomUretimTerminalAyarlar.SetKeyFieldNames;
begin
  inherited;

  with DataObject.OptionsKey do
  begin
    Names := 'SIRKETNO;TERMINALKOD';
    KeyByName('SIRKETNO').DataType := ftString;
    KeyByName('TERMINALKOD').DataType := ftString;
  end;
  with DataObject.OptionsMove do
  begin
    FieldName := 'TERMINALKOD';
    Where := Format('SIRKETNO = ''%s''', [CompanyNo]);
    OrderByFieldNames := 'TERMINALKOD';
  end;
end;

procedure TAppDAPCustomUretimTerminalAyarlar.SetUretimTerminalBaslik(
  const Value: TAppDataChildUretimTerminalBaslik);
begin
  FUretimTerminalBaslik := Value;
end;

{ TAppDataObjectCustomUretimTerminalAyarlar }

procedure TAppDataObjectCustomUretimTerminalAyarlar.DoOnCanSave(
  var CanSave: Boolean; var ErrorText: String);
begin
  inherited;

end;

end.
