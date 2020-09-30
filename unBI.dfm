object FormBI: TFormBI
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Evolu'#231#227'o de Abastecimento'
  ClientHeight = 463
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBChart1: TDBChart
    Left = 0
    Top = 65
    Width = 769
    Height = 394
    Title.Text.Strings = (
      'TDBChart')
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      24
      15
      24)
    ColorPaletteIndex = 13
    object Series1: TBarSeries
      DataSource = ADOQueryBI
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 769
    Height = 65
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 0
      Top = 5
      Width = 570
      Height = 60
      Caption = ' Selecione Pe'#237'odo que deseja analisar '
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 448
        Top = 18
        Width = 97
        Height = 26
        Cursor = crHandPoint
        Caption = 'Gerar Gr'#225'fico'
        OnClick = SpeedButton1Click
      end
    end
  end
  object DateTimePicker1: TDateTimePicker
    Left = 257
    Top = 24
    Width = 137
    Height = 21
    Date = 44104.601623067130000000
    Time = 44104.601623067130000000
    TabOrder = 2
  end
  object DateTimePicker2: TDateTimePicker
    Left = 71
    Top = 24
    Width = 137
    Height = 21
    Date = 44104.601753634270000000
    Time = 44104.601753634270000000
    TabOrder = 3
  end
  object StaticText1: TStaticText
    Left = 48
    Top = 28
    Width = 17
    Height = 17
    Caption = 'De'
    TabOrder = 4
  end
  object StaticText2: TStaticText
    Left = 230
    Top = 28
    Width = 21
    Height = 17
    Caption = 'At'#233
    TabOrder = 5
  end
  object dsADOQueryBI: TDataSource
    DataSet = ADOQueryBI
    Left = 688
    Top = 16
  end
  object ADOQueryBI: TADOQuery
    Active = True
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '       select DET.IDD_MVT AS ITEM,'
      '       DET.BICO BOMBA,'
      '       CAB.MVTC_DT_MOV DATAMOVIMENTO,'
      '       DET.VALOR_LITRO PRECOPORLITRO,'
      '       DET.QTDE_MVT QTDE_ABASTECIDA,'
      '       DET.VALOR_MVT VL_ABASTECIMENTO,'
      '       DET.VALOR_IMPOSTO VL_IMPOSTO'
      #9'from GOLAB_MVT_CAB CAB'
      'inner join GOLAB_MVT_DET DET on CAB.IDC_MVT = DET.IDC_MVT '
      
        '                            and CAB.MVTC_DT_MOV = DET.MVTD_DT_MO' +
        'V'
      
        'where CAB.MVTC_DT_MOV >= '#39'2020-09-30'#39' AND CAB.MVTC_DT_MOV <= '#39'20' +
        '20-09-30'#39)
    Left = 608
    Top = 16
    object ADOQueryBIITEM: TAutoIncField
      FieldName = 'ITEM'
      ReadOnly = True
    end
    object ADOQueryBIBOMBA: TIntegerField
      FieldName = 'BOMBA'
    end
    object ADOQueryBIDATAMOVIMENTO: TDateTimeField
      FieldName = 'DATAMOVIMENTO'
    end
    object ADOQueryBIPRECOPORLITRO: TBCDField
      FieldName = 'PRECOPORLITRO'
      Precision = 18
      Size = 3
    end
    object ADOQueryBIQTDE_ABASTECIDA: TBCDField
      FieldName = 'QTDE_ABASTECIDA'
      Precision = 18
      Size = 3
    end
    object ADOQueryBIVL_ABASTECIMENTO: TBCDField
      FieldName = 'VL_ABASTECIMENTO'
      Precision = 18
      Size = 3
    end
    object ADOQueryBIVL_IMPOSTO: TBCDField
      FieldName = 'VL_IMPOSTO'
      Precision = 18
      Size = 2
    end
  end
end
