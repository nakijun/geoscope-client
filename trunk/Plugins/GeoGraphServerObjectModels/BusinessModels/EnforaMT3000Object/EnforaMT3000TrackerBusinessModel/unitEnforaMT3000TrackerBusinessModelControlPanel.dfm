object EnforaMT3000TrackerBusinessModelControlPanel: TEnforaMT3000TrackerBusinessModelControlPanel
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
    Top = 349
    Width = 363
    Height = 233
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
    Top = 273
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
    Height = 308
    Align = alTop
    TabOrder = 3
    DesignSize = (
      363
      308)
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
      Top = 50
      Width = 62
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Signal'
    end
    object Label5: TLabel
      Left = 136
      Top = 50
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
      Top = 75
      Width = 345
      Height = 2
      Style = bsRaised
    end
    object Label37: TLabel
      Left = 192
      Top = 249
      Width = 161
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Accelerometer, mG'
    end
    object Label9: TLabel
      Left = 44
      Top = 88
      Width = 101
      Height = 16
      AutoSize = False
      Caption = 'Stop'
    end
    object Label10: TLabel
      Left = 164
      Top = 88
      Width = 101
      Height = 16
      AutoSize = False
      Caption = 'Idle'
    end
    object Label11: TLabel
      Left = 284
      Top = 88
      Width = 69
      Height = 16
      AutoSize = False
      Caption = 'Motion'
    end
    object Label12: TLabel
      Left = 164
      Top = 112
      Width = 101
      Height = 16
      AutoSize = False
      Caption = 'Malfunction'
    end
    object Label13: TLabel
      Left = 164
      Top = 136
      Width = 189
      Height = 16
      AutoSize = False
      Caption = 'Low Battery'
    end
    object Label14: TLabel
      Left = 44
      Top = 136
      Width = 101
      Height = 16
      AutoSize = False
      Caption = 'Low Fuel'
    end
    object Bevel6: TBevel
      Left = 8
      Top = 163
      Width = 345
      Height = 2
      Style = bsRaised
    end
    object Label15: TLabel
      Left = 44
      Top = 176
      Width = 101
      Height = 16
      AutoSize = False
      Caption = 'Ignition'
    end
    object Label16: TLabel
      Left = 164
      Top = 176
      Width = 149
      Height = 16
      AutoSize = False
      Caption = 'Tow Alert'
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
    object Label41: TLabel
      Left = 8
      Top = 250
      Width = 169
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Tachometer, RPM'
    end
    object Label42: TLabel
      Left = 8
      Top = 197
      Width = 169
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Speedometer, Km/h'
    end
    object Label17: TLabel
      Left = 192
      Top = 197
      Width = 161
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Odometer, Km'
    end
    object Label18: TLabel
      Left = 44
      Top = 112
      Width = 101
      Height = 16
      AutoSize = False
      Caption = 'GPS'
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
      Top = 47
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
      TabOrder = 18
      Visible = False
    end
    object cbDisableObjectMoving: TCheckBox
      Left = 8
      Top = 444
      Width = 177
      Height = 17
      Caption = 'Disable object moving'
      TabOrder = 22
      Visible = False
      OnClick = cbDisableObjectMovingClick
    end
    object cbDisableObject: TCheckBox
      Left = 184
      Top = 444
      Width = 169
      Height = 17
      Caption = 'Disable object'
      TabOrder = 23
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
      Top = 67
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
      TabOrder = 19
      Visible = False
      OnClick = cbBatteryModuleIsExternalPowerClick
    end
    object cbBatteryModuleIsLowPowerMode: TCheckBox
      Left = 232
      Top = 395
      Width = 121
      Height = 17
      Caption = 'Low power mode'
      TabOrder = 20
      Visible = False
      OnClick = cbBatteryModuleIsExternalPowerClick
    end
    object edConnectionServiceProviderSignal: TEdit
      Left = 72
      Top = 47
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
    object gbOBDIIModule: TPanel
      Left = 8
      Top = 424
      Width = 345
      Height = 41
      TabOrder = 21
      Visible = False
      object Label39: TLabel
        Left = 0
        Top = 9
        Width = 73
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Accum, V'
      end
      object Label40: TLabel
        Left = 144
        Top = 9
        Width = 65
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Fuel, L'
      end
      object edOBDIIModuleBatteryModuleValue: TEdit
        Left = 76
        Top = 6
        Width = 53
        Height = 24
        AutoSize = False
        ReadOnly = True
        TabOrder = 0
      end
      object edOBDIIModuleFuelModuleValue: TEdit
        Left = 212
        Top = 6
        Width = 53
        Height = 24
        AutoSize = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object stStatusModuleIsStop: TStaticText
      Left = 24
      Top = 88
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
    object stStatusModuleIsIdle: TStaticText
      Left = 144
      Top = 88
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
      Top = 88
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
    object stStatusModuleIsMIL: TStaticText
      Left = 144
      Top = 112
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
    object edOBDIIModuleMILAlertModuleAlertCodes: TEdit
      Left = 264
      Top = 109
      Width = 89
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 11
    end
    object stOBDIIModuleBatteryModuleIsLow: TStaticText
      Left = 144
      Top = 136
      Width = 17
      Height = 17
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
    end
    object stOBDIIModuleFuelModuleIsLow: TStaticText
      Left = 24
      Top = 136
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
    object StaticText6: TStaticText
      Left = 16
      Top = 155
      Width = 88
      Height = 20
      Caption = ' Parameters'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
    end
    object stIgnitionModuleValue: TStaticText
      Left = 24
      Top = 176
      Width = 17
      Height = 17
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
    end
    object stTowAlertModuleValue: TStaticText
      Left = 144
      Top = 176
      Width = 17
      Height = 17
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
    end
    object edOBDIIModuleStateModuleVIN: TEdit
      Left = 208
      Top = 350
      Width = 145
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
      Visible = False
    end
    object edOBDIIModuleSpeedometerModuleValue: TMemo
      Left = 32
      Top = 216
      Width = 121
      Height = 31
      Alignment = taCenter
      BevelKind = bkFlat
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8388863
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 24
    end
    object edOBDIIModuleTachometerModuleValue: TMemo
      Left = 32
      Top = 267
      Width = 121
      Height = 31
      Alignment = taCenter
      BevelKind = bkFlat
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 25
    end
    object edOBDIIModuleOdometerModuleValue: TMemo
      Left = 216
      Top = 216
      Width = 113
      Height = 31
      Alignment = taCenter
      BevelKind = bkFlat
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 26
    end
    object edAccelerometerModuleValue: TMemo
      Left = 216
      Top = 267
      Width = 113
      Height = 31
      Alignment = taCenter
      BevelKind = bkFlat
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 27
    end
    object stGPSModuleIsActive: TStaticText
      Left = 24
      Top = 112
      Width = 17
      Height = 17
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clSilver
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
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
    Top = 88
  end
end
