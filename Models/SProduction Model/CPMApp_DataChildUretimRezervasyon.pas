unit CPMApp_DataChildUretimRezervasyon;

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
  CPMApp_Rule_Increment;

type
  TAppDataChildUretimRezervasyon = class;

  TAppRuleUpdate = class(TAppTableRule)
  private
    FInUse: Boolean;
    FTableUretimRezervasyon: TAppTable;
    FDataChildUretimRezervasyon: TAppDataChildUretimRezervasyon;
  public
    constructor Create(AOwner: TAppTable); reintroduce; overload;
    constructor Create(AOwner: TAppDataChildUretimRezervasyon); reintroduce; overload;
    destructor Destroy; override;
  end;

  TAppDataChildUretimRezervasyon = class(TAppDataChild)
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

    TableRunUretimRezervasyon: TAppTable;
    TableRunUretimRezervasyonDepolar: TAppTable;
    Procedure LoadParams;
    procedure SetTableParams;
    function GetSQL: String;
    procedure SetInsertUretimRezervasyon;

    constructor Create(AOwner: TAppDataApp); override;
    destructor Destroy; override;
    procedure Execute;
    procedure CreateDataSet;
    procedure FSetText(Field: TField; const Text: string);


  published
    property Table: TAppTable read GetTable write SetTable;
    property RuleUpdate: TAppRuleUpdate read FRuleUpdate;
  end;



implementation

uses CPMApp_Math, CPMApp_Type, CPMApp_DocReferans,CPMApp_StrUtils,CPMApp_Security;

{ TAppDataChildUretimRezervasyon }

constructor TAppDataChildUretimRezervasyon.Create(AOwner: TAppDataApp);
Begin
  inherited;
  TableRunUretimRezervasyon := TAppTable.Create(nil);
  TableRunUretimRezervasyon.Connection := DataApp.Connection;
  TableRunUretimRezervasyon.Name := 'DBTableRunUretimRezervasyon';
end;

procedure TAppDataChildUretimRezervasyon.CreateDataSet;
begin
  Table.Active := False;
  Table.FieldDefs.Clear;
  with Table.FieldDefs do
  begin
   // Add('ID', ftAutoInc);
    Add('EVRAKNO',ftString,30);
    Add('SIRA',ftInteger,0);
    Add('MAMULKOD',ftString,30);
    Add('HAMMADDEKOD',ftString,30);
    Add('HAMMADDEAD',ftString,30);
    Add('BIRIM',ftString,30);
    Add('SEVIYE',ftInteger,0);
    Add('REZERVASYONDEPOAD',ftString,30);
    Add('REZERVASYONDEPOKOD',ftString,30);
    Add('MIKTAR',ftFloat,0);
    Add('KULLANILABILIR',ftFloat,0);
    Add('REZERVASYONMIKTAR',ftFloat,0);
    Add('HIDEREZERVASYONMIKTAR',ftFloat,0);
  end;
  Table.CreateFields;
  Table.CreateDataSet;
  Table.IndexFieldNames := 'HAMMADDEKOD';
end;

procedure TAppDataChildUretimRezervasyon.CreateRules;
begin
  inherited;
//  FRuleUpdate := TAppRuleUpdate.Create(Self);
//  Rules.AddRule(FRuleUpdate);
end;

procedure TAppDataChildUretimRezervasyon.CreateTable;
begin
  Table := TAppTable.Create(DataApp.DataObject);
  Table.OptionsKey.Enabled := False;
  Table.Name := 'TableUretimRezervasyon'; // DAP da eþitledim
  Table.TableItems.TableNames := 'RZV011';
  Table.TableItems.TableCaptions := 'Malzeme UretimRezervasyon';
  Table.Connection := DataApp.Connection;
//  Table.ReadOnly := True;
  Table.OptionsData.CanInitRecord := False;

  CreateDataSet;
end;

destructor TAppDataChildUretimRezervasyon.Destroy;
begin
  inherited;
  FreeAndNil(TableRunUretimRezervasyon);
end;


procedure TAppDataChildUretimRezervasyon.Execute;
begin
  LoadParams;
  //Table.EmptyTable;
  Table.Active := False;
  //Table.CommandText := GetSQL;
  SetTableParams;
//  Table.Active := True;

end;

procedure TAppDataChildUretimRezervasyon.FSetText(Field: TField;
  const Text: string);
begin
 If Field.Name = 'REZERVASYONMIKTAR' Then
  ShowMessage(Field.NewValue);
end;

function TAppDataChildUretimRezervasyon.GetSQL: String;
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


  function GetSql_UretimRezervasyon :String;
   begin
    SQL.Clear;
    SQL.Add('exec _SpApp_MAMKRT_Expand :EVRAKNO, :SIRA, Null, Null, ' + #39 + 'ListBom' + #39);
    Result := ReplaceStr(SQL.Text, '"', '''');
  end;

begin
  try
    DoStart;
    Result := GetSQL_UretimRezervasyon;
  finally
    DoEnd;
  end;
end;

function TAppDataChildUretimRezervasyon.GetTable: TAppTable;
begin
  Result := TAppTable(inherited GetTable);
end;


procedure TAppDataChildUretimRezervasyon.LoadParams;
begin

end;

procedure TAppDataChildUretimRezervasyon.SetDefaultValues;
begin
  inherited;

end;

procedure TAppDataChildUretimRezervasyon.SetInsertUretimRezervasyon;

begin
{
  Table.Append;

  For I := 0 to TableRunUretimRezervasyon.FieldDefs.Count-1 Do
  begin
    aFieldName := TableRunUretimRezervasyon.Fields[I].FieldName;

        if Table.FieldByName(aFieldName).DataType = ftFloat then
        Table.FieldByName(aFieldName).AsFloat :=TableRunUretimRezervasyon.Fields[I].AsFloat
      else
        Table.FieldByName(aFieldName).Value := TableRunUretimRezervasyon.Fields[I].Value;
   end;

  Table.Post;
  }
end;

procedure TAppDataChildUretimRezervasyon.SetTable(Value: TAppTable);
begin
  inherited SetTable(Value);
end;

procedure TAppDataChildUretimRezervasyon.SetTableParams;
begin
  with Table do
  begin
    Params.ParamByName('EVRAKNO').AsString := FRunEvrakNo;
    Params.ParamByName('SIRA').AsInteger := FRunEvrakSiraNo;
  end;
end;

procedure TAppDataChildUretimRezervasyon.SetValidates;
begin
  inherited;

end;


{ TAppRuleUpdate }

constructor TAppRuleUpdate.Create(AOwner: TAppTable);
begin
  inherited Create;
  FTableUretimRezervasyon := AOwner;
  FTableUretimRezervasyon.DataEvents.AddRule(Self);
  FInUse := False;
end;


constructor TAppRuleUpdate.Create(AOwner: TAppDataChildUretimRezervasyon);
begin
  Create(AOwner.Table);
  FDataChildUretimRezervasyon := AOwner;
end;

destructor TAppRuleUpdate.Destroy;
begin

  inherited;
end;


end.
