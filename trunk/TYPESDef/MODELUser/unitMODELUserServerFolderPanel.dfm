object fmMODELUserServerFolderPanel: TfmMODELUserServerFolderPanel
  Left = 314
  Top = 153
  Width = 388
  Height = 375
  Caption = 'User server folder'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 25
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      380
      25)
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 33
      Height = 16
      AutoSize = False
      Caption = 'Path: '
    end
    object edPath: TEdit
      Left = 40
      Top = 2
      Width = 337
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      AutoSelect = False
      AutoSize = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 296
    Width = 380
    Height = 52
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      380
      52)
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 33
      Height = 16
      AutoSize = False
      Caption = 'URL'
    end
    object btnShowServerURL: TBitBtn
      Left = 312
      Top = 14
      Width = 63
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Show'
      TabOrder = 0
      OnClick = btnShowServerURLClick
    end
    object memoSelectedItemURL: TMemo
      Left = 40
      Top = 4
      Width = 265
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 1
    end
  end
  object lbFolder: TListBox
    Left = 0
    Top = 25
    Width = 380
    Height = 271
    Align = alClient
    ItemHeight = 13
    TabOrder = 2
    OnClick = lbFolderClick
    OnDblClick = lbFolderDblClick
  end
end
