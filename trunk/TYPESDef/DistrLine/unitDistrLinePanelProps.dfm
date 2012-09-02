object DistrLinePanelProps: TDistrLinePanelProps
  Left = 74
  Top = 190
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 83
  ClientWidth = 484
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
    Width = 484
    Height = 83
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object LabelOwner: TRxLabel
    Left = 209
    Top = 11
    Width = 265
    Height = 17
    AutoSize = False
    Caption = #1057#1054#1041#1057#1058#1042#1045#1053#1053#1048#1050
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object RxLabel5: TRxLabel
    Left = 4
    Top = 11
    Width = 149
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1056#1040#1057#1055#1056#1045#1044#1045#1051#1045#1053#1048#1045
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object DBEditNumber: TDBEdit
    Left = 152
    Top = 6
    Width = 57
    Height = 28
    DataField = 'number'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DBEditDescr: TDBEdit
    Left = 8
    Top = 44
    Width = 241
    Height = 28
    DataField = 'descr'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object BitBtnResource: TBitBtn
    Left = 256
    Top = 40
    Width = 105
    Height = 33
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
  object BitBtnDamages: TBitBtn
    Left = 368
    Top = 40
    Width = 105
    Height = 17
    Caption = #1055#1086#1074#1088#1077#1078#1076#1077#1085#1080#1103' ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtnDamagesClick
  end
  object BitBtnEventLog: TBitBtn
    Left = 368
    Top = 56
    Width = 105
    Height = 17
    Caption = #1057#1086#1073#1099#1090#1080#1103' ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtnEventLogClick
  end
end
