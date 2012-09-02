object fmGeoObjectTrackControlPanel: TfmGeoObjectTrackControlPanel
  Left = 234
  Top = 69
  Width = 1155
  Height = 889
  Caption = 'Track control panel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl: TPageControl
    Left = 0
    Top = 169
    Width = 1147
    Height = 693
    ActivePage = tsStopsAndMovementsAnalysis
    Align = alClient
    TabOrder = 0
    object tsSummary: TTabSheet
      Caption = 'Summary'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 458
        Width = 1139
        Height = 81
        Align = alBottom
        Caption = ' Summary '
        TabOrder = 0
        DesignSize = (
          1139
          81)
        object stSummariDistance: TStaticText
          Left = 8
          Top = 24
          Width = 1102
          Height = 20
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 0
        end
        object stSummaryNodesNumber: TStaticText
          Left = 8
          Top = 44
          Width = 1102
          Height = 20
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 1139
        Height = 458
        Align = alClient
        Caption = ' Track '
        TabOrder = 1
        object lvTrackNodes: TListView
          Left = 2
          Top = 51
          Width = 1135
          Height = 385
          Align = alClient
          Columns = <
            item
              Caption = 'Time'
              Width = 128
            end
            item
              Caption = 'Location'
              Width = 700
            end
            item
              Caption = 'Speed, Km/h'
              Width = 120
            end
            item
              Caption = 'Coordinates (Lat; Long)'
              Width = 200
            end>
          GridLines = True
          HideSelection = False
          ReadOnly = True
          RowSelect = True
          PopupMenu = lvTrackNodes_PopupMenu
          TabOrder = 0
          ViewStyle = vsReport
          OnAdvancedCustomDrawSubItem = lvTrackNodesAdvancedCustomDrawSubItem
          OnClick = lvTrackNodesClick
          OnDblClick = lvTrackNodesDblClick
        end
        object stObjectModelEventsSummary: TStaticText
          Left = 2
          Top = 436
          Width = 1135
          Height = 20
          Align = alBottom
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 1
          Visible = False
        end
        object Panel2: TPanel
          Left = 2
          Top = 18
          Width = 1135
          Height = 33
          Align = alTop
          TabOrder = 2
          object cbShowTrack: TCheckBox
            Left = 8
            Top = 8
            Width = 185
            Height = 17
            Caption = 'Show on map'
            TabOrder = 0
            OnClick = cbShowTrackClick
          end
          object cbSpeedColoredTrack: TCheckBox
            Left = 400
            Top = 8
            Width = 209
            Height = 17
            Caption = 'Show speed color'
            TabOrder = 2
            OnClick = cbShowTrackClick
          end
          object cbShowTrackNodes: TCheckBox
            Left = 192
            Top = 8
            Width = 209
            Height = 17
            Caption = 'Show track nodes'
            TabOrder = 1
            OnClick = cbShowTrackClick
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 539
        Width = 1139
        Height = 123
        Align = alBottom
        Caption = ' Calculator '
        TabOrder = 2
        Visible = False
        DesignSize = (
          1139
          123)
        object Label1: TLabel
          Left = 733
          Top = 26
          Width = 68
          Height = 16
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          AutoSize = False
          Caption = 'from point #'
        end
        object Label2: TLabel
          Left = 885
          Top = 26
          Width = 60
          Height = 16
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          AutoSize = False
          Caption = 'to point #'
        end
        object StaticText1: TStaticText
          Left = 8
          Top = 24
          Width = 718
          Height = 20
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = 'Distance between two points'
          TabOrder = 0
        end
        object cbStartPoint: TComboBox
          Left = 802
          Top = 23
          Width = 84
          Height = 24
          Style = csDropDownList
          Anchors = [akTop, akRight]
          ItemHeight = 0
          TabOrder = 1
          OnChange = cbStartPointChange
        end
        object cbFinishPoint: TComboBox
          Left = 946
          Top = 23
          Width = 84
          Height = 24
          Style = csDropDownList
          Anchors = [akTop, akRight]
          ItemHeight = 0
          TabOrder = 2
        end
        object bbCalculateDistance: TBitBtn
          Left = 1033
          Top = 24
          Width = 89
          Height = 23
          Anchors = [akTop, akRight]
          Caption = 'Calculate'
          TabOrder = 3
          OnClick = bbCalculateDistanceClick
        end
        object memoDistanceResults: TMemo
          Left = 8
          Top = 56
          Width = 1122
          Height = 57
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
      end
    end
    object tsStopsAndMovementsAnalysis: TTabSheet
      Caption = 'Stops&&Movements'
      ImageIndex = 1
      object lvStopsAndMovementsAnalysis: TListView
        Left = 0
        Top = 33
        Width = 1139
        Height = 573
        Align = alClient
        Columns = <
          item
            Caption = 'Time'
            Width = 128
          end
          item
            Caption = 'Event'
            Width = 120
          end
          item
            Caption = 'Duration, min'
            Width = 150
          end
          item
            Caption = 'Distance, km'
            Width = 120
          end
          item
            Caption = 'Location'
            Width = 550
          end
          item
            Caption = 'Avr Speed, km/h'
            Width = 150
          end
          item
            Caption = 'Min Speed, km/h'
            Width = 150
          end
          item
            Caption = 'Max Speed, km/h'
            Width = 150
          end>
        GridLines = True
        HideSelection = False
        MultiSelect = True
        ReadOnly = True
        RowSelect = True
        PopupMenu = lvStopsAndMovementsAnalysis_Popup
        TabOrder = 0
        ViewStyle = vsReport
        OnAdvancedCustomDrawSubItem = lvStopsAndMovementsAnalysisAdvancedCustomDrawSubItem
        OnClick = lvStopsAndMovementsAnalysisClick
        OnDblClick = lvStopsAndMovementsAnalysisDblClick
        OnSelectItem = lvStopsAndMovementsAnalysisSelectItem
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 606
        Width = 1139
        Height = 56
        Align = alBottom
        Caption = ' Summary '
        TabOrder = 1
        DesignSize = (
          1139
          56)
        object lbStopsAndMovementsDuration: TLabel
          Left = 8
          Top = 23
          Width = 1103
          Height = 16
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1139
        Height = 33
        Align = alTop
        TabOrder = 2
        object cbShowStopsAndMovements: TCheckBox
          Left = 8
          Top = 8
          Width = 185
          Height = 17
          Caption = 'Show on map'
          TabOrder = 0
          OnClick = cbShowTrackClick
        end
        object cbShowMovements: TCheckBox
          Left = 192
          Top = 8
          Width = 185
          Height = 17
          Caption = 'Show movements'
          TabOrder = 1
          OnClick = cbShowTrackClick
        end
      end
    end
    object tsFuelConsumption: TTabSheet
      Caption = 'Fuel consumption'
      ImageIndex = 2
      object lvFuelConsumptionAnalysis: TListView
        Left = 0
        Top = 0
        Width = 1139
        Height = 606
        Align = alClient
        Columns = <
          item
            Caption = 'Time'
            Width = 128
          end
          item
            Caption = 'Duration, min'
            Width = 150
          end
          item
            Caption = 'Distance, km'
            Width = 150
          end
          item
            Caption = 'Avr Speed, km/h'
            Width = 150
          end
          item
            Alignment = taRightJustify
            Caption = 'Consumption, L'
            Width = 150
          end>
        GridLines = True
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        PopupMenu = lvFuelConsumptionAnalysis_PopupMenu
        TabOrder = 0
        ViewStyle = vsReport
        OnClick = lvFuelConsumptionAnalysisClick
        OnCustomDrawSubItem = lvFuelConsumptionAnalysisCustomDrawSubItem
        OnDblClick = lvFuelConsumptionAnalysisDblClick
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 606
        Width = 1139
        Height = 56
        Align = alBottom
        Caption = ' Summary '
        TabOrder = 1
        DesignSize = (
          1139
          56)
        object lbFuelConsumption: TLabel
          Left = 8
          Top = 23
          Width = 977
          Height = 16
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnFuelConsumptionRateTable: TButton
          Left = 992
          Top = 20
          Width = 137
          Height = 25
          Caption = 'Rate Table'
          TabOrder = 0
          OnClick = btnFuelConsumptionRateTableClick
        end
      end
    end
    object tsEvents: TTabSheet
      Caption = 'Events'
      ImageIndex = 3
      object GroupBox6: TGroupBox
        Left = 0
        Top = 0
        Width = 1139
        Height = 573
        Align = alClient
        Caption = ' Business model events '
        TabOrder = 0
        object lvBusinessModelEvents: TListView
          Left = 2
          Top = 51
          Width = 1135
          Height = 500
          Align = alClient
          Columns = <
            item
              Caption = 'Time'
              Width = 110
            end
            item
              Caption = 'Severity'
              Width = 100
            end
            item
              Caption = 'Message'
              Width = 300
            end
            item
              Caption = 'Info'
              Width = 500
            end>
          GridLines = True
          HideSelection = False
          ReadOnly = True
          RowSelect = True
          PopupMenu = lvBusinessModelEvents_PopupMenu
          TabOrder = 0
          ViewStyle = vsReport
          OnClick = lvBusinessModelEventsClick
          OnCustomDrawSubItem = lvBusinessModelEventsCustomDrawSubItem
          OnDblClick = lvBusinessModelEventsDblClick
        end
        object stBusinessModelEventsSummary: TStaticText
          Left = 2
          Top = 551
          Width = 1135
          Height = 20
          Align = alBottom
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 1
        end
        object Panel4: TPanel
          Left = 2
          Top = 18
          Width = 1135
          Height = 33
          Align = alTop
          TabOrder = 2
          OnClick = cbShowTrackClick
          object cbShowBusinessModelEvents: TCheckBox
            Left = 8
            Top = 8
            Width = 185
            Height = 17
            Caption = 'Show on map'
            TabOrder = 0
            OnClick = cbShowTrackClick
          end
        end
      end
      object GroupBox7: TGroupBox
        Left = 0
        Top = 573
        Width = 1139
        Height = 89
        Align = alBottom
        Caption = ' Object model events '
        TabOrder = 1
        Visible = False
        object Panel5: TPanel
          Left = 2
          Top = 18
          Width = 1135
          Height = 33
          Align = alTop
          TabOrder = 0
          OnClick = cbShowTrackClick
          object cbShowObjectModelEvents: TCheckBox
            Left = 8
            Top = 8
            Width = 185
            Height = 17
            Caption = 'Show on map'
            TabOrder = 0
            OnClick = cbShowTrackClick
          end
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1147
    Height = 37
    Align = alTop
    TabOrder = 1
    DesignSize = (
      1147
      37)
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 41
      Height = 16
      AutoSize = False
      Caption = 'Track'
    end
    object Label4: TLabel
      Left = 48
      Top = 8
      Width = 25
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'from'
    end
    object Label5: TLabel
      Left = 200
      Top = 8
      Width = 25
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'to'
    end
    object edTrackBeginTimestamp: TEdit
      Left = 80
      Top = 6
      Width = 121
      Height = 24
      ReadOnly = True
      TabOrder = 0
    end
    object edTrackEndTimestamp: TEdit
      Left = 232
      Top = 6
      Width = 121
      Height = 24
      ReadOnly = True
      TabOrder = 1
    end
    object btnCoComponent: TBitBtn
      Left = 840
      Top = 6
      Width = 139
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Object'
      TabOrder = 3
      OnClick = btnCoComponentClick
    end
    object btnPrint: TBitBtn
      Left = 992
      Top = 6
      Width = 139
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Print'
      TabOrder = 2
      OnClick = btnPrintClick
    end
  end
  object gbTrackInterval: TGroupBox
    Left = 0
    Top = 37
    Width = 1147
    Height = 132
    Align = alTop
    Caption = ' Chronology '
    TabOrder = 2
  end
  object Updater: TTimer
    OnTimer = UpdaterTimer
    Left = 632
    Top = 65528
  end
  object lvStopsAndMovementsAnalysis_Popup: TPopupMenu
    Left = 292
    Top = 233
    object Addselectedtoprintreport1: TMenuItem
      Caption = 'Add selected to print report'
      OnClick = Addselectedtoprintreport1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Showmaphint1: TMenuItem
      Caption = 'Show map hint'
      OnClick = Showmaphint1Click
    end
  end
  object lvTrackNodes_PopupMenu: TPopupMenu
    Left = 92
    Top = 233
    object Addselectedtoprintreport2: TMenuItem
      Caption = 'Add selected to print report'
      OnClick = Addselectedtoprintreport2Click
    end
  end
  object lvFuelConsumptionAnalysis_PopupMenu: TPopupMenu
    Left = 500
    Top = 233
    object Addselectedtoprintreport3: TMenuItem
      Caption = 'Add selected to print report'
      OnClick = Addselectedtoprintreport3Click
    end
  end
  object lvBusinessModelEvents_PopupMenu: TPopupMenu
    Left = 708
    Top = 233
    object Addselectedtoprintreport4: TMenuItem
      Caption = 'Add selected to print report'
      OnClick = Addselectedtoprintreport4Click
    end
  end
end
