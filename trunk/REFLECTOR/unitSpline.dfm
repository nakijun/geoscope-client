object fmSPLTest: TfmSPLTest
  Left = 280
  Top = 181
  Width = 897
  Height = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 735
    Top = 0
    Width = 154
    Height = 588
    Align = alRight
    TabOrder = 0
    object Label1: TLabel
      Left = 48
      Top = 232
      Width = 59
      Height = 13
      Caption = #1050#1091#1073#1080#1095#1077#1089#1082#1080#1081
    end
    object Label2: TLabel
      Left = 8
      Top = 368
      Width = 140
      Height = 13
      Caption = #1050#1091#1073#1080#1095#1077#1089#1082#1080#1081' '#1089' '#1088#1072#1089#1090#1103#1078#1077#1085#1080#1077#1084
    end
    object bbRecreate: TBitBtn
      Left = 19
      Top = 40
      Width = 113
      Height = 25
      Caption = 'ReCreate'
      TabOrder = 0
      OnClick = bbRecreateClick
    end
    object bbDoAprox: TBitBtn
      Left = 19
      Top = 72
      Width = 113
      Height = 25
      Caption = 'Aprox'
      TabOrder = 1
      OnClick = bbDoAproxClick
    end
    object leOrgDiff: TLabeledEdit
      Left = 16
      Top = 152
      Width = 113
      Height = 24
      EditLabel.Width = 112
      EditLabel.Height = 16
      EditLabel.Caption = #1055#1088#1086#1080#1079#1074' '#1074' '#1085#1072#1095#1072#1083#1077
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnKeyPress = leOrgDiffKeyPress
    end
    object leFinDiff: TLabeledEdit
      Left = 16
      Top = 200
      Width = 113
      Height = 24
      EditLabel.Width = 103
      EditLabel.Height = 16
      EditLabel.Caption = #1055#1088#1086#1080#1079#1074' '#1074' '#1082#1086#1085#1094#1077
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnKeyPress = leFinDiffKeyPress
    end
    object leLAMBDA0: TLabeledEdit
      Left = 16
      Top = 272
      Width = 113
      Height = 24
      EditLabel.Width = 66
      EditLabel.Height = 16
      EditLabel.Caption = 'LAMBDA-0'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnKeyPress = leLAMBDA0KeyPress
    end
    object leMUN: TLabeledEdit
      Left = 16
      Top = 320
      Width = 113
      Height = 24
      EditLabel.Width = 35
      EditLabel.Height = 16
      EditLabel.Caption = 'MU-N'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnKeyPress = leMUNKeyPress
    end
    object leALFA: TLabeledEdit
      Left = 16
      Top = 408
      Width = 113
      Height = 24
      EditLabel.Width = 33
      EditLabel.Height = 16
      EditLabel.Caption = 'ALFA'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnKeyPress = leALFAKeyPress
    end
    object bbSave: TBitBtn
      Left = 19
      Top = 104
      Width = 113
      Height = 25
      Caption = 'SAVE'
      TabOrder = 7
      OnClick = bbSaveClick
    end
    object BitBtn1: TBitBtn
      Left = 19
      Top = 8
      Width = 113
      Height = 25
      Caption = 'ReCreate fom list'
      TabOrder = 8
      OnClick = BitBtn1Click
    end
    object ListViewX: TListView
      Left = 16
      Top = 456
      Width = 57
      Height = 121
      Columns = <
        item
          Caption = 'X'
        end>
      Items.Data = {
        950000000600000000000000FFFFFFFFFFFFFFFF000000000000000002313500
        000000FFFFFFFFFFFFFFFF000000000000000002333000000000FFFFFFFFFFFF
        FFFF000000000000000002363000000000FFFFFFFFFFFFFFFF00000000000000
        000331323000000000FFFFFFFFFFFFFFFF000000000000000003323830000000
        00FFFFFFFFFFFFFFFF000000000000000003343830}
      TabOrder = 9
      ViewStyle = vsReport
    end
    object ListViewY: TListView
      Left = 80
      Top = 456
      Width = 57
      Height = 121
      Columns = <
        item
          Caption = 'Y'
        end>
      Items.Data = {
        940000000600000000000000FFFFFFFFFFFFFFFF000000000000000003302E39
        00000000FFFFFFFFFFFFFFFF000000000000000003312E3500000000FFFFFFFF
        FFFFFFFF0000000000000000013200000000FFFFFFFFFFFFFFFF000000000000
        000003322E3500000000FFFFFFFFFFFFFFFF0000000000000000013300000000
        FFFFFFFFFFFFFFFF000000000000000003342E38}
      TabOrder = 10
      ViewStyle = vsReport
    end
  end
end
