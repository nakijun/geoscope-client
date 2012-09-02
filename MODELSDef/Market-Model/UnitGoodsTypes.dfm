object GoodsTypes: TGoodsTypes
  Left = 16
  Top = 91
  BorderStyle = bsToolWindow
  Caption = 'GoodsTypes'
  ClientHeight = 345
  ClientWidth = 769
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
  object LabelCathegory: TLabel
    Left = 8
    Top = 8
    Width = 753
    Height = 24
    Alignment = taCenter
    AutoSize = False
    Color = 10485760
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 72
    Width = 755
    Height = 233
    DataSource = DataSource
    Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridDblClick
    Columns = <
      item
        Color = clWhite
        Expanded = False
        FieldName = 'typename'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10485760
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        PickList.Strings = (
          'qwerqwerqw'
          'qwerqwerqwer'
          'qwerqwerqwer'
          'hjytryjutrjyu73'
          '13456456ye5tyhetrh')
        Title.Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
        Title.Color = clWhite
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = 10485760
        Title.Font.Height = -16
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 734
        Visible = True
      end>
  end
  object BitBtnAddNew: TBitBtn
    Left = 8
    Top = 312
    Width = 201
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1077' ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtnAddNewClick
  end
  object BitBtnTypeName: TBitBtn
    Left = 8
    Top = 48
    Width = 737
    Height = 25
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtnTypeNameClick
  end
  object DataSource: TDataSource
    Left = 8
  end
end
