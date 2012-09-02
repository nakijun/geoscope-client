object fmSelectiveContextLogout: TfmSelectiveContextLogout
  Left = 349
  Top = 364
  BorderStyle = bsDialog
  Caption = 'Selective context logout'
  ClientHeight = 413
  ClientWidth = 425
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
  object lvEnabledTypes: TListView
    Left = 0
    Top = 0
    Width = 425
    Height = 357
    Align = alClient
    Checkboxes = True
    Columns = <
      item
        Caption = 'Enabled component types'
        Width = 400
      end>
    ColumnClick = False
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ShowColumnHeaders = False
    SortType = stText
    TabOrder = 0
    ViewStyle = vsReport
  end
  object Panel1: TPanel
    Left = 0
    Top = 357
    Width = 425
    Height = 56
    Align = alBottom
    Anchors = []
    TabOrder = 1
    DesignSize = (
      425
      56)
    object sbLogout: TSpeedButton
      Left = 32
      Top = 24
      Width = 161
      Height = 25
      Caption = 'Logout'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = sbLogoutClick
    end
    object sbCancel: TSpeedButton
      Left = 240
      Top = 24
      Width = 160
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = sbCancelClick
    end
    object cbApplyToAll: TCheckBox
      Left = 6
      Top = 3
      Width = 205
      Height = 17
      Caption = 'Apply to all items'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
      OnClick = cbApplyToAllClick
    end
  end
end
