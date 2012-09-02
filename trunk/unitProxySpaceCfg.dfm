object fmProxySpaceCfg: TfmProxySpaceCfg
  Left = 22
  Top = 41
  BorderStyle = bsDialog
  Caption = 'ProxySpace configuration'
  ClientHeight = 643
  ClientWidth = 939
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 65
    Height = 32
    Picture.Data = {
      055449636F6E0000010001004020100000000000E80200001600000028000000
      2000000040000000010004000000000000020000000000000000000000000000
      0000000000000000000080000080000000808000800000008000800080800000
      C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
      FFFFFF0000000000000000888888800000000000000000000008888888888888
      0000000000000000088800000008888888000000000000008000222222200088
      8880000000000000022222222222220088880000000000022222222222222222
      0888800000000022222222222222222220888800000002222222222222222222
      2208880000002222222222222222222222208880000022222222227F72222222
      2220888000022222222227FFF2222222222208800002222222227FFFF7222222
      22220888000222222227FFFFFF2222222222088800222222227FFF7FFF722222
      222220880022222227FFF72FFFF2222222222088002222222FFF7227FFF72222
      222220880022222222222222FFFF22222222208800222222222222227FFF7222
      2222208800222222222222222FFFF22222222080002222222222222227FFF722
      22222080000222222222222222FFFF22222208800002222222222222227FFF72
      222208000002222222222222222FFFF222220800000022222222222222222222
      2220800000002222222222222222222222200000000002222222222222222222
      2200000000000022222222222222222220000000000000022222222222222222
      0000000000000000022222222222220000000000000000000000222222200000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FFFC07FFFFE000FFFF80003FFF00001FFE00000FFC000007F8000003
      F0000003E0000001E0000001C0000001C0000000C00000008000000080000000
      8000000080000000800000008000000180000001C0000001C0000003C0000003
      E0000007E000000FF000001FF800003FFC00007FFE0000FFFF8003FFFFF01FFF
      FFFFFFFF}
    Proportional = True
  end
  object Bevel1: TBevel
    Left = 8
    Top = 32
    Width = 913
    Height = 9
    Shape = bsTopLine
    Style = bsRaised
  end
  object Bevel2: TBevel
    Left = 64
    Top = 8
    Width = 9
    Height = 617
    Shape = bsLeftLine
    Style = bsRaised
  end
  object sbAcceptServerSideConfiguration: TSpeedButton
    Left = 81
    Top = 600
    Width = 840
    Height = 25
    Caption = 'Accept Changes'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 10485760
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = sbAcceptServerSideConfigurationClick
  end
  object sbAcceptLocalSideConfiguration: TSpeedButton
    Left = 81
    Top = 240
    Width = 840
    Height = 25
    Caption = 'Accept Changes'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 10485760
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = sbAcceptLocalSideConfigurationClick
  end
  object Label5: TLabel
    Left = 80
    Top = 272
    Width = 841
    Height = 16
    AutoSize = False
    Caption = ' Server side configuration'
    Color = 6974058
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label6: TLabel
    Left = 80
    Top = 48
    Width = 841
    Height = 16
    AutoSize = False
    Caption = ' Local side configuration'
    Color = 6974058
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 80
    Top = 288
    Width = 841
    Height = 305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 416
      Top = 48
      Width = 308
      Height = 16
      Caption = 'Reflecting Visualization Max size (Kb) .......................'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Bevel3: TBevel
      Left = 409
      Top = 16
      Width = 9
      Height = 97
      Shape = bsLeftLine
      Style = bsRaised
    end
    object lbRemoteStatusLoadingComponentMaxSize: TLabel
      Left = 416
      Top = 96
      Width = 320
      Height = 16
      Caption = '"On-demand" loaging if component size above (Kb) ......'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 416
      Top = 72
      Width = 322
      Height = 16
      Caption = 
        'Reflecting Visualization object portion ........................' +
        '..'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 416
      Top = 24
      Width = 307
      Height = 16
      Caption = 'Client updating interval (seconds).............................'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object rgStatus: TRadioGroup
      Left = 8
      Top = 17
      Width = 142
      Height = 96
      Caption = ' status '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Normal'
        'NormalBrief'
        'Remoted'
        'RemotedBrief')
      ParentFont = False
      TabOrder = 0
      OnClick = rgStatusClick
    end
    object cbComponentsPanelsHistroryOn: TCheckBox
      Left = 152
      Top = 24
      Width = 257
      Height = 17
      Caption = 'Show components panels history'
      TabOrder = 1
      OnClick = cbComponentsPanelsHistroryOnClick
    end
    object cbShowUserComponentsAtStart: TCheckBox
      Left = 152
      Top = 48
      Width = 257
      Height = 17
      Caption = 'Show user components at start'
      TabOrder = 2
      OnClick = cbShowUserComponentsAtStartClick
    end
    object cbUserMessagesChecking: TCheckBox
      Left = 152
      Top = 72
      Width = 257
      Height = 17
      Caption = 'User Messages Checking'
      TabOrder = 3
      OnClick = cbUserMessagesCheckingClick
    end
    object edVisualizationMaxSize: TEdit
      Left = 720
      Top = 45
      Width = 113
      Height = 24
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnChange = edVisualizationMaxSizeChange
      OnKeyPress = edVisualizationMaxSizeKeyPress
    end
    object cbUseComponentsManager: TCheckBox
      Left = 152
      Top = 96
      Width = 257
      Height = 17
      Caption = 'Use components-manager'
      TabOrder = 4
      OnClick = cbUseComponentsManagerClick
    end
    object edRemoteStatusLoadingComponentMaxSize: TEdit
      Left = 736
      Top = 93
      Width = 97
      Height = 24
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnChange = edRemoteStatusLoadingComponentMaxSizeChange
      OnKeyPress = edRemoteStatusLoadingComponentMaxSizeKeyPress
    end
    object edReflectingObjPortion: TEdit
      Left = 736
      Top = 69
      Width = 97
      Height = 24
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnChange = edReflectingObjPortionChange
      OnKeyPress = edReflectingObjPortionKeyPress
    end
    object edUpdateInterval: TEdit
      Left = 720
      Top = 21
      Width = 113
      Height = 24
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnChange = edUpdateIntervalChange
      OnKeyPress = edUpdateIntervalKeyPress
    end
    object PageControl: TPageControl
      Left = 8
      Top = 121
      Width = 825
      Height = 176
      ActivePage = TabSheet1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MultiLine = True
      ParentFont = False
      TabOrder = 9
      object TabSheet1: TTabSheet
        Caption = 'Enabled types'
        ImageIndex = 1
        object lvEnabledTypes: TListView
          Left = 0
          Top = 0
          Width = 817
          Height = 145
          Align = alClient
          Checkboxes = True
          Color = clSilver
          Columns = <
            item
              Caption = 'Enabled component types'
              Width = 780
            end>
          ColumnClick = False
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ShowColumnHeaders = False
          SortType = stText
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 80
    Top = 64
    Width = 841
    Height = 169
    TabOrder = 1
    object Label4: TLabel
      Left = 16
      Top = 32
      Width = 167
      Height = 16
      Caption = 'Context objects max count ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LocalConfig_edContextSize: TEdit
      Left = 184
      Top = 29
      Width = 81
      Height = 24
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = LocalConfig_edContextSizeChange
      OnKeyPress = LocalConfig_edContextSizeKeyPress
    end
    object LocalConfig_cbUpdateUsingContext: TCheckBox
      Left = 16
      Top = 72
      Width = 249
      Height = 17
      Caption = 'Update using context '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = LocalConfig_cbUpdateUsingContextClick
    end
    object LocalConfig_cbActionsGroupCall: TCheckBox
      Left = 16
      Top = 120
      Width = 249
      Height = 17
      Caption = 'Actions group calls'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = LocalConfig_cbActionsGroupCallClick
    end
    object GroupBox3: TGroupBox
      Left = 280
      Top = 8
      Width = 281
      Height = 153
      Caption = ' space notification server '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Label7: TLabel
        Left = 8
        Top = 24
        Width = 46
        Height = 16
        Caption = 'Address'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 184
        Top = 24
        Width = 23
        Height = 16
        Caption = 'Port'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LocalConfig_edNotificationServerHost: TEdit
        Left = 56
        Top = 21
        Width = 121
        Height = 24
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = LocalConfig_edNotificationServerHostChange
        OnKeyPress = LocalConfig_edNotificationServerHostKeyPress
      end
      object LocalConfig_edNotificationServerPort: TEdit
        Left = 208
        Top = 21
        Width = 65
        Height = 24
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnChange = LocalConfig_edNotificationServerPortChange
        OnKeyPress = LocalConfig_edNotificationServerPortKeyPress
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 64
        Width = 265
        Height = 83
        Caption = ' socks proxy '
        TabOrder = 2
        object Label9: TLabel
          Left = 16
          Top = 21
          Width = 46
          Height = 16
          Caption = 'Address'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 168
          Top = 21
          Width = 23
          Height = 16
          Caption = 'Port'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 16
          Top = 53
          Width = 26
          Height = 16
          Caption = 'User'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 128
          Top = 53
          Width = 55
          Height = 16
          Caption = 'Password'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LocalConfig_edNotificationServerProxyHost: TEdit
          Left = 64
          Top = 18
          Width = 97
          Height = 24
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnChange = LocalConfig_edNotificationServerProxyHostChange
          OnKeyPress = LocalConfig_edNotificationServerProxyHostKeyPress
        end
        object LocalConfig_edNotificationServerProxyPort: TEdit
          Left = 192
          Top = 18
          Width = 57
          Height = 24
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnChange = LocalConfig_edNotificationServerProxyPortChange
          OnKeyPress = LocalConfig_edNotificationServerProxyPortKeyPress
        end
        object LocalConfig_edNotificationServerProxyUserName: TEdit
          Left = 48
          Top = 50
          Width = 73
          Height = 24
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnChange = LocalConfig_edNotificationServerProxyUserNameChange
          OnKeyPress = LocalConfig_edNotificationServerProxyUserNameKeyPress
        end
        object LocalConfig_edNotificationServerProxyUserPassword: TEdit
          Left = 184
          Top = 50
          Width = 65
          Height = 24
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 3
          OnChange = LocalConfig_edNotificationServerProxyUserPasswordChange
          OnKeyPress = LocalConfig_edNotificationServerProxyUserPasswordKeyPress
        end
      end
      object LocalConfig_cbNotificationServerAlwaysUseProxy: TCheckBox
        Left = 8
        Top = 48
        Width = 265
        Height = 17
        Caption = 'Always use proxy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = LocalConfig_cbNotificationServerAlwaysUseProxyClick
      end
    end
  end
end
