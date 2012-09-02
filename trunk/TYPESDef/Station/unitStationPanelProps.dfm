object StationPanelProps: TStationPanelProps
  Left = 66
  Top = 251
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 78
  ClientWidth = 649
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
  object Bevel: TBevel
    Left = 0
    Top = 0
    Width = 649
    Height = 78
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object LabelNumeration: TLabel
    Left = 248
    Top = 6
    Width = 94
    Height = 20
    Caption = #1053#1091#1084#1077#1088#1072#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelNumeration1: TLabel
    Left = 296
    Top = 25
    Width = 10
    Height = 20
    Caption = '--'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object RxLabel5: TRxLabel
    Left = 8
    Top = 8
    Width = 201
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1058#1045#1051#1045#1060#1054#1053#1053#1040#1071' '#1057#1058#1040#1053#1062#1048#1071
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object DBEditName: TDBEdit
    Left = 8
    Top = 25
    Width = 201
    Height = 28
    DataField = 'name'
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = DBEditKeyPress
  end
  object DBEditBegNumber: TDBEdit
    Left = 216
    Top = 25
    Width = 73
    Height = 28
    DataField = 'begnumber'
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnKeyPress = DBEditKeyPress
  end
  object DBEditEndNumber: TDBEdit
    Left = 312
    Top = 25
    Width = 73
    Height = 28
    DataField = 'endnumber'
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnKeyPress = DBEditKeyPress
  end
  object BitBtnMainLines: TBitBtn
    Left = 392
    Top = 8
    Width = 97
    Height = 25
    Caption = #1052#1072#1075#1080#1089#1090#1088#1072#1083#1080' ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtnMainLinesClick
  end
  object BitBtnReports: TBitBtn
    Left = 496
    Top = 8
    Width = 145
    Height = 25
    Caption = #1054#1090#1095#1105#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtnReportsClick
  end
  object BitBtnResource: TBitBtn
    Left = 392
    Top = 32
    Width = 97
    Height = 41
    Caption = #1056#1077#1089#1091#1088#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtnResourceClick
  end
  object BitBtn1: TBitBtn
    Left = 496
    Top = 32
    Width = 73
    Height = 41
    Caption = #1040#1073'. '#1082#1086#1084#1087#1083'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 568
    Top = 32
    Width = 73
    Height = 41
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = BitBtn2Click
    Glyph.Data = {
      76020000424D7602000000000000760000002800000020000000200000000100
      0400000000000002000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F88888888888
      8888888888888888888888888888888878888888888877888888888888888888
      B8888888888700788888888878888888B87887888870000778888888B7878878
      B8C87B888701091008888888CB7C78B7B898B788701100910788888888B8C7BB
      78C87C87019990191088888888C8898BB777CB701999909190888888777C8898
      9BCBB8019999990010888887000B888C8BB88019999999900088888001100BB8
      98BB019999999999088888701999100BCCB01999999999908888880999999910
      0BB000999999990888888809999999999C9BB099999990888888880999999990
      0BC90999999908888888880999999990B9BC0000999088888888880099999999
      0B9B9BB099088788888888880099999990BB9CC090888B888888888888009990
      0BBCCBB00788888888888888878800908CB89C8C8C788878888888887B887709
      C98CB89788C878C888888888B877CCBB8B9CB8897888C87888888888879BBBB8
      B8C8B88C977888B8788888888C8B88BBC8C8C888BBC78887B88888887B8887CB
      8887C88878BB788B88888888BB887988888C8888B88897788888888888879888
      88887888B8888C9788888888888C87888878B888878888CC8888888888887B88
      87B888888C888888888888888888B8888C888888887888888888888888888888
      8888888888B88888888888888888888888888888888888888888}
  end
  object DataSource: TDataSource
  end
end
