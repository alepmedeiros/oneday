program pedidos.api;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  horse.cors,
  Horse.jhonson,
  System.SysUtils,
  pedidosapi.model.entity.pedidos in 'src\model\entity\pedidosapi.model.entity.pedidos.pas',
  pedidosapi.model.entity.pedidoitens in 'src\model\entity\pedidosapi.model.entity.pedidoitens.pas',
  pedidosapi.model.dto.pedidos in 'src\dto\pedidosapi.model.dto.pedidos.pas',
  cadastrosapi.backend.dto.clientes in '..\cadastro-api\src\dto\cadastrosapi.backend.dto.clientes.pas',
  cadastrosapi.backend.dto.endereco in '..\cadastro-api\src\dto\cadastrosapi.backend.dto.endereco.pas',
  cadastrosapi.backend.dto.produto in '..\cadastro-api\src\dto\cadastrosapi.backend.dto.produto.pas',
  cadastrosapi.backend.dto.enumerados in '..\cadastro-api\src\dto\cadastrosapi.backend.dto.enumerados.pas',
  pedidosapi.model.dto.pedidoitens in 'src\dto\pedidosapi.model.dto.pedidoitens.pas',
  cadastrosapi.backend.dto.categoria in '..\cadastro-api\src\dto\cadastrosapi.backend.dto.categoria.pas',
  pedidosapi.backend.services.persistences in 'src\service\pedidosapi.backend.services.persistences.pas',
  pedidosapi.backend.resource.connect in 'src\resource\pedidosapi.backend.resource.connect.pas',
  pedidosapi.recursosAdicionais in 'src\utils\pedidosapi.recursosAdicionais.pas',
  pedidosapi.controller.pedidos in 'src\controller\pedidosapi.controller.pedidos.pas',
  pedidosapi.bachend.auth.httpclient in 'src\auth\pedidosapi.bachend.auth.httpclient.pas',
  pedidosapi.bachend.auth.interfaces in 'src\auth\pedidosapi.bachend.auth.interfaces.pas',
  pedidosapi.backend.services.interfaces in 'src\service\pedidosapi.backend.services.interfaces.pas',
  Commons.Middleware.Authentication in '..\commons\Commons.Middleware.Authentication.pas',
  cadastrosapi.backend.utils in '..\cadastro-api\src\utils\cadastrosapi.backend.utils.pas',
  cadastrosapi.backend.model.entity.categoria in '..\cadastro-api\src\model\entity\cadastrosapi.backend.model.entity.categoria.pas',
  cadastrosapi.backend.model.entity.clientes in '..\cadastro-api\src\model\entity\cadastrosapi.backend.model.entity.clientes.pas',
  cadastrosapi.backend.model.entity.endereco in '..\cadastro-api\src\model\entity\cadastrosapi.backend.model.entity.endereco.pas',
  cadastrosapi.backend.model.entity.pessoas in '..\cadastro-api\src\model\entity\cadastrosapi.backend.model.entity.pessoas.pas',
  cadastrosapi.backend.model.entity.produto in '..\cadastro-api\src\model\entity\cadastrosapi.backend.model.entity.produto.pas',
  cadastrosapi.backend.model.entity.usuarios in '..\cadastro-api\src\model\entity\cadastrosapi.backend.model.entity.usuarios.pas',
  cadastrosapi.backend.dto.usuario in '..\cadastro-api\src\dto\cadastrosapi.backend.dto.usuario.pas';

procedure Registery(App: THorse);
begin
  pedidosapi.controller.pedidos.Registery(App);
end;

procedure IniciaHorse;
var
  lApp: THorse;
  lPort: Integer;
begin
  {$IFDEF MSWINDOWS}
  lPort := 9002;
  {$ELSE}
  lPort := StrToInt(GetEnvironmentVariable('PORT'));
  {$ENDIF}

  lApp := THorse.Create;
  lApp
    .use(cors)
    .use(jhonson)
    .use(AuthHandler);

  Registery(lApp);

  lApp.Listen(lPort,
  procedure (Horse:THorse)
  begin
    System.Writeln(Format('Servidor de pedidos rodando, porta %d',[Horse.Port]));
    System.Readln;
  end);
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  IniciaHorse;
end.
