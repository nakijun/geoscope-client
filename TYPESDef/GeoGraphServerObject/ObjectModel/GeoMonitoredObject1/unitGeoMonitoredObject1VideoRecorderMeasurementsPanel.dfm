object GeoMonitoredObject1VideoRecorderMeasurementsPanel: TGeoMonitoredObject1VideoRecorderMeasurementsPanel
  Left = 384
  Top = 245
  Width = 595
  Height = 475
  Caption = 'Video recorder measurements'
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
  object lvMeasurements: TListView
    Left = 0
    Top = 0
    Width = 587
    Height = 448
    Align = alClient
    Columns = <
      item
        Caption = 'MeasurementID'
        Width = 0
      end
      item
        Caption = 'Start time'
        Width = 200
      end
      item
        Caption = 'Finish time'
        Width = 200
      end
      item
        Caption = 'Duration, secs'
        Width = 150
      end
      item
        Caption = 'Audio size'
        Width = 120
      end
      item
        Caption = 'Video size'
        Width = 120
      end
      item
        Caption = 'Summary size'
        Width = 100
      end>
    GridLines = True
    HideSelection = False
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    PopupMenu = lvMeasurements_PopupMenu
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = lvMeasurementsDblClick
  end
  object lvMeasurements_PopupMenu: TPopupMenu
    Left = 88
    Top = 72
    object Open1: TMenuItem
      Caption = 'Open'
      OnClick = Open1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Updatelist1: TMenuItem
      Caption = 'Update list'
      OnClick = Updatelist1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Moveselectedtodataserver1: TMenuItem
      Caption = 'Move selected to data server'
      OnClick = Moveselectedtodataserver1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Deleteselected1: TMenuItem
      Caption = 'Delete selected'
      OnClick = Deleteselected1Click
    end
  end
end
