object fmGeoPositionReceiver: TfmGeoPositionReceiver
  Left = 367
  Top = 89
  BorderStyle = bsDialog
  Caption = 'Position Receiver'
  ClientHeight = 532
  ClientWidth = 212
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object gbReceiverPort: TGroupBox
    Left = 0
    Top = 0
    Width = 212
    Height = 49
    Align = alTop
    Caption = ' Receiver Port  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object cbReceiverPort: TComboBox
      Left = 40
      Top = 16
      Width = 137
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 0
    end
  end
  object gbReceiverProtocol: TGroupBox
    Left = 0
    Top = 49
    Width = 212
    Height = 56
    Align = alTop
    Caption = ' Protocol '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object rbGPS: TRadioButton
      Left = 24
      Top = 16
      Width = 177
      Height = 17
      Caption = 'GPS (NMEA)'
      TabOrder = 0
      OnClick = rbGPSClick
    end
    object rbGLONASS: TRadioButton
      Left = 24
      Top = 32
      Width = 177
      Height = 17
      Caption = 'GLONASS'
      TabOrder = 1
      OnClick = rbGLONASSClick
    end
  end
  object pnlDATAProcessors: TPanel
    Left = 0
    Top = 105
    Width = 212
    Height = 327
    Align = alClient
    Caption = 'Protocol is not selected'
    TabOrder = 2
    object pnlGLONASSProcessor: TPanel
      Left = 1
      Top = 1
      Width = 210
      Height = 325
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Not implemented yet'
      TabOrder = 1
      Visible = False
    end
    object pnlGPSProcessor: TPanel
      Left = 1
      Top = 1
      Width = 210
      Height = 325
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 73
        Height = 16
        AutoSize = False
        Caption = 'Latitude'
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 73
        Height = 16
        AutoSize = False
        Caption = 'Longitude'
      end
      object Label3: TLabel
        Left = 8
        Top = 104
        Width = 73
        Height = 16
        AutoSize = False
        Caption = 'Speed'
      end
      object Label4: TLabel
        Left = 8
        Top = 128
        Width = 73
        Height = 16
        AutoSize = False
        Caption = 'Bearing'
      end
      object Label5: TLabel
        Left = 8
        Top = 160
        Width = 73
        Height = 16
        AutoSize = False
        Caption = 'Time'
      end
      object Label6: TLabel
        Left = 8
        Top = 184
        Width = 193
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'satellite info'
      end
      object lbGPSProcessorState: TLabel
        Left = 8
        Top = 3
        Width = 193
        Height = 16
        Alignment = taCenter
        AutoSize = False
      end
      object lbGPSProcessorStatus: TLabel
        Left = 8
        Top = 304
        Width = 193
        Height = 16
        AutoSize = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label7: TLabel
        Left = 8
        Top = 72
        Width = 73
        Height = 16
        AutoSize = False
        Caption = 'Precision'
      end
      object edGPSProcessorLatitude: TEdit
        Left = 81
        Top = 22
        Width = 121
        Height = 24
        BevelKind = bkSoft
        BorderStyle = bsNone
        ReadOnly = True
        TabOrder = 0
      end
      object edGPSProcessorLongitude: TEdit
        Left = 81
        Top = 46
        Width = 121
        Height = 24
        BevelKind = bkSoft
        BorderStyle = bsNone
        ReadOnly = True
        TabOrder = 1
      end
      object edGPSProcessorSpeed: TEdit
        Left = 81
        Top = 102
        Width = 121
        Height = 24
        BevelKind = bkSoft
        BorderStyle = bsNone
        ReadOnly = True
        TabOrder = 3
      end
      object edGPSProcessorBearing: TEdit
        Left = 81
        Top = 126
        Width = 121
        Height = 24
        BevelKind = bkSoft
        BorderStyle = bsNone
        ReadOnly = True
        TabOrder = 4
      end
      object edGPSProcessorTime: TEdit
        Left = 81
        Top = 158
        Width = 121
        Height = 24
        BevelKind = bkSoft
        BorderStyle = bsNone
        ReadOnly = True
        TabOrder = 5
      end
      object memoGPSProcessorSatelliteInfo: TMemo
        Left = 8
        Top = 200
        Width = 193
        Height = 105
        BevelKind = bkSoft
        BorderStyle = bsNone
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object edGPSProcessorPrecision: TEdit
        Left = 81
        Top = 70
        Width = 121
        Height = 24
        BevelKind = bkSoft
        BorderStyle = bsNone
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 432
    Width = 212
    Height = 100
    Align = alBottom
    TabOrder = 3
    object Label8: TLabel
      Left = 8
      Top = 41
      Width = 126
      Height = 16
      Caption = 'Visualization to move'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 1
      Width = 124
      Height = 16
      Caption = 'Update interval (sec)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object bPSProcessorStartStop: TBitBtn
      Left = 144
      Top = 27
      Width = 57
      Height = 46
      Caption = 'Start'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = bPSProcessorStartStopClick
    end
    object cbShowAtReflectorCenter: TCheckBox
      Left = 8
      Top = 78
      Width = 121
      Height = 17
      Caption = 'Show position'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object stObjectVisualization: TStaticText
      Left = 8
      Top = 56
      Width = 121
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PopupMenu = stObjectVisualization_Popup
      TabOrder = 1
    end
    object edUpdateTimeInterval: TEdit
      Left = 8
      Top = 17
      Width = 121
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = edUpdateTimeIntervalKeyPress
    end
  end
  object Updater: TTimer
    OnTimer = UpdaterTimer
    Left = 176
    Top = 65528
  end
  object stObjectVisualization_Popup: TPopupMenu
    Left = 104
    Top = 480
    object Setbyclipboardcomponent1: TMenuItem
      Caption = 'Set by clipboard component'
      OnClick = Setbyclipboardcomponent1Click
    end
    object Clear1: TMenuItem
      Caption = 'Clear'
      OnClick = Clear1Click
    end
  end
end
