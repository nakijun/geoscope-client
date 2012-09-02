object fmGeoObjectTrackStatisticsPanel: TfmGeoObjectTrackStatisticsPanel
  Left = 308
  Top = 57
  Width = 1051
  Height = 890
  Caption = 'Track statistics'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 0
    Top = 314
    Width = 1043
    Height = 5
    Cursor = crVSplit
    Align = alTop
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 319
    Width = 1043
    Height = 5
    Cursor = crVSplit
    Align = alTop
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1043
    Height = 81
    Align = alTop
    Caption = ' Summary '
    TabOrder = 0
    DesignSize = (
      1043
      81)
    object stSummariDistance: TStaticText
      Left = 8
      Top = 24
      Width = 1022
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = sbsSunken
      TabOrder = 0
    end
    object stSummaryNodesNumber: TStaticText
      Left = 8
      Top = 44
      Width = 1022
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = sbsSunken
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 740
    Width = 1043
    Height = 123
    Align = alBottom
    Caption = ' Calculator '
    TabOrder = 1
    DesignSize = (
      1043
      123)
    object Label1: TLabel
      Left = 637
      Top = 26
      Width = 68
      Height = 16
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'from point #'
    end
    object Label2: TLabel
      Left = 789
      Top = 26
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'to point #'
    end
    object StaticText1: TStaticText
      Left = 8
      Top = 24
      Width = 622
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Distance between two points'
      TabOrder = 0
    end
    object cbStartPoint: TComboBox
      Left = 706
      Top = 23
      Width = 84
      Height = 24
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 16
      TabOrder = 1
      OnChange = cbStartPointChange
    end
    object cbFinishPoint: TComboBox
      Left = 850
      Top = 23
      Width = 84
      Height = 24
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 16
      TabOrder = 2
    end
    object bbCalculateDistance: TBitBtn
      Left = 945
      Top = 24
      Width = 89
      Height = 23
      Anchors = [akTop, akRight]
      Caption = 'Calculate'
      TabOrder = 3
      OnClick = bbCalculateDistanceClick
    end
    object memoDistanceResults: TMemo
      Left = 8
      Top = 56
      Width = 1026
      Height = 57
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 324
    Width = 1043
    Height = 416
    Align = alClient
    Caption = ' Object model events '
    TabOrder = 2
    object lvObjectModelEvents: TListView
      Left = 2
      Top = 18
      Width = 1039
      Height = 376
      Align = alClient
      Columns = <
        item
          Caption = 'Time'
          Width = 110
        end
        item
          Caption = 'Severity'
          Width = 70
        end
        item
          Caption = 'Message'
          Width = 300
        end
        item
          Caption = 'Info'
          Width = 500
        end>
      GridLines = True
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
    object stObjectModelEventsSummary: TStaticText
      Left = 2
      Top = 394
      Width = 1039
      Height = 20
      Align = alBottom
      AutoSize = False
      BorderStyle = sbsSunken
      TabOrder = 1
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 81
    Width = 1043
    Height = 233
    Align = alTop
    Caption = ' Business model events '
    TabOrder = 3
    object lvBusinessModelEvents: TListView
      Left = 2
      Top = 18
      Width = 1039
      Height = 193
      Align = alClient
      Columns = <
        item
          Caption = 'Time'
          Width = 110
        end
        item
          Caption = 'Severity'
          Width = 70
        end
        item
          Caption = 'Message'
          Width = 300
        end
        item
          Caption = 'Info'
          Width = 500
        end>
      GridLines = True
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
    object stBusinessModelEventsSummary: TStaticText
      Left = 2
      Top = 211
      Width = 1039
      Height = 20
      Align = alBottom
      AutoSize = False
      BorderStyle = sbsSunken
      TabOrder = 1
    end
  end
  object Updater: TTimer
    OnTimer = UpdaterTimer
    Left = 184
    Top = 65528
  end
end
