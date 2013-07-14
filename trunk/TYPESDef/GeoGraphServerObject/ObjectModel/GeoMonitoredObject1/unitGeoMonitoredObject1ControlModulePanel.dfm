object GeoMonitoredObject1ControlModulePanel: TGeoMonitoredObject1ControlModulePanel
  Left = 769
  Top = 328
  Width = 385
  Height = 361
  Caption = 'Control module panel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object btnGetDeviceLog: TBitBtn
    Left = 8
    Top = 48
    Width = 353
    Height = 25
    Caption = 'Get Device Log'
    TabOrder = 1
    OnClick = btnGetDeviceLogClick
  end
  object btnGetDeviceState: TBitBtn
    Left = 8
    Top = 16
    Width = 353
    Height = 25
    Caption = 'Get Device State'
    TabOrder = 0
    OnClick = btnGetDeviceStateClick
  end
  object btnRestartDeviceProcess: TBitBtn
    Left = 8
    Top = 128
    Width = 353
    Height = 25
    Caption = 'Restart device process'
    TabOrder = 3
    OnClick = btnRestartDeviceProcessClick
  end
  object btnRestartDevice: TBitBtn
    Left = 8
    Top = 96
    Width = 353
    Height = 25
    Caption = 'Restart device'
    TabOrder = 2
    OnClick = btnRestartDeviceClick
  end
  object btnLANConnectionRepeater: TBitBtn
    Left = 8
    Top = 208
    Width = 353
    Height = 25
    Caption = 'LAN connection repeater'
    TabOrder = 5
    OnClick = btnLANConnectionRepeaterClick
  end
  object btnLANUDPConnectionRepeater: TBitBtn
    Left = 8
    Top = 240
    Width = 353
    Height = 25
    Caption = 'LAN UDP connection repeater'
    TabOrder = 6
    OnClick = btnLANUDPConnectionRepeaterClick
  end
  object btnLANRTSPServerClient: TBitBtn
    Left = 8
    Top = 280
    Width = 353
    Height = 25
    Caption = 'LAN RTSP server client'
    TabOrder = 7
    OnClick = btnLANRTSPServerClientClick
  end
  object btnDeviceConnectionRepeater: TBitBtn
    Left = 8
    Top = 176
    Width = 353
    Height = 25
    Caption = 'Device connection repeater'
    TabOrder = 4
    OnClick = btnDeviceConnectionRepeaterClick
  end
end
