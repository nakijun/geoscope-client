object fmComponentStreamLoadingProgressPanel: TfmComponentStreamLoadingProgressPanel
  Left = 571
  Top = 423
  BorderStyle = bsDialog
  Caption = 'Loading ...'
  ClientHeight = 61
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBar: TProgressBar
    Left = 0
    Top = 0
    Width = 411
    Height = 25
    Align = alTop
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 28
    Width = 411
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      411
      33)
    object stProgressInfo: TStaticText
      Left = 0
      Top = 7
      Width = 411
      Height = 20
      Alignment = taRightJustify
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = sbsSunken
      TabOrder = 0
    end
  end
end
