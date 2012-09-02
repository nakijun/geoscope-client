object GSTraqObjectMainTrackerBusinessModelControlPanel: TGSTraqObjectMainTrackerBusinessModelControlPanel
  Left = 673
  Top = 227
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Control panel'
  ClientHeight = 533
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
      Left = 267
      Top = 8
      Width = 86
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
    Height = 74
    Align = alClient
    Caption = ' State '
    Color = clBtnFace
    ParentColor = False
    TabOrder = 1
    DesignSize = (
      363
      74)
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
      Width = 169
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
    object btnResetAlert: TBitBtn
      Left = 256
      Top = 29
      Width = 97
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Reset alert'
      TabOrder = 1
      OnClick = btnResetAlertClick
    end
  end
  object gbOutgoing: TGroupBox
    Left = 0
    Top = 203
    Width = 363
    Height = 65
    Align = alBottom
    Caption = ' Commands '
    Color = clBtnFace
    ParentColor = False
    TabOrder = 2
    object cbDisableObjectMoving: TCheckBox
      Left = 24
      Top = 76
      Width = 313
      Height = 17
      Caption = 'Disable object moving'
      TabOrder = 0
      Visible = False
      OnClick = cbDisableObjectMovingClick
    end
    object cbDisableObject: TCheckBox
      Left = 24
      Top = 32
      Width = 313
      Height = 17
      Caption = 'Disable object'
      TabOrder = 1
      Visible = False
      OnClick = cbDisableObjectClick
    end
    object bbGetCurrentPosition: TBitBtn
      Left = 24
      Top = 24
      Width = 313
      Height = 25
      Caption = 'Get current position'
      Enabled = False
      TabOrder = 2
      OnClick = bbGetCurrentPositionClick
    end
  end
  object gbDayLogTracks: TGroupBox
    Left = 0
    Top = 268
    Width = 363
    Height = 265
    Align = alBottom
    Caption = ' Object tracks history '
    Color = clBtnFace
    ParentColor = False
    TabOrder = 3
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 321
      Height = 16
      AutoSize = False
      Caption = 'Add day track into the current "Reflector"'
    end
    object Label3: TLabel
      Left = 120
      Top = 48
      Width = 41
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Color'
    end
    object stChangeNewTrackColor: TSpeedButton
      Left = 170
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
    object TrackDayPicker: TDateTimePicker
      Left = 16
      Top = 44
      Width = 105
      Height = 24
      Date = 39493.638079965270000000
      Time = 39493.638079965270000000
      TabOrder = 0
    end
    object bbAddDayTrackToTheCurrentReflector: TBitBtn
      Left = 264
      Top = 37
      Width = 73
      Height = 30
      Caption = 'Add'
      TabOrder = 1
      OnClick = bbAddDayTrackToTheCurrentReflectorClick
    end
    object stNewTrackColor: TStaticText
      Left = 171
      Top = 45
      Width = 22
      Height = 21
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clRed
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
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 115
    Width = 363
    Height = 44
    Align = alBottom
    Caption = ' Connection '
    Color = clBtnFace
    ParentColor = False
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
  object GroupBox2: TGroupBox
    Left = 0
    Top = 159
    Width = 363
    Height = 44
    Align = alBottom
    Caption = ' Battery '
    Color = clBtnFace
    ParentColor = False
    TabOrder = 5
    DesignSize = (
      363
      44)
    object Label6: TLabel
      Left = 8
      Top = 88
      Width = 97
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Voltage'
      Visible = False
    end
    object Label7: TLabel
      Left = 112
      Top = 16
      Width = 65
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Charge'
    end
    object Label8: TLabel
      Left = 8
      Top = 128
      Width = 169
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Internal battery state'
      Visible = False
    end
    object Label9: TLabel
      Left = 8
      Top = 160
      Width = 169
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'External battery state'
      Visible = False
    end
    object edBatteryVoltage: TEdit
      Left = 112
      Top = 85
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
      TabOrder = 2
      Visible = False
    end
    object edBatteryCharge: TEdit
      Left = 184
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
      TabOrder = 3
    end
    object edBatteryInternalBatteryState: TEdit
      Left = 184
      Top = 125
      Width = 169
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
      Visible = False
    end
    object edBatteryExternalBatteryState: TEdit
      Left = 184
      Top = 157
      Width = 169
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
      Visible = False
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
  object PopupMenu: TPopupMenu
    Left = 192
    object properties1: TMenuItem
      Caption = 'properties'
      OnClick = properties1Click
    end
  end
end
