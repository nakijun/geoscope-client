object fmReflectionWindowActualityIntervalPanel: TfmReflectionWindowActualityIntervalPanel
  Left = 238
  Top = 128
  Width = 1018
  Height = 144
  AlphaBlend = True
  AlphaBlendValue = 190
  BorderIcons = [biSystemMenu]
  Caption = 'Actuality interval'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 0
    Top = 91
    Width = 1010
    Height = 26
    Align = alBottom
    TabOrder = 0
    object tbTimeScale: TTrackBar
      Left = 1
      Top = 1
      Width = 1008
      Height = 24
      Align = alClient
      Max = 200
      ParentShowHint = False
      Position = 100
      ShowHint = False
      TabOrder = 0
      ThumbLength = 16
      TickMarks = tmBoth
      TickStyle = tsNone
      OnChange = tbTimeScaleChange
    end
  end
  object Updater: TTimer
    Interval = 60000
    OnTimer = UpdaterTimer
    Left = 8
    Top = 8
  end
end
