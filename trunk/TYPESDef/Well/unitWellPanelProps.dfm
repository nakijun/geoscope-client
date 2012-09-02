object WellPanelProps: TWellPanelProps
  Left = 71
  Top = 209
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 74
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelType: TLabel
    Left = 8
    Top = 24
    Width = 75
    Height = 20
    Caption = #1050#1086#1083#1086#1076#1077#1094
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel: TBevel
    Left = 0
    Top = 0
    Width = 611
    Height = 74
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object DBEditNumber: TDBEdit
    Left = 96
    Top = 22
    Width = 105
    Height = 28
    DataField = 'number'
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DBEditDescr: TDBEdit
    Left = 216
    Top = 22
    Width = 385
    Height = 28
    DataField = 'descr'
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DataSource: TDataSource
    Left = 65534
    Top = 1
  end
end
