object GMO1GeoLogAndroidBusinessModelControlPanel: TGMO1GeoLogAndroidBusinessModelControlPanel
  Left = 1208
  Top = 176
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Control panel'
  ClientHeight = 582
  ClientWidth = 363
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
    Width = 363
    Height = 41
    Align = alTop
    PopupMenu = PopupMenu
    TabOrder = 0
    DesignSize = (
      363
      41)
    object lbConnectionStatus: TLabel
      Left = 32
      Top = 8
      Width = 233
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      PopupMenu = PopupMenu
    end
    object lbConnectionLastCheckpointTime: TLabel
      Left = 32
      Top = 24
      Width = 233
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu
    end
    object stConnectionStatus: TStaticText
      Left = 8
      Top = 9
      Width = 17
      Height = 16
      AutoSize = False
      BorderStyle = sbsSingle
      TabOrder = 0
    end
    object bbObjectModel: TBitBtn
      Left = 275
      Top = 8
      Width = 81
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'properties'
      TabOrder = 1
      Visible = False
      OnClick = bbObjectModelClick
    end
  end
  object gbIncoming: TGroupBox
    Left = 0
    Top = 41
    Width = 363
    Height = 42
    Align = alTop
    Caption = ' State '
    TabOrder = 1
    DesignSize = (
      363
      42)
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 69
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Alert'
    end
    object edAlert: TEdit
      Left = 80
      Top = 13
      Width = 233
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
    Top = 168
    Width = 363
    Height = 73
    Align = alTop
    Caption = ' Commands '
    TabOrder = 4
    object cbDisableObjectMoving: TCheckBox
      Left = 8
      Top = 20
      Width = 177
      Height = 17
      Caption = 'Disable object moving'
      TabOrder = 0
      OnClick = cbDisableObjectMovingClick
    end
    object cbDisableObject: TCheckBox
      Left = 184
      Top = 20
      Width = 169
      Height = 17
      Caption = 'Disable object'
      TabOrder = 1
      OnClick = cbDisableObjectClick
    end
    object bbGetCurrentPosition: TBitBtn
      Left = 8
      Top = 40
      Width = 345
      Height = 25
      Caption = 'Get current position'
      TabOrder = 2
      OnClick = bbGetCurrentPositionClick
    end
  end
  object gbDayLogTracks: TGroupBox
    Left = 0
    Top = 336
    Width = 363
    Height = 246
    Align = alClient
    Caption = ' Object tracks history '
    TabOrder = 6
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 337
      Height = 16
      AutoSize = False
      Caption = 'Add day track into the current "Reflector"'
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
    object Label3: TLabel
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
    object bbAddDayTrackToTheCurrentReflector: TBitBtn
      Left = 236
      Top = 40
      Width = 73
      Height = 30
      Caption = 'Add'
      TabOrder = 0
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
      TabOrder = 1
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
      TabOrder = 2
    end
    object cbAddObjectModelTrackEvents: TCheckBox
      Left = 16
      Top = 72
      Width = 329
      Height = 17
      Caption = 'Add object-model track events'
      TabOrder = 3
    end
    object cbAddBusinessModelTrackEvents: TCheckBox
      Left = 16
      Top = 88
      Width = 329
      Height = 17
      Caption = 'Add business-model track events'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object TrackBeginDayPicker: TDateTimePicker
      Left = 16
      Top = 44
      Width = 89
      Height = 24
      Date = 39493.638079965270000000
      Time = 39493.638079965270000000
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
  object gbConnector: TGroupBox
    Left = 0
    Top = 83
    Width = 363
    Height = 42
    Align = alTop
    Caption = ' Connector '
    TabOrder = 2
    DesignSize = (
      363
      42)
    object Label5: TLabel
      Left = 184
      Top = 16
      Width = 105
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Account'
    end
    object Label8: TLabel
      Left = 8
      Top = 16
      Width = 105
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Signal'
    end
    object edConnectionServiceProviderAccount: TEdit
      Left = 296
      Top = 13
      Width = 57
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
    object edConnectionServiceProviderSignal: TEdit
      Left = 120
      Top = 12
      Width = 65
      Height = 24
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
    Top = 125
    Width = 363
    Height = 43
    Align = alTop
    Caption = ' Battery '
    TabOrder = 3
    DesignSize = (
      363
      43)
    object Label6: TLabel
      Left = 8
      Top = 16
      Width = 97
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Voltage'
    end
    object Label7: TLabel
      Left = 200
      Top = 16
      Width = 65
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Charge'
    end
    object edBatteryVoltage: TEdit
      Left = 112
      Top = 13
      Width = 81
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
      Top = 13
      Width = 81
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
  object gbVideoRecorder: TGroupBox
    Left = 0
    Top = 241
    Width = 363
    Height = 95
    Align = alTop
    Caption = ' Video recorder '
    TabOrder = 5
    object Label9: TLabel
      Left = 64
      Top = 15
      Width = 49
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mode'
    end
    object cbVideoRecorderModuleSaving: TCheckBox
      Left = 120
      Top = 52
      Width = 105
      Height = 17
      Caption = 'Saving'
      TabOrder = 3
      OnClick = cbVideoRecorderModuleSavingClick
    end
    object cbVideoRecorderModuleActive: TCheckBox
      Left = 8
      Top = 52
      Width = 105
      Height = 17
      Caption = 'Active'
      Enabled = False
      TabOrder = 0
      OnClick = cbVideoRecorderModuleActiveClick
    end
    object cbVideoRecorderModuleRecording: TCheckBox
      Left = 8
      Top = 37
      Width = 105
      Height = 17
      Caption = 'Recording'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = cbVideoRecorderModuleRecordingClick
    end
    object btnVideoRecorderModulePlayer: TBitBtn
      Left = 8
      Top = 70
      Width = 105
      Height = 21
      Caption = 'Video player'
      TabOrder = 6
      OnClick = btnVideoRecorderModulePlayerClick
    end
    object cbVideoRecorderModuleAudio: TCheckBox
      Left = 232
      Top = 37
      Width = 121
      Height = 17
      Caption = 'Audio channel'
      TabOrder = 4
      OnClick = cbVideoRecorderModuleAudioClick
    end
    object cbVideoRecorderModuleVideo: TCheckBox
      Left = 232
      Top = 52
      Width = 121
      Height = 17
      Caption = 'Video channel'
      TabOrder = 5
      OnClick = cbVideoRecorderModuleVideoClick
    end
    object cbVideoRecorderModuleTransmitting: TCheckBox
      Left = 120
      Top = 37
      Width = 105
      Height = 17
      Caption = 'Transmitting'
      TabOrder = 2
      OnClick = cbVideoRecorderModuleTransmittingClick
    end
    object btnVideoRecorderModuleMeasurementsPanel: TBitBtn
      Left = 140
      Top = 70
      Width = 13
      Height = 21
      Caption = 'Records'
      TabOrder = 7
      Visible = False
      OnClick = btnVideoRecorderModuleMeasurementsPanelClick
    end
    object btnVideoRecorderModuleMeasurementsControlPanel: TBitBtn
      Left = 120
      Top = 70
      Width = 201
      Height = 21
      Caption = 'Record archive'
      PopupMenu = btnVideoRecorderModuleMeasurementsControlPanel_PopupMenu
      TabOrder = 8
      OnClick = btnVideoRecorderModuleMeasurementsControlPanelClick
    end
    object btnVideoRecorderModuleDiskMeasurementsPanel: TBitBtn
      Left = 328
      Top = 70
      Width = 25
      Height = 21
      Hint = 'Open database on disk'
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = btnVideoRecorderModuleDiskMeasurementsPanelClick
    end
    object cbVideoRecorderModuleMode: TComboBox
      Left = 120
      Top = 11
      Width = 233
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 10
      OnChange = cbVideoRecorderModuleModeChange
    end
  end
  object Updater: TTimer
    OnTimer = UpdaterTimer
    Left = 136
    Top = 1
  end
  object ColorDialog: TColorDialog
    Left = 256
    Top = 383
  end
  object PopupMenu: TPopupMenu
    Left = 216
    object properties1: TMenuItem
      Caption = 'properties'
      OnClick = properties1Click
    end
  end
  object btnVideoRecorderModuleMeasurementsControlPanel_PopupMenu: TPopupMenu
    Left = 200
    Top = 273
    object Devicearchive1: TMenuItem
      Caption = 'Device archive'
      OnClick = Devicearchive1Click
    end
    object Serverarchive1: TMenuItem
      Caption = 'Server archive'
      OnClick = Serverarchive1Click
    end
  end
end
