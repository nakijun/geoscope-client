object fmAddressEditor: TfmAddressEditor
  Left = 259
  Top = 236
  BorderStyle = bsDialog
  Caption = 'Edit address'
  ClientHeight = 151
  ClientWidth = 271
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 46
    Height = 16
    Caption = 'Address'
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 92
    Height = 16
    Caption = 'Message format'
  end
  object sbOk: TSpeedButton
    Left = 64
    Top = 112
    Width = 65
    Height = 25
    Caption = 'OK'
    OnClick = sbOkClick
  end
  object sbCancel: TSpeedButton
    Left = 144
    Top = 112
    Width = 65
    Height = 25
    Caption = 'Cancel'
    OnClick = sbCancelClick
  end
  object edAddress: TEdit
    Left = 16
    Top = 24
    Width = 241
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = edAddressChange
  end
  object cbMessageType: TComboBox
    Left = 16
    Top = 72
    Width = 241
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    TabOrder = 1
    OnChange = cbMessageTypeChange
  end
end
