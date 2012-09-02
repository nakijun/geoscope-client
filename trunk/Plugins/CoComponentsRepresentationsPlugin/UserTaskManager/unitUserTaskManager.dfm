object fmUserTaskManager: TfmUserTaskManager
  Left = 146
  Top = 196
  Width = 1396
  Height = 174
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'User task manager'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lvTasks: TListView
    Left = 0
    Top = 26
    Width = 1388
    Height = 121
    Align = alClient
    Columns = <
      item
        Caption = #8470
      end
      item
        Caption = 'Time'
        Width = 100
      end
      item
        Caption = 'Priority'
        Width = 100
      end
      item
        Caption = 'Type'
        Width = 100
      end
      item
        Caption = 'Service'
        Width = 150
      end
      item
        Caption = 'Comment'
        Width = 200
      end
      item
        Caption = 'Status'
        Width = 100
      end
      item
        Caption = 'Status comment'
        Width = 150
      end
      item
        Caption = 'Result time'
        Width = 120
      end
      item
        Caption = 'Result'
        Width = 80
      end
      item
        Caption = 'Result comment'
        Width = 200
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
    OnAdvancedCustomDrawSubItem = lvTasksAdvancedCustomDrawSubItem
    OnDblClick = lvTasksDblClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1388
    Height = 26
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object cbTaskEnabledUser: TCheckBox
      Left = 52
      Top = 4
      Width = 113
      Height = 17
      Caption = 'Active'
      TabOrder = 0
      OnClick = cbTaskEnabledUserClick
    end
    object pnlActiveState: TPanel
      Left = 2
      Top = 2
      Width = 21
      Height = 21
      Color = clWindow
      TabOrder = 1
    end
    object pnlNewTaskState: TPanel
      Left = 26
      Top = 2
      Width = 21
      Height = 21
      Color = clWindow
      TabOrder = 2
    end
  end
  object NewTaskStateUpdater: TTimer
    Enabled = False
    Interval = 333
    OnTimer = NewTaskStateUpdaterTimer
    Left = 392
    Top = 65528
  end
end
