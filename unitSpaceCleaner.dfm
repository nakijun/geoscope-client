object fmSpaceCleaner: TfmSpaceCleaner
  Left = 0
  Top = 90
  Width = 847
  Height = 480
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Space Cleaner'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 839
    Height = 453
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'UnReferenced Components'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 85
        Height = 16
        Alignment = taCenter
        Caption = 'Types system'
      end
      object URCTypesSystemProgressBar: TGauge
        Left = 104
        Top = 8
        Width = 385
        Height = 17
        BackColor = clSilver
        ForeColor = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Progress = 0
      end
      object URCTypeSystem: TLabel
        Left = 18
        Top = 32
        Width = 327
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
      end
      object URCTypeSystemProgressBar: TGauge
        Left = 352
        Top = 32
        Width = 137
        Height = 17
        BackColor = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8421440
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Progress = 0
      end
      object sbURCSearchStart: TSpeedButton
        Left = 624
        Top = 8
        Width = 97
        Height = 41
        Caption = 'Start ...'
        OnClick = sbURCSearchStartClick
      end
      object sbURCSearchStop: TSpeedButton
        Left = 728
        Top = 8
        Width = 97
        Height = 41
        Caption = 'STOP'
        OnClick = sbURCSearchStopClick
      end
      object lbURCTypesSystem: TLabel
        Left = 490
        Top = 8
        Width = 127
        Height = 16
        AutoSize = False
      end
      object lbURCTypeSystem: TLabel
        Left = 490
        Top = 32
        Width = 127
        Height = 16
        AutoSize = False
      end
      object Panel1: TPanel
        Left = 0
        Top = 57
        Width = 831
        Height = 365
        Align = alBottom
        Caption = 'Panel1'
        TabOrder = 0
        object Panel2: TPanel
          Left = 716
          Top = 1
          Width = 114
          Height = 363
          Align = alRight
          TabOrder = 0
          object sbURCDestroySelectedItems: TRxSpeedButton
            Left = 8
            Top = 8
            Width = 97
            Height = 57
            Caption = 'Destroy'#13#10'Selected'#13#10'Items'
            OnClick = sbURCDestroySelectedItemsClick
          end
        end
        object lvURCList: TListView
          Left = 1
          Top = 1
          Width = 715
          Height = 363
          Align = alClient
          Columns = <
            item
              Caption = 'Component'
              Width = 650
            end>
          DragMode = dmAutomatic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Cyr'
          Font.Style = [fsBold]
          HideSelection = False
          MultiSelect = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 1
          ViewStyle = vsReport
          OnDblClick = lvURCListDblClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Null Components'
      ImageIndex = 1
      object Label2: TLabel
        Left = 16
        Top = 8
        Width = 85
        Height = 16
        Alignment = taCenter
        Caption = 'Types system'
      end
      object NCTypesSystemProgressBar: TGauge
        Left = 104
        Top = 8
        Width = 385
        Height = 17
        BackColor = clSilver
        ForeColor = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Progress = 0
      end
      object lbNCTypesSystem: TLabel
        Left = 490
        Top = 8
        Width = 127
        Height = 16
        AutoSize = False
      end
      object NCTypeSystem: TLabel
        Left = 18
        Top = 32
        Width = 327
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
      end
      object NCTypeSystemProgressBar: TGauge
        Left = 352
        Top = 32
        Width = 137
        Height = 17
        BackColor = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8421440
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Progress = 0
      end
      object lbNCTypeSystem: TLabel
        Left = 490
        Top = 32
        Width = 127
        Height = 16
        AutoSize = False
      end
      object sbNCSearchStart: TSpeedButton
        Left = 624
        Top = 8
        Width = 97
        Height = 41
        Caption = 'Start ...'
        OnClick = sbNCSearchStartClick
      end
      object sbNCSearchStop: TSpeedButton
        Left = 728
        Top = 8
        Width = 97
        Height = 41
        Caption = 'STOP'
        OnClick = sbNCSearchStopClick
      end
      object Panel3: TPanel
        Left = 0
        Top = 57
        Width = 831
        Height = 365
        Align = alBottom
        Caption = 'Panel1'
        TabOrder = 0
        object Panel4: TPanel
          Left = 716
          Top = 1
          Width = 114
          Height = 363
          Align = alRight
          TabOrder = 0
          object sbNCDestroySelectedItems: TRxSpeedButton
            Left = 8
            Top = 8
            Width = 97
            Height = 57
            Caption = 'Destroy'#13#10'Selected'#13#10'Items'
            OnClick = sbNCDestroySelectedItemsClick
          end
        end
        object lvNCList: TListView
          Left = 1
          Top = 1
          Width = 715
          Height = 363
          Align = alClient
          Columns = <
            item
              Caption = 'Component'
              Width = 650
            end>
          DragMode = dmAutomatic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Cyr'
          Font.Style = [fsBold]
          HideSelection = False
          MultiSelect = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 1
          ViewStyle = vsReport
          OnDblClick = lvNCListDblClick
        end
      end
    end
  end
end
