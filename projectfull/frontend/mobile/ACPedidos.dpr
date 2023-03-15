program ACPedidos;

uses
  System.StartUpCopy,
  FMX.Forms,
  acpedidos.routers in 'src\view\routers\acpedidos.routers.pas',
  page.cadastrarlogin in 'src\view\pages\page.cadastrarlogin.pas' {pageCadastrarLogin},
  page.home in 'src\view\pages\page.home.pas' {pagehome},
  page.index in 'src\view\pages\page.index.pas' {pageindex},
  page.login in 'src\view\pages\page.login.pas' {pageLogin},
  page.splash in 'src\view\pages\page.splash.pas' {PageSplash},
  page.Pedidos in 'src\view\pages\page.Pedidos.pas' {PagePedidos},
  acpedidos.providers.frame.pedidos in 'src\providers\frame\acpedidos.providers.frame.pedidos.pas' {framepedidos: TFrame},
  acpedidos.providers.session in 'src\providers\acpedidos.providers.session.pas',
  acpedidos.model.entidades in 'src\model\acpedidos.model.entidades.pas',
  acpedidos.services.login in 'src\services\acpedidos.services.login.pas',
  acpedidos.services.pedidos in 'src\services\acpedidos.services.pedidos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tpageindex, pageindex);
  Application.Run;
end.
