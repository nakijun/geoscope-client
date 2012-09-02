object CoReferencePanelProps: TCoReferencePanelProps
  Left = 337
  Top = 421
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 25
  ClientWidth = 134
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
  object stName: TStaticText
    Left = 4
    Top = 3
    Width = 45
    Height = 20
    Cursor = crHandPoint
    Caption = 'Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    PopupMenu = stName_Popup
    TabOrder = 0
    OnClick = stNameClick
  end
  object edName: TEdit
    Left = 8
    Top = 0
    Width = 121
    Height = 24
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 1
    OnKeyDown = edNameKeyDown
    OnKeyPress = edNameKeyPress
  end
  object stName_Popup: TPopupMenu
    Left = 40
    object savepositionofcurrentreflector1: TMenuItem
      Caption = 'paste referenced object'
      OnClick = savepositionofcurrentreflector1Click
    end
    object editpositionname1: TMenuItem
      Caption = 'edit name'
      OnClick = editpositionname1Click
    end
  end
end
