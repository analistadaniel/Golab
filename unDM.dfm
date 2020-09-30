object DM: TDM
  OldCreateOrder = False
  Height = 423
  Width = 534
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 'FILE NAME=C:\Users\00247ATI\Golab\conexao.udl'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 23
    Top = 32
  end
  object ADOQueryCadFunc: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from GOLAB_CADFUNCIONARIO')
    Left = 120
    Top = 32
    object ADOQueryCadFuncMATRICULA: TStringField
      FieldName = 'MATRICULA'
      EditMask = '000\.000\.000\-00;1;_'
    end
    object ADOQueryCadFuncNOMEFUNC: TStringField
      FieldName = 'NOMEFUNC'
      Size = 50
    end
    object ADOQueryCadFuncFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 50
    end
    object ADOQueryCadFuncDTADMISSAO: TDateTimeField
      FieldName = 'DTADMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object ADOQueryCadFuncDTDEMISSAO: TDateTimeField
      FieldName = 'DTDEMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object ADOQueryCadUser: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from GOLAB_CADUSER')
    Left = 224
    Top = 32
    object ADOQueryCadUserID_CADUSER: TAutoIncField
      FieldName = 'ID_CADUSER'
      ReadOnly = True
    end
    object ADOQueryCadUserUSERMATRICULA: TStringField
      FieldName = 'USERMATRICULA'
    end
    object ADOQueryCadUserSENHA: TIntegerField
      FieldName = 'SENHA'
    end
    object ADOQueryCadUserFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 50
    end
    object ADOQueryCadUserATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object ADOQueryCadTipoComb: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from GOLAB_TIPOCOMBUSTIVEL')
    Left = 344
    Top = 32
    object ADOQueryCadTipoCombID_COMBUSTIVEL: TAutoIncField
      FieldName = 'ID_COMBUSTIVEL'
      ReadOnly = True
    end
    object ADOQueryCadTipoCombTIPO: TStringField
      FieldName = 'TIPO'
      Size = 30
    end
    object ADOQueryCadTipoCombDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object ADOQueryCadPosto: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from GOLAB_POSTO')
    Left = 112
    Top = 112
    object ADOQueryCadPostoCNPJ_POSTO: TStringField
      FieldName = 'CNPJ_POSTO'
      EditMask = '00\.000\.000\/0000\-00;1;_'
    end
    object ADOQueryCadPostoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 80
    end
    object ADOQueryCadPostoNOMEFANTASIA: TStringField
      FieldName = 'NOMEFANTASIA'
      Size = 80
    end
    object ADOQueryCadPostoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object ADOQueryCadPostoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object ADOQueryCadPostoRESPTECNICO: TStringField
      FieldName = 'RESPTECNICO'
      Size = 80
    end
    object ADOQueryCadPostoREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Size = 8
    end
    object ADOQueryCadPostoTEL: TStringField
      FieldName = 'TEL'
      EditMask = '!\(99\)00000-0000;1;_'
      Size = 12
    end
    object ADOQueryCadPostoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
    object ADOQueryCadPostoGERENTE: TStringField
      FieldName = 'GERENTE'
    end
  end
  object ADOQuerycadBomba: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from GOLAB_CADBOMBA')
    Left = 416
    Top = 120
    object ADOQuerycadBombaID_BOMBA: TAutoIncField
      FieldName = 'ID_BOMBA'
      ReadOnly = True
    end
    object ADOQuerycadBombaDESC_BOMBA: TStringField
      FieldName = 'DESC_BOMBA'
      Size = 30
    end
    object ADOQuerycadBombaLOCAL_BOMBA: TStringField
      FieldName = 'LOCAL_BOMBA'
      Size = 80
    end
    object ADOQuerycadBombaNUMSERIE_BOMBA: TStringField
      FieldName = 'NUMSERIE_BOMBA'
      Size = 10
    end
    object ADOQuerycadBombaPOSTO: TStringField
      FieldName = 'POSTO'
    end
  end
  object ADOQueryCadBico: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from GOLAB_BICO')
    Left = 112
    Top = 184
    object ADOQueryCadBicoBICO: TIntegerField
      FieldName = 'BICO'
    end
    object ADOQueryCadBicoID_BOMBA: TIntegerField
      FieldName = 'ID_BOMBA'
    end
    object ADOQueryCadBicoID_COMBUSTIVEL: TIntegerField
      FieldName = 'ID_COMBUSTIVEL'
    end
    object ADOQueryCadBicoVALOR_LITRO: TBCDField
      FieldName = 'VALOR_LITRO'
      DisplayFormat = '###.##0'
      Precision = 5
      Size = 3
    end
  end
  object ADOQueryCadAliquota: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from GOLAB_ALIQUOTAIMP')
    Left = 256
    Top = 192
    object ADOQueryCadAliquotaID_IMP: TAutoIncField
      FieldName = 'ID_IMP'
      ReadOnly = True
    end
    object ADOQueryCadAliquotaSIGLA_IMP: TStringField
      FieldName = 'SIGLA_IMP'
      Size = 6
    end
    object ADOQueryCadAliquotaDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
    end
    object ADOQueryCadAliquotaDESC_IMP: TStringField
      FieldName = 'DESC_IMP'
      Size = 30
    end
    object ADOQueryCadAliquotaPERC_IMP: TBCDField
      FieldName = 'PERC_IMP'
      Precision = 5
      Size = 2
    end
    object ADOQueryCadAliquotaATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object ADOQueryMVT_CAB: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterInsert = ADOQueryMVT_CABAfterInsert
    Parameters = <>
    SQL.Strings = (
      'select * from GOLAB_MVT_CAB')
    Left = 112
    Top = 248
    object ADOQueryMVT_CABIDC_MVT: TAutoIncField
      FieldName = 'IDC_MVT'
      ReadOnly = True
    end
    object ADOQueryMVT_CABMVTC_DT_MOV: TDateTimeField
      FieldName = 'MVTC_DT_MOV'
    end
    object ADOQueryMVT_CABVALOR_MVT: TBCDField
      FieldName = 'VALOR_MVT'
      DisplayFormat = '###.##0'
      Precision = 5
      Size = 3
    end
    object ADOQueryMVT_CABVALOR_IMPOSTO: TBCDField
      FieldName = 'VALOR_IMPOSTO'
      DisplayFormat = '###.##0'
      Precision = 5
      Size = 2
    end
    object ADOQueryMVT_CABVALOR_MVT_TOTAL: TBCDField
      FieldName = 'VALOR_MVT_TOTAL'
      DisplayFormat = '###.##0'
      Precision = 5
      Size = 2
    end
    object ADOQueryMVT_CABMAT_FRENTISTA: TStringField
      FieldName = 'MAT_FRENTISTA'
    end
    object ADOQueryMVT_CABID_FORMAPGT: TIntegerField
      FieldName = 'ID_FORMAPGT'
    end
  end
  object ADOQueryMVT_DET: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from GOLAB_MVT_DET')
    Left = 256
    Top = 256
    object ADOQueryMVT_DETIDD_MVT: TAutoIncField
      FieldName = 'IDD_MVT'
      ReadOnly = True
    end
    object ADOQueryMVT_DETIDC_MVT: TIntegerField
      FieldName = 'IDC_MVT'
    end
    object ADOQueryMVT_DETMVTD_DT_MOV: TDateTimeField
      FieldName = 'MVTD_DT_MOV'
    end
    object ADOQueryMVT_DETBICO: TIntegerField
      FieldName = 'BICO'
    end
    object ADOQueryMVT_DETID_BOMBA: TIntegerField
      FieldName = 'ID_BOMBA'
    end
    object ADOQueryMVT_DETVALOR_LITRO: TBCDField
      FieldName = 'VALOR_LITRO'
      DisplayFormat = '###.##0'
      Precision = 5
      Size = 3
    end
    object ADOQueryMVT_DETQTDE_MVT: TBCDField
      FieldName = 'QTDE_MVT'
      Precision = 5
      Size = 3
    end
    object ADOQueryMVT_DETVALOR_MVT: TBCDField
      FieldName = 'VALOR_MVT'
      DisplayFormat = '###.##0'
      Precision = 5
      Size = 3
    end
    object ADOQueryMVT_DETVALOR_IMPOSTO: TBCDField
      FieldName = 'VALOR_IMPOSTO'
      DisplayFormat = '###.##0'
      Precision = 5
      Size = 2
    end
    object ADOQueryMVT_DETVALOR_MVT_TOTAL: TBCDField
      FieldName = 'VALOR_MVT_TOTAL'
      DisplayFormat = '###.##0'
      Precision = 5
      Size = 2
    end
    object ADOQueryMVT_DETMAT_FRENTISTA: TStringField
      FieldName = 'MAT_FRENTISTA'
    end
    object ADOQueryMVT_DETID_FORMAPGTO: TIntegerField
      FieldName = 'ID_FORMAPGTO'
    end
  end
  object ADOQuerySelFrentista: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from GOLAB_CADFUNCIONARIO where FUNCAO LIKE '#39'%FRENTISTA' +
        '%'#39)
    Left = 400
    Top = 256
  end
  object ADOQueryItensAbastec: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 104
    Top = 328
    object ADOQueryItensAbastecITEM: TAutoIncField
      FieldName = 'ITEM'
      ReadOnly = True
    end
    object ADOQueryItensAbastecBOMBA: TIntegerField
      FieldName = 'BOMBA'
    end
    object ADOQueryItensAbastecVALOR_LITRO: TBCDField
      FieldName = 'VALOR_LITRO'
      DisplayFormat = '###.##0'
      Precision = 18
      Size = 3
    end
    object ADOQueryItensAbastecQTDE_ABASTECIDA: TBCDField
      FieldName = 'QTDE_ABASTECIDA'
      Precision = 18
      Size = 3
    end
    object ADOQueryItensAbastecVL_ABASTECIMENTO: TBCDField
      FieldName = 'VL_ABASTECIMENTO'
      DisplayFormat = '###.##0'
      Precision = 18
      Size = 3
    end
    object ADOQueryItensAbastecVL_IMPOSTO: TBCDField
      FieldName = 'VL_IMPOSTO'
      DisplayFormat = '###.##0'
      Precision = 18
      Size = 2
    end
  end
  object ADOQueryCadFPgto: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from GOLAB_FORMAPGTO')
    Left = 248
    Top = 120
  end
end
