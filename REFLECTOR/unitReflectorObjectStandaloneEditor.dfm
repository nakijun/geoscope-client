object fmReflectorObjectStandaloneEditor: TfmReflectorObjectStandaloneEditor
  Left = 174
  Top = 121
  Width = 655
  Height = 562
  Caption = 'Object standalone editor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 511
    Top = 0
    Width = 136
    Height = 535
    Align = alRight
    Color = 8404992
    TabOrder = 0
    object sbValidateAndExit: TSpeedButton
      Left = 8
      Top = 384
      Width = 121
      Height = 25
      Caption = 'Validate and exit'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = sbValidateAndExitClick
    end
    object sbShowPropsPanel: TSpeedButton
      Left = 8
      Top = 144
      Width = 121
      Height = 25
      Caption = 'Properties panel'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = sbShowPropsPanelClick
    end
    object sbValidate: TSpeedButton
      Left = 8
      Top = 352
      Width = 121
      Height = 25
      Caption = 'Validate changes'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = sbValidateClick
    end
    object sbClose: TSpeedButton
      Left = 8
      Top = 424
      Width = 121
      Height = 25
      Caption = 'Discard and close'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = sbCloseClick
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 121
      Height = 137
      Caption = ' Properties '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 105
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Color'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 96
        Width = 105
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Fill color'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pnlObjColor: TPanel
        Left = 8
        Top = 32
        Width = 105
        Height = 17
        TabOrder = 0
        OnClick = pnlObjColorClick
      end
      object cbObjflLoop: TCheckBox
        Left = 8
        Top = 56
        Width = 105
        Height = 17
        Caption = 'lock-in'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = cbObjflLoopClick
      end
      object pnlObjFillColor: TPanel
        Left = 8
        Top = 112
        Width = 105
        Height = 17
        TabOrder = 2
        OnClick = pnlObjFillColorClick
      end
      object cbObjflFill: TCheckBox
        Left = 8
        Top = 80
        Width = 105
        Height = 17
        Caption = 'filling'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = cbObjflFillClick
      end
    end
    object Panel2: TPanel
      Left = 8
      Top = 208
      Width = 121
      Height = 105
      Color = 8404992
      TabOrder = 1
      object sbClearNodes: TSpeedButton
        Left = 8
        Top = 40
        Width = 105
        Height = 25
        Caption = 'Clear nodes'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = sbClearNodesClick
      end
      object sbDestroySelectedNodes: TSpeedButton
        Left = 8
        Top = 72
        Width = 105
        Height = 25
        Caption = 'Destroy selected'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = sbDestroySelectedNodesClick
      end
      object cbNodeCreating: TCheckBox
        Left = 8
        Top = 8
        Width = 105
        Height = 25
        Caption = 'nodes creating'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = cbNodeCreatingClick
      end
    end
  end
  object sbEditing: TScrollBox
    Left = 0
    Top = 0
    Width = 511
    Height = 535
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    TabOrder = 1
    object pbEditingSpace: TPaintBox
      Left = 0
      Top = 0
      Width = 25
      Height = 25
      OnMouseDown = pbEditingSpaceMouseDown
      OnMouseMove = pbEditingSpaceMouseMove
      OnMouseUp = pbEditingSpaceMouseUp
      OnPaint = pbEditingSpacePaint
    end
  end
  object ColorDialog: TColorDialog
    Left = 456
    Top = 56
  end
end
