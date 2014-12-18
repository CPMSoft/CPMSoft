unit CPMApp_DocFormUretimTerminalNumPad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, cxTextEdit,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  ExtCtrls, StdCtrls, cxButtons, cxControls, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue;

type
  TAppDocFormUretimTerminalNumPad = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton6: TcxButton;
    cxButton5: TcxButton;
    cxButton4: TcxButton;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    cxButton10: TcxButton;
    cxButton11: TcxButton;
    pnCaption: TPanel;
    pnlEdit: TPanel;
    edtMiktar: TcxTextEdit;
    btClear: TcxButton;
    Panel3: TPanel;
    btTamam: TcxButton;
    btExit: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btTamamClick(Sender: TObject);
    procedure btClearClick(Sender: TObject);
    procedure btExitClick(Sender: TObject);
    procedure edtMiktarKeyPress(Sender: TObject; var Key: Char);
  private
    FShowEditPanel: Boolean;
    FGlobalTextBox: TcxTextEdit;
    procedure SendValue(Sender: TObject);
    { Private declarations }
  public
    FValue: String;
    property GlobalTextBox: TcxTextEdit read FGlobalTextBox write FGlobalTextBox;
    property ShowEditPanel: Boolean read FShowEditPanel write FShowEditPanel;
    { Public declarations }
  end;

var
  AppDocFormUretimTerminalNumPad: TAppDocFormUretimTerminalNumPad;

implementation

{$R *.dfm}

procedure TAppDocFormUretimTerminalNumPad.btClearClick(Sender: TObject);
begin
  GlobalTextBox.Clear;
end;

procedure TAppDocFormUretimTerminalNumPad.btExitClick(Sender: TObject);
begin
  edtMiktar.Text := '0';
end;

procedure TAppDocFormUretimTerminalNumPad.btTamamClick(Sender: TObject);
begin
  btTamam.Enabled := false;
  Application.ProcessMessages;
  FValue := edtMiktar.Text;
  Self.Close;
end;

procedure TAppDocFormUretimTerminalNumPad.edtMiktarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    btTamamClick(Sender);
end;

procedure TAppDocFormUretimTerminalNumPad.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  Self.Caption := ' ';
  Self.Left := Screen.Width - Self.Width - 150;
  Self.Top := (Screen.Height - Self.Height) div 2;

  for I := 0 to Self.ComponentCount -1 do begin
    if Self.Components[I].ClassType = TcxButton then
      if TcxButton(Self.Components[I]).Tag = 1 then
        TcxButton(Self.Components[I]).OnClick := SendValue;
  end;
end;

procedure TAppDocFormUretimTerminalNumPad.SendValue(Sender: TObject);
begin
  GlobalTextBox.Text := GlobalTextBox.Text + TcxButton(Sender).Caption;
end;

end.
