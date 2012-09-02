object fmPanelPropsProgress: TfmPanelPropsProgress
  Left = 507
  Top = 370
  AlphaBlend = True
  AlphaBlendValue = 20
  BorderStyle = bsNone
  ClientHeight = 27
  ClientWidth = 106
  Color = 15263976
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 106
    Height = 27
    Align = alClient
    Shape = bsFrame
  end
  object Gauge: TGauge
    Left = 2
    Top = 2
    Width = 23
    Height = 23
    BackColor = 4194304
    BorderStyle = bsNone
    Color = 15263976
    ForeColor = 15724527
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Kind = gkPie
    ParentColor = False
    ParentFont = False
    Progress = 0
  end
  object sbStop: TSpeedButton
    Left = 27
    Top = 5
    Width = 37
    Height = 16
    Caption = 'Stop'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sbStopClick
  end
  object Timer: TTimer
    Interval = 33
    OnTimer = TimerTimer
    Left = 64
    Top = 65512
  end
end
