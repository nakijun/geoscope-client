object fmGMMDCardioExpertTask: TfmGMMDCardioExpertTask
  Left = 387
  Top = 206
  Width = 1041
  Height = 344
  Caption = 'GMMD Cardio Expert Task'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1033
    Height = 81
    Align = alTop
    Caption = ' Task '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      1033
      81)
    object gbStatus: TGroupBox
      Left = 465
      Top = 9
      Width = 553
      Height = 65
      Anchors = [akTop, akRight]
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      object Label1: TLabel
        Left = 232
        Top = 8
        Width = 57
        Height = 16
        Caption = 'Comment'
      end
      object Label2: TLabel
        Left = 16
        Top = 8
        Width = 37
        Height = 16
        Caption = 'Status'
      end
      object cbTaskStatus: TComboBox
        Left = 16
        Top = 24
        Width = 209
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 0
        OnChange = cbTaskStatusChange
      end
      object edStatusComment: TEdit
        Left = 232
        Top = 24
        Width = 209
        Height = 22
        TabOrder = 1
      end
      object btnSetTaskStatus: TBitBtn
        Left = 448
        Top = 23
        Width = 90
        Height = 25
        Caption = 'set status'
        TabOrder = 2
        OnClick = btnSetTaskStatusClick
      end
    end
    object btnLocateDevice: TBitBtn
      Left = 320
      Top = 24
      Width = 137
      Height = 41
      Caption = 'Locate'
      TabOrder = 2
      OnClick = btnLocateDeviceClick
    end
    object btnShowDevicePanel: TBitBtn
      Left = 168
      Top = 24
      Width = 137
      Height = 41
      Caption = 'Device panel'
      TabOrder = 1
      OnClick = btnShowDevicePanelClick
    end
    object btnShowObjectPanel: TBitBtn
      Left = 16
      Top = 24
      Width = 137
      Height = 41
      Caption = 'Object'
      TabOrder = 0
      OnClick = btnShowObjectPanelClick
    end
  end
  object pnlMeasurement: TPanel
    Left = 0
    Top = 81
    Width = 1033
    Height = 183
    Align = alClient
    Caption = 'pnlMeasurement'
    TabOrder = 1
  end
  object pnlResult: TPanel
    Left = 0
    Top = 264
    Width = 1033
    Height = 53
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      1033
      53)
    object btnCloseConsultation: TBitBtn
      Left = 825
      Top = 4
      Width = 197
      Height = 45
      Anchors = [akTop, akRight]
      Caption = 'Close consultation'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnCloseConsultationClick
    end
    object btnSetResult: TBitBtn
      Left = 825
      Top = 4
      Width = 197
      Height = 45
      Anchors = [akTop, akRight]
      Caption = 'Set result'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnSetResultClick
    end
    object memoResult: TMemo
      Left = 641
      Top = 4
      Width = 173
      Height = 45
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        #1089#1080#1085#1091#1089#1086#1074#1099#1081' '#1088#1080#1090#1084)
      ParentFont = False
      TabOrder = 2
    end
    object btnConsultacy: TBitBtn
      Left = 16
      Top = 15
      Width = 121
      Height = 25
      Caption = 'Consultancy'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnConsultacyClick
    end
    object btnRedirect: TBitBtn
      Left = 152
      Top = 15
      Width = 137
      Height = 25
      Caption = 'Redirect task'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnRedirectClick
    end
  end
end
