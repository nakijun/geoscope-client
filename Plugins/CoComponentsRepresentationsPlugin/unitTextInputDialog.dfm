object fmTextInputDialog: TfmTextInputDialog
  Left = 505
  Top = 303
  Width = 399
  Height = 136
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    383
    98)
  PixelsPerInch = 96
  TextHeight = 16
  object stInputName: TStaticText
    Left = 0
    Top = 0
    Width = 383
    Height = 25
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    TabOrder = 1
  end
  object edText: TEdit
    Left = 8
    Top = 24
    Width = 366
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    OnKeyPress = edTextKeyPress
  end
  object btnOk: TBitBtn
    Left = 80
    Top = 56
    Width = 97
    Height = 33
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 209
    Top = 56
    Width = 97
    Height = 33
    Anchors = [akTop, akRight]
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
end
