object fmPFTypesFilter: TfmPFTypesFilter
  Left = 237
  Top = 227
  Width = 753
  Height = 548
  Caption = 'Object types filter'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 745
    Height = 25
    Align = alTop
    TabOrder = 0
    object btnClearAll: TBitBtn
      Left = 2
      Top = 2
      Width = 119
      Height = 21
      Caption = 'Clear All'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnClearAllClick
    end
    object btnSetAll: TBitBtn
      Left = 122
      Top = 2
      Width = 119
      Height = 21
      Caption = 'Set All'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnSetAllClick
    end
  end
  object lvTypes: TListView
    Left = 0
    Top = 25
    Width = 745
    Height = 455
    Align = alClient
    Checkboxes = True
    Columns = <
      item
        Caption = 'KIND'
        Width = 100
      end
      item
        Caption = 'Type Name'
        Width = 500
      end
      item
        Caption = 'Type ID'
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
    TabOrder = 1
    ViewStyle = vsReport
  end
  object Panel2: TPanel
    Left = 0
    Top = 480
    Width = 745
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      745
      41)
    object btnAccept: TBitBtn
      Left = 442
      Top = 5
      Width = 143
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'Accept'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnAcceptClick
    end
    object btnCancel: TBitBtn
      Left = 594
      Top = 5
      Width = 143
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
end
