object fmDetailedPictureLocalContextLoader: TfmDetailedPictureLocalContextLoader
  Left = 282
  Top = 212
  BorderStyle = bsDialog
  Caption = 'Context loader'
  ClientHeight = 194
  ClientWidth = 401
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
  object Panel1: TPanel
    Left = 0
    Top = 86
    Width = 401
    Height = 108
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 94
      Height = 16
      Caption = 'Overall progress'
    end
    object lbReport: TListBox
      Left = 8
      Top = 48
      Width = 385
      Height = 49
      BevelKind = bkSoft
      BorderStyle = bsNone
      ItemHeight = 16
      TabOrder = 0
    end
    object btnStartLoading: TButton
      Left = 8
      Top = 5
      Width = 385
      Height = 25
      Caption = 'Load context'
      TabOrder = 1
      OnClick = btnStartLoadingClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 401
    Height = 86
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'From Disk'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 247
        Height = 16
        Caption = 'path to the TypesSystem file storage folder'
      end
      object edDiskContextPath: TEdit
        Left = 8
        Top = 24
        Width = 345
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object btnSelectContextPath: TButton
        Left = 352
        Top = 24
        Width = 36
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnSelectContextPathClick
      end
    end
  end
end
