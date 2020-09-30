unit unCadFPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormCadFPgto = class(TForm)
    Panel1: TPanel;
    btnNovoFunc: TBitBtn;
    btnGrava: TBitBtn;
    btnAltera: TBitBtn;
    btnCancela: TBitBtn;
    btnExclui: TBitBtn;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnUltimo: TBitBtn;
    btnLocCod: TBitBtn;
    DBGrid1: TDBGrid;
    dsCadFPgto: TDataSource;
    procedure btnNovoFuncClick(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadFPgto: TFormCadFPgto;

implementation
     uses  unDM;
{$R *.dfm}

procedure TFormCadFPgto.BitBtn1Click(Sender: TObject);
begin
 DM.ADOQueryCadFPgto.Cancel;
 DM.ADOQueryCadFPgto.CancelUpdates;
 Close;

end;

procedure TFormCadFPgto.btnAlteraClick(Sender: TObject);
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
 DM.ADOQueryCadFPgto.Edit;
 DBEdit2.SetFocus;
Except
 end; // Begin

end;

procedure TFormCadFPgto.btnAnteriorClick(Sender: TObject);
begin
DM.ADOQueryCadFPgto.Prior;
btnProximo.Enabled := True;
btnUltimo.Enabled := True;
if DM.ADOQueryCadFPgto.Bof = True then
 begin
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
 end; // Begin
end;

procedure TFormCadFPgto.btnCancelaClick(Sender: TObject);
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
 DM.ADOQueryCadFPgto.Cancel;
 DM.ADOQueryCadFPgto.CancelUpdates;
Except
 end;

end;

procedure TFormCadFPgto.btnExcluiClick(Sender: TObject);
begin
 if DM.ADOQueryCadFPgto.RecordCount = 0 then
  begin
   showmessage('não existe registro a ser excluído!');
  end
else
 begin
  if MessageBox( Handle,
              'Confirma a exclusão?',
              'Cuidado!!!',
              MB_YESNO +
              MB_ICONQUESTION+
              MB_DEFBUTTON2) = IDYES then
 Begin
  DM.ADOQueryCadFPgto.Delete;
  DM.ADOQueryCadFPgto.UpdateStatus;
  DM.ADOQueryCadFPgto.Close;
  DM.ADOQueryCadFPgto.Open;
 end; // Begin
end;

end;

procedure TFormCadFPgto.btnGravaClick(Sender: TObject);
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
 DM.ADOQueryCadFPgto.Post;
 DM.ADOQueryCadFPgto.Refresh;
 DM.ADOQueryCadFPgto.Close;
 DM.ADOQueryCadFPgto.Open;
Except
 end;

end;

procedure TFormCadFPgto.btnNovoFuncClick(Sender: TObject);
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
 DM.ADOQueryCadFPgto.Close;
 DM.ADOQueryCadFPgto.Open;
 DM.ADOQueryCadFPgto.Append;
 DBEdit2.SetFocus;
Except
 end;

end;

procedure TFormCadFPgto.btnPrimeiroClick(Sender: TObject);
begin
 DM.ADOQueryCadFPgto.First;
 btnProximo.Enabled := True;
 btnUltimo.Enabled := True;
 btnPrimeiro.Enabled := False;
 btnAnterior.Enabled := False;
end;

procedure TFormCadFPgto.btnProximoClick(Sender: TObject);
begin
DM.ADOQueryCadFPgto.Next;
btnPrimeiro.Enabled := True;
btnAnterior.Enabled := True;
if DM.ADOQueryCadFPgto.Eof = True then
 begin
   btnProximo.Enabled := False;
   btnUltimo.Enabled := False;
 end;
end;

procedure TFormCadFPgto.btnUltimoClick(Sender: TObject);
begin
DM.ADOQueryCadFPgto.Last;
btnPrimeiro.Enabled := True;
btnAnterior.Enabled := True;
btnProximo.Enabled := False;
btnUltimo.Enabled := False;
end;

procedure TFormCadFPgto.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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
