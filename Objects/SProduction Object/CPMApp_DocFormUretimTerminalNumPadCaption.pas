unit CPMApp_DocFormUretimTerminalNumPadCaption;

interface

uses
  CPMApp_DocApp, DB, 

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, cxTextEdit, StdCtrls, cxButtons, ExtCtrls, cxStyles,
  cxInplaceContainer, cxVGrid, cxSplitter, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TAppDocFormUretimTerminalNumPadCaption = class(TForm)
    Panel_MalzemeTuketim: TPanel;
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
    Panel5: TPanel;
    cxSplitter1: TcxSplitter;
    procedure btExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btClearClick(Sender: TObject);
    procedure btTamamClick(Sender: TObject);
  private
    FDocApp: TAppDocApp;
    FGlobalTextBox: TcxTextEdit;
  private
    procedure SendValue(Sender: TObject);
    { Private declarations }
  public
    constructor Create(AOwner: TAppDocApp); reintroduce;
    property GlobalTextBox: TcxTextEdit read FGlobalTextBox write FGlobalTextBox;
    property DocApp: TAppDocApp read FDocApp write FDocApp;
  end;

var
  AppDocFormUretimTerminalNumPadCaption: TAppDocFormUretimTerminalNumPadCaption;

implementation

uses
  CPMApp_DOPUretimTerminalVeriGiris;

{$R *.dfm}

procedure TAppDocFormUretimTerminalNumPadCaption.btClearClick(Sender: TObject);
begin
  GlobalTextBox.Clear;
end;

procedure TAppDocFormUretimTerminalNumPadCaption.btExitClick(Sender: TObject);
begin
  edtMiktar.Text := '0';
end;

procedure TAppDocFormUretimTerminalNumPadCaption.btTamamClick(Sender: TObject);
begin
  if (edtMiktar.Text = '') then
  begin
    TAppDOPUretimTerminalVeriGiris(DocApp).DocCustomProperties.AppForms.AppFormMessageDialog('Miktar girmeden devam edemezsiniz!');
    edtMiktar.SetFocus;
    Exit;
  end;

  if TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.UpdateStatus in [usModified, usInserted] then
  begin
//    TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.Edit;
    TAppDOPUretimTerminalVeriGiris(DocApp).ChildUretimTerminalMalzemeBilgileriGiris.TableMalzemeTuketimBilgileri.ApplyUpdates(0);
  end;

  btTamam.Enabled := false;
  Application.ProcessMessages;
  Self.Close;
end;

constructor TAppDocFormUretimTerminalNumPadCaption.Create(AOwner: TAppDocApp);
begin
  Inherited Create(Application);
  FDocApp := AOwner;
end;

procedure TAppDocFormUretimTerminalNumPadCaption.FormCreate(Sender: TObject);
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

procedure TAppDocFormUretimTerminalNumPadCaption.SendValue(Sender: TObject);
begin
  GlobalTextBox.Text := GlobalTextBox.Text + TcxButton(Sender).Caption;
end;


end.
