object fmCreatingComponents: TfmCreatingComponents
  Left = 184
  Top = 158
  Width = 452
  Height = 307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 444
    Height = 280
    Align = alClient
    Style = bsRaised
  end
  object ListObjects: TListView
    Left = 0
    Top = 0
    Width = 444
    Height = 280
    Align = alClient
    Color = clBtnFace
    Columns = <
      item
        Caption = #1048#1084#1103' '#1086#1073#1098#1077#1082#1090#1072
        Width = 420
      end>
    ColumnClick = False
    DragMode = dmAutomatic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HideSelection = False
    RowSelect = True
    ParentFont = False
    ParentShowHint = False
    PopupMenu = Popup
    ShowColumnHeaders = False
    ShowHint = True
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = ListObjectsDblClick
    OnEdited = ListObjectsEdited
    OnDragDrop = ListObjectsDragDrop
    OnDragOver = ListObjectsDragOver
  end
  object Popup: TPopupMenu
    Left = 16
    Top = 16
    object N1: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Add object'
      OnClick = N1Click
    end
    object N2: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Remove '
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = 'Alpha sorting'
      OnClick = N3Click
    end
  end
end
