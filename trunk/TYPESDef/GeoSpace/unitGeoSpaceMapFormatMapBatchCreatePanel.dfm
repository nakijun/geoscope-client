object fmGeoSpaceMapFormatMapBatchCreatePanel: TfmGeoSpaceMapFormatMapBatchCreatePanel
  Left = 197
  Top = 166
  Width = 870
  Height = 434
  Caption = 'Map batch create panel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 862
    Height = 313
    Align = alClient
    TabOrder = 0
    object memoLog: TMemo
      Left = 1
      Top = 33
      Width = 860
      Height = 279
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 860
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object cbInfoEvents: TCheckBox
        Left = 8
        Top = 8
        Width = 121
        Height = 17
        Caption = 'Info Events'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object cbWarningEvents: TCheckBox
        Left = 136
        Top = 7
        Width = 121
        Height = 17
        Caption = 'Warning Events'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
      end
      object cbErrorEvents: TCheckBox
        Left = 264
        Top = 7
        Width = 121
        Height = 17
        Caption = 'Error Events'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 2
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 73
    Align = alTop
    TabOrder = 1
    DesignSize = (
      862
      73)
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 145
      Height = 16
      AutoSize = False
      Caption = 'map source file folder'
    end
    object Label2: TLabel
      Left = 512
      Top = 16
      Width = 73
      Height = 16
      AutoSize = False
      Caption = 'Map count'
    end
    object edSourceFolder: TEdit
      Left = 160
      Top = 13
      Width = 321
      Height = 24
      ReadOnly = True
      TabOrder = 0
    end
    object btnSelectSourceFolder: TBitBtn
      Left = 480
      Top = 13
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnSelectSourceFolderClick
    end
    object edProcessCount: TEdit
      Left = 584
      Top = 13
      Width = 49
      Height = 24
      ReadOnly = True
      TabOrder = 2
      Text = '5'
    end
    object cbSkipOnDuplicate: TCheckBox
      Left = 29
      Top = 48
      Width = 193
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Skip on duplicate'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object cbCreatedObjectsFile: TCheckBox
      Left = 229
      Top = 48
      Width = 209
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Create file of created objects'
      TabOrder = 4
    end
    object btnProcess: TBitBtn
      Left = 680
      Top = 16
      Width = 137
      Height = 41
      Caption = 'Process'
      TabOrder = 5
      OnClick = btnProcessClick
    end
  end
  object ProgressBar: TProgressBar
    Left = 0
    Top = 386
    Width = 862
    Height = 21
    Align = alBottom
    TabOrder = 2
  end
end
