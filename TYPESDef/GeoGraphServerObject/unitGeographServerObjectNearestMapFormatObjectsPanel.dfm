object fmGeographServerObjectNearestMapFormatObjectsPanel: TfmGeographServerObjectNearestMapFormatObjectsPanel
  Left = 400
  Top = 394
  Width = 381
  Height = 190
  Caption = 'Nearest map objects'
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
  object ListObjects: TListView
    Left = 0
    Top = 0
    Width = 373
    Height = 163
    Align = alClient
    Color = clInfoBk
    Columns = <
      item
        Caption = 'Name'
        Width = 200
      end
      item
        Caption = 'Type'
        Width = 500
      end>
    ColumnClick = False
    DragMode = dmAutomatic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    GridLines = True
    HideSelection = False
    RowSelect = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = ListObjectsDblClick
  end
end
