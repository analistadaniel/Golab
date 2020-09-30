unit unCadBico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Data.Win.ADODB;

type
  TFormCadBico = class(TForm)
    Panel1: TPanel;
    btnGrava: TBitBtn;
    btnCancela: TBitBtn;
    btnAltera: TBitBtn;
    btnNovoFunc: TBitBtn;
    btnExclui: TBitBtn;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnUltimo: TBitBtn;
    btnLocCod: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsCadBico: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    dsADOQueryCadBomba: TDataSource;
    dsADOQueryCadTipoComb: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1BICO: TIntegerField;
    ADOQuery1TIPO: TStringField;
    ADOQuery1DESC_BOMBA: TStringField;
    ADOQuery1VALOR_LITRO: TBCDField;
    ADOQuery1POSTO: TStringField;
    procedure btnNovoFuncClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcluiClick(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadBico: TFormCadBico;

implementation
   uses unDM;
{$R *.dfm}

procedure TFormCadBico.BitBtn1Click(Sender: TObject);
begin
 DM.ADOQueryCadBico.Cancel;
 DM.ADOQueryCadBico.CancelUpdates;
 Close;
end;

procedure TFormCadBico.btnAnteriorClick(Sender: TObject);
begin
DM.ADOQueryCadBico.Prior;
btnProximo.Enabled := True;
btnUltimo.Enabled := True;
if DM.ADOQueryCadBico.Bof = True then
 begin
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
 end;
end;

procedure TFormCadBico.btnExcluiClick(Sender: TObject);
begin
 if DM.ADOQueryCadBico.RecordCount = 0 then
  begin
   showmessage('n�o existe registro a ser exclu�do!');
  end
else
 begin
  if MessageBox( Handle,
              'Confirma a exclus�o?',
              'Cuidado!!!',
              MB_YESNO +
              MB_ICONQUESTION+
              MB_DEFBUTTON2) = IDYES then
 Begin
  DM.ADOQueryCadBico.Delete;
  DM.ADOQueryCadBico.UpdateStatus;
  DM.ADOQuerycadBico.Close;
  DM.ADOQueryCadBico.Open;
 end;
end;
end;


procedure TFormCadBico.btnGravaClick(Sender: TObject);
begin
 Try
 if DBEdit1.Text = '' then
  begin
   ShowMessage('O Campo "Bico" n�o pode ficar vazio!!');
   DBEdit1.SetFocus;
   Exit;
  end;
 btnPrimeiro.Enabled := True;
 btnAnterior.Enabled := True;
 btnProximo.Enabled := True;
 btnUltimo.Enabled := True;
 btnLocCod.Enabled := True;
 btnExclui.Enabled := True;
 btnNovoFunc.Enabled := True;
 btnAltera.Enabled := True;
 (*panel1.Visible := False;
 dblcNomeAlu.Enabled := True; *)
 DM.ADOQueryCadBico.Post;
 DM.ADOQueryCadBico.Close;
 DM.ADOQueryCadBico.Open;
Except
 end; // Begin
end;

procedure TFormCadBico.btnNovoFuncClick(Sender: TObject);
begin
Try
 btnPrimeiro.Enabled := False;
 btnAnterior.Enabled := False;
 btnProximo.Enabled := False;
 btnUltimo.Enabled := False;
 btnLocCod.Enabled := False;
 btnExclui.Enabled := False;
 btnNovoFunc.Enabled := False;
 btnAltera.Enabled := False;
 (*panel1.Visible := True;
 dblcNomeAlu.Enabled := False;
 dblcMod1.Enabled := True;   *)
 DM.ADOQueryCadBico.Append;
 DBEdit1.SetFocus;
Except
 end;
end;

procedure TFormCadBico.btnPrimeiroClick(Sender: TObject);
begin
 DM.ADOQueryCadBico.First;
 btnProximo.Enabled := True;
 btnUltimo.Enabled := True;
 btnPrimeiro.Enabled := False;
 btnAnterior.Enabled := False;
end;

procedure TFormCadBico.btnProximoClick(Sender: TObject);
begin
DM.ADOQueryCadBico.Next;
btnPrimeiro.Enabled := True;
btnAnterior.Enabled := True;
if DM.ADOQueryCadBico.Eof = True then
 begin
   btnProximo.Enabled := False;
   btnUltimo.Enabled := False;
 end;
end;

procedure TFormCadBico.btnUltimoClick(Sender: TObject);
begin
DM.ADOQueryCadBico.Last;
btnPrimeiro.Enabled := True;
btnAnterior.Enabled := True;
btnProximo.Enabled := False;
btnUltimo.Enabled := False;
end;

procedure TFormCadBico.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) then
  begin
    if Odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
      (Sender as TDBGrid).Canvas.Brush.Color:= clWhite
    else
      (Sender as TDBGrid).Canvas.Brush.Color:= $00F1F2F3; // leve cinza

    // Aplicando prto para a cor da fonte
    (Sender as TDBGrid).Canvas.Font.Color:= clBlack;

    (Sender as TDBGrid).Canvas.FillRect(Rect);
    (Sender as TDBGrid).Canvas.TextOut(Rect.Left + 2, Rect.Top,
    Column.Field.DisplayText);
  end;
end;

end.
