object fmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor: TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor
  Left = 351
  Top = 228
  Width = 687
  Height = 615
  Caption = 'Media FRAME server viewer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnHide = FormHide
  PixelsPerInch = 96
  TextHeight = 16
  object pnlVideoOfH264: TPanel
    Left = 0
    Top = 33
    Width = 671
    Height = 511
    Align = alClient
    TabOrder = 3
  end
  object pnlVideoOfMJPEG: TPanel
    Left = 0
    Top = 33
    Width = 671
    Height = 511
    Align = alClient
    TabOrder = 0
    Visible = False
    object imgVideoOfMJPEG: TImage
      Left = 1
      Top = 1
      Width = 669
      Height = 484
      Align = alClient
      Stretch = True
    end
    object tbVideoQuality: TTrackBar
      Left = 1
      Top = 485
      Width = 669
      Height = 25
      Align = alBottom
      Max = 100
      Min = 1
      Position = 50
      TabOrder = 0
      TickMarks = tmBoth
    end
  end
  object pnlAudio: TPanel
    Left = 0
    Top = 544
    Width = 671
    Height = 33
    Align = alBottom
    TabOrder = 1
    Visible = False
    DesignSize = (
      671
      33)
    object Label2: TLabel
      Left = 346
      Top = 7
      Width = 100
      Height = 16
      Anchors = [akTop, akRight]
      Caption = 'Audio device: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbAudioOutputDevices: TComboBox
      Left = 448
      Top = 4
      Width = 217
      Height = 24
      Style = csDropDownList
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
    end
    object cbAudioIsActive: TCheckBox
      Left = 8
      Top = 8
      Width = 89
      Height = 17
      Caption = 'Active'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnlVideo: TPanel
    Left = 0
    Top = 0
    Width = 671
    Height = 33
    Align = alTop
    TabOrder = 2
    Visible = False
    object Label1: TLabel
      Left = 96
      Top = 7
      Width = 49
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mode'
    end
    object cbVideoIsActive: TCheckBox
      Left = 8
      Top = 7
      Width = 89
      Height = 17
      Caption = 'Active'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cbVideoService: TComboBox
      Left = 152
      Top = 4
      Width = 185
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 1
      OnChange = cbVideoServiceChange
    end
  end
  object pnlAudioPlayer: TPanel
    Left = 0
    Top = 0
    Width = 0
    Height = 0
    Caption = 'pnlAudioPlayer'
    TabOrder = 4
  end
  object Starter: TTimer
    Enabled = False
    OnTimer = StarterTimer
    Left = 16
    Top = 49
  end
  object Synchronizer: TTimer
    Enabled = False
    Left = 64
    Top = 49
  end
end
