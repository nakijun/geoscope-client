object fmUserHintsPanel: TfmUserHintsPanel
  Left = 417
  Top = 267
  Width = 1005
  Height = 510
  Caption = 'User hints'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lvItems: TListView
    Left = 0
    Top = 0
    Width = 997
    Height = 483
    Align = alClient
    Checkboxes = True
    Columns = <
      item
        Caption = 'Text'
        Width = 450
      end
      item
        Caption = 'Font'
        Width = 150
      end
      item
        Caption = 'Font size'
        Width = 120
      end
      item
        Caption = 'Tracking'
        Width = 70
      end
      item
        Caption = 'Check visibility'
        Width = 180
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    GridLines = True
    LargeImages = lvItems_ImageList
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    PopupMenu = lvItems_PopupMenu
    SmallImages = lvItems_ImageList
    TabOrder = 0
    ViewStyle = vsReport
    OnChange = lvItemsChange
    OnDblClick = lvItemsDblClick
    OnSelectItem = lvItemsSelectItem
  end
  object lvItems_ImageList: TImageList
    Height = 32
    Width = 32
    Left = 40
    Top = 48
  end
  object lvItems_PopupMenu: TPopupMenu
    Left = 144
    Top = 48
    object Addnewitemfromclipboard1: TMenuItem
      Caption = 'Add new item from clipboard'
      OnClick = Addnewitemfromclipboard1Click
    end
    object Addnewitemfromclipboardusingselecteditemastemplate1: TMenuItem
      Caption = 'Add new item from clipboard using selected item as template'
      OnClick = Addnewitemfromclipboardusingselecteditemastemplate1Click
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
    object Removeselecteditem1: TMenuItem
      Caption = 'Remove selected item'
      OnClick = Removeselecteditem1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object EnableDisabletrackingofselecteditem1: TMenuItem
      Caption = 'Enable/Disable tracking of selected item'
      OnClick = EnableDisabletrackingofselecteditem1Click
    end
    object Cleartracksofselecteditem1: TMenuItem
      Caption = 'Clear track of selected item'
      OnClick = Cleartracksofselecteditem1Click
    end
    object N1: TMenuItem
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
    object N4: TMenuItem
      Caption = '-'
    end
    object EnabletrackingofAll1: TMenuItem
      Caption = 'Enable tracking of All'
      OnClick = EnabletrackingofAll1Click
    end
    object DisabletrackingofAll1: TMenuItem
      Caption = 'Disable tracking of All'
      OnClick = DisabletrackingofAll1Click
    end
    object CleartracksofAll1: TMenuItem
      Caption = 'Clear tracks of All'
      OnClick = CleartracksofAll1Click
    end
  end
end
