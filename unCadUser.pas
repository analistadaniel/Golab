unit unCadUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Data.Win.ADODB;

type
  TFormCadUser = class(TForm)
    dsCadUser: TDataSource;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnUltimo: TBitBtn;
    btnLocCod: TBitBtn;
    DBGrid1: TDBGrid;
    dsCadFunc: TDataSource;
    Panel1: TPanel;
    btnNovoFunc: TBitBtn;
    btnGrava: TBitBtn;
    btnAltera: TBitBtn;
    btnCancela: TBitBtn;
    btnExclui: TBitBtn;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    ADOQueryFuncUser: TADOQuery;
    dsADOQueryFuncUser: TDataSource;
    ADOQueryFuncUserMATRICULA: TStringField;
    ADOQueryFuncUserNOMEFUNC: TStringField;
    ADOQueryFuncUserFUNCAO: TStringField;
    ADOQueryFuncUserATIVO: TStringField;
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
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadUser: TFormCadUser;

implementation
     uses UnDM;
{$R *.dfm}

procedure TFormCadUser.BitBtn1Click(Sender: TObject);
begin
 DM.ADOQueryCadUser.Cancel;
 DM.ADOQueryCadUser.CancelUpdates;
 Close;
end;

procedure TFormCadUser.btnAlteraClick(Sender: TObject);
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
 DM.ADOQueryCadUser.Edit;
 DBLookupComboBox1.SetFocus;
 ADOQueryFuncUser.Refresh;
Except
 end;
end; procedure TFormCadUser.btnAnteriorClick(Sender: TObject);
begin
DM.ADOQueryCadUser.Prior;
btnProximo.Enabled := True;
btnUltimo.Enabled := True;
if DM.ADOQueryCadUser.Bof = True then
 begin
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
 end;
end;

procedure TFormCadUser.btnCancelaClick(Sender: TObject);
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
 DM.ADOQueryCadUser.Cancel;
 DM.ADOQueryCadUser.CancelUpdates;
 ADOQueryFuncUser.Refresh;
Except
 end;
end;

procedure TFormCadUser.btnExcluiClick(Sender: TObject);
begin
 if DM.ADOQueryCadUser.RecordCount = 0 then
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
  DM.ADOQueryCadUser.Delete;
  DM.ADOQueryCadUser.UpdateStatus;
  DM.ADOQueryCadUser.Close;
  DM.ADOQueryCadUser.Open;
 end;
end;
end;

procedure TFormCadUser.btnGravaClick(Sender: TObject);
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
 DM.ADOQueryCadUser.Post;
 DM.ADOQueryCadUser.Refresh;
 DM.ADOQueryCadUser.Close;
 DM.ADOQueryCadUser.Open;
 ADOQueryFuncUser.Refresh;
Except
 end;
end;

procedure TFormCadUser.btnNovoFuncClick(Sender: TObject);
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
 DM.ADOQueryCadUser.Close;
 DM.ADOQueryCadUser.Open;
 DM.ADOQueryCadUser.Append;
 DBLookupComboBox1.SetFocus;
Except
 end;
end;

procedure TFormCadUser.btnPrimeiroClick(Sender: TObject);
begin
 DM.ADOQueryCadUser.First;
 btnProximo.Enabled := True;
 btnUltimo.Enabled := True;
 btnPrimeiro.Enabled := False;
 btnAnterior.Enabled := False;
end;

procedure TFormCadUser.btnProximoClick(Sender: TObject);
begin
DM.ADOQueryCadUser.Next;
btnPrimeiro.Enabled := True;
btnAnterior.Enabled := True;
if DM.ADOQueryCadUser.Eof = True then
 begin
   btnProximo.Enabled := False;
   btnUltimo.Enabled := False;
 end;
end;

procedure TFormCadUser.btnUltimoClick(Sender: TObject);
begin
DM.ADOQueryCadUser.Last;
btnPrimeiro.Enabled := True;
btnAnterior.Enabled := True;
btnProximo.Enabled := False;
btnUltimo.Enabled := False;
end;

procedure TFormCadUser.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TFormCadUser.DBLookupComboBox1Click(Sender: TObject);
begin
DBEdit4.Text := DM.ADOQueryCadFuncFUNCAO.Value;
end;

procedure TFormCadUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 DM.ADOQueryCadUser.Cancel;
 DM.ADOQueryCadUser.CancelUpdates;
 Close;
end;

procedure TFormCadUser.FormCreate(Sender: TObject);
begin
ADOQueryFuncUser.Active := true;
end;

end.
