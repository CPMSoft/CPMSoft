unit CPMApp_DocChildUretimIslemSira;

interface

uses
  ComCtrls,
  CPMApp_Storage,
  CPMApp_DocObjectModel,
  CPMApp_DocChildSearchTable;

type
  TAppDocChildUretimIslemSira = class;

  TAppDocChildUretimIslemSira = class(TAppDocChildSearchTable)
  private
    FButton: TToolButton;
    procedure btMoveDownOnClick(Sender: TObject);
    procedure btMoveUpOnClick(Sender: TObject);
    procedure MoveDown;
    procedure MoveUp;
    procedure CreateToolBarItems;
  protected
    procedure AfterCreate; override;
  public
    procedure Initialize(IniFile: TAppIniFile); override;
    procedure DesktopAfterRestore(Desktop: TAppDocDesktop); override;
    destructor Destroy; override;
  published
  end;

  implementation

uses
  DB,
  Variants,
  CPMApp_Images,
  CPMApp_ToolBarHelper,
  CPMApp_TableItems,
  CPMApp_DataObject,
  CPMApp_BOMConsts;

{ TAppDocChildUretimIslemSira }

procedure TAppDocChildUretimIslemSira.AfterCreate;
begin
  inherited;
  Self.Name := 'DocChildUretimIslemSira';
  Self.Caption := 'Üretim Kart Ýþlem Sýra';
  Self.PipelineName := 'pp' + Self.Name;
  Self.Table.TableItems.TableNames := VarArrayOf(['URTKRT', 'STKKRT']);
  Self.Table.TableItems.TableCaptions := VarArrayOf(['Üretim Kart', '!']);
  Self.Table.TableItems.OrderBy.Add('URETIMSN');
  Self.DockPanel.ImageIndex := Integer(aiStokIzleyici);

  with Self.Table.TableItems[0] do begin
    with Fields do begin
      Clear;
      Add('*')
    end;
    with Where do begin
      Clear;
      Add('URETIMDURUM', wcInList, VarArrayOf([udFirmPlanned, udReleased])).DataType := ftInteger;
    end;
  end;

  with Self.Table.TableItems[1] do begin
    with Fields do begin
      Clear;
      Add('MALAD');
    end;
    with Join do begin
      Clear;
      Add('MALKOD', 'MAMULKOD');
    end;
  end;
  Self.ReadOnly := false;
  CreateToolBarItems;
end;

procedure TAppDocChildUretimIslemSira.MoveUp;
var
  SelfRecId, PriorRecId: Integer;
  SelfUretimSiraNo, PriorUretimSiraNo: Integer;
begin
  if Self.Table.IsEmpty then
    exit;

  Self.Table.DisableControls;

  SelfRecId := Self.Table.FieldValues['ID'];
  SelfUretimSiraNo := Self.Table.FieldValues['URETIMSN'];

  Self.Table.Prior;
  PriorRecId := Self.Table.FieldValues['ID'];
  PriorUretimSiraNo := Self.Table.FieldValues['URETIMSN'];

  try
    if (Self.Table.Locate('ID', PriorRecId, [])) then
    begin
      Self.Table.Edit;
      Self.Table.FieldValues['URETIMSN'] := SelfUretimSiraNo;
      Self.Table.Post;
    end;
    if (Self.Table.Locate('ID', SelfRecId, [])) then
    begin
      Self.Table.Edit;
      Self.Table.FieldValues['URETIMSN'] := PriorUretimSiraNo;
      Self.Table.Post;
    end;
  finally
    Self.Table.ApplyUpdates(0);
    Self.Run;
    Self.Table.Locate('URETIMSN', PriorUretimSiraNo, []);
    Self.Table.EnableControls;
  end;
end;

procedure TAppDocChildUretimIslemSira.MoveDown;
var
  SelfRecId, NextRecId: Integer;
  SelfUretimSiraNo, NextUretimSiraNo: Integer;
begin
  if Self.Table.IsEmpty then
    exit;

  Self.Table.DisableControls;

  SelfRecId := Self.Table.FieldValues['ID'];
  SelfUretimSiraNo := Self.Table.FieldValues['URETIMSN'];

  Self.Table.Next;
  NextRecId := Self.Table.FieldValues['ID'];
  NextUretimSiraNo := Self.Table.FieldValues['URETIMSN'];

  Self.GridView.OptionsBehavior.PullFocusing := true;
  try
    if (Self.Table.Locate('ID', NextRecId, [])) then
    begin
      Self.Table.Edit;
      Self.Table.FieldValues['URETIMSN'] := SelfUretimSiraNo;
      Self.Table.Post;
    end;
    if (Self.Table.Locate('ID', SelfRecId, [])) then
    begin
      Self.Table.Edit;
      Self.Table.FieldValues['URETIMSN'] := NextUretimSiraNo;
      Self.Table.Post;
    end;
  finally
    Self.Table.ApplyUpdates(0);
    Self.Run;
    Self.Table.Locate('URETIMSN', NextUretimSiraNo, []);
    Self.Table.EnableControls;
  end;
end;

procedure TAppDocChildUretimIslemSira.btMoveUpOnClick(Sender: TObject);
begin
  MoveUp;
end;

procedure TAppDocChildUretimIslemSira.btMoveDownOnClick(Sender: TObject);
begin
  MoveDown;
end;

procedure TAppDocChildUretimIslemSira.CreateToolBarItems;
begin
  FButton := AppToolBarHelper.Add(Self.ToolBar, 'btUretimSnMoveDown', 'Aþaðý Taþý', 'Aþaðý Taþý', Integer(aiDown), btMoveDownOnClick, nil, nil);
  FButton := AppToolBarHelper.Add(Self.ToolBar, 'btUretimSnMoveUp', 'Yukarý Taþý', 'Yukarý Taþý', Integer(aiUp), btMoveUpOnClick, nil, nil);
end;

procedure TAppDocChildUretimIslemSira.DesktopAfterRestore(
  Desktop: TAppDocDesktop);
begin
  inherited;
  Self.ToolBar.ShowCaptions := true;
end;

destructor TAppDocChildUretimIslemSira.Destroy;
begin
  inherited;
end;

procedure TAppDocChildUretimIslemSira.Initialize(IniFile: TAppIniFile);
begin
  inherited;
end;

end.
