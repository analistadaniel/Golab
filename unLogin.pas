unit unLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, Mask, ADODB,
  Vcl.Imaging.jpeg;

type
  TFormLogin = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    edtUser1: TEdit;
    Label2: TLabel;
    StatusBar1: TStatusBar;
    Bevel1: TBevel;
    Label3: TLabel;
    Image1: TImage;
    Bevel2: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    edtPass: TMaskEdit;
    edtUser: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtUser1Enter(Sender: TObject);
    procedure edtUser1Exit(Sender: TObject);
    procedure edtPassEnter(Sender: TObject);
    procedure edtPassExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;
  ContaErro: Integer;
  usuario: string;
implementation
uses unDM, UnPrincipal, UnCadUser;
{$R *.dfm}



procedure TFormLogin.FormCreate(Sender: TObject);
begin
  contaErro := 0;
end;

procedure TFormLogin.FormShow(Sender: TObject);
begin
edtUser.Text := '837.030.983-68';
edtPass.Text := '12345' ;
end;

procedure TFormLogin.BitBtn1Click(Sender: TObject);
var
  login, senha : string;
begin
  usuario := edtUser.text;
//  login := 'abc';
 // senha := '111';

  if(contaErro<4) then
  begin
   if  (((DM.ADOQueryCadUser.Locate('UserMatricula',edtUser.Text,[loCaseInsensitive, loPartialKey]))
   and (DM.ADOQueryCadUser.Locate('senha',edtPass.Text,[loCaseInsensitive, loPartialKey]))
   (*and (DataModule1.ADOQueryCadUserativo.AsString = 'Mestre')*)) ) then
   //(edtPass.text=DataModule1.ADOQueryUser.FieldByName('senha').AsString) and (edtUser.text=DataModule1.ADOQueryUser.FieldByName('Usuario').AsString) then
    begin
    //  showmessage('Ok.. vc entrou!');
      Form2.Visible := true;
      FormLogin.hide;
    end
    else begin
      Inc(contaErro);
      ShowMessage('Senha ou login invalidos');
    end;
  end
  else
  begin
    ShowMessage('Voc� n�o pode entrar');
    close;
  end;
end;

procedure TFormLogin.edtUser1Enter(Sender: TObject);
begin
edtUser.Color := clInfoBk;
end;

procedure TFormLogin.edtUser1Exit(Sender: TObject);
begin
edtUser.Color := clHighlightText;
end;

procedure TFormLogin.edtPassEnter(Sender: TObject);
begin
edtPass.Color := clInfoBk;
end;

procedure TFormLogin.edtPassExit(Sender: TObject);
begin
edtPass.Color := clHighlightText;
end;

procedure TFormLogin.BitBtn2Click(Sender: TObject);
begin
Application.Terminate;
end;

end.