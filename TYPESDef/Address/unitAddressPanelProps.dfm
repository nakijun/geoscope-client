object AddressPanelProps: TAddressPanelProps
  Left = 252
  Top = 200
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 100
  ClientWidth = 337
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
    Width = 337
    Height = 100
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object RxLabel2: TRxLabel
    Left = 8
    Top = 11
    Width = 97
    Height = 17
    AutoSize = False
    Caption = 'Point'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object RxLabel1: TRxLabel
    Left = 8
    Top = 39
    Width = 57
    Height = 17
    AutoSize = False
    Caption = 'Street'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object RxLabel3: TRxLabel
    Left = 8
    Top = 66
    Width = 49
    Height = 17
    AutoSize = False
    Caption = 'House'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object RxLabel4: TRxLabel
    Left = 90
    Top = 66
    Width = 7
    Height = 17
    AutoSize = False
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object RxLabel5: TRxLabel
    Left = 224
    Top = 66
    Width = 65
    Height = 17
    AutoSize = False
    Caption = 'Entrance'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object RxLabel6: TRxLabel
    Left = 136
    Top = 66
    Width = 25
    Height = 17
    AutoSize = False
    Caption = 'AP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object cbPoint: TComboBox
    Left = 104
    Top = 8
    Width = 225
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
    OnChange = cbPointChange
    Items.Strings = (
      #1091#1087#1099#1072#1087#1099#1074#1072)
  end
  object cbStreet: TComboBox
    Left = 64
    Top = 35
    Width = 265
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
    OnChange = cbStreetChange
    Items.Strings = (
      #1091#1087#1099#1072#1087#1099#1074#1072)
  end
  object edHouse: TEdit
    Left = 56
    Top = 64
    Width = 33
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnKeyPress = edHouseKeyPress
  end
  object edCorps: TEdit
    Left = 98
    Top = 64
    Width = 31
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnKeyPress = edCorpsKeyPress
  end
  object edEntrance: TEdit
    Left = 296
    Top = 64
    Width = 33
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnKeyPress = edEntranceKeyPress
  end
  object edApartment: TEdit
    Left = 162
    Top = 64
    Width = 31
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnKeyPress = edApartmentKeyPress
  end
end
