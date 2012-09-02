object CrossPanelProps: TCrossPanelProps
  Left = 250
  Top = 149
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 167
  ClientWidth = 325
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
    Width = 325
    Height = 167
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object RxLabel5: TRxLabel
    Left = 28
    Top = 24
    Width = 81
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1050#1056#1054#1057#1057
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
    Top = 46
    Width = 121
    Height = 28
    DataField = 'name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object BitBtnMainLines: TBitBtn
    Left = 136
    Top = 4
    Width = 105
    Height = 29
    Caption = #1052#1072#1075#1080#1089#1090#1088#1072#1083#1080' ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtnMainLinesClick
  end
  object BitBtnResource: TBitBtn
    Left = 136
    Top = 36
    Width = 105
    Height = 29
    Caption = #1056#1077#1089#1091#1088#1089#1099' ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtnResourceClick
  end
  object bbStartCrossIOperator: TBitBtn
    Left = 136
    Top = 68
    Width = 105
    Height = 29
    Caption = #1054#1055#1045#1056#1040#1058#1054#1056
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = bbStartCrossIOperatorClick
  end
  object bbSearch: TBitBtn
    Left = 136
    Top = 100
    Width = 105
    Height = 29
    Caption = #1055#1054#1048#1057#1050'...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = bbSearchClick
  end
  object bbStatistics: TBitBtn
    Left = 136
    Top = 132
    Width = 105
    Height = 29
    Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = bbStatisticsClick
  end
end
