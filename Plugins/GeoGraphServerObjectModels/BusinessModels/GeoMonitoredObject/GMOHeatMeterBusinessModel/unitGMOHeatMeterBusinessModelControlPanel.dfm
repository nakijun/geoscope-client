object GMOHeatMeterBusinessModelControlPanel: TGMOHeatMeterBusinessModelControlPanel
  Left = 247
  Top = 18
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Control panel'
  ClientHeight = 600
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 34
    Align = alTop
    TabOrder = 0
    DesignSize = (
      384
      34)
    object lbConnectionStatus: TLabel
      Left = 32
      Top = 1
      Width = 254
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
    end
    object lbConnectionLastCheckpointTime: TLabel
      Left = 32
      Top = 16
      Width = 254
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object stConnectionStatus: TStaticText
      Left = 8
      Top = 10
      Width = 17
      Height = 16
      AutoSize = False
      BorderStyle = sbsSingle
      TabOrder = 0
    end
    object bbObjectModel: TBitBtn
      Left = 296
      Top = 9
      Width = 81
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'properties'
      TabOrder = 1
      OnClick = bbObjectModelClick
    end
  end
  object gbIncoming: TGroupBox
    Left = 0
    Top = 34
    Width = 384
    Height = 37
    Align = alTop
    Caption = ' State '
    TabOrder = 1
    DesignSize = (
      384
      37)
    object Label1: TLabel
      Left = 8
      Top = 13
      Width = 69
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Alert'
    end
    object edAlert: TEdit
      Left = 80
      Top = 10
      Width = 254
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object gbOutgoing: TGroupBox
    Left = 0
    Top = 146
    Width = 384
    Height = 14
    Align = alTop
    Caption = ' Commands '
    TabOrder = 2
    Visible = False
    object cbDisableObjectMoving: TCheckBox
      Left = 24
      Top = 24
      Width = 313
      Height = 17
      Caption = 'Disable object moving'
      TabOrder = 0
      OnClick = cbDisableObjectMovingClick
    end
    object cbDisableObject: TCheckBox
      Left = 24
      Top = 48
      Width = 313
      Height = 17
      Caption = 'Disable object'
      TabOrder = 1
      OnClick = cbDisableObjectClick
    end
    object bbGetCurrentPosition: TBitBtn
      Left = 24
      Top = 72
      Width = 313
      Height = 25
      Caption = 'Get current position'
      TabOrder = 2
      OnClick = bbGetCurrentPositionClick
    end
  end
  object gbDayLogTracks: TGroupBox
    Left = 0
    Top = 368
    Width = 384
    Height = 230
    Caption = ' Object tracks history '
    TabOrder = 3
    Visible = False
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 329
      Height = 16
      AutoSize = False
      Caption = 'Add track into the current "Reflector"'
    end
    object stChangeNewTrackColor: TSpeedButton
      Left = 208
      Top = 44
      Width = 24
      Height = 23
      Flat = True
    end
    object Label4: TLabel
      Left = 8
      Top = 112
      Width = 42
      Height = 16
      Caption = 'Tracks'
    end
    object Label8: TLabel
      Left = 107
      Top = 42
      Width = 7
      Height = 20
      AutoSize = False
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TrackBeginDayPicker: TDateTimePicker
      Left = 16
      Top = 44
      Width = 89
      Height = 24
      Date = 39493.638079965270000000
      Time = 39493.638079965270000000
      TabOrder = 0
    end
    object bbAddDayTrackToTheCurrentReflector: TBitBtn
      Left = 236
      Top = 40
      Width = 73
      Height = 30
      Caption = 'Add'
      TabOrder = 1
      OnClick = bbAddDayTrackToTheCurrentReflectorClick
    end
    object stNewTrackColor: TStaticText
      Left = 209
      Top = 45
      Width = 22
      Height = 21
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clYellow
      ParentColor = False
      TabOrder = 2
      OnClick = stNewTrackColorClick
    end
    object stDayTracksTableOrigin: TStaticText
      Left = 8
      Top = 128
      Width = 345
      Height = 1
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = ' '
      TabOrder = 3
    end
    object cbAddObjectModelTrackEvents: TCheckBox
      Left = 16
      Top = 72
      Width = 329
      Height = 17
      Caption = 'Add object-model track events'
      TabOrder = 4
    end
    object cbAddBusinessModelTrackEvents: TCheckBox
      Left = 16
      Top = 88
      Width = 329
      Height = 17
      Caption = 'Add business-model track events'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object TrackEndDayPicker: TDateTimePicker
      Left = 116
      Top = 44
      Width = 89
      Height = 24
      Date = 39493.638079965270000000
      Time = 39493.638079965270000000
      TabOrder = 6
    end
    object bbAddDayTrackToTheCurrentReflectorM1: TBitBtn
      Left = 308
      Top = 40
      Width = 25
      Height = 30
      Caption = '-1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = bbAddDayTrackToTheCurrentReflectorM1Click
    end
    object bbAddDayTrackToTheCurrentReflectorM2: TBitBtn
      Left = 332
      Top = 40
      Width = 25
      Height = 30
      Caption = '-2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = bbAddDayTrackToTheCurrentReflectorM2Click
    end
  end
  object gbConnection: TGroupBox
    Left = 0
    Top = 71
    Width = 384
    Height = 37
    Align = alTop
    Caption = ' Connection '
    TabOrder = 4
    DesignSize = (
      384
      37)
    object Label5: TLabel
      Left = 8
      Top = 13
      Width = 257
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Service provider account '
    end
    object edConnectionServiceProviderAccount: TEdit
      Left = 272
      Top = 10
      Width = 102
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object gbBattery: TGroupBox
    Left = 0
    Top = 108
    Width = 384
    Height = 38
    Align = alTop
    Caption = ' Battery '
    TabOrder = 5
    DesignSize = (
      384
      38)
    object Label6: TLabel
      Left = 8
      Top = 15
      Width = 97
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Voltage'
    end
    object Label7: TLabel
      Left = 200
      Top = 13
      Width = 65
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Charge'
    end
    object edBatteryVoltage: TEdit
      Left = 112
      Top = 10
      Width = 102
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edBatteryCharge: TEdit
      Left = 272
      Top = 10
      Width = 102
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 160
    Width = 384
    Height = 440
    Align = alClient
    Caption = ' Telemetry model '
    TabOrder = 6
    DesignSize = (
      384
      440)
    object Label3: TLabel
      Left = 131
      Top = 393
      Width = 7
      Height = 20
      Anchors = [akRight, akBottom]
      AutoSize = False
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 24
      Width = 121
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'MODEL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 8
      Top = 48
      Width = 121
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #8470
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 8
      Top = 72
      Width = 121
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Object'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 8
      Top = 96
      Width = 121
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LifeTime'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 8
      Top = 120
      Width = 121
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Algo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lvTelemetryModelChannels: TListView
      Left = 8
      Top = 152
      Width = 369
      Height = 225
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <
        item
          Caption = '#'
          Width = 20
        end
        item
          Caption = 'Code'
          Width = 45
        end
        item
          Caption = 'P, MPa'
          Width = 70
        end
        item
          Caption = 'T, C'
        end
        item
          Caption = 'MassFlow, t/h'
          Width = 90
        end
        item
          Caption = 'Heat'
          Width = 70
        end>
      GridLines = True
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
    object btnShowTelemetryModelAnalysis: TBitBtn
      Left = 240
      Top = 391
      Width = 137
      Height = 33
      Anchors = [akRight, akBottom]
      Caption = 'Analysis'
      TabOrder = 1
      OnClick = btnShowTelemetryModelAnalysisClick
    end
    object AnalysisBeginDayPicker: TDateTimePicker
      Left = 40
      Top = 395
      Width = 89
      Height = 24
      Anchors = [akRight, akBottom]
      Date = 39493.638079965270000000
      Time = 39493.638079965270000000
      TabOrder = 2
    end
    object AnalysisEndDayPicker: TDateTimePicker
      Left = 140
      Top = 395
      Width = 89
      Height = 24
      Anchors = [akRight, akBottom]
      Date = 39493.638079965270000000
      Time = 39493.638079965270000000
      TabOrder = 3
    end
    object edModel: TEdit
      Left = 136
      Top = 21
      Width = 241
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 4
    end
    object edSerialNumber: TEdit
      Left = 136
      Top = 45
      Width = 240
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 5
    end
    object edObject: TEdit
      Left = 136
      Top = 69
      Width = 240
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 6
    end
    object edLifeTime: TEdit
      Left = 136
      Top = 93
      Width = 240
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 7
    end
    object edAlgorithm: TEdit
      Left = 136
      Top = 117
      Width = 240
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 8
    end
  end
  object Updater: TTimer
    OnTimer = UpdaterTimer
    Left = 136
    Top = 1
  end
  object ColorDialog: TColorDialog
    Top = 543
  end
  object StressTester: TTimer
    Enabled = False
    Interval = 500
    OnTimer = StressTesterTimer
    Left = 32
    Top = 364
  end
end
