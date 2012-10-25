object GeoMonitoredObject1VideoRecorderConfigurationPanel: TGeoMonitoredObject1VideoRecorderConfigurationPanel
  Left = 498
  Top = 190
  Width = 333
  Height = 731
  Caption = 'Videorecorder configuration'
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
    Top = 663
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
    Height = 663
    Align = alClient
    TabOrder = 1
    DesignSize = (
      325
      663)
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 37
      Height = 16
      Caption = 'Name'
    end
    object edName: TEdit
      Left = 16
      Top = 48
      Width = 283
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object gbCameraConfiguration: TGroupBox
      Left = 16
      Top = 80
      Width = 283
      Height = 361
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Camera '
      TabOrder = 2
      DesignSize = (
        283
        361)
      object gbCameraAudioConfiguration: TGroupBox
        Left = 16
        Top = 24
        Width = 251
        Height = 129
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Audio '
        TabOrder = 0
        DesignSize = (
          251
          129)
        object Label8: TLabel
          Left = 16
          Top = 25
          Width = 108
          Height = 16
          Caption = 'Samplerate (SPS)'
        end
        object Label9: TLabel
          Left = 16
          Top = 73
          Width = 75
          Height = 16
          Caption = 'Bitrate (kb/s)'
        end
        object cbCameraAudioSampleRate: TComboBox
          Left = 16
          Top = 41
          Width = 219
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
          Items.Strings = (
            'Default')
        end
        object cbCameraAudioBitRate: TComboBox
          Left = 16
          Top = 89
          Width = 219
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 1
          Items.Strings = (
            'Default')
        end
      end
      object gbCameraVideoConfiguration: TGroupBox
        Left = 16
        Top = 168
        Width = 251
        Height = 177
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Video '
        TabOrder = 1
        DesignSize = (
          251
          177)
        object Label2: TLabel
          Left = 16
          Top = 25
          Width = 64
          Height = 16
          Caption = 'Resolution'
        end
        object Label3: TLabel
          Left = 16
          Top = 73
          Width = 99
          Height = 16
          Caption = 'Framerate (FPS)'
        end
        object Label4: TLabel
          Left = 16
          Top = 121
          Width = 68
          Height = 16
          Caption = 'Bitrate (b/s)'
        end
        object cbCameraVideoResolution: TComboBox
          Left = 16
          Top = 41
          Width = 219
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 0
          Items.Strings = (
            '1280x960'
            '640x480'
            '320x240'
            '176x144')
        end
        object cbCameraVideoFrameRate: TComboBox
          Left = 16
          Top = 89
          Width = 219
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 1
          Items.Strings = (
            'Default'
            '24'
            '20'
            '15'
            '10'
            '8')
        end
        object cbCameraVideoBitRate: TComboBox
          Left = 16
          Top = 137
          Width = 219
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 16
          TabOrder = 2
          Items.Strings = (
            'Default'
            '1000000'
            '500000'
            '100000'
            '50000'
            '10000')
        end
      end
    end
    object gbMeasurementConfiguration: TGroupBox
      Left = 16
      Top = 456
      Width = 283
      Height = 177
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Measurement '
      TabOrder = 3
      DesignSize = (
        283
        177)
      object Label5: TLabel
        Left = 16
        Top = 24
        Width = 133
        Height = 16
        Caption = 'Max duration (minutes)'
      end
      object Label6: TLabel
        Left = 16
        Top = 72
        Width = 90
        Height = 16
        Caption = 'Life time (days)'
      end
      object Label7: TLabel
        Left = 16
        Top = 120
        Width = 144
        Height = 16
        Caption = 'Autosave interval (days)'
      end
      object edMeasurementMaxDuration: TEdit
        Left = 16
        Top = 40
        Width = 251
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edMeasurementLifeTime: TEdit
        Left = 16
        Top = 88
        Width = 251
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object edMeasurementAutosaveInterval: TEdit
        Left = 16
        Top = 136
        Width = 251
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object cbEnabled: TCheckBox
      Left = 16
      Top = 8
      Width = 281
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Enabled'
      TabOrder = 0
    end
  end
end
