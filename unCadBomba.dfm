object FormCadBomba: TFormCadBomba
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Bombas'
  ClientHeight = 482
  ClientWidth = 672
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
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 654
    Height = 58
    BorderStyle = bsSingle
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object btnGrava: TBitBtn
      Left = 119
      Top = 4
      Width = 99
      Height = 43
      Hint = 'Grava os novos dados'
      Caption = '&Gravar'
      Glyph.Data = {
        42030000424D42030000000000003600000028000000110000000F0000000100
        1800000000000C030000C30E0000C30E00000000000000000000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F0000FFFFFFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBF7F00007F00007F0000FFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F00007F00007F0000
        7F0000FFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBF00000000000000
        00000000000000007F00007F00007F0000FFFFFF7F00007F0000FFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFFFFFFFFFFFFFF7F00007F00007F
        0000FFFFFF000000BFBFBF7F00007F0000FFFFFFBFBFBFBFBFBFBFBFBF00BFBF
        BF000000FFFFFF7F7F7F7F7F7F7F7F7F7F0000FFFFFFFFFFFF000000BFBFBFBF
        BFBF7F0000FFFFFFBFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBF7F0000FFFFFFBF
        BFBFBFBFBF00BFBFBF000000FFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFF
        FF000000BFBFBFBFBFBFBFBFBFBFBFBF7F0000FFFFFFBFBFBF00BFBFBF000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBF7F0000FFFFFF00BFBFBF000000FFFFFF7F7F7F7F7F7FBFBFBF
        BFBFBFBFBFBFFFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F00
        0000BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFF7F
        7F7F7F7F7FBFBFBF000000BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
        0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBF
        BF000000000000000000000000000000000000BFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBF00}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnGravaClick
    end
    object btnCancela: TBitBtn
      Left = 327
      Top = 4
      Width = 99
      Height = 43
      Hint = 'Cancela os novos dados'
      Caption = '&Cancelar'
      Glyph.Data = {
        36030000424D360300000000000036000000280000000F000000100000000100
        18000000000000030000C30E0000C30E00000000000000000000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBF0000FF0000FF0000FF0000FF0000FFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBF
        0000FF0000FF0000FFBFBFBF7F7F7F0000007F7F7FBFBFBF0000FF0000FF0000
        FFBFBFBFBFBFBF000000BFBFBF0000FF0000FF0000FFBFBFBFBFBFBF00000000
        0000000000BFBFBFBFBFBF0000FF0000FF0000FFBFBFBF000000BFBFBF0000FF
        0000FFBFBFBFBFBFBFBFBFBF7F7F7F0000007F7F7FBFBFBFBFBFBFBFBFBF0000
        FF0000FFBFBFBF0000000000FF0000FFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000FF0000FF0000000000FF0000FF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BF0000FF0000FF0000000000FF0000FFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F00
        00007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000000000FF0000FF
        BFBFBFBFBFBFBFBFBFBFBFBF00007F00000000007FBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBF0000000000FF0000FFBFBFBFBFBFBFBFBFBFBFBFBF00000000
        0000000000BFBFBF0000FF0000FF0000FF0000FF0000FF000000BFBFBF0000FF
        0000FFBFBFBFBFBFBFBFBFBF000000000000000000BFBFBFBFBFBF0000FF0000
        FF0000FF0000FF000000BFBFBF0000FF0000FF0000FFBFBFBFBFBFBF00000000
        0000000000BFBFBFBFBFBFBFBFBF0000FF0000FF0000FF000000BFBFBFBFBFBF
        0000FF0000FF0000FFBFBFBF7F7F7F0000007F7F7FBFBFBF0000FF0000FF0000
        FF0000FF0000FF000000BFBFBFBFBFBFBFBFBF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FFBFBFBFBFBFBF0000FF000000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBF0000FF0000FF0000FF0000FF0000FFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnCancelaClick
    end
    object btnAltera: TBitBtn
      Left = 224
      Top = 4
      Width = 99
      Height = 43
      Hint = 'Altera dados do funcion'#225'rio'
      Caption = '&Alterar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnAlteraClick
    end
    object btnNovoFunc: TBitBtn
      Left = 14
      Top = 4
      Width = 99
      Height = 43
      Hint = 'Inclui novo funcion'#225'rio'
      Caption = 'Novo Cadastro'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnNovoFuncClick
    end
    object btnExclui: TBitBtn
      Left = 433
      Top = 4
      Width = 99
      Height = 43
      Hint = 'Exclui registro atual'
      Caption = 'Excluir'
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000077788777777777777000000077D55877777D87777000000077D5
        558777D558777000000077D555587D55558770000000777D5555855555877000
        00007777D555555558777000000077777D555555877770000000777777555558
        777770000000777777D5555877777000000077777D5555587777700000007777
        D5558555877770000000777D55587D55587770000000777D558777D555877000
        00007777D577777D555770000000777777777777D5D770000000777777777777
        777770000000}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnExcluiClick
    end
    object BitBtn1: TBitBtn
      Left = 538
      Top = 4
      Width = 97
      Height = 43
      Hint = 'Fechar tela de cadastro de funcion'#225'rio'
      Caption = 'Fechar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F3333333F7F333301111111B10333337F333333737F33330111111111
        0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
        0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
        0333337F377777337F333301111111110333337F333333337F33330111111111
        0333337FFFFFFFFF7F3333000000000003333377777777777333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 9
    Top = 72
    Width = 655
    Height = 185
    BorderStyle = bsSingle
    TabOrder = 1
    object Label1: TLabel
      Left = 40
      Top = 5
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 40
      Top = 47
      Width = 32
      Height = 13
      Caption = 'Bomba'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 40
      Top = 88
      Width = 103
      Height = 13
      Caption = 'Local F'#237'sico da Bomba'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 440
      Top = 47
      Width = 39
      Height = 13
      Caption = 'N'#186' S'#233'rie'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 40
      Top = 134
      Width = 27
      Height = 13
      Caption = 'Posto'
    end
    object DBEdit1: TDBEdit
      Left = 40
      Top = 24
      Width = 134
      Height = 21
      DataField = 'ID_BOMBA'
      DataSource = dsADOQueryCadBomba
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 40
      Top = 63
      Width = 394
      Height = 21
      DataField = 'DESC_BOMBA'
      DataSource = dsADOQueryCadBomba
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 40
      Top = 104
      Width = 534
      Height = 21
      DataField = 'LOCAL_BOMBA'
      DataSource = dsADOQueryCadBomba
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 440
      Top = 63
      Width = 134
      Height = 21
      DataField = 'NUMSERIE_BOMBA'
      DataSource = dsADOQueryCadBomba
      TabOrder = 3
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 40
      Top = 150
      Width = 394
      Height = 21
      DataField = 'POSTO'
      DataSource = dsADOQueryCadBomba
      KeyField = 'CNPJ_POSTO'
      ListField = 'CNPJ_POSTO;NOMEFANTASIA'
      ListSource = dsADOQueryCadPosto
      TabOrder = 4
    end
  end
  object DBGrid1: TDBGrid
    Left = 10
    Top = 289
    Width = 654
    Height = 185
    DataSource = dsADOQueryCadBomba
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_BOMBA'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_BOMBA'
        Title.Caption = 'Bomba'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMSERIE_BOMBA'
        Title.Caption = 'N'#186' S'#233'rie'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSTO'
        Title.Caption = 'Posto'
        Width = 220
        Visible = True
      end>
  end
  object btnPrimeiro: TBitBtn
    Left = 541
    Top = 263
    Width = 25
    Height = 25
    Hint = 'Primeiro registro'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      333333777777777F33333330B00000003333337F7777777F3333333000000000
      333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
      333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
      03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
      03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
      3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
      333333333377F7F33333333333330F03333333333337F7F33333333333330B03
      3333333333373733333333333333303333333333333373333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnPrimeiroClick
  end
  object btnAnterior: TBitBtn
    Left = 565
    Top = 263
    Width = 25
    Height = 25
    Hint = 'Registro anterior'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333333333333333333333333333333333FF333333333333
      3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
      E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
      E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
      E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
      000033333373FF77777733333330003333333333333777333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnAnteriorClick
  end
  object btnProximo: TBitBtn
    Left = 589
    Top = 263
    Width = 25
    Height = 25
    Hint = 'Pr'#243'ximo registro'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333FFF333333333333000333333333
      3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
      3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
      0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
      BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
      33337777773FF733333333333300033333333333337773333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnProximoClick
  end
  object btnUltimo: TBitBtn
    Left = 613
    Top = 263
    Width = 25
    Height = 25
    Hint = 'Ultimo registro'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
      33333333373F33333333333330B03333333333337F7F33333333333330F03333
      333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
      333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
      333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
      3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
      33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
      33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
      03333337777777F7F33333330000000003333337777777773333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnUltimoClick
  end
  object btnLocCod: TBitBtn
    Left = 637
    Top = 263
    Width = 25
    Height = 25
    Hint = 'Localiza Aluno por C'#243'digo'
    Enabled = False
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888888888888800000888880000080F000888880F00080F000888880F
      0008000000080000000800F000000F00000800F000800F00000800F000800F00
      00088000000000000088880F00080F0008888800000800000888888000888000
      88888880F08880F0888888800088800088888888888888888888}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dsADOQueryCadBomba: TDataSource
    DataSet = DM.ADOQuerycadBomba
    Left = 344
    Top = 80
  end
  object dsADOQueryCadPosto: TDataSource
    DataSet = DM.ADOQueryCadPosto
    Left = 513
    Top = 80
  end
end
