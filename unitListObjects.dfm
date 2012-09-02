object FormListObjects: TFormListObjects
  Left = 10
  Top = 115
  BorderStyle = bsSingle
  Caption = ' '
  ClientHeight = 337
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object LabelCaption: TLabel
    Left = 0
    Top = 8
    Width = 769
    Height = 24
    Alignment = taCenter
    AutoSize = False
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object LabelAction: TLabel
    Left = 1
    Top = 32
    Width = 768
    Height = 24
    Alignment = taCenter
    AutoSize = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object ListObjects: TListBox
    Left = 8
    Top = 64
    Width = 761
    Height = 265
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 20
    ParentFont = False
    TabOrder = 0
    OnDblClick = ListObjectsDblClick
  end
end
