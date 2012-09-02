object TransportRoutePanelProps: TTransportRoutePanelProps
  Left = 34
  Top = 122
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 370
  ClientWidth = 706
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
    Width = 706
    Height = 370
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object Bevel2: TBevel
    Left = 360
    Top = 16
    Width = 249
    Height = 97
    Shape = bsFrame
    Style = bsRaised
  end
  object Bevel1: TBevel
    Left = 8
    Top = 16
    Width = 337
    Height = 97
    Shape = bsFrame
    Style = bsRaised
  end
  object RxLabel5: TRxLabel
    Left = 16
    Top = 19
    Width = 321
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1058#1056#1040#1053#1057#1055#1054#1056#1058#1053#1067#1049
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object RxLabel2: TRxLabel
    Left = 16
    Top = 35
    Width = 321
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1052#1040#1056#1064#1056#1059#1058
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
    Left = 368
    Top = 24
    Width = 233
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1058#1048#1055' '#1052#1040#1056#1064#1056#1059#1058#1040
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object RxLabel1: TRxLabel
    Left = 32
    Top = 88
    Width = 113
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1076#1077#1081#1089#1090#1074#1080#1090#1077#1083#1077#1085
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
    Left = 368
    Top = 64
    Width = 233
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1087#1088#1080#1084#1077#1095#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object edName: TEdit
    Left = 16
    Top = 56
    Width = 321
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edNameKeyPress
  end
  object cbTransportType: TComboBox
    Left = 368
    Top = 40
    Width = 233
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 13
    ParentFont = False
    TabOrder = 1
    OnChange = cbTransportTypeChange
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 120
    Width = 689
    Height = 241
    ActivePage = TabSheet1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #1054#1089#1090#1072#1085#1086#1074#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object NodesList: TListView
        Left = 0
        Top = 0
        Width = 681
        Height = 210
        Align = alClient
        Columns = <
          item
            Caption = #1048#1084#1103
            Width = 400
          end
          item
            Caption = #1056#1072#1089#1090'. '#1076#1086' '#1084#1072#1088#1096#1088#1091#1090#1072' ('#1084')'
            Width = 155
          end
          item
            Caption = #1094#1077#1085#1072
            Width = 80
          end>
        ColumnClick = False
        DragMode = dmAutomatic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Cyr'
        Font.Style = [fsBold]
        GridLines = True
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        PopupMenu = NodesListPopup
        TabOrder = 0
        ViewStyle = vsReport
        OnDblClick = NodesListDblClick
        OnDragDrop = NodesListDragDrop
        OnDragOver = NodesListDragOver
      end
    end
  end
  object cbValid: TCheckBox
    Left = 16
    Top = 88
    Width = 17
    Height = 17
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = cbValidClick
  end
  object edRemarks: TEdit
    Left = 368
    Top = 80
    Width = 233
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnKeyPress = edRemarksKeyPress
  end
  object NodesListPopup: TPopupMenu
    Left = 40
    Top = 152
    object N1: TMenuItem
      AutoHotkeys = maManual
      Caption = #1057#1087#1080#1089#1086#1082' '#1086#1089#1090#1072#1085#1086#1074#1086#1082
      OnClick = N1Click
    end
    object N2: TMenuItem
      AutoHotkeys = maManual
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1089#1090#1072#1085#1086#1074#1082#1091
      OnClick = N2Click
    end
  end
end
