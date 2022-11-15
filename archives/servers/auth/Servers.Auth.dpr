program Servers.Auth;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  System.SysUtils,
  Services.Auth in 'src\services\Services.Auth.pas' {ServicesAuth: TDataModule},
  Controllers.Auth in 'src\controllers\Controllers.Auth.pas';

var
  App: THorse;
begin
  App := THorse.Create;
  App.Use(Jhonson);

  Controllers.Auth.Registry(App);

  App.Listen(9003);
end.
