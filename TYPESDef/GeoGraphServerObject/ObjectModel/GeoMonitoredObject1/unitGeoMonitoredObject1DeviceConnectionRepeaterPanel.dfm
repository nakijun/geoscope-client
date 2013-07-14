object fmGeoMonitoredObject1DeviceConnectionRepeaterPanel: TfmGeoMonitoredObject1DeviceConnectionRepeaterPanel
  Left = 346
  Top = 188
  Width = 262
  Height = 248
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
  object gbLocalPort: TGroupBox
    Left = 0
    Top = 0
    Width = 246
    Height = 42
    Align = alTop
    Caption = '  Local port  '
    TabOrder = 0
    DesignSize = (
      246
      42)
    object Label3: TLabel
      Left = 89
      Top = 15
      Width = 33
      Height = 16
      Anchors = [akTop, akRight, akBottom]
      AutoSize = False
      Caption = 'Port'
    end
    object edLocalPort: TEdit
      Left = 121
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
    Top = 42
    Width = 246
    Height = 55
    Align = alTop
    Caption = ' Status '
    TabOrder = 1
    DesignSize = (
      246
      55)
    object lbStatus: TLabel
      Left = 16
      Top = 21
      Width = 154
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
      Left = 177
      Top = 16
      Width = 55
      Height = 27
      Anchors = [akTop, akRight]
      Caption = 'Start'
      TabOrder = 0
      OnClick = btnStartStopClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 97
    Width = 246
    Height = 113
    Align = alClient
    Caption = ' Operations '
    TabOrder = 2
    DesignSize = (
      246
      113)
    object btnGetGPSFix: TBitBtn
      Left = 8
      Top = 24
      Width = 225
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Get GPS fix'
      TabOrder = 0
      OnClick = btnGetGPSFixClick
    end
  end
  object Updater: TTimer
    Enabled = False
    OnTimer = UpdaterTimer
    Left = 104
    Top = 88
  end
end
