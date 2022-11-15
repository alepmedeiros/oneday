program Servers.Cadastros;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  System.SysUtils,
  Horse.HandleException,
  Services.Clientes in 'src\services\Services.Clientes.pas' {ServicesClientes: TDataModule},
  Controllers.Clientes in 'src\controllers\Controllers.Clientes.pas',
  Commons.Middleware.Auth in '..\commons\Commons.Middleware.Auth.pas';

var
  App: THorse;
begin
  App := THorse.Create;
  App.Use(Jhonson);
  App.Use(HandleException);
  App.Use(AuthHandler);

  Controllers.Clientes.Registry(App);

  App.Listen(9001);
end.
