object fmGeoGraphServerObjectDataServerVideoMeasurementVisor: TfmGeoGraphServerObjectDataServerVideoMeasurementVisor
  Left = 139
  Top = 200
  Width = 653
  Height = 339
  Caption = 'Measurement Visor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnHide = FormHide
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 0
    Top = 129
    Width = 637
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 637
    Height = 129
    Align = alTop
    TabOrder = 0
    object pnlControl: TPanel
      Left = 1
      Top = 96
      Width = 635
      Height = 32
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Bevel1: TBevel
        Left = 232
        Top = 3
        Width = 3
        Height = 26
      end
      object cbAudio: TCheckBox
        Left = 8
        Top = 8
        Width = 113
        Height = 17
        Caption = 'Audio channel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object cbVideo: TCheckBox
        Left = 120
        Top = 8
        Width = 111
        Height = 17
        Caption = 'Video channel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object btnStartStopPlayingFragment: TBitBtn
        Left = 240
        Top = 4
        Width = 169
        Height = 25
        Caption = 'Start playing'
        TabOrder = 2
        OnClick = btnStartStopPlayingFragmentClick
      end
    end
  end
  object lvFragments: TListView
    Left = 0
    Top = 132
    Width = 637
    Height = 169
    Align = alClient
    Columns = <
      item
        Caption = 'MeasurementID'
        Width = 1
      end
      item
        Caption = 'Fragment'
        Width = 200
      end
      item
        Caption = 'Finish time'
        Width = 200
      end
      item
        Caption = 'Duration, secs'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = 'Audio'
      end
      item
        Alignment = taCenter
        Caption = 'Video'
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnClick = lvFragmentsClick
    OnDblClick = lvFragmentsDblClick
  end
  object Playing: TTimer
    Enabled = False
    OnTimer = PlayingTimer
    Left = 136
    Top = 8
  end
end
