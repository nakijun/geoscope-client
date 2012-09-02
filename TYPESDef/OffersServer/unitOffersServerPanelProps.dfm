object OffersServerPanelProps: TOffersServerPanelProps
  Left = 341
  Top = 356
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 186
  ClientWidth = 232
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
    Width = 232
    Height = 186
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 215
    Height = 19
    Caption = 'Goods Offers Query Server'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object sbGetMailROBOT: TSpeedButton
    Left = 8
    Top = 88
    Width = 217
    Height = 41
    Caption = 'E-Mail ROBOT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = sbGetMailROBOTClick
  end
  object Bevel1: TBevel
    Left = 112
    Top = 72
    Width = 113
    Height = 25
    Shape = bsTopLine
    Style = bsRaised
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 103
    Height = 19
    Caption = 'Data providers'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
end
