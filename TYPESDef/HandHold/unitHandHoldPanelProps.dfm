object HandHoldPanelProps: THandHoldPanelProps
  Left = 243
  Top = 223
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 60
  ClientWidth = 229
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
    Left = 16
    Top = 16
    Width = 54
    Height = 20
    Caption = #1054#1087#1086#1088#1072
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
    Width = 229
    Height = 60
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object DBEditDescr: TDBEdit
    Left = 80
    Top = 14
    Width = 137
    Height = 28
    DataField = 'descr'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
end
