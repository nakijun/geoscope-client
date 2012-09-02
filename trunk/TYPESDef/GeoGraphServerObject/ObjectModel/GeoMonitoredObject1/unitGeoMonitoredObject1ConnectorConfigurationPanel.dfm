object GeoMonitoredObject1ConnectorConfigurationPanel: TGeoMonitoredObject1ConnectorConfigurationPanel
  Left = 498
  Top = 190
  Width = 333
  Height = 200
  Caption = 'Connector configuration'
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
  object Panel1: TPanel
    Left = 0
    Top = 132
    Width = 325
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      325
      41)
    object btnApply: TBitBtn
      Left = 16
      Top = 8
      Width = 113
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TBitBtn
      Left = 190
      Top = 8
      Width = 109
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 325
    Height = 132
    Align = alClient
    TabOrder = 1
    DesignSize = (
      325
      132)
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 182
      Height = 16
      Caption = 'Loop sleep time (milliseconds)'
    end
    object Label1: TLabel
      Left = 24
      Top = 64
      Width = 184
      Height = 16
      Caption = 'Transmit interval (milliseconds)'
    end
    object edLoopSleepTime: TEdit
      Left = 24
      Top = 32
      Width = 273
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object edTransmitInterval: TEdit
      Left = 24
      Top = 80
      Width = 273
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
  end
end
