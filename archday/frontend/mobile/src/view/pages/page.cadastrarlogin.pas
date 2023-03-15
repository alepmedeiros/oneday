unit page.cadastrarlogin;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Edit,
  FMX.Effects,
  Router4D,
  Router4D.Interfaces, acpedidos.services.login, acpedidos.model.entity;

type
  TpageCadastrarLogin = class(TForm, iRouter4DComponent)
    LayoutContainer: TLayout;
    Layout1: TLayout;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    SpeedButton1: TSpeedButton;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Label3: TLabel;
    Rectangle2: TRectangle;
    ShadowEffect1: TShadowEffect;
    edtNome: TEdit;
    Rectangle3: TRectangle;
    edtEmail: TEdit;
    ShadowEffect2: TShadowEffect;
    Layout7: TLayout;
    Rectangle4: TRectangle;
    Layout8: TLayout;
    Rectangle5: TRectangle;
    edtSenha: TEdit;
    ShadowEffect3: TShadowEffect;
    ShadowEffect4: TShadowEffect;
    RectangleBackground: TRectangle;
    procedure SpeedButton1Click(Sender: TObject);
  private
    FServices: TServicesLogin;
  public
    function Render : TFMXObject;
    procedure UnRender;
  end;

var
  pageCadastrarLogin: TpageCadastrarLogin;

implementation

{$R *.fmx}

{ TpageCadastrarLogin }

function TpageCadastrarLogin.Render: TFMXObject;
begin
  Result := LayoutContainer;
  FServices:= TServicesLogin.New;
end;

procedure TpageCadastrarLogin.SpeedButton1Click(Sender: TObject);
var
  lUsuario: TUsuario;
begin
  lUsuario:= TUsuario.New;
  lUsuario.Nome := edtNome.Text;
  lUsuario.Email := edtEmail.Text;
  lUsuario.Senha := edtSenha.Text;

//  FServices.Gravar(lUsuario);
  TRouter4D.Link.&To('Login');
end;

procedure TpageCadastrarLogin.UnRender;
begin

end;

end.
