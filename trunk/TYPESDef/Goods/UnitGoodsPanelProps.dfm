object GoodsPanelProps: TGoodsPanelProps
  Left = 100
  Top = 283
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 63
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 562
    Height = 63
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object RxLabel5: TRxLabel
    Left = 224
    Top = 8
    Width = 113
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Goods'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object edName: TEdit
    Left = 8
    Top = 24
    Width = 545
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edNameKeyPress
  end
end
