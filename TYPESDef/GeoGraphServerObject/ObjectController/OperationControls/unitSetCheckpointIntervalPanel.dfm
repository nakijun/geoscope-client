object fmSetCheckpointIntervalPanel: TfmSetCheckpointIntervalPanel
  Left = 451
  Top = 355
  BorderStyle = bsDialog
  Caption = 'Set checkpoint interval'
  ClientHeight = 79
  ClientWidth = 306
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
    Width = 206
    Height = 16
    Caption = 'New Checkpoint interval (seconds)'
  end
  object edInterval: TEdit
    Left = 216
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
    OnKeyPress = edIntervalKeyPress
  end
  object btnOk: TButton
    Left = 120
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = btnOkClick
  end
end
