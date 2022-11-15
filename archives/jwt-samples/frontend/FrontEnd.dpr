program FrontEnd;

uses
  System.StartUpCopy,
  FMX.Forms,
  Views.Login in 'src\views\Views.Login.pas' {frmLogin},
  Views.Menu in 'src\views\Views.Menu.pas' {frmMenu},
  Services.Login in 'src\services\Services.Login.pas' {ServiceLogin: TDataModule},
  Providers.Session in 'src\providers\Providers.Session.pas',
  Views.Clientes in 'src\views\Views.Clientes.pas' {frmClientes},
  Providers.Frames.Clientes in 'src\providers\frames\Providers.Frames.Clientes.pas' {FrameClientes: TFrame},
  Services.Clientes in 'src\services\Services.Clientes.pas' {ServiceClientes: TDataModule},
  Views.Produtos in 'src\views\Views.Produtos.pas' {frmProdutos},
  Services.Produtos in 'src\services\Services.Produtos.pas' {ServiceProdutos: TDataModule},
  Providers.Frames.Produtos in 'src\providers\frames\Providers.Frames.Produtos.pas' {FrameProdutos: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
