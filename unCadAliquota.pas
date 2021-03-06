unit unCadAliquota;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormCadAliquota = class(TForm)
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
    dsADOQueryCadAliquota: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBCheckBox1: TDBCheckBox;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadAliquota: TFormCadAliquota;

implementation
   uses unDM;
{$R *.dfm}

procedure TFormCadAliquota.BitBtn1Click(Sender: TObject);
begin
 DM.ADOQueryCadAliquota.Cancel;
 DM.ADOQueryCadAliquota.CancelUpdates;
 Close;
end;

procedure TFormCadAliquota.btnAlteraClick(Sender: TObject);
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
 DM.ADOQueryCadAliquota.Edit;
 DBEdit2.SetFocus;
Except
end;
end;

procedure TFormCadAliquota.btnAnteriorClick(Sender: TObject);
begin
DM.ADOQueryCadAliquota.Prior;
btnProximo.Enabled := True;
btnUltimo.Enabled := True;
if DM.ADOQueryCadAliquota.Bof = True then
 begin
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
 end;
end;

procedure TFormCadAliquota.btnCancelaClick(Sender: TObject);
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
 DM.ADOQueryCadAliquota.Cancel;
 DM.ADOQueryCadAliquota.CancelUpdates;
Except
 end;
end;

procedure TFormCadAliquota.btnExcluiClick(Sender: TObject);
begin
 if DM.ADOQueryCadAliquota.RecordCount = 0 then
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
     DM.ADOQueryCadAliquota.Delete;
     DM.ADOQueryCadAliquota.UpdateStatus;
     DM.ADOQueryCadAliquota.Close;
     DM.ADOQueryCadAliquota.Open;
    end;
 end;
end;

procedure TFormCadAliquota.btnGravaClick(Sender: TObject);
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
 dblcNomeAlu.Enabled := True; *)
 DM.ADOQueryCadAliquota.Post;
 DM.ADOQueryCadAliquota.Refresh;
 DM.ADOQueryCadAliquota.Close;
 DM.ADOQueryCadAliquota.Open;
Except
 end;
end;

procedure TFormCadAliquota.btnNovoFuncClick(Sender: TObject);
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
 DM.ADOQueryCadAliquota.Close;
 DM.ADOQueryCadAliquota.Open;
 DM.ADOQueryCadAliquota.Append;
 DBEdit1.SetFocus;
Except
 end;
end;

procedure TFormCadAliquota.btnPrimeiroClick(Sender: TObject);
begin
 DM.ADOQueryCadAliquota.First;
 btnProximo.Enabled := True;
 btnUltimo.Enabled := True;
 btnPrimeiro.Enabled := False;
 btnAnterior.Enabled := False;
end;

procedure TFormCadAliquota.btnProximoClick(Sender: TObject);
begin
DM.ADOQueryCadAliquota.Next;
btnPrimeiro.Enabled := True;
btnAnterior.Enabled := True;
if DM.ADOQueryCadAliquota.Eof = True then
 begin
   btnProximo.Enabled := False;
   btnUltimo.Enabled := False;
 end;
end;

procedure TFormCadAliquota.btnUltimoClick(Sender: TObject);
begin
DM.ADOQueryCadAliquota.Last;
btnPrimeiro.Enabled := True;
btnAnterior.Enabled := True;
btnProximo.Enabled := False;
btnUltimo.Enabled := False;
end;

procedure TFormCadAliquota.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 DM.ADOQueryCadAliquota.Cancel;
 DM.ADOQueryCadAliquota.CancelUpdates;
 Close;
end;

end.
