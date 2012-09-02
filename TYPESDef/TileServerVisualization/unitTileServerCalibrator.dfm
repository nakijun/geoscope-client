object fmTileServerCalibrator: TfmTileServerCalibrator
  Left = 138
  Top = 47
  BorderStyle = bsDialog
  Caption = 'Image calibration'
  ClientHeight = 576
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 70
    Height = 16
    Caption = 'Parameters'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object sbCalibrate: TSpeedButton
    Left = 384
    Top = 493
    Width = 361
    Height = 33
    Caption = 'Calibrate image (Google maps)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = sbCalibrateClick
  end
  object Bevel1: TBevel
    Left = 376
    Top = 496
    Width = 9
    Height = 73
    Shape = bsLeftLine
    Style = bsRaised
  end
  object memoParameters: TMemo
    Left = 8
    Top = 24
    Width = 737
    Height = 465
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '[CALIBRATION]'
      '; coordinate system ID to calibrate '
      'CoordinateSystemID = '
      ''
      '; detailed picture level ID related to GoogleProcessZoom'
      'ImageLevelID = '
      ''
      '; Geodesy-Point object prototype for new points creation'
      'GeodesyPointPrototype = '
      ''
      '; pixel offset X of first Geodesy-Point in image'
      'GeodesyPoint0PixPosX = '
      '; pixel offset Y of first Geodesy-Point in image'
      'GeodesyPoint0PixPosY = '
      ''
      '; pixel interval beetwen two Geodesy-Points'
      'GeodesyPointPixStep = '
      '; Geodesy-Points dimension'
      'GeodesyPointCount = '
      ''
      '; Google maps related coordinate X of first tile on level'
      'GoogleTile0X = '
      '; Google maps related coordinate Y of first tile on level'
      'GoogleTile0Y = '
      '; Google maps zoom level'
      'GoogleZoom = '
      '; Google maps zoom level where calibration will be processed'
      'GoogleProcessZoom = ')
    ParentFont = False
    TabOrder = 0
    OnChange = memoParametersChange
  end
  object cbDeleteOldGeodesyPoints: TCheckBox
    Left = 8
    Top = 504
    Width = 361
    Height = 17
    Caption = 'Delete old geodesy-points of the CrdSys specified'
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
  object cbCreateNewGeodesyPoints: TCheckBox
    Left = 8
    Top = 536
    Width = 361
    Height = 17
    Caption = 'Create new calibration geodesy-points'
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
