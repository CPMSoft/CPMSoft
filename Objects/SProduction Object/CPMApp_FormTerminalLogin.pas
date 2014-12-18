unit CPMApp_FormTerminalLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, cxLabel, cxTextEdit, StdCtrls, cxButtons, ExtCtrls,
  dxSkinsCore;

type
  TAppFormTerminalLogin = class(TFrame)
    pnlLoginMenu: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    btLogin: TcxButton;
    edSicilNo: TcxTextEdit;
    cxLabel15: TcxLabel;
    edtUseNumericPad: TcxButton;
    edtUseBarcode: TcxButton;
    pnlLoginBottom: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
