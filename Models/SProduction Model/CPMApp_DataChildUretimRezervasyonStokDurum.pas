unit CPMApp_DataChildUretimRezervasyonStokDurum;

interface
uses   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, StdCtrls,
  DB, ADODB,
  CPMApp_DB,
  CPMApp_DataObject,
  CPMApp_DataObjectDB,
  CPMApp_DataObjectModel,
  CPMApp_Rule_FieldValidate,
  CPMApp_Rule_FieldDefaultValue,
  CPMApp_DataApp,
  CPMApp_DocConsts,
  CPMApp_Rule_Increment,
  CPMApp_DataChildUretimRezervasyon;

type
 TAppDataChildUretimRezervasyonStokDurum = class;

  TAppRuleUpdate = class(TAppTableRule)
  private
    FInUse: Boolean;
    FTableUretimRezervasyonStokDurum: TAppTable;
    FDataChildUretimRezervasyonStokDurum: TAppDataChildUretimRezervasyonStokDurum;
    FDataChildUretimRezervasyon: TAppDataChildUretimRezervasyon;
    InUse: Boolean;
  Protected
    procedure DoOnFieldChanged(Table: TAppCustomTable; Field: TField); override;
  public
    constructor Create(AOwner: TAppTable); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimRezervasyonStokDurum); reintroduce; overload;
    destructor Destroy; override;
  end;

  TAppDataChildUretimRezervasyonStokDurum = class(TAppDataChild)
  private
    FRuleUpdate: TAppRuleUpdate;
  protected
    function GetTable: TAppTable;
    procedure SetTable(Value: TAppTable);
    procedure SetValidates; override;
    procedure SetDefaultValues; override;
    procedure CreateRules; override;
    procedure CreateTable; override;
  published
  public
    FRunEvrakNo : String;
    FRunEvrakSiraNo : Integer;

    TableRunUretimRezervasyonStokDurum: TAppTable;
    Procedure LoadParams;
    procedure SetTableParams;
    function GetSQL: String;
    procedure SetInsertUretimRezervasyonStokDurum;

    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
    procedure Execute;
    procedure CreateDataSet;


  published
    property Table: TAppTable read GetTable write SetTable;
    property RuleUpdate: TAppRuleUpdate read FRuleUpdate;
  end;


Var
  BookM, BookMRez : TBookMark;
implementation

uses
  CPMApp_Math,
  CPMApp_Type,
  CPMApp_DocReferans,
  CPMApp_StrUtils,
  CPMApp_Security,
  CPMApp_DAPCustomEvrakUretimIslem;

{ TAppDataChildUretimRezervasyonStokDurum }

constructor TAppDataChildUretimRezervasyonStokDurum.Create(AOwner: TAppDataApp);
Begin
  inherited;
  TableRunUretimRezervasyonStokDurum := TAppTable.Create(nil);
  TableRunUretimRezervasyonStokDurum.Connection := DataApp.Connection;
  TableRunUretimRezervasyonStokDurum.Name := 'DBTableRunUretimRezervasyonStokDurum';
end;

procedure TAppDataChildUretimRezervasyonStokDurum.CreateDataSet;
begin
  Table.Active := False;
  Table.FieldDefs.Clear;
  with Table.FieldDefs do
  begin
    Add('HAMMADDEKOD', ftString, 30);
    Add('DEPOKOD', ftString, 30);
    Add('DEPOAD', ftString, 30);
    Add('SERINO', ftString, 30);
    Add('SERINO2', ftString, 30);
    Add('KULLANILABILIR', ftFloat, 0);
    Add('SEVKEMRI', ftFloat, 0);
    Add('REZERVASYONMIKTAR', ftFloat, 0);
    Add('SONKAYNAKEVRAKNO', ftString, 30);
    Add('SONKAYNAKSIRANO', ftInteger, 0);
  end;

  Table.CreateFields;
  Table.CreateDataSet;
  Table.DataSet.IndexFieldNames := 'HAMMADDEKOD';
end;

procedure TAppDataChildUretimRezervasyonStokDurum.CreateRules;
begin
  inherited;
  FRuleUpdate := TAppRuleUpdate.Create(Self);
  Rules.AddRule(FRuleUpdate);
end;

procedure TAppDataChildUretimRezervasyonStokDurum.CreateTable;
begin
  Table := TAppTable.Create(DataApp.DataObject);
  Table.OptionsKey.Enabled := False;
  Table.Name := 'TableUretimRezervasyonStokDurum';
  Table.TableItems.TableNames := 'RZR012';
  Table.TableItems.TableCaptions := 'Malzeme Uretim Rezervasyon Stok Durum';
  Table.Connection := DataApp.Connection;
//  Table.ReadOnly := True;
  Table.OptionsData.CanInitRecord := False;

  CreateDataSet;
end;

destructor TAppDataChildUretimRezervasyonStokDurum.Destroy;
begin
  inherited;
  FreeAndNil(TableRunUretimRezervasyonStokDurum);
end;

procedure TAppDataChildUretimRezervasyonStokDurum.Execute;
begin
  LoadParams;
  //Table.EmptyTable;
  Table.Active := False;
  Table.CommandText := GetSQL;
  SetTableParams;
  Table.Active := True;
end;

function TAppDataChildUretimRezervasyonStokDurum.GetSQL: String;
Var
  SQL: TStringList;

  Procedure DoStart;
  begin
    SQL := TStringList.Create;
  end;

  Procedure DoEnd;
  begin
    SQL.Free;
  end;

 function GetSql_UretimRezervasyonStokDurum :String;
   begin
    SQL.Clear;
    SQL.Add('SELECT MALKOD AS HAMMADDEKOD, DEPOKOD, DEPOKOD AS DEPOAD, SERINO, SERINO2, KULLANILABILIR, SIPARISREZERVASYON AS SEVKEMRI, CAST(0 AS NUMERIC(25,6)) AS REZERVASYONMIKTAR, SONKAYNAKEVRAKNO, SONKAYNAKSIRANO FROM VW_STOKDURUMEVRAKNO WHERE STOKMIKTAR>0');


    Result := ReplaceStr(SQL.Text, '"', '''');
  end;

begin
  try
    DoStart;
    Result := GetSQL_UretimRezervasyonStokDurum;
  finally
    DoEnd;
  end;
end;

function TAppDataChildUretimRezervasyonStokDurum.GetTable: TAppTable;
begin
  Result := TAppTable(inherited GetTable);
end;


procedure TAppDataChildUretimRezervasyonStokDurum.LoadParams;
begin

end;

procedure TAppDataChildUretimRezervasyonStokDurum.SetDefaultValues;
begin
  inherited;

end;

procedure TAppDataChildUretimRezervasyonStokDurum.SetInsertUretimRezervasyonStokDurum;
Var
  I : Integer;
  aFieldName : String;
begin
  Table.Append;
  For I := 0 to TableRunUretimRezervasyonStokDurum.FieldDefs.Count-1 Do
  begin
    aFieldName := TableRunUretimRezervasyonStokDurum.Fields[I].FieldName;
      if Table.FieldByName(aFieldName).DataType = ftFloat then
        Table.FieldByName(aFieldName).AsFloat :=TableRunUretimRezervasyonStokDurum.Fields[I].AsFloat
      else
        Table.FieldByName(aFieldName).Value := TableRunUretimRezervasyonStokDurum.Fields[I].Value;
   end;
  Table.Post;

end;

procedure TAppDataChildUretimRezervasyonStokDurum.SetTable(Value: TAppTable);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildUretimRezervasyonStokDurum.SetTableParams;
begin
//  with Table do
//  begin
//    Params.ParamByName('EVRAKNO').AsString := FRunEvrakNo;
//    Params.ParamByName('SIRA').AsInteger := FRunEvrakSiraNo;
//  end;
end;

procedure TAppDataChildUretimRezervasyonStokDurum.SetValidates;
begin
  inherited;

end;


{ TAppRuleUpdate }

constructor TAppRuleUpdate.Create(AOwner: TAppTable);
begin
  inherited Create;
  FTableUretimRezervasyonStokDurum := AOwner;
  FTableUretimRezervasyonStokDurum.DataEvents.AddRule(Self);
  FInUse := False;
end;


constructor TAppRuleUpdate.Create(AOwner: TAppDataChildUretimRezervasyonStokDurum);
begin
  Create(AOwner.Table);
  FDataChildUretimRezervasyonStokDurum := AOwner;
end;

destructor TAppRuleUpdate.Destroy;
begin

  inherited;
end;

procedure TAppRuleUpdate.DoOnFieldChanged(Table: TAppCustomTable;
  Field: TField);
Var
  FKullanilabilir : TField;
  FRezervasyon : TField;
  FSonKaynakEvrakNo : TField;
  Msg : Integer;
  TRezervasyon : TAppTable;
  AOldMiktar : Real;

  Function ApplyNewCount(Miktar:Real):String;
  Var
    ASql: String;
    AHammaddeKod, AParam : String;
    AMiktar : Real;
    ATable : TAppDataApp;
    Begin

    ATable := TAppDataApp.Create(FDataChildUretimRezervasyonStokDurum.DataApp);
    ATable.Connection := FDataChildUretimRezervasyonStokDurum.DataApp.Connection;

    AHammaddeKod := #39 + FDataChildUretimRezervasyonStokDurum.Table.FieldByName('HAMMADDEKOD').AsString + #39;
    AMiktar := Miktar;
    AParam := #39 +'UpdateCount' + #39;

    ASql := 'exec _SpApp_MAMKRT_Expand Null, Null, ' + AHammaddeKod  + ', ';
    ASql := ASql + FloatToStr(AMiktar) +  ', ' + AParam;
    ATable.TableCommand.OpenCommandText(ASql);

    ASql := 'Select *, HAMMADDEKOD as HAMMADDEAD, HAMMADDEKOD AS BIRIM, REZERVASYONDEPOKOD  AS REZERVASYONDEPOAD From ##Temp_RezervasyonBOMList ORDER BY SIRA';

    ATable.TableCommand.Close;
    ATable.Free;
    Result := ASql;
  end;

begin
  inherited;

  if InUse then
    exit;

  InUse := True;
  FKullanilabilir := FTableUretimRezervasyonStokDurum.FieldByName('KULLANILABILIR');
  FRezervasyon    := FTableUretimRezervasyonStokDurum.FieldByName('REZERVASYONMIKTAR');
  FSonKaynakEvrakNo := FTableUretimRezervasyonStokDurum.FieldByName('SONKAYNAKEVRAKNO');
  try
    if (Field = FRezervasyon) Then
      TRezervasyon := TAppDAPEvrakUretimIslem(FDataChildUretimRezervasyonStokDurum.DataApp).UretimRezervasyon.Table;
        If FRezervasyon.AsFloat > FKullanilabilir.AsFloat Then begin
             Msg := MessageDlg('Mevcut miktardan fazla Rezervasyon yapamazsýnýz!',mtError, [mbOK], 0);
             FDataChildUretimRezervasyonStokDurum.Table.Cancel;
          Exit;
        end;
        If Length(FSonKaynakEvrakNo.AsString)>0 Then begin
          Msg := MessageDlg('Önce ürünü baðlý olduðu sipariþten ayýrýn.' + #13 +
                            'Baþka bir sipariþe Rezerve edilmiþ ürünü bu ekrandan Rezerve edemezsiniz!',
                mtError, [mbOK], 0);
          FDataChildUretimRezervasyonStokDurum.Table.Cancel;
          Exit;
        End;
          TRezervasyon.OpenCommandText(ApplyNewCount(FDataChildUretimRezervasyonStokDurum.Table.FieldByName('REZERVASYONMIKTAR').AsFloat - TRezervasyon.FieldByName('HIDEREZERVASYONMIKTAR').AsFloat));
          //ApplyNewCount(FDataChildUretimRezervasyonStokDurum.Table.FieldByName('REZERVASYONMIKTAR').AsFloat - TRezervasyon.FieldByName('HIDEREZERVASYONMIKTAR').AsFloat);

          With
                TRezervasyon,
                FDataChildUretimRezervasyonStokDurum
          do
          begin
            Edit;
              FieldByName('REZERVASYONMIKTAR').AsFloat :=
              Table.FieldByName('REZERVASYONMIKTAR').AsFloat
                  + FieldByName('HIDEREZERVASYONMIKTAR').AsFloat;
            Post;
          end;

  finally
    InUse := False;
  end;

end;

end.
