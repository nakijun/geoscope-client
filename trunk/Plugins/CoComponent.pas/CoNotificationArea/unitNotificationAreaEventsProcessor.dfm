object fmNotificationAreaEventsProcessorPanel: TfmNotificationAreaEventsProcessorPanel
  Left = 384
  Top = 167
  Width = 854
  Height = 738
  Caption = 'Notification area processor control panel'
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
  object ListBox: TListBox
    Left = 0
    Top = 193
    Width = 846
    Height = 518
    Align = alClient
    ItemHeight = 13
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 846
    Height = 193
    Align = alTop
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 844
      Height = 191
      ActivePage = TabSheet1
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = ' Statistics '
        DesignSize = (
          836
          160)
        object Label15: TLabel
          Left = 8
          Top = 40
          Width = 153
          Height = 16
          AutoSize = False
          Caption = 'MBMail messages sent'
        end
        object Label16: TLabel
          Left = 8
          Top = 72
          Width = 153
          Height = 16
          AutoSize = False
          Caption = 'E-Mail messages sent'
        end
        object Label17: TLabel
          Left = 8
          Top = 104
          Width = 153
          Height = 16
          AutoSize = False
          Caption = 'SMS messages sent'
        end
        object StatMBM_edSentCount: TEdit
          Left = 160
          Top = 38
          Width = 121
          Height = 24
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
        object StatEMAIL_edSentCount: TEdit
          Left = 160
          Top = 70
          Width = 121
          Height = 24
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
        object StatSMS_edSentCount: TEdit
          Left = 160
          Top = 102
          Width = 121
          Height = 24
          ReadOnly = True
          TabOrder = 2
          Text = '0'
        end
        object btnAreaNotifier: TBitBtn
          Left = 640
          Top = 32
          Width = 187
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Area Notifier'
          TabOrder = 3
          OnClick = btnAreaNotifierClick
        end
        object btnDistanceNotifier: TBitBtn
          Left = 640
          Top = 64
          Width = 187
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Distance Notifier'
          TabOrder = 4
          OnClick = btnDistanceNotifierClick
        end
        object btnNotificationAreaNotifier: TBitBtn
          Left = 640
          Top = 96
          Width = 187
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Notification Area Notifier'
          TabOrder = 5
          OnClick = btnNotificationAreaNotifierClick
        end
        object cbShowLog: TCheckBox
          Left = 8
          Top = 136
          Width = 97
          Height = 17
          Caption = 'Show log'
          TabOrder = 6
        end
      end
      object TabSheet2: TTabSheet
        Caption = ' Configuration'
        ImageIndex = 1
        DesignSize = (
          836
          160)
        object PageControl2: TPageControl
          Left = 0
          Top = 0
          Width = 836
          Height = 160
          ActivePage = TabSheet4
          Align = alClient
          TabOrder = 0
          object TabSheet3: TTabSheet
            Caption = 'General'
          end
          object TabSheet4: TTabSheet
            Caption = 'Sending robots'
            ImageIndex = 1
            object PageControl3: TPageControl
              Left = 0
              Top = 0
              Width = 828
              Height = 129
              ActivePage = TabSheet5
              Align = alClient
              TabOrder = 0
              object TabSheet5: TTabSheet
                Caption = 'InternalMail'
                object Label1: TLabel
                  Left = 248
                  Top = 34
                  Width = 145
                  Height = 16
                  AutoSize = False
                  Caption = 'Positioner Prototype ID'
                end
                object Label2: TLabel
                  Left = 176
                  Top = 66
                  Width = 225
                  Height = 16
                  AutoSize = False
                  Caption = 'CoReference Positioner Prototype ID'
                end
                object Label3: TLabel
                  Left = 8
                  Top = 34
                  Width = 169
                  Height = 16
                  AutoSize = False
                  Caption = 'Sender MessageBoard ID'
                end
                object Label4: TLabel
                  Left = 472
                  Top = 34
                  Width = 169
                  Height = 16
                  AutoSize = False
                  Caption = 'MessageComponents Left'
                end
                object Label5: TLabel
                  Left = 472
                  Top = 66
                  Width = 169
                  Height = 16
                  AutoSize = False
                  Caption = 'MessageComponents Top'
                end
                object ConfigMBM_edidPositionerPrototype: TEdit
                  Left = 400
                  Top = 32
                  Width = 57
                  Height = 24
                  TabOrder = 0
                end
                object ConfigMBM_edidCoReferencePrototype: TEdit
                  Left = 400
                  Top = 64
                  Width = 57
                  Height = 24
                  TabOrder = 1
                end
                object ConfigMBM_edSenderMessageBoardID: TEdit
                  Left = 176
                  Top = 32
                  Width = 57
                  Height = 24
                  TabOrder = 2
                end
                object ConfigMBM_edMessageComponentsLeft: TEdit
                  Left = 640
                  Top = 32
                  Width = 57
                  Height = 24
                  TabOrder = 3
                end
                object ConfigMBM_edMessageComponentsTop: TEdit
                  Left = 640
                  Top = 64
                  Width = 57
                  Height = 24
                  TabOrder = 4
                end
                object ConfigMBM_cbEnabled: TCheckBox
                  Left = 8
                  Top = 8
                  Width = 81
                  Height = 17
                  Caption = 'Enabled'
                  TabOrder = 5
                end
              end
              object TabSheet6: TTabSheet
                Caption = 'E-Mail'
                ImageIndex = 1
                object Label6: TLabel
                  Left = 8
                  Top = 34
                  Width = 145
                  Height = 16
                  AutoSize = False
                  Caption = 'SMTP Server Address'
                end
                object Label7: TLabel
                  Left = 360
                  Top = 34
                  Width = 33
                  Height = 16
                  AutoSize = False
                  Caption = 'Port'
                end
                object Label8: TLabel
                  Left = 448
                  Top = 34
                  Width = 161
                  Height = 16
                  AutoSize = False
                  Caption = 'Max connecting time (ms)'
                end
                object Label9: TLabel
                  Left = 160
                  Top = 66
                  Width = 97
                  Height = 16
                  AutoSize = False
                  Caption = 'Sender E-Mail'
                end
                object Label10: TLabel
                  Left = 400
                  Top = 66
                  Width = 121
                  Height = 16
                  AutoSize = False
                  Caption = 'Sender UserName'
                end
                object Label11: TLabel
                  Left = 616
                  Top = 66
                  Width = 97
                  Height = 16
                  AutoSize = False
                  Caption = 'UserPassword'
                end
                object ConfigEMAIL_edServerAddress: TEdit
                  Left = 160
                  Top = 32
                  Width = 193
                  Height = 24
                  TabOrder = 0
                end
                object ConfigEMAIL_edServerPort: TEdit
                  Left = 392
                  Top = 32
                  Width = 49
                  Height = 24
                  TabOrder = 1
                end
                object ConfigEMAIL_edConnectingTime: TEdit
                  Left = 608
                  Top = 32
                  Width = 65
                  Height = 24
                  TabOrder = 2
                end
                object ConfigEMAIL_cbUseAuthentication: TCheckBox
                  Left = 8
                  Top = 64
                  Width = 153
                  Height = 17
                  Caption = 'Use Authentication'
                  TabOrder = 3
                end
                object ConfigEMAIL_edSenderAddress: TEdit
                  Left = 256
                  Top = 64
                  Width = 137
                  Height = 24
                  TabOrder = 4
                end
                object ConfigEMAIL_edSenderUserName: TEdit
                  Left = 520
                  Top = 64
                  Width = 89
                  Height = 24
                  TabOrder = 5
                end
                object ConfigEMAIL_edSenderUserPassword: TEdit
                  Left = 712
                  Top = 64
                  Width = 89
                  Height = 24
                  PasswordChar = '*'
                  TabOrder = 6
                end
                object ConfigEMAIL_cbEnabled: TCheckBox
                  Left = 8
                  Top = 8
                  Width = 81
                  Height = 17
                  Caption = 'Enabled'
                  TabOrder = 7
                end
              end
              object TabSheet7: TTabSheet
                Caption = 'SMS'
                ImageIndex = 2
                object Label12: TLabel
                  Left = 8
                  Top = 42
                  Width = 113
                  Height = 16
                  AutoSize = False
                  Caption = 'COM port number'
                end
                object Label13: TLabel
                  Left = 176
                  Top = 42
                  Width = 73
                  Height = 16
                  AutoSize = False
                  Caption = 'Port speed'
                end
                object Label14: TLabel
                  Left = 328
                  Top = 42
                  Width = 105
                  Height = 16
                  AutoSize = False
                  Caption = 'Sending method'
                end
                object ConfigSMS_edCommPort: TEdit
                  Left = 120
                  Top = 40
                  Width = 49
                  Height = 24
                  TabOrder = 0
                end
                object ConfigSMS_edPortSpeed: TEdit
                  Left = 248
                  Top = 40
                  Width = 73
                  Height = 24
                  TabOrder = 1
                end
                object ConfigSMS_cbEnabled: TCheckBox
                  Left = 8
                  Top = 8
                  Width = 81
                  Height = 17
                  Caption = 'Enabled'
                  TabOrder = 2
                end
                object ConfigSMS_cbSendingMethod: TComboBox
                  Left = 432
                  Top = 40
                  Width = 145
                  Height = 24
                  Style = csDropDownList
                  ItemHeight = 0
                  TabOrder = 3
                end
              end
            end
          end
        end
        object bbSaveConfiguration: TBitBtn
          Left = 757
          Top = 0
          Width = 78
          Height = 21
          Anchors = [akTop, akRight]
          Caption = 'Save'
          TabOrder = 1
          Visible = False
          OnClick = bbSaveConfigurationClick
        end
      end
    end
  end
end
