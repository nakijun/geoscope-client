object GeoMonitoredObject1FileSystemExplorerPanel: TGeoMonitoredObject1FileSystemExplorerPanel
  Left = 527
  Top = 227
  Width = 341
  Height = 475
  Caption = 'File system explorer'
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
  object lvDirList: TListView
    Left = 0
    Top = 0
    Width = 333
    Height = 448
    Align = alClient
    Columns = <
      item
        Caption = 'FileID'
        Width = 1
      end
      item
        Caption = 'Name '
        Width = 200
      end
      item
        Caption = 'IsDirectory'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = 'Size'
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
    OnDblClick = lvDirListDblClick
  end
  object lvMeasurements_PopupMenu: TPopupMenu
    Left = 88
    Top = 72
    object Open1: TMenuItem
      Caption = 'Load file'
      OnClick = Open1Click
    end
    object StartFTPtransfer1: TMenuItem
      Caption = 'Start FTP transfer'
      OnClick = StartFTPtransfer1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Savefile1: TMenuItem
      Caption = 'Save file'
      OnClick = Savefile1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Deleteselected1: TMenuItem
      Caption = 'Delete selected'
      OnClick = Deleteselected1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Updatelist1: TMenuItem
      Caption = 'Update list'
      OnClick = Updatelist1Click
    end
  end
  object OpenFileDialog: TOpenDialog
    Left = 88
    Top = 136
  end
end
