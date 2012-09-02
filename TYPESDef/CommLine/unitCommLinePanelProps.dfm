object CommLinePanelProps: TCommLinePanelProps
  Left = 205
  Top = 259
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 196
  ClientWidth = 428
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
    Width = 428
    Height = 196
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object LabelType: TLabel
    Left = 152
    Top = 8
    Width = 133
    Height = 20
    Caption = #1055#1088#1103#1084#1086#1081' '#1087#1088#1086#1074#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 10485760
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 48
    Top = 32
    Width = 122
    Height = 20
    Caption = #1085#1072' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelLength: TLabel
    Left = 152
    Top = 72
    Width = 89
    Height = 20
    Caption = #1044#1083#1080#1085#1072'( '#1084'.)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelDateCreated: TLabel
    Left = 40
    Top = 72
    Width = 74
    Height = 20
    Caption = #1057#1086#1079#1076#1072#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelDivision: TLabel
    Left = 24
    Top = 136
    Width = 138
    Height = 20
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelRemarks: TLabel
    Left = 256
    Top = 136
    Width = 106
    Height = 20
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelPrice: TLabel
    Left = 256
    Top = 72
    Width = 144
    Height = 20
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' ('#1088#1091#1073'.)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ComboBoxFinishDevice: TComboBox
    Left = 176
    Top = 32
    Width = 185
    Height = 24
    DropDownCount = 15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
    Items.Strings = (
      'werqwer'
      'qwerqwerq'
      'qwerqwerq')
  end
  object EditDateCreated: TEdit
    Left = 16
    Top = 96
    Width = 121
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Text = 'EditDateCreated'
  end
  object EditLength: TEdit
    Left = 144
    Top = 96
    Width = 105
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object EditRemarks: TEdit
    Left = 200
    Top = 160
    Width = 209
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object EditPrice: TEdit
    Left = 256
    Top = 96
    Width = 145
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object ComboBoxDivision: TComboBox
    Left = 16
    Top = 160
    Width = 161
    Height = 22
    Style = csOwnerDrawVariable
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 5
    Items.Strings = (
      'werqwer'
      'qwerqwerq'
      'qwerqwerq')
  end
  object DataSource: TDataSource
  end
end
