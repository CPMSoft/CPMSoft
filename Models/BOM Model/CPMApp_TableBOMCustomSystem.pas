unit CPMApp_TableBOMCustomSystem;

interface

uses Windows, Classes, SysUtils, Controls,
    DB, CPMApp_DataObject, CPMApp_DataObjectModel;

type
  TTableUretimKaynakAlternatifTanim = class;    // URTKAT
  TTableUretimKaynakDemirbas = class;    // URTKDT

  TTableUretimKaynakAlternatifTanim = class(TAppTable)
  Private
    FfAlternatifKaynakKod: TField;
    FfID: TField;
    FfIslemTip: TField;
    FfKayitTur: TField;
    FfKaynakKod: TField;
    FfKullanimSiraNo: TField;
    function GetAlternatifKaynakKod: String;
    function GetID: Integer;
    function GetIslemTip: Integer;
    function GetKayitTur: Integer;
    function GetKaynakKod: String;
    function GetKullanimSiraNo: Integer;
    function GetfAlternatifKaynakKod: TField;
    function GetfID: TField;
    function GetfIslemTip: TField;
    function GetfKayitTur: TField;
    function GetfKaynakKod: TField;
    function GetfKullanimSiraNo: TField;
    procedure SetAlternatifKaynakKod(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetIslemTip(const Value: Integer);
    procedure SetKayitTur(const Value: Integer);
    procedure SetKaynakKod(const Value: String);
    procedure SetKullanimSiraNo(const Value: Integer);
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AlternatifKaynakKod: String read GetAlternatifKaynakKod write SetAlternatifKaynakKod;
    property ID: Integer read GetID write SetID;
    property IslemTip: Integer read GetIslemTip write SetIslemTip;
    property KayitTur: Integer read GetKayitTur write SetKayitTur;
    property KaynakKod: String read GetKaynakKod write SetKaynakKod;
    property KullanimSiraNo: Integer read GetKullanimSiraNo write SetKullanimSiraNo;
    property fAlternatifKaynakKod:TField read GetfAlternatifKaynakKod;
    property fID:TField read GetfID;
    property fIslemTip:TField read GetfIslemTip;
    property fKayitTur:TField read GetfKayitTur;
    property fKaynakKod:TField read GetfKaynakKod;
    property fKullanimSiraNo:TField read GetfKullanimSiraNo;
  end;

  TTableUretimKaynakDemirbas = class(TAppTable)
  Private
  protected
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
  end;

implementation
uses CPMApp_Security;

{ TTableUretimKaynakAlternatifTanim }

constructor TTableUretimKaynakAlternatifTanim.Create(AOwner: TComponent);
begin
  inherited;
  Name := 'TTableUretimKaynakAlternatifTanim';
  TableItems.TableNames := 'URTKAT';
end;

procedure TTableUretimKaynakAlternatifTanim.DoAfterOpen;
begin
  if FfAlternatifKaynakKod = nil then
    FfAlternatifKaynakKod := FindField('ALTERNATIFKAYNAKKOD');
  if FfID = nil then
    FfID := FindField('ID');
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  if FfKullanimSiraNo = nil then
    FfKullanimSiraNo := FindField('KULLANIMSIRANO');
  inherited;
end;

procedure TTableUretimKaynakAlternatifTanim.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
    FfAlternatifKaynakKod := nil;
    FfID := nil;
    FfIslemTip := nil;
    FfKayitTur := nil;
    FfKaynakKod := nil;
    FfKullanimSiraNo := nil;
  end;
  inherited;
end;

function TTableUretimKaynakAlternatifTanim.GetAlternatifKaynakKod: String;
begin
  if FfAlternatifKaynakKod = nil then
    FfAlternatifKaynakKod := FindField('ALTERNATIFKAYNAKKOD');
  Result := FfAlternatifKaynakKod.AsString;
end;

function TTableUretimKaynakAlternatifTanim.GetID: Integer;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID.AsInteger;
end;

function TTableUretimKaynakAlternatifTanim.GetIslemTip: Integer;
begin
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  Result := FfIslemTip.AsInteger;
end;

function TTableUretimKaynakAlternatifTanim.GetKayitTur: Integer;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur.AsInteger;
end;

function TTableUretimKaynakAlternatifTanim.GetKaynakKod: String;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod.AsString;
end;

function TTableUretimKaynakAlternatifTanim.GetKullanimSiraNo: Integer;
begin
  if FfKullanimSiraNo = nil then
    FfKullanimSiraNo := FindField('KULLANIMSIRANO');
  Result := FfKullanimSiraNo.AsInteger;
end;

function TTableUretimKaynakAlternatifTanim.GetfAlternatifKaynakKod: TField;
begin
  if FfAlternatifKaynakKod = nil then
    FfAlternatifKaynakKod := FindField('ALTERNATIFKAYNAKKOD');
  Result := FfAlternatifKaynakKod;
end;

function TTableUretimKaynakAlternatifTanim.GetfID: TField;
begin
  if FfID = nil then
    FfID := FindField('ID');
  Result := FfID;
end;

function TTableUretimKaynakAlternatifTanim.GetfIslemTip: TField;
begin
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  Result := FfIslemTip;
end;

function TTableUretimKaynakAlternatifTanim.GetfKayitTur: TField;
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  Result := FfKayitTur;
end;

function TTableUretimKaynakAlternatifTanim.GetfKaynakKod: TField;
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  Result := FfKaynakKod;
end;

function TTableUretimKaynakAlternatifTanim.GetfKullanimSiraNo: TField;
begin
  if FfKullanimSiraNo = nil then
    FfKullanimSiraNo := FindField('KULLANIMSIRANO');
  Result := FfKullanimSiraNo;
end;

procedure TTableUretimKaynakAlternatifTanim.SetAlternatifKaynakKod(const Value: String);
begin
  if FfAlternatifKaynakKod = nil then
    FfAlternatifKaynakKod := FindField('ALTERNATIFKAYNAKKOD');
  FfAlternatifKaynakKod.AsString := Value;
end;

procedure TTableUretimKaynakAlternatifTanim.SetID(const Value: Integer);
begin
  if FfID = nil then
    FfID := FindField('ID');
  FfID.AsInteger := Value;
end;

procedure TTableUretimKaynakAlternatifTanim.SetIslemTip(const Value: Integer);
begin
  if FfIslemTip = nil then
    FfIslemTip := FindField('ISLEMTIP');
  FfIslemTip.AsInteger := Value;
end;

procedure TTableUretimKaynakAlternatifTanim.SetKayitTur(const Value: Integer);
begin
  if FfKayitTur = nil then
    FfKayitTur := FindField('KAYITTUR');
  FfKayitTur.AsInteger := Value;
end;

procedure TTableUretimKaynakAlternatifTanim.SetKaynakKod(const Value: String);
begin
  if FfKaynakKod = nil then
    FfKaynakKod := FindField('KAYNAKKOD');
  FfKaynakKod.AsString := Value;
end;

procedure TTableUretimKaynakAlternatifTanim.SetKullanimSiraNo(const Value: Integer);
begin
  if FfKullanimSiraNo = nil then
    FfKullanimSiraNo := FindField('KULLANIMSIRANO');
  FfKullanimSiraNo.AsInteger := Value;
end;

{ TTableUretimKaynakDemirbas }

constructor TTableUretimKaynakDemirbas.Create(AOwner: TComponent);
begin
  inherited;
  Name := 'TTableUretimKaynakDemirbas';
  TableItems.TableNames := '';
end;

procedure TTableUretimKaynakDemirbas.DoAfterOpen;
begin
  inherited;
end;

procedure TTableUretimKaynakDemirbas.DoAfterClose;
begin
  if FieldCount = 0 then
  begin
  end;
  inherited;
end;

end.

