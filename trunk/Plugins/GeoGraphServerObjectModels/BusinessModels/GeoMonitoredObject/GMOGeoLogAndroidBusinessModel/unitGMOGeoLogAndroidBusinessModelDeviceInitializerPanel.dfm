object fmGMOGeoLogAndroidBusinessModelDeviceInitializerPanel: TfmGMOGeoLogAndroidBusinessModelDeviceInitializerPanel
  Left = 196
  Top = 129
  BorderStyle = bsDialog
  Caption = 'Device initializer'
  ClientHeight = 272
  ClientWidth = 938
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 938
    Height = 272
    Align = alClient
    Caption = ' Program installation '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      938
      272)
    object Panel1: TPanel
      Left = 8
      Top = 24
      Width = 921
      Height = 117
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 40
        Height = 115
        Align = alLeft
        Caption = '1.'
        Color = 8454143
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 41
        Top = 1
        Width = 879
        Height = 115
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object StaticText1: TStaticText
          Left = 0
          Top = 0
          Width = 879
          Height = 20
          Align = alTop
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = 'Set necessary parameters for device program'
          Color = clWhite
          ParentColor = False
          TabOrder = 0
        end
        object Panel10: TPanel
          Left = 0
          Top = 20
          Width = 879
          Height = 95
          Align = alClient
          Color = clWhite
          TabOrder = 1
          DesignSize = (
            879
            95)
          object Label1: TLabel
            Left = 8
            Top = 8
            Width = 82
            Height = 16
            Caption = 'GeoSpace ID'
          end
          object Bevel1: TBevel
            Left = 152
            Top = 5
            Width = 721
            Height = 85
            Anchors = [akLeft, akTop, akRight]
            Shape = bsFrame
          end
          object Label2: TLabel
            Left = 176
            Top = 56
            Width = 156
            Height = 16
            AutoSize = False
            Caption = 'transmit interval, seconds'
          end
          object Label3: TLabel
            Left = 400
            Top = 56
            Width = 193
            Height = 16
            AutoSize = False
            Caption = 'location read interval, seconds'
          end
          object Label4: TLabel
            Left = 664
            Top = 56
            Width = 97
            Height = 16
            AutoSize = False
            Caption = 'default map ID'
            FocusControl = btnUploadProgram
          end
          object GeoLog_cbflEnabled: TCheckBox
            Left = 160
            Top = 8
            Width = 113
            Height = 17
            Caption = 'Tracker'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = GeoLog_cbflEnabledClick
          end
          object edGeoSpace: TEdit
            Left = 96
            Top = 5
            Width = 41
            Height = 24
            Enabled = False
            TabOrder = 1
            Text = '88'
          end
          object GeoLog_cbflServerConnection: TCheckBox
            Left = 176
            Top = 32
            Width = 169
            Height = 17
            Caption = 'server connection'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object GeoLog_cbflSaveQueue: TCheckBox
            Left = 344
            Top = 32
            Width = 97
            Height = 17
            Caption = 'save history'
            Enabled = False
            TabOrder = 3
          end
          object GeoLog_edQueueTransmitInterval: TEdit
            Left = 344
            Top = 53
            Width = 49
            Height = 24
            TabOrder = 4
            Text = '60'
          end
          object GeoLog_edGPSModuleProviderReadInterval: TEdit
            Left = 600
            Top = 53
            Width = 49
            Height = 24
            TabOrder = 5
            Text = '5'
          end
          object GeoLog_edGPSModuleMapID: TEdit
            Left = 760
            Top = 53
            Width = 49
            Height = 24
            TabOrder = 6
            Text = '8'
          end
        end
      end
    end
    object Panel4: TPanel
      Left = 8
      Top = 160
      Width = 921
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 40
        Height = 41
        Align = alLeft
        Caption = '2.'
        Color = 8454143
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Panel6: TPanel
        Left = 41
        Top = 1
        Width = 879
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          879
          41)
        object StaticText2: TStaticText
          Left = 0
          Top = 0
          Width = 721
          Height = 41
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = 
            'Attach Android device to the computer and upload program to the ' +
            'device flash disk'
          Color = clWhite
          ParentColor = False
          TabOrder = 0
        end
        object btnUploadProgram: TBitBtn
          Left = 720
          Top = 0
          Width = 159
          Height = 41
          Anchors = [akTop, akRight]
          Caption = 'Upload program'
          TabOrder = 1
          OnClick = btnUploadProgramClick
        end
      end
    end
    object Panel7: TPanel
      Left = 8
      Top = 224
      Width = 921
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      object Panel8: TPanel
        Left = 1
        Top = 1
        Width = 40
        Height = 39
        Align = alLeft
        Caption = '3.'
        Color = 8454143
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Panel9: TPanel
        Left = 41
        Top = 1
        Width = 879
        Height = 39
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object StaticText3: TStaticText
          Left = 0
          Top = 0
          Width = 879
          Height = 39
          Align = alClient
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = 
            'Unplug device from computer. Go to device flash disk and open a ' +
            'folder "Geo.Log". Install program package "GeoLog.apk". Another ' +
            'way is to open android web-browser type "file://sdcard/geo.log/g' +
            'eolog.apk" and accept installation.'
          Color = clWhite
          ParentColor = False
          TabOrder = 0
        end
      end
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerTimer
    Left = 16
    Top = 40
  end
end
