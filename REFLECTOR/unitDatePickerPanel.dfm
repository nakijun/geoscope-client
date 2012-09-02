object DatePickerPanel: TDatePickerPanel
  Left = 599
  Top = 259
  BorderStyle = bsDialog
  Caption = 'Select date '
  ClientHeight = 250
  ClientWidth = 201
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
  object Panel1: TPanel
    Left = 0
    Top = 209
    Width = 201
    Height = 41
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      201
      41)
    object btnAccept: TBitBtn
      Left = 8
      Top = 8
      Width = 81
      Height = 25
      Caption = 'Accept'
      TabOrder = 0
      OnClick = btnAcceptClick
    end
    object btnCancel: TBitBtn
      Left = 114
      Top = 8
      Width = 79
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object MonthCalendar: TMonthCalendar
    Left = 8
    Top = 8
    Width = 185
    Height = 193
    Date = 40860.567665462960000000
    TabOrder = 1
  end
end
