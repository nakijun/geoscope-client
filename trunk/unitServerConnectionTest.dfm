object fmServerConnectionTest: TfmServerConnectionTest
  Left = 314
  Top = 187
  Width = 304
  Height = 197
  AlphaBlend = True
  AlphaBlendValue = 240
  Caption = 'server connection test'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  DesignSize = (
    296
    168)
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox: TPaintBox
    Left = 0
    Top = 0
    Width = 296
    Height = 65
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnPaint = PaintBoxPaint
  end
  object Bevel1: TBevel
    Left = 0
    Top = 148
    Width = 296
    Height = 2
    Align = alBottom
    Shape = bsBottomLine
    Style = bsRaised
  end
  object stCurrent: TStaticText
    Left = 0
    Top = 64
    Width = 61
    Height = 19
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BorderStyle = sbsSingle
    Color = 4227327
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    Visible = False
  end
  object lbLog: TListBox
    Left = 0
    Top = 65
    Width = 296
    Height = 83
    Align = alBottom
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 1
  end
  object stAnalize: TStaticText
    Left = 0
    Top = 150
    Width = 296
    Height = 18
    Align = alBottom
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSunken
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 2
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 129
    Top = 64
  end
end
