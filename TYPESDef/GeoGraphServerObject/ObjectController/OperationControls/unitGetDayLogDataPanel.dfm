object fmGetDayLogDataPanel: TfmGetDayLogDataPanel
  Left = 451
  Top = 355
  BorderStyle = bsDialog
  Caption = 'Get Day log data'
  ClientHeight = 217
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
    Left = 24
    Top = 24
    Width = 257
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Select day log date'
  end
  object Label2: TLabel
    Left = 24
    Top = 88
    Width = 257
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Output data type'
  end
  object btnOk: TButton
    Left = 120
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
    OnClick = btnOkClick
  end
  object datetimepickerDateSelector: TDateTimePicker
    Left = 64
    Top = 48
    Width = 186
    Height = 24
    Date = 39457.514860763890000000
    Time = 39457.514860763890000000
    TabOrder = 1
  end
  object cbOutputDataType: TComboBox
    Left = 64
    Top = 112
    Width = 185
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    TabOrder = 2
    Items.Strings = (
      'Native (XML) format'
      'Plain text (Russian)')
  end
end
