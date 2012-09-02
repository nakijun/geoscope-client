object fmSpaceDisproportionObjectsPanel: TfmSpaceDisproportionObjectsPanel
  Left = 442
  Top = 290
  Width = 241
  Height = 301
  Caption = 'disproportion objects panel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 233
    Height = 33
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      233
      33)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 16
      Caption = 'Factor'
    end
    object edFactor: TEdit
      Left = 48
      Top = 5
      Width = 73
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = '100.0'
    end
    object btnProcess: TButton
      Left = 128
      Top = 4
      Width = 98
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Search'
      TabOrder = 1
      OnClick = btnProcessClick
    end
  end
  object lbObjectsList: TListBox
    Left = 0
    Top = 33
    Width = 233
    Height = 241
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
    OnClick = lbObjectsListClick
  end
end
