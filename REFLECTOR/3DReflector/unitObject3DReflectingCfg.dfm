object fmObject3DReflectingCfgEditor: TfmObject3DReflectingCfgEditor
  Left = 60
  Top = 159
  BorderStyle = bsDialog
  Caption = 'Visibility'
  ClientHeight = 293
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 488
    Top = 0
    Width = 79
    Height = 246
    Align = alRight
    TabOrder = 1
    object RxLabel5: TRxLabel
      Left = 1
      Top = 1
      Width = 77
      Height = 33
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Hided'#13#10'types'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShadowColor = clBtnShadow
      ShadowPos = spRightBottom
    end
    object lvTypes: TListView
      Left = 1
      Top = 34
      Width = 77
      Height = 211
      Align = alClient
      Checkboxes = True
      Color = clSilver
      Columns = <
        item
          Caption = #1048#1084#1103
          Width = 243
        end>
      ColumnClick = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      PopupMenu = lvTypesPopup
      ShowColumnHeaders = False
      SortType = stText
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object Panel2: TPanel
    Left = 567
    Top = 0
    Width = 74
    Height = 246
    Align = alRight
    TabOrder = 2
    object RxLabel1: TRxLabel
      Left = 1
      Top = 1
      Width = 72
      Height = 33
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Hided'#13#10'objects'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShadowColor = clBtnShadow
      ShadowPos = spRightBottom
    end
    object lvObjects: TListView
      Left = 1
      Top = 34
      Width = 72
      Height = 211
      Align = alClient
      Checkboxes = True
      Color = clSilver
      Columns = <
        item
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1073#1098#1077#1082#1090#1072
          Width = 227
        end>
      ColumnClick = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      PopupMenu = lvObjectsPopup
      ShowColumnHeaders = False
      SortType = stText
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 488
    Height = 246
    Align = alClient
    TabOrder = 0
    object RxLabel2: TRxLabel
      Left = 1
      Top = 1
      Width = 486
      Height = 17
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'REFLECTION LAYS'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShadowColor = clBtnShadow
      ShadowSize = 0
      ShadowPos = spRightBottom
    end
    object lvLays: TListView
      Left = 1
      Top = 18
      Width = 486
      Height = 227
      Align = alClient
      Checkboxes = True
      Color = clSilver
      Columns = <
        item
          Caption = 'Lay'
          Width = 375
        end
        item
          Caption = 'level'
          Width = 75
        end>
      ColumnClick = False
      DragMode = dmAutomatic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      RowSelect = True
      ParentFont = False
      PopupMenu = lvLaysPopup
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = lvLaysDblClick
      OnEdited = lvLaysEdited
      OnDragDrop = lvLaysDragDrop
      OnDragOver = lvLaysDragOver
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 246
    Width = 641
    Height = 47
    Align = alBottom
    TabOrder = 3
    object rxsbAccept: TRxSpeedButton
      Left = 8
      Top = 9
      Width = 625
      Height = 31
      Alignment = taLeftJustify
      MenuPosition = dmpRight
      Caption = 'ACCEPT CHANGES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8388863
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Layout = blGlyphRight
      ParentFont = False
      Style = bsWin31
      WordWrap = True
      OnClick = rxsbAcceptClick
    end
  end
  object lvLaysPopup: TPopupMenu
    Left = 24
    Top = 56
    object MenuItem1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1083#1086#1081
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1083#1086#1081
      OnClick = MenuItem2Click
    end
  end
  object lvTypesPopup: TPopupMenu
    Left = 512
    Top = 48
    object N1: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1090#1080#1087
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = N2Click
    end
  end
  object lvObjectsPopup: TPopupMenu
    Left = 590
    Top = 48
    object N3: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1086#1073#1098#1077#1082#1090
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = N4Click
    end
  end
end
