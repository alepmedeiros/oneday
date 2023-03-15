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
  Router4D.Interfaces;

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
end;

procedure TpageCadastrarLogin.SpeedButton1Click(Sender: TObject);
begin
  TRouter4D.Link.&To('Login');
end;

procedure TpageCadastrarLogin.UnRender;
begin

end;

end.
