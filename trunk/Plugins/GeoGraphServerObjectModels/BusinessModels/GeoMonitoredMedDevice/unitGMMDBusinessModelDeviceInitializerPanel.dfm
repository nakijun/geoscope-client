object fmGMMDBusinessModelDeviceInitializerPanel: TfmGMMDBusinessModelDeviceInitializerPanel
  Left = 567
  Top = 187
  BorderStyle = bsDialog
  Caption = 'Device initializer'
  ClientHeight = 381
  ClientWidth = 287
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
    Width = 287
    Height = 203
    Align = alClient
    Caption = ' Parameters '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 56
      Width = 141
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Server address'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 88
      Width = 137
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Object ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 128
      Width = 137
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'User ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 163
      Width = 137
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'User password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 26
      Width = 137
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Device password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edGeoGraphServerAddress: TEdit
      Left = 152
      Top = 54
      Width = 113
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edObjectID: TEdit
      Left = 152
      Top = 86
      Width = 113
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edObjectUserID: TEdit
      Left = 152
      Top = 126
      Width = 113
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edObjectUserPassword: TEdit
      Left = 152
      Top = 161
      Width = 113
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edObjectDevicePassword: TEdit
      Left = 152
      Top = 23
      Width = 113
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = 'password'
    end
  end
  object pcDeviceInitialization: TPageControl
    Left = 0
    Top = 203
    Width = 287
    Height = 178
    ActivePage = TabSheet1
    Align = alBottom
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = ' by SMS '
      object Label6: TLabel
        Left = 0
        Top = 10
        Width = 161
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Device phone number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = -2
        Top = 43
        Width = 69
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'COM port'
      end
      object Label13: TLabel
        Left = 148
        Top = 43
        Width = 65
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Speed'
      end
      object Label14: TLabel
        Left = 3
        Top = 75
        Width = 122
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Sending method'
      end
      object bbWriteDeviceConfiguration: TBitBtn
        Left = 24
        Top = 113
        Width = 225
        Height = 25
        Caption = 'Send SMS to initialize'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = bbWriteDeviceConfigurationClick
      end
      object edDevicePhoneNumber: TEdit
        Left = 168
        Top = 7
        Width = 97
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object SMSInitialization_edPortSpeed: TEdit
        Left = 216
        Top = 40
        Width = 48
        Height = 21
        TabOrder = 2
        Text = '9600'
      end
      object SMSInitialization_cbSendingMethod: TComboBox
        Left = 128
        Top = 72
        Width = 137
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        TabOrder = 3
      end
      object SMSInitialization_cbPort: TComboBox
        Left = 70
        Top = 40
        Width = 75
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 4
      end
    end
    object TabSheet2: TTabSheet
      Caption = ' by COM'
      ImageIndex = 1
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
