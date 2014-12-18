unit CPMApp_DocFormOperasyonMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, cxLabel, ExtCtrls, StdCtrls, cxButtons;

type
  TAppDocFormOperasyonMenu = class(TForm)
    Shape11: TShape;
    Shape13: TShape;
    Shape15: TShape;
    btKaynakIslemBitir: TcxButton;
    Panel16: TPanel;
    cxLabel23: TcxLabel;
    btKaynakIslemHata: TcxButton;
    btKaynakIslemDurus: TcxButton;
    btKaynakIslemBaslat: TcxButton;
    cxButton16: TcxButton;
    btKaynakIslemMalzemeTuketim: TcxButton;
    btKaynakIslemGeriAl: TcxButton;
    Shape1: TShape;
    procedure btKaynakIslemBaslatClick(Sender: TObject);
    procedure btKaynakIslemDurusClick(Sender: TObject);
    procedure btKaynakIslemHataClick(Sender: TObject);
    procedure btKaynakIslemMalzemeTuketimClick(Sender: TObject);
    procedure btKaynakIslemBitirClick(Sender: TObject);
    procedure btKaynakIslemGeriAlClick(Sender: TObject);
    procedure cxButton16Click(Sender: TObject);
  private
    FParam: String;
    { Private declarations }
  public
  property Param: String read FParam write FParam;
    { Public declarations }
  end;

var
  AppDocFormOperasyonMenu: TAppDocFormOperasyonMenu;

implementation

{$R *.dfm}

procedure TAppDocFormOperasyonMenu.btKaynakIslemBaslatClick(
  Sender: TObject);
begin
  Param := 'DoStartOperasyon';
end;

procedure TAppDocFormOperasyonMenu.btKaynakIslemBitirClick(
  Sender: TObject);
begin
  Param := 'DoFinishOperasyon';
end;

procedure TAppDocFormOperasyonMenu.btKaynakIslemDurusClick(
  Sender: TObject);
begin
  if btKaynakIslemDurus.Tag = 0 then
    Param := 'DoStartDurus'
  else if btKaynakIslemDurus.Tag = 1 then
    Param := 'DoFinishDurus';
end;

procedure TAppDocFormOperasyonMenu.btKaynakIslemGeriAlClick(
  Sender: TObject);
begin
  Param := 'DoNothing';
end;

procedure TAppDocFormOperasyonMenu.btKaynakIslemHataClick(
  Sender: TObject);
begin
  Param := 'DoAddHata';
end;

procedure TAppDocFormOperasyonMenu.btKaynakIslemMalzemeTuketimClick(
  Sender: TObject);
begin
  Param := 'DoStartHammaddeTuketimForOperasyon';
end;

procedure TAppDocFormOperasyonMenu.cxButton16Click(Sender: TObject);
begin
  Param := '';
end;

end.
