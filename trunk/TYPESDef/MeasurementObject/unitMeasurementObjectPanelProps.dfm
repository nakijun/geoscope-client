object MeasurementObjectPanelProps: TMeasurementObjectPanelProps
  Left = 491
  Top = 266
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 285
  ClientWidth = 427
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
  object Bevel: TBevel
    Left = 0
    Top = 0
    Width = 427
    Height = 285
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 15
    Top = 20
    Width = 50
    Height = 16
    AutoSize = False
    Caption = 'Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 15
    Top = 52
    Width = 66
    Height = 16
    AutoSize = False
    Caption = 'Domains'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 327
    Top = 20
    Width = 26
    Height = 16
    AutoSize = False
    Caption = 'ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edName: TEdit
    Left = 64
    Top = 17
    Width = 257
    Height = 24
    AutoSize = False
    BevelKind = bkSoft
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyDown = edNameKeyDown
  end
  object edDomains: TEdit
    Left = 80
    Top = 49
    Width = 329
    Height = 24
    AutoSize = False
    BevelKind = bkSoft
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnKeyDown = edDomainsKeyDown
  end
  object edID: TEdit
    Left = 352
    Top = 17
    Width = 57
    Height = 24
    AutoSize = False
    BevelKind = bkSoft
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object lvGSOMeasurements: TListView
    Left = 10
    Top = 80
    Width = 407
    Height = 193
    Columns = <
      item
        Caption = 'Time'
        Width = 150
      end
      item
        Caption = 'Type'
        Width = 150
      end
      item
        Caption = 'ID'
        Width = 80
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 3
    ViewStyle = vsReport
    OnDblClick = lvGSOMeasurementsDblClick
    OnKeyDown = lvGSOMeasurementsKeyDown
  end
end
