unit Views.Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit,
  FMXLabelEdit, FMX.Effects, FMX.Layouts, Services.Login, Views.Menu;

type
  TfrmLogin = class(TForm)
    retLogin: TRectangle;
    lytContentLogin: TLayout;
    edtUsuario: TLabelEdit;
    edtSenha: TLabelEdit;
    lytLogo: TLayout;
    txtBemVindo: TText;
    txtRecuperarSenha: TText;
    txtSolicitarAcesso: TText;
    imgLogo: TImage;
    retEntrar: TRectangle;
    txtEntrar: TText;
    procedure retEntrarClick(Sender: TObject);
  private
    procedure GoMenuPrincipal;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

procedure TfrmLogin.GoMenuPrincipal;
var
  LForm: TfrmMenu;
begin
  LForm := TfrmMenu.Create(Self);
  LForm.Show;
end;

procedure TfrmLogin.retEntrarClick(Sender: TObject);
var
  LService: TServiceLogin;
begin
  LService := TServiceLogin.Create(Self);
  try
    try
      LService.Login(edtUsuario.Text, edtSenha.Text);
      edtUsuario.SetValue(EmptyStr);
      edtSenha.SetValue(EmptyStr);
      GoMenuPrincipal;
    except
      on E:Exception do
        ShowMessage(E.Message);
    end;
  finally
    LService.Free;
  end;
end;

end.
