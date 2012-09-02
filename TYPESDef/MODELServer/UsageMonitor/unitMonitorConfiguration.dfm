object fmMonitorConfiguration: TfmMonitorConfiguration
  Left = 284
  Top = 105
  BorderStyle = bsDialog
  Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
  ClientHeight = 431
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object sbSave: TSpeedButton
    Left = 16
    Top = 400
    Width = 169
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sbSaveClick
  end
  object sbCancel: TSpeedButton
    Left = 216
    Top = 400
    Width = 161
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = sbCancelClick
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 395
    Height = 57
    Align = alTop
    Caption = ' '#1060#1086#1085' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 32
      Height = 16
      Caption = #1062#1074#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 133
      Top = 24
      Width = 178
      Height = 16
      Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1080#1085#1090#1077#1085#1089#1080#1074#1085#1086#1089#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbBackGroundColor: TLabel
      Left = 47
      Top = 22
      Width = 74
      Height = 21
      AutoSize = False
      Color = clGray
      ParentColor = False
    end
    object sbChangeBackGroundColor: TSpeedButton
      Left = 47
      Top = 21
      Width = 75
      Height = 23
      Flat = True
      OnClick = sbChangeBackGroundColorClick
    end
    object edBackGroundColorDelta: TEdit
      Left = 336
      Top = 22
      Width = 49
      Height = 20
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 57
    Width = 395
    Height = 56
    Align = alTop
    Caption = ' '#1057#1077#1090#1082#1072' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lbMesh_Color: TLabel
      Left = 96
      Top = 21
      Width = 32
      Height = 21
      AutoSize = False
      Color = clGray
      ParentColor = False
    end
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 72
      Height = 16
      Caption = #1062#1074#1077#1090' '#1089#1077#1090#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sbChangeMeshColor: TSpeedButton
      Left = 95
      Top = 20
      Width = 34
      Height = 23
      Flat = True
      OnClick = sbChangeMeshColorClick
    end
    object Label5: TLabel
      Left = 152
      Top = 24
      Width = 53
      Height = 16
      Caption = #1096#1072#1075' '#1087#1086' X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 272
      Top = 24
      Width = 57
      Height = 16
      Caption = #1096#1072#1075' '#1087#1086' Y '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edMesh_StepX: TEdit
      Left = 216
      Top = 22
      Width = 49
      Height = 20
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object edMesh_StepY: TEdit
      Left = 336
      Top = 22
      Width = 49
      Height = 20
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 113
    Width = 395
    Height = 120
    Align = alTop
    Caption = ' '#1057#1080#1075#1085#1072#1083' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label4: TLabel
      Left = 8
      Top = 24
      Width = 129
      Height = 16
      Caption = #1062#1074#1077#1090' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbSignalDefaultColor: TLabel
      Left = 159
      Top = 22
      Width = 50
      Height = 21
      AutoSize = False
      Color = clGray
      ParentColor = False
    end
    object sbChangeSignalDefaultColor: TSpeedButton
      Left = 159
      Top = 21
      Width = 50
      Height = 23
      Flat = True
      OnClick = sbChangeSignalDefaultColorClick
    end
    object Label7: TLabel
      Left = 8
      Top = 56
      Width = 98
      Height = 16
      Caption = #1089#1090#1088#1086#1082' '#1085#1072' '#1082#1072#1085#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 216
      Top = 24
      Width = 98
      Height = 16
      Caption = #1094#1074#1077#1090' '#1080#1079#1086#1083#1080#1085#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbChanelIsolineColor: TLabel
      Left = 331
      Top = 22
      Width = 54
      Height = 21
      AutoSize = False
      Color = clGray
      ParentColor = False
    end
    object sbChangeChanelIsolineColor: TSpeedButton
      Left = 331
      Top = 21
      Width = 54
      Height = 23
      Flat = True
      OnClick = sbChangeChanelIsolineColorClick
    end
    object Label10: TLabel
      Left = 8
      Top = 88
      Width = 113
      Height = 16
      Caption = #1082#1086#1101#1092' '#1089#1078#1072#1090#1080#1103' '#1087#1086' X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 198
      Top = 88
      Width = 130
      Height = 16
      Caption = #1082#1086#1101#1092' '#1091#1089#1080#1083#1077#1085#1080#1103' '#1087#1086' Y'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edRowPerChanel: TEdit
      Left = 122
      Top = 54
      Width = 41
      Height = 20
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object edXSqueezeCoef: TEdit
      Left = 139
      Top = 86
      Width = 37
      Height = 20
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object edYSqueezeCoef: TEdit
      Left = 348
      Top = 86
      Width = 37
      Height = 20
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object cbChanelsGroupped: TCheckBox
      Left = 200
      Top = 56
      Width = 185
      Height = 17
      Caption = #1075#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '#1082#1072#1085#1072#1083#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 233
    Width = 395
    Height = 162
    Align = alTop
    Caption = ' '#1062#1074#1077#1090#1072' '#1089#1080#1075#1085#1072#1083#1086#1074' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Bevel1: TBevel
      Left = 191
      Top = 14
      Width = 195
      Height = 140
      Shape = bsFrame
      Style = bsRaised
    end
    object Label9: TLabel
      Left = 13
      Top = 72
      Width = 89
      Height = 16
      Caption = #1095#1080#1089#1083#1086' '#1094#1074#1077#1090#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 216
      Top = 72
      Width = 150
      Height = 16
      Caption = #1062#1074#1077#1090#1086#1074' '#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edSignalsColorsCount: TEdit
      Left = 120
      Top = 70
      Width = 49
      Height = 20
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edSignalsColorsCountKeyPress
    end
    object sgSignalsColors: TStringGrid
      Left = 192
      Top = 16
      Width = 193
      Height = 137
      Color = clSilver
      ColCount = 1
      DefaultColWidth = 160
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
      TabOrder = 1
      OnDblClick = sgSignalsColorsDblClick
      OnDrawCell = sgSignalsColorsDrawCell
    end
  end
  object ColorDialog: TColorDialog
    Left = 72
  end
end
