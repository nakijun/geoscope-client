object EnforaMiniMTTrackerBusinessModelControlPanel: TEnforaMiniMTTrackerBusinessModelControlPanel
  Left = 834
  Top = 216
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
      Width = 78
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'properties'
      TabOrder = 1
      Visible = False
      OnClick = bbObjectModelClick
    end
  end
  object gbDayLogTracks: TGroupBox
    Left = 0
    Top = 289
    Width = 363
    Height = 293
    Align = alClient
    Caption = ' Object tracks history '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
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
  object edBatteryVoltage: TEdit
    Left = 72
    Top = 249
    Width = 41
    Height = 24
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 363
    Height = 248
    Align = alTop
    TabOrder = 3
    DesignSize = (
      363
      248)
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 62
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Alert'
    end
    object Label8: TLabel
      Left = 8
      Top = 54
      Width = 62
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Signal'
    end
    object Label5: TLabel
      Left = 136
      Top = 54
      Width = 121
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Account'
    end
    object Label6: TLabel
      Left = 8
      Top = 396
      Width = 62
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Voltage'
      Visible = False
    end
    object Label7: TLabel
      Left = 8
      Top = 424
      Width = 65
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Charge'
      Visible = False
    end
    object Bevel1: TBevel
      Left = 8
      Top = 40
      Width = 345
      Height = 2
      Style = bsRaised
    end
    object Bevel2: TBevel
      Left = 8
      Top = 83
      Width = 345
      Height = 2
      Style = bsRaised
    end
    object Label9: TLabel
      Left = 164
      Top = 99
      Width = 101
      Height = 16
      AutoSize = False
      Caption = 'Stop'
    end
    object Label11: TLabel
      Left = 284
      Top = 99
      Width = 69
      Height = 16
      AutoSize = False
      Caption = 'Motion'
    end
    object Bevel6: TBevel
      Left = 8
      Top = 131
      Width = 345
      Height = 2
      Style = bsRaised
    end
    object Label15: TLabel
      Left = 44
      Top = 152
      Width = 309
      Height = 16
      AutoSize = False
      Caption = 'Battery Alarm'
    end
    object Label45: TLabel
      Left = 182
      Top = 353
      Width = 25
      Height = 16
      AutoSize = False
      Caption = 'VIN'
      Visible = False
    end
    object Label18: TLabel
      Left = 44
      Top = 99
      Width = 101
      Height = 16
      AutoSize = False
      Caption = 'GPS'
    end
    object Label10: TLabel
      Left = 44
      Top = 184
      Width = 309
      Height = 16
      AutoSize = False
      Caption = 'Button Alarm'
    end
    object Label12: TLabel
      Left = 44
      Top = 216
      Width = 309
      Height = 16
      AutoSize = False
      Caption = 'Speed Alarm'
    end
    object edAlert: TEdit
      Left = 72
      Top = 7
      Width = 97
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edConnectionServiceProviderAccount: TEdit
      Left = 264
      Top = 51
      Width = 57
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edBatteryCharge: TEdit
      Left = 80
      Top = 421
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
      TabOrder = 13
      Visible = False
    end
    object cbDisableObjectMoving: TCheckBox
      Left = 8
      Top = 444
      Width = 177
      Height = 17
      Caption = 'Disable object moving'
      TabOrder = 16
      Visible = False
      OnClick = cbDisableObjectMovingClick
    end
    object cbDisableObject: TCheckBox
      Left = 184
      Top = 444
      Width = 169
      Height = 17
      Caption = 'Disable object'
      TabOrder = 17
      Visible = False
      OnClick = cbDisableObjectClick
    end
    object bbGetCurrentPosition: TBitBtn
      Left = 192
      Top = 6
      Width = 161
      Height = 25
      Caption = 'Current position'
      TabOrder = 1
      OnClick = bbGetCurrentPositionClick
    end
    object StaticText1: TStaticText
      Left = 16
      Top = 32
      Width = 113
      Height = 20
      Caption = ' Communication'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object StaticText2: TStaticText
      Left = 16
      Top = 75
      Width = 48
      Height = 20
      Caption = ' State '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object cbBatteryModuleIsExternalPower: TCheckBox
      Left = 120
      Top = 396
      Width = 113
      Height = 17
      Caption = 'External power'
      TabOrder = 14
      Visible = False
      OnClick = cbBatteryModuleIsExternalPowerClick
    end
    object cbBatteryModuleIsLowPowerMode: TCheckBox
      Left = 232
      Top = 395
      Width = 121
      Height = 17
      Caption = 'Low power mode'
      TabOrder = 15
      Visible = False
      OnClick = cbBatteryModuleIsExternalPowerClick
    end
    object edConnectionServiceProviderSignal: TEdit
      Left = 72
      Top = 51
      Width = 57
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object stStatusModuleIsStop: TStaticText
      Left = 144
      Top = 99
      Width = 17
      Height = 17
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object stStatusModuleIsMotion: TStaticText
      Left = 264
      Top = 99
      Width = 17
      Height = 17
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
    end
    object StaticText6: TStaticText
      Left = 16
      Top = 123
      Width = 93
      Height = 20
      Caption = ' Alarm status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8388863
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object stAlarmStatusModuleIsBatteryAlarm: TStaticText
      Left = 24
      Top = 152
      Width = 17
      Height = 17
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
    end
    object stGPSModuleIsActive: TStaticText
      Left = 24
      Top = 99
      Width = 17
      Height = 17
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
    object stAlarmStatusModuleIsButtonAlarm: TStaticText
      Left = 24
      Top = 184
      Width = 17
      Height = 17
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
    end
    object stAlarmStatusModuleIsSpeedAlarm: TStaticText
      Left = 24
      Top = 216
      Width = 17
      Height = 17
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
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
  object StateBlinker: TTimer
    Interval = 500
    OnTimer = StateBlinkerTimer
    Left = 160
    Top = 80
  end
end
