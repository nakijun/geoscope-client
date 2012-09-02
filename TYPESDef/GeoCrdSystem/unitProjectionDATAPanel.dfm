object fmProjectionDATAPanel: TfmProjectionDATAPanel
  Left = 306
  Top = 254
  Width = 378
  Height = 290
  Caption = 'Projection DATA'
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
  object gbEQCProjection: TGroupBox
    Left = 0
    Top = 0
    Width = 370
    Height = 263
    Align = alClient
    Caption = ' Equidistant Conic (EQC) Projection '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
    object Label12: TLabel
      Left = 94
      Top = 32
      Width = 83
      Height = 16
      Alignment = taRightJustify
      Caption = 'Latitude origin'
    end
    object Label13: TLabel
      Left = 84
      Top = 64
      Width = 93
      Height = 16
      Alignment = taRightJustify
      Caption = 'Central meridial'
    end
    object Label14: TLabel
      Left = 106
      Top = 96
      Width = 71
      Height = 16
      Alignment = taRightJustify
      Caption = 'First latitude'
    end
    object Label15: TLabel
      Left = 96
      Top = 160
      Width = 81
      Height = 16
      Alignment = taRightJustify
      Caption = 'False easting'
    end
    object Label16: TLabel
      Left = 93
      Top = 192
      Width = 84
      Height = 16
      Alignment = taRightJustify
      Caption = 'False northing'
    end
    object sbSetEQCProjectionDATA: TSpeedButton
      Left = 184
      Top = 224
      Width = 161
      Height = 25
      Caption = 'Save data'
      OnClick = sbSetEQCProjectionDATAClick
    end
    object Label17: TLabel
      Left = 84
      Top = 128
      Width = 93
      Height = 16
      Alignment = taRightJustify
      Caption = 'Second latitude'
    end
    object EQC_edLatOfOrigin: TEdit
      Left = 184
      Top = 29
      Width = 161
      Height = 24
      TabOrder = 0
    end
    object EQC_edLongOfOrigin: TEdit
      Left = 184
      Top = 61
      Width = 161
      Height = 24
      TabOrder = 1
    end
    object EQC_edFirstStdParallel: TEdit
      Left = 184
      Top = 93
      Width = 161
      Height = 24
      TabOrder = 2
    end
    object EQC_edFalseEasting: TEdit
      Left = 184
      Top = 157
      Width = 161
      Height = 24
      TabOrder = 4
    end
    object EQC_edFalseNorthing: TEdit
      Left = 184
      Top = 189
      Width = 161
      Height = 24
      TabOrder = 5
    end
    object EQC_edSecondStdParallel: TEdit
      Left = 184
      Top = 125
      Width = 161
      Height = 24
      TabOrder = 3
    end
  end
  object gbLCCProjection: TGroupBox
    Left = 0
    Top = 0
    Width = 370
    Height = 263
    Align = alClient
    Caption = ' Lambert Conformal Conic (LCC) Projection '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    object Label6: TLabel
      Left = 94
      Top = 32
      Width = 83
      Height = 16
      Alignment = taRightJustify
      Caption = 'Latitude origin'
    end
    object Label7: TLabel
      Left = 84
      Top = 64
      Width = 93
      Height = 16
      Alignment = taRightJustify
      Caption = 'Central meridial'
    end
    object Label8: TLabel
      Left = 106
      Top = 96
      Width = 71
      Height = 16
      Alignment = taRightJustify
      Caption = 'First latitude'
    end
    object Label9: TLabel
      Left = 96
      Top = 160
      Width = 81
      Height = 16
      Alignment = taRightJustify
      Caption = 'False easting'
    end
    object Label10: TLabel
      Left = 93
      Top = 192
      Width = 84
      Height = 16
      Alignment = taRightJustify
      Caption = 'False northing'
    end
    object sbSetLCCProjectionDATA: TSpeedButton
      Left = 184
      Top = 224
      Width = 161
      Height = 25
      Caption = 'Save data'
      OnClick = sbSetLCCProjectionDATAClick
    end
    object Label11: TLabel
      Left = 84
      Top = 128
      Width = 93
      Height = 16
      Alignment = taRightJustify
      Caption = 'Second latitude'
    end
    object LCC_edLatOfOrigin: TEdit
      Left = 184
      Top = 29
      Width = 161
      Height = 24
      TabOrder = 0
    end
    object LCC_edLongOfOrigin: TEdit
      Left = 184
      Top = 61
      Width = 161
      Height = 24
      TabOrder = 1
    end
    object LCC_edFirstStdParallel: TEdit
      Left = 184
      Top = 93
      Width = 161
      Height = 24
      TabOrder = 2
    end
    object LCC_edFalseEasting: TEdit
      Left = 184
      Top = 157
      Width = 161
      Height = 24
      TabOrder = 4
    end
    object LCC_edFalseNorthing: TEdit
      Left = 184
      Top = 189
      Width = 161
      Height = 24
      TabOrder = 5
    end
    object LCC_edSecondStdParallel: TEdit
      Left = 184
      Top = 125
      Width = 161
      Height = 24
      TabOrder = 3
    end
  end
  object gbTMProjection: TGroupBox
    Left = 0
    Top = 0
    Width = 370
    Height = 263
    Align = alClient
    Caption = ' TM Projection '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = False
    object Label1: TLabel
      Left = 94
      Top = 40
      Width = 83
      Height = 16
      Alignment = taRightJustify
      Caption = 'Latitude origin'
    end
    object Label2: TLabel
      Left = 84
      Top = 72
      Width = 93
      Height = 16
      Alignment = taRightJustify
      Caption = 'Central meridial'
    end
    object Label3: TLabel
      Left = 106
      Top = 104
      Width = 71
      Height = 16
      Alignment = taRightJustify
      Caption = 'Scale factor'
    end
    object Label4: TLabel
      Left = 96
      Top = 136
      Width = 81
      Height = 16
      Alignment = taRightJustify
      Caption = 'False easting'
    end
    object Label5: TLabel
      Left = 93
      Top = 168
      Width = 84
      Height = 16
      Alignment = taRightJustify
      Caption = 'False northing'
    end
    object sbSetTMProjectionDATA: TSpeedButton
      Left = 184
      Top = 224
      Width = 161
      Height = 25
      Caption = 'Save data'
      OnClick = sbSetTMProjectionDATAClick
    end
    object edLatitudeOrigin: TEdit
      Left = 184
      Top = 37
      Width = 161
      Height = 24
      TabOrder = 0
    end
    object edCentralMeridian: TEdit
      Left = 184
      Top = 69
      Width = 161
      Height = 24
      TabOrder = 1
    end
    object edScaleFactor: TEdit
      Left = 184
      Top = 101
      Width = 161
      Height = 24
      TabOrder = 2
    end
    object edFalseEasting: TEdit
      Left = 184
      Top = 133
      Width = 161
      Height = 24
      TabOrder = 3
    end
    object edFalseNorthing: TEdit
      Left = 184
      Top = 165
      Width = 161
      Height = 24
      TabOrder = 4
    end
  end
  object pnlUnknownProjection: TPanel
    Left = 0
    Top = 0
    Width = 370
    Height = 263
    Align = alClient
    Caption = 'Projection is unknown'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
  end
  object gbMPProjection: TGroupBox
    Left = 0
    Top = 0
    Width = 370
    Height = 263
    Align = alClient
    Caption = ' Mercator (MP) Projection '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
    object Label18: TLabel
      Left = 94
      Top = 32
      Width = 83
      Height = 16
      Alignment = taRightJustify
      Caption = 'Latitude origin'
    end
    object Label19: TLabel
      Left = 82
      Top = 64
      Width = 95
      Height = 16
      Alignment = taRightJustify
      Caption = 'Longitude origin'
    end
    object sbSetMPProjectionDATA: TSpeedButton
      Left = 184
      Top = 224
      Width = 161
      Height = 25
      Caption = 'Save data'
      OnClick = sbSetMPProjectionDATAClick
    end
    object MP_edLatOfOrigin: TEdit
      Left = 184
      Top = 29
      Width = 161
      Height = 24
      TabOrder = 0
    end
    object MP_edLongOfOrigin: TEdit
      Left = 184
      Top = 61
      Width = 161
      Height = 24
      TabOrder = 1
    end
  end
end
