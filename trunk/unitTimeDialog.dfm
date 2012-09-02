object fmTimeDialog: TfmTimeDialog
  Left = 522
  Top = 296
  Width = 186
  Height = 259
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
    Top = 8
    Width = 161
    Height = 16
    AutoSize = False
    Caption = 'Days'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 161
    Height = 16
    AutoSize = False
    Caption = 'Hours'
  end
  object Label3: TLabel
    Left = 8
    Top = 104
    Width = 161
    Height = 16
    AutoSize = False
    Caption = 'Minites'
  end
  object Label4: TLabel
    Left = 8
    Top = 152
    Width = 161
    Height = 16
    AutoSize = False
    Caption = 'Seconds'
  end
  object edDays: TEdit
    Left = 8
    Top = 24
    Width = 161
    Height = 24
    TabOrder = 0
    Text = '0'
  end
  object edHours: TEdit
    Left = 8
    Top = 72
    Width = 161
    Height = 24
    TabOrder = 1
    Text = '0'
  end
  object edMinutes: TEdit
    Left = 8
    Top = 120
    Width = 161
    Height = 24
    TabOrder = 2
    Text = '0'
  end
  object edSeconds: TEdit
    Left = 8
    Top = 168
    Width = 161
    Height = 24
    TabOrder = 3
    Text = '0'
  end
  object btnOk: TButton
    Left = 8
    Top = 200
    Width = 73
    Height = 25
    Caption = 'OK'
    TabOrder = 4
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 96
    Top = 200
    Width = 73
    Height = 25
    Caption = 'Cancel'
    TabOrder = 5
    OnClick = btnCancelClick
  end
end
