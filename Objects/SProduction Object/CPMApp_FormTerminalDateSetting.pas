unit CPMApp_FormTerminalDateSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, ComCtrls, ToolWin, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, cxRadioGroup, ExtCtrls, ImgList,
  dxSkinsCore;

type
  TAppFormTerminalDateSetting = class(TForm)
    ButtonImageList: TcxImageList;
    PanelSettings_TarihSaat: TPanel;
    PanelSettings_CheckManual: TcxRadioButton;
    PanelSettings_CheckManualTarih: TcxDateEdit;
    PanelSettings_CheckSor: TcxRadioButton;
    PanelSettings_CheckOtomatik: TcxRadioButton;
    Panel23: TPanel;
    ToolBar13: TToolBar;
    Panel33: TPanel;
    ToolBar14: TToolBar;
    PanelSettings_ButtonExit: TToolButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AppFormTerminalDateSetting: TAppFormTerminalDateSetting;

implementation

{$R *.dfm}

end.
