unit page.login;

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
  Router4D.Interfaces,
  page.home, acpedidos.services.login;

type
  TpageLogin = class(TForm, iRouter4DComponent)
    LayoutContainer: TLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    Label1: TLabel;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    SpeedButton1: TSpeedButton;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Label3: TLabel;
    ShadowEffect1: TShadowEffect;
    Rectangle3: TRectangle;
    edtSenha: TEdit;
    ShadowEffect2: TShadowEffect;
    Layout7: TLayout;
    Rectangle4: TRectangle;
    Layout8: TLayout;
    Rectanglebackground: TRectangle;
    Label2: TLabel;
    Rectangle2: TRectangle;
    edtNome: TEdit;
    procedure Label2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FServices: TServicesLogin;
  public
    function Render : TFMXObject;
    procedure UnRender;
  end;

var
  pageLogin: TpageLogin;

implementation


{$R *.fmx}

{ TpageLogin }

procedure TpageLogin.Label2Click(Sender: TObject);
begin
  TRouter4D.Link.&To('CadastroLogin');
end;

function TpageLogin.Render: TFMXObject;
begin
  Result := Layout8;
  FServices:= TServicesLogin.New;
end;

procedure TpageLogin.SpeedButton1Click(Sender: TObject);
begin
  if not FServices.login(edtNome.Text, edtSenha.Text) then
  begin
    ShowMessage('Usuário e senha inválidos');
    exit;
  end;
  TRouter4D.Link.&To('Home');
end;

procedure TpageLogin.UnRender;
begin

end;

end.
