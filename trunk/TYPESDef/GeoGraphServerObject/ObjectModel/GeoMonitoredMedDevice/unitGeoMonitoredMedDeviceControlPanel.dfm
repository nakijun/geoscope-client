object GeoMonitoredMedDeviceControlPanel: TGeoMonitoredMedDeviceControlPanel
  Left = 146
  Top = 3
  BorderStyle = bsNone
  ClientHeight = 866
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 556
    Height = 866
    Align = alClient
    Color = 12632540
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu
    TabOrder = 0
    DesignSize = (
      556
      866)
    object Label1: TLabel
      Left = 16
      Top = 80
      Width = 137
      Height = 16
      AutoSize = False
      Caption = 'Visualization'
    end
    object Label2: TLabel
      Left = 14
      Top = 104
      Width = 56
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Type'
    end
    object Label3: TLabel
      Left = 14
      Top = 184
      Width = 56
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'ID'
    end
    object Label4: TLabel
      Left = 16
      Top = 160
      Width = 137
      Height = 16
      AutoSize = False
      Caption = 'Hint visualization'
    end
    object Label5: TLabel
      Left = 14
      Top = 128
      Width = 56
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'ID'
    end
    object Label16: TLabel
      Left = 16
      Top = 24
      Width = 137
      Height = 16
      AutoSize = False
      Caption = 'Geospace '
    end
    object Label17: TLabel
      Left = 14
      Top = 48
      Width = 56
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'ID'
    end
    object Label22: TLabel
      Left = 16
      Top = 216
      Width = 137
      Height = 16
      AutoSize = False
      Caption = 'User Alert'
    end
    object Label23: TLabel
      Left = 14
      Top = 240
      Width = 56
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'ID'
    end
    object Label24: TLabel
      Left = 16
      Top = 272
      Width = 137
      Height = 16
      AutoSize = False
      Caption = 'Online flag'
    end
    object Label25: TLabel
      Left = 14
      Top = 296
      Width = 56
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'ID'
    end
    object Label35: TLabel
      Left = 16
      Top = 320
      Width = 137
      Height = 16
      AutoSize = False
      Caption = 'LocationIsAvail flag'
    end
    object GroupBox1: TGroupBox
      Left = 208
      Top = 1
      Width = 347
      Height = 864
      Align = alRight
      Caption = ' Device '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 8
        Top = 112
        Width = 329
        Height = 177
        Caption = ' Connector '
        TabOrder = 1
        object Label6: TLabel
          Left = 12
          Top = 40
          Width = 155
          Height = 16
          AutoSize = False
          Caption = 'Checkpoint interval (sec)'
        end
        object Label7: TLabel
          Left = 16
          Top = 64
          Width = 129
          Height = 16
          AutoSize = False
          Caption = 'Last checkpoint time'
        end
        object lbConnectionModuleStatus: TLabel
          Left = 16
          Top = 16
          Width = 245
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
        end
        object edConnectionModuleCheckpointInterval: TEdit
          Left = 168
          Top = 37
          Width = 113
          Height = 24
          AutoSize = False
          TabOrder = 1
          OnKeyPress = edConnectionModuleCheckpointIntervalKeyPress
        end
        object edConnectionModuleLastCheckpointTime: TEdit
          Left = 168
          Top = 61
          Width = 113
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 2
        end
        object stConnectionModuleStatus: TStaticText
          Left = 264
          Top = 17
          Width = 17
          Height = 16
          AutoSize = False
          BorderStyle = sbsSingle
          TabOrder = 0
        end
        object gbConnectionModuleServiceProvider: TGroupBox
          Left = 16
          Top = 88
          Width = 297
          Height = 81
          Caption = ' Service Provider '
          TabOrder = 3
          object Label19: TLabel
            Left = 8
            Top = 51
            Width = 57
            Height = 16
            AutoSize = False
            Caption = 'Account'
          end
          object Label26: TLabel
            Left = 8
            Top = 19
            Width = 73
            Height = 16
            AutoSize = False
            Caption = 'Provider ID'
          end
          object Label27: TLabel
            Left = 192
            Top = 51
            Width = 41
            Height = 16
            AutoSize = False
            Caption = 'Tariff'
          end
          object Label28: TLabel
            Left = 120
            Top = 19
            Width = 49
            Height = 16
            AutoSize = False
            Caption = 'Number'
          end
          object edConnectionModuleServiceProviderAccount: TEdit
            Left = 64
            Top = 49
            Width = 89
            Height = 24
            AutoSize = False
            ReadOnly = True
            TabOrder = 0
          end
          object edConnectionModuleServiceProviderID: TEdit
            Left = 80
            Top = 17
            Width = 33
            Height = 24
            AutoSize = False
            TabOrder = 1
            OnKeyPress = edConnectionModuleServiceProviderIDKeyPress
          end
          object edConnectionModuleServiceProviderTariff: TEdit
            Left = 232
            Top = 49
            Width = 57
            Height = 24
            AutoSize = False
            TabOrder = 2
            OnKeyPress = edConnectionModuleServiceProviderTariffKeyPress
          end
          object edConnectionModuleServiceNumber: TEdit
            Left = 176
            Top = 17
            Width = 113
            Height = 24
            AutoSize = False
            TabOrder = 3
            OnKeyPress = edConnectionModuleServiceNumberKeyPress
          end
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 289
        Width = 329
        Height = 217
        Caption = ' GPS module '
        TabOrder = 2
        object Label8: TLabel
          Left = 8
          Top = 56
          Width = 49
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Latitude'
        end
        object Label9: TLabel
          Left = 152
          Top = 56
          Width = 63
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Longitude'
        end
        object Label10: TLabel
          Left = 4
          Top = 80
          Width = 53
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Altitude'
        end
        object Label11: TLabel
          Left = 154
          Top = 80
          Width = 61
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Precision'
        end
        object Label12: TLabel
          Left = 12
          Top = 144
          Width = 75
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Fix time'
        end
        object Label13: TLabel
          Left = 12
          Top = 184
          Width = 75
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Treshold (m)'
        end
        object Label14: TLabel
          Left = 12
          Top = 24
          Width = 75
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Datum ID'
        end
        object Label15: TLabel
          Left = 4
          Top = 104
          Width = 53
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Speed'
        end
        object Label18: TLabel
          Left = 156
          Top = 104
          Width = 59
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Bearing'
        end
        object edGPSModuleFixLatitude: TEdit
          Left = 58
          Top = 53
          Width = 97
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 2
        end
        object edGPSModuleFixLongitude: TEdit
          Left = 216
          Top = 53
          Width = 97
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 3
        end
        object edGPSModuleFixAltitude: TEdit
          Left = 58
          Top = 77
          Width = 97
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 4
        end
        object edGPSModuleFixPrecision: TEdit
          Left = 216
          Top = 77
          Width = 97
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 5
        end
        object edGPSModuleFixTime: TEdit
          Left = 88
          Top = 141
          Width = 193
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 8
        end
        object edGPSModuleDistanceThreshold: TEdit
          Left = 88
          Top = 181
          Width = 193
          Height = 24
          AutoSize = False
          TabOrder = 9
          OnKeyPress = edGPSModuleDistanceThresholdKeyPress
        end
        object edGPSModuleDatumID: TEdit
          Left = 88
          Top = 21
          Width = 25
          Height = 24
          AutoSize = False
          Enabled = False
          TabOrder = 0
        end
        object cbGPSModuleDatumID: TComboBox
          Left = 112
          Top = 21
          Width = 169
          Height = 24
          Style = csDropDownList
          DropDownCount = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 16
          ParentFont = False
          TabOrder = 1
          OnChange = cbGPSModuleDatumIDChange
        end
        object edGPSModuleFixSpeed: TEdit
          Left = 58
          Top = 101
          Width = 97
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 6
        end
        object edGPSModuleFixBearing: TEdit
          Left = 216
          Top = 101
          Width = 97
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 7
        end
      end
      object gbGPIModule: TGroupBox
        Left = 8
        Top = 506
        Width = 329
        Height = 71
        Caption = ' GPI module '
        TabOrder = 3
        object edGPIModuleValue: TEdit
          Left = 280
          Top = 16
          Width = 41
          Height = 24
          AutoSize = False
          TabOrder = 0
          OnKeyPress = edGPIModuleValueKeyPress
        end
      end
      object gbGPOModule: TGroupBox
        Left = 8
        Top = 577
        Width = 329
        Height = 70
        Caption = ' GPO module '
        TabOrder = 4
        object edGPOModuleValue: TEdit
          Left = 280
          Top = 16
          Width = 41
          Height = 24
          AutoSize = False
          TabOrder = 0
          OnKeyPress = edGPOModuleValueKeyPress
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 745
        Width = 329
        Height = 56
        Caption = ' Battery '
        TabOrder = 5
        object Label20: TLabel
          Left = 16
          Top = 25
          Width = 57
          Height = 16
          AutoSize = False
          Caption = 'Voltage'
        end
        object Label21: TLabel
          Left = 168
          Top = 25
          Width = 57
          Height = 16
          AutoSize = False
          Caption = 'Charge'
        end
        object edBatteryModuleVoltage: TEdit
          Left = 72
          Top = 22
          Width = 81
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 0
        end
        object edBatteryModuleCharge: TEdit
          Left = 224
          Top = 22
          Width = 81
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 17
        Width = 329
        Height = 96
        Caption = 'Descriptor'
        TabOrder = 0
        object Label29: TLabel
          Left = 8
          Top = 17
          Width = 65
          Height = 16
          AutoSize = False
          Caption = 'Vendor ID'
        end
        object Label30: TLabel
          Left = 8
          Top = 41
          Width = 65
          Height = 16
          AutoSize = False
          Caption = 'Model ID'
        end
        object Label31: TLabel
          Left = 141
          Top = 16
          Width = 28
          Height = 17
          AutoSize = False
          Caption = 'S/N'
        end
        object Label32: TLabel
          Left = 144
          Top = 41
          Width = 97
          Height = 16
          AutoSize = False
          Caption = 'Production date'
        end
        object Label33: TLabel
          Left = 8
          Top = 68
          Width = 73
          Height = 16
          AutoSize = False
          Caption = 'HW Version'
        end
        object Label34: TLabel
          Left = 168
          Top = 68
          Width = 73
          Height = 16
          AutoSize = False
          Caption = 'SW Version'
        end
        object edDeviceDescriptorVendorID: TEdit
          Left = 72
          Top = 14
          Width = 65
          Height = 24
          AutoSize = False
          TabOrder = 0
          OnKeyPress = edDeviceDescriptorVendorIDKeyPress
        end
        object edDeviceDescriptorModelID: TEdit
          Left = 72
          Top = 38
          Width = 65
          Height = 24
          AutoSize = False
          TabOrder = 1
          OnKeyPress = edDeviceDescriptorModelIDKeyPress
        end
        object edDeviceDescriptorSerialNumber: TEdit
          Left = 168
          Top = 14
          Width = 153
          Height = 24
          AutoSize = False
          TabOrder = 2
          OnKeyPress = edDeviceDescriptorSerialNumberKeyPress
        end
        object edDeviceDescriptorProductionDate: TEdit
          Left = 240
          Top = 38
          Width = 81
          Height = 24
          AutoSize = False
          TabOrder = 3
          OnKeyPress = edDeviceDescriptorProductionDateKeyPress
        end
        object edDeviceDescriptorHWVersion: TEdit
          Left = 80
          Top = 65
          Width = 81
          Height = 24
          AutoSize = False
          TabOrder = 4
          OnKeyPress = edDeviceDescriptorHWVersionKeyPress
        end
        object edDeviceDescriptorSWVersion: TEdit
          Left = 240
          Top = 65
          Width = 81
          Height = 24
          AutoSize = False
          TabOrder = 5
          OnKeyPress = edDeviceDescriptorSWVersionKeyPress
        end
      end
      object gbADCModule: TGroupBox
        Left = 8
        Top = 649
        Width = 329
        Height = 48
        Caption = ' ADC module '
        TabOrder = 6
        object edADCModuleValue: TEdit
          Left = 8
          Top = 16
          Width = 313
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object gbDACModule: TGroupBox
        Left = 8
        Top = 697
        Width = 329
        Height = 48
        Caption = ' DAC module '
        TabOrder = 7
        object edDACModuleValue: TEdit
          Left = 8
          Top = 16
          Width = 313
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object gbMedDeviceModule: TGroupBox
        Left = 8
        Top = 801
        Width = 329
        Height = 56
        Caption = ' MED Module '
        TabOrder = 8
        object Label36: TLabel
          Left = 8
          Top = 25
          Width = 65
          Height = 16
          AutoSize = False
          Caption = 'Domains'
        end
        object edMedDeviceModuleDomains: TEdit
          Left = 72
          Top = 22
          Width = 249
          Height = 24
          AutoSize = False
          TabOrder = 0
          OnKeyPress = edMedDeviceModuleDomainsKeyPress
        end
      end
    end
    object edVisualizationType: TEdit
      Left = 72
      Top = 101
      Width = 81
      Height = 24
      AutoSize = False
      TabOrder = 2
      OnKeyPress = edVisualizationTypeKeyPress
    end
    object edVisualizationID: TEdit
      Left = 72
      Top = 125
      Width = 81
      Height = 24
      AutoSize = False
      TabOrder = 3
      OnKeyPress = edVisualizationIDKeyPress
    end
    object edHintID: TEdit
      Left = 72
      Top = 181
      Width = 81
      Height = 24
      AutoSize = False
      TabOrder = 4
      OnKeyPress = edHintIDKeyPress
    end
    object edGeoSpaceID: TEdit
      Left = 72
      Top = 45
      Width = 81
      Height = 24
      AutoSize = False
      TabOrder = 1
      OnKeyPress = edGeoSpaceIDKeyPress
    end
    object bbUpdatePanel: TBitBtn
      Left = 0
      Top = 841
      Width = 121
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Update panel'
      TabOrder = 7
      OnClick = bbUpdatePanelClick
    end
    object edUserAlertID: TEdit
      Left = 72
      Top = 237
      Width = 81
      Height = 24
      AutoSize = False
      TabOrder = 5
      OnKeyPress = edUserAlertIDKeyPress
    end
    object edOnlineFlagID: TEdit
      Left = 72
      Top = 293
      Width = 81
      Height = 24
      AutoSize = False
      TabOrder = 6
      OnKeyPress = edOnlineFlagIDKeyPress
    end
    object edLocationIsAvailableFlagID: TEdit
      Left = 72
      Top = 341
      Width = 81
      Height = 24
      AutoSize = False
      TabOrder = 8
      OnKeyPress = edLocationIsAvailableFlagIDKeyPress
    end
  end
  object Updater: TTimer
    OnTimer = UpdaterTimer
    Left = 496
    Top = 1
  end
  object PopupMenu: TPopupMenu
    Left = 88
    Top = 616
    object Geographserverobjecttracing1: TMenuItem
      Caption = 'Geograph server object tracing'
      OnClick = Geographserverobjecttracing1Click
    end
    object Geographservercontroltracing1: TMenuItem
      Caption = 'Geograph server control tracing'
      OnClick = Geographservercontroltracing1Click
    end
  end
end
