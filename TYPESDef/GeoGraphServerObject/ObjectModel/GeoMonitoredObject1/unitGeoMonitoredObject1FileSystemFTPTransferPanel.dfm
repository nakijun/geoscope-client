object TGeoMonitoredObject1FileSystemFTPTransferPanel: TTGeoMonitoredObject1FileSystemFTPTransferPanel
  Left = 523
  Top = 262
  BorderStyle = bsDialog
  Caption = 'File FTP Transfer'
  ClientHeight = 237
  ClientWidth = 300
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
  object bgFTPServer: TGroupBox
    Left = 0
    Top = 0
    Width = 300
    Height = 145
    Align = alTop
    Caption = ' FTP Server '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 105
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Server address'
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 105
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'UserName'
    end
    object Label3: TLabel
      Left = 8
      Top = 80
      Width = 105
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Password'
    end
    object Label4: TLabel
      Left = 8
      Top = 112
      Width = 105
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Base directory'
    end
    object edServerAddress: TEdit
      Left = 120
      Top = 22
      Width = 153
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = '192.168.123.1:26'
    end
    object edServerUserName: TEdit
      Left = 120
      Top = 54
      Width = 153
      Height = 24
      TabOrder = 1
      Text = 'root'
    end
    object edServerUserPassword: TEdit
      Left = 120
      Top = 78
      Width = 153
      Height = 24
      PasswordChar = '*'
      TabOrder = 2
      Text = '4Fgtm38DB4vg089'
    end
    object edServerBaseDirectory: TEdit
      Left = 120
      Top = 110
      Width = 153
      Height = 24
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 145
    Width = 300
    Height = 92
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Label5: TLabel
      Left = 0
      Top = 28
      Width = 300
      Height = 16
      Align = alBottom
      AutoSize = False
      Caption = 'State'
    end
    object btnStartTransfer: TBitBtn
      Left = 248
      Top = 2
      Width = 51
      Height = 24
      Caption = 'Start'
      TabOrder = 0
      OnClick = btnStartTransferClick
    end
    object edFileName: TEdit
      Left = 1
      Top = 2
      Width = 248
      Height = 24
      ReadOnly = True
      TabOrder = 1
    end
    object stState: TStaticText
      Left = 0
      Top = 44
      Width = 300
      Height = 48
      Align = alBottom
      AutoSize = False
      BorderStyle = sbsSunken
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object StatusUpdater: TTimer
    Interval = 60000
    OnTimer = StatusUpdaterTimer
    Left = 16
    Top = 56
  end
end
