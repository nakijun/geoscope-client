object fmMapFormatMapObjectPrototypesDATAEditor: TfmMapFormatMapObjectPrototypesDATAEditor
  Left = 340
  Top = 315
  Width = 369
  Height = 448
  Caption = 'Object prototypes editor'
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
  object Panel1: TPanel
    Left = 0
    Top = 381
    Width = 361
    Height = 40
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      361
      40)
    object btnAccept: TBitBtn
      Left = 8
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Save'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnAcceptClick
    end
    object btnCancel: TBitBtn
      Left = 256
      Top = 8
      Width = 97
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object memoDATA: TMemo
    Left = 0
    Top = 0
    Width = 361
    Height = 381
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
