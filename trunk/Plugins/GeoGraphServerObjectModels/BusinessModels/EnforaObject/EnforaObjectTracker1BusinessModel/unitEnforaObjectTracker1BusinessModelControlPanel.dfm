object EnforaObjectTracker1BusinessModelControlPanel: TEnforaObjectTracker1BusinessModelControlPanel
  Left = 393
  Top = 63
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Enfora Car Tracker Control panel'
  ClientHeight = 485
  ClientWidth = 364
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
    Width = 364
    Height = 41
    Align = alTop
    PopupMenu = PopupMenu
    TabOrder = 0
    DesignSize = (
      364
      41)
    object lbConnectionStatus: TLabel
      Left = 32
      Top = 8
      Width = 297
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      PopupMenu = PopupMenu
    end
    object lbConnectionLastCheckpointTime: TLabel
      Left = 32
      Top = 24
      Width = 297
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
      Left = 273
      Top = 8
      Width = 81
      Height = 25
      Caption = 'properties'
      TabOrder = 1
      Visible = False
      OnClick = bbObjectModelClick
    end
  end
  object gbIncoming: TGroupBox
    Left = 0
    Top = 41
    Width = 364
    Height = 105
    Align = alClient
    Caption = ' State '
    Color = clBtnFace
    ParentColor = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 69
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Alert'
    end
    object Label8: TLabel
      Left = 8
      Top = 64
      Width = 69
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Doors state'
    end
    object edAlert: TEdit
      Left = 80
      Top = 29
      Width = 209
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
    object edDoorsState: TEdit
      Left = 80
      Top = 61
      Width = 209
      Height = 24
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
  object gbOutgoing: TGroupBox
    Left = 0
    Top = 146
    Width = 364
    Height = 74
    Align = alBottom
    Caption = ' Commands '
    Color = clBtnFace
    ParentColor = False
    TabOrder = 2
    object cbDisableObjectMoving: TCheckBox
      Left = 24
      Top = 48
      Width = 313
      Height = 17
      Caption = 'Disable object moving'
      TabOrder = 1
      OnClick = cbDisableObjectMovingClick
    end
    object bbGetCurrentPosition: TBitBtn
      Left = 24
      Top = 20
      Width = 313
      Height = 25
      Caption = 'Get current position'
      TabOrder = 0
      OnClick = bbGetCurrentPositionClick
    end
  end
  object gbDayLogTracks: TGroupBox
    Left = 0
    Top = 220
    Width = 364
    Height = 265
    Align = alBottom
    Caption = ' Object tracks history '
    Color = clBtnFace
    ParentColor = False
    TabOrder = 3
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 257
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
      Left = 272
      Top = 37
      Width = 73
      Height = 30
      Caption = 'Add'
      TabOrder = 3
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
      TabOrder = 4
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
      TabOrder = 5
    end
    object cbAddObjectModelTrackEvents: TCheckBox
      Left = 16
      Top = 72
      Width = 329
      Height = 17
      Caption = 'Add object-model track events'
      TabOrder = 1
    end
    object cbAddBusinessModelTrackEvents: TCheckBox
      Left = 16
      Top = 88
      Width = 329
      Height = 17
      Caption = 'Add business-model track events'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 380
    Width = 364
    Height = 44
    Caption = ' Connection '
    Color = clBtnFace
    ParentColor = False
    TabOrder = 4
    Visible = False
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
    Top = 430
    Width = 364
    Height = 46
    Caption = ' Battery '
    Color = clBtnFace
    ParentColor = False
    TabOrder = 5
    Visible = False
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
    Left = 224
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
