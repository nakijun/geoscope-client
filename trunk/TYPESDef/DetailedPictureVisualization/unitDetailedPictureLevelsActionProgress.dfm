object fmLevelsActionProgress: TfmLevelsActionProgress
  Left = 304
  Top = 231
  BorderStyle = bsDialog
  Caption = 'action progress'
  ClientHeight = 231
  ClientWidth = 372
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
  object Panel1: TPanel
    Left = 0
    Top = 191
    Width = 372
    Height = 40
    Align = alBottom
    TabOrder = 0
    object sbCancel: TSpeedButton
      Left = 264
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object memoLog: TMemo
    Left = 0
    Top = 0
    Width = 372
    Height = 191
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
