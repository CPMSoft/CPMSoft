object AppDocFormMessaegeDlg: TAppDocFormMessaegeDlg
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 165
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMessage: TPanel
    Left = 0
    Top = 0
    Width = 528
    Height = 165
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object pnlMessage_Label: TcxLabel
      Left = 0
      Top = 30
      Align = alClient
      AutoSize = False
      Caption = #304#351'lem Tamamland'#305'!'
      ParentColor = False
      ParentFont = False
      Style.Color = clWhite
      Style.Font.Charset = TURKISH_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.WordWrap = True
      Transparent = True
      Height = 102
      Width = 528
      AnchorX = 264
      AnchorY = 81
    end
    object Panel14: TPanel
      Left = 0
      Top = 132
      Width = 528
      Height = 33
      Align = alBottom
      BevelEdges = [beTop]
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        528
        31)
      object pnlMessage_btOK: TcxButton
        Left = 449
        Top = 3
        Width = 75
        Height = 26
        Anchors = [akTop, akRight]
        Caption = 'Tamam'
        Font.Charset = TURKISH_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ModalResult = 1
        ParentFont = False
        TabOrder = 0
        Colors.Default = 15000804
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Office2010Blue'
      end
      object pnlMessage_btClose: TcxButton
        Left = 372
        Top = 3
        Width = 71
        Height = 26
        Anchors = [akTop, akRight]
        Caption = #199#305'k'#305#351
        Font.Charset = TURKISH_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ModalResult = 1
        ParentFont = False
        TabOrder = 1
        Visible = False
        Colors.Default = 15000804
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Office2010Blue'
      end
    end
    object pnlMessage_Title: TPanel
      Left = 0
      Top = 0
      Width = 528
      Height = 30
      Align = alTop
      Color = 13041663
      TabOrder = 2
      object cxLabel23: TcxLabel
        Left = 1
        Top = 1
        Align = alClient
        Caption = 'Bilgi'
        ParentColor = False
        ParentFont = False
        Style.Color = clBlack
        Style.Font.Charset = TURKISH_CHARSET
        Style.Font.Color = clWhite
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        AnchorY = 15
      end
    end
  end
end
