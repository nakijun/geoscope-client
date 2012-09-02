object PositionerPanelProps: TPositionerPanelProps
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
  object stPositionName: TStaticText
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
    PopupMenu = stPositionName_Popup
    TabOrder = 0
    OnClick = stPositionNameClick
  end
  object edPositionName: TEdit
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
    OnKeyDown = edPositionNameKeyDown
    OnKeyPress = edPositionNameKeyPress
  end
  object stPositionName_Popup: TPopupMenu
    Left = 40
    object savepositionofcurrentreflector1: TMenuItem
      Caption = 'save position of current reflector'
      OnClick = savepositionofcurrentreflector1Click
    end
    object editpositionname1: TMenuItem
      Caption = 'edit position name'
      OnClick = editpositionname1Click
    end
  end
end
