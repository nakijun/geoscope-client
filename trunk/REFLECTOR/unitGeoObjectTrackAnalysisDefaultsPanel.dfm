object fmGeoObjectTrackAnalysisDefaultsPanel: TfmGeoObjectTrackAnalysisDefaultsPanel
  Left = 629
  Top = 346
  AutoScroll = False
  Caption = 'Track analysis defaults'
  ClientHeight = 390
  ClientWidth = 739
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 739
    Height = 352
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = ' Track reflection '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object Reflection_cbShowTrack: TCheckBox
        Left = 8
        Top = 8
        Width = 361
        Height = 17
        Caption = 'Show Track'
        TabOrder = 0
      end
      object Reflection_cbShowTrackNodes: TCheckBox
        Left = 8
        Top = 32
        Width = 361
        Height = 17
        Caption = 'Show track nodes'
        TabOrder = 1
      end
      object Reflection_cbSpeedColoredTrack: TCheckBox
        Left = 8
        Top = 56
        Width = 361
        Height = 17
        Caption = 'Speed colored track'
        TabOrder = 2
      end
      object Reflection_cbShowStopsAndMovementsGraph: TCheckBox
        Left = 8
        Top = 80
        Width = 361
        Height = 17
        Caption = 'Show Stops&&Movements graph'
        TabOrder = 3
      end
      object Reflection_cbHideMovementsGraph: TCheckBox
        Left = 8
        Top = 104
        Width = 361
        Height = 17
        Caption = 'Hide movements graph'
        TabOrder = 4
      end
      object Reflection_cbShowObjectModelEvents: TCheckBox
        Left = 8
        Top = 128
        Width = 361
        Height = 17
        Caption = 'Show object model events'
        TabOrder = 5
      end
      object Reflection_cbShowBusinessModelEvents: TCheckBox
        Left = 8
        Top = 152
        Width = 361
        Height = 17
        Caption = 'Show business model events'
        TabOrder = 6
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 352
    Width = 739
    Height = 38
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      739
      38)
    object btnOK: TBitBtn
      Left = 544
      Top = 6
      Width = 81
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TBitBtn
      Left = 632
      Top = 5
      Width = 97
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
end
