unit unCadFunc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormCadFunc = class(TForm)
    dsADOQCadFunc: TDataSource;
    DBGrid1: TDBGrid;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnUltimo: TBitBtn;
    btnLocCod: TBitBtn;
    Panel1: TPanel;
    btnGrava: TBitBtn;
    btnCancela: TBitBtn;
    btnAltera: TBitBtn;
    btnNovoFunc: TBitBtn;
    btnExclui: TBitBtn;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    procedure btnGravaClick(Sender: TObject);
    procedure btnNovoFuncClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadFunc: TFormCadFunc;

implementation
    uses unDM;
{$R *.dfm}

procedure TFormCadFunc.BitBtn1Click(Sender: TObject);
begin
 DM.ADOQueryCadFunc.Cancel;
 DM.ADOQueryCadFunc.CancelUpdates;
Close;
end;

procedure TFormCadFunc.btnAlteraClick(Sender: TObject);
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
 DM.ADOQueryCadFunc.Edit;
 DBEdit1.SetFocus;
 Tag := 0;
Except
 end; // Begin
end; // TRY

procedure TFormCadFunc.btnAnteriorClick(Sender: TObject);
begin
DM.ADOQueryCadFunc.Prior;
btnProximo.Enabled := True;
btnUltimo.Enabled := True;
if DM.ADOQueryCadFunc.Bof = True then
 begin
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
 end; // Begin
end;

procedure TFormCadFunc.btnCancelaClick(Sender: TObject);
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
 (*panel1.Visible := False;
 dblcNomeAlu.Enabled := True;
 dblcMod1.Enabled := False;
 dblcMod2.Enabled := False;
 dblcMod3.Enabled := False;
 dblcMod4.Enabled := False;
 dblcMod5.Enabled := False;
 dblcMod6.Enabled := False;   *)
 DM.ADOQueryCadFunc.Cancel;
 DM.ADOQueryCadFunc.CancelUpdates;
Except
 end; // Begin
end;

procedure TFormCadFunc.btnExcluiClick(Sender: TObject);
begin
 if DM.ADOQueryCadFunc.RecordCount = 0 then
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
  DM.ADOQueryCadFunc.Delete;
  DM.ADOQueryCadFunc.UpdateStatus;
  DM.ADOQueryCadFunc.Close;
  DM.ADOQueryCadFunc.Open;
 end; // Begin
 end;
end;

procedure TFormCadFunc.btnGravaClick(Sender: TObject);
begin
Try
 if DBEdit2.Text = '' then
  begin
   Beep;
   ShowMessage('O Campo "Nome" n�o pode ficar vazio!!');
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
 DM.ADOQueryCadFunc.Post;
 (*DM.ADOQueryCadFunc.ApplyUpdates;     *)
 DM.ADOQueryCadFunc.Close;
 DM.ADOQueryCadFunc.Open;
if tag = 1 then
 if MessageBox( Handle,
               'Deseja imprimir a ficha do Funcion�rio?',
               'Impressos',
               MB_YESNO +
               MB_ICONQUESTION +
               MB_DEFBUTTON2 ) = IDYES Then
 begin
 (*frmRelCadAlu := TfrmRelCadAlu.Create(self);
 frmRelCadAlu.QuickRep1.Preview; *)
 end;
Except
 end; // Begin
end; // TRY

procedure TFormCadFunc.btnNovoFuncClick(Sender: TObject);
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
 DM.ADOQueryCadFunc.Append;
 DBEdit1.SetFocus;
Except
 end; // Begin
end;

procedure TFormCadFunc.btnPrimeiroClick(Sender: TObject);
begin
 DM.ADOQueryCadFunc.First;
 btnProximo.Enabled := True;
 btnUltimo.Enabled := True;
 btnPrimeiro.Enabled := False;
 btnAnterior.Enabled := False;
end;

procedure TFormCadFunc.btnProximoClick(Sender: TObject);
begin
DM.ADOQueryCadFunc.Next;
btnPrimeiro.Enabled := True;
btnAnterior.Enabled := True;
if DM.ADOQueryCadFunc.Eof = True then
 begin
   btnProximo.Enabled := False;
   btnUltimo.Enabled := False;
 end; // Begin
end;


procedure TFormCadFunc.btnUltimoClick(Sender: TObject);

begin
DM.ADOQueryCadFunc.Last;
btnPrimeiro.Enabled := True;
btnAnterior.Enabled := True;
btnProximo.Enabled := False;
btnUltimo.Enabled := False;
end;

procedure TFormCadFunc.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TFormCadFunc.FormShow(Sender: TObject);
begin
btnNovoFunc.SetFocus;
end;

end.
