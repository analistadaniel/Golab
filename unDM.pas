unit unDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQueryCadFunc: TADOQuery;
    ADOQueryCadFuncMATRICULA: TStringField;
    ADOQueryCadFuncNOMEFUNC: TStringField;
    ADOQueryCadFuncFUNCAO: TStringField;
    ADOQueryCadFuncDTADMISSAO: TDateTimeField;
    ADOQueryCadFuncDTDEMISSAO: TDateTimeField;
    ADOQueryCadUser: TADOQuery;
    ADOQueryCadUserID_CADUSER: TAutoIncField;
    ADOQueryCadUserUSERMATRICULA: TStringField;
    ADOQueryCadUserSENHA: TIntegerField;
    ADOQueryCadUserFUNCAO: TStringField;
    ADOQueryCadUserATIVO: TStringField;
    ADOQueryCadTipoComb: TADOQuery;
    ADOQueryCadTipoCombID_COMBUSTIVEL: TAutoIncField;
    ADOQueryCadTipoCombTIPO: TStringField;
    ADOQueryCadTipoCombDESCRICAO: TStringField;
    ADOQueryCadPosto: TADOQuery;
    ADOQueryCadPostoCNPJ_POSTO: TStringField;
    ADOQueryCadPostoRAZAOSOCIAL: TStringField;
    ADOQueryCadPostoNOMEFANTASIA: TStringField;
    ADOQueryCadPostoENDERECO: TStringField;
    ADOQueryCadPostoCEP: TStringField;
    ADOQueryCadPostoRESPTECNICO: TStringField;
    ADOQueryCadPostoREGISTRO: TStringField;
    ADOQueryCadPostoTEL: TStringField;
    ADOQueryCadPostoEMAIL: TStringField;
    ADOQueryCadPostoGERENTE: TStringField;
    ADOQuerycadBomba: TADOQuery;
    ADOQuerycadBombaID_BOMBA: TAutoIncField;
    ADOQuerycadBombaDESC_BOMBA: TStringField;
    ADOQuerycadBombaLOCAL_BOMBA: TStringField;
    ADOQuerycadBombaNUMSERIE_BOMBA: TStringField;
    ADOQuerycadBombaPOSTO: TStringField;
    ADOQueryCadBico: TADOQuery;
    ADOQueryCadBicoBICO: TIntegerField;
    ADOQueryCadBicoID_BOMBA: TIntegerField;
    ADOQueryCadBicoID_COMBUSTIVEL: TIntegerField;
    ADOQueryCadBicoVALOR_LITRO: TBCDField;
    ADOQueryCadAliquota: TADOQuery;
    ADOQueryCadAliquotaID_IMP: TAutoIncField;
    ADOQueryCadAliquotaSIGLA_IMP: TStringField;
    ADOQueryCadAliquotaDT_CADASTRO: TDateTimeField;
    ADOQueryCadAliquotaDESC_IMP: TStringField;
    ADOQueryCadAliquotaPERC_IMP: TBCDField;
    ADOQueryCadAliquotaATIVO: TStringField;
    ADOQueryMVT_CAB: TADOQuery;
    ADOQueryMVT_DET: TADOQuery;
    ADOQueryMVT_CABIDC_MVT: TAutoIncField;
    ADOQueryMVT_CABMVTC_DT_MOV: TDateTimeField;
    ADOQueryMVT_CABVALOR_MVT: TBCDField;
    ADOQueryMVT_CABVALOR_IMPOSTO: TBCDField;
    ADOQueryMVT_CABVALOR_MVT_TOTAL: TBCDField;
    ADOQueryMVT_CABMAT_FRENTISTA: TStringField;
    ADOQueryMVT_CABID_FORMAPGT: TIntegerField;
    ADOQueryMVT_DETIDD_MVT: TAutoIncField;
    ADOQueryMVT_DETIDC_MVT: TIntegerField;
    ADOQueryMVT_DETMVTD_DT_MOV: TDateTimeField;
    ADOQueryMVT_DETBICO: TIntegerField;
    ADOQueryMVT_DETID_BOMBA: TIntegerField;
    ADOQueryMVT_DETVALOR_LITRO: TBCDField;
    ADOQueryMVT_DETQTDE_MVT: TBCDField;
    ADOQueryMVT_DETVALOR_MVT: TBCDField;
    ADOQueryMVT_DETVALOR_IMPOSTO: TBCDField;
    ADOQueryMVT_DETVALOR_MVT_TOTAL: TBCDField;
    ADOQueryMVT_DETMAT_FRENTISTA: TStringField;
    ADOQueryMVT_DETID_FORMAPGTO: TIntegerField;
    ADOQuerySelFrentista: TADOQuery;
    ADOQueryItensAbastec: TADOQuery;
    ADOQueryItensAbastecITEM: TAutoIncField;
    ADOQueryItensAbastecBOMBA: TIntegerField;
    ADOQueryItensAbastecVALOR_LITRO: TBCDField;
    ADOQueryItensAbastecQTDE_ABASTECIDA: TBCDField;
    ADOQueryItensAbastecVL_ABASTECIMENTO: TBCDField;
    ADOQueryItensAbastecVL_IMPOSTO: TBCDField;
    ADOQueryCadFPgto: TADOQuery;
    procedure ADOQueryMVT_CABAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.ADOQueryMVT_CABAfterInsert(DataSet: TDataSet);
begin
ADOQueryMVT_CABMVTC_DT_MOV.Value := Now;
end;

end.
