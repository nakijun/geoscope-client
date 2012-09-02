object fmDetailedPictureLevels: TfmDetailedPictureLevels
  Left = 91
  Top = 200
  BorderStyle = bsDialog
  Caption = 'Image levels'
  ClientHeight = 317
  ClientWidth = 815
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object sbCacheAndGenerateFromDetailedLevel: TSpeedButton
    Left = 16
    Top = 280
    Width = 785
    Height = 25
    Caption = 'to cache most detailed level and generate the rest levels'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = sbCacheAndGenerateFromDetailedLevelClick
  end
  object lvLevels: TListView
    Left = 14
    Top = 16
    Width = 787
    Height = 201
    Checkboxes = True
    Columns = <
      item
        Caption = 'Level'
      end
      item
        Alignment = taCenter
        Caption = 'State'
        Width = 80
      end
      item
        Caption = 'X size'
        Width = 70
      end
      item
        Caption = 'Y size'
        Width = 70
      end
      item
        Caption = 'Segment width'
        Width = 120
      end
      item
        Caption = 'Segment height'
        Width = 120
      end
      item
        Caption = 'Caching'
        Width = 80
      end
      item
        Alignment = taCenter
        Caption = 'Persist'
        Width = 80
      end
      item
        Alignment = taRightJustify
        Caption = 'ID'
        Width = 80
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    ParentShowHint = False
    PopupMenu = lvLevels_Popup
    ShowWorkAreas = True
    ShowHint = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 216
    Width = 785
    Height = 57
    Caption = ' checked levels actions '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object sbShowSelecetdLevels: TSpeedButton
      Left = 8
      Top = 24
      Width = 89
      Height = 25
      Caption = 'get visible'
      OnClick = sbShowSelecetdLevelsClick
    end
    object sbHideSelectedLevels: TSpeedButton
      Left = 104
      Top = 24
      Width = 89
      Height = 25
      Caption = 'get invisible'
      OnClick = sbHideSelectedLevelsClick
    end
    object sbCacheSelectedLevels: TSpeedButton
      Left = 200
      Top = 24
      Width = 185
      Height = 25
      Caption = 'get levels to local cache'
      OnClick = sbCacheSelectedLevelsClick
    end
    object sbGenerateUpperLevelsForSelectedLevel: TSpeedButton
      Left = 392
      Top = 24
      Width = 225
      Height = 25
      Caption = 'generate upper levels based on this'
      OnClick = sbGenerateUpperLevelsForSelectedLevelClick
    end
  end
  object lvLevels_Popup: TPopupMenu
    Left = 64
    Top = 56
    object Getlevelpixelatreflectorcenter1: TMenuItem
      Caption = 'Get level pixel at reflector center'
      OnClick = Getlevelpixelatreflectorcenter1Click
    end
    object Showpixelcoordinatesatreflectorcenter1: TMenuItem
      Caption = 'Show pixel coordinates at reflector center'
      OnClick = Showpixelcoordinatesatreflectorcenter1Click
    end
  end
end
