object BoxPanelProps: TBoxPanelProps
  Left = 67
  Top = 128
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 65
  ClientWidth = 682
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
    Width = 682
    Height = 65
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object LabelStreet: TLabel
    Left = 88
    Top = 32
    Width = 53
    Height = 20
    Caption = 'street'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelPoint: TLabel
    Left = 88
    Top = 8
    Width = 90
    Height = 20
    Caption = 'point'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelHouse: TLabel
    Left = 352
    Top = 8
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
  object LabelFloor: TLabel
    Left = 352
    Top = 34
    Width = 46
    Height = 20
    Caption = 'Floor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelCorpsSep: TLabel
    Left = 438
    Top = 8
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
  object LabelPanelEntrance: TLabel
    Left = 432
    Top = 34
    Width = 79
    Height = 20
    Caption = 'Entrance'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RxLabel5: TRxLabel
    Left = 10
    Top = 10
    Width = 77
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Box'
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
    Left = 22
    Top = 26
    Width = 49
    Height = 24
    DataField = 'name'
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object ComboBox_Street: TComboBox
    Left = 144
    Top = 32
    Width = 201
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
    Left = 176
    Top = 8
    Width = 169
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
  object DBEditFloor: TDBEdit
    Left = 400
    Top = 34
    Width = 33
    Height = 24
    DataField = 'floor'
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object DBEditHouse: TDBEdit
    Left = 392
    Top = 8
    Width = 41
    Height = 24
    DataField = 'house'
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBEditCorps: TDBEdit
    Left = 448
    Top = 8
    Width = 25
    Height = 24
    DataField = 'corps'
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object DBEditEntrance: TDBEdit
    Left = 512
    Top = 34
    Width = 25
    Height = 24
    DataField = 'entrance'
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object BitBtnEditZoneService: TBitBtn
    Left = 544
    Top = 34
    Width = 129
    Height = 25
    Caption = 'Servicing zone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = BitBtnEditZoneServiceClick
  end
  object BitBtnResource: TBitBtn
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
    TabOrder = 8
    OnClick = BitBtnResourceClick
  end
  object DataSource: TDataSource
  end
end
