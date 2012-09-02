object GMOTrackLogger1BusinessModelControlPanel: TGMOTrackLogger1BusinessModelControlPanel
  Left = 303
  Top = 2
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
      OnClick = bbObjectModelClick
    end
  end
  object gbIncoming: TGroupBox
    Left = 0
    Top = 41
    Width = 363
    Height = 72
    Align = alTop
    Caption = ' State '
    TabOrder = 1
    DesignSize = (
      363
      72)
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 69
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Alert'
    end
    object edAlert: TEdit
      Left = 80
      Top = 29
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
    Top = 203
    Width = 363
    Height = 105
    Align = alTop
    Caption = ' Commands '
    TabOrder = 2
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
    Top = 308
    Width = 363
    Height = 274
    Align = alClient
    Caption = ' Object tracks history '
    TabOrder = 3
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
    Top = 113
    Width = 363
    Height = 44
    Align = alTop
    Caption = ' Connection '
    TabOrder = 4
    DesignSize = (
      363
      44)
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Service provider account '
    end
    object edConnectionServiceProviderAccount: TEdit
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
      TabOrder = 0
    end
  end
  object gbBattery: TGroupBox
    Left = 0
    Top = 157
    Width = 363
    Height = 46
    Align = alTop
    Caption = ' Battery '
    TabOrder = 5
    DesignSize = (
      363
      46)
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
  object Updater: TTimer
    OnTimer = UpdaterTimer
    Left = 136
    Top = 1
  end
  object ColorDialog: TColorDialog
    Left = 96
    Top = 223
  end
  object StressTester: TTimer
    Enabled = False
    Interval = 500
    OnTimer = StressTesterTimer
    Left = 256
    Top = 308
  end
end
