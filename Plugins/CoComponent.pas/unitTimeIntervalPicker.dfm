object fmTimeIntervalPicker: TfmTimeIntervalPicker
  Left = 508
  Top = 357
  BorderStyle = bsDialog
  Caption = 'Select date interval'
  ClientHeight = 104
  ClientWidth = 232
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
  object Label3: TLabel
    Left = 115
    Top = 18
    Width = 7
    Height = 20
    AutoSize = False
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object TrackBeginDayPicker: TDateTimePicker
    Left = 24
    Top = 20
    Width = 89
    Height = 24
    Date = 39493.638079965270000000
    Time = 39493.638079965270000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object TrackEndDayPicker: TDateTimePicker
    Left = 124
    Top = 20
    Width = 89
    Height = 24
    Date = 39493.638079965270000000
    Time = 39493.638079965270000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnOk: TBitBtn
    Left = 72
    Top = 64
    Width = 89
    Height = 25
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnOkClick
  end
end
