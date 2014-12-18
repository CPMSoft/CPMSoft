object FormYenidenMaliyetlendirme: TFormYenidenMaliyetlendirme
  Left = 302
  Top = 247
  Caption = 'Yeniden Maliyetlendirme'
  ClientHeight = 482
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object NavBar: TdxNavBar
    Left = 0
    Top = 0
    Width = 209
    Height = 482
    Align = alLeft
    ActiveGroupIndex = 0
    TabOrder = 0
    View = 13
    object NavBarGroupDevir: TdxNavBarGroup
      Caption = 'Yeniden Maliyetlendirme'
      LargeImageIndex = 0
      SelectedLinkIndex = -1
      SmallImageIndex = 0
      TopVisibleLinkIndex = 0
      UseSmallImages = False
      OptionsGroupControl.ShowControl = True
      OptionsGroupControl.UseControl = True
      Links = <>
    end
    object NavBarGroupDevirControl: TdxNavBarGroupControl
      Left = 1
      Top = 26
      Width = 207
      Height = 369
      TabOrder = 0
      UseStyle = True
      DesignSize = (
        207
        369)
      GroupIndex = 0
      OriginalHeight = 369
      object btStart: TcxButton
        Left = 4
        Top = 335
        Width = 81
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Ba'#351'lat'
        TabOrder = 18
        OnClick = btStartClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FF004B98004D9C0052A60052A6004D9C004B98FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004E9E0052A6005EBE0062C600
          65CC0065CC0064CA005FC00053A8004B98FF00FFFF00FFFF00FFFF00FFFF00FF
          0051A4005DBC0069D40069D40067D00064CA0065CC0066CE0067D0006AD6005D
          BC004C9AFF00FFFF00FFFF00FF0052A6005EBE0068D20064CA0072E681BFFF11
          87FF0063C80064CA0065CC0065CC0069D4005CBA004B98FF00FFFF00FF0057B0
          0068D20066CE0064CA006EDEC7E3FFE5F2FF2390FF0063C80064CA0065CC0065
          CC006AD60052A6FF00FF1E7AD80064CA006EDE0071E40070E20074EABFDFFFFF
          FFFFEBF5FF53A8FF0064CA0063C80065CC0067D0005FC0004C9A1E7CDC0073E8
          007DFC0581FF0380FF0983FFC5E2FFFFFFFFFFFFFFFFFFFF83C0FF006CDA0063
          C80066CE0064CA004C9A1E80E41388FF2591FF218FFF1F8EFF2591FFCBE5FFFF
          FFFFFFFFFFFFFFFFFFFFFFB3D9FF0073E80064CA0066CE004C9A1E82E843A0FF
          61AFFF3F9EFF3F9EFF43A0FFD3E9FFFFFFFFFFFFFFFFFFFFFFFFFF97CAFF0071
          E40064CA0066CE004E9E1E7CDC4FA6FF9BCCFF61AFFF5BACFF5DADFFD7EBFFFF
          FFFFFFFFFFFDFEFF6BB4FF0066CE0063C80066CE0065CC004C9A1E7DDE2B94FF
          BDDEFFA1CFFF7BBCFF75B9FFDBEDFFFFFFFFE5F2FF55A9FF0069D40064CA0065
          CC0067D0005FC0004C9AFF00FF006DDCA1CFFFDDEEFFA9D3FF7FBEFFE5F2FFDF
          EFFF43A0FF007AF60072E60066CE0064CA006AD60051A4FF00FFFF00FF1E7CDC
          2591FFC7E3FFE3F1FFB1D8FFB5DAFF55A9FF1187FF0380FF0074EA0069D40069
          D4005BB8004E9EFF00FFFF00FFFF00FF207EDF2390FFB1D8FFDDEEFFC5E2FF99
          CBFF73B8FF59ABFF3398FF0079F4005BB80052A6FF00FFFF00FFFF00FFFF00FF
          FF00FF207DDD0071E4419FFF7DBDFF97CAFF83C0FF4DA5FF007CFA005AB60051
          A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1F7DDE1F84EC1F
          86F01F81E61F7EE01F7AD8FF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object lblMaliyetTip: TcxLabel
        Left = 3
        Top = 80
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Maliyet Tipi:'
        Transparent = True
        Height = 21
        Width = 59
      end
      object edMaliyetTip: TcxImageComboBox
        Left = 68
        Top = 80
        Anchors = [akLeft, akTop, akRight]
        EditValue = 3
        Properties.Items = <
          item
            Description = 'FIFO - '#304'lk Giren '#304'lk '#199#305'kar'
            ImageIndex = 0
            Value = 3
          end
          item
            Description = 'YABO - Y'#252'r'#252'yen A'#287#305'rl'#305'kl'#305' Bakiye Ortalama'
            Value = 9
          end>
        TabOrder = 2
        Width = 134
      end
      object lblBasTarih: TcxLabel
        Left = 3
        Top = 128
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Ba'#351'. Tarihi:'
        Transparent = True
        Height = 21
        Width = 59
      end
      object edBasTarih: TcxDateEdit
        Left = 68
        Top = 128
        Anchors = [akLeft, akTop, akRight]
        Properties.ImmediatePost = True
        TabOrder = 4
        Width = 134
      end
      object lblBitTarih: TcxLabel
        Left = 3
        Top = 152
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Biti'#351' Tarihi:'
        Transparent = True
        Height = 21
        Width = 59
      end
      object edBitTarih: TcxDateEdit
        Left = 68
        Top = 152
        Anchors = [akLeft, akTop, akRight]
        Properties.ImmediatePost = True
        TabOrder = 5
        Width = 134
      end
      object edKirilimTip: TcxImageComboBox
        Left = 3
        Top = 236
        Anchors = [akLeft, akTop, akRight]
        EditValue = 0
        Properties.Items = <
          item
            Description = 'Yok'
            ImageIndex = 0
            Value = 0
          end
          item
            Description = 'Depo Baz'#305'nda'
            Value = 1
          end>
        TabOrder = 7
        Width = 199
      end
      object edSQLString: TcxTextEdit
        Left = 3
        Top = 309
        Anchors = [akLeft, akTop, akRight]
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        TabOrder = 11
        Width = 199
      end
      object lblSQLString: TcxLabel
        Left = 4
        Top = 291
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'SQL'
        Transparent = True
        Height = 21
        Width = 38
      end
      object lblGuncellemeTip: TcxLabel
        Left = 3
        Top = 4
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Amac'#305':'
        Transparent = True
        Height = 21
        Width = 59
      end
      object edGuncellemeTip: TcxImageComboBox
        Left = 68
        Top = 4
        Anchors = [akLeft, akTop, akRight]
        EditValue = 0
        Properties.Items = <
          item
            Description = 'Maliyetlendirme'
            ImageIndex = 0
            Value = 0
          end
          item
            Description = 'Kapatma'
            Value = 1
          end
          item
            Description = 'Maliyetlendirme (Full)'
            Value = 2
          end>
        Properties.OnChange = edGuncellemeTipPropertiesChange
        TabOrder = 0
        Width = 134
      end
      object edKirilimSeriNo: TcxImageComboBox
        Left = 3
        Top = 259
        Anchors = [akLeft, akTop, akRight]
        EditValue = 0
        Properties.Items = <
          item
            Description = 'Yok'
            ImageIndex = 0
            Value = 0
          end
          item
            Description = 'Seri No Baz'#305'nda'
            Value = 1
          end
          item
            Description = 'Seri No + Seri No 2 Baz'#305'nda'
            Value = 2
          end>
        TabOrder = 8
        Width = 199
      end
      object lblKirilimTip: TcxLabel
        Left = 3
        Top = 198
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = #199'al'#305#351'ma '#350'ekli'
        Transparent = True
        Height = 21
        Width = 199
      end
      object edKirilimVersiyonNo: TcxImageComboBox
        Left = 3
        Top = 214
        Anchors = [akLeft, akTop, akRight]
        EditValue = 0
        Properties.Items = <
          item
            Description = 'Yok'
            ImageIndex = 0
            Value = 0
          end
          item
            Description = 'Versiyon Baz'#305'nda'
            Value = 1
          end>
        TabOrder = 6
        Width = 199
      end
      object lblMYBasTarih: TcxLabel
        Left = 3
        Top = 104
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Mali Y'#305'l Ba'#351'.:'
        Transparent = True
        Height = 21
        Width = 59
      end
      object edMYBasTarih: TcxDateEdit
        Left = 68
        Top = 104
        Anchors = [akLeft, akTop, akRight]
        Properties.ImmediatePost = True
        TabOrder = 3
        Width = 134
      end
      object lblDefterTip: TcxLabel
        Left = 3
        Top = 28
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Defter Tipi:'
        Transparent = True
        Height = 21
        Width = 59
      end
      object edDefterTip: TcxImageComboBox
        Left = 68
        Top = 28
        Anchors = [akLeft, akTop, akRight]
        EditValue = 0
        Properties.Items = <
          item
            Description = '0- Ana Defter'
            ImageIndex = 0
            Value = 0
          end
          item
            Description = '1- TFRS Uyum Defteri'
            Value = 1
          end
          item
            Description = '2- IFRS Uyum Defteri'
            Value = 2
          end
          item
            Description = '3- USGAAP Uyum Defteri'
            Value = 3
          end>
        TabOrder = 1
        Width = 134
      end
    end
  end
  object Panel1: TPanel
    Left = 209
    Top = 0
    Width = 509
    Height = 482
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel2: TPanel
      Left = 0
      Top = 193
      Width = 509
      Height = 16
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object cxLabel1: TcxLabel
        Left = 0
        Top = -1
        Caption = 'Sonu'#231':'
      end
    end
    object cxGrid: TcxGrid
      Left = 0
      Top = 235
      Width = 509
      Height = 247
      Align = alClient
      TabOrder = 1
      object GridViewResult: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DataSource1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGridLevel1: TcxGridLevel
        GridView = GridViewResult
      end
    end
    object DBFilterControl: TcxDBFilterControl
      Left = 0
      Top = 16
      Width = 509
      Height = 177
      Align = alTop
      Items = <>
      FilterOptions.DateTimeFormat = 'yyyymmdd hh:mm:ss'
      PopupMenu = PopupMenu1
      TabOrder = 2
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 509
      Height = 16
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object cxLabel2: TcxLabel
        Left = 0
        Top = 0
        Caption = 'Stok Kart Kriteri:'
      end
    end
    object PanelGridBar: TPanel
      Left = 0
      Top = 209
      Width = 509
      Height = 26
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 4
      Visible = False
    end
  end
  object DataSource1: TDataSource
    Left = 285
    Top = 140
  end
  object ActionList1: TActionList
    Left = 361
    Top = 132
    object cmSearch: TAction
      Caption = 'Arama Yap'
      ShortCut = 120
      OnExecute = cmSearchExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 425
    Top = 120
    object AramaYap1: TMenuItem
      Action = cmSearch
    end
  end
end
