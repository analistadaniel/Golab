unit unCadPosto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFormCadPosto = class(TForm)
    Panel1: TPanel;
    btnGrava: TBitBtn;
    btnCancela: TBitBtn;
    btnAltera: TBitBtn;
    btnNovoFunc: TBitBtn;
    btnExclui: TBitBtn;
    BitBtn1: TBitBtn;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnUltimo: TBitBtn;
    btnLocCod: TBitBtn;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsADOQueryCadPosto: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    dsCadFunc: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
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
  FormCadPosto: TFormCadPosto;

implementation
      uses unDM;
{$R *.dfm}

procedure TFormCadPosto.BitBtn1Click(Sender: TObject);
begin
 DM.ADOQueryCadPosto.Cancel;
 DM.ADOQueryCadPosto.CancelUpdates;
Close;
end;

procedure TFormCadPosto.btnAlteraClick(Sender: TObject);
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
 DM.ADOQueryCadPosto.Edit;
 DBEdit1.SetFocus;
 Tag := 0;
Except
 end; // Begin
end;

procedure TFormCadPosto.btnAnteriorClick(Sender: TObject);
begin
DM.ADOQueryCadPosto.Prior;
btnProximo.Enabled := True;
btnUltimo.Enabled := True;
if DM.ADOQueryCadPosto.Bof = True then
 begin
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
 end; // Begin
end;

procedure TFormCadPosto.btnCancelaClick(Sender: TObject);
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
 DM.ADOQueryCadPosto.Cancel;
 DM.ADOQueryCadPosto.CancelUpdates;
Except
 end; // Begin
end;

procedure TFormCadPosto.btnExcluiClick(Sender: TObject);
begin
 if DM.ADOQueryCadPosto.RecordCount = 0 then
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
  DM.ADOQueryCadPosto.Delete;
  DM.ADOQueryCadPosto.UpdateStatus;
  DM.ADOQueryCadPosto.Close;
  DM.ADOQueryCadPosto.Open;
 end; // Begin
end;
end;

procedure TFormCadPosto.btnGravaClick(Sender: TObject);
begin
Try
 if DBEdit1.Text = '' then
  begin
   Beep;
   ShowMessage('O Campo "CNPJ" n�o pode ficar vazio!!');
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
 DM.ADOQueryCadPosto.Post;
 (*DM.ADOQueryCadFunc.ApplyUpdates;     *)
 DM.ADOQueryCadPosto.Close;
 DM.ADOQueryCadPosto.Open;
Except
 end; // Begin

end;

procedure TFormCadPosto.btnNovoFuncClick(Sender: TObject);
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
 DM.ADOQueryCadPosto.Append;
 DBEdit1.SetFocus;
Except
 end; // Begin
end;

procedure TFormCadPosto.btnPrimeiroClick(Sender: TObject);
begin
 DM.ADOQueryCadPosto.First;
 btnProximo.Enabled := True;
 btnUltimo.Enabled := True;
 btnPrimeiro.Enabled := False;
 btnAnterior.Enabled := False;
end;

procedure TFormCadPosto.btnProximoClick(Sender: TObject);
begin
DM.ADOQueryCadPosto.Next;
btnPrimeiro.Enabled := True;
btnAnterior.Enabled := True;
if DM.ADOQueryCadPosto.Eof = True then
 begin
   btnProximo.Enabled := False;
   btnUltimo.Enabled := False;
 end; // Begin
end;

procedure TFormCadPosto.btnUltimoClick(Sender: TObject);
begin
DM.ADOQueryCadPosto.Last;
btnPrimeiro.Enabled := True;
btnAnterior.Enabled := True;
btnProximo.Enabled := False;
btnUltimo.Enabled := False;
end;

procedure TFormCadPosto.DBGrid1DrawColumnCell(Sender: TObject;
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