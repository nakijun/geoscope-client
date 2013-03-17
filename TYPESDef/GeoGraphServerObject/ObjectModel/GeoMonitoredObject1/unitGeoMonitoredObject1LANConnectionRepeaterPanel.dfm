object fmGeoMonitoredObject1LANConnectionRepeaterPanel: TfmGeoMonitoredObject1LANConnectionRepeaterPanel
  Left = 346
  Top = 188
  Width = 271
  Height = 179
  Caption = 'Device LAN repeater'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object gbLANEndpoint: TGroupBox
    Left = 0
    Top = 0
    Width = 255
    Height = 49
    Align = alTop
    Caption = '  LAN endpoint  '
    TabOrder = 0
    DesignSize = (
      255
      49)
    object Label1: TLabel
      Left = 8
      Top = 19
      Width = 57
      Height = 16
      Anchors = [akLeft, akTop, akBottom]
      AutoSize = False
      Caption = 'Address'
    end
    object Label2: TLabel
      Left = 178
      Top = 19
      Width = 33
      Height = 16
      Anchors = [akTop, akRight, akBottom]
      AutoSize = False
      Caption = 'Port'
    end
    object edAddress: TEdit
      Left = 64
      Top = 16
      Width = 106
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = '192.168.1.1'
    end
    object edPort: TEdit
      Left = 210
      Top = 16
      Width = 33
      Height = 24
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '80'
    end
  end
  object gbLocalPort: TGroupBox
    Left = 0
    Top = 49
    Width = 255
    Height = 42
    Align = alTop
    Caption = '  Local port  '
    TabOrder = 1
    DesignSize = (
      255
      42)
    object Label3: TLabel
      Left = 98
      Top = 15
      Width = 33
      Height = 16
      Anchors = [akTop, akRight, akBottom]
      AutoSize = False
      Caption = 'Port'
    end
    object edLocalPort: TEdit
      Left = 130
      Top = 12
      Width = 39
      Height = 24
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '80'
    end
  end
  object gbStatus: TGroupBox
    Left = 0
    Top = 91
    Width = 255
    Height = 50
    Align = alClient
    Caption = ' Status '
    TabOrder = 2
    DesignSize = (
      255
      50)
    object lbStatus: TLabel
      Left = 16
      Top = 21
      Width = 163
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnStartStop: TBitBtn
      Left = 186
      Top = 16
      Width = 59
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Start'
      TabOrder = 0
      OnClick = btnStartStopClick
    end
  end
  object Updater: TTimer
    Enabled = False
    OnTimer = UpdaterTimer
    Left = 104
    Top = 88
  end
end
