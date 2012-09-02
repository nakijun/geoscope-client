object fmObjectDistanceNotificationPanel: TfmObjectDistanceNotificationPanel
  Left = 365
  Top = 231
  BorderStyle = bsDialog
  Caption = 'Object distance notification'
  ClientHeight = 129
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 69
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Criteria'
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 133
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Distance to object, m'
  end
  object cbObjectDistanceType: TComboBox
    Left = 88
    Top = 13
    Width = 145
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    TabOrder = 0
  end
  object edDistance: TEdit
    Left = 152
    Top = 45
    Width = 81
    Height = 24
    TabOrder = 1
  end
  object btnOk: TButton
    Left = 16
    Top = 88
    Width = 105
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 128
    Top = 88
    Width = 105
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
end
