object fmPFMapLoader: TfmPFMapLoader
  Left = 128
  Top = 0
  Width = 700
  Height = 570
  Caption = '"Polish" format map loader'
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 692
    Height = 137
    ActivePage = TabSheet1
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Load'
      object Panel1: TPanel
        Left = 0
        Top = 49
        Width = 684
        Height = 57
        Align = alBottom
        TabOrder = 1
        DesignSize = (
          684
          57)
        object btnLoadFromFile: TBitBtn
          Left = 592
          Top = 28
          Width = 89
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Load'
          TabOrder = 3
          OnClick = btnLoadFromFileClick
        end
        object StaticText2: TStaticText
          Left = 8
          Top = 4
          Width = 54
          Height = 20
          Caption = 'Map file '
          TabOrder = 4
        end
        object stMapFileName: TStaticText
          Left = 64
          Top = 3
          Width = 581
          Height = 20
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 5
        end
        object btnSelectMapFile: TBitBtn
          Left = 647
          Top = 3
          Width = 34
          Height = 20
          Anchors = [akTop, akRight]
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnSelectMapFileClick
        end
        object btnValidateMapFile: TBitBtn
          Left = 8
          Top = 28
          Width = 89
          Height = 25
          Caption = 'Validate'
          TabOrder = 2
          OnClick = btnValidateMapFileClick
        end
        object cbSkipOnDuplicate: TCheckBox
          Left = 176
          Top = 32
          Width = 193
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Skip on duplicate'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object cbCreatedObjectsFile: TCheckBox
          Left = 376
          Top = 32
          Width = 209
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Create file of created objects'
          TabOrder = 6
        end
      end
      object btnEditObjectPrototypesDATA: TBitBtn
        Left = 8
        Top = 8
        Width = 225
        Height = 25
        Caption = 'Edit object prototypes'
        TabOrder = 0
        OnClick = btnEditObjectPrototypesDATAClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Recalculate'
      ImageIndex = 2
      DesignSize = (
        684
        106)
      object btnRecalculate: TBitBtn
        Left = 8
        Top = 48
        Width = 225
        Height = 25
        Caption = 'Recalculate objects'
        TabOrder = 0
        OnClick = btnRecalculateClick
      end
      object cbRecalculateByPrototype: TCheckBox
        Left = 8
        Top = 16
        Width = 225
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Recalculate by prototype'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Unload'
      ImageIndex = 2
      object btnRemoveComponentsFromFile: TBitBtn
        Left = 8
        Top = 48
        Width = 225
        Height = 25
        Caption = 'Remove objects from file'
        TabOrder = 1
        OnClick = btnRemoveComponentsFromFileClick
      end
      object btnRemove: TBitBtn
        Left = 8
        Top = 8
        Width = 225
        Height = 25
        Caption = 'Remove objects'
        TabOrder = 0
        OnClick = btnRemoveClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 137
    Width = 692
    Height = 406
    Align = alClient
    TabOrder = 1
    object memoLog: TMemo
      Left = 1
      Top = 33
      Width = 690
      Height = 372
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 690
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object cbInfoEvents: TCheckBox
        Left = 8
        Top = 8
        Width = 121
        Height = 17
        Caption = 'Info Events'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object cbWarningEvents: TCheckBox
        Left = 136
        Top = 7
        Width = 121
        Height = 17
        Caption = 'Warning Events'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
      end
      object cbErrorEvents: TCheckBox
        Left = 264
        Top = 7
        Width = 121
        Height = 17
        Caption = 'Error Events'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 2
      end
    end
  end
  object OpenDialog: TOpenDialog
    Left = 644
    Top = 11
  end
end
