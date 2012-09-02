object SpaceObj_PanelProps: TSpaceObj_PanelProps
  Left = 340
  Top = 219
  Width = 344
  Height = 295
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Properties'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlComponentsTree: TPanel
    Left = 129
    Top = 0
    Width = 207
    Height = 268
    Align = alClient
    TabOrder = 0
    object lbTreeCaption: TRxLabel
      Left = 1
      Top = 1
      Width = 205
      Height = 13
      Align = alTop
      Caption = 'COMPONENTS TREE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShadowColor = clBtnShadow
      ShadowPos = spRightBottom
      ShowHint = True
    end
    object tvComponents: TTreeView
      Left = 1
      Top = 14
      Width = 205
      Height = 253
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsItalic]
      Indent = 19
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnDblClick = tvComponentsDblClick
    end
  end
  object pnlObjProps: TPanel
    Left = 0
    Top = 0
    Width = 129
    Height = 268
    Align = alLeft
    BevelOuter = bvLowered
    TabOrder = 1
    OnDblClick = pnlObjPropsDblClick
    object Bevel2: TBevel
      Left = 9
      Top = 122
      Width = 104
      Height = 46
      Shape = bsFrame
    end
    object lbPolylineFillColor: TLabel
      Left = 56
      Top = 145
      Width = 33
      Height = 17
      AutoSize = False
      Color = clPurple
      ParentColor = False
    end
    object sbPolylineFillColorChange: TSpeedButton
      Left = 56
      Top = 144
      Width = 33
      Height = 18
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = sbPolylineFillColorChangeClick
    end
    object lbPolylineColor: TLabel
      Left = 9
      Top = 51
      Width = 88
      Height = 15
      AutoSize = False
      Color = 8421440
      ParentColor = False
    end
    object sbPolylineColorChange: TSpeedButton
      Left = 9
      Top = 50
      Width = 88
      Height = 17
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = sbPolylineColorChangeClick
    end
    object lbLay: TRxLabel
      Left = 16
      Top = 0
      Width = 89
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'LAY'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShadowColor = clBtnShadow
      ShadowSize = 0
      ShadowPos = spRightBottom
      ShowHint = True
      Transparent = True
    end
    object RxLabel3: TRxLabel
      Left = 14
      Top = 34
      Width = 91
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Line color'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ShadowColor = clBtnShadow
      ShadowSize = 0
      ShadowPos = spRightBottom
    end
    object RxLabel4: TRxLabel
      Left = 8
      Top = 66
      Width = 105
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'Line width'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ShadowColor = clBtnShadow
      ShadowSize = 0
      ShadowPos = spRightBottom
      Transparent = True
    end
    object sbPolylineWidthTo0: TSpeedButton
      Left = 83
      Top = 82
      Width = 30
      Height = 21
      Caption = '-> 0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = sbPolylineWidthTo0Click
    end
    object lbFillColor: TRxLabel
      Left = 13
      Top = 145
      Width = 40
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'color'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ShadowColor = clBtnShadow
      ShadowSize = 0
      ShadowPos = spRightBottom
    end
    object bvlStrobing: TBevel
      Left = 8
      Top = 185
      Width = 105
      Height = 30
      Shape = bsFrame
    end
    object lbStrobingInterval: TLabel
      Left = 11
      Top = 192
      Width = 68
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Interval'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object sbPolylineColorClear: TSpeedButton
      Left = 97
      Top = 50
      Width = 17
      Height = 17
      Hint = 'Color to none'
      Caption = 'C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbPolylineColorClearClick
    end
    object sbPolylineFillColorClear: TSpeedButton
      Left = 89
      Top = 144
      Width = 18
      Height = 18
      Hint = 'Color to none'
      Caption = 'C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbPolylineFillColorClearClick
    end
    object cbCurrentLay: TComboBox
      Left = 8
      Top = 14
      Width = 105
      Height = 21
      Style = csDropDownList
      DropDownCount = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = cbCurrentLayChange
    end
    object pnlPolylineWidth: TPanel
      Left = 9
      Top = 82
      Width = 72
      Height = 21
      Hint = 'use mouse right buttom to adjust'
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '0'
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnMouseDown = pnlPolylineWidthMouseDown
      OnMouseMove = pnlPolylineWidthMouseMove
      OnMouseUp = pnlPolylineWidthMouseUp
    end
    object cbxPolylineLoop: TCheckBox
      Left = 10
      Top = 105
      Width = 103
      Height = 17
      Caption = 'Lock-in'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = cbxPolylineLoopClick
    end
    object cbxPolylineFill: TCheckBox
      Left = 13
      Top = 127
      Width = 98
      Height = 17
      Caption = 'filling'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = cbxPolylineFillClick
    end
    object cbStrobing: TCheckBox
      Left = 8
      Top = 168
      Width = 105
      Height = 17
      Caption = 'Strobing'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = cbStrobingClick
    end
    object edStrobingInterval: TEdit
      Left = 80
      Top = 188
      Width = 27
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnKeyPress = edStrobingIntervalKeyPress
    end
    object cbUserSecurity: TCheckBox
      Left = 7
      Top = 216
      Width = 105
      Height = 17
      Caption = 'user security'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = cbUserSecurityClick
    end
    object cbDetailsNoIndex: TCheckBox
      Left = 7
      Top = 232
      Width = 113
      Height = 17
      Caption = 'details no index'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = cbDetailsNoIndexClick
    end
    object cbNotifyOwnerOnChange: TCheckBox
      Left = 7
      Top = 248
      Width = 122
      Height = 17
      Caption = 'owner notification'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = cbNotifyOwnerOnChangeClick
    end
  end
  object ColorDialog: TColorDialog
    Left = 168
    Top = 65528
  end
end
