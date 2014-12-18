unit CPMApp_DocFormMessageDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, cxLabel, ExtCtrls;

type
  TAppDocFormMessaegeDlg = class(TForm)
    pnlMessage: TPanel;
    pnlMessage_Label: TcxLabel;
    Panel14: TPanel;
    pnlMessage_btOK: TcxButton;
    pnlMessage_btClose: TcxButton;
    pnlMessage_Title: TPanel;
    cxLabel23: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AppDocFormMessaegeDlg: TAppDocFormMessaegeDlg;

implementation

{$R *.dfm}

end.
