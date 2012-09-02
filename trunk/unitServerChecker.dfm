object fmServerChecker: TfmServerChecker
  Left = 426
  Top = 295
  BorderStyle = bsDialog
  Caption = 'Server checker'
  ClientHeight = 56
  ClientWidth = 150
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbCheckCount: TLabel
    Left = 8
    Top = 8
    Width = 73
    Height = 16
    Caption = 'Check count'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbFailureCount: TLabel
    Left = 8
    Top = 32
    Width = 76
    Height = 16
    Caption = 'Failure count'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Timer: TTimer
    Interval = 60000
    OnTimer = TimerTimer
    Left = 32
    Top = 8
  end
end
