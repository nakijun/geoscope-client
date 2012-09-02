object fmGeographServerObjectSpaceViewWebPageConstructor: TfmGeographServerObjectSpaceViewWebPageConstructor
  Left = 185
  Top = 54
  Width = 641
  Height = 622
  Caption = 'Web page constructor'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 633
    Height = 113
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      633
      113)
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 144
      Height = 16
      Caption = 'current space view label'
    end
    object Label2: TLabel
      Left = 248
      Top = 8
      Width = 138
      Height = 16
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'result file name (HTML)'
    end
    object edViewURLLabel: TEdit
      Left = 8
      Top = 64
      Width = 241
      Height = 24
      TabOrder = 1
    end
    object cbAddViewURLLabelAsHyperlink: TCheckBox
      Left = 8
      Top = 88
      Width = 249
      Height = 17
      Caption = 'add as hyperlink'
      TabOrder = 2
    end
    object btnAddViewURL: TButton
      Left = 256
      Top = 64
      Width = 177
      Height = 25
      Caption = 'Add'
      TabOrder = 3
      OnClick = btnAddViewURLClick
    end
    object btnRemoveLastViewURL: TButton
      Left = 440
      Top = 64
      Width = 185
      Height = 25
      Caption = 'Remove last'
      TabOrder = 4
      OnClick = btnRemoveLastViewURLClick
    end
    object edResultFileName: TEdit
      Left = 248
      Top = 24
      Width = 138
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'View'
    end
  end
  object TestWebBrowser: TWebBrowser
    Left = 0
    Top = 113
    Width = 633
    Height = 443
    Align = alClient
    TabOrder = 1
    ControlData = {
      4C0000006C410000C92D00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126209000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel2: TPanel
    Left = 0
    Top = 556
    Width = 633
    Height = 39
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      633
      39)
    object btnTestBrowserBack: TButton
      Left = 456
      Top = 8
      Width = 83
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Back'
      TabOrder = 0
      OnClick = btnTestBrowserBackClick
    end
    object btnSaveResultFile: TButton
      Left = 8
      Top = 8
      Width = 153
      Height = 25
      Caption = 'Save to file'
      TabOrder = 1
      OnClick = btnSaveResultFileClick
    end
    object btnTestBrowserRefresh: TButton
      Left = 360
      Top = 8
      Width = 89
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Refresh'
      TabOrder = 2
      OnClick = btnTestBrowserRefreshClick
    end
    object btnTestBrowserForward: TButton
      Left = 544
      Top = 8
      Width = 81
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Forward'
      TabOrder = 3
      OnClick = btnTestBrowserForwardClick
    end
    object Button1: TButton
      Left = 168
      Top = 8
      Width = 153
      Height = 25
      Caption = 'Save to user folder'
      TabOrder = 4
      OnClick = Button1Click
    end
  end
end
