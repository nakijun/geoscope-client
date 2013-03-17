object fmGeoMonitoredObject1LANUDPConnectionRepeaterPanel: TfmGeoMonitoredObject1LANUDPConnectionRepeaterPanel
  Left = 359
  Top = 178
  Width = 357
  Height = 218
  Caption = 'Device LAN UDP repeater'
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
  object gbLANUDPEndpoint: TGroupBox
    Left = 0
    Top = 0
    Width = 341
    Height = 73
    Align = alTop
    Caption = '  UDP endpoints'
    TabOrder = 0
    DesignSize = (
      341
      73)
    object Label1: TLabel
      Left = 8
      Top = 45
      Width = 57
      Height = 22
      AutoSize = False
      Caption = 'Address'
    end
    object Label2: TLabel
      Left = 170
      Top = 45
      Width = 105
      Height = 22
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Transmitting Port'
    end
    object Label4: TLabel
      Left = 178
      Top = 17
      Width = 97
      Height = 22
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Receiving Port'
    end
    object Label6: TLabel
      Left = 16
      Top = 17
      Width = 97
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Packet size'
    end
    object edAddress: TEdit
      Left = 64
      Top = 42
      Width = 105
      Height = 24
      TabOrder = 2
      Text = '192.168.1.1'
    end
    object edTransmittingPort: TEdit
      Left = 282
      Top = 42
      Width = 49
      Height = 24
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '0'
    end
    object edReceivingPort: TEdit
      Left = 282
      Top = 14
      Width = 49
      Height = 24
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '0'
    end
    object edPacketSize: TEdit
      Left = 120
      Top = 14
      Width = 49
      Height = 24
      TabOrder = 0
      Text = '128'
    end
  end
  object gbLocalPort: TGroupBox
    Left = 0
    Top = 73
    Width = 341
    Height = 56
    Align = alTop
    Caption = '  Local ports'
    TabOrder = 1
    DesignSize = (
      341
      56)
    object Label3: TLabel
      Left = 22
      Top = 23
      Width = 87
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Receiving Port'
    end
    object Label5: TLabel
      Left = 176
      Top = 23
      Width = 99
      Height = 18
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Transmitting Port'
    end
    object edLocalReceivingPort: TEdit
      Left = 118
      Top = 20
      Width = 51
      Height = 24
      TabOrder = 0
      Text = '0'
    end
    object edLocalTransmittingPort: TEdit
      Left = 282
      Top = 20
      Width = 49
      Height = 24
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '0'
    end
  end
  object gbStatus: TGroupBox
    Left = 0
    Top = 129
    Width = 341
    Height = 51
    Align = alClient
    Caption = ' Status '
    TabOrder = 2
    DesignSize = (
      341
      51)
    object lbStatus: TLabel
      Left = 16
      Top = 21
      Width = 249
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
      Left = 272
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
    Left = 96
    Top = 128
  end
end
