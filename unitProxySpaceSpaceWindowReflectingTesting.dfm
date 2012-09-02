object fmProxySpaceSpaceWindowReflectingTesting: TfmProxySpaceSpaceWindowReflectingTesting
  Left = 451
  Top = 249
  Width = 439
  Height = 553
  Caption = 'Space window reflecting testing'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    431
    526)
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel3: TBevel
    Left = 8
    Top = 240
    Width = 407
    Height = 260
    Anchors = [akLeft, akTop, akRight, akBottom]
    Shape = bsFrame
    Style = bsRaised
  end
  object Image: TImage
    Left = 16
    Top = 248
    Width = 390
    Height = 243
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 431
    Height = 225
    Align = alTop
    TabOrder = 0
    object pnlRecording: TPanel
      Left = 1
      Top = 65
      Width = 429
      Height = 159
      Align = alClient
      TabOrder = 1
      DesignSize = (
        429
        159)
      object Bevel1: TBevel
        Left = 8
        Top = 56
        Width = 401
        Height = 9
        Anchors = [akLeft, akTop, akRight]
      end
      object lbRecordingOperationsCount: TLabel
        Left = 16
        Top = 104
        Width = 3
        Height = 16
      end
      object cbRecording: TCheckBox
        Left = 152
        Top = 22
        Width = 137
        Height = 17
        Caption = 'Recording'
        TabOrder = 0
        OnClick = cbRecordingClick
      end
    end
    object pnlTesting: TPanel
      Left = 1
      Top = 65
      Width = 429
      Height = 159
      Align = alClient
      TabOrder = 2
      Visible = False
      DesignSize = (
        429
        159)
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 86
        Height = 16
        Caption = 'Threads count'
      end
      object Label2: TLabel
        Left = 16
        Top = 40
        Width = 97
        Height = 16
        Caption = 'Call interval, sec'
      end
      object Bevel2: TBevel
        Left = 8
        Top = 88
        Width = 401
        Height = 9
        Anchors = [akLeft, akTop, akRight]
      end
      object lbInOperationCount: TLabel
        Left = 16
        Top = 104
        Width = 3
        Height = 16
      end
      object lbOperationsCount: TLabel
        Left = 16
        Top = 120
        Width = 3
        Height = 16
      end
      object lbOperationsExceptionsCount: TLabel
        Left = 16
        Top = 136
        Width = 3
        Height = 16
      end
      object lbOperationsAvrTime: TLabel
        Left = 208
        Top = 120
        Width = 3
        Height = 16
      end
      object edThreadsCount: TEdit
        Left = 120
        Top = 5
        Width = 89
        Height = 24
        TabOrder = 0
        Text = '150'
      end
      object edCallInterval: TEdit
        Left = 120
        Top = 37
        Width = 89
        Height = 24
        TabOrder = 1
        Text = '0'
      end
      object btnStartTesting: TBitBtn
        Left = 224
        Top = 28
        Width = 169
        Height = 25
        Caption = 'Start Testing'
        TabOrder = 2
        OnClick = btnStartTestingClick
      end
      object btnStopTesting: TBitBtn
        Left = 224
        Top = 56
        Width = 169
        Height = 25
        Caption = 'Stop Testing'
        TabOrder = 3
        OnClick = btnStopTestingClick
      end
      object cbRandomThreadAccess: TCheckBox
        Left = 16
        Top = 64
        Width = 193
        Height = 17
        Caption = 'Random thread access'
        TabOrder = 4
      end
      object cbShowOutput: TCheckBox
        Left = 224
        Top = 8
        Width = 169
        Height = 17
        Caption = 'show output'
        TabOrder = 5
        OnClick = cbShowOutputClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 429
      Height = 64
      Align = alTop
      Caption = ' Mode '
      TabOrder = 0
      object rbRecording: TRadioButton
        Left = 56
        Top = 24
        Width = 113
        Height = 17
        Caption = 'Recording'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbRecordingClick
      end
      object rbTesting: TRadioButton
        Left = 272
        Top = 24
        Width = 113
        Height = 17
        Caption = 'Testing'
        TabOrder = 1
        OnClick = rbRecordingClick
      end
    end
  end
  object Timer: TTimer
    Interval = 333
    OnTimer = TimerTimer
    Left = 177
    Top = 17
  end
end
