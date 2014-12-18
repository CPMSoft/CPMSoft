unit CPMApp_DocChildUretimOzelBaglanti;

interface

uses Windows, Messages, SysUtils, Classes, Controls,
  DB, CPMApp_DataObject, CPMApp_DataObjectDB, CPMApp_DocChildSearchTable,
  CPMApp_TableCariSystem,
  CPMApp_DataControllerUretimBaglanti, CPMApp_DocChildEvrakOzelBaglanti;
type

  TAppDocChildUretimOzelBaglanti = class;

  TAppDocChildUretimOzelBaglanti = class(TAppDocChildCustomOzelBaglanti)
  private
  protected
    procedure DoAfterCreate; override;
  public
  published
  end;

implementation

uses CPMApp_DocObjectModel, dxBar, Menus;


{ TAppDocChildUretimOzelBaglanti }

procedure TAppDocChildUretimOzelBaglanti.DoAfterCreate;
var
  Abtn: TdxBarItem;
begin
  OzelBaglantiTip := tobUretim;
  inherited;
  Caption := 'Üretim Özel Baðlantý';
  PipelineName := 'ppUretimOzelBaglanti';
  try
    Abtn := DocObject.IMainForm.BarManager.GetItemByName('btEvrakOzelBaglanti');
    if Assigned(Abtn) then
    begin
      Abtn.Caption := 'Üretim Özel Baðlantý';
      Abtn.ShortCut := TextToShortCut('Ctrl+O');
    end;
  except
  end;
end;

end.
