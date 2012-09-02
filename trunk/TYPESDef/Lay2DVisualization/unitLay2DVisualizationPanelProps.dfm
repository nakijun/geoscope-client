object Lay2DVisualizationPanelProps: TLay2DVisualizationPanelProps
  Left = 321
  Top = 237
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 65
  ClientWidth = 247
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
    Width = 247
    Height = 65
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object RxLabel1: TRxLabel
    Left = 8
    Top = 8
    Width = 169
    Height = 17
    AutoSize = False
    Caption = 'Lay of 2d visualization'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clDefault
    ShadowSize = 0
    ShadowPos = spRightBottom
  end
  object lbLevel: TRxLabel
    Left = 168
    Top = 8
    Width = 65
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowSize = 0
    ShadowPos = spRightBottom
  end
  object RxLabel2: TRxLabel
    Left = 8
    Top = 32
    Width = 49
    Height = 17
    AutoSize = False
    Caption = 'Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowSize = 0
    ShadowPos = spRightBottom
  end
  object edInfo: TEdit
    Left = 56
    Top = 29
    Width = 177
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edInfoKeyPress
  end
end
