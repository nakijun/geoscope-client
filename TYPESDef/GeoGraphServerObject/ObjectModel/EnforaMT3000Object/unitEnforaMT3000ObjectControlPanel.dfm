object EnforaMT3000ObjectControlPanel: TEnforaMT3000ObjectControlPanel
  Left = 480
  Top = 283
  BorderStyle = bsNone
  ClientHeight = 628
  ClientWidth = 835
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
    Width = 835
    Height = 628
    Align = alClient
    Color = 16760799
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu
    TabOrder = 0
    DesignSize = (
      835
      628)
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
    object sbGeoSpace: TSpeedButton
      Left = 128
      Top = 45
      Width = 25
      Height = 24
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = sbGeoSpaceClick
    end
    object GroupBox1: TGroupBox
      Left = 224
      Top = 1
      Width = 610
      Height = 626
      Align = alRight
      Caption = ' Device '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object gbOBDIIModule: TGroupBox
        Left = 352
        Top = 184
        Width = 249
        Height = 433
        Caption = ' OBDII interface '
        TabOrder = 8
        object gbOBDIIModuleBatteryModule: TGroupBox
          Left = 8
          Top = 137
          Width = 233
          Height = 44
          Caption = ' Battery (Accumulator)'
          TabOrder = 1
          object Label39: TLabel
            Left = 8
            Top = 17
            Width = 73
            Height = 16
            AutoSize = False
            Caption = 'Voltage, V'
          end
          object edOBDIIModuleBatteryModuleValue: TEdit
            Left = 80
            Top = 14
            Width = 73
            Height = 24
            AutoSize = False
            ReadOnly = True
            TabOrder = 0
          end
          object cbOBDIIModuleBatteryModuleIsLow: TCheckBox
            Left = 160
            Top = 17
            Width = 65
            Height = 17
            Caption = 'Low'
            TabOrder = 1
            OnClick = cbStatusModuleIsMotionClick
          end
        end
        object gbOBDIIModuleFuelModule: TGroupBox
          Left = 8
          Top = 185
          Width = 233
          Height = 44
          Caption = ' Fuel '
          TabOrder = 2
          object Label40: TLabel
            Left = 24
            Top = 17
            Width = 57
            Height = 16
            AutoSize = False
            Caption = 'Value, L'
          end
          object edOBDIIModuleFuelModuleValue: TEdit
            Left = 80
            Top = 14
            Width = 73
            Height = 24
            AutoSize = False
            ReadOnly = True
            TabOrder = 0
          end
          object cbOBDIIModuleFuelModuleIsLow: TCheckBox
            Left = 160
            Top = 17
            Width = 65
            Height = 17
            Caption = 'Low'
            TabOrder = 1
            OnClick = cbStatusModuleIsMotionClick
          end
        end
        object gbOBDIIModuleTachometerModule: TGroupBox
          Left = 8
          Top = 233
          Width = 233
          Height = 44
          Caption = ' Tachometer '
          TabOrder = 3
          object Label41: TLabel
            Left = 16
            Top = 17
            Width = 81
            Height = 16
            AutoSize = False
            Caption = 'Value, RPM'
          end
          object edOBDIIModuleTachometerModuleValue: TEdit
            Left = 96
            Top = 14
            Width = 89
            Height = 24
            AutoSize = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object gbOBDIIModuleSpeedometerModule: TGroupBox
          Left = 8
          Top = 281
          Width = 233
          Height = 44
          Caption = ' Speedometer '
          TabOrder = 4
          object Label42: TLabel
            Left = 16
            Top = 17
            Width = 81
            Height = 16
            AutoSize = False
            Caption = 'Speed, Km/h'
          end
          object edOBDIIModuleSpeedometerModuleValue: TEdit
            Left = 96
            Top = 14
            Width = 89
            Height = 24
            AutoSize = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object gbOBDIIModuleMILAlertModule: TGroupBox
          Left = 8
          Top = 329
          Width = 233
          Height = 44
          Caption = ' Mulfunction indicator '
          TabOrder = 5
          object Label43: TLabel
            Left = 24
            Top = 17
            Width = 73
            Height = 16
            AutoSize = False
            Caption = 'Alert codes'
          end
          object edOBDIIModuleMILAlertModuleAlertCodes: TEdit
            Left = 96
            Top = 14
            Width = 89
            Height = 24
            AutoSize = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object gbOBDIIModuleOdometerModule: TGroupBox
          Left = 8
          Top = 377
          Width = 233
          Height = 44
          Caption = ' Odometer '
          TabOrder = 6
          object Label44: TLabel
            Left = 72
            Top = 17
            Width = 25
            Height = 16
            AutoSize = False
            Caption = 'Km'
          end
          object edOBDIIModuleOdometerModuleValue: TEdit
            Left = 96
            Top = 14
            Width = 89
            Height = 24
            AutoSize = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object gbOBDIIModuleStateModule: TGroupBox
          Left = 8
          Top = 17
          Width = 233
          Height = 104
          Caption = ' State '
          TabOrder = 0
          object Label38: TLabel
            Left = 72
            Top = 17
            Width = 57
            Height = 16
            AutoSize = False
            Caption = 'Protocol'
          end
          object Label45: TLabel
            Left = 8
            Top = 49
            Width = 25
            Height = 16
            AutoSize = False
            Caption = 'VIN'
          end
          object Label46: TLabel
            Left = 8
            Top = 77
            Width = 73
            Height = 16
            AutoSize = False
            Caption = 'Enfora PKG'
          end
          object edOBDIIModuleStateModuleProtocol: TEdit
            Left = 128
            Top = 14
            Width = 97
            Height = 24
            AutoSize = False
            ReadOnly = True
            TabOrder = 0
          end
          object cbOBDIIModuleStateModuleIsPresent: TCheckBox
            Left = 8
            Top = 17
            Width = 65
            Height = 17
            Caption = 'On/Off'
            TabOrder = 1
            OnClick = cbStatusModuleIsMotionClick
          end
          object edOBDIIModuleStateModuleVIN: TEdit
            Left = 32
            Top = 46
            Width = 193
            Height = 24
            AutoSize = False
            ReadOnly = True
            TabOrder = 2
          end
          object edOBDIIModuleStateModuleEnforaPKG: TEdit
            Left = 80
            Top = 74
            Width = 145
            Height = 24
            AutoSize = False
            ReadOnly = True
            TabOrder = 3
          end
        end
      end
      object gbConnectorModule: TGroupBox
        Left = 8
        Top = 224
        Width = 329
        Height = 177
        Caption = ' Connector '
        TabOrder = 2
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
            Caption = 'Signal'
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
          object edConnectionModuleServiceProviderSignal: TEdit
            Left = 232
            Top = 49
            Width = 57
            Height = 24
            AutoSize = False
            TabOrder = 2
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
      object gbGPSModule: TGroupBox
        Left = 8
        Top = 401
        Width = 329
        Height = 216
        Caption = ' GPS module '
        TabOrder = 3
        object Label8: TLabel
          Left = 8
          Top = 72
          Width = 49
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Latitude'
        end
        object Label9: TLabel
          Left = 152
          Top = 72
          Width = 63
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Longitude'
        end
        object Label10: TLabel
          Left = 4
          Top = 96
          Width = 53
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Altitude'
        end
        object Label11: TLabel
          Left = 154
          Top = 96
          Width = 61
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Precision'
        end
        object Label12: TLabel
          Left = 12
          Top = 152
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
          Top = 40
          Width = 75
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Datum ID'
        end
        object Label15: TLabel
          Left = 4
          Top = 120
          Width = 53
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Speed'
        end
        object Label18: TLabel
          Left = 156
          Top = 120
          Width = 59
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Bearing'
        end
        object edGPSModuleFixLatitude: TEdit
          Left = 58
          Top = 69
          Width = 97
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 3
        end
        object edGPSModuleFixLongitude: TEdit
          Left = 216
          Top = 69
          Width = 97
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 4
        end
        object edGPSModuleFixAltitude: TEdit
          Left = 58
          Top = 93
          Width = 97
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 5
        end
        object edGPSModuleFixPrecision: TEdit
          Left = 216
          Top = 93
          Width = 97
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 6
        end
        object edGPSModuleFixTime: TEdit
          Left = 88
          Top = 149
          Width = 193
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 9
        end
        object edGPSModuleDistanceThreshold: TEdit
          Left = 88
          Top = 181
          Width = 193
          Height = 24
          AutoSize = False
          TabOrder = 10
          OnKeyPress = edGPSModuleDistanceThresholdKeyPress
        end
        object edGPSModuleDatumID: TEdit
          Left = 88
          Top = 37
          Width = 25
          Height = 24
          AutoSize = False
          Enabled = False
          TabOrder = 1
        end
        object cbGPSModuleDatumID: TComboBox
          Left = 112
          Top = 37
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
          TabOrder = 2
          OnChange = cbGPSModuleDatumIDChange
        end
        object edGPSModuleFixSpeed: TEdit
          Left = 58
          Top = 117
          Width = 97
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 7
        end
        object edGPSModuleFixBearing: TEdit
          Left = 216
          Top = 117
          Width = 97
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 8
        end
        object cbGPSModuleIsActive: TCheckBox
          Left = 160
          Top = 16
          Width = 65
          Height = 17
          Caption = 'Active'
          TabOrder = 0
          OnClick = cbGPSModuleIsActiveClick
        end
      end
      object gbBatteryModule: TGroupBox
        Left = 8
        Top = 145
        Width = 329
        Height = 80
        Caption = ' Battery '
        TabOrder = 1
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
        object cbBatteryModuleIsExternalPower: TCheckBox
          Left = 16
          Top = 56
          Width = 145
          Height = 17
          Caption = 'External power'
          TabOrder = 2
          OnClick = cbStatusModuleIsMotionClick
        end
        object cbBatteryModuleIsLowPowerMode: TCheckBox
          Left = 176
          Top = 55
          Width = 145
          Height = 17
          Caption = 'Low power mode'
          TabOrder = 3
          OnClick = cbStatusModuleIsMotionClick
        end
      end
      object gbDeviceDescriptor: TGroupBox
        Left = 8
        Top = 17
        Width = 329
        Height = 124
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
        object Label36: TLabel
          Left = 8
          Top = 96
          Width = 41
          Height = 16
          AutoSize = False
          Caption = 'FOTA'
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
        object edDeviceDescriptorFOTA: TEdit
          Left = 48
          Top = 93
          Width = 273
          Height = 24
          AutoSize = False
          TabOrder = 6
        end
      end
      object gbAccelerometerModule: TGroupBox
        Left = 352
        Top = 81
        Width = 249
        Height = 56
        Caption = ' Accelerometer '
        TabOrder = 5
        object Label37: TLabel
          Left = 16
          Top = 25
          Width = 57
          Height = 16
          AutoSize = False
          Caption = 'Value'
        end
        object edAccelerometerModuleValue: TEdit
          Left = 72
          Top = 22
          Width = 81
          Height = 24
          AutoSize = False
          ReadOnly = True
          TabOrder = 0
        end
        object cbAccelerometerModuleIsCalibrated: TCheckBox
          Left = 156
          Top = 25
          Width = 89
          Height = 17
          Caption = 'Calibrated'
          TabOrder = 1
          OnClick = cbStatusModuleIsMotionClick
        end
      end
      object gbIgnitionModule: TGroupBox
        Left = 352
        Top = 137
        Width = 121
        Height = 48
        Caption = ' Ignition '
        TabOrder = 6
        object cbIgnitionModuleValue: TCheckBox
          Left = 24
          Top = 24
          Width = 65
          Height = 17
          Caption = 'On/Off'
          TabOrder = 0
          OnClick = cbStatusModuleIsMotionClick
        end
      end
      object gbTowAlertModule: TGroupBox
        Left = 480
        Top = 137
        Width = 121
        Height = 48
        Caption = ' Tow Alert '
        TabOrder = 7
        object cbTowAlertModuleValue: TCheckBox
          Left = 24
          Top = 24
          Width = 65
          Height = 17
          Caption = 'On/Off'
          TabOrder = 0
          OnClick = cbStatusModuleIsMotionClick
        end
      end
      object gbStatusModule: TGroupBox
        Left = 352
        Top = 17
        Width = 249
        Height = 64
        Caption = ' Status '
        TabOrder = 4
        object cbStatusModuleIsMotion: TCheckBox
          Left = 160
          Top = 16
          Width = 87
          Height = 17
          Caption = 'Motion'
          TabOrder = 2
          OnClick = cbStatusModuleIsMotionClick
        end
        object cbStatusModuleIsStop: TCheckBox
          Left = 16
          Top = 16
          Width = 65
          Height = 17
          Caption = 'Stop'
          TabOrder = 0
          OnClick = cbStatusModuleIsMotionClick
        end
        object cbStatusModuleIsIdle: TCheckBox
          Left = 88
          Top = 16
          Width = 65
          Height = 17
          Caption = 'Idle'
          TabOrder = 1
          OnClick = cbStatusModuleIsMotionClick
        end
        object cbStatusModuleIsMIL: TCheckBox
          Left = 88
          Top = 40
          Width = 153
          Height = 17
          Caption = 'Malfunction'
          TabOrder = 3
          OnClick = cbStatusModuleIsMotionClick
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
      Width = 57
      Height = 24
      AutoSize = False
      TabOrder = 1
      OnKeyPress = edGeoSpaceIDKeyPress
    end
    object bbUpdatePanel: TBitBtn
      Left = 0
      Top = 603
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
    object N1: TMenuItem
      Caption = '-'
    end
    object Devicecontrolpanel1: TMenuItem
      Caption = 'Device control panel'
      OnClick = Devicecontrolpanel1Click
    end
  end
end
