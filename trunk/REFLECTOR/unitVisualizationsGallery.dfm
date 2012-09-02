object fmVisualizationsGallery: TfmVisualizationsGallery
  Left = 243
  Top = 170
  BorderStyle = bsNone
  ClientHeight = 60
  ClientWidth = 324
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  OnMouseUp = FormMouseUp
  OnPaint = FormPaint
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object udScroller: TUpDown
    Left = 8
    Top = 8
    Width = 41
    Height = 21
    AlignButton = udLeft
    Orientation = udHorizontal
    TabOrder = 0
    OnChangingEx = udScrollerChangingEx
  end
end
