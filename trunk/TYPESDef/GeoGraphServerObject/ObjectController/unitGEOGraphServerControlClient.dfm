object fmGEOGraphServerControlClient: TfmGEOGraphServerControlClient
  Left = 184
  Top = 188
  Width = 840
  Height = 550
  Caption = 'GEO-Graph server control client'
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 832
    Height = 73
    Align = alTop
    Caption = ' Initialization '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 42
      Height = 16
      Caption = 'UserID'
    end
    object Label2: TLabel
      Left = 144
      Top = 48
      Width = 89
      Height = 16
      Caption = 'UserPassword'
    end
    object Label3: TLabel
      Left = 336
      Top = 32
      Width = 52
      Height = 16
      Caption = 'ObjectID'
    end
    object Label6: TLabel
      Left = 8
      Top = 16
      Width = 93
      Height = 16
      Caption = 'Server address'
    end
    object Label7: TLabel
      Left = 232
      Top = 16
      Width = 24
      Height = 16
      Caption = 'Port'
    end
    object edUserID: TEdit
      Left = 56
      Top = 45
      Width = 81
      Height = 24
      TabOrder = 2
      Text = '1'
    end
    object edUserPassword: TEdit
      Left = 240
      Top = 45
      Width = 89
      Height = 24
      PasswordChar = '*'
      TabOrder = 3
      Text = 'cfif'
    end
    object edObjectID: TEdit
      Left = 392
      Top = 29
      Width = 81
      Height = 24
      TabOrder = 4
      Text = '62'
    end
    object cbKeepConnection: TCheckBox
      Left = 576
      Top = 16
      Width = 161
      Height = 17
      Caption = 'Keep connection alive '
      TabOrder = 5
    end
    object bbConnectDisconnect: TButton
      Left = 576
      Top = 40
      Width = 249
      Height = 25
      Caption = 'Connect'
      TabOrder = 6
      OnClick = bbConnectDisconnectClick
    end
    object edServerAddress: TEdit
      Left = 104
      Top = 13
      Width = 121
      Height = 24
      TabOrder = 0
      Text = '127.0.0.1'
    end
    object edServerPort: TEdit
      Left = 264
      Top = 13
      Width = 65
      Height = 24
      TabOrder = 1
      Text = '8283'
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 477
    Width = 832
    Height = 46
    Align = alBottom
    Caption = ' Execute command '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 19
      Width = 72
      Height = 16
      Caption = 'Command >'
    end
    object Label5: TLabel
      Left = 472
      Top = 19
      Width = 76
      Height = 16
      Caption = 'Operations >'
    end
    object edCommandToExecute: TEdit
      Left = 80
      Top = 16
      Width = 385
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edCommandToExecuteKeyPress
    end
    object cbOperations: TComboBox
      Left = 549
      Top = 15
      Width = 233
      Height = 24
      Style = csDropDownList
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 1
      OnChange = cbOperationsChange
      Items.Strings = (
        'Set checkpoint interval'
        'Get checkpoint'
        'Get object data'
        'Get a day log data')
    end
  end
  object reConsole: TRichEdit
    Left = 0
    Top = 73
    Width = 832
    Height = 404
    Align = alClient
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
end
