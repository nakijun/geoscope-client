object GeoMonitoredObject1ControlModulePanel: TGeoMonitoredObject1ControlModulePanel
  Left = 569
  Top = 311
  Width = 385
  Height = 187
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
    Top = 40
    Width = 361
    Height = 25
    Caption = 'Get Device Log'
    TabOrder = 1
    OnClick = btnGetDeviceLogClick
  end
  object btnGetDeviceState: TBitBtn
    Left = 8
    Top = 8
    Width = 361
    Height = 25
    Caption = 'Get Device State'
    TabOrder = 0
    OnClick = btnGetDeviceStateClick
  end
  object btnRestartDeviceProcess: TBitBtn
    Left = 8
    Top = 120
    Width = 361
    Height = 25
    Caption = 'Restart device process'
    TabOrder = 3
    OnClick = btnRestartDeviceProcessClick
  end
  object btnRestartDevice: TBitBtn
    Left = 8
    Top = 88
    Width = 361
    Height = 25
    Caption = 'Restart device'
    TabOrder = 2
    OnClick = btnRestartDeviceClick
  end
end
