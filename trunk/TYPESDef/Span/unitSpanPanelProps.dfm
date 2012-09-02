object SpanPanelProps: TSpanPanelProps
  Left = 70
  Top = 200
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 65
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelType: TLabel
    Left = 8
    Top = 24
    Width = 65
    Height = 20
    Caption = #1055#1088#1086#1083#1105#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelLength: TLabel
    Left = 128
    Top = 24
    Width = 53
    Height = 20
    Caption = #1044#1083#1080#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelNumCnls: TLabel
    Left = 280
    Top = 24
    Width = 69
    Height = 20
    Caption = #1050#1072#1085#1072#1083#1086#1074':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel: TBevel
    Left = 0
    Top = 0
    Width = 681
    Height = 65
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object DBEditLength: TDBEdit
    Left = 192
    Top = 22
    Width = 81
    Height = 28
    DataField = 'length'
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DBEditNumCnls: TDBEdit
    Left = 360
    Top = 22
    Width = 49
    Height = 28
    DataField = 'numcnls'
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object FormChanels: TPanel
    Left = 512
    Top = 8
    Width = 153
    Height = 49
    Caption = ' '
    TabOrder = 2
    Visible = False
    object FormChanels_Descr: TLabel
      Left = 16
      Top = 3
      Width = 121
      Height = 13
      Caption = #1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1082#1072#1085#1072#1083#1086#1074
    end
    object FormChanels_NumCh: TLabel
      Left = 8
      Top = 24
      Width = 38
      Height = 13
      Caption = #1063#1080#1089#1083#1086': '
    end
    object BitBtnFormChanels_Form: TBitBtn
      Left = 96
      Top = 18
      Width = 41
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 1
      OnClick = BitBtnFormChanels_FormClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object EditChanels_NumCh: TEdit
      Left = 48
      Top = 21
      Width = 33
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = 'EditChanels_NumCh'
    end
  end
  object DataSource: TDataSource
  end
end
