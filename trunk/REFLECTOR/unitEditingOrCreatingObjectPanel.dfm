object fmEditingOrCreatingObjectPanel: TfmEditingOrCreatingObjectPanel
  Left = 500
  Top = 234
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsNone
  ClientHeight = 82
  ClientWidth = 117
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 117
    Height = 82
    Align = alClient
  end
  object lbCommitAction: TLabel
    Left = 5
    Top = -1
    Width = 108
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'commit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object sbYes: TSpeedButton
    Left = 1
    Top = 15
    Width = 35
    Height = 17
    Hint = 'Commit changes'
    Caption = 'YES'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = sbYesClick
  end
  object sbReset: TSpeedButton
    Left = 74
    Top = 14
    Width = 42
    Height = 17
    Hint = 'reset object to original position'
    Caption = 'reset'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = sbResetClick
  end
  object sbFree: TSpeedButton
    Left = 104
    Top = 1
    Width = 13
    Height = 13
    Hint = 'to close SPUTNIK'
    Caption = 'X'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8388863
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = sbFreeClick
  end
  object sbClone: TSpeedButton
    Left = 1
    Top = 32
    Width = 35
    Height = 17
    Hint = 'Create clone'
    Caption = 'clone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = sbCloneClick
  end
  object cbFix: TSpeedButton
    Left = 36
    Top = 15
    Width = 38
    Height = 17
    Hint = 'Fix object to screenplace'
    AllowAllUp = True
    GroupIndex = 1
    Caption = 'fix'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = cbFixClick
  end
  object sbShowPropsPanel: TSpeedButton
    Left = 74
    Top = 31
    Width = 42
    Height = 17
    Hint = 'show props panel of object'
    Caption = 'panel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = sbShowPropsPanelClick
  end
  object sbShowObjProps: TSpeedButton
    Left = 74
    Top = 48
    Width = 42
    Height = 17
    Hint = 'show object base properties'
    AllowAllUp = True
    GroupIndex = 2
    Caption = 'obj'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = sbShowObjPropsClick
  end
  object sbExport: TSpeedButton
    Left = 1
    Top = 49
    Width = 35
    Height = 17
    Hint = 'export as XML'
    Caption = 'XML'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = sbExportClick
  end
  object Bevel2: TBevel
    Left = 38
    Top = 34
    Width = 34
    Height = 30
  end
  object cbUseInsideObjects: TCheckBox
    Left = 6
    Top = 67
    Width = 105
    Height = 13
    Hint = 'Use objects inside'
    Caption = 'use inside objects'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = cbUseInsideObjectsClick
  end
  object popupCreateObject: TPopupMenu
    Left = 40
    Top = 8
    object CreatewithDefaultsecurity1: TMenuItem
      Caption = 'Create with Default security'
      OnClick = CreatewithDefaultsecurity1Click
    end
    object CreatewithPrivatesecurity1: TMenuItem
      Caption = 'Create with Private security'
      OnClick = CreatewithPrivatesecurity1Click
    end
    object CreatewithOthersecurity1: TMenuItem
      Caption = 'Create with Other security ...'
      OnClick = CreatewithOthersecurity1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Cancel1: TMenuItem
      Caption = 'Cancel'
      OnClick = Cancel1Click
    end
  end
  object popupCloneObject: TPopupMenu
    Left = 40
    Top = 40
    object ClonewithDefaultsecurity1: TMenuItem
      Caption = 'Clone with Default security'
      OnClick = ClonewithDefaultsecurity1Click
    end
    object ClonewithPrivatesecurity1: TMenuItem
      Caption = 'Clone with Private security'
      OnClick = ClonewithPrivatesecurity1Click
    end
    object ClonewithOthersecurity1: TMenuItem
      Caption = 'Clone with Other security ...'
      OnClick = ClonewithOthersecurity1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Cancel2: TMenuItem
      Caption = 'Cancel'
      OnClick = Cancel2Click
    end
  end
end
