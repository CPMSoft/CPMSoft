unit CPMApp_FormTerminalIslemButton;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, ExtCtrls, dxSkinsCore;

type
  TAppFormTerminalIslemButton = class(TFrame)
    PanelMekanikSarfYontemTuketimMenu: TPanel;
    Shape16: TShape;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
