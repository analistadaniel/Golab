program Golab;

uses
  Vcl.Forms,
  UnPrincipal in 'UnPrincipal.pas' {Form2},
  unDM in 'unDM.pas' {DM: TDataModule},
  unCadFunc in 'unCadFunc.pas' {FormCadFunc},
  unLogin in 'unLogin.pas' {FormLogin},
  unCadUser in 'unCadUser.pas' {FormCadUser},
  unCadTipoCombustivel in 'unCadTipoCombustivel.pas' {FormCadTipoComb},
  unCadPosto in 'unCadPosto.pas' {FormCadPosto},
  unCadFormaPgto in 'unCadFormaPgto.pas' {FormCadFormaPgto},
  unCadBomba in 'unCadBomba.pas' {FormCadBomba},
  unCadBico in 'unCadBico.pas' {FormCadBico},
  unCadAliquota in 'unCadAliquota.pas' {FormCadAliquota},
  unLancAbast in 'unLancAbast.pas' {FormLancAbast},
  unCadFPgto in 'unCadFPgto.pas' {FormCadFPgto},
  unBI in 'unBI.pas' {FormBI};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormCadFunc, FormCadFunc);
  Application.CreateForm(TFormCadUser, FormCadUser);
  Application.CreateForm(TFormCadTipoComb, FormCadTipoComb);
  Application.CreateForm(TFormCadPosto, FormCadPosto);
  Application.CreateForm(TFormCadFormaPgto, FormCadFormaPgto);
  Application.CreateForm(TFormCadBomba, FormCadBomba);
  Application.CreateForm(TFormCadBico, FormCadBico);
  Application.CreateForm(TFormCadAliquota, FormCadAliquota);
  Application.CreateForm(TFormLancAbast, FormLancAbast);
  Application.CreateForm(TFormCadFPgto, FormCadFPgto);
  Application.CreateForm(TFormBI, FormBI);
  Application.Run;
end.
