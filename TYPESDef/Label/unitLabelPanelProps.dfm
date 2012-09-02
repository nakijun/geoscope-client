object LabelPanelProps: TLabelPanelProps
  Left = 82
  Top = 238
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 67
  ClientWidth = 682
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
    Width = 682
    Height = 67
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object LabelType: TLabel
    Left = 104
    Top = 2
    Width = 113
    Height = 20
    Caption = #1054#1073#1086#1079#1085#1072#1095#1077#1085#1080#1077
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object LabelFont_Height: TLabel
    Left = 328
    Top = 7
    Width = 62
    Height = 20
    Caption = #1074#1099#1089#1086#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelFontWidth: TLabel
    Left = 328
    Top = 37
    Width = 65
    Height = 20
    Caption = #1096#1080#1088#1080#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelFont_Name: TLabel
    Left = 528
    Top = 2
    Width = 70
    Height = 20
    Caption = #1096#1088#1080#1092#1090
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object SpeedButtonFontChange: TSpeedButton
    Left = 648
    Top = 24
    Width = 25
    Height = 25
    Caption = '...'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButtonFontChangeClick
  end
  object EditText: TEdit
    Left = 8
    Top = 24
    Width = 313
    Height = 32
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'EditText'
  end
  object EditFont_Height: TEdit
    Left = 392
    Top = 5
    Width = 62
    Height = 28
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Text = 'EditFont_Height'
  end
  object EditFont_Width: TEdit
    Left = 392
    Top = 34
    Width = 62
    Height = 28
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    Text = 'EditFont_Width'
  end
  object UpDownFont_Height: TUpDown
    Left = 453
    Top = 5
    Width = 24
    Height = 29
    Enabled = False
    Min = -1000
    Max = 1000
    TabOrder = 3
    OnClick = UpDownFont_HeightClick
    OnMouseUp = UpDownFont_HeightMouseUp
  end
  object UpDownFont_Width: TUpDown
    Left = 453
    Top = 34
    Width = 24
    Height = 29
    Enabled = False
    Min = -1000
    Max = 1000
    TabOrder = 4
    OnClick = UpDownFont_WidthClick
    OnMouseUp = UpDownFont_WidthMouseUp
  end
  object EditFont_Name: TEdit
    Left = 488
    Top = 24
    Width = 153
    Height = 28
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = 'EditFont_Name'
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [fdTrueTypeOnly, fdEffects]
    Left = 648
  end
end
