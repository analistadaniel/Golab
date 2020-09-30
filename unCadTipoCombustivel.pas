unit unCadTipoCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFormCadTipoComb = class(TForm)
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
    dsCadTipoComb: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure btnNovoFuncClick(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadTipoComb: TFormCadTipoComb;

implementation
 uses UnDM;
{$R *.dfm}

procedure TFormCadTipoComb.BitBtn1Click(Sender: TObject);
begin
 DM.ADOQueryCadTipoComb.Cancel;
 DM.ADOQueryCadTipoComb.CancelUpdates;
Close;
end;

procedure TFormCadTipoComb.btnAlteraClick(Sender: TObject);
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
 dblcNomeAlu.Enabled := False;   *)
 DM.ADOQueryCadTipoComb.Edit;
 DBEdit2.SetFocus;
 Tag := 0;
Except
 end;

end;

procedure TFormCadTipoComb.btnAnteriorClick(Sender: TObject);
begin
DM.ADOQueryCadTipoComb.Prior;
btnProximo.Enabled := True;
btnUltimo.Enabled := True;
if DM.ADOQueryCadTipoComb.Bof = True then
 begin
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
 end;
end;

procedure TFormCadTipoComb.btnCancelaClick(Sender: TObject);
begin
Try
 btnPrimeiro.Enabled := True;
 btnAnterior.Enabled := True;
 btnProximo.Enabled := True;
 btnUltimo.Enabled := True;
 btnLocCod.Enabled := True;
 btnExclui.Enabled := True;
 btnNovoFunc.Enabled := True;
 btnAltera.Enabled := True;
 DM.ADOQueryCadTipoComb.Cancel;
 DM.ADOQueryCadTipoComb.CancelUpdates;
Except
 end;

end;

procedure TFormCadTipoComb.btnExcluiClick(Sender: TObject);
begin
 if DM.ADOQueryCadTipoComb.RecordCount = 0 then
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
  DM.ADOQueryCadTipoComb.Delete;
  DM.ADOQueryCadTipoComb.UpdateStatus;
  DM.ADOQueryCadTipoComb.Close;
  DM.ADOQueryCadTipoComb.Open;
 end;
end;

end;

procedure TFormCadTipoComb.btnGravaClick(Sender: TObject);
begin
Try
 if DBEdit2.Text = '' then
  begin
   Beep;
   ShowMessage('O Campo "Tipo Combust�vel" n�o pode ficar vazio!!');
   DBEdit2.SetFocus;
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
 DM.ADOQueryCadTipoComb.Post;
 (*DM.ADOQueryCadFunc.ApplyUpdates;     *)
 DM.ADOQueryCadTipoComb.Close;
 DM.ADOQueryCadTipoComb.Open;
Except
 end; // Begin

end;

procedure TFormCadTipoComb.btnNovoFuncClick(Sender: TObject);
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
 DM.ADOQueryCadTipoComb.Append;
 DBEdit1.SetFocus;
Except
 end; // Begin
end;

procedure TFormCadTipoComb.btnPrimeiroClick(Sender: TObject);
begin
 DM.ADOQueryCadTipoComb.First;
 btnProximo.Enabled := True;
 btnUltimo.Enabled := True;
 btnPrimeiro.Enabled := False;
 btnAnterior.Enabled := False;
end;

procedure TFormCadTipoComb.btnProximoClick(Sender: TObject);
begin
DM.ADOQueryCadTipoComb.Next;
btnPrimeiro.Enabled := True;
btnAnterior.Enabled := True;
if DM.ADOQueryCadTipoComb.Eof = True then
 begin
   btnProximo.Enabled := False;
   btnUltimo.Enabled := False;
 end;
end;

procedure TFormCadTipoComb.btnUltimoClick(Sender: TObject);
begin
DM.ADOQueryCadTipoComb.Last;
btnPrimeiro.Enabled := True;
btnAnterior.Enabled := True;
btnProximo.Enabled := False;
btnUltimo.Enabled := False;
end;

procedure TFormCadTipoComb.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
