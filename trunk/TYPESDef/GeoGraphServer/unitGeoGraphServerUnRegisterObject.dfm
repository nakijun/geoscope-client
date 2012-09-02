object fmUnRegisterObject: TfmUnRegisterObject
  Left = 360
  Top = 188
  BorderStyle = bsDialog
  Caption = 'UnRegister Object'
  ClientHeight = 115
  ClientWidth = 205
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 18
    Top = 32
    Width = 55
    Height = 16
    Alignment = taRightJustify
    Caption = 'Object ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object sbAccept: TSpeedButton
    Left = 8
    Top = 80
    Width = 89
    Height = 25
    Caption = 'Un-Register'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = sbAcceptClick
  end
  object sbCancel: TSpeedButton
    Left = 104
    Top = 80
    Width = 89
    Height = 25
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = sbCancelClick
  end
  object edObjectID: TEdit
    Left = 80
    Top = 29
    Width = 73
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
end
