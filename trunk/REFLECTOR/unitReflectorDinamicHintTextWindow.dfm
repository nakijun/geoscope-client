object fmReflectorDynamicHintTextWindow: TfmReflectorDynamicHintTextWindow
  Left = 257
  Top = 154
  AlphaBlend = True
  BorderStyle = bsNone
  ClientHeight = 76
  ClientWidth = 156
  Color = clBtnFace
  Enabled = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TMemo
    Left = 0
    Top = 0
    Width = 156
    Height = 76
    Align = alClient
    BorderStyle = bsNone
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    WordWrap = False
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 16
    Top = 16
  end
end
