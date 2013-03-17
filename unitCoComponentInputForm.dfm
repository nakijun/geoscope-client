object fmCoComponentInput: TfmCoComponentInput
  Left = 331
  Top = 306
  BorderStyle = bsDialog
  Caption = 'Object by ID'
  ClientHeight = 65
  ClientWidth = 217
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    217
    65)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 13
    Height = 16
    Caption = 'ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object sbOk: TSpeedButton
    Left = 136
    Top = 22
    Width = 57
    Height = 22
    Anchors = [akTop, akRight]
    Caption = 'OK'
    OnClick = sbOkClick
  end
  object edID: TEdit
    Left = 40
    Top = 21
    Width = 97
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    AutoSelect = False
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edTypeIDKeyPress
  end
end
