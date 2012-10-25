object fmTypesFunctionalityExporter: TfmTypesFunctionalityExporter
  Left = 17
  Top = 112
  Width = 999
  Height = 593
  Caption = 'fmTypesFunctionalityExporter'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sbExport: TSpeedButton
    Left = 8
    Top = 8
    Width = 105
    Height = 25
    Caption = 'Export types '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sbExportClick
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 37
    Width = 983
    Height = 518
    ActivePage = TabSheet1
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TypesFunctionalityExport.inc'
      object memoTypesFunctionalityExport: TMemo
        Left = 0
        Top = 0
        Width = 975
        Height = 487
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4194304
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TypesFunctionalityExportImplementation.inc'
      ImageIndex = 1
      object memoTypesFunctionalityExportImplementation: TMemo
        Left = 0
        Top = 0
        Width = 964
        Height = 487
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4194304
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'TypesFunctionalityExportInterface.inc'
      ImageIndex = 3
      object memoTypesFunctionalityExportInterface: TMemo
        Left = 0
        Top = 0
        Width = 983
        Height = 487
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4194304
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TypesFunctionalityImportInterface.pas'
      ImageIndex = 2
      object memoTypesFunctionalityImportInterface: TMemo
        Left = 0
        Top = 0
        Width = 983
        Height = 487
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4194304
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'TypesFunctionalityImportImplementation.pas'
      ImageIndex = 4
      object memoTypesFunctionalityImportImplementation: TMemo
        Left = 0
        Top = 0
        Width = 983
        Height = 487
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4194304
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
  end
end
