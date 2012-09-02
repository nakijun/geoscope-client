object LineDistPanelProps: TLineDistPanelProps
  Left = 63
  Top = 282
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 40
  ClientWidth = 414
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
    Width = 414
    Height = 40
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object LabelType: TLabel
    Left = 8
    Top = 8
    Width = 157
    Height = 20
    Caption = 'dist line'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelLength: TLabel
    Left = 304
    Top = 8
    Width = 101
    Height = 20
    Caption = 'LabelLength'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEditDistance: TDBEdit
    Left = 176
    Top = 6
    Width = 121
    Height = 28
    DataField = 'distance'
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
