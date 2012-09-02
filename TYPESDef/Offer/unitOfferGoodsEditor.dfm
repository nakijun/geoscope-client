object fmOfferGoodsEditor: TfmOfferGoodsEditor
  Left = 5
  Top = 8
  BorderStyle = bsDialog
  Caption = #1055#1088#1077#1076#1083#1086#1078#1077#1085#1080#1077
  ClientHeight = 535
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 4194304
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 27
    Width = 784
    Height = 488
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    PopupMenu = GoodsList_Popup
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 784
      Height = 488
      ActivePage = TabSheet1
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MultiLine = True
      ParentFont = False
      TabOrder = 1
      TabStop = False
      object TabSheet1: TTabSheet
        Caption = 
          #1047#1072#1087#1088#1086#1089':                                                         ' +
          '             '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        object GoodsList: TStringGrid
          Left = 0
          Top = 0
          Width = 776
          Height = 457
          Cursor = crHandPoint
          Align = alClient
          BorderStyle = bsNone
          Color = clWhite
          ColCount = 6
          DefaultRowHeight = 18
          FixedColor = clSilver
          RowCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing]
          ParentFont = False
          TabOrder = 0
          OnDblClick = GoodsListDblClick
          OnDrawCell = GoodsListDrawCell
          OnExit = GoodsListExit
          OnGetEditText = GoodsListGetEditText
          OnKeyDown = GoodsListKeyDown
          OnMouseDown = GoodsListMouseDown
          OnSelectCell = GoodsListSelectCell
          OnTopLeftChanged = GoodsListTopLeftChanged
          ColWidths = (
            25
            517
            63
            84
            63
            511)
        end
        object ComboBox: TComboBox
          Left = 96
          Top = 48
          Width = 81
          Height = 22
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemHeight = 16
          ParentFont = False
          TabOrder = 1
          OnChange = ComboBoxChange
          OnExit = ComboBoxExit
          OnKeyDown = ComboBoxKeyDown
          Items.Strings = (
            'dghdfghlkyljtr'
            'tryu45u45jy76'
            'u6i578i5k7yujr'
            'rtyui5678kjryuj'
            'ryukty8io5785i78')
        end
      end
    end
    object StaticText5: TStaticText
      Left = 67
      Top = 3
      Width = 284
      Height = 18
      AutoSize = False
      BorderStyle = sbsSunken
      TabOrder = 2
    end
    object edGoodsSearchContext: TEdit
      Left = 68
      Top = 4
      Width = 282
      Height = 16
      AutoSize = False
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyDown = edGoodsSearchContextKeyDown
      OnKeyPress = edGoodsSearchContextKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object RxLabel1: TRxLabel
      Left = 0
      Top = 5
      Width = 33
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = #1080#1084#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ShadowColor = clBtnShadow
      ShadowPos = spRightBottom
    end
    object RxLabel3: TRxLabel
      Left = 272
      Top = -3
      Width = 33
      Height = 27
      Alignment = taCenter
      AutoSize = False
      Caption = '#'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ShadowColor = clBtnShadow
      ShadowPos = spRightBottom
    end
    object lbUID: TRxLabel
      Left = 296
      Top = 5
      Width = 41
      Height = 17
      AutoSize = False
      Caption = '12345'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ShadowColor = clBtnShadow
      ShadowPos = spRightBottom
    end
    object StaticText1: TStaticText
      Left = 32
      Top = 6
      Width = 242
      Height = 15
      AutoSize = False
      BorderStyle = sbsSingle
      TabOrder = 1
    end
    object edName: TEdit
      Left = 32
      Top = 6
      Width = 241
      Height = 14
      AutoSize = False
      BorderStyle = bsNone
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = edNameKeyDown
      OnKeyPress = edNameKeyPress
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 515
    Width = 784
    Height = 20
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Panels = <
      item
        Width = 500
      end>
    UseSystemFont = False
  end
  object GoodsList_Popup: TPopupMenu
    OnPopup = GoodsList_PopupPopup
    Left = 41
    Top = 98
    object NCreateNew: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081
      OnClick = NCreateNewClick
    end
    object NDestroySelected: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = NDestroySelectedClick
    end
    object N1: TMenuItem
      Caption = #1048#1052#1055#1054#1056#1058' ...'
      object dbf1: TMenuItem
        Caption = #1080#1079' '#1092#1072#1081#1083#1072' dbf'
      end
    end
    object N2: TMenuItem
      Caption = #1069#1050#1057#1055#1054#1056#1058' ...'
      object dbf2: TMenuItem
        Caption = #1074' '#1092#1072#1081#1083' dbf'
      end
      object N3: TMenuItem
        Caption = #1085#1072' '#1087#1088#1080#1085#1090#1077#1088
      end
    end
  end
end
