object fmTMODELUserInstanceSelector: TfmTMODELUserInstanceSelector
  Left = 203
  Top = 121
  BorderStyle = bsDialog
  ClientHeight = 491
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object lvInstanceList: TListView
    Left = 0
    Top = 36
    Width = 779
    Height = 414
    Align = alClient
    Columns = <
      item
        Caption = 'Name'
        Width = 150
      end
      item
        Caption = 'Full name'
        Width = 450
      end
      item
        Caption = 'Status'
        Width = 120
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
    ParentShowHint = False
    ShowWorkAreas = True
    ShowHint = True
    TabOrder = 0
    ViewStyle = vsReport
    OnAdvancedCustomDrawSubItem = lvInstanceListAdvancedCustomDrawSubItem
    OnDblClick = lvInstanceListDblClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 779
    Height = 36
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 440
      Top = 8
      Width = 113
      Height = 16
      AutoSize = False
      Caption = 'Search by name'
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 201
      Height = 16
      AutoSize = False
      Caption = 'Search active by domains'
    end
    object edNameContext: TEdit
      Left = 552
      Top = 6
      Width = 129
      Height = 24
      TabOrder = 2
      OnKeyPress = edNameContextKeyPress
    end
    object edDomains: TEdit
      Left = 208
      Top = 5
      Width = 129
      Height = 24
      TabOrder = 0
      OnKeyPress = edDomainsKeyPress
    end
    object btnSearchByDomains: TBitBtn
      Left = 336
      Top = 4
      Width = 89
      Height = 25
      Caption = 'search...'
      TabOrder = 1
      OnClick = btnSearchByDomainsClick
    end
    object btnSearchByNameContext: TBitBtn
      Left = 680
      Top = 5
      Width = 89
      Height = 25
      Caption = 'search...'
      TabOrder = 3
      OnClick = btnSearchByNameContextClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 450
    Width = 779
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      779
      41)
    object btnOK: TBitBtn
      Left = 408
      Top = 8
      Width = 225
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Select'
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btnCancel: TBitBtn
      Left = 648
      Top = 8
      Width = 121
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = btnCancelClick
    end
    object btnShowPropsPanel: TBitBtn
      Left = 8
      Top = 8
      Width = 121
      Height = 25
      Caption = 'Properties'
      TabOrder = 0
      OnClick = btnShowPropsPanelClick
    end
  end
end
