unit unBI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Vcl.ExtCtrls,
  VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, Data.DB,
  Data.Win.ADODB, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, VCLTee.Series;

type
  TFormBI = class(TForm)
    DBChart1: TDBChart;
    Panel1: TPanel;
    dsADOQueryBI: TDataSource;
    ADOQueryBI: TADOQuery;
    GroupBox1: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    SpeedButton1: TSpeedButton;
    Series1: TBarSeries;
    ADOQueryBIITEM: TAutoIncField;
    ADOQueryBIBOMBA: TIntegerField;
    ADOQueryBIDATAMOVIMENTO: TDateTimeField;
    ADOQueryBIPRECOPORLITRO: TBCDField;
    ADOQueryBIQTDE_ABASTECIDA: TBCDField;
    ADOQueryBIVL_ABASTECIMENTO: TBCDField;
    ADOQueryBIVL_IMPOSTO: TBCDField;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBI: TFormBI;

implementation
  uses UnDM;
{$R *.dfm}

procedure TFormBI.SpeedButton1Click(Sender: TObject);
begin
 ADOQueryBI.Close;
 ADOQueryBI.SQL.Clear;
 ADOQueryBI.SQL.Add('select DET.IDD_MVT AS ITEM,');
 ADOQueryBI.SQL.Add('DET.BICO BOMBA,');
 ADOQueryBI.SQL.Add('CAB.MVTC_DT_MOV DATAMOVIMENTO,');
 ADOQueryBI.SQL.Add('DET.VALOR_LITRO PRECOPORLITRO,');
 ADOQueryBI.SQL.Add(' DET.QTDE_MVT QTDE_ABASTECIDA,');
 ADOQueryBI.SQL.Add('DET.VALOR_MVT VL_ABASTECIMENTO,');
 ADOQueryBI.SQL.Add('DET.VALOR_IMPOSTO VL_IMPOSTO ');
 ADOQueryBI.SQL.Add('from GOLAB_MVT_CAB CAB ');
 ADOQueryBI.SQL.Add('inner join GOLAB_MVT_DET DET ');
 ADOQueryBI.SQL.Add('on CAB.IDC_MVT = DET.IDC_MVT ');
 ADOQueryBI.SQL.Add('and CAB.MVTC_DT_MOV = DET.MVTD_DT_MOV ');
 ADOQueryBI.SQL.Add(' CAB.MVTC_DT_MOV >= "'+datetostr(datetimepicker2.Date)+'"');
 ADOQueryBI.SQL.Add(' AND CAB.MVTC_DT_MOV <= "'+datetostr(datetimepicker1.Date)+'"');
 ADOQueryBI.Open ;
end;

end.
