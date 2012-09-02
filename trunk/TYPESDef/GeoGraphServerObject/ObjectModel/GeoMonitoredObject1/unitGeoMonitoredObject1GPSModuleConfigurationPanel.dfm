object GeoMonitoredObject1GPSModuleConfigurationPanel: TGeoMonitoredObject1GPSModuleConfigurationPanel
  Left = 380
  Top = 149
  Width = 334
  Height = 871
  Caption = 'GPS module configuration'
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
    Top = 803
    Width = 326
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      326
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
      Left = 191
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
    Width = 326
    Height = 803
    Align = alClient
    TabOrder = 1
    DesignSize = (
      326
      803)
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 214
      Height = 16
      Caption = 'Provider read interval (milliseconds)'
    end
    object Label1: TLabel
      Left = 24
      Top = 64
      Width = 43
      Height = 16
      Caption = 'Map ID'
    end
    object edProviderReadInterval: TEdit
      Left = 24
      Top = 32
      Width = 274
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object edMapID: TEdit
      Left = 24
      Top = 80
      Width = 274
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object gbMapPOI: TGroupBox
      Left = 24
      Top = 112
      Width = 274
      Height = 681
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Map POI (point of interest)'
      TabOrder = 2
      DesignSize = (
        274
        681)
      object gbMediaFragmentConfiguration: TGroupBox
        Left = 14
        Top = 216
        Width = 244
        Height = 457
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Media fragment settings '
        TabOrder = 1
        DesignSize = (
          244
          457)
        object Label11: TLabel
          Left = 16
          Top = 400
          Width = 42
          Height = 16
          Caption = 'Format'
        end
        object Label12: TLabel
          Left = 16
          Top = 352
          Width = 109
          Height = 16
          Caption = 'Max duration (sec)'
        end
        object gbMediaFragmentAudioConfiguration: TGroupBox
          Left = 16
          Top = 24
          Width = 212
          Height = 129
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Audio '
          TabOrder = 0
          DesignSize = (
            212
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
          object cbMediaFragmentAudioSampleRate: TComboBox
            Left = 16
            Top = 41
            Width = 180
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 16
            TabOrder = 0
            Items.Strings = (
              'Default')
          end
          object cbMediaFragmentAudioBitRate: TComboBox
            Left = 16
            Top = 89
            Width = 180
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 16
            TabOrder = 1
            Items.Strings = (
              'Default')
          end
        end
        object gbMediaFragmentVideoConfiguration: TGroupBox
          Left = 16
          Top = 168
          Width = 212
          Height = 177
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Video '
          TabOrder = 1
          DesignSize = (
            212
            177)
          object Label3: TLabel
            Left = 16
            Top = 25
            Width = 64
            Height = 16
            Caption = 'Resolution'
          end
          object Label4: TLabel
            Left = 16
            Top = 73
            Width = 99
            Height = 16
            Caption = 'Framerate (FPS)'
          end
          object Label5: TLabel
            Left = 16
            Top = 121
            Width = 75
            Height = 16
            Caption = 'Bitrate (kb/s)'
          end
          object cbMediaFragmentVideoResolution: TComboBox
            Left = 16
            Top = 41
            Width = 180
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
          object cbMediaFragmentVideoFrameRate: TComboBox
            Left = 16
            Top = 89
            Width = 180
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
          object cbMediaFragmentVideoBitRate: TComboBox
            Left = 16
            Top = 137
            Width = 180
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
        object edMediaFragmentFormat: TEdit
          Left = 16
          Top = 416
          Width = 210
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        object edMediaFragmentMaxDuration: TEdit
          Left = 16
          Top = 368
          Width = 210
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
      end
      object gbMapPOIImage: TGroupBox
        Left = 16
        Top = 24
        Width = 242
        Height = 177
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Picture settings '
        TabOrder = 0
        DesignSize = (
          242
          177)
        object Label6: TLabel
          Left = 16
          Top = 72
          Width = 64
          Height = 16
          Caption = 'Quality (%)'
        end
        object Label7: TLabel
          Left = 16
          Top = 25
          Width = 64
          Height = 16
          Caption = 'Resolution'
        end
        object Label10: TLabel
          Left = 16
          Top = 120
          Width = 42
          Height = 16
          Caption = 'Format'
        end
        object edImageQuality: TEdit
          Left = 16
          Top = 88
          Width = 210
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object cbImageResolution: TComboBox
          Left = 16
          Top = 41
          Width = 210
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
        object edImageFormat: TEdit
          Left = 16
          Top = 136
          Width = 210
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
      end
    end
  end
end
