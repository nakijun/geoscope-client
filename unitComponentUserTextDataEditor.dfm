object fmComponentUserTextDataEditor: TfmComponentUserTextDataEditor
  Left = 768
  Top = 277
  Width = 381
  Height = 358
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
  object Panel1: TPanel
    Left = 0
    Top = 290
    Width = 373
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      373
      41)
    object Button1: TButton
      Left = 113
      Top = 8
      Width = 161
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Save and Exit'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 297
      Top = 8
      Width = 57
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Exit'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object memoFile: TMemo
    Left = 0
    Top = 0
    Width = 373
    Height = 290
    Align = alClient
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
end
