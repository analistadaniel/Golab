unit unCadFormaPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormCadFormaPgto = class(TForm)
    Panel1: TPanel;
    btnNovoFunc: TBitBtn;
    btnGrava: TBitBtn;
    btnAltera: TBitBtn;
    btnCancela: TBitBtn;
    btnExclui: TBitBtn;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnUltimo: TBitBtn;
    btnLocCod: TBitBtn;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsCadFormaPgto: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadFormaPgto: TFormCadFormaPgto;

implementation
    uses  unDM;
{$R *.dfm}

procedure TFormCadFormaPgto.BitBtn1Click(Sender: TObject);
begin
 DM.ADOQueryCadFPgto.Cancel;
 DM.ADOQueryCadFPgto.CancelUpdates;
 Close;
end;

procedure TFormCadFormaPgto.btnAlteraClick(Sender: TObject);
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


procedure TFormCadFormaPgto.btnAnteriorClick(Sender: TObject);
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

procedure TFormCadFormaPgto.btnCancelaClick(Sender: TObject);
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

procedure TFormCadFormaPgto.btnExcluiClick(Sender: TObject);
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

procedure TFormCadFormaPgto.btnGravaClick(Sender: TObject);
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

procedure TFormCadFormaPgto.btnNovoFuncClick(Sender: TObject);
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
 DBEdit1.SetFocus;
Except
 end;
end;

procedure TFormCadFormaPgto.btnPrimeiroClick(Sender: TObject);
begin
 DM.ADOQueryCadFPgto.First;
 btnProximo.Enabled := True;
 btnUltimo.Enabled := True;
 btnPrimeiro.Enabled := False;
 btnAnterior.Enabled := False;
end;

procedure TFormCadFormaPgto.btnProximoClick(Sender: TObject);
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

procedure TFormCadFormaPgto.btnUltimoClick(Sender: TObject);
begin
DM.ADOQueryCadFPgto.Last;
btnPrimeiro.Enabled := True;
btnAnterior.Enabled := True;
btnProximo.Enabled := False;
btnUltimo.Enabled := False;
end;

procedure TFormCadFormaPgto.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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
