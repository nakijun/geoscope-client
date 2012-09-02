object fmComponentInput: TfmComponentInput
  Left = 331
  Top = 306
  BorderStyle = bsDialog
  Caption = 'Component by ID'
  ClientHeight = 94
  ClientWidth = 288
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
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 64
    Height = 16
    Caption = 'TypeID; ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object sbOk: TSpeedButton
    Left = 224
    Top = 54
    Width = 57
    Height = 22
    Caption = 'OK'
    OnClick = sbOkClick
  end
  object edID: TEdit
    Left = 80
    Top = 53
    Width = 137
    Height = 24
    AutoSelect = False
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnKeyPress = edTypeIDKeyPress
  end
  object cbTypes: TComboBoxEx
    Left = 8
    Top = 8
    Width = 273
    Height = 25
    AutoCompleteOptions = [acoAutoAppend, acoUpDownKeyDropsList]
    ItemsEx = <
      item
      end>
    StyleEx = [csExNoEditImage, csExNoEditImageIndent, csExNoSizeLimit, csExPathWordBreak]
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
    OnChange = cbTypesChange
    OnKeyDown = cbTypesKeyDown
    DropDownCount = 20
  end
end
