object fmEventLogMonitor: TfmEventLogMonitor
  Left = 247
  Top = 165
  BorderStyle = bsDialog
  Caption = 'Event log monitor'
  ClientHeight = 190
  ClientWidth = 193
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 77
    Height = 16
    Caption = 'Server name'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 106
    Height = 16
    Caption = 'QoS send interval'
  end
  object Label3: TLabel
    Left = 8
    Top = 112
    Width = 112
    Height = 16
    Caption = 'Monitor IP address'
  end
  object edServerName: TEdit
    Left = 8
    Top = 24
    Width = 177
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object edQoS_sendInterval: TEdit
    Left = 8
    Top = 72
    Width = 177
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object edMonitorAddress: TEdit
    Left = 8
    Top = 128
    Width = 177
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object bbOK: TBitBtn
    Left = 56
    Top = 160
    Width = 83
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = bbOKClick
  end
end
