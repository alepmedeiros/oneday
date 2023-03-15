unit acpedidos.routers;

interface

uses
  Router4D,
  page.cadastrarlogin,
  page.home,
  page.login,
  page.splash, page.Pedidos;

type
  TRouters = class
  private
  public
    constructor Create;
    destructor Destroy; override;
  end;

var
  Routers: TRouters;

implementation

{ TRouters }

constructor TRouters.Create;
begin
  TRouter4D.Switch.Router('Splash', TPageSplash);
  TRouter4D.Switch.Router('Login', TpageLogin);
  TRouter4D.Switch.Router('CadastroLogin', TpageCadastrarLogin);
  TRouter4D.Switch.Router('Home', Tpagehome);
  TRouter4D.Switch.Router('Pedidos',TPagePedidos);
end;

destructor TRouters.Destroy;
begin

  inherited;
end;

initialization
  Routers:= TRouters.Create;

finalization
  Routers.Free;

end.
