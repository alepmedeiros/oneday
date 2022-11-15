program Servers.Financeiro;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  System.SysUtils,
  Services.Produtos in 'src\services\Services.Produtos.pas' {ServicesProdutos: TDataModule},
  Controllers.Produtos in 'src\controllers\Controllers.Produtos.pas';

var
  App: THorse;
begin
  App := THorse.Create;
  App.Use(Jhonson);

  Controllers.Auth.Registry(App);

  App.Listen(9003);
end.
