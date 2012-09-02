object MainLinePanelProps: TMainLinePanelProps
  Left = 90
  Top = 249
  BorderStyle = bsNone
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072
  ClientHeight = 151
  ClientWidth = 515
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
    Width = 515
    Height = 151
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object LabelDpndStrips: TLabel
    Left = 8
    Top = 80
    Width = 103
    Height = 20
    Caption = #1043#1088'. '#1087#1086#1083#1086#1089#1099': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelPanelCases: TLabel
    Left = 8
    Top = 112
    Width = 154
    Height = 20
    Caption = #1042#1093#1086#1076#1080#1090' '#1074' '#1096#1082#1072#1092#1099': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelOwner: TRxLabel
    Left = 176
    Top = 11
    Width = 329
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
    Width = 109
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1052#1040#1043#1048#1057#1058#1056#1040#1051#1068
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
    Left = 112
    Top = 6
    Width = 57
    Height = 28
    DataField = 'number'
    DataSource = DataSource
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
    Top = 38
    Width = 385
    Height = 28
    DataField = 'descr'
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DBEditDpndStrips: TDBEdit
    Left = 112
    Top = 78
    Width = 281
    Height = 28
    DataField = 'dpndstrips'
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object DBEditCases: TDBEdit
    Left = 160
    Top = 110
    Width = 233
    Height = 28
    DataField = 'listcases'
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object BitBtnDamages: TBitBtn
    Left = 400
    Top = 80
    Width = 105
    Height = 25
    Caption = #1055#1086#1074#1088#1077#1078#1076#1077#1085#1080#1103' ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtnDamagesClick
  end
  object BitBtnEventLog: TBitBtn
    Left = 400
    Top = 104
    Width = 105
    Height = 25
    Caption = #1057#1086#1073#1099#1090#1080#1103' ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtnEventLogClick
  end
  object BitBtnResource: TBitBtn
    Left = 400
    Top = 40
    Width = 105
    Height = 25
    Caption = #1056#1077#1089#1091#1088#1089' ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtnResourceClick
  end
  object DataSource: TDataSource
    Left = 65535
    Top = 65531
  end
end
