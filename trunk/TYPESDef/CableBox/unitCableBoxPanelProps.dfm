object CableBoxPanelProps: TCableBoxPanelProps
  Left = 82
  Top = 216
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 65
  ClientWidth = 681
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
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 681
    Height = 65
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object LabelPoint: TLabel
    Left = 104
    Top = 8
    Width = 90
    Height = 20
    Caption = 'Point'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelStreet: TLabel
    Left = 104
    Top = 32
    Width = 53
    Height = 20
    Caption = 'Street'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelHouse: TLabel
    Left = 408
    Top = 24
    Width = 36
    Height = 20
    Caption = 'House'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelCorpsSep: TLabel
    Left = 494
    Top = 24
    Width = 6
    Height = 20
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RxLabel5: TRxLabel
    Left = 12
    Top = 8
    Width = 81
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Cab box'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object DBEditName: TDBEdit
    Left = 24
    Top = 24
    Width = 57
    Height = 24
    DataField = 'name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object ComboBox_Street: TComboBox
    Left = 160
    Top = 32
    Width = 217
    Height = 22
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
    OnChange = ComboBox_StreetChange
  end
  object ComboBox_Point: TComboBox
    Left = 192
    Top = 8
    Width = 185
    Height = 22
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 2
    OnChange = ComboBox_PointChange
  end
  object DBEditHouse: TDBEdit
    Left = 448
    Top = 24
    Width = 41
    Height = 24
    DataField = 'house'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object DBEditCorps: TDBEdit
    Left = 504
    Top = 24
    Width = 25
    Height = 24
    DataField = 'corps'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object BitBtnCableBox_EditZoneService: TBitBtn
    Left = 544
    Top = 34
    Width = 129
    Height = 25
    Caption = 'Servicing area'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtnCableBox_EditZoneServiceClick
  end
  object BitBtnCableBoxResource: TBitBtn
    Left = 544
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Resources ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtnCableBoxResourceClick
  end
end
