object MuffPanelProps: TMuffPanelProps
  Left = 269
  Top = 233
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 56
  ClientWidth = 235
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
    Top = 16
    Width = 59
    Height = 20
    Caption = #1052#1091#1092#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel: TBevel
    Left = 0
    Top = 0
    Width = 235
    Height = 56
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object DBEditType: TDBEdit
    Left = 80
    Top = 14
    Width = 137
    Height = 28
    DataField = 'type'
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object DataSource: TDataSource
  end
end
