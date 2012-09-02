object fmGeoGraphServerObjectRegistrationWizard: TfmGeoGraphServerObjectRegistrationWizard
  Left = 52
  Top = 135
  BorderStyle = bsDialog
  Caption = 'Register object on the Geo-Graph-Server'
  ClientHeight = 415
  ClientWidth = 401
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
    Width = 401
    Height = 374
    Align = alClient
    TabOrder = 0
    object pnlStep0: TPanel
      Left = 1
      Top = 1
      Width = 399
      Height = 372
      Align = alClient
      TabOrder = 0
      Visible = False
    end
    object pnlStep2: TPanel
      Left = 1
      Top = 1
      Width = 399
      Height = 372
      Align = alClient
      TabOrder = 1
      Visible = False
    end
    object pnlStep1: TPanel
      Left = 1
      Top = 1
      Width = 399
      Height = 372
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
      object Label1: TLabel
        Left = 48
        Top = 16
        Width = 157
        Height = 16
        Caption = '1.Select GeoGraph Server'
      end
      object Label2: TLabel
        Left = 48
        Top = 88
        Width = 128
        Height = 16
        Caption = '2. Select Object Type'
      end
      object Label3: TLabel
        Left = 48
        Top = 168
        Width = 192
        Height = 16
        Caption = '3. Select Object Business Model'
      end
      object cbGeoGraphServer: TComboBox
        Left = 48
        Top = 32
        Width = 313
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
      end
      object cbObjectType: TComboBox
        Left = 48
        Top = 104
        Width = 313
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 1
        OnChange = cbObjectTypeChange
      end
      object cbObjectBusinessModel: TComboBox
        Left = 48
        Top = 184
        Width = 313
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 2
        OnChange = cbObjectBusinessModelChange
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 374
    Width = 401
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbPrev: TBitBtn
      Left = 120
      Top = 8
      Width = 81
      Height = 25
      Caption = '<< Back'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = bbPrevClick
    end
    object bbNext: TBitBtn
      Left = 201
      Top = 8
      Width = 81
      Height = 25
      Caption = 'Next >>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = bbNextClick
    end
    object bbCancel: TBitBtn
      Left = 312
      Top = 8
      Width = 81
      Height = 25
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = bbCancelClick
    end
  end
end
