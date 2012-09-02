object fmLay2DVisualizationObjectsList: TfmLay2DVisualizationObjectsList
  Left = 90
  Top = 107
  Width = 563
  Height = 394
  Caption = #1042#1080#1076#1080#1084#1086#1089#1090#1100' '#1086#1073#1098#1077#1082#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lvObjects: TListView
    Left = 0
    Top = 0
    Width = 555
    Height = 367
    Align = alClient
    Columns = <
      item
        Caption = #1048#1084#1103
        Width = 530
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    PopupMenu = lvObjectsPopup
    SortType = stText
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = lvObjectsDblClick
  end
  object lvObjectsPopup: TPopupMenu
    Left = 40
    Top = 48
    object N1: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1073#1098#1077#1082#1090
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077
      Enabled = False
      OnClick = N2Click
    end
  end
end
