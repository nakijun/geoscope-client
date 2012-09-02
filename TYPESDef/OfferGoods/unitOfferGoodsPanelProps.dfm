object OfferGoodsPanelProps: TOfferGoodsPanelProps
  Left = 67
  Top = 128
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 98
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
  object lbName: TRxLabel
    Left = 2
    Top = 18
    Width = 679
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Item number'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object Bevel: TBevel
    Left = 0
    Top = 0
    Width = 682
    Height = 98
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object RxLabel5: TRxLabel
    Left = 2
    Top = 2
    Width = 671
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Item number'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowSize = 0
    ShadowPos = spRightBottom
  end
  object sbName: TSpeedButton
    Left = 2
    Top = 16
    Width = 678
    Height = 22
    Flat = True
  end
  object RxLabel1: TRxLabel
    Left = 2
    Top = 43
    Width = 111
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'how much'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object RxLabel2: TRxLabel
    Left = 202
    Top = 43
    Width = 127
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Measurement'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object RxLabel3: TRxLabel
    Left = 482
    Top = 43
    Width = 191
    Height = 17
    AutoSize = False
    Caption = 'min. price                   Rub'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object edAmount: TEdit
    Left = 112
    Top = 40
    Width = 73
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object edMeasurement: TEdit
    Left = 336
    Top = 40
    Width = 73
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object edMinPrice: TEdit
    Left = 568
    Top = 40
    Width = 73
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
end
