object fmGeoObjectTracksPanel: TfmGeoObjectTracksPanel
  Left = 113
  Top = 123
  BorderStyle = bsNone
  Caption = 'Tracks'
  ClientHeight = 314
  ClientWidth = 754
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lvItems: TListView
    Left = 0
    Top = 0
    Width = 754
    Height = 213
    Align = alClient
    Checkboxes = True
    Columns = <
      item
        Caption = 'Text'
        Width = 200
      end
      item
        Caption = 'Size'
      end
      item
        Caption = 'Length (M)'
        Width = 80
      end
      item
        Caption = 'Info events'
        Width = 100
      end
      item
        Caption = 'Minor events'
        Width = 100
      end
      item
        Caption = 'Major events'
        Width = 100
      end
      item
        Caption = 'Critical events'
        Width = 100
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
    PopupMenu = lvItems_PopupMenu
    TabOrder = 0
    ViewStyle = vsReport
    OnClick = lvItemsClick
    OnDblClick = lvItemsDblClick
    OnEnter = lvItemsEnter
    OnMouseDown = lvItemsMouseDown
    OnSelectItem = lvItemsSelectItem
  end
  object pnlControl: TPanel
    Left = 0
    Top = 233
    Width = 754
    Height = 81
    Align = alBottom
    TabOrder = 1
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 161
      Height = 81
      TabOrder = 0
      object cbShowTrackNodes: TCheckBox
        Left = 8
        Top = 8
        Width = 145
        Height = 17
        Caption = 'Show track nodes'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = cbShowTrackNodesClick
      end
      object cbShowTrackNodesTimeHints: TCheckBox
        Left = 32
        Top = 28
        Width = 121
        Height = 17
        Caption = 'Show time hints'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = cbShowTrackNodesTimeHintsClick
      end
      object btnRecalculate: TBitBtn
        Left = 8
        Top = 48
        Width = 145
        Height = 25
        Caption = 'Recalculate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnRecalculateClick
      end
    end
    object Panel2: TPanel
      Left = 458
      Top = 0
      Width = 296
      Height = 81
      TabOrder = 1
      object cbShowTrackObjectModelEvents: TCheckBox
        Left = 8
        Top = 8
        Width = 273
        Height = 17
        Caption = 'Show track object model events'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = cbShowTrackObjectModelEventsClick
      end
      object GroupBox1: TGroupBox
        Left = 24
        Top = 32
        Width = 249
        Height = 41
        Caption = ' Event severities '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object cbObjectModelInfoEvents: TCheckBox
          Left = 8
          Top = 16
          Width = 49
          Height = 17
          Caption = 'Info'
          TabOrder = 0
          OnClick = cbObjectModelInfoEventsClick
        end
        object cbObjectModelMinorEvents: TCheckBox
          Left = 56
          Top = 16
          Width = 57
          Height = 17
          Caption = 'Minor'
          TabOrder = 1
          OnClick = cbObjectModelMinorEventsClick
        end
        object cbObjectModelMajorEvents: TCheckBox
          Left = 112
          Top = 16
          Width = 57
          Height = 17
          Caption = 'Major'
          TabOrder = 2
          OnClick = cbObjectModelMajorEventsClick
        end
        object cbObjectModelCriticalEvents: TCheckBox
          Left = 176
          Top = 16
          Width = 65
          Height = 17
          Caption = 'Critical'
          TabOrder = 3
          OnClick = cbObjectModelCriticalEventsClick
        end
      end
    end
    object Panel3: TPanel
      Left = 161
      Top = 0
      Width = 297
      Height = 81
      TabOrder = 2
      object cbShowTrackBusinessModelEvents: TCheckBox
        Left = 8
        Top = 8
        Width = 273
        Height = 17
        Caption = 'Show track business model events'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = cbShowTrackBusinessModelEventsClick
      end
      object GroupBox2: TGroupBox
        Left = 24
        Top = 32
        Width = 249
        Height = 41
        Caption = ' Event severities '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object cbBusinessModelInfoEvents: TCheckBox
          Left = 8
          Top = 16
          Width = 49
          Height = 17
          Caption = 'Info'
          TabOrder = 0
          OnClick = cbBusinessModelInfoEventsClick
        end
        object cbBusinessModelMinorEvents: TCheckBox
          Left = 56
          Top = 16
          Width = 57
          Height = 17
          Caption = 'Minor'
          TabOrder = 1
          OnClick = cbBusinessModelMinorEventsClick
        end
        object cbBusinessModelMajorEvents: TCheckBox
          Left = 112
          Top = 16
          Width = 57
          Height = 17
          Caption = 'Major'
          TabOrder = 2
          OnClick = cbBusinessModelMajorEventsClick
        end
        object cbBusinessModelCriticalEvents: TCheckBox
          Left = 176
          Top = 16
          Width = 65
          Height = 17
          Caption = 'Critical'
          TabOrder = 3
          OnClick = cbBusinessModelCriticalEventsClick
        end
      end
    end
  end
  object stTracksSummary: TStaticText
    Left = 0
    Top = 213
    Width = 754
    Height = 20
    Align = alBottom
    AutoSize = False
    BorderStyle = sbsSunken
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object lvItems_PopupMenu: TPopupMenu
    Left = 56
    Top = 48
    object Addnewitemfromclipboard1: TMenuItem
      Caption = 'Add new item from a file'
      OnClick = Addnewitemfromfile1Click
    end
    object Addnewitemfromafileusingselectedastemplate1: TMenuItem
      Caption = 'Add new item from a file using selected as template'
      OnClick = Addnewitemfromafileusingselectedastemplate1Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object Editselecteditem1: TMenuItem
      Caption = 'Edit selected item'
      OnClick = Editselecteditem1Click
    end
    object Showiteminreflector1: TMenuItem
      Caption = 'Locate selected item'
      OnClick = Showiteminreflector1Click
    end
    object Showselecteditemstatistics1: TMenuItem
      Caption = 'Show selected item statistics'
      OnClick = Showselecteditemstatistics1Click
    end
    object Removeselecteditem1: TMenuItem
      Caption = 'Remove selected item'
      OnClick = Removeselecteditem1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object EnableAll1: TMenuItem
      Caption = 'Enable All'
      OnClick = EnableAll1Click
    end
    object DisableAll1: TMenuItem
      Caption = 'Disable All'
      OnClick = DisableAll1Click
    end
    object RemoveAll1: TMenuItem
      Caption = 'Remove All'
      OnClick = RemoveAll1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Defaults1: TMenuItem
      Caption = 'Defaults'
      OnClick = Defaults1Click
    end
  end
  object OpenDialog: TOpenDialog
    Left = 160
    Top = 48
  end
  object Updater: TTimer
    OnTimer = UpdaterTimer
    Left = 104
    Top = 104
  end
end
