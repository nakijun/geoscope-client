object CollectionPanelProps: TCollectionPanelProps
  Left = 261
  Top = 224
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 188
  ClientWidth = 259
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 259
    Height = 188
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 0
    object List: TListView
      Left = 2
      Top = 25
      Width = 255
      Height = 161
      Align = alClient
      Columns = <
        item
          Caption = 'Name'
          Width = 250
        end>
      DragMode = dmAutomatic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Cyr'
      Font.Style = [fsBold]
      RowSelect = True
      ParentFont = False
      PopupMenu = ListPopup
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = ListDblClick
      OnEdited = ListEdited
      OnDragDrop = ListDragDrop
      OnDragOver = ListDragOver
    end
    object mmName: TMemo
      Left = 2
      Top = 2
      Width = 255
      Height = 23
      Align = alTop
      Alignment = taCenter
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnKeyDown = mmNameKeyDown
    end
  end
  object ListPopup: TPopupMenu
    Left = 16
    Top = 64
    object N1: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Insert object'
      OnClick = N1Click
    end
    object N2: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Delete selected'
      OnClick = N2Click
    end
  end
end
