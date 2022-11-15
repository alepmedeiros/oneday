program autenticacaoapi;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  horse.cors,
  Horse.jhonson,
  System.SysUtils,
  autenticacaoapi.backend.controller in 'src\controller\autenticacaoapi.backend.controller.pas',
  autenticacaoapi.backend.dto.usuario in 'src\dto\autenticacaoapi.backend.dto.usuario.pas',
  autenticacaoapi.backend.model.usuario in 'src\model\autenticacaoapi.backend.model.usuario.pas',
  autenticacaoapi.backend.model.userrepository in 'src\model\repository\autenticacaoapi.backend.model.userrepository.pas',
  autenticacaoapi.backend.resource.connect in 'src\resource\autenticacaoapi.backend.resource.connect.pas',
  autenticacaoapi.backend.services in 'src\service\autenticacaoapi.backend.services.pas',
  autenticacaoapi.backend.model.convert in 'src\model\autenticacaoapi.backend.model.convert.pas',
  autenticacaoapi.backend.resource.Autorizacao in 'src\resource\autenticacaoapi.backend.resource.Autorizacao.pas',
  autenticacaoapi.backend.resource.cachekeys in 'src\resource\autenticacaoapi.backend.resource.cachekeys.pas',
  autenticacaoapi.backend.utils in 'src\utils\autenticacaoapi.backend.utils.pas';

procedure IniciaHorse;
var
  lApp: THorse;
  lPort: Integer;
begin
  {$IFDEF MSWINDOWS}
  lPort := 9000;
  {$ELSE}
  lPort := StrToInt(GetEnvironmentVariable('PORT'));
  {$ENDIF}

  lApp := THorse.Create;
  lApp
    .use(cors)
    .use(jhonson);

  autenticacaoapi.backend.controller.Registery(lApp);

  lApp.Listen(lPort,
  procedure (Horse:THorse)
  begin
    System.Writeln(Format('Servidor de autenticacao rodando, porta %d',[Horse.Port]));
    System.Readln;
  end);
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  IniciaHorse;
end.
