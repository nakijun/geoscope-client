object fmSetGeoDistanceThresholdPanel: TfmSetGeoDistanceThresholdPanel
  Left = 339
  Top = 277
  BorderStyle = bsDialog
  Caption = 'Set new geo-distance threshold'
  ClientHeight = 79
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 219
    Height = 16
    Caption = 'New geo-distance threshold (meters)'
  end
  object edValue: TEdit
    Left = 232
    Top = 13
    Width = 81
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edValueKeyPress
  end
  object btnOk: TButton
    Left = 128
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = btnOkClick
  end
end
