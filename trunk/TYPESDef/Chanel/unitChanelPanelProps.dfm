object ChanelPanelProps: TChanelPanelProps
  Left = 273
  Top = 290
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 65
  ClientWidth = 225
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
    Top = 24
    Width = 53
    Height = 20
    Caption = #1050#1072#1085#1072#1083
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
    Width = 225
    Height = 65
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object DBEditType: TDBEdit
    Left = 72
    Top = 22
    Width = 137
    Height = 28
    DataField = 'type'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
end
