object CoComponentTypeMarkerPanelProps: TCoComponentTypeMarkerPanelProps
  Left = 330
  Top = 328
  BorderStyle = bsNone
  Caption = 'componented component properties'
  ClientHeight = 49
  ClientWidth = 228
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
  object TypeIconImage: TImage
    Left = 8
    Top = 8
    Width = 32
    Height = 32
    PopupMenu = ImagePopupMenu
    Stretch = True
    Transparent = True
  end
  object edName: TEdit
    Left = 43
    Top = 15
    Width = 174
    Height = 19
    BorderStyle = bsNone
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = popupName
    TabOrder = 0
    Text = 'edName'
    OnKeyPress = edNameKeyPress
  end
  object popupName: TPopupMenu
    Left = 144
    Top = 65520
    object TypeNameItem: TMenuItem
      Caption = 'Show Type'
      OnClick = TypeNameItemClick
    end
    object TypeUIDItem: TMenuItem
      Caption = 'edit name'
      OnClick = TypeUIDItemClick
    end
  end
  object ImagePopupMenu: TPopupMenu
    Left = 32
    Top = 65528
    object Showtype1: TMenuItem
      Caption = 'Show type'
      OnClick = Showtype1Click
    end
    object editname1: TMenuItem
      Caption = 'edit name'
      OnClick = editname1Click
    end
  end
end
