object CoComponentTypePanelProps: TCoComponentTypePanelProps
  Left = 119
  Top = 180
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 375
  ClientWidth = 741
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
    Width = 741
    Height = 375
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object RxLabel1: TRxLabel
    Left = 8
    Top = 120
    Width = 82
    Height = 16
    Caption = 'Description'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clGray
    ShadowPos = spRightBottom
  end
  object RxLabel2: TRxLabel
    Left = 282
    Top = 8
    Width = 137
    Height = 16
    Caption = 'Co-component type'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object Label1: TLabel
    Left = 8
    Top = 99
    Width = 54
    Height = 16
    Caption = 'FileType'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 363
    Top = 100
    Width = 74
    Height = 16
    Caption = 'Prototype ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object memoDescription: TMemo
    Left = 7
    Top = 136
    Width = 525
    Height = 233
    BevelInner = bvNone
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnKeyPress = memoDescriptionKeyPress
  end
  object edName: TEdit
    Left = 8
    Top = 24
    Width = 721
    Height = 20
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'edName'
    OnKeyPress = edNameKeyPress
  end
  object lvInstances: TListView
    Left = 536
    Top = 72
    Width = 193
    Height = 273
    BevelKind = bkSoft
    BorderStyle = bsNone
    Columns = <
      item
        Caption = 'Instances'
        Width = 170
      end>
    ColumnClick = False
    DragMode = dmAutomatic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Cyr'
    Font.Style = []
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 2
    ViewStyle = vsReport
    OnDblClick = lvInstancesDblClick
  end
  object stUID: TStaticText
    Left = 8
    Top = 49
    Width = 34
    Height = 20
    BorderStyle = sbsSingle
    Caption = 'stUID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object stDateCreated: TStaticText
    Left = 8
    Top = 75
    Width = 68
    Height = 18
    BorderStyle = sbsSunken
    Caption = 'StaticText1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object bbCreateComponent: TBitBtn
    Left = 536
    Top = 344
    Width = 193
    Height = 25
    Caption = 'Create instance'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = bbCreateComponentClick
  end
  object edFileType: TEdit
    Left = 65
    Top = 97
    Width = 296
    Height = 24
    BevelInner = bvNone
    BevelKind = bkSoft
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnKeyPress = edFileTypeKeyPress
  end
  object edCoComponentPrototypeID: TEdit
    Left = 441
    Top = 97
    Width = 88
    Height = 24
    BevelInner = bvNone
    BevelKind = bkSoft
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnKeyPress = edCoComponentPrototypeIDKeyPress
  end
  object bbUpdateInstanceList: TBitBtn
    Left = 536
    Top = 46
    Width = 193
    Height = 25
    Caption = 'Update'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = bbUpdateInstanceListClick
  end
end
