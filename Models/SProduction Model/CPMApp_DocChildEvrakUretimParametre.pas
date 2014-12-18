unit CPMApp_DocChildEvrakUretimParametre;

interface

uses Classes, DB,
  CPMApp_DocChildParametre, CPMApp_DataControllerEvrakUretim;

type

  TAppDocChildEvrakUretimParametre = class(TAppDocChildParametre)
  private
    FControllerUretim: TAppDataControllerEvrakUretim;
    procedure PrepareParametre;
    procedure SaveParams;
    procedure SaveParamsClick(Sender: TObject);
    procedure SetControllerUretim(const Value: TAppDataControllerEvrakUretim);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ControllerUretim: TAppDataControllerEvrakUretim read FControllerUretim write SetControllerUretim;
  end;

implementation

uses
  Variants,
  dxBar,
  CPMApp_Dialogs,
  CPMApp_Images,
  CPMApp_ToolBarHelper,
  CPMApp_FieldProp,
  CPMApp_DocObjectModel;

{ TAppDocChildEvrakUretimParametre }

constructor TAppDocChildEvrakUretimParametre.Create(AOwner: TComponent);
begin
  inherited;
  PrepareParametre;
end;

procedure TAppDocChildEvrakUretimParametre.PrepareParametre;
begin
  AddField('BAGLANTIIZIN', ftInteger);
  AddField('RECETEGUNCELLEMETIP', ftInteger);
  AddField('KULLANICIRECETEKORU', ftInteger);
  TableObject.DataSet.TableItems.TableNames := VarArrayOf(['URTSPR']);
  TableObject.DataSet.TableItems.TableCaptions := 'Üretim Paremetreleri';

  if not AppFieldProp.TableDef.FindKey(['URTSPR']) then
  begin
    AppFieldProp.TableDef.Add('URTSPR', 'Üretim Parametre');

    AppFieldProp.FieldDef.Add('URTSPR', 'BAGLANTIIZIN', 'Baðlantý Deðiþtirilebilir', fdtImageComboBox);
    AppFieldProp.FieldRef.Add('URTSPR', 'BAGLANTIIZIN', '0', 'Hayýr');
    AppFieldProp.FieldRef.Add('URTSPR', 'BAGLANTIIZIN', '1', 'Evet');

    AppFieldProp.FieldDef.Add('URTSPR', 'RECETEGUNCELLEMETIP', 'Reçete Güncelleme Tipi', fdtImageComboBox);
    AppFieldProp.FieldRef.Add('URTSPR', 'RECETEGUNCELLEMETIP', '0', '0-Tamamen Yenile');
    AppFieldProp.FieldRef.Add('URTSPR', 'RECETEGUNCELLEMETIP', '1', '1-Deðiþenleri Güncelle');

    AppFieldProp.FieldDef.Add('URTSPR', 'KULLANICIRECETEKORU', 'Kullanýcý Reçetelerini Koru', fdtImageComboBox);
    AppFieldProp.FieldRef.Add('URTSPR', 'KULLANICIRECETEKORU', '0', '0-Hayýr');
    AppFieldProp.FieldRef.Add('URTSPR', 'KULLANICIRECETEKORU', '1', '1-Evet');
    AppFieldProp.FieldRef.Add('URTSPR', 'KULLANICIRECETEKORU', '2', '2-Sor');
  end;

  AppToolBarHelper.Add(ToolBar, 'btSaveParams', 'Kaydet', 'Parametreleri Uygula', Integer(aiSave), SaveParamsClick);
end;

procedure TAppDocChildEvrakUretimParametre.SaveParams;
begin
  FControllerUretim.RefreshBOMExplosion;
  AppShowMessage('Üretim Kalemleri Güncellendi!');
end;

procedure TAppDocChildEvrakUretimParametre.SaveParamsClick(Sender: TObject);
begin
  SaveParams;
end;

procedure TAppDocChildEvrakUretimParametre.SetControllerUretim(
  const Value: TAppDataControllerEvrakUretim);
begin
  FControllerUretim := Value;
  FControllerUretim.Params.TableParams := TableObject;
end;

end.
