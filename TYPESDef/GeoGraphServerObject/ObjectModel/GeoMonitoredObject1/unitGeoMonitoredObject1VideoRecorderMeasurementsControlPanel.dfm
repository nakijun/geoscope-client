object fmGeoMonitoredObject1VideoRecorderMeasurementsControlPanel: TfmGeoMonitoredObject1VideoRecorderMeasurementsControlPanel
  Left = 140
  Top = 200
  Width = 1202
  Height = 626
  Caption = 'Measurements'
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
  object Splitter1: TSplitter
    Left = 590
    Top = 0
    Height = 599
  end
  object gbMeasurements: TGroupBox
    Left = 0
    Top = 0
    Width = 590
    Height = 599
    Align = alLeft
    Caption = ' Video recorder measurements '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object gbDataServerMeasurements: TGroupBox
    Left = 593
    Top = 0
    Width = 601
    Height = 599
    Align = alClient
    Caption = ' Stored measurements '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
end
