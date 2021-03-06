unit unLancAbast;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TFormLancAbast = class(TForm)
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    dsADOQueryMVT_CAB: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dsADOQueryMVT_DET: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    dsFunc: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    dsCadFormaPgto: TDataSource;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnUltimo: TBitBtn;
    btnLocCod: TBitBtn;
    SpeedButton3: TSpeedButton;
    dsItensAbastecimento: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    SpeedButton2: TSpeedButton;
    dsBomba: TDataSource;
    SpeedButton4: TSpeedButton;
    GroupBox5: TGroupBox;
    Image1: TImage;
    StaticText1: TStaticText;
    GroupBox6: TGroupBox;
    Label9: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    StaticText2: TStaticText;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    SpeedButton5: TSpeedButton;
    DBEdit9: TDBEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLancAbast: TFormLancAbast;
  ID: Integer;

implementation
  uses unDM;
{$R *.dfm}

procedure TFormLancAbast.DBEdit6Exit(Sender: TObject);
begin
 if DM.ADOQueryMVT_DET.State in [dsEdit, dsInsert] then
  begin
   DM.ADOQueryMVT_DETVALOR_MVT.Value := (DM.ADOQueryMVT_DETVALOR_LITRO.Value *
   strtofloat(DBEdit6.Text));
   DM.ADOQueryMVT_DETVALOR_IMPOSTO.Value :=  (DM.ADOQueryMVT_DETVALOR_MVT.Value *
    0.13)
  end;
end;

procedure TFormLancAbast.DBLookupComboBox3Click(Sender: TObject);
begin
GroupBox5.Caption := 'Bomba ' + DBLookupComboBox3.Text;
StaticText2.Caption := dm.ADOQueryCadTipoCombTIPO.Value;
dm.ADOQueryMVT_DETVALOR_LITRO.Value := dm.ADOQueryCadBicoVALOR_LITRO.Value;
end;

procedure TFormLancAbast.DBLookupComboBox3Exit(Sender: TObject);
begin
 if DM.ADOQueryMVT_DET.State in [dsEdit, dsInsert] then
  begin
   DM.ADOQueryMVT_DETVALOR_LITRO.Value := DM.ADOQueryCadBicoVALOR_LITRO.Value;
   DM.ADOQueryMVT_DETID_BOMBA.Value := DM.ADOQueryCadBicoID_BOMBA.Value;
  end;
end;

procedure TFormLancAbast.FormShow(Sender: TObject);
begin
 DM.ADOQueryMVT_CAB.close;
 DM.ADOQueryMVT_DET.close;
 if DM.ADOQueryMVT_CAB.active=true then
  begin
  SpeedButton3.Enabled := true;
  end;
end;

procedure TFormLancAbast.SpeedButton1Click(Sender: TObject);
begin
Try
 if (DM.ADOQueryCadBico.RecordCount = 0) or(DM.ADOQuerycadBomba.RecordCount = 0) or
     (DM.ADOQueryCadFunc.RecordCount = 0)  then
  begin
   showmessage('� necess�rio realizar alguns cadastros antes de fazer lan�amentos!');
  end
  else
   begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    btnProximo.Enabled := False;
    btnUltimo.Enabled := False;
    btnLocCod.Enabled := False;
    DM.ADOQueryMVT_CAB.Close;
    DM.ADOQueryMVT_CAB.Open;
    DM.ADOQueryMVT_CAB.Append;
    DBLookupComboBox1.SetFocus;
    SpeedButton3.Enabled := true;
   end;
Except
 end;
end;

procedure TFormLancAbast.SpeedButton2Click(Sender: TObject);
begin
 if MessageBox( Handle,
              'Vai Lan�ar mais itens?',
              'Cuidado!!!',
              MB_YESNO +
              MB_ICONQUESTION+
              MB_DEFBUTTON2) = IDYES then
 Begin
  DM.ADOQueryMVT_DET.Post;
  DM.ADOQueryMVT_CAB.Edit;
  DM.ADOQueryMVT_CABVALOR_MVT.Value := (DM.ADOQueryMVT_CABVALOR_MVT.Value +
  (DM.ADOQueryCadBicoVALOR_LITRO.Value * strtofloat(DBEdit6.Field.Text)));
  DM.ADOQueryMVT_CABVALOR_IMPOSTO.Value := (DM.ADOQueryMVT_CABVALOR_MVT.Value * 0.13);
  DM.ADOQueryMVT_CAB.Post;
  DM.ADOQueryMVT_DET.Refresh;
  DM.ADOQueryMVT_DET.Append;
  DBLookupComboBox3.SetFocus;
 end
 else
  begin
   DM.ADOQueryMVT_DET.Post;
   DM.ADOQueryMVT_CAB.Edit;
   DM.ADOQueryMVT_CABVALOR_MVT.Value := (DM.ADOQueryMVT_CABVALOR_MVT.Value +
   (DM.ADOQueryCadBicoVALOR_LITRO.Value * strtofloat(DBEdit6.Field.Text)));
   DM.ADOQueryMVT_CAB.Post;
   DM.ADOQueryItensAbastec.Refresh;
   if MessageBox( Handle,
              'Deseja Imprimir Cupom Fiscal?',
              'Cuidado!!!',
              MB_YESNO +
              MB_ICONQUESTION+
              MB_DEFBUTTON2) = IDYES then
   begin
    ShowMessage('Impress�o ok!');
   end;
  end;
  DM.ADOQueryItensAbastec.Close;
  DM.ADOQueryItensAbastec.SQL.Clear;
  DM.ADOQueryItensAbastec.SQL.Add('select DET.IDD_MVT AS ITEM,');
  DM.ADOQueryItensAbastec.SQL.Add('DET.BICO BOMBA,DET.VALOR_LITRO,');
  DM.ADOQueryItensAbastec.SQL.Add('DET.QTDE_MVT QTDE_ABASTECIDA,');
  DM.ADOQueryItensAbastec.SQL.Add('DET.VALOR_MVT VL_ABASTECIMENTO,');
  DM.ADOQueryItensAbastec.SQL.Add('DET.VALOR_IMPOSTO VL_IMPOSTO,');
  DM.ADOQueryItensAbastec.SQL.Add(' from GOLAB_MVT_CAB CAB ');
  DM.ADOQueryItensAbastec.SQL.Add('inner join GOLAB_MVT_DET DET ');
  DM.ADOQueryItensAbastec.SQL.Add('on CAB.IDC_MVT = DET.IDC_MVT ');
  DM.ADOQueryItensAbastec.SQL.Add('and CAB.MVTC_DT_MOV = DET.MVTD_DT_MOV ');
  DM.ADOQueryItensAbastec.SQL.Add(' where DET.IDC_MVT = "'+DBEdit9.Text+'"');;

  (*"'+DM.ADOQueryMVT_CABIDC_MVT.Value+'"');  *)
  DM.ADOQueryItensAbastec.Open ;
 end;

 procedure TFormLancAbast.SpeedButton3Click(Sender: TObject);
begin
 DM.ADOQueryMVT_DET.open;
 ID:= DM.ADOQueryMVT_CABIDC_MVT.Value;
 btnPrimeiro.Enabled := True;
 btnAnterior.Enabled := True;
 btnProximo.Enabled := True;
 btnUltimo.Enabled := True;
 btnLocCod.Enabled := True;
 (*btnExclui.Enabled := True;
 btnNovoFunc.Enabled := True;
 btnAltera.Enabled := True;
 (*panel1.Visible := False;
 dblcNomeAlu.Enabled := True; *)
 if DM.ADOQueryMVT_CAB.State in [dsEdit, dsInsert] then
  begin
   DM.ADOQueryMVT_CAB.Post;
  end;
    DM.ADOQueryMVT_DET.Append;
    DM.ADOQueryMVT_DETIDC_MVT.Value := DM.ADOQueryMVT_CABIDC_MVT.Value;
    DM.ADOQueryMVT_DETMVTD_DT_MOV.Value := DM.ADOQueryMVT_CABMVTC_DT_MOV.Value;
    DM.ADOQueryMVT_DETID_FORMAPGTO.Value := DM.ADOQueryMVT_CABID_FORMAPGT.Value;
    DM.ADOQueryMVT_DETMAT_FRENTISTA.Value := DM.ADOQueryMVT_CABMAT_FRENTISTA.Value;
    StaticText1.Font.Color := clLime;
    StaticText1.Caption := 'Lan�ando';
end;

procedure TFormLancAbast.SpeedButton5Click(Sender: TObject);
begin
 DM.ADOQueryMVT_CAB.Cancel;
  DM.ADOQueryMVT_DET.Cancel;
 Close;
end;

end.
