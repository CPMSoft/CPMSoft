object AppFormOperasyonMenu: TAppFormOperasyonMenu
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'AppFormOperasyonMenu'
  ClientHeight = 123
  ClientWidth = 617
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
  object Shape11: TShape
    Left = 181
    Top = 40
    Width = 1
    Height = 70
    Brush.Color = 15508062
    Pen.Color = 15000804
  end
  object Shape13: TShape
    Left = 111
    Top = 40
    Width = 1
    Height = 73
    Pen.Color = 12829635
  end
  object Shape15: TShape
    Left = 324
    Top = 41
    Width = 1
    Height = 73
    Pen.Color = 12829635
  end
  object Shape1: TShape
    Left = 0
    Top = 32
    Width = 617
    Height = 91
    Align = alClient
    ExplicitLeft = 292
    ExplicitTop = 44
    ExplicitWidth = 65
    ExplicitHeight = 65
  end
  object btKaynakIslemBitir: TcxButton
    Tag = 1
    Left = 332
    Top = 41
    Width = 95
    Height = 72
    Caption = 'Bitir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    WordWrap = True
    OnClick = btKaynakIslemBitirClick
    Colors.Default = 13041663
    Layout = blGlyphTop
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = 'Office2010Blue'
  end
  object Panel16: TPanel
    Left = 0
    Top = 0
    Width = 617
    Height = 32
    Align = alTop
    Color = 8404992
    TabOrder = 1
    ExplicitLeft = -373
    ExplicitTop = 2
    ExplicitWidth = 1015
    object cxLabel23: TcxLabel
      Left = 1
      Top = 1
      Align = alClient
      Caption = #304#351'leminizi Belirtin.'
      ParentColor = False
      ParentFont = False
      Style.Color = clRed
      Style.Font.Charset = TURKISH_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clWhite
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitWidth = 1013
      AnchorX = 309
      AnchorY = 16
    end
  end
  object btKaynakIslemHata: TcxButton
    Left = 219
    Top = 41
    Width = 93
    Height = 32
    Caption = 'Hata'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
    OnClick = btKaynakIslemHataClick
    Colors.Default = 14017279
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = 'Office2010Blue'
  end
  object btKaynakIslemDurus: TcxButton
    Left = 120
    Top = 41
    Width = 93
    Height = 32
    Caption = 'Duru'#351
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 3
    OnClick = btKaynakIslemDurusClick
    Colors.Default = 14017279
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = 'Office2010Blue'
  end
  object btKaynakIslemBaslat: TcxButton
    Tag = 2
    Left = 9
    Top = 41
    Width = 95
    Height = 72
    Caption = 'Ba'#351'lat'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 4
    WordWrap = True
    OnClick = btKaynakIslemBaslatClick
    Colors.Default = 13041095
    Layout = blGlyphTop
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = 'Office2010Blue'
  end
  object cxButton16: TcxButton
    Tag = 99
    Left = 527
    Top = 40
    Width = 77
    Height = 73
    Caption = 'Vazge'#231
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 5
    Colors.Default = 15000804
    Layout = blGlyphTop
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = 'Office2010Blue'
  end
  object btKaynakIslemMalzemeTuketim: TcxButton
    Left = 120
    Top = 81
    Width = 192
    Height = 32
    Caption = 'Malzeme T'#252'ketimi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 6
    OnClick = btKaynakIslemMalzemeTuketimClick
    Colors.Default = 15976350
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = 'Office2010Blue'
  end
  object btKaynakIslemGeriAl: TcxButton
    Tag = 99
    Left = 435
    Top = 40
    Width = 84
    Height = 73
    Caption = 'Operasyonu S'#305'f'#305'rla'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 7
    WordWrap = True
    OnClick = btKaynakIslemGeriAlClick
    Colors.Default = 15000804
    Layout = blGlyphTop
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = 'Office2010Blue'
  end
end
