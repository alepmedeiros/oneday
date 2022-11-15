program cadastros.api;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  horse.cors,
  Horse.jhonson,
  System.SysUtils,
  cadastrosapi.backend.resource.connect in 'src\resource\cadastrosapi.backend.resource.connect.pas',
  cadastrosapi.backend.services in 'src\service\cadastrosapi.backend.services.pas',
  cadastrosapi.backend.model.entity.produto in 'src\model\entity\cadastrosapi.backend.model.entity.produto.pas',
  cadastrosapi.backend.model.entity.categoria in 'src\model\entity\cadastrosapi.backend.model.entity.categoria.pas',
  cadastrosapi.backend.dto.produto in 'src\dto\cadastrosapi.backend.dto.produto.pas',
  cadastrosapi.backend.dto.categoria in 'src\dto\cadastrosapi.backend.dto.categoria.pas',
  cadastrosapi.backend.controller.produto in 'src\controller\cadastrosapi.backend.controller.produto.pas',
  cadastrosapi.backend.utils in 'src\utils\cadastrosapi.backend.utils.pas',
  cadastrosapi.backend.dto.clientes in 'src\dto\cadastrosapi.backend.dto.clientes.pas',
  cadastrosapi.backend.dto.enumerados in 'src\dto\cadastrosapi.backend.dto.enumerados.pas',
  cadastrosapi.backend.dto.endereco in 'src\dto\cadastrosapi.backend.dto.endereco.pas',
  cadastrosapi.backend.model.entity.pessoas in 'src\model\entity\cadastrosapi.backend.model.entity.pessoas.pas',
  cadastrosapi.backend.model.entity.endereco in 'src\model\entity\cadastrosapi.backend.model.entity.endereco.pas',
  cadastrosapi.backend.model.entity.usuarios in 'src\model\entity\cadastrosapi.backend.model.entity.usuarios.pas',
  cadastrosapi.backend.model.entity.clientes in 'src\model\entity\cadastrosapi.backend.model.entity.clientes.pas',
  cadastrosapi.backend.controller.categoria in 'src\controller\cadastrosapi.backend.controller.categoria.pas',
  cadastrosapi.backend.controller.clientes in 'src\controller\cadastrosapi.backend.controller.clientes.pas',
  cadastrosapi.backend.dto.usuario in 'src\dto\cadastrosapi.backend.dto.usuario.pas',
  cadastrosapi.backend.controller.usuarios in 'src\controller\cadastrosapi.backend.controller.usuarios.pas',
  Commons.Middleware.Authentication in '..\commons\Commons.Middleware.Authentication.pas';

procedure Registery(App: THorse);
begin
  cadastrosapi.backend.controller.produto.Registery(App);
  cadastrosapi.backend.controller.categoria.Registery(App);
  cadastrosapi.backend.controller.clientes.Registery(App);
  cadastrosapi.backend.controller.usuarios.Registery(App);
end;

procedure IniciaHorse;
var
  lApp: THorse;
  lPort: Integer;
begin
  {$IFDEF MSWINDOWS}
  lPort := 9001;
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
    System.Writeln(Format('Servidor de cadastros rodando, porta %d',[Horse.Port]));
    System.Readln;
  end);
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  IniciaHorse;
end.
